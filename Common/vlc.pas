unit vlc;

interface

Uses
  Misc_Def_U, Misc_Const_U, Misc_Type_U,
  Winapi.Windows, Winapi.Messages, System.SysUtils,
  System.Variants, System.Classes, Vcl.Graphics,
  Misc_U, Log_U,
  Math, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  //Vcl.MPlayer,
  Vcl.ExtCtrls, Vcl.StdCtrls,
  //System.Win.ScktComp,
  Vcl.ComCtrls ;

Type

  plibvlc_instance_t        = type Pointer ;
  plibvlc_media_player_t    = type Pointer ;
  plibvlc_media_t           = type Pointer ;

  Tipo_State                = ( libvlc_NothingSpecial ,
                                libvlc_Opening ,
                                libvlc_Buffering ,
                                libvlc_Playing ,
                                libvlc_Paused ,
                                libvlc_Stopped ,
                                libvlc_Ended ,
                                libvlc_Error,
                                libvlc_Indef ) ;
  libvlc_video_adjust_option_t = ( libvlc_adjust_Enable ,
                                   libvlc_adjust_Contrast,
                                   libvlc_adjust_Brightness,
                                   libvlc_adjust_Hue,
                                   libvlc_adjust_Saturation,
                                   libvlc_adjust_Gamma
                                  ) ;

Var
  libvlc_media_new_path              : function(p_instance : Plibvlc_instance_t; path : PAnsiChar) : Plibvlc_media_t; cdecl;
  libvlc_media_new_location          : function(p_instance : plibvlc_instance_t; psz_mrl : PAnsiChar) : Plibvlc_media_t; cdecl;
  libvlc_media_player_new_from_media : function(p_media : Plibvlc_media_t) : Plibvlc_media_player_t; cdecl;
  libvlc_media_player_set_hwnd       : procedure(p_media_player : Plibvlc_media_player_t; drawable : Pointer); cdecl;
  libvlc_media_player_play           : procedure(p_media_player : Plibvlc_media_player_t); cdecl;
  libvlc_toggle_fullscreen           : procedure(p_media_player : Plibvlc_media_player_t); cdecl;
  libvlc_media_player_stop           : procedure(p_media_player : Plibvlc_media_player_t); cdecl;
  libvlc_media_player_pause          : procedure(p_media_player : Plibvlc_media_player_t); cdecl;
  libvlc_media_player_set_pause      : procedure(p_media_player : Plibvlc_media_player_t; Pausa : LongInt ); cdecl;
  libvlc_media_player_can_pause      : function(p_media_player : Plibvlc_media_player_t) : Boolean; cdecl;
  libvlc_audio_set_volume            : function(p_media_player : Plibvlc_media_player_t; Volume : LongInt ) : LongInt ; cdecl;
  libvlc_audio_toggle_mute           : procedure(p_media_player : Plibvlc_media_player_t); cdecl;
  libvlc_audio_set_mute              : procedure(p_media_player : Plibvlc_media_player_t; Mute : Boolean ); cdecl;
  libvlc_audio_set_delay             : procedure(p_media_player : Plibvlc_media_player_t; Delay : Int64 ); cdecl;
  libvlc_media_player_release        : procedure(p_media_player : Plibvlc_media_player_t); cdecl;
  libvlc_media_player_is_playing     : function(p_media_player : Plibvlc_media_player_t) : Integer; cdecl;
  libvlc_media_player_will_play      : function(p_media_player : Plibvlc_media_player_t) : Boolean; cdecl;
  libvlc_get_version                 : function : String; cdecl;
  libvlc_get_compiler                : function : String; cdecl;
  libvlc_media_player_get_state      : function (p_media : Plibvlc_media_t) : Tipo_State ; cdecl;
  libvlc_media_release               : procedure(p_media : Plibvlc_media_t); cdecl;
  libvlc_media_player_set_rate       : function (p_media : Plibvlc_media_t; rate : Double ) : Integer ; cdecl;
  libvlc_media_player_get_time	    : function (p_media_player : Plibvlc_media_player_t) : LongInt ; cdecl ;
  libvlc_media_player_get_length     : function (p_media_player : Plibvlc_media_player_t) : LongInt ; cdecl ;
  libvlc_media_player_set_time	    : procedure (p_media_player : Plibvlc_media_player_t; time : LongInt ) ; cdecl ;
  libvlc_media_player_set_position   : procedure (p_media_player : Plibvlc_media_player_t; Posicao : Double ) ; cdecl ;
  libvlc_media_player_next_frame     : procedure(p_media_player : Plibvlc_media_player_t); cdecl;
//  input_item_GetTitle                : function(argc : Integer; argv : PAnsiChar) : String; cdecl ;
  libvlc_new                         : function(argc : Integer; argv : PAnsiChar) : Plibvlc_instance_t; cdecl ;
  libvlc_release                     : procedure(p_instance : Plibvlc_instance_t); cdecl ;
  libvlc_video_take_snapshot         : procedure(p_media_player : Plibvlc_media_player_t;
                                                 num : Integer; lepath : PAnsiChar;
                                                 width, height : Integer); cdecl ;
  libvlc_video_get_adjust_int        : function(p_mi: Plibvlc_media_player_t; option: libvlc_video_adjust_option_t): Integer; cdecl;
  libvlc_video_set_adjust_int        : procedure(p_mi: Plibvlc_media_player_t; option: libvlc_video_adjust_option_t; value: Integer); cdecl;
  libvlc_video_get_adjust_float      : function(p_mi: Plibvlc_media_player_t; option: libvlc_video_adjust_option_t): Single; cdecl;
  libvlc_video_set_adjust_float      : procedure(p_mi: Plibvlc_media_player_t; option: libvlc_video_adjust_option_t; value: Single); cdecl;
  vlcLib                             : Integer ;
  vlcInstance                        : plibvlc_instance_t ;
  vlcMedia                           : plibvlc_media_t ;
  vlcMediaPlayer                     : plibvlc_media_player_t = Nil ;

  SL_Erros_vlc                       : TStringList ;

Function VLC_GetVLCLibPath : String ;
Function VLC_LoadVLCLibrary ( APath : String ) : Integer ;
Function VLC_GetAProcAddress ( handle: Integer ; Var addr : Pointer ;
                               procName: String; failedList: TStringList) : Integer ;
Function VLC_LoadVLCFunctions ( vlcHandle: Integer; failedList: TStringList ) : Boolean ;
Procedure VLC_TOGGLE_FULLSCREEN ( Indice : LongInt ) ;
Procedure VLC_LOAD ( Indice : LongInt ; FN : PAnsiChar ; PN : TPanel ; ED : TEdit ) ;
procedure VLC_TakeSnapShot ( Path: String ; width, height : Integer ) ;
Procedure VLC_Get_AdjustVideo ;
Procedure VLC_AdjustVideo ( Flag_Ajustar: Integer ;
                            Contrast: Double; Brightness : Double; Hue : Double;
                            Saturation : Double; Gamma : Double) ;
Procedure VLC_PAUSE ( Indice : LongInt ) ;
Function VLC_GET_STATE ( Indice : LongInt ) : Tipo_State ;
Function VLC_GET_STATE_INT ( Indice : LongInt ) : LongInt ;
Procedure VLC_SET_PAUSE ( Indice : LongInt ; Pausa : LongInt ) ;
Function VLC_SET_VOLUME ( Indice : LongInt ; Volume : Integer ) : Integer ;
Procedure VLC_PLAY ( Indice : LongInt ; Origem : String ) ;
Function VLC_WILL_PLAY ( Indice : LongInt ) : Boolean ;
Function VLC_CAN_PAUSE ( Indice : LongInt ) : Boolean ;
Procedure VLC_AUDIO_TOGGLE_MUTE ( Indice : LongInt ) ;
Procedure VLC_AUDIO_SET_MUTE ( Indice : LongInt ; Mute : Boolean ) ;
Procedure VLC_AUDIO_SET_DELAY ( Indice : LongInt ; Delay : Int64 ) ;
Procedure VLC_STOP ( Indice : LongInt ) ;
Procedure VLC_NEXT_FRAME ( Indice : LongInt ) ;
Procedure VLC_PREVIOUS_FRAME ( Indice : LongInt ) ;
Function VLC_GET_TIME ( Indice : LongInt ) : LongInt ;
Function VLC_GET_DURACAO ( Indice : LongInt ) : LongInt ;
Procedure VLC_SET_RATE ( Indice : LongInt ; Rate : Double ) ;
Function VLC_GET_VERSION : String ;
Function VLC_GET_COMPILER : String ;
Procedure VLC_SET_TIME ( Indice : LongInt ; _Time : LongInt ) ;
Procedure VLC_SET_POSITION ( Indice : LongInt ; Posicao : Double ) ;
Procedure VLC_SET_POSITION_PERCENTUAL ( Indice : LongInt ; _Double : Double ) ;
Function VLC_IS_PLAYING : Boolean ;
Function VLC_is_vlcMediaPlayer : Boolean ;

Implementation

Procedure VLC_PUT_ERRO_SL_VLC ( Erro : String ) ;
Begin
SL_Erros_vlc.Add ( 'VLC: ' + Erro ) ;
End ;

// -----------------------------------------------------------------------------
// Read registry to get VLC installation path
// -----------------------------------------------------------------------------
Function VLC_GetVLCLibPath : String ;
{
Var Handle   : HKEY ;
    RegType  : Integer ;
    DataSize : Cardinal ;
    Key      : PWideChar ;
}
Begin
{
Result := '';
//Key := 'Software\VideoLAN\VLC' ;
Key := 'SOFTWARE\WOW6432Node\VideoLAN\VLC' ;
If RegOpenKeyEx(HKEY_LOCAL_MACHINE, Key, 0, KEY_READ, Handle) = ERROR_SUCCESS Then
   Begin
   If RegQueryValueEx(Handle, 'InstallDir', nil, @RegType, nil, @DataSize) = ERROR_SUCCESS Then
      Begin
      SetLength(Result, DataSize);
      RegQueryValueEx(Handle, 'InstallDir', nil, @RegType, PByte(@Result[1]), @DataSize) ;
      Result[DataSize] := '\';
      End
      Else
      Begin
      Showmessage('Error on reading registry') ;
      End ;
   RegCloseKey(Handle) ;
   Result := String(PChar(Result)) ;
   End ;
}
//Result := 'C:\Program Files (x86)\VideoLAN\VLC\' ;
Result := INSERE_BARRA ( ExtractFilePath ( Application.ExeName ) ) + 'vlc\' ;
End ;

// -----------------------------------------------------------------------------
// Load libvlc library into memory
// -----------------------------------------------------------------------------
Function VLC_LoadVLCLibrary(APath: String) : Integer ;
Begin
Result := LoadLibrary ( PWideChar(INSERE_BARRA(APath) + 'libvlccore.dll')) ;
Result := LoadLibrary ( PWideChar(INSERE_BARRA(APath) + 'libvlc.dll')) ;
End ;

// -----------------------------------------------------------------------------
Function VLC_GetAProcAddress ( handle: integer;
                               Var addr: Pointer; procName: String ;
                               failedList: TStringList ): Integer ;
Begin
addr := GetProcAddress(handle, PWideChar(procName)) ;
If Assigned(addr) Then
   Begin
   Result := 0
   End
   Else
   Begin
   If Assigned(failedList) Then
      failedList.Add(procName) ;
   Result := -1 ;
   End ;
End ;

// -----------------------------------------------------------------------------
// Get address of libvlc functions
// -----------------------------------------------------------------------------
Function VLC_LoadVLCFunctions(vlcHandle: integer; failedList: TStringList): Boolean ;
Begin
VLC_GetAProcAddress ( vlcHandle, @libvlc_new, 'libvlc_new', failedList);
VLC_GetAProcAddress ( vlcHandle, @libvlc_media_new_location, 'libvlc_media_new_location', failedList);
VLC_GetAProcAddress ( vlcHandle, @libvlc_media_player_new_from_media, 'libvlc_media_player_new_from_media', failedList);
VLC_GetAProcAddress ( vlcHandle, @libvlc_media_release, 'libvlc_media_release', failedList);
VLC_GetAProcAddress ( vlcHandle, @libvlc_media_player_get_state, 'libvlc_media_player_get_state', failedList ) ;
VLC_GetAProcAddress ( vlcHandle, @libvlc_media_player_set_rate, 'libvlc_media_player_set_rate', failedList ) ;
VLC_GetAProcAddress ( vlcHandle, @libvlc_media_player_set_hwnd, 'libvlc_media_player_set_hwnd', failedList);
VLC_GetAProcAddress ( vlcHandle, @libvlc_media_player_play, 'libvlc_media_player_play', failedList);
VLC_GetAProcAddress ( vlcHandle, @libvlc_toggle_fullscreen, 'libvlc_toggle_fullscreen', failedList);
VLC_GetAProcAddress ( vlcHandle, @libvlc_media_player_stop, 'libvlc_media_player_stop', failedList);
VLC_GetAProcAddress ( vlcHandle, @libvlc_media_player_pause, 'libvlc_media_player_pause', failedList);
VLC_GetAProcAddress ( vlcHandle, @libvlc_audio_set_volume, 'libvlc_audio_set_volume', failedList);
VLC_GetAProcAddress ( vlcHandle, @libvlc_media_player_set_pause, 'libvlc_media_player_set_pause', failedList);
VLC_GetAProcAddress ( vlcHandle, @libvlc_media_player_release, 'libvlc_media_player_release', failedList);
VLC_GetAProcAddress ( vlcHandle, @libvlc_audio_toggle_mute, 'libvlc_audio_toggle_mute', failedList);
VLC_GetAProcAddress ( vlcHandle, @libvlc_audio_set_mute, 'libvlc_audio_set_mute', failedList);
VLC_GetAProcAddress ( vlcHandle, @libvlc_audio_set_delay, 'libvlc_audio_set_delay', failedList);
VLC_GetAProcAddress ( vlcHandle, @libvlc_media_player_next_frame, 'libvlc_media_player_next_frame', failedList);
//VLC_GetAProcAddress ( vlcHandle, @input_item_GetTitle, 'input_item_GetTitle', failedList);
VLC_GetAProcAddress ( vlcHandle, @libvlc_video_get_adjust_int, 'libvlc_video_get_adjust_int', failedList);
VLC_GetAProcAddress ( vlcHandle, @libvlc_video_set_adjust_int, 'libvlc_video_set_adjust_int', failedList);
VLC_GetAProcAddress ( vlcHandle, @libvlc_video_get_adjust_float, 'libvlc_video_get_adjust_float', failedList);
VLC_GetAProcAddress ( vlcHandle, @libvlc_video_set_adjust_float, 'libvlc_video_set_adjust_float', failedList);
VLC_GetAProcAddress ( vlcHandle, @libvlc_release, 'libvlc_release', failedList);
VLC_GetAProcAddress ( vlcHandle, @libvlc_video_take_snapshot, 'libvlc_video_take_snapshot', failedList ) ;
VLC_GetAProcAddress ( vlcHandle, @libvlc_media_player_get_time, 'libvlc_media_player_get_time', failedList ) ;
VLC_GetAProcAddress ( vlcHandle, @libvlc_media_player_get_length, 'libvlc_media_player_get_length', failedList ) ;
VLC_GetAProcAddress ( vlcHandle, @libvlc_media_player_set_time, 'libvlc_media_player_set_time', failedList ) ;
VLC_GetAProcAddress ( vlcHandle, @libvlc_media_player_set_position, 'libvlc_media_player_set_position', failedList ) ;
VLC_GetAProcAddress ( vlcHandle, @libvlc_media_player_is_playing, 'libvlc_media_player_is_playing', failedList);
VLC_GetAProcAddress ( vlcHandle, @libvlc_media_player_will_play, 'libvlc_media_player_will_play', failedList);
VLC_GetAProcAddress ( vlcHandle, @libvlc_get_version, 'libvlc_get_version', failedList);
VLC_GetAProcAddress ( vlcHandle, @libvlc_get_compiler, 'libvlc_get_compiler', failedList);
VLC_GetAProcAddress ( vlcHandle, @libvlc_media_new_path, 'libvlc_media_new_path', failedList);
// if all functions loaded, result is an empty list, otherwise result is a list of functions failed
Result := failedList.Count = 0;
End ;

Procedure VLC_LOAD ( Indice : LongInt ; FN : PAnsiChar ; PN : TPanel ; ED : TEdit ) ;
//Var FN2 : PAnsiChar ;
Begin
_Debug ( 'INI VCL-LOAD [' + FN + ']' ) ;
PUT_LOG ( 'VCL LOAD IDX:' + IntToStr(Indice) + ' [' + FN + ']' ) ;
vlcInstance := libvlc_new ( 0, Nil ) ;
//FN2 := PAnsiChar ( FN ) ;
PUT_LOG ( 'VLC-LOAD [' + FN + ']' ) ;
// create new vlc media from file
//  vlcMedia := libvlc_media_new_path(vlcInstance, 'e:\udp\239.10.10.9.ts') ;
//  vlcMedia := libvlc_media_new_path(vlcInstance, 'C:\util\debate.mp4') ;
_Debug ( '1 VCL-LOAD' ) ;
vlcMedia := libvlc_media_new_path ( vlcInstance, FN ) ;
_Debug ( '1a VCL-LOAD' ) ;
ED.Text := FN ;
//vlcMedia := libvlc_media_new_path(vlcInstance, 'C:\util\testes\daniel.mxf' ) ;
// if you want to play from network, use libvlc_media_new_location instead
// vlcMedia := libvlc_media_new_location(vlcInstance, 'udp://@225.2.1.27:5127') ;
// create new vlc media player
_Debug ( '2 VCL-LOAD' ) ;
vlcMediaPlayer := libvlc_media_player_new_from_media ( vlcMedia ) ;

// now no need the vlc media, free it
_Debug ( '3 VCL-LOAD' ) ;
libvlc_media_release ( vlcMedia ) ;

// play video in a TPanel, if not call this routine, vlc media will open a new window
_Debug ( '4 VCL-LOAD' ) ;
libvlc_media_player_set_hwnd ( vlcMediaPlayer, Pointer(PN.Handle) ) ;

//VLC_Get_AdjustVideo ;
_Debug ( 'FIM VCL-LOAD' ) ;
End ;

Procedure VLC_TakeSnapShot (Path: String; width, height : Integer) ;
// take a snapshot
Begin
PUT_LOG ( 'VCL TakeSnapShot:' + ' [' + Path + ']' ) ;
Try
   If NOT VLC_is_vlcMediaPlayer Then
      Begin
      PUT_LOG ( 'Exit VLC_TakeSnapShot !VMP' ) ;
      Exit ;
      End ;
   //If not Assigned(FPnlOutput) then
   //    exit;
   ForceDirectories ( ExtractFilePath ( Path ) ) ;
   PUT_LOG ( 'SnapShot FN [' + Path + ']' ) ;
   Except
   On E : Exception Do
      Begin
      PUT_LOG ( 'Exception VLC_TakeSnapShot/1 [' + Path +  '][' + E.Message + ']' ) ;
      End ;
   End ;
Try
   libvlc_video_take_snapshot ( vlcMediaPlayer, 0, PAnsiChar(Path), width, height ) ;
   Except
   On E : Exception Do
      Begin
      PUT_LOG ( 'Exception VLC_TakeSnapShot/2 [' + Path +  '][' + E.Message + ']' ) ;
      End ;
   End ;
End ;

Procedure VLC_Get_AdjustVideo ;
Begin
PUT_LOG ( 'VCL GET_ADJUST_VIDEO' ) ;
(*
If NOT VLC_is_vlcMediaPlayer Then
   Begin
   VLC_PUT_ERRO_SL_VLC ( 'Exit VLC_Get_AdjustVideo !VMP' ) ;
   Exit ;
   End ;
Try
   //VLC_Ajuste_Ativo := libvlc_video_get_adjust_int ( vlcMediaPlayer, libvlc_adjust_Enable ) ;
   Except
   VLC_PUT_ERRO_SL_VLC ( 'Exception 1 libvlc_video_get_adjust_int/Ativo' ) ;
   End ;
Try
   MEDIA_Ajuste_Contrast := libvlc_video_get_adjust_float ( vlcMediaPlayer, libvlc_adjust_Contrast ) ;
   Except
   VLC_PUT_ERRO_SL_VLC ( 'Exception 1 libvlc_adjust_get_Contrast' ) ;
   End ;
Try
   MEDIA_Ajuste_Brightness := libvlc_video_get_adjust_float ( vlcMediaPlayer, libvlc_adjust_Brightness ) ;
   Except
   VLC_PUT_ERRO_SL_VLC ( 'Exception 1 libvlc_adjust_get_Brightness' ) ;
   End ;
Try
   MEDIA_Ajuste_Hue := libvlc_video_get_adjust_float ( vlcMediaPlayer, libvlc_adjust_Hue ) ;
   Except
   VLC_PUT_ERRO_SL_VLC ( 'Exception 1 libvlc_adjust_get_Hue' ) ;
   End ;
Try
   MEDIA_Ajuste_Saturation := libvlc_video_get_adjust_float ( vlcMediaPlayer, libvlc_adjust_Saturation ) ;
   Except
   VLC_PUT_ERRO_SL_VLC ( 'Exception 1 libvlc_adjust_get_Saturation' ) ;
   End ;
Try
   MEDIA_Ajuste_Gamma := libvlc_video_get_adjust_float(vlcMediaPlayer, libvlc_adjust_Gamma ) ;
   Except
   VLC_PUT_ERRO_SL_VLC ( 'Exception 1 libvlc_adjust_get_Gamma' ) ;
   End ;
*)
End ;

Procedure VLC_AdjustVideo ( Flag_Ajustar: Integer ;
                            Contrast: Double; Brightness : Double; Hue : Double;
                            Saturation : Double; Gamma : Double) ;
Begin
PUT_LOG ( 'VCL VCL_ADJUST_VIDEO' ) ;
Try
   If NOT VLC_is_vlcMediaPlayer Then
      Begin
      PUT_LOG ( 'Exit VLC_AdjustVideo !VMP' ) ;
      Exit ;
      End ;
   If Flag_Ajustar = 1 Then
      libvlc_video_set_adjust_int(vlcMediaPlayer, libvlc_adjust_Enable, 1)
   Else If Flag_Ajustar = 0 Then
      libvlc_video_set_adjust_int(vlcMediaPlayer, libvlc_adjust_Enable, 0);
   Except
   On E : Exception Do
      Begin
      PUT_LOG ( 'Exception VLC_AdjustVideo/1 [' + E.Message + ']' ) ;
      End ;
   End ;
Try
   If NOT SameValue ( Contrast, -1, 0.001 ) Then
      libvlc_video_set_adjust_float(vlcMediaPlayer, libvlc_adjust_Contrast, Contrast);
   Except
   On E : Exception Do
      Begin
      PUT_LOG ( 'Exception VLC_AdjustVideo/Contraste [' + E.Message + ']' ) ;
      End ;
   End ;
Try
   If NOT SameValue ( Brightness, -1, 0.001 ) Then
      libvlc_video_set_adjust_float(vlcMediaPlayer, libvlc_adjust_Brightness, Brightness);
   Except
   On E : Exception Do
      Begin
      PUT_LOG ( 'Exception VLC_AdjustVideo/Brilho [' + E.Message + ']' ) ;
      End ;
   End ;
Try
   If NOT SameValue ( Hue, -1, 0.001 ) Then
      libvlc_video_set_adjust_float(vlcMediaPlayer, libvlc_adjust_Hue, Hue);
   Except
   On E : Exception Do
      Begin
      PUT_LOG ( 'Exception VLC_AdjustVideo/Hue [' + E.Message + ']' ) ;
      End ;
   End ;
Try
   If NOT SameValue ( Saturation, -1, 0.001 ) Then
      libvlc_video_set_adjust_float(vlcMediaPlayer, libvlc_adjust_Saturation, Saturation);
   Except
   On E : Exception Do
      Begin
      PUT_LOG ( 'Exception VLC_AdjustVideo/Saturation [' + E.Message + ']' ) ;
      End ;
   End ;
Try
   If NOT SameValue ( Gamma, -1, 0.001 ) Then
      libvlc_video_set_adjust_float(vlcMediaPlayer, libvlc_adjust_Gamma, Gamma);
   Except
   On E : Exception Do
      Begin
      PUT_LOG ( 'Exception VLC_AdjustVideo/Gamma [' + E.Message + ']' ) ;
      End ;
   End ;
VLC_Get_AdjustVideo ;
End ;

Procedure VLC_PAUSE ( Indice : LongInt ) ;
Begin
PUT_LOG ( 'VCL PAUSE' ) ;
Try
   If NOT VLC_is_vlcMediaPlayer Then
      Begin
      PUT_LOG ( 'Exit VLC_PAUSE !VMP' ) ;
      Exit ;
      End ;
   Except
   On E : Exception Do
      Begin
      PUT_LOG ( 'Exception VLC_PAUSE/1 [' + E.Message + ']' ) ;
      End ;
   End ;
Try
   libvlc_media_player_pause(vlcMediaPlayer) ;
   Except
   On E : Exception Do
      Begin
      PUT_LOG ( 'Exception VLC_PAUSE/2 [' + E.Message + ']' ) ;
      End ;
   End ;
End ;

Function VLC_GET_STATE ( Indice : LongInt ) : Tipo_State ;
Begin
PUT_LOG ( 'VCL GET_STATE]' ) ;
Try
   If NOT VLC_is_vlcMediaPlayer Then
      Begin
      Result := libvlc_Indef ;
      PUT_LOG ( 'Exit VLC_GET_STATE !VMP' ) ;
      Exit ;
      End ;
   Except
   On E : Exception Do
      Begin
      PUT_LOG ( 'Exception VLC_GET_STATE/1 [' + E.Message + ']' ) ;
      End ;
   End ;
Try
   Result := libvlc_media_player_get_state(vlcMediaPlayer) ;
   Except
   On E : Exception Do
      Begin
      PUT_LOG ( 'Exception VLC_GET_STATE/2 [' + E.Message + ']' ) ;
      Result := libvlc_Indef ;
      End ;
   End ;
End ;

Function VLC_GET_STATE_INT ( Indice : LongInt ) : LongInt ;
Var Tipo : Tipo_State ;
Begin
PUT_LOG ( 'VCL GET_STATE_INT' ) ;
Try
   If NOT VLC_is_vlcMediaPlayer Then
      Begin
      Result := -2 ;
      //VLC_PUT_ERRO_SL_VLC ( 'Exit VLC_GET_STATE_INT !VMP' ) ;
      Exit ;
      End ;
   Try
      Tipo := libvlc_media_player_get_state(vlcMediaPlayer) ;
      If Tipo = libvlc_NothingSpecial Then
         Result := 0
      Else If Tipo = libvlc_Opening Then
         Result := 1
      Else If Tipo = libvlc_Buffering Then
         Result := 2
      Else If Tipo = libvlc_Playing Then
         Result := 3
      Else If Tipo = libvlc_Paused Then
         Result := 4
      Else If Tipo = libvlc_Stopped Then
         Result := 5
      Else If Tipo = libvlc_Ended Then
         Result := 6
      Else If Tipo = libvlc_Error Then
         Result := 7
      Else If Tipo = libvlc_Indef Then
         Result := 8
      Else
         Result := -1 ;
      Except
      On E : Exception Do
         Begin
         PUT_LOG ( 'Exception VLC_GET_STATE_INT/1 [' + E.Message + ']' ) ;
         Result := -3 ;
         End ;
      End ;
   Except
   On E : Exception Do
      Begin
      PUT_LOG ( 'Exception VLC_GET_STATE_INT/2 [' + E.Message + ']' ) ;
      Result := -3 ;
      End ;
   End ;
End ;

Procedure VLC_SET_PAUSE ( Indice : LongInt ; Pausa : LongInt ) ;
Begin
PUT_LOG ( 'VCL SET_PAUSE' ) ;
Try
   If NOT VLC_is_vlcMediaPlayer Then
      Begin
      PUT_LOG ( 'Exit VLC_SET_PAUSE !VMP' ) ;
      Exit ;
      End ;
   Except
   On E : Exception Do
      Begin
      PUT_LOG ( 'Exception VLC_SET_PAUSE/1 [' + E.Message + ']' ) ;
      End ;
   End ;
Try
   libvlc_media_player_set_pause(vlcMediaPlayer, Pausa) ;
   Except
   On E : Exception Do
      Begin
      PUT_LOG ( 'Exception VLC_SET_PAUSE/2 [' + E.Message + ']' ) ;
      End ;
   End ;
End ;

Function VLC_SET_VOLUME ( Indice : LongInt ; Volume : Integer ) : Integer ;
Begin
PUT_LOG ( 'VCL SET_VOLUME' ) ;
Result := 0 ;
Try
   If NOT VLC_is_vlcMediaPlayer Then
      Begin
      PUT_LOG ( 'Exit VLC_SET_VOLUME !VMP' ) ;
      Exit ;
      End ;
   Except
   On E : Exception Do
      Begin
      PUT_LOG ( 'Exception VLC_SET_VOLUME/1 [' + E.Message + ']' ) ;
      End ;
   End ;
Try
   Result := libvlc_audio_set_volume(vlcMediaPlayer, Volume) ;
   Except
   On E : Exception Do
      Begin
      PUT_LOG ( 'Exception VLC_SET_VOLUME/1 [' + E.Message + ']' ) ;
      Result := -1 ;
      End ;
   End ;
End ;

Procedure VLC_PLAY ( Indice : LongInt ; Origem : String ) ;
Begin
PUT_LOG ( 'VCL PLAY [' + Origem + ']' ) ;
Try
   If NOT VLC_is_vlcMediaPlayer Then
      Begin
      PUT_LOG ( 'Exit VLC_PLAY !VMP' ) ;
      Exit ;
      End ;
   Except
   On E : Exception Do
      Begin
      PUT_LOG ( 'Exception VLC_PLAY/1 [' + E.Message + ']' ) ;
      End ;
   End ;
Try
   libvlc_media_player_play(vlcMediaPlayer);
   Except
   On E : Exception Do
      Begin
      PUT_LOG ( 'Exception VLC_PLAY/2 [' + E.Message + ']' ) ;
      End ;
   End ;
End ;

Procedure VLC_TOGGLE_FULLSCREEN ( Indice : LongInt ) ;
Begin
PUT_LOG ( 'VCL TOOGLE_FULLSCREEN' ) ;
Try
   If NOT VLC_is_vlcMediaPlayer Then
      Begin
      PUT_LOG ( 'Exit VLC_TOGGLE_FULLSCREEN !VMP' ) ;
      Exit ;
      End ;
   Except
   On E : Exception Do
      Begin
      PUT_LOG ( 'Exception VLC_TOOGLE_FULLSCREEN/1 [' + E.Message + ']' ) ;
      End ;
   End ;
Try
   libvlc_toggle_fullscreen(vlcMediaPlayer);
   Except
   On E : Exception Do
      Begin
      PUT_LOG ( 'Exception VLC_TOOGLE_FULLSCREEN/2 [' + E.Message + ']' ) ;
      End ;
   End ;
End ;

Function VLC_WILL_PLAY ( Indice : LongInt ) : Boolean ;
Begin
PUT_LOG ( 'VCL WILL_PLAY' ) ;
Result := FALSE ;
Try
   If NOT VLC_is_vlcMediaPlayer Then
      Begin
      PUT_LOG ( 'Exit VLC_WILL_PLAY !VMP' ) ;
      Exit ;
      End ;
   Except
   On E : Exception Do
      Begin
      PUT_LOG ( 'Exception VLC_WILL_PLAY/1 [' + E.Message + ']' ) ;
      End ;
   End ;
Try
   Result := libvlc_media_player_will_play(vlcMediaPlayer) ;
   Except
   On E : Exception Do
      Begin
      PUT_LOG ( 'Exception VLC_WILL_PLAY/2 [' + E.Message + ']' ) ;
      Result := FALSE ;
      End ;
   End ;
End ;

Function VLC_CAN_PAUSE ( Indice : LongInt ) : Boolean ;
Begin
PUT_LOG ( 'VCL CAN_PAUSE' ) ;
Result := FALSE ;
Try
   If NOT VLC_is_vlcMediaPlayer Then
      Begin
      PUT_LOG ( 'Exit VLC_CAN_PAUSE !VMP' ) ;
      Exit ;
      End ;
   Except
   On E : Exception Do
      Begin
      PUT_LOG ( 'Exception VLC_CAN_PAUSE/1 [' + E.Message + ']' ) ;
      End ;
   End ;
Try
   Result := libvlc_media_player_can_pause(vlcMediaPlayer) ;
   Except
   On E : Exception Do
      Begin
      PUT_LOG ( 'Exception VLC_CAN_PAUSE/2 [' + E.Message + ']' ) ;
      Result := FALSE ;
      End ;
   End ;
End ;

Procedure VLC_STOP ( Indice : LongInt ) ;
Begin
_Debug ( 'INI MEDIA-STOP' ) ;
PUT_LOG ( 'VCL STOP' ) ;
Try
   If NOT VLC_is_vlcMediaPlayer Then
      Begin
      _Debug ( '1 MODO_VLC MEDIA-STOP' ) ;
      PUT_LOG ( 'Exit VLC-STOP !VMP' ) ;
      Exit ;
      End ;
   _Debug ( '2 MODO_VLC MEDIA-STOP' ) ;
   Except
   On E : Exception Do
      Begin
      PUT_LOG ( 'Exception VLC-STOP/1 [' + E.Message + ']' ) ;
      End ;
   End ;
_Debug ( '1 MEDIA-STOP' ) ;
Try
   // stop vlc media player
   _Debug ( '1 MODO_VLC MEDIA-STOP' ) ;
   libvlc_media_player_stop(vlcMediaPlayer) ;
   // and wait until it completely stops
   _Debug ( '2 MODO_VLC MEDIA-STOP' ) ;
   While libvlc_media_player_is_playing(vlcMediaPlayer) = 1 Do
      Begin
      Sleep(100) ;
      End ;
   // release vlc media player
   _Debug ( '3 MODO_VLC MEDIA-STOP' ) ;
   libvlc_media_player_release(vlcMediaPlayer) ;
   vlcMediaPlayer := nil ;
   // release vlc instance
   _Debug ( '4 MODO_VLC MEDIA-STOP' ) ;
   libvlc_release(vlcInstance) ;
   _Debug ( '5 MODO_VLC MEDIA-STOP' ) ;
   Except
   On E : Exception Do
      Begin
      PUT_LOG ( 'Exception VLC-STOP/2 [' + E.Message + ']' ) ;
      End ;
   End ;
_Debug ( 'FIM MODO_VLC MEDIA-STOP' ) ;
End ;

Procedure VLC_AUDIO_TOGGLE_MUTE ( Indice : LongInt ) ;
Begin
PUT_LOG ( 'VCL AUDIO_TOGGLE_MUTE' ) ;
Try
   If NOT VLC_is_vlcMediaPlayer Then
      Begin
      PUT_LOG ( 'Exit VLC_AUDIO_TOGGLE_MUTE !VMP' ) ;
      Exit ;
      End ;
   Except
   On E : Exception Do
      Begin
      PUT_LOG ( 'Exception VLC_AUDIO_TOOGLE_MUTE/1 [' + E.Message + ']' ) ;
      End ;
   End ;
Try
   libvlc_audio_toggle_mute(vlcMediaPlayer) ;
   Except
   On E : Exception Do
      Begin
      PUT_LOG ( 'Exception VLC_AUDIO_TOOGLE_MUTE/2 [' + E.Message + ']' ) ;
      End ;
   End ;
End ;

Procedure VLC_AUDIO_SET_MUTE ( Indice : LongInt ; Mute : Boolean ) ;
Begin
PUT_LOG ( 'VCL AUDIO_SET_MUTE' ) ;
Try
   If NOT VLC_is_vlcMediaPlayer Then
      Begin
      PUT_LOG ( 'Exit VLC_AUDIO_SET_MUTE !VMP' ) ;
      Exit ;
      End ;
   Except
   On E : Exception Do
      Begin
      PUT_LOG ( 'Exception VLC_AUDIO_SET_MUTE/1 [' + E.Message + ']' ) ;
      End ;
   End ;
Try
   libvlc_audio_toggle_mute(vlcMediaPlayer) ;
   Except
   On E : Exception Do
      Begin
      PUT_LOG ( 'Exception VLC_AUDIO_SET_MUTE/2 [' + E.Message + ']' ) ;
      End ;
   End ;
End ;

Procedure VLC_AUDIO_SET_DELAY ( Indice : LongInt ; Delay : Int64 ) ;
Begin
PUT_LOG ( 'VCL AUDIO_SET_DELAY' ) ;
Try
   If NOT VLC_is_vlcMediaPlayer Then
      Begin
      PUT_LOG ( 'Exit VLC_AUDIO_SET_DELAY !VMP' ) ;
      Exit ;
      End ;
   Except
   On E : Exception Do
      Begin
      PUT_LOG ( 'Exception VLC_AUDIO_SET_DELAY/1 [' + E.Message + ']' ) ;
      End ;
   End ;
Try
   libvlc_audio_set_delay(vlcMediaPlayer, Delay) ;
   Except
   On E : Exception Do
      Begin
      PUT_LOG ( 'Exception VLC_AUDIO_SET_DELAY/1 [' + E.Message + ']' ) ;
      End ;
   End ;
End ;

Procedure VLC_NEXT_FRAME ( Indice : LongInt ) ;
Begin
PUT_LOG ( 'VCL NEXT_FRAME' ) ;
Try
   If NOT VLC_is_vlcMediaPlayer Then
      Begin
      PUT_LOG ( 'Exit VLC_NEXT_FRAME_MEDIA !VMP' ) ;
      Exit ;
      End ;
   Except
   On E : Exception Do
      Begin
      PUT_LOG ( 'Exception VLC_NEXT_FRAME/1 [' + E.Message + ']' ) ;
      End ;
   End ;
Try
   libvlc_media_player_next_frame(vlcMediaPlayer) ;
   Except
   On E : Exception Do
      Begin
      PUT_LOG ( 'Exception VLC_NEXT_FRAME/2 [' + E.Message + ']' ) ;
      End ;
   End ;
End ;

Procedure VLC_PREVIOUS_FRAME ( Indice : LongInt ) ;
Begin
PUT_LOG ( 'VCL PREVIOUS_FRAME' ) ;
Try
   If NOT VLC_is_vlcMediaPlayer Then
      Begin
      PUT_LOG ( 'Exit VLC_PREVIOUS_FRAME !VMP' ) ;
      Exit ;
      End ;
   Except
   On E : Exception Do
      Begin
      PUT_LOG ( 'Exception VLC_PREVIOUS_FRAME/1 [' + E.Message + ']' ) ;
      End ;
   End ;
Try
   //libvlc_media_player_previous_frame(vlcMediaPlayer) ;
   Except
   On E : Exception Do
      Begin
      PUT_LOG ( 'Exception VLC_PREVIOUS_FRAME/2 [' + E.Message + ']' ) ;
      End ;
   End ;
End ;

Procedure VLC_SET_RATE ( Indice : LongInt ; Rate : Double ) ;
Begin
PUT_LOG ( 'VCL SET_RATE' ) ;
Try
   If NOT VLC_is_vlcMediaPlayer Then
      Begin
      PUT_LOG ( 'Exit VLC_SET_RATE !VMP' ) ;
      Exit ;
      End ;
   Except
   On E : Exception Do
      Begin
      PUT_LOG ( 'Exception VLC_SET_RATE/1 [' + E.Message + ']' ) ;
      End ;
   End ;
Try
   libvlc_media_player_set_rate(vlcMediaPlayer, Rate) ;
   Except
   On E : Exception Do
      Begin
      PUT_LOG ( 'Exception VLC_SET_RATE/2 [' + E.Message + ']' ) ;
      End ;
   End ;
End ;

Function VLC_GET_VERSION : String ;
Begin
PUT_LOG ( 'VCL GET_VERSION' ) ;
Try
   Result := '[' + libvlc_get_version() + ']' ;
   Except
   On E : Exception Do
      Begin
      PUT_LOG ( 'Exception VLC_GET_VERSION/1 [' + E.Message + ']' ) ;
      Result := 'Exception 1 libvlc_get_version' ;
      End ;
   End ;
End ;

Function VLC_GET_COMPILER : String ;
Begin
Try
   Result := '[' + libvlc_get_compiler() + ']' ;
   PUT_LOG ( 'VCL GET_COMPILER [' + Result + ']') ;
   Except
   On E : Exception Do
      Begin
      PUT_LOG ( 'Exception VLC_GET_COMPILER [' + E.Message + ']' ) ;
      Result := 'Exception 1 libvlc_get_compiler' ;
      End ;
   End ;
End ;

Procedure VLC_SET_TIME ( Indice : LongInt ; _Time : LongInt ) ;
Begin
Try
   If NOT VLC_is_vlcMediaPlayer Then
      Begin
      PUT_LOG ( 'Exit VLC_SET_TIME !VMP' ) ;
      Exit ;
      End ;
   Except
   On E : Exception Do
      Begin
      PUT_LOG ( 'Exception VLC_SET_TIME/1 [' + E.Message + ']' ) ;
      End ;
   End ;
Try
   libvlc_media_player_set_time(vlcMediaPlayer, _Time) ;
   //libvlc_media_player_pause(vlcMediaPlayer) ;
   PUT_LOG ( 'VCL SET_TIME [' + IntToStr(_Time) + ']' ) ;
   Except
   On E : Exception Do
      Begin
      PUT_LOG ( 'Exception VLC_SET_TIME/2 [' + E.Message + ']' ) ;
      End ;
   End ;
End ;

Procedure VLC_SET_POSITION ( Indice : LongInt ; Posicao : Double ) ;
Var _Double : Double ;
Begin
Try
   If NOT VLC_is_vlcMediaPlayer Then
      Begin
      PUT_LOG ( 'Exit VLC_SET_POSITION !VMP' ) ;
      Exit ;
      End ;
   Except
   On E : Exception Do
      Begin
      PUT_LOG ( 'Exception VLC_SET_POSITION/1 [' + E.Message + ']' ) ;
      End ;
   End ;
Try
   _Double := Posicao / VLC_GET_DURACAO ( Indice ) ;
   libvlc_media_player_set_position(vlcMediaPlayer, _Double) ;
   PUT_LOG ( 'VCL SET_POSITION/2 ' + FloatToStr(Posicao) + ' [' + CASA_3(_Double) + ']' ) ;
   Except
   On E : Exception Do
      Begin
      PUT_LOG ( 'Exception VLC_SET_POSITION/2 [' + E.Message + ']' ) ;
      End ;
   End ;
End ;

Procedure VLC_SET_POSITION_PERCENTUAL ( Indice : LongInt ; _Double : Double ) ;
Begin
Try
   If NOT VLC_is_vlcMediaPlayer Then
      Begin
      PUT_LOG ( 'Exit VLC_SET_POSITION_PERCENTUAL !VMP' ) ;
      Exit ;
      End ;
   Except
   On E : Exception Do
      Begin
      PUT_LOG ( 'Exception VLC_SET_POSITION_PERCENTUAL/1 [' + E.Message + ']' ) ;
      End ;
   End ;
Try
   libvlc_media_player_set_position(vlcMediaPlayer, _Double) ;
   PUT_LOG ( 'VCL SET_POSITION_PERCENTUAL/2 [' + CASA_3(_Double) + ']' ) ;
   Except
   On E : Exception Do
      Begin
      PUT_LOG ( 'Exception VLC_SET_POSITION_PERCENTUAL/2 [' + E.Message + ']' ) ;
      End ;
   End ;
End ;

Function VLC_is_vlcMediaPlayer : Boolean ;
Begin
Try
   Result := vlcMediaPlayer <> Nil ;
   Except
   On E : Exception Do
      Begin
      PUT_LOG ( 'Exception VLC_is_vlcMediaPlayer [' + E.Message + ']' ) ;
      Result := FALSE ;
      End ;
   End ;
End ;

Function VLC_GET_TIME ( Indice : LongInt ) : LongInt ;
Begin
//PUT_LOG ( 'VCL GET_TIME' ) ;
Try
   If NOT VLC_is_vlcMediaPlayer Then
      Begin
      //Result := -1 ;
      //PUT_LOG ( 'Exit VLC_GET_TIME !VMP' ) ;
      Exit ;
      End ;
   Except
   On E : Exception Do
      Begin
      PUT_LOG ( 'Exception VLC_GET_TIME/1 [' + E.Message + ']' ) ;
      //Result := -2 ;
      End ;
   End ;
Try
   Result := libvlc_media_player_get_time ( vlcMediaPlayer ) ;
   Except
   On E : Exception Do
      Begin
      PUT_LOG ( 'Exception VLC_GET_TIME/2 [' + E.Message + ']' ) ;
      Result := -3 ;
      End ;
   End ;
End ;

Function VLC_GET_DURACAO ( Indice : LongInt ) : LongInt ;
Begin
//PUT_LOG ( 'VCL GET_DURACAO' ) ;
Try
   If NOT VLC_is_vlcMediaPlayer Then
      Begin
      Result := -1 ;
      //VLC_PUT_ERRO_SL_VLC ( 'Exit VLC_GET_DURACAO !VMP' ) ;
      Exit ;
      End ;
   Except
   On E : Exception Do
      Begin
      PUT_LOG ( 'Exception VLC_GET_DURACAO/1 [' + E.Message + ']' ) ;
      Result := -2 ;
      End ;
   End ;
Try
   Result := libvlc_media_player_get_length ( vlcMediaPlayer )
   Except
   On E : Exception Do
      Begin
      PUT_LOG ( 'Exception VLC_GET_DURACAO/2 [' + E.Message + ']' ) ;
      Result := -2 ;
      End ;
   End ;
End ;

Function VLC_IS_PLAYING : Boolean ;
Begin
//PUT_LOG ( 'VCL IS_PLAYING' ) ;
Result := FALSE ;
Try
   If NOT Assigned ( vlcMediaPlayer ) Then
      Begin
      Result := FALSE ;
      Exit ;
      End ;
   Result := libvlc_media_player_is_playing ( vlcMediaPlayer ) = 1 ;
   Except
   On E : Exception Do
      Begin
      PUT_LOG ( 'Exception VLC_IS_PLAYING [' + E.Message + ']' ) ;
      End ;
   End ;
End ;

Begin
SL_Erros_vlc := TStringList.Create ;
End.

