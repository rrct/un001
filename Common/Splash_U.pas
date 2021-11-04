Unit Splash_U ;

Interface

Uses Misc_Def_U, Misc_Const_U, Misc_Type_U,
     Selos_U, Misc_U,
     Winapi.Windows, Winapi.Messages,
     System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
     Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.StdCtrls;

Type
  TSplash = class(TForm)
    LB: TListBox;
    StatusBar1: TStatusBar;
    PN_Top: TPanel;
    Image1: TImage;
    Timer_Splash: TTimer;
    Procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Timer_SplashTimer(Sender: TObject);
  Private
    { Private declarations }
  Public
    { Public declarations }
  End ;

Var Splash : TSplash ;

Implementation

{$R *.dfm}

Procedure TSplash.FormCreate ( Sender : TObject ) ;
Begin
AutoSize := TRUE ;
End ;

Procedure TSplash.FormShow(Sender: TObject);
Begin
If NOT FLAG_FORM_SPLASH_OK Then
   Begin
   FLAG_FORM_SPLASH_OK := TRUE ;
   Timer_Splash.Enabled := TRUE ;
   End ;
End ;

Procedure TSplash.Timer_SplashTimer(Sender: TObject) ;
Begin
Timer_Splash.Enabled := FALSE ;
Selos.Show ;
End ;

End.
