Unit MainModule ;

Interface

Uses uniGUIMainModule, SysUtils, Classes ;

Type
  TUniMainModule = class(TUniGUIMainModule)
    Procedure UniGUIMainModuleNewComponent(AComponent: TComponent) ;
    Procedure UniGUIMainModuleHandleRequest(ASession: TObject ;
              var Handled : Boolean) ;
  Private
    { Private declarations }
  Public
    { Public declarations }
  End ;

Function UniMainModule : TUniMainModule ;

Implementation

{$R *.dfm}

Uses UniGUIVars, ServerModule, uniGUIApplication ;

Function UniMainModule: TUniMainModule ;
Begin
Result := TUniMainModule(UniApplication.UniMainModule) ;
End ;

Procedure TUniMainModule.UniGUIMainModuleHandleRequest ( ASession : TObject ;
          var Handled : Boolean ) ;
Begin
UniServerModule.PUT_LOG ( '<SRC>TUniMainModule' +
                          '<EVENT>' + 'UniGUIMainModuleHandleRequest' +
                          '<SESSION>' + (ASession As TUniGUISession).SessionId ) ;
End ;

Procedure TUniMainModule.UniGUIMainModuleNewComponent(AComponent: TComponent) ;
Begin
{
UniServerModule.PUT_LOG ( '<SRC>TUniMainModule' +
                          '<EVENT>' + 'UniGUIMainModuleNewComponent' +
                          '<COMPONENT>' + AComponent.Name ) ;
}
End ;

Initialization
RegisterMainModuleClass ( TUniMainModule ) ;
End.

