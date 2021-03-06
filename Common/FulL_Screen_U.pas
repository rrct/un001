unit FulL_Screen_U;

interface

uses Misc_Def_U, Misc_Const_U, Misc_Type_U,
     IniFiles, ShellAPI, FolderMon, Math,
     T_Supervisor_Pasta_U,
     Media_U, vlc,
     System.Threading,
     Winapi.Windows, Winapi.Messages,
     System.SysUtils, System.Variants, System.Classes,
     Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls;

type
  TFull_Screen = class(TForm)
    PN_FullScreen: TPanel;
    procedure PN_FullScreenDblClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Full_Screen: TFull_Screen;

implementation

{$R *.dfm}

uses PlayerFrm;

//uses PlayerFrm;

procedure TFull_Screen.FormKeyPress(Sender: TObject; var Key: Char);
begin
If Key = #27 Then Begin
   Key := #0 ;
   frmPlayer.FFPlayer.ScreenHandle := frmPlayer.PN_Video.Handle ;
   Full_Screen.Close ;
End ;
end;

procedure TFull_Screen.FormShow(Sender: TObject);
begin
Full_Screen.WindowState := wsMaximized ;
end;

procedure TFull_Screen.PN_FullScreenDblClick(Sender: TObject);
begin
Full_Screen.Close ;
end;

end.
