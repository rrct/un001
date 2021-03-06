Program UN001;

uses
  Forms,
  ServerModule in 'ServerModule.pas' {UniServerModule: TUniGUIServerModule},
  MainModule in 'MainModule.pas' {UniMainModule: TUniGUIMainModule},
  Main in 'Main.pas' {MainForm: TUniForm},
  Login in '..\Common\Login.pas' {FRMLOGIN: TUniLoginForm},
  LoginM in '..\Common\LoginM.pas' {UnimLoginForm2: TUnimLoginForm},
  Mainm in 'Mainm.pas' {MainmForm: TUnimForm},
  Misc_Const_U in '..\Common\Misc_Const_U.pas',
  Misc_Def_U in '..\Common\Misc_Def_U.pas',
  Misc_Type_U in '..\Common\Misc_Type_U.pas',
  Transparentes_U in '..\Common\Transparentes_U.pas',
  T_Supervisor_Pasta_U in '..\Common\T_Supervisor_Pasta_U.pas',
  T_Supervisor_U in '..\Common\T_Supervisor_U.pas',
  FolderMon in '..\Common\FolderMon.pas',
  Log_U in '..\Common\Log_U.pas',
  MyRichEdit_U in '..\Common\MyRichEdit_U.pas',
  T_TImagem in '..\Common\T_TImagem.pas',
  T_TLabel in '..\Common\T_TLabel.pas',
  T_TPanel in '..\Common\T_TPanel.pas',
  Misc_R in '..\Common\Misc_R.pas';

{$R *.res}

Begin
ReportMemoryLeaksOnShutdown := FALSE ;
Application.Initialize;
TUniServerModule.Create(Application);
Application.Run;
End.

