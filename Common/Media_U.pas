Unit Media_U ;

Interface

Uses Misc_U, Log_U,
     vlc,
     //player_mitok,
     Misc_Def_U, Misc_Const_U, Misc_Type_U,
     WindowsMediaPlayer_U, WMPLib_TLB,
     //RxSlider,
     Vcl.Dialogs,
     Vcl.ExtCtrls, Vcl.StdCtrls,
     Winapi.Windows,System.SysUtils ;

Type T_REG_VIDEO = Record
                   Player : String ;
                   Progresso_Start : Int64 ;
                   Progresso_End : Int64 ;
                   Progresso_Atual : Int64 ;
                   Progresso_Percentual : Double ;
                   Duracao : LongInt ;
                   Codec_Video : String ;
                   Rate : LongInt ;
                   Status_Load : Boolean ;
                   Status_Play : Boolean ;
                   Status_Pause : Boolean ;
                   Frame_Atual : LongInt ;
                   Frame_Total : LongInt ;
                   Time_Atual : LongInt ;
                   Time_Total : LongInt ;
                   Cnt_Progress : LongInt ;
                   Tick_Progress : Cardinal ;
                   Last_Ultimo_Play : Double ;
                   End ;

Procedure MEDIA_FREE_VIDEO ( Canal : LongInt ) ;
Function GET_VIDEO_AJUSTES : String ;
Procedure MEDIA_AUDIO_SET_DELAY ( Canal : LongInt ; _Delay_us : LongInt ) ;
Procedure MEDIA_TOGGLE_FULLSCREEN ( Canal : LongInt ) ;
Procedure MEDIA_SET_RATE ( Canal : LongInt ; Rate : LongInt ) ;
Function MEDIA_GET_RATE ( CB : TComboBox ) : LongInt ;
Procedure MEDIA_STOP ( Canal : LongInt ) ;
Procedure MEDIA_SET_TIME ( Canal : LongInt ; Posicao : LongInt ) ;
Procedure MEDIA_SET_POSITION ( Canal : LongInt ; Posicao : Double ) ;
Procedure MEDIA_SET_POSITION_PERCENTUAL ( Canal : LongInt ; Posicao : Double ) ;
Function MEDIA_GET_TIME ( Canal : LongInt ) : LongInt ;
Function MEDIA_GET_FRAME_ATUAL : LongInt ;
Procedure MEDIA_AJUSTE_DE_VIDEO ( Flag_Ajustar: Integer ;
                                  Contrast: Double; Brightness : Double; Hue : Double;
                                  Saturation : Double; Gamma : Double ) ;
Function MEDIA_GET_DURACAO ( Canal : LongInt ) : LongInt ;
Procedure MEDIA_PAUSE ( Canal : LongInt ) ;
Procedure MEDIA_PLAY_PAUSE ( Canal : LongInt ) ;
Procedure MEDIA_PLAY ( Canal : LongInt ; Origem : String ) ;
Procedure MEDIA_LOAD ( Canal : LongInt ; FN : String ;
                       PN : TPanel ; ED : TEdit ;
                       CB : TComboBox ) ;
(*
Procedure MEDIA_LOAD_PLAY ( Canal : LongInt ; FN : String ;
                            PN : TPanel ; ED : TEdit ;
                            CB : TComboBox ; SL : TRxSlider ;
                            Play : Boolean ; Origem : String ) ;
*)
Procedure MEDIA_AUDIO_SET_MUTE ( Canal : LongInt ; Mute : Boolean ) ;
Function MEDIA_GET_STATE_INT ( Canal : LongInt ) : LongInt ;
Function MEDIA_IS_PLAYING ( Canal : LongInt ) : Boolean ;
Procedure MEDIA_TakeSnapshot ( FN : String ; Largura, Altura : LongInt ) ;
Procedure MEDIA_SETAR_MODO_VLC ;
Procedure MEDIA_SETAR_MODO_WMP ;
Procedure MEDIA_SETAR_MODO_MEDIA_PLAYER ;
Procedure MEDIA_FRAME_MENOS ( Canal : LongInt; Frames : LongInt ) ;
Procedure MEDIA_FRAME_MAIS ( Canal : LongInt; Frames : LongInt ) ;
Procedure MEDIA_SET_PROGRESSO ( _Start, _End, _Atual : Int64 ) ;
Function MEDIA_GET_CODEC_NAME : String ;
Procedure MEDIA_ATUALIZAR_STATUS_VIDEO ;
Function MEDIA_GET_FRAME_TOTAL : LongInt ;
Function MEDIA_GET_TIME_TOTAL : LongInt ;
Function MEDIA_GET_NOME_PLAYER : String ;
Procedure MEDIA_VERIFICAR_CURRENT_FRAME ;
Function MEDIA_IS_OPEN : Boolean ;
Procedure INICIALIZAR_REG_VIDEO ( Var Reg : T_REG_VIDEO ) ;

Var MODO_VLC                  : Boolean = FALSE ;
    MODO_WMP                  : Boolean = TRUE ;
    MODO_MITOK                : Boolean = FALSE ;
    xMODO_MEDIA_PLAYER        : Boolean = FALSE ;
    REG_VIDEO                 : T_REG_VIDEO ;
    MEDIA_ME_STATUS_VIDEO     : TMemo = Nil ;
    Flag_Get_Length_Pendente  : Boolean = FALSE ;

Implementation

Procedure INICIALIZAR_REG_VIDEO ( Var Reg : T_REG_VIDEO ) ;
Begin
With Reg Do Begin
   Player := '' ;
   Progresso_Start := 0 ;
   Progresso_End := 0 ;
   Progresso_Atual := -1 ;
   Progresso_Percentual := 0 ;
   Duracao := 0 ;
   Codec_Video := '' ;
   Rate := 0 ;
   Status_Load := FALSE ;
   Status_Play := FALSE ;
   Status_Pause := FALSE ;
   Frame_Atual := -1 ;
   Frame_Total := -1 ;
   Time_Atual := -1 ;
   Time_Total := -1 ;
   Cnt_Progress := 0 ;
   Tick_Progress := GetTickCount ;
   Last_Ultimo_Play := 0 ;
End ;
End ;

Procedure MEDIA_FREE_VIDEO ( Canal : LongInt ) ;
Begin
If MODO_VLC Then Begin
End Else If MODO_WMP Then Begin
   MP_FREE_VIDEO ( Canal ) ;
End Else If xMODO_MEDIA_PLAYER Then Begin
End ;
End ;

Function GET_VIDEO_AJUSTES : String ;
Begin
Result := 'Atv: ' + IntToStr ( MEDIA_Ajuste_Ativo ) + ', ' +
          'Bri: ' + CASA_2 ( MEDIA_Ajuste_Brightness ) + ', ' +
          'Con: ' + CASA_2 ( MEDIA_Ajuste_Contrast ) + ', ' +
          'Hue: ' + CASA_2 ( MEDIA_Ajuste_Hue ) + ', ' +
          'Gam: ' + CASA_2 ( MEDIA_Ajuste_Gamma ) + ', ' +
          'Sat: ' + CASA_2 ( MEDIA_Ajuste_Saturation ) ;
End ;

Procedure MEDIA_AUDIO_SET_DELAY ( Canal : LongInt ; _Delay_us : LongInt ) ;
Begin
If MODO_VLC Then Begin
   VLC_AUDIO_SET_DELAY ( Canal, _Delay_us ) ;
End Else If MODO_WMP Then Begin
End Else If xMODO_MEDIA_PLAYER Then Begin
End ;
End ;

Procedure MEDIA_TOGGLE_FULLSCREEN ( Canal : LongInt ) ;
Begin
If MODO_VLC Then Begin
   VLC_TOGGLE_FULLSCREEN ( 1 ) ;
End Else If MODO_WMP Then Begin
End Else If xMODO_MEDIA_PLAYER Then Begin
End ;
End ;

Procedure MEDIA_SET_RATE ( Canal : LongInt ; Rate : LongInt ) ;
Var Taxa : Double ;
Begin
//Exit ; // RRCT
If MODO_VLC Then Begin
   //VLC_SET_RATE ( 1, Rate ) ;
End Else If MODO_WMP Then Begin
   WMP_Taxa := Rate ;
   Taxa := WMP_Taxa / 100 ;
   MPX.settings.rate := Taxa ;
   PUT_LOG ( 'DEF Rate MP ' + CASA_3 ( MPX.settings.rate ) + ' ' +
             '[Taxa ' + CASA3_PONTO(Taxa) + ']' +
             '[Rate ' + CASA3_PONTO(Rate) + ']' +
             '[Canal ' + IntToStr(Canal) + ']' ) ;
End Else If MODO_MITOK Then Begin
   //MITOK_SET_RATE ( 1, Rate ) ;
End Else If xMODO_MEDIA_PLAYER Then Begin
End ;
REG_VIDEO.Rate := Rate ;
End ;

Function MEDIA_GET_RATE ( CB : TComboBox ) : LongInt ;
Begin
//Result := 50 ;
//Exit ;
If MODO_MITOK Then Begin
   //Result := TRUNC ( MITOK_GET_RATE ( 1 ) * 100 ) ;
End Else If CB.ItemIndex = -1 Then Begin
   //PUT_LOG ( '1/CB.ItemIndex = -1' ) ;
   Result := 100 ;
End Else Begin
   //PUT_LOG ( '2/CB.ItemIndex = -1' ) ;
   Result := StrToIntDef ( CB.Text, 100 ) ; // StrToIntDef ( CB.Items[CB.ItemIndex], 100 ) ;
End 
End ;

Procedure MEDIA_SET_TIME ( Canal : LongInt ; Posicao : LongInt ) ;
Begin
If MODO_VLC Then Begin
   VLC_SET_TIME ( 1, Posicao ) ;
   //VLC_SET_POSITION ( 1, Posicao ) ;
End Else If MODO_WMP Then Begin
   MP_SET_TIME ( 1, Posicao ) ;
End Else If MODO_MITOK Then Begin
   //MITOK_SET_TIME ( Posicao ) ;
End Else If xMODO_MEDIA_PLAYER Then Begin
End ;
End ;

Procedure MEDIA_SET_POSITION ( Canal : LongInt ; Posicao : Double ) ;
Begin
If MODO_VLC Then Begin
   VLC_SET_POSITION ( 1, Posicao ) ;
End Else If MODO_WMP Then Begin
   //MP_SET_POSITION ( 1, Posicao ) ;
End Else If MODO_WMP Then Begin
   ///MITOK_SET_POSITION ( 1, TRUNC ( Posicao ) ) ;
End Else If xMODO_MEDIA_PLAYER Then Begin
End ;
End ;

Procedure MEDIA_SET_POSITION_PERCENTUAL ( Canal : LongInt ; Posicao : Double ) ;
Begin
If MODO_VLC Then Begin
   VLC_SET_POSITION_PERCENTUAL ( 1, Posicao ) ;
End Else If MODO_WMP Then Begin
   //MP_SET_POSITION ( 1, Posicao ) ;
End Else If MODO_MITOK Then Begin
   //MITOK_SET_POSITION_PERCENTUAL ( 1, Posicao ) ;
End Else If xMODO_MEDIA_PLAYER Then Begin
End ;
End ;

Function MEDIA_GET_TIME ( Canal : LongInt ) : LongInt ;
Begin
If MODO_VLC Then Begin
   Result := VLC_GET_TIME(1) ;
End Else If MODO_WMP Then Begin
   Result := MP_GET_TIME(1) ;
End Else If MODO_MITOK Then Begin
   //Result := MITOK_GET_TIME ;
End Else If xMODO_MEDIA_PLAYER Then Begin
   Result := -1 ;
End Else Begin
   Result := -2 ;
End ;
End ;

Function MEDIA_GET_FRAME_ATUAL : LongInt ;
Begin
If MODO_VLC Then Begin
   Result := VLC_GET_TIME(1) ;
End Else If MODO_WMP Then Begin
   Result := MP_GET_TIME(1) ;
End Else If MODO_MITOK Then Begin
   //Result := MITOK_GET_FRAME_ATUAL ;
End Else If xMODO_MEDIA_PLAYER Then Begin
   Result := -1 ;
End Else Begin
   Result := -2 ;
End ;
End ;

Function MEDIA_GET_DURACAO ( Canal : LongInt ) : LongInt ;
Begin
If MODO_VLC Then Begin
   Result := VLC_GET_DURACAO ( Canal ) ;
End Else If MODO_WMP Then Begin
   Result := MP_GET_LENGTH ( Canal ) ;
End Else If MODO_MITOK Then Begin
   //Result := MITOK_GET_DURACAO ;
End Else If xMODO_MEDIA_PLAYER Then Begin
   Result := -1
End Else Begin
   Result := -2 ;
End ;
REG_VIDEO.Duracao := Result ;
End ;

Procedure MEDIA_STOP ( Canal : LongInt ) ;
Begin
If MODO_VLC Then Begin
   VLC_STOP ( Canal ) ;
End Else If MODO_WMP Then Begin
   MP_STOP ( Canal ) ;
End Else If MODO_MITOK Then Begin
   //MITOK_STOP ( Canal ) ;
   //MITOK_DISABLE ;
End Else If xMODO_MEDIA_PLAYER Then Begin
End Else Begin
End ;
End ;

Procedure MEDIA_PLAY_PAUSE ( Canal : LongInt ) ;
Begin
MEDIA_PLAY ( Canal, 'MEDIA_PLAY_PAUSE' ) ;
MEDIA_PAUSE ( Canal ) ;
End ;

Procedure MEDIA_PAUSE ( Canal : LongInt ) ;
Begin
If MODO_VLC Then Begin
   VLC_PAUSE ( Canal ) ;
End Else If MODO_WMP Then Begin
   If MP_IS_PLAYING ( Canal ) Then Begin
      MP_PAUSE ( Canal )
   End Else Begin
      MP_PLAY ( Canal, PARAMETRIZAR_FALSE ) ;
   End ;
End Else If MODO_MITOK Then Begin
   //MITOK_PAUSE ( Canal ) ;
End Else If xMODO_MEDIA_PLAYER Then Begin
End Else Begin
End ;
End ;

Procedure MEDIA_AJUSTE_DE_VIDEO ( Flag_Ajustar: Integer ;
                                  Contrast: Double; Brightness : Double; Hue : Double;
                                  Saturation : Double; Gamma : Double ) ;
Begin
If MODO_VLC Then Begin
   VLC_AdjustVideo ( Flag_Ajustar, Contrast, Brightness, Hue, Saturation, Gamma) ;
End Else If MODO_WMP Then Begin
End Else If xMODO_MEDIA_PLAYER Then Begin
End ;
End ;

Procedure MEDIA_PLAY ( Canal : LongInt ; Origem : String ) ;
Begin
If MODO_VLC Then Begin
   VLC_PLAY ( Canal, Origem ) ;
End Else If MODO_WMP Then Begin
   MP_PLAY ( Canal, PARAMETRIZAR_FALSE ) ;
End Else If MODO_MITOK Then Begin
   //MITOK_PLAY ( Canal ) ;
End Else If xMODO_MEDIA_PLAYER Then Begin
End ;
End ;

Procedure MEDIA_LOAD ( Canal : LongInt ; FN : String ;
                       PN : TPanel ; ED : TEdit ;
                       CB : TComboBox ) ;
Var SC  : PAnsiChar ;
Begin
_Debug ( 'INI MEDIA-LOAD' ) ;
If MODO_VLC Then Begin
   _Debug ( '1 MODO_VLC MEDIA-LOAD' ) ;
   //Aux := String ( FN ) ;
   SC := PAnsiChar ( AnsiString ( FN ) ) ;
   //FN2 := PAnsiChar ( FN ) ;
   //PUT_LOG ( 'VLC_MEDIA_LOAD/1 [' + Aux + ']' ) ;
   PUT_LOG ( 'VLC_MEDIA_LOAD/2 [' + FN + ']' ) ;
   PUT_LOG ( 'VLC_MEDIA_LOAD/3 [' + SC + ']' ) ;
   _Debug ( '2 MODO_VLC MEDIA-LOAD' ) ;
   VLC_STOP ( Canal ) ;
   _Debug ( '3 MODO_VLC MEDIA-LOAD' ) ;
   VLC_LOAD ( Canal, SC, PN, ED ) ;
   _Debug ( '4 MODO_VLC MEDIA-LOAD' ) ;
   VLC_SET_RATE ( Canal, MEDIA_GET_RATE ( CB ) ) ;
   _Debug ( 'FIM MODO_VLC MEDIA-LOAD' ) ;
End Else If MODO_WMP Then Begin
   _Debug ( '1 MODO_WMP MEDIA-LOAD' ) ;
   MP_OPEN ( Canal, FN, TRUE, {Nil, }PARAMETRIZAR_TRUE, ED ) ;
   _Debug ( '2 MODO_WMP MEDIA-LOAD' ) ;
End Else If MODO_MITOK Then Begin
   _Debug ( '1 MODO_MITOK MEDIA-LOAD' ) ;
   //MITOK_LOAD ( Canal, FN, PN, ED ) ;
   _Debug ( '2 MODO_MITOK MEDIA-LOAD' ) ;
End Else If xMODO_MEDIA_PLAYER Then Begin
End ;
_Debug ( '2 MEDIA-LOAD' ) ;
REG_VIDEO.Frame_Total := MEDIA_GET_FRAME_TOTAL ;
_Debug ( '3 MEDIA-LOAD' ) ;
REG_VIDEO.Time_Total := MEDIA_GET_TIME_TOTAL ;
_Debug ( '4 MEDIA-LOAD' ) ;
Flag_Get_Length_Pendente := TRUE ;
_Debug ( 'FIM MEDIA-LOAD' ) ;
End ;

(*
Procedure MEDIA_LOAD_PLAY ( Canal : LongInt ; FN : String ;
                            PN : TPanel ; ED : TEdit ;
                            CB : TComboBox ; SL : TRxSlider ;
                            Play : Boolean ;
                            Origem : String ) ;
//Var FN2 : PAnsiChar ;
//Var Aux : String ;
//    SC  : PAnsiChar ;
Begin
_Debug ( 'INI MEDIA-LOAD_PLAY' ) ;
PUT_LOG ( 'MEDIA_LOAD_PLAY [' + FN + ']' ) ;
If MODO_VLC Then Begin
   _Debug ( '1 MODO_VLC MEDIA-LOAD_PLAY' ) ;
   PUT_LOG ( 'MEDIA_LOAD_PLAY - VLC [' + FN + ']' ) ;
   //Aux := String ( FN ) ;
   //SC := PAnsiChar ( FN ) ;
   //FN2 := PAnsiChar ( FN ) ;
   //PUT_LOG ( 'VLC_MEDIA_LOAD/1 [' + Aux + ']' ) ;
   //PUT_LOG ( 'VLC_MEDIA_LOAD/2 [' + FN + ']' ) ;
   //PUT_LOG ( 'VLC_MEDIA_LOAD/3 [' + SC + ']' ) ;
   ED.Text := FN ;
   _Debug ( '2 MODO_VLC MEDIA-LOAD_PLAY' ) ;
   VLC_STOP ( Canal ) ;
   _Debug ( '3 MODO_VLC MEDIA-LOAD_PLAY' ) ;
   //SC := PAnsiChar ( 'C:\util\debate.mp4' ) ;
   PUT_LOG ( 'VLC_MEDIA_LOAD/4 [' + FN + ']' ) ;
   _Debug ( '4 MODO_VLC MEDIA-LOAD_PLAY' ) ;
   VLC_LOAD ( Canal, PAnsiChar(AnsiString(FN)), PN, ED ) ;
   _Debug ( '5 MODO_VLC MEDIA-LOAD_PLAY' ) ;
   VLC_SET_RATE ( Canal, MEDIA_GET_RATE ( CB ) ) ;
   _Debug ( '6 MODO_VLC MEDIA-LOAD_PLAY' ) ;
   If Play Then Begin
      _Debug ( '7 MODO_VLC MEDIA-LOAD_PLAY' ) ;
      VLC_PLAY ( Canal, 'MEDIA_LOAD_PLAY/' + Origem ) ;
      _Debug ( '8 MODO_VLC MEDIA-LOAD_PLAY' ) ;
   End ;
   _Debug ( '9 MODO_VLC MEDIA-LOAD_PLAY' ) ;
End Else If MODO_WMP Then Begin
   _Debug ( '1 MODO_WMP MEDIA-LOAD_PLAY' ) ;
   PUT_LOG ( 'MEDIA_LOAD_PLAY - WMP [' + FN + ']' ) ;
   ED.Text := FN ;
   //ShowMessage ( 'F2' ) ;
   _Debug ( '2 MODO_WMP MEDIA-LOAD_PLAY' ) ;
   MP_OPEN ( Canal, FN, Play, {Nil,} PARAMETRIZAR_TRUE, ED ) ;
   //ShowMessage ( 'G2' ) ;
   _Debug ( '3 MODO_WMP MEDIA-LOAD_PLAY' ) ;
   If Play Then Begin
      //ShowMessage ( 'H2' ) ;
      _Debug ( '4 MODO_WMP MEDIA-LOAD_PLAY' ) ;
      MP_PLAY ( Canal, PARAMETRIZAR_FALSE ) ;
      //ShowMessage ( 'I2' ) ;
   End ;
   _Debug ( '5 MODO_WMP MEDIA-LOAD_PLAY' ) ;
End Else If MODO_MITOK Then Begin
   _Debug ( '1 MODO_MITOK MEDIA-LOAD_PLAY' ) ;
   MITOK_LOAD ( Canal, FN, PN, ED ) ;
   _Debug ( '2 MODO_MITOK MEDIA-LOAD_PLAY' ) ;
   MITOK_PLAY ( Canal ) ;
   _Debug ( '3 MODO_MITOK MEDIA-LOAD_PLAY' ) ;
End Else If xMODO_MEDIA_PLAYER Then Begin
   PUT_LOG ( 'MEDIA_LOAD_PLAY - MEDIA_PLAYER [' + FN + ']' ) ;
End Else Begin
   PUT_LOG ( 'MEDIA_LOAD_PLAY - ELSE [' + FN + ']' ) ;
End ;
_Debug ( '2 MEDIA-LOAD_PLAY' ) ;
REG_VIDEO.Frame_Total := MEDIA_GET_FRAME_TOTAL ;
_Debug ( '3 MEDIA-LOAD_PLAY' ) ;
REG_VIDEO.Time_Total := MEDIA_GET_TIME_TOTAL ;
_Debug ( '4 MEDIA-LOAD_PLAY' ) ;
Flag_Get_Length_Pendente := TRUE ;
_Debug ( 'FIM MEDIA-LOAD_PLAY' ) ;
End ;
*)

Procedure MEDIA_AUDIO_SET_MUTE ( Canal : LongInt ; Mute : Boolean ) ;
Begin
If MODO_VLC Then Begin
   VLC_AUDIO_SET_MUTE ( Canal, Mute ) ;
End Else If MODO_WMP Then Begin
End Else If MODO_MITOK Then Begin
End Else If xMODO_MEDIA_PLAYER Then Begin
End ;
End ;

Function MEDIA_GET_STATE_INT ( Canal : LongInt ) : LongInt ;
Begin
If MODO_VLC Then Begin
   Result := VLC_GET_STATE_INT ( Canal ) ;
End Else If MODO_WMP Then Begin
   Result := MP_GET_STATE_INT ( Canal ) ;
End Else If MODO_MITOK Then Begin
   //Result := MITOK_GET_STATE_INT ( Canal ) ;
End Else If xMODO_MEDIA_PLAYER Then Begin
   Result := -1 ;
End Else Begin
   Result := -1 ;
End ;
End ;

Function MEDIA_IS_PLAYING ( Canal : LongInt ) : Boolean ;
Begin
If MODO_VLC Then Begin
   Result := VLC_IS_PLAYING ;
End Else If MODO_WMP Then Begin
   Result := MP_IS_PLAYING ( Canal ) ;
End Else If MODO_MITOK Then Begin
   //Result := MITOK_IS_PLAYING ;
End Else If xMODO_MEDIA_PLAYER Then Begin
   Result := FALSE ;
End Else Begin
   Result := FALSE ;
End ;
End ;

Procedure MEDIA_TakeSnapshot ( FN : String ; Largura, Altura : LongInt ) ;
Begin
If MODO_VLC Then Begin
   VLC_TakeSnapshot (FN, 1920, 1080) ;
End Else If MODO_WMP Then Begin
End Else If MODO_MITOK Then Begin
   //MITOK_TakeSnapshot (FN, 1920, 1080) ;
End Else If xMODO_MEDIA_PLAYER Then Begin
End ;
End ;

Procedure MEDIA_SETAR_MODO_VLC ;
Begin
//MODO_VLC := TRUE ;
//xMODO_MEDIA_PLAYER := FALSE ;
//MODO_WMP := FALSE ;
End ;

Procedure MEDIA_SETAR_MODO_WMP ;
Begin
//MODO_VLC := FALSE ;
//MODO_WMP := TRUE ;
//xMODO_MEDIA_PLAYER := FALSE ;
End ;

Procedure MEDIA_SETAR_MODO_MEDIA_PLAYER ;
Begin
//MODO_VLC := FALSE ;
//MODO_WMP := FALSE ;
//xMODO_MEDIA_PLAYER := TRUE ;
End ;

Procedure MEDIA_FRAME_MENOS ( Canal : LongInt; Frames : LongInt ) ;
Begin
If MODO_VLC Then Begin
   VLC_PREVIOUS_FRAME ( Canal ) ;
End Else If MODO_WMP Then Begin
   MP_FRAME_MENOS ( Canal, Frames ) ;
End Else If MODO_MITOK Then Begin
   //MITOK_FRAME_MENOS ( Frames ) ;
End Else If xMODO_MEDIA_PLAYER Then Begin
End ;
End ;

Procedure MEDIA_FRAME_MAIS ( Canal : LongInt; Frames : LongInt ) ;
Begin
If MODO_VLC Then Begin
   VLC_NEXT_FRAME ( Canal ) ;
End Else If MODO_WMP Then Begin
   MP_FRAME_MAIS ( Canal, Frames ) ;
End Else If MODO_MITOK Then Begin
   //MITOK_FRAME_MAIS ( Frames ) ;
End Else If xMODO_MEDIA_PLAYER Then Begin
End ;
End ;

Function MEDIA_GET_CODEC_NAME : String ;
Begin
If MODO_VLC Then Begin
   Result := '' ; //
End Else If MODO_WMP Then Begin
   Result := '' ; //
End Else If MODO_MITOK Then Begin
   //Result := MITOK_GET_CODEC ;
End Else If xMODO_MEDIA_PLAYER Then Begin
   Result := ''
End Else Begin
   Result := '' ;
End ;
End ;

Procedure MEDIA_SET_PROGRESSO ( _Start, _End, _Atual : Int64 ) ;
Begin
Try
   REG_VIDEO.Progresso_Start := _Start ;
   REG_VIDEO.Progresso_End := _End ;
   REG_VIDEO.Progresso_Atual := _Atual ;
   If _End > 0 Then Begin
      REG_VIDEO.Progresso_Percentual := _Atual * 100 / _End
   End Else Begin
      REG_VIDEO.Progresso_Percentual := 0 ;
   End ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception MEDIA_SET_PROGRESSO End ' + IntToStr(_End) + ' [' + E.Message + ']' ) ;
   End ;
End ;
End ;

Procedure MEDIA_ATUALIZAR_STATUS_VIDEO ;
Var Aux       : String ;
    Progresso : String ;
Begin
If NOT Assigned ( MEDIA_ME_STATUS_VIDEO ) Then Begin
   PUT_LOG ( 'MEDIA_ATUALIZAR_STATUS_VIDEO - NOT Assigned' ) ;
   Exit ;
End ;
{
If ( GetTickCount - REG_VIDEO.Tick_Progress ) > 100 Then
   Begin
   REG_VIDEO.Progresso_Atual := MEDIA_GET_FRAME_ATUAL ;
   REG_VIDEO.Progresso_End := MEDIA_GET_FRAME_TOTAL ;
   End ;
}
If REG_VIDEO.Progresso_End = 0 Then Begin
   Progresso := ''
End Else Begin
   Progresso := 'Progresso: ' + IntToStr(REG_VIDEO.Progresso_Atual) + '/' +
                IntToStr(REG_VIDEO.Progresso_End) + ' (' +
                CASA1_PONTO(REG_VIDEO.Progresso_Percentual) + '%)' + sLineBreak ;
End ;
Aux := 'Player: ' + REG_VIDEO.Player + sLineBreak +
       'Codec_Video: ' + REG_VIDEO.Codec_Video + sLineBreak +
       'Time: ' + DateTimeToStr(Now) + sLineBreak +
       'Progresso Ini: ' + IntToStr(REG_VIDEO.Progresso_Start) + sLineBreak +
       'Progresso Fim: ' + IntToStr(REG_VIDEO.Progresso_End) + sLineBreak +
       'Progresso Atual: ' + IntToStr(REG_VIDEO.Progresso_Atual) + sLineBreak +
       Progresso +
       'Duracao: ' + IntToStr(REG_VIDEO.Duracao) + sLineBreak +
       'Rate: ' + IntToStr(REG_VIDEO.Rate) + sLineBreak +
       'Status_Load: ' + IFSN(REG_VIDEO.Status_Load) + sLineBreak +
       'Status_Play: ' + IFSN(MEDIA_IS_PLAYING(1)) + sLineBreak +
       'Status_Pause: ' + IFSN(REG_VIDEO.Status_Pause) + sLineBreak +
       'Frame_Atual: ' + IntToStr(REG_VIDEO.Frame_Atual) + sLineBreak +
       'Frame_Total: ' + IntToStr(REG_VIDEO.Frame_Total) + sLineBreak +
       'Time_Atual: ' + IntToStr(REG_VIDEO.Time_Atual) + sLineBreak +
       'Time_Total: ' + IntToStr(REG_VIDEO.Time_Total) + sLineBreak +
       'Last_Play: ' + CASA3_PONTO(REG_VIDEO.Last_Ultimo_Play/1000) + sLineBreak +
       'Progressos: ' + IntToStr(REG_VIDEO.Cnt_Progress) + sLineBreak ;
MEDIA_ME_STATUS_VIDEO.Text := Aux ;
End ;

Function MEDIA_GET_FRAME_TOTAL : LongInt ;
Begin
If MODO_MITOK Then Begin
   //Result := MITOK_GET_FRAME_TOTAL
End Else Begin
   Result := 0 ;
End ;
End ;

Function MEDIA_GET_TIME_TOTAL : LongInt ;
Begin
If MODO_MITOK Then Begin
   //Result := MITOK_GET_TIME_TOTAL
End Else Begin
   Result := 0 ;
End ;
End ;

Function MEDIA_GET_NOME_PLAYER : String ;
Begin
If MODO_VLC Then
   Result := 'VLC'
Else If MODO_VLC Then
   Result := 'MediaPlayer'
Else If MODO_MITOK Then
   Result := 'Mitok'
Else
   Result := '' ;
End ;

Procedure MEDIA_VERIFICAR_CURRENT_FRAME ;
Begin
If MODO_MITOK Then Begin
   MEDIA_Old_Current_Frame := MEDIA_Current_Frame ;
   MEDIA_Current_Frame := MEDIA_GET_FRAME_ATUAL ;
End ;
End ;

Function MEDIA_IS_OPEN : Boolean ;
Begin
If MODO_VLC Then
   Result := TRUE
Else If MODO_VLC Then
   Result := TRUE
Else If MODO_MITOK Then
   //Result := MITOK_IS_OK
Else
   Result := FALSE ;
End ;

End.

