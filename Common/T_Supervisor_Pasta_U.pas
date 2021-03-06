Unit T_Supervisor_Pasta_U ;

Interface

Uses Misc_Def_U, Misc_Const_U, Misc_Type_U,
     IniFiles, ShellAPI, FolderMon,
     Winapi.Windows, Winapi.Messages,
     AdPort, OoMisc,
     System.SysUtils, System.Variants, System.Classes, System.Win.ScktComp,
     System.UITypes,
     Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls,
     Vcl.Menus, Vcl.AppEvnts, Vcl.StdCtrls ;
Type
   TFolderChangeEvent = Procedure ( _Tag : LongInt ; Dir, Arquivo : String ;
                                    Evento : TFolderAction ) Of Object ;
   TSupervisor_Pasta = class(Vcl.ExtCtrls.TPanel)
   Public
     ID ,
     Tag1 ,
     Tag2 ,
     Tag3 : LongInt ;
     TagS1 ,
     TagS2 ,
     TagS3 : String ;
     TagB1 ,
     TagB2 ,
     TagB3 : Boolean ;
     TagF1 ,
     TagF2 ,
     TagF3 : Real ;
     Tag_Supervisor : LongInt ;
     Associada                  : Boolean ;
     Pasta_Monitorada           : String ;
     FFolderMon                 : TFolderMon ;
     Procedure ATIVAR_MONITORAMENTO_DE_DIRETORIO ( Dir : String ;
               Funcao : TFolderChangeEvent ; LB : TListBox ; SubPastas : Boolean ) ;
     Procedure SETAR_MONITORAMENTO_PASTA ( LB : TListBox ; PN : TPanel ; CK : TCheckBox ) ;
     Constructor Create ( Dono : TComponent ; _Tag : LongInt ) ;
     Function GET_EVENT_NAME_MON ( Acao : TFolderAction ) : String ;

   Private
     FOnFOlderChange_Mon        : TFolderChangeEvent ;
     LB_DirMon                  : TListBox ;
     PN_Monitoramento_Ignorados : TPanel ;
     CK_Rolagem_DirMon          : TCheckBox ;
     Cnt_Monitoramento_TT       : LongInt ;
     Cnt_Monitoramento_Ignorado : LongInt ;
     Procedure HandleFolderChange ( ASender : TFolderMon ; AFolderItem : TFolderItemInfo ) ;
     Procedure HandleFolderMonActivated ( ASender: TObject ) ;
     Procedure HandleFolderMonDeactivated ( ASender: TObject ) ;
     //Property OnFolderChange_Mon : TFolderChangeEvent Read FOnFOlderChange_Mon Write FOnFolderChange_Mon ;
   End ;

Implementation

Uses Misc_R ;

Constructor TSupervisor_Pasta.Create ( Dono : TComponent ; _Tag : LongInt ) ;
Begin
Inherited Create ( Dono ) ;
//PUT_LOG ( 'INI TSupervisor.Create Tag[' + IntToStr(Tag_Supervisor) + ']' ) ;
LB_DirMon := Nil ;
FFolderMon := Nil ;
FOnFOlderChange_Mon := Nil ;
PN_Monitoramento_Ignorados := Nil ;
CK_Rolagem_DirMon := Nil ;
Tag_Supervisor := _Tag ;
//PUT_LOG ( 'Obj Supervisor Criado' ) ;
End ;

Function TSupervisor_Pasta.GET_EVENT_NAME_MON ( Acao : TFolderAction ) : String ;
Begin
Result := FFolderMon.GET_EVENT_NAME ( Acao ) ;
End ;

Procedure TSupervisor_Pasta.SETAR_MONITORAMENTO_PASTA ( LB : TListBox ; PN : TPanel ; CK : TCheckBox ) ;
Begin
LB_DirMon := LB ;
Associada := TRUE ;
PN_Monitoramento_Ignorados := PN ;
CK_Rolagem_DirMon := CK ;
End ;

procedure TSupervisor_Pasta.HandleFolderChange(ASender: TFolderMon; AFolderItem: TFolderItemInfo);
Var Local : LongInt ;
    Qtde  : LongInt ;
begin
//PUT_LOG ( 'INI HandleFolderChange Tag[' + IntToStr(Tag_Supervisor) + ']' +
//          '[' + AFolderItem.Name + ']' ) ;
If Application.Terminated Then Begin
   Exit ;
End ;
Inc ( Cnt_Monitoramento_TT ) ;
Qtde := SL_Ignorar_Monitoramento.Count ;
If Qtde > 0 Then Begin
   For Local := 0 To Qtde - 1 Do Begin
      If Pos ( SL_Ignorar_Monitoramento[Local], UpperCase(AFolderItem.Name) ) > 0 Then Begin
         Inc ( Cnt_Monitoramento_Ignorado ) ;
         If Assigned ( PN_Monitoramento_Ignorados ) Then Begin
            PN_Monitoramento_Ignorados.Caption :=
                'IGN ' + IntToStr ( Cnt_Monitoramento_Ignorado ) + '/' +
                IntToStr ( Cnt_Monitoramento_TT ) + ' ' +
                ExtractFileName ( AFolderItem.Name ) ;
         End ;
         Exit ;
      End ;
   End ;
End ;
If Assigned ( FOnFOlderChange_Mon ) Then Begin
   FOnFOlderChange_Mon ( Tag_Supervisor, INSERE_BARRA(ASender.Folder),
                         AFolderItem.Name, AFolderItem.Action ) ;
End ;
If ( Assigned ( LB_DirMon ) ) AND
   ( Assigned ( CK_Rolagem_DirMon ) ) AND
   ( NOT Application.Terminated ) Then Begin
   LB_DirMon.Items.Add ( CASA3_PONTO ( ( GetTickCount - Tick_FormShow ) / 1000 ) + ' ' +
                         // ASender.Folder + '\' +
                         '[' + IntToStr(Tag_Supervisor) + '] ' +
                         INSERE_BARRA ( Pasta_Monitorada ) + AFolderItem.Name + ';' +
                         FOLDER_ACTION_NAMES[AFolderItem.Action]);
   If CK_Rolagem_DirMon.Checked Then Begin
      LB_DirMon.ItemIndex := LB_DirMon.Items.Count - 1 ;
   End ;
End ;
_Debug ( 'FIM HandleFolderChange' ) ;
end;

procedure TSupervisor_Pasta.HandleFolderMonActivated(ASender: TObject);
begin
//PUT_LOG ( 'DIR_MONITOR ATIVADO Tag[' + IntToStr(Tag_Supervisor) + ']' ) ;
end;

procedure TSupervisor_Pasta.HandleFolderMonDeactivated(ASender: TObject);
begin
//PUT_LOG ( 'DIR_MONITOR DESATIVADO Tag[' + IntToStr(Tag_Supervisor) + ']' ) ;
end;

Procedure TSupervisor_Pasta.ATIVAR_MONITORAMENTO_DE_DIRETORIO ( Dir : String ;
          Funcao : TFolderChangeEvent ; LB : TListBox ; SubPastas : Boolean ) ;
Var vMonitoredChanges : TChangeTypes ;
    Passo             : LongInt ;
Begin
Pasta_Monitorada := Dir ;
//PUT_LOG ( 'INI ATIVAR_MONITORAMENTO_DE_DIRETORIO [' + Dir + ']' ) ;
If Assigned ( LB ) Then Begin
   LB.Items.Add ( 'ATIVAR_MONITORAMENTO_DE_DIRETORIO [' + Dir + ']' ) ;
End ;
Passo := 0 ;
Try
   Passo := 1 ;
   Cnt_Monitoramento_TT := 0 ;
   Cnt_Monitoramento_Ignorado := 0 ;
   SL_Ignorar_Monitoramento := TStringList.Create ;
   SL_Ignorar_Monitoramento.Add ( 'FADE.INI' ) ;
   SL_Ignorar_Monitoramento.Add ( 'INICIO.INI' ) ;
   SL_Ignorar_Monitoramento.Add ( '.OFF' ) ;
   If NOT Assigned ( FFolderMon ) Then Begin
      _Debug ( 'CRIANDO CLASSE ATIVAR_MONITORAMENTO_DE_DIRETORIO' ) ;
      //PUT_LOG ( 'CRIANDO CLASSE ATIVAR_MONITORAMENTO_DE_DIRETORIO' ) ;
      FFolderMon := TFolderMon.Create ;
      FFolderMon.OnActivated := HandleFolderMonActivated ;
      FFolderMon.OnDeactivated := HandleFolderMonDeactivated ;
      FFolderMon.OnFolderChange := HandleFolderChange ;
      FOnFOlderChange_Mon := Funcao ;
   End ;
   If FFolderMon.IsActive Then Begin
      Passo := 2 ;
      FFolderMon.Deactivate ;
   End ;
   Passo := 3 ;
   FFolderMon.Folder := Pasta_Monitorada ;
   Passo := 4 ;
   vMonitoredChanges := [] ;
   Passo := 5 ;
   If TRUE then Include ( vMonitoredChanges, ctFileName ) ;
   Passo := 6 ;
   If TRUE then Include ( vMonitoredChanges, ctDirName ) ;
   Passo := 7 ;
   If TRUE then Include ( vMonitoredChanges, ctAttr ) ;
   Passo := 8 ;
   If TRUE then Include ( vMonitoredChanges, ctSize ) ;
   Passo := 9 ;
   If TRUE then Include ( vMonitoredChanges, ctLastWriteTime ) ;
   Passo := 10 ;
   If TRUE then Include ( vMonitoredChanges, ctLastAccessTime ) ;
   Passo := 11 ;
   If TRUE then Include ( vMonitoredChanges, ctCreationTime ) ;
   Passo := 12 ;
   If TRUE then Include ( vMonitoredChanges, ctSecurityAttr ) ;
   Passo := 13 ;
   FFolderMon.MonitoredChanges := vMonitoredChanges ;
   Passo := 14 ;
   FFolderMon.MonitorSubFolders := SubPastas ;
   Passo := 15 ;
   FFolderMon.Activate ;
   Passo := 16 ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception ATIVAR_MONITORAMENTO_DE_DIRETORIO Passo ' +
                IntToStr ( Passo ) + ' [' + E.Message + ']' ) ;
   End ;
End ;
_Debug ( 'FIM ATIVAR_MONITORAMENTO_DE_DIRETORIO' ) ;
End ;

End.

