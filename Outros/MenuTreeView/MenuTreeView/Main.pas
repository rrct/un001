unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIRegClasses, uniGUIForm, uniLabel, uniURLFrame, uniPanel,
  uniPageControl, uniStatusBar, uniTreeView, uniTreeMenu, uniGUIBaseClasses,
  Vcl.Menus, uniMainMenu, uniImageList, uniColorPalette, uniSyntaxEditorBase,
  uniSyntaxEditor, uniGenericControl, uniPropertyGrid;

type
  TMainForm = class(TUniForm)
    UniStatusBar1: TUniStatusBar;
    UniNativeImageList1: TUniNativeImageList;
    Menu: TUniMenuItems;
    mnuCadastros: TUniMenuItem;
    mnuMovimentacao: TUniMenuItem;
    mnuRelatorios: TUniMenuItem;
    mnuRelatorioFechamentoCaixa: TUniMenuItem;
    mnuRelatorioExtratoContas: TUniMenuItem;
    mnuGraficos: TUniMenuItem;
    mnuSuporte: TUniMenuItem;
    PnlLeft: TUniContainerPanel;
    TreeMenu: TUniTreeMenu;
    PnlLogo: TUniPanel;
    PnlConteudo: TUniContainerPanel;
    PagePrincipal: TUniPageControl;
    TabHome: TUniTabSheet;
    UniURLFrame1: TUniURLFrame;
    PnlTop: TUniContainerPanel;
    LblNotificacao: TUniLabel;
    LblDrawer: TUniLabel;
    LblLogo: TUniLabel;
    LblSistema: TUniLabel;
    PedidosWhats1: TUniMenuItem;
    ListadeVendas1: TUniMenuItem;
    ListaPedidos1: TUniMenuItem;
    Entregas1: TUniMenuItem;
    Entregadores1: TUniMenuItem;
    procedure LblLogoClick(Sender: TObject);
    procedure mnuMovimentacaoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function MainForm: TMainForm;

implementation

{$R *.dfm}

uses
  uniGUIVars, MainModule, uniGUIApplication;

function MainForm: TMainForm;
begin
  Result := TMainForm(UniMainModule.GetFormInstance(TMainForm));
end;

procedure TMainForm.LblLogoClick(Sender: TObject);
begin
 TreeMenu.Micro := not TreeMenu.Micro ;

 if TreeMenu.Micro then
    PnlLeft.Width := 44
 else
    PnlLeft.Width := 193 ;
end;

procedure TMainForm.mnuMovimentacaoClick(Sender: TObject);
begin
 ShowMessage('opção em desenvolvimento') ;
end;

initialization
  RegisterAppFormClass(TMainForm);

end.
