Unit Chyron_U ;

Interface

Uses
  Misc_Def_U, Misc_Const_U, Misc_Type_U,
  Log_U, Misc_U, T_Futebol,
  Vcl.ExtCtrls, Chyron_Basico_U,
  //IniFiles,
  ComObj, MSXML,
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.Win.ScktComp;

Type
  TChyron = class(TForm)
  Private
    { Private declarations }
  Public
    { Public declarations }
  End ;

Var Chyron               : TChyron ;
    TFut                 : TFutebol ;

//Function PROC_GET_DATA : String ;
Function PROC_GET_STAT ( Tipo : String ) : String ;
Function PROC_GET_REPORTER ( Reporter : LongInt ) : String ;
Function PROC_GET_ESCALACAO ( Indice : LongInt ) : String ;

Implementation

Uses Efeitos_U ;

{$R *.dfm}

Function PROC_GET_STAT ( Tipo : String ) : String ;
Var Local : LongInt ;
Begin
Result := '' ;
If Efeitos.SP_Offset.Value > 0 Then
   For Local := 1 To Efeitos.SP_Offset.Value Do
     Result := Result + '\.' ;
If Tipo = 'ESCANTEIOS' Then
   Begin
   Result := Result + '\' + Efeitos.ED_Escanteios_A.Text +
             '\' + Efeitos.ED_Escanteios_B.Text +
             '\' + 'Escanteios' ;
   End
Else If Tipo = 'FALTAS' Then
   Begin
   Result := Result + '\' + Efeitos.ED_Faltas_A.Text +
             '\' + Efeitos.ED_Faltas_B.Text +
             '\' + 'Faltas' ;
   End
Else If Tipo = 'IMPEDIMENTOS' Then
   Begin
   Result := Result + '\' + Efeitos.ED_Impedimentos_A.Text +
             '\' + Efeitos.ED_Impedimentos_B.Text +
             '\' + 'Impedimentos' ;
   End
Else If Tipo = 'ROUBADAS' Then
   Begin
   Result := Result + '\' + Efeitos.ED_Roubadas_A.Text +
             '\' + Efeitos.ED_Roubadas_B.Text +
             '\' + 'Bolas Roubadas' ;
   End
Else If Tipo = 'LEVANTAMENTOS' Then
   Begin
   Result := Result + '\' + Efeitos.ED_Levantamentos_A.Text +
             '\' + Efeitos.ED_Levantamentos_B.Text +
             '\' + 'Levantamentos' ;
   End
Else If Tipo = 'PASSES' Then
   Begin
   Result := Result + '\' + Efeitos.ED_Passes_A.Text +
             '\' + Efeitos.ED_Passes_B.Text +
             '\' + 'Erros de Passe' ;
   End
Else If Tipo = 'CONCLUSOES' Then
   Begin
   Result := Result + '\' + Efeitos.ED_Conclusoes_A.Text +
             '\' + Efeitos.ED_Conclusoes_B.Text +
             '\' + 'Conclusões' ;
   End
Else
   Result := '' ;
End ;

Function PROC_GET_REPORTER ( Reporter : LongInt ) : String ;
Begin
Case Reporter Of
   1 : Result := '\' + Efeitos.ED_A_01.Text +
                 '\' + Efeitos.ED_B_01.Text ;
   2 : Result := '\' + Efeitos.ED_A_02.Text +
                 '\' + Efeitos.ED_B_02.Text ;
   3 : Result := '\' + Efeitos.ED_A_03.Text +
                 '\' + Efeitos.ED_B_03.Text ;
   4 : Result := '\' + Efeitos.ED_A_04.Text +
                 '\' + Efeitos.ED_B_04.Text ;
   5 : Result := '\' + Efeitos.ED_A_05.Text +
                 '\' + Efeitos.ED_B_05.Text ;
   6 : Result := '\' + Efeitos.ED_A_06.Text +
                 '\' + Efeitos.ED_B_06.Text ;
   7 : Result := '\' + Efeitos.ED_A_07.Text +
                 '\' + Efeitos.ED_B_07.Text ;
   8 : Result := '\' + Efeitos.ED_A_08.Text +
                 '\' + Efeitos.ED_B_08.Text ;
   9 : Result := '\' + Efeitos.ED_A_09.Text +
                 '\' + Efeitos.ED_B_09.Text ;
  10 : Result := '\' + Efeitos.ED_A_10.Text +
                 '\' + Efeitos.ED_B_10.Text ;
  Else
       Result := '\' + '' +
                 '\' + '' ;
   End ;
End ;

Function PROC_GET_ESCALACAO ( Indice : LongInt ) : String ;
Var Local : LongInt ;
    Aux   : String ;
Begin
Result := '' ;
If Efeitos.ME_Escalacao.Lines.Count = 0 Then
   Exit ;
For Local := 0 To Efeitos.ME_Escalacao.Lines.Count - 1 Do
   Begin
   Aux := Trim ( Efeitos.ME_Escalacao.Lines[Local] ) ;
   If Aux = '' Then
      Aux := '.' ;
   Result := Result + '\' + Aux ;
   End ;
End ;

(*
Function GET_TEMPLATE_FUTEBOL ( Descricao, Comando : String ) : Boolean ;
Var Local : LongInt ;
    Chave : String ;
    _Char : Char ;
Begin
//Tick_Next_Teste_Link := GetTickCount + 10000 ;
CHYRON_BASICO_REFRESH_TESTE_LINK_LAN ( 60 ) ;
CHYRON_BASICO_REFRESH_TESTE_LINK_WAN ( 60 ) ;
If Descricao <> '' Then
   PUT_LOG ( 'TX ' + Descricao ) ;
If Comando = '' Then
   Begin
   Result := FALSE ;
   Exit ;
   {
   Comando := 'W' +
              PROGET_NEW_TEMPLATE +
              PROC_GET_NEW_TEMPLATE +
              PROC_GET_DATA ;
   }
   End ;
//Comando := 'W\2002\11\Socorro\Lourdes\\' + #13#10 ;
For Local := 0 To 255 Do
   Begin
   Chave := '<' + UpperCase(IntToHex(Local,2)) + '>' ;
   _Char := Chr ( Local ) ;
   Comando := System.SysUtils.StringReplace ( Comando, Chave, _Char, [rfReplaceAll] ) ;
   End ;
//Comando := System.SysUtils.StringReplace ( Comando, '<D5>', #$D5, [rfReplaceAll] ) ;
//Comando := System.SysUtils.StringReplace ( Comando, '<F3>', #$F3, [rfReplaceAll] ) ;
//Comando := System.SysUtils.StringReplace ( Comando, '<CD>', #$CD, [rfReplaceAll] ) ;
//Comando := System.SysUtils.StringReplace ( Comando, '<FE>', #$FE, [rfReplaceAll] ) ;
{$IFDEF FUTEBOL}
For Local := 1 To 10 Do
   Comando := System.SysUtils.StringReplace ( Comando, '<REPORTER_' + StrZero(Local,2) + '>',
                                              PROC_GET_REPORTER(Local), [rfReplaceAll] ) ;
Comando := System.SysUtils.StringReplace ( Comando, '<STAT_ESCANTEIOS>', PROC_GET_STAT('ESCANTEIOS'), [rfReplaceAll] ) ;
Comando := System.SysUtils.StringReplace ( Comando, '<STAT_FALTAS>', PROC_GET_STAT('FALTAS'), [rfReplaceAll] ) ;
Comando := System.SysUtils.StringReplace ( Comando, '<STAT_IMPEDIMENTOS>', PROC_GET_STAT('IMPEDIMENTOS'), [rfReplaceAll] ) ;
Comando := System.SysUtils.StringReplace ( Comando, '<STAT_ROUBADAS>', PROC_GET_STAT('ROUBADAS'), [rfReplaceAll] ) ;
Comando := System.SysUtils.StringReplace ( Comando, '<STAT_LEVANTAMENTOS>', PROC_GET_STAT('LEVANTAMENTOS'), [rfReplaceAll] ) ;
Comando := System.SysUtils.StringReplace ( Comando, '<STAT_PASSES>', PROC_GET_STAT('PASSES'), [rfReplaceAll] ) ;
Comando := System.SysUtils.StringReplace ( Comando, '<STAT_CONCLUSOES>', PROC_GET_STAT('CONCLUSOES'), [rfReplaceAll] ) ;
Comando := System.SysUtils.StringReplace ( Comando, '<ESCALACAO_01>', PROC_GET_ESCALACAO(1), [rfReplaceAll] ) ;
Comando := System.SysUtils.StringReplace ( Comando, '<ESCALACAO_02>', PROC_GET_ESCALACAO(2), [rfReplaceAll] ) ;
//Comando := System.SysUtils.StringReplace ( Comando, '<DATA>', PROC_GET_DATA, [rfReplaceAll] ) ;
{$ELSE}
{$ENDIF}
Comando := System.SysUtils.StringReplace ( Comando, '<TAB>', #9, [rfReplaceAll] ) ;
Comando := System.SysUtils.StringReplace ( Comando, '<TEMPLATE>', CHYRON_BASICO_GET_TEMPLATE, [rfReplaceAll] ) ;
Comando := System.SysUtils.StringReplace ( Comando, '<FRAMEBUFFER>', CHYRON_BASICO_GET_BUFFER_FRAME, [rfReplaceAll] ) ;
Comando := System.SysUtils.StringReplace ( Comando, '<DISPLAYMODE>', CHYRON_BASICO_GET_DISPLAY_MODE, [rfReplaceAll] ) ;
CHYRON_BASICO_PORTA_WRITE_STRING ( Comando + '\\' + #13#10 , 'ENVIAR_COMANDO_TEMPLATE' ) ;
PUT_LOG ( 'TX_CHYRON {' +  IntToStr(Length(Comando)) + '}[' + Comando + ']' ) ;
Result := TRUE ; //AGUARDAR_RETORNO_DE_COMANDO ( 500 ) ;
If NOT Result Then
   PUT_LOG ( 'Falha no retorno durante o envio de comando' ) ;
End ;
*)

End.
