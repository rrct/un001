unit Main;

interface

uses
  Misc_Def_U,
  Misc_Const_U,
  Misc_Type_U,
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIRegClasses, uniGUIForm, uniGUIBaseClasses, uniButton,
  unimButton, uniTabControl, uniPanel, uniPageControl, uniTreeView, uniTreeMenu,
  uniURLFrame, Vcl.Menus, uniMainMenu, uniImageList, uniLabel, uniBitBtn,
  uniImage;

type
  TMainForm = class(TUniForm)
    PN_LEFT: TUniContainerPanel;
    UniContainerPanel2: TUniContainerPanel;
    UniContainerPanel3: TUniContainerPanel;
    UniPageControl1: TUniPageControl;
    UniTabSheet1: TUniTabSheet;
    UniURLFrame1: TUniURLFrame;
    MENU_LEFT: TUniTreeMenu;
    UniNativeImageList1: TUniNativeImageList;
    UniMenuItems1: TUniMenuItems;
    Usuarios1: TUniMenuItem;
    Usurios2: TUniMenuItem;
    Fornecedores1: TUniMenuItem;
    Fornecedores2: TUniMenuItem;
    Configuracao1: TUniMenuItem;
    Geral1: TUniMenuItem;
    Preferencias1: TUniMenuItem;
    Opcoes: TUniMenuItem;
    UniLabel3: TUniLabel;
    Outros1: TUniMenuItem;
    Opcao1: TUniMenuItem;
    Opcao2: TUniMenuItem;
    Opcao3: TUniMenuItem;
    UniLabel2: TUniLabel;
    UniTabSheet2: TUniTabSheet;
    UniTabSheet3: TUniTabSheet;
    UniBitBtn1: TUniBitBtn;
    procedure UniButton1Click(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure UniBitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function MainForm: TMainForm;

implementation

{$R *.dfm}

uses
  uniGUIVars, MainModule, uniGUIApplication, ServerModule;

function MainForm: TMainForm;
begin
  Result := TMainForm(UniMainModule.GetFormInstance(TMainForm));
end;

procedure TMainForm.UniBitBtn1Click(Sender: TObject);
begin
MENU_LEFT.Micro := NOT MENU_LEFT.Micro ;
if MENU_LEFT.Micro Then Begin
   PN_LEFT.Width := 0 ;
End Else Begin
   PN_LEFT.Width := Setup.Largura_Menu_Left ;
End ;
end;

procedure TMainForm.UniButton1Click(Sender: TObject);
begin
ModalResult := mrOk ;
end;

procedure TMainForm.UniFormShow(Sender: TObject);
begin
MENU_LEFT.Align := alClient ;
Setup.Largura_Menu_Left := MainForm.PN_LEFT.Width ;
UniServerModule.EXEC_JS ( 'console.log("Show/MainForm/3", globais.usuario ) ;' ) ;
//UniServerModule.EXEC_JS ( 'alert ( "[" + global_usuario + "][" + global_senha + "]" );');
//ShowMessage ( 'ok' ) ;
end;

initialization
  RegisterAppFormClass(TMainForm);
end.
