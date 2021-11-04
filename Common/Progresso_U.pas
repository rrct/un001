Unit Progresso_U ;

Interface

Uses
  Misc_Def_U, Misc_Const_U, Misc_Type_U,
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  ClipBrd,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls;

Type
  TProgresso = class(TForm)
    SB: TStatusBar;
    PN_Top: TPanel;
    CK_Rolagem: TCheckBox;
    PB: TProgressBar;
    Bot_Limpar: TButton;
    PC: TPageControl;
    TS_Eventos: TTabSheet;
    TS_Filtro: TTabSheet;
    LB: TListBox;
    LB_Filtro: TListBox;
    PN_Filtro: TPanel;
    Label1: TLabel;
    ED_Filtro: TEdit;
    LB_Resultado: TLabel;
    Procedure FormCreate(Sender: TObject) ;
    Procedure Bot_LimparClick(Sender: TObject);
    Procedure ED_FiltroDblClick(Sender: TObject);
    Procedure ED_FiltroChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PCChange(Sender: TObject);
    procedure LBDblClick(Sender: TObject);
  Private
    { Private declarations }
    Var SL_Progresso   : TStringList ;
  Public
    { Public declarations }
  End ;

Var Progresso      : TProgresso ;
    Tick_Progresso : Cardinal ;

Procedure INIT_PROGRESSO ;
Procedure PUT_PROGRESSO ( Inicializar : Boolean ; Msg, Mascara : String ) ;
Procedure PUT_SB ( Msg : String ) ;

Implementation

Uses Misc_U ;

{$R *.dfm}

Procedure INIT_PROGRESSO ;
Begin
If NOT Progresso.Visible Then
   Begin
   Progresso.Show ;
   Progresso.BringToFront ;
   End ;
Progresso.LB.Items.Clear ;
End ;

Procedure TProgresso.Bot_LimparClick(Sender: TObject) ;
Begin
LB.Items.Clear ;
End ;

Procedure APLICAR_FILTRO ( Aux : String ) ;
Var Local : LongInt ;
    Qtde  : LongInt ;
    Ok    : LongInt ;
Begin
Progresso.LB_Filtro.Items.Clear ;
Aux := UpperCase ( Aux ) ;
If Length ( Aux ) < 3 Then
   Begin
   Progresso.LB_Resultado.Font.Color := clRed ;
   Progresso.LB_Resultado.Caption := 'Expressão muito curta' ;
   Exit ;
   End ;
If Progresso.SL_Progresso.Count = 0 Then
   Begin
   Progresso.LB_Resultado.Font.Color := clBlue ;
   Progresso.LB_Resultado.Caption := 'Nenhum registro encontrado' ;
   Exit ;
   End ;
Qtde := Progresso.SL_Progresso.Count ;
Ok := 0 ;
For Local := 0 To Qtde - 1 Do
   Begin
   If Pos ( Aux , UpperCase ( Progresso.SL_Progresso[Local] ) ) = 0 Then
      Continue ;
   Progresso.LB_Filtro.Items.Add ( Progresso.SL_Progresso[Local] ) ;
   Inc ( Ok ) ;
   If Ok >= 5000 Then
      Break ;
   End ;
If Ok < 5000 Then
   Begin
   Progresso.LB_Resultado.Font.Color := clLime ;
   Progresso.LB_Resultado.Caption := 'Registros: ' + IntToStr ( Progresso.LB_Filtro.Items.Count ) ;
   End
   Else
   Begin
   Progresso.LB_Resultado.Font.Color := clYellow ;
   Progresso.LB_Resultado.Caption := 'Muitos registros: ' + IntToStr ( Progresso.LB_Filtro.Items.Count ) ;
   End ;
End ;

Procedure TProgresso.ED_FiltroChange(Sender: TObject);
Begin
APLICAR_FILTRO ( ED_Filtro.Text ) ;
End ;

Procedure TProgresso.ED_FiltroDblClick(Sender: TObject) ;
Begin
ED_Filtro.Clear ;
End ;

Procedure TProgresso.FormCreate(Sender: TObject);
Begin
Progresso.LB_Resultado.Caption := '-' ;
SL_Progresso := TStringList.Create ;
PC.Align := alClient ;
LB.Align := alClient ;
LB_Filtro.Align := alClient ;
Tick_Progresso := GetTickCount ;
ED_Filtro.Clear ;
PC.ActivePage := TS_Eventos ;
End ;

Procedure TProgresso.FormDestroy(Sender: TObject) ;
Begin
SL_Progresso.Free ;
End ;

Procedure TProgresso.FormShow(Sender: TObject) ;
Begin
PC.ActivePage := TS_Eventos ;
End ;

procedure TProgresso.LBDblClick(Sender: TObject);
begin
ClipBoard.AsText := LB.Items[LB.ItemIndex] ;
end;

Procedure TProgresso.PCChange(Sender: TObject) ;
Begin
APLICAR_FILTRO ( ED_Filtro.Text ) ;
End ;

Procedure PUT_SB ( Msg : String ) ;
Begin
Progresso.SB.SimpleText := Msg ;
Application.ProcessMessages ;
End ;

Procedure PUT_PROGRESSO ( Inicializar : Boolean ; Msg, Mascara : String ) ;
Var Aux   : String ;
Begin
If NOT BOOT_OK Then
   Exit ;
If Inicializar AND NOT Progresso.Visible Then
   Begin
   Progresso.Show ;
   Progresso.BringToFront ;
   Application.ProcessMessages ;
   End ;
If Mascara <> '' Then
   Begin
   Mascara := UpperCase ( Mascara ) ;
   Aux := UpperCase ( Msg ) ;
   If Pos ( Mascara, Msg ) = 0 Then
      Exit ;
   End ;
Tick_Progresso := GetTickCount - Tick_Progresso ;
Aux := TimeToStr(Now) + ' ' + StrZero ( Tick_Progresso, 6 ) + ' ' + Msg ;
Progresso.LB.Items.Add ( Aux ) ;
Progresso.SL_Progresso.Add ( Aux ) ;
If Progresso.SL_Progresso.Count > 10000 Then
  While Progresso.SL_Progresso.Count > 5000 Do
     Progresso.SL_Progresso.Delete(0) ;
Tick_Progresso := GetTickCount ;
If Progresso.LB.Items.Count > 1000 Then
  While Progresso.LB.Items.Count > 500 Do
     Progresso.LB.Items.Delete(0) ;
If Progresso.CK_Rolagem.Checked Then
   Progresso.LB.ItemIndex := Progresso.LB.Items.Count - 1 ;
Application.ProcessMessages ;
End ;

End.
