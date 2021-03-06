Unit Carregando_Sistema_U;

Interface

Uses
  Misc_Const_U, Misc_Def_U, Misc_Type_U,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, Buttons, Gauges, jpeg,
  Vcl.Imaging.pngimage;

Type
  TCarregando_Sistema = class(TForm)
    PN_Top2: TPanel;
    Label7: TLabel;
    LB_Carga_2: TLabel;
    StatusBar: TStatusBar;
    LB: TListBox;
    Relogio_Carga: TTimer;
    GA: TGauge;
    IM_Logo: TImage;
    Bot_Configuracao: TBitBtn;
    Bot_Cancelar2: TBitBtn;
    Image1: TImage;
    LB_Versao: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Relogio_CargaTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Bot_Cancelar2Click(Sender: TObject);
    procedure Bot_ConfiguracaoClick(Sender: TObject);
    procedure LBDblClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

Var
  Carregando_Sistema: TCarregando_Sistema;

//Function  ABERTURA_OU_AGUARDE ( _Msg : String ) : Boolean ;
Procedure CRIAR_CARREGANDO_SISTEMA ;
Procedure ATUALIZAR_CARREGANDO ( Msg : String ) ;
Procedure SALVAR_CARREGANDO_SISTEMA ( Origem : String ) ;

Implementation

Uses Main ,
     Misc_U ;

{$R *.dfm}

(*
Function ABERTURA_OU_AGUARDE ( _Msg : String ) : Boolean ;
Begin
If BOOT_OK Then
   Result := AGUARDE_SIMPLES ( _Msg )
   Else
   Result := ATUALIZAR_CARREGANDO ( _Msg ) ;
End ;
*)

Procedure ATUALIZAR_CARREGANDO ( Msg : String ) ;
Begin
If SAIDA_FORCADA Then Begin
   Exit ;
End ;
PUT_CARREGANDO_SISTEMA ( Msg ) ;
End ;

Procedure SALVAR_CARREGANDO_SISTEMA ( Origem : String ) ;
Var _FileName : String ;
    Conteudo  : String ;
Begin
//_Debug ( 'INI Salvar_Carregando_Sistema "' + Origem + '"' ) ;
_FileName := Diretorio + 'Logs\Carga\' + Data_Inversa ( Sys_DT_Carregando ) + '\' +
             DataHora_Inversa ( Sys_DT_Carregando ) + '.dat' ;
//_Debug ( '1 Salvar_Carregando_Sistema "' + _FileName + '"' ) ;
Conteudo := SL_Carregando_Sistema.Text ;
//RRCT SL
//RRCT _Carregando_Sistema.Clear ;
//_Debug ( '2 Salvar_Carregando_Sistema "' + _FileName + '"' ) ;
Sys_Carregando_Sistema := Conteudo ;
APPEND_TEXTO ( 'SALVAR_CARREGANDO_SISTEMA/' + Origem,
               _FileName , Conteudo ) ;
//_Debug ( 'FIM Salvar_Carregando_Sistema "' + _FileName + '"' ) ;
End ;

Procedure CRIAR_CARREGANDO_SISTEMA ;
Begin
Carregando_Sistema := TCarregando_Sistema.Create ( Application ) ;
Carregando_Sistema.Show ;
Carregando_Sistema.Top := Screen.Height - Carregando_Sistema.Height - 40  ;
Carregando_Sistema.Left := Screen.Width - Carregando_Sistema.Width ;
Carregando_Sistema.Update ;
End ;

Procedure TCarregando_Sistema.FormCreate(Sender: TObject) ;
Begin
//PN_Top.Color := DEF_COR_PN_TOP ;
LB_Versao.Caption := 'Vers?o ' + GetBuildInfoStr ;
LB.Align := alClient ;
//AutoSize := TRUE ;
End ;

procedure TCarregando_Sistema.FormKeyPress(Sender: TObject; var Key: Char);
Begin
If BOOT_OK Then Begin
   Close ;
End ;
End ;

Procedure TCarregando_Sistema.Relogio_CargaTimer(Sender: TObject) ;
Begin
//LB_Data.Caption := DateToStr ( Now ) ;
//LB_Hora.Caption := TimeToStr ( Now ) ;
End ;

Procedure TCarregando_Sistema.FormShow(Sender: TObject) ;
//Var DT : TDateTime ;
Begin
//ShowMessage ( Diretorio ) ;
{$IF Defined(PROJETO_ESQUINAS)}
Bot_Configuracao.Visible := TRUE ;
{$IFEND}
{$IF Defined(PROJETO_GPRS)}
Bot_Configuracao.Visible := FALSE ;
{$IFEND}
Relogio_Carga.Enabled := TRUE ;
{
RR_FILE_AGE ( Application.ExeName, DT ) ;
LB_Carga.Caption := 'Carga do Sistema - ' +
                    DateTimeToStr ( DT ) +
                    ' (' + ExtractFileName ( Application.ExeName ) + ')' ;
}
If NOT BOOT_OK Then
   Begin
   //Bot_Cancelar.Visible := TRUE ;
   //Bot_Cancelar.Enabled := TRUE ;
   End ;
End ;

procedure TCarregando_Sistema.LBDblClick(Sender: TObject);
Begin
If LB.ItemIndex > -1 Then Begin
   PUT_CLIPBOARD ( Carregando_Sistema, LB.Items[LB.ItemIndex] ) ;
   ShowMessage ( COLAR_TEXTO ( Carregando_Sistema ) ) ;
End ;
End ;

Procedure TCarregando_Sistema.FormClose(Sender: TObject; var Action: TCloseAction) ;
Begin
Relogio_Carga.Enabled := FALSE ;
End ;

Procedure TCarregando_Sistema.Bot_Cancelar2Click(Sender: TObject) ;
Begin
FLAG_CANCELAR_PROCESSO := TRUE ;
End ;

Procedure TCarregando_Sistema.Bot_ConfiguracaoClick(Sender: TObject) ;
Begin
{$IF Defined(PROJETO_ESQUINAS)}
MAIN_CONFIGURACAO_SQL ;
{$IFEND}
End ;

End.

