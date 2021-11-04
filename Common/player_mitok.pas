unit player_mitok;

interface

Uses
  Misc_Def_U, Misc_Const_U, Misc_Type_U,
  Math, Misc_U, Log_U,
  Winapi.Windows, Winapi.Messages, System.SysUtils,
  System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls ;

Var  SL_Erros_Mitok : TStringList ;

Procedure MITOK_TOGGLE_FULLSCREEN ( Indice : LongInt ) ;
Procedure MITOK_LOAD ( Indice : LongInt ; FN : String ; PN : TPanel ; ED : TEdit ) ;
procedure MITOK_TakeSnapShot(Path: String; width, height : Integer);
Procedure MITOK_Get_AdjustVideo ;
Procedure MITOK_AdjustVideo ( Flag_Ajustar: Integer ;
                            Contrast: Double; Brightness : Double; Hue : Double;
                            Saturation : Double; Gamma : Double) ;
Procedure MITOK_PAUSE ( Indice : LongInt ) ;
Function MITOK_GET_STATE ( Indice : LongInt ) : LongInt ; // Tipo_State ;
Function MITOK_GET_STATE_INT ( Indice : LongInt ) : LongInt ;
Procedure MITOK_SET_PAUSE ( Indice : LongInt ; Pausa : LongInt ) ;
Function MITOK_SET_VOLUME ( Indice : LongInt ; Volume : Integer ) : Integer ;
Procedure MITOK_PLAY ( Indice : LongInt ) ;
Function MITOK_WILL_PLAY ( Indice : LongInt ) : Boolean ;
Function MITOK_CAN_PAUSE ( Indice : LongInt ) : Boolean ;
Procedure MITOK_AUDIO_TOGGLE_MUTE ( Indice : LongInt ) ;
Procedure MITOK_AUDIO_SET_MUTE ( Indice : LongInt ; Mute : Boolean ) ;
Procedure MITOK_AUDIO_SET_DELAY ( Indice : LongInt ; Delay : Int64 ) ;
Procedure MITOK_STOP ( Indice : LongInt ) ;
Procedure MITOK_NEXT_FRAME ( Indice : LongInt ) ;
Procedure MITOK_PREVIOUS_FRAME ( Indice : LongInt ) ;
Function MITOK_GET_TIME : LongInt ;
Function MITOK_GET_DURACAO : LongInt ;
Procedure MITOK_SET_RATE ( Indice : LongInt ; Rate : Double ) ;
Function MITOK_GET_RATE ( Indice : LongInt ) : Double;
Function MITOK_GET_VERSION : String ;
Function MITOK_GET_COMPILER : String ;
Procedure MITOK_SET_TIME ( _Time : Int64 ) ;
Procedure MITOK_SET_POSITION ( Indice : LongInt ; Posicao : LongInt ) ;
Procedure MITOK_SET_POSITION_PERCENTUAL ( Indice : LongInt ; _Double : Double ) ;
Function MITOK_IS_PLAYING : Boolean ;
Procedure MITOK_FRAME_MENOS ( Frames : LongInt ) ;
Procedure MITOK_FRAME_MAIS ( Frames : LongInt ) ;
Function MITOK_GET_CODEC : String ;
Function MITOK_GET_FRAME_ATUAL : LongInt ;
Function MITOK_GET_FRAME_TOTAL : LongInt ;
Function MITOK_GET_TIME_TOTAL : LongInt ;
Function MITOK_IS_OK : Boolean ;
Procedure MITOK_DISABLE ;

Implementation

Procedure MITOK_FRAME_MENOS ( Frames : LongInt ) ;
Var Destino : LongInt ;
Begin
If NOT MITOK_IS_OK Then
   Begin
   PUT_LOG ( 'Exit NOT MITOK_IS_OK MITOK_FRAME_MENOS' ) ;
   Exit ;
   End ;
Try
   Destino := Max ( 0 , MITOK_GET_TIME - 33 * Frames ) ;
   //MP_SET_TIME ( IDX, Destino ) ;
   //MP_PREPARE ( IDX ) ;
   MITOK_SET_TIME ( Destino ) ;
   //MP_PLAY_PAUSE ( IDX ) ;
   //MP_PAUSE ( IDX ) ;
   //MP_PAUSE ( IDX ) ;
   Except
   On E : Exception Do
      Begin
      ShowMessage ( 'Exception MITOK_FRAME_MENOS' + sLineBreak + E.Message ) ;
      End ;
   End ;
End ;

Procedure MITOK_FRAME_MAIS ( Frames : LongInt ) ;
Var Destino : LongInt ;
Begin
If NOT MITOK_IS_OK Then
   Begin
   PUT_LOG ( 'Exit NOT MITOK_IS_OK MITOK_FRAME_MAIS' ) ;
   Exit ;
   End ;
Try
   Destino := Min ( MITOK_GET_TIME + 33 * Frames , MITOK_GET_DURACAO ) ;
   //MP_SET_TIME ( IDX, Destino ) ;
   //MP_PREPARE ( IDX ) ;
   MITOK_SET_TIME ( Destino ) ;
   //MP_PLAY_PAUSE ( IDX ) ;
   //MP_PAUSE ( IDX ) ;
   //MP_PAUSE ( IDX ) ;
   Except
   On E : Exception Do
      Begin
      ShowMessage ( 'Exception MITOK_FRAME_MAIS' + sLineBreak + E.Message ) ;
      End ;
   End ;
End ;

Procedure MITOK_PUT_ERRO_SL ( Erro : String ) ;
Begin
SL_Erros_Mitok.Add ( 'MITOK: ' + Erro ) ;
End ;

Procedure Mitok_TakeSnapShot (Path: String; width, height : Integer) ;
// take a snapshot
Begin
If NOT MITOK_IS_OK Then
   Begin
   PUT_LOG ( 'Exit NOT MITOK_IS_OK Mitok_TakeSnapShot' ) ;
   Exit ;
   End ;
PUT_LOG ( 'MITOK TakeSnapShot:' + ' [' + Path + ']' ) ;
Try
   Except
   On E : Exception Do
      Begin
      PUT_LOG ( 'Exception MITOK_TakeSnapShot/1 [' + Path +  '][' + E.Message + ']' ) ;
      End ;
   End ;
End ;

Procedure MITOK_Get_AdjustVideo ;
Begin
PUT_LOG ( 'MITOK GET_ADJUST_VIDEO' ) ;
End ;

Procedure MITOK_AdjustVideo ( Flag_Ajustar: Integer ;
                            Contrast: Double; Brightness : Double; Hue : Double;
                            Saturation : Double; Gamma : Double) ;
Begin
If NOT MITOK_IS_OK Then
   Begin
   PUT_LOG ( 'Exit NOT MITOK_IS_OK MITOK_AdjusttVideo' ) ;
   Exit ;
   End ;
PUT_LOG ( 'MITOK_ADJUST_VIDEO' ) ;
Try
   Except
   On E : Exception Do
      Begin
      PUT_LOG ( 'Exception MITOK_AdjustVideo/1 [' + E.Message + ']' ) ;
      End ;
   End ;
Try
   Except
   On E : Exception Do
      Begin
      PUT_LOG ( 'Exception MITOK_AdjustVideo/Contraste [' + E.Message + ']' ) ;
      End ;
   End ;
Try
   Except
   On E : Exception Do
      Begin
      PUT_LOG ( 'Exception MITOK_AdjustVideo/Brilho [' + E.Message + ']' ) ;
      End ;
   End ;
Try
   Except
   On E : Exception Do
      Begin
      PUT_LOG ( 'Exception MITOK_AdjustVideo/Hue [' + E.Message + ']' ) ;
      End ;
   End ;
Try
   Except
   On E : Exception Do
      Begin
      PUT_LOG ( 'Exception MITOK_AdjustVideo/Saturation [' + E.Message + ']' ) ;
      End ;
   End ;
Try
   Except
   On E : Exception Do
      Begin
      PUT_LOG ( 'Exception MITOK_AdjustVideo/Gamma [' + E.Message + ']' ) ;
      End ;
   End ;
MITOK_Get_AdjustVideo ;
End ;

Procedure MITOK_PAUSE ( Indice : LongInt ) ;
Begin
(*
If NOT MITOK_IS_OK Then
   Begin
   PUT_LOG ( 'Exit NOT MITOK_IS_OK MITOK_PAUSE' ) ;
   Exit ;
   End ;
PUT_LOG ( 'MITOK PAUSE' ) ;
Try
   If PL_Mitok.Paused Then
      PL_Mitok.Resume
      Else
      PL_Mitok.Pause ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception MITOK_PAUSE/1 [' + E.Message + ']' ) ;
   End ;
End ;
*)
End ;

Function MITOK_GET_STATE ( Indice : LongInt ) : LongInt ; // Tipo_State ;
Begin
Result := -1 ;
(*
If PL_MITOK = Nil Then
   Begin
   PUT_LOG ( 'Exit MITOK_GET_STATE PL_MITOK Nil' ) ;
   Exit ;
   End ;
Try
   Result := 0 ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception MITOK_GET_STATE/2 [' + E.Message + ']' ) ;
      Result := -1 ;
   End ;
End ;
*)
End ;

Function MITOK_GET_STATE_INT ( Indice : LongInt ) : LongInt ;
//Var Tipo : LongInt ;
Begin
(*
If PL_MITOK = Nil Then
   Begin
   PUT_LOG ( 'Exit MITOK_GET_STATE PL_MITOK Nil' ) ;
   Exit ;
   End ;
Try
   Tipo := 0 ;
   Except
   On E : Exception Do
      Begin
      PUT_LOG ( 'Exception MITOK_GET_STATE_INT/2 [' + E.Message + ']' ) ;
      Result := -3 ;
      End ;
   End ;
*)
End ;

Procedure MITOK_SET_PAUSE ( Indice : LongInt ; Pausa : LongInt ) ;
Begin
(*
If NOT MITOK_IS_OK Then
   Begin
   PUT_LOG ( 'Exit NOT MITOK_IS_OK MITOK_SET_PAUSE' ) ;
   Exit ;
   End ;
PUT_LOG ( 'MITOK SET_PAUSE' ) ;
Try
   PL_Mitok.Pause ;
   Except
   On E : Exception Do
      Begin
      PUT_LOG ( 'Exception MITOK_SET_PAUSE/2 [' + E.Message + ']' ) ;
      End ;
   End ;
*)
End ;

Function MITOK_SET_VOLUME ( Indice : LongInt ; Volume : Integer ) : Integer ;
Begin
Result := 0 ;
(*
If NOT MITOK_IS_OK Then
   Begin
   PUT_LOG ( 'Exit NOT MITOK_IS_OK MITOK_SET_VOLUME' ) ;
   Exit ;
   End ;
PUT_LOG ( 'MITOK SET_VOLUME' ) ;
Try
   Except
   On E : Exception Do
      Begin
      PUT_LOG ( 'Exception MITOK_SET_VOLUME/1 [' + E.Message + ']' ) ;
      Result := -1 ;
      End ;
   End ;
*)
End ;

Procedure MITOK_PLAY ( Indice : LongInt ) ;
Begin
(*
If NOT MITOK_IS_OK Then
   Begin
   PUT_LOG ( 'Exit NOT MITOK_IS_OK MITOK_PLAY' ) ;
   Exit ;
   End ;
PUT_LOG ( 'MITOK PLAY' ) ;
Try
   PL_Mitok.Paused := FALSE ;
   PL_Mitok.Start ;
   Except
   On E : Exception Do
      Begin
      PUT_LOG ( 'Exception MITOK_PLAY/1 [' + E.Message + ']' ) ;
      End ;
   End ;
*)
End ;

Procedure MITOK_TOGGLE_FULLSCREEN ( Indice : LongInt ) ;
Begin
(*
If NOT MITOK_IS_OK Then
   Begin
   PUT_LOG ( 'Exit NOT MITOK_IS_OK MITOK_TOOGLE_FULLSCREEN' ) ;
   Exit ;
   End ;
PUT_LOG ( 'MITOK TOOGLE_FULLSCREEN' ) ;
Try
   Except
   On E : Exception Do
      Begin
      PUT_LOG ( 'Exception MITOK_TOOGLE_FULLSCREEN/1 [' + E.Message + ']' ) ;
      End ;
   End ;
*)
End ;

Function MITOK_WILL_PLAY ( Indice : LongInt ) : Boolean ;
Begin
Result := FALSE ;
(*
If NOT MITOK_IS_OK Then
   Begin
   PUT_LOG ( 'Exit NOT MITOK_IS_OK MITOK_WILL_PLAY' ) ;
   Exit ;
   End ;
PUT_LOG ( 'MITOK WILL_PLAY' ) ;
Try
   Except
   On E : Exception Do
      Begin
      PUT_LOG ( 'Exception MITOK_WILL_PLAY/1 [' + E.Message + ']' ) ;
      Result := FALSE ;
      End ;
   End ;
*)
End ;

Procedure MITOK_LOAD ( Indice : LongInt ; FN : String ; PN : TPanel ; ED : TEdit ) ;
Begin
(*
If PL_MITOK = Nil Then
   Begin
   PUT_LOG ( 'Exit MITOK_LOAD PL_MITOK Nil [' + FN + ']' ) ;
   Exit ;
   End ;
PUT_LOG ( 'MITOK LOAD IDX:' + IntToStr(Indice) + ' [' + FN + ']' ) ;
Try
   PL_MITOK.Enabled := FALSE ;
   PL_MITOK.FileName := FN ;
   PL_MITOK.Enabled := TRUE ;
   ED.Text := FN ;
   Except
   On E : Exception Do
      Begin
      PUT_LOG ( 'Exception MITOK_LOAD/1 [' + E.Message + ']' ) ;
      End ;
   End ;
*)
End ;

Function MITOK_CAN_PAUSE ( Indice : LongInt ) : Boolean ;
Begin
Result := FALSE ;
(*
If NOT MITOK_IS_OK Then
   Begin
   PUT_LOG ( 'Exit NOT MITOK_IS_OK MITOK_CAN_PAUSE' ) ;
   Exit ;
   End ;
PUT_LOG ( 'MITOK CAN_PAUSE' ) ;
Try
   Except
   On E : Exception Do
      Begin
      PUT_LOG ( 'Exception MITOK_CAN_PAUSE/1 [' + E.Message + ']' ) ;
      Result := FALSE ;
      End ;
   End ;
*)
End ;

Procedure MITOK_STOP ( Indice : LongInt ) ;
Begin
(*
If NOT MITOK_IS_OK Then
   Begin
   PUT_LOG ( 'Exit NOT MITOK_IS_OK MITOK_CAN_PAUSE' ) ;
   Exit ;
   End ;
PUT_LOG ( 'MITOK STOP' ) ;
Try
   PL_Mitok.Stop ;
   Except
   On E : Exception Do
      Begin
      PUT_LOG ( 'Exception MITOK_STOP/1 [' + E.Message + ']' ) ;
      End ;
   End ;
*)
End ;

Procedure MITOK_AUDIO_TOGGLE_MUTE ( Indice : LongInt ) ;
Begin
(*
If NOT MITOK_IS_OK Then
   Begin
   PUT_LOG ( 'Exit NOT MITOK_IS_OK MITOK_AUDIO_TOOGLE_MUTE' ) ;
   Exit ;
   End ;
PUT_LOG ( 'MITOK AUDIO_TOGGLE_MUTE' ) ;
Try
   Except
   On E : Exception Do
      Begin
      PUT_LOG ( 'Exception MITOK_AUDIO_TOOGLE_MUTE/1 [' + E.Message + ']' ) ;
      End ;
   End ;
*)
End ;

Procedure MITOK_AUDIO_SET_MUTE ( Indice : LongInt ; Mute : Boolean ) ;
Begin
(*
If NOT MITOK_IS_OK Then
   Begin
   PUT_LOG ( 'Exit NOT MITOK_IS_OK MITOK_AUDIO_SET_MUTE' ) ;
   Exit ;
   End ;
PUT_LOG ( 'MITOK AUDIO_SET_MUTE' ) ;
Try
   Except
   On E : Exception Do
      Begin
      PUT_LOG ( 'Exception MITOK_AUDIO_SET_MUTE/1 [' + E.Message + ']' ) ;
      End ;
   End ;
*)
End ;

Procedure MITOK_AUDIO_SET_DELAY ( Indice : LongInt ; Delay : Int64 ) ;
Begin
(*
If NOT MITOK_IS_OK Then
   Begin
   PUT_LOG ( 'Exit NOT MITOK_IS_OK MITOK_AUDIO_SET_DELAY' ) ;
   Exit ;
   End ;
PUT_LOG ( 'MITOK AUDIO_SET_DELAY' ) ;
Try
   Except
   On E : Exception Do
      Begin
      PUT_LOG ( 'Exception MITOK_AUDIO_SET_DELAY/1 [' + E.Message + ']' ) ;
      End ;
   End ;
*)
End ;

Procedure MITOK_NEXT_FRAME ( Indice : LongInt ) ;
Begin
(*
If NOT MITOK_IS_OK Then
   Begin
   PUT_LOG ( 'Exit NOT MITOK_IS_OK MITOK_NEXT_FRAME' ) ;
   Exit ;
   End ;
PUT_LOG ( 'MITOK NEXT_FRAME' ) ;
Try
   Except
   On E : Exception Do
      Begin
      PUT_LOG ( 'Exception MITOK_NEXT_FRAME/1 [' + E.Message + ']' ) ;
      End ;
   End ;
*)
End ;

Procedure MITOK_PREVIOUS_FRAME ( Indice : LongInt ) ;
Begin
(*
If NOT MITOK_IS_OK Then
   Begin
   PUT_LOG ( 'Exit NOT MITOK_IS_OK MITOK_PREVIOUS_FRAME' ) ;
   Exit ;
   End ;
PUT_LOG ( 'MITOK PREVIOUS_FRAME' ) ;
Try
   Except
   On E : Exception Do
      Begin
      PUT_LOG ( 'Exception MITOK_PREVIOUS_FRAME/1 [' + E.Message + ']' ) ;
      End ;
   End ;
*)
End ;

Procedure MITOK_SET_RATE ( Indice : LongInt ; Rate : Double ) ;
Begin
(*
If NOT MITOK_IS_OK Then
   Begin
   PUT_LOG ( 'Exit NOT MITOK_IS_OK MITOK_SET_RATE' ) ;
   Exit ;
   End ;
PUT_LOG ( 'MITOK SET_RATE [' + IntToStr(TRUNC(Rate)) + ']' ) ;
Try
   PL_Mitok.PlaybackRate.Rate := Rate/100 ;
   PL_Mitok.PlaybackRate.UseCurrent := FALSE ; // TRUNC ( Rate ) <> 100 ;
   Except
   On E : Exception Do
      Begin
      PUT_LOG ( 'Exception MITOK_SET_RATE/1 [' + E.Message + ']' ) ;
      End ;
   End ;
*)
End ;

Function MITOK_GET_RATE ( Indice : LongInt ) : Double ;
Begin
(*
If NOT MITOK_IS_OK Then
   Begin
   PUT_LOG ( 'Exit NOT MITOK_IS_OK MITOK_GET_RATE' ) ;
   Exit ;
   End ;
PUT_LOG ( 'MITOK GET_RATE' ) ;
Try
   If PL_Mitok.PlaybackRate.UseCurrent Then
      Result := 1
      Else
      Result := PL_Mitok.PlaybackRate.CurrentRate ;
   Except
   On E : Exception Do
      Begin
      PUT_LOG ( 'Exception MITOK_GET_RATE/1 [' + E.Message + ']' ) ;
      End ;
   End ;
*)
End ;

Function MITOK_GET_VERSION : String ;
Begin
(*
If NOT MITOK_IS_OK Then
   Begin
   PUT_LOG ( 'Exit NOT MITOK_IS_OK MITOK_GET_VERSION' ) ;
   Exit ;
   End ;
PUT_LOG ( 'MITOK GET_VERSION' ) ;
Try
   Result := '' ;
   Except
   On E : Exception Do
      Begin
      PUT_LOG ( 'Exception MITOK_GET_VERSION/1 [' + E.Message + ']' ) ;
      Result := '' ;
      End ;
   End ;
*)
End ;

Function MITOK_GET_COMPILER : String ;
Begin
(*
If NOT MITOK_IS_OK Then
   Begin
   PUT_LOG ( 'Exit NOT MITOK_IS_OK MITOK_GET_COMPILER' ) ;
   Exit ;
   End ;
Try
   Result := '' ;
   PUT_LOG ( 'MITOK GET_COMPILER [' + Result + ']') ;
   Except
   On E : Exception Do
      Begin
      PUT_LOG ( 'Exception MITOK_GET_COMPILER [' + E.Message + ']' ) ;
      Result := '' ;
      End ;
   End ;
*)
End ;

Procedure MITOK_SET_TIME ( _Time : Int64 ) ;
Begin
(*
If NOT MITOK_IS_OK Then
   Begin
   PUT_LOG ( 'Exit NOT MITOK_IS_OK MITOK_SET_TIME' ) ;
   Exit ;
   End ;
Try
   PL_MITOK.CurrentTime := _Time * 10000 ;
   PUT_LOG ( 'MITOK SET_TIME [' + IntToStr(_Time) + ']' ) ;
   Except
   On E : Exception Do
      Begin
      PUT_LOG ( 'Exception MITOK_SET_TIME/1 [' + E.Message + ']' ) ;
      End ;
   End ;
*)
End ;

Procedure MITOK_SET_POSITION ( Indice : LongInt ; Posicao : LongInt ) ;
//Var _Double : Double ;
Begin
(*
If NOT MITOK_IS_OK Then
   Begin
   PUT_LOG ( 'Exit NOT MITOK_IS_OK MITOK_SET_POSITION' ) ;
   Exit ;
   End ;
Try
   PL_MITOK.CurrentTime := Posicao * 10000 ;
   PUT_LOG ( 'MITOK SET_POSITION/1 ' + FloatToStr(Posicao) + ' [' + CASA_3(_Double) + ']' ) ;
   Except
   On E : Exception Do
      Begin
      PUT_LOG ( 'Exception MITOK_SET_POSITION/1 [' + E.Message + ']' ) ;
      End ;
   End ;
*)
End ;

Procedure MITOK_SET_POSITION_PERCENTUAL ( Indice : LongInt ; _Double : Double ) ;
Begin
(*
If NOT MITOK_IS_OK Then
   Begin
   PUT_LOG ( 'Exit NOT MITOK_IS_OK MITOK_SET_POSITION_PERCENTUAL' ) ;
   Exit ;
   End ;
Try
   PL_MITOK.CurrentFrame := TRUNC ( _Double * PL_MITOK.FramesCount ) ;
   PUT_LOG ( 'MITOK SET_POSITION_PERCENTUAL/1 [' + CASA_3(_Double) + ']' +
             '[TT Frames ' + IntToStr(PL_MITOK.FramesCount) +
             '[CurrentFrame ' + IntToStr(PL_MITOK.CurrentFrame) + ']' ) ;
   Except
   On E : Exception Do
      Begin
      PUT_LOG ( 'Exception MITOK_SET_POSITION_PERCENTUAL/1 [' + E.Message + ']' ) ;
      End ;
   End ;
*)
End ;

Function MITOK_GET_TIME : LongInt ;
Begin
(*
If NOT MITOK_IS_OK Then
   Begin
   //PUT_LOG ( 'Exit NOT MITOK_IS_OK MITOK_GET_TIME' ) ;
   Exit ;
   End ;
Try
   Result := PL_MITOK.CurrentTime DIV 10000 ;
   Except
   On E : Exception Do
      Begin
      PUT_LOG ( 'Exception MITOK_GET_TIME/1 [' + E.Message + ']' ) ;
      Result := -3 ;
      End ;
   End ;
*)
End ;

Function MITOK_GET_DURACAO : LongInt ;
Begin
Result := -1 ;
(*
If NOT MITOK_IS_OK Then
   Begin
   //PUT_LOG ( 'Exit NOT MITOK_IS_OK MITOK_GET_DURACAO' ) ;
   Exit ;
   End ;
Try
   Result := PL_MITOK.DurationTime DIV 10000 ;
   Except
   On E : Exception Do
      Begin
      PUT_LOG ( 'Exception MITOK_GET_DURACAO/1 [' + E.Message + ']' ) ;
      Result := -2 ;
      End ;
   End ;
*)
End ;

Function MITOK_GET_CODEC : String ;
Begin
Result := '' ;
(*
If NOT MITOK_IS_OK Then
   Begin
   PUT_LOG ( 'Exit NOT MITOK_IS_OK MITOK_GET_CODEC' ) ;
   Exit ;
   End ;
Try
   Result := PL_MITOK.VideoCodecName ;
   Except
   On E : Exception Do
      Begin
      PUT_LOG ( 'Exception MITOK_GET_CODEC [' + E.Message + ']' ) ;
      End ;
   End ;
*)
End ;

Function MITOK_IS_PLAYING : Boolean ;
Begin
Result := FALSE ;
(*
If NOT MITOK_IS_OK Then
   Begin
   //PUT_LOG ( 'Exit NOT MITOK_IS_OK MITOK_IS_PLAYING' ) ;
   Exit ;
   End ;
Try
   Result := MEDIA_Old_Current_Frame <> MEDIA_Current_Frame ;
   Except
   On E : Exception Do
      Begin
      PUT_LOG ( 'Exception MITOK_IS_PLAYING [' + E.Message + ']' ) ;
      End ;
   End ;
*)
End ;

Function MITOK_IS_OK : Boolean ;
Begin
Result := FALSE ;
(*
Try
   If PL_Mitok = Nil Then
      Begin
      Exit ;
      End ;
   Except
   On E : Exception Do
      Begin
      PUT_LOG ( 'Exception MITOK_IS_OK/1 [' + E.Message + ']' ) ;
      End ;
   End ;
Try
   If NOT PL_Mitok.Opened Then
      Begin
      Exit ;
      End ;
   Except
   On E : Exception Do
      Begin
      PUT_LOG ( 'Exception MITOK_IS_OK/2 [' + E.Message + ']' ) ;
      End ;
   End ;
Result := TRUE ;
*)
End ;

Function MITOK_GET_FRAME_ATUAL : LongInt ;
Begin
Result := 0 ;
(*
If NOT MITOK_IS_OK Then
   Begin
//   PUT_LOG ( 'Exit NOT MITOK_IS_OK MITOK_GET_FRAME_ATUAL' ) ;
   Exit ;
   End ;
Try
   Result := PL_MITOK.CurrentFrame ;
   Except
   On E : Exception Do
      Begin
      PUT_LOG ( 'Exception MITOK_GET_FRAME_ATUAL/1 [' + E.Message + ']' ) ;
      End ;
   End ;
*)
End ;

Function MITOK_GET_FRAME_TOTAL : LongInt ;
Begin
Result := 0 ;
(*
If NOT MITOK_IS_OK Then
   Begin
   //PUT_LOG ( 'Exit NOT MITOK_IS_OK MITOK_GET_FRAME_TOTAL' ) ;
   Exit ;
   End ;
Try
   Result := PL_MITOK.FramesCount ;
   Except
   On E : Exception Do
      Begin
      PUT_LOG ( 'Exception MITOK_GET_FRAME_TOTAL/1 [' + E.Message + ']' ) ;
      End ;
   End ;
*)
End ;

Procedure MITOK_DISABLE ;
Begin
(*
If PL_MITOK = Nil Then
   Begin
   //PUT_LOG ( 'Exit NOT MITOK_IS_OK MITOK_GET_FRAME_TOTAL' ) ;
   Exit ;
   End ;
Try
   PL_MITOK.Enabled := FALSE ;
   Except
   On E : Exception Do
      Begin
      PUT_LOG ( 'Exception MITOK_GET_FRAME_TOTAL/1 [' + E.Message + ']' ) ;
      End ;
   End ;
*)
End ;

Function MITOK_GET_TIME_TOTAL : LongInt ;
Begin
Result := 0 ;
(*
If NOT MITOK_IS_OK Then
   Begin
   //PUT_LOG ( 'Exit NOT MITOK_IS_OK MITOK_GET_TIME_TOTAL' ) ;
   Exit ;
   End ;
Try
   Result := PL_MITOK.DurationTime DIV 10000 ;
   Except
   On E : Exception Do
      Begin
      PUT_LOG ( 'Exception MITOK_GET_TIME_TOTAL/1 [' + E.Message + ']' ) ;
      End ;
   End ;
*)
End ;

Begin
SL_Erros_MITOK := TStringList.Create ;
End.

