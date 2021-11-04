Unit UDP_Ux ;

Interface

Uses Misc_Def_U, Misc_Const_U, Misc_Type_U,
     //RxClock,
     Math, IniFiles, ClipBrd,
     Log_U, View_ME_U,
     Winapi.Windows, pngImage,
     System.SysUtils, System.Variants, System.Threading,
     System.Classes, Vcl.Controls,
     Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Samples.Spin, Vcl.Forms, Vcl.Menus,
     Vcl.Grids, Vcl.Dialogs, Vcl.Graphics, Vcl.ExtCtrls, Vcl.Mask,
     IdUDPBase, IdUDPServer, IdGlobal, IdSocketHandle ;

Type
   T_UDP = class(Vcl.StdCtrls.TLabel)
   Private
   Public
     Var UDP_Server            : TIdUDPServer ;
         Qtde_Conexoes         : LongInt ;
         Conexoes              : Array Of T_Conexoes_UDP ;
         Last_RX               : String ;
         Last_Lista            : TStringList ;

     Constructor Create ( _Form : TForm ; Porta : LongInt ) ;
     Procedure ADD_CONEXAO ( IP : String ; Porta : LongInt ; Dado : String ) ;
     Function PUT_CONEXAO ( IP : String ; Porta : LongInt ; Dado : String ) : Boolean ;
     Procedure LISTAR_CONEXOES ;
     Procedure PROC_ON_UDP_READ ( AThread : TIdUDPListenerThread ;
                      const AData : TIdBytes ; ABinding : TIdSocketHandle ) ;
   End ;

Implementation

Uses Misc_U ;

Constructor T_UDP.Create ( _Form : TForm ; Porta : LongInt ) ;
Begin
Inherited Create ( _Form ) ;
//
UDP_Server := TIdUDPServer.Create ( _Form ) ;
UDP_Server.BroadcastEnabled := TRUE ;
UDP_Server.DefaultPort := Porta ;
UDP_Server.OnUDPRead := PROC_ON_UDP_READ ;
With UDP_Server.Bindings.Add Do Begin
   IP := '0.0.0.0' ;
   Port := UDP_Server.DefaultPort ;
End ;
UDP_Server.Active := TRUE ;
Qtde_Conexoes := 0 ;
SetLength ( Conexoes, Qtde_Conexoes ) ;
Last_RX := '' ;
Last_Lista := TStringList.Create ;
End ;

Procedure T_UDP.ADD_CONEXAO ( IP : String ; Porta : LongInt ; Dado : String ) ;
Begin
Inc ( Qtde_Conexoes ) ;
SetLength ( Conexoes, Qtde_Conexoes ) ;
Conexoes[Qtde_Conexoes-1].IP := IP ;
Conexoes[Qtde_Conexoes-1].Porta := Porta ;
Conexoes[Qtde_Conexoes-1].Last_Ping := GetTickCount ;
Conexoes[Qtde_Conexoes-1].Last_Pacote := Dado ;
End ;

Function T_UDP.PUT_CONEXAO ( IP : String ; Porta : LongInt ; Dado : String ) : Boolean ;
Var Local : LongInt ;
Begin
If Qtde_Conexoes > 0 Then Begin
   For Local := 0 To Qtde_Conexoes - 1 Do Begin
      If ( Conexoes[Local].IP = IP ) AND
         ( Conexoes[Local].Porta = Porta ) Then Begin
         Result := FALSE ;
         Exit ;
      End ;
   End ;
End ;
Result := TRUE ;
ADD_CONEXAO ( IP, Porta, Dado ) ;
End ;

Procedure T_UDP.LISTAR_CONEXOES ;
Var Local : LongInt ;
Begin
If Qtde_Conexoes = 0 Then Begin
   PUT_LOG ( 'UDP LISTAR_CONEXOES [Nenhuma]' ) ;
End ;
PUT_LOG ( 'UDP LISTAR_CONEXOES [Qtde=' + IntToStr(Qtde_Conexoes) + ']' ) ;
For Local := 0 To Qtde_Conexoes - 1 Do Begin
   PUT_LOG ( 'UDP PRINT [' + Conexoes[Local].IP + ':' + IntToStr(Conexoes[Local].Porta) + ']' ) ;
End ;
End ;

Procedure T_UDP.PROC_ON_UDP_READ ( AThread : TIdUDPListenerThread ;
                      const AData : TIdBytes ; ABinding : TIdSocketHandle ) ;
Var Texto : String ;
begin
If Application.Terminated Then Begin
   Exit ;
End ;
If SAIA Then Begin
   Exit ;
End ;
Try
   Texto := BytesToString ( AData ) ;
   Last_RX := Texto ;
   Last_Lista := Explode_Simples ( Texto, '@@@' ) ;
   //PUT_LOG ( 'UDP READ [' + Texto + ']' +
   //          '[' + ABinding.PeerIP + '][' + IntToStr(ABinding.PeerPort) + ']' ) ;
   If Trim ( UpperCase ( Texto ) ) = 'PRINT' Then Begin
      LISTAR_CONEXOES ;
   End ;
   If PUT_CONEXAO ( ABinding.PeerIP, ABinding.PeerPort, Texto ) Then Begin
      //PUT_LOG ( 'UDP ADD_CONEXAO [' + Texto + ']' +
      //          '[' + ABinding.PeerIP + '][' + IntToStr(ABinding.PeerPort) + ']' ) ;
      //LISTAR_CONEXOES ;
   End Else Begin
      //PUT_LOG ( 'UDP NAO ADD_CONEXAO [' + Texto + ']' +
      //          '[' + ABinding.PeerIP + '][' + IntToStr(ABinding.PeerPort) + ']' ) ;
   End ;
   If Texto <> '' Then Begin
      If Texto[1]='*' Then Begin
         ABinding.SendTo(ABinding.PeerIP, ABinding.PeerPort, DateToStr(Now), ABinding.IPVersion) ;
      End ;
   End ;
Except
End ;
End ;

End.

