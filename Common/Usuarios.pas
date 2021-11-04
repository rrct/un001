unit Usuarios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIForm, uniGUIBaseClasses, uniBasicGrid, uniDBGrid,
  uniButton, uniDBNavigator;

type
  TFRM_USUARIOS = class(TUniForm)
    UniDBGrid1: TUniDBGrid;
    UniDBNavigator1: TUniDBNavigator;
    BOT_FECHAR: TUniButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function FRM_USUARIOS: TFRM_USUARIOS;

implementation

{$R *.dfm}

uses
  MainModule, uniGUIApplication, ServerModule;

function FRM_USUARIOS: TFRM_USUARIOS;
begin
  Result := TFRM_USUARIOS(UniMainModule.GetFormInstance(TFRM_USUARIOS));
end;

end.
