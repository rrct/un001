unit LoginM;

interface

uses
  Misc_Def_U,
  Misc_Const_U,
  Misc_Type_U,
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUImClasses, uniGUIRegClasses, uniGUIForm, uniGUImForm, uniGUImJSForm,
  uniGUIBaseClasses, uniButton, unimButton, uniImage, unimImage, unimPanel,
  uniEdit, unimEdit, uniLabel, unimLabel, Vcl.Imaging.pngimage;

type
  TUnimLoginForm2 = class(TUnimLoginForm)
    PN_TOP: TUnimPanel;
    UnimImage1: TUnimImage;
    PN_Body: TUnimPanel;
    UnimLabel1: TUnimLabel;
    ED_SENHA: TUnimEdit;
    UnimLabel2: TUnimLabel;
    ED_USUARIO: TUnimEdit;
    PN_BOTTOM: TUnimPanel;
    BOT_LOGIN: TUnimButton;
    UnimLabel3: TUnimLabel;
    UnimLabel4: TUnimLabel;
    procedure BOT_LOGINClick(Sender: TObject);
    procedure ED_USUARIOChange(Sender: TObject);
    procedure ED_SENHAChange(Sender: TObject);
    procedure ED_USUARIOKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ED_SENHAKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure UnimLoginFormShow(Sender: TObject);
    procedure ED_USUARIOEnter(Sender: TObject);
    procedure ED_SENHAEnter(Sender: TObject);
    procedure ED_SENHAExit(Sender: TObject);
    procedure ED_USUARIOExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  Procedure VALIDAR_BOTAO_LOGIN ;
  end;

function UnimLoginForm2: TUnimLoginForm2;

implementation

{$R *.dfm}

uses
  uniGUIVars, MainModule, uniGUIApplication, ServerModule;

function UnimLoginForm2: TUnimLoginForm2;
begin
  Result := TUnimLoginForm2(UniMainModule.GetFormInstance(TUnimLoginForm2));
end;

procedure TUnimLoginForm2.BOT_LOGINClick(Sender: TObject);
begin
If UniServerModule.EXECUTAR_LOGIN ( ED_USUARIO.Text, ED_SENHA.Text ) Then Begin
   UniServerModule.EXEC_JS (
       'globais.usuario.user = "' + global_usuario_user + '" ;' +
       'globais.usuario.nome = "' + global_usuario_nome2 + '" ;' +
       'globais.usuario.id = "' + global_usuario_id + '" ;' +
       'globais.usuario.nivel = "' + global_usuario_nivel + '" ;' +
       'console.log ( "global_bot_login_ok", globais.usuario ) ;' ) ;
    ModalResult := mrOk ;
End Else Begin
   ShowMessage ( 'Dados inválidos para autenticação' ) ;
End ;
End ;

procedure TUnimLoginForm2.ED_SENHAChange(Sender: TObject);
begin
BOT_LOGIN.Enabled := UniServerModule.VALIDAR_BOTAO_LOGIN ( ED_USUARIO.Text, ED_SENHA.Text ) ;
end;

procedure TUnimLoginForm2.ED_SENHAEnter(Sender: TObject);
begin
PN_Top.Hide ;
end;

procedure TUnimLoginForm2.ED_SENHAExit(Sender: TObject);
begin
PN_Top.Show ;
end;

procedure TUnimLoginForm2.ED_SENHAKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
If Key = 13 Then Begin
   if BOT_LOGIN.Enabled then Begin
      BOT_LOGIN.Click ;
   End ;
End ;
end;

procedure TUnimLoginForm2.ED_USUARIOChange(Sender: TObject);
begin
BOT_LOGIN.Enabled := UniServerModule.VALIDAR_BOTAO_LOGIN ( ED_USUARIO.Text, ED_SENHA.Text ) ;
end;

procedure TUnimLoginForm2.ED_USUARIOEnter(Sender: TObject);
begin
PN_Top.Hide ;
end;

procedure TUnimLoginForm2.ED_USUARIOExit(Sender: TObject);
begin
PN_Top.Show ;
end;

procedure TUnimLoginForm2.ED_USUARIOKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
If Key = 13 Then Begin
   if BOT_LOGIN.Enabled then Begin
      BOT_LOGIN.Click ;
   End ;
End ;
end;

procedure TUnimLoginForm2.UnimLoginFormShow(Sender: TObject);
begin
ED_USUARIO.Clear ;
ED_Senha.Clear ;
//ED_USUARIO.SetFocus ;
BOT_LOGIN.Enabled := UniServerModule.VALIDAR_BOTAO_LOGIN ( ED_USUARIO.Text, ED_SENHA.Text ) ;
end;

procedure TUnimLoginForm2.VALIDAR_BOTAO_LOGIN;
begin
BOT_LOGIN.Enabled := ( Length ( Trim ( ED_USUARIO.Text ) ) >= 3 ) AND
                     ( Length ( Trim ( ED_SENHA.Text ) ) >= 3 ) ;
If BOT_LOGIN.Enabled Then Begin
   UniServerModule.EXEC_JS (
       'globais.usuario.nome = document.getElementsByName("O2B")[0].value ;' +
   //    'globais.usuario.senha = document.getElementsByName("O27")[0].value ;' +
       'console.log ( "global_bot_login_ok", globais.usuario ) ;' ) ;
End ;
end;

initialization
  RegisterAppFormClass(TUnimLoginForm2);

end.
