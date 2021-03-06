Unit ServerModule ;

Interface

Uses
  Misc_Def_U,
  Misc_Const_U,
  Misc_Type_U,
  System.JSON,
  Classes, Windows, SysUtils, Vcl.ExtCtrls,
  uniGUIServer,
  uniGUIMainModule, uniGUIApplication, uIdCustomHTTPServer,
  uniGUITypes,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef,
  FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client ;

Type
  TUniServerModule = class(TUniGUIServerModule)
    fd: TFDConnection ;
    query_login: TFDQuery ;
    query_loginid: TFDAutoIncField ;
    query_loginnome: TStringField ;
    query_loginusuario: TStringField ;
    query_loginsenha: TStringField ;
    query_loginnivel: TStringField ;
    query_forn: TFDQuery ;
    query_fornid: TFDAutoIncField ;
    query_fornnome: TStringField ;
    query_fornprodutos: TStringField ;
    query_forntelefone: TStringField ;
    query_fornendereco: TStringField ;
    query_produtos: TFDQuery ;
    query_produtosid: TFDAutoIncField ;
    query_produtosnome: TStringField ;
    query_produtosdescricao: TStringField ;
    query_produtosvalor: TBCDField ;
    query_produtosestoque: TIntegerField ;
    query_produtosid_fornecedor: TIntegerField ;
    query_produtosimagem: TStringField ;
    query_produtosnome_forn: TStringField ;
    query_gastos: TFDQuery ;
    query_gastosid: TFDAutoIncField ;
    query_gastosmotivo: TStringField ;
    query_gastosvalor: TBCDField ;
    query_gastosfuncionario: TStringField ;
    query_gastosdata: TDateField ;
    query_coringa: TFDQuery ;
    DS_Login: TDataSource ;
    Timer1: TTimer ;
    Procedure UniGUIServerModuleHTTPCommand(ARequestInfo: TIdHTTPRequestInfo;
              AResponseInfo: TIdHTTPResponseInfo; var Handled: Boolean) ;
    Procedure Timer1Timer(Sender: TObject) ;
    Procedure UniGUIServerModuleServerStartup(Sender: TObject) ;
    Procedure UniGUIServerModuleHTTPDocument(const Document: string;
              const InParams: TStrings; ARequestInfo: TIdHTTPRequestInfo;
              AResponseInfo: TIdHTTPResponseInfo; var Handled: Boolean) ;
    Procedure UniGUIServerModuleException(Sender: TUniGUIMainModule;
              AException: Exception; var Handled: Boolean) ;
    Procedure UniGUIServerModuleControlPanelLogin(ASession: TUniGUISession;
              const AUser, APassword: string; var LoginValid: Boolean;
              LoginAttempt: Integer) ;
    Procedure UniGUIServerModuleCreate(Sender: TObject) ;
    Procedure UniGUIServerModuleDestroy(Sender: TObject) ;
  Private
    { Private declarations }
  Protected
    Procedure FirstInit; override ;
  Public
    { Public declarations }
    Procedure EXEC_JS ( JS : String ) ;
    Function IS_LOGIN_OK ( Usuario, Senha : String ) : Boolean ;
    Procedure SAVE_LOG ;
    Procedure PUT_LOG ( Log: String) ;
    Procedure REFRESH_TIME ;
    Function EXECUTAR_LOGIN ( Usuario, Senha : String ) : Boolean ;
    Function VALIDAR_BOTAO_LOGIN ( Usuario, Senha : String ) : Boolean ;
  End ;

Function UniServerModule : TUniServerModule ;

Implementation

{$R *.dfm}

Uses UniGUIVars ,
     Misc_R ;

Function UniServerModule : TUniServerModule ;
Begin
Result := TUniServerModule(UniGUIServerInstance) ;
End ;

Function TUniServerModule.EXECUTAR_LOGIN ( Usuario, Senha : String ) : Boolean ;
Begin
global_usuario_user := Trim ( Usuario ) ;
global_usuario_senha := Trim ( Senha ) ;
If UniServerModule.IS_LOGIN_OK ( global_usuario_user, global_usuario_senha ) Then Begin
   Result := TRUE ;
End Else Begin
   global_usuario_user := '' ;
   global_usuario_nome2 := '' ;
   global_usuario_senha := '' ;
   global_usuario_id := '' ;
   global_usuario_Nivel := '' ;
   Result := FALSE ;
End ;
End ;

Function TUniServerModule.VALIDAR_BOTAO_LOGIN ( Usuario, Senha : String ) : Boolean ;
Begin
Result := ( Length ( Trim ( Usuario ) ) >= 3 ) AND
          ( Length ( Trim ( Senha ) ) >= 3 ) ;
{
If Result Then Begin
   UniServerModule.EXEC_JS (
       'globais.usuario.nome = document.getElementsByName("O2B")[0].value ;' +
   //    'globais.usuario.senha = document.getElementsByName("O27")[0].value ;' +
       'console.log ( "global_bot_login_ok", globais.usuario ) ;' ) ;
End ;
}
End ;

Procedure TUniServerModule.FirstInit ;
Begin
InitServerModule(Self) ;
End ;

Function TUniServerModule.IS_LOGIN_OK ( Usuario, Senha: String ) : Boolean;
Begin
Result := false ;
query_login.Close;
query_login.SQL.Clear;
query_login.SQL.Add('SELECT id, nome, senha, usuario, nivel from usuarios where usuario = :usuario and senha = :senha');
query_login.ParamByName('usuario').Value := Usuario ;
query_login.ParamByName('senha').Value := Senha ;
query_login.Open();
If NOT query_login.IsEmpty Then Begin
   //RECUPERAR OS DADOS DO USU?RIO LOGADO
   global_usuario_user := Usuario ;
   global_usuario_senha := Senha ;
   global_usuario_nome2 := query_login['nome'];
   global_usuario_id := query_login['id'];
   global_usuario_nivel := query_login['nivel'];
   //ABRIR PAGINA DO MENU
   //TFRMMENU.Create(webApplication).Show;
   Result := TRUE ;
End ;
End ;

Procedure TUniServerModule.UniGUIServerModuleControlPanelLogin(
          ASession: TUniGUISession; const AUser, APassword: string;
          var LoginValid: Boolean; LoginAttempt: Integer);
Begin
{
PUT_LOG ( '<SRC>SERV' +
          '<EVENT>UniGUIServerModuleControlPanelLogin' +
          '<AUSER>' + AUser +
          '<APASS>' + APassword ) ;
}
End ;


Procedure TUniServerModule.UniGUIServerModuleCreate(Sender: TObject) ;
Begin
REFRESH_TIME ;
End ;

Procedure TUniServerModule.UniGUIServerModuleDestroy(Sender: TObject) ;
Begin
DESTROY_BASICO ;
Inherited ;
End ;

Procedure TUniServerModule.UniGUIServerModuleException(
          Sender: TUniGUIMainModule; AException: Exception; var Handled: Boolean);
Var ExceptionStr : String ;
Begin
If AException.QualifiedClassName = 'uniGUIServer.EUniSessionException' Then Begin
   ExceptionStr := 'EUniSessionException' ;
   Handled := TRUE ;
End Else Begin
   ExceptionStr := 'INDEF' ;
End ;
PUT_LOG ( '<SRC>SERV' +
          '<EVENT>UniGUIServerModuleException' +
          '<EXCEPTION>' + AException.Message +
          '<CLASSNAME>' + AException.ClassName +
          '<QCLASSNAME>' + AException.QualifiedClassName +
          '<UNITNAME>' + AException.UnitName +
          '<ExceptionStr>' + ExceptionStr +
          '<UNITSCOPE>' + AException.UnitScope ) ;
End ;

Procedure TUniServerModule.UniGUIServerModuleHTTPCommand(
          ARequestInfo: TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo;
          var Handled: Boolean);
Var Aux       : String ;
    Params    : TStringList ;
    ParamsL   : String ;
    ParamsStr : String ;
    Comando   : String ;
    Funcao    : String ;
    Local     : Integer;
    objeto    : TJSONObject;
Begin
Aux := '<SRC>SERV' +
       '<EVENT>HTTPCommand' +
       '<DOC_REQ>' + ARequestInfo.Document +
       '<DOC_RES>' + AResponseInfo.ResponseText +
       '<MSG>' + ARequestInfo.Command ;
If Assigned ( ARequestInfo.Session ) Then Begin
   Aux := Aux + '<REQ_SESSION>' + ARequestInfo.Session.SessionID +
                '<REQ_REMOTEHOST>' + ARequestInfo.Session.RemoteHost +
                '<REQ_SESSION_STR>' + ARequestInfo.Session.ToString ;

End ;
If Assigned ( AResponseInfo.Session ) Then Begin
   Aux := Aux + '<RES_SESSION>' + AResponseInfo.Session.SessionID +
                '<RES_REMOTEHOST>' + AResponseInfo.Session.RemoteHost +
                '<RES_SESSION_STR>' + AResponseInfo.Session.ToString ;

End ;
Try
   Params := EXPLODE ( ARequestInfo.URI, '/' ) ;
   ParamsStr := '' ;
   If Params.Count >= 2 Then Begin
      Comando := Params[0] ;
      Funcao := Params[1] ;
   End Else Begin
      Comando := 'INDEF' ;
      Funcao := 'INDEF' ;
   End ;
   ParamsL := '' ;
   If Params.Count > 2 Then Begin
      For Local := 2 to Params.Count - 1 Do Begin
         ParamsStr := ParamsStr + '[' + IntToStr(Local-1) + ']' +
                      Params[Local] + ' ' ;
         If ParamsL <> '' Then Begin
            ParamsL := ParamsL + ',' ;
         End ;
         ParamsL := ParamsL + Params[Local] ;
      End ;
   End ;
   PUT_LOG ( Aux +
             '<URI>' + ARequestInfo.URI +
             '<COMANDO>' + Comando +
             '<FUNCAO>' + Funcao +
             '<URI2>' + ParamsStr ) ;
   If Comando = 'API' Then Begin
      Handled := TRUE ;
      objeto := TJSONObject.Create ;
      objeto.AddPair ('RETORNO_API' , FUNCAO ) ;
      objeto.AddPair ('PARAMS' , ParamsL ) ;
      objeto.AddPair ('NOW' , DateTimeToStr(Now) + '.' + StrZero ( GetTickCount MOD 1000, 3 ) ) ;
      AResponseInfo.ContentText := objeto.ToJSON ;
      {
      AResponseInfo.ContentText := 'RETORNO_API [' + FUNCAO + ']' + '<br>' +
                                   'PARAMS [' + ParamsL + ']' + '<br>' +
                                   DateTimeToStr(Now) + '.' +
                                   StrZero ( GetTickCount MOD 1000, 3 ) ;
      }
   End ;
Finally
   If Assigned ( Params ) Then Begin
      Params.Free ;
   End ;
End ;
End ;

Procedure TUniServerModule.UniGUIServerModuleHTTPDocument(
          const Document: string; const InParams: TStrings;
          ARequestInfo: TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo;
          var Handled: Boolean);
Begin
(*
PUT_LOG ( '<SRC>SERV' +
          '<EVENT>UniGUIServerModuleHTTPDocument' +
          '<DOC>' + Document +
          '<PARAMS>' + InParams.Text ) ;
*)
End ;

Procedure TUniServerModule.UniGUIServerModuleServerStartup(Sender: TObject) ;
Begin
PUT_LOG ( '<SRC>SERV' +
          '<EVENT>UniGUIServerModuleServerStartup' ) ;
End ;

Procedure TUniServerModule.EXEC_JS ( JS : String ) ;
Begin
UniSession.AddJS ( JS ) ;
End ;

Procedure TUniServerModule.SAVE_LOG ;
Var Logs2 : TStringList ;
Begin
If NOT Assigned ( Logs ) Then Begin
   Exit ;
End ;
Logs2 := TStringList.Create ;
Try
   If FileExists ( FN_LOG ) then Begin
      Logs2.LoadFromFile ( FN_Log ) ;
   End;
Except
End ;
Logs2.AddStrings ( Logs ) ;
Try
   Logs2.SaveToFile ( FN_Log ) ;
Finally
   Logs2.Free ;
   Logs.Clear ;
End ;
Tick_Put_Log := GetTickCount + 1000 ;
End ;

Procedure TUniServerModule.Timer1Timer(Sender: TObject) ;
Begin
If Assigned ( Logs ) Then Begin
   If Logs.Count > 0 Then Begin
      If GetTickCount > Tick_Put_Log Then Begin
         SAVE_LOG ;
      End ;
   End ;
End;
REFRESH_TIME ;
End ;

Procedure TUniServerModule.PUT_LOG ( Log : String ) ;
Begin
If NOT Setup.Put_Log Then Begin
   Exit ;
End ;
If NOT Assigned ( Logs ) Then Begin
   Exit ;
End ;
Logs.Add ( '<DT>' + DateTimeToStr ( Now ) + Log ) ;
If GetTickCount > Tick_Put_Log Then Begin
   SAVE_LOG ;
End;
End ;

Procedure TUniServerModule.REFRESH_TIME ;
Begin
CustomMeta.Text :=
    '<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">' + sLineBreak +
    '<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>' + sLineBreak +
    '<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>' + sLineBreak +
    '<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>' + sLineBreak +
    '<link rel=stylesheet href="/css/styles.css?&time=' + IntToStr(GetTickCount) + '" />' + sLineBreak +
    '<link rel=stylesheet href="/css/styles_BAD.css?&time=' + IntToStr(GetTickCount) + '" />' + sLineBreak ;
End ;

Initialization
RegisterServerModuleClass(TUniServerModule) ;
ForceDirectories ( '.\Logs' ) ;
Logs := TStringList.Create ;
FN_Log := '.\Logs\Log.txt' ;
SetLength ( Sessoes, 0 ) ;
Setup.Put_Log := TRUE ;
UniServerModule.PUT_LOG ( '<SRC>SERV<EVENT>INIT' ) ;
End.

