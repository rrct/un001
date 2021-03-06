Unit Log_U ;

Interface

Uses Misc_Def_U, Misc_Const_U, Misc_Type_U,
     Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
     System.Classes, Vcl.Graphics,
     //Splash_U,
     //Misc_U,
     Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
     Vcl.StdCtrls, Vcl.ExtCtrls, System.ImageList, Vcl.ImgList,
     Vcl.Menus, Vcl.ExtDlgs, Vcl.ComCtrls ;

Type
  TLog = class(TForm)
    ImageList1: TImageList;
    MainMenu1: TMainMenu;
    Arquivo1: TMenuItem;
    Salvar1: TMenuItem;
    N1: TMenuItem;
    Fechar1: TMenuItem;
    SaveTextFileDialog1: TSaveTextFileDialog;
    Opes1: TMenuItem;
    CK_MonitorarTeclado: TMenuItem;
    Limpar1: TMenuItem;
    PC: TPageControl;
    TS_Log: TTabSheet;
    TS_Monitor: TTabSheet;
    PC_Log: TPageControl;
    TS_Simples: TTabSheet;
    LB_Main: TListBox;
    TS_Excecoes: TTabSheet;
    LB_Excecoes: TListBox;
    TS_Atencao: TTabSheet;
    LB_Atencao: TListBox;
    TS_Erros: TTabSheet;
    LB_Erros: TListBox;
    TS_Debug: TTabSheet;
    LB_Debug: TListBox;
    PN_Top_Debug: TPanel;
    Button1: TButton;
    PN_Rodape: TPanel;
    PN_Filtro_Log: TPanel;
    Label1: TLabel;
    ED_Filtro: TEdit;
    Bot_Atualizar: TButton;
    CK_Rolagem: TCheckBox;
    ED_Timeout: TEdit;
    Bot_Limpar: TButton;
    PN_Excecoes: TPanel;
    PN_Atencao: TPanel;
    PN_Erros: TPanel;
    LB_Filtro: TListBox;
    PN_ME: TPanel;
    ME: TMemo;
    Splitter1: TSplitter;
    PN_Header_: TPanel;
    PN_Monitoramento_Ignorados: TPanel;
    CK_Rolagem_DirMon: TCheckBox;
    LB_Monitor: TListBox;
    Splitter2: TSplitter;
    SB_Log1: TStatusBar;
    SB_Log2: TStatusBar;
    TS_PushPop: TTabSheet;
    LB_PushPop: TListBox;
    TS_IMG: TTabSheet;
    LB_IMG: TListBox;
    TS_Disco: TTabSheet;
    PC_Disco: TPageControl;
    TS_Read2: TTabSheet;
    TS_Write2: TTabSheet;
    TS_Append2: TTabSheet;
    TS_Copy2: TTabSheet;
    TS_Sync2: TTabSheet;
    LB_Read: TListBox;
    LB_Write: TListBox;
    LB_Append: TListBox;
    LB_Copy: TListBox;
    LB_Sync: TListBox;
    TS_DirMon2: TTabSheet;
    LB_DirMon: TListBox;
    TS_FN2: TTabSheet;
    LB_FileExists: TListBox;
    TS_FF: TTabSheet;
    LB_FindFirst: TListBox;
    TS_FileAge: TTabSheet;
    LB_FileAge: TListBox;
    TS_DeleteFile: TTabSheet;
    LB_DeleteFile: TListBox;
    TabSheet1: TTabSheet;
    PC_Aplicacao: TPageControl;
    TS_Aplicacao_1: TTabSheet;
    LB_Aplicacao_1: TListBox;
    TS_Aplicacao_2: TTabSheet;
    LB_Aplicacao_2: TListBox;
    TS_Aplicacao_3: TTabSheet;
    LB_Aplicacao_3: TListBox;
    TS_Aplicacao_4: TTabSheet;
    LB_Aplicacao_4: TListBox;
    TS_Aplicacao_5: TTabSheet;
    LB_Aplicacao_5: TListBox;
    TabSheet2: TTabSheet;
    SB_Servidor: TStatusBar;
    SB_Cliente: TStatusBar;
    LB_Cliente: TListBox;
    LB_Servidor: TListBox;
    Procedure FormCreate(Sender: TObject) ;
    procedure Bot_AtualizarClick(Sender: TObject);
    procedure ED_FiltroChange(Sender: TObject);
    procedure LB_FiltroClick(Sender: TObject);
    procedure Fechar1Click(Sender: TObject);
    procedure Salvar1Click(Sender: TObject);
    procedure LB_ErrosClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Bot_LimparClick(Sender: TObject);
    procedure PN_ExcecoesDblClick(Sender: TObject);
    Procedure ATUALIZAR_SELECAO_LOG ( _LB : TListBox ) ;
    procedure LB_MainMouseUp(Sender: TObject; Button: TMouseButton;
              Shift: TShiftState; X, Y: Integer);
    procedure LB_MainClick(Sender: TObject);
    procedure LB_ExcecoesClick(Sender: TObject);
    procedure LB_AtencaoClick(Sender: TObject);
    procedure LB_ExcecoesMouseUp(Sender: TObject; Button: TMouseButton;
              Shift: TShiftState; X, Y: Integer);
    procedure LB_AtencaoMouseUp(Sender: TObject; Button: TMouseButton;
              Shift: TShiftState; X, Y: Integer);
    procedure LB_ErrosMouseUp(Sender: TObject; Button: TMouseButton;
              Shift: TShiftState; X, Y: Integer);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure PC_LogChange(Sender: TObject);
    procedure LB_DebugClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure CK_MonitorarTecladoClick(Sender: TObject);
    procedure Limpar1Click(Sender: TObject);
    Procedure LIMPAR_LOG ;
    Procedure LIMPAR_PAINEIS ;
    Procedure LIMPAR_LOG_SOCKET ;
    procedure PN_ExcecoesClick(Sender: TObject);
    procedure PN_ErrosClick(Sender: TObject);
    procedure PN_AtencaoClick(Sender: TObject);
    procedure LB_PushPopClick(Sender: TObject);
    procedure LB_ReadClick(Sender: TObject);
    procedure LB_DirMonClick(Sender: TObject);
    procedure LB_IMGClick(Sender: TObject);
    procedure LB_FileExistsClick(Sender: TObject);
    procedure LB_WriteClick(Sender: TObject);
    procedure LB_AppendClick(Sender: TObject);
    procedure LB_CopyClick(Sender: TObject);
    procedure LB_SyncClick(Sender: TObject);
    procedure LB_FindFirstClick(Sender: TObject);
    procedure LB_FileAgeClick(Sender: TObject);
    procedure LB_DeleteFileClick(Sender: TObject);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure PC_DiscoMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure PC_LogMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure PCMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure LB_Aplicacao_1Click(Sender: TObject);
    procedure LB_Aplicacao_2Click(Sender: TObject);
    procedure LB_Aplicacao_3Click(Sender: TObject);
    procedure LB_Aplicacao_4Click(Sender: TObject);
    procedure LB_Aplicacao_5Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  Private
    { Private declarations }
  Public
    { Public declarations }
  End ;

Var Log : TLog ;

Procedure EXECUTAR_FILTRO_LOG ;
Procedure SALVAR_LOG ( Dialogo : Boolean ) ;

Implementation

Uses Misc_R ,
     Main;

{$R *.dfm}

Procedure EXECUTAR_FILTRO_LOG ;
Var Qtde  : LongInt ;
    Local : LongInt ;
    Aux   ,
    Key   : String ;
Begin
Log.LB_Filtro.Items.Clear ;
Qtde := Log.LB_Main.Items.Count ; // Log.LB.Items.Count ;
If Qtde = 0 Then
   Exit ;
Global_Log_Filtro := Log.ED_Filtro.Text ;
Key := UpperCase ( STRING_ASCII_PADRAO ( Global_Log_Filtro ) ) ;
For Local := 0 To Qtde - 1 Do
   Begin
   Aux := UpperCase ( STRING_ASCII_PADRAO ( Log.LB_Main.Items[Local] ) ) ; // Log.LB.Items[Local] ) ) ;
   If Pos ( Key, Aux) > 0 Then
      Log.LB_Filtro.Items.Add ( Log.LB_Main.Items[Local] ) ; // Log.LB.Items[Local] ) ;
   End ;
End ;

Procedure TLog.Bot_AtualizarClick(Sender: TObject) ;
Begin
EXECUTAR_FILTRO_LOG ;
End ;

procedure TLog.Bot_LimparClick(Sender: TObject);
begin
LIMPAR_LOG ;
end;

procedure TLog.Button1Click(Sender: TObject);
begin
LB_Debug.Items.Text := RR_Debug ;
end;

procedure TLog.CK_MonitorarTecladoClick(Sender: TObject);
begin
CK_MonitorarTeclado.Checked := NOT CK_MonitorarTeclado.Checked ;
end;

Procedure TLog.ED_FiltroChange(Sender: TObject) ;
Begin
EXECUTAR_FILTRO_LOG ;
End ;

procedure TLog.Fechar1Click(Sender: TObject);
begin
Log.Close ;
end;

procedure TLog.FormActivate(Sender: TObject);
begin
//PUT_LOG ( 'Log BringToFront' ) ;
BringToFront ;
end;

Procedure TLog.LIMPAR_PAINEIS ;
Begin
PN_Excecoes.Caption :=  'Exc: 0' ;
PN_Excecoes.Color := clSilver ;
PN_Erros.Caption :=  'Err: 0' ;
PN_Erros.Color := clSilver ;
PN_Atencao.Caption :=  'Atc: 0' ;
PN_Atencao.Color := clSilver ;
End  ;

Procedure TLog.LIMPAR_LOG_SOCKET ;
Begin
LB_Servidor.Items.Clear ;
LB_Cliente.Items.Clear ;
Log_LB_Socket_Servidor_Count := 0 ;
Log_LB_Socket_Cliente_Count := 0 ;
End ;

Procedure TLog.FormCreate(Sender: TObject) ;
Begin
//AutoSize := TRUE ;
LIMPAR_LOG_SOCKET ;
SB_Log_Status1 := SB_Log1 ;
SB_Log_Status1 := SB_Log1 ;
PC.Align := alClient ;
PC.ActivePage := TS_Log ;
LB_Monitor.Align := alClient ;
LB_PushPop.Align := alClient ;
LB_Read.Align := alClient ;
LB_Write.Align := alClient ;
LB_Append.Align := alClient ;
LB_Copy.Align := alClient ;
LB_Sync.Align := alClient ;
LB_FileExists.Align := alClient ;
LB_FindFirst.Align := alClient ;
LB_DeleteFile.Align := alClient ;
LB_FileAge.Align := alClient ;
LB_IMG.Align := alClient ;
LB_DirMon.Align := alClient ;
LB_Aplicacao_1.Align := alClient ;
LB_Aplicacao_2.Align := alClient ;
LB_Aplicacao_3.Align := alClient ;
LB_Aplicacao_4.Align := alClient ;
LB_Aplicacao_5.Align := alClient ;
PN_Excecoes.Caption := '' ;
//Misc_LB_Log := LB ;
//Misc_LB_Log_Erros := LB_Erros ;
//Misc_LB_Log_Pesquisa := LB_Filtro ;
//Misc_CK_Rolagem_Log := CK_Rolagem ;
ED_Filtro.Clear ;
ME.Align := alClient ;
ME.Lines.Clear ;
PC_Log.Align := alClient ;
PC_Log.ActivePage := TS_Simples ;
LB_Main.Align := alClient ;
LB_Erros.Align := alClient ;
LB_Debug.Align := alClient ;
LB_Excecoes.Align := alClient ;
LB_Atencao.Align := alClient ;
LIMPAR_PAINEIS ;
End ;

Procedure TLog.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState) ;
Var Aux : String ;
Begin
REFRESH_TIMEOUT ;
If CK_MonitorarTeclado.Checked Then Begin
   Aux := '' ;
   If ssAlt In Shift Then Begin
      Aux := Aux + '{Alt}' ;
   End ;
   If ssShift In Shift Then Begin
      Aux := Aux + '{Shift}' ;
   End ;
   If ssCtrl In Shift Then Begin
      Aux := Aux + '{Ctrl}' ;
   End ;
   PUT_LOG ( 'KeyLog [' + IntToStr ( Key ) + '] ' + Aux ) ;
End ;
{
If Key = VK_F8 Then Begin
   LIMPAR_LOG ;
   Key := 0 ;
   Exit ;
End ;
}
If (ssCtrl In Shift) Then Begin
   If ( Key = VK_CEDILHA ) OR ( Key = VK_IGUAL ) Then Begin
      Log.Close ;
      Key := 0 ;
      Exit ;
   End ;
   If Key = VK_CEDILHA Then Begin
      Log.Close ;
      Key := 0 ;
      Exit ;
   End ;
End ;
{$IFDEF NW}
Main.FormKeyDown(Sender, Key, Shift);
{$ENDIF}
End ;

procedure TLog.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
REFRESH_TIMEOUT ;
end;

procedure TLog.FormShow(Sender: TObject);
begin
Log.Caption := Title_RNews + ' - Log de Eventos' ;
end;

Procedure TLog.ATUALIZAR_SELECAO_LOG ( _LB : TListBox ) ;
Var Local : LongInt ;
//    Aux   : String ;
Begin
If _LB.SelCount > 0 Then Begin
   ME.Lines.Clear ;
   ME.Lines.Add ( '[INI]================================' ) ;
   For Local := 0 To _LB.Items.Count - 1 Do Begin
      If _LB.Selected[Local] Then Begin
         //Aux := Trim ( _LB.Items[Local] ) ;
         ME.Lines.Add ( Trim ( _LB.Items[Local] ) ) ;
         //If Pos ( #32, Aux ) > 0 Then Begin
         //   Delete ( Aux, 1 , Pos ( #32, Aux ) ) ;
         //End ;
         //If Pos ( #32, Aux ) > 0 Then Begin
         //   Delete ( Aux, 1 , Pos ( #32, Aux ) ) ;
         //End ;
         //Aux := Trim ( Aux ) ;
         //ME.Lines.Add ( Aux ) ;
      End ;
   End ;
   ME.Lines.Add ( '[FIM]================================' ) ;
End ;
End ;

procedure TLog.LB_MainClick(Sender: TObject);
begin
ATUALIZAR_SELECAO_LOG ( LB_Main ) ;
end;

procedure TLog.LB_MainMouseUp ( Sender: TObject; Button: TMouseButton;
                                Shift: TShiftState; X, Y: Integer);
begin
ATUALIZAR_SELECAO_LOG ( LB_Main ) ;
End ;

procedure TLog.LB_PushPopClick(Sender: TObject);
begin
ATUALIZAR_SELECAO_LOG ( LB_PushPop ) ;
end;

procedure TLog.LB_ReadClick(Sender: TObject);
begin
ATUALIZAR_SELECAO_LOG ( LB_Read ) ;
end;

procedure TLog.LB_SyncClick(Sender: TObject);
begin
ATUALIZAR_SELECAO_LOG ( LB_Sync ) ;
end;

procedure TLog.LB_WriteClick(Sender: TObject);
begin
ATUALIZAR_SELECAO_LOG ( LB_Write ) ;
end;

procedure TLog.Limpar1Click(Sender: TObject);
begin
LIMPAR_LOG ;
end;

procedure TLog.LB_Aplicacao_1Click(Sender: TObject);
begin
ATUALIZAR_SELECAO_LOG ( LB_Aplicacao_1 ) ;
end;

procedure TLog.LB_Aplicacao_2Click(Sender: TObject);
begin
ATUALIZAR_SELECAO_LOG ( LB_Aplicacao_2 ) ;
end;

procedure TLog.LB_Aplicacao_3Click(Sender: TObject);
begin
ATUALIZAR_SELECAO_LOG ( LB_Aplicacao_3 ) ;
end;

procedure TLog.LB_Aplicacao_4Click(Sender: TObject);
begin
ATUALIZAR_SELECAO_LOG ( LB_Aplicacao_4 ) ;
end;

procedure TLog.LB_Aplicacao_5Click(Sender: TObject);
begin
ATUALIZAR_SELECAO_LOG ( LB_Aplicacao_5 ) ;
end;

procedure TLog.LB_AppendClick(Sender: TObject);
begin
ATUALIZAR_SELECAO_LOG ( LB_Append ) ;
end;

procedure TLog.LB_AtencaoClick(Sender: TObject);
begin
ATUALIZAR_SELECAO_LOG ( LB_Atencao ) ;
end;

procedure TLog.LB_AtencaoMouseUp ( Sender: TObject; Button: TMouseButton;
                                   Shift: TShiftState; X, Y: Integer);
begin
ATUALIZAR_SELECAO_LOG ( LB_Atencao ) ;
end;

procedure TLog.LB_CopyClick(Sender: TObject);
begin
ATUALIZAR_SELECAO_LOG ( LB_Copy ) ;
end;

procedure TLog.LB_DebugClick(Sender: TObject);
begin
ATUALIZAR_SELECAO_LOG ( LB_Debug ) ;
end;

procedure TLog.LB_DeleteFileClick(Sender: TObject);
begin
ATUALIZAR_SELECAO_LOG ( LB_DeleteFile ) ;
end;

procedure TLog.LB_DirMonClick(Sender: TObject);
begin
ATUALIZAR_SELECAO_LOG ( LB_DirMon ) ;
end;

Procedure TLog.LB_ErrosClick(Sender: TObject);
Begin
ATUALIZAR_SELECAO_LOG ( LB_Erros ) ;
//If LB_Erros.ItemIndex >= 0 Then
//   ME.Text := LB_Erros.Items[LB_Erros.ItemIndex] ;
End ;

procedure TLog.LB_ErrosMouseUp ( Sender: TObject; Button: TMouseButton;
                                 Shift: TShiftState; X, Y: Integer);
begin
ATUALIZAR_SELECAO_LOG ( LB_Erros ) ;
end;

procedure TLog.LB_ExcecoesClick(Sender: TObject);
begin
ATUALIZAR_SELECAO_LOG ( LB_Excecoes ) ;
end;

procedure TLog.LB_ExcecoesMouseUp ( Sender: TObject; Button: TMouseButton;
                                    Shift: TShiftState; X, Y: Integer);
begin
ATUALIZAR_SELECAO_LOG ( LB_Excecoes ) ;
end;

procedure TLog.LB_FileAgeClick(Sender: TObject);
begin
ATUALIZAR_SELECAO_LOG ( LB_FileAge ) ;
end;

procedure TLog.LB_FileExistsClick(Sender: TObject);
begin
ATUALIZAR_SELECAO_LOG ( LB_FileExists ) ;
end;

Procedure TLog.LB_FiltroClick(Sender: TObject) ;
Begin
If LB_Filtro.ItemIndex >= 0 Then
   ME.Text := LB_Filtro.Items[LB_Filtro.ItemIndex] ;
End ;

procedure TLog.LB_FindFirstClick(Sender: TObject);
begin
ATUALIZAR_SELECAO_LOG ( LB_FindFirst ) ;
end;

procedure TLog.LB_IMGClick(Sender: TObject);
begin
ATUALIZAR_SELECAO_LOG ( LB_IMG ) ;
end;

procedure TLog.PCMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
REFRESH_TIMEOUT ;
end;

procedure TLog.PC_DiscoMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
REFRESH_TIMEOUT ;
end;

procedure TLog.PC_LogChange(Sender: TObject);
Begin
If PC_Log.ActivePage = TS_Debug Then Begin
   LB_Debug.Items.Text := RR_Debug ;
End ;
End ;

procedure TLog.PC_LogMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
REFRESH_TIMEOUT ;
end;

procedure TLog.PN_AtencaoClick(Sender: TObject);
begin
PC_Log.ActivePage := TS_Atencao ;
end;

procedure TLog.PN_ErrosClick(Sender: TObject);
begin
PC_Log.ActivePage := TS_Erros ;
end;

procedure TLog.PN_ExcecoesClick(Sender: TObject);
begin
PC_Log.ActivePage := TS_Excecoes ;
end;

procedure TLog.PN_ExcecoesDblClick(Sender: TObject);
begin
Misc_Log_Cnt_Exception := 0 ;
PN_Excecoes.Caption := 'EXC: ' + '-' ;
PN_Excecoes.Color := clBtnFace ;
end;

Procedure TLog.LIMPAR_LOG ;
Begin
LIMPAR_LOG_SOCKET ;
LB_Main.Items.Clear ;
LB_Erros.Items.Clear ;
LB_Filtro.Items.Clear ;
LB_PushPop.Items.Clear ;
LB_Read.Items.Clear ;
LB_Write.Items.Clear ;
LB_Append.Items.Clear ;
LB_Copy.Items.Clear ;
LB_Sync.Items.Clear ;
LB_FileExists.Items.Clear ;
LB_FindFirst.Items.Clear ;
LB_FileAge.Items.Clear ;
LB_DeleteFile.Items.Clear ;
LB_IMG.Items.Clear ;
LB_DirMon.Items.Clear ;
LB_Aplicacao_1.Items.Clear ;
LB_Aplicacao_2.Items.Clear ;
LB_Aplicacao_3.Items.Clear ;
LB_Aplicacao_4.Items.Clear ;
LB_Aplicacao_5.Items.Clear ;
ME.Lines.Clear ;
If NOT Visible Then Begin
   //Log.Show ;
   //Log.BringToFront ;
End ;
Misc_Log_Cnt_Atencao := 0 ;
Misc_Log_Cnt_Erros := 0 ;
Misc_Log_Cnt_Exception := 0 ;
Misc_Log_Cnt_PushPop := 0 ;
Log.TS_PushPop.Caption := 'PushPop' ;
LIMPAR_PAINEIS ;
PC_Log.ActivePage := TS_Log ;
//Log.ED_Filtro.Clear ;
End ;

Procedure SALVAR_LOG ( Dialogo : Boolean ) ;
Var FN : String ;
Begin
If Dialogo Then Begin
   If Log.SaveTextFileDialog1.InitialDir = '' Then Begin
      Log.SaveTextFileDialog1.InitialDir := Diretorio + 'Config\Logs\' ;
   End ;
   CHECAR_DIRETORIO_DIRNAME ( Log.SaveTextFileDialog1.InitialDir ) ;
   If NOT Log.SaveTextFileDialog1.Execute Then Begin
      Exit ;
   End ;
   FN := Log.SaveTextFileDialog1.FileName ;
End Else Begin
   FN := Diretorio + 'Config\Logs\' + DATAHORA_INVERSA(Now) + '.Log' ;
End ;
Try
   CHECAR_DIRETORIO_FILENAME ( FN ) ;
   Log.LB_Main.Items.SaveToFile ( FN ) ;
Except
End ;
End ;

procedure TLog.Salvar1Click(Sender: TObject);
begin
SALVAR_LOG ( DIALOGO_TRUE ) ;
end;

End.

