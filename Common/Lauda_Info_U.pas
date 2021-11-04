unit Lauda_Info_U;

interface

uses Misc_Const_U, Misc_Def_U, Misc_Type_U,
     Espelho_RD_Def_U,
     Winapi.Windows, Winapi.Messages,
     System.SysUtils, System.Variants, System.Classes,
     Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
     Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TLauda_Info = class(TForm)
    PN_VT: TPanel;
    Label3: TLabel;
    ED_VT: TEdit;
    PN_IM: TPanel;
    PN_ED: TPanel;
    PN_OBS: TPanel;
    PN_ME: TPanel;
    Label5: TLabel;
    ED_OBS: TEdit;
    Label2: TLabel;
    Label4: TLabel;
    ME_TEXTO: TMemo;
    Label1: TLabel;
    ED_1: TEdit;
    ED_2: TEdit;
    ED_3: TEdit;
    ED_4: TEdit;
    SB_IM: TScrollBox;
    IM: TImage;
    Panel1: TPanel;
    Label6: TLabel;
    ED_Geral: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Lauda_Info: TLauda_Info;

implementation

{$R *.dfm}

procedure TLauda_Info.FormCreate(Sender: TObject);
begin
AutoSize := TRUE ;
end;

procedure TLauda_Info.FormShow(Sender: TObject);
begin
Caption := Title_RNews + ' - Lauda Info' ;
end;

end.
