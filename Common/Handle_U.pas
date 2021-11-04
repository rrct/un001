Unit Handle_U ;

Interface

Uses Misc_Def_U, Misc_Const_U, Misc_Type_U, Misc_U,
     IniFiles,
     Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
     Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls,
     Vcl.ExtCtrls, Vcl.Buttons, System.Win.ScktComp, Vcl.Menus ;

Procedure Ext_HandlerProcedure(Sender: TObject; E: Exception) ;

Implementation

Procedure Ext_HandlerProcedure(Sender: TObject; E: Exception) ;
Var Local : LongInt ;
Begin
If Pos ( 'socket error 10049' , E.Message ) > 0 Then
   Begin
   End
Else If Pos ( 'socket error 10053' , E.Message ) > 0 Then
   Begin
   End
Else If Pos ( 'socket error 10055' , E.Message ) > 0 Then
   Begin
   End
Else If Pos ( 'socket error 10060' , E.Message ) > 0 Then
   Begin
   End
Else If Pos ( 'socket error 10061' , E.Message ) > 0 Then
   Begin
   End
Else If Pos ( '(10049)' , E.Message ) > 0 Then
   Begin
   End
Else If Pos ( '(10053)' , E.Message ) > 0 Then
   Begin
   End
Else If Pos ( '(10055)' , E.Message ) > 0 Then
   Begin
   End
Else If Pos ( '(10060)' , E.Message ) > 0 Then
   Begin
   End
Else If Pos ( '(10061)' , E.Message ) > 0 Then
   Begin
   End
Else
   Begin
   //RESTART ;
   ShowMessage_Old ('Exceção RRCT' + #13#10 + E.Message ) ;
   End ;
//Inc ( Cnt_Excecoes ) ;
PUT_LOG ( 'HandlerProc [' + E.Message + ']' ) ;
If SL_Debug_RR.Count > 0 Then
   For Local := 0 To SL_Debug_RR.Count - 1 Do
      PUT_LOG ( 'HandlerProc/For [' + SL_Debug_RR[Local] + ']' ) ;
End ;

End.
