Unit Socket_U ;

Interface

Uses Misc_Const_U, Misc_Def_U, Misc_Type_U,
     Misc_1, Misc_GC, Misc_U,
     //RXCtrls ,
     RSS_U, CCH_U, GC_U, FolderMon,
     Espelho_RD_U, Espelho_RD_Def_U,
     IniFiles,
     ShellAPI,
     Winapi.Windows, Winapi.Messages,
     System.SysUtils, System.Variants, System.Classes,
     Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
     System.Win.ScktComp, Vcl.ComCtrls, Vcl.StdCtrls;

Type
  TSocket = Class(TForm)
    Servidor: TServerSocket;
    Cliente: TClientSocket;
    Cliente_Log: TClientSocket;
    Procedure SOCKET_ABRIR_CLIENTE ( Host : String ; Porta : LongInt ) ;
    Procedure SOCKET_ABRIR_SERVIDOR ( Porta : LongInt ) ;
    Procedure SOCKET_CARREGAR_PARAMETROS_SERVIDOR ;
    Procedure SOCKET_CARREGAR_PARAMETROS_CLIENTE ;
    Procedure SOCKET_CARREGAR_PARAMETROS_CLIENTE_LOG ;
    Procedure SOCKET_LOG_SERVIDOR ( Aux : String ) ;
    Procedure SOCKET_LOG_CLIENTE ( Sender: TObject ; Aux : String ) ;
    Procedure SOCKET_CLIENTE_SEND ( Aux : String ) ;
    Procedure SOCKET_SERVIDOR_SEND ( Aux : String ) ;
    Procedure SOCKET_SEND ( Socket : TCustomWinSocket ; Aux : String ) ;
    Procedure SOCKET_SEND_CLIENTE ( Aux : String ) ;
    Procedure SOCKET_SEND_CLIENTE_LF ( Aux : String ) ;
    procedure ServidorAccept(Sender: TObject; Socket: TCustomWinSocket);
    procedure ServidorClientConnect(Sender: TObject; Socket: TCustomWinSocket);
    procedure ServidorClientDisconnect(Sender: TObject;
              Socket: TCustomWinSocket);
    procedure ServidorClientError(Sender: TObject; Socket: TCustomWinSocket;
              ErrorEvent: TErrorEvent; var ErrorCode: Integer);
    procedure ServidorClientRead(Sender: TObject; Socket: TCustomWinSocket);
    procedure ServidorListen(Sender: TObject; Socket: TCustomWinSocket);
    procedure ClienteConnect(Sender: TObject; Socket: TCustomWinSocket);
    procedure ClienteError(Sender: TObject; Socket: TCustomWinSocket;
              ErrorEvent: TErrorEvent; var ErrorCode: Integer);
    procedure ClienteRead(Sender: TObject; Socket: TCustomWinSocket);
    procedure Cliente_LogConnect(Sender: TObject; Socket: TCustomWinSocket);
    procedure Cliente_LogError(Sender: TObject; Socket: TCustomWinSocket;
      ErrorEvent: TErrorEvent; var ErrorCode: Integer);
    procedure Cliente_LogRead(Sender: TObject; Socket: TCustomWinSocket);
 Private
    { Private declarations }
  Public
    { Public declarations }
  End ;

Var Socket : TSocket ;

Implementation

{$R *.dfm}

Uses Log_U ,
     Main ;

Procedure TSocket.SOCKET_CARREGAR_PARAMETROS_SERVIDOR ;
Var AuxL : LongInt ;
Begin
AuxL := CARREGAR_INTEGER ( '', 'SOCKET', 'SERVIDOR_PORTA', -1 ) ;
If AuxL = -1 Then Begin
   AuxL := 0 ;
   SALVAR_INTEGER ( '', 'SOCKET', 'SERVIDOR_PORTA', AuxL ) ;
End ;
Socket_Servidor_Porta := AuxL ;
End ;

Procedure TSocket.SOCKET_CARREGAR_PARAMETROS_CLIENTE ;
Var Aux  : String ;
    AuxL : LongInt ;
Begin
Aux := CARREGAR_STRING ( '', 'SOCKET', 'CLIENTE_HOST', '-' ) ;
If Aux = '-' Then Begin
   Aux := '' ;
   SALVAR_STRING ( '', 'SOCKET', 'CLIENTE_HOST', Aux ) ;
End ;
Socket_Cliente_Host := Aux ;
AuxL := CARREGAR_INTEGER ( '', 'SOCKET', 'CLIENTE_PORTA', -1 ) ;
If AuxL = -1 Then Begin
   AuxL := 0 ;
   SALVAR_INTEGER ( '', 'SOCKET', 'CLIENTE_PORTA', AuxL ) ;
End ;
Socket_Cliente_Porta := AuxL ;
End ;

Procedure TSocket.SOCKET_CARREGAR_PARAMETROS_CLIENTE_LOG ;
Var Aux  : String ;
    AuxL : LongInt ;
Begin
Aux := CARREGAR_STRING ( '', 'SOCKET', 'CLIENTE_LOG_HOST', '-' ) ;
If Aux = '-' Then Begin
   Aux := '' ;
   SALVAR_STRING ( '', 'SOCKET', 'CLIENTE_LOG_HOST', Aux ) ;
End ;
Socket_Cliente_Log_Host := Aux ;
AuxL := CARREGAR_INTEGER ( '', 'SOCKET', 'CLIENTE_LOG_PORTA', -1 ) ;
If AuxL = -1 Then Begin
   AuxL := 0 ;
   SALVAR_INTEGER ( '', 'SOCKET', 'CLIENTE_LOG_PORTA', AuxL ) ;
End ;
Socket_Cliente_Log_Porta := AuxL ;
End ;

Procedure TSocket.SOCKET_ABRIR_CLIENTE ( Host : String ; Porta : LongInt ) ;
Var Tick : Cardinal ;
Begin
Try
   If ( Host <> '' ) AND ( Porta > 0 ) Then Begin
      Socket_Cliente_Host := Host ;
      Socket_Cliente_Porta := Porta ;
   End Else Begin
      SOCKET_CARREGAR_PARAMETROS_CLIENTE ;
   End ;
   If Cliente.Active Then Begin
      Cliente.Close ;
   End ;
   If Socket_Cliente_Host = '' Then Begin
      Exit ;
   End ;
   If Socket_Cliente_Porta = 0 Then Begin
      Exit ;
   End ;
   Cliente.Host := Socket_Cliente_Host ;
   Cliente.Port := Socket_Cliente_Porta ;
   Cliente.Open ;
   Tick := GetTickCount + 2000 ;
   While Tick > GetTickCount Do Begin
      Sleep ( 100 ) ;
      Application.ProcessMessages ;
      If Cliente.Active Then Begin
         Break ;
      End ;
   End ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Excetion ABRIR CLIENTE ' +
                '[' + Socket_Cliente_Host + ':' +
                IntToStr ( Socket_Cliente_Porta ) + ']' +
                '[' + E.Message + ']' ) ;
   End ;
End ;
End ;

Procedure TSocket.SOCKET_ABRIR_SERVIDOR ( Porta : LongInt ) ;
Begin
Try
   If Porta > 0 Then Begin
      Socket_Servidor_Porta := Porta ;
   End Else Begin
      SOCKET_CARREGAR_PARAMETROS_SERVIDOR ;
   End ;
   If Servidor.Active Then Begin
      Servidor.Close ;
   End ;
   If Socket_Servidor_Porta = 0 Then Begin
      Exit ;
   End ;
   Servidor.Port := Socket_Servidor_Porta ;
   Servidor.Open ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Excetion ABRIR SERVIDOR ' +
                '[' + IntToStr ( Socket_Servidor_Porta ) + ']' +
                '[' + E.Message + ']' ) ;
   End ;
End ;
End ;

Procedure TSocket.SOCKET_LOG_CLIENTE ( Sender: TObject ; Aux : String ) ;
Var Local : LongInt ;
Begin
If Sender = Cliente Then Begin
   Aux := '[CLIENTE] ' + Aux ;
End Else If Sender = Cliente_Log Then Begin
   Aux := '[CLIENTE_LOG] ' + Aux ;
End ;
While Log_LB_Socket_Cliente_Count > 1000 Do Begin
   For Local := 0 To 500 Do Begin
      Log.LB_Cliente.Items.Delete(0) ;
   End ;
   Log_LB_Socket_Cliente_Count := Log.LB_Cliente.Items.Count ;
End ;
Inc ( Log_LB_Socket_Cliente_Count ) ;
Log.LB_Cliente.Items.Add ( Aux + ' [' + IntToStr(Log_LB_Socket_Servidor_Count) + ']' ) ;
Log.LB_Cliente.ItemIndex := Log_LB_Socket_Cliente_Count - 1 ;
Log.SB_Cliente.SimpleText := Trim ( Aux ) ;
End ;

Procedure TSocket.SOCKET_LOG_SERVIDOR ( Aux : String ) ;
Var Local : LongInt ;
Begin
While Log_LB_Socket_Servidor_Count > 1000 Do Begin
   For Local := 0 To 500 Do Begin
      Log.LB_Servidor.Items.Delete(0) ;
   End ;
   Log_LB_Socket_Servidor_Count := Log.LB_Servidor.Items.Count ;
End ;
Inc ( Log_LB_Socket_Servidor_Count ) ;
Log.LB_Servidor.Items.Add ( Aux + ' [' + IntToStr(Log_LB_Socket_Servidor_Count) + ']' ) ;
Log.LB_Servidor.ItemIndex := Log_LB_Socket_Servidor_Count - 1 ;
Log.SB_Servidor.SimpleText := Trim ( Aux ) ;
End ;

procedure TSocket.ClienteConnect(Sender: TObject; Socket: TCustomWinSocket);
Var Aux : String ;
Begin
Aux := 'Cliente Connect [' + Socket.RemoteHost + ':' +
       IntToStr ( Socket.RemotePort ) + ']' ;
SOCKET_LOG_CLIENTE ( Sender, Aux ) ;
end;

procedure TSocket.ClienteError(Sender: TObject; Socket: TCustomWinSocket;
  ErrorEvent: TErrorEvent; var ErrorCode: Integer);
Var Aux : String ;
Begin
Aux := 'Cliente Erro/1 [' + IntToStr ( ErrorCode ) + '][' +
       Cliente.Host + ':' + IntToStr ( Cliente.Port ) + ']' ;
SOCKET_LOG_CLIENTE ( Sender, Aux ) ;
ErrorCode := 0 ;
end;

procedure TSocket.ClienteRead(Sender: TObject; Socket: TCustomWinSocket);
Var Str : String ;
    Aux : String ;
begin
Str := Socket.ReceiveText ;
Aux := 'Cliente Read [' + Str + ']' ;
SOCKET_LOG_CLIENTE ( Sender, Aux ) ;
//Main.TRATAR_PACOTE_SOCKET_SERVIDOR ( Socket, Str ) ;
end;

procedure TSocket.Cliente_LogConnect(Sender: TObject; Socket: TCustomWinSocket);
Var Aux : String ;
Begin
Aux := 'Cliente_Log Connect [' + Socket.RemoteHost + ':' +
       IntToStr ( Socket.RemotePort ) + ']' ;
SOCKET_LOG_CLIENTE ( Sender, Aux ) ;
end;

procedure TSocket.Cliente_LogError(Sender: TObject; Socket: TCustomWinSocket;
  ErrorEvent: TErrorEvent; var ErrorCode: Integer);
Var Aux : String ;
Begin
Aux := 'Cliente_Log Erro/1 [' + IntToStr ( ErrorCode ) + '][' +
       Cliente.Host + ':' + IntToStr ( Cliente.Port ) + ']' ;
SOCKET_LOG_CLIENTE ( Sender, Aux ) ;
ErrorCode := 0 ;
end;

procedure TSocket.Cliente_LogRead(Sender: TObject; Socket: TCustomWinSocket);
Var Str : String ;
    Aux : String ;
begin
Str := Socket.ReceiveText ;
Aux := 'Cliente_Log Read [' + Str + ']' ;
SOCKET_LOG_CLIENTE ( Sender, Aux ) ;
end;

Procedure TSocket.SOCKET_CLIENTE_SEND ( Aux : String ) ;
Begin
Try
   If NOT Cliente.Active Then Begin
      PUT_LOG ( 'RECONECTANDO POR CONEX?O INATIVA' ) ;
      SOCKET_ABRIR_CLIENTE ( '', 0 ) ;
   End ;
   Cliente.Socket.SendText ( Aux ) ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception SOCKET CLIENTE SEND [' + Trim(Aux) + ']' +
                '[' + E.Message + ']' ) ;
   End ;
End ;
End ;

Procedure TSocket.SOCKET_SERVIDOR_SEND ( Aux : String ) ;
Var Qtde  : LongInt ;
    Local : LongInt ;
Begin
Qtde := Servidor.Socket.ActiveConnections ;
If Qtde = 0 Then Begin
   Exit ;
End ;
For Local := 0 To Qtde - 1 Do Begin
    Try
       Servidor.Socket.Connections[Local].SendText ( Aux ) ;
    Except
       On E : Exception Do Begin
          PUT_LOG ( 'Exception SOCKET SERVIDOR SEND [' + Trim(Aux) + ']' +
                    '[' + E.Message + ']' ) ;
       End ;
    End ;
End ;
End ;

procedure TSocket.ServidorAccept(Sender: TObject; Socket: TCustomWinSocket);
Var Aux : String ;
begin
_Debug ( 'INI Servidor Accept' ) ;
Aux := 'Servidor Accept [' +
       Socket.RemoteAddress + ':' +
       IntToStr ( Socket.RemotePort ) + ']' ;
SOCKET_LOG_SERVIDOR ( Aux ) ;
_Debug ( 'FIM Servidor Accept' ) ;
end;

procedure TSocket.ServidorClientConnect(Sender: TObject;
  Socket: TCustomWinSocket);
Var Aux : String ;
begin
_Debug ( 'INI Servidor Connect' ) ;
Aux := 'Servidor Connect [' + Socket.RemoteAddress + ':' +
       IntToStr(Socket.RemotePort) + ']' ;
SOCKET_LOG_SERVIDOR ( Aux ) ;
_Debug ( 'FIM Servidor Connect' ) ;
end;

procedure TSocket.ServidorClientDisconnect(Sender: TObject;
  Socket: TCustomWinSocket);
Var Aux : String ;
begin
_Debug ( 'INI Servidor Disconnect' ) ;
Aux := 'Servidor Disconnect' ;
SOCKET_LOG_SERVIDOR ( Aux ) ;
_Debug ( 'FIM Servidor Disconnect' ) ;
end;

procedure TSocket.ServidorClientError(Sender: TObject; Socket: TCustomWinSocket;
  ErrorEvent: TErrorEvent; var ErrorCode: Integer);
Var Aux : String ;
begin
_Debug ( 'INI Servidor Error' ) ;
Aux := 'Servidor Error [' + IntToStr ( ErrorCode ) + ']' ;
SOCKET_LOG_SERVIDOR ( Aux ) ;
ErrorCode := 0 ;
_Debug ( 'FIM Servidor Error' ) ;
end;

procedure TSocket.ServidorClientRead(Sender: TObject; Socket: TCustomWinSocket);
Var Aux : String ;
    Str : String ;
begin
_Debug ( 'INI Servidor Read' ) ;
Str := Socket.ReceiveText ;
Aux := 'Servidor Read [' + Trim ( Str ) + ']' ;
SOCKET_LOG_SERVIDOR ( Aux ) ;
//Main.TRATAR_PACOTE_SOCKET_SERVIDOR ( Socket, Str ) ;
_Debug ( 'FIM Servidor Read' ) ;
end;

procedure TSocket.ServidorListen(Sender: TObject; Socket: TCustomWinSocket);
Var Aux : String ;
begin
_Debug ( 'INI Servidor Listen' ) ;
Aux := 'Servidor Listen [' + IntToStr ( Servidor.Port ) + ']' ;
SOCKET_LOG_SERVIDOR ( Aux ) ;
_Debug ( 'FIM Servidor Listen' ) ;
end;

Procedure TSocket.SOCKET_SEND ( Socket : TCustomWinSocket ; Aux : String ) ;
Begin
Socket.SendText ( Aux ) ;
SOCKET_LOG_SERVIDOR ( 'TX/' + Aux ) ;
End ;

Procedure TSocket.SOCKET_SEND_CLIENTE ( Aux : String ) ;
Begin
If NOT Cliente.Active Then Begin
   Exit ;
End ;
Try
   Cliente.Socket.SendText ( Aux ) ;
   SOCKET_LOG_SERVIDOR ( 'TX/CLI/' + Aux ) ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception SOCKET_SEND_CLIENTE [' + E.Message + '][' + Aux + ']' ) ;
   End ;
End ;
End ;

Procedure TSocket.SOCKET_SEND_CLIENTE_LF ( Aux : String ) ;
Begin
If NOT Cliente.Active Then Begin
   Exit ;
End ;
Try
   Cliente.Socket.SendText ( Aux ) ;
   SOCKET_LOG_SERVIDOR ( 'TX/CLI_LF/' + Aux ) ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception SOCKET_SEND_CLIENTE [' + E.Message + '][' + Aux + ']' ) ;
   End ;
End ;
End ;

End.
