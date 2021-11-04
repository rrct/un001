unit Chyron_Painel_U;

interface

uses
  Misc_Const_U, Misc_Def_U, Misc_Type_U,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Menus, System.ImageList, Vcl.ImgList, Vcl.ExtDlgs;

type
  TChyron_Painel = class(TForm)
    PC: TPageControl;
    TS_Painel: TTabSheet;
    TS_Log: TTabSheet;
    LB_Scenes: TListBox;
    LB: TListBox;
    ME: TMemo;
    PN_Filtro: TPanel;
    Label1: TLabel;
    ED_Filtro: TEdit;
    Bot_Atualizar: TButton;
    CK_Rolagem: TCheckBox;
    LB_Filtro: TListBox;
    ImageList1: TImageList;
    MainMenu1: TMainMenu;
    Arquivo1: TMenuItem;
    Salvar1: TMenuItem;
    N1: TMenuItem;
    Fechar1: TMenuItem;
    Limpar1: TMenuItem;
    SaveTextFileDialog1: TSaveTextFileDialog;
    procedure FormCreate(Sender: TObject);
    procedure LBClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ED_FiltroChange(Sender: TObject);
    procedure Bot_AtualizarClick(Sender: TObject);
    procedure LB_FiltroClick(Sender: TObject);
    procedure Salvar1Click(Sender: TObject);
    procedure Fechar1Click(Sender: TObject);
    procedure Limpar1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Chyron_Painel: TChyron_Painel;

implementation

Uses Misc_U ;

{$R *.dfm}

Procedure EXECUTAR_FILTRO_LOG_CHYRON ;
Var Qtde  : LongInt ;
    Local : LongInt ;
    Aux   ,
    Key   : String ;
Begin
Chyron_Painel.LB_Filtro.Items.Clear ;
Qtde := Chyron_Painel.LB.Items.Count ;
If Qtde = 0 Then
   Exit ;
Key := UpperCase ( STRING_ASCII_PADRAO ( Chyron_Painel.ED_Filtro.Text ) ) ;
For Local := 0 To Qtde - 1 Do
   Begin
   Aux := UpperCase ( STRING_ASCII_PADRAO ( Chyron_Painel.LB.Items[Local] ) ) ;
   If Pos ( Key, Aux) > 0 Then
      Chyron_Painel.LB_Filtro.Items.Add ( Chyron_Painel.LB.Items[Local] ) ;
   End ;
End ;

procedure TChyron_Painel.Bot_AtualizarClick(Sender: TObject);
begin
EXECUTAR_FILTRO_LOG_CHYRON ;
end;

procedure TChyron_Painel.ED_FiltroChange(Sender: TObject);
begin
EXECUTAR_FILTRO_LOG_CHYRON ;
end;

procedure TChyron_Painel.Fechar1Click(Sender: TObject);
begin
Chyron_Painel.Close ;
end;

procedure TChyron_Painel.FormCreate(Sender: TObject);
begin
PC.Align := alClient ;
LB.Align := alClient ;
ME.Lines.Clear ;
end;

procedure TChyron_Painel.FormShow(Sender: TObject);
begin
If NOT Assigned ( Misc_LB_Log_Chyron ) Then
   Misc_LB_Log_Chyron := LB ;
//If NOT Assigned ( Misc_LB_Log_Chyron_Erros ) Then
//   Misc_LB_Log_Chyron_Erros := LB_Log_Er ;
If NOT Assigned ( Misc_CK_Rolagem_Chyron_Log ) Then
   Misc_CK_Rolagem_Chyron_Log := CK_Rolagem ;
end;

procedure TChyron_Painel.LBClick(Sender: TObject);
begin
If LB.ItemIndex >= 0 Then
   ME.Text := LB.Items[LB.ItemIndex] ;
end;

procedure TChyron_Painel.LB_FiltroClick(Sender: TObject);
begin
If LB_Filtro.ItemIndex >= 0 Then
   ME.Text := LB_Filtro.Items[LB_Filtro.ItemIndex] ;
end;

procedure TChyron_Painel.Limpar1Click(Sender: TObject);
begin
LB.Items.Clear ;
ME.Lines.Clear ;
ED_Filtro.Clear ;
end;

Procedure SALVAR_LOG_CHYRON ( Dialogo : Boolean ) ;
Var FN : String ;
Begin
If Dialogo Then
   Begin
   If Chyron_Painel.SaveTextFileDialog1.InitialDir = '' Then
      Chyron_Painel.SaveTextFileDialog1.InitialDir := Diretorio + 'Config\Logs_Chyron\' ;
   CHECAR_DIRETORIO_DIRNAME ( Chyron_Painel.SaveTextFileDialog1.InitialDir ) ;
   If NOT Chyron_Painel.SaveTextFileDialog1.Execute Then
      Exit ;
   FN := Chyron_Painel.SaveTextFileDialog1.FileName ;
   End
   Else
   Begin
   FN := Diretorio + 'Config\Logs_Chyron\' + DATAHORA_INVERSA(Now) + '.Log' ;
   End ;
Try
   CHECAR_DIRETORIO_FILENAME ( FN ) ;
   Chyron_Painel.LB.Items.SaveToFile ( FN ) ;
   Except
   End ;
End ;

procedure TChyron_Painel.Salvar1Click(Sender: TObject);
begin
SALVAR_LOG_CHYRON ( TRUE ) ;
end;

end.
