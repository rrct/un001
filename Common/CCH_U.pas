Unit CCH_U ;

Interface

Uses Misc_Def_U, Misc_Const_U, Misc_Type_U,
     Misc_1,
     Misc_U,
     Log_U, View_ME_U,
     XMLDoc,
     ActiveX, MSHTML,
     Vcl.Grids,
     Vcl.StdCtrls,
     System.Threading,
     System.SysUtils,
     XMLIntf,
     Transparentes_U,
     Vcl.Buttons,
     SHDocVw ,
     //RxCtrls,
     MyRichEdit_U,
     Math, IniFiles, ClipBrd,
     Winapi.Windows, pngImage,
     System.Classes,
     Winapi.Messages,
     System.Variants,
     Vcl.Controls,
     Vcl.ComCtrls, Vcl.Samples.Spin, Vcl.Forms, Vcl.Menus,
     Vcl.Dialogs, Vcl.Graphics, Vcl.ExtCtrls, Vcl.Mask ;

Const IDX_LB_HEADER      = 0 ;
      IDX_LB_PARAM_1     = 1 ;
      IDX_LB_PARAM_2     = 2 ;
      IDX_LB_PARAM_3     = 3 ;
      IDX_LB_PARAM_4     = 4 ;
      IDX_LB_OBS         = 5 ;

Type T_CCH_CELULA       = Record
         _Retranca      : String ;
         _GC2           : String ;
         _Caminho       : String ;
         PN_Base_CCH    : TPanel ;
         PN_Memo        : TPanel ;
         PN_Item2       : TPanel ;
         CB_Tags        : TComboBox ;
         CK_Livre       : TCheckBox ;
         PN_Top2        : TPanel ;
         PN_Rodape      : TPanel ;
         PN_Right       : TPanel ;
         //PN_Is_Fixa     : TPanel ;
         ME_CCH         : TMemo ;
         TXT_CCH_Enter  : String ;
         TXT_CCH_Exit   : String ;
         ME_Preview     : TMemo ;
         IM_SELO_CCH    : TImage ;
         Bot_Edit       : TButton ;
         Bot_Subir      : TButton ;
         Bot_Descer     : TButton ;
         Bot_Play       : TButton ;
         Bot_Hist_Dic   : TButton ;
         Bot_Automatico : TButton ;
         Bot_Insert     : TButton ;
         Bot_Duplicar   : TButton ;
         Bot_Delete     : TButton ;
         Bot_Stop       : TButton ;
         Bot_Fixa       : TButton ;
         Bot_AddStr     : TButton ;
         LB_Top         : TLabel ;
         LB_Bottom      : TLabel ;
         Hist_Dic       : String ;
         _Msg           : LongInt ;
         Comando        : String ;
         End ;

Type
   TCCH = class(Vcl.StdCtrls.TLabel)
   Private
   Public
     CCH_Celulas           : Array Of T_CCH_CELULA ;
     CCH_VAR_SB            : TScrollBox ;
     CCH_VAR_REG_TX_CHYRON : T_Registro_TX_Chyron ;
     Task_Load_Image       : iTask ;
     Reg_Load_Image        : Array Of T_Load_Image ;
     //Function CCH_GET_MSG_POR_CMD ( Reg : T_Registro_TX_Chyron ) : LongInt ;
     Function CCH_CALC_HEIGHT_PN ( Indice : LongInt ) : LongInt ;
     Procedure VALIDAR_COR_SELECAO_MEMO ( Sender : TObject ) ;
     Function CCH_CARREGAR_REGISTRO_TX_CHYRON ( Origem : String ;
                                                Var Reg_Chyron : T_Registro_TX_Chyron ;
                                                Indice : LongInt ;
                                                Executar_Preview : Boolean ;
                                                Preview_Img : Boolean ) : T_GC ;
     Procedure CCH_LB_OnDblClick ( Sender : TObject ) ;
     Procedure PROC_EXECUTAR_GC ( _Tag : LongInt ) ;
     Procedure CCH_PN_Item_OnDblClick ( Sender : TObject ) ;
     Procedure CCH_PNLB_OnClick ( Sender : TObject ) ;
     Procedure CCH_LIMPAR_CONTROLE ( Inicio, Fim : LongInt ) ;
//     Procedure LIMPAR_REGISTRO_TX_CHYRON ( Var Reg : T_Registro_TX_Chyron ) ;
     Procedure PROC_LOAD_IMAGES ;
     Procedure CCH_PROC_PUT_CELULA_CHYRON ( Modo : LongInt ;
                                            Registro : T_Clip_Retranca ;
                                            Indice : LongInt ; Cmd : String ;
                                            Params : TStringList ; Obs : String ;
                                            Livre : Boolean ) ;
     Procedure CCH_PROC_CONVERTER_GC2_PARA_CONTROLE_CHYRON ( Modo : LongInt ; //1-CCH 2-Comparativo
                                                             Registro : T_Clip_Retranca ) ;
     //Procedure CCH_PARAMETRIZAR_REG_POR_MSG ( Var Reg : T_Registro_TX_Chyron ) ;
     Procedure ME_ONCHANGE ( Sender : TObject ) ;
     Function CCH_GET_COR_ELEMENTO ( Msg : LongInt ) : T_Color2 ;
     Procedure CCH_BOT_PLAY ( Sender : TObject ) ;
     Procedure CCH_BOT_ADDSTR ( Sender : TObject ) ;
     Procedure CCH_BOT_STOP ( Sender : TObject ) ;
     Procedure Bot_Hist_Dic_Click ( Sender : TObject ) ;
     Procedure Bot_Automatico_Click ( Sender : TObject ) ;
     Procedure INSERT_REGISTRO_CCH ( _Tag : LongInt ) ;
     Procedure CCH_Bot_Insert ( Sender : TObject ) ;
     Procedure CCH_Bot_Duplicar ( Sender : TObject ) ;
     Procedure INICIALIZAR_TARJA_CCH ( _Tag : LongInt ; Cmd : String ; _Msg : LongInt ) ;
     Procedure CCH_Bot_Delete ( Sender : TObject ) ;
     Procedure INTERCAMBIAR_CCH ( T1, T2 : LongInt ) ;
     Procedure COPIAR_CCH ( Origem, Destino : LongInt ) ;
     Procedure CCH_BOT_FIXA ( Sender : TObject ) ;
     Procedure ME_ONENTER ( Sender: TObject ) ;
     Procedure ME_ONENTER_NEXT ( Sender: TObject ) ;
     Procedure SALVAR_CONTEUDO_CCH ( Origem : String ; _Tempo : LongInt ) ;
     Procedure FINALIZAR_EDICAO_CCH ( _Tag : LongInt ; Forcado : Boolean ) ;
     Procedure ME_ONEXIT ( Sender: TObject ) ;
     Procedure Bot_Subir_Click ( Sender : TObject ) ;
     Procedure Bot_Descer_Click ( Sender : TObject ) ;
     Function CCH_GERAR_TEXTO_CONSOLIDADO : String ;
     Procedure CCH_BOT_EDIT_CLICK ( Sender: TObject ) ;
     Function PROC_PREPARAR_GC_PARA_EXECUCAO ( Origem : String ; _Tag : LongInt ; Var Reg : T_GC ;
                                               Preview_IMG : Boolean ) : T_Registro_TX_Chyron ;
     Procedure ME_OnKeyPress (Sender: TObject; var Key: Char);
     Procedure SELECIONAR_MEMO ( Origem : String ; Sender : TObject ) ;
     procedure ME_OnKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
     procedure Bot_Insert_DragOver ( Sender, Source: TObject; X, Y: Integer;
                                     State: TDragState; var Accept: Boolean) ;
     procedure Bot_Insert_DragDrop ( Sender, Source : TObject ; X, Y: Integer ) ;
     Procedure GERAL_ONDRAGOVER ( Sender, Source: TObject; X, Y: Integer;
                                State: TDragState; var Accept: Boolean) ;
     Procedure GERAL_ONMOUSEDOWN ( Sender: TObject; Button: TMouseButton;
                                   Shift: TShiftState; X, Y: Integer);
     Procedure AJUSTAR_PN_BASE_CCH ( _Tag : LongInt ) ;
     Procedure DEFINE_LB_CMD ( Var LB: TLabel; Cmd : String ; _Msg : LongInt ) ;
     Procedure GERAL_ONDRAGDROP ( Sender, Source : TObject ; X, Y: Integer ) ;
     Procedure DBL_CLICK_IM_SELO ( Sender : TObject ) ;
     procedure LB_Top_OnClick(Sender: TObject);
     procedure ME_OnMouseMove ( Sender: TObject; Shift: TShiftState; X, Y: Integer);
     procedure CK_Livre_On_Click ( Sender: TObject ) ;
     procedure ME_OnMouseDown ( Sender: TObject; Button: TMouseButton;
                                Shift: TShiftState; X, Y: Integer);
     Constructor Create ( Indice : LongInt ; Dono : TComponent ;
                          Servidor : String ; SB : TScrollBox ) ;
   End ;

Const MEMO_LINE_HEIGHT = 22 ;

Var    Next_Preview_IMG : Boolean = TRUE ;

Implementation

Uses Main,
     View_Perfis_GC_U,
     Tipos_GC_U,
     {$IFDEF USAR_CHYRON}
     Config_GC_U,
     {$ENDIF}
     Chyron_Basico_U,
     {$IFDEF NW}
     Preview_Selo_U,
     {$ENDIF}
     GC_U ;

Procedure TCCH.ME_ONCHANGE ( Sender : TObject ) ;
Var ME   : TMemo ;
//    _Tag : LongInt ;
Begin
_Debug ( 'INI CCH ME_ONCHANGE' ) ;
If NOT (Sender IS TMemo) Then Begin
   _Debug ( 'Exit CCH ME_ONCHANGE' ) ;
   Exit ;
End ;
ME := Sender AS TMemo ;
If ME <> MainForm.ActiveControl Then Begin
   Exit ;
End ;
//_Tag := ME.Tag ;
//ME.Height := MAX ( MEMO_LINE_HEIGHT * 2,
//                   ( ME.Lines.Count + 1 ) * MEMO_LINE_HEIGHT ) ;
//While ME_GetFirstVisibleLine ( ME ) > 0 Do Begin
//   ME.Height := ME.Height + MEMO_LINE_HEIGHT ;
//End ;
//CCH_Celulas[_Tag].PN_Base.Height := CCH_CALC_HEIGHT_PN ( _Tag ) ;
//PUT_LOG ( 'ME_ONCHANGE Count[' + IntToStr ( ME.Lines.Count ) + '] ' +
//          'Top[' + IntToStr ( ME_GetFirstVisibleLine ( ME ) ) + ']' ) ;
_Debug ( 'FIM CCH ME_ONCHANGE' ) ;
End ;

Procedure TCCH.CCH_BOT_PLAY ( Sender : TObject ) ;
Begin
//
End ;

Procedure SALVAR_ADD_STR ( Str : String ) ;
{$IFDEF USAR_CHYRON}
Var Indice : LongInt ;
    Dir    : String ;
    FN     : String ;
{$ENDIF}
Begin
{$IFDEF USAR_CHYRON}
Dir := Diretorio + 'Config\' +
       RD.RD_VAR_ESPELHO_ATUAL.Jornal + '\' +
       RD.RD_GET_DATA_CURTA + '\' ;
CHECAR_DIRETORIO_DIRNAME ( Dir ) ;
Indice := 0 ;
Repeat
   Inc ( Indice ) ;
   FN := Dir + StrZero(Indice,4) + '.DAT' ;
Until NOT RR_FileExists ( 'CCH_BOT_ADDSTR', FN ) ;
WRITE_FILE_CORE ( 'CCH_BOT_ADDSTR', FN, Str, DELAYED_TRUE ) ;
{$ENDIF}
End ;

Procedure TCCH.CCH_BOT_ADDSTR ( Sender : TObject ) ;
{$IFDEF USAR_CHYRON}
Var _Tag   : LongInt ;
    Str    : String ;
{$ENDIF}
Begin
{$IFDEF USAR_CHYRON}
_Debug ( 'INI CCH BOT ADDSTR' ) ;
_Tag := (Sender AS TButton).Tag ;
//ShowMessage ( 'AddStr' ) ;
Str := Trim ( Super_UpperCase ( CCH_Celulas[_Tag].ME_Preview.Text ) ) ;
RD.RD_VAR_SL_STR_ADD.Add ( Str ) ;
_Debug ( 'ADD_STR [' + Str + ']' ) ;
SALVAR_ADD_STR ( Str ) ;
RD.RD_MESMA_RETRANCA ;
_Debug ( 'FIM CCH BOT ADDSTR' ) ;
{$ENDIF}
End ;

Procedure TCCH.CCH_BOT_STOP ( Sender : TObject ) ;
Var _Tag       : LongInt ;
    Reg_Chyron : T_Registro_TX_Chyron ;
    Reg        : T_GC ;
Begin
_Debug ( 'INI CCH LB_OnDblClick' ) ;
If Sender Is TLabel Then Begin
   _Tag := (Sender AS TLabel).Tag MOD 1000 ;
   PUT_LOG ( 'INI/Label CCH LB_OnDblClick _Tag[' + IntToStr(_Tag) + ']' ) ;
End Else If Sender Is TButton Then Begin
   _Tag := (Sender AS TButton).Tag MOD 1000 ;
   PUT_LOG ( 'INI/Button CCH LB_OnDblClick _Tag[' + IntToStr(_Tag) + ']' ) ;
End Else If Sender Is TPanel Then Begin
   _Tag := (Sender AS TPanel).Tag MOD 1000 ;
   PUT_LOG ( 'INI/Panel CCH LB_OnDblClick _Tag[' + IntToStr(_Tag) + ']' ) ;
End Else Begin
   _Debug ( 'Exit CCH LB_OnDblClick' ) ;
   PUT_LOG ( 'Exit/1 CCH LB_OnDblClick' ) ;
   Exit ;
End ;
LIMPAR_REGISTRO_TX_CHYRON ( Reg_Chyron ) ;
Reg := CCH_CARREGAR_REGISTRO_TX_CHYRON ( 'TCCH CCH_LB_OnDblClick' ,
                                         Reg_Chyron, _Tag, PREVIEW_FALSE, FALSE ) ;
If NOT IS_MSG_SELO ( Reg.Msg, Reg.Tag ) Then Begin
   EXEC_DIRETO_APAGAR_VOLATEIS ;
End Else Begin
   EXEC_DIRETO_SELO_NEUTRO ( 1 ) ;
End ;
_Debug ( 'FIM CCH LB_OnDblClick' ) ;
End ;

Procedure TCCH.CCH_Bot_Delete ( Sender : TObject ) ;
Var Local : LongInt ;
    _Tag  : LongInt ;
Begin
_Debug ( 'INI CCH_Bot Delete' ) ;
_Tag := (Sender AS TButton).Tag ;
If ( _Tag < 0 ) OR ( _Tag >= DEF_CCH_MAX ) Then Begin
   _Debug ( 'Exit CCH_Bot Delete' ) ;
   Exit ;
End ;
For Local := _Tag To DEF_CCH_MAX - 1 - 1 Do Begin
   COPIAR_CCH ( Local + 1, Local ) ;
End ;
INICIALIZAR_TARJA_CCH ( DEF_CCH_MAX-1, '', 0 ) ;
SALVAR_CONTEUDO_CCH ( 'CCH_Bot Delete', 0 ) ;
//RD.RD_MESMA_RETRANCA ;
_Debug ( 'FIM CCH_Bot Delete' ) ;
End ;

Procedure TCCH.INTERCAMBIAR_CCH ( T1, T2 : LongInt ) ;
Begin
COPIAR_CCH ( T1, DEF_CCH_MAX ) ;
COPIAR_CCH ( T2, T1 ) ;
COPIAR_CCH ( DEF_CCH_MAX, T2 ) ;
End ;

Procedure TCCH.COPIAR_CCH ( Origem, Destino : LongInt ) ;
Begin
_Debug ( 'INI TCCH COPIAR CCH' ) ;
CCH_Celulas[Destino]._Retranca := CCH_Celulas[Origem]._Retranca ;
_Debug ( '2 TCCH COPIAR CCH' ) ;
CHANGE_MEMO_SE_DIFF ( CCH_Celulas[Destino].ME_CCH, CCH_Celulas[Origem].ME_CCH.Text ) ;
_Debug ( '3 TCCH COPIAR CCH' ) ;
CCH_Celulas[Destino].Comando := CCH_Celulas[Origem].Comando ;
_Debug ( '3a TCCH COPIAR CCH' ) ;
CCH_Celulas[Destino]._Msg := CCH_Celulas[Origem]._Msg ;
_Debug ( '3b TCCH COPIAR CCH' ) ;
CCH_Celulas[Destino].ME_Preview.Text := CCH_Celulas[Origem].ME_Preview.Text ;
_Debug ( '3c TCCH COPIAR CCH' ) ;
CCH_Celulas[Destino].ME_Preview.Visible := CCH_Celulas[Origem].ME_Preview.Visible ;
_Debug ( '4 TCCH COPIAR CCH' ) ;
CCH_Celulas[Destino].LB_Top.Caption := CCH_Celulas[Origem].LB_Top.Caption ;
_Debug ( '5 TCCH COPIAR CCH' ) ;
CCH_Celulas[Destino]._Caminho := CCH_Celulas[Origem]._Caminho ;
_Debug ( '6 TCCH COPIAR CCH' ) ;
CCH_Celulas[Destino]._GC2 := CCH_Celulas[Origem]._GC2 ;
CCH_Celulas[Destino].CK_Livre.Checked := CCH_Celulas[Origem].CK_Livre.Checked ;
_Debug ( '7 TCCH COPIAR CCH' ) ;
//CCH_Celulas[Destino].PN_Is_Fixa.Caption := CCH_Celulas[Origem].PN_Is_Fixa.Caption ;
//CCH_Celulas[Destino].PN_Is_Fixa.Color := CCH_Celulas[Origem].PN_Is_Fixa.Color ;
_Debug ( '7a TCCH COPIAR CCH' ) ;
//CCH_Celulas[Destino].PN_Is_Fixa.Font.Color := CCH_Celulas[Origem].PN_Is_Fixa.Font.Color ;
_Debug ( '8 TCCH COPIAR CCH' ) ;
CCH_Celulas[Destino].PN_Right.Visible := CCH_Celulas[Origem].PN_Right.Visible ;
_Debug ( '9 TCCH COPIAR CCH' ) ;
CCH_Celulas[Destino].PN_Right.Width := CCH_Celulas[Origem].PN_Right.Width ;
_Debug ( '10 TCCH COPIAR CCH' ) ;
CCH_Celulas[Destino].PN_Base_CCH.Height := CCH_Celulas[Origem].PN_Base_CCH.Height ;
_Debug ( '11 TCCH COPIAR CCH' ) ;
If Assigned ( CCH_Celulas[Origem].IM_SELO_CCH.Picture.Bitmap ) Then Begin
   _Debug ( '12 TCCH COPIAR CCH' ) ;
   CCH_Celulas[Destino].IM_SELO_CCH.Picture.Bitmap.Assign ( CCH_Celulas[Origem].IM_SELO_CCH.Picture.Bitmap ) ;
   _Debug ( '13 TCCH COPIAR CCH' ) ;
   CCH_Celulas[Destino].PN_Right.Visible := CCH_Celulas[Origem].PN_Right.Visible ;
   _Debug ( '14 TCCH COPIAR CCH' ) ;
   CCH_Celulas[Destino].IM_SELO_CCH.Hint := CCH_Celulas[Origem].IM_SELO_CCH.Hint ;
   _Debug ( '15 TCCH COPIAR CCH' ) ;
End Else Begin
   _Debug ( '16 TCCH COPIAR CCH' ) ;
   CCH_Celulas[Destino].PN_Right.Visible := FALSE ;
   _Debug ( '17 TCCH COPIAR CCH' ) ;
   CCH_Celulas[Destino].IM_SELO_CCH.Hint := '' ;
End ;
DEFINE_LB_CMD ( CCH_Celulas[Destino].LB_Top,
                CCH_Celulas[Destino].Comando, CCH_Celulas[Destino]._Msg ) ;
_Debug ( 'FIM TCCH COPIAR CCH' ) ;
End ;

Procedure TCCH.INICIALIZAR_TARJA_CCH ( _Tag : LongInt ; Cmd : String ; _Msg : LongInt ) ;
Begin
{$IFDEF USAR_CHYRON}
CCH_Celulas[_Tag]._Retranca := RD.RD_VAR_ESPELHO_ATUAL.Selecionada.Retranca ;
//CHANGE_MEMO_SE_DIFF ( Reg.ME_CCH, '' ) ;
CCH_Celulas[_Tag].Comando := Cmd ;
CCH_Celulas[_Tag]._Msg := _Msg ;
CCH_Celulas[_Tag].ME_CCH.Lines.Clear ;
CCH_Celulas[_Tag].ME_Preview.Lines.Clear ;
CCH_Celulas[_Tag].LB_Top.Caption := '-' ;
CCH_Celulas[_Tag].CK_Livre.Checked := FALSE;
//CCH_Celulas[_Tag].PN_Is_Fixa.Color := clSilver ;
//CCH_Celulas[_Tag].PN_Is_Fixa.Caption := '' ;
CCH_Celulas[_Tag].PN_Right.Visible := FALSE ;
CCH_Celulas[_Tag].IM_SELO_CCH.Hint := '' ;
DEFINE_LB_CMD ( CCH_Celulas[_Tag].LB_Top, CCH_Celulas[_Tag].Comando, CCH_Celulas[_Tag]._Msg ) ;
{$ENDIF}
End ;

Procedure TCCH.Bot_Hist_Dic_Click ( Sender : TObject ) ;
Var _Tag  : LongInt ;
Begin
_Tag := (Sender AS TButton).Tag ;
If ( _Tag < 0 ) OR ( _Tag >= DEF_CCH_MAX ) Then Begin
   _Debug ( 'Exit CCH_Bot Insert' ) ;
   Exit ;
End ;
If Trim ( CCH_Celulas[_Tag].Hist_Dic ) = '' Then Begin
   ShowMessage ( 'Nenhuma entrada do dicion?rio foi utilizada' ) ;
End Else Begin
   ShowMessage ( 'Aplica??o do dicion?rio:' + sLineBreak +
                 sLineBreak +
                 CCH_Celulas[_Tag].Hist_Dic ) ;
End ;
End ;

Procedure TCCH.Bot_Automatico_Click ( Sender : TObject ) ;
{$IFDEF USAR_CHYRON}
Var _Tag    : LongInt ;
    Aux     : String ;
    HistDic : String ;
{$ENDIF}
Begin
{$IFDEF USAR_CHYRON}
_Tag := (Sender AS TButton).Tag ;
If ( _Tag < 0 ) OR ( _Tag >= DEF_CCH_MAX ) Then Begin
   _Debug ( 'Exit CCH_Bot Automatico' ) ;
   Exit ;
End ;
FLAG_CORRIGIR_VERTICAL_POSITION_CCH := FALSE ;
Aux := Main.APLICAR_MODO_TEXTO_AUTOMATICO ( CCH_Celulas[_Tag].Comando,
                                            CCH_Celulas[_Tag].ME_CCH.Text,
                                            CCH_Celulas[_Tag].CK_Livre.Checked,
                                            HistDic ) ;
CHANGE_MEMO_SE_DIFF ( CCH_Celulas[_Tag].ME_CCH, Aux ) ;
SALVAR_CONTEUDO_CCH ( 'TCCH Bot Automatico_Click', 0 ) ;
{$ENDIF}
End ;

Procedure TCCH.INSERT_REGISTRO_CCH ( _Tag : LongInt ) ;
Var Local : LongInt ;
Begin
_Debug ( 'INI TCCH INSERT REGISTRO_CCH' ) ;
For Local := DEF_CCH_MAX - 1 - 1 DownTo _Tag Do Begin
   _Debug ( '1 TCCH INSERT REGISTRO_CCH _Tag[' + IntToStr(_Tag) + '] Local[' + IntToStr(Local) + ']' ) ;
   COPIAR_CCH ( Local, Local+1 ) ;
   _Debug ( '2 TCCH INSERT REGISTRO_CCH' ) ;
End ;
_Debug ( 'FIM TCCH INSERT REGISTRO_CCH' ) ;
End ;

Procedure TCCH.CCH_Bot_Insert ( Sender : TObject ) ;
Var _Tag  : LongInt ;
Begin
_Debug ( 'INI CCH_Bot Insert' ) ;
_Tag := (Sender AS TButton).Tag ;
If ( _Tag < 0 ) OR ( _Tag >= DEF_CCH_MAX ) Then Begin
   _Debug ( 'Exit CCH_Bot Insert' ) ;
   Exit ;
End ;
PUT_LOG ( 'CCH_Bot Insert Tag[' + IntToStr(_Tag) + ']' ) ;
INSERT_REGISTRO_CCH ( _Tag ) ;
INICIALIZAR_TARJA_CCH ( _Tag, '#GC', 21 ) ;
SALVAR_CONTEUDO_CCH ( 'CCH_Bot Insert', 0 ) ;
_Debug ( 'FIM CCH_Bot Insert' ) ;
End ;

Procedure TCCH.CCH_Bot_Duplicar ( Sender : TObject ) ;
Var _Tag  : LongInt ;
Begin
_Debug ( 'INI CCH_Bot Duplicar' ) ;
_Tag := (Sender AS TButton).Tag ;
If ( _Tag < 0 ) OR ( _Tag >= DEF_CCH_MAX ) Then Begin
   _Debug ( 'Exit CCH_Bot Duplicar' ) ;
   Exit ;
End ;
PUT_LOG ( 'CCH_Bot Insert Tag[' + IntToStr(_Tag) + ']' ) ;
INSERT_REGISTRO_CCH ( _Tag ) ;
//INICIALIZAR_TARJA_CCH ( _Tag, '#GC', 21 ) ;
SALVAR_CONTEUDO_CCH ( 'CCH_Bot Duplicar', 0 ) ;
_Debug ( 'FIM CCH_Bot Duplicar' ) ;
End ;

Procedure TCCH.CCH_BOT_FIXA ( Sender : TObject ) ;
Begin
{$IFDEF USAR_CHYRON}
_Debug ( 'INI CCH BOT_FIXA' ) ;
Main.EXEC_PLAY_LAST_FIXA ;
_Debug ( 'FIM CCH BOT_FIXA' ) ;
{$ENDIF}
End ;

Procedure TCCH.ME_OnKeyPress (Sender: TObject; var Key: Char);
Begin
VALIDAR_COR_SELECAO_MEMO ( Sender ) ;
If Key = #9 Then Begin
   Key := #0 ;
   Exit ;
End ;
{
Next_Preview_IMG := FALSE ;
CCH_PNLB_OnClick ( Sender ) ;
Next_Preview_IMG := TRUE ;
}
End ;

procedure TCCH.ME_OnKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
If Key = 27 Then Begin
   PUT_LOG ( 'VK_ESC ME_OnKeyDown [' + (Sender As TMemo).Name + ']' ) ;
   Exit ;
End ;
VALIDAR_COR_SELECAO_MEMO ( Sender ) ;
If Key = VK_TAB Then Begin
   Key := 0 ;
   Exit ;
End ;
{
Next_Preview_IMG := FALSE ;
CCH_PNLB_OnClick ( Sender ) ;
Next_Preview_IMG := TRUE ;
}
end;

Procedure CORRIGIR_POSICAO_PAINEL_SB ( SB : TScrollBox ; _Height, _Tag : LongInt ) ;
Var _Base : LongInt ;
    _Top  : LongInt ;
Begin
_Top := _Height * ( _Tag ) ;
_Base := _Height * ( _Tag + 1 ) ;
If ( _Base ) > ( SB.VertScrollBar.Position + SB.Height ) Then Begin
   SB.VertScrollBar.Position := _Base - SB.Height + 33 ; // + _Height ;
End Else If ( _Top < SB.VertScrollBar.Position ) Then Begin
   SB.VertScrollBar.Position := _Top ;
End ;
End ;

Procedure TCCH.SELECIONAR_MEMO ( Origem : String ; Sender : TObject ) ;
{$IFDEF USAR_CHYRON}
Var _Tag  : LongInt ;
    Local : LongInt ;
{$ENDIF}
Begin
{$IFDEF USAR_CHYRON}
_Tag := (Sender As TMemo).Tag ;
PUT_LOG ( 'SELECIONAR_MEMO Or[' + Origem + ']' +
          '[' + (Sender As TMemo).Name + '] ' +
          'Tag[' + IntToStr(_Tag) + ']' ) ;
For Local := 0 To DEF_CCH_MAX - 1 Do Begin
    If Local <> _Tag Then Begin
       CCH_Celulas[Local].ME_CCH.OnExit ( CCH_Celulas[Local].ME_CCH ) ;
    End ;
End ;
RD.RD_VAR_INDICE_GC_GO2 := _Tag ;
RD.RD_SET_POSICAO_CCH_RETRANCA ( _Tag ) ;
RD.RD_VAR_CCH_SELECIONADO_TOP := CCH_Celulas[0].PN_Base_CCH.Height * ( _Tag + 1 ) ;
If FLAG_CORRIGIR_VERTICAL_POSITION_CCH Then Begin
   CORRIGIR_POSICAO_PAINEL_SB ( Main.SB_Controle_Chyron, CCH_Celulas[0].PN_Base_CCH.Height, _Tag ) ;
End ;
If Main.ActiveControl <> (Sender As TMemo) Then Begin
   (Sender As TMemo).Color := clAqua ;
End Else Begin
   If CCH_Celulas[_Tag].CK_Livre.Checked Then Begin
     (Sender As TMemo).Color := clAmareloBebe ;
   End Else Begin
     (Sender As TMemo).Color := clVerdeBebe ;
   End ;
End ;
CCH_PNLB_OnClick ( Sender ) ;
{$ENDIF}
End ;

Procedure TCCH.ME_ONENTER ( Sender: TObject ) ;
Var _Tag : LongInt ;
Begin
_Tag := (Sender As TMemo).Tag ;
If ( _Tag < 0 ) OR ( _Tag >= DEF_CCH_MAX ) Then Begin
   _Debug ( 'Exit Tag CCH ME OnEnter [' + IntToStr(_Tag) + ']' ) ;
   Exit ;
End ;
PUT_LOG ( 'ME_OnEnter Tag[' + IntToStr(_Tag) + ']' ) ;
CCH_Celulas[_Tag].TXT_CCH_Enter := (Sender As TMemo).Text ;
SELECIONAR_MEMO ( 'ME_ONENTER/' + (Sender As TMemo).Name, Sender ) ;
CCH_TAG_SELECIONADA := _Tag ;
End ;

Procedure TCCH.ME_ONENTER_NEXT ( Sender: TObject ) ;
Var _Tag : LongInt ;
Begin
_Tag := (Sender As TMemo).Tag ;
If ( _Tag < 0 ) OR ( _Tag >= DEF_CCH_MAX ) Then Begin
   _Debug ( 'Exit Tag CCH ME ONENTER NEXT [' + IntToStr(_Tag) + ']' ) ;
   Exit ;
End ;
If CCH_Celulas[_Tag].CK_Livre.Checked Then Begin
   (Sender As TMemo).Color := clAmareloBebe ;
End Else Begin
   (Sender As TMemo).Color := clVerdeBebe ;
End ;
End ;

Procedure TCCH.SALVAR_CONTEUDO_CCH ( Origem : String ; _Tempo : LongInt ) ;
{$IFDEF USAR_CHYRON}
Var Conteudo : String ;
{$ENDIF}
Begin
{$IFDEF USAR_CHYRON}
_Debug ( 'INI TCCH SALVAR CONTEUDO_CCH' ) ;
PUT_LOG ( 'SALVAR_CONTEUDO_CCH [' +
          ExtractFileName ( RD.RD_VAR_ESPELHO_ATUAL.Selecionada.FN_GC2 ) + ']' ) ;
Conteudo := CCH_GERAR_TEXTO_CONSOLIDADO ;
RD.RD_KERNEL_SET_GC2 ( 'TCCH SALVAR CONTEUDO_CCH',
                       RD.RD_VAR_ESPELHO_ATUAL.Selecionada.Retranca,
                       Conteudo,
                       SALVAR_FALSE ) ;
Try
   If _Tempo = 0 Then Begin
      WRITE_FILE_CORE ( 'TCCH SALVAR CONTEUDO_CCH',
                        RD.RD_VAR_ESPELHO_ATUAL.Selecionada.FN_GC2 ,
                        Conteudo, DELAYED_FALSE ) ;
   End Else Begin
      PUT_CACHE_GRAVACAO ( 'SALVAR_CONTEUDO_CCH', 500,
                           RD.RD_VAR_ESPELHO_ATUAL.Selecionada.FN_GC2, Conteudo ) ;
   End ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception TCCH SALVAR CONTEUDO_CCH [' + E.Message + '] ' +
                'Or[' + Origem + ']' ) ;
   End ;
End ;
_Debug ( 'FIM TCCH SALVAR CONTEUDO_CCH' ) ;
{$ENDIF}
End ;

Procedure TCCH.FINALIZAR_EDICAO_CCH ( _Tag : LongInt ; Forcado : Boolean ) ;
{$IFDEF USAR_CHYRON}
Var Aux     : String ;
    HistDic : String ;
{$ENDIF}
Begin
{$IFDEF USAR_CHYRON}
_Debug ( 'INI FINALIZAR EDICAO_CCH' ) ;
PUT_LOG ( 'INI FINALIZAR EDICAO_CCH _Tag[' + IntToStr(_Tag) + ']' ) ;
HistDic := '' ;
Aux := Main.APLICAR_MODO_TEXTO_AUTOMATICO ( CCH_Celulas[_Tag].Comando,
                                            CCH_Celulas[_Tag].ME_CCH.Text,
                                            CCH_Celulas[_Tag].CK_Livre.Checked,
                                            HistDic ) ;
CHANGE_MEMO_SE_DIFF ( CCH_Celulas[_Tag].ME_CCH, Aux ) ;
CCH_Celulas[_Tag].TXT_CCH_Exit := CCH_Celulas[_Tag].ME_CCH.Text ;
If ( CCH_Celulas[_Tag].TXT_CCH_Enter <> CCH_Celulas[_Tag].TXT_CCH_Exit ) OR
   ( Forcado ) Then Begin
   PUT_LOG ( 'FINALIZAR EDICAO_CCH Tag[' + IntToStr(_Tag) + '] DIFF ' +
             '[' + CCH_Celulas[_Tag].TXT_CCH_Enter + ']' +
             '[' + CCH_Celulas[_Tag].TXT_CCH_Exit + ']' ) ;
   SALVAR_CONTEUDO_CCH ( 'FINALIZAR EDICAO_CCH', 500 ) ;
End ;
_Debug ( 'FIM FINALIZAR_EDICAO_CCH' ) ;
{$ENDIF}
End ;

Procedure TCCH.ME_ONEXIT ( Sender: TObject ) ;
{$IFDEF USAR_CHYRON}
Var _Tag : LongInt ;
//    Conteudo : String ;
{$ENDIF}
Begin
{$IFDEF USAR_CHYRON}
_Debug ( 'INI TCCH ME ONEXIT' ) ;
_Tag := (Sender As TMemo).Tag ;
If CCH_TAG_SELECIONADA = -1 Then Begin
   _Debug ( 'INI Exit TCCH ME ONEXIT Selecionada[-1] Tag[' + IntToStr(_Tag) + ']'  ) ;
   Exit ;
End ;
If ( _Tag < 0 ) OR ( _Tag >= DEF_CCH_MAX ) Then Begin
   PUT_LOG ( 'Exit Tag CCH ME OnExit [' + IntTostr(_Tag) + ']' ) ;
   Exit ;
End ;
If Assigned ( Main.ActiveControl ) Then Begin
   {
   PUT_LOG ( 'INI TCCH ME OnExit ActiveControl[' + ActiveControl_Name(Main) + '] ' +
             'Sel[' + IntToStr ( CCH_TAG_SELECIONADA ) + '] ' +
             'Tag[' + IntToStr ( _Tag ) + ']' ) ;
   }
End Else Begin
   PUT_LOG ( 'INI TCCH ME OnExit ActiveControl[Null]' +
             '[' + IntToStr ( CCH_TAG_SELECIONADA ) + ']' ) ;
End ;
If ( CCH_TAG_SELECIONADA = _Tag ) Then Begin
   FINALIZAR_EDICAO_CCH ( _Tag, FORCADO_FALSE ) ;
   CCH_TAG_SELECIONADA := -1 ;
End ;
(Sender As TMemo).ReadOnly := TRUE ;
_Debug ( 'FIM TCCH ME OnExit' ) ;
{$ENDIF}
End ;

Function TCCH.CCH_GERAR_TEXTO_CONSOLIDADO : String ;
{$IFDEF USAR_CHYRON}
Var Local : LongInt ;
{$ENDIF}
Begin
{$IFDEF USAR_CHYRON}
Result := '' ;
For Local := 0 To DEF_CCH_MAX - 1 Do Begin
   If ( Trim ( CCH_Celulas[Local].ME_CCH.Text ) <> '' ) AND
      ( Trim ( CCH_Celulas[Local].Comando ) = '' ) Then Begin
      CCH_Celulas[Local].Comando := '#GC' ;
   End ;
   If Trim ( CCH_Celulas[Local].Comando ) <> '' Then Begin
      Result := Result +
                CCH_Celulas[Local].Comando + sLineBreak +
                '<META>LIVRE=' + IF01 ( CCH_Celulas[Local].CK_Livre.Checked ) + sLineBreak +
                Trim ( CCH_Celulas[Local].ME_CCH.Text ) + sLineBreak +
                sLineBreak ;
   End ;
End ;
{$ENDIF}
End ;

Procedure TCCH.CCH_BOT_EDIT_CLICK ( Sender: TObject ) ;
{$IFDEF USAR_CHYRON}
Var _Tag : LongInt ;
{$ENDIF}
Begin
{$IFDEF USAR_CHYRON}
If (Sender Is TButton) Then Begin
   _Tag := (Sender AS TButton).Tag ;
End Else If (Sender Is TMemo) Then Begin
   _Tag := (Sender AS TMemo).Tag ;
End Else If (Sender Is TLabel) Then Begin
   _Tag := (Sender AS TLabel).Tag ;
End Else Begin
   Exit ;
End ;
//If Main.ActiveControl <> Sender Then Begin
   PUT_LOG ( 'SELECIONAR FORCE CCH BOT EDIT_CLICK / ' + IntToStr(_Tag) ) ;
   CCH_Celulas[_Tag].ME_CCH.ReadOnly := FALSE ;
   //CCH_Celulas[_Tag].ME_CCH.SelLength := 0 ;
   //CCH_Celulas[_Tag].ME_CCH.SelStart := 0 ;
   If CCH_Celulas[_Tag].ME_CCH.CanFocus Then Begin
      Try
         CCH_Celulas[_Tag].ME_CCH.SetFocus ;
         If CCH_Celulas[_Tag].CK_Livre.Checked Then Begin
            CCH_Celulas[_Tag].ME_CCH.Color := clAmareloBebe ;
         End Else Begin
            CCH_Celulas[_Tag].ME_CCH.Color := clVerdeBebe ;
         End ;
         CCH_Celulas[_Tag].ME_CCH.SelStart := Length ( CCH_Celulas[_Tag].ME_CCH.Text ) ;
      Except
      End ;
   End ;
//End ;
{$ENDIF}
End ;

Procedure TCCH.GERAL_ONDRAGOVER ( Sender, Source: TObject; X, Y: Integer;
                                  State: TDragState; var Accept: Boolean) ;
Begin
Accept := (Source Is TButton) OR
          (Source Is TMemo) OR
          (Source Is TImage) OR
          (Source Is TListBox) ;
End ;

Procedure TCCH.AJUSTAR_PN_BASE_CCH ( _Tag : LongInt ) ;
Var Altura : LongInt ;
Begin
Altura := 22 ; // PN_Top
//Inc ( Altura, CCH_Celulas[_Tag].ME.Height ) ; // ME
Inc ( Altura, CCH_ALTURA_LINHA_MEMO * 3 ) ;
Inc ( Altura, CCH_Celulas[_Tag].ME_Preview.Height ) ;
//CCH_Celulas[_Tag].PN_Memo.Height := Altura ;
CCH_Celulas[_Tag].PN_Base_CCH.Height := Altura ;
CCH_Celulas[_Tag].PN_Right.Width := TRUNC ( ( Altura -  22 ) * 1.5 ) ;
End ;

Procedure TCCH.DEFINE_LB_CMD ( Var LB: TLabel; Cmd : String ; _Msg : LongInt ) ;
Begin
If _Msg = 0 Then Begin
   LB.Caption := '' ;
   LB.Color := clSilver ;
   LB.Font.Color := clBlack ;
   Exit ;
End ;
LB.Caption := Cmd + ' {' + IntToStr(_Msg) + '}' ;
LB.Transparent := FALSE ;
If ( _Msg = DEF_MSG_CHYRON_GC ) OR
   ( _Msg = DEF_MSG_CHYRON_SYS_CGV ) Then Begin // GC
   LB.Color := clBlue ;
   LB.Font.Color := clWhite ;
End Else If _Msg = DEF_MSG_CHYRON_MANCHETE Then Begin // Destaques
   LB.Color := clFuchsia ;
   LB.Font.Color := clBlack ;
End Else If ( _Msg = DEF_MSG_CHYRON_WHATSAPP ) OR
            ( _Msg = DEF_MSG_CHYRON_G1 ) OR
            ( _Msg = DEF_MSG_CHYRON_A_SEGUIR ) OR
            ( _Msg = DEF_MSG_CHYRON_VEMVEM ) Then Begin // A Seguir ou VemVem
   LB.Color := clLime ;
   LB.Font.Color := clBlack ;
End Else If _Msg = DEF_MSG_CHYRON_FIXA Then Begin // Tarjas fixas
   LB.Color := clRed ;
   LB.Font.Color := clWhite ;
End Else If _Msg = DEF_MSG_CHYRON_FAKE Then Begin // Fake
   LB.Color := clMaroon ;
   LB.Font.Color := clWhite ;
End Else If ( _Msg = DEF_MSG_CHYRON_INFO1 ) OR
            ( _Msg = DEF_MSG_CHYRON_CAMERA ) OR
            ( _Msg = DEF_MSG_CHYRON_SYS_INFO ) Then Begin // Info/Camera
   LB.Color := clAqua ;
   LB.Font.Color := clBlack ;
End Else If ( _Msg = DEF_MSG_CHYRON_TS ) OR
            ( _Msg = DEF_MSG_CHYRON_TELEFONE ) Then Begin // Telefones
   LB.Color := clGreen ;
   LB.Font.Color := clYellow ;
End Else Begin
   LB.Color := clYellow ;
   LB.Font.Color := clBlack ;
End ;
End ;

Procedure TCCH.GERAL_ONDRAGDROP ( Sender, Source : TObject ; X, Y: Integer ) ;
{$IFDEF USAR_CHYRON}
Var _Tag     : LongInt ;
    Reg      : T_GC ;
    Cmd      : String ;
    Aux      : String ;
    FN       : String ;
    Aux2     : String ;
    Aux3     : String ;
    HistDic  : String ;
{$ENDIF}
Begin
{$IFDEF USAR_CHYRON}
_Debug ( '*** Ini CCH GERAL ONDRAGDROP' ) ;
_Tag := -1 ;
Cmd := '' ;
HistDic := '' ;
If (Sender Is TMemo) AND (Source Is TListBox) Then Begin
   _Tag := (Sender AS TMemo).Tag ;
   If ( _Tag >= 0 ) AND ( _Tag < DEF_CCH_MAX ) Then Begin
      If (Source As TListBox).ItemIndex > -1 Then Begin
         If CCH_Celulas[_Tag]._Msg = 0 Then Begin
            CCH_Celulas[_Tag]._Msg := 21 ;
            CCH_Celulas[_Tag].Comando := '#GC' ;
         End ;
         Cmd := CCH_Celulas[_Tag].Comando ;
         Aux := (Source As TListBox).Items[(Source As TListBox).ItemIndex] ;
         Aux := System.SysUtils.StringReplace ( Aux, '|', sLineBreak, [rfReplaceAll] ) ;
         CHANGE_MEMO_SE_DIFF ( CCH_Celulas[_Tag].ME_CCH, Aux ) ;
         //CCH_Celulas[_Tag].ME_CCH.Text := Aux ;
         Aux2 := Main.APLICAR_MODO_TEXTO_AUTOMATICO ( Cmd, CCH_Celulas[_Tag].ME_CCH.Text,
                                                      CCH_Celulas[_Tag].CK_Livre.Checked,
                                                      HistDic ) ;
         //CCH_Celulas[_Tag].ME_CCH.Text := Aux2 ;
         CHANGE_MEMO_SE_DIFF ( CCH_Celulas[_Tag].ME_CCH, Aux2 ) ;
         Reg := TIPOS_GC_GET_REG_GC ( Cmd ) ;
         DEFINE_LB_CMD ( CCH_Celulas[_Tag].LB_Top, Cmd, Reg.Msg ) ;
         SALVAR_CONTEUDO_CCH ( 'CCH GERAL ONDRAGDROP/2', 0 ) ;
         Exit ;
      End ;
   End ;
End ;
If (Sender Is TPanel) AND (Source Is TButton) Then Begin
   _Tag := (Sender As TPanel).Tag ;
End ;
If (Sender Is TLabel) AND (Source Is TButton) Then Begin
   _Tag := (Sender As TLabel).Tag ;
End ;
If (Sender Is TMemo) Then Begin
   _Tag := (Sender As TMemo).Tag ;
End ;
If (Sender Is TMemo) AND (Source Is TImage) Then Begin
   FN := (Source As TImage).Hint ;
   Cmd := '#SELO' ;
   Aux3 := ExtractFileName ( FN ) + sLineBreak +
           RD.RD_FN_Sem_Servidor ( FN ) ;
   //CCH_Celulas[_Tag].ME_CCH.Text := Aux3 ;
   CHANGE_MEMO_SE_DIFF ( CCH_Celulas[_Tag].ME_CCH, Aux3 ) ;
   (*
   CCH_Celulas[_Tag].Comando := Cmd ;
   Reg := TIPOS_GC_GET_REG_GC ( Cmd ) ;
   CCH_Celulas[_Tag].Comando := Cmd ;
   DEFINE_LB_CMD ( CCH_Celulas[_Tag].LB_Top, Cmd, Reg.Msg ) ;
   SALVAR_CONTEUDO_CCH ( 'CCH GERAL ONDRAGDROP/1a' ) ;
   Exit ;
   *)
End ;
If (Sender Is TMemo) AND (Source Is TMemo) Then Begin
   TRANSFERIR_CONTEUDO_MEMO ( (Sender As TMemo), (Source As TMemo) ) ;
   If ( _Tag >= 0 ) AND ( _Tag < DEF_CCH_MAX ) Then Begin
      CCH_Celulas[_Tag].Comando := '#TARJA' ;
      CCH_Celulas[_Tag]._Msg := 22 ;
      Cmd := Trim ( CCH_Celulas[_Tag].Comando ) ;
      Aux3 :=  Main.APLICAR_MODO_TEXTO_AUTOMATICO ( Cmd, CCH_Celulas[_Tag].ME_CCH.Text,
                                                    CCH_Celulas[_Tag].CK_Livre.Checked,
                                                    HistDic ) ;
      //CCH_Celulas[_Tag].ME_CCH.Text := Aux3 ;
      CHANGE_MEMO_SE_DIFF ( CCH_Celulas[_Tag].ME_CCH, Aux3 ) ;
      SALVAR_CONTEUDO_CCH ( 'CCH GERAL ONDRAGDROP/1', 0 ) ;
      SELECIONAR_MEMO ( 'CCH GERAL ONDRAGDROP/2', CCH_Celulas[_Tag].ME_CCH ) ;
      _Debug ( '### OK/1 CCH GERAL ONDRAGDROP Tag[' + IntToStr(_Tag) + ']' ) ;
   End Else Begin
      _Debug ( '### !Tag [' + IntToStr(_Tag) + '] CCH GERAL ONDRAGDROP' ) ;
   End ;
   Exit ;
End ;
If ( _Tag < 0 ) OR ( _Tag >= DEF_CCH_MAX ) Then Begin
   PUT_LOG ( '### Exit INV _Tag [' + IntToStr(_Tag) + '] CCH GERAL ONDRAGDROP' ) ;
   Exit ;
End ;
If (Source Is TButton) Then Begin
   Cmd := (Source As TButton).Caption ;
End ;
(*
If Cmd = '' Then Begin
   PUT_LOG ( '### Exit !Cmd CCH GERAL ONDRAGDROP' ) ;
   Exit ;
End ;
*)
While Pos ( '(', Cmd  ) > 0 Do Begin
   Delete ( Cmd, Length(Cmd), 1 ) ;
End ;
Cmd := Trim ( Cmd ) ;
PUT_LOG ( 'CMD CCH GERAL ONDRAGDROP [' + Cmd + ']' ) ;
Reg := TIPOS_GC_GET_REG_GC ( Cmd ) ;
CCH_Celulas[_Tag].Comando := Cmd ;
DEFINE_LB_CMD ( CCH_Celulas[_Tag].LB_Top, Cmd, Reg.Msg ) ;
If (Source Is TButton) AND ( Sender Is TLabel) Then Begin
   Aux3 := Main.APLICAR_MODO_TEXTO_AUTOMATICO ( Cmd, CCH_Celulas[_Tag].ME_CCH.Text,
                                                CCH_Celulas[_Tag].CK_Livre.Checked,
                                                HistDic ) ;
   //CCH_Celulas[_Tag].ME_CCH.Text := Aux3 ;
   CHANGE_MEMO_SE_DIFF ( CCH_Celulas[_Tag].ME_CCH, Aux3 ) ;
End ;
SALVAR_CONTEUDO_CCH ( 'CCH GERAL ONDRAGDROP/2', 0 ) ;
_Debug ( '### FIM CCH GERAL ONDRAGDROP' ) ;
{$ENDIF}
End ;

Procedure TCCH.Bot_Insert_DragOver ( Sender, Source: TObject; X, Y: Integer;
                                     State: TDragState; var Accept: Boolean ) ;
Begin
Accept := (Source Is TButton) ;
End ;

Procedure TCCH.Bot_Insert_DragDrop ( Sender, Source : TObject ; X, Y: Integer ) ;
Var _Tag : LongInt ;
    Reg  : T_GC ;
Begin
_Debug ( 'INI TCCH Bot Insert_DragDrop' ) ;
_Tag := (Sender As TButton).Tag ;
If ( _Tag < 0 ) OR ( _Tag >= DEF_CCH_MAX ) Then Begin
   _Debug ( 'Exit/1 !Tag[' + IntToStr(_Tag) + '] TCCH Bot Insert_DragDrop' ) ;
   Exit ;
End ;
If (Source Is TButton) Then Begin
   //CCH_Bot_Insert ( CCH_Celulas[_Tag].Bot_Insert ) ;
   INSERT_REGISTRO_CCH ( _Tag ) ;
   CCH_Celulas[_Tag].Comando := (Source As TButton).Caption ;
   Reg := TIPOS_GC_GET_REG_GC ( CCH_Celulas[_Tag].Comando ) ;
   CCH_Celulas[_Tag]._Msg := Reg.Msg ;
   DEFINE_LB_CMD ( CCH_Celulas[_Tag].LB_Top, CCH_Celulas[_Tag].Comando, CCH_Celulas[_Tag]._Msg ) ;
   INICIALIZAR_TARJA_CCH ( _Tag, CCH_Celulas[_Tag].Comando, CCH_Celulas[_Tag]._Msg ) ;
   SALVAR_CONTEUDO_CCH ( 'TCCH Bot Insert_DragDrop', 0 ) ;
End ;
_Debug ( 'FIM TCCH Bot Insert_DragDrop' ) ;
End ;

Procedure TCCH.GERAL_ONMOUSEDOWN ( Sender: TObject; Button: TMouseButton;
                                   Shift: TShiftState; X, Y: Integer);
Var //pnt         : TPoint ;
    pt          : TPoint ;
//    _Retranca   : String ;
//    SG_J_Col    : LongInt ;
//    SG_J_Row    : LongInt ;
Begin
pt := Mouse.CursorPos ;
If Button = mbRight Then Begin
   CCH_BOT_EDIT_CLICK ( Sender ) ;
   //_Retranca := Trim ( Main.SG_J2.Cells[SG_J_RETRANCA, Main.SG_J2.Row] ) ;
   //Main.EXECUTAR_EDICAO_RETRANCA ( _Retranca ) ;
End ;
End ;

Procedure TCCH.DBL_CLICK_IM_SELO ( Sender : TObject ) ;
Begin
If NOT ( Sender Is TImage ) Then Begin
   Exit ;
End ;
{$IFDEF NW}
MISC_PREVIEW_SELO ( Preview_Selo, Preview_Selo.PN_Resolucao_Incorreta2,
                    Preview_Selo.LB_Resolucao_Incorreta,
                    Preview_Selo.IM_Selo, Sender As TImage,  '' ) ;
{$ENDIF}
End ;

procedure TCCH.ME_OnMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
If (Sender As TMemo).ReadOnly Then Begin
   (Sender As TMemo).Cursor := crNo ;
End Else Begin
   (Sender As TMemo).Cursor := crDefault ;
End ;
end;

procedure TCCH.LB_Top_OnClick(Sender: TObject);
{$IFDEF USAR_CHYRON}
Var _Tag    : LongInt ;
    Aux     : String ;
    Reg     : T_GC ;
    HistDic : String ;
{$ENDIF}
Begin
{$IFDEF USAR_CHYRON}
_Debug ( 'INI TCCH LB Top OnClick' ) ;
_Tag := (Sender AS TLabel).Tag ;
If ( _Tag < 0 ) OR ( _Tag >= DEF_CCH_MAX ) Then Begin
   _Debug ( 'Exit/1 TCCH LB Top OnClick' ) ;
   Exit ;
End ;
HistDic := '' ;
Aux := CCH_Celulas[_Tag].Comando ;
Aux := Super_UpperCase ( InputBox ( Title_RNews + ' - Tipo de efeito', 'Efeito', Aux ) ) ;
PUT_LOG ( 'DEF TIPO CCH/1 [' + Aux + ']' ) ;
Aux := '#' + Main.GET_TIPO_POR_ABREVIATURA ( Aux ) ;
If Aux = '#' Then Begin
   Aux := '#GC' ;
End ;
PUT_LOG ( 'DEF TIPO CCH/2 [' + Aux + ']' ) ;
If Pos ( '(', Aux ) > 0 Then Begin
   Delete ( Aux, Pos ( '(', Aux ), Length ( Aux ) ) ;
End ;
Aux := Trim ( Aux ) ;
PUT_LOG ( 'DEF TIPO CCH/3 [' + Aux + ']' ) ;
Aux := System.SysUtils.StringReplace ( Aux, '##', '#', [rfReplaceAll] ) ;
PUT_LOG ( 'DEF TIPO CCH/4 [' + Aux + ']' ) ;
CCH_Celulas[_Tag].Comando := Aux ;
Aux := Main.APLICAR_MODO_TEXTO_AUTOMATICO ( CCH_Celulas[_Tag].Comando,
                                            CCH_Celulas[_Tag].ME_CCH.Text,
                                            CCH_Celulas[_Tag].CK_Livre.Checked,
                                            HistDic ) ;
CHANGE_MEMO_SE_DIFF ( CCH_Celulas[_Tag].ME_CCH, Aux ) ;
Reg := TIPOS_GC_GET_REG_GC ( CCH_Celulas[_Tag].Comando ) ;
DEFINE_LB_CMD ( CCH_Celulas[_Tag].LB_Top, CCH_Celulas[_Tag].Comando, Reg.Msg ) ;
//FN := RD.RD_VAR_ESPELHO_ATUAL.Selecionada.FN_GC2 ;
//ADD_DESCONSIDERE_MONITOR_ARQUIVO ( FN, 1000 ) ;
SALVAR_CONTEUDO_CCH ( 'CCH LB Top OnClick', 0 ) ;
//RD.RD_SINCRONIZAR_JORNAL_LOCAL ( 'TCCH LB Top OnClick', FN, _Mesma_Retranca ) ;
//RD.RD_MESMA_RETRANCA ;
//SET_EDGC_TIPO ( 1, _Tag, Super_UpperCase ( Aux ) ) ;
_Debug ( 'FIM TCCH LB Top OnClick' ) ;
{$ENDIF}
End ;

procedure TCCH.ME_OnMouseDown ( Sender: TObject; Button: TMouseButton;
                                Shift: TShiftState; X, Y: Integer);
Begin
If Sender Is TMemo Then Begin
   If Button = mbRight Then Begin
      CCH_BOT_EDIT_CLICK ( Sender ) ;
   End ;
End ;
End ;

Procedure TCCH.CK_Livre_On_Click ( Sender: TObject ) ;
Var _Tag : LongInt ;
Begin
_Tag := (Sender AS TCheckBox).Tag ;
If ( _Tag < 0 ) OR ( _Tag >= DEF_CCH_MAX ) Then Begin
   _Debug ( 'Exit/1 TCCH CK Livre On_Click' ) ;
   Exit ;
End ;
If MainForm.ActiveControl = Sender Then Begin
   FINALIZAR_EDICAO_CCH ( _Tag, FORCADO_TRUE ) ;
   VALIDAR_COR_SELECAO_MEMO ( CCH_Celulas[_Tag].ME_CCH ) ;
End ;
End ;

Constructor TCCH.Create ( Indice : LongInt ; Dono : TComponent ;
                          Servidor : String ; SB : TScrollBox ) ;
Const Margem = 4 ;
{$IFDEF USAR_CHYRON}
Var Local   : LongInt ;
    Local2  : LongInt ;
{$ENDIF}
Begin
_Debug ( 'INI CCH Create' ) ;
{$IFDEF USAR_CHYRON}
//ShowMessage ( 'criando' ) ;
PUT_CARREGANDO_SISTEMA ( 'INI CCH CREATE' ) ;
CCH_VAR_SB := SB ;
SetLength ( CCH_Celulas, DEF_CCH_MAX + 1 ) ;
SB.OnClick := CCH_PNLB_OnClick ;
SB.Color := clAmareloBebe ;
SendMessage ( SB.Handle, WM_SETREDRAW, Integer(FALSE), 0 ) ;
SB.DisableAlign ;
For Local := 0 To DEF_CCH_MAX Do Begin // +1 para registro TEMP no final da Array
   With CCH_Celulas[Local] Do Begin
      PN_Base_CCH := TPanel.Create ( Dono ) ;
      With PN_Base_CCH Do Begin
         Parent := SB ;
         If Indice = 1 Then Begin
            Name := 'PN_Base_' + IntToStr(Local) ;
         End Else Begin
            Name := 'PN_Base_' + IntToStr(Indice) + '_' + IntToStr(Local) ;
         End ;
         Caption := '' ;
         Tag := Local ;
         Visible := FALSE ;
         Align := alTop ;
         AlignWithMargins := TRUE ;
         Case Local Of
         0 : Begin
             Margins.Top := Margem DIV 2 ;
             Margins.Bottom := Margem DIV 2 ;
             End ;
         DEF_CCH_MAX - 1 : Begin
             Margins.Top := Margem DIV 2 ;
             Margins.Bottom := Margem DIV 2 ;
             End ;
         Else
             Begin
             Margins.Top := Margem DIV 2 ;
             Margins.Bottom := Margem DIV 2 ;
             End ;
         End ;
         Margins.Right := Margem ;
         Margins.Left := Margem ;
         OnClick := CCH_PNLB_OnClick ;
         Height := 22 + 16 * 5 + 12 ;
         PN_PADRAO ( PN_Base_CCH ) ;
      End ;
      //
      PN_Top2 := TPanel.Create ( Dono ) ;
      With PN_Top2 Do Begin
         Parent := PN_Base_CCH ;
         If Indice = 1 Then Begin
            Name := 'PN_TOP2_' + IntToStr(Local) ;
         End Else Begin
            Name := 'PN_TOP2_' + IntToStr(Indice) + '_' + IntToStr(Local) ;
         End ;
         Caption := '' ;
         Tag := Local ;
         ShowHint := FALSE ;
         Hint := '' ;
         Visible := FALSE ;
         Align := alTop ;
         AlignWithMargins := FALSE ;
         Margins.Top := 2 ;
         Margins.Bottom := 2 ;
         Margins.Right := 4 ;
         Margins.Left := 4 ;
         Height := 22 ;
         OnClick := CCH_PNLB_OnClick ;
         PN_PADRAO ( PN_Top2 ) ;
      End ;
      //
      PN_Right := TPanel.Create ( Dono ) ;
      With PN_Right Do Begin
         Parent := PN_Base_CCH ;
         If Indice = 1 Then Begin
            Name := 'PN_Right_' + IntToStr(Local) ;
         End Else Begin
            Name := 'PN_Right_' + IntToStr(Indice) + '_' + IntToStr(Local) ;
         End ;
         Caption := '' ;
         Tag := Local ;
         ShowHint := FALSE ;
         Hint := '' ;
         Visible := FALSE ;
         Align := alRight ;
         AlignWithMargins := FALSE ;
         Margins.Top := 2 ;
         Margins.Bottom := 2 ;
         Margins.Right := 4 ;
         Margins.Left := 4 ;
         Width := TRUNC ( PN_Base_CCH.Height * 1.4 ) ; // + 30 ) ;
         OnClick := CCH_PNLB_OnClick ;
         PN_PADRAO ( PN_Right ) ;
      End ;
      //
      PN_Memo := TPanel.Create ( Dono ) ;
      With PN_Memo Do Begin
         Parent := PN_Base_CCH ;
         If Indice = 1 Then Begin
            Name := 'PN_MEMO_' + IntToStr(Local) ;
         End Else Begin
            Name := 'PN_MEMO_' + IntToStr(Indice) + '_' + IntToStr(Local) ;
         End ;
         Caption := '' ;
         Tag := Local ;
         ShowHint := FALSE ;
         Hint := Name ;
         Visible := TRUE ;
         Align := alClient ; // alTop ;
         AlignWithMargins := FALSE ;
         Margins.Top := 2 ;
         Margins.Bottom := 2 ;
         Margins.Right := 4 ;
         Margins.Left := 4 ;
         //Height := 22 * 4 ;
         OnClick := CCH_PNLB_OnClick ;
         PN_PADRAO ( PN_Memo ) ;
      End ;
      //
      PN_Item2 := TPanel.Create ( Dono ) ;
      With PN_Item2 Do Begin
         Parent := PN_Top2 ;
         If Indice = 1 Then Begin
            Name := 'PN_Item_' + IntToStr(Local) ;
         End Else Begin
            Name := 'PN_Item_' + IntToStr(Indice) + '_' + IntToStr(Local) ;
         End ;
         Caption := StrZero ( Local+1, 2 ) ; // PN_Item.Name ;
         Tag := Local ;
         Visible := FALSE ;
         Align := alLeft ;
         Color := clGray ;
         AlignWithMargins := FALSE ;
         Margins.Top := 2 ;
         Margins.Bottom := 2 ;
         Margins.Right := 4 ;
         Margins.Left := 4 ;
         Width := 30 ;
         Font.Name := 'Tahoma' ;
         Font.Size := 11 ;
         Font.Style := [fsBold] ;
         Font.Color := clYellow ;
         BevelOuter := bvLowered ;
         Alignment := taCenter ;
         ShowHint := FALSE ;
         OnDragOver := GERAL_ONDRAGOVER ;
         OnDragDrop := GERAL_ONDRAGDROP ;
         Hint := Name ;
         //PN_Item.OnClick := CCH_PNLB_OnClick ;
         //OnDblClick := CCH_PN_Item_OnDblClick ;
         PN_PADRAO ( PN_Item2 ) ;
      End ;
      //
      CB_Tags := TComboBox.Create ( Dono ) ;
      With CB_Tags Do Begin
         Parent := PN_Top2 ;
         If Indice = 1 Then Begin
            Name := 'CB_Tags_' + IntToStr(Local) ;
         End Else Begin
            Name := 'CB_Tags_' + IntToStr(Indice) + '_' + IntToStr(Local) ;
         End ;
         Tag := Local ;
         Visible := NOT TRUE ;
         Align := alLeft ;
         AlignWithMargins := FALSE ;
         Margins.Top := 2 ;
         Margins.Bottom := 2 ;
         Margins.Right := 4 ;
         Margins.Left := 4 ;
         Width := 120 ;
         DropDownCount := 45 ;
         TabStop := FALSE ;
         Font.Name := 'Tahoma' ;
         Font.Size := 8 ;
         Font.Style := [] ;
         Font.Color := clYellow ;
         BevelOuter := bvLowered ;
         ShowHint := TRUE ;
         Hint := Name ;
         Items.Clear ;
         Items.AddStrings ( View_Perfis_GC.LB_Tags.Items ) ;
         Style := csOwnerDrawFixed ;
         //OnClick := CCH_PNLB_OnClick ;
         //OnDblClick := CCH_CB_Tags_OnDblClick ;
         //PN_PADRAO ( CB_Tags ) ;
      End ;
      //
      PN_Rodape := TPanel.Create ( Dono ) ;
      With PN_Rodape Do Begin
         Parent := PN_Top2 ;
         If Indice = 1 Then Begin
            Name := 'PN_RODAPE_' + IntToStr(Local) ;
         End Else Begin
            Name := 'PN_RODAPE_' + IntToStr(Indice) + '_' + IntToStr(Local) ;
         End ;
         Caption := '' ;
         Tag := Local ;
         Color := clSilver ;
         BevelOuter := bvNone ;
         Visible := FALSE ;
         Align := alRight ;
         AlignWithMargins := FALSE ;
         Margins.Top := 3 ;
         Margins.Bottom := 3 ;
         Margins.Right := 3 ;
         Margins.Left := 3 ;
         Width := 60 ;
         ShowHint := FALSE ;
         Hint := Name ;
         OnClick := CCH_PNLB_OnClick ;
         PN_PADRAO ( PN_Rodape ) ;
      End ;
      //
      CK_Livre := TCheckBox.Create ( Dono ) ;
      With CK_Livre Do Begin
         Parent := PN_Top2 ;
         If Indice = 1 Then Begin
            Name := 'CK_LIVRE_' + IntToStr(Local) ;
         End Else Begin
            Name := 'CK_LIVRE_' + IntToStr(Indice) + '_' + IntToStr(Local) ;
         End ;
         Caption := 'Livre' ;
         Tag := Local ;
         Checked := FALSE ;
         Font.Color := clGray ;
         Color := clSilver ;
         Font.Color := clSilver ;
         Font.Name := 'Tahoma' ;
         Font.Size := 9 ;
         Font.Style := [] ;
         Visible := FALSE ;
         Align := alLeft ;
         AlignWithMargins := TRUE ;
         Margins.Top := 3 ;
         Margins.Bottom := 3 ;
         Margins.Right := 3 ;
         Margins.Left := 3 ;
         Width := 50 ;
         ShowHint := FALSE ;
         OnClick := CK_LIVRE_ON_CLICK ;
         Hint := Name ;
         CK_PADRAO ( CK_Livre ) ;
      End ;
      //
      (*
      PN_Is_Fixa := TPanel.Create ( Dono ) ;
      With PN_Is_Fixa Do Begin
         Parent := PN_Top2 ; // PN_Rodape ;
         If Indice = 1 Then Begin
            Name := 'PN_IS_FIXA_' + IntToStr(Local) ;
         End Else Begin
            Name := 'PN_IS_FIXA_' + IntToStr(Indice) + '_' + IntToStr(Local) ;
         End ;
         Caption := 'FIX' ;
         Tag := Local ;
         Font.Color := clGray ;
         Color := clSilver ;
         Font.Color := clSilver ;
         Font.Name := 'Fixedsys' ;
         Font.Size := 9 ;
         Font.Style := [] ;
         BevelOuter := bvNone ;
         Visible := FALSE ;
         Align := alLeft ;
         AlignWithMargins := FALSE ;
         Margins.Top := 3 ;
         Margins.Bottom := 3 ;
         Margins.Right := 3 ;
         Margins.Left := 3 ;
         Width := 40 ;
         ShowHint := FALSE ;
         Hint := Name ;
         //OnClick := CCH_PNLB_OnClick ;
         PN_PADRAO ( PN_Is_Fixa ) ;
      End ;
      *)
      //
      ME_CCH := TMemo.Create ( Dono ) ;
      With ME_CCH Do Begin
         Parent := PN_Memo ;
         If Indice = 1 Then Begin
            Name := 'ME_CCH_' + IntToStr(Local) ;
            OnEnter := ME_ONENTER ;
         End Else Begin
            Name := 'ME_CCH_' + IntToStr ( Indice ) + '_' + IntToStr(Local) ;
            OnEnter := ME_ONENTER_NEXT ;
         End ;
         Text := '' ;
         Tag := Local ;
         Visible := FALSE ;
         Align := alClient ;
         AlignWithMargins := NOT TRUE ;
         Margins.Top := 5 ;
         Margins.Bottom := 5 ;
         Margins.Right := 5 ;
         Margins.Left := 5 ;
         WordWrap := FALSE ;
         Height := 22 * 2 ;
         Font.Name := 'Fixedsys' ;
         Font.Color := clBlack ;
         PopupMenu := Main.PM_Vazio ;
         Font.Size := 9 ;
         Font.Style := [] ;
         ShowHint := FALSE ;
         Hint := Name ;
         ReadOnly := TRUE ;
         Color := clSilver ;
         ScrollBars := ssVertical ;
         OnClick := CCH_PNLB_OnClick ;
         OnExit := ME_ONEXIT ;
         OnChange := ME_ONCHANGE ;
         OnMouseMove := ME_OnMouseMove ;
         OnMouseDown := ME_OnMouseDown ;
         //DragMode := dmAutomatic ;
         OnDragOver := GERAL_ONDRAGOVER ;
         OnDragDrop := GERAL_ONDRAGDROP ;
         //OnKeyPress := ME_OnKeyPress ;
         OnKeyDown := ME_OnKeyDown ;
         MEMO_PADRAO ( ME_CCH ) ;
      End ;
      //
      ME_Preview := TMemo.Create ( Dono ) ;
      With ME_Preview Do Begin
         Parent := PN_Memo ;
         Text := '' ;
         Tag := Local ;
         Visible := FALSE ;
         Align := alBottom ;
         AlignWithMargins := NOT TRUE ;
         Margins.Top := 5 ;
         Margins.Bottom := 5 ;
         Margins.Right := 5 ;
         Margins.Left := 5 ;
         WordWrap := FALSE ;
         Height := 1 ; // 22 * 2 ;
         Font.Name := 'Fixedsys' ;
         Font.Color := clGray ;
         Font.Size := 9 ;
         Font.Style := [] ;
         ShowHint := FALSE ;
         Hint := Name ;
         ReadOnly := TRUE ;
         DragMode := dmAutomatic ;
         Color := clSilver + $202020 ;
         ScrollBars := ssVertical ;
         //OnClick := CCH_PNLB_OnClick ;
         //OnExit := ME_ONEXIT ;
         //OnChange := ME_ONCHANGE ;
         //OnKeyPress := ME_OnKeyPress ;
         //OnKeyDown := ME_OnKeyDown ;
         MEMO_PADRAO ( ME_Preview ) ;
      End ;
      //
      IM_SELO_CCH := TImage.Create ( Dono ) ;
      With IM_SELO_CCH Do Begin
         Parent := PN_Right ;
         Tag := Local ;
         If Indice = 1 Then Begin
            Name := 'IM_SELO_CCH2_' + StrZero(Local,2) ;
         End Else Begin
            Name := 'IM_SELO_CCH2_' + IntToStr(Indice) + '_' + StrZero(Local,2) ;
         End ;
         Hint := Name ;
         ShowHint := NOT FALSE ; // RD_VAR_SHOWHINT ;
         Left := 0 ; // + 1000 ;
         Align := alClient ; // alRight ;
         AutoSize := FALSE ;
         Stretch := TRUE ;
         Transparent := FALSE ;
         AlignWithMargins := FALSE ;
         Margins.Top := 3 ;
         Margins.Bottom := 5 ;
         Margins.Left := 3 ;
         Margins.Right := 3 ;
         Visible := TRUE ;
         //Width := TRUNC ( PN_Base_CCH.Height * 1.77777 ) ;
         OnDblClick := DBL_CLICK_IM_SELO ;
         IM_PADRAO ( IM_SELO_CCH ) ;
      End ;
      //
      Bot_Edit := TButton.Create ( Dono ) ;
      With Bot_Edit Do Begin
         Caption := '' ;
         Width := 30 ;
         Parent := PN_Top2 ;
         Align := alLeft ;
         Tag := Local ;
         Enabled := TRUE ;
         Visible := FALSE ;
         TabStop := FALSE ;
         OnClick := CCH_BOT_EDIT_CLICK ;
         ShowHint := TRUE ;
         Hint := 'Edi??o local da tarja' ;
         Images := Main.IM_Main ;
         ImageMargins.Left := 5 ;
         ImageIndex := 32 ;
      End ;
      //
      Bot_Subir := TButton.Create ( Main ) ;
      With Bot_Subir Do Begin
         Parent := PN_Top2 ;
         Name := 'CCH_Bot_Subir_' + IntToStr(Indice) + '_' + IntToStr(Local) ;
         Caption := 'Sub' ;
         Font.Name := 'Tahoma' ;
         Font.Size := 9 ;
         Font.Style := [] ;
         Tag := Local ;
         ShowHint := FALSE ;
         Hint := Name ;
         Enabled := Local > 0 ;
         Visible := TRUE ;
         Align := alLeft ;
         AlignWithMargins := TRUE ;
         Margins.Top := 0 ;
         Margins.Bottom := 0 ;
         Margins.Right := 0 ;
         Margins.Left := 0 ;
         Width := 25 ;
         OnClick := Bot_Subir_Click ;
         //BOT_PADRAO ( Bot_Subir ) ;
      End ;
      //
      Bot_Descer := TButton.Create ( Main ) ;
      With Bot_Descer Do Begin
         Parent := PN_Top2 ;
         Name := 'CCH_Bot_Descer_' + IntToStr(Indice) + '_' + IntToStr(Local) ;
         Caption := 'Des' ;
         Font.Name := 'Tahoma' ;
         Font.Size := 9 ;
         Font.Style := [] ;
         Tag := Local ;
         ShowHint := FALSE ;
         Hint := Name ;
         Enabled := Local < ( DEF_CCH_MAX - 1 ) ;
         Visible := TRUE ;
         Align := alLeft ;
         AlignWithMargins := TRUE ;
         Margins.Top := 0 ;
         Margins.Bottom := 0 ;
         Margins.Right := 0 ;
         Margins.Left := 0 ;
         Width := 25 ;
         OnClick := Bot_Descer_Click ;
         //BOT_PADRAO ( Bot_Descer ) ;
      End ;
      //
      Bot_Play := TButton.Create ( Dono ) ;
      With Bot_Play Do Begin
         Caption := '' ;
         Width := 30 ;
         Parent := PN_Top2 ;
         Align := alRight ;
         Tag := Local ;
         Visible := FALSE ;
         TabStop := FALSE ;
         Enabled := ( Indice = 1 ) ;
         OnClick := CCH_LB_OnDblClick ;
         ShowHint := TRUE ;
         Hint := 'Exibir tarja' ;
         Images := Main.IM_Main ;
         ImageMargins.Left := 5 ;
         ImageIndex := 43 ;
      End ;
      //
      Bot_Stop := TButton.Create ( Dono ) ;
      With Bot_Stop Do Begin
         Caption := '' ;
         Width := 30 ;
         Parent := PN_Top2 ;
         Align := alRight ;
         Tag := Local ;
         Visible := FALSE ;
         TabStop := FALSE ;
         Enabled := ( Indice = 1 ) ;
         OnClick := CCH_BOT_STOP ;
         ShowHint := TRUE ;
         Hint := 'Remover os efeitos n?o persistentes' ;
         Images := Main.IM_Main ;
         ImageMargins.Left := 5 ;
         ImageIndex := 44 ;
      End ;
      //
      Bot_AddStr := TButton.Create ( Dono ) ;
      With Bot_AddStr Do Begin
         Caption := '' ;
         Width := 30 ;
         Parent := PN_Top2 ;
         Align := alRight ;
         Tag := Local ;
         Visible := FALSE ;
         TabStop := FALSE ;
         Enabled := ( Indice = 1 ) ;
         OnClick := CCH_BOT_ADDSTR ;
         ShowHint := TRUE ;
         Hint := 'Adicionar #GC ? lista de aceita??o' ;
         Images := Main.IM_Main ;
         ImageMargins.Left := 5 ;
         ImageIndex := 30 ;
      End ;
      //
      Bot_Fixa := TButton.Create ( Dono ) ;
      With Bot_Fixa Do Begin
         Caption := '' ;
         Width := 30 ;
         Parent := PN_Top2 ;
         Align := alRight ;
         Tag := Local ;
         Visible := FALSE ;
         TabStop := FALSE ;
         Enabled := ( Indice = 1 ) ;
         OnClick := CCH_BOT_FIXA ;
         ShowHint := TRUE ;
         Hint := 'Reexibir ?ltima tarja fixa' ;
         Images := Main.IM_Main ;
         ImageMargins.Left := 5 ;
         ImageIndex := 45 ;
      End ;
      //
      Bot_Insert := TButton.Create ( Dono ) ;
      With Bot_Insert Do Begin
         Font.Size := 10 ;
         Font.Name := 'Tahoma' ;
         Font.Style := [] ;
         Caption := '+' ;
         Width := 22 ;
         Parent := PN_Top2 ;
         Align := alRight ;
         Tag := Local ;
         Visible := FALSE ;
         TabStop := FALSE ;
         Enabled := ( Indice = 1 ) ;
         OnClick := CCH_Bot_Insert ;
         ShowHint := TRUE ;
         Hint := 'Inserir nova tarja' ;
         OnDragOver := Bot_Insert_DragOver ;
         OnDragDrop := Bot_Insert_DragDrop ;
         //Images := Main.IM_Main ;
         //ImageMargins.Left := 5 ;
         //ImageIndex := -1 ;
      End ;
      //
      Bot_Duplicar := TButton.Create ( Dono ) ;
      With Bot_Duplicar Do Begin
         Font.Size := 10 ;
         Font.Name := 'Tahoma' ;
         Font.Style := [] ;
         Caption := '++' ;
         Width := 30 ;
         Parent := PN_Top2 ;
         Align := alRight ;
         Tag := Local ;
         Visible := FALSE ;
         TabStop := FALSE ;
         Enabled := ( Indice = 1 ) ;
         OnClick := CCH_Bot_Duplicar ;
         ShowHint := TRUE ;
         Hint := 'Duplicar tarja' ;
         //OnDragOver := Bot_Insert_DragOver ;
         //OnDragDrop := Bot_Insert_DragDrop ;
         //Images := Main.IM_Main ;
         //ImageMargins.Left := 5 ;
         //ImageIndex := -1 ;
      End ;
      //
      Bot_Hist_Dic := TButton.Create ( Dono ) ;
      With Bot_Hist_Dic Do Begin
         Font.Name := 'Tahoma' ;
         Font.Size := 9 ;
         Font.Style := [] ;
         Caption := 'His' ;
         Width := 30 ;
         Parent := PN_Top2 ;
         Align := alRight ;
         Tag := Local ;
         Visible := FALSE ;
         TabStop := FALSE ;
         Enabled := ( Indice = 1 ) ;
         OnClick := Bot_Hist_Dic_Click ;
         ShowHint := TRUE ;
         Hint := 'Hist?rico de aplica??o do dicion?rio' ;
         Images := Main.IM_Main ;
         ImageMargins.Left := 5 ;
         ImageIndex := -1 ;
      End ;
      //
      Bot_Automatico := TButton.Create ( Dono ) ;
      With Bot_Automatico Do Begin
         Font.Name := 'Tahoma' ;
         Font.Size := 9 ;
         Font.Style := [] ;
         Caption := 'Aut' ;
         Width := 30 ;
         Parent := PN_Top2 ;
         Align := alRight ;
         Tag := Local ;
         Visible := FALSE ;
         TabStop := FALSE ;
         Enabled := ( Indice = 1 ) ;
         OnClick := Bot_Automatico_Click ;
         ShowHint := TRUE ;
         Hint := 'Ajuste autom?tico' ;
         Images := Main.IM_Main ;
         ImageMargins.Left := 5 ;
         ImageIndex := -1 ;
      End ;
      //
      Bot_Delete := TButton.Create ( Dono ) ;
      With Bot_Delete Do Begin
         Font.Size := 10 ;
         Font.Name := 'Tahoma' ;
         Font.Style := [] ;
         Caption := 'X' ;
         Width := 22 ;
         Parent := PN_Top2 ;
         Align := alRight ;
         Tag := Local ;
         Visible := FALSE ;
         TabStop := FALSE ;
         Enabled := ( Indice = 1 ) ;
         OnClick := CCH_Bot_Delete ;
         ShowHint := TRUE ;
         Hint := 'Remover tarja' ;
         Images := Main.IM_Main ;
         ImageMargins.Left := 5 ;
         ImageIndex := -1 ;
      End ;
      //
      LB_Top := TLabel.Create ( Dono ) ;
      With LB_Top Do Begin
         Name := 'CCH_LB_Top_' + StrZero(Local,2) + '_' + StrZero(Indice,2) ;
         Font.Name := 'Tahoma' ;
         Parent := PN_Top2 ;
         Font.Size := 11 ;
         Font.Style := [fsBold] ;
         Align := alClient ;
         Alignment := taCenter ;
         Transparent := FALSE ;
         Layout := tlCenter ;
         Tag := Local ;
         Visible := FALSE ;
         //OnDblClick := CCH_LB_OnDblClick ;
         OnClick := LB_Top_OnClick ;
         Font.Color := clBlue ;
         Font.Style := [fsBold] ;
         ShowHint := TRUE ;
         OnDragOver := GERAL_ONDRAGOVER ;
         OnDragDrop := GERAL_ONDRAGDROP ;
         OnMouseDown := GERAL_ONMOUSEDOWN ;
         Hint := Name ;
         LABEL_Padrao ( LB_Top ) ;
      End ;
      //
      LB_Bottom := TLabel.Create ( Dono ) ;
      With LB_Bottom Do Begin
         Name := 'CCH_LB_Bottom_' + StrZero(Local,2) + '_' + StrZero(Indice,2) ;
         Font.Name := 'Tahoma' ;
         Parent := PN_RODAPE ;
         Font.Size := 11 ;
         Font.Style := [fsBold] ;
         Align := alClient ;
         Alignment := taCenter ;
         Transparent := TRUE ;
         Layout := tlCenter ;
         Tag := Local ;
         Visible := FALSE ;
         //OnDblClick := CCH_LB_OnDblClick ;
         OnClick := CCH_PNLB_OnClick ;
         Font.Color := clBlue ;
         Font.Style := [fsBold] ;
         ShowHint := TRUE ;
         Hint := Name ;
         LABEL_Padrao ( LB_Bottom ) ;
      End ;
      //
      // PN_Base_CCH.Height := CCH_CALC_HEIGHT_PN ( Local ) ; // LB[0].Height * DEF_CCH_MAX_LB ;
   End ;
End ;
PUT_CARREGANDO_SISTEMA ( 'CCH CREATE/1' ) ;
SB.VertScrollBar.Range := ( CCH_Celulas[0].PN_Base_CCH.Height +
                            CCH_Celulas[0].PN_Base_CCH.Margins.Top +
                            CCH_Celulas[0].PN_Base_CCH.Margins.Bottom ) * DEF_CCH_MAX ;
For Local := DEF_CCH_MAX - 1 DownTo 0 Do Begin
    CCH_Celulas[Local].PN_Base_CCH.Visible := TRUE ;
    CCH_Celulas[Local].CK_Livre.Visible := TRUE ;
    //CCH_Celulas[Local].PN_Is_Fixa.Visible := TRUE ;
    CCH_Celulas[Local].PN_Rodape.Visible := TRUE ;
    For Local2 := DEF_CCH_MAX_LB - 1 DownTo 0 Do Begin
        //CCH_Celulas[Local].LB[Local2].Visible := TRUE ;
    End ;
    //CCH_Celulas[Local].LB[DEF_CCH_MAX_LB - 1].Visible := TRUE ;
    //CCH_Celulas[Local].LB[0].Visible := TRUE ;
    CCH_Celulas[Local].Bot_Edit.Visible := TRUE ;
    CCH_Celulas[Local].Bot_Fixa.Visible := ( Indice = 1 ) ;
    CCH_Celulas[Local].Bot_Play.Visible := ( Indice = 1 ) ;
    CCH_Celulas[Local].Bot_Stop.Visible := ( Indice = 1 ) ;
    CCH_Celulas[Local].Bot_Insert.Visible := ( Indice = 1 ) ;
    CCH_Celulas[Local].Bot_Duplicar.Visible := ( Indice = 1 ) ;
    CCH_Celulas[Local].Bot_Delete.Visible := ( Indice = 1 ) ;
    CCH_Celulas[Local].Bot_AddStr.Visible := ( Indice = 1 ) ;
    CCH_Celulas[Local].Bot_Hist_Dic.Visible := ( Indice = 1 ) ;
    CCH_Celulas[Local].Bot_Automatico.Visible := ( Indice = 1 ) ;
    CCH_Celulas[Local].LB_Top.Visible := TRUE ;
    CCH_Celulas[Local].LB_Bottom.Visible := TRUE ;
    CCH_Celulas[Local].ME_CCH.Visible := TRUE ;
    CCH_Celulas[Local].ME_Preview.Visible := TRUE ;
    //CCH_Celulas[Local].CB_Tags.Visible := TRUE ;
    CCH_Celulas[Local].PN_Item2.Visible := TRUE ;
    //CCH_Celulas[Local].PN_Msg.Visible := TRUE ;
    CCH_Celulas[Local].PN_Top2.Visible := TRUE ;
    AJUSTAR_PN_BASE_CCH(Local) ;
    //CCH_Celulas[Local].IM_SELO_CCH.Width := TRUNC ( CCH_Celulas[Local].PN_Base_CCH.Height * 1.4 ) ;
End ;
SB.EnableAlign ;
SendMessage ( SB.Handle, WM_SETREDRAW, Integer(TRUE), 0 ) ;
RedrawWindow ( SB.Handle, nil, 0,  RDW_INVALIDATE OR RDW_UPDATENOW OR RDW_ALLCHILDREN ) ;
_Debug ( 'FIM CCH Create' ) ;
PUT_CARREGANDO_SISTEMA ( 'FIM CCH CREATE' ) ;
{$ENDIF}
End ;

Function TCCH.CCH_CALC_HEIGHT_PN ( Indice : LongInt ) : LongInt ;
//Var Local : LongInt ;
Begin
_Debug ( 'INI CCH CALC_HEIGHT_PN' ) ;
Result := CCH_Celulas[Indice].PN_Top2.Height ;
{
For Local := 1 To DEF_CCH_MAX_LB - 1 - 1 Do Begin
    If CCH_Celulas[Indice].LB[Local].Visible Then Begin
       Inc ( Result, CCH_Celulas[Indice].LB[Local].Height ) ;
    End ;
End ;
}
//Inc ( Result, CCH_Celulas[Indice].PN_Rodape.Height ) ;
Inc ( Result, CCH_Celulas[Indice].ME_CCH.Height ) ;
Inc ( Result, CCH_Celulas[Indice].ME_Preview.Height ) ;
//Inc ( Result, 22 ) ;
Inc ( Result, 4 ) ;
_Debug ( 'FIM CCH CALC_HEIGHT_PN' ) ;
End ;

Procedure TCCH.CCH_LIMPAR_CONTROLE ( Inicio, Fim : LongInt ) ;
Var Local   : LongInt ;
//    Local2  : LongInt ;
Begin
_Debug ( 'INI CCH LIMPAR_CONTROLE' ) ;
PUT_CARREGANDO_SISTEMA ( 'INI CCH LIMPAR_CONTROLE ' +
                         '[' + IntToStr(Inicio) + '/' + IntToStr(Fim) + ']' ) ;
For Local := Inicio To Fim Do Begin
   //PUT_CARREGANDO_SISTEMA ( 'LOOP CCH LIMPAR_CONTROLE ' +
   //                         '[' + IntToStr(Local) + ']' ) ;
   With CCH_Celulas[Local] Do Begin
      //PUT_CARREGANDO_SISTEMA ( 'LOOP A' + '[' + IntToStr(Local) + ']' ) ;
      LB_Top.Caption := '' ;
      //PUT_CARREGANDO_SISTEMA ( 'LOOP B' + '[' + IntToStr(Local) + ']' ) ;
      LB_Bottom.Caption := '' ;
      //PUT_CARREGANDO_SISTEMA ( 'LOOP C' + '[' + IntToStr(Local) + ']' ) ;
      ME_CCH.Clear ;
      //PUT_CARREGANDO_SISTEMA ( 'LOOP D' + '[' + IntToStr(Local) + ']' ) ;
      _Msg := 0 ;
      Comando := '' ;
      //PUT_CARREGANDO_SISTEMA ( 'LOOP e' + '[' + IntToStr(Local) + ']' ) ;
      PN_Item2.Color := clGray ;
      //PN_Item2.Caption := '' ;
      //PUT_CARREGANDO_SISTEMA ( 'LOOP F' + '[' + IntToStr(Local) + ']' ) ;
      CCH_Celulas[Local].LB_Bottom.Visible := TRUE ;
      //PUT_CARREGANDO_SISTEMA ( 'LOOP G' + '[' + IntToStr(Local) + ']' ) ;
      CCH_Celulas[Local].LB_Top.Visible := TRUE ;
      //PUT_CARREGANDO_SISTEMA ( 'LOOP H' + '[' + IntToStr(Local) + ']' ) ;
      CCH_Celulas[Local].LB_Top.Color := PN_Top2.Color ;
      //PUT_CARREGANDO_SISTEMA ( 'LOOP I' + '[' + IntToStr(Local) + ']' ) ;
   End ;
End ;
_Debug ( 'FIM CCH LIMPAR_CONTROLE' ) ;
PUT_CARREGANDO_SISTEMA ( 'FIM CCH LIMPAR_CONTROLE' ) ;
End ;

Procedure TCCH.VALIDAR_COR_SELECAO_MEMO ( Sender : TObject ) ;
Var Local : LongInt ;
Begin
If NOT ( Sender Is TMemo ) Then Begin
   Exit ;
End ;
For Local := 0 To DEF_CCH_MAX - 1 Do Begin
   If CCH_Celulas[Local].ME_CCH <> Sender Then Begin
      If CCH_Celulas[Local].ME_CCH.Color <> clSilver Then Begin
         CCH_Celulas[Local].ME_CCH.Color := clSilver ;
      End ;
   End Else Begin
      If NOT (Sender As TMemo).ReadOnly Then Begin
         If CCH_Celulas[Local].CK_Livre.Checked Then Begin
            (Sender As TMemo).Color := clAmareloBebe ;
         End Else Begin
            (Sender As TMemo).Color := clVerdeBebe ;
         End ;
      End Else If (Sender As TMemo).Color <> clAqua Then Begin
         (Sender As TMemo).Color := clAqua ;
      End ;
   End ;
End ;
End ;

Procedure TCCH.CCH_PN_Item_OnDblClick ( Sender : TObject ) ;
Var _Tag   : LongInt ;
    Reg_Chyron : T_Registro_TX_Chyron ;
    Reg        : T_GC ;
Begin
_Debug ( 'INI CCH PN_Item_OnDblClick' ) ;
If Sender Is TLabel Then Begin
   _Tag := (Sender AS TLabel).Tag MOD 1000 ;
End Else If Sender Is TPanel Then Begin
   _Tag := (Sender AS TPanel).Tag MOD 1000 ;
End Else Begin
   _Debug ( 'Exit CCH PN_Item_OnDblClick' ) ;
   Exit ;
End ;
Reg_Chyron := PROC_PREPARAR_GC_PARA_EXECUCAO ( 'CCH PN_Item_OnDblClick',
                                                _Tag, Reg, PREVIEW_IMG_TRUE ) ;
PROC_EXECUTAR_GC ( _Tag ) ;
_Debug ( 'FIM CCH PN_Item_OnDblClick' ) ;
End ;

Procedure TCCH.CCH_PNLB_OnClick ( Sender : TObject ) ;
{$IFDEF USAR_CHYRON}
Var _Tag       : LongInt ;
    Reg_Chyron : T_Registro_TX_Chyron ;
    Reg        : T_GC ;
{$ENDIF}
Begin
{$IFDEF USAR_CHYRON}
_Debug ( 'INI CCH CCH PNLB_OnClick' ) ;
If GetTickCount > RD.RD_VAR_Next_CCH_PNLB_OnClick Then Begin
   RD.RD_VAR_Next_CCH_PNLB_OnClick := GetTickCount + 50 ;
End Else Begin
   PUT_LOG ( 'ABORT TICK RD_VAR_Next CCH PNLB_OnClick' ) ;
   Exit ;
End ;
If Sender Is TLabel Then Begin
   _Tag := (Sender AS TLabel).Tag MOD 1000 ;
End Else If Sender Is TButton Then Begin
   _Tag := (Sender AS TButton).Tag MOD 1000 ;
End Else If Sender Is TMemo Then Begin
   _Tag := (Sender AS TMemo).Tag MOD 1000 ;
End Else If Sender Is TPanel Then Begin
   _Tag := (Sender AS TPanel).Tag MOD 1000 ;
End Else Begin
   _Debug ( 'Exit/1 CCH CCH PNLB_OnClick' ) ;
   Exit ;
End ;
//PUT_LOG ( 'OK TICK RD_VAR_Next_CCH PNLB_OnClick Tag[' + IntToStr(_Tag) + ']' ) ;
RD.RD_VAR_INDICE_GC_GO2 := _Tag ;
If Sender Is TMemo Then Begin
   //If Main.ActiveControl <> Sender Then Begin
      VALIDAR_COR_SELECAO_MEMO ( Sender ) ;
      Reg_Chyron := PROC_PREPARAR_GC_PARA_EXECUCAO ( 'CCH PNLB_OnClick',
                                                     _Tag, Reg, Next_Preview_IMG ) ;
   //End ;
End ;
_Debug ( 'FIM CCH CCH PNLB_OnClick' ) ;
{$ENDIF}
End ;

Function TCCH.CCH_CARREGAR_REGISTRO_TX_CHYRON ( Origem : String ;
                                                Var Reg_Chyron : T_Registro_TX_Chyron ;
                                                Indice : LongInt ;
                                                Executar_Preview : Boolean ;
                                                Preview_Img : Boolean ) : T_GC ;
Var Aux : String ;
Begin
_Debug ( 'INI CCH CARREGAR_REGISTRO_TX_CHYRON' ) ;
//PUT_LOG ( 'CCH CARREGAR_REGISTRO_TX_CHYRON [' + Origem + ']' ) ;
If Indice >= 0 Then Begin
   //Aux := CCH_Celulas[Indice].LB[IDX_LB_HEADER].Caption ;
   Aux := TIPOS_GC_LIMPAR_CMD_GC ( CCH_Celulas[Indice].LB_Top.Caption ) ;
   While ( Pos ( '=', Aux ) > 0 ) OR
         ( Pos ( ';', Aux ) > 0 ) OR
         ( Pos ( '_', Aux ) > 0 ) Do Begin
      Delete ( Aux, Length(Aux), 1 ) ;
   End ;
   Aux := System.SysUtils.StringReplace ( Aux, '#', '', [rfReplaceAll] ) ;
   Reg_Chyron.Cmd := Aux ;
   //
   Reg_Chyron.P1 := GET_LINHA_MEMO ( CCH_Celulas[Indice].ME_CCH, 0 ) ; // CCH_Celulas[Indice].LB[IDX_LB_PARAM_1].Caption ;
   Reg_Chyron.P2 := GET_LINHA_MEMO ( CCH_Celulas[Indice].ME_CCH, 1 ) ; // CCH_Celulas[Indice].LB[IDX_LB_PARAM_2].Caption ;
   Reg_Chyron.P3 := GET_LINHA_MEMO ( CCH_Celulas[Indice].ME_CCH, 2 ) ; // CCH_Celulas[Indice].LB[IDX_LB_PARAM_3].Caption ;
   Reg_Chyron.P4 := GET_LINHA_MEMO ( CCH_Celulas[Indice].ME_CCH, 3 ) ; // CCH_Celulas[Indice].LB[IDX_LB_PARAM_4].Caption ;
End ;
//
//Reg_Chyron.Msg := CCH_GET_MSG_POR_CMD ( Reg_Chyron ) ;
Result := TIPOS_GC_GET_REG_GC ( Reg_Chyron.Cmd ) ;
Reg_Chyron.Msg := Result.Msg ;
//PUT_LOG ( 'CCH Reg CMD[' + Reg_Chyron.Cmd +  '] Msg[' + IntToStr ( Result.Msg ) + ']' ) ;
If Reg_Chyron.P1 <> '' Then Begin
   Result.Texto[1] := Reg_Chyron.P1 ;
End Else Begin
   If Result.Default[1] <> '' Then Begin
      Result.Texto[1] := Result.Default[1] ;
   End ;
End ;
If Reg_Chyron.P2 <> '' Then Begin
   Result.Texto[2] := Reg_Chyron.P2 ;
End Else Begin
   If Result.Default[2] <> '' Then Begin
      Result.Texto[2] := Result.Default[2] ;
   End ;
End ;
If Reg_Chyron.P3 <> '' Then Begin
   Result.Texto[3] := Reg_Chyron.P3 ;
End Else Begin
   If Result.Default[3] <> '' Then Begin
      Result.Texto[3] := Result.Default[3] ;
   End ;
End ;
If Reg_Chyron.P4 <> '' Then Begin
   Result.Texto[4] := Reg_Chyron.P4 ;
End Else Begin
   If Result.Default[4] <> '' Then Begin
      Result.Texto[4] := Result.Default[4] ;
   End ;
End ;
If Executar_Preview Then Begin
   If View_Perfis_GC.Visible Then Begin
      GC_EXECUTE_PREVIEW_GC_REG ( 'CCH CARREGAR_REGISTRO_TX_CHYRON', 'PERFIS', GC_PERFIS, Result, Preview_Img ) ;
   End ;
   GC_EXECUTE_PREVIEW_GC_REG ( 'CCH CARREGAR_REGISTRO_TX_CHYRON', 'MAIN', GC_MAIN, Result, Preview_Img ) ;
   GC_EXECUTE_PREVIEW_GC_REG ( 'CCH CARREGAR_REGISTRO_TX_CHYRON', 'PREVIEW', GC_PREVIEW, Result, Preview_Img ) ;
   End ;
//CCH_PARAMETRIZAR_REG_POR_MSG ( Reg_Chyron ) ;
Reg_Chyron.Exibir_Relogio := Result.Relogio ;
Reg_Chyron.Remover_Relogio := NOT Reg_Chyron.Exibir_Relogio ;
_Debug ( 'FIM CCH CARREGAR_REGISTRO_TX_CHYRON' ) ;
End ;

Function TCCH.PROC_PREPARAR_GC_PARA_EXECUCAO ( Origem : String ; _Tag : LongInt ; Var Reg : T_GC ;
                                               Preview_IMG : Boolean ) : T_Registro_TX_Chyron ;
Var Local      : LongInt ;
Begin
LIMPAR_REGISTRO_TX_CHYRON ( Result ) ;
Reg := CCH_CARREGAR_REGISTRO_TX_CHYRON ( 'PROC_PREPARAR_GC_PARA_EXECUCAO/' + Origem ,
                                         Result, _Tag, PREVIEW_TRUE, Preview_IMG ) ;
For Local := 0 To DEF_CCH_MAX - 1 Do Begin
   If Local = _Tag Then Begin
      CCH_Celulas[Local].PN_Base_CCH.Color := clAqua ;
   End Else Begin
      CCH_Celulas[Local].PN_Base_CCH.Color := clBtnFace ;
   End ;
End ;
End ;

Procedure TCCH.PROC_EXECUTAR_GC ( _Tag : LongInt ) ;
{$IFDEF USAR_CHYRON}
Var Reg        : T_GC ;
    Reg_Chyron : T_Registro_TX_Chyron ;
    Local      : LongInt ;
{$ENDIF}
Begin
{$IFDEF USAR_CHYRON}
Reg_Chyron := PROC_PREPARAR_GC_PARA_EXECUCAO ( 'PROC_EXECUTAR_GC',
                                               _Tag, Reg, PREVIEW_IMG_TRUE ) ;
For Local := 0 To DEF_CCH_MAX - 1 Do Begin
   If Local = _Tag Then Begin
      CCH_Celulas[Local].PN_Rodape.Color := clBlue ;
   End Else Begin
      CCH_Celulas[Local].PN_Rodape.Color := clSilver ;
   End ;
End ;
Main.TX_REGISTRO_CHYRON ( Reg_Chyron ) ;
If Reg.Fixa Then Begin
   {
   For Local := 0 To DEF_CCH_MAX - 1 Do Begin
      If CCH_Celulas[Local].PN_Is_Fixa.Color <> clSilver Then Begin
         CCH_Celulas[Local].PN_Is_Fixa.Color := clSilver ;
         CCH_Celulas[Local].PN_Is_Fixa.Font.Color := clGray ;
      End ;
   End ;
   }
   //CCH_Celulas[_Tag].PN_Is_Fixa.Color := clYellow ;
   //CCH_Celulas[_Tag].PN_Is_Fixa.Font.Color := clBlack ;
   If CCH_Celulas[_Tag].ME_CCH.Lines.Count > 1 Then Begin
      RD.RD_VAR_Last_GC_Fixa_Cmd := Reg_Chyron.Msg ;
      RD.RD_VAR_Last_GC_Fixa_L1 := Reg_Chyron.P1 ; // CCH_Celulas[_Tag].ME.Lines[0] ;
      RD.RD_VAR_Last_GC_Fixa_L2 := Reg_Chyron.P2 ; // CCH_Celulas[_Tag].ME.Lines[1] ;
      RD.RD_VAR_Last_GC_Fixa_Lauda := Main.SG_J2.Cells[SG_J_NO, Main.SG_J2.Row] ;
      RD.RD_VAR_Last_GC_Fixa_Retranca := Main.SG_J2.Cells[SG_J_RETRANCA, Main.SG_J2.Row] ;
      PUT_LOG ( 'F3_SAVE Msg[' + IntToStr ( RD.RD_VAR_Last_GC_Fixa_Cmd ) + ' ' +
                'L1[' + RD.RD_VAR_Last_GC_Fixa_L1 + '] ' +
                'L2[' + RD.RD_VAR_Last_GC_Fixa_L2 + ']' ) ;
      Main.PN_Tarja_Fixa.Caption := 'FIXA ' +
                                    '[' + RD.RD_VAR_Last_GC_Fixa_L1 + '] ' +
                                    ' RET[' + RD.RD_VAR_Last_GC_Fixa_Lauda + ']{' +
                                    RD.RD_VAR_Last_GC_Fixa_Retranca + '}' ;
   End ;
End ;
{$ENDIF}
End ;

Procedure TCCH.CCH_LB_OnDblClick ( Sender : TObject ) ;
{$IFDEF USAR_CHYRON}
Var _Tag       : LongInt ;
    Reg_Chyron : T_Registro_TX_Chyron ;
    Reg        : T_GC ;
    _Proxima   : String ;
{$ENDIF}
Begin
{$IFDEF USAR_CHYRON}
_Debug ( 'INI CCH LB_OnDblClick' ) ;
{$IFDEF NW}
If NOT Flag_Modo_GC2 Then Begin
   PUT_LOG ( 'ERRO - R-News n?o est? em modo de videografismo' ) ;
   Exit ;
End ;
{$ENDIF}
If Sender Is TLabel Then Begin
   _Tag := (Sender AS TLabel).Tag MOD 1000 ;
   PUT_LOG ( 'INI/Label CCH LB_OnDblClick _Tag[' + IntToStr(_Tag) + ']' ) ;
End Else If Sender Is TButton Then Begin
   _Tag := (Sender AS TButton).Tag MOD 1000 ;
   PUT_LOG ( 'INI/Button CCH LB_OnDblClick _Tag[' + IntToStr(_Tag) + ']' ) ;
End Else If Sender Is TPanel Then Begin
   _Tag := (Sender AS TPanel).Tag MOD 1000 ;
   PUT_LOG ( 'INI/Panel CCH LB_OnDblClick _Tag[' + IntToStr(_Tag) + ']' ) ;
End Else Begin
   _Debug ( 'Exit CCH LB_OnDblClick' ) ;
   PUT_LOG ( 'Exit/1 CCH LB_OnDblClick' ) ;
   Exit ;
End ;
RD.RD_VAR_FLAG_MANTER_FOCO := TRUE ;
Reg_Chyron := PROC_PREPARAR_GC_PARA_EXECUCAO ( 'TCCH CCH_BOT_STOP',
                                               _Tag, Reg, PREVIEW_IMG_TRUE ) ;
If ( Reg_Chyron.Msg = DEF_MSG_CHYRON_MANCHETE ) AND
   ( ( Trim  ( Reg_Chyron.P1 ) = '' ) OR
     ( Trim  ( Reg_Chyron.P2 ) = '' ) ) Then Begin
   PUT_LOG ( 'Nenhuma a??o (P1 ou P2 vazias) Msg[' + IntToStr(Reg_Chyron.Msg) + ']' ) ;
   // N?o faz nada - alguma linha vazia
End Else If ( ( Reg_Chyron.Msg = DEF_MSG_CHYRON_GC ) OR
          ( Reg_Chyron.Msg = DEF_MSG_CHYRON_FIXA ) ) AND
        ( Trim  ( Reg_Chyron.P1 ) = '' ) Then Begin
   // N?o faz nada - primeira linha vazia
   PUT_LOG ( 'Nenhuma a??o (P1 vazia) Msg[' + IntToStr(Reg_Chyron.Msg) + ']' ) ;
End Else If Reg_Chyron.Msg = 0 Then Begin
   If Preferencias_GC.Fixar_Marca_Dagua Then Begin
      EXEC_DIRETO_REM_VOLATEIS_LOGO_MARCA ;
   End Else Begin
      EXEC_DIRETO_REM_VOLATEIS_SEM_LOGO ;
   End ;
End Else If Reg_Chyron.Msg = 9999 Then Begin // FAKE
   // N?o faz nada
End Else Begin
   PROC_EXECUTAR_GC ( _Tag ) ;
End ;
If Reg_Chyron.Msg = 5021 Then Begin // GCV
   AJUSTAR_FLAGS_DE_EXIBICAO ( -1, 'SEREIA_VIVO' ) ;
End ;
Try
   Main.DEFINIR_LAST_RETRANCA_SEND_GC ;
   If CCH_Celulas[RD.RD_VAR_INDICE_GC_GO2]._Msg = 0 Then Begin
      RD.RD_VAR_INDICE_GC_GO2 := 0 ;
      If Main.SG_J2.Row < (Main.SG_J2.RowCount - 1 ) Then Begin
         _Proxima := Main.SG_J2.Cells[SG_J_RETRANCA, Main.SG_J2.Row+1] ;
         RD.RD_VAR_SL_POSICOES_CCH.Values[_Proxima] := '0' ;
      End ;
      Main.PROXIMA_RETRANCA ;
   End Else Begin
      RD.RD_VAR_INDICE_GC_GO2 := _Tag + 1 ;
      SELECIONAR_MEMO ( 'CCH_LB_OnDblClick/' + IntToStr(RD.RD_VAR_INDICE_GC_GO2),
                        CCH_Celulas[RD.RD_VAR_INDICE_GC_GO2].ME_CCH ) ;
   End ;
Except
End ;
_Debug ( 'FIM CCH LB_OnDblClick' ) ;
{$ENDIF}
End ;

Procedure TCCH.CCH_PROC_PUT_CELULA_CHYRON ( Modo : LongInt ;
                                            Registro : T_Clip_Retranca ;
                                            Indice : LongInt ; Cmd : String ;
                                            Params : TStringList ; Obs : String ;
                                            Livre : Boolean ) ;
{$IFDEF USAR_CHYRON}
Var Local      : LongInt ;
    Reg        : T_GC ;
    FN         : String ;
    Aux        : String ;
    Str        : String ;
    HistDic    : String ;
{$ENDIF}
Begin
{$IFDEF USAR_CHYRON}
_Debug ( 'INI CCH PROC_PUT_CELULA_CHYRON' ) ;
Params.Text := Trim (Params.Text) ;
If ( ( Cmd = '#GC' ) OR ( Cmd = '#TARJA' ) ) AND
   ( Params.Count > 2 ) Then Begin
   Cmd := '#INFO' ;
End ;
If Cmd = '' Then Begin
   //PUT_LOG ( 'ERRO PROC_PUT_CELULA_CHYRON Cmd Vazio' ) ;
   _Debug ( 'Exit/2 CCH PROC_PUT_CELULA_CHYRON' ) ;
   Exit ;
End ;
Reg := TIPOS_GC_GET_REG_GC ( Cmd ) ;
If Reg.Msg = 0 Then Begin
   //PUT_LOG ( 'ERRO PROC_PUT_CELULA_CHYRON !Msg' ) ;
   _Debug ( 'Exit/3 CCH PROC_PUT_CELULA_CHYRON' ) ;
   Exit ;
End ;
//PUT_LOG ( 'CCH PROC PUT CELULA CHYRON Cmd[' + Cmd + '] ' +
//          'Livre[' + IF01(Livre) + ']') ;
While Params.Count < ( DEF_CCH_MAX_LB - 2 ) Do Begin
   Params.Add ( '' ) ;
End ;
HistDic := '' ;
If Params.Count > 0 Then Begin
End ;
If ( Indice < 0 ) OR ( Indice >= DEF_CCH_MAX ) Then Begin
   //PUT_LOG ( 'ERRO PROC_PUT_CELULA_CHYRON Indice Invalido [' + IntToStr ( Indice ) + ']' ) ;
   _Debug ( 'Exit/1 CCH PROC_PUT_CELULA_CHYRON' ) ;
   Exit ;
End ;
With CCH_Celulas[Indice] Do Begin
   _Retranca := Registro.Retranca ;
   _Caminho := INSERE_BARRA ( ExtractFilePath ( Registro.FN_GC2 ) ) ;
   _GC2 := Registro.FN_GC2 ;
   PN_Base_CCH.AlignWithMargins := TRUE ;
   Aux := '' ;
   For Local := 0 To 3 Do Begin
      If Trim ( Params[Local] ) <> '' Then Begin
         If Aux <> '' Then Begin
            Aux := Aux + sLineBreak + Params[Local] ;
         End Else Begin
            Aux := Params[Local] ;
         End ;
      End ;
   End ;
   If Modo = 1 Then Begin
      CHANGE_MEMO_SE_DIFF ( ME_CCH, Aux ) ;
      LB_Bottom.Caption := Obs ;
   End ;
   CHANGE_SL_SE_DIFF ( R_Conversor_GC.SL2[Indice], Aux ) ;
End ;
If Modo = 1 Then Begin
   CCH_Celulas[Indice].CK_Livre.Checked := Livre ;
   CCH_Celulas[Indice].TXT_CCH_Enter := CCH_Celulas[Indice].ME_CCH.Text ;
   CCH_Celulas[Indice].PN_Right.Visible := IS_MSG_SELO ( Reg.Msg, '' ) ;
   If CCH_Celulas[Indice].PN_Right.Visible Then Begin
      If Params.Count > 0 Then Begin
         FN := Params[0] ;
         SetLength ( Reg_Load_Image, Length ( Reg_Load_Image ) + 1 ) ;
         With Reg_Load_Image [ Length ( Reg_Load_Image ) - 1 ] Do Begin
            _Pendente := TRUE ;
            _Dir1 := RD.RD_GET_DIR_SELO ;
            _Dir2 := RD.RD_GET_DIR_SELO_FIXO ;
            _Dir3 := RD.RD_GET_DIR_JORNAL_DATA_ARTES ;
            _IM := CCH_Celulas[Indice].IM_Selo_CCH ;
            _FN := FN ;
         End  ;
      End ;
   End ;
   CCH_Celulas[Indice]._Msg := Reg.Msg;
   CCH_Celulas[Indice].Comando := Cmd ;
   DEFINE_LB_CMD ( CCH_Celulas[Indice].LB_Top,
                   CCH_Celulas[Indice].Comando,
                   CCH_Celulas[Indice]._Msg ) ;
   Str := Main.APLICAR_MODO_TEXTO_AUTOMATICO ( CCH_Celulas[Indice].Comando,
                                               CCH_Celulas[Indice].ME_CCH.Text,
                                               CCH_Celulas[Indice].CK_Livre.Checked,
                                               HistDic ) ;
   CCH_Celulas[Indice].Hist_Dic := HistDic ;
End ;
R_Conversor_GC.Comando[Indice] := Cmd ;
R_Conversor_GC._Msg[Indice] := Reg.Msg ;
_Debug ( 'FIM CCH PROC_PUT_CELULA_CHYRON' ) ;
{$ENDIF}
End ;

Procedure TCCH.PROC_LOAD_IMAGES ;
{$IFDEF USAR_CHYRON}
Var Qtde  : LongInt ;
    Local : LongInt ;
{$ENDIF}
Begin
{$IFDEF USAR_CHYRON}
_Debug ( 'INI PROC LOAD_IMAGES' ) ;
Qtde := Length ( Reg_Load_Image ) ;
If Qtde <= 0 Then Begin
   _Debug ( 'Exit 1 PROC LOAD_IMAGES' ) ;
   Exit ;
End ;
Try
   For Local := 0 To Qtde - 1 Do Begin
      If Local >= Length ( Reg_Load_Image ) Then Begin
         PUT_LOG ( 'Break/1 PROC LOAD_IMAGES' ) ;
         Break ;
      End ;
      LOAD_IMAGE ( 'TCCH PROC LOAD_IMAGES',
                   INCLUIR_NAME_FALSE,
                   Reg_Load_Image[Local]._Dir1,
                   Reg_Load_Image[Local]._Dir2,
                   Reg_Load_Image[Local]._Dir3,
                   Reg_Load_Image[Local]._IM,
                   ExtractFileName ( Reg_Load_Image[Local]._FN ) ) ;
   End ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception PROC LOAD_IMAGES [' + E.Message + ']' ) ;
   End ;
End ;
SetLength ( Reg_Load_Image, 0 ) ;
_Debug ( 'FIM PROC LOAD_IMAGES' ) ;
{$ENDIF}
End ;

Procedure TCCH.CCH_PROC_CONVERTER_GC2_PARA_CONTROLE_CHYRON ( Modo : LongInt ; // 1-CCH 2-Comparativo
                                                             Registro : T_Clip_Retranca ) ;
{$IFDEF USAR_CHYRON}
Var Lista      : TStringList ;
    Local      : LongInt ;
    Qtde       : LongInt ;
    Qtde2      : LongInt ;
    Cmd        : String ;
    Params     : TStringList ;
    Obs        : String ;
    Indice     : LongInt ;
    _Size      : LongInt ;
    Aux        : String ;
    Passo      : LongInt ;
    Livre      : Boolean ;
    Save_Vert  : LongInt ;
{$ENDIF}
Begin
{$IFDEF USAR_CHYRON}
Passo := 1 ;
Save_Vert := Main.SB_Controle_Chyron.VertScrollBar.Position ;
Try
   Passo := 2 ;
   _Debug ( 'INI CCH PROC_CONVERTER_GC2_PARA_CONTROLE_CHYRON' ) ;
   Params := TStringList.Create ;
   Lista := TStringList.Create ;
   If Modo = 1 Then Begin
      Lista.Text := Trim ( RD.RD_KERNEL_GET_GC2 ( Registro.Retranca ) ) ;
   End Else If Modo = 2 Then Begin
      Lista.Text := Trim ( RD.RD_KERNEL_GET_GC2_AUTO ( Registro.Retranca ) ) ;
   End ;
   Qtde := Lista.Count ;
   Cmd := '' ;
   Obs := '' ;
   Indice := 0 ;
   Passo := 3 ;
   If Assigned ( Task_Load_Image ) Then Begin
      If Task_Load_Image.Status = TTaskStatus.Running Then Begin
         Task_Load_Image.Cancel ;
      End ;
   End ;
   Passo := 4 ;
   _Size := Length ( CCH_Celulas ) ;
   SetLength ( Reg_Load_Image, 0 ) ;
   If Modo = 1 Then Begin
      If _Size > 0 Then Begin
         For Local := 0 To _Size - 1 Do Begin
             CCH_Celulas[Local].PN_Right.Visible := FALSE ;
             If CCH_Celulas[Local].IM_SELO_CCH.Hint <> '' Then Begin
                LOAD_IMAGE ( 'CCH PROC_CONVERTER_GC2_PARA_CONTROLE_CHYRON',
                             INCLUIR_NAME_FALSE,
                             '', '', '', CCH_Celulas[Local].IM_SELO_CCH, '' ) ;
             End ;
         End ;
      End ;
   End ;
   Passo := 5 ;
   Params.Clear ;
   Obs := '' ;
   Livre := FALSE ;
   For Local := 0 To Qtde - 1 Do Begin
      Aux :=  Trim ( Lista[Local] ) ;
      If Pos ( '<META>', Aux ) = 1 Then Begin
         If Pos ( '<META>LIVRE=1', Aux ) = 1 Then Begin
            Livre := TRUE ;
         End ;
         Continue ;
      End ;
      If Aux = '' Then Begin
         If Cmd <> '' Then Begin
            CCH_PROC_PUT_CELULA_CHYRON ( Modo, Registro, Indice, Cmd, Params, Obs, Livre ) ;
            Livre := FALSE ;
            Inc ( Indice ) ;
            Cmd := Aux ;
            Params.Clear ;
            Obs := '' ;
         End ;
         Continue ;
      End ;
      If Aux[1] = '#' Then Begin
         If Cmd <> '' Then Begin
            CCH_PROC_PUT_CELULA_CHYRON ( Modo, Registro, Indice, Cmd, Params, Obs, Livre ) ;
            Livre := FALSE ;
            Inc ( Indice ) ;
         End ;
         Cmd := Aux ;
         Params.Clear ;
         Obs := '' ;
         Continue ;
      End ;
      If Aux[1] = '@' Then Begin
         Obs := Trim ( Aux ) ;
         Continue ;
      End ;
      Params.Add ( Aux ) ;
   End ;
   Passo := 6 ;
   If Cmd <> '' Then Begin
      CCH_PROC_PUT_CELULA_CHYRON ( Modo, Registro, Indice, Cmd, Params, Obs, Livre ) ;
      Livre := FALSE ;
      Inc ( Indice ) ;
   End ;
   If Modo = 1 Then Begin
      CCH_LIMPAR_CONTROLE ( Indice, DEF_CCH_MAX - 1 ) ;
      CCH_VAR_SB.VertScrollBar.Position := 0 ;
      CCH_VAR_SB.Invalidate ;
      CCH_VAR_SB.Repaint ;
   End ;
   Passo := 7 ;
   Params.Free ;
   Lista.Free ;
   Passo := 8 ;
   If Modo = 1 Then Begin
      Qtde2 := Length ( Reg_Load_Image ) ;
      If Qtde2 > 0 Then Begin
         PROC_LOAD_IMAGES ;
      End ;
   End ;
   Passo := 9 ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception CCH PROC_CONVERTER_GC2_PARA_CONTROLE_CHYRON ' +
                'Passo[' + IntToStr(Passo) + ']' +
                '[' + E.Message + ']' ) ;
   End ;
End ;
Main.SB_Controle_Chyron.VertScrollBar.Position := Save_Vert ;
_Debug ( 'FIM CCH PROC_CONVERTER_GC2_PARA_CONTROLE_CHYRON' ) ;
{$ENDIF}
End ;

Function TCCH.CCH_GET_COR_ELEMENTO ( Msg : LongInt ) : T_Color2 ;
Begin
{$IFDEF USAR_CHYRON}
_Debug ( 'INI CCH_GET_COR_ELEMENTO' ) ;
Case Msg Of
   DEF_MSG_CHYRON_GC            : Begin
                                  Result.Back := clLime ;
                                  Result.Font := clBlack ;
                                  End ;
   DEF_MSG_CHYRON_APRESENTADOR  : Begin
                                  Result.Back := clAqua ;
                                  Result.Font := clBlack ;
                                  End ;
   DEF_MSG_CHYRON_FIXA          : Begin
                                  Result.Back := clFuchsia ;
                                  Result.Font := clBlack ;
                                  End ;
   DEF_MSG_CHYRON_MANCHETE      : Begin
                                  Result.Back := clGreen ;
                                  Result.Font := clYellow ;
                                  End ;
   DEF_MSG_CHYRON_A_SEGUIR      : Begin
                                  Result.Back := clAqua ;
                                  Result.Font := clBlack ;
                                  End ;
   DEF_MSG_CHYRON_INFORMACAO_1  : Begin
                                  Result.Back := clAqua ;
                                  Result.Font := clBlack ;
                                  End ;
   DEF_MSG_CHYRON_INFORMACAO_2  : Begin
                                  Result.Back := clAqua ;
                                  Result.Font := clBlack ;
                                  End ;
   DEF_MSG_CHYRON_INFORMACAO_3  : Begin
                                  Result.Back := clAqua ;
                                  Result.Font := clBlack ;
                                  End ;
   DEF_MSG_CHYRON_IMAGENS_1     : Begin
                                  Result.Back := clYellow ;
                                  Result.Font := clBlack ;
                                  End ;
   DEF_MSG_CHYRON_IMAGENS_2     : Begin
                                  Result.Back := clYellow ;
                                  Result.Font := clBlack ;
                                  End ;
   DEF_MSG_CHYRON_IMAGENS_3     : Begin
                                  Result.Back := clYellow ;
                                  Result.Font := clBlack ;
                                  End ;
   DEF_MSG_CHYRON_EDICAO_1      : Begin
                                  Result.Back := clYellow ;
                                  Result.Font := clBlack ;
                                  End ;
   DEF_MSG_CHYRON_EDICAO_2      : Begin
                                  Result.Back := clYellow ;
                                  Result.Font := clBlack ;
                                  End ;
   DEF_MSG_CHYRON_EDICAO_3      : Begin
                                  Result.Back := clYellow ;
                                  Result.Font := clBlack ;
                                  End ;
   DEF_MSG_CHYRON_G1            : Begin
                                  Result.Back := clAqua ;
                                  Result.Font := clBlack ;
                                  End ;
   DEF_MSG_CHYRON_WHATSAPP      : Begin
                                  Result.Back := clAqua ;
                                  Result.Font := clBlack ;
                                  End ;
   DEF_MSG_CHYRON_TELESPECTADOR : Begin
                                  Result.Back := clAqua ;
                                  Result.Font := clBlack ;
                                  End ;
   DEF_MSG_CHYRON_EMAIL         : Begin
                                  Result.Back := clAqua ;
                                  Result.Font := clBlack ;
                                  End ;
   DEF_MSG_CHYRON_TELEFONE      : Begin
                                  Result.Back := clAqua ;
                                  Result.Font := clBlack ;
                                  End ;
   DEF_MSG_CHYRON_CAMERA        : Begin
                                  Result.Back := clAqua ;
                                  Result.Font := clBlack ;
                                  End ;
   DEF_MSG_CHYRON_TEMPERATURA   : Begin
                                  Result.Back := clAqua ;
                                  Result.Font := clBlack ;
                                  End ;
   DEF_MSG_CHYRON_COMENTARIO    : Begin
                                  Result.Back := clRed ;
                                  Result.Font := clWhite ;
                                  End ;
   DEF_MSG_CHYRON_INDEF         : Begin
                                  Result.Back := clRed ;
                                  Result.Font := clYellow ;
                                  End ;
   Else
                                  Begin
                                  Result.Back := clRed ;
                                  Result.Font := clYellow ;
                                  End ;
   End ;
_Debug ( 'FIM CCH_GET_COR_ELEMENTO' ) ;
{$ENDIF}
End ;

Procedure TCCH.Bot_Subir_Click ( Sender : TObject ) ;
Var _Tag  : LongInt ;
Begin
_Tag := (Sender As TButton).Tag ;
If ( _Tag <= 0 ) OR ( _Tag >= DEF_CCH_MAX ) Then Begin
   Exit ;
End ;
INTERCAMBIAR_CCH ( _Tag, _Tag-1 ) ;
SALVAR_CONTEUDO_CCH ( 'CCH_Bot Subir', 0 ) ;
//RD.RD_MESMA_RETRANCA ;
//TROCAR_CELULA_CCH ( 1, _Tag, _Tag - 1 ) ;
End ;

Procedure TCCH.Bot_Descer_Click ( Sender : TObject ) ;
Var _Tag  : LongInt ;
Begin
_Tag := (Sender As TButton).Tag ;
If ( _Tag < 0 ) OR ( _Tag >= DEF_CCH_MAX ) Then Begin
   Exit ;
End ;
INTERCAMBIAR_CCH ( _Tag, _Tag+1 ) ;
SALVAR_CONTEUDO_CCH ( 'CCH_Bot Descer', 0 ) ;
//RD.RD_MESMA_RETRANCA ;
//TROCAR_CELULA_CCH ( 1, _Tag, _Tag + 1 ) ;
End ;

End.

