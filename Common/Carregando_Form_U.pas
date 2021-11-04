unit Carregando_Form_U;

interface

uses Misc_Const_U, Misc_Def_U, Misc_Type_U,
     Winapi.Windows, Winapi.Messages,
     System.SysUtils, System.Variants, System.Classes,
     Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TCarregando_Form = class(TForm)
    LB_Carregando: TLabel;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Carregando_Form: TCarregando_Form;

implementation

{$R *.dfm}

procedure TCarregando_Form.FormShow(Sender: TObject);
begin
Caption := Title_RNews + ' - Carregando' ;
end;

end.
