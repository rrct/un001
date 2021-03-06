unit PlayerFrm;

interface

uses Misc_Def_U, Misc_Const_U, Misc_Type_U,
     IniFiles, ShellAPI, FolderMon, Math,
     T_Supervisor_Pasta_U,
     Media_U, vlc,
     System.Threading,
     Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
     Dialogs, StdCtrls, ComCtrls, ExtCtrls, ExtDlgs, Jpeg,
     FFBaseComponent,
     FFBasePlay,
     FFPlay, FFLog, SyncObjs,
     RxSlider,
     Vcl.Buttons;

type
  TfrmPlayer = class(TForm)
    FFPlayer: TFFPlayer;
    OpenDialog1: TOpenDialog;
    SavePictureDialog1: TSavePictureDialog;
    ED_FN: TEdit;
    FFPlayer_Audio: TFFPlayer;
    PN_Audio: TPanel;
    PN_Controles: TPanel;
    PC: TPageControl;
    TS_Controles: TTabSheet;
    PN_Botoes: TPanel;
    Bot_Pause: TSpeedButton;
    Bot_Seg_Menos: TSpeedButton;
    Bot_Seg_Mais: TSpeedButton;
    Bot_Frame_Menos: TSpeedButton;
    Bot_Frame_Mais: TSpeedButton;
    Bot_Capturar_Frame: TSpeedButton;
    Bot_Imagens: TSpeedButton;
    Bot_Abrir_Arquivo: TSpeedButton;
    PN_TimeCode: TPanel;
    lblDuration: TLabel;
    lblCurrentPTS: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    TS_Extras: TTabSheet;
    lblAspectRatio: TLabel;
    lblEqualizer: TLabel;
    lblShowMode: TLabel;
    cboAspectRatio: TComboBox;
    trbBrightness: TTrackBar;
    trbSaturation: TTrackBar;
    trbHue: TTrackBar;
    btnBrightness: TButton;
    btnSaturation: TButton;
    btnHue: TButton;
    cboShowMode: TComboBox;
    TS_Deposito: TTabSheet;
    lblAudioDevice: TLabel;
    lblRenderOn: TLabel;
    lblVideoStream: TLabel;
    lblAudioStream: TLabel;
    lblSubtitleStream: TLabel;
    btnPause: TButton;
    btnURL: TButton;
    btnOpen: TButton;
    btnStep: TButton;
    btnStop: TButton;
    btnCapture: TButton;
    btnWebSite: TButton;
    chkDisableVideo: TCheckBox;
    chkDisableAudio: TCheckBox;
    chkExternalSubtitle: TCheckBox;
    chkOpenPaused: TCheckBox;
    chkWaterMark: TCheckBox;
    cboAudioDevice: TComboBox;
    cboScreens: TComboBox;
    cboVideo: TComboBox;
    cboAudio: TComboBox;
    cboSubtitle: TComboBox;
    chkVerticalFlip: TCheckBox;
    chkFrameHook: TCheckBox;
    chkVideoHook: TCheckBox;
    chkFullScreen: TCheckBox;
    chkStayOnTop: TCheckBox;
    chkMsgLog: TCheckBox;
    PN_VU_Audios: TPanel;
    chkAudioHook: TCheckBox;
    PN_Audio_2: TPanel;
    PB_Left: TProgressBar;
    PB_Right: TProgressBar;
    trbAudioVolume: TTrackBar;
    chkMute: TCheckBox;
    Bot_Converter: TSpeedButton;
    Bot_Info: TSpeedButton;
    Bot_Inicio: TSpeedButton;
    Timer1: TTimer;
    LB_Posicao: TLabel;
    Bot_Abrir_Convertido: TSpeedButton;
    PN_Marcadores: TPanel;
    lblSpeed: TLabel;
    trbSpeed: TTrackBar;
    btnSpeed: TButton;
    Bot_Marcar_Final: TButton;
    Bot_Marcar_Inicio: TButton;
    ED_Cue_In: TEdit;
    ED_Cue_Out: TEdit;
    Bot_Marcar_Tudo: TButton;
    lblDuration3: TLabel;
    PN_Slide_2: TPanel;
    Slide: TRxSlider;
    SB: TStatusBar;
    PN_Base_Video: TPanel;
    PN_Video: TPanel;
    PN_TrackBar: TPanel;
    TrackBar2: TTrackBar;
    LB_Antes_Depois: TLabel;
    LB_Posicao_Percentual: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; Var Key: Char);
    procedure FormCloseQuery(Sender: TObject; Var CanClose: Boolean);
    procedure FormDestroy(Sender: TObject);
    procedure btnOpenClick(Sender: TObject);
    procedure btnPauseClick(Sender: TObject);
    procedure btnStepClick(Sender: TObject);
    procedure btnStopClick(Sender: TObject);
    procedure btnCaptureClick(Sender: TObject);
    procedure btnWebSiteClick(Sender: TObject);
    procedure cboScreensChange(Sender: TObject);
    procedure cboVideoChange(Sender: TObject);
    procedure cboAudioChange(Sender: TObject);
    procedure cboSubtitleChange(Sender: TObject);
    procedure cboAspectRatioChange(Sender: TObject);
    procedure chkVerticalFlipClick(Sender: TObject);
    procedure chkFrameHookClick(Sender: TObject);
    procedure chkVideoHookClick(Sender: TObject);
    procedure trbSpeedChange(Sender: TObject);
    procedure btnSpeedClick(Sender: TObject);
    procedure trbBrightnessChange(Sender: TObject);
    procedure btnBrightnessClick(Sender: TObject);
    procedure trbSaturationChange(Sender: TObject);
    procedure btnSaturationClick(Sender: TObject);
    procedure trbHueChange(Sender: TObject);
    procedure btnHueClick(Sender: TObject);
    procedure chkAudioHookClick(Sender: TObject);
    procedure chkMuteClick(Sender: TObject);
    procedure trbAudioVolumeChange(Sender: TObject);
    procedure cboShowModeChange(Sender: TObject);
    procedure chkFullScreenClick(Sender: TObject);
    procedure chkStayOnTopClick(Sender: TObject);
    procedure chkMsgLogClick(Sender: TObject);
    procedure PN_VideoDblClick(Sender: TObject);
    procedure PN_VideoMouseDown(Sender: TObject; Button: TMouseButton;
              Shift: TShiftState; X, Y: Integer);
    procedure PN_VideoMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure PN_VideoMouseUp(Sender: TObject; Button: TMouseButton;
              Shift: TShiftState; X, Y: Integer);
    procedure TrackBar2Change(Sender: TObject);
    procedure FFPlayerFileOpen(Sender: TObject; Const ADuration: Int64;
              AFrameWidth, AFrameHeight: Integer; Var AScreenWidth, AScreenHeight: Integer);
    procedure FFPlayerOpenFailed(Sender: TObject);
    procedure FFPlayerFrameHook(Sender: TObject; APicture: PAVPicture;
              APixFmt: TAVPixelFormat; AWidth, AHeight: Integer; Const APTS: Int64);
    procedure FFPlayerVideoHook(Sender: TObject; ABitmap: TBitmap;
              Const APTS: Int64; Var AUpdate: Boolean);
    procedure FFPlayerAudioHook(Sender: TObject; APTS: Int64; ASample: PByte;
              ASize, ASampleRate, AChannels: Integer);
    procedure FFPlayerPosition2(Sender: TObject; Const APTS, ABytes: Int64);
    procedure FFPlayerState(Sender: TObject; AState: TPlayState);
    procedure PLAY ( Sender : TObject ; FN : String ) ;
    Procedure PLAY_AUDIO ( Sender : TObject ; FN : String ; AutoPlay : Boolean ) ;
    procedure FFLoggerLog(Sender: TObject; AThreadID: Integer;
              ALogLevel: TLogLevel; Const ALogMsg: String);
    procedure FFPlayer_AudioAudioHook(Sender: TObject; Const APTS: Int64;
              ASample: PByte; ASize, ASampleRate, AChannels: Integer);
    procedure FFPlayer_AudioFileOpen(Sender: TObject; Const ADuration: Int64;
              AFrameWidth, AFrameHeight: Integer; Var AScreenWidth,
              AScreenHeight: Integer);
    procedure FFPlayer_AudioFrameHook(Sender: TObject; APicture: PAVPicture;
              APixFmt: TAVPixelFormat; AWidth, AHeight: Integer; Const APTS: Int64);
    procedure FFPlayer_AudioOpenFailed(Sender: TObject);
    procedure FFPlayer_AudioState(Sender: TObject; APlayState: TPlayState);
    Procedure STOP_ALL ;
    procedure FFPlayer_AudioVideoHook(Sender: TObject; ABitmap: TBitmap;
              Const APTS: Int64; Var AUpdate: Boolean);
    procedure FormClose(Sender: TObject; Var Action: TCloseAction);
    procedure FormResize(Sender: TObject);
    procedure Bot_Frame_MaisClick(Sender: TObject);
    procedure Bot_Frame_MenosClick(Sender: TObject);
    procedure Bot_PauseClick(Sender: TObject);
    procedure Bot_Abrir_ArquivoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Bot_Capturar_FrameClick(Sender: TObject);
    procedure Bot_Seg_MaisClick(Sender: TObject);
    procedure Bot_Seg_MenosClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Bot_InicioClick(Sender: TObject);
    procedure TrackBar2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TrackBar2KeyPress(Sender: TObject; var Key: Char);
    procedure TrackBar2KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure trbSpeedKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure trbSpeedKeyPress(Sender: TObject; var Key: Char);
    procedure trbSpeedKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cboAspectRatioKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cboAspectRatioKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cboAspectRatioKeyPress(Sender: TObject; var Key: Char);
    procedure cboShowModeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cboShowModeKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cboShowModeKeyPress(Sender: TObject; var Key: Char);
    procedure trbBrightnessKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure trbBrightnessKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure trbBrightnessKeyPress(Sender: TObject; var Key: Char);
    procedure trbSaturationKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure trbSaturationKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure trbSaturationKeyPress(Sender: TObject; var Key: Char);
    procedure trbHueKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure trbHueKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure trbHueKeyPress(Sender: TObject; var Key: Char);
    procedure trbAudioVolumeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure trbAudioVolumeKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure trbAudioVolumeKeyPress(Sender: TObject; var Key: Char);
    procedure chkAudioHookKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure chkAudioHookKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure chkAudioHookKeyPress(Sender: TObject; var Key: Char);
    procedure cboAudioDeviceKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cboAudioDeviceKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cboAudioDeviceKeyPress(Sender: TObject; var Key: Char);
    procedure cboScreensKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cboScreensKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cboScreensKeyPress(Sender: TObject; var Key: Char);
    procedure cboVideoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cboVideoKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cboVideoKeyPress(Sender: TObject; var Key: Char);
    procedure cboAudioKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cboAudioKeyPress(Sender: TObject; var Key: Char);
    procedure cboAudioKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cboSubtitleKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cboSubtitleKeyPress(Sender: TObject; var Key: Char);
    procedure cboSubtitleKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Bot_Marcar_TudoClick(Sender: TObject);
    procedure Bot_Marcar_FinalClick(Sender: TObject);
    procedure Bot_Marcar_InicioClick(Sender: TObject);
    procedure Bot_ConverterClick(Sender: TObject);
    procedure SlideChange(Sender: TObject);
    procedure SlideKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SlideKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SlideKeyPress(Sender: TObject; var Key: Char);
    procedure MARCAR_INICIO ;
    procedure MARCAR_FINAL ;
    procedure Bot_ImagensClick(Sender: TObject);
    Procedure PLAY_FINAL_TASK_LEVEL ;
    procedure Bot_InfoClick(Sender: TObject);
    procedure Bot_Abrir_ConvertidoClick(Sender: TObject);
    Procedure ABRIR_ARQUIVO ( FN : String ) ;
Private
    { Private declarations }
    FDuration : Int64 ;
    FIsBytes : Boolean ;
    FTrackChanging : Boolean ;
    FScreenControl : TWinControl ;
    FLock : TCriticalSection ;
    FRect : TRect ;
    URL : String ;
    Function GetScreenHandle : HWND ;
    Procedure SEGUNDO_MAIS ;
    Procedure SEGUNDO_MENOS ;
    Procedure POSICAO_INICIAL ;
    Procedure FRAME_MAIS ;
    Procedure FRAME_MENOS ;
    Procedure FRAME_INICIO ;
    Procedure AJUSTAR_ASPECTO ;
    Procedure TOGGLE_PAUSE ;
  Public
    { Public declarations }
    FBrightness: Single;
    FSaturation: Single;
    FHue: Single;
  End ;

Function IsMouseDown: Boolean;

Var frmPlayer : TfrmPlayer ;

Implementation

{$R *.dfm}

Uses FrameEffects, // adjust eq and hue
     libavfilter,  // for PPAVFilter
     AVFilterStubs, // for avfilter_next()
     MsgLogFrm,
     Misc_U,
     FFUtils,
     libavformat,
     MyUtils,
     Main_U,
     Extracao_Frames_U,
     Conversao_Video_U ,
     FulL_Screen_U;

Const
  CLibAVPath = 'LibAV';
  CWaterMark = 'watermark.png';

  //SAppTitle = 'Demo of FFPlayer %s';
  SCaption = 'Demo of FFPlayer %s - Delphi FFmpeg VCL Components';
  SWebSiteC = 'http://www.CCAVC.com';
  SWebSiteE = 'http://www.DelphiFFmpeg.com';

  // License key sample (this is a fake license key)
  // FFLogger does not need license key.
  // FFDecoder can accept encoder key or player key or full key.
  // FFEncoder can accept encoder key or full key.
  // FFPlayer can accept player key or full key.
//BOMB: you should replace the license key with your own one.
  //LICENSE_KEY = 'FSXXXXXX-XXXXXXXX-XXXXXXXX-XXXXXXXX-XXXXXXXX';
  LICENSE_KEY = 'PSDEBKNM-LURWCABH-CQPIZMZE-BKPPENSY-HDSQZEQJ' ;

  CDialogOptions = [ofHideReadOnly, ofFileMustExist, ofEnableSizing] ;
  CPictureFiles = '*.BMP;*.GIF;*.JPEG;*.JPG;*.PNG;' ;
  CAudioFiles = '*.AAC;*.AC3;*.APE;*.DTS;*.FLAC;*.M4A;*.MKA;*.MP2;*.MP3;' +
                '*.MPA;*.MPC;*.OFR;*.OGG;*.RA;*.TTA;*.WAV;*.WMA;' ;
  CVideoFiles = '*.3GP;*.ASF;*.AVI;s*.AVM;*.AVS;*.MXF;*.DAT;*.FLV;*.MKV;*.MOV;' +
                '*.MP4;*.MPEG;*.MPG;*.NSV;*.OGM;*.RM;*.RMVB;*.TP;*.TS;*.VOB;*.WMV;' ;
  CDialogFilter = 'Video/Audio/Picture Files|' + CVideoFiles + CAudioFiles + CPictureFiles +
                  '|Video Files|' + CVideoFiles +
                  '|Audio Files|' + CAudioFiles +
                  '|Picture Files|' + CPictureFiles +
                  '|All Files|*.*' ;
  SHookTimeStamp = 'FFPlayer - Time Stamp: %d' ;

Var SWebSite : String = SWebSiteE ;

Procedure MaxOrNormalForm ( AForm: TForm; AMax: Boolean ) ;
Const
{$J+}
  LastBounds: TRect = () ;
{$J-}
begin
If AMax then Begin
   LastBounds := AForm.BoundsRect ;
   AForm.FormStyle := fsStayOnTop ;
   AForm.BorderStyle := bsNone ;
   AForm.BoundsRect := Screen.MonitorFromWindow(AForm.Handle).BoundsRect ;
End Else Begin
   AForm.FormStyle := fsNormal ;
   AForm.BorderStyle := bsSizeable ;
   AForm.BoundsRect := LastBounds ;
End ;
End ;

// return desktop handle
Function enumUserWindowsCB (  ahwnd: HWND; lParam: LPARAM ) : BOOL ; Stdcall ;
Var wflags     : Longint ;
    sndWnd     : HWND ;
    targetWnd  : HWND ;
    resultHwnd : PLongWord ;
Begin
wflags := GetWindowLong ( ahwnd, GWL_STYLE ) ;
If ( wflags AND WS_VISIBLE ) <> 0 Then Begin
   sndWnd := FindWindowEx ( ahwnd, 0, 'SHELLDLL_DefView', Nil ) ;
   If sndWnd <> 0 Then Begin
      targetWnd := FindWindowEx ( sndWnd, 0, 'SysListView32', 'FolderView' ) ;
      If targetWnd <> 0 Then Begin
         resultHwnd := PLongWord(lParam) ;
         resultHwnd^ := targetWnd ;
         Result := FALSE ;
         Exit ;
      End ;
   End ;
End ;
Result := TRUE ;
End ;

Function GetDesktopHandle : HWND ;
Begin
// works under Windows XP or classic theme under Windows Vista/7
Result := FindWindow ( 'ProgMan', Nil ) ;    {Do not Localize}
if Result <> 0 Then Begin
   Result := GetWindow ( Result, GW_CHILD ) ;
   if Result <> 0 Then Begin
      Result := GetWindow ( Result, GW_CHILD ) ;
      If Result <> 0 Then Begin
         Exit ;
      End ;
   End ;
End ;
// works under Vista/7
EnumWindows ( @enumUserWindowsCB, Integer(@Result) ) ;
End ;

// whether mouse is down
Function IsMouseDown : Boolean ;
Begin
If GetSystemMetrics(SM_SWAPBUTTON) <> 0 Then Begin
   Result := GetAsyncKeyState(VK_RBUTTON) AND $8000 <> 0 ;
End Else Begin
   Result := GetAsyncKeyState(VK_LBUTTON) AND $8000 <> 0 ;
End ;
End ;

// find wincontrol of form by name
Function FindWinControl(AForm: TForm; Const AName: String): TWinControl ;
Var I: Integer ;
Begin
For I := 0 To AForm.ControlCount - 1 Do Begin
   If (AForm.Controls[I] IS TWinControl) AND
      (AForm.Controls[I].Name = AName) Then Begin
      Result := TWinControl(AForm.Controls[I]) ;
      Exit ;
   End ;
End;
Result := Nil ;
End;

Type
  // audio level thread
  TLevelThread = class(TThread)
Private
   FEvent: TEvent;
   FLeftBar: TProgressBar;
   FRightBar: TProgressBar;
   FLeft: Integer;
   FRight: Integer;
Protected
   procedure Execute ; Override ;
Public
    constructor Create(ALeftBar, ARightBar: TProgressBar) ;
    destructor Destroy ; Override ;
    procedure Update(ALeft, ARight: Integer) ;
End ;

Constructor TLevelThread.Create(ALeftBar, ARightBar: TProgressBar) ;
Begin
Inherited Create(False) ;
Self.FreeOnTerminate := True ;
FEvent := TEvent.Create(nil, True, False, '') ;
FLeftBar := ALeftBar ;
FRightBar := ARightBar ;
FLeft := 0 ;
FRight := 0 ;
End ;

Destructor TLevelThread.Destroy ;
Begin
FEvent.Free ;
End ;

Procedure TLevelThread.Execute ;
Begin
While NOT Self.Terminated Do Begin
   FLeftBar.Position := Round(100 * FLeft / $8000); // $8000 -> 32768, max value of signed 16 bits
   FRightBar.Position := Round(100 * FRight / $8000);
   FEvent.ResetEvent;
   While FEvent.WaitFor(10) = wrTimeout Do Begin
      If Self.Terminated Then Begin
        Break ;
      End ;
   End ;
End ;
End ;

Procedure TLevelThread.Update(ALeft, ARight: Integer) ;
Begin
FLeft := ALeft ;
FRight := ARight ;
FEvent.SetEvent ;
End ;

Var FLevelThread_1: TLevelThread = Nil ;
    FLevelThread_2: TLevelThread = Nil ;

Procedure TfrmPlayer.FormCreate(Sender: TObject) ;
Var I     : Integer ;
    T     : Integer ;
    Found : Boolean ;
Begin
// initialize
//Application.Title := Format(SAppTitle, [FFPlayer.Version]) ;
AutoSize := TRUE ;
PN_Base_Video.Height := 464 ;
LB_Posicao_Percentual.Caption := '[%]' ;
//Self.Caption := Format(SCaption, [FFPlayer.Version]) ;
If SysUtils.SysLocale.PriLangID = LANG_CHINESE Then Begin
   SWebSite := SWebSiteC ;
End Else Begin
  SWebSite := SWebSiteE ;
End ;
btnWebsite.Hint := SWebSite ;
btnWebsite.ShowHint := True ;
AddMsgLog(SWebSite + sLineBreak) ;
ShowMsgLogCheckBox := chkMsgLog ;

// ensure local decimal separator to be '.' and thousand separator to be ','
SysUtils.FormatSettings.DecimalSeparator := '.' ;
SysUtils.FormatSettings.ThousandSeparator := ',' ;

// equalizer
FBrightness := 0 ;
FSaturation := 1 ;
FHue := 0 ;

FFPlayer.AudioHook := chkAudioHook.Checked ;

// generate screen list
cboScreens.Items.Clear ;
cboScreens.Items.BeginUpdate ;
Try
   cboScreens.Items.Add('Desktop') ;
   cboScreens.Items.Add('Popup') ;
   T := 0;
   While True Do Begin
      Found := False ;
      For I := 0 To Self.ControlCount - 1 Do Begin
         If (Self.Controls[I] IS TWinControl) AND
            ((Self.Controls[I] AS TWinControl).TabOrder = T) Then Begin
            cboScreens.Items.Add(Self.Controls[I].Name) ;
            Inc(T) ;
            Found := True ;
            Break ;
         End ;
      End;
      If NOT Found Then Begin
         Break ;
      End ;
   End;
   cboScreens.ItemIndex := 2 ;
Finally
   cboScreens.Items.EndUpdate ;
End ;

FLock := TCriticalSection.Create ;
FRect.Left := 0 ;
FRect.Top := 0 ;
FRect.Right := -1 ;
FRect.Bottom := -1 ;
// open dialog setting
OpenDialog1.Options := CDialogOptions ;
OpenDialog1.Filter := CDialogFilter ;
// save dialog setting
SavePictureDialog1.Options := [ofOverwritePrompt, ofHideReadOnly, ofExtensionDifferent,
                              ofPathMustExist, ofEnableSizing] ;
SavePictureDialog1.Filter := 'Bitmaps (*.bmp)|*.bmp|JPEG Image File |*.jpg;*.jpeg' ;
SavePictureDialog1.DefaultExt := 'bmp' ;
// Set License Key
FFPlayer.SetLicenseKey(LICENSE_KEY) ;
FFPlayer_Audio.SetLicenseKey(LICENSE_KEY) ;
// disable all fpu exceptions(floating point exceptions):
//   invalid operation, denormalized, divide by zero, overflow, underflow, inexact/precision
FFPlayer.DisableFPUExceptions ;
FFPlayer_Audio.DisableFPUExceptions ;
{
// debug
FFLogger.LogFile := 'F:\PlayDemo.log' ;
FFLogger.LogToFile := True ;
FFLogger.ClearLogFile ;
FFLogger.Synchronous := True ;
FFLogger.OnLog := Nil ;
}
End ;

Procedure TfrmPlayer.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState) ;
Begin
If ( Key = VK_RIGHT ) AND ( ssShift In Shift ) Then Begin
   FRAME_MAIS ;
End Else If Key = VK_RIGHT Then Begin
   SEGUNDO_MAIS ;
End Else If ( Key = VK_LEFT ) AND ( ssShift In Shift ) Then Begin
   FRAME_MENOS ;
End Else If Key = VK_LEFT Then Begin
   SEGUNDO_MENOS ;
End ;
End ;

Procedure TfrmPlayer.FormKeyPress(Sender: TObject; var Key: Char) ;
Begin
If Key = #27 Then Begin
//   chkFullScreen.Checked := False // exit full screen
End Else If (Key = 'I') OR (Key = 'i') Then Begin
   MARCAR_INICIO ;
End Else If (Key = 'F') OR (Key = 'f') OR (Key = 'O') OR (Key = 'o') Then Begin
   MARCAR_FINAL ;
End Else If (Key = 'H') OR (Key = 'h') Then Begin
   POSICAO_INICIAL ;
End Else If (Key = #32) OR (Key = 'P') OR (Key = 'p') Then Begin
   TOGGLE_PAUSE ;
End ;
End ;

procedure TfrmPlayer.FormResize(Sender: TObject);
begin
PN_Video.Height := MIN ( TRUNC ( frmPlayer.ClientHeight - PC.Height ) ,
                         TRUNC ( frmPlayer.ClientWidth / 1.7777 ) ) ;
//PN_Audio.Height := TRUNC ( frmPlayer.ClientWidth / 1.7777 ) ;
end;

Procedure TfrmPlayer.FormShow(Sender: TObject) ;
Begin
_Debug ( 'INI TfrmPlayer.FormShow' ) ;
PC.ActivePage := TS_Controles ;
LB_Antes_Depois.Caption := '[]' ;
_Debug ( '1 TfrmPlayer.FormShow' ) ;
FFPlayer.Seek (0, [] ) ;
_Debug ( '2 TfrmPlayer.FormShow' ) ;
//frmPlayer.caption := 'R-News Player - ' + SB.SimpleText ;
Caption := Title_RNews + ' - Player - ' + SB.SimpleText ;
_Debug ( '3 TfrmPlayer.FormShow' ) ;
AJUSTAR_ASPECTO ;
_Debug ( '4 TfrmPlayer.FormShow' ) ;
Timer1.Enabled := TRUE ;
Bot_Abrir_Convertido.Enabled := FALSE ;
_Debug ( 'FIM TfrmPlayer.FormShow' ) ;
End ;

Procedure TfrmPlayer.FormClose(Sender: TObject; var Action: TCloseAction) ;
Begin
Timer1.Enabled := FALSE ;
If NOT FFPlayer.Paused Then Begin
   FFPlayer.Pause ;
End ;
If NOT FFPlayer_Audio.Paused Then Begin
   FFPlayer_Audio.Pause ;
End ;
//STOP_ALL ;
End ;

Procedure TfrmPlayer.FormCloseQuery(Sender: TObject; var CanClose: Boolean) ;
Begin
With FFPlayer Do Begin
   // Clear the event handlers
   OnPosition := Nil ;
   OnState := Nil ;
   OnFrameHook := Nil ;
   OnVideoHook := Nil ;
   OnAudioHook := Nil ;
End ;
With FFPlayer_Audio Do Begin
   // Clear the event handlers
   OnPosition := Nil ;
   OnState := Nil ;
   OnFrameHook := Nil ;
   OnVideoHook := Nil ;
   OnAudioHook := Nil ;
End ;
FFLogger.OnLog := Nil ;
PLAY_FINAL_TASK_LEVEL ;
End ;

Procedure TfrmPlayer.PLAY_FINAL_TASK_LEVEL ;
Begin
If Assigned(FLevelThread_1) Then Begin
   FLevelThread_1.Terminate ;
   FLevelThread_1 := Nil ;
End ;
If Assigned(FLevelThread_2) Then Begin
   FLevelThread_2.Terminate ;
   FLevelThread_2 := Nil ;
End ;
End ;

Procedure TfrmPlayer.FormDestroy(Sender: TObject) ;
Begin
FLock.Free ;
End ;

Function FindSubFile(APath, AFileName: string) : String ;
Var LSearchRec: TsearchRec;
Begin
Try
   If FindFirst(APath + AFileName, faAnyFile, LSearchRec) = 0 Then Begin
      Repeat
        if ((LSearchRec.Attr and faAnyFile) <> 0) and
           (LSearchRec.Name <> '.') and (LSearchRec.Name <> '..') then begin
           Result := APath + LSearchRec.Name ;
           Exit ;
        end ;
      Until FindNext(LSearchRec) <> 0 ;
   End ;
   Result := '';
Finally
   SysUtils.FindClose(LSearchRec) ;
End ;
End ;

Function CheckVideoFilter ( AFilter: String ) : Boolean ;
Var P : PAVFilter ;
Begin
Assert(Assigned(avfilter_next)) ;
P := avfilter_next(Nil) ;
While Assigned(P) Do Begin
   If AnsiString(P.name) = AnsiString(AFilter) Then Begin
      Result := True ;
      Exit ;
   End ;
   P := avfilter_next(P);
End ;
Result := False ;
End ;

Function GetSubFile ( AVideoFile : String ) : String ;
Const CExts: Array[0..3] Of String = ('srt', 'smi', 'ssa', 'ass' ) ;
Var P, S, F : String ;
    I       : Integer ;
Begin
P := ExtractFilePath(AVideoFile);
S := ChangeFileExt(ExtractFileName(AVideoFile), '');
// base file name subtitles
For I := 0 to High(CExts) Do Begin
   If RR_FileExists ( 'GetSubFile/1', P + S + '.' + CExts[I]) Then Begin
      Result := P + S + '.' + CExts[I];
      Exit;
   End ;
End ;
// base file name + * subtitles
For I := 0 to High(CExts) Do Begin
   F := FindSubFile(P, S + '*.' + CExts[I]);
   If (F <> '') AND RR_FileExists ( 'GetSubFile/2' ,F) Then Begin
      Result := F;
      Exit;
   End ;
End ;
// * subtitles
{
for I := 0 to High(CExts) do
begin
  F := FindSubFile(P, '*.' + CExts[I]);
  if (F <> '') and RR_FileExists(F) then
  begin
    Result := F;
    Exit;
  end;
end;
}
Result := '' ;
End ;

{
function CheckFontConfig: Boolean;
var
  LTemp: array[0..255] of Char;
begin
  GetTempPath(255, LTemp);
  Result := RR_FileExists(LTemp + 'fontconfig\cache\CACHEDIR.TAG');
end;
}

Function TfrmPlayer.GetScreenHandle : HWND ;
Begin
// wincontrol used for render video
FScreenControl := FindWinControl(Self, cboScreens.Items.Strings[cboScreens.ItemIndex]) ;
If Assigned(FScreenControl) Then Begin
  Result := FScreenControl.Handle ;
End Else If cboScreens.Text = 'Desktop' Then Begin
  // render video on desktop
  Result := GetDesktopHandle ;
End Else Begin
  // render video on popup window
  Result := 0 ;
End ;
End ;

Procedure TfrmPlayer.PLAY ( Sender : TObject ; FN : String ) ;
Var LScreenHandle : HWND ;
    LPngFile      : String ;
    LSubFile      : String ;
Begin
If NOT FFPlayer.AVLibLoaded Then Begin
   If NOT FFPlayer.LoadAVLib(ExePath + CLibAVPath) Then Begin
      AddMsgLog(FFPlayer.LastErrMsg, True) ;
      Exit ;
   End ;
   If FFPlayer.InitSDL Then Begin
      // get audio devices after InitSDL()
      cboAudioDevice.Items.Assign(FFPlayer.AudioDevices) ;
      If cboAudioDevice.Items.Count > 0 Then Begin
         cboAudioDevice.ItemIndex := 0 ;
      End ;
   End ;
End ;
If Sender = btnURL Then Begin
   // open url
   FFPlayer.ReadTimeout := 1000 * 60 ;
   If NOT InputQuery('Open', 'URL(or Filename)', URL) or (Trim(URL) = '') then Begin
      // cancel open url
      Exit;
   End
End Else If FN <> '' Then Begin
End Else Begin
    // open media file
    If NOT OpenDialog1.Execute Then Begin
      // cancel open file
       Exit;
    End ;
    FN := OpenDialog1.FileName ;
End ;
// initial options
FFPlayer.DisableAudio := chkDisableAudio.Checked;
FFPlayer.DisableVideo := chkDisableVideo.Checked;
// libavfilter: please refer to http://ffmpeg.org/ffmpeg-filters.html
// NOTICE: What I know about libavfilter is also very limited.
//         so you have to get help of it by yourself.
//FFPlayer.VideoFilters := 'hue=H=2*PI*t:s=sin(2*PI*t)+1';
FFPlayer.VideoFilters := Format('hue=b=%f:s=%f:H=%f', [FBrightness, FSaturation, FHue]);
// text based external subtitles filter
if chkExternalSubtitle.Checked AND CheckVideoFilter('subtitles') AND (Sender <> btnURL) Then Begin
   // fontconfig requires config file
   //if RR_FileExists(ExtractFilePath(Application.ExeName) + 'fonts\fonts.conf') then
   //begin
   LSubFile := GetSubFile(FN);
   if LSubFile <> '' then begin
      AddMsgLog('Found external subtitle: ' + LSubFile);
      LSubFile := StringReplace(LSubFile, '\', '/', [rfReplaceAll]);
      LSubFile := StringReplace(LSubFile, ':', '\\:', [rfReplaceAll]);
      // default encoding is UTF-8, or special like XXX: subtitles=charenc=<XXX>:filename=<filename>
      FFPlayer.VideoFilters := FFPlayer.VideoFilters + ', subtitles=filename=' + LSubFile;
   end;
   //end;
   //else Begin
   //   AddMsgLog('Subtitles filter requires config file of FontConfig.', True);
   // End ;
End else Begin
    LSubFile := '';
End ;
If chkWaterMark.Checked Then Begin
   LPngFile := ExtractFilePath(Application.ExeName) + CWaterMark;
   LPngFile := StringReplace(LPngFile, '\', '/', [rfReplaceAll]);
   LPngFile := StringReplace(LPngFile, ':', '\\:', [rfReplaceAll]);
   // other filters effect overlay
   //if FFPlayer.VideoFilters <> '' then
   //  FFPlayer.VideoFilters := ', ' + FFPlayer.VideoFilters;
   //FFPlayer.VideoFilters := Format('movie=%s [watermark]; [in] [watermark] overlay=main_w-overlay_w-10:10 %s [out]',
   //  [LPngFile, FFPlayer.VideoFilters]);
   // other filters do not effect overlay
   If FFPlayer.VideoFilters <> '' Then Begin
      FFPlayer.VideoFilters := FFPlayer.VideoFilters + ' [main]; [main] ';
   End ;
   FFPlayer.VideoFilters := Format('movie=%s [watermark]; [in] %s [watermark] overlay=main_w-overlay_w-10:10 [out]',
     [LPngFile, FFPlayer.VideoFilters]);
{
   // two watermarks example
   FFPlayer.VideoFilters := Format('movie=%s [wm_left]; movie=%s [wm_right]; [in] %s [wm_left] overlay=10:10 [with_left];'+
     '[with_left] [wm_right] overlay=main_w-overlay_w-10:10 [out]',
     [LPngFile, LPngFile, FFPlayer.VideoFilters]);
}
End ;
LScreenHandle := GetScreenHandle ;
// set audio device before Open()/TryOpen(), or leave it empty for default
FFPlayer.AudioDevice := cboAudioDevice.Text ;
If Sender = btnURL Then Begin
    // try to open and play url, render on the custom window specified by handle
    //if not FFPlayer.Open(URL, LScreenHandle, chkOpenPaused.Checked) then
    //  AddMsgLog(FFPlayer.LastErrMsg, True);
    //FFPlayer.TryOpen ( URL, LScreenHandle, chkOpenPaused.Checked ) ;
    //FFPlayer.TryOpen ( URL, PN_Video.Handle, chkOpenPaused.Checked ) ;
    FFPlayer.TryOpen ( URL, PN_Video.Handle, TRUE ) ;
    PN_Video.Handle
End Else Begin
    // try to open and play media file, render on the custom window specified by handle
    //if not FFPlayer.Open(FN, LScreenHandle, chkOpenPaused.Checked) then
    //  AddMsgLog(FFPlayer.LastErrMsg, True);
    //FFPlayer.TryOpen(FN, LScreenHandle, chkOpenPaused.Checked);
    //FFPlayer.TryOpen ( FN, PN_Video.Handle, chkOpenPaused.Checked ) ;
    FFPlayer.TryOpen ( FN, PN_Video.Handle, TRUE ) ;

  //if (LSubFile <> '') and not CheckFontConfig then
  //  Application.MessageBox('FontConfig might scan fonts folder. if so, just wait a moment and then re-open the video file.', 'Information', MB_ICONINFORMATION);
End ;
End ;

Procedure TfrmPlayer.PLAY_AUDIO ( Sender : TObject ; FN : String ; AutoPlay : Boolean ) ;
Var LScreenHandle : HWND ;
    //LPngFile      : String ;
    //LSubFile      : String ;
Begin
If NOT RR_FileExists ( 'TfrmPlayer.PLAY_AUDIO', FN ) Then Begin
   PUT_LOG ( 'ERRO NOT FOUND PLAY_AUDIO [' + FN + ']' ) ;
   FFPlayer_Audio.Mute := TRUE ;
   Exit ;
End ;
FFPlayer_Audio.Mute := FALSE ;
If NOT FFPlayer_Audio.AVLibLoaded Then Begin
   If NOT FFPlayer_Audio.LoadAVLib(ExePath + CLibAVPath) Then Begin
      AddMsgLog(FFPlayer_Audio.LastErrMsg, True) ;
      Exit ;
   End ;
   If FFPlayer_Audio.InitSDL Then Begin
      // get audio devices after InitSDL()
      cboAudioDevice.Items.Assign(FFPlayer_Audio.AudioDevices) ;
      If cboAudioDevice.Items.Count > 0 Then Begin
         cboAudioDevice.ItemIndex := 0 ;
      End ;
   End ;
End ;
FFPlayer_Audio.DisableAudio := chkDisableAudio.Checked;
FFPlayer_Audio.DisableVideo := chkDisableVideo.Checked;
FFPlayer_Audio.VideoFilters := Format('hue=b=%f:s=%f:H=%f', [FBrightness, FSaturation, FHue]);
LScreenHandle := GetScreenHandle ;
FFPlayer_Audio.AudioDevice := cboAudioDevice.Text ;
//FFPlayer_Audio.TryOpen(FN, PN_Audio.Handle, chkOpenPaused.Checked) ;
FFPlayer_Audio.TryOpen(FN, PN_Audio.Handle, NOT AutoPlay ) ;
End ;

Procedure TfrmPlayer.btnOpenClick(Sender: TObject) ;
Begin
PLAY ( Sender, '' ) ;
End ;

procedure TfrmPlayer.Timer1Timer(Sender: TObject);
begin
frmPlayer.Caption := Title_RNews + ' Player ' + TimeToStr(Now) + ' - ' + ED_FN.Text ;
{
frmPlayer.Caption := Title_RNews + ' Player - ' + ED_FN.Text + ' ' +
                     'POS[' + CASA3_PONTO ( FFPlayer.CurrentPos ) + '/' +
                              CASA3_PONTO ( FFPlayer.PositionInterval ) + '] ' +
                     'PTS[' + CASA3_PONTO ( FFPlayer.CurrentPTS ) + '/' +
//                              CASA3_PONTO ( FFPlayer.StartTime ) + ':' +
//                              CASA3_PONTO ( FFPlayer.Start_Time ) + ':' +
                              CASA3_PONTO ( FFPlayer.PlayTime ) + ']' ;
}
end;

Procedure TfrmPlayer.TOGGLE_PAUSE ;
Begin
// toggle pause/resume
{
If FFPlayer.Paused Then Begin
   FFPlayer.Resume ;
End Else Begin
   FFPlayer.Pause ;
End ;
}
// built-in toggle pause/resume
FFPlayer.TogglePause ;
FFPlayer_Audio.TogglePause ;
End ;

Procedure TfrmPlayer.btnPauseClick(Sender: TObject) ;
Begin
TOGGLE_PAUSE ;
End ;

Procedure TfrmPlayer.FRAME_MAIS ;
Begin
FFPlayer.StepToNextFrame ;
FFPlayer_Audio.StepToNextFrame ;
End ;

Procedure TfrmPlayer.POSICAO_INICIAL ;
Begin
If NOT FIsBytes Then Begin
   FFPlayer.Seek ( 0 , [] ) ;
   FFPlayer_Audio.Seek ( 0 , [] ) ;
End Else Begin
   FFPlayer.Seek ( 0, [sfByte, sfBackward] ) ;
   FFPlayer_Audio.Seek ( 0, [sfByte, sfBackward] ) ;
End ;
End ;

Procedure TfrmPlayer.FRAME_MENOS ;
Begin
//FFPlayer.Seek ;
//FFPlayer_Audio.StepToNextFrame ;
If NOT FIsBytes Then Begin
   PUT_LOG ( 'Seek PTS FRAME_MENOS ANTES [' + CASA3_PONTO ( FFPlayer.CurrentPTS ) + ']' ) ;
   FFPlayer.Seek ( MAX ( 0, FFPlayer.CurrentPTS - 33000 ) , [sfBackward] ) ;
   PUT_LOG ( 'Seek PTS FRAME_MENOS DEPOIS [' + CASA3_PONTO ( FFPlayer.CurrentPTS ) + ']' ) ;
End Else Begin
   PUT_LOG ( 'Seek POS FRAME_MENOS ANTES [' + CASA3_PONTO ( FFPlayer.CurrentPTS ) + ']' ) ;
   FFPlayer.Seek ( FFPlayer.CurrentPTS - FFPlayer.PositionInterval, [sfByte, sfBackward] ) ; // FFPlayer.CurrentPTS
   PUT_LOG ( 'Seek POS FRAME_MENOS DEPOIS [' + CASA3_PONTO ( FFPlayer.CurrentPTS ) + ']' ) ;
End ;
End ;

Procedure TfrmPlayer.FRAME_INICIO ;
Begin
If NOT FIsBytes Then Begin
   FFPlayer.Seek ( 1 , [sfByte] ) ;
End Else Begin
   FFPlayer.Seek ( 1 ) ;
End ;
End ;

Procedure TfrmPlayer.SEGUNDO_MAIS ;
Begin
If NOT FIsBytes Then Begin
   PUT_LOG ( 'Seek PTS SEGUNDO_MAIS ANTES [' + CASA3_PONTO ( FFPlayer.CurrentPTS ) + ']' ) ;
   FFPlayer.Seek ( FFPlayer.CurrentPTS + 1000000 , [] ) ;
   PUT_LOG ( 'Seek PTS SEGUNDO_MAIS DEPOIS [' + CASA3_PONTO ( FFPlayer.CurrentPTS ) + ']' ) ;
End Else Begin
   PUT_LOG ( 'Seek POS SEGUNDO_MAIS ANTES [' + CASA3_PONTO ( FFPlayer.CurrentPOS ) + ']' ) ;
   FFPlayer.Seek ( FFPlayer.CurrentPos + FFPlayer.PositionInterval, [sfByte] ) ;
   PUT_LOG ( 'Seek POS SEGUNDO_MAIS DEPOIS [' + CASA3_PONTO ( FFPlayer.CurrentPOS ) + ']' ) ;
End ;
End ;

Procedure TfrmPlayer.SEGUNDO_MENOS ;
Begin
If NOT FIsBytes Then Begin
   PUT_LOG ( 'Seek PTS SEGUNDO_MENOS ANTES [' + CASA3_PONTO ( FFPlayer.CurrentPTS ) + ']' ) ;
   FFPlayer.Seek ( MAX ( 0, FFPlayer.CurrentPTS - 1000000 ) , [sfBackward] ) ;
   PUT_LOG ( 'Seek PTS SEGUNDO_MENOS DEPOIS [' + CASA3_PONTO ( FFPlayer.CurrentPTS ) + ']' ) ;
End Else Begin
   PUT_LOG ( 'Seek POS SEGUNDO_MENOS ANTES [' + CASA3_PONTO ( FFPlayer.CurrentPOS ) + ']' ) ;
   FFPlayer.Seek ( MAX ( 0, FFPlayer.CurrentPos - FFPlayer.PositionInterval ), [sfByte,sfBackward] ) ;
   PUT_LOG ( 'Seek POS SEGUNDO_MENOS DEPOIS [' + CASA3_PONTO ( FFPlayer.CurrentPOS ) + ']' ) ;
End ;
End ;

procedure TfrmPlayer.SlideChange(Sender: TObject);
begin
// do seek when change track bar
{
PUT_LOG ( 'FTrackChanging[' + IFSN(FTrackChanging) + '] ' +
          'IsMouseDown[' + IFSN(IsMouseDown) + '] ' +
          'FDuration[' + IntToStr(FDuration) + ']' ) ;
}
If (NOT FTrackChanging) AND // (NOT IsMouseDown) AND
   (FDuration > 0) Then Begin
   If FIsBytes Then Begin
      FFPlayer.Seek ( FDuration * Slide.Value DIV Slide.MaxValue, [sfByte] ) ;
      FFPlayer_Audio.Seek ( FDuration * Slide.Value DIV Slide.MaxValue, [sfByte] ) ;
   End Else Begin
      FFPlayer.Seek ( FDuration * Slide.Value DIV Slide.MaxValue ) ;
      FFPlayer_Audio.Seek ( FDuration * Slide.Value DIV Slide.MaxValue ) ;
   End ;
End Else Begin
End ;
LB_Posicao_Percentual.Caption := '[' + IntToStr ( Slide.Value * 100 DIV Slide.MaxValue ) + '%]' ;
End ;

procedure TfrmPlayer.SlideKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
Key := 0 ;
end;

procedure TfrmPlayer.SlideKeyPress(Sender: TObject; var Key: Char);
begin
Key := #0 ;
end;

procedure TfrmPlayer.SlideKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
Key := 0 ;
end;

procedure TfrmPlayer.btnStepClick(Sender: TObject);
begin
FRAME_MAIS ;
End ;

Procedure TfrmPlayer.STOP_ALL ;
Begin
// stop
FFPlayer.Stop(True);
FFPlayer_Audio.Stop(True);
End ;

Procedure TfrmPlayer.btnStopClick(Sender: TObject) ;
Begin
STOP_ALL ;
End ;

Procedure TfrmPlayer.btnCaptureClick(Sender: TObject) ;
Var BMP : TBitmap ;
    PTS : Int64 ;
Begin
// capture video frame
//FFPlayer.CurrentAVFrame.
//FFPlayer.tShowMode := t
If FFPlayer.CurrentFrame(BMP, PTS) Then Begin
   //BMP.SaveToFile('F:\snapshot_' + IntToStr(PTS) + '.bmp') ;
   SavePictureDialog1.FileName := ChangeFileExt(FFPlayer.FileName, '_snapshot_') + IntToStr(PTS) ;
   If SavePictureDialog1.Execute Then Begin
      If SameText(ExtractFileExt(SavePictureDialog1.FileName), '.bmp') Then Begin
         BMP.SaveToFile(SavePictureDialog1.FileName) ;
      End Else Begin
         With TJPEGImage.Create Do Begin
           Try
              Assign(BMP) ;
              SaveToFile(SavePictureDialog1.FileName) ;
           Finally
              Free ;
           End ;
         End ;
      End ;
  End ;
End ;
End ;

Function FromEXE : String ;
Var S: String ;
Begin
S := ChangeFileExt(ExtractFileName(Application.ExeName), '') ;
S := StringReplace(S, '[', '', [rfReplaceAll]) ;
S := StringReplace(S, ']', '', [rfReplaceAll]) ;
S := StringReplace(S, ' ', '_', [rfReplaceAll]) ;
Result := '/?from=exe_' + S ;
End ;

Procedure TfrmPlayer.btnWebSiteClick(Sender: TObject) ;
Begin
// web site
ShellExecute ( Application.Handle, 'Open',   {Do not Localize}
               PChar(LowerCase(SWebSite + FromEXE)), '',
               PChar(ExtractFilePath(Application.ExeName)), 1) ;
End ;

Procedure TfrmPlayer.cboScreensChange(Sender: TObject) ;
Begin
FFPlayer.ScreenHandle := GetScreenHandle ;
End ;

procedure TfrmPlayer.cboScreensKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
Key := 0 ;
end;

procedure TfrmPlayer.cboScreensKeyPress(Sender: TObject; var Key: Char);
begin
Key := #0 ;
end;

procedure TfrmPlayer.cboScreensKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
Key := 0 ;
end;

Procedure TfrmPlayer.cboVideoChange(Sender: TObject) ;
Var S: String ;
Begin
// change video stream channel
S := cboVideo.Text;
If Pos('#', S) > 0 Then Begin
   S := Copy(S, Pos('#', S) + 1, MaxInt);
   FFPlayer.VideoStreamIndex := StrToInt(S);
   If FIsBytes Then Begin
      FFPlayer.Seek ( FFPlayer.CurrentPos, [sfByte] ) ;
   End Else Begin
      FFPlayer.Seek ( FFPlayer.CurrentPTS ) ;
   End ;
End ;
End ;

procedure TfrmPlayer.cboVideoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
Key := 0 ;
end;

procedure TfrmPlayer.cboVideoKeyPress(Sender: TObject; var Key: Char);
begin
Key := #0 ;
end;

procedure TfrmPlayer.cboVideoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
Key := 0 ;
end;

Procedure TfrmPlayer.cboAudioChange(Sender: TObject) ;
Var S: String ;
Begin
// change audio stream channel
S := cboAudio.Text ;
If Pos('#', S) > 0 Then Begin
   S := Copy(S, Pos('#', S) + 1, MaxInt) ;
   FFPlayer.AudioStreamIndex := StrToInt(S) ;
   If FIsBytes Then Begin
      FFPlayer.Seek ( FFPlayer.CurrentPos, [sfByte] ) ;
   End Else Begin
      FFPlayer.Seek ( FFPlayer.CurrentPTS ) ;
   End ;
End ;
End ;

procedure TfrmPlayer.cboAudioDeviceKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
Key := 0 ;
end;

procedure TfrmPlayer.cboAudioDeviceKeyPress(Sender: TObject; var Key: Char);
begin
Key := #0 ;
end;

procedure TfrmPlayer.cboAudioDeviceKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
Key := 0 ;
end;

procedure TfrmPlayer.cboAudioKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
Key := 0 ;
end;

procedure TfrmPlayer.cboAudioKeyPress(Sender: TObject; var Key: Char);
begin
Key := #0 ;
end;

procedure TfrmPlayer.cboAudioKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
Key := 0 ;
end;

Procedure TfrmPlayer.cboSubtitleChange(Sender: TObject) ;
Var S: String ;
Begin
// change subtitle stream channel
S := cboSubtitle.Text ;
If Pos('#', S) > 0 Then Begin
   S := Copy(S, Pos('#', S) + 1, MaxInt) ;
   FFPlayer.SubtitleStreamIndex := StrToInt(S) ;
   if FIsBytes Then Begin
      FFPlayer.Seek ( FFPlayer.CurrentPos, [sfByte] ) ;
   End Else Begin
      FFPlayer.Seek ( FFPlayer.CurrentPTS ) ;
   End ;
End ;
End ;

procedure TfrmPlayer.cboSubtitleKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
Key := 0 ;
end;

procedure TfrmPlayer.cboSubtitleKeyPress(Sender: TObject; var Key: Char);
begin
Key := #0 ;
end;

procedure TfrmPlayer.cboSubtitleKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
Key := 0 ;
end;

Procedure TfrmPlayer.AJUSTAR_ASPECTO ;
Begin
{
  = 0 -> keeping original
  < 0 -> scaling to fit screen
  > 0 -> custom, for example: 4/3, 16/9, 1.85, 2.35
}
  // change aspect ratio
  Case cboAspectRatio.ItemIndex Of
     1 : FFPlayer.AspectRatio := -1 ;
     2 : FFPlayer.AspectRatio := 4 / 3 ;
     3 : FFPlayer.AspectRatio := 16 / 9 ;
     4 : FFPlayer.AspectRatio := 1.85 ;
     5 : FFPlayer.AspectRatio := 2.35 ;
  Else
       FFPlayer.AspectRatio := 0 ;
  End ;
End ;

Procedure TfrmPlayer.cboAspectRatioChange(Sender: TObject) ;
Begin
AJUSTAR_ASPECTO ;
End ;

procedure TfrmPlayer.cboAspectRatioKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
Key := 0 ;
end;

procedure TfrmPlayer.cboAspectRatioKeyPress(Sender: TObject; var Key: Char);
begin
Key := #0 ;
end;

procedure TfrmPlayer.cboAspectRatioKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
Key := 0 ;
end;

Procedure TfrmPlayer.chkVerticalFlipClick(Sender: TObject) ;
Begin
// toggle enable/disable vertical flip
FFPlayer.VerticalFlip := chkVerticalFlip.Checked ;
End ;

Procedure TfrmPlayer.chkFrameHookClick(Sender: TObject) ;
Begin
// toggle enable/disable frame hook
FFPlayer.FrameHook := chkFrameHook.Checked ;
End ;

Procedure TfrmPlayer.chkVideoHookClick(Sender: TObject) ;
Begin
// toggle enable/disable video hook
FFPlayer.VideoHook := chkVideoHook.Checked ;
End ;

Procedure TfrmPlayer.trbSpeedChange(Sender: TObject) ;
Begin
// change playback speed
If IsMouseDown Then Begin
    Exit ;
End ;
If trbSpeed.Position = 0 Then Begin
   FFPlayer.PlaybackSpeed := 1.0 ;
   FFPlayer_Audio.PlaybackSpeed := 1.0 ;
   FFPlayer.SyncType := stAudio ;
   FFPlayer_Audio.SyncType := stAudio ;
   If FIsBytes Then Begin
      FFPlayer.Seek ( FFPlayer.CurrentPos, [sfByte] ) ;
      FFPlayer_Audio.Seek ( FFPlayer.CurrentPos, [sfByte] ) ;
   End Else Begin
      FFPlayer.Seek ( FFPlayer.CurrentPTS ) ;
      FFPlayer_Audio.Seek ( FFPlayer.CurrentPTS ) ;
   End ;
   lblSpeed.Caption := 'Playback Speed 100%' ;
End Else Begin
   If trbSpeed.Position > 0 Then Begin
      FFPlayer.PlaybackSpeed := trbSpeed.Position * 15/100 + 1 ;
      FFPlayer_Audio.PlaybackSpeed := trbSpeed.Position * 15/100 + 1 ;
   End Else Begin
      FFPlayer.PlaybackSpeed := trbSpeed.Position * 15/1600 + 1 ;
      FFPlayer_Audio.PlaybackSpeed := trbSpeed.Position * 15/1600 + 1 ;
   End ;
   FFPlayer.SyncType := stExternal ;
   FFPlayer_Audio.SyncType := stExternal ;
   lblSpeed.Caption := Format('Playback Speed %d%%', [Round(FFPlayer.PlaybackSpeed * 100)]) ;
End ;
End ;

procedure TfrmPlayer.trbSpeedKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
Key := 0 ;
end;

procedure TfrmPlayer.trbSpeedKeyPress(Sender: TObject; var Key: Char);
begin
Key := #0 ;
end;

procedure TfrmPlayer.trbSpeedKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
Key := 0 ;
end;

Procedure TfrmPlayer.btnSpeedClick(Sender: TObject) ;
Begin
// reset playback speed
trbSpeed.Position := 0 ;
End ;

Procedure TfrmPlayer.trbBrightnessChange(Sender: TObject) ;
Begin
// change brightness range (-10 - 10)
FBrightness := trbBrightness.Position / 10 ;
FFPlayer.SendVideoFilterCommand('hue', 'b', FloatToStr(FBrightness), 0) ;
End ;

procedure TfrmPlayer.trbBrightnessKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
Key := 0 ;
end;

procedure TfrmPlayer.trbBrightnessKeyPress(Sender: TObject; var Key: Char);
begin
Key := #0 ;
end;

procedure TfrmPlayer.trbBrightnessKeyUp(Sender: TObject; var Key: Word;
          Shift: TShiftState);
begin
Key := 0 ;
end ;

Procedure TfrmPlayer.ABRIR_ARQUIVO ( FN : String ) ;
Begin
If NOT CHECAR_FFMPEG_EXE Then Begin
   Exit ;
End ;
If FN = '' Then Begin
   If NOT Main.SELECIONAR_ARQUIVO_DE_VIDEO Then Begin
      Exit ;
   End ;
   FN := Main.OpenDialogVideo.Files[0] ;
End ;
//ShowMessage ( FN ) ;
If IS_ARQUIVO_DAV ( FN ) Then Begin
   GET_INFO_DAV ( FN ) ;
End ;
Main.OpenDialogVideo.InitialDir := ExtractFilePath ( Main.OpenDialogVideo.FileName ) ;
frmPlayer.Caption := Title_RNews + ' Player - ' + FN ;
Extracao_Frames.SB.SimpleText := FN ;
Conversao_Video.SB.SimpleText := FN ;
frmPlayer.SB.SimpleText := FN ;
frmPlayer.ED_FN.Text := FN ;
Main.EXEC_PLAY ( FN, FALSE ) ;
MISC_GET_INFO_VIDEO ( FN ) ;
FFPlayer.Seek ( 0, [] ) ;
FFPlayer_Audio.Seek ( 0, [] ) ;
AJUSTAR_ASPECTO ;
End ;

Procedure TfrmPlayer.Bot_Abrir_ArquivoClick(Sender: TObject) ;
Begin
ABRIR_ARQUIVO ( '' ) ;
End ;

procedure TfrmPlayer.Bot_Abrir_ConvertidoClick(Sender: TObject);
begin
ABRIR_ARQUIVO ( FN_Video_Convertido ) ;
end;

Procedure TfrmPlayer.Bot_Capturar_FrameClick(Sender: TObject) ;
Var Aux : String ;
Begin
Aux := System.SysUtils.StringReplace ( LB_Posicao.Caption, '(', '', [rfReplaceAll] ) ;
Aux := System.SysUtils.StringReplace ( Aux, ')', '', [rfReplaceAll] ) ;
Extracao_Frames.ED_Inicio.Text := Aux ;
Extracao_Frames.RB_Imagem_Unica.Checked := TRUE ;
Extracao_Frames.ShowModal ;
End ;

Procedure TfrmPlayer.Bot_ConverterClick(Sender: TObject) ;
Begin
Conversao_Video.ED_Inicio.Text := ED_Cue_In.Text ;
Conversao_Video.ED_Final.Text := ED_Cue_Out.Text ;
Conversao_Video.Caption := 'Convers?o de V?deo - ' + ExtractFileName ( SB.SimpleText ) ;
//Conversao_Video.SB.SimpleText := ExtractFileName ( SB.SimpleText ) ;
Bot_Abrir_Convertido.Enabled := ( Conversao_Video.ShowModal = mrOk ) ;
End ;

procedure TfrmPlayer.Bot_Frame_MaisClick(Sender: TObject);
begin
FRAME_MAIS ;
end;

Procedure TfrmPlayer.Bot_Frame_MenosClick(Sender: TObject) ;
Begin
FRAME_MENOS ;
End ;

procedure TfrmPlayer.Bot_ImagensClick(Sender: TObject);
Var Dir : String ;
Begin
Dir := INSERE_BARRA ( INSERE_BARRA ( ExtractFilePath ( SB.SimpleText ) ) +
                      INSERE_BARRA ( ExtractFileNameSemExt ( SB.SimpleText ) ) +
                      INSERE_BARRA ( 'Frames' ) +
                      INSERE_BARRA ( 'Temp' )
                    ) ;
CHECAR_DIRETORIO_DIRNAME ( Dir ) ;
OPEN_FOLDER_EXPLORER ( Dir ) ;
End ;

procedure TfrmPlayer.Bot_InfoClick(Sender: TObject);
begin
ShowMessage ( 'AV_TIME_BASE [' + IntToStr ( AV_TIME_BASE ) + ']' ) ;
end;

Procedure TfrmPlayer.Bot_InicioClick(Sender: TObject) ;
Begin
POSICAO_INICIAL ;
End ;

procedure TfrmPlayer.MARCAR_INICIO ;
begin
If IS_ARQUIVO_DAV ( SB.SimpleText ) Then Begin
   ShowMessage ( 'O arquivo do tipo DAV n?o pode ser recortado e deve ser convertido integralmente.' ) ;
   Exit ;
End ;
ED_Cue_In.Text := LB_Posicao.Caption ;
end;

procedure TfrmPlayer.MARCAR_FINAL ;
begin
If IS_ARQUIVO_DAV ( SB.SimpleText ) Then Begin
   ShowMessage ( 'O arquivo do tipo DAV n?o pode ser recortado e deve ser convertido integralmente.' ) ;
   Exit ;
End ;
ED_Cue_Out.Text := LB_Posicao.Caption ;
end;

procedure TfrmPlayer.Bot_Marcar_FinalClick(Sender: TObject);
begin
MARCAR_FINAL ;
end;

procedure TfrmPlayer.Bot_Marcar_InicioClick(Sender: TObject);
begin
MARCAR_INICIO ;
end;

procedure TfrmPlayer.Bot_Marcar_TudoClick(Sender: TObject);
begin
ED_Cue_In.Text := '00:00:00.000' ;
ED_Cue_Out.Text := lblDuration3.Caption ;
end;

Procedure TfrmPlayer.Bot_PauseClick(Sender: TObject) ;
Begin
TOGGLE_PAUSE ;
End ;

Procedure TfrmPlayer.Bot_Seg_MaisClick(Sender: TObject) ;
Begin
SEGUNDO_MAIS ;
End ;

Procedure TfrmPlayer.Bot_Seg_MenosClick(Sender: TObject) ;
Begin
SEGUNDO_MENOS ;
End ;

Procedure TfrmPlayer.btnBrightnessClick(Sender: TObject) ;
Begin
// reset brightness
trbBrightness.Position := 0 ;
End ;

Procedure TfrmPlayer.trbSaturationChange(Sender: TObject) ;
Begin
// change saturation range (-10 - 10)
FSaturation := trbSaturation.Position / 10 ;
FFPlayer.SendVideoFilterCommand('hue', 's', FloatToStr(FSaturation), 0) ;
End ;

procedure TfrmPlayer.trbSaturationKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
Key := 0 ;
end;

procedure TfrmPlayer.trbSaturationKeyPress(Sender: TObject; var Key: Char);
begin
Key := #0 ;
end;

procedure TfrmPlayer.trbSaturationKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
Key := 0 ;
end;

Procedure TfrmPlayer.btnSaturationClick(Sender: TObject) ;
Begin
// reset saturation
trbSaturation.Position := 10 ;
End ;

Procedure TfrmPlayer.trbHueChange(Sender: TObject) ;
Begin
// change hue degrees range (-PI - PI)
FHue := trbHue.Position / 100 * PI ;
FFPlayer.SendVideoFilterCommand('hue', 'H', FloatToStr(FHue), 0) ;
End ;

procedure TfrmPlayer.trbHueKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
Key := 0 ;
end;

procedure TfrmPlayer.trbHueKeyPress(Sender: TObject; var Key: Char);
begin
Key := #0 ;
end;

procedure TfrmPlayer.trbHueKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
Key := 0 ;
end;

Procedure TfrmPlayer.btnHueClick(Sender: TObject) ;
Begin
// reset hue
trbHue.Position := 0 ;
End ;

procedure TfrmPlayer.chkAudioHookClick(Sender: TObject) ;
Begin
// toggle enable/disable audio hook
FFPlayer.AudioHook := chkAudioHook.Checked ;
PB_Left.Position := 0 ;
PB_Right.Position := 0 ;
End ;

procedure TfrmPlayer.chkAudioHookKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
Key := 0 ;
end;

procedure TfrmPlayer.chkAudioHookKeyPress(Sender: TObject; var Key: Char);
begin
Key := #0 ;
end;

procedure TfrmPlayer.chkAudioHookKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
Key := 0 ;
end;

Procedure TfrmPlayer.chkMuteClick(Sender: TObject) ;
Begin
// toggle audio mute
FFPlayer.Mute := chkMute.Checked ;
End ;

Procedure TfrmPlayer.trbAudioVolumeChange(Sender: TObject) ;
Begin
// change audio volume range (0-128)
FFPlayer.AudioVolume := trbAudioVolume.Max - trbAudioVolume.Position ;
End ;

procedure TfrmPlayer.trbAudioVolumeKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
Key := 0 ;
end;

procedure TfrmPlayer.trbAudioVolumeKeyPress(Sender: TObject; var Key: Char) ;
begin
Key := #0 ;
end;

procedure TfrmPlayer.trbAudioVolumeKeyUp(Sender: TObject; var Key: Word ; Shift: TShiftState);
begin
Key := 0 ;
end;

Procedure TfrmPlayer.cboShowModeChange(Sender: TObject) ;
Begin
// change show mode
FFPlayer.ShowMode := TShowMode(cboShowMode.ItemIndex) ;
End;

procedure TfrmPlayer.cboShowModeKeyDown(Sender: TObject; var Key : Word ; Shift: TShiftState);
begin
Key := 0 ;
end;

procedure TfrmPlayer.cboShowModeKeyPress(Sender: TObject; var Key: Char);
begin
Key := #0 ;
end;

procedure TfrmPlayer.cboShowModeKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
Key := 0 ;
end;

Procedure TfrmPlayer.chkFullScreenClick(Sender: TObject) ;
Const LAlign: Array[Boolean] Of TAlign = (alNone, alClient) ;
{$J+}
  LastBounds: TRect = () ;
{$J-}
Var LToFullScreen : Boolean ;
    I             : Integer ;
Begin
// toggle full/normal screen
LToFullScreen := PN_Video.Align <> alClient ;
If LToFullScreen <> chkFullScreen.Checked Then Begin
   Exit ;
End ;
// save normal position and size
If LToFullScreen Then Begin
   LastBounds := PN_Video.BoundsRect ;
End ;
// toggle other controls visible
For I := 0 To ControlCount - 1 Do Begin
   If Controls[I].Name <> 'PN_Video' Then Begin
      TControl(Controls[I]).Visible := NOT LToFullScreen ;
   End ;
End ;
// toggle full or normal screen
MaxOrNormalForm(Self, LToFullScreen) ;
PN_Video.Align := LAlign[LToFullScreen] ;
PN_Video.Top := 0 ;
Sleep(10) ;
// restore normal position and size
If NOT LToFullScreen Then Begin
   PN_Video.BoundsRect := LastBounds ;
   PN_Video.Anchors := [akLeft, akTop, akRight, akBottom] ;
   PN_Video.Top := 0 ;
End ;
End ;

Procedure TfrmPlayer.chkStayOnTopClick(Sender: TObject) ;
Begin
// toggle stay on top
If chkStayOnTop.Checked AND NOT FFPlayer.Paused Then
    Self.FormStyle := fsStayOnTop
  Else
    Self.FormStyle := fsNormal ;
End ;

Procedure TfrmPlayer.chkMsgLogClick(Sender: TObject) ;
Begin
// toggle message log
ShowMsgLog(chkMsgLog.Checked) ;
End ;

Procedure TfrmPlayer.PN_VideoDblClick(Sender: TObject) ;
Begin
// toggle full/normal screen
chkFullScreen.Checked := not chkFullScreen.Checked ;
If Full_Screen.Visible Then Begin
   Full_Screen.Close ;
End Else Begin
   Full_Screen.BorderStyle := bsNone ;
   Full_Screen.Show ;
   Full_Screen.WindowState := wsMaximized ;
   FFPlayer.ScreenHandle := Full_Screen.PN_FullScreen.Handle ;
   Full_Screen.Invalidate ;
   Full_Screen.Repaint ;
End ;
End ;

Procedure TfrmPlayer.PN_VideoMouseDown(Sender: TObject; Button: TMouseButton ;
          Shift: TShiftState; X, Y: Integer) ;
Begin
// init FrameHook rect
FLock.Enter ;
Try
   FRect.Left := X ;
   FRect.Top := Y ;
   FRect.Right := X ;
   FRect.Bottom := Y ;
Finally
    FLock.Leave ;
End ;
End ;

Procedure TfrmPlayer.PN_VideoMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer) ;
Begin
// resize FrameHook rect
If Shift = [ssLeft] Then Begin
    If FLock.TryEnter Then Begin
       Try
          FRect.Right := X ;
          FRect.Bottom := Y ;
       Finally
          FLock.Leave ;
       End ;
    End ;
End ;
End ;

Procedure TfrmPlayer.PN_VideoMouseUp(Sender: TObject; Button: TMouseButton;
          Shift: TShiftState; X, Y: Integer);
Begin
// resize FrameHook rect
FLock.Enter ;
Try
   FRect.Right := X ;
   FRect.Bottom := Y ;
Finally
   FLock.Leave ;
End ;
End ;

Procedure TfrmPlayer.TrackBar2Change(Sender: TObject) ;
Begin
// do seek when change track bar
{
If NOT FTrackChanging AND NOT IsMouseDown AND (FDuration > 0) Then Begin
   If FIsBytes Then Begin
      FFPlayer.Seek ( FDuration * Slide.Value DIV Slide.MaxValue, [sfByte] ) ;
      FFPlayer_Audio.Seek ( FDuration * Slide.Value DIV Slide.MaxValue, [sfByte] ) ;
   End Else Begin
      FFPlayer.Seek ( FDuration * Slide.Value DIV Slide.MaxValue ) ;
      FFPlayer_Audio.Seek ( FDuration * Slide.Value DIV Slide.MaxValue ) ;
   End ;
End ;
}
End ;

procedure TfrmPlayer.TrackBar2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
Key := 0 ;
end;

procedure TfrmPlayer.TrackBar2KeyPress(Sender: TObject; var Key: Char);
begin
Key := #0 ;
end;

procedure TfrmPlayer.TrackBar2KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
Key := 0 ;
end;

Function BytesToStr(AFileSize: Int64) : String ;
Begin
Result := Format('%.3d', [AFileSize MOD 1000]) ;
AFileSize := Trunc(AFileSize / 1000) ;
While AFileSize > 0 Do Begin
   Result := Format('%.3d,%s', [AFileSize MOD 1000, Result]) ;
   AFileSize := Trunc(AFileSize / 1000) ;
End ;
End ;

Function DurationToStr ( ADuration: Int64 ; Var LB2 : String ) : String ;
Var hours, mins, secs, us: Integer ;
Begin
If ADuration <> AV_NOPTS_VALUE Then Begin
   secs := (ADuration + 5000) DIV AV_TIME_BASE ;
   us := (ADuration + 5000) MOD AV_TIME_BASE ;
   mins := secs DIV 60 ;
   secs := secs MOD 60 ;
   hours := mins DIV 60 ;
   mins := mins MOD 60 ;
   LB2 := Format('%.2d:%.2d:%.2d.%.3d',
                   [hours, mins, secs, (1000 * us) DIV AV_TIME_BASE ]) ;
   Result := Format('%.2d:%.2d:%.2d.%.2d',
                   [hours, mins, secs, (1000 * us) DIV AV_TIME_BASE DIV 33 ]) ;
End Else Begin
   LB2 := 'N/A' ;
   Result := 'N/A' ;
End ;
End ;

Procedure TfrmPlayer.FFPlayer_AudioFileOpen ( Sender: TObject ;
          const ADuration: Int64; AFrameWidth, AFrameHeight: Integer;
          var AScreenWidth, AScreenHeight : Integer ) ;
Var //I            : Integer ;
    aspect_ratio : Single ;
    P            : PAVStream ;
Begin
// OnFileOpen event handler
// show media file info
AddMsgLog(FFPlayer_Audio.Decoder.FileInfoText) ;
// aspect ratio
If FFPlayer_Audio.VideoStreamIndex >= 0 Then Begin
   P := PPtrIdx(FFPlayer_Audio.Decoder.FileHandle.streams, FFPlayer_Audio.VideoStreamIndex) ;
   With P.codec^ Do Begin
      If (sample_aspect_ratio.num <> 0) AND (sample_aspect_ratio.den <> 0) Then Begin
         aspect_ratio := sample_aspect_ratio.num / sample_aspect_ratio.den
      End Else Begin
         aspect_ratio := 1.0 ;
      End ;
   aspect_ratio := aspect_ratio * width / height ;
   End ;
AddMsgLog(Format('aspect ratio FF_Player_Audio: %f', [aspect_ratio])) ;
End ;
End ;

Procedure TfrmPlayer.FFPlayer_AudioFrameHook(Sender: TObject;
          APicture: PAVPicture; APixFmt: TAVPixelFormat; AWidth, AHeight: Integer;
          Const APTS: Int64) ;
Var R: TRect ;
Begin
//If NOT FLAG_PLAY_AUDIO Then Begin
//   Exit ;
//End ;
FLock.Enter ;
Try
   R := FFPlayer_Audio.DisplayToActualRect(FRect) ;
   If (R.Right > R.Left) AND (R.Bottom > R.Top) Then
      FrameEffects.adjust_eq(PByte(Integer(APicture.data[0]) + APicture.linesize[0] * R.Top + R.Left),
             APicture.linesize[0],
             R.Right - R.Left,
             R.Bottom - R.Top,
             20,
             0) ;
Finally
   FLock.Leave ;
End ;
End ;

Procedure TfrmPlayer.FFPlayer_AudioOpenFailed(Sender: TObject) ;
Begin
AddMsgLog ( FFPlayer_Audio.LastErrMsg, True ) ;
End ;

Procedure TfrmPlayer.FFPlayer_AudioState(Sender: TObject; APlayState: TPlayState) ;
Const CPlayState : Array[TPlayState] Of String = ('Play', 'Pause', 'Resume', 'Step', 'Stop', 'End') ;
Begin
// OnState event handler
// show state
//If NOT FLAG_PLAY_AUDIO Then Begin
//   Exit ;
//End ;
AddMsgLog(CPlayState[APlayState]);
Case APlayState Of
    psPlay, psResume :
      If chkStayOnTop.Checked Then
        Self.FormStyle := fsStayOnTop ;
    psPause, psStep:
      Self.FormStyle := fsNormal ;
    psStop:
      Begin
        Self.FormStyle := fsNormal ;
        // repaint the screen to the original appearance
        If HWND(FFPlayer.ScreenHandle) <> 0 Then Begin
           PostMessage ( FFPlayer_Audio.ScreenHandle, CM_INVALIDATE, 0, 0 ) ;
           UpdateWindow ( FFPlayer_Audio.ScreenHandle ) ;
        End ;
      End ;
    psEnd:
      Begin
//        FFPlayer.Stop;
      FFPlayer.Pause ;
      If FIsBytes Then Begin
         FFPlayer.Seek ( 0, [sfByte] ) ;
      End Else Begin
         FFPlayer.Seek ( 0, [sfBackward] ) ;
      End ;
      End ;
  End;
// loop example
{
  if AState = psEnd then
    if FIsBytes then
      FFPlayer_Audio.Seek ( 0, [sfByte] ) ;
    else
      FFPlayer_Audio.Seek ( 0, [sfBackward] ) ;
}
// play next example, need a Timer
{
  if AState = psEnd then
  begin
    Timer1.Interval := 20;
    Timer1.Enabled := True;
    // in Timer1.OnTimer
    //Timer1.Enabled := False;
    //FFPlayer_Audio.TryOpen('<the next file>', TheScreenHandle);
  end;
}
End ;

Procedure TfrmPlayer.FFPlayer_AudioVideoHook(Sender: TObject; ABitmap: TBitmap ;
          Const APTS: Int64; Var AUpdate: Boolean ) ;
Begin
// OnVideoHook event handler
//If NOT FLAG_PLAY_AUDIO Then Begin
//   Exit ;
//End ;
With ABitmap.Canvas.Font Do Begin // setup font example
   Color := clWhite ;
   Name := 'Tahoma' ;
   Size := 12 ;
   Style := [fsBold, fsUnderline] ;
End ;
// text out with Presentation Time Stamp example
ABitmap.Canvas.TextOut(10, 10, Format(SHookTimeStamp, [APTS])) ;
// draw graphic example
ABitmap.Canvas.Draw ( ABitmap.Width - Application.Icon.Width - 10,
                      ABitmap.Height - Application.Icon.Height - 10,
                      Application.Icon ) ;
End ;

Procedure TfrmPlayer.FFPlayerFileOpen(Sender: TObject; const ADuration: Int64;
          AFrameWidth, AFrameHeight: Integer; var AScreenWidth, AScreenHeight: Integer) ;
Var I            : Integer ;
    aspect_ratio : Single ;
    P            : PAVStream ;
    LB2          : String ;
Begin
// OnFileOpen event handler
// show media file info
AddMsgLog(FFPlayer.Decoder.FileInfoText);
// aspect ratio
If FFPlayer.VideoStreamIndex >= 0 Then Begin
   P := PPtrIdx(FFPlayer.Decoder.FileHandle.streams, FFPlayer.VideoStreamIndex);
   With P.codec^ Do Begin
      If (sample_aspect_ratio.num <> 0) AND (sample_aspect_ratio.den <> 0) Then Begin
         aspect_ratio := sample_aspect_ratio.num / sample_aspect_ratio.den
      End Else Begin
         aspect_ratio := 1.0 ;
      End ;
   aspect_ratio := aspect_ratio * width / height ;
   End ;
AddMsgLog(Format('aspect ratio FF_Player_Video: %f', [aspect_ratio])) ;
End ;
// show information
AddMsgLog ( Format ( 'file size: %s, duration: %s, frame size: %dx%d',
                     [BytesToStr(FFPlayer.Decoder.FileSize),
                      DurationToStr(ADuration, LB2), AFrameWidth, AFrameHeight])) ;
// tell player the screen size
If Assigned(FScreenControl) Then Begin
   // win control
   AScreenWidth := FScreenControl.Width ;
   AScreenHeight := FScreenControl.Height ;
End Else If cboScreens.Text = 'Desktop' Then Begin
   // desktop
   AScreenWidth := Screen.DesktopWidth ;
   AScreenHeight := Screen.DesktopHeight ;
End Else Begin
    // popup window
   AScreenWidth := 640 ; // Screen.Width;
   AScreenHeight := 480 ; // Screen.Height;
End ;
// duration of media file
FDuration := ADuration ;
If (FDuration < 0) AND (FFPlayer.Decoder.FileSize > 0) Then Begin
   FIsBytes := TRUE ;
   FDuration := FFPlayer.Decoder.FileSize ;
End Else Begin
   FIsBytes := FALSE ;
End ;
If FIsBytes Then Begin
   lblDuration.Caption := BytesToStr(FDuration) ;
   lblDuration3.Caption := lblDuration.Caption ;
   ED_Cue_Out.Text := lblDuration.Caption ;
End Else Begin
   lblDuration.Caption := DurationToStr(ADuration, LB2) ;
   lblDuration3.Caption := LB2 ;
   ED_Cue_Out.Text := LB2 ;
End ;
lblCurrentPTS.Caption := 'N/A' ;
// setup track bar
{
TrackBar1.Frequency := 5 ;
TrackBar1.TickStyle := tsAuto ;
TrackBar1.Max := TrackBar1.Width ;
TrackBar1.SelStart := 0 ;
TrackBar1.SelEnd := 0 ;
TrackBar1.SliderVisible := FDuration > 0 ;
}
Slide.MaxValue := Slide.Width ;
//
FTrackChanging := TRUE ;
Try
   //TrackBar1.Position := 0 ;
   Slide.Value := 0 ;
Finally
   FTrackChanging := FALSE ;
End ;
// setup stream info, including video, audio and subtitle
cboVideo.Items.BeginUpdate ;
cboAudio.Items.BeginUpdate ;
cboSubtitle.Items.BeginUpdate ;
try
   cboVideo.Items.Clear ;
   cboAudio.Items.Clear ;
   cboSubtitle.Items.Clear ;
   For I := 0 to FFPlayer.Decoder.StreamCount - 1 Do Begin
      If FFPlayer.Decoder.IsVideoStream(I) Then Begin
         cboVideo.Items.Add(Format('Video#%d', [I]))
      End Else If FFPlayer.Decoder.IsAudioStream(I) Then Begin
         cboAudio.Items.Add(Format('Audio#%d', [I]))
      End Else If FFPlayer.Decoder.IsSubtitleStream(I) Then Begin //and (FFPlayer.Decoder.SubtitleStreamInfos[I].SubFormat = 0) then
         cboSubtitle.Items.Add(Format('Subtitle#%d', [I])) ;
      End ;
   End ;
   cboVideo.Enabled := (cboVideo.Items.Count > 1) AND (FFPlayer.VideoStreamIndex >= 0);
   cboVideo.ItemIndex := cboVideo.Items.IndexOf(Format('Video#%d', [FFPlayer.VideoStreamIndex]));
   cboAudio.Enabled := (cboAudio.Items.Count > 1) AND (FFPlayer.AudioStreamIndex >= 0);
   cboAudio.ItemIndex := cboAudio.Items.IndexOf(Format('Audio#%d', [FFPlayer.AudioStreamIndex]));
   cboSubtitle.Enabled := (cboSubtitle.Items.Count > 0) AND (FFPlayer.VideoStreamIndex >= 0);
   If cboSubtitle.Enabled Then Begin
      cboSubtitle.Items.Insert(0, 'Subtitle#-1');
      cboSubtitle.ItemIndex := cboSubtitle.Items.IndexOf ( Format('Subtitle#%d',
                               [FFPlayer.SubtitleStreamIndex]));
   End ;
Finally
  cboVideo.Items.EndUpdate ;
  cboAudio.Items.EndUpdate ;
  cboSubtitle.Items.EndUpdate ;
End ;
End ;

Procedure TfrmPlayer.FFPlayerOpenFailed(Sender: TObject) ;
Begin
AddMsgLog(FFPlayer.LastErrMsg, True) ;
End ;

Procedure TfrmPlayer.FFPlayerFrameHook(Sender: TObject; APicture: PAVPicture;
          APixFmt: TAVPixelFormat; AWidth, AHeight: Integer; const APTS: Int64) ;
Var R: TRect ;
Begin
//If FLAG_PLAY_AUDIO Then Begin
//   Exit ;
//End ;
FLock.Enter ;
Try
   R := FFPlayer.DisplayToActualRect(FRect) ;
   If (R.Right > R.Left) AND (R.Bottom > R.Top) Then Begin
      FrameEffects.adjust_eq(PByte(Integer(APicture.data[0]) + APicture.linesize[0] * R.Top + R.Left),
             APicture.linesize[0],
             R.Right - R.Left,
             R.Bottom - R.Top,
             20,
             0) ;
   End ;
Finally
   FLock.Leave ;
End ;
End ;

Procedure GetLevelS16(ASample: PByte; ASize, ASampleRate, AChannels: Integer; Out L, R: Integer) ;
Var P  : PSmallInt ;
    I  ,
    C  : Integer ;
    L1 ,
    L2 : SmallInt ;
Begin
// get level of audio sample in signed 16 bits format
P := PSmallInt(ASample) ;
L1 := 0 ;
L2 := 0 ;
For I := 0 To ASize DIV SizeOf(SmallInt) DIV AChannels - 1 Do Begin
  For C := 0 To AChannels - 1 Do Begin
     If (C MOD 2) = 0 Then Begin
        If Abs(P^) > L1 Then Begin
           L1 := Abs(P^) ;
        End ;
     End Else Begin
        If Abs(P^) > L2 Then Begin
           L2 := Abs(P^) ;
        End ;
     End ;
     Inc(P);
  End ;
End ;
L := L1 ;
R := L2 ;
End ;

Procedure TfrmPlayer.FFPlayerVideoHook(Sender: TObject; ABitmap: TBitmap ;
          Const APTS: Int64; var AUpdate: Boolean ) ;
Begin
// OnVideoHook event handler
//If FLAG_PLAY_AUDIO Then Begin
//   Exit ;
//End ;
With ABitmap.Canvas.Font Do Begin // setup font example
   Color := clWhite ;
   Name := 'Tahoma' ;
   Size := 12 ;
   Style := [fsBold, fsUnderline] ;
End ;
// text out with Presentation Time Stamp example
ABitmap.Canvas.TextOut(10, 10, Format(SHookTimeStamp, [APTS])) ;
// draw graphic example
ABitmap.Canvas.Draw ( ABitmap.Width - Application.Icon.Width - 10,
                      ABitmap.Height - Application.Icon.Height - 10,
                      Application.Icon ) ;
End ;

Procedure TfrmPlayer.FFPlayer_AudioAudioHook(Sender: TObject; const APTS: Int64;
          ASample: PByte; ASize, ASampleRate, AChannels: Integer);
Var L1, L2: Integer ;
Begin
//If NOT FLAG_PLAY_AUDIO Then Begin
//   Exit ;
//End ;
GetLevelS16(ASample, ASize, ASampleRate, AChannels, L1, L2) ;
If NOT Assigned(FLevelThread_2) Then Begin
   FLevelThread_2 := TLevelThread.Create(PB_Left, PB_Right) ;
End ;
FLevelThread_2.Update(L1, L2) ;
End ;

Procedure TfrmPlayer.FFPlayerAudioHook(Sender: TObject; APTS: Int64;
          ASample: PByte; ASize, ASampleRate, AChannels: Integer) ;
Var L1, L2: Integer ;
Begin
//If FLAG_PLAY_AUDIO Then Begin
//   Exit ;
//End ;
GetLevelS16(ASample, ASize, ASampleRate, AChannels, L1, L2) ;
If NOT Assigned(FLevelThread_1) Then Begin
   FLevelThread_1 := TLevelThread.Create(PB_Left, PB_Right) ;
End ;
FLevelThread_1.Update(L1, L2) ;
End ;

procedure TfrmPlayer.FFPlayerPosition2(Sender: TObject; const APTS, ABytes: Int64);
Var LB2 : String ;
begin
// OnPosition event handler
//If FLAG_PLAY_AUDIO Then Begin
//   Exit ;
//End ;
If FIsBytes Then Begin
   lblCurrentPTS.Caption := BytesToStr(ABytes) ;
End Else Begin
   lblCurrentPTS.Caption := DurationToStr(APTS, LB2) ;
   LB_Posicao.Caption := LB2 ;
End ;
If ((APTS >= 0) OR (ABytes >= 0)) AND
   (FDuration > 0) Then Begin
   If FIsBytes Then Begin
      //TrackBar1.SelEnd := TrackBar1.Max * ABytes div FDuration
   End Else Begin
      //TrackBar1.SelEnd := TrackBar1.Max * APTS div FDuration ;
   End ;
   LB_Posicao_Percentual.Caption := '[' + IntToStr ( Slide.Value * 100 DIV Slide.MaxValue ) + '%]' ;
   If NOT FTrackChanging AND (NOT IsMouseDown OR NOT Slide.Focused) Then Begin
      FTrackChanging := True ;
      Try
         If FIsBytes Then Begin
            Slide.Value := Slide.MaxValue * ABytes DIV FDuration ;
         End Else Begin
            Slide.Value := Slide.MaxValue * APTS DIV FDuration ;
         End ;
      Finally
        FTrackChanging := False ;
      End ;
   End;
End ;
End ;

Procedure TfrmPlayer.FFPlayerState(Sender: TObject; AState: TPlayState) ;
Const CPlayState: Array[TPlayState] Of String = ('Play', 'Pause', 'Resume', 'Step', 'Stop', 'End');
Begin
// OnState event handler
// show state
//If FLAG_PLAY_AUDIO Then Begin
//   Exit ;
//End ;
AddMsgLog(CPlayState[AState]) ;
Case AState of
    psPlay, psResume :
      If chkStayOnTop.Checked Then
        Self.FormStyle := fsStayOnTop;
    psPause, psStep:
      Self.FormStyle := fsNormal;
    psStop :
      Begin
        Self.FormStyle := fsNormal;
        // repaint the screen to the original appearance
        If HWND(FFPlayer.ScreenHandle) <> 0 Then Begin
           PostMessage(FFPlayer.ScreenHandle, CM_INVALIDATE, 0, 0) ;
           UpdateWindow(FFPlayer.ScreenHandle) ;
        End ;
      End ;
    psEnd :
      Begin
//        FFPlayer.Stop;
        FFPlayer.Pause ;
        If FIsBytes Then Begin
           FFPlayer.Seek ( 0, [sfByte] ) ;
        End Else Begin
           FFPlayer.Seek ( 0, [sfBackward] ) ;
        End ;
      End ;
  End ;

  // loop example
{
  if AState = psEnd then
    if FIsBytes then Begin
      FFPlayer.Seek ( 0, [sfByte] ) ;
    End Else Begin
      FFPlayer.Seek ( 0, [sfBackward] ) ;
    End ;
}

  // play next example, need a Timer
{
  if AState = psEnd then
  begin
    Timer1.Interval := 20;
    Timer1.Enabled := True;
    // in Timer1.OnTimer
    //Timer1.Enabled := False;
    //FFPlayer.TryOpen('<the next file>', TheScreenHandle);
  end;
}
End ;

Procedure TfrmPlayer.FFLoggerLog ( Sender: TObject; AThreadID: Integer ;
                                   ALogLevel: TLogLevel; Const ALogMsg: String ) ;
Begin
AddMsgLog(ALogMsg, ALogLevel in [llPanic, llFatal, llError]) ;
End ;

End.
