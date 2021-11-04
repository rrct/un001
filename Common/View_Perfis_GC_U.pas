Unit View_Perfis_GC_U ;

Interface

Uses Misc_Const_U, Misc_Def_U, Misc_Type_U,
     Misc_1, Misc_GC, // Misc_Zews_U, Misc_Print_U, Misc_Log_U, Misc_User, Misc_TCP,
     Espelho_RD_Def_U, Log_U, GC_U,
     Espelho_RD_U,
     RichEdit, Math, Misc_U,
     MyRichEdit_U,
     Transparentes_U,
     Winapi.Windows, Winapi.Messages,
     System.SysUtils, System.Variants, System.Classes,
     Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
     Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls;

Type
  TView_Perfis_GC = Class(TForm)
    PN_Left: TPanel;
    PN_Right: TPanel;
    PN_Top: TPanel;
    Label1: TLabel;
    PN_ED_1: TPanel;
    Label2: TLabel;
    ED_1: TEdit;
    PN_ED_2: TPanel;
    Label3: TLabel;
    ED_2: TEdit;
    PN_ED_3: TPanel;
    Label4: TLabel;
    ED_3: TEdit;
    PN_ED_4: TPanel;
    Label5: TLabel;
    ED_4: TEdit;
    PN_Preview_Moldura_2: TPanel;
    PN_Preview_Moldura_1: TPanel;
    PN_Geral_Preview: TPanel;
    LB_Tags: TListBox;
    PN_Info_Tag: TPanel;
    LB_Info_Tag: TListBox;
    ED_Msg: TEdit;
    CK_Exige_Relogio: TCheckBox;
    Bevel1: TBevel;
    Label6: TLabel;
    ED_Canal: TEdit;
    Bevel2: TBevel;
    StatusBar: TStatusBar;
    PN_Header: TPanel;
    Bot_Recarregar: TButton;
    Timer1: TTimer;
    PN_Preview_Relogio: TPanel;
    PN_Preview_Logo: TPanel;
    PN_Preview_Tarja: TPanel;
    Procedure FormShow(Sender: TObject) ;
    procedure LB_TagsClick(Sender: TObject);
    Procedure LIMPAR_FORMULARIO ;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
    procedure Bot_RecarregarClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    Procedure ATUALIZAR_FORMULARIO ( Reg : T_GC ) ;
  Private
    { Private declarations }
  Public
    { Public declarations }
  End ;

Var View_Perfis_GC : TView_Perfis_GC ;
    FN_DT          : TDateTime ;

Implementation

{$R *.dfm}

Uses Main,
     Tipos_GC_U ;

procedure TView_Perfis_GC.Bot_RecarregarClick(Sender: TObject);
Var Indice : LongInt ;
begin
If Flag_Modo_Selo Then Begin
   Exit ;
End ;
Indice := LB_Tags.ItemIndex ;
TIPOS_GC_CARREGAR_TIPOS_GC_OUT_GC ;
If Indice > -1 Then Begin
   LB_Tags.ItemIndex := Indice ;
   LB_Tags.OnClick ( Nil ) ;
End ;
end;

procedure TView_Perfis_GC.Button1Click(Sender: TObject);
begin
If Flag_Modo_Selo Then Begin
   Exit ;
End ;
TIPOS_GC_CARREGAR_TIPOS_GC_OUT_GC ;
end;

procedure TView_Perfis_GC.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Timer1.Enabled := FALSE ;
end;

Procedure TView_Perfis_GC.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
Begin
If Key = VK_F5 Then Begin
   Bot_Recarregar.Click ;
   Key := 0 ;
End ;
If Key = VK_F8 Then Begin
   Log.LIMPAR_LOG ;
   Key := 0 ;
End ;
End ;

Procedure TView_Perfis_GC.LIMPAR_FORMULARIO ;
Begin
ED_Msg.Clear ;
ED_Canal.Clear ;
ED_1.Clear ;
ED_2.Clear ;
ED_3.Clear ;
ED_4.Clear ;
CK_Exige_Relogio.Checked := FALSE ;
StatusBar.SimpleText := '' ;
End ;

procedure TView_Perfis_GC.Timer1Timer(Sender: TObject);
{$IFDEF USAR_CHYRON}
Var FN : String ;
    DT : TDateTime ;
{$ENDIF}
begin
{$IFDEF USAR_CHYRON}
FN := RD.RD_GET_FN_TIPOS_GC ;
DT := GET_FN_DATETIME ( FN ) ;
If ( DT > 0 ) AND ( FN_DT <> DT ) Then Begin
   FN_DT := DT ;
   Bot_Recarregar.Click ;
End ;
{$ENDIF}
End ;

Procedure TView_Perfis_GC.FormShow(Sender: TObject) ;
Begin
{$IFDEF USAR_CHYRON}
Caption := Title_RNews + ' - Visualizar Perfis #GC' ;
LIMPAR_FORMULARIO ;
Timer1.Enabled := TRUE ;
VISUALIZAR_E_POSICIONAR_PREVIEW ;
{$ENDIF}
End ;

Procedure TView_Perfis_GC.ATUALIZAR_FORMULARIO ( Reg : T_GC ) ;
{$IFDEF USAR_CHYRON}
Var FN    : String ;
{$ENDIF}
Begin
{$IFDEF USAR_CHYRON}
ED_1.Text := Reg.Exemplo[1] ;
ED_2.Text := Reg.Exemplo[2] ;
ED_3.Text := Reg.Exemplo[3] ;
ED_4.Text := Reg.Exemplo[4] ;
ED_Msg.Text := IntToStr ( Reg.Msg ) ;
ED_Canal.Text := IntToStr ( Reg.Canal ) ;
LB_Info_Tag.Items.Text := GET_INFO_CG ( Reg ) ;
CK_Exige_Relogio.Checked := Reg.Relogio ;
FN := RD.RD_GC_GET_FN_IMAGEM_TARJA_GC ( Reg.Msg ) ;
_Debug ( '12 TView_Perfis_GC.LB_TagsClick FN[' + FN + ']' ) ;
StatusBar.SimpleText := FN + ' [' +
                        IIF( RR_FileExists('ATUALIZAR FORMULARIO',FN),'OK','NÃO ENCONTRADO') + ']' ;
{$ENDIF}
End ;

Procedure TView_Perfis_GC.LB_TagsClick(Sender: TObject) ;
Var Cmd   : String ;
    Reg   : T_GC ;
 //   Key   : String ;
//    Local : LongInt ;
Begin
//Exit ;
PUT_LOG ( 'LB_TagsClick' ) ;
_Debug ( 'INI TView_Perfis_GC.LB_TagsClick' ) ;
If LB_Tags.ItemIndex = -1 Then Begin
   _Debug ( 'Exit 1 TView_Perfis_GC.LB_TagsClick' ) ;
   Exit ;
End ;
_Debug ( '1 TView_Perfis_GC.LB_TagsClick' ) ;
LIMPAR_FORMULARIO ;
_Debug ( '2 TView_Perfis_GC.LB_TagsClick' ) ;
LB_Info_Tag.Items.Clear ;
_Debug ( '3 TView_Perfis_GC.LB_TagsClick' ) ;
Cmd := LB_Tags.Items [ LB_Tags.ItemIndex ] ;
_Debug ( '4 TView_Perfis_GC.LB_TagsClick' ) ;
Reg := TIPOS_GC_GET_REG_GC ( Cmd ) ;
PUT_LOG ( 'GET_REG_GC Reg.Tag[' + Reg.Tag + ']' ) ;
_Debug ( '5 TView_Perfis_GC.LB_TagsClick' ) ;
If Reg.Tag <> '' Then Begin
   _Debug ( '6 TView_Perfis_GC.LB_TagsClick' ) ;
   If NOT IS_GC_ASSIGNED ( GC_PERFIS ) Then Begin
      _Debug ( '7 NOT ASSIGNED CREATE TView_Perfis_GC.LB_TagsClick' ) ;
      //GC_CRIAR_GC_ED ( 0, GC_PERFIS ) ;
   End ;
   _Debug ( '8 TView_Perfis_GC.LB_TagsClick' ) ;
   GC_CARREGAR_EXEMPLOS ( Reg ) ;
   ATUALIZAR_FORMULARIO ( Reg ) ;
   _Debug ( '9 TView_Perfis_GC.LB_TagsClick' ) ;
   If View_Perfis_GC.Visible Then Begin
      GC_EXECUTE_PREVIEW_GC_REG ( 'LB_Tags.Click', 'PERFIS', GC_PERFIS, Reg, PREVIEW_IMG_TRUE ) ;
   End ;
   GC_EXECUTE_PREVIEW_GC_REG ( 'LB_Tags.Click', 'MAIN', GC_MAIN, Reg, PREVIEW_IMG_TRUE ) ;
   GC_EXECUTE_PREVIEW_GC_REG ( 'LB_Tags.Click', 'PREVIEW', GC_PREVIEW, Reg, PREVIEW_IMG_TRUE ) ;
   _Debug ( '10 TView_Perfis_GC.LB_TagsClick' ) ;
End ;
_Debug ( 'FIM TView_Perfis_GC.LB_TagsClick' ) ;
End ;

End .

