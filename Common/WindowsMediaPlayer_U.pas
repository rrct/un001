Unit WindowsMediaPlayer_U ;

Interface

Uses Math,
     WMPLib_TLB,
     Misc_U,
     System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
     Vcl.Controls, Vcl.Dialogs,
     Vcl.ExtCtrls, Vcl.OleCtrls,
     Vcl.ComCtrls, Vcl.StdCtrls,
     Vcl.Samples.Spin,
     Vcl.Buttons,
     //mmSystem,
     //ovcslide,
     Vcl.Menus ;

Const MAX_MP = 1 ;
      IDX_MP_PLAY = 1 ;
      //IDX_MP_TEMP = 2 ;


Function MP_GET_DURACAO_FULL ( FN : String ) : Double ;
Procedure MP_PARAMETRIZAR_VIDEO ( IDX : LongInt ) ;
Procedure MP_PLAY ( IDX : LongInt ; Parametrizar : Boolean ) ;
Procedure MP_PREPARE ( IDX : LongInt ) ;
Procedure MP_PLAY_PAUSE ( IDX : LongInt ) ;
Procedure MP_PAUSE ( IDX : LongInt ) ;
Function MP_STATE_DISPONIVEL ( IDX : LongInt ) : Boolean ;
Function MP_GET_LENGTH ( IDX : LongInt ) : LongInt ;
Function MP_GET_TIME ( IDX : LongInt ) : LongInt ;
Procedure MP_SET_TIME ( IDX : LongInt ; Posicao: LongInt ) ;
Function MP_IS_PLAYING ( IDX : LongInt ) : Boolean ;
Function MP_GET_STATE_INT ( IDX : LongInt ) : LongInt ;
Procedure MP_OPEN( IDX : LongInt ; FN: String; FLAG_PLAY: Boolean;
                   //Barra : TOvcSlider;
                   Parametrizar : Boolean ; ED : TEdit ) ;
Procedure MP_RESTART_PLAY_V ( IDX : LongInt ; Posicao: LongInt; Delay: LongInt ;
                              Parametrizar : Boolean ) ;
Procedure MP_CLOSE ( IDX : LongInt ) ;
Procedure MP_STOP ( IDX : LongInt ) ;
Procedure MP_CREATE_VIDEO ( IDX : LongInt ; Painel : TPanel ) ;
Procedure MP_FREE_VIDEO ( IDX : LongInt ) ;
Procedure MP_TEMPO_MENOS ( IDX : LongInt ; Tempo : LongInt ) ;
Procedure MP_TEMPO_MAIS ( IDX : LongInt ; Tempo : LongInt ) ;
Procedure MP_FRAME_MENOS ( IDX : LongInt ; Frames : LongInt ) ;
Procedure MP_FRAME_MAIS ( IDX : LongInt ; Frames : LongInt ) ;
Function MP_PLAYSTATE_VIDEO ( IDX : LongInt ) : TOleEnum ;
Function MP_GET_URL ( IDX : LongInt ) : String ;

Var MPX               : TWindowsMediaPlayer ;
    WMP_Taxa          : LongInt ;
    WMP_Controles     : Boolean ;
    WMP_Marca_Pause   : Double ;
    WMP_Marca_Reload  : Double ;
    WMP_MEDIA_ABERTA2 : String ;
    //MP                : Array [ 1 .. MAX_MP ] Of TWindowsMediaPlayer ;
    //WMP_Taxa          : Array [ 1 .. MAX_MP ] Of LongInt ;
    //WMP_Controles     : Array [ 1 .. MAX_MP ] Of Boolean ;
    //WMP_Marca_Pause   : Array [ 1 .. MAX_MP ] Of Double ;
    //WMP_Marca_Reload  : Array [ 1 .. MAX_MP ] Of Double ;
    //WMP_MEDIA_ABERTA2 : Array [ 1 .. MAX_MP ] Of String ;

Implementation

Uses Progresso_U ;

Function MP_GET_DURACAO_FULL ( FN : String ) : Double ;
Begin
If MPX = Nil Then
   Begin
   Result := -1 ;
   Exit ;
   End ;
If NOT RR_FileExists ( 'MP_GET_DURACAO_FULL', FN ) Then
   Begin
   Result := -1 ;
   Exit ;
   End ;
MP_OPEN ( 2, FN, FALSE,
          //Nil,
          FALSE, Nil ) ;
Result := MP_GET_LENGTH ( 2 ) ;
MP_CLOSE ( 2 ) ;
End ;

Procedure MP_PARAMETRIZAR_VIDEO ( IDX : LongInt ) ;
Begin
If MPX = Nil Then
   Exit ;
MPX.uiMode := 'full' ;
Exit ;
(*
MP.Visible := TRUE ;
If TRUE OR WMP_Controles[IDX] Then
   MP.uiMode := 'full'
   Else
   MP.uiMode := 'none' ;
MP.stretchToFit := TRUE ;
//Exit ;
//MP.Left := 0 ;
//MP.Top := 0 ;
//MP.
//MP.Align := alClient ;
//MP.Width := MP.Parent.Width ;
//MP.Height := MP.Parent.Height ;
MP.Cursor := MP.Parent.Cursor ;
//MP.windowlessVideo := not TRUE ;
// player.enableContextMenu := false ;
MP.settings.enableErrorDialogs := FALSE ;
MP.settings.autoStart := FALSE ;
//MP.stretchToFit := TRUE ;
//MP.DisplayRect := Panel1.ClientRect;
MP.settings.invokeURLs := FALSE ;
MP.settings.volume := 100 ;
MP.settings.rate := WMP_Taxa[IDX] / 100 ;
//MP.Width := 100 ;
//MP.DisplayRect := Panel1.ClientRect;
//TPanel(MP.Parent).OnDblClick := Nil ;
//MP.OnDblClick := Nil ;
//MP.
// MP.SendToBack ;
*)
End;

Procedure MP_PLAY ( IDX : LongInt ; Parametrizar : Boolean ) ;
Begin
If MPX = Nil Then
   Exit ;
If Parametrizar Then
   MP_PARAMETRIZAR_VIDEO ( IDX ) ;
MPX.settings.rate := WMP_Taxa / 100 ;
//MP.DisplayRect := Rect(0,0,pnl1.Width,pnl1.Height);
MPX.Controls.play ;
End ;

Procedure MP_PREPARE ( IDX : LongInt ) ;
Begin
If MPX = Nil Then
   Exit ;
MP_PARAMETRIZAR_VIDEO ( IDX ) ;
MPX.Controls.Play ;
MPX.Controls.Pause ;
End ;

Procedure MP_PLAY_PAUSE ( IDX : LongInt ) ;
Begin
If MPX = Nil Then
   Exit ;
MPX.Controls.Play ;
MPX.Controls.Pause ;
End ;

Procedure MP_PAUSE ( IDX : LongInt ) ;
Begin
If MPX = Nil Then
   Exit ;
MPX.Controls.pause ;
End ;

Function MP_STATE_DISPONIVEL ( IDX : LongInt ) : Boolean ;
Begin
If MPX = Nil Then
   Begin
   Result := FALSE ;
   Exit ;
   End ;
 {
   wmposUndefined = $00000000;
   wmposPlaylistChanging = $00000001;
   wmposPlaylistLocating = $00000002;
   wmposPlaylistConnecting = $00000003;
   wmposPlaylistLoading = $00000004;
   wmposPlaylistOpening = $00000005;
   wmposPlaylistOpenNoMedia = $00000006;
   wmposPlaylistChanged = $00000007;
   wmposMediaChanging = $00000008;
   wmposMediaLocating = $00000009;
   wmposMediaConnecting = $0000000A;
   wmposMediaLoading = $0000000B;
   wmposMediaOpening = $0000000C;
   wmposMediaOpen = $0000000D;
   wmposBeginCodecAcquisition = $0000000E;
   wmposEndCodecAcquisition = $0000000F;
   wmposBeginLicenseAcquisition = $00000010;
   wmposEndLicenseAcquisition = $00000011;
   wmposBeginIndividualization = $00000012;
   wmposEndIndividualization = $00000013;
   wmposMediaWaiting = $00000014;
   wmposOpeningUnknownURL = $00000015;
 }
Result := (MPX.playState = wmposPlaylistChanging) OR // 01 Final de arquivo
          (MPX.playState = wmposPlaylistLocating) OR // 02 Pause
          (MPX.playState = wmposPlaylistConnecting) OR // 03 Play
          (MPX.playState = wmposMediaLocating) OR // 09 Iniciando play
          (MPX.playState = wmposMediaOpen) ; // 0D
End ;

Function MP_GET_LENGTH ( IDX : LongInt ) : LongInt ;
Begin
If MPX = Nil Then
   Begin
   Result := -1 ;
   Exit ;
   End ;
Try
  If MP_STATE_DISPONIVEL ( IDX ) Then
     Begin
     Result := TRUNC ( MPX.Controls.currentItem.duration * 1000 ) ;
     //Result := -3 ;
     End
     Else
     Result := -2 ;
  Except
   On E : Exception Do
      Begin
      Result := -1 ;
      ShowMessage ( 'Exception MP_GET_LENGTH' + sLineBreak + E.Message ) ;
      End ;
  End ;
End ;

Function MP_GET_TIME ( IDX : LongInt ) : LongInt ;
Begin
If MPX = Nil Then
   Begin
   Result := -1 ;
   Exit ;
   End ;
Try
   Result := TRUNC ( MPX.Controls.currentPosition * 1000 ) ; // MP.Position ;
   Except
   On E : Exception Do
      Begin
      Result := -1 ;
      ShowMessage ( 'Exception MP_GET_TIME' + sLineBreak + E.Message ) ;
      End ;
   End ;
End;

Procedure MP_SET_TIME ( IDX : LongInt ; Posicao: LongInt ) ;
Begin
If MPX = Nil Then
   Exit ;
Try
   MPX.Controls.currentPosition := MAX ( 0 , Posicao/1000 ) ;
   Except
   On E : Exception Do
      Begin
      ShowMessage ( 'Exception MP_SET_TIME' + sLineBreak + E.Message ) ;
      End ;
   End ;
End;

Function MP_IS_PLAYING ( IDX : LongInt ) : Boolean ;
Begin
If MPX = Nil Then
   Begin
   Result := FALSE ;
   Exit ;
   End ;
 // TMPModes = (mpNotReady, mpStopped, mpPlaying, mpRecording, mpSeeking, mpPaused, mpOpen);
{
   wmppsUndefined = $00000000;
   wmppsStopped = $00000001;
   wmppsPaused = $00000002;
   wmppsPlaying = $00000003;
   wmppsScanForward = $00000004;
   wmppsScanReverse = $00000005;
   wmppsBuffering = $00000006;
   wmppsWaiting = $00000007;
   wmppsMediaEnded = $00000008;
   wmppsTransitioning = $00000009;
   wmppsReady = $0000000A;
   wmppsReconnecting = $0000000B;
   wmppsLast = $0000000C;
}
Try
   Result := MPX.playState = wmppsPlaying; // false ; // Main.MP.Mode = mpPlaying ;
   Except
   On E : Exception Do
      Begin
      Result := FALSE ;
      ShowMessage ( 'Exception MP_IS_PLAYING' + sLineBreak + E.Message ) ;
      End ;
   End ;
End ;

Function MP_GET_STATE_INT ( IDX : LongInt ) : LongInt ;
Begin
If MPX = Nil Then
   Begin
   Result := -1 ;
   Exit ;
   End ;
 // TMPModes = (mpNotReady, mpStopped, mpPlaying, mpRecording, mpSeeking, mpPaused, mpOpen);
 {
   wmppsUndefined = $00000000;
   wmppsStopped = $00000001;
   wmppsPaused = $00000002;
   wmppsPlaying = $00000003;
   wmppsScanForward = $00000004;
   wmppsScanReverse = $00000005;
   wmppsBuffering = $00000006;
   wmppsWaiting = $00000007;
   wmppsMediaEnded = $00000008;
   wmppsTransitioning = $00000009;
   wmppsReady = $0000000A;
   wmppsReconnecting = $0000000B;
   wmppsLast = $0000000C;
 }
If MPX.playState = wmppsUndefined Then
   Result := 0
Else If MPX.playState = wmppsStopped Then
   Result := 1
Else If MPX.playState = wmppsPaused Then
   Result := 2
Else If MPX.playState = wmppsPlaying Then
   Result := 3
Else If MPX.playState = wmppsScanForward Then
   Result := 4
Else If MPX.playState = wmppsScanReverse Then
   Result := 5
Else If MPX.playState = wmppsBuffering Then
   Result := 6
Else If MPX.playState = wmppsWaiting Then
   Result := 7
Else If MPX.playState = wmppsMediaEnded Then
   Result := 8
Else If MPX.playState = wmppsTransitioning Then
   Result := 9
Else If MPX.playState = wmppsReady Then
   Result := 10
Else If MPX.playState = wmppsReconnecting Then
   Result := 11
Else If MPX.playState = wmppsLast Then
   Result := 12
Else
   Result := -1 ;
End ;

Procedure MP_OPEN ( IDX : LongInt ; FN: String ;
                    FLAG_PLAY : Boolean ;
                    //Barra : TOvcSlider;
                    Parametrizar : Boolean ; ED : TEdit ) ;
Var Passo : LongInt ;
Begin
If MPX = Nil Then
   Exit ;
//ShowMessage ( 'O5a' ) ;
Passo := 0 ;
Try
   Passo := 1 ;
   // ShowMessage ( FN ) ;
   //ShowMessage ( 'O5b' ) ;
   PUT_PROGRESSO ( FALSE, 'MP_OPEN/1 [' + FN + ']', '' ) ;
   Passo := 2 ;
   //ShowMessage ( 'O5c' ) ;
   MP_CLOSE ( IDX ) ;
   Passo := 3 ;
   //ShowMessage ( 'O5d [' + IntToStr(IDX) + '][' + FN + ']' ) ;
   MPX.URL := FN ;
   //MPX.LaunchURL ( FN ) ;
   //Exit ;
   //ShowMessage ( 'O5d1 [' + IntToStr(IDX) + '][' + FN + ']' ) ;
   //If Assigned ( ED ) Then
   //   ED.Text := FN ;
   Passo := 4 ;
//   ShowMessage ( 'O5e' ) ;
   MPX.settings.volume := 100 ;
//   ShowMessage ( 'O5f' ) ;
   MPX.settings.rate := WMP_Taxa / 100 ;
//   ShowMessage ( 'O5g' ) ;
   PUT_PROGRESSO ( FALSE, 'MP_OPEN/2 [' + IntToStr(IDX) + ']', '' ) ;
//   ShowMessage ( 'O5h' ) ;
   If FLAG_PLAY Then
      Begin
      Passo := 5 ;
      PUT_PROGRESSO ( FALSE, 'MP_OPEN/3 [' + IntToStr(IDX) + ']', '' ) ;
      //ShowMessage ( 'O5i' ) ;
      If Parametrizar Then
         Begin
         //ShowMessage ( 'O5j' ) ;
         MP_PARAMETRIZAR_VIDEO ( IDX ) ;
         End ;
      //ShowMessage ( 'O5k' ) ;
      MP_PLAY ( IDX, FALSE ) ;
      End
      Else
      Begin
      Passo := 6 ;
      PUT_PROGRESSO ( FALSE, 'MP_OPEN/4 [' + IntToStr(IDX) + ']', '' ) ;
      If Parametrizar Then
         MP_PARAMETRIZAR_VIDEO ( IDX ) ;
      End ;
   Passo := 7 ;
   //ShowMessage ( 'O5l' ) ;
   WMP_MEDIA_ABERTA2 := FN ;
   Passo := 8 ;
   WMP_Marca_Pause := 0 ;
   Passo := 9 ;
   Try
      PUT_PROGRESSO ( FALSE, 'MP_OPEN/5 [' + MPX.URL + ']', '' ) ;
      Except
      On E : Exception Do
         Begin
         ShowMessage ( 'Exception MP_OPEN/5' + sLineBreak + E.Message ) ;
         End ;
      End ;
   //ShowMessage ( 'O10' ) ;
   Try
      //PUT_PROGRESSO ( FALSE, 'MP_OPEN/6 [' + CASA_3(MPX.Controls.currentItem.duration) + ']', '' ) ;
      Except
      On E : Exception Do
         Begin
         ShowMessage ( 'Exception MP_OPEN/5a' + sLineBreak + E.Message ) ;
         End ;
      End ;
   {
   If Barra <> Nil Then Begin
      Passo := 10 ;
      Barra.Min := 0 ;
      Passo := 11 ;
      Barra.Position := 0 ;
      Passo := 12 ;
      If MP_STATE_DISPONIVEL ( IDX ) Then Begin
         Passo := 13 ;
         Barra.Min := 0 ;
         Passo := 14 ;
         Barra.Max := MP_GET_LENGTH ( IDX ) + 0.000001 ;
      End Else Begin
         Passo := 15 ;
         Barra.Min := 0 ;
         Passo := 16 ;
         Barra.Max := 1 ;
      End ;
   End ;
   }
   Passo := 17 ;
   {
   If Check <> Nil Then
      Begin
      Passo := 18 ;
      If NOT Check.Checked Then
         Begin
         Passo := 19 ;
         Check.Checked := TRUE ;
         Passo := 20 ;
         End ;
      End ;
   }
   Passo := 21 ;
   //ShowMessage ( 'O11' ) ;
   Except
   On E: Exception Do
      ShowMessage ( 'Exception passo ' + IntToStr ( Passo ) +
                    ' em MP_OPEN/6 [' + FN + '][' + E.Message + ']') ;
   End ;
End ;

Procedure MP_RESTART_PLAY_V ( IDX : LongInt ; Posicao : LongInt ; Delay : LongInt ;
                              Parametrizar : Boolean ) ;
Begin
If MPX = Nil Then
   Exit ;
Try
   MP_STOP ( IDX ) ;
   If Posicao < 0 Then
      Posicao := 0 ;
   If Posicao >= 0 Then
      MP_SET_TIME(IDX, Posicao) ;
   If Delay > 0 Then
      Sleep(Delay) ;
   MP_PLAY ( IDX, Parametrizar ) ;
   Except
   On E : Exception Do
      Begin
      ShowMessage ( 'Exception MP_RESTART_PLAY_V' + sLineBreak + E.Message ) ;
      End ;
   End ;
End ;

Procedure MP_CLOSE ( IDX : LongInt ) ;
Begin
If MPX = Nil Then
   Exit ;
Try
   PUT_PROGRESSO ( FALSE, 'MP_STOP/ [' + IntToStr(IDX) + ']', '' ) ;
   MPX.controls.stop ;
   Except
   On E : Exception Do
      Begin
      ShowMessage ( 'Exception MP.stop em MP_CLOSE' + sLineBreak + E.Message ) ;
      End ;
   End ;
Try
   PUT_PROGRESSO ( FALSE, 'MP_CLOSE/ [' + IntToStr(IDX) + ']', '' ) ;
   MPX.Close ;
   WMP_MEDIA_ABERTA2 := '' ;
   Except
   On E : Exception Do
      Begin
      ShowMessage ( 'Exception MP.close' + sLineBreak + E.Message ) ;
      End ;
   End ;
End ;

Procedure MP_STOP ( IDX : LongInt ) ;
Begin
If MPX = Nil Then
   Exit ;
Try
   WMP_Marca_Pause := 0 ;
   MPX.Controls.stop ;
   Except
   On E : Exception Do
      Begin
      ShowMessage ( 'Exception MP.stop' + sLineBreak + E.Message ) ;
      End ;
   End ;
End ;

Procedure MP_CREATE_VIDEO ( IDX : LongInt ; Painel : TPanel ) ;
Begin
Try
   //MP := TWindowsMediaPlayer.Create ( Painel ) ;
   //MP.Parent := Painel ;
   //MP.Align := alClient;
   //MP.AutoOpen := FALSE ;
   WMP_Taxa := 100 ;
   WMP_MEDIA_ABERTA2 := '' ;
   Except
   On E : Exception Do
      Begin
      ShowMessage ( 'Exception MP_CREATE_VIDEO' + sLineBreak + E.Message ) ;
      End ;
   End;
End ;

Procedure MP_FREE_VIDEO ( IDX : LongInt ) ;
Begin
If MPX = Nil Then
   Exit ;
Try
   //WMP_MEDIA_ABERTA2 := '' ;
   //If Assigned ( MP ) Then
   //   MP.Free ;
   Except
   On E : Exception Do
      Begin
      ShowMessage ( 'Exception MP_FREE_VIDEO' + sLineBreak + E.Message ) ;
      End ;
   End;
End ;

Procedure MP_TEMPO_MENOS ( IDX : LongInt ; Tempo : LongInt ) ;
Var Destino : LongInt ;
Begin
If MPX = Nil Then
   Exit ;
Try
   Destino := Max ( 0 , MP_GET_TIME ( IDX ) - Tempo ) ;
//   MP_SET_TIME ( IDX, Destino ) ;
//   MP_PREPARE_MEDIA ( IDX ) ;
   MP_SET_TIME ( IDX, Destino ) ;
   //MP_PLAY_PAUSE ( IDX ) ;
   Except
   On E : Exception Do
      Begin
      ShowMessage ( 'Exception MP_TEMPO_MENOS' + sLineBreak + E.Message ) ;
      End ;
   End ;
End ;

Procedure MP_TEMPO_MAIS ( IDX : LongInt ; Tempo : LongInt ) ;
Var Destino : LongInt ;
Begin
If MPX = Nil Then
   Exit ;
Try
   Destino := Min ( MP_GET_TIME ( IDX ) + Tempo , MP_GET_LENGTH ( IDX ) ) ;
   //MP_SET_TIME ( IDX, Destino ) ;
   //MP_PREPARE ( IDX ) ;
   MP_SET_TIME ( IDX, Destino ) ;
   //MP_PLAY_PAUSE ( IDX ) ;
   Except
   On E : Exception Do
      Begin
      ShowMessage ( 'Exception MP_TEMPO_MAIS' + sLineBreak + E.Message ) ;
      End ;
   End ;
End ;

Procedure MP_FRAME_MENOS ( IDX : LongInt ; Frames : LongInt ) ;
Var Destino : LongInt ;
Begin
If MPX = Nil Then
   Exit ;
Try
   Destino := Max ( 0 , MP_GET_TIME ( IDX ) - 33 * Frames ) ;
   //MP_SET_TIME ( IDX, Destino ) ;
   //MP_PREPARE ( IDX ) ;
   MP_SET_TIME ( IDX, Destino ) ;
   //MP_PLAY_PAUSE ( IDX ) ;
   //MP_PAUSE ( IDX ) ;
   //MP_PAUSE ( IDX ) ;
   Except
   On E : Exception Do
      Begin
      ShowMessage ( 'Exception MP_FRAME_MENOS' + sLineBreak + E.Message ) ;
      End ;
   End ;
End ;

Procedure MP_FRAME_MAIS ( IDX : LongInt ; Frames : LongInt ) ;
Var Destino : LongInt ;
Begin
If MPX = Nil Then
   Exit ;
Try
   Destino := Min ( MP_GET_TIME ( IDX ) + 33 * Frames , MP_GET_LENGTH ( IDX ) ) ;
   //MP_SET_TIME ( IDX, Destino ) ;
   //MP_PREPARE ( IDX ) ;
   MP_SET_TIME ( IDX, Destino ) ;
   //MP_PLAY_PAUSE ( IDX ) ;
   //MP_PAUSE ( IDX ) ;
   //MP_PAUSE ( IDX ) ;
   Except
   On E : Exception Do
      Begin
      ShowMessage ( 'Exception MP_FRAME_MAIS' + sLineBreak + E.Message ) ;
      End ;
   End ;
End ;

Function MP_PLAYSTATE_VIDEO ( IDX : LongInt ) : TOleEnum ;
Begin
If MPX = Nil Then
   Begin
   //Result := Nil ;
   Exit ;
   End ;
Try
   Result := MPX.playState ;
   Except
   On E : Exception Do
      Begin
      ShowMessage ( 'Exception MP_PLAYSTATE_VIDEO' + sLineBreak + E.Message ) ;
      End ;
   End ;
End ;

Function MP_GET_URL ( IDX : LongInt ) : String ;
Begin
If MPX = Nil Then
   Begin
   Result := '' ;
   Exit ;
   End ;
Try
   Result := MPX.URL ;
   Except
   On E : Exception Do
      Begin
      Result := '' ;
      ShowMessage ( 'Exception MP_GET_URL' + sLineBreak + E.Message ) ;
      End ;
   End ;
End ;

End.
