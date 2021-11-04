unit View_ME_U;

interface

uses Misc_Const_U, Misc_Def_U, Misc_Type_U,
     Winapi.Windows, Winapi.Messages,
     System.SysUtils, System.Variants, System.Classes,
     Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TView_ME = class(TForm)
    ME: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  View_ME: TView_ME;

implementation

{$R *.dfm}

procedure TView_ME.FormCreate(Sender: TObject);
begin
ME.Align := alClient ;
end;

procedure TView_ME.FormShow(Sender: TObject);
begin
Caption := Title_RNews + ' - Visualizar Memo' ;
end;

end.
