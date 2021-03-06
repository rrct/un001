unit Login;

interface

uses
  Misc_Def_U,
  Misc_Const_U,
  Misc_Type_U,
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIRegClasses, uniGUIForm, uniGUIBaseClasses, uniButton,
  unimButton, uniPanel, uniHTMLFrame, uniLabel, uniEdit, uniImage, uniImageList,
  uniMemo, uniHTMLMemo, Vcl.Imaging.pngimage;

type
  TFRMLOGIN = class(TUniLoginForm)
    PN_LOGIN_TOP: TUniSimplePanel;
    PN_LOGIN_BODY: TUniSimplePanel;
    PN_LOGIN_BOTTOM: TUniSimplePanel;
    ED_SENHA: TUniEdit;
    UniNativeImageList1: TUniNativeImageList;
    ED_USUARIO: TUniEdit;
    BOT_LOGIN: TUniButton;
    UniImage1: TUniImage;
    UniLabel1: TUniLabel;
    UniLabel2: TUniLabel;
    UniLabel3: TUniLabel;
    UniLabel4: TUniLabel;
    procedure BOT_LOGINClick(Sender: TObject);
    procedure UniLoginFormShow(Sender: TObject);
    procedure ED_USUARIOChange(Sender: TObject);
    procedure ED_SENHAChange(Sender: TObject);
    procedure ED_SENHAKeyPress(Sender: TObject; var Key: Char);
    procedure ED_USUARIOKeyPress(Sender: TObject; var Key: Char);
    procedure UniLoginFormScreenResize(Sender: TObject; AWidth,
      AHeight: Integer);
    procedure UniLabel4MouseEnter(Sender: TObject);
    procedure UniLabel4MouseLeave(Sender: TObject);
    procedure UniLabel1MouseEnter(Sender: TObject);
    procedure UniLabel1MouseLeave(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function FRMLOGIN: TFRMLOGIN;

implementation

{$R *.dfm}

uses
  uniGUIVars, MainModule, uniGUIApplication, ServerModule;

function FRMLOGIN: TFRMLOGIN;
begin
  Result := TFRMLOGIN(UniMainModule.GetFormInstance(TFRMLOGIN));
end;

Procedure TFRMLOGIN.BOT_LOGINClick(Sender: TObject);
Begin
If UniServerModule.EXECUTAR_LOGIN ( ED_USUARIO.Text, ED_SENHA.Text ) Then Begin
   UniServerModule.EXEC_JS (
       'globais.usuario.user = "' + global_usuario_user + '" ;' +
       'globais.usuario.nome = "' + global_usuario_nome2 + '" ;' +
       'globais.usuario.id = "' + global_usuario_id + '" ;' +
       'globais.usuario.nivel = "' + global_usuario_nivel + '" ;' +
       'console.log ( "global_bot_login_ok", globais.usuario ) ;' ) ;
    ModalResult := mrOk ;
End Else Begin
   ShowMessage ( 'Dados inv?lidos para autentica??o' ) ;
End ;
End ;

procedure TFRMLOGIN.ED_SENHAChange(Sender: TObject);
begin
BOT_LOGIN.Enabled := UniServerModule.VALIDAR_BOTAO_LOGIN ( ED_USUARIO.Text, ED_SENHA.Text ) ;
end;

procedure TFRMLOGIN.ED_SENHAKeyPress(Sender: TObject; var Key: Char);
begin
If Key = #13 Then Begin
   if BOT_LOGIN.Enabled then Begin
      BOT_LOGIN.Click ;
   End ;
End ;
end;

procedure TFRMLOGIN.ED_USUARIOChange(Sender: TObject);
begin
BOT_LOGIN.Enabled := UniServerModule.VALIDAR_BOTAO_LOGIN ( ED_USUARIO.Text, ED_SENHA.Text ) ;
end;

procedure TFRMLOGIN.ED_USUARIOKeyPress(Sender: TObject; var Key: Char);
begin
If Key = #13 Then Begin
   if BOT_LOGIN.Enabled then Begin
      BOT_LOGIN.Click ;
   End ;
End ;
end;

procedure TFRMLOGIN.UniLabel1MouseEnter(Sender: TObject);
begin
(Sender As TUnilabel).Font.Style := [TFontStyle.fsUnderline] ;
end;

procedure TFRMLOGIN.UniLabel1MouseLeave(Sender: TObject);
begin
(Sender As TUnilabel).Font.Style := [] ;
end;

procedure TFRMLOGIN.UniLabel4MouseEnter(Sender: TObject);
begin
(Sender As TUnilabel).Font.Style := [TFontStyle.fsUnderline] ;
end;

procedure TFRMLOGIN.UniLabel4MouseLeave(Sender: TObject);
begin
(Sender As TUnilabel).Font.Style := [] ;
end;

procedure TFRMLOGIN.UniLoginFormScreenResize(Sender: TObject; AWidth,
  AHeight: Integer);
begin
FRMLOGIN.Left := ( AWidth - FRMLOGIN.Width ) DIV 2 ;
FRMLOGIN.Top := ( AHeight - FRMLOGIN.Height ) DIV 2 ;
end;

procedure TFRMLOGIN.UniLoginFormShow(Sender: TObject);
begin
ED_USUARIO.SetFocus ;
BOT_LOGIN.Enabled := UniServerModule.VALIDAR_BOTAO_LOGIN ( ED_USUARIO.Text, ED_SENHA.Text ) ;
end;

initialization
  RegisterAppFormClass(TFRMLOGIN);
  {
UniServerModule.CustomMeta.Text :=
    '<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">' + sLineBreak +
    '<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>' + sLineBreak +
    '<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>' + sLineBreak +
    '<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>' + sLineBreak +
    '<link rel=stylesheet href="/css/styles.css?&time=' + IntToStr(GetTickCount) + '" />' + sLineBreak ;
   }
end.
