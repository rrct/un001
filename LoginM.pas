unit LoginM;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUImClasses, uniGUIRegClasses, uniGUIForm, uniGUImForm, uniGUImJSForm;

type
  TUnimLoginForm2 = class(TUnimLoginForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function UnimLoginForm2: TUnimLoginForm2;

implementation

{$R *.dfm}

uses
  uniGUIVars, MainModule, uniGUIApplication;

function UnimLoginForm2: TUnimLoginForm2;
begin
  Result := TUnimLoginForm2(UniMainModule.GetFormInstance(TUnimLoginForm2));
end;

initialization
  RegisterAppFormClass(TUnimLoginForm2);

end.
