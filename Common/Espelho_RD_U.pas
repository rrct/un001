Unit Espelho_RD_U ;

Interface

Uses Misc_Def_U, Misc_Const_U, Misc_Type_U,
     Espelho_RD_Def_U,
     Lauda_Info_U,
     Transparentes_U,
     Carregando_Form_U,
     //RxCtrls,
     MyRichEdit_U,
     Math, IniFiles, ClipBrd,
     Misc_U, Log_U, View_ME_U,
     Winapi.Windows, pngImage,
     System.Threading,
     System.SysUtils, System.Variants, System.Types,
     System.Classes, Vcl.Controls,
     Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Samples.Spin, Vcl.Forms, Vcl.Menus,
     Vcl.Grids, Vcl.Dialogs, Vcl.Graphics, Vcl.ExtCtrls, Vcl.Mask ;

Type
   TEspelho_RD = class(Vcl.StdCtrls.TLabel)
   Private
   Public
     Var RD_VAR_SL_USUARIOS                  : TStringList ;
         RD_VAR_SL_DICIONARIO_ATALHOS        : TStringList ;
         RD_VAR_SL_STR_ADD                   : TStringList ;
         RD_VAR_LAST_RETRANCA_SEND_GC        : String ;
         RD_VAR_FN_PREVIEW_IMAGE             : String ;
         RD_VAR_FLAG_MANTER_FOCO             : Boolean ;
         RD_VAR_TICK_SINCRONIZAR_JORNAL_LOCAL : Cardinal ;
         RD_VAR_SL_SINCRONIZAR_JORNAL_LOCAL   : TStringList ;
         RD_VAR_SL_CAMERAS_TRANSITO_RECEBIDAS : TStringList ;
         RD_VAR_SL_IPS_CAMERAS_DE_TRANSITO    : TStringList ;
         RD_VAR_FLAG_GRITO_DETECTADO         : Boolean ;
         RD_VAR_FLAG_POS_ABRIR_ESPELHO       : Boolean ;
         RD_FLAG_PASTA_SELOS_MODIFICADA      : Cardinal ;
         RD_VAR_EDIT_AGENDADO                : String ;
         RD_VAR_TICK_CRONOMETRO_VT           : Cardinal ;
         RD_VAR_DESTINO_JORNAL               : String ;
         RD_VAR_TICK_NEXT_EDITOR_AUTO        : Cardinal ;
         RD_VAR_TAG_NEXT_EDITOR_AUTO         : LongInt ;
         RD_VAR_SENDER_NEXT_EDITOR_AUTO      : TMemo ;
         RD_VAR_LAST_CARREGAR_DICIONARIO     : Cardinal ;
         RD_VAR_DESTINO_DATA                 : TDateTime ;
         RD_VAR_FLAG_RELOAD_SELOS_FIXOS      : Boolean ;
         RD_VAR_FLAG_RELOAD_SELOS_DIARIOS    : Boolean ;
         RD_VAR_FLAG_RELOAD_SELOS_OUTROS     : Boolean ;
         RD_VAR_FN_ARTE_SELECIONADA          : String ;
         RD_VAR_FLAG_BANCO_MODIFICADO        : Boolean ;
         RD_VAR_INICIALIZAR_JORNAL_CHYRON    : Boolean ;
         RD_VAR_CARREGAR_SELO_ESPORTE        : Boolean ;
         RD_VAR_FLAG_CAMERA_MODIFICADA       : Boolean ;
         RD_VAR_FLAG_APRESENTADOR_MODIFICADO : Boolean ;
         RD_VAR_FLAG_REPORTER_MODIFICADO     : Boolean ;
         RD_VAR_REG_TASK_SG_CLICK            : T_Task_SG_Click ;
         RD_VAR_REG_TASK_SG_DBLCLICK         : T_Task_SG_DblClick ;
         RD_VAR_TASK_SG_CLICK                : ITask ;
         RD_VAR_TASK_PREVIEW_IMAGE           : ITask ;
         RD_VAR_SL_SELOS_FIXOS               : TStringList ;
         RD_VAR_SL_SELOS_DIARIOS             : TStringList ;
         RD_VAR_SL_SELOS_OUTROS              : TStringList ;
         RD_VAR_TASK_SYNC_LIMPAR             : Boolean ;
         RD_VAR_TASK_SYNC_MODO_THREAD        : Boolean ;
         RD_VAR_SYNC_JORNAL_MASCARA          : String ;
         RD_VAR_LAST_GC_ATUALIZADO           : TStringList ;
         RD_VAR_SL_TIPOS_ARTES               : TStringList ;
         RD_VAR_IGNONE_CLICK_SG              : Boolean ;
         RD_VAR_TICK_ATUALIZAR_GC            : Cardinal ;
         RD_VAR_TASK_SYNC_JORNAL             : iTask ;
         RD_VAR_CLIPBOARD_GC                 : String ;
         RD_VAR_CNT_VK__ESCAPE               : LongInt ;
         RD_VAR_TICK_VK__ESCAPE              : Cardinal ;
         RD_VAR_FLAG_RELOGIO_DICIONARIO      : Boolean ;
         RD_VAR_TICK_FLAG_CAMERA_TRANSITO    : Cardinal ;
         RD_VAR_FN_FLAG_CAMERA_TRANSITO      : String ;
         RD_VAR_PREVISAO_FADE_JORNAL         : TDateTime ;
         RD_VAR_PREVISAO_PRODUCAO_JORNAL     : TDateTime ;
         RD_VAR_PROCESSAR_CHYRON             : Boolean ;
         RD_SG_CLICK_MODO_FORCADO            : Boolean ;
         RD_VAR_FLAG_CARREGAR_BUFFER_IMG     : Boolean ;
         RD_VAR_EXTENSOES                    : TStringList ;
         RD_VAR_FORM_LAUDAS                  : TForm ;
         RD_VAR_FORM_SELECAO_VG              : TForm ;
         RD_VAR_SERIAL_PORT                  : LongInt ;
         RD_VAR_SERIAL_BAUDRATE              : LongInt ;
         RD_VAR_PERIODO_REBOOT               : LongInt ;
         RD_VAR_SHOWHINT                     : Boolean ;
         RD_VAR_REG_SELECAO_VIDEOGRAFISMO    : LongInt ;
         RD_VAR_ARTE_SELECIONADA             : LongInt ;
         RD_VAR_MODO_RELOGIO_TEMPERATURA     : Boolean ;
         RD_VAR_INDICE_RELOGIO_TEMPERATURA   : LongInt ;
         RD_VAR_QTDE_RELOGIO_TEMPERATURA     : LongInt ;

         RD_VAR_SERVIDOR                     : String ;
         RD_VAR_ESPELHO_ATUAL                : T_Espelho ;
         RD_VAR_POINT_POPUPMENU_MAIN_SG      : TPoint ;
         RD_VAR_FLAG_REPAINT_SG              : LongInt ;
         RD_VAR_Next_CCH_PNLB_OnClick        : Cardinal ;
         RD_VAR_SL_POSICOES_CCH              : TStringList ;

         RD_VAR_RETRANCA_FIM                 : LongInt ;
         RD_VAR_Last_GC_Fixa_Cmd             : LongInt ;
         RD_VAR_Last_GC_Fixa_L1              : String ;
         RD_VAR_Last_GC_Fixa_L2              : String ;
         RD_VAR_Last_GC_Fixa_Lauda           : String ;
         RD_VAR_Last_GC_Fixa_Retranca        : String ;
         RD_VAR_INDICE_GC_GO2                : LongInt ;
         RD_VAR_QTDE_SG                      : LongInt ;
         RD_VAR_CCH_SELECIONADO_TOP          : LongInt ;
         RD_VAR_ARRAY_SG                     : Array Of T_SG ;
         RD_VAR_QTDE_SG_AUX                  : LongInt ;
         RD_VAR_ARRAY_SG_AUX                 : Array Of T_SG ;
         RD_VAR_QTDE_RE                      : LongInt ;
         RD_VAR_ARRAY_RE                     : Array Of T_RE ;
         RD_VAR_QTDE_RE_MY                   : LongInt ;
         RD_VAR_ARRAY_RE_MY                  : Array Of T_RE_MY ;
         RD_VAR_QTDE_RE_GC                   : LongInt ;
         RD_VAR_ARRAY_RE_GC                  : Array Of T_RE_GC ;
         RD_VAR_QTDE_RE_MY_GC                : LongInt ;
         RD_VAR_ARRAY_RE_MY_GC               : Array Of T_RE_GC_MY ;
         RD_VAR_QTDE_RE_MY_GC2               : LongInt ;
         RD_VAR_ARRAY_RE_MY_GC2              : Array Of T_RE_GC_MY ;
         RD_VAR_QTDE_RE_MY_GC2_AUTO          : LongInt ;
         RD_VAR_ARRAY_RE_MY_GC2_AUTO         : Array Of T_RE_GC_MY ;
         RD_VAR_QTDE_RE_CC                   : LongInt ;
         RD_VAR_ARRAY_RE_CC                  : Array Of T_RE_CC ;
         RD_VAR_ARRAY_TEMPERATURAS           : Array Of T_Temperaturas ;
         RD_VAR_QTDE_RE_OFF                  : LongInt ;
         RD_VAR_QTDE_PN_RET                  : LongInt ;
         RD_VAR_ARRAY_PN_RET2                : Array Of T_PN_RET ;
         RD_VAR_QTDE_PN_RET_NEXT             : LongInt ;
         RD_VAR_ARRAY_PN_RET_NEXT            : Array Of T_PN_RET ;
         RD_VAR_QTDE_PN_WAIT                 : LongInt ;
         RD_VAR_ARRAY_PN_WAIT                : Array Of T_PN_WAIT ;
         RD_VAR_QTDE_LB_TEMPO_TT             : LongInt ;
         RD_VAR_ARRAY_LB_TEMPO_TT            : Array Of T_LB_TEMPO ;
         RD_VAR_QTDE_LB_TEMPO_BREAK          : LongInt ;
         RD_VAR_ARRAY_LB_TEMPO_BREAK         : Array Of T_LB_TEMPO ;
         RD_VAR_QTDE_LB_RESTANTE             : LongInt ;
         RD_VAR_ARRAY_LB_RESTANTE            : Array Of T_LB_TEMPO ;
         RD_VAR_QTDE_LB_TEMPO_PRODUCAO       : LongInt ;
         RD_VAR_ARRAY_LB_TEMPO_PRODUCAO      : Array Of T_LB_TEMPO ;
         RD_VAR_QTDE_CB_ANCORAS              : LongInt ;
         RD_VAR_ARRAY_CB_ANCORAS             : Array Of T_CB_ANCORAS ;
         RD_VAR_ARRAY_RE_OFF                 : Array Of T_RE_OFF;
         RD_VAR_QTDE_RETRANCAS               : LongInt ;
         RD_VAR_ARRAY_RETRANCAS              : Array Of T_Clip_Retranca ;
         RD_VAR_QTDE_RETRANCAS_SAVE          : LongInt ;
         RD_VAR_ARRAY_RETRANCAS_SAVE         : Array Of T_Clip_Retranca ;
         RD_VAR_QTDE_RETRANCAS_AUX           : LongInt ;
         RD_VAR_ARRAY_RETRANCAS_AUX          : Array Of T_Clip_Retranca ;
         RD_VAR_QTDE_ANCORAS                 : LongInt ;
         RD_VAR_ARRAY_ANCORAS                : Array Of T_Ancora ;
         RD_VAR_MEMO                         : TMemo ;
         RD_VAR_TEMPO_TT                     : LongInt ;
         RD_VAR_TEMPO_BREAK                  : LongInt ;
         RD_VAR_TEMPO_PRODUCAO               : LongInt ;
         RD_VAR_RESTANTE_TT                  : LongInt ;
         RD_VAR_RESTANTE_BREAK               : LongInt ;
         RD_VAR_RESTANTE_PRODUCAO            : LongInt ;
         RD_VAR_ESPELHO_ABERTO_AGE           : TDateTime ;
         RD_VAR_ESPELHO_ABERTO_AGE_NEW       : TDateTime ;
         RD_VAR_TEMPO_RESTANTE_STR           : String ;
         RD_VAR_LOG                          : TStringList ;
         RD_VAR_LB_LOG                       : TListBox ;
         RD_VAR_SL_ANCORAS                   : TStringList ;
         RD_VAR_QTDE_RETRANCAS_RESERVADAS    : LongInt ;
         RD_VAR_RETRANCAS_RESERVADAS         : TStringList ;
         RD_VAR_QTDE_REG_LAUDAS              : LongInt ;
         RD_VAR_SECAO                        : T_REG_LAUDA ;
         RD_VAR_RNEWS                        : T_LAUDA_RNEWS ;
         RD_VAR_QTDE_IMAGENS_TARJAS          : LongInt ;
         RD_VAR_INDICE_BANCO_MSG             : Array [1..RD_MAX_MESSAGE] Of Byte ;
         RD_VAR_LAUDA_INFO                   : LongInt ;
         RD_LAST_BOT_MENU                    : LongInt ;
         RD_COR_JORNAL                       : Array [ 1 .. RD_MAX_JORNAIS ] Of TColor ;
         RD_VAR_TEMPOS                       : T_RD_TEMPOS ;
         RD_VAR_SUPER_MEMO                   : TMemo ;
         RD_VAR_QTDE_BUFFER_IMG              : LongInt ;
         RD_VAR_BUFFER_IMG                   : Array Of T_BUFFER_IMG ;
         RD_VAR_FLAG_NAO_ATUALIZAR_ED_GC     : Boolean ;
         RD_VAR_EDITOR_LAUDA_FN_TXT          : String ;
         RD_VAR_EDITOR_LAUDA_TXT             : String ;
         RD_VAR_RASCUNHO                     : String ;
         RD_VAR_RETORNO_SELETOR              : String ;
         RD_VAR_RE_MODO_TEXTO                : TMyRichEdit ;
         RD_VAR_RE_MODO_TEXTO_GC             : TMyRichEdit ;
         SL_Tarjas_Bancos_Abas               : TStringList ;
         RD_VAR_FLAG_AUTO_SAVE               : Boolean ;
         RD_VAR_FILENAME_REN                 : String ;

Constructor Create ( Dono : TComponent ;
                     Servidor : String ;
                     ME : TMemo ;
                     Form_Laudas : TForm ;
                     Form_Banco_Tarjas : TForm ;
                     //PN_Selecao_Videografismo : TPanel ;
                     //SB_Laudas : TScrollBox ;
                     RE_Modo_Texto : TMyRichEdit ;
                     RE_Modo_Texto_GC : TMyRichEdit ;
                     PM_Secoes : TPopupMenu ) ;
Procedure RD_COMPARAR_E_SALVAR_ATUALIZACOES_GC ( SG : TStringGrid ; LB : TListBox ) ;
Procedure RD_REGISTRAR_DT_GC ( _Retranca : String ; DT : TDateTime ) ;
Function  RD_VAR_GET_FN_HTML_CORRETOR  : String ;
Function  RD_GET_FN_VOTACAO_POPULAR : String ;
Procedure RD_CRIAR_FN_BROWSERS ;
Procedure RD_LOAD_BROWSERS ( LB : TListBox ) ;
Procedure RD_LOAD_DIRETORIOS_MESSAGES ( LB : TListBox ) ;
Function RD_GET_FN_DIRETORIOS_MESSAGES : String ;
Procedure RD_CRIAR_FN_DIRETORIOS_MESSAGES ;
Function  RD_GET_FN_BROWSERS : String ;
Function  RD_GET_FN_HISTORICO_ESPELHOS : String ;
Function  RD_GET_FN_DICIONARIO_ATALHOS : String ;
Function  RD_GET_FN_TIPOS_ARTES : String ;
procedure SG_Click2(Sender: TObject);
Procedure RD_ADD_SG ( Buffer : LongInt ; Var SG : TStringGrid ; Tipo : LongInt ;
                      Controlador, Controlado, Main : Boolean ;
                      Reload_Editor_Lauda : Boolean ; Controles_Ativados : Boolean ) ;
Procedure RD_ADD_SG_AUX ( Buffer : LongInt ; Var SG : TStringGrid ; Tipo : LongInt ;
                          Controlador, Controlado, Main : Boolean ;
                          Reload_Editor_Lauda : Boolean ) ;
Procedure RD_ADD_RE ( Var RE : TRichEdit ) ;
Procedure RD_ADD_RE_MY ( Var RE : TMyRichEdit ) ;
Procedure RD_ADD_RE_GC ( Var RE : TRichEdit ) ;
Procedure RD_ADD_RE_MY_GC ( Var RE : TMyRichEdit ) ;
Procedure RD_ADD_RE_MY_GC2 ( Var RE : TMyRichEdit ) ;
Procedure RD_ADD_RE_MY_GC2_AUTO ( Var RE : TMyRichEdit ) ;
Procedure RD_ADD_RE_CC ( Var RE : TRichEdit ) ;
Procedure RD_ADD_RE_OFF ( Var RE : TRichEdit ) ;
Procedure RD_ADD_PN_RET ( Var PN : TPanel ) ;
Procedure RD_ADD_PN_RET_NEXT ( Var PN : TPanel ) ;
Procedure RD_ADD_PN_WAIT ( Var PN : TPanel ) ;
Procedure RD_ADD_LB_TEMPO_TT ( Var LB : TLabel ) ;
Procedure RD_ADD_LB_TEMPO_BREAK ( Var LB : TLabel ) ;
Procedure RD_ADD_CB_ANCORAS ( Var CB : TComboBox ) ;
Procedure RD_ADD_LB_TEMPO_PRODUCAO ( Var LB : TLabel ) ;
Procedure RD_ADD_LB_TEMPO_RESTANTE ( Var LB : TLabel ) ;
Procedure RD_ADD_LB_LOG ( Var LB : TListBox ) ;
Procedure RD_ADD_RETRANCA ( Reg : T_Clip_Retranca ; Buffer : LongInt ) ;
Function  RD_IS_STATUS_RETRANCA ( Status : LongInt ) : Boolean ;
Procedure RD_RESET_ESPELHO ( Origem : String ) ;
Procedure RD_RESET_ABRIR_ESPELHO ( Origem : String ; Buffer : LongInt ) ;
Function  RD_GET_PRINT_NEWS ( Indice : LongInt ) : String ;
Procedure RD_RESET_FULL ( Origem : String ) ;
Procedure RD_PRINT_LOG_ME ;
Procedure RD_LIMPAR_LOGS ;
Function  RD_GET_PRINT_RETRANCA ( Buffer : LongInt ; Idx : LongInt ) : String ;
Function  RD_GET_DUMP : String ;
Procedure PUT_HISTORICO_ESPELHOS ;
Procedure RD_INICIALIZAR_SG ( SG : TStringGrid ; Tipo : LongInt ) ;
Function  RD_IS_COMERCIAL ( _Retranca : String ) : Boolean ;
Function  RD_IS_FIM ( _Retranca : String ) : Boolean ;
Function  RD_FIND_PRIMEIRA_RETRANCA ( SG : TStringGrid ) : LongInt ;
Function  RD_FIND_ULTIMA_RETRANCA ( SG : TStringGrid ) : LongInt ;
Function  RD_GET_CELL ( Buffer : LongInt ; Linha, Coluna : LongInt ) : String ;
Procedure RD_RECALC ( CB : TComboBox ; DT : TDateTime ) ;
Procedure RD_SG_MOUSE_MOVE ( Sender: TObject; Shift: TShiftState; X, Y: Integer);
Procedure RD_SELECT_SG_ROW ( SG : TStringGrid ; Linha : LongInt ; Recarregar : Boolean ) ;
Procedure RD_POSICIONAR_PRIMEIRA_RETRANCA_NO_ESPELHO ( SG : TStringGrid ) ;
Procedure RD_POSICIONAR_ULTIMA_RETRANCA_NO_ESPELHO ( SG : TStringGrid ) ;
Procedure RD_BOT_MENU_MOUSEMOVE ( Sender: TObject; Shift: TShiftState; X, Y: Integer) ;
procedure RD_BOT_MENU_MOUSEENTER (Sender: TObject) ;
procedure RD_BOT_MENU_MOUSELEAVE (Sender: TObject) ;
Procedure RD_SG_DRAW_ESPELHO ( Sender : TObject; ACol, ARow: Integer; Rect: TRect ;
                               State: TGridDrawState);
Procedure RD_MONTAR_RE ( RE : TRichEdit ) ;
Procedure RD_MONTAR_RE_MY ( RE : TMyRichEdit ) ;
Procedure RD_MONTAR_RE_GC ( RE : TRichEdit ) ;
Procedure RD_MONTAR_RE_MY_GC ( RE : TMyRichEdit ) ;
Procedure RD_MONTAR_RE_MY_GC2 ( RE : TMyRichEdit ) ;
Procedure RD_MONTAR_RE_MY_GC2_AUTO ( RE : TMyRichEdit ) ;
Procedure RD_PN_WAIT ( _Msg : String ) ;
//Procedure RD_LOAD_ARQUIVOS_LAUDA ( Origem : String ; Var Registro : T_Clip_Retranca ) ;
Procedure RD_ATUALIZAR_SEL_RETRANCA ( Origem : String ;
                                      Registro, Registro_Next : T_Clip_Retranca ) ;
Procedure RD_BOT_OBS_CLICK (Sender: TObject) ;
Procedure RD_BOT_CTRL_OBS_CLICK (Sender: TObject) ;
Procedure RD_BOT_PLAY_CLICK (Sender: TObject) ;
Procedure RD_BOT_REMOVE_CLICK (Sender: TObject) ;
Procedure RD_BOT_FIXA_CLICK (Sender: TObject) ;
Function  RD_RETRANCA_EXISTE_NO_ESPELHO ( Buffer : LongInt ; Retranca : String ;
                                          Var Temp : T_Clip_Retranca ) : LongInt ;
Procedure RD_EXPANDIR_CLICK_PARA_SGS_CONTROLADOS ( _Row : LongInt ) ;
Procedure RD_FORCE_LOAD_SAVE_ESPELHO ;
Procedure RD_EXECUTE_SG_CLICK ;
Procedure RD_SG_CLICK ( Sender: TObject ) ;
Function  RD_IS_LINHA_ESPECIAL ( Retranca : String ) : Boolean ;
Procedure RD_RENUMERAR_RETRANCAS ( Origem : String ; Buffer : LongInt ) ;
Function  RD_Retranca_Protegida ( Buffer : LongInt ; Linha : LongInt ) : Boolean ;
Function  RD_MONTAR_NOME_JORNAL : String ;
Function  RD_GET_DIR_DATABASE : String ;
Function  RD_FN_BOT_ATALHOS : String ;
Function  RD_GET_FN_TIPOS_GC : String ;
Function  RD_GET_FN_TIPOS_LAUDAS : String ;
Function  RD_GET_DIR_DATABASE_CONFIG : String ;
Function  RD_GET_DIR_VIDEOGRAFISMO_SEQUENCIAS : String ;
Function  RD_GET_DIR_VIDEOGRAFISMO_TIMES : String ;
Function  RD_GET_DIR_VIDEOGRAFISMO_SEQ_ESCUDO_ANIMADO_MONOCOLOR_RAIOS : String ;
Function  RD_GET_DIR_VIDEOGRAFISMO_SEQ_ESCUDO_ANIMADO_BICOLOR_RAIOS : String ;
Function  RD_GET_DIR_VIDEOGRAFISMO_SEQ_ESCUDO_ANIMADO_TRICOLOR_RAIOS : String ;
Function  RD_GET_DIR_VIDEOGRAFISMO_SEQ_ESCUDO_ANIMADO_BASE : String ;
Function  RD_GET_DIR_VIDEOGRAFISMO_RAIOS_MOV : String ;
Function  RD_GET_FN_VIDEOGRAFISMO_RAIOS_BASE : String ;
Function  RD_GET_DIR_CAMPEONATOS : String ;
Function  RD_GET_DIR_JORNAIS : String ;
Function  RD_GET_DIR_ARTES : String ;
Function  RD_GET_DIR_DATABASE_CONFIG_TARJAS_PERFIS : String ;
Function  RD_GET_DIR_JORNAL_CURTO : String ;
Function  RD_GET_DIR_ARTES_TEMPLATES : String ;
Function  RD_GET_DIR_ARTES_MOUNT ( Jornal : String ) : String ;
Function  RD_GET_DIR_ARTES_BASES_MOUNT ( Jornal : String ) : String ;
Function  RD_GET_DIR_ARTES_CAMPEONATOS_MOUNT ( Jornal : String ) : String ;
Function  RD_GET_DIR_ARTES_ESCUDOS_MOUNT ( Jornal : String ) : String ;
Function  RD_GET_DIR_ARTES_TIMES : String ;
Function  RD_GET_DIR_ARTES_TIMES_TIME ( _Time : String ) : String ;
Function  RD_GET_DIR_ARTES_TIMES_TIME_FOTOS ( _Time : String ) : String ;
Function  RD_GET_DIR_ARTES_BASES : String ;
Function  RD_GET_FN_SCREEN_SAVER : String ;
Function  RD_GET_DIR_ARTES_CAMPEONATOS : String ;
Function  RD_GET_DIR_ARTES_ESCUDOS : String ;
Function  RD_GET_DIR_JORNAL_SELOS : String ;
Function  RD_GET_DIR_JORNAL_DATA_ARTES : String ;
Function  RD_GET_DIR_JORNAL_SELO_NEUTRO : String ;
Function  RD_GET_FN_BANCO_TARJAS : String ;
Function  RD_GET_FN_BANCO_CAMERAS : String ;
Function  RD_GET_FN_BANCO_APRESENTADORES : String ;
Function  RD_GET_FN_BANCO_REPORTERES : String ;
Function  RD_GET_DIR_JORNAL_DATA : String ;
//Function  RD_GET_DIR_JORNAL_DATA_LOCAL : String ;
Function  RD_GET_DIR_JORNAL_BACKUP_RETRANCAS_EXCLUIDAS : String ;
Function  RD_GET_DIR_JORNAL_BACKUP : String ;
Function  RD_GET_DATA_CURTA : String ;
Function  RD_GET_DATA_CURTA_2 ( DT : TDateTime ) : String ;
Procedure RD_CRIAR_JORNAL ( Origem : String ) ;
Procedure RD_SETAR_PARAMETROS_ESPELHO ( Origem : String ) ;
Function  RD_FN_ULTIMO_ESPELHO_ABERTO : String ;
Procedure RD_REGISTRAR_ULTIMO_ESPELHO_ABERTO ( Origem : String ) ;
Procedure RD_CARREGAR_ULTIMO_ESPELHO_ABERTO ( Var Jornal : String ; Var DT : TDateTime ) ;
Procedure RD_CALCULAR_LISTA_SIMPLIFICADA ( Espelho : String ) ;
Procedure RD_ABRIR_ESPELHO ( Origem : String ; Preservar_Contexto : Boolean ;
                             CB : TComboBox ; DT : TDateTime ) ;
Function  RD_ESPELHO_EXISTE ( _Jornal : String ; _DT : TDateTime ) : Boolean ;
Procedure RD_PLOTAR_LB_TEMPOS ;
Procedure RD_MONTAR_SG ( Origem : String ; Buffer : LongInt ; Reg_SG : T_SG ;
                         Linha : LongInt ; Open_Video : Boolean ) ;
Procedure RD_TOTALIZAR_ESPELHO ( Origem : String ) ;
Procedure RD_TOTALIZAR_ESPELHO_RESTANTE ( Origem : String ; Retranca_Inicial : LongInt ) ;
Procedure RD_VERIFICAR_STATUS_RETRANCAS ( Buffer : LongInt ) ;
Procedure RD_DECOMPOR_E_MONTAR_ARRAY_ESPELHO ( Origem : String ;
                                               Buffer : LongInt ; Flags : String ) ;
Procedure RD_MONTAR_TODOS_SGS ( Origem : String ; Buffer, Linha : LongInt ;
                                Open_Video : Boolean ) ;
Procedure RD_REPAINT_SGS ( Origem : String ; Buffer : LongInt ) ;
Function  RD_GET_BUFFER_DO_SG ( SG : TStringGrid ) : LongInt ;
Procedure RD_SG_MOUSE_DOWN ( Sender: TObject; Button: TMouseButton ;
                             Shift: TShiftState; X, Y: Integer) ;
Procedure RD_EXEC_SG_DUPLO_CLICK (Sender: TObject) ;
Procedure RD_SG_DUPLO_CLICK (Sender: TObject) ;
Function  RD_CARREGAR_REGISTRO_RETRANCA ( Buffer : LongInt ;
                                          Indice : LongInt ) : T_Clip_Retranca ;
Procedure RD_CARREGAR_CB_ANCORAS ;
Procedure RD_CARREGAR_ANCORAS_JORNAL ( Origem : String ) ;
Procedure RD_PUT_LOG2 ( _Msg : String ) ;
Function  RD_ATUALIZAR_REGISTRO_RETRANCA ( Registro : T_Clip_Retranca ) : LongInt ;
Function  RD_GET_INDICE_RETRANCA ( Buffer : LongInt ; Retranca : String ) : LongInt ;
Procedure RD_SALVAR_ESPELHO_FULL ( Buffer : LongInt ) ;
Procedure RD_SALVAR_ESPELHO_EDITOR ;
Procedure RD_INSERIR_REGISTRO_PREVIEW ( Registro : T_Clip_Retranca ) ;
Function  RD_ATUALIZAR_REGISTRO_RETRANCA_SAVE : LongInt ;
Procedure RD_CRIAR_BACKUP_ESPELHO ( Origem : String ) ;
Function  RD_FORCAR_LENGTH ( Str : String ; _Size : LongInt ) : String ;
Procedure RD_CARREGAR_ESPELHO_AUX ( FileName : String ) ;
Procedure RD_LIMPAR_REGISTRO_RETRANCA ( Origem : String ; Var Registro : T_Clip_Retranca ) ;
Function  RD_GET_REGISTRO_POR_RETRANCA ( Buffer : LongInt ;
                                         Retranca : String ) : T_Clip_Retranca ;
Procedure RD_CRIAR_NOVA_RETRANCA ( Posicao_Destino : LongInt ) ;
Function  RD_CALC_NOVA_RETRANCA : String ;
Function  RD_EXEC_RENOMEAR_RETRANCA ( Old_Retranca, New_Retranca : String ) : Boolean ;
Procedure RD_REGISTRAR_RENAME_LAUDA ( _Old , _New : String ) ;
Procedure RD_INTERCAMBIAR_POSICOES ( Pos1, Pos2: LongInt ;
                                     Var SG : TStringGrid ; Linha : LongInt ) ;
Function  RD_ENVIAR_PARA_O_PREVIEW ( Origem : String ; Buffer : LongInt ;
                                     Registro : T_Clip_Retranca ) : LongInt ;
Function  RD_GET_RETRANCA_HEADER_PREVIEW ( Buffer : LongInt ) : LongInt ;
Function  RD_IS_RETRANCA_RESERVADA ( Retranca : String ) : Boolean ;
Function  RD_MOVER_RETRANCA ( Origem : String ;
                              Buffer, Inicio, Fim : LongInt ) : LongInt ;
Function  RD_REMOVER_RETRANCA ( Origem : String ;
                                Buffer, Indice : LongInt ) : T_Clip_Retranca ;
Function  RD_INSERIR_RETRANCA ( Origem : String ; Buffer : LongInt ;
                                Registro : T_Clip_Retranca ;
                                Indice : LongInt ) : LongInt ;
Procedure RD_CRIAR_BACKUP_RETRANCA_EXCLUIDA ( _Origem, Retranca : String ) ;
Function  RD_EXCLUIR_RETRANCA : Boolean ;
Procedure RD_SAVE_VT_RETRANCA ( Registro : T_Clip_Retranca ; FN : String ) ;
Function  RD_GET_DIR_VIDEOS : String ;
Procedure RD_CRIAR_ARVORE_JORNAL ( Origem : String ) ;
Function  RD_FN_FADE_JORNAL : String ;
Function  RD_FN_GC_LAUDAS : String ;
Procedure RD_LOAD_BMP_BUFFER_OU_FILE ( Origem : String ; _bmp : TBitMap ;
                                       _Key : String ; FN : String ) ;
Procedure RD_BOT_OPCAO_CLICK (Sender: TObject);
Procedure RD_SET_TIPO_SECAO ( Origem : String ; Reg : LongInt ;
                              Tipo : LongInt ; Reload : Boolean ) ;
Procedure RD_ADD_SECAO ( Origem : String ; Reg : LongInt ;
                         Tipo : LongInt ; Reload : Boolean ) ;
Procedure RD_REMOVER_SECAO ( Origem : String ; Secao : LongInt ; Reload : Boolean ) ;
Procedure RD_BOT_MOVE_CLICK (Sender: TObject);
Procedure RD_BOT_MOVIMENTO_CLICK (Sender: TObject);
Procedure RD_INTERCAMBIAR_SECOES ( Origem : String ; Secao1, Secao2, Foco: LongInt ;
                                   Reload : Boolean ) ;
Procedure RD_DUPLICAR_SECAO ( Origem, Destino, Foco: LongInt ; Reload : Boolean ) ;
Procedure RD_MOVER_SECAO ( _Origem : String ; Origem, Destino, Foco: LongInt ;
                           Reload : Boolean ) ;
Procedure RD_SETAR_FOCO_SECAO ( Reg: LongInt ) ;
Procedure RD_BOT_IM_GC_DBLCLICK (Sender: TObject);
Procedure RD_SELECIONAR_PN_LAUDA ( Reg, Tipo : LongInt ) ;
Procedure RD_REORDENAR_CB_OPCOES ( Reg : LongInt ) ;
Procedure RD_DEFINIR_TIPO_REGISTRO_LAUDA ( Reg, Tipo : LongInt ) ;
Procedure RD_DBLCLICK_IM_SELECAO_TARJA_VIDEOGRAFISMO (Sender: TObject);
Procedure RD_POSICIONAR_SB_INICIO ( Origem : String ) ;
Procedure RD_POSICIONAR_SB_FINAL ( Origem : String ) ;
Procedure RD_CLEAR_REG_TEMPOS ( Var Temp : T_RD_TEMPOS ) ;
Procedure RD_RECALC_TEMPOS_ESPELHO ;
Function  RD_RECALC_TEMPOS_LAUDA_RE ( RE : TMyRichEdit ) : T_RD_Tempos ;
Function  RD_CALC_TEMPO_LOCUCAO ( Texto : String ) : LongInt ;
Procedure RD_EDITOR_LAUDA_CHANGE ( Sender : TObject ) ;
Procedure RD_CLEAR_RD_SECAO_NEWS ( Reg : LongInt ) ;
Procedure RD_CARREGAR_LAUDA_DO_ARQUIVO ( Origem, FN, FN_GC : String ) ;
Procedure RD_LOAD_FORM_EDITOR_LAUDAS ( Origem : String ) ;
Procedure RD_VIEW_ME ( Origem, Aux : String ) ;
Function  RD_GET_PRINT_VIEW_LAUDA : String ;
Procedure RD_EXEC_LIMPAR_RETRANCA_RET ( Origem : String ) ;
Procedure RD_VIEW_LAUDA ( Origem : String ) ;
Function  RD_GET_FN_LAU_EDICAO : String ;
Function  RD_GET_FN_LAU_ORIGINAL : String ;
Function  RD_GET_FN_LAU_OLD : String ;
Procedure RD_CARREGAR_LAUDA ( Origem : String ; Registro : T_Clip_Retranca ) ;
Function  RD_GET_COR_JORNAL : TColor ;
Function  RD_GET_COLOR_STR ( _Str : String ) : TColor ;
Function  RD_AJUSTAR_TEXTO_LAUDA : String ;
Procedure RD_CONVERTE_LAUDA_TEXTO_EM_GRAFICA ( Salvar : Boolean ) ;
Procedure RD_CONVERTE_LAUDA_GRAFICA_EM_TEXTO ( Salvar : Boolean ) ;
Procedure RD_SALVAR_LAUDA ( RE, RE_GC : TMyRichEdit ) ;
Procedure RD_SALVAR_LAUDA_INI ;
Procedure RD_MODIFICAR_EDITS ( Origem : String ; Bordas, Transparencia : Boolean ) ;
Procedure RD_PRINT_DUMP ( Origem : String ) ;
Function  RD_GET_TIPO_STR ( Reg : LongInt ) : String ;
Procedure RD_LOAD_LAUDA_INFO ( Origem : String ; _Tag : LongInt ) ;
Procedure RD_LAUDA_INFO ( Origem : String ; _Tag : LongInt ) ;
Procedure RD_PN_ENTER (Sender: TObject);
Procedure RD_PN_EXIT (Sender: TObject);
Procedure RD_EDIT_OBS_ENTER (Sender: TObject);
Procedure RD_EDIT_OBS_EXIT (Sender: TObject);
Procedure RD_EDIT_INFO_ENTER (Sender: TObject);
Procedure RD_EDIT_INFO_EXIT (Sender: TObject);
Procedure RD_MASKEDIT_OBS_ENTER (Sender: TObject);
Procedure RD_MASKEDIT_OBS_EXIT (Sender: TObject);
Procedure RD_ME_TEXTO_ENTER (Sender: TObject);
Procedure RD_ME_TEXTO_EXIT (Sender: TObject);
Procedure RD_EDT_ENTER (Sender: TObject);
Procedure RD_EDT_EXIT (Sender: TObject);
Procedure RD_BUTTON_DragOver ( Sender, Source: TObject; X, Y: Integer;
                               State: TDragState; var Accept: Boolean);
Procedure RD_PN_DragOver ( Sender, Source: TObject; X, Y: Integer;
                           State: TDragState; var Accept: Boolean);
Procedure RD_RXCLOCK_DragOver ( Sender, Source: TObject; X, Y: Integer;
                                State: TDragState; var Accept: Boolean);
Procedure RD_IM_DragOver ( Sender, Source: TObject; X, Y: Integer;
                           State: TDragState; var Accept: Boolean);
Procedure RD_ME_DragOver ( Sender, Source: TObject; X, Y: Integer;
                           State: TDragState; var Accept: Boolean);
Procedure RD_EDT_DragOver ( Sender, Source: TObject; X, Y: Integer;
                            State: TDragState; var Accept: Boolean);
Procedure RD_EDIT_DragOver ( Sender, Source: TObject; X, Y: Integer;
                             State: TDragState; var Accept: Boolean);
Procedure RD_MASKEDIT_DragOver ( Sender, Source: TObject; X, Y: Integer;
                                 State: TDragState; var Accept: Boolean);
Procedure RD_LABEL_DragOver ( Sender, Source: TObject; X, Y: Integer;
                              State: TDragState; var Accept: Boolean);
procedure RD_BUTTON_DragDrop (Sender, Source: TObject; X, Y: Integer);
procedure RD_PN_DragDrop (Sender, Source: TObject; X, Y: Integer);
procedure RD_RXCLOCK_DragDrop (Sender, Source: TObject; X, Y: Integer);
procedure RD_IM_DragDrop (Sender, Source: TObject; X, Y: Integer);
procedure RD_ME_DragDrop (Sender, Source: TObject; X, Y: Integer);
procedure RD_EDT_DragDrop (Sender, Source: TObject; X, Y: Integer);
procedure RD_EDIT_DragDrop (Sender, Source: TObject; X, Y: Integer);
procedure RD_MASKEDIT_DragDrop (Sender, Source: TObject; X, Y: Integer);
procedure RD_LABEL_DragDrop (Sender, Source: TObject; X, Y: Integer);
Function  RD_SECAO_VALIDA ( _Tag : LongInt ) : Boolean ;
Procedure RD_TRATAR_DRAGDROP ( Tag_Origem, Tag_Destino : LongInt ) ;
Procedure RD_GET_DIRS_TARJAS ( Var Lista : TStringList ) ;
Procedure RD_GET_FN_TARJAS ( Dir : String ; Var Lista : TStringList ) ;
Procedure RD_LOAD_BUFFER_IMG ( Origem : String ) ;
Procedure RD_PRINT_BUFFER_IMG ( Origem : String ) ;
//Procedure RD_CARREGAR_GC_ALL ;
Procedure RD_CHECAR_SE_RETRANCA_GC_MODIFICADO ( _Retranca : String ; PN : TPanel ) ;
Function  RD_SELECT_TEXT_GC2 ( Origem : String ; Registro : T_Clip_Retranca ) : String ;
Function  RD_GET_FN_ULTIMO_JORNAL_ABERTO : String ;
Procedure RD_REGISTRAR_ULTIMO_JORNAL_ABERTO ;
Function  RD_GET_DIR_SELO : String ;
Function  RD_GET_DIR_SELO_FIXO : String ;
Function  RD_GET_DIR_SELO_OUTROS : String ;
Function  RD_GC_GET_DIR_IMAGENS_TARJAS : String ;
Function  RD_GC_GET_FN_IMAGEM_TARJA_GC ( _Msg : LongInt ) : String ;
Function  RD_GC_GET_FN_IMAGEM_RELOGIO_GC ( _Msg : LongInt ) : String ;
Procedure RD_SELECIONAR_REGISTRO_RETRANCA ( _Retranca : String ) ;
Function  RD_GET_FN_GC_TXT : String ;
Function  RD_GET_FN_GC_RESUMO : String ;
Function  RD_GET_FN_GC_RESUMO2 : String ;
Function  RD_POSICIONAR_E_SELECIONAR_RETRANCA_NO_SG ( _Retranca : String ;
                                                 SG : TStringGrid ) : Boolean ;
Function  RD_FIND_PRIMEIRA_RETRANCA_EM_SG : LongInt ;
Function  RD_FIND_RETRANCA_EM_SG ( SG : TStringGrid ; _Retranca : String ) : LongInt ;
Function  RD_FIND_INDICE_EM_SG ( SG : TStringGrid ; _Indice : String ) : LongInt ;
Procedure RD_FECHAR_ESPELHO ( Origem : String ) ;
Procedure RD_VERIFICAR_FN_IPS_CAMERA_TRANSITO ;
Procedure RD_LOAD_IPS_CAMERAS_DE_TRANSITO ;
//Function  RD_FN_CAMERA_TRANSITO : String ;
Function RD_FN_TABELA_CAMERA_TRANSITO : String ;
Function  RD_FN_DICIONARIO : String ;
Procedure RD_REMOVER_EXPRESSAO_DO_DICIONARIO ( Aux : String ) ;
Procedure RD_CARREGAR_DICIONARIO ( Origem : String ) ;
Procedure RD_COLAR_MM ( ME : TMemo ) ;
Function  RD_GET_FN_ABREVIATURAS_COMANDOS : String ;
Procedure RD_REGISTRA_LOG_ESPELHO ( _Msg : String ) ;
Procedure RD_CARREGAR_TIPOS_ARTES ;
Function  RD_RETRANCA_NEXT_HABILITADA : Boolean ;
Procedure RD_LIMPAR_DIRETORIO_LOCAL ( Origem : String ) ;
Procedure RD_THREAD_SINCRONIZAR_JORNAL_COMPLETO ;
Procedure RD_SINCRONIZAR_JORNAL_COMPLETO ( Origem : String ;
                                           Modo_Thread : Boolean ; Mascara : String ;
                                           Limpar : Boolean ) ;
Procedure RD_SINCRONIZAR_JORNAL_LOCAL ( Origem, FN : String ;
                                        Var _Mesma_Retranca : Boolean ) ;
Function  RD_GET_DIR_JORNAL_LOCAL : String ;
Procedure RD_SET_POSICAO_CCH_RETRANCA ( _Tag : LongInt ) ;
Function  RD_FN_LOCAL ( FN : String ) : String ;
Function  RD_GC_ANTIGO ( Retranca, Texto : String ;
                         Debug : Boolean ) : String ;
Function  RD_GET_POSICAO_CCH_RETRANCA ( Ret : String ) : LongInt ;
Procedure RD_REMOVER_GC2_TODAS_AS_RETRANCAS ;
Procedure RD_CARREGAR_DICIONARIO_ATALHOS ( LB : TListBox ) ;
Procedure RD_SALVAR_DICIONARIO_ATALHOS ( Origem : String ) ;
//Procedure RD_CARREGAR_SELOS ( Tipo : LongInt ; LB1, LB2 : TListBox ) ;
Procedure RD_MESMA_RETRANCA ;
Procedure RD_CARREGAR_CAMPEONATOS ( CB : TComboBox ) ;
Function  RD_IS_STR_ADD ( Str : String ) : Boolean ;
Procedure RD_CARREGAR_STR_ADD ;
Function RD_FN_Sem_Servidor ( FN : String ) : String ;
Function RD_GET_DIRETORIOS ( Dir : String ) : TStringList ;
Function RD_FILTRAR_TEXTO_RD ( Str : String ) : String ;
//
Function  RD_KERNEL_LOAD_RETRANCA_CABECA ( Origem, Ret : String ) : String ;
Function  RD_KERNEL_LOAD_RETRANCA_GC ( Origem, Ret : String ) : String ;
Function  RD_KERNEL_LOAD_RETRANCA_GC2 ( Origem, Ret : String ) : String ;
Function  RD_KERNEL_LOAD_RETRANCA_CC ( Origem, Ret : String ) : String ;
Function  RD_KERNEL_LOAD_RETRANCA_VT ( Origem, Ret : String ) : String ;
Function  RD_KERNEL_LOAD_RETRANCA_OFF ( Origem, Ret : String ) : String ;
Function  RD_KERNEL_LOAD_RETRANCA_PRIORIDADE ( Origem, Ret : String ) : String ;
Function  RD_KERNEL_LOAD_ESPELHO ( Origem : String ) : String ;
Function  RD_KERNEL_GET_CONTEUDO_ULTIMO_ESPELHO_ABERTO ( Origem : String ) : String ;
Function  RD_KERNEL_GET_CONTEUDO_ESPELHO_ABERTO ( Origem : String ) : String ;
Function  RD_KERNEL_GET_CONTEUDO ( Origem, FN : String ) : String ;
Function  RD_KERNEL_GET_CONTEUDO_JORNAL ( Origem, FN : String ) : String ;
Function  RD_KERNEL_FILE_AGE ( FN : String ; Var DT : TDateTime ) : String ;
Function  RD_KERNEL_FILE_EXISTS_JORNAL_LOCAL ( Origem, FN : String ) : Boolean ;
Function  RD_KERNEL_GET_CABECA ( Retranca : String ) : String ;
Procedure RD_KERNEL_SET_CABECA ( Origem, Retranca, Conteudo : String ; Salvar : Boolean ) ;
Function  RD_KERNEL_GET_GC ( Retranca : String ) : String ;
Procedure RD_KERNEL_SET_GC ( Origem, Retranca, Conteudo : String ; Salvar : Boolean ) ;
Function  RD_KERNEL_GET_GC2 ( Retranca : String ) : String ;
Function  RD_KERNEL_GET_GC_LAST_PROCESSADO ( Retranca : String ) : String ;
Function  RD_KERNEL_GET_GC_CABECA_PROCESSADA ( Retranca : String ) : String ;
Procedure RD_KERNEL_SET_GC2 ( Origem, Retranca, Conteudo : String ; Salvar : Boolean ) ;
Function  RD_KERNEL_GET_VT ( Retranca : String ) : String ;
Procedure RD_KERNEL_SET_VT ( Retranca, Conteudo : String ) ;
Function  RD_KERNEL_GET_CC ( Retranca : String ) : String ;
Procedure RD_KERNEL_SET_CC ( Retranca, Conteudo : String ) ;
Function  RD_KERNEL_GET_OFF ( Retranca : String ) : String ;
Procedure RD_KERNEL_SET_OFF ( Retranca, Conteudo : String ) ;
Function  RD_KERNEL_GET_GC2_AUTO ( Retranca : String ) : String ;
Procedure RD_KERNEL_SET_GC2_AUTO ( Retranca, Conteudo : String ) ;
Function  RD_KERNEL_GET_ESPELHO : String ;
Procedure RD_KERNEL_SET_ESPELHO ( Conteudo : String ) ;
Function  RD_KERNEL_GET_ESPELHO_SAVE : String ;
Procedure RD_KERNEL_SET_ESPELHO_SAVE ( Conteudo : String ) ;
Function  RD_KERNEL_GET_ESPELHO_AUX : String ;
Procedure RD_KERNEL_SET_ESPELHO_AUX ( Conteudo : String ) ;
Function  RD_KERNEL_GET_GC2_CONVERTIDO ( Retranca : String ) : String ;
Function  RD_KERNEL_GET_GC2_INICIALIZADO ( Retranca : String ) : Boolean ;
Procedure RD_KERNEL_SET_GC2_INICIALIZADO ( Origem, Retranca : String ) ;
Procedure RD_KERNEL_SET_GC2_CONVERTIDO ( Origem, Retranca, Conteudo : String ) ;
//
End ;

Implementation

Uses Main ,
     Misc_1,
     Misc_GC,
     GC_U,
     {$IFDEF NW}
     View_Registro_Retranca_U,
     CCH_U,
     {$ENDIF}
     Chyron_Basico_U ;

Constructor TEspelho_RD.Create ( Dono : TComponent ;
                                 Servidor : String ;
                                 ME : TMemo ;
                                 Form_Laudas : TForm ;
                                 Form_Banco_Tarjas : TForm ;
                                 RE_Modo_Texto : TMyRichEdit ;
                                 RE_Modo_Texto_GC : TMyRichEdit ;
                                 PM_Secoes : TPopupMenu ) ;
Var Local      : LongInt ;
Begin
PUT_CARREGANDO_SISTEMA ( 'INI RD_Espelho Create/1' ) ;
Inherited Create ( Dono ) ;
PUT_CARREGANDO_SISTEMA ( 'RD_Espelho Create/2' ) ;
Try
   _Debug ( 'INI Espelho_RD Constructor' ) ;
   RD_VAR_FORM_LAUDAS := Form_Laudas ;
   RD_VAR_FORM_SELECAO_VG := Form_Banco_Tarjas ;
   //RD_VAR_SB_LAUDAS := SB_Laudas ;
   RD_VAR_SHOWHINT := FALSE ;
   RD_VAR_Last_GC_Fixa_Cmd := 0 ;
   RD_VAR_Last_GC_Fixa_L1 := '' ;
   RD_VAR_Last_GC_Fixa_L2 := '' ;
   RD_VAR_Last_GC_Fixa_Lauda := '' ;
   RD_VAR_Last_GC_Fixa_Retranca := '' ;
   RD_VAR_CCH_SELECIONADO_TOP := 0 ;
   RD_VAR_FN_PREVIEW_IMAGE := '' ;
   RD_VAR_TICK_NEXT_EDITOR_AUTO := 0 ;
   RD_VAR_TAG_NEXT_EDITOR_AUTO := -1 ;
   RD_VAR_FLAG_MANTER_FOCO := TRUE ;
   RD_VAR_SENDER_NEXT_EDITOR_AUTO := Nil ;
   RD_VAR_LAST_CARREGAR_DICIONARIO := 0 ;
   RD_VAR_FLAG_POS_ABRIR_ESPELHO := FALSE ;
   RD_VAR_FLAG_CARREGAR_BUFFER_IMG := FALSE ;
   RD_FLAG_PASTA_SELOS_MODIFICADA := 0 ;
   RD_VAR_FN_FLAG_CAMERA_TRANSITO := '' ;
   RD_VAR_SL_USUARIOS := TStringList.Create ;
   //RD_VAR_RESUMO_GC := TStringList.Create ;
   RD_VAR_TICK_SINCRONIZAR_JORNAL_LOCAL := 0 ;
   RD_VAR_TICK_CRONOMETRO_VT := 0 ;
   RD_VAR_TICK_NEXT_EDITOR_AUTO := 0 ;
   RD_VAR_TAG_NEXT_EDITOR_AUTO := -1 ;
   RD_VAR_SL_CAMERAS_TRANSITO_RECEBIDAS := TStringList.Create ;
   RD_VAR_SL_SINCRONIZAR_JORNAL_LOCAL := TStringList.Create ;
   RD_VAR_SL_IPS_CAMERAS_DE_TRANSITO := TStringList.Create ;
   RD_VAR_SL_POSICOES_CCH := TStringList.Create ;
   RD_VAR_SL_STR_ADD := TStringList.Create ;
   RD_VAR_FLAG_GRITO_DETECTADO := TRUE ;
   RD_VAR_FLAG_RELOAD_SELOS_FIXOS := FALSE ;
   RD_VAR_FLAG_RELOAD_SELOS_DIARIOS := FALSE ;
   RD_VAR_FLAG_RELOAD_SELOS_OUTROS := FALSE ;
   RD_VAR_DESTINO_JORNAL := '' ;
   RD_VAR_EDIT_AGENDADO := '' ;
   RD_VAR_DESTINO_DATA := 0 ;
   RD_VAR_LAST_RETRANCA_SEND_GC := '' ;
   RD_VAR_LAST_GC_ATUALIZADO := TStringList.Create ;
   RD_VAR_SL_SELOS_FIXOS := TStringList.Create ;
   RD_VAR_SL_SELOS_DIARIOS := TStringList.Create ;
   RD_VAR_SL_SELOS_OUTROS := TStringList.Create ;
   RD_VAR_SL_DICIONARIO_ATALHOS := TStringList.Create ;
   //RD_VAR_SL_TEXTOS_GC := TStringList.Create ;
   RD_VAR_SL_TIPOS_ARTES := TStringList.Create ;
   RD_VAR_INICIALIZAR_JORNAL_CHYRON := FALSE ;
   RD_VAR_CARREGAR_SELO_ESPORTE := FALSE ;
   RD_VAR_TICK_ATUALIZAR_GC := 0 ;
   RD_VAR_FN_ARTE_SELECIONADA := '' ;
   RD_VAR_IGNONE_CLICK_SG := FALSE ;
   RD_VAR_FLAG_BANCO_MODIFICADO := FALSE ;
   RD_VAR_FLAG_CAMERA_MODIFICADA := FALSE ;
   RD_VAR_FLAG_REPORTER_MODIFICADO := FALSE ;
   RD_VAR_FLAG_APRESENTADOR_MODIFICADO := FALSE ;
   RD_VAR_SERIAL_PORT := 0 ;
   RD_VAR_SERIAL_BAUDRATE := 57600 ;
   RD_VAR_PERIODO_REBOOT := 72 ;
   RD_VAR_CLIPBOARD_GC := '' ;
   RD_VAR_REG_TASK_SG_CLICK.Ativado := FALSE ;
   RD_VAR_PREVISAO_FADE_JORNAL := 0 ;
   RD_VAR_PREVISAO_PRODUCAO_JORNAL := 0 ;
   RD_VAR_CNT_VK__ESCAPE := 0 ;
   RD_VAR_TICK_VK__ESCAPE := 0 ;
   RD_VAR_FLAG_RELOGIO_DICIONARIO := FALSE ;
   RD_VAR_TICK_FLAG_CAMERA_TRANSITO := 0 ;
   RD_VAR_INDICE_GC_GO2 := 0 ;
   RD_VAR_Next_CCH_PNLB_OnClick := 0 ;
   RD_VAR_MODO_RELOGIO_TEMPERATURA := FALSE ;
   RD_VAR_INDICE_RELOGIO_TEMPERATURA := 0 ; // -1:Start, 0:Relogio, Else:Temperaturas
   RD_VAR_QTDE_RELOGIO_TEMPERATURA := 0 ; // Qtde de localidades no rod?zio de temperatura
   RD_VAR_QTDE_BUFFER_IMG := 0 ;
   RD_VAR_FILENAME_REN := '' ;
   RD_VAR_FLAG_REPAINT_SG := 0 ;
   RD_VAR_PROCESSAR_CHYRON := FALSE ;
   SetLength ( RD_VAR_ARRAY_TEMPERATURAS, 0 ) ;
   RD_VAR_FLAG_AUTO_SAVE := FALSE ;
   //RD_VAR_GC_PN_SELETOR := PN_Selecao_Videografismo ;
   RD_VAR_FLAG_NAO_ATUALIZAR_ED_GC := TRUE ;
   RD_VAR_POINT_POPUPMENU_MAIN_SG := Point ( 0, 0 ) ;
   RD_VAR_RE_MODO_TEXTO := RE_Modo_Texto ;
   RD_VAR_RE_MODO_TEXTO_GC := RE_Modo_Texto_GC ;
   SetLength ( RD_VAR_BUFFER_IMG, RD_VAR_QTDE_BUFFER_IMG ) ;
   For Local := 1 To RD_MAX_MESSAGE Do Begin
      RD_VAR_INDICE_BANCO_MSG [ Local ] := RD_BANCO_INVALIDO ;
   End ;
   RD_CRIAR_FN_BROWSERS ;
   RD_CRIAR_FN_DIRETORIOS_MESSAGES ;
   SL_Tarjas_Bancos_Abas := TStringList.Create ;
   RD_COR_JORNAL[1] := RGB(255,190,29) ; // BOMDIA
   RD_COR_JORNAL[2] := RGB(255,125,0) ; // CE1
   RD_COR_JORNAL[3] := RGB(0,157,219) ; // CE2
   RD_COR_JORNAL[4] := RGB(255,219,20) ; // ESPORTE
   RD_VAR_LOG := TStringList.Create ;
   RD_VAR_SL_ANCORAS := TStringList.Create ;
   RD_VAR_RETRANCAS_RESERVADAS := TStringList.Create ;
   SetLength ( RD_VAR_RNEWS.SECAO, RD_MAX_SECOES ) ;
   RD_VAR_RETRANCAS_RESERVADAS.Add ( RD_STR_INICIO ) ;
   RD_VAR_RETRANCAS_RESERVADAS.Add ( RD_STR_FINAL ) ;
   RD_VAR_RETRANCAS_RESERVADAS.Add ( RD_STR_INICIO_PREVIEW ) ;
   RD_VAR_RETRANCAS_RESERVADAS.Add ( RD_STR_FINAL_PREVIEW ) ;
   RD_VAR_RETRANCAS_RESERVADAS.Add ( 'INICIO' ) ;
   RD_VAR_RETRANCAS_RESERVADAS.Add ( 'IN?CIO PREVIEW' ) ;
   RD_VAR_RETRANCAS_RESERVADAS.Add ( 'INICIO PREVIEW' ) ;
   RD_VAR_RETRANCAS_RESERVADAS.Add ( 'FINAL' ) ;
   RD_VAR_RETRANCAS_RESERVADAS.Add ( 'FIM PREVIEW' ) ;
   RD_VAR_QTDE_RETRANCAS_RESERVADAS := RD_VAR_RETRANCAS_RESERVADAS.Count ;
   RD_VAR_LB_LOG := Nil ;
   RD_RESET_FULL ( 'RD_Create' ) ;
   //
   RD_VAR_ESPELHO_ATUAL.Flag_GC_Modificado := 0 ;
   RD_VAR_ESPELHO_ATUAL.FN_Espelho := '' ;
   RD_VAR_ESPELHO_ATUAL.Jornal := 'BOMDIA' ;
   RD_VAR_ESPELHO_ATUAL.Flag_FN_Modificado := '' ;
   RD_VAR_ESPELHO_ATUAL.Flag_Espelho_Modificado := 0 ;
   RD_VAR_ESPELHO_ATUAL.Lista_Simplificada_Atual := TStringList.Create ;
   RD_VAR_ESPELHO_ATUAL.Lista_Simplificada_Temp := TStringList.Create ;
   RD_VAR_ESPELHO_ATUAL.TXT_Cabeca := TStringList.Create ;
   RD_VAR_ESPELHO_ATUAL.TXT_GC := TStringList.Create ;
   RD_VAR_ESPELHO_ATUAL.TXT_GC2 := TStringList.Create ;
   RD_VAR_ESPELHO_ATUAL.TXT_GC_LAST_PROCESSADO := TStringList.Create ;
   RD_VAR_ESPELHO_ATUAL.TXT_CABECA_LAST_PROCESSADA := TStringList.Create ;
   RD_VAR_ESPELHO_ATUAL.TXT_GC2_Auto := TStringList.Create ;
   RD_VAR_ESPELHO_ATUAL.TXT_GC2_INICIALIZADO := TStringList.Create ;
   RD_VAR_ESPELHO_ATUAL.GC2_CONVERTIDO := TStringList.Create ;
   RD_VAR_ESPELHO_ATUAL.TXT_CC := TStringList.Create ;
   RD_VAR_ESPELHO_ATUAL.TXT_VT := TStringList.Create ;
   RD_VAR_ESPELHO_ATUAL.TXT_OFF := TStringList.Create ;
   //
   RD_VAR_EXTENSOES := TStringList.Create ;
   RD_SG_CLICK_MODO_FORCADO := FALSE ;
   RD_VAR_SERVIDOR := Servidor ;
   If ME <> Nil Then Begin
      RD_VAR_MEMO := ME
   End Else Begin
      RD_VAR_MEMO := Nil ;
   End ;
   RD_VAR_SUPER_MEMO := TMemo.Create ( RD_VAR_FORM_LAUDAS ) ;
   RD_VAR_SUPER_MEMO.Parent := RD_VAR_FORM_LAUDAS ;
   RD_VAR_SUPER_MEMO.Visible := FALSE ;
   RD_VAR_SUPER_MEMO.Lines.Clear ;
   RD_VAR_SUPER_MEMO.Width := 5000 ;
   RD_VAR_SUPER_MEMO.Height := 100 ;
   RD_VAR_SUPER_MEMO.WordWrap := FALSE ;
   RD_VAR_SUPER_MEMO.Font.Name := 'FixedSys' ;
   RD_VAR_SUPER_MEMO.Font.Size := 9 ;
   RD_VAR_SUPER_MEMO.Font.Style := [] ;
   RD_PRINT_LOG_ME ;
   RD_LOAD_BUFFER_IMG ( 'RD_Create' ) ;
Except
   On E : Exception Do Begin
      PUT_CARREGANDO_SISTEMA ( 'Exception TEspelho_RD Constructor ' +
                               '[' + E.Message + ']' ) ;
   End ;
End ;
PUT_CARREGANDO_SISTEMA ( 'FIM RD_Espelho Create' ) ;
_Debug ( 'FIM Espelho_RD Constructor' ) ;
End ;

Procedure TEspelho_RD.RD_GET_DIRS_TARJAS ( Var Lista : TStringList ) ;
Var RecDos    : TSearchRec ;
    Resultado : LongInt ;
    Dir       : String ;
Begin
_Debug ( 'INI Espelho_RD RD GET_DIRS_TARJAS' ) ;
Try
   Lista.Clear ;
   Dir := RD_GET_DIR_DATABASE_CONFIG + 'tarjas\' ;
   Resultado := RR_FindFirst ( 'RD_GET_DIRS_TARJAS', Dir + '*.*', faDirectory, RecDos ) ;
   PUT_LOG ( 'RD_GET_DIRS_TARJAS IMG [' + Dir + ']' ) ;
   While Resultado = 0 Do Begin
      If ( RecDos.Name[1] = '.' ) OR
         ( UpperCase(RecDos.Name) = 'PERFIS' ) OR
         ( UpperCase(RecDos.Name) = 'DEPOSITO' ) Then Begin
         Resultado := System.SysUtils.FindNext ( RecDos ) ;
         Continue ;
      End ;
      If ( RecDos.Attr AND faDirectory ) > 0 Then Begin
         Lista.Add ( Dir + RecDos.Name + '\' ) ;
      End ;
      Resultado := System.SysUtils.FindNext ( RecDos ) ;
   End ;
   System.SysUtils.FindClose ( RecDos ) ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception TEspelho_RD RD GET_DIRS_TARJAS ' +
                '[' + E.Message + ']' ) ;
   End ;
End ;
_Debug ( 'FIM Espelho_RD RD GET_DIRS_TARJAS' ) ;
End ;

Procedure TEspelho_RD.RD_GET_FN_TARJAS
          ( Dir : String ; Var Lista : TStringList ) ;
Var RecDos    : TSearchRec ;
    Resultado : LongInt ;
//    Local     : LongInt ;
//    D         : String ;
Begin
Try
   _Debug ( 'INI Espelho_RD GET_FN_TARJAS' ) ;
   //For Local := 0 To 5 Do Begin
      //D := Dir + StrZero(Local, 4) + '\' ;
      Resultado := RR_FindFirst ( 'RD GET_FN_TARJAS', Dir + '*.bmp', 0, RecDos ) ;
      //PUT_LOG ( 'RD_GET_FN_TARJAS IMG [' + Dir + ']' ) ;
      While Resultado = 0 Do Begin
         Lista.Add ( Dir + RecDos.Name ) ;
         Resultado :=  System.SysUtils.FindNext ( RecDos ) ;
      End ;
      System.SysUtils.FindClose ( RecDos ) ;
   //End ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception TEspelho_RD RD GET_FN_TARJAS ' +
                '[' + E.Message + ']' ) ;
   End ;
End ;
_Debug ( 'FIM Espelho_RD GET_FN_TARJAS' ) ;
End ;

Procedure TEspelho_RD.RD_PRINT_BUFFER_IMG ( Origem : String ) ;
Var Local : LongInt ;
    Aux   : String ;
Begin
_Debug ( 'INI Espelho_RD PRINT_BUFFER_IMG' ) ;
If NOT RD_VAR_FLAG_CARREGAR_BUFFER_IMG Then Begin
   Exit ;
End ;
Try
   //PUT_LOG ( 'PRINT_BUFFER_IMG [' + Origem + '][Qtde=' + IntToStr(RD_VAR_QTDE_BUFFER_IMG) + ']' ) ;
   If RD_VAR_QTDE_BUFFER_IMG = 0 Then Begin
      _Debug ( 'Exit = 0 Espelho_RD PRINT_BUFFER_IMG' ) ;
      Exit ;
   End ;
   For Local := 0 To RD_VAR_QTDE_BUFFER_IMG - 1 Do Begin
      Aux := 'PRINT_BUFFER_IMG [' + IntToStr(Local) + '] ' +
             'K:[' + RD_VAR_BUFFER_IMG[Local].Key + '] ' +
             'FN:[' + RD_VAR_BUFFER_IMG[Local].FN + ']' ;
      If Assigned(RD_VAR_BUFFER_IMG[Local].Bmp2) Then Begin
         Aux := Aux + ' ' +
                '[W:' + IntToStr(RD_VAR_BUFFER_IMG[Local].Bmp2.Width) + ' ' +
                'H:' + IntToStr(RD_VAR_BUFFER_IMG[Local].Bmp2.Height) + ']' ;
      End ;
      //PUT_LOG ( Aux ) ;
   End ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception TEspelho_RD RD PRINT_BUFFER_IMG ' +
                '[' + E.Message + ']' ) ;
   End ;
End ;
_Debug ( 'FIM Espelho_RD PRINT_BUFFER_IMG' ) ;
End ;

Procedure TEspelho_RD.RD_LOAD_BUFFER_IMG ( Origem : String ) ;
Var _FN       : String ;
    Dirs      : TStringList ;
    Arquivos  : TStringList ;
    Local     : LongInt ;
    Base      : String ;
    Jornal    : String ;
    _Key      : String ;
    Qtde      : LongInt ;
Begin
_Debug ( 'INI Espelho_RD LOAD_BUFFER_IMG' ) ;
PUT_LOG ( 'INI RD_LOAD_BUFFER_IMG [' + Origem + ']' ) ;
If NOT RD_VAR_FLAG_CARREGAR_BUFFER_IMG Then Begin
   Exit ;
End ;
Try
   PUT_LOG ( 'RD_LOAD_BUFFER_IMG [' + Origem + ']' ) ;
   Dirs := TStringList.Create ;
   Arquivos := TStringList.Create ;
   RD_GET_DIRS_TARJAS ( Dirs ) ;
   If RD_VAR_QTDE_BUFFER_IMG > 0 Then Begin
      For Local := 0 To RD_VAR_QTDE_BUFFER_IMG - 1 Do Begin
         If Assigned ( RD_VAR_BUFFER_IMG[Local].Bmp2 ) Then Begin
            RD_VAR_BUFFER_IMG[Local].Bmp2.Free ;
            RD_VAR_BUFFER_IMG[Local].Bmp2 := Nil ;
         End ;
      End ;
   End ;
   Arquivos.Clear ;
   Qtde := Dirs.Count ;
   If Qtde > 0 Then Begin
      For Local := 0 To Qtde - 1 Do Begin
         PUT_LOG ( 'DIR_IMG TARJA [' + Dirs[Local] + ']' ) ;
         RD_GET_FN_TARJAS ( Dirs[Local], Arquivos ) ;
      End ;
   End ;
   RD_VAR_QTDE_BUFFER_IMG := Arquivos.Count ;
   SetLength ( RD_VAR_BUFFER_IMG, RD_VAR_QTDE_BUFFER_IMG ) ;
   PUT_LOG ( 'CARREGANDO RD_VAR_BUFFER_IMG [' +
             IntToStr ( RD_VAR_QTDE_BUFFER_IMG ) + ']' ) ;
   If RD_VAR_QTDE_BUFFER_IMG > 0 Then Begin
      For Local := 0 To RD_VAR_QTDE_BUFFER_IMG - 1 Do Begin
         _FN := Trim ( Arquivos[Local] ) ;
         Jornal := GET_ANTEPENULTIMO_DIRETORIO ( _FN ) ;
         Base := ExtractFileName ( _FN ) ;
         Delete ( Base, Length(Base)-3, 4 ) ;
         _Key := Jornal + '_' + Base ;
         With RD_VAR_BUFFER_IMG[Local] Do Begin
            Key := _Key ;
            FN := _FN ;
            Bmp2 := TBitmap.Create ;
            If RD_VAR_FLAG_CARREGAR_BUFFER_IMG Then Begin
               //Bmp2.LoadFromFile ( _FN ) ;
               GET_BITMAP ( bmp2,  _FN ) ;
            End ;
         End ;
      End ;
   End ;
   Dirs.Free ;
   PUT_LOG ( 'QTDE RD_VAR_QTDE_BUFFER_IMG ' +
             '[' + IntToStr ( RD_VAR_QTDE_BUFFER_IMG ) + ']' ) ;
   Arquivos.Free ;
   RD_PRINT_BUFFER_IMG ( 'RD_LOAD_BUFFER_IMG' ) ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception TEspelho_RD RD LOAD_BUFFER_IMG ' +
                '[' + E.Message + ']' ) ;
   End ;
End ;
_Debug ( 'FIM Espelho_RD LOAD_BUFFER_IMG' ) ;
PUT_LOG ( 'FIM RD_LOAD_BUFFER_IMG [' + Origem + ']' ) ;
End ;

Procedure TEspelho_RD.RD_POSICIONAR_SB_INICIO ( Origem : String ) ;
Begin
_Debug ( 'INI Espelho_RD POSICIONAR_SB_INICIO' ) ;
PUT_LOG ( 'RD_POSICIONAR_SB_INICIO [' + Origem + ']' ) ;
//RD_VAR_SB_LAUDAS.VertScrollbar.Position := 0 ;
_Debug ( 'FIM Espelho_RD POSICIONAR_SB_INICIO' ) ;
End ;

Procedure TEspelho_RD.RD_POSICIONAR_SB_FINAL ( Origem : String ) ;
Begin
_Debug ( 'INI Espelho_RD POSICIONAR_SB_FINAL' ) ;
PUT_LOG ( 'RD_POSICIONAR_SB_FINAL [' + Origem + ']' ) ;
//RD_VAR_SB_LAUDAS.VertScrollbar.Position := RD_VAR_SB_LAUDAS.VertScrollbar.Range - 1 ;
_Debug ( 'FIM Espelho_RD POSICIONAR_SB_FINAL' ) ;
End ;

Procedure TEspelho_RD.RD_CLEAR_REG_TEMPOS ( Var Temp : T_RD_TEMPOS ) ;
Begin
With Temp Do Begin
   TT := 0 ;
   VTS := 0 ;
   Locucao := 0 ;
   Vivo := 0 ;
   Entrevista := 0 ;
End ;
End ;

Function TEspelho_RD.RD_CALC_TEMPO_LOCUCAO ( Texto : String ) : LongInt ;
Begin
Result := TRUNC ( Length ( Texto ) / 15 ) ;
End ;

Procedure TEspelho_RD.RD_RECALC_TEMPOS_ESPELHO ;
Var Local  : Longint ;
    Reg    : T_RD_TEMPOS ;
Begin
_Debug ( 'INI Espelho_RD RECALC_TEMPOS_ESPELHO' ) ;
Try
   RD_CLEAR_REG_TEMPOS ( Reg ) ;
   For Local := 0 To RD_MAX_SECOES - 1 Do Begin
      With RD_VAR_SECAO Do Begin
         If Tipo = RD_TIPO_TEXTO Then Begin
            Reg.Locucao := Reg.Locucao +
                           RD_CALC_TEMPO_LOCUCAO ( TEXTO.ME_TEXTO.Text ) ;
            Reg.TT := Reg.TT + Reg.Locucao ;
         End Else If Tipo = RD_TIPO_VT Then Begin
            Reg.VTS := Reg.VTS +
                       RD_CALC_TEMPO_LOCUCAO ( TEXTO.ME_TEXTO.Text ) ;
            Reg.TT := Reg.TT + Reg.VTS ;
         End Else If Tipo = RD_TIPO_VIVO Then Begin
            Reg.TT := Reg.TT + Reg.Vivo ;
         End ;
      End ;
   End ;
   {
   PUT_LOG ( 'Tempos TT:' + IntToStr(Reg.TT) + ' ' +
             'Loc:' + IntToStr(Reg.Locucao) + ' ' +
             'VTs:' + IntToStr(Reg.VTS) + ' ' +
             'Vivo:' + IntToStr(Reg.Vivo) ) ;
   }
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception TEspelho_RD RD RECALC_TEMPOS_ESPELHO ' +
                '[' + E.Message + ']' ) ;
   End ;
End ;
_Debug ( 'FIM Espelho_RD RECALC_TEMPOS_ESPELHO' ) ;
End ;

Function TEspelho_RD.RD_RECALC_TEMPOS_LAUDA_RE
         ( RE : TMyRichEdit ) : T_RD_Tempos ;
Var Local       : Longint ;
    Qtde        : LongInt ;
    //Cnt_Locucao : LongInt ;
    Is_Locucao  : Boolean ;
    Aux         : String ;
    Tempo       : LongInt ;
    Locucao     : String ;
Begin
_Debug ( 'INI Espelho_RD RECALC_TEMPOS_LAUDA' ) ;
Try
   If NOT Assigned ( RE ) Then Begin
      Exit ;
   End ;
   Qtde := RE.Lines.Count ;
   If Qtde = 0 Then Begin
      Exit ;
   End ;
   Locucao := '' ;
   RD_CLEAR_REG_TEMPOS ( Result ) ;
   Is_Locucao := FALSE ;
 //  Cnt_Locucao := 0 ;
   For Local := 0 To Qtde - 1 Do Begin
      Aux := Trim ( RE.Lines[Local] ) ;
      If Aux = '' Then
         Continue ;
      If Aux = '#TP' Then Begin
         Is_Locucao := TRUE ;
         Continue ;
      End ;
      If ( Aux[1] = '#' ) OR ( Aux[1] = '@' ) Then Begin
         Is_Locucao := FALSE ;
      End ;
      If ( Aux[1] <> '#' ) AND ( Aux[1] <> '@' ) AND ( Is_Locucao ) Then Begin
         Locucao := Locucao + Aux + sLineBreak ;
         Continue ;
      End ;
      If ( Pos ( '#RODA_VT=', Aux ) = 1 ) OR
         ( Pos ( '#RODA VT=', Aux ) = 1 ) OR
         ( Pos ( '#VT=', Aux ) = 1 ) Then Begin
         Delete ( Aux, 1, Pos ( '=', Aux ) ) ;
         Tempo := MMSSToSegundos2 ( Aux ) ;
         Result.VTS := Result.VTS + Tempo ;
         Result.TT := Result.TT + Tempo ;
      End ;
      If ( Pos ( '#VIVO=', Aux ) = 1 ) OR
         ( Pos ( '#EXTERNA=', Aux ) = 1 ) Then Begin
         Delete ( Aux, 1, Pos ( '=', Aux ) ) ;
         Tempo := MMSSToSegundos2 ( Aux ) ;
         Result.Vivo := Result.Vivo + Tempo ;
         Result.TT := Result.TT + Tempo ;
      End ;
      If ( Pos ( '#ENTREVISTA=', Aux ) = 1 ) Then Begin
         Delete ( Aux, 1, Pos ( '=', Aux ) ) ;
         Tempo := MMSSToSegundos2 ( Aux ) ;
         Result.Entrevista := Result.Entrevista + Tempo ;
         Result.TT := Result.TT + Tempo ;
      End ;
   End ;
   Tempo := RD_CALC_TEMPO_LOCUCAO ( Locucao ) ;
   Result.Locucao := Tempo ;
   Result.TT := Result.TT + Tempo ;
   {
   PUT_LOG ( 'Tempos TT:' + IntToStr(Result.TT) + ' ' +
             'Loc:' + IntToStr(Result.Locucao) + ' ' +
             'VTs:' + IntToStr(Result.VTS) + ' ' +
             'Entrevista:' + IntToStr(Result.Entrevista) + ' ' +
             'Vivo:' + IntToStr(Result.Vivo) ) ;
   }
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception TEspelho_RD RD RECALC_TEMPOS_LAUDA ' +
                '[' + E.Message + ']' ) ;
   End ;
End ;
_Debug ( 'FIM Espelho_RD RECALC_TEMPOS_LAUDA' ) ;
End ;

Procedure TEspelho_RD.RD_EDITOR_LAUDA_CHANGE ( Sender : TObject ) ;
Var _Tag    : LongInt ;
    //Tag_ED : LongInt ;
    Nome   : String ;
Begin
_Debug ( 'INI Espelho_RD EDITOR_LAUDA_CHANGE' ) ;
Try
   If NOT RD_VAR_FLAG_NAO_ATUALIZAR_ED_GC Then Begin
      _Debug ( 'Exit 1 NOT FLAG Espelho_RD EDITOR_LAUDA_CHANGE' ) ;
      Exit ;
   End ;
   If NOT BOOT_OK Then Begin
      _Debug ( 'Exit 2 NOT BOOT_OK Espelho_RD EDITOR_LAUDA_CHANGE' ) ;
      Exit ;
   End ;
   If (Sender IS TMemo) Then Begin
      _Tag := (Sender AS TMemo).Tag MOD 1000 ;
      Nome := (Sender AS TMemo).Name ;
      If Pos ( 'ME_OBS', Nome ) = 1 Then Begin
         //RD_VAR_RNEWS.SECAO[_Tag].TXT_OBS := RD_VAR_ARRAY_REG_LAUDAS[_Tag].OBS.ME_OBS.Text ;
      End Else If Pos ( 'ME_TEXTO', Nome ) = 1 Then Begin
         RD_VAR_RNEWS.SECAO[_Tag].TXT_ME :=
             RD_VAR_SECAO.TEXTO.ME_TEXTO.Text ;
      End ;
   End ;
   If (Sender IS TTransEdit) Then Begin
      //_Tag := (Sender AS TTransEdit).Tag MOD 1000 ;
      //Tag_ED := (Sender AS TTransEdit).Tag DIV 1000 ;
      //RD_VAR_RNEWS.SECAO[_Tag].ED_TXT[Tag_ED] := RD_VAR_SECAO[_Tag].GC.ED_GC[Tag_ED].Text ;
   End ;
   If (Sender IS TEdit) Then Begin
      //_Tag := (Sender AS TEdit).Tag MOD 1000 ;
      //Tag_ED := (Sender AS TEdit).Tag DIV 1000 ;
      {
      RD_VAR_RNEWS.SECAO[_Tag].TXT_OBS := RD_VAR_SECAO[_Tag].ED_OBS.Text ;
      RD_VAR_RNEWS.SECAO[_Tag].VT_FN := RD_VAR_SECAO[_Tag].VT.ED_VT_FN.Text ;
      RD_VAR_RNEWS.SECAO[_Tag].VT_DURACAO := MMSSToSegundos2 ( RD_VAR_SECAO[_Tag].VT.ED_VT_DURACAO.Text ) ;
      RD_VAR_RNEWS.SECAO[_Tag].VT_DURACAO_STR := RD_VAR_SECAO[_Tag].VT.ED_VT_DURACAO.Text ;
      RD_VAR_RNEWS.SECAO[_Tag].VIVO_INFO := RD_VAR_SECAO[_Tag].VIVO.ED_VIVO_INFO.Text ;
      RD_VAR_RNEWS.SECAO[_Tag].VIVO_DURACAO := MMSSToSegundos2 ( RD_VAR_SECAO[_Tag].VIVO.ED_VIVO_DURACAO.Text ) ;
      RD_VAR_RNEWS.SECAO[_Tag].VIVO_DURACAO_STR := RD_VAR_SECAO[_Tag].VIVO.ED_VIVO_DURACAO.Text ;
      }
   End ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception TEspelho_RD RD EDITOR_LAUDA_CHANGE ' +
                '[' + E.Message + ']' ) ;
   End ;
End ;
_Debug ( 'FIM Espelho_RD EDITOR_LAUDA_CHANGE' ) ;
End ;

Procedure TEspelho_RD.RD_DBLCLICK_IM_SELECAO_TARJA_VIDEOGRAFISMO
          (Sender: TObject) ;
Begin
_Debug ( 'INI Espelho_RD DBLCLICK_IM_SELECAO_TARJA_VIDEOGRAFISMO' ) ;
Try
   PUT_LOG ( 'ANTES RD DBLCLICK_IM_SELECAO_TARJA_VIDEOGRAFISMO ' +
             '[' + IntToStr ( (Sender As TImage).Tag ) + ']' +
             '[' + IntToStr(RD_VAR_REG_SELECAO_VIDEOGRAFISMO) + ']' ) ;
   //RRCT APLICAR_IMAGEM_GC ( 'RD_DBLCLICK_IM_SELECAO_TARJA_VIDEOGRAFISMO',
   //                    RD_VAR_REG_SELECAO_VIDEOGRAFISMO,
   //                    (Sender As TImage).Tag, TRUE ) ;
   PUT_LOG ( 'DEPOIS RD DBLCLICK_IM_SELECAO_TARJA_VIDEOGRAFISMO ' +
             '[' + IntToStr ( (Sender As TImage).Tag ) + ']' +
             '[' + IntToStr(RD_VAR_REG_SELECAO_VIDEOGRAFISMO) + ']' ) ;
   //APLICAR_SELECAO_TARJA_VIDEOGRAFISMO ( (Sender As TImage), TRUE ) ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception TEspelho_RD RD DBLCLICK_IM_SELECAO_TARJA_VIDEOGRAFISMO [' + E.Message + ']' ) ;
   End ;
End ;
_Debug ( 'FIM Espelho_RD DBLCLICK_IM_SELECAO_TARJA_VIDEOGRAFISMO' ) ;
End ;

Procedure TEspelho_RD.RD_LOAD_BMP_BUFFER_OU_FILE
          ( Origem : String ; _bmp : TBitMap ;
            _Key : String ; FN : String ) ;
Var Local : LongInt ;
Begin
_Debug ( 'INI Espelho_RD LOAD_BMP_BUFFER_OU_FILE' ) ;
If NOT RD_VAR_FLAG_CARREGAR_BUFFER_IMG Then Begin
   Exit ;
End ;
Try
   If RD_VAR_QTDE_BUFFER_IMG > 0 Then Begin
      For Local := 0 To RD_VAR_QTDE_BUFFER_IMG - 1 Do Begin
         If RD_VAR_BUFFER_IMG[Local].Key = _Key Then Begin
            _Debug ( '1 Espelho_RD LOAD_BMP_BUFFER_OU_FILE' ) ;
            _bmp.Assign ( RD_VAR_BUFFER_IMG[Local].Bmp2 ) ;
            //PUT_LOG ( 'ASSIGN RD_LOAD_BMP_BUFFER_OU_FILE [' + Origem + '][' + _Key + ']' ) ;
            _Debug ( 'Exit OK Espelho_RD LOAD_BMP_BUFFER_OU_FILE' ) ;
            Exit ;
         End ;
      End ;
   End ;
   _Debug ( '2 Espelho_RD LOAD_BMP_BUFFER_OU_FILE' ) ;
   Try
      //PUT_LOG ( 'RD_LOAD_BMP_BUFFER_OU_FILE RD_LOAD_BMP_BUFFER_OU_FILE {' + _Key + '}[' + FN + ']' ) ;
      _Debug ( '3 Espelho_RD LOAD_BMP_BUFFER_OU_FILE' ) ;
      //_bmp.LoadFromFile ( FN ) ;
      GET_BITMAP ( _bmp, FN ) ;
      _Debug ( '4 Espelho_RD LOAD_BMP_BUFFER_OU_FILE' ) ;
   Except
      On E : Exception Do Begin
         PUT_LOG ( 'Exception RD_LOAD_BMP_BUFFER_OU_FILE RD_LOAD_BMP_BUFFER_OU_FILE ' +
                   '[' + E.Message + '][' + FN + ']' ) ;
      End ;
   End ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception TEspelho_RD RD LOAD_BMP_BUFFER_OU_FILE ' +
                '[' + E.Message + ']' ) ;
   End ;
End ;
_Debug ( 'FIM Espelho_RD LOAD_BMP_BUFFER_OU_FILE' ) ;
End ;

Function TEspelho_RD.RD_FN_FADE_JORNAL : String ;
Begin
Result := INSERE_BARRA ( ExtractFilePath ( RD_MONTAR_NOME_JORNAL ) ) + 'FADE.INI' ;
End ;

Function TEspelho_RD.RD_FN_GC_LAUDAS : String ;
Begin
Result := RD_GET_DIR_DATABASE + 'Config\lista_laudas.dat' ;
End ;

Procedure TEspelho_RD.RD_SELECIONAR_PN_LAUDA ( Reg, Tipo : LongInt ) ;
Begin
_Debug ( 'INI Espelho_RD SELECIONAR_PN_LAUDA' ) ;
Try
   RD_VAR_SECAO.Tipo := Tipo ;
   RD_VAR_RNEWS.SECAO[Reg].Tipo := Tipo ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception TEspelho_RD RD SELECIONAR_PN_LAUDA ' +
                '[' + E.Message + ']' ) ;
   End ;
End ;
_Debug ( 'FIM Espelho_RD SELECIONAR_PN_LAUDA' ) ;
End ;

Procedure TEspelho_RD.RD_REORDENAR_CB_OPCOES ( Reg : LongInt ) ;
Begin
End ;

Procedure TEspelho_RD.RD_DEFINIR_TIPO_REGISTRO_LAUDA
          ( Reg, Tipo : LongInt ) ;
Begin
_Debug ( 'INI Espelho_RD DEFINIR_TIPO_REGISTRO_LAUDA' ) ;
Try
   PUT_LOG ( 'INI RD_DEFINIR_TIPO_REGISTRO_LAUDA ' +
             '[' + IntToStr(Reg) + '/' + IntToStr(Tipo) + ']' ) ;
   RD_SELECIONAR_PN_LAUDA ( Reg, Tipo ) ;
   Case Tipo Of
   RD_TIPO_TEXTO : Begin
      End ;
   //RD_REG_LAUDA_OBS : Begin
   //   End ;
   RD_TIPO_VT : Begin
      End ;
   RD_TIPO_GC : Begin
   //   SELECIONAR_TARJA_VIDEOGRAFISMO ( Reg ) ;
      End ;
   RD_TIPO_TELAO : Begin
      End ;
   End ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception TEspelho_RD RD DEFINIR_TIPO_REGISTRO_LAUDA ' +
                '[' + E.Message + ']' ) ;
   End ;
End ;
_Debug ( 'FIM Espelho_RD DEFINIR_TIPO_REGISTRO_LAUDA' ) ;
End ;

Procedure TEspelho_RD.RD_EDIT_OBS_ENTER(Sender: TObject);
Begin
(Sender AS TEdit).Color := RD_COR_ED_OBS_FOCO ;
End ;

Procedure TEspelho_RD.RD_EDIT_OBS_EXIT(Sender: TObject);
Begin
(Sender AS TEdit).Color := RD_COR_ED_OBS ;
End ;

Procedure TEspelho_RD.RD_EDIT_INFO_ENTER(Sender: TObject);
Begin
(Sender AS TEdit).Color := RD_COR_ED_OBS_FOCO ;
End ;

Procedure TEspelho_RD.RD_EDIT_INFO_EXIT(Sender: TObject);
Begin
(Sender AS TEdit).Color := RD_COR_ED_OBS ;
End ;

Procedure TEspelho_RD.RD_MASKEDIT_OBS_ENTER(Sender: TObject);
Begin
(Sender AS TMaskEdit).Color := RD_COR_ED_OBS_FOCO ;
End ;

Procedure TEspelho_RD.RD_MASKEDIT_OBS_EXIT(Sender: TObject);
Begin
(Sender AS TMaskEdit).Color := RD_COR_ED_OBS ;
End ;

Procedure TEspelho_RD.RD_PN_ENTER(Sender: TObject);
Begin
_Debug ( 'INI Espelho_RD PN_ENTER' ) ;
(Sender AS TPanel).Color := RD_COR_PN_FOCO ;
_Debug ( 'FIM Espelho_RD PN_ENTER' ) ;
End ;

Procedure TEspelho_RD.RD_PN_EXIT(Sender: TObject);
Begin
_Debug ( 'INI Espelho_RD PN_EXIT' ) ;
(Sender AS TPanel).Color := RD_COR_PN ;
_Debug ( 'FIM Espelho_RD PN_EXIT' ) ;
End ;

Procedure TEspelho_RD.RD_ME_TEXTO_ENTER(Sender: TObject);
Begin
_Debug ( 'INI Espelho_RD ME_TEXTO_ENTER' ) ;
(Sender AS TMemo).Color := RD_COR_MEMO_TEXTO_FOCO ;
_Debug ( 'FIM Espelho_RD ME_TEXTO_ENTER' ) ;
End ;

Procedure TEspelho_RD.RD_ME_TEXTO_EXIT(Sender: TObject);
Begin
_Debug ( 'INI Espelho_RD ME_TEXTO_EXIT' ) ;
(Sender AS TMemo).Color := RD_COR_MEMO_TEXTO ;
_Debug ( 'FIM Espelho_RD ME_TEXTO_EXIT' ) ;
End ;

Procedure TEspelho_RD.RD_EDT_ENTER(Sender: TObject);
Begin
_Debug ( 'INI Espelho_RD EDT_ENTER' ) ;
Try
   (Sender AS TTransEdit).SelLength := 0 ;
   (Sender AS TTransEdit).SelStart := Length((Sender AS TTransEdit).Text) ;
   (Sender AS TTransEdit).Invalidate ;
   (Sender AS TTransEdit).Repaint ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception TEspelho_RD RD EDT_ENTER ' +
                '[' + E.Message + ']' ) ;
   End ;
End ;
_Debug ( 'FIM Espelho_RD EDT_ENTER' ) ;
End ;

Procedure TEspelho_RD.RD_EDT_EXIT(Sender: TObject);
Begin
_Debug ( 'INI Espelho_RD EDT_EXIT' ) ;
Try
   (Sender AS TTransEdit).Invalidate ;
   (Sender AS TTransEdit).Repaint ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception TEspelho_RD RD EDIT_EXIT [' + E.Message + ']' ) ;
   End ;
End ;
_Debug ( 'FIM Espelho_RD EDT_EXIT' ) ;
End ;

Procedure TEspelho_RD.RD_BOT_OPCAO_CLICK(Sender: TObject);
Var Tag    : LongInt ;
    Reg    : LongInt ;
    Tipo   : LongInt ;
Begin
_Debug ( 'INI Espelho_RD BOT_OPCAO_CLICK' ) ;
Try
   Tag := (Sender As TButton).Tag ;
   Reg := Tag MOD 1000 ;
   Tipo := Tag DIV 1000 ;
   RD_DEFINIR_TIPO_REGISTRO_LAUDA ( Reg, Tipo ) ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception TEspelho_RD RD BOT_OPCAO_CLICK ' +
                '[' + E.Message + ']' ) ;
   End ;
End ;
_Debug ( 'FIM Espelho_RD BOT_OPCAO_CLICK' ) ;
End ;

Procedure TEspelho_RD.RD_SET_TIPO_SECAO
          ( Origem : String ; Reg : LongInt ;
            Tipo : LongInt ; Reload : Boolean ) ;
Begin
_Debug ( 'INI Espelho_RD SET_TIPO_SECAO' ) ;
Try
   //PUT_LOG ( 'RD_SET_TIPO_SECAO [' + Origem + ']' ) ;
   If RD_VAR_RNEWS.SECAO[Reg].Tipo = Tipo Then Begin
      _Debug ( 'Exit 1 Mesmo Tipo Espelho_RD SET_TIPO_SECAO' ) ;
      Exit ;
   End ;
   RD_VAR_RNEWS.SECAO[Reg].Tipo := Tipo ;
   If Reload Then Begin
      RD_LOAD_FORM_EDITOR_LAUDAS ( 'RD_SET_TIPO_SECAO' ) ;
   End ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception TEspelho_RD RD SET_TIPO_SECAO ' +
                '[' + E.Message + ']' ) ;
   End ;
End ;
_Debug ( 'FIM Espelho_RD SET_TIPO_SECAO' ) ;
End ;

Procedure TEspelho_RD.RD_ADD_SECAO
          ( Origem : String ; Reg : LongInt ;
            Tipo : LongInt ; Reload : Boolean ) ;
Var Local : LongInt ;
Begin
_Debug ( 'INI Espelho_RD ADD_SECAO' ) ;
Try
   PUT_LOG( 'RD_ADD_SECAO [' + Origem + ']' ) ;
   For Local := RD_MAX_SECOES - 1 DownTo Reg + 1 Do Begin
      RD_VAR_RNEWS.SECAO[Local] := RD_VAR_RNEWS.SECAO[Local-1] ;
   End ;
   RD_CLEAR_RD_SECAO_NEWS ( Reg ) ;
   RD_VAR_RNEWS.SECAO[Reg].Tipo := Tipo ;
   If Tipo = RD_TIPO_GC Then
      RD_VAR_RNEWS.SECAO[Reg].COD_GC := 21
      Else
      RD_VAR_RNEWS.SECAO[Reg].COD_GC := 0 ;
   If Reload Then Begin
      RD_LOAD_FORM_EDITOR_LAUDAS ( 'RD_ADD_SECAO' ) ;
   End ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception TEspelho_RD RD ADD_SECAO ' +
                '[' + E.Message + ']' ) ;
   End ;
End ;
_Debug ( 'FIM Espelho_RD ADD_SECAO' ) ;
End ;

Procedure TEspelho_RD.RD_SETAR_FOCO_SECAO ( Reg: LongInt ) ;
Begin
End ;

Procedure TEspelho_RD.RD_DUPLICAR_SECAO
          ( Origem, Destino, Foco: LongInt ; Reload : Boolean ) ;
Begin
_Debug ( 'INI Espelho_RD DUPLICAR_SECAO' ) ;
Try
   RD_VAR_RNEWS.Secao[Destino] := RD_VAR_RNEWS.Secao[Origem] ;
   If Reload Then Begin
      RD_LOAD_FORM_EDITOR_LAUDAS ( 'RD_DUPLICAR_SECAO' ) ;
   End ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception TEspelho_RD RD DUPLICAR_SECAO ' +
                '[' + E.Message + ']' ) ;
   End ;
End ;
_Debug ( 'FIM Espelho_RD DUPLICAR_SECAO' ) ;
End ;

Procedure TEspelho_RD.RD_MOVER_SECAO
          ( _Origem : String ; Origem, Destino, Foco: LongInt ;
            Reload : Boolean ) ;
Var Temp : T_SECAO_LAUDA ;
Begin
_Debug ( 'INI Espelho_RD MOVER_SECAO' ) ;
Try
   PUT_LOG ( 'RD_MOVER_SECAO [' + _Origem + ']' ) ;
   If NOT RD_SECAO_VALIDA ( Destino ) Then Begin
      PUT_LOG ( 'RD_MOVER_SECAO NOT RD_SECAO_VALIDA [' + _Origem + ']' ) ;
      _Debug ( 'Exit SECAO_INVALIDA Espelho_RD MOVER_SECAO' ) ;
      Exit ;
   End ;
   Temp := RD_VAR_RNEWS.Secao[Origem] ;
   RD_REMOVER_SECAO ( 'RD_MOVER_SECAO/*' + _Origem, Origem, RELOAD_FALSE ) ;
   If Destino > Origem Then Begin
      Dec ( Destino ) ;
      //Dec ( Foco ) ;
   End ;
   RD_ADD_SECAO ( 'RD_MOVER_SECAO/*' + _Origem, Destino, 0, RELOAD_FALSE ) ;
   RD_VAR_RNEWS.Secao[Destino] := Temp ;
   //RD_DUPLICAR_SECAO ( Origem, Destino, Foco, RELOAD_FALSE ) ;
   If Reload Then Begin
      RD_LOAD_FORM_EDITOR_LAUDAS ( 'RD_MOVER_SECAO' ) ;
   End ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception TEspelho_RD RD MOVER_SECAO ' +
                '[' + E.Message + ']' ) ;
   End ;
End ;
_Debug ( 'FIM Espelho_RD MOVER_SECAO' ) ;
End ;

Procedure TEspelho_RD.RD_REMOVER_SECAO
          ( Origem : String ; Secao : LongInt ; Reload : Boolean ) ;
Var Local : Longint ;
Begin
_Debug ( 'INI Espelho_RD REMOVER_SECAO' ) ;
Try
   PUT_LOG ( 'RD_REMOVER_SECAO [' + Origem + ']' ) ;
   If NOT MyMessageDlg ( 'Confirma a exclus?o da se??o ?' ,
                         mtInformation, [mbYes, mbNo],
                         ['Sim','N?o'], 'Confirma??o',
                         Resposta_Dialog ) Then Begin
      _Debug ( 'Exit NOT Confirm Espelho_RD REMOVER_SECAO' ) ;
      Exit ;
   End ;
   For Local := Secao To RD_MAX_SECOES - 1 - 1 Do Begin
      RD_VAR_RNEWS.SECAO[Local] := RD_VAR_RNEWS.SECAO[Local+1] ;
   End ;
   RD_CLEAR_RD_SECAO_NEWS ( RD_MAX_SECOES - 1 ) ;
   If Reload Then Begin
      RD_LOAD_FORM_EDITOR_LAUDAS ( 'RD_REMOVER_SECAO' ) ;
   End ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception TEspelho_RD RD REMOVER_SECAO ' +
                '[' + E.Message + ']' ) ;
   End ;
End ;
_Debug ( 'FIM Espelho_RD REMOVER_SECAO' ) ;
End ;

Procedure TEspelho_RD.RD_INTERCAMBIAR_SECOES
          ( Origem : String ; Secao1, Secao2, Foco: LongInt ;
            Reload : Boolean ) ;
Var Temp : T_SECAO_LAUDA ;
Begin
_Debug ( 'INI Espelho_RD INTERCAMBIAR_SECOES' ) ;
Try
   PUT_LOG ( 'RD_INTERCAMBIAR_SECOES [' + Origem + ']' ) ;
   If NOT RD_SECAO_VALIDA ( Secao1 ) Then Begin
      _Debug ( 'Exit NOT SECAO_VALIDA 1 Espelho_RD INTERCAMBIAR_SECOES' ) ;
      Exit ;
   End ;
   If NOT RD_SECAO_VALIDA ( Secao2 ) Then Begin
      _Debug ( 'Exit NOT SECAO_VALIDA 2 Espelho_RD INTERCAMBIAR_SECOES' ) ;
      Exit ;
   End ;
   Temp := RD_VAR_RNEWS.Secao[Secao1] ;
   RD_VAR_RNEWS.Secao[Secao1] := RD_VAR_RNEWS.Secao[Secao2] ;
   RD_VAR_RNEWS.Secao[Secao2] := Temp ;
   If Reload Then Begin
      RD_LOAD_FORM_EDITOR_LAUDAS ( 'RD_INTERCAMBIAR_SECOES' ) ;
   End ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception TEspelho_RD RD INTERCAMBIAR_SECOES ' +
                '[' + E.Message + ']' ) ;
   End ;
End ;
_Debug ( 'FIM Espelho_RD INTERCAMBIAR_SECOES' ) ;
End ;

Procedure TEspelho_RD.RD_BOT_MOVIMENTO_CLICK(Sender: TObject);
Var Tag    : LongInt ;
    Reg    : LongInt ;
    Tipo   : LongInt ;
Begin
_Debug ( 'INI Espelho_RD BOT_MOVIMENTO_CLICK' ) ;
Try
   Tag := (Sender As TButton).Tag ;
   Reg := Tag MOD 1000 ;
   Tipo := Tag DIV 1000 ;
   If Tipo = RD_BOT_MOV_ADD Then Begin // ADD SECAO
      RD_ADD_SECAO ( 'RD_BOT_MOVIMENTO_CLICK,Reg:' + IntToStr(Reg),
                     Reg, 0, RELOAD_TRUE ) ;
   End ;
   If Tipo = RD_BOT_MOV_DESCER Then Begin //
      RD_INTERCAMBIAR_SECOES ( 'RD_BOT_MOVIMENTO_CLICK',
                               Reg, Reg+1, Reg+1, RELOAD_TRUE ) ;
   End ;
   If Tipo = RD_BOT_MOV_SUBIR Then Begin //
      RD_INTERCAMBIAR_SECOES ( 'RD_BOT_MOVIMENTO_CLICK',
                               Reg, Reg-1, Reg-1, RELOAD_TRUE ) ;
   End ;
   //RD_DEFINIR_TIPO_REGISTRO_LAUDA ( Reg, Tipo ) ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception TEspelho_RD RD BOT_MOVIMENTO_CLICK ' +
                '[' + E.Message + ']' ) ;
   End ;
End ;
_Debug ( 'FIM Espelho_RD BOT_MOVIMENTO_CLICK' ) ;
End ;

Procedure TEspelho_RD.RD_BOT_PLAY_CLICK(Sender: TObject);
Begin
_Debug ( 'INI Espelho_RD BOT_PLAY_CLICK' ) ;
EXECUTE_PLAY_CHYRON_OUT_GC ( (Sender AS TButton).Tag, 'RR_ARTE', 0,
                             '', '', '', RD_VAR_ESPELHO_ATUAL.Jornal, '',
                             'BOT_PLAY' ) ;
_Debug ( 'FIM Espelho_RD BOT_PLAY_CLICK' ) ;
End ;

Procedure TEspelho_RD.RD_BOT_REMOVE_CLICK(Sender: TObject);
Begin
_Debug ( 'INI Espelho_RD BOT_REMOVE_CLICK' ) ;
EXECUTE_PLAY_CHYRON_OUT_GC ( -2, 'OUT_VOLATEIS', 0,
                             '', '', '', RD_VAR_ESPELHO_ATUAL.Jornal, '',
                             'BOT_REMOVE' ) ;
_Debug ( 'FIM Espelho_RD BOT_REMOVE_CLICK' ) ;
End ;

Procedure TEspelho_RD.RD_BOT_FIXA_CLICK(Sender: TObject);
Begin
_Debug ( 'INI Espelho_RD BOT_FIXA_CLICK' ) ;
EXECUTE_PLAY_CHYRON_OUT_GC ( -1, 'RR_ARTE', 0, '', '', '',
                             RD_VAR_ESPELHO_ATUAL.Jornal, '',
                             'BOT_FIXA' ) ;
_Debug ( 'FIM Espelho_RD BOT_FIXA_CLICK' ) ;
End ;

Procedure TEspelho_RD.RD_BOT_CTRL_OBS_CLICK(Sender: TObject);
//Var _Tag    : LongInt ;
Begin
_Debug ( 'INI Espelho_RD BOT_CTRL_OBS_CLICK' ) ;
//_Tag := (Sender As TButton).Tag MOD 1000 ;
PUT_LOG ( 'RD_BOT_CTRL_OBS_CLICK' ) ;
_Debug ( 'FIM Espelho_RD BOT_CTRL_OBS_CLICK' ) ;
End  ;

Procedure TEspelho_RD.RD_BOT_OBS_CLICK(Sender: TObject);
Begin
End ;

Procedure TEspelho_RD.RD_BOT_MOVE_CLICK(Sender: TObject);
Var Tag    : LongInt ;
    Reg    : LongInt ;
    Tipo   : LongInt ;
Begin
_Debug ( 'INI Espelho_RD BOT_MOVE_CLICK' ) ;
Try
   Tag := (Sender As TButton).Tag ;
   Reg := Tag MOD 1000 ;
   Tipo := Tag DIV 1000 ;
   //If Tipo = RD_BOT_MOV_ADD Then Begin // ADD SECAO
   //   RD_ADD_SECAO ( Reg, RELOAD_TRUE ) ;
   //End ;
   If Tipo = RD_BOT_MOVE_DESCER Then Begin //
      RD_INTERCAMBIAR_SECOES ( 'RD_BOT_MOVE_CLICK/1',
                               Reg, Reg+1, Reg+1, RELOAD_TRUE ) ;
   End ;
   If Tipo = RD_BOT_MOVE_SUBIR Then Begin //
      RD_INTERCAMBIAR_SECOES ( 'RD_BOT_MOVE_CLICK/2',
                               Reg, Reg-1, Reg-1, RELOAD_TRUE ) ;
   End ;
   //RD_DEFINIR_TIPO_REGISTRO_LAUDA ( Reg, Tipo ) ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception TEspelho_RD RD BOT_MOVE_CLICK ' +
                '[' + E.Message + ']' ) ;
   End ;
End ;
_Debug ( 'FIM Espelho_RD BOT_MOVE_CLICK' ) ;
End ;

Function TEspelho_RD.RD_IS_RETRANCA_RESERVADA
         ( Retranca : String ) : Boolean ;
Var Local : LongInt ;
Begin
_Debug ( 'INI Espelho_RD IS_RETRANCA_RESERVADA' ) ;
Result := FALSE ;
Try
   If RD_VAR_QTDE_RETRANCAS_RESERVADAS = 0 Then Begin
      _Debug ( 'Exit = 0 Espelho_RD IS_RETRANCA_RESERVADA' ) ;
      Exit ;
   End ;
   For Local := 0 To RD_VAR_QTDE_RETRANCAS_RESERVADAS - 1 Do Begin
      If RD_VAR_RETRANCAS_RESERVADAS[Local] = Retranca Then Begin
         Result := TRUE ;
         _Debug ( 'Exit OK Espelho_RD IS_RETRANCA_RESERVADA' ) ;
         Exit ;
      End ;
   End ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception TEspelho_RD RD IS_RETRANCA_RESERVADA ' +
                '[' + E.Message + ']' ) ;
   End ;
End ;
_Debug ( 'FIM Espelho_RD IS_RETRANCA_RESERVADA' ) ;
End ;

Procedure TEspelho_RD.RD_PUT_LOG2 ( _Msg : String ) ;
Var Local : LongInt ;
Begin
_Debug ( 'INI Espelho_RD PUT_LOG2' ) ;
Try
   RD_VAR_LOG.Add ( _Msg ) ;
   While RD_VAR_LOG.Count > 1000 Do Begin
      For Local := 1 To 500 Do Begin
         RD_VAR_LOG.Delete(0) ;
      End ;
   End ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception TEspelho_RD RD PUT_LOG2 [' + E.Message + ']' ) ;
   End ;
End ;
_Debug ( 'FIM Espelho_RD PUT_LOG2' ) ;
End ;

Function TEspelho_RD.RD_GET_DATA_CURTA : String ;
Begin
Result := Copy ( DateToStr ( RD_VAR_ESPELHO_ATUAL.Data ) , 9 , 2 ) +
          Copy ( DateToStr ( RD_VAR_ESPELHO_ATUAL.Data ) , 4, 2 ) +
          Copy ( DateToStr ( RD_VAR_ESPELHO_ATUAL.Data ) , 1 , 2 ) ;
End ;

Function TEspelho_RD.RD_GET_DATA_CURTA_2 ( DT : TDateTime ) : String ;
Begin
Result := Copy ( DateToStr ( DT ) , 9 , 2 ) +
          Copy ( DateToStr ( DT ) , 4, 2 ) +
          Copy ( DateToStr ( DT ) , 1 , 2 ) ;
End ;

Function TEspelho_RD.RD_GET_DIR_DATABASE : String ;
Begin
Result := RD_VAR_SERVIDOR + 'Database\' ;
End ;

Function TEspelho_RD.RD_GET_DIR_JORNAIS : String ;
Begin
Result := RD_VAR_SERVIDOR + 'Jornais\' ;
End ;

Function TEspelho_RD.RD_GET_FN_TIPOS_GC : String ;
Begin
Result := RD_GET_DIR_DATABASE + 'config\tipos_gc_detalhes.ini' ;
End ;

Function TEspelho_RD.RD_GET_FN_TIPOS_LAUDAS : String ;
Begin
Result := RD_GET_DIR_DATABASE + 'Tipos_Laudas.txt' ;
End ;

Function TEspelho_RD.RD_GET_DIR_ARTES : String ;
Begin
Result := RD_VAR_SERVIDOR + 'artes\' ;
End ;

Function TEspelho_RD.RD_GET_DIR_ARTES_MOUNT ( Jornal : String ) : String ;
Begin
Result := RD_VAR_SERVIDOR + 'artes\' ;
End ;

Function TEspelho_RD.RD_GET_DIR_DATABASE_CONFIG : String ;
Begin
Result := RD_GET_DIR_DATABASE + 'Config\' ;
End ;

Function TEspelho_RD.RD_GET_DIR_VIDEOGRAFISMO_SEQUENCIAS : String ;
Begin
Result := RD_GET_DIR_DATABASE_CONFIG + 'videografismo\sequencias\' ;
End ;

Function TEspelho_RD.RD_GET_DIR_VIDEOGRAFISMO_TIMES : String ;
Begin
Result := RD_GET_DIR_DATABASE_CONFIG + 'videografismo\times\' ;
End ;

Function TEspelho_RD.RD_GET_DIR_VIDEOGRAFISMO_SEQ_ESCUDO_ANIMADO_MONOCOLOR_RAIOS : String ;
Begin
Result := RD_GET_DIR_VIDEOGRAFISMO_SEQUENCIAS + 'escudo_animado_monocolor_raios\' ;
End ;

Function TEspelho_RD.RD_GET_DIR_VIDEOGRAFISMO_SEQ_ESCUDO_ANIMADO_BICOLOR_RAIOS : String ;
Begin
Result := RD_GET_DIR_VIDEOGRAFISMO_SEQUENCIAS + 'escudo_animado_bicolor_raios\' ;
End ;

Function TEspelho_RD.RD_GET_DIR_VIDEOGRAFISMO_SEQ_ESCUDO_ANIMADO_TRICOLOR_RAIOS : String ;
Begin
Result := RD_GET_DIR_VIDEOGRAFISMO_SEQUENCIAS + 'escudo_animado_tricolor_raios\' ;
End ;

Function TEspelho_RD.RD_GET_DIR_VIDEOGRAFISMO_SEQ_ESCUDO_ANIMADO_BASE : String ;
Begin
Result := RD_GET_DIR_VIDEOGRAFISMO_SEQUENCIAS + 'escudo_animado_base\' ;
End ;

Function TEspelho_RD.RD_GET_DIR_VIDEOGRAFISMO_RAIOS_MOV : String ;
Begin
Result := RD_GET_DIR_DATABASE_CONFIG + 'videografismo\esporte\mov\' ;
End ;

Function TEspelho_RD.RD_GET_FN_VIDEOGRAFISMO_RAIOS_BASE : String ;
Begin
Result := RD_GET_DIR_DATABASE_CONFIG + 'videografismo\esporte\bases_raios\base.png' ;
End ;

Function TEspelho_RD.RD_GET_DIR_CAMPEONATOS : String ;
Begin
Result := RD_GET_DIR_DATABASE + 'Config\Campeonatos\' ;
End ;

Function TEspelho_RD.RD_FN_BOT_ATALHOS : String ;
Begin
Result := RD_GET_DIR_DATABASE_CONFIG + 'bot_atalhos.dat' ;
End ;

Function TEspelho_RD.RD_GET_DIR_DATABASE_CONFIG_TARJAS_PERFIS : String ;
Begin
Result := RD_GET_DIR_DATABASE_CONFIG + 'Tarjas\Perfis\' ;
End ;

Function TEspelho_RD.RD_GET_DIR_JORNAL_CURTO : String ;
Begin
Result := RD_GET_DIR_JORNAIS + RD_VAR_ESPELHO_ATUAL.Jornal + '\' ;
End ;

Function TEspelho_RD.RD_GET_DIR_JORNAL_SELOS : String ;
Begin
Result := RD_GET_DIR_JORNAL_CURTO + 'selos\' ;
End ;

Function TEspelho_RD.RD_GET_DIR_JORNAL_DATA_ARTES : String ;
Begin
//Result := RD_GET_DIR_JORNAL_DATA + 'selos\' ;
Result := RD_GET_DIR_JORNAL_DATA + 'artes\' ;
End ;

Function TEspelho_RD.RD_GET_DIR_ARTES_TEMPLATES : String ;
Begin
Result := RD_GET_DIR_ARTES + 'templates\' ;
End ;

Function TEspelho_RD.RD_GET_DIR_ARTES_BASES_MOUNT ( Jornal : String ) : String ;
Begin
Result := RD_GET_DIR_ARTES + 'bases\' ;
End ;

Function TEspelho_RD.RD_GET_DIR_ARTES_CAMPEONATOS_MOUNT ( Jornal : String ) : String ;
Begin
Result := RD_GET_DIR_ARTES + 'campeonatos\' ;
End ;

Function TEspelho_RD.RD_GET_DIR_ARTES_ESCUDOS_MOUNT ( Jornal : String ) : String ;
Begin
Result := RD_GET_DIR_ARTES + 'escudos\' ;
End ;

Function TEspelho_RD.RD_GET_DIR_ARTES_BASES : String ;
Begin
Result := RD_GET_DIR_ARTES + 'bases\' ;
End ;

Function TEspelho_RD.RD_GET_FN_SCREEN_SAVER : String ;
Var RecDos    : TSearchRec ;
    Resultado : LongInt ;
    Dir       : String ;
Begin
_Debug ( 'INI Espelho_RD RD GET_FN_SCREEN_SAVER' ) ;
Result := '' ;
Try
   Dir := RD_GET_DIR_DATABASE_CONFIG + 'screen_saver\' ;
   CHECAR_DIRETORIO_DIRNAME ( Dir ) ;
   Resultado := RR_FindFirst ( 'RD GET_FN_SCREEN_SAVER', Dir + '*.png', 0, RecDos ) ;
   PUT_LOG ( 'RD GET_FN_SCREEN_SAVER [' + Dir + ']' ) ;
   While Resultado = 0 Do Begin
      If ( RecDos.Name[1] = '.' ) Then Begin
         Resultado := System.SysUtils.FindNext ( RecDos ) ;
         Continue ;
      End ;
      Result := Dir + RecDos.Name ;
      PUT_LOG ( 'Screen_Saver [' + Result + ']' ) ;
      Break ;
   End ;
   System.SysUtils.FindClose ( RecDos ) ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception TEspelho_RD RD GET_FN_SCREEN_SAVER ' +
                '[' + E.Message + ']' ) ;
   End ;
End ;
_Debug ( 'FIM Espelho_RD RD GET_FN_SCREEN_SAVER' ) ;
End ;

Function TEspelho_RD.RD_GET_DIR_ARTES_TIMES : String ;
Begin
Result := RD_GET_DIR_ARTES + 'times\' ;
End ;

Function TEspelho_RD.RD_GET_DIR_ARTES_TIMES_TIME ( _Time : String ) : String ;
Begin
Result := RD_GET_DIR_ARTES + 'times\' + _Time + '\' ;
End ;

Function TEspelho_RD.RD_GET_DIR_ARTES_TIMES_TIME_FOTOS ( _Time : String ) : String ;
Begin
Result := RD_GET_DIR_ARTES + 'times\' + _Time + '\fotos\' ;
End ;

Function TEspelho_RD.RD_GET_DIR_ARTES_CAMPEONATOS : String ;
Begin
Result := RD_GET_DIR_ARTES + 'campeonatos\' ;
End ;

Function TEspelho_RD.RD_GET_DIR_ARTES_ESCUDOS : String ;
Begin
Result := RD_GET_DIR_ARTES + 'escudos\' ;
End ;

Function TEspelho_RD.RD_GET_DIR_JORNAL_SELO_NEUTRO : String ;
Begin
Result := RD_GET_DIR_JORNAL_CURTO + 'selos\' + RD_VAR_ESPELHO_ATUAL.Jornal + '.png' ;
End ;

Function TEspelho_RD.RD_GET_DIR_JORNAL_DATA : String ;
Begin
Result := RD_GET_DIR_JORNAL_CURTO + RD_GET_DATA_CURTA + '\' ;
End ;

Function TEspelho_RD.RD_GET_FN_BANCO_TARJAS : String ;
Begin
Result := RD_GET_DIR_JORNAL_CURTO + 'BANCO_TARJAS.DAT' ;
End ;

Function TEspelho_RD.RD_GET_FN_BANCO_CAMERAS : String ;
Begin
Result := RD_GET_DIR_DATABASE_CONFIG + 'BANCO_CAMERAS.DAT' ;
End ;

Function TEspelho_RD.RD_GET_FN_BANCO_APRESENTADORES : String ;
Begin
Result := RD_GET_DIR_DATABASE_CONFIG + 'BANCO_APRESENTADORES.DAT' ;
End ;

Function TEspelho_RD.RD_GET_FN_BANCO_REPORTERES : String ;
Begin
Result := RD_GET_DIR_DATABASE_CONFIG + 'BANCO_REPORTERES.DAT' ;
End ;

Function TEspelho_RD.RD_GET_FN_GC_TXT : String ;
Begin
Result := RD_GET_DIR_JORNAL_DATA + 'GC_LISTA.TXT' ;
End ;

Function TEspelho_RD.RD_GET_FN_GC_RESUMO : String ;
Begin
Result := RD_GET_DIR_JORNAL_DATA + 'GC_RESUMO.TXT' ;
End ;

Function TEspelho_RD.RD_GET_FN_GC_RESUMO2 : String ;
Begin
Result := RD_GET_DIR_JORNAL_DATA + 'GC_RESUMO2.GC' ;
//Result := RD_GET_DIR_JORNAL_LOCAL + 'GC_RESUMO2.GC' ;
End ;

Function TEspelho_RD.RD_GET_DIR_JORNAL_BACKUP_RETRANCAS_EXCLUIDAS : String ;
Begin
Result := RD_GET_DIR_JORNAL_DATA + 'retrancas_excluidas' + '\' ;
End ;

Function TEspelho_RD.RD_GET_DIR_JORNAL_BACKUP : String ;
Begin
Result := RD_GET_DIR_JORNAL_DATA + 'backup_espelho_rnews\' ;
End ;

Function TEspelho_RD.RD_MONTAR_NOME_JORNAL : String ;
Begin
Result := RD_GET_DIR_JORNAL_DATA +
          RD_VAR_ESPELHO_ATUAL.Jornal + RD_GET_DATA_CURTA + '.TXT' ;
End ;

Procedure TEspelho_RD.RD_RECALC ( CB : TComboBox ; DT : TDateTime ) ;
Var _Jornal : String ;
Begin
If CB.ItemIndex = -1 Then Begin
   Exit ;
End ;
_Jornal := Trim ( CB.Items [ CB.ItemIndex ] ) ;
If _Jornal = '' Then Begin
   Exit ;
End ;
RD_VAR_ESPELHO_ATUAL.Data := DT ;
RD_VAR_ESPELHO_ATUAL.Jornal := _Jornal ;
RD_VAR_ESPELHO_ATUAL.FN_Espelho := RD_MONTAR_NOME_JORNAL ;
RD_PRINT_LOG_ME ;
//VAR_FileName_GC := VAR_SERVIDOR + 'Jornais\' + RD_GET_DATA_CURTA + '\' ;
End ;

Procedure TEspelho_RD.RD_CARREGAR_CB_ANCORAS ;
Var Local : LongInt ;
Begin
_Debug ( 'INI Espelho_RD CARREGAR_CB_ANCORAS' ) ;
Try
   If RD_VAR_QTDE_CB_ANCORAS = 0 Then Begin
      _Debug ( 'Exit = 0 Espelho_RD CARREGAR_CB_ANCORAS' ) ;
      Exit ;
   End ;
   For Local := 0 To RD_VAR_QTDE_CB_ANCORAS - 1 Do Begin
      RD_VAR_ARRAY_CB_ANCORAS [ Local ].CB.Items.Clear ;
      RD_VAR_ARRAY_CB_ANCORAS [ Local ].CB.Items.AddStrings (
                                            RD_VAR_SL_ANCORAS ) ;
   End ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception TEspelho_RD RD CARREGAR_CB_ANCORAS ' +
                '[' + E.Message + ']' ) ;
   End ;
End ;
_Debug ( 'FIM Espelho_RD CARREGAR_CB_ANCORAS' ) ;
End ;

Procedure TEspelho_RD.RD_CARREGAR_ANCORAS_JORNAL ( Origem : String ) ;
Var Ini      : TMemIniFile ;
    FN       : String ;
    Local    : LongInt ;
    Registro : T_Ancora ;
    Grupo    : String ;
Begin
_Debug ( 'INI Espelho_RD CARREGAR_ANCORAS_JORNAL' ) ;
Try
   //PUT_LOG ( '1 RD_CARREGAR_ANCORAS_JORNAL [' + Origem + ']' ) ;
   RD_VAR_QTDE_ANCORAS := 0 ;
   SetLength ( RD_VAR_ARRAY_ANCORAS, RD_VAR_QTDE_ANCORAS ) ;
   FN := RD_GET_DIR_JORNAL_CURTO + 'apresentadores.ini' ;
   If NOT RR_FileExists ( 'RD CARREGAR_ANCORAS_JORNAL', FN ) Then Begin
      PUT_LOG ( 'NOT_FOUND ANCORAS FN [' + FN + ']' ) ;
      _Debug ( 'Exit NOT RR_FileExists Espelho_RD CARREGAR_ANCORAS_JORNAL' ) ;
      Exit ;
   End ;
   //PUT_LOG ( 'CARREGAR_APRESENTADORES [' + FN + ']' ) ;
   //PUT_LOG ( 'RD_CARREGAR_ANCORAS_JORNAL FN [' + FN + ']' ) ;
   Ini := TMemIniFile.Create ( FN ) ;
   For Local := 1 To 10 Do Begin
      Grupo := StrZero(Local,2) ;
      Registro.Apelido := Trim ( Ini.ReadString ( Grupo, 'APELIDO', '' ) ) ;
      Registro.Nome := Ini.ReadString ( Grupo, 'NOME', '' ) ;
      Registro.Sigla := Trim ( Ini.ReadString ( Grupo, 'SIGLA', '' ) ) ;
      //PUT_LOG ( 'CARREGANDO INI ANCORAS [' + Grupo + ']' +
      //             '[' + Registro.Apelido + ']' +
      //             '[' + Registro.Nome + ']' +
      //             '[' + Registro.Sigla + ']' ) ;
      If Registro.Sigla <> '' Then Begin
         Inc ( RD_VAR_QTDE_ANCORAS ) ;
         SetLength ( RD_VAR_ARRAY_ANCORAS, RD_VAR_QTDE_ANCORAS ) ;
         RD_VAR_ARRAY_ANCORAS [ RD_VAR_QTDE_ANCORAS - 1 ] := Registro ;
         RD_VAR_SL_ANCORAS.Add ( Registro.Sigla ) ;
         {
         PUT_LOG ( 'ADD ANCORA [' + IntToStr(RD_VAR_QTDE_ANCORAS) + ']' +
                      '[' + Grupo + ']' +
                      '[' + Registro.Apelido + ']' +
                      '[' + Registro.Nome + ']' +
                      '[' + Registro.Sigla + ']' ) ;
         }
      End ;
   End ;
   Ini.Free ;
   RD_CARREGAR_CB_ANCORAS ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception TEspelho_RD RD CARREGAR_ANCORAS_JORNAL ' +
                '[' + E.Message + ']' ) ;
   End ;
End ;
_Debug ( 'FIM Espelho_RD CARREGAR_ANCORAS_JORNAL' ) ;
End ;

Procedure TEspelho_RD.RD_PRINT_LOG_ME ;
Begin
//_Debug ( 'INI Espelho_RD PRINT_LOG_ME' ) ;
Exit ;
If Assigned ( RD_VAR_MEMO ) Then Begin
   RD_VAR_MEMO.Text := RD_GET_DUMP ;
End ;
RD_PLOTAR_LB_TEMPOS ;
If RD_VAR_LB_LOG <> Nil Then Begin
   RD_VAR_LB_LOG.Items.Clear ;
   RD_VAR_LB_LOG.Items.AddStrings ( RD_VAR_LOG ) ;
End ;
//_Debug ( 'FIM Espelho_RD PRINT_LOG_ME' ) ;
End ;

Procedure TEspelho_RD.RD_LIMPAR_LOGS ;
Begin
_Debug ( 'INI Espelho_RD LIMPAR_LOGS' ) ;
If Assigned ( RD_VAR_MEMO ) Then Begin
   RD_VAR_MEMO.Lines.Clear ;
End ;
If RD_VAR_LB_LOG <> Nil Then Begin
   RD_VAR_LB_LOG.Items.Clear ;
End ;
_Debug ( 'FIM Espelho_RD LIMPAR_LOGS' ) ;
End ;

procedure TEspelho_RD.SG_Click2(Sender: TObject) ;
Begin
Exit ;
End ;


Procedure TEspelho_RD.RD_ADD_SG
          ( Buffer : LongInt ; Var SG : TStringGrid ;
            Tipo : LongInt ;
            Controlador, Controlado, Main : Boolean ;
            Reload_Editor_Lauda : Boolean ;
            Controles_Ativados : Boolean ) ;
Begin
_Debug ( 'INI Espelho_RD ADD_SG' ) ;
Try
   Inc ( RD_VAR_QTDE_SG ) ;
   SetLength ( RD_VAR_Array_SG, RD_VAR_QTDE_SG ) ;
   RD_VAR_Array_SG [ RD_VAR_QTDE_SG - 1 ].Tipo := Tipo ;
   RD_VAR_Array_SG [ RD_VAR_QTDE_SG - 1 ].Controlador := Controlador ;
   RD_VAR_Array_SG [ RD_VAR_QTDE_SG - 1 ].Controlado := Controlado ;
   RD_VAR_Array_SG [ RD_VAR_QTDE_SG - 1 ].Nome := SG.Name ;
   RD_VAR_Array_SG [ RD_VAR_QTDE_SG - 1 ].Reload_Editor_Lauda := Reload_Editor_Lauda ;
   RD_VAR_Array_SG [ RD_VAR_QTDE_SG - 1 ].Main := Main ;
   RD_VAR_Array_SG [ RD_VAR_QTDE_SG - 1 ].Retranca_Sel := '' ;
   RD_VAR_Array_SG [ RD_VAR_QTDE_SG - 1 ].Buffer := Buffer ;
   RD_VAR_Array_SG [ RD_VAR_QTDE_SG - 1 ].SG := SG ;
   RD_VAR_Array_SG [ RD_VAR_QTDE_SG - 1 ].SG.Options :=
            RD_VAR_Array_SG [ RD_VAR_QTDE_SG - 1 ].SG.Options +
            [goRowSelect, goDrawFocusSelected]  ;
   RD_VAR_Array_SG [ RD_VAR_QTDE_SG - 1 ].SG.OnDrawCell := RD_SG_DRAW_ESPELHO ;
   If Controles_Ativados Then Begin
      RD_VAR_Array_SG [ RD_VAR_QTDE_SG - 1 ].SG.OnClick := RD_SG_CLICK ;
      RD_VAR_Array_SG [ RD_VAR_QTDE_SG - 1 ].SG.OnDblClick := RD_SG_DUPLO_CLICK ;
   End ;
   //RD_VAR_Array_SG [ RD_VAR_QTDE_SG - 1 ].SG.OnMouseMove := Nil ; // RD_SG_MOUSE_MOVE ;
   //RD_VAR_Array_SG [ RD_VAR_QTDE_SG - 1 ].SG.OnMouseDown := Nil ; // RD_SG_MOUSE_DOWN ;
   //RD_VAR_Array_SG [ RD_VAR_QTDE_SG - 1 ].SG.OnMouseUp := Nil ;
   RD_VAR_Array_SG [ RD_VAR_QTDE_SG - 1 ].SG.OnSelectCell := Nil ;
   RD_VAR_Array_SG [ RD_VAR_QTDE_SG - 1 ].SG.Tag := Buffer * 1000 + RD_VAR_QTDE_SG - 1 ;
   RD_INICIALIZAR_SG ( SG, Tipo ) ;
   RD_PRINT_LOG_ME ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception TEspelho_RD RD ADD_SG [' + E.Message + ']' ) ;
   End ;
End ;
_Debug ( 'FIM Espelho_RD ADD_SG' ) ;
End ;

Procedure TEspelho_RD.RD_ADD_SG_AUX
          ( Buffer : LongInt ; Var SG : TStringGrid ;
            Tipo : LongInt ;
            Controlador, Controlado, Main : Boolean ;
            Reload_Editor_Lauda : Boolean ) ;
Begin
_Debug ( 'INI Espelho_RD ADD_SG_AUX' ) ;
Try
   Inc ( RD_VAR_QTDE_SG_AUX ) ;
   SetLength ( RD_VAR_Array_SG_AUX, RD_VAR_QTDE_SG_AUX ) ;
   RD_VAR_Array_SG_AUX [ RD_VAR_QTDE_SG_AUX - 1 ].Tipo := Tipo ;
   RD_VAR_Array_SG_AUX [ RD_VAR_QTDE_SG_AUX - 1 ].Retranca_Sel := '' ;
   RD_VAR_Array_SG_AUX [ RD_VAR_QTDE_SG_AUX - 1 ].Controlador := Controlador ;
   RD_VAR_Array_SG_AUX [ RD_VAR_QTDE_SG_AUX - 1 ].Controlado := Controlado ;
   RD_VAR_Array_SG_AUX [ RD_VAR_QTDE_SG_AUX - 1 ].Reload_Editor_Lauda := Reload_Editor_Lauda ;
   RD_VAR_Array_SG_AUX [ RD_VAR_QTDE_SG_AUX - 1 ].Main := Main ;
   RD_VAR_Array_SG_AUX [ RD_VAR_QTDE_SG_AUX - 1 ].Buffer := Buffer ;
   RD_VAR_Array_SG_AUX [ RD_VAR_QTDE_SG_AUX - 1 ].SG := SG ;
   RD_VAR_Array_SG_AUX [ RD_VAR_QTDE_SG_AUX - 1 ].SG.Options :=
            RD_VAR_Array_SG_AUX [ RD_VAR_QTDE_SG_AUX - 1 ].SG.Options +
            [goRowSelect, goDrawFocusSelected]  ;
   RD_VAR_Array_SG_AUX [ RD_VAR_QTDE_SG_AUX - 1 ].SG.OnDrawCell := RD_SG_DRAW_ESPELHO ;
   RD_VAR_Array_SG_AUX [ RD_VAR_QTDE_SG_AUX - 1 ].SG.OnMouseMove := RD_SG_MOUSE_MOVE ;
   RD_VAR_Array_SG_AUX [ RD_VAR_QTDE_SG_AUX - 1 ].SG.OnClick := RD_SG_CLICK ;
   RD_VAR_Array_SG_AUX [ RD_VAR_QTDE_SG_AUX - 1 ].SG.OnDblClick := RD_SG_DUPLO_CLICK ;
   RD_VAR_Array_SG_AUX [ RD_VAR_QTDE_SG_AUX - 1 ].SG.OnMouseDown := Nil ;
   RD_VAR_Array_SG_AUX [ RD_VAR_QTDE_SG_AUX - 1 ].SG.OnMouseUp := Nil ;
   RD_VAR_Array_SG_AUX [ RD_VAR_QTDE_SG_AUX - 1 ].SG.OnSelectCell := Nil ;
   RD_VAR_Array_SG_AUX [ RD_VAR_QTDE_SG_AUX - 1 ].SG.Tag := Buffer * 1000 + RD_VAR_QTDE_SG - 1 ;
   RD_INICIALIZAR_SG ( SG, Tipo ) ;
   RD_PRINT_LOG_ME ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception TEspelho_RD RD ADD_SG_AUX ' +
                '[' + E.Message + ']' ) ;
   End ;
End ;
_Debug ( 'FIM Espelho_RD ADD_SG_AUX' ) ;
End ;

Procedure TEspelho_RD.RD_ADD_RE ( Var RE : TRichEdit ) ;
Begin
_Debug ( 'INI Espelho_RD ADD_RE' ) ;
Try
   Inc ( RD_VAR_QTDE_RE ) ;
   SetLength ( RD_VAR_Array_RE, RD_VAR_QTDE_RE ) ;
   RD_VAR_Array_RE [ RD_VAR_QTDE_RE - 1 ].RE := RE ;
   RD_PRINT_LOG_ME ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception TEspelho_RD RD ADD_RE [' + E.Message + ']' ) ;
   End ;
End ;
_Debug ( 'FIM Espelho_RD ADD_RE' ) ;
End ;

Procedure TEspelho_RD.RD_ADD_RE_MY ( Var RE : TMyRichEdit ) ;
Begin
_Debug ( 'INI Espelho_RD ADD_RE_MY' ) ;
Try
   Inc ( RD_VAR_QTDE_RE_MY ) ;
   SetLength ( RD_VAR_Array_RE_MY, RD_VAR_QTDE_RE_MY ) ;
   RD_VAR_Array_RE_MY [ RD_VAR_QTDE_RE_MY - 1 ].RE := RE ;
   RD_PRINT_LOG_ME ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception TEspelho_RD RD ADD_RE_MY [' + E.Message + ']' ) ;
   End ;
End ;
_Debug ( 'FIM Espelho_RD ADD_RE_MY' ) ;
End ;

Procedure TEspelho_RD.RD_ADD_RE_GC ( Var RE : TRichEdit ) ;
Begin
_Debug ( 'INI Espelho_RD ADD_RE_GC' ) ;
Inc ( RD_VAR_QTDE_RE_GC ) ;
SetLength ( RD_VAR_Array_RE_GC, RD_VAR_QTDE_RE_GC ) ;
RD_VAR_Array_RE_GC [ RD_VAR_QTDE_RE_GC - 1 ].RE := RE ;
RD_PRINT_LOG_ME ;
_Debug ( 'FIM Espelho_RD ADD_RE_GC' ) ;
End ;

Procedure TEspelho_RD.RD_ADD_RE_MY_GC ( Var RE : TMyRichEdit ) ;
Begin
_Debug ( 'INI Espelho_RD ADD_RE_MY_GC' ) ;
Inc ( RD_VAR_QTDE_RE_MY_GC ) ;
SetLength ( RD_VAR_Array_RE_MY_GC, RD_VAR_QTDE_RE_MY_GC ) ;
RD_VAR_Array_RE_MY_GC [ RD_VAR_QTDE_RE_MY_GC - 1 ].RE := RE ;
RD_PRINT_LOG_ME ;
_Debug ( 'FIM Espelho_RD ADD_RE_MY_GC' ) ;
End ;

Procedure TEspelho_RD.RD_ADD_RE_MY_GC2 ( Var RE : TMyRichEdit ) ;
Begin
_Debug ( 'INI Espelho_RD ADD_RE_MY_GC2' ) ;
Inc ( RD_VAR_QTDE_RE_MY_GC2 ) ;
SetLength ( RD_VAR_Array_RE_MY_GC2, RD_VAR_QTDE_RE_MY_GC2 ) ;
RD_VAR_Array_RE_MY_GC2 [ RD_VAR_QTDE_RE_MY_GC2 - 1 ].RE := RE ;
RD_PRINT_LOG_ME ;
_Debug ( 'FIM Espelho_RD ADD_RE_MY_GC2' ) ;
End ;

Procedure TEspelho_RD.RD_ADD_RE_MY_GC2_AUTO ( Var RE : TMyRichEdit ) ;
Begin
_Debug ( 'INI Espelho_RD ADD_RE_MY_GC2_AUTO' ) ;
Inc ( RD_VAR_QTDE_RE_MY_GC2_AUTO ) ;
SetLength ( RD_VAR_Array_RE_MY_GC2_AUTO, RD_VAR_QTDE_RE_MY_GC2_AUTO ) ;
RD_VAR_Array_RE_MY_GC2_AUTO [ RD_VAR_QTDE_RE_MY_GC2_AUTO - 1 ].RE := RE ;
RD_PRINT_LOG_ME ;
_Debug ( 'FIM Espelho_RD ADD_RE_MY_GC2_AUTO' ) ;
End ;

Procedure TEspelho_RD.RD_ADD_RE_CC ( Var RE : TRichEdit ) ;
Begin
_Debug ( 'INI Espelho_RD ADD_RE_CC' ) ;
Inc ( RD_VAR_QTDE_RE_CC ) ;
SetLength ( RD_VAR_Array_RE_CC, RD_VAR_QTDE_RE_CC ) ;
RD_VAR_Array_RE_CC [ RD_VAR_QTDE_RE_CC - 1 ].RE := RE ;
RD_PRINT_LOG_ME ;
_Debug ( 'FIM Espelho_RD ADD_RE_CC' ) ;
End ;

Procedure TEspelho_RD.RD_ADD_RE_OFF ( Var RE : TRichEdit ) ;
Begin
_Debug ( 'INI Espelho_RD ADD_RE_OFF' ) ;
Inc ( RD_VAR_QTDE_RE_OFF ) ;
SetLength ( RD_VAR_Array_RE_OFF, RD_VAR_QTDE_RE_OFF ) ;
RD_VAR_Array_RE_OFF [ RD_VAR_QTDE_RE_OFF - 1 ].RE := RE ;
RD_PRINT_LOG_ME ;
_Debug ( 'FIM Espelho_RD ADD_RE_OFF' ) ;
End ;

Procedure TEspelho_RD.RD_ADD_PN_RET ( Var PN : TPanel ) ;
Begin
_Debug ( 'INI Espelho_RD ADD_PN_RET' ) ;
Inc ( RD_VAR_QTDE_PN_RET ) ;
SetLength ( RD_VAR_Array_PN_RET2, RD_VAR_QTDE_PN_RET ) ;
RD_VAR_Array_PN_RET2 [ RD_VAR_QTDE_PN_RET - 1 ].PN := PN ;
RD_PRINT_LOG_ME ;
_Debug ( 'FIM Espelho_RD ADD_PN_RET' ) ;
End ;

Procedure TEspelho_RD.RD_ADD_PN_RET_NEXT ( Var PN : TPanel ) ;
Begin
_Debug ( 'INI Espelho_RD ADD_PN_RET_NEXT' ) ;
Inc ( RD_VAR_QTDE_PN_RET_NEXT ) ;
SetLength ( RD_VAR_Array_PN_RET_NEXT, RD_VAR_QTDE_PN_RET_NEXT ) ;
RD_VAR_Array_PN_RET_NEXT [ RD_VAR_QTDE_PN_RET_NEXT - 1 ].PN := PN ;
RD_PRINT_LOG_ME ;
_Debug ( 'FIM Espelho_RD ADD_PN_RET_NEXT' ) ;
End ;

Procedure TEspelho_RD.RD_ADD_PN_WAIT ( Var PN : TPanel ) ;
Begin
_Debug ( 'INI Espelho_RD ADD_PN_WAIT' ) ;
Inc ( RD_VAR_QTDE_PN_WAIT ) ;
SetLength ( RD_VAR_Array_PN_WAIT, RD_VAR_QTDE_PN_WAIT ) ;
RD_VAR_Array_PN_WAIT [ RD_VAR_QTDE_PN_WAIT - 1 ].PN := PN ;
RD_PRINT_LOG_ME ;
_Debug ( 'FIM Espelho_RD ADD_PN_WAIT' ) ;
End ;

Procedure TEspelho_RD.RD_ADD_LB_TEMPO_TT ( Var LB : TLabel ) ;
Begin
_Debug ( 'INI Espelho_RD ADD_LB_TEMPO_TT' ) ;
Inc ( RD_VAR_QTDE_LB_TEMPO_TT ) ;
SetLength ( RD_VAR_Array_LB_TEMPO_TT, RD_VAR_QTDE_LB_TEMPO_TT ) ;
RD_VAR_Array_LB_TEMPO_TT [ RD_VAR_QTDE_LB_TEMPO_TT - 1 ].LB := LB ;
RD_PRINT_LOG_ME ;
_Debug ( 'FIM Espelho_RD ADD_LB_TEMPO_TT' ) ;
End ;

Procedure TEspelho_RD.RD_ADD_LB_TEMPO_BREAK ( Var LB : TLabel ) ;
Begin
_Debug ( 'INI Espelho_RD ADD_LB_TEMPO_BREAK' ) ;
Inc ( RD_VAR_QTDE_LB_TEMPO_BREAK ) ;
SetLength ( RD_VAR_Array_LB_TEMPO_BREAK, RD_VAR_QTDE_LB_TEMPO_BREAK ) ;
RD_VAR_Array_LB_TEMPO_BREAK [ RD_VAR_QTDE_LB_TEMPO_BREAK - 1 ].LB := LB ;
RD_PRINT_LOG_ME ;
_Debug ( 'FIM Espelho_RD ADD_LB_TEMPO_BREAK' ) ;
End ;

Procedure TEspelho_RD.RD_ADD_CB_ANCORAS ( Var CB : TComboBox ) ;
Begin
_Debug ( 'INI Espelho_RD ADD_CB_ANCORAS' ) ;
Inc ( RD_VAR_QTDE_CB_ANCORAS ) ;
SetLength ( RD_VAR_ARRAY_CB_ANCORAS, RD_VAR_QTDE_CB_ANCORAS ) ;
RD_VAR_ARRAY_CB_ANCORAS [ RD_VAR_QTDE_CB_ANCORAS - 1 ].CB := CB ;
RD_PRINT_LOG_ME ;
_Debug ( 'FIM Espelho_RD ADD_CB_ANCORAS' ) ;
End ;

Procedure TEspelho_RD.RD_ADD_LB_TEMPO_PRODUCAO ( Var LB : TLabel ) ;
Begin
_Debug ( 'INI Espelho_RD ADD_LB_TEMPO_PRODUCAO' ) ;
Inc ( RD_VAR_QTDE_LB_TEMPO_PRODUCAO ) ;
SetLength ( RD_VAR_Array_LB_TEMPO_PRODUCAO, RD_VAR_QTDE_LB_TEMPO_PRODUCAO ) ;
RD_VAR_Array_LB_TEMPO_PRODUCAO [ RD_VAR_QTDE_LB_TEMPO_PRODUCAO - 1 ].LB := LB ;
RD_PRINT_LOG_ME ;
_Debug ( 'FIM Espelho_RD ADD_LB_TEMPO_PRODUCAO' ) ;
End ;

Procedure TEspelho_RD.RD_ADD_LB_TEMPO_RESTANTE ( Var LB : TLabel ) ;
Begin
_Debug ( 'INI Espelho_RD ADD_LB_TEMPO_RESTANTE' ) ;
Inc ( RD_VAR_QTDE_LB_RESTANTE ) ;
SetLength ( RD_VAR_Array_LB_RESTANTE, RD_VAR_QTDE_LB_RESTANTE ) ;
RD_VAR_Array_LB_RESTANTE [ RD_VAR_QTDE_LB_RESTANTE - 1 ].LB := LB ;
RD_PRINT_LOG_ME ;
_Debug ( 'FIM Espelho_RD ADD_LB_TEMPO_RESTANTE' ) ;
End ;

Procedure TEspelho_RD.RD_ADD_LB_LOG ( Var LB : TListBox ) ;
Begin
If LB <> Nil Then
   RD_VAR_LB_LOG := LB ;
End ;

Procedure TEspelho_RD.RD_ADD_RETRANCA ( Reg : T_Clip_Retranca ; Buffer : LongInt ) ;
Begin
//_Debug ( 'INI Espelho_RD ADD_RETRANCA' ) ;
Try
   Case Buffer Of
   RD_BUFFER_MAIN : Begin
      Inc ( RD_VAR_QTDE_RETRANCAS ) ;
      SetLength ( RD_VAR_Array_RETRANCAS, RD_VAR_QTDE_RETRANCAS ) ;
      RD_VAR_Array_RETRANCAS [ RD_VAR_QTDE_RETRANCAS - 1 ] := Reg ;
      End ;
   RD_BUFFER_SAVE : Begin
      Inc ( RD_VAR_QTDE_RETRANCAS_SAVE ) ;
      SetLength ( RD_VAR_Array_RETRANCAS_SAVE, RD_VAR_QTDE_RETRANCAS_SAVE ) ;
      RD_VAR_Array_RETRANCAS_SAVE [ RD_VAR_QTDE_RETRANCAS_SAVE - 1 ] := Reg ;
      End ;
   RD_BUFFER_AUX : Begin
      Inc ( RD_VAR_QTDE_RETRANCAS_AUX ) ;
      SetLength ( RD_VAR_Array_RETRANCAS_AUX, RD_VAR_QTDE_RETRANCAS_AUX ) ;
      RD_VAR_Array_RETRANCAS_AUX [ RD_VAR_QTDE_RETRANCAS_AUX - 1 ] := Reg ;
      End ;
   End ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception TEspelho_RD RD ADD_RETRANCA [' + E.Message + ']' ) ;
   End ;
End ;
//_Debug ( 'FIM Espelho_RD ADD_RETRANCA' ) ;
End ;

Function TEspelho_RD.RD_GET_PRINT_RETRANCA ( Buffer : LongInt ; Idx : LongInt ) : String ;
Var Registro : T_Clip_Retranca ;
Begin
//_Debug ( 'INI Espelho_RD GET_PRINT_RETRANCA' ) ;
Try
   Result := '' ;
   Case Buffer Of
   RD_BUFFER_MAIN : Begin
      If Idx >= RD_VAR_QTDE_RETRANCAS Then Begin
         _Debug ( 'Exit Idx > Main Espelho_RD GET_PRINT_RETRANCA' ) ;
         Exit ;
      End ;
      Registro := RD_VAR_ARRAY_RETRANCAS[Idx] ;
      End ;
   RD_BUFFER_SAVE : Begin
      If Idx >= RD_VAR_QTDE_RETRANCAS_SAVE Then Begin
         _Debug ( 'Exit Idx > Save Espelho_RD GET_PRINT_RETRANCA' ) ;
         Exit ;
      End ;
      Registro := RD_VAR_ARRAY_RETRANCAS_SAVE[Idx] ;
      End ;
   RD_BUFFER_AUX : Begin
      If Idx >= RD_VAR_QTDE_RETRANCAS_AUX Then Begin
         _Debug ( 'Exit Idx > Aux Espelho_RD GET_PRINT_RETRANCA' ) ;
         Exit ;
      End ;
      Registro := RD_VAR_ARRAY_RETRANCAS_AUX[Idx] ;
      End ;
   End ;
   Result := '[' + Registro.Retranca + ']' +
             ' Anc[' + Registro.Ancora + ']' +
             ' Tip[' + Registro.Tipo + ']' +
             ' Cat[' + Registro.Categoria + ']' +
             ' TT[' + IntToStr(Registro.Tempo_TT) + ']' +
             ' VT[' + IntToStr(Registro.Tempo_VT) + ']' +
             ' EXT[' + IntToStr(Registro.Tempo_EXT) + ']' +
             ' ENTREV[' + IntToStr(Registro.Tempo_Entrevista) + ']' +
             ' LOC[' + IntToStr(Registro.Tempo_Locucao) + ']' +
             ' ESP[' + IF01(Registro.Is_Especial) + ']' +
             ' COM[' + IF01(Registro.Is_Comercial) + ']' +
             ' PROT[' + IF01(Registro.Is_Protegida) + ']' +
             ' Stat[' + IntToStr (Registro.Status) + ']' +
             ' Ini[' + IF01(Registro.Is_Inicio) + ']' +
             ' Fim[' + IF01(Registro.Is_Final) + ']' +
             ' IniP[' + IF01(Registro.Is_Inicio_Preview) + ']' +
             ' FimP[' + IF01(Registro.Is_Final_Preview) + ']' +
             ' Nova[' + IF01(Registro.Nova_Retranca) + ']' +
             ' NoP[' + IF01(Registro.No_Preview) + ']' +
             ' Is1[' + IF01(Registro.Is_Primeira) + ']' +
             ' IsU[' + IF01(Registro.Is_Ultima) + ']' +
             ' Is1P[' + IF01(Registro.Is_Primeira_Preview) + ']' +
             ' IsUP[' + IF01(Registro.Is_Ultima_Preview) + ']' +
             ' VT[' + Registro.VT + ']' +
             ' XML[' + Registro.XML + ']' ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception TEspelho_RD RD GET_PRINT_RETRANCA ' +
                '[' + E.Message + ']' ) ;
   End ;
End ;
//_Debug ( 'FIM Espelho_RD GET_PRINT_RETRANCA' ) ;
End ;

Function TEspelho_RD.RD_GET_DUMP : String ;
Var Local : LongInt ;
Begin
//_Debug ( 'INI Espelho_RD GET_DUMP' ) ;
Try
   Result := '' ;
   Result := Result +
      'NOW [' + DateTimeToStr(Now) + ']' + sLineBreak +
      'SERVIDOR [' + RD_VAR_SERVIDOR + ']' + sLineBreak +
      'FILENAME_ESPELHO [' + RD_VAR_ESPELHO_ATUAL.FN_Espelho + ']' + sLineBreak +
      'SEL FILENAME_RET [' + RD_VAR_ESPELHO_ATUAL.Selecionada.FN_RET + ']' + sLineBreak +
      'SEL FILENAME_GC [' + RD_VAR_ESPELHO_ATUAL.Selecionada.FN_GC1 + ']' + sLineBreak +
      'SEL FILENAME_GC_COPIA [' + RD_VAR_ESPELHO_ATUAL.Selecionada.FN_GC_COPIA + ']' + sLineBreak +
      'SEL FILENAME_GC2 [' + RD_VAR_ESPELHO_ATUAL.Selecionada.FN_GC2 + ']' + sLineBreak +
      'SEL FILENAME_VT [' + RD_VAR_ESPELHO_ATUAL.Selecionada.FN_VT + ']' + sLineBreak +
      'SEL FILENAME_CC [' + RD_VAR_ESPELHO_ATUAL.Selecionada.FN_CC + ']' + sLineBreak +
      'SEL FILENAME_OFF [' + RD_VAR_ESPELHO_ATUAL.Selecionada.FN_OFF + ']' + sLineBreak +
      'SEL FILENAME_REN [' + RD_VAR_FILENAME_REN + ']' + sLineBreak +
      'JORNAL [' + RD_VAR_ESPELHO_ATUAL.Jornal + ']' + sLineBreak +
      'DATA [' + DateTimeToStr(RD_VAR_ESPELHO_ATUAL.Data) + ']' + sLineBreak +
      'QTDE_RE [' + IntToStr(RD_VAR_QTDE_RE) + ']' + sLineBreak +
      'QTDE_RE_GC [' + IntToStr(RD_VAR_QTDE_RE_GC) + ']' + sLineBreak +
      'QTDE_RE_MY_GC [' + IntToStr(RD_VAR_QTDE_RE_MY_GC) + ']' + sLineBreak +
      'QTDE_RE_MY_GC2 [' + IntToStr(RD_VAR_QTDE_RE_MY_GC2) + ']' + sLineBreak +
      'QTDE_RE_MY_GC2_AUTO [' + IntToStr(RD_VAR_QTDE_RE_MY_GC2_AUTO) + ']' + sLineBreak +
      'QTDE_RE_CC [' + IntToStr(RD_VAR_QTDE_RE_CC) + ']' + sLineBreak +
      'QTDE_RE_OFF [' + IntToStr(RD_VAR_QTDE_RE_OFF) + ']' + sLineBreak +
      'QTDE_PN_RET [' + IntToStr(RD_VAR_QTDE_PN_RET) + ']' + sLineBreak +
      'QTDE_PN_WAIT [' + IntToStr(RD_VAR_QTDE_PN_WAIT) + ']' + sLineBreak +
      'QTDE_LB_TEMPO_TT [' + IntToStr(RD_VAR_QTDE_LB_TEMPO_TT) + ']' + sLineBreak +
      'QTDE_LB_TEMPO_BREAK [' + IntToStr(RD_VAR_QTDE_LB_TEMPO_BREAK) + ']' + sLineBreak +
      'QTDE_LB_TEMPO_PROD [' + IntToStr(RD_VAR_QTDE_LB_TEMPO_PRODUCAO) + ']' + sLineBreak +
      'QTDE_LB_RESTANTE [' + IntToStr(RD_VAR_QTDE_LB_RESTANTE) + ']' + sLineBreak +
      'QTDE_CB_ANCORAS [' + IntToStr(RD_VAR_QTDE_CB_ANCORAS) + ']' + sLineBreak +
      'QTDE_SG [' + IntToStr(RD_VAR_QTDE_SG) + ']' + sLineBreak +
      'QTDE_SG_AUX [' + IntToStr(RD_VAR_QTDE_SG_AUX) + ']' + sLineBreak +
      'QTDE_RET [' + IntToStr(RD_VAR_QTDE_RETRANCAS) + ']' + sLineBreak +
      'QTDE_RET_SAVE [' + IntToStr(RD_VAR_QTDE_RETRANCAS_SAVE) + ']' + sLineBreak +
      'QTDE_RET_AUX [' + IntToStr(RD_VAR_QTDE_RETRANCAS_AUX) + ']' + sLineBreak +
      'SEL_RETRANCA [' + RD_VAR_ESPELHO_ATUAL.Selecionada.Retranca + ']' + sLineBreak +
      //'SEL_IDX_RETRANCA [' + IntToStr(RD_VAR_SEL_IDX_RETRANCA) + ']' + sLineBreak +
      'RD_VAR_QTDE_ANCORAS [' + IntToStr ( RD_VAR_QTDE_ANCORAS ) + ']' + sLineBreak +
      'RD_VAR_RETRANCA_FIM [' + IntToStr ( RD_VAR_RETRANCA_FIM ) + ']' + sLineBreak +
      'RD_VAR_TEMPO_TT [' + IntToStr ( RD_VAR_TEMPO_TT ) + ']' + sLineBreak +
      'RD_VAR_TEMPO_BREAK [' + IntToStr ( RD_VAR_TEMPO_BREAK ) + ']' + sLineBreak +
      'RD_VAR_TEMPO_PRODUCAO [' + IntToStr ( RD_VAR_TEMPO_PRODUCAO ) + ']' + sLineBreak +
      'RD_VAR_RESTANTE_TT [' + IntToStr ( RD_VAR_RESTANTE_TT ) + ']' + sLineBreak +
      'RD_VAR_RESTANTE_BREAK [' + IntToStr ( RD_VAR_RESTANTE_BREAK ) + ']' + sLineBreak +
      'RD_VAR_RESTANTE_PRODUCAO [' + IntToStr ( RD_VAR_RESTANTE_PRODUCAO ) + ']' + sLineBreak +
      'RD_VAR_TEMPO_RESTANTE_STR [' + RD_VAR_TEMPO_RESTANTE_STR + ']' + sLineBreak +
      'ABERTO [' + IFSN(RD_VAR_ESPELHO_ATUAL.Aberto2) + ']' + sLineBreak ;
   If RD_VAR_QTDE_SG > 0 Then Begin
      For Local := 0 To RD_VAR_QTDE_SG - 1 Do Begin
      Result := Result + 'SG[' + IntToStr(Local) +  '] ' +
                '[' + GET_FULL_PARENT(RD_VAR_ARRAY_SG[Local].SG) + '.' +
                RD_VAR_ARRAY_SG[Local].SG.Name + ']' + sLineBreak ;
      End ;
   End ;
   If RD_VAR_QTDE_SG_AUX > 0 Then Begin
      For Local := 0 To RD_VAR_QTDE_SG_AUX - 1 Do Begin
      Result := Result + 'SG_AUX[' + IntToStr(Local) +  '] ' +
                '[' + GET_FULL_PARENT(RD_VAR_ARRAY_SG_AUX[Local].SG) + '.' +
                RD_VAR_ARRAY_SG_AUX[Local].SG.Name + ']' + sLineBreak ;
      End ;
   End ;
   If RD_VAR_QTDE_RE > 0 Then Begin
      For Local := 0 To RD_VAR_QTDE_RE - 1 Do Begin
   //   Result := Result + 'RE[' + IntToStr(Local) + '] ' +
   //             '[' + GET_FULL_PARENT(ARRAY_RE[Local].RE) + '.' + ARRAY_RE[Local].RE.Name + ']' + sLineBreak ;
      End ;
   End ;
   If RD_VAR_QTDE_RE_MY > 0 Then Begin
      For Local := 0 To RD_VAR_QTDE_RE_MY - 1 Do Begin
   //   Result := Result + 'RE_MY[' + IntToStr(Local) + '] ' +
   //             '[' + GET_FULL_PARENT(ARRAY_RE_MY[Local].RE) + '.' + ARRAY_RE_MY[Local].RE.Name + ']' + sLineBreak ;
      End ;
   End ;
   If RD_VAR_QTDE_RE_GC > 0 Then Begin
      For Local := 0 To RD_VAR_QTDE_RE_GC - 1 Do Begin
   //   Result := Result + 'RE_GC[' + IntToStr(Local) + '] ' +
   //             '[' + GET_FULL_PARENT(ARRAY_RE_GC[Local].RE) + '.' + ARRAY_RE_GC[Local].RE.Name + ']' + sLineBreak ;
      End ;
   End ;
   If RD_VAR_QTDE_RE_MY_GC > 0 Then Begin
      For Local := 0 To RD_VAR_QTDE_RE_MY_GC - 1 Do Begin
   //   Result := Result + 'RE_GC[' + IntToStr(Local) + '] ' +
   //             '[' + GET_FULL_PARENT(ARRAY_RE_GC[Local].RE) + '.' + ARRAY_RE_GC[Local].RE.Name + ']' + sLineBreak ;
      End ;
   End ;
   If RD_VAR_QTDE_RE_MY_GC2 > 0 Then Begin
      For Local := 0 To RD_VAR_QTDE_RE_MY_GC2 - 1 Do Begin
   //   Result := Result + 'RE_GC2[' + IntToStr(Local) + '] ' +
   //             '[' + GET_FULL_PARENT(ARRAY_RE_GC2[Local].RE) + '.' + ARRAY_RE_GC2[Local].RE.Name + ']' + sLineBreak ;
      End ;
   End ;
   If RD_VAR_QTDE_RE_MY_GC2_AUTO > 0 Then Begin
      For Local := 0 To RD_VAR_QTDE_RE_MY_GC2_AUTO - 1 Do Begin
   //   Result := Result + 'RE_GC2_AUTO[' + IntToStr(Local) + '] ' +
   //             '[' + GET_FULL_PARENT(ARRAY_RE_GC2_AUTO[Local].RE) + '.' + ARRAY_RE_GC2_AUTO[Local].RE.Name + ']' + sLineBreak ;
      End ;
   End ;
   If RD_VAR_QTDE_RE_CC > 0 Then Begin
      For Local := 0 To RD_VAR_QTDE_RE_CC - 1 Do Begin
   //   Result := Result + 'RE_CC[' + IntToStr(Local) + '] ' +
   //             '[' + GET_FULL_PARENT(ARRAY_RE_CC[Local].RE) + '.' + ARRAY_RE_CC[Local].RE.Name + ']' + sLineBreak ;
      End ;
   End ;
   If RD_VAR_QTDE_RE_OFF > 0 Then Begin
      For Local := 0 To RD_VAR_QTDE_RE_OFF - 1 Do Begin
   //   Result := Result + 'RE_OFF[' + IntToStr(Local) + '] ' +
   //             '[' + GET_FULL_PARENT(ARRAY_RE_OFF[Local].RE) + '.' + ARRAY_RE_OFF[Local].RE.Name + ']' + sLineBreak ;
      End ;
   End ;
   If RD_VAR_QTDE_PN_RET > 0 Then Begin
      For Local := 0 To RD_VAR_QTDE_PN_RET - 1 Do Begin
   //   Result := Result + 'RE_PN_RET[' + IntToStr(Local) + '] ' +
   //             '[' + GET_FULL_PARENT(ARRAY_PN_RET[Local].PN) + '.' + ARRAY_PN_RET[Local].PN.Name + ']' + sLineBreak ;
      End ;
   End ;
   If RD_VAR_QTDE_PN_WAIT > 0 Then Begin
      For Local := 0 To RD_VAR_QTDE_PN_WAIT - 1 Do Begin
   //   Result := Result + 'RE_PN_WAIT[' + IntToStr(Local) + '] ' +
   //             '[' + GET_FULL_PARENT(ARRAY_PN_WAIT[Local].PN) + '.' + ARRAY_PN_WAIT[Local].PN.Name + ']' + sLineBreak ;
      End ;
   End ;
   If RD_VAR_QTDE_RETRANCAS > 0 Then Begin
      For Local := 0 To RD_VAR_QTDE_RETRANCAS - 1 Do Begin
      Result := Result + 'RET[' + IntToStr(Local) + '] ' +
                RD_GET_PRINT_RETRANCA ( RD_BUFFER_MAIN, Local ) + sLineBreak ;
      End ;
   End ;
   If RD_VAR_QTDE_ANCORAS > 0 Then Begin
      For Local := 0 To RD_VAR_QTDE_ANCORAS - 1 Do Begin
      Result := Result + 'ANC[' + IntToStr(Local) + '] {' +
                RD_VAR_ARRAY_ANCORAS[Local].Nome + '}' +
                '{' + RD_VAR_ARRAY_ANCORAS[Local].Apelido + '}' +
                '{' + RD_VAR_ARRAY_ANCORAS[Local].Sigla + '}' + sLineBreak ;
      End ;
   End ;
   For Local := 0 To RD_MAX_SECOES - 1 Do Begin
      Result := Result + RD_GET_PRINT_NEWS ( Local ) + sLineBreak ;
   End ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception TEspelho_RD RD GET_DUMP [' + E.Message + ']' ) ;
   End ;
End ;
//_Debug ( 'FIM Espelho_RD GET_DUMP' ) ;
End ;

Function TEspelho_RD.RD_GET_PRINT_NEWS ( Indice : LongInt ) : String ;
Var Tag_ED : LongInt ;
Begin
//_Debug ( 'INI Espelho_RD GET_PRINT_NEWS' ) ;
Try
   Result := '[NEWS_' + StrZero(Indice,4) + ']' + sLineBreak ;
   With RD_VAR_SECAO Do Begin
      Result := Result + 'TIPO=' + IntToStr(RD_VAR_RNEWS.SECAO[Indice].Tipo) + sLineBreak ;
      If RD_VAR_RNEWS.SECAO[Indice].Tipo = RD_TIPO_TEXTO Then Begin
         Result := Result + 'TEXTO=' + RD_VAR_RNEWS.SECAO[Indice].TXT_ME + sLineBreak ;
      End Else If RD_VAR_RNEWS.SECAO[Indice].Tipo = RD_TIPO_VT Then Begin
         Result := Result + 'FN_VT=' + RD_VAR_RNEWS.SECAO[Indice].VT_FN + sLineBreak ;
         Result := Result + 'VT_DURACAO=' + IntToStr(RD_VAR_RNEWS.SECAO[Indice].VT_DURACAO) + sLineBreak ;
         Result := Result + 'VT_DURACAO_STR=' + RD_VAR_RNEWS.SECAO[Indice].VT_DURACAO_STR + sLineBreak ;
      End Else If RD_VAR_RNEWS.SECAO[Indice].Tipo = RD_TIPO_VIVO Then Begin
         Result := Result + 'VIVO_INFO=' + RD_VAR_RNEWS.SECAO[Indice].VIVO_INFO + sLineBreak ;
         Result := Result + 'VIVO_DURACAO=' + IntToStr(RD_VAR_RNEWS.SECAO[Indice].VIVO_DURACAO) + sLineBreak ;
         Result := Result + 'VIVO_DURACAO_STR=' + RD_VAR_RNEWS.SECAO[Indice].VIVO_DURACAO_STR + sLineBreak ;
      End Else If RD_VAR_RNEWS.SECAO[Indice].Tipo = RD_TIPO_GC Then Begin
         Result := Result + 'COD_GC=' + IntToStr(RD_VAR_RNEWS.SECAO[Indice].Cod_GC) + sLineBreak ;
         For Tag_ED := 0 To RD_MAX_EDITS - 1 Do Begin
            Result := Result + 'ED_' + IntToStr(Tag_ED) + '=' +
                      RD_VAR_RNEWS.SECAO[Indice].ED_TXT[Tag_ED] + sLineBreak ;
         End ;
      End ;
      Result := Result + 'OBS=' + RD_VAR_RNEWS.SECAO[Indice].TXT_OBS + sLineBreak ;
   End ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception TEspelho_RD RD GET_PRINT_NEWS [' + E.Message + ']' ) ;
   End ;
End ;
//_Debug ( 'FIM Espelho_RD GET_PRINT_NEWS' ) ;
End ;

Procedure TEspelho_RD.RD_RESET_FULL ;
Begin
_Debug ( 'INI Espelho_RD RESET_FULL' ) ;
Try
   RD_RESET_ESPELHO ( 'RD_RESET_FULL' ) ;
   RD_VAR_QTDE_SG := 0 ;
   RD_VAR_Last_GC_Fixa_Cmd := 0 ;
   RD_VAR_Last_GC_Fixa_L1 := '' ;
   RD_VAR_Last_GC_Fixa_L2 := '' ;
   RD_VAR_Last_GC_Fixa_Lauda := '' ;
   RD_VAR_Last_GC_Fixa_Retranca := '' ;
   SetLength ( RD_VAR_ARRAY_SG, RD_VAR_QTDE_SG ) ;
   RD_VAR_QTDE_RE := 0 ;
   SetLength ( RD_VAR_ARRAY_RE, RD_VAR_QTDE_RE ) ;
   RD_VAR_QTDE_RE_MY := 0 ;
   SetLength ( RD_VAR_ARRAY_RE_MY, RD_VAR_QTDE_RE_MY ) ;
   RD_VAR_QTDE_RE_GC := 0 ;
   SetLength ( RD_VAR_ARRAY_RE_GC, RD_VAR_QTDE_RE_GC ) ;
   RD_VAR_QTDE_RE_MY_GC := 0 ;
   SetLength ( RD_VAR_ARRAY_RE_MY_GC, RD_VAR_QTDE_RE_MY_GC ) ;
   RD_VAR_QTDE_RE_MY_GC2 := 0 ;
   SetLength ( RD_VAR_ARRAY_RE_MY_GC2, RD_VAR_QTDE_RE_MY_GC2 ) ;
   RD_VAR_QTDE_RE_MY_GC2_AUTO := 0 ;
   SetLength ( RD_VAR_ARRAY_RE_MY_GC2_AUTO, RD_VAR_QTDE_RE_MY_GC2_AUTO ) ;
   RD_VAR_QTDE_RE_CC := 0 ;
   SetLength ( RD_VAR_ARRAY_RE_CC, RD_VAR_QTDE_RE_CC ) ;
   RD_VAR_QTDE_RE_OFF := 0 ;
   SetLength ( RD_VAR_ARRAY_RE_OFF, RD_VAR_QTDE_RE_OFF ) ;
   RD_VAR_QTDE_PN_RET := 0 ;
   SetLength ( RD_VAR_ARRAY_PN_RET2, RD_VAR_QTDE_PN_RET ) ;
   RD_VAR_QTDE_PN_WAIT := 0 ;
   SetLength ( RD_VAR_ARRAY_PN_WAIT, RD_VAR_QTDE_PN_WAIT ) ;
   RD_VAR_QTDE_LB_TEMPO_TT := 0 ;
   SetLength ( RD_VAR_ARRAY_LB_TEMPO_TT, RD_VAR_QTDE_LB_TEMPO_TT ) ;
   RD_VAR_QTDE_LB_TEMPO_BREAK := 0 ;
   SetLength ( RD_VAR_ARRAY_LB_TEMPO_BREAK, RD_VAR_QTDE_LB_TEMPO_BREAK ) ;
   RD_VAR_QTDE_LB_TEMPO_PRODUCAO := 0 ;
   SetLength ( RD_VAR_ARRAY_LB_TEMPO_PRODUCAO, RD_VAR_QTDE_LB_TEMPO_PRODUCAO ) ;
   RD_VAR_QTDE_LB_RESTANTE := 0 ;
   SetLength ( RD_VAR_ARRAY_LB_RESTANTE, RD_VAR_QTDE_LB_RESTANTE ) ;
   RD_VAR_QTDE_CB_ANCORAS := 0 ;
   SetLength ( RD_VAR_ARRAY_CB_ANCORAS, RD_VAR_QTDE_CB_ANCORAS ) ;
   RD_VAR_SL_ANCORAS.Clear ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception TEspelho_RD RD RESET_FULL [' + E.Message + ']' ) ;
   End ;
End ;
_Debug ( 'FIM Espelho_RD RESET_FULL' ) ;
End ;

Procedure TEspelho_RD.RD_LIMPAR_REGISTRO_RETRANCA
          ( Origem : String ; Var Registro : T_Clip_Retranca ) ;
Begin
//PUT_LOG ( 'LIMPAR_REGISTRO_RETRANCA [' + Origem + ']' ) ;
With Registro Do Begin
   Valido2 := FALSE ;
   Retranca := '' ;
   Ancora := '' ;
   Tempo_TT_Str := '' ;
   Tempo_VT_Str := '' ;
   Tempo_Ext_Str := '' ;
   Tempo_TT := 0 ;
   Tempo_VT := 0 ;
   Tempo_Ext := 0 ;
   GC_Modificado := '' ;
   Editor := '' ;
   Status := 0 ;
   Status_TP := 0 ;
   Tipo := '' ;
   Fita := '' ;
   Categoria := '' ;
   Numero := 0 ;
   Is_Protegida := FALSE ;
   Is_Especial := FALSE ;
   No_Preview := FALSE ;
   Is_Retranca := FALSE ;
   Is_Comercial := FALSE ;
   Nova_Retranca := FALSE ;
   Is_Primeira := FALSE ;
   Is_Ultima := FALSE ;
   Is_Primeira_Preview := FALSE ;
   Is_Ultima_Preview := FALSE ;
   Is_Inicio := FALSE ;
   Is_Final := FALSE ;
   Is_Inicio_Preview := FALSE ;
   Is_Final_Preview := FALSE ;
   XML := '' ;
   VT := '' ;
End ;
End ;

Procedure TEspelho_RD.RD_RESET_ESPELHO ( Origem : String ) ;
Begin
_Debug ( 'INI Espelho_RD RESET_ESPELHO' ) ;
RD_VAR_ESPELHO_ATUAL.Jornal := '' ;
RD_VAR_ESPELHO_ATUAL.Data := 0 ;
RD_VAR_Last_GC_Fixa_Cmd := 0 ;
RD_VAR_Last_GC_Fixa_L1 := '' ;
RD_VAR_Last_GC_Fixa_L2 := '' ;
RD_VAR_Last_GC_Fixa_Lauda := '' ;
RD_VAR_Last_GC_Fixa_Retranca := '' ;
RD_VAR_ESPELHO_ATUAL.Aberto2 := FALSE ;
RD_VAR_QTDE_RETRANCAS := 0 ;
RD_VAR_ESPELHO_ATUAL.FN_Espelho := '' ;
RD_VAR_RETRANCA_FIM := -1 ;
RD_VAR_MODO_RELOGIO_TEMPERATURA := FALSE ;
RD_VAR_INDICE_RELOGIO_TEMPERATURA := 0 ; // -1:Start, 0:Relogio, Else:Temperaturas
RD_VAR_QTDE_RELOGIO_TEMPERATURA := 0 ; // Qtde de localidades no rod?zio de temperatura
RD_LIMPAR_REGISTRO_RETRANCA ( 'RD_RESET_ESPELHO', RD_VAR_ESPELHO_ATUAL.Selecionada ) ;
//RD_LIMPAR_REGISTRO_RETRANCA ( 'RD_RESET_ESPELHO', RD_VAR_ESPELHO_ATUAL.Reg_Editor_GC ) ;
SetLength ( RD_VAR_ARRAY_RETRANCAS, 0 ) ;
_Debug ( 'FIM Espelho_RD RESET_ESPELHO' ) ;
End ;

Procedure TEspelho_RD.RD_RESET_ABRIR_ESPELHO
          ( Origem : String ; Buffer : LongInt ) ;
Begin
_Debug ( 'INI Espelho_RD RESET_ABRIR_ESPELHO' ) ;
Try
   //PUT_LOG ( 'RD RESET_ABRIR_ESPELHO [' + Origem + ']' ) ;
   Case Buffer Of
   RD_BUFFER_MAIN : Begin
      RD_VAR_ESPELHO_ATUAL.Aberto2 := FALSE ;
      RD_VAR_TEMPO_TT := 0 ;
      RD_VAR_TEMPO_BREAK := 0 ;
      RD_VAR_TEMPO_PRODUCAO := 0 ;
      RD_VAR_RESTANTE_TT := 0 ;
      RD_VAR_RESTANTE_BREAK := 0 ;
      RD_VAR_RESTANTE_PRODUCAO := 0 ;
      RD_VAR_RETRANCA_FIM := -1 ;
      RD_VAR_QTDE_RETRANCAS := 0 ;
      RD_VAR_FILENAME_REN := '' ;
      SetLength ( RD_VAR_ARRAY_RETRANCAS, 0 ) ;
      RD_VAR_QTDE_ANCORAS := 0 ;
      SetLength ( RD_VAR_ARRAY_ANCORAS, 0 ) ;
      End ;
   RD_BUFFER_SAVE : Begin
      RD_VAR_QTDE_RETRANCAS_SAVE := 0 ;
      SetLength ( RD_VAR_ARRAY_RETRANCAS_SAVE, 0 ) ;
      End ;
   RD_BUFFER_AUX : Begin
      RD_VAR_QTDE_RETRANCAS_AUX := 0 ;
      SetLength ( RD_VAR_ARRAY_RETRANCAS_AUX, 0 ) ;
      End ;
   End ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception TEspelho_RD RD RESET_ABRIR_ESPELHO ' +
                '[' + E.Message + ']' ) ;
   End ;
End ;
_Debug ( 'FIM Espelho_RD RESET_ABRIR_ESPELHO' ) ;
End ;

Function TEspelho_RD.RD_IS_STATUS_RETRANCA ( Status : LongInt ) : Boolean ;
Begin
Result := ( Status = J_NORMAL ) OR
          ( Status = J_BR ) OR
          ( Status = J_PROTEGIDA ) OR
          ( Status = J_EDICAO ) OR
          ( Status = J_MOVENDO ) OR
          ( Status = J_REMOVENDO ) OR
          ( Status = J_COLANDO ) ;
End ;

Function TEspelho_RD.RD_FIND_PRIMEIRA_RETRANCA
         ( SG : TStringGrid ) : LongInt ;
Var Local     : LongInt ;
    Qtde      : LongInt ;
    _Retranca : String ;
    _Proxima  : String ;
Begin
Result := -1 ;
Qtde := SG.RowCount ;
If Qtde < 3 Then Begin
   Exit ;
End ;
For Local := 1 To Qtde - 2 Do Begin
   _Retranca := SG.Cells[SG_J_RETRANCA, Local] ;
   _Proxima := SG.Cells[SG_J_RETRANCA, Local+1] ;
   If _Retranca = 'IN?CIO' Then Begin
      If Pos ( 'COMERCIAL', _Proxima ) > 0 Then Begin
         Result := Local + 2 ;
      End Else Begin
         Result := Local + 1 ;
      End ;
      Exit ;
   End ;
End  ;
End ;

Function TEspelho_RD.RD_FIND_ULTIMA_RETRANCA
         ( SG : TStringGrid ) : LongInt ;
Var Local     : LongInt ;
    Qtde      : LongInt ;
    _Retranca : String ;
Begin
Result := -1 ;
Qtde := SG.RowCount ;
If Qtde < 3 Then Begin
   Exit ;
End ;
For Local := Qtde - 1 DownTo 1 Do Begin
   _Retranca := SG.Cells[SG_J_RETRANCA, Local] ;
   If _Retranca = 'FIM' Then Begin
      Result := Local - 1 ;
      Exit ;
   End ;
End  ;
End ;

Procedure TEspelho_RD.RD_SELECT_SG_ROW
          ( SG : TStringGrid ; Linha : LongInt ; Recarregar : Boolean ) ;
Begin
If NOT Assigned ( SG ) Then Begin
   Exit ;
End ;
If Recarregar Then Begin
   RD_VAR_PROCESSAR_CHYRON := TRUE ;
End;
If Linha <> SG.Row Then Begin
   SG.Row := Linha ;
   //PUT_LOG ( 'SELECT_SG_ROW DIF SG[' + SG.Name + '] Row[' + IntToStr(Linha) + ']' ) ;
End Else Begin
   SG.OnClick ( SG ) ;
   //PUT_LOG ( 'SELECT_SG_ROW IGUAL SG[' + SG.Name + '] Row[' + IntToStr(Linha) + ']' ) ;
End ;
End ;

Procedure TEspelho_RD.RD_POSICIONAR_PRIMEIRA_RETRANCA_NO_ESPELHO
          ( SG : TStringGrid ) ;
Var Indice : LongInt ;
Begin
Indice := RD_FIND_PRIMEIRA_RETRANCA ( SG ) ;
If Indice > 0 Then Begin
   DEF_SG_TOPROW ( 'TEspelho_RD.POSICIONAR_PRIMEIRA_RETRANCA_NO_ESPELHO', SG, 1 ) ;
   RD_SELECT_SG_ROW ( SG, Indice, TRUE ) ;
End  ;
End ;

Procedure TEspelho_RD.RD_POSICIONAR_ULTIMA_RETRANCA_NO_ESPELHO
          ( SG : TStringGrid ) ;
Var Indice : LongInt ;
Begin
Indice := RD_FIND_ULTIMA_RETRANCA ( SG ) ;
If Indice > 0 Then Begin
   RD_SELECT_SG_ROW ( SG, Indice, TRUE ) ;
End  ;
End ;

Function TEspelho_RD.RD_IS_COMERCIAL ( _Retranca : String ) : Boolean ;
Begin
Result := FALSE ;
Try
   _Retranca := Trim ( UpperCase ( _Retranca ) ) ;
   If _Retranca = 'COMERCIAL' Then Begin
      Result := TRUE ;
   End ;
   If Length ( _Retranca ) = ( Length ( 'COMERCIAL' ) + 3 ) Then Begin
      If _Retranca [ Length ( 'COMERCIAL' ) + 1 ] = '-' Then Begin
         If StrToIntDef ( Copy ( _Retranca , Length ( 'COMERCIAL' ) + 2 , 2 ) , 0 ) > 0 Then Begin
            Result := TRUE ;
         End ;
      End ;
   End ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception TEspelho_RD RD IS_COMERCIAL ' +
                '[' + E.Message + ']' ) ;
   End ;
End ;
End ;

Function TEspelho_RD.RD_IS_FIM ( _Retranca : String ) : Boolean ;
Begin
Result := ( _Retranca = 'FIM' ) ;
End ;

Procedure TEspelho_RD.RD_INICIALIZAR_SG
          ( SG : TStringGrid ; Tipo : LongInt ) ;
Begin
_Debug ( 'INI Espelho_RD INICIALIZAR_SG' ) ;
Try
   //PUT_LOG ( 'INICIALIZAR_SG' + ' ' + 'Name ' + SG.Name ) ;
   With SG Do Begin
     FATOR_FONT := MAX ( 1, Size_Fonte_Espelho / 11 ) ;
     ColCount := SG_J_STATUS_CAT + 1 ;
     FixedCols := 0 ;
     RowCount := 2 ;
     FixedRows := 1 ;
     DefaultRowHeight := TRUNC ( 18 * FATOR_FONT * 1.2 ) ;
     If Tipo = RD_ESPELHO_SG_TIPO_FULL Then Begin
        ColWidths[SG_J_No]        := TRUNC ( 20 * FATOR_FONT ) ;
        ColWidths[SG_J_ANCORA]    := TRUNC ( 35 * FATOR_FONT )  ; // 28
        ColWidths[SG_J_TIPO]      := TRUNC ( 35 * FATOR_FONT )  ;
        ColWidths[SG_J_RETRANCA]  := TRUNC ( 150 * FATOR_FONT ) ; // 280
        ColWidths[SG_J_VIDEO]     := TRUNC ( 24 * FATOR_FONT )  ;
        ColWidths[SG_J_TOTAL]     := TRUNC ( 48 * FATOR_FONT )  ;
        ColWidths[SG_J_VT]        := TRUNC ( 48 * FATOR_FONT )  ;
        ColWidths[SG_J_EXT]       := -1 ; // 48 ;
        ColWidths[SG_J_EDITOR]    := TRUNC ( 55 * FATOR_FONT )  ;
        ColWidths[SG_J_GC]        := TRUNC ( 12 * FATOR_FONT )  ;
        ColWidths[SG_J_ENTRADA]   := TRUNC ( 68 * FATOR_FONT )  ;
        ColWidths[SG_J_FITA]      := TRUNC ( 25 * FATOR_FONT )  ;
        ColWidths[SG_J_STATUS]    := TRUNC ( 20 * FATOR_FONT )  ;
        ColWidths[SG_J_STATUS_TP] := TRUNC ( 20 * FATOR_FONT )  ;
        ColWidths[SG_J_STATUS_PROTECAO] := TRUNC ( 12 * FATOR_FONT ) ;
        ColWidths[SG_J_STATUS_ILHA] := TRUNC ( 30 * FATOR_FONT )  ;
        ColWidths[SG_J_STATUS_EDICAO] := TRUNC ( 100 * FATOR_FONT ) ;
        ColWidths[SG_J_STATUS_CAT] := TRUNC ( 28 * FATOR_FONT )  ;
     End Else If Tipo = RD_ESPELHO_SG_TIPO_GC Then Begin
        ColWidths[SG_J_No]        := TRUNC ( 20 * FATOR_FONT ) ;
        ColWidths[SG_J_ANCORA]    := -1 ; // TRUNC ( 35 * FATOR_FONT )  ; // 28
        ColWidths[SG_J_TIPO]      := TRUNC ( 35 * FATOR_FONT )  ;
        ColWidths[SG_J_RETRANCA]  := TRUNC ( 150 * FATOR_FONT ) ; // 280
        ColWidths[SG_J_VIDEO]     := -1 ; // TRUNC ( 24 * FATOR_FONT )  ;
        ColWidths[SG_J_TOTAL]     := -1 ; // TRUNC ( 48 * FATOR_FONT )  ;
        ColWidths[SG_J_VT]        := -1 ; // TRUNC ( 48 * FATOR_FONT )  ;
        ColWidths[SG_J_EXT]       := -1 ; // 48 ;
        ColWidths[SG_J_EDITOR]    := -1 ; // TRUNC ( 55 * FATOR_FONT )  ;
        ColWidths[SG_J_GC]        := TRUNC ( 12 * FATOR_FONT )  ;
        ColWidths[SG_J_ENTRADA]   := -1 ; // TRUNC ( 68 * FATOR_FONT )  ;
        ColWidths[SG_J_FITA]      := -1 ; // TRUNC ( 25 * FATOR_FONT )  ;
        ColWidths[SG_J_STATUS]    := -1 ; // TRUNC ( 20 * FATOR_FONT )  ;
        ColWidths[SG_J_STATUS_TP] := -1 ; // TRUNC ( 20 * FATOR_FONT )  ;
        ColWidths[SG_J_STATUS_PROTECAO] := -1 ; // TRUNC ( 12 * FATOR_FONT ) ;
        ColWidths[SG_J_STATUS_ILHA] := -1 ; // TRUNC ( 30 * FATOR_FONT )  ;
        ColWidths[SG_J_STATUS_EDICAO] := -1 ; // TRUNC ( 100 * FATOR_FONT ) ;
        ColWidths[SG_J_STATUS_CAT] := -1 ; // TRUNC ( 28 * FATOR_FONT )  ;
     End ;
     Cells[SG_J_No,0]         := 'N?' ;
     Cells[SG_J_ANCORA,0]     := '?nc' ;
     Cells[SG_J_TIPO,0]       := 'Tip' ;
     Cells[SG_J_RETRANCA,0]   := 'Retranca' ;
     Cells[SG_J_VIDEO,0]      := 'VD' ;
     Cells[SG_J_TOTAL,0]      := 'Total' ;
     Cells[SG_J_VT,0]         := 'VT''s' ;
     Cells[SG_J_EXT,0]        := 'Ext' ;
     Cells[SG_J_EDITOR,0]     := 'Editor' ;
     Cells[SG_J_GC,0]         := 'C' ;
     Cells[SG_J_ENTRADA,0]    := 'Hora' ;
     Cells[SG_J_FITA,0]       := 'FT' ;
     Cells[SG_J_STATUS,0]     := 'S' ;
     Cells[SG_J_STATUS_TP,0]  := 'T' ;
     Cells[SG_J_STATUS_PROTECAO,0]  := 'P' ;
     Cells[SG_J_STATUS_ILHA,0]  := 'Ilha' ;
     Cells[SG_J_STATUS_EDICAO,0]  := 'Edi??o Texto' ;
     Cells[SG_J_STATUS_CAT,0] := 'Cat' ;
     End ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception TEspelho_RD RD INICIALIZAR_SG ' +
                '[' + E.Message + ']' ) ;
   End ;
End ;
_Debug ( 'FIM Espelho_RD INICIALIZAR_SG' ) ;
End ;

Procedure TEspelho_RD.RD_RENUMERAR_RETRANCAS ( Origem : String ; Buffer : LongInt ) ;
Var Local    : LongInt ;
    Numero   : LongInt ;
    Registro : T_Clip_Retranca ;
Begin
_Debug ( 'INI Espelho_RD RENUMERAR_RETRANCAS' ) ;
Try
   //PUT_LOG ( 'RD_RENUMERAR_RETRANCAS [' + Origem + ']' ) ;
   Case Buffer Of
   RD_BUFFER_MAIN : Begin
      If RD_VAR_QTDE_RETRANCAS = 0 Then Begin
         _Debug ( 'Exit = 0 Espelho_RD RENUMERAR_RETRANCAS' ) ;
         Exit ;
      End ;
      Numero := 1 ;
      For Local := 0 To RD_VAR_QTDE_RETRANCAS - 1 Do Begin
         Registro := RD_VAR_ARRAY_RETRANCAS [ Local ] ;
         If Registro.Is_Especial Then Begin
            RD_VAR_ARRAY_RETRANCAS[Local].Numero := 0 ;
            Continue ;
         End ;
         RD_VAR_ARRAY_RETRANCAS[Local].Numero := Numero ;
         Inc ( Numero ) ;
      End ;
      End ;
   RD_BUFFER_SAVE : Begin
      If RD_VAR_QTDE_RETRANCAS_SAVE = 0 Then Begin
         _Debug ( 'Exit Save = 0 Espelho_RD RENUMERAR_RETRANCAS' ) ;
         Exit ;
      End ;
      Numero := 1 ;
      For Local := 0 To RD_VAR_QTDE_RETRANCAS_SAVE - 1 Do Begin
         Registro := RD_VAR_ARRAY_RETRANCAS_SAVE [ Local ] ;
         If Registro.Is_Especial Then Begin
            RD_VAR_ARRAY_RETRANCAS_SAVE[Local].Numero := 0 ;
            Continue ;
         End ;
         RD_VAR_ARRAY_RETRANCAS_SAVE[Local].Numero := Numero ;
         Inc ( Numero ) ;
      End ;
      End ;
   RD_BUFFER_AUX : Begin
      If RD_VAR_QTDE_RETRANCAS_AUX = 0 Then Begin
         _Debug ( 'INI Aux = 0 Espelho_RD RENUMERAR_RETRANCAS' ) ;
         Exit ;
      End ;
      Numero := 1 ;
      For Local := 0 To RD_VAR_QTDE_RETRANCAS_AUX - 1 Do Begin
         Registro := RD_VAR_ARRAY_RETRANCAS_AUX [ Local ] ;
         If Registro.Is_Especial Then Begin
            RD_VAR_ARRAY_RETRANCAS_AUX[Local].Numero := 0 ;
            Continue ;
         End ;
         RD_VAR_ARRAY_RETRANCAS_AUX[Local].Numero := Numero ;
         Inc ( Numero ) ;
      End ;
      End ;
   End ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception TEspelho_RD RD_RENUMERAR_RETRANCAS ' +
                '[' + E.Message + ']' ) ;
   End ;
End ;
_Debug ( 'FIM Espelho_RD RENUMERAR_RETRANCAS' ) ;
End ;

Function TEspelho_RD.RD_IS_LINHA_ESPECIAL
         ( Retranca : String ) : Boolean ;
Begin
Result := ( Retranca = RD_STR_INICIO ) OR
          ( RD_IS_COMERCIAL ( Retranca ) ) OR
          ( Retranca = RD_STR_FINAL ) OR
          ( Retranca = RD_STR_INICIO_PREVIEW ) OR
          ( Retranca = RD_STR_FINAL_PREVIEW ) OR
          ( Retranca = RD_STR_INICIO_TRAFEGO ) OR
          ( Retranca = RD_STR_FINAL_TRAFEGO ) OR
          ( Retranca = RD_STR_INICIO_LIXEIRA ) OR
          ( Retranca = RD_STR_FINAL_LIXEIRA ) ;
End ;

Function TEspelho_RD.RD_GET_CELL ( Buffer : LongInt ; Linha, Coluna : LongInt ) : String ;
Var Registro : T_Clip_Retranca ;
Begin
Try
   Case Buffer Of
   RD_BUFFER_MAIN : Begin
      If Linha >= RD_VAR_QTDE_RETRANCAS Then Begin
         Result := '' ;
         Exit ;
      End  ;
      Registro := RD_VAR_ARRAY_RETRANCAS[Linha] ;
      End ;
   RD_BUFFER_SAVE : Begin
      If Linha >= RD_VAR_QTDE_RETRANCAS_SAVE Then Begin
         Result := '' ;
         Exit ;
      End  ;
      Registro := RD_VAR_ARRAY_RETRANCAS_SAVE[Linha] ;
      End ;
   RD_BUFFER_AUX : Begin
      If Linha >= RD_VAR_QTDE_RETRANCAS_AUX Then Begin
         Result := '' ;
         Exit ;
      End  ;
      Registro := RD_VAR_ARRAY_RETRANCAS_AUX[Linha] ;
      End ;
   Else
      Exit ;
   End ;
   Case Coluna Of
      RD_SG_J_NO              : Result := IntToStr ( Registro.Numero ) ;
      RD_SG_J_ANCORA          : Result := Registro.Ancora ;
      RD_SG_J_RETRANCA        : Result := Registro.Retranca ;
      RD_SG_J_TIPO            : Result := Registro.Tipo ;
      RD_SG_J_TOTAL           : Result := SegundosToMMSS ( Registro.Tempo_TT ) ;
      RD_SG_J_VT              : Result := SegundosToMMSS ( Registro.Tempo_VT ) ;
      RD_SG_J_EXT             : Result := SegundosToMMSS ( Registro.Tempo_Ext ) ;
      RD_SG_J_EDITOR          : Result := Registro.Editor ;
      RD_SG_J_GC              : Result := Registro.GC_Modificado ;
      RD_SG_J_ENTRADA         : Result := Registro.Entrada ;
      RD_SG_J_FITA            : Result := Registro.Fita ;
      RD_SG_J_STATUS          : Result := IntToStr ( Registro.Status ) ;
      RD_SG_J_STATUS_TP       : Result := IntToStr ( Registro.Status_TP ) ;
      RD_SG_J_STATUS_PROTECAO : Result := IntToStr ( Registro.Status_Protecao ) ;
      RD_SG_J_VIDEO           : Result := Registro.Video ;
      RD_SG_J_STATUS_ILHA     : Result := IntToStr ( Registro.Status_Ilha ) ;
      RD_SG_J_STATUS_EDICAO   : Result := IntToStr ( Registro.Status_Edicao ) ;
      RD_SG_J_STATUS_CAT      : Result := Registro.Categoria ;
   End ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception TEspelho_RD RD IS_LINHA_ESPECIAL ' +
                '[' + E.Message + ']' ) ;
   End ;
End ;
End ;

Function TEspelho_RD.RD_Retranca_Protegida
         ( Buffer : LongInt ; Linha : LongInt ) : Boolean ;
//Var Aux : String ;
Begin
Result := RD_GET_CELL ( Buffer, Linha, RD_SG_J_STATUS ) =
     IntToStr ( J_PROTEGIDA ) ;
If Trim ( RD_GET_CELL ( Buffer, Linha, RD_SG_J_STATUS_PROTECAO ) ) = '#' Then Begin
   Result := TRUE ;
End ;
End ;

Procedure TEspelho_RD.RD_SG_MOUSE_MOVE
          ( Sender: TObject; Shift: TShiftState; X, Y: Integer);
Var _Tag : LongInt ;
Begin
_Tag := (Sender As TStringGrid).Tag MOD 1000 ;
RD_VAR_ARRAY_SG[_Tag].Salva_X := X ;
RD_VAR_ARRAY_SG[_Tag].Salva_Y := Y ;
//Salva_X := X ;
//Salva_Y := Y ;
REFRESH_TIMEOUT ;
End ;

Procedure TEspelho_RD.RD_BOT_MENU_MOUSEMOVE
          ( Sender: TObject; Shift: TShiftState; X, Y: Integer);
Var _Tag : LongInt ;
Begin
//_Tag := (Sender As TRxSpeedButton).Tag MOD 1000 ;
RD_LAST_BOT_MENU := _Tag ;
End ;

procedure TEspelho_RD.RD_BOT_MENU_MOUSEENTER (Sender: TObject);
Var _Tag : LongInt ;
Begin
//_Tag := (Sender As TRxSpeedButton).Tag MOD 1000 ;
RD_LAST_BOT_MENU := _Tag ;
end;

procedure TEspelho_RD.RD_BOT_MENU_MOUSELEAVE (Sender: TObject);
begin
RD_LAST_BOT_MENU := -1 ;
end;

Procedure TEspelho_RD.RD_MONTAR_RE ( RE : TRichEdit ) ;
Begin
_Debug ( 'INI Espelho_RD MONTAR_RE' ) ;
Try
   RE.Text := TRIM_LINHAS ( RD_KERNEL_GET_CABECA ( RD_VAR_ESPELHO_ATUAL.Selecionada.Retranca ) ) ;
   RE.Text := REMOVER_LINHAS_DUPLAS_STR ( RE.Text ) ;
Except
End ;
_Debug ( 'FIM Espelho_RD MONTAR_RE' ) ;
End ;

Procedure TEspelho_RD.RD_MONTAR_RE_MY ( RE : TMyRichEdit ) ;
Begin
_Debug ( 'INI Espelho_RD MONTAR_RE_MY' ) ;
Try
   RE.Text := TRIM_LINHAS ( RD_KERNEL_GET_CABECA ( RD_VAR_ESPELHO_ATUAL.Selecionada.Retranca ) ) ;
   RE.Text := REMOVER_LINHAS_DUPLAS_STR ( RE.Text ) ;
Except
End ;
_Debug ( 'FIM Espelho_RD MONTAR_RE_MY' ) ;
End ;

Procedure TEspelho_RD.RD_MONTAR_RE_GC ( RE : TRichEdit ) ;
Begin
_Debug ( 'INI Espelho_RD MONTAR_RE_GC' ) ;
Try
   RE.Text := TRIM_LINHAS ( RD_KERNEL_GET_GC ( RD_VAR_ESPELHO_ATUAL.Selecionada.Retranca ) ) ;
   RE.Text := REMOVER_LINHAS_DUPLAS_STR ( RE.Text ) ;
Except
End ;
_Debug ( 'FIM Espelho_RD MONTAR_RE_GC' ) ;
End ;

Procedure TEspelho_RD.RD_MONTAR_RE_MY_GC ( RE : TMyRichEdit ) ;
Var Aux1 : String ;
    Aux2 : String ;
Begin
_Debug ( 'INI Espelho_RD MONTAR_RE_MY_GC' ) ;
Try
   Aux1 := RD_KERNEL_GET_GC ( RD_VAR_ESPELHO_ATUAL.Selecionada.Retranca ) ;
   Aux2 := TRIM_LINHAS ( Aux1 ) ;
   RE.Text := REMOVER_LINHAS_DUPLAS_STR ( Aux2 ) ;
Except
End ;
{
ShowMessage ( 'RD_MONTAR RE_MY_GC Name[' + RE.Name + ']' +
          '[' + RD_VAR_ESPELHO_ATUAL.Selecionada.Retranca + ']' +
          '[RE/' + RE.Text + ']' + sLineBreak + sLineBreak +
          '[1/' + Aux1 + ']' + sLineBreak + sLineBreak +
          '[2/' + Aux2 + ']'  ) ;
}
_Debug ( 'FIM Espelho_RD MONTAR_RE_MY_GC' ) ;
End ;

Procedure TEspelho_RD.RD_MONTAR_RE_MY_GC2 ( RE : TMyRichEdit ) ;
Begin
_Debug ( 'INI Espelho_RD MONTAR_RE_MY_GC2' ) ;
Try
   RE.Text := TRIM_LINHAS ( RD_KERNEL_GET_GC2 ( RD_VAR_ESPELHO_ATUAL.Selecionada.Retranca ) ) ;
   RE.Text := REMOVER_LINHAS_DUPLAS_STR ( RE.Text ) ;
Except
End ;
_Debug ( 'FIM Espelho_RD MONTAR_RE_MY_GC2' ) ;
End ;

Procedure TEspelho_RD.RD_MONTAR_RE_MY_GC2_AUTO ( RE : TMyRichEdit ) ;
Begin
_Debug ( 'INI Espelho_RD MONTAR_RE_MY_GC2_AUTO' ) ;
Try
   RE.Text := TRIM_LINHAS ( RD_KERNEL_GET_GC2_AUTO ( RD_VAR_ESPELHO_ATUAL.Selecionada.Retranca ) ) ;
   RE.Text := REMOVER_LINHAS_DUPLAS_STR ( RE.Text ) ;
Except
End ;
_Debug ( 'FIM Espelho_RD MONTAR_RE_MY_GC2_AUTO' ) ;
End ;

Procedure TEspelho_RD.RD_PN_WAIT ( _Msg : String ) ;
Var Local : LongInt ;
Begin
If RD_VAR_QTDE_PN_WAIT = 0 Then Begin
   Exit ;
End ;
For Local := 0 To RD_VAR_QTDE_PN_WAIT - 1 Do Begin
   If _Msg <> '' Then Begin
      RD_VAR_ARRAY_PN_WAIT[Local].PN.Caption := _Msg ;
      RD_VAR_ARRAY_PN_WAIT[Local].PN.Show ;
   End Else Begin
      RD_VAR_ARRAY_PN_WAIT[Local].PN.Caption := '' ;
      RD_VAR_ARRAY_PN_WAIT[Local].PN.Hide ;
   End
End ;
End ;

Procedure TEspelho_RD.RD_PLOTAR_LB_TEMPOS ;
Var Local : LongInt ;
Begin
//_Debug ( 'INI Espelho_RD PLOTAR_LB_TEMPOS' ) ;
If RD_VAR_QTDE_LB_TEMPO_TT > 0 Then Begin
   For Local := 0 To RD_VAR_QTDE_LB_TEMPO_TT - 1 Do Begin
      RD_VAR_ARRAY_LB_TEMPO_TT[Local].LB.Caption :=
           SegundosToMMMSS ( RD_VAR_TEMPO_TT, 5 ) ;
   End ;
End ;
If RD_VAR_QTDE_LB_TEMPO_BREAK > 0 Then Begin
   For Local := 0 To RD_VAR_QTDE_LB_TEMPO_BREAK - 1 Do Begin
      RD_VAR_ARRAY_LB_TEMPO_BREAK[Local].LB.Caption :=
           SegundosToMMMSS ( RD_VAR_TEMPO_BREAK, 5 ) ;
   End ;
End ;
If RD_VAR_QTDE_LB_TEMPO_PRODUCAO > 0 Then Begin
   For Local := 0 To RD_VAR_QTDE_LB_TEMPO_PRODUCAO - 1 Do Begin
      RD_VAR_ARRAY_LB_TEMPO_PRODUCAO[Local].LB.Caption :=
           SegundosToMMMSS ( RD_VAR_TEMPO_PRODUCAO, 5 ) ;
   End ;
End ;
If RD_VAR_QTDE_LB_RESTANTE > 0 Then Begin
   For Local := 0 To RD_VAR_QTDE_LB_RESTANTE - 1 Do Begin
      RD_VAR_ARRAY_LB_RESTANTE[Local].LB.Caption :=
           RD_VAR_TEMPO_RESTANTE_STR ;
   End ;
End ;
//_Debug ( 'FIM Espelho_RD PLOTAR_LB_TEMPOS' ) ;
End ;


(*
Procedure TEspelho_RD.RD_LOAD_ARQUIVOS_LAUDA ( Origem : String ;
                                               Var Registro : T_Clip_Retranca ) ;
Var Indice   : LongInt ;
    Retranca : String ;
Begin
_Debug ( 'INI RD LOAD_ARQUIVOS_LAUDA' ) ;
PUSH_TICK ( 'RD LOAD_ARQUIVOS_LAUDA' ) ;
Indice := RD_GET_INDICE_RETRANCA ( RD_BUFFER_MAIN, Registro.Retranca ) ;
With Registro Do Begin
//   CONTEUDO_RETRANCA := RD_KERNEL_LOAD_RETRANCA_CABECA ( 'RD ATUALIZAR_SEL_RETRANCA/1', Retranca ) ;
//   CONTEUDO_GC := RD_KERNEL_LOAD_RETRANCA_GC ( 'RD ATUALIZAR_SEL_RETRANCA/2', Retranca ) ;
   RD_KERNEL_FILE_AGE ( FN_GC1, AGE_GC ) ;
   RD_KERNEL_SET_GC2_AUTO ( Retranca ,
                            RD_GC_ANTIGO ( -1, Retranca,
                                           RD_KERNEL_GET_CABECA(Retranca),
                                           DEBUG_FALSE ) ) ;
   //
   If RR_FileExists ( FN_GC2 ) Then Begin
//      CONTEUDO_GC2 := RD_KERNEL_LOAD_RETRANCA_GC2 ( 'RD ATUALIZAR_SEL_RETRANCA/3', Retranca ) ;
      RD_KERNEL_FILE_AGE ( FN_GC2, AGE_GC2 ) ;
   End Else Begin
      RD_KERNEL_SET_GC2 ( Retranca , RD_KERNEL_GET_GC2_AUTO ( Retranca ) ) ;
      AGE_GC2 := 0 ;
   End ;
   //
   If NOT Sys_Usuario_Aplicativo.Sys_GC Then Begin
      RD_KERNEL_SET_VT ( Retranca, RD_KERNEL_LOAD_RETRANCA_VT ( 'RD ATUALIZAR_SEL_RETRANCA/4', Retranca ) ) ;
      RD_KERNEL_SET_CC ( Retranca, RD_KERNEL_LOAD_RETRANCA_CC ( 'RD ATUALIZAR_SEL_RETRANCA/5', Retranca ) ) ;
      RD_KERNEL_SET_OFF ( Retranca, RD_KERNEL_LOAD_RETRANCA_OFF ( 'RD ATUALIZAR_SEL_RETRANCA/6', Retranca ) ) ;
   End ;
   {
   If Indice >= 0 Then Begin
      RD_VAR_ARRAY_RETRANCAS[Indice].CONTEUDO_RETRANCA := CONTEUDO_RETRANCA ;
      RD_VAR_ARRAY_RETRANCAS[Indice].CONTEUDO_GC := CONTEUDO_GC ;
      RD_VAR_ARRAY_RETRANCAS[Indice].CONTEUDO_GC2 := CONTEUDO_GC2 ;
      If NOT Sys_Usuario_Aplicativo.Sys_GC Then Begin
         RD_VAR_ARRAY_RETRANCAS[Indice].CONTEUDO_VT := CONTEUDO_VT ;
         RD_VAR_ARRAY_RETRANCAS[Indice].CONTEUDO_CC := CONTEUDO_CC ;
         RD_VAR_ARRAY_RETRANCAS[Indice].CONTEUDO_OFF := CONTEUDO_OFF ;
      End ;
   End ;
   }
End ;
POP_TICK ( 'RD LOAD_ARQUIVOS_LAUDA' ) ;
_Debug ( 'FIM RD LOAD_ARQUIVOS_LAUDA' ) ;
End ;
*)

Procedure TEspelho_RD.RD_ATUALIZAR_SEL_RETRANCA ( Origem : String ;
                                                  Registro, Registro_Next : T_Clip_Retranca ) ;
Var Local : LongInt ;
Begin
_Debug ( 'INI Espelho_RD ATUALIZAR_SEL_RETRANCA' ) ;
PUSH_TICK ( 'RD ATUALIZAR_SEL_RETRANCA' ) ;
PUT_LOG ( 'RD_ATUALIZAR SEL_RETRANCA Ret[' + Registro.Retranca + '] ' +
          'Q-MyGC[' + IntToStr ( RD_VAR_QTDE_RE_MY_GC ) + ']' ) ;
{
PUT_LOG ( 'RD ATUALIZAR_SEL_RETRANCA ' +
          'R[' + Registro.Retranca + '] ' +
          'RN[' + Registro_Next.Retranca + '] ' +
          'OR[' + Origem + ']' ) ;
}
//PUT_LOG ( 'TEspelho_RD.RD ATUALIZAR_SEL_RETRANCA ' +
//          '[' + Registro.Retranca + ']' ) ;
RD_PN_WAIT ( 'Carregando Retranca ' + Registro.Retranca ) ;

RD_VAR_ESPELHO_ATUAL.Selecionada := Registro ;
PUT_STATUS ( 'Retranca selecionada para visualiza??o [' + Registro.Retranca + ']' ) ;
//RD_LOAD_ARQUIVOS_LAUDA ( 'RD_ATUALIZAR_SEL_RETRANCA/1', RD_VAR_ESPELHO_ATUAL.Selecionada ) ;
If RD_VAR_QTDE_RE > 0 Then Begin
   For Local := 0 To RD_VAR_QTDE_RE - 1 Do Begin
      RD_MONTAR_RE ( RD_VAR_ARRAY_RE[Local].RE ) ;
   End ;
End ;
If RD_VAR_QTDE_RE_MY > 0 Then Begin
   For Local := 0 To RD_VAR_QTDE_RE_MY - 1 Do Begin
      RD_MONTAR_RE_MY ( RD_VAR_ARRAY_RE_MY[Local].RE ) ;
   End ;
End ;
If RD_VAR_QTDE_RE_GC > 0 Then Begin
   For Local := 0 To RD_VAR_QTDE_RE_GC - 1 Do Begin
      RD_MONTAR_RE_GC ( RD_VAR_ARRAY_RE_GC[Local].RE ) ;
   End ;
End ;
If RD_VAR_QTDE_RE_MY_GC > 0 Then Begin
   For Local := 0 To RD_VAR_QTDE_RE_MY_GC - 1 Do Begin
      RD_MONTAR_RE_MY_GC ( RD_VAR_ARRAY_RE_MY_GC[Local].RE ) ;
   End ;
End ;
If RD_VAR_QTDE_RE_MY_GC2 > 0 Then Begin
   For Local := 0 To RD_VAR_QTDE_RE_MY_GC2 - 1 Do Begin
      RD_MONTAR_RE_MY_GC2 ( RD_VAR_ARRAY_RE_MY_GC2[Local].RE ) ;
   End ;
End ;
If RD_VAR_QTDE_RE_MY_GC2_AUTO > 0 Then Begin
   For Local := 0 To RD_VAR_QTDE_RE_MY_GC2_AUTO - 1 Do Begin
      RD_MONTAR_RE_MY_GC2_AUTO ( RD_VAR_ARRAY_RE_MY_GC2_AUTO[Local].RE ) ;
   End ;
End ;
If RD_VAR_QTDE_RE_CC > 0 Then Begin
   For Local := 0 To RD_VAR_QTDE_RE_CC - 1 Do Begin
      RD_MONTAR_RE ( RD_VAR_ARRAY_RE_CC[Local].RE ) ;
   End ;
End ;
If RD_VAR_QTDE_RE_OFF > 0 Then Begin
   For Local := 0 To RD_VAR_QTDE_RE_OFF - 1 Do Begin
      RD_MONTAR_RE ( RD_VAR_ARRAY_RE_OFF[Local].RE ) ;
   End ;
End ;
If RD_VAR_QTDE_PN_RET > 0 Then Begin
   For Local := 0 To RD_VAR_QTDE_PN_RET - 1 Do Begin
      RD_VAR_ARRAY_PN_RET2[Local].PN.Caption := Registro.Retranca ;
   End ;
End ;
//
If RD_RETRANCA_NEXT_HABILITADA Then Begin
   RD_VAR_ESPELHO_ATUAL.Selecionada_Next := Registro_Next ;
   //RD_LOAD_ARQUIVOS_LAUDA ( 'RD_ATUALIZAR_SEL_RETRANCA/2', RD_VAR_ESPELHO_ATUAL.Selecionada_Next ) ;
   (*
   RD_VAR_ESPELHO_ATUAL.Selecionada_Next.RD_VAR_CONTEUDO_RETRANCA :=
         RD_KERNEL_LOAD_RETRANCA_CABECA ( 'RD ATUALIZAR_SEL_RETRANCA/7',
                                          RD_VAR_ESPELHO_ATUAL.Selecionada_Next.Retranca ) ;
   RD_VAR_ESPELHO_ATUAL.Selecionada_Next.RD_VAR_CONTEUDO_GC :=
         RD_KERNEL_LOAD_RETRANCA_GC ( 'RD ATUALIZAR_SEL_RETRANCA/8',
                                      RD_VAR_ESPELHO_ATUAL.Selecionada_Next.Retranca ) ;
   RD_KERNEL_FILE_AGE ( RD_VAR_ESPELHO_ATUAL.Selecionada_Next.RD_VAR_FILENAME_GC1 ,
                        RD_VAR_ESPELHO_ATUAL.Selecionada_Next.RD_VAR_AGE_GC ) ;
   RD_VAR_ESPELHO_ATUAL.Selecionada_Next.RD_VAR_CONTEUDO_GC2_AUTO :=
         RD_GC_ANTIGO ( -1, RD_VAR_ESPELHO_ATUAL.Selecionada_Next.Retranca,
                        RD_VAR_ESPELHO_ATUAL.Selecionada_Next.RD_VAR_CONTEUDO_GC ,
                        DEBUG_FALSE ) ;
   If RR_FileExists ( RD_VAR_ESPELHO_ATUAL.Selecionada_Next.RD_VAR_FILENAME_GC2 ) Then Begin
      RD_VAR_ESPELHO_ATUAL.Selecionada_Next.RD_VAR_CONTEUDO_GC2 :=
           RD_KERNEL_LOAD_RETRANCA_GC2 ( 'RD ATUALIZAR_SEL_RETRANCA/9',
                                         RD_VAR_ESPELHO_ATUAL.Selecionada_Next.Retranca ) ;
      RD_KERNEL_FILE_AGE ( RD_VAR_ESPELHO_ATUAL.Selecionada_Next.RD_VAR_FILENAME_GC2 ,
                           RD_VAR_ESPELHO_ATUAL.Selecionada_Next.RD_VAR_AGE_GC2 ) ;
   End Else Begin
      RD_VAR_ESPELHO_ATUAL.Selecionada_Next.RD_VAR_CONTEUDO_GC2 :=
           RD_VAR_ESPELHO_ATUAL.Selecionada_Next.RD_VAR_CONTEUDO_GC2_AUTO ;
      RD_VAR_ESPELHO_ATUAL.Selecionada_Next.RD_VAR_AGE_GC2 := 0 ;
   End ;
   If NOT Sys_Usuario_Aplicativo.Sys_GC Then Begin
      RD_VAR_ESPELHO_ATUAL.Selecionada_Next.RD_VAR_CONTEUDO_VT :=
           RD_KERNEL_LOAD_RETRANCA_VT ( 'RD ATUALIZAR_SEL_RETRANCA/10',
                                        RD_VAR_ESPELHO_ATUAL.Selecionada_Next.Retranca ) ;
      RD_VAR_ESPELHO_ATUAL.Selecionada_Next.RD_VAR_CONTEUDO_CC :=
           RD_KERNEL_LOAD_RETRANCA_CC ( 'RD ATUALIZAR_SEL_RETRANCA/11',
                                        RD_VAR_ESPELHO_ATUAL.Selecionada_Next.Retranca ) ;
      RD_VAR_ESPELHO_ATUAL.Selecionada_Next.RD_VAR_CONTEUDO_OFF :=
           RD_KERNEL_LOAD_RETRANCA_OFF ( 'RD ATUALIZAR_SEL_RETRANCA/12',
                                         RD_VAR_ESPELHO_ATUAL.Selecionada_Next.Retranca ) ;
   End ;
   *)
End ;
If RD_VAR_QTDE_PN_RET_NEXT > 0 Then Begin
   For Local := 0 To RD_VAR_QTDE_PN_RET_NEXT - 1 Do Begin
      If RD_RETRANCA_NEXT_HABILITADA Then Begin
         RD_VAR_ARRAY_PN_RET_NEXT[Local].PN.Caption := Registro_Next.Retranca ;
      End Else Begin
         RD_VAR_ARRAY_PN_RET_NEXT[Local].PN.Caption := '-' ;
      End ;
   End ;
End ;
RD_PN_WAIT ( '' ) ;
POP_TICK ( 'RD ATUALIZAR_SEL_RETRANCA' ) ;
_Debug ( 'FIM Espelho_RD ATUALIZAR_SEL_RETRANCA' ) ;
End ;

procedure TEspelho_RD.RD_SG_MOUSE_DOWN
          ( Sender: TObject; Button: TMouseButton;
            Shift: TShiftState; X, Y: Integer) ;
Var Aux     : LongInt ;
    Buffer  : LongInt ;
    _Tag    : LongInt ;
    SG      : TStringGrid ;
    pnt     : TPoint ;
begin
_Debug ( 'INI Espelho_RD SG_MOUSE_DOWN' ) ;
SG := (Sender As TStringGrid) ;
Buffer := SG.Tag DIV 1000 ;
_Tag := SG.Tag MOD 1000 ;
RD_VAR_ARRAY_SG[_Tag].Salva_X := X ;
RD_VAR_ARRAY_SG[_Tag].Salva_Y := Y ;
If Button = mbRight Then Begin
   Case Buffer Of
   RD_BUFFER_MAIN : Begin
      If SG.FixedRows = 0 Then Begin
         Aux := SG.TopRow +
                ( RD_VAR_ARRAY_SG[_Tag].Salva_Y DIV ( SG.DefaultRowHeight + 1 ) ) ;
      End Else Begin
         Aux := SG.TopRow +
                ( RD_VAR_ARRAY_SG[_Tag].Salva_Y DIV ( SG.DefaultRowHeight + 1 ) ) - 1 ;
      End ;
      If ( Aux < SG.RowCount ) AND ( Aux > 1 ) Then Begin
         PUT_LOG ( 'MODIFY_ROW SG.Row MAIN ' +
                   SG.Name + ' RD_SG_MOUSE_DOWN' ) ;
         RD_SELECT_SG_ROW ( SG, Aux, TRUE ) ;
      End ;
      PUT_LOG ( 'MouseDown Main' + sLineBreak + sLineBreak +
                GET_FULL_PARENT ( SG ) + '.' + SG.Name + sLineBreak +
                sLineBreak +
                'Buffer[' + IntToStr(Buffer) + '] ' +
                'Y[' + IntToStr(RD_VAR_ARRAY_SG[_Tag].Salva_Y) + '] ' +
                'Top[' + IntToStr(SG.TopRow) + '] ' +
                'Tag[' + IntToStr(_Tag) + '] ' +
                'Aux[' + IntToStr(Aux) + ']' ) ;
      {$IFDEF NW}
      If (Sender As TStringGrid) = Main.SG_J2 Then Begin
         If GetCursorPos(pnt) Then Begin
            //Application.ProcessMessages ;
            RD_VAR_POINT_POPUPMENU_MAIN_SG := pnt ;
//            Main.PM_SG_J.Popup(pnt.X, pnt.Y);
         End ;
      End ;
      {$ENDIF}
      End ;
   RD_BUFFER_AUX : Begin
      If SG.FixedRows = 0 Then Begin
         Aux := SG.TopRow +
                ( RD_VAR_ARRAY_SG_AUX[_Tag].Salva_Y DIV ( SG.DefaultRowHeight + 1 ) ) ;
      End Else Begin
         Aux := SG.TopRow +
                ( RD_VAR_ARRAY_SG_AUX[_Tag].Salva_Y DIV ( SG.DefaultRowHeight + 1 ) ) - 1 ;
      End ;
      If ( Aux < SG.RowCount ) AND ( Aux > 1 ) Then Begin
         PUT_LOG ( 'MODIFY_ROW SG.Row AUX ' +
                   SG.Name + ' RD_SG_MOUSE_DOWN' ) ;
         RD_SELECT_SG_ROW ( SG, Aux, TRUE ) ;
      End ;
      PUT_LOG ( 'MouseDown Aux' + sLineBreak + sLineBreak +
                GET_FULL_PARENT ( SG ) + '.' + SG.Name + sLineBreak +
                sLineBreak +
                'Buffer[' + IntToStr(Buffer) + '] ' +
                'Y[' + IntToStr(RD_VAR_ARRAY_SG_AUX[_Tag].Salva_Y) + '] ' +
                'Top[' + IntToStr(SG.TopRow) + '] ' +
                'Tag[' + IntToStr(_Tag) + '] ' +
                'Aux[' + IntToStr(Aux) + ']' ) ;
      End ;
   End ;
End ;
_Debug ( 'FIM Espelho_RD SG_MOUSE_DOWN' ) ;
end;

Function TEspelho_RD.RD_RETRANCA_EXISTE_NO_ESPELHO ( Buffer : LongInt ;
                                                     Retranca : String ;
                                                     Var Temp : T_Clip_Retranca ) : LongInt ;
Var Local : LongInt ;
Begin
Result := -1 ;
_Debug ( 'INI Espelho_RD RETRANCA_EXISTE_NO_ESPELHO' ) ;
Case Buffer Of
RD_BUFFER_MAIN : Begin
   If RD_VAR_QTDE_RETRANCAS = 0 Then Begin
      Temp.Valido2 := FALSE ;
      Exit ;
   End  ;
   For Local := 0 To RD_VAR_QTDE_RETRANCAS - 1 Do Begin
      If RD_VAR_ARRAY_RETRANCAS[Local].Retranca = Retranca Then Begin
         Result := Local ;
         Temp := RD_VAR_ARRAY_RETRANCAS[Local] ;
         _Debug ( 'Exit OK 1 Espelho_RD RETRANCA_EXISTE_NO_ESPELHO' ) ;
         Exit ;
      End ;
   End ;
   End ;
RD_BUFFER_SAVE : Begin
   If RD_VAR_QTDE_RETRANCAS_SAVE = 0 Then Begin
      Temp.Valido2 := FALSE ;
      Exit ;
   End  ;
   For Local := 0 To RD_VAR_QTDE_RETRANCAS_SAVE - 1 Do Begin
      If RD_VAR_ARRAY_RETRANCAS_SAVE[Local].Retranca = Retranca Then Begin
         Result := Local ;
         Temp := RD_VAR_ARRAY_RETRANCAS_SAVE[Local] ;
         _Debug ( 'Exit OK Save Espelho_RD RETRANCA_EXISTE_NO_ESPELHO' ) ;
         Exit ;
      End ;
   End ;
   End ;
RD_BUFFER_AUX : Begin
   If RD_VAR_QTDE_RETRANCAS_AUX = 0 Then Begin
      Temp.Valido2 := FALSE ;
      Exit ;
   End  ;
   For Local := 0 To RD_VAR_QTDE_RETRANCAS_AUX - 1 Do Begin
      If RD_VAR_ARRAY_RETRANCAS_AUX[Local].Retranca = Retranca Then Begin
         Result := Local ;
         Temp := RD_VAR_ARRAY_RETRANCAS_AUX[Local] ;
         _Debug ( 'Exit OK Aux Espelho_RD RETRANCA_EXISTE_NO_ESPELHO' ) ;
         Exit ;
      End ;
   End ;
   End ;
End ;
_Debug ( 'FIM Espelho_RD RETRANCA_EXISTE_NO_ESPELHO' ) ;
End ;

procedure TEspelho_RD.RD_EXPANDIR_CLICK_PARA_SGS_CONTROLADOS
          ( _Row : LongInt ) ;
Var Buffer : LongInt ;
Begin
_Debug ( 'INI Espelho_RD EXPANDIR_CLICK_PARA_SGS_CONTROLADOS' ) ;
For Buffer := RD_BUFFER_MAIN To RD_BUFFER_LAST Do
   Begin
   //RD_EXPANDIR_CLICK_PARA_SG_CONTROLADO ( Buffer, _Row ) ;
   End ;
_Debug ( 'FIM Espelho_RD EXPANDIR_CLICK_PARA_SGS_CONTROLADOS' ) ;
End ;

Procedure TEspelho_RD.RD_FORCE_LOAD_SAVE_ESPELHO ;
Var FN   : String ;
    Aux  : String ;
Begin
If NOT RD_VAR_ESPELHO_ATUAL.Aberto2 Then Begin
   Exit ;
End ;
FN := RD_MONTAR_NOME_JORNAL ;
//Aux := GET_CONTEUDO_xM ( 'RD_FORCE_LOAD_SAVE_ESPELHO', RD_MONTAR_NOME_JORNAL ) ;
Aux := RD_KERNEL_LOAD_ESPELHO ( 'RD_FORCE_LOAD_SAVE_ESPELHO' ) ;
If Aux <> '' Then Begin
   PUT_CACHE_GRAVACAO ( 'RD FORCE_LOAD_SAVE_ESPELHO', 500, RD_MONTAR_NOME_JORNAL, Aux ) ;
   {
   //WRITE_FILE_CORE ( 'RD FORCE_LOAD_SAVE_ESPELHO' ,
                     RD_MONTAR_NOME_JORNAL,
                     Aux,
                     DELAYED_FALSE ) ;
   }
End ;
End ;

Procedure TEspelho_RD.RD_EXECUTE_SG_CLICK ;
{$IFDEF NW}
Var Registro  : T_Clip_Retranca ;
    Reg       : T_RD_Tempos ;
{$ENDIF}
Begin
{$IFDEF NW}
_Debug ( 'INI Espelho_RD EXECUTE_SG_CLICK' ) ;
If Length ( RD_VAR_ARRAY_SG ) = 0 Then Begin
   PUT_LOG ( 'TEspelho_RD.RD EXECUTE_SG_CLICK Exit RD_VAR_ARRAY_SG ' +
             'Length Zero' ) ;
   LIMPAR_RASTROS_RETRANCA ;
   Exit ;
End ;
RD_CLEAR_REG_TEMPOS ( Reg ) ;
_Debug ( '1 Espelho_RD EXECUTE_SG_CLICK' ) ;
PLOTAR_TEMPOS_LAUDA ( Reg, Main.LB_Lauda_Total,
                      Main.LB_Lauda_Locucao, Main.LB_Lauda_VTs,
                      Main.LB_Lauda_Externas, Main.LB_Lauda_Entrevista ) ;
_Debug ( '2 Espelho_RD EXECUTE_SG_CLICK ' +
         'Tag[' + IntToStr(RD_VAR_REG_TASK_SG_CLICK._Tag) + ']'  ) ;
If ( RD_VAR_REG_TASK_SG_CLICK.Buffer = RD_BUFFER_MAIN ) AND
   ( Boot_OK ) AND
   ( RD_VAR_ARRAY_SG[RD_VAR_REG_TASK_SG_CLICK._Tag].Reload_Editor_Lauda ) Then Begin
   _Debug ( '3 Espelho_RD EXECUTE_SG_CLICK' ) ;
   Registro := RD_CARREGAR_REGISTRO_RETRANCA ( RD_BUFFER_MAIN, RD_VAR_REG_TASK_SG_CLICK.Indice ) ;
   LIMPAR_RASTROS_RETRANCA ;
   RD_VAR_Last_GC_Fixa_Cmd := 0 ;
   RD_VAR_Last_GC_Fixa_L1 := '' ;
   RD_VAR_Last_GC_Fixa_L2 := '' ;
   RD_VAR_Last_GC_Fixa_Lauda := '' ;
   RD_VAR_Last_GC_Fixa_Retranca := '' ;
   //CARREGAR_OFF_TXT ( Registro.Retranca ) ;
   //RD_VAR_ESPELHO_ATUAL.Reg_Editor_GC := Registro ;
   RD_CARREGAR_LAUDA ( 'RD EXECUTE_SG_CLICK', Registro ) ;
   //PREPARAR_AMBIENTE_PARA_EDICAO_DE_LAUDA ( 'RD EXECUTE_SG_CLICK' ) ;
   _Debug ( 'Exit Espelho_RD EXECUTE_SG_CLICK' ) ;
   Exit ;
End ;
_Debug ( '4 Espelho_RD EXECUTE_SG_CLICK' ) ;
If Main.IS_MAIN_ACTIVE_CONTROL_SG_J2 Then Begin
   RD_VAR_PROCESSAR_CHYRON := TRUE ;
End ;
Case RD_VAR_REG_TASK_SG_CLICK.Buffer Of
RD_BUFFER_MAIN : Begin
   _Debug ( '5 Espelho_RD EXECUTE_SG_CLICK' ) ;
   Main.SET_PC ( Main.PC_Left, Main.TS_Left_Retranca ) ;
   If ( RD_VAR_REG_TASK_SG_CLICK.SG.Row > 0 ) AND
      ( RD_VAR_REG_TASK_SG_CLICK.Indice < RD_VAR_QTDE_RETRANCAS ) AND
      ( RD_VAR_QTDE_RETRANCAS > 0 ) Then Begin
      RD_VAR_ARRAY_SG[RD_VAR_REG_TASK_SG_CLICK._Tag].Retranca_Sel :=
          RD_VAR_ARRAY_RETRANCAS[RD_VAR_REG_TASK_SG_CLICK.Indice].Retranca ;
      If ( RD_VAR_ARRAY_SG[RD_VAR_REG_TASK_SG_CLICK._Tag].Controlador ) Then Begin
         If ( RD_VAR_ESPELHO_ATUAL.Selecionada.Retranca <>
            RD_VAR_ARRAY_RETRANCAS[RD_VAR_REG_TASK_SG_CLICK.Indice].Retranca ) OR
            ( RD_SG_CLICK_MODO_FORCADO ) Then Begin
            If RD_VAR_PROCESSAR_CHYRON Then Begin
               If RD_VAR_REG_TASK_SG_CLICK.Indice < ( RD_VAR_QTDE_RETRANCAS - 1 ) Then Begin
                  RD_ATUALIZAR_SEL_RETRANCA ( 'TEspelho_RD.RD EXECUTE_SG_CLICK/1',
                     RD_VAR_ARRAY_RETRANCAS[RD_VAR_REG_TASK_SG_CLICK.Indice],
                     RD_VAR_ARRAY_RETRANCAS[RD_VAR_REG_TASK_SG_CLICK.Indice+1] ) ;
               End Else Begin
                  RD_ATUALIZAR_SEL_RETRANCA ( 'TEspelho_RD.RD EXECUTE_SG_CLICK/2',
                     RD_VAR_ARRAY_RETRANCAS[RD_VAR_REG_TASK_SG_CLICK.Indice],
                     RD_VAR_ARRAY_RETRANCAS[RD_VAR_REG_TASK_SG_CLICK.Indice] ) ;
               End ;
               LIMPAR_RASTROS_RETRANCA ;
               If Sys_Usuario_Aplicativo.Sys_GC Then Begin
                  //CCH_Next.CCH_LIMPAR_CONTROLE ( 0, DEF_CCH_MAX - 1 ) ;
                  //CCH.CCH_LIMPAR_CONTROLE ( 0, DEF_CCH_MAX - 1 ) ;
                  Main.PROCESSAMENTO_CHYRON ( RD_VAR_ESPELHO_ATUAL.Selecionada,
                                              RD_VAR_ESPELHO_ATUAL.Selecionada_Next,
                                              'RD_SG_CLICK' ) ;
               End ;
            End Else Begin
               PUT_LOG ( '!RD_VAR PROCESSAR_CHYRON Ret[' +
                         RD_VAR_ESPELHO_ATUAL.Selecionada.Retranca + ']' ) ;
            End ;
            ATUALIZACAO_DIRECAO_DE_IMAGENS ;
         End ;
         RD_EXPANDIR_CLICK_PARA_SGS_CONTROLADOS ( RD_VAR_REG_TASK_SG_CLICK.SG.Row ) ;
         If RD_VAR_PROCESSAR_CHYRON Then Begin
            RD_VAR_INDICE_GC_GO2 := RD_GET_POSICAO_CCH_RETRANCA (
                                       RD_VAR_ARRAY_RETRANCAS[RD_VAR_REG_TASK_SG_CLICK.Indice].Retranca ) ; // 0
            Try
               If CCH.CCH_Celulas[RD_VAR_INDICE_GC_GO2]._Msg = 0 Then Begin
                  RD_VAR_INDICE_GC_GO2 := 0 ;
               End ;
               CCH.SELECIONAR_MEMO ( 'RD EXECUTE_SG_CLICK/' + IntToStr(RD.RD_VAR_INDICE_GC_GO2),
                                     CCH.CCH_Celulas[RD_VAR_INDICE_GC_GO2].ME_CCH ) ;
            Except
            End ;
         End ;
      End Else Begin
      End ;
   End ;
   RD_VAR_PROCESSAR_CHYRON := FALSE ;
   End ;
RD_BUFFER_AUX : Begin
   _Debug ( '6 Espelho_RD EXECUTE_SG_CLICK' ) ;
   If ( RD_VAR_REG_TASK_SG_CLICK.SG.Row > 0 ) AND
      ( RD_VAR_REG_TASK_SG_CLICK.Indice < RD_VAR_QTDE_RETRANCAS_AUX ) AND
      ( RD_VAR_QTDE_RETRANCAS_AUX > 0 ) Then Begin
      If ( RD_VAR_ARRAY_SG_AUX[RD_VAR_REG_TASK_SG_CLICK._Tag].Controlador ) Then Begin
         RD_VAR_ARRAY_SG_AUX[RD_VAR_REG_TASK_SG_CLICK._Tag].Retranca_Sel :=
              RD_VAR_ARRAY_RETRANCAS_AUX[RD_VAR_REG_TASK_SG_CLICK.Indice].Retranca ;
         {
         PUT_LOG ( 'Click/2' + ' ' +
                   GET_FULL_PARENT ( SG ) + '.' + SG.Name + ' ' +
                   'Buffer[' + IntToStr(Buffer) + '] ' +
                   '_Tag[' + IntToStr(_Tag) + '] ' +
                   'Indice[' + IntToStr(Indice) + ']' ) ;
         }
      End ;
   End ;
   End ;
End ;
_Debug ( '7 Espelho_RD EXECUTE_SG_CLICK' ) ;
RD_SG_CLICK_MODO_FORCADO := FALSE ;
If RD_VAR_ARRAY_SG[RD_VAR_REG_TASK_SG_CLICK._Tag].Main Then
   Begin
   _Debug ( '8 Espelho_RD EXECUTE_SG_CLICK' ) ;
   VALIDAR_CONTROLES_SOBRE_O_ESPELHO_SG_MAIN ( 'RD EXECUTE_SG_CLICK',
                                               RD_VAR_REG_TASK_SG_CLICK.Open_Video ) ;
   RD_TOTALIZAR_ESPELHO_RESTANTE ( 'RD EXECUTE_SG_CLICK',
                                   RD_VAR_ARRAY_SG[RD_VAR_REG_TASK_SG_CLICK._Tag].SG.Row - 1 ) ;
   End ;
_Debug ( '9 Espelho_RD EXECUTE_SG_CLICK' ) ;
RD_PRINT_LOG_ME ;
_Debug ( 'FIM Espelho_RD EXECUTE_SG_CLICK' ) ;
{$ENDIF}
End ;

procedure TEspelho_RD.RD_SG_CLICK ( Sender: TObject ) ;
Var _Tag   : LongInt ;
    SG     : TStringGrid ;
    Indice : LongInt ;
    Buffer : LongInt ;
Begin
_Debug ( 'INI Espelho_RD SG_CLICK' ) ;
If RD_VAR_IGNONE_CLICK_SG Then Begin
   RD_VAR_IGNONE_CLICK_SG := FALSE ;
   PUT_LOG ( 'Exit/1 Espelho_RD SG_CLICK RD_VAR_IGNONE_CLICK_SG' ) ;
   Exit ;
End ;
{$IFDEF NW}
Main.SET_PC_MODO_SEQUENCIA ;
{$ENDIF}
SG := (Sender As TStringGrid) ;
Buffer := SG.Tag DIV 1000 ;
_Tag := SG.Tag MOD 1000 ;
Indice := SG.Row - 1 ;
{
PUT_LOG ( 'TEspelho_RD RD_SG_CLICK ' +
          'SG[' + (Sender AS TStringGrid).Name + '] ' +
          'Buffer[' + IntToStr(Buffer) + '] ' +
          'Tag[' + IntToStr(_Tag) + '] ' +
          'Row[' + IntToStr(SG.Row) + ']' ) ;
}
If RD_VAR_TASK_SG_CLICK <> Nil Then Begin
   If RD_VAR_TASK_SG_CLICK.Status = TTaskStatus.Running Then Begin
      RD_VAR_TASK_SG_CLICK.Cancel ;
   End ;
End ;
RD_VAR_REG_TASK_SG_CLICK.SG := SG ;
RD_VAR_REG_TASK_SG_CLICK.Buffer := Buffer ;
RD_VAR_REG_TASK_SG_CLICK._Tag := _Tag ;
RD_VAR_REG_TASK_SG_CLICK.Indice := Indice ;
RD_VAR_REG_TASK_SG_CLICK.Open_Video := Open_Video_FALSE ;
RD_VAR_REG_TASK_SG_CLICK.Ativado := TRUE ;
//RD_EXECUTE_SG_CLICK ;
//RD EXECUTE_SG_CLICK ( SG, Buffer, _Tag, Indice, Open_Video_FALSE ) ;
//RD_VAR_TASK_SG_CLICK := TTask.Create ( RD EXECUTE_SG_CLICK ) ;
//RD_VAR_TASK_SG_CLICK.Start ;
_Debug ( 'FIM Espelho_RD SG_CLICK' ) ;
End ;

Function TEspelho_RD.RD_GET_BUFFER_DO_SG ( SG : TStringGrid ) : LongInt ;
Begin
Result := SG.Tag DIV 1000 ;
End ;

Procedure TEspelho_RD.RD_SG_DUPLO_CLICK (Sender: TObject) ;
Begin
_Debug ( 'INI Espelho_RD SG_DUPLO_CLIQUE' ) ;
RD_VAR_REG_TASK_SG_DBLCLICK.SG := (Sender AS TStringGrid) ;
RD_VAR_REG_TASK_SG_DBLCLICK.Ativado := TRUE ;
_Debug ( 'FIM Espelho_RD SG_DUPLO_CLIQUE' ) ;
End ;

Procedure TEspelho_RD.RD_EXEC_SG_DUPLO_CLICK (Sender: TObject) ;
{$IFDEF NW}
Var Registro  : T_Clip_Retranca ;
    Indice    : LongInt ;
{$ENDIF}
Begin
{$IFDEF NW}
_Debug ( 'INI Espelho_RD RD EXEC_SG_DUPLO_CLIQUE' ) ;
If NOT BOOT_OK Then Begin
   _Debug ( 'Exit NOT BOOT_OK Espelho_RD SG_DUPLO_CLIQUE' ) ;
   Exit ;
End ;
If MAIN_GET_EDITOR_LAUDAS_VISIVEL Then Begin
   ShowNewMessage ( 'O editor de laudas j? est? aberto' + LFLF +
                    'Retranca "' + '' + '"' + LFLF +
                    'Conclua esta edi??o antes de abrir outra lauda' ) ;
   _Debug ( 'Exit EDITOR_JA_VISIVEL Espelho_RD SG_DUPLO_CLIQUE' ) ;
   Exit ;
End ;
Indice := RD_GET_INDICE_RETRANCA (
              RD_BUFFER_MAIN, RD_VAR_ESPELHO_ATUAL.Selecionada.Retranca ) ;
Registro := RD_CARREGAR_REGISTRO_RETRANCA (
              RD_GET_BUFFER_DO_SG(Sender AS TStringGrid), Indice ) ;
View_Registro_Retranca.LB_Retranca.Caption := Trim ( RD_VAR_ESPELHO_ATUAL.Selecionada.Retranca ) ;
View_Registro_Retranca.LIMPAR_CAMPOS ;
If NOT Registro.Valido2 Then Begin
   PUT_LOG ( 'RD SG_DUPLO_CLICK Exit Registro Invalido [' +
                IntToStr ( Indice ) + ']' ) ;
   _Debug ( 'Exit NOT Registro.Valido Espelho_RD SG_DUPLO_CLIQUE' ) ;
   Exit ;
End ;
If Pos ( '@' , Registro.Retranca ) > 0 Then Begin
   If NOT Sys_Usuario_Aplicativo.Sys_Modificar_Espelho Then Begin
      EXEC_Msg ( 'Seu n?vel de acesso n?o permite modificar espelhos.' ) ;
      _Debug ( 'Exit Not Permission Espelho_RD SG_DUPLO_CLIQUE' ) ;
      Exit ;
   End ;
   PROC_RENOMEAR_RETRANCA ;
   _Debug ( 'Exit Apos RENOMEAR_RETRANCA Espelho_RD SG_DUPLO_CLIQUE' ) ;
   Exit ;
End ;
_Debug ( 'INI DUPLO_CLIQUE_J' ) ;
If NOT Sys_Usuario_Aplicativo.Sys_Modificar_Retrancas Then Begin
   MAIN_MARCAR_EDITOR_LAUDAS_SOMENTE_LEITURA ( TRUE ) ;
End Else Begin
   MAIN_MARCAR_EDITOR_LAUDAS_SOMENTE_LEITURA ( FALSE ) ;
End ;
If TRUE Then Begin // NOT Escolhendo Then
   If ( Registro.Is_Comercial ) OR
      ( Registro.Retranca = RD_STR_INICIO ) OR
      ( Registro.Retranca = RD_STR_FINAL ) Then Begin
      If NOT Sys_Usuario_Aplicativo.Sys_Fade Then Begin
         EXEC_Msg ( 'Estes dados poder?o ser alterados somente ' +
                    'pela Coordena??o.' ) ;
      End Else Begin
         //MAIN_ALTERAR_TEMPO_COMERCIAL ;
      End ;
      _Debug ( 'Exit 1 DUPLO_CLIQUE_J' ) ;
      Exit ;
   End ;
   If NOT Registro.Is_Especial Then Begin
      If NOT Registro.Is_Protegida Then Begin
         {
         If Tipo = 1 Then
            ABRIR_LAUDA_PARA_EDICAO ( SG_J2.Row )
            Else
            ABRIR_LAUDA_PARA_GC ( SG_J2.Row ) ;
         }
         If Sys_Usuario_Aplicativo.Sys_GC Then Begin
            //RD_VAR_ESPELHO_ATUAL.Reg_Editor_GC := RD_VAR_ESPELHO_ATUAL.Selecionada ;
            //Main.EDITAR_GC_PARA_GC2 ( '', 1, RD.RD_VAR_ESPELHO_ATUAL.Reg_Editor_GC ) ;
         End Else Begin
            CARREGANDO_FORM.Show ;
            CARREGANDO_FORM.BringToFront ;
            //RD_VAR_ESPELHO_ATUAL.Reg_Editor_GC := Registro ;
            RD_CARREGAR_LAUDA ( 'RD SG_DUPLO_CLICK', RD_VAR_ESPELHO_ATUAL.Selecionada ) ;
            RD_SG_CLICK_MODO_FORCADO := TRUE ;
            //MAIN_ABRIR_LAUDA_PARA_EDICAO ;
            RD_SG_CLICK ( (Sender As TStringGrid) ) ;
         End ;
      End Else Begin
         RD_REGISTRA_LOG_ESPELHO ( 'Edi??o Negada Por Retranca Protegida "' +
                                   Registro.Retranca + '"' ) ;
         EXEC_Msg ( '"' + Registro.Retranca + '"' + sLineBreak +
                    sLineBreak +
                    'Esta retranca est? protegida e n?o pode ser editada.' ) ;
      End
   End Else Begin
      RD_REGISTRA_LOG_ESPELHO ( 'Retranca N?o Pode Ser Editada "' +
                                   Registro.Retranca + '"' ) ;
      EXEC_Msg ( '"' + Registro.Retranca + '"' + sLineBreak +
                 sLineBreak +
                 'Esta linha n?o pode ser editada.' ) ;
   End ;
End ; // If TRUE
_Debug ( 'FIM Espelho_RD SG_DUPLO_CLIQUE' ) ;
{$ENDIF}
End ;

Function TEspelho_RD.RD_CARREGAR_REGISTRO_RETRANCA
         ( Buffer : LongInt ; Indice : LongInt ) : T_Clip_Retranca ;
Begin
Result.Valido2 := FALSE ;
Case Buffer Of
RD_BUFFER_MAIN : Begin
   If ( Indice >= RD_VAR_QTDE_RETRANCAS ) OR
      ( Indice < 0 ) OR
      ( RD_VAR_QTDE_RETRANCAS < 0 ) Then Begin
     _Debug ( 'Exit Espelho_RD CARREGAR_REGISTRO_RETRANCA' ) ;
      Exit ;
   End ;
   Result := RD_VAR_ARRAY_RETRANCAS [ Indice ] ;
   _Debug ( '1 Espelho_RD CARREGAR_REGISTRO_RETRANCA ' +
            'Buf[' + IntToStr(Buffer) + '] ' +
            'Idx[' + IntToStr(Indice) + '] ' +
            'Ret[' + Result.Retranca + ']' ) ;
   End ;
RD_BUFFER_SAVE : Begin
   If ( Indice >= RD_VAR_QTDE_RETRANCAS_SAVE ) OR
      ( Indice < 0 ) OR
      ( RD_VAR_QTDE_RETRANCAS_SAVE < 0 ) Then Begin
     _Debug ( 'Exit Save Espelho_RD CARREGAR_REGISTRO_RETRANCA' ) ;
      Exit ;
   End ;
   Result := RD_VAR_ARRAY_RETRANCAS_SAVE [ Indice ] ;
   _Debug ( '2 Espelho_RD CARREGAR_REGISTRO_RETRANCA ' +
            'Buf[' + IntToStr(Buffer) + '] ' +
            'Idx[' + IntToStr(Indice) + '] ' +
            'Ret[' + Result.Retranca + ']' ) ;
   End ;
RD_BUFFER_AUX : Begin
   If ( Indice >= RD_VAR_QTDE_RETRANCAS_AUX ) OR
      ( Indice < 0 ) OR
      ( RD_VAR_QTDE_RETRANCAS_AUX < 0 ) Then Begin
     _Debug ( 'Exit Aux Espelho_RD CARREGAR_REGISTRO_RETRANCA' ) ;
      Exit ;
   End ;
   Result := RD_VAR_ARRAY_RETRANCAS_AUX [ Indice ] ;
   _Debug ( '3 Espelho_RD CARREGAR_REGISTRO_RETRANCA ' +
            'Buf[' + IntToStr(Buffer) + '] ' +
            'Idx[' + IntToStr(Indice) + '] ' +
            'Ret[' + Result.Retranca + ']' ) ;
   End ;
End ;
End ;

Procedure TEspelho_RD.RD_SG_DRAW_ESPELHO
          ( Sender : TObject; ACol, ARow: Integer;
            Rect: TRect; State: TGridDrawState);
Var SG           : TStringGrid ;
    Alinhamento  : LongInt ;
    Registro     : T_Clip_Retranca ;
    Indice_Array : LongInt ;
    Atual        : String ;
    Status_GC    : String ;
    Inalteravel  : Boolean ;
Begin
//Size_Fonte_Espelho := 14 ;
Inalteravel := FALSE ;
SG := Sender As TStringGrid ;
Registro.Valido2 := FALSE ;
Indice_Array := ARow - 1 ;
If ( Indice_Array >= 0 ) AND
   ( RD_VAR_QTDE_RETRANCAS > 0 ) AND
   ( Indice_Array < RD_VAR_QTDE_RETRANCAS ) Then Begin
   //Registro := RD_VAR_ARRAY_RETRANCAS [ ARow - 1 ] ;
   Registro := RD_CARREGAR_REGISTRO_RETRANCA (
                  RD_GET_BUFFER_DO_SG(Sender As TStringGrid),
                  Indice_Array ) ;
   Registro.Valido2 := TRUE ;
End ;
Atual := Trim ( SG.Cells[ACol, ARow] ) ;
Status_GC := Trim ( SG.Cells[SG_J_GC, ARow] ) ;
SG.Canvas.Font.Size := Size_Fonte_Espelho ;
SG.Canvas.Font.Name := 'Tahoma' ;
With SG.Canvas Do Begin
   //Negrito := Registro.Tempo_TT > 0 ;
   Brush.Color := clWhite ;
   Font.Color := clBlack ;
   If TRUE OR ( ACol = SG_J_RETRANCA ) Then Begin
      //Font.Name := 'Tahoma' ;
      Font.Style := [] ;
      //If Negrito AND ( Col = SG_J_RETRANCA ) Then
      //   Font.Style := [fsBold] ;
      Font.Size := Size_Fonte_Espelho ;
   End Else Begin
      //Font.Name := 'FixedSys' ;
      Font.Style := [] ;
      Font.Size := Size_Fonte_Espelho + 1 ;
   End ;
   //
   If ( ACol = SG_J_NO ) AND ( ARow > 99 ) Then Begin
      If Registro.Numero > 99 Then Begin
         //Font.Name := 'Arial' ;
         Font.Size := Size_Fonte_Espelho ;
         //Font.Style := [fsBold] ;
      End ;
   End ;
   //
   Font.Color := clBlack ;
   Brush.Color := clLime ;
   If ( ACol = SG_J_NO ) AND
      ( RD_VAR_LAST_RETRANCA_SEND_GC <> '' ) AND
      ( RD_VAR_LAST_RETRANCA_SEND_GC = Atual ) Then Begin
      Brush.Color := clRed ;
      Font.Color := clWhite ;
      Font.Size := MAX ( 8, Size_Fonte_Espelho - 2 ) ;
      Inalteravel := TRUE ;
   (*
   End Else If ( ACol = SG_J_RETRANCA ) AND
               ( Atual <> '' ) AND
               ( Atual = RD_VAR_ESPELHO_ATUAL.Selecionada.Retranca ) Then Begin
      Brush.Color := clLaranja ;
      Font.Color := clBlack ;
      Inalteravel := TRUE ;
   *)
   End Else If ( ACol = SG_J_NO ) OR ( ARow = 0 ) Then Begin
      Brush.Color := clSilver - $303030;
      Font.Color := clBlack ;
      Font.Size := MAX ( 8, Size_Fonte_Espelho - 2 ) ;
   End Else If ( ARow = Linha_Cut_Paste ) OR
               ( Registro.Status = J_MOVENDO ) Then Begin
      Brush.Color := clWhite ;
      Font.Color := clGreen ;
   End Else If Registro.Is_Protegida Then Begin
      Brush.Color := clTeal ;
      Font.Color := clWhite ;
   End Else If ( Registro.Retranca = RD_STR_INICIO ) OR
               ( Registro.Retranca = RD_STR_FINAL ) OR
               ( Registro.Status = J_INICIO ) OR
               ( Registro.Status = J_FIM ) Then Begin
      Brush.Color := clMaroon ;
      If ( ACol = SG_J_EDITOR ) AND
         ( Registro.Retranca = RD_STR_FINAL ) Then
         Font.Color := clYellow
         Else
         Font.Color := clWhite ;
   End Else If ( RD_IS_COMERCIAL ( Registro.Retranca ) ) OR
               ( Registro.Status = J_COMERCIAL ) Then Begin
      Brush.Color := clGray ;
      If ACol = SG_J_EDITOR Then
         Font.Color := clYellow
         Else
         Font.Color := clWhite ;
   End Else If ( Registro.Retranca = RD_STR_INICIO_PREVIEW ) OR
               ( Registro.Retranca = RD_STR_FINAL_PREVIEW ) OR
               ( Registro.Status = J_PREVIEW ) OR
               ( Registro.Status = J_FINAL_PREVIEW ) Then Begin
      Brush.Color := clNavy ;
      Font.Color := clWhite ;
   End Else Begin
      If ( ARow = SG.Row ) AND ( ACol = SG_J_RETRANCA ) Then Begin
         Brush.Color := clFuchsia ; //  clAqua ;
      End Else Begin
         Brush.Color := clWhite ;
      End
   End ;
   //
   If NOT Inalteravel Then Begin
      If ACol < SG_J_Editor Then Begin
         If ( Registro.Retranca = Sys_Retranca_TP ) AND
            ( Sys_Status_TP = J_TP_PLAY ) Then Begin
            If ACol > 0 Then Begin
               Brush.Color := clRed ;
               Font.Color := clBlack
            End ;
         End Else If ( Registro.Retranca = Sys_Retranca_TP ) AND
                     ( Sys_Status_TP = J_TP_CUE ) Then Begin
            If ACol > 0 Then Begin
               Brush.Color := clYellow ;
               Font.Color := clBlack ;
            End ;
         End ;
      End ;
   End ;
   //
   If NOT Inalteravel Then Begin
      If ( ARow = SG.Row ) AND
         ( ACol <> SG_J_RETRANCA ) Then Begin
         Brush.Color := clAqua ;
         Font.Color := clBlack ;
      End ;
   End ;
   //
   If NOT Inalteravel Then Begin
      If ( ACol = SG_J_GC ) Then Begin
         If Status_GC = '#' Then Begin
            Brush.Color := $0000D2D2 ;
         End ;
      End ;
   End ;
   //
   If ACol = SG_J_EDITOR Then Begin
      If Registro.Status = J_EDICAO Then Begin
         Brush.Color := $0080FF80 ;
         Font.Color := clBlack
      End ;
      If Status_GC = '#' Then Begin
      //   Brush.Color := $0000D2D2 ;
      End ;
   End ;
   If ACol = SG_J_TOTAL Then Begin
      If Status_GC = '#' Then Begin
      //   Brush.Color := $0000D2D2 ;
      End ;
   End ;
   If ACol = SG_J_EXT Then Begin
      If Status_GC = '#' Then Begin
      //   Brush.Color := $0000D2D2 ;
      End ;
   End ;
   If ACol = SG_J_VT Then Begin
      If Status_GC = '#' Then Begin
      //   Brush.Color := $0000D2D2 ;
      End ;
   End ;
   If ACol = SG_J_ENTRADA Then Begin
      If Status_GC = '#' Then Begin
      //   Brush.Color := $0000D2D2 ;
      End ;
   End ;
   If ACol = SG_J_FITA Then Begin
      If Status_GC = '#' Then Begin
      //   Brush.Color := $0000D2D2 ;
      End ;
   End ;
   //
   If NOT Inalteravel Then Begin
      If ( ACol = SG_J_NO ) AND ( Registro.Categoria = '*' ) Then Begin
         Brush.Color := clGreen ;
         Font.Color := clYellow ;
      End ;
   End ;
   //
   If NOT Inalteravel Then Begin
      If ( ACol = SG_J_NO ) AND ( Registro.Status = J_BR ) Then Begin
         Brush.Color := clYellow ;
         Font.Color := clBlack ;
      End ;
   End ;
   //
   If ( ACol = SG_J_TIPO ) AND ( ARow > 0 ) Then Begin
      If ( Registro.Tipo <> '' ) AND
         ( NOT Registro.Is_Especial ) Then Begin
         If ( Registro.Tipo = 'VT' ) Then Begin
            If Registro.Tempo_VT < 2 Then Begin
               Brush.Color := clRed ;
               Font.Color := clYellow ;
            End Else Begin
            End
         End Else Begin
            If Registro.Tempo_TT < 2 Then Begin
               Brush.Color := clYellow ;
               Font.Color := clBlack ;
            End ;
         End ;
      End ;
   End ;
   //
   If ( ACol = SG_J_NO ) OR ( ARow = 0 ) OR
      ( ( ACol <> SG_J_ANCORA ) AND ( ACol <> SG_J_RETRANCA ) ) Then Begin
   Alinhamento := 1 ; // Centralizado
   End Else Begin
      If ( ( RD_IS_COMERCIAL (Registro.Retranca) ) OR
           ( Registro.Retranca = RD_STR_INICIO_PREVIEW ) OR
           ( Registro.Retranca = RD_STR_FINAL_PREVIEW ) OR
           ( Registro.Retranca = RD_STR_FINAL ) OR
           ( Registro.Retranca = RD_STR_INICIO ) ) AND
           ( ACol = SG_J_RETRANCA ) Then Begin
         Alinhamento := 3 ; // Direita
      End Else Begin
         Alinhamento := 2 ; // Esquerda
      End ;
   End ;
   If Alinhamento = 1 Then Begin // Centralizado
      TextRect ( Rect ,
                 Rect.Left + ( SG.ColWidths[ACol] -
                     TextWidth ( Atual ) ) DIV 2 ,
                 Rect.Top + ( SG.RowHeights[ACol] -
                     TextHeight ( Atual ) ) DIV 2 ,
                 Atual ) ;
   End Else If Alinhamento = 2 Then Begin // Esquerda
      TextRect ( Rect ,
                 Rect.Left + 3 ,
                 Rect.Top + ( SG.RowHeights[ACol] -
                     TextHeight ( Atual ) ) DIV 2 ,
                 Atual ) ;
   End Else If Alinhamento = 3 Then Begin // Direita
      TextRect ( Rect ,
                 Rect.Left + ( SG.ColWidths[ACol] -
                     TextWidth ( Atual ) ) DIV 1 - 5 ,
                 Rect.Top + ( SG.RowHeights[ACol] -
                     TextHeight ( Atual ) ) DIV 2 ,
                 Atual )
   End ;
   If ( ARow = SG.Row ) AND
      ( ACol = RD_SG_J_RETRANCA ) Then Begin // gdFocused in State then
      DrawFocusRect(Rect);
   End ;
End ; // With
End ;

Function TEspelho_RD.RD_ESPELHO_EXISTE
         ( _Jornal : String ; _DT : TDateTime ) : Boolean ;
Var FN : String ;
Begin
FN := RD_GET_DIR_JORNAIS + _Jornal + '\' +
      RD_GET_DATA_CURTA_2 ( _DT ) + '\' +
      _Jornal +
      RD_GET_DATA_CURTA_2 ( _DT ) + '.TXT' ;
Result := RR_FileExists ( 'TEspelho_RD.RD_ESPELHO_EXISTE', FN ) ;
End ;

Procedure TEspelho_RD.RD_MONTAR_SG
          ( Origem : String ; Buffer : LongInt ; Reg_SG : T_SG ;
            Linha : LongInt ; Open_Video : Boolean ) ;
{$IFDEF NW}
Var Local          : LongInt ;
    Registro       : T_Clip_Retranca ;
    Linha_SG       : LongInt ;
    Qtde           : LongInt ;
    //Save_Row       : LongInt ;
{$ENDIF}
Begin
{$IFDEF NW}
_Debug ( 'INI Espelho_RD MONTAR_SG' ) ;
Try
   //PUT_LOG ( 'RD_MONTAR_SG [' + Origem + ']' ) ;
   Case Buffer Of
   RD_BUFFER_MAIN : Begin
      Qtde := RD_VAR_QTDE_RETRANCAS ;
      End ;
   RD_BUFFER_SAVE : Begin
      Qtde := RD_VAR_QTDE_RETRANCAS_SAVE ;
      End ;
   RD_BUFFER_AUX : Begin
      Qtde := RD_VAR_QTDE_RETRANCAS_AUX ;
      End ;
   Else Begin
      Exit ;
   End ;
   End ;
   If Qtde = 0 Then Begin
      //PUT_LOG ( 'RD_MONTAR_SG Qtde Nula Buffer[' + IntToStr(Buffer) + ']' ) ;
      _Debug ( 'Exit Qtde 0 Espelho_RD MONTAR_SG' ) ;
      Exit ;
   End ;
   If Reg_SG.SG.RowCount <> ( Qtde + 1 ) Then Begin
      //PUT_LOG ( 'MODIFY RowCount RD_MONTAR_SG ' + Reg_SG.SG.Name + ' ' +
      //              'RowCount ' + IntToStr(Reg_SG.SG.RowCount) + ' ' +
      //              'Qtde ' + IntToStr(Qtde) ) ;
      Reg_SG.SG.RowCount := Qtde + 1 ;
   End ;
   For Local := 0 To Qtde - 1 Do Begin
      Case Buffer Of
      RD_BUFFER_MAIN : Begin
         Registro := RD_VAR_ARRAY_RETRANCAS[Local] ;
         End ;
      RD_BUFFER_SAVE : Begin
         Registro := RD_VAR_ARRAY_RETRANCAS_SAVE[Local] ;
         End ;
      RD_BUFFER_AUX : Begin
         Registro := RD_VAR_ARRAY_RETRANCAS_AUX[Local] ;
         End ;
      End ;
      Linha_SG := Local + 1 ;
      If Registro.Retranca = '-' Then Begin
         //Reg_SG.SG.Cells[SG_J_RETRANCA, Linha_SG] := '' ;
         SG_CELL ( Reg_SG.SG, Linha_SG, SG_J_RETRANCA, '' ) ;
      End Else Begin
         //Reg_SG.SG.Cells[SG_J_RETRANCA, Linha_SG] := Registro.Retranca ;
         SG_CELL ( Reg_SG.SG, Linha_SG,
                   SG_J_RETRANCA, Registro.Retranca ) ;
      End ;
      //Reg_SG.SG.Cells[SG_COL_ANCORA, Linha_SG] := Registro.Ancora ;
      SG_CELL ( Reg_SG.SG, Linha_SG,
                SG_J_ANCORA, Registro.Ancora ) ;
      //Reg_SG.SG.Cells[SG_J_TOTAL, Linha_SG] := SegundosToMMSS ( Registro.Tempo_TT ) ;
      SG_CELL ( Reg_SG.SG, Linha_SG, SG_J_TOTAL,
                SegundosToMMSS ( Registro.Tempo_TT ) ) ;
      //Reg_SG.SG.Cells[SG_J_VT, Linha_SG] := SegundosToMMSS ( Registro.Tempo_VT ) ;
      SG_CELL ( Reg_SG.SG, Linha_SG, SG_J_VT,
                SegundosToMMSS ( Registro.Tempo_VT ) ) ;
      //Reg_SG.SG.Cells[SG_J_EXT, Linha_SG] := SegundosToMMSS ( Registro.Tempo_Ext) ;
      SG_CELL ( Reg_SG.SG, Linha_SG, SG_J_EXT,
                SegundosToMMSS ( Registro.Tempo_Ext ) ) ;
      //Reg_SG.SG.Cells[SG_J_GC, Linha_SG] := Registro.GC_Modificado ;
      SG_CELL ( Reg_SG.SG, Linha_SG,
                SG_J_GC, Registro.GC_Modificado ) ;
      //Reg_SG.SG.Cells[SG_J_EDITOR, Linha_SG] := Registro.Editor ;
      SG_CELL ( Reg_SG.SG, Linha_SG,
                SG_J_EDITOR, Registro.Editor ) ;
      //Reg_SG.SG.Cells[SG_J_STATUS, Linha_SG] := IntToStr ( Registro.Status ) ;
      SG_CELL ( Reg_SG.SG, Linha_SG,
                SG_J_STATUS, IntToStr ( Registro.Status ) ) ;
      //Reg_SG.SG.Cells[SG_J_STATUS_TP, Linha_SG] := IntToStr ( Registro.Status_TP ) ;
      SG_CELL ( Reg_SG.SG, Linha_SG,
                SG_J_STATUS_TP, IntToStr(Registro.Status_TP) ) ;
      //Reg_SG.SG.Cells[SG_J_TIPO, Linha_SG] := Registro.Tipo ;
      SG_CELL ( Reg_SG.SG, Linha_SG,
                SG_J_TIPO, Registro.Tipo ) ;
      //Reg_SG.SG.Cells[SG_J_STATUS_PROTECAO, Linha_SG] := IIF ( Registro.Is_Protegida , '#', '' ) ;
      SG_CELL ( Reg_SG.SG, Linha_SG,
                SG_J_STATUS_PROTECAO, IIF ( Registro.Is_Protegida , '#', '' ) ) ;
      //Reg_SG.SG.Cells[SG_J_FITA, Linha_SG] := Registro.Fita ;
      SG_CELL ( Reg_SG.SG, Linha_SG,
                SG_J_FITA, Registro.Fita ) ;
      //Reg_SG.SG.Cells[SG_J_STATUS_CAT, Linha_SG] := Registro.Categoria ;
      SG_CELL ( Reg_SG.SG, Linha_SG,
                SG_J_STATUS_CAT, Registro.Categoria ) ;
      If Registro.Numero > 0 Then Begin
         //Reg_SG.SG.Cells[SG_J_No, Linha_SG] := IntToStr(Registro.Numero) ;
         SG_CELL ( Reg_SG.SG, Linha_SG,
                   SG_J_No, IntToStr(Registro.Numero) ) ;
      End Else Begin
         //Reg_SG.SG.Cells[SG_J_No, Linha_SG] := '' ;
         SG_CELL ( Reg_SG.SG, Linha_SG, SG_J_No, '' ) ;
      End ;
   End ;
   If Reg_SG.Main Then Begin
      VALIDAR_CONTROLES_SOBRE_O_ESPELHO_SG_MAIN ( 'RD_MONTAR_SG',
                                                  Open_Video ) ;
      RD_TOTALIZAR_ESPELHO_RESTANTE ( 'RD_MONTAR_SG', Reg_SG.SG.Row - 1 ) ;
   End ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception TEspelho_RD RD_MONTAR_SG [' + E.Message + ']' ) ;
   End ;
End ;
_Debug ( 'FIM Espelho_RD MONTAR_SG' ) ;
{$ENDIF}
End ;

Procedure TEspelho_RD.RD_TOTALIZAR_ESPELHO ( Origem : String ) ;
Var Local : LongInt ;
Begin
_Debug ( 'INI Espelho_RD TOTALIZAR_ESPELHO' ) ;
Try
   //PUT_LOG ( 'RD_TOTALIZAR_ESPELHO [' + Origem + ']' ) ;
   RD_VAR_TEMPO_TT := 0 ;
   RD_VAR_TEMPO_BREAK := 0 ;
   RD_VAR_TEMPO_PRODUCAO := 0 ;
   If RD_VAR_RETRANCA_FIM < 0 Then Begin
      _Debug ( 'Exit Fim < 0 Espelho_RD RD TOTALIZAR_ESPELHO' ) ;
      Exit ;
   End ;
   For Local := 0 To RD_VAR_RETRANCA_FIM - 1 Do Begin
      RD_VAR_TEMPO_TT := RD_VAR_TEMPO_TT +
                         RD_VAR_ARRAY_RETRANCAS[Local].Tempo_TT ;
      If RD_IS_COMERCIAL ( RD_VAR_ARRAY_RETRANCAS[Local].Retranca ) Then Begin
         RD_VAR_TEMPO_BREAK := RD_VAR_TEMPO_BREAK +
                               RD_VAR_ARRAY_RETRANCAS[Local].Tempo_TT
      End Else Begin
         RD_VAR_TEMPO_PRODUCAO := RD_VAR_TEMPO_PRODUCAO +
                                  RD_VAR_ARRAY_RETRANCAS[Local].Tempo_TT ;
      End ;
   End ;
   RD_PLOTAR_LB_TEMPOS ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception TEspelho_RD RD TOTALIZAR_ESPELHO ' +
                '[' + E.Message + ']' ) ;
   End ;
End ;
_Debug ( 'FIM Espelho_RD RD TOTALIZAR_ESPELHO' ) ;
End ;

Procedure TEspelho_RD.RD_TOTALIZAR_ESPELHO_RESTANTE
          ( Origem : String ; Retranca_Inicial : LongInt ) ;
Var Local : LongInt ;
Begin
_Debug ( 'INI Espelho_RD TOTALIZAR_ESPELHO_RESTANTE' ) ;
Try
   //PUT_LOG ( 'RD_TOTALIZAR_ESPELHO_RESTANTE [' + Origem + ']' ) ;
   RD_VAR_RESTANTE_TT := 0 ;
   RD_VAR_RESTANTE_BREAK := 0 ;
   RD_VAR_RESTANTE_PRODUCAO := 0 ;
   If RD_VAR_RETRANCA_FIM < 0 Then Begin
      _Debug ( 'Exit < 0 Espelho_RD TOTALIZAR_ESPELHO_RESTANTE' ) ;
      Exit ;
   End ;
   If Retranca_Inicial >= RD_VAR_RETRANCA_FIM Then Begin
      _Debug ( 'Exit Inicial > Espelho_RD TOTALIZAR_ESPELHO_RESTANTE' ) ;
      Exit ;
   End ;
   For Local := Retranca_Inicial To RD_VAR_RETRANCA_FIM - 1 Do Begin
      RD_VAR_RESTANTE_TT := RD_VAR_RESTANTE_TT +
                            RD_VAR_ARRAY_RETRANCAS[Local].Tempo_TT ;
      If RD_IS_COMERCIAL ( RD_VAR_ARRAY_RETRANCAS[Local].Retranca ) Then Begin
         RD_VAR_RESTANTE_BREAK := RD_VAR_RESTANTE_BREAK +
                                  RD_VAR_ARRAY_RETRANCAS[Local].Tempo_TT
      End Else Begin
         RD_VAR_RESTANTE_PRODUCAO := RD_VAR_RESTANTE_PRODUCAO +
                                     RD_VAR_ARRAY_RETRANCAS[Local].Tempo_TT ;
      End ;
   End ;
   RD_VAR_TEMPO_RESTANTE_STR :=
       'At? o final >> Total: ' + SegundosToMMSS ( RD_VAR_RESTANTE_TT ) + '  =  ' +
       'Produ??o: ' + SegundosToMMSS ( RD_VAR_RESTANTE_PRODUCAO ) + ' + ' +
       'Comerciais: ' + SegundosToMMSS ( RD_VAR_RESTANTE_BREAK ) ;
   RD_PLOTAR_LB_TEMPOS ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception TEspelho_RD RD_TOTALIZAR_ESPELHO_RESTANTE ' +
                '[' + E.Message + ']' ) ;
   End ;
End ;
_Debug ( 'FIM Espelho_RD TOTALIZAR_ESPELHO_RESTANTE' ) ;
End ;

Procedure TEspelho_RD.RD_VERIFICAR_STATUS_RETRANCAS ( Buffer : LongInt ) ;
Var Local               : LongInt ;
    //Last_Is_Retranca    : LongInt ;
    No_Preview          : Boolean ;
    Qtde                : LongInt ;
    Registro            : T_Clip_Retranca ;
    Proximo_Registro    : T_Clip_Retranca ;
    Registro_Anterior   : T_Clip_Retranca ;
    Primeira            : Boolean ;
    Ultima              : Boolean ;
    Next_Is_Ultima      : Boolean ;
    Next_Is_Ultima_Preview : Boolean ;
Begin
_Debug ( 'INI Espelho_RD VERIFICAR_STATUS_RETRANCAS' ) ;
Try
   Case Buffer Of
   RD_BUFFER_MAIN : Begin
      Qtde := RD_VAR_QTDE_RETRANCAS ;
      End ;
   RD_BUFFER_SAVE : Begin
      Qtde := RD_VAR_QTDE_RETRANCAS_SAVE ;
      End ;
   RD_BUFFER_AUX : Begin
      Qtde := RD_VAR_QTDE_RETRANCAS_AUX ;
      End ;
   Else Begin
      Exit ;
   End ;
   End ;
   If Qtde = 0 Then Begin
      _Debug ( 'Exit Qtde 0 Espelho_RD VERIFICAR_STATUS_RETRANCAS' ) ;
      Exit ;
   End ;
   //Last_Is_Retranca := -1 ;
   No_Preview := FALSE;
   For Local := 0 To Qtde - 1 Do Begin
      Primeira := ( Local = 0 ) ;
      Ultima := ( Local = Qtde - 1 ) ;
      Case Buffer Of
      RD_BUFFER_MAIN : Begin
         Registro := RD_VAR_ARRAY_RETRANCAS[Local] ;
         If Ultima Then Begin
            RD_LIMPAR_REGISTRO_RETRANCA ( 'RD_VERIFICAR_STATUS_RETRANCAS/1/MAIN/ULTIMA', Proximo_Registro )
         End Else Begin
            Proximo_Registro := RD_VAR_ARRAY_RETRANCAS[Local+1] ; ;
         End ;
         If Primeira Then Begin
            RD_LIMPAR_REGISTRO_RETRANCA ( 'RD_VERIFICAR_STATUS_RETRANCAS/1/MAIN/PRIMEIRA', Registro_Anterior )
         End Else Begin
            Registro_Anterior := RD_VAR_ARRAY_RETRANCAS[Local-1] ; ;
         End ;
         End ;
      RD_BUFFER_SAVE : Begin
         Registro := RD_VAR_ARRAY_RETRANCAS_SAVE[Local] ;
         If Ultima Then Begin
            RD_LIMPAR_REGISTRO_RETRANCA ( 'RD_VERIFICAR_STATUS_RETRANCAS/1/SAVE/ULTIMA', Proximo_Registro )
         End Else Begin
            Proximo_Registro := RD_VAR_ARRAY_RETRANCAS_SAVE[Local+1] ; ;
         End ;
         If Primeira Then Begin
            RD_LIMPAR_REGISTRO_RETRANCA ( 'RD_VERIFICAR_STATUS_RETRANCAS/1/SAVE/PRIMEIRA', Registro_Anterior )
         End Else Begin
            Registro_Anterior := RD_VAR_ARRAY_RETRANCAS_SAVE[Local-1] ; ;
         End ;
         End ;
      RD_BUFFER_AUX : Begin
         Registro := RD_VAR_ARRAY_RETRANCAS_AUX[Local] ;
         If Ultima Then Begin
            RD_LIMPAR_REGISTRO_RETRANCA ( 'RD_VERIFICAR_STATUS_RETRANCAS/1/AUX/ULTIMA', Proximo_Registro )
         End Else Begin
            Proximo_Registro := RD_VAR_ARRAY_RETRANCAS_AUX[Local+1] ; ;
         End ;
         If Primeira Then Begin
            RD_LIMPAR_REGISTRO_RETRANCA ( 'RD_VERIFICAR_STATUS_RETRANCAS/1/AUX/PRIMEIRA', Registro_Anterior )
         End Else Begin
            Registro_Anterior := RD_VAR_ARRAY_RETRANCAS_AUX[Local-1] ; ;
         End ;
         End ;
      End ;
      If Registro.Is_Inicio_Preview Then Begin
         No_Preview := TRUE ;
      End ;
      Registro.No_Preview := No_Preview ;
      If Registro.Is_Retranca Then Begin
         If NOT Primeira Then Begin
            If Registro_Anterior.Is_Inicio Then Begin
               Registro.Is_Primeira := TRUE ;
            End ;
            If Registro_Anterior.Is_Inicio_Preview Then Begin
               Registro.Is_Primeira_Preview := TRUE ;
            End ;
         End ;
      End ;
      Case Buffer Of
      RD_BUFFER_MAIN : Begin
         RD_VAR_ARRAY_RETRANCAS[Local] := Registro ;
         End ;
      RD_BUFFER_SAVE : Begin
         RD_VAR_ARRAY_RETRANCAS_SAVE[Local] := Registro ;
         End ;
      RD_BUFFER_AUX : Begin
         RD_VAR_ARRAY_RETRANCAS_AUX[Local] := Registro ;
         End ;
      End ;
   End ;
   Next_Is_Ultima := FALSE ;
   Next_Is_Ultima_Preview := FALSE ;
   For Local := Qtde - 1 DownTo 0 Do Begin
      Primeira := ( Local = Qtde - 1 ) ;
      Ultima := ( Local = 0 ) ;
      Case Buffer Of
      RD_BUFFER_MAIN : Begin
         Registro := RD_VAR_ARRAY_RETRANCAS[Local] ;
         If Ultima Then Begin
            RD_LIMPAR_REGISTRO_RETRANCA ( 'RD_VERIFICAR_STATUS_RETRANCAS/2/MAIN/ULTIMA', Proximo_Registro )
         End Else Begin
            Proximo_Registro := RD_VAR_ARRAY_RETRANCAS[Local-1] ; ;
         End ;
         If Primeira Then Begin
            RD_LIMPAR_REGISTRO_RETRANCA ( 'RD_VERIFICAR_STATUS_RETRANCAS/2/MAIN/PRIMEIRA', Registro_Anterior )
         End Else Begin
            Registro_Anterior := RD_VAR_ARRAY_RETRANCAS[Local+1] ; ;
         End ;
         End ;
      RD_BUFFER_SAVE : Begin
         Registro := RD_VAR_ARRAY_RETRANCAS_SAVE[Local] ;
         If Ultima Then Begin
            RD_LIMPAR_REGISTRO_RETRANCA ( 'RD_VERIFICAR_STATUS_RETRANCAS/2/SAVE/ULTIMA', Proximo_Registro )
         End Else Begin
            Proximo_Registro := RD_VAR_ARRAY_RETRANCAS_SAVE[Local-1] ; ;
         End ;
         If Primeira Then Begin
            RD_LIMPAR_REGISTRO_RETRANCA ( 'RD_VERIFICAR_STATUS_RETRANCAS/2/SAVE/PRIMEIRA', Registro_Anterior )
         End Else Begin
            Registro_Anterior := RD_VAR_ARRAY_RETRANCAS_SAVE[Local+1] ; ;
         End ;
         End ;
      RD_BUFFER_AUX : Begin
         Registro := RD_VAR_ARRAY_RETRANCAS_AUX[Local] ;
         If Ultima Then Begin
            RD_LIMPAR_REGISTRO_RETRANCA ( 'RD_VERIFICAR_STATUS_RETRANCAS/2/AUX/ULTIMA', Proximo_Registro )
         End Else Begin
            Proximo_Registro := RD_VAR_ARRAY_RETRANCAS_AUX[Local-1] ; ;
         End ;
         If Primeira Then Begin
            RD_LIMPAR_REGISTRO_RETRANCA ( 'RD_VERIFICAR_STATUS_RETRANCAS/2/AUX/PRIMEIRA', Registro_Anterior )
         End Else Begin
            Registro_Anterior := RD_VAR_ARRAY_RETRANCAS_AUX[Local+1] ; ;
         End ;
         End ;
      End ;
      If Registro.Is_Final_Preview Then Begin
         Next_Is_Ultima_Preview := TRUE ;
      End ;
      If Registro.Is_Final Then Begin
         Next_Is_Ultima := TRUE ;
      End ;
      If Registro.Is_Retranca Then Begin
         If Next_Is_Ultima Then Begin
            Registro.Is_Ultima := TRUE ;
            Next_Is_Ultima := FALSE ;
         End ;
         If Next_Is_Ultima_Preview Then Begin
            Registro.Is_Ultima_Preview := TRUE ;
            Next_Is_Ultima_Preview := FALSE ;
         End ;
      End ;
      Case Buffer Of
      RD_BUFFER_MAIN : Begin
         RD_VAR_ARRAY_RETRANCAS[Local] := Registro ;
         End ;
      RD_BUFFER_SAVE : Begin
         RD_VAR_ARRAY_RETRANCAS_SAVE[Local] := Registro ;
         End ;
      RD_BUFFER_AUX : Begin
         RD_VAR_ARRAY_RETRANCAS_AUX[Local] := Registro ;
         End ;
      End ;
   End ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception TEspelho_RD RD VERIFICAR_STATUS_RETRANCAS [' + E.Message + ']' ) ;
   End ;
End ;
_Debug ( 'FIM Espelho_RD VERIFICAR_STATUS_RETRANCAS' ) ;
End ;

Procedure TEspelho_RD.RD_DECOMPOR_E_MONTAR_ARRAY_ESPELHO ( Origem : String ; Buffer : LongInt ;
                                                           Flags : String ) ;
// 1 - Array principal, 2 - Array para SAVE
Var Local          : LongInt ;
    Lista          : TStringList ;
    Registro       : T_Clip_Retranca ;
    Aux            : String ;
    Residuo        : String ;
    Matriz         : TArray ;
    Qtde           : LongInt ;
Begin
_Debug ( 'INI Espelho_RD DECOMPOR_E_MONTAR_ARRAY_ESPELHO' ) ;
PUSH_TICK ( 'DECOMPOR_E_MONTAR_ARRAY_ESPELHO' ) ;
Try
   //PUT_LOG ( 'RD_DECOMPOR_E_MONTAR_ARRAY_ESPELHO {' + Origem + '}' ) ;
   Lista := TStringList.Create ;
   Lista.Clear ;
   Case Buffer Of
   RD_BUFFER_MAIN : Begin
      Lista.Text := RD_KERNEL_GET_ESPELHO ;
      End ;
   RD_BUFFER_SAVE : Begin
      Lista.Text := RD_KERNEL_GET_ESPELHO_SAVE ;
      End ;
   RD_BUFFER_AUX : Begin
      Lista.Text := RD_KERNEL_GET_ESPELHO_AUX ;
      End ;
   End ;
   Qtde := Lista.Count ;
   If Qtde < 4 Then Begin
      _Debug ( 'Exit Lista < 4 Espelho_RD DECOMPOR_E_MONTAR_ARRAY_ESPELHO' ) ;
      Exit ;
   End ;
   For Local := 0 To Qtde - 1 Do Begin
      Aux := Lista[Local] ;
      If Length ( Aux ) < 10 Then Begin
         Continue ;
      End ;
      RD_LIMPAR_REGISTRO_RETRANCA ( 'RD_DECOMPOR_E_MONTAR_ARRAY_ESPELHO', Registro ) ;
      If Pos ( 'CVS', Flags ) > 0 Then Begin
         Matriz := Explode2 ( ';' , Aux , 0 ) ;
         If Length ( Matriz ) < 5 Then Begin
            Continue ;
         End ;
         Registro.Ancora := Trim ( Matriz[0] ) ;
         Registro.Retranca := Trim ( Matriz[1] ) ;
         Registro.Tempo_VT := MMSSToSegundos2 ( Matriz[3] ) ;
         If Registro.Tempo_VT > 0 Then Begin
            Registro.Tempo_VT_Str := SegundosToMMSS ( Registro.Tempo_VT ) ;
         End Else Begin
            Registro.Tempo_VT_Str := '-' ;
         End ;
         Registro.Tempo_Ext := MMSSToSegundos2 ( Matriz[4] ) ;
         If Registro.Tempo_Ext > 0 Then Begin
            Registro.Tempo_Ext_Str := SegundosToMMSS ( Registro.Tempo_EXT ) ;
         End Else Begin
            Registro.Tempo_Ext_Str := '-' ;
         End ;
         Registro.Tempo_TT := Registro.Tempo_VT + Registro.Tempo_Ext  ;
         If Registro.Tempo_TT > 0 Then Begin
            Registro.Tempo_TT_Str := SegundosToMMSS ( Registro.Tempo_TT ) ;
         End Else Begin
            Registro.Tempo_TT_Str := '-' ;
         End ;
         Registro.GC_Modificado := '' ; // Trim ( Matriz[5] ) ;
         Registro.Editor := Trim ( Matriz[6] ) ;
         Registro.Status := StrToIntDef ( Matriz[7] , 0 ) ;
   //         Registro.Protegida := StrToIntDef ( Matriz[8] , 0 ) = 1 ;
         Registro.Status_TP := StrToIntDef ( Matriz[8] , 0 ) ;
         If Length(Matriz)>=10 Then Begin
            Registro.Tipo := Trim ( Matriz[9] ) ;
         End ;
         If Length(Matriz)>=11 Then Begin
            Registro.Fita := Trim ( Matriz[10] ) ;
         End ;
         If Length(Matriz)>=12 Then Begin
            Registro.Categoria := Trim ( Matriz[11] ) ;
         End ;
         //VIEW_REGISTRO( Registro ) ;
      End Else If Aux[1] = '<' Then Begin
         Registro.Ancora := Trim ( EXTRAIR_CONTEUDO ( Aux , 'ANC', Residuo  ) ) ;
         Registro.Retranca := Trim ( EXTRAIR_CONTEUDO ( Aux , 'RET', Residuo ) ) ;
         Registro.Tempo_TT := StrToIntDef ( EXTRAIR_CONTEUDO ( Aux , 'TTT', Residuo ) , 0 ) ;
         If Registro.Tempo_TT > 0 Then Begin
            Registro.Tempo_TT_Str := SegundosToMMSS ( Registro.Tempo_TT ) ;
         End Else Begin
            Registro.Tempo_TT_Str := '-' ;
         End ;
         Registro.Tempo_VT := StrToIntDef ( EXTRAIR_CONTEUDO ( Aux , 'TVT', Residuo ) , 0 ) ;
         If Registro.Tempo_VT > 0 Then Begin
            Registro.Tempo_VT_Str := SegundosToMMSS ( Registro.Tempo_VT ) ;
         End Else Begin
            Registro.Tempo_VT_Str := '-' ;
         End ;
         Registro.Tempo_Ext := StrToIntDef ( EXTRAIR_CONTEUDO ( Aux , 'TEX', Residuo ) , 0 ) ;
         If Registro.Tempo_Ext > 0 Then Begin
            Registro.Tempo_Ext_Str := SegundosToMMSS ( Registro.Tempo_Ext ) ;
         End Else Begin
            Registro.Tempo_Ext_Str := '-' ;
         End ;
         Registro.GC_Modificado := '' ; // Trim ( EXTRAIR_CONTEUDO ( Aux , 'GC', Residuo ) ) ;
         Registro.Editor := Trim ( EXTRAIR_CONTEUDO ( Aux , 'EDT', Residuo ) ) ;
         Registro.Status := StrToIntDef ( EXTRAIR_CONTEUDO ( Aux , 'STA', Residuo ) , 0 ) ;
         Registro.Is_Protegida := StrToIntDef ( EXTRAIR_CONTEUDO ( Aux , 'PRO', Residuo ) , 0 ) = 1 ;
         Registro.Status_TP := StrToIntDef ( EXTRAIR_CONTEUDO ( Aux , 'STP', Residuo ) , 0 ) ;
         Registro.Tipo := Trim ( EXTRAIR_CONTEUDO ( Aux , 'TIP', Residuo ) ) ;
         Registro.Fita := Trim ( EXTRAIR_CONTEUDO ( Aux , 'FIT', Residuo ) ) ;
         Registro.Categoria := Trim ( EXTRAIR_CONTEUDO ( Aux , 'CAT', Residuo ) ) ;
         //Inc ( Numero, 20 ) ;
      End Else Begin  // MODO SVM 2019
         Registro.Valido2 := TRUE ;
         Registro.Ancora := Trim ( Copy ( Aux , 1 , 3 ) ) ;
         Registro.Retranca := Trim ( Copy ( Aux , 4 , 15 ) ) ;
         Registro.Tempo_TT_Str := Trim ( Copy ( Aux , 19 , 5 ) ) ;
         Registro.Tempo_VT_Str := Trim ( Copy ( Aux , 24 , 5 ) ) ;
         Registro.Tempo_Ext_Str := Trim ( Copy ( Aux , 29 , 5 ) ) ;
         Registro.Tempo_TT := MMSSToSegundos2 ( Registro.Tempo_TT_Str ) ;
         Registro.Tempo_VT := MMSSToSegundos2 ( Registro.Tempo_VT_Str ) ;
         Registro.Tempo_Ext := MMSSToSegundos2 ( Registro.Tempo_Ext_Str ) ;
         Registro.GC_Modificado := '' ; // Trim ( Copy ( Aux , 34 , 1 ) ) ;
         Registro.Editor := Trim ( Copy ( Aux , 35 , 6 ) ) ;
         Registro.Status := StrToIntDef ( Trim ( Copy ( Aux , 41 , 3 ) ) , 0 ) ;
         Registro.Status_TP := StrToIntDef ( Trim ( Copy ( Aux , 44 , 3 ) ) , 0 ) ;
         Registro.Tipo := Trim ( Copy ( Aux , 47 , 3 ) ) ;
         Registro.Fita := Trim ( Copy ( Aux , 50 , 3 ) ) ;
         Registro.Categoria := Trim ( Copy ( Aux , 53 , 1 ) ) ;
         Registro.Is_Protegida := ( Registro.Status = 10 ) ;
         Registro.XML := Copy ( Aux, 54, Length ( Aux ) ) ;
         Registro.VT := Trim ( EXTRAIR_CONTEUDO ( Registro.XML , 'VT', Residuo  ) ) ;
      End ;
      Registro.Nova_Retranca := ( Registro.Retranca = '' ) OR ( Pos ( '@', Registro.Retranca ) > 0 ) ;
      Registro.Is_Especial := RD_IS_LINHA_ESPECIAL ( Registro.Retranca ) ;
      Registro.Is_Comercial := RD_IS_COMERCIAL ( Registro.Retranca ) ;
      Registro.Is_Retranca := RD_IS_STATUS_RETRANCA ( Registro.Status ) ;
      Registro.Is_Inicio := ( Registro.Retranca = RD_STR_INICIO ) ;
      Registro.Is_Final := ( Registro.Retranca = RD_STR_FINAL ) ;
      Registro.Is_Inicio_Preview := ( Registro.Retranca = RD_STR_INICIO_PREVIEW ) ;
      Registro.Is_Final_Preview := ( Registro.Retranca = RD_STR_FINAL_PREVIEW ) ;
      Registro.FN_RET := RD_GET_DIR_JORNAL_DATA + Registro.Retranca ;
      Registro.FN_GC1 := Registro.FN_RET + '.gc' ;
      Registro.FN_GC_LAST := Registro.FN_RET + '.gc.last' ;
      Registro.FN_GC_COPIA := Registro.FN_RET + '.gc.copia' ;
      Registro.FN_GC2 := Registro.FN_RET + '.gc2' ;
      Registro.FN_VT := Registro.FN_RET + '.vt' ;
      Registro.FN_CC := Registro.FN_RET + '.cc' ;
      Registro.FN_OFF := Registro.FN_RET + '.off' ;
      Registro.FN_PRIORIDADE := Registro.FN_RET + '.prioridade' ;
      RD_ADD_RETRANCA ( Registro, Buffer ) ;
   End ;
   RD_VERIFICAR_STATUS_RETRANCAS ( Buffer ) ;
   RD_RENUMERAR_RETRANCAS ( 'RD_DECOMPOR_E_MONTAR_ARRAY_ESPELHO', Buffer ) ;
   Lista.Free ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception TEspelho_RD RD DECOMPOR_E_MONTAR_ARRAY_ESPELHO [' + E.Message + ']' ) ;
   End ;
End ;
POP_TICK ( 'Espelho_RD DECOMPOR_E_MONTAR_ARRAY_ESPELHO' ) ;
_Debug ( 'FIM Espelho_RD DECOMPOR_E_MONTAR_ARRAY_ESPELHO' ) ;
End ;

Procedure TEspelho_RD.RD_REPAINT_SGS ( Origem : String ; Buffer : LongInt ) ;
Var Local : LongInt ;
Begin
//PUT_LOG ( 'RD_REPAINT_SGS [' + Origem + ']' ) ;
Try
   Case Buffer Of
   RD_BUFFER_MAIN : Begin
      If RD_VAR_QTDE_SG > 0 Then Begin
         For Local := 0 To RD_VAR_QTDE_SG - 1 Do Begin
            RD_VAR_ARRAY_SG[Local].SG.Invalidate ;
            RD_VAR_ARRAY_SG[Local].SG.Repaint ;
         End ;
      End ;
      End ;
   RD_BUFFER_AUX : Begin
      If RD_VAR_QTDE_SG_AUX > 0 Then Begin
         For Local := 0 To RD_VAR_QTDE_SG_AUX - 1 Do Begin
            RD_VAR_ARRAY_SG_AUX[Local].SG.Invalidate ;
            RD_VAR_ARRAY_SG_AUX[Local].SG.Repaint ;
         End ;
      End ;
      End ;
   End ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception TEspelho_RD RD REPAINT_SGS [' + E.Message + ']' ) ;
   End ;
End ;
End ;

Procedure TEspelho_RD.RD_MONTAR_TODOS_SGS ( Origem : String ;
                                            Buffer, Linha : LongInt ; Open_Video : Boolean ) ;
Var Local : LongInt ;
Begin
_Debug ( 'INI Espelho_RD MONTAR_TODOS_SGS' ) ;
PUSH_TICK ( 'Espelho_RD MONTAR_TODOS_SGS' ) ;
Try
   //PUT_LOG ( 'RD MONTAR_TODOS_SGS [' + Origem + ']' ) ;
   RD_RENUMERAR_RETRANCAS ( 'RD_MONTAR_TODOS_SGS', Buffer ) ;
   Case Buffer Of
   RD_BUFFER_MAIN : Begin
      If RD_VAR_QTDE_SG > 0 Then Begin
         For Local := 0 To RD_VAR_QTDE_SG - 1 Do Begin
            RD_MONTAR_SG ( 'RD MONTAR_TODOS_SGS/MAIN', RD_BUFFER_MAIN, RD_VAR_ARRAY_SG[Local], Linha, Open_Video ) ;
         End ;
      End ;
      End ;
   RD_BUFFER_AUX : Begin
      If RD_VAR_QTDE_SG_AUX > 0 Then Begin
         For Local := 0 To RD_VAR_QTDE_SG_AUX - 1 Do Begin
            RD_MONTAR_SG ( 'RD MONTAR_TODOS_SGS/AUX', RD_BUFFER_AUX, RD_VAR_ARRAY_SG_AUX[Local], Linha, Open_Video ) ;
         End ;
      End ;
      End ;
   End ;
   RD_REPAINT_SGS ( 'RD MONTAR_TODOS_SGS', Buffer ) ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception TEspelho_RD RD MONTAR_TODOS_SGS [' + E.Message + ']' ) ;
   End ;
End ;
POP_TICK ( 'Espelho_RD MONTAR_TODOS_SGS' ) ;
_Debug ( 'FIM Espelho_RD MONTAR_TODOS_SGS' ) ;
End ;

Function TEspelho_RD.RD_GET_INDICE_RETRANCA ( Buffer : LongInt ; Retranca : String ) : LongInt ;
Var Local : LongInt ;
Begin
_Debug ( 'INI Espelho_RD GET_INDICE_RETRANCA' ) ;
Result := -1 ;
Try
   Case Buffer Of
   RD_BUFFER_MAIN : Begin
      If RD_VAR_QTDE_RETRANCAS = 0 Then Begin
         Result := -21 ;
         Exit ;
      End ;
      For Local := 0 To RD_VAR_QTDE_RETRANCAS - 1 Do Begin
         If RD_VAR_ARRAY_RETRANCAS[Local].Retranca = Retranca Then Begin
            Result := Local ;
            Exit ;
         End ;
      End ;
   End ;
   RD_BUFFER_SAVE : Begin
      If RD_VAR_QTDE_RETRANCAS_SAVE = 0 Then Begin
         Result := -22 ;
         Exit ;
      End ;
      For Local := 0 To RD_VAR_QTDE_RETRANCAS_SAVE - 1 Do Begin
         If RD_VAR_ARRAY_RETRANCAS_SAVE[Local].Retranca = Retranca Then Begin
            Result := Local ;
            Exit ;
         End ;
      End ;
   End ;
   RD_BUFFER_AUX : Begin
      If RD_VAR_QTDE_RETRANCAS_AUX = 0 Then Begin
         Result := -23 ;
         Exit ;
      End ;
      For Local := 0 To RD_VAR_QTDE_RETRANCAS_AUX - 1 Do Begin
         If RD_VAR_ARRAY_RETRANCAS_AUX[Local].Retranca = Retranca Then Begin
            Result := Local ;
            Exit ;
         End ;
      End ;
   End ;
   End ; // Case
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception TEspelho_RD RD GET_INDICE_RETRANCA [' + E.Message + ']' ) ;
   End ;
End ;
_Debug ( 'FIM Espelho_RD GET_INDICE_RETRANCA' ) ;
End ;

Function TEspelho_RD.RD_ATUALIZAR_REGISTRO_RETRANCA ( Registro : T_Clip_Retranca ) : LongInt ;
Begin
_Debug ( 'INI Espelho_RD ATUALIZAR_REGISTRO_RETRANCA' ) ;
Result := -1 ;
Try
   Result := RD_GET_INDICE_RETRANCA ( RD_BUFFER_MAIN, Registro.Retranca ) ;
   If Result > -1 Then Begin
      PUT_LOG ( 'Registro atualizado (Idx ' + IntToStr(Result) + ') ' +
                   '[' + RD_VAR_ARRAY_RETRANCAS[Result].Retranca + ']' ) ;
      RD_VAR_ARRAY_RETRANCAS[Result] := Registro ;
   End Else Begin
      PUT_LOG ( 'N?O OK Registro n?o atualizado (Idx ' + IntToStr(Result) + ') ' +
                   '[' + Registro.Retranca + ']' ) ;
   End ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception TEspelho_RD RD ATUALIZAR_REGISTRO_RETRANCA [' + E.Message + ']' ) ;
   End ;
End ;
_Debug ( 'FIM Espelho_RD ATUALIZAR_REGISTRO_RETRANCA' ) ;
End ;

Procedure TEspelho_RD.RD_SETAR_PARAMETROS_ESPELHO ( Origem : String ) ;
Begin
RD_VAR_FILENAME_REN := RD_GET_DIR_JORNAL_DATA + 'historico.ren' ;
//PUT_LOG ( 'RD_SETAR_PARAMETROS_ESPELHO [' + Origem + '][' + RD_VAR_FILENAME_REN + ']' ) ;
End ;

Procedure TEspelho_RD.RD_CRIAR_JORNAL ( Origem : String ) ;
{$IFDEF NW}
Var FN     : String ;
    Aux    : String ;
    Local  : LongInt ;
    Blocos : LongInt ;
{$ENDIF}
Begin
{$IFDEF NW}
Try
   Blocos := 4 ;
   //RD_VAR_RESUMO_GC.Clear ;
   FN := RD_MONTAR_NOME_JORNAL ;
   PUT_LOG ( 'RD CRIAR_JORNAL [' + Origem + '][' + FN + ']' ) ;
   Aux := '   ESCALADA       00:00-    -     -     006000VT MM  <VT></VT>' + sLineBreak ;
   For Local := 1 To Blocos Do Begin
       Aux := Aux +
              '-  COMERCIAL-' + StrZero(Local,2) + '   01:00           -     005000   C1  <VT></VT>' + sLineBreak +
              '   @' + IntToStr(Local) + '                             -     006000       <VT></VT>' + sLineBreak ;
   End ;
   Aux := Aux +
          '-  FIM            -               -     002000       <VT></VT>' + sLineBreak +
          '-  PREVIEW        -                     003000       <VT></VT>' + sLineBreak +
          '-  FINAL PREVIEW  -                     004000       <VT></VT>' + sLineBreak ;
   If NOT RR_FileExists ( 'RD CRIAR_JORNAL', FN ) Then Begin
      CHECAR_DIRETORIO_FILENAME ( FN ) ;
      PUT_CACHE_GRAVACAO ( 'RD CRIAR_JORNAL/1', 500, FN, Aux ) ;
      //WRITE_FILE_CORE ( 'RD CRIAR_JORNAL/1', FN, Aux, DELAYED_FALSE ) ;
      Aux := '#FIXA' + sLineBreak +
             'TITULO' + sLineBreak +
             'TEXTO' + sLineBreak +
             sLineBreak +
             '#GC' + sLineBreak +
             'NOME' + sLineBreak +
             'CARGO' + sLineBreak +
             sLineBreak +
             '#TP' + sLineBreak +
             sLineBreak +
             '#RODA VT=00:00' + sLineBreak +
             '@OBS=' + 'OBSERVACAO' + sLineBreak ;
      For Local := 1 To Blocos Do Begin
         FN := INSERE_BARRA ( ExtractFilePath ( RD_MONTAR_NOME_JORNAL ) ) + '@' + IntToStr ( Local ) ;
         _Debug ( 'Criando Retranca [' + FN + ']' ) ;
         PUT_LOG ( 'Criando Retranca [' + FN + ']' ) ;
         PUT_CACHE_GRAVACAO ( 'RD CRIAR_JORNAL/2', 500, FN, Aux ) ;
         //WRITE_FILE_CORE ( 'RD CRIAR_JORNAL/2', FN, Aux, DELAYED_FALSE ) ;
      End ;
      VALIDAR_BOTAO_ABRIR_CRIAR_ESPELHO ;
      Main.MAIN_ABRIR_ESPELHO ( 'RD CRIAR_JORNAL/' + Origem,
                                PRESERVAR_CONTEXTO_FALSE ) ;
   End ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception TEspelho_RD RD CRIAR_JORNAL [' + E.Message + ']' ) ;
   End ;
End ;
{$ENDIF}
End ;

Function TEspelho_RD.RD_FN_ULTIMO_ESPELHO_ABERTO : String ;
Begin
Result := Diretorio + 'config\last_espelho_aberto.txt' ;
CHECAR_DIRETORIO_FILENAME ( Result ) ;
End ;

Procedure TEspelho_RD.RD_REGISTRAR_ULTIMO_ESPELHO_ABERTO ( Origem : String ) ;
Var Aux : String ;
Begin
_Debug ( 'INI Espelho_RD REGISTRAR ULTIMO_ESPELHO_ABERTO' ) ;
PUSH_TICK ( 'REGISTRAR ULTIMO_ESPELHO_ABERTO' ) ;
If NOT RD_VAR_ESPELHO_ATUAL.Aberto2 Then Begin
   POP_TICK ( 'Exit/1 Espelho_RD REGISTRAR ULTIMO_ESPELHO_ABERTO' ) ;
   _Debug ( 'Exit/1 Espelho_RD REGISTRAR ULTIMO_ESPELHO_ABERTO' ) ;
   Exit ;
End ;
PUT_LOG ( 'RD REGISTRAR ULTIMO_ESPELHO_ABERTO [' + Origem + ']' +
          '[' + RD_FN_ULTIMO_ESPELHO_ABERTO + ']' ) ;
Aux := RD_VAR_ESPELHO_ATUAL.Jornal + sLineBreak +
       DateToStr(RD_VAR_ESPELHO_ATUAL.Data) + sLineBreak ;
PUT_CACHE_GRAVACAO ( 'RD REGISTRAR_ULTIMO_ESPELHO_ABERTO',
                     500, RD_FN_ULTIMO_ESPELHO_ABERTO, Aux ) ;
{
//WRITE_FILE_CORE ( 'RD REGISTRAR_ULTIMO_ESPELHO_ABERTO',
                  RD_FN_ULTIMO_ESPELHO_ABERTO, Aux, DELAYED_TRUE ) ;
}
POP_TICK ( 'Espelho_RD REGISTRAR ULTIMO_ESPELHO_ABERTO' ) ;
_Debug ( 'FIM Espelho_RD REGISTRAR ULTIMO_ESPELHO_ABERTO' ) ;
End ;

Procedure TEspelho_RD.RD_CARREGAR_ULTIMO_ESPELHO_ABERTO ( Var Jornal : String ;
                                                          Var DT : TDateTime ) ;
Var Lista : TStringList ;
Begin
_Debug ( 'INI Espelho_RD CARREGAR_ULTIMO_ESPELHO_ABERTO' ) ;
PUSH_TICK ( 'CARREGAR ULTIMO_ESPELHO_ABERTO' ) ;
Try
   PUT_LOG ( 'RD CARREGAR_ULTIMO_ESPELHO_ABERTO' ) ;
   If NOT RR_FileExists ( 'RD CARREGAR_ULTIMO_ESPELHO_ABERTO',
                          RD_FN_ULTIMO_ESPELHO_ABERTO ) Then Begin
      Jornal := 'NRURAL' ;
      DT := TRUNC ( Now ) ;
      PUT_LOG ( 'RD CARREGAR_ULTIMO_ESPELHO_ABERTO/DEFAULT_1 ' +
                '[' + Jornal + '][' + DateTimeToStr(DT) + ']' ) ;
      POP_TICK ( 'Exit Not RR_FileExists Espelho_RD CARREGAR_ULTIMO_ESPELHO_ABERTO' ) ;
      _Debug ( 'Exit Not RR_FileExists Espelho_RD CARREGAR_ULTIMO_ESPELHO_ABERTO' ) ;
      Exit ;
   End ;
   Lista := TStringList.Create ;
   Try
      PUT_LOG ( 'RD CARREGAR_ULTIMO_ESPELHO_ABERTO  [' + RD_FN_ULTIMO_ESPELHO_ABERTO + ']' ) ;
      //Lista.Text := GET_CONTEUDO_xM ( 'RD_CARREGAR_ULTIMO_ESPELHO_ABERTO',
      //                               RD_FN_ULTIMO_ESPELHO_ABERTO ) ;
      Lista.Text := RD_KERNEL_GET_CONTEUDO_ULTIMO_ESPELHO_ABERTO ( 'RD_CARREGAR_ULTIMO_ESPELHO_ABERTO' ) ;
      If Lista.Count < 2 Then Begin
         Jornal := 'ESPORTE' ;
         DT := TRUNC ( Now ) ;
         PUT_LOG ( 'RD CARREGAR_ULTIMO_ESPELHO_ABERTO/DEFAULT_2 ' +
                   '[' + Jornal + '][' + DateTimeToStr(DT) + ']' ) ;
         Lista.Free ;
         POP_TICK ( 'Exit OK Espelho_RD CARREGAR_ULTIMO_ESPELHO_ABERTO' ) ;
         _Debug ( 'Exit OK Espelho_RD CARREGAR_ULTIMO_ESPELHO_ABERTO' ) ;
         Exit ;
      End ;
   Except
      On E : Exception Do Begin
         PUT_LOG ( 'Exception/1 RD CARREGAR_ULTIMO_ESPELHO_ABERTO [' +
                   RD_FN_ULTIMO_ESPELHO_ABERTO + '][' + E.Message + ']' ) ;
      End ;
   End ;
   Try
      Jornal := Trim ( Lista[0] ) ;
      DT := StrToDate ( Trim ( Lista[1] ) ) ;
      PUT_LOG ( 'RD CARREGAR_ULTIMO_ESPELHO_ABERTO/LOAD_1 ' +
                '[' + Jornal + '][' + DateTimeToStr(DT) + ']' ) ;
   Except
      On E : Exception Do Begin
         PUT_LOG ( 'Exception/2 RD CARREGAR_ULTIMO_ESPELHO_ABERTO [' +
                   RD_FN_ULTIMO_ESPELHO_ABERTO + '][' + E.Message + ']' ) ;
      End ;
   End ;
   Lista.Free ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception TEspelho_RD RD CARREGAR_ULTIMO_ESPELHO_ABERTO [' + E.Message + ']' ) ;
   End ;
End ;
POP_TICK ( 'Espelho_RD CARREGAR_ULTIMO_ESPELHO_ABERTO' ) ;
_Debug ( 'FIM Espelho_RD CARREGAR_ULTIMO_ESPELHO_ABERTO' ) ;
End ;

Procedure TEspelho_RD.RD_CALCULAR_LISTA_SIMPLIFICADA ( Espelho : String ) ;
Var Local          : LongInt ;
    Lista          : TStringList ;
    Registro       : T_Clip_Retranca ;
    Aux            : String ;
//    Residuo        : String ;
//    Matriz         : TArray ;
    Qtde           : LongInt ;
Begin
_Debug ( 'INI RD CALCULAR_LISTA_SIMPLIFICADA' ) ;
PUSH_TICK ( 'RD CALCULAR_LISTA_SIMPLIFICADA' ) ;
Try
   Lista := TStringList.Create ;
   Lista.Clear ;
   Lista.Text := Espelho ;
   RD_VAR_ESPELHO_ATUAL.Lista_Simplificada_Temp.Clear ;
   Qtde := Lista.Count ;
   If Qtde < 4 Then Begin
      _Debug ( 'Exit Lista < 4 RD CALCULAR_LISTA_SIMPLIFICADA' ) ;
      Exit ;
   End ;
   For Local := 0 To Qtde - 1 Do Begin
      Aux := Lista[Local] ;
      If Length ( Aux ) < 10 Then Begin
         Continue ;
      End ;
      RD_LIMPAR_REGISTRO_RETRANCA ( 'RD CALCULAR_LISTA_SIMPLIFICADA', Registro ) ;
      //Registro.Valido2 := TRUE ;
      //Registro.Ancora := Trim ( Copy ( Aux , 1 , 3 ) ) ;
      Registro.Retranca := Trim ( Copy ( Aux , 4 , 15 ) ) ;
      {
      Registro.Tempo_TT_Str := Trim ( Copy ( Aux , 19 , 5 ) ) ;
      Registro.Tempo_VT_Str := Trim ( Copy ( Aux , 24 , 5 ) ) ;
      Registro.Tempo_Ext_Str := Trim ( Copy ( Aux , 29 , 5 ) ) ;
      Registro.Tempo_TT := MMSSToSegundos2 ( Registro.Tempo_TT_Str ) ;
      Registro.Tempo_VT := MMSSToSegundos2 ( Registro.Tempo_VT_Str ) ;
      Registro.Tempo_Ext := MMSSToSegundos2 ( Registro.Tempo_Ext_Str ) ;
      Registro.GC_Modificado := '' ; // Trim ( Copy ( Aux , 34 , 1 ) ) ;
      Registro.Editor := Trim ( Copy ( Aux , 35 , 6 ) ) ;
      Registro.Status := StrToIntDef ( Trim ( Copy ( Aux , 41 , 3 ) ) , 0 ) ;
      Registro.Status_TP := StrToIntDef ( Trim ( Copy ( Aux , 44 , 3 ) ) , 0 ) ;
      Registro.Tipo := Trim ( Copy ( Aux , 47 , 3 ) ) ;
      Registro.Fita := Trim ( Copy ( Aux , 50 , 3 ) ) ;
      Registro.Categoria := Trim ( Copy ( Aux , 53 , 1 ) ) ;
      Registro.Is_Protegida := ( Registro.Status = 10 ) ;
      Registro.XML := Copy ( Aux, 54, Length ( Aux ) ) ;
      Registro.VT := Trim ( EXTRAIR_CONTEUDO ( Registro.XML , 'VT', Residuo  ) ) ;
      Registro.Nova_Retranca := ( Registro.Retranca = '' ) OR ( Pos ( '@', Registro.Retranca ) > 0 ) ;
      Registro.Is_Especial := RD_IS_LINHA_ESPECIAL ( Registro.Retranca ) ;
      Registro.Is_Comercial := RD_IS_COMERCIAL ( Registro.Retranca ) ;
      Registro.Is_Retranca := RD_IS_STATUS_RETRANCA ( Registro.Status ) ;
      Registro.Is_Inicio := ( Registro.Retranca = RD_STR_INICIO ) ;
      Registro.Is_Final := ( Registro.Retranca = RD_STR_FINAL ) ;
      Registro.Is_Inicio_Preview := ( Registro.Retranca = RD_STR_INICIO_PREVIEW ) ;
      Registro.Is_Final_Preview := ( Registro.Retranca = RD_STR_FINAL_PREVIEW ) ;
      Registro.FN_RET := RD_GET_DIR_JORNAL_DATA + Registro.Retranca ;
      Registro.FN_GC1 := Registro.FN_RET + '.gc' ;
      Registro.FN_GC_COPIA := Registro.FN_RET + '.gc.copia' ;
      Registro.FN_GC2 := Registro.FN_RET + '.gc2' ;
      Registro.FN_VT := Registro.FN_RET + '.vt' ;
      Registro.FN_CC := Registro.FN_RET + '.cc' ;
      Registro.FN_OFF := Registro.FN_RET + '.off' ;
      Registro.FN_PRIORIDADE := Registro.FN_RET + '.prioridade' ;
      }
      RD_VAR_ESPELHO_ATUAL.Lista_Simplificada_Temp.Add ( Registro.Retranca ) ;
   End ;
   Lista.Free ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception TEspelho_RD RD DECOMPOR_E_MONTAR_ARRAY_ESPELHO [' + E.Message + ']' ) ;
   End ;
End ;
POP_TICK ( 'RD CALCULAR_LISTA_SIMPLIFICADA' ) ;
_Debug ( 'FIM RD CALCULAR_LISTA_SIMPLIFICADA' ) ;
End ;

Procedure TEspelho_RD.RD_ABRIR_ESPELHO ( Origem : String ;
                                         Preservar_Contexto : Boolean ;
                                         CB : TComboBox ; DT : TDateTime ) ;
Var Save_Top    : LongInt ;
    SG          : TStringGrid ;
    Passo       : LongInt  ;
    _Retranca   : String ;
    _Indice     : String ;
    Indice      : LongInt ;
    Reabrindo   : Boolean ;
    _Jornal     : String ;
Begin
_Debug ( 'INI Espelho_RD ABRIR_ESPELHO [Preservar:' + IFSN(Preservar_Contexto) + ']' ) ;
Passo := 0 ;
PUT_LOG ( 'INI Espelho_RD ABRIR_ESPELHO' ) ;
Try
   If CB.ItemIndex = -1 Then Begin
      _Debug ( 'Exit/1 Espelho_RD ABRIR_ESPELHO' ) ;
      PUT_LOG ( 'Exit/1 !CB.ItemIndex Espelho_RD ABRIR_ESPELHO' ) ;
      Exit ;
   End ;
   _Jornal := Trim ( CB.Items [ CB.ItemIndex ] ) ;
   If _Jornal = '' Then Begin
      _Debug ( 'Exit/2 Espelho_RD ABRIR_ESPELHO' ) ;
      PUT_LOG ( 'Exit/2 !Jornal Espelho_RD ABRIR_ESPELHO' ) ;
      Exit ;
   End ;
   SG := RD_VAR_ARRAY_SG[0].SG ;
   Reabrindo := ( RD_VAR_ESPELHO_ATUAL.Jornal = _Jornal ) AND
                ( TRUNC ( RD_VAR_ESPELHO_ATUAL.Data ) = TRUNC ( DT ) ) ;
   If NOT RD_ESPELHO_EXISTE ( _Jornal, DT ) Then Begin
      //PUT_LOG ( 'RD ABRIR_ESPELHO Exit NOT RD_ESPELHO_EXISTE [' +
      //          RD_VAR_ESPELHO_ATUAL.FN_Espelho + ']' ) ;
      _Debug ( 'Exit/3 NOT EXISTE Espelho_RD ABRIR_ESPELHO Or[' + Origem + ']' ) ;
      PUT_LOG ( 'Exit/3 !FN Espelho_RD ABRIR_ESPELHO' ) ;
      Exit ;
   End ;
   RD_VAR_ESPELHO_ATUAL.Aberto2 := FALSE ;
   Tick_Sync_Jornal_Completo := GetTickCount + 60000 ;
   //RD_VAR_SL_TEXTOS_GC.Clear ;
   PUSH_TICK ( 'RD ABRIR ESPELHO Or[' + Origem + ']' ) ;
   RD_RECALC ( CB, DT ) ;
   {$IFDEF NW}
   Main.LB_Jornal_Aberto.Caption := RD_VAR_ESPELHO_ATUAL.Jornal + sLineBreak +
                                    Copy ( DateToStr ( RD_VAR_ESPELHO_ATUAL.Data ),1,5 ) +
                                    ', ' + Copy ( DiaDaSemana( RD_VAR_ESPELHO_ATUAL.Data ),1,3 ) ;
   {$ENDIF}
   //PUT_LOG ( 'Reabrindo[' + IFSN ( Reabrindo ) + '] Or[' + Origem + ']' ) ;
   If Preservar_Contexto Then Begin
      _Retranca := SG.Cells[SG_J_RETRANCA, SG.Row] ;
      _Indice := SG.Cells[SG_J_NO, SG.Row] ;
      Save_Top := MAX ( 1, SG.TopRow ) ;
   End Else Begin
      _Retranca := ''  ;
      _Indice := ''  ;
      Save_Top := 1 ;
      RD_VAR_SL_POSICOES_CCH.Clear ;
      RD_VAR_LAST_RETRANCA_SEND_GC := '' ;
      RD_VAR_Last_GC_Fixa_Cmd := 0 ;
      RD_VAR_Last_GC_Fixa_L1 := '' ;
      RD_VAR_Last_GC_Fixa_L2 := '' ;
      RD_VAR_Last_GC_Fixa_Lauda := '' ;
      RD_VAR_Last_GC_Fixa_Retranca := '' ;
      {$IFDEF NW}
      Main.PN_Tarja_Fixa.Caption := 'FIXA [' + '' + ']' ;
      {$ENDIF}
   End ;
   Passo := 0 ;
   //PUT_LOG ( '*** ANTES DE RD SINCRONIZAR_JORNAL_COMPLETO ***' ) ;
   RD_SINCRONIZAR_JORNAL_COMPLETO ( 'RD ABRIR_ESPELHO/1',
                                    THREAD_FALSE,
                                    RD_VAR_ESPELHO_ATUAL.Jornal + '*.TXT',
                                    LIMPAR_FALSE ) ;
   //PUT_LOG ( '*** ANTES DE CARREGAR TXT ESPELHO ***' ) ;
   RD_KERNEL_SET_ESPELHO ( RD_KERNEL_GET_CONTEUDO_ESPELHO_ABERTO ( 'RD ABRIR_ESPELHO' ) ) ;
   If RD_KERNEL_GET_ESPELHO = '' Then Begin
      PUT_LOG ( 'ERRO !RD_VAR_ESPELHO_ATUAL.CONTEUDO_ESP' ) ;
      PUT_LOG ( 'ERRO !RD_KERNEL_GET_ESPELHO Espelho_RD ABRIR_ESPELHO' ) ;
      Exit ;
   End ;
   Passo := 3 ;
   RD_CALCULAR_LISTA_SIMPLIFICADA ( RD_KERNEL_GET_ESPELHO ) ;
   With RD_VAR_ESPELHO_ATUAL Do Begin
      If ( Lista_Simplificada_Atual.Text <> '' )  AND
         ( Lista_Simplificada_Atual.Text = Lista_Simplificada_Temp.Text ) Then Begin
         Lista_Simplificada_Atual.Text := Lista_Simplificada_Temp.Text ;
         //PUT_LOG ( 'EXIT / LISTA SIMPLIFICADA IGUAL' ) ;
         RD_VAR_ESPELHO_ATUAL.Aberto2 := TRUE ;
         PUT_LOG ( 'Exit OK Simplificado Espelho_RD ABRIR_ESPELHO' ) ;
         Exit ;
      End ;
   End ;
   //RD_VAR_RESUMO_GC.Clear ;
   Passo := 4 ;
   If ( NOT Reabrindo ) Then Begin
      Passo := 4001 ;
      RD_CRIAR_ARVORE_JORNAL ( 'RD ABRIR_ESPELHO' ) ;
      RD_REGISTRAR_ULTIMO_ESPELHO_ABERTO ( 'RD ABRIR_ESPELHO' ) ;
      //PUT_LOG ( '*** ANTES DE RD LIMPAR_DIRETORIO_LOCAL ***' ) ;
      RD_LIMPAR_DIRETORIO_LOCAL ( 'RD ABRIR_ESPELHO/' + Origem ) ;
      GC_RELOAD_TARJAS_BANCO ( 'RD ABRIR_ESPELHO' ) ;
      RD_VAR_ESPELHO_ATUAL.TXT_Cabeca.Clear ;
      RD_VAR_ESPELHO_ATUAL.TXT_GC.Clear ;
      RD_VAR_ESPELHO_ATUAL.TXT_GC2.Clear ;
      RD_VAR_ESPELHO_ATUAL.TXT_GC_LAST_PROCESSADO.Clear ;
      RD_VAR_ESPELHO_ATUAL.TXT_CABECA_LAST_PROCESSADA.Clear ;
      RD_VAR_ESPELHO_ATUAL.TXT_GC2_Auto.Clear ;
      RD_VAR_ESPELHO_ATUAL.TXT_GC2_INICIALIZADO.Clear ;
      RD_VAR_ESPELHO_ATUAL.GC2_CONVERTIDO.Clear ;
      RD_VAR_ESPELHO_ATUAL.TXT_VT.Clear ;
      RD_VAR_ESPELHO_ATUAL.TXT_CC.Clear ;
      RD_VAR_ESPELHO_ATUAL.TXT_OFF.Clear ;
   End ;
   Passo := 5 ;
   Passo := 7 ;
   RD_KERNEL_FILE_AGE ( RD_VAR_ESPELHO_ATUAL.FN_Espelho, RD_VAR_ESPELHO_ABERTO_AGE ) ;
   Passo := 9 ;
   //PUT_LOG ( '*** ANTES DE RESET ABRIR ESPELHO ***' ) ;
   RD_RESET_ABRIR_ESPELHO ( 'RD ABRIR_ESPELHO', RD_BUFFER_MAIN ) ;
   Passo := 10 ;
   //PUT_LOG ( '*** ANTES DE SETAR PARAMETROS ESPELHO ***' ) ;
   RD_SETAR_PARAMETROS_ESPELHO ( 'RD ABRIR_ESPELHO' ) ;
   Passo := 11 ;
   If NOT Preservar_Contexto Then Begin
      RD_LIMPAR_REGISTRO_RETRANCA ( 'RD ABRIR_ESPELHO', RD_VAR_ESPELHO_ATUAL.Selecionada ) ;
      RD_CARREGAR_ANCORAS_JORNAL ( 'RD ABRIR_ESPELHO' ) ;
   End ;
   {$IFDEF NW}
   GET_INICIO ;
   GET_FADE ;
   {$ENDIF}
   //Inicio := TEMPO_INICIO ;
   Passo := 15 ;
   //PUT_LOG ( '*** ANTES DE RD DECOMPOR_E_MONTAR_ARRAY_ESPELHO ***' ) ;
   RD_DECOMPOR_E_MONTAR_ARRAY_ESPELHO ( 'RD ABRIR_ESPELHO', RD_BUFFER_MAIN, '' ) ;
   Passo := 16 ;
   //RD_SALVAR_STATUS_GC ( APENAS_CARREGAR_TRUE ) ;
   Passo := 17 ;
   //PUT_LOG ( '*** ANTES RD TOTALIZAR_ESPELHO '  +
   //          '(Qtde=' + IntToStr ( Length ( RD_VAR_ARRAY_RETRANCAS ) ) + ') ***' ) ;
   RD_TOTALIZAR_ESPELHO ( 'RD ABRIR_ESPELHO' ) ;
   Passo := 19 ;
   //PUT_LOG ( '*** ANTES RD MONTAR_TODOS_SGS ***' ) ;
   RD_MONTAR_TODOS_SGS ( 'RD ABRIR_ESPELHO', RD_BUFFER_MAIN, 3, OPEN_VIDEO_FALSE ) ;
   Passo := 21 ;
   //RD_CARREGAR_TODOS_OS_TEXTOS_GC ( SG ) ;
   If NOT Preservar_Contexto Then Begin
      //PUT_LOG ( '*** ANTES RD SINCRONIZAR_JORNAL_COMPLETO FULL ***' ) ;
      RD_SINCRONIZAR_JORNAL_COMPLETO ( 'RD ABRIR_ESPELHO/2',
                                       THREAD_FALSE, '*.*', LIMPAR_FALSE ) ;
   End ;
   //PUT_LOG ( '*** ANTES DE RD CARREGAR_SELOS_FIXOS ***' ) ;
   //RD_CARREGAR_GC_ALL ;
   //PUT_LOG ( '*** ANTES DE ATUALIZAR_SG ***' ) ;
   If ( Preservar_Contexto ) AND ( _Retranca <> '' ) Then Begin
      DEF_SG_TOPROW ( 'TEspelho_RD.RD ABRIR_ESPELHO/1', SG, MAX ( 1, Save_Top ) ) ;
      Indice := RD_FIND_RETRANCA_EM_SG ( SG, _Retranca ) ;
      If Indice >= 1 Then Begin
         RD_VAR_IGNONE_CLICK_SG := TRUE ;
         RD_VAR_PROCESSAR_CHYRON := FALSE ;
         RD_SELECT_SG_ROW ( SG, Indice, FALSE ) ;
      End Else Begin
         Indice := RD_FIND_INDICE_EM_SG ( SG, _Indice ) ;
         If Indice >= 1 Then Begin
            RD_VAR_IGNONE_CLICK_SG := TRUE ;
            RD_VAR_PROCESSAR_CHYRON := FALSE ;
            RD_SELECT_SG_ROW ( SG, Indice, FALSE ) ;
         End Else If SG.RowCount > 2 Then Begin
            RD_VAR_PROCESSAR_CHYRON := FALSE ;
            RD_SELECT_SG_ROW ( SG, 2, FALSE ) ;
         End ;
      End ;
   End Else Begin
      DEF_SG_TOPROW ( 'TEspelho_RD.RD ABRIR_ESPELHO/2', SG, 1 ) ;
      RD_CARREGAR_STR_ADD ;
      Indice := RD_FIND_PRIMEIRA_RETRANCA_EM_SG ;
      If Indice >= 1 Then Begin
         RD_SELECT_SG_ROW ( SG, Indice, TRUE ) ;
      End Else Begin
         If SG.RowCount > 2 Then Begin
            RD_SELECT_SG_ROW ( SG, 2, TRUE ) ;
         End ;
      End ;
   End ;
   Passo := 22 ;
   //RD_PRINT_LOG_ME ;
   Passo := 24 ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception TEspelho_RD RD ABRIR_ESPELHO ' +
                '[' + E.Message + ']' +
                '[Passo ' + IntToStr(Passo) + ']' ) ;
   End ;
End ;
PUT_LOG ( 'FIM Espelho_RD ABRIR_ESPELHO' ) ;
RD_VAR_ESPELHO_ATUAL.Aberto2 := ( SG.RowCount > 5 ) ;
POP_TICK ( 'Espelho_RD ABRIR_ESPELHO' ) ;
_Debug ( 'FIM Espelho_RD ABRIR_ESPELHO' ) ;
End ;

Function TEspelho_RD.RD_FORCAR_LENGTH ( Str : String ; _Size : LongInt ) : String ;
Begin
While Length ( Str ) > _Size Do
   Delete ( Str, Length ( Str ) , 1 ) ;
While Length ( Str ) < _Size Do
   Str := Str + #32 ;
Result := Str ;
End ;

Procedure TEspelho_RD.RD_SALVAR_ESPELHO_FULL ( Buffer : LongInt ) ;
Var FN       : String ;
    Local    : LongInt ;
    Registro : T_Clip_Retranca ;
    Aux      : String ;
    Conteudo : String ;
    Qtde     : LongInt  ;
Begin
_Debug ( 'INI Espelho_RD SALVAR_ESPELHO_FULL' ) ;
Try
   If Buffer = RD_BUFFER_MAIN Then Begin
      Qtde := RD_VAR_QTDE_RETRANCAS ;
   End Else If Buffer = RD_BUFFER_SAVE Then Begin
      Qtde := RD_VAR_QTDE_RETRANCAS_SAVE ;
   End Else If Buffer = RD_BUFFER_AUX Then Begin
      Qtde := RD_VAR_QTDE_RETRANCAS_AUX ;
   End Else Begin
      Exit ;
   End  ;
   If Qtde = 0 Then Begin
      _Debug ( 'Exit Qtde 0 Espelho_RD SALVAR_ESPELHO_FULL' ) ;
      Exit ;
   End ;
   If ( Buffer < 1 ) OR ( Buffer > 2 ) Then Begin
      _Debug ( 'Exit Buffer=' + IntToStr(Buffer) + ' Espelho_RD SALVAR_ESPELHO_FULL' ) ;
      Exit ;
   End ;
   Conteudo := '' ;
   For Local := 0 To Qtde - 1 Do Begin
       Case Buffer Of
          RD_BUFFER_MAIN : Registro := RD_VAR_Array_RETRANCAS[Local] ;
          RD_BUFFER_SAVE : Registro := RD_VAR_Array_RETRANCAS_SAVE[Local] ;
          RD_BUFFER_AUX : Registro := RD_VAR_Array_RETRANCAS_AUX[Local] ;
          End ;
       Aux := RD_FORCAR_LENGTH ( Registro.Ancora, 3 ) +
              RD_FORCAR_LENGTH ( Registro.Retranca, 15 ) +
              RD_FORCAR_LENGTH ( Registro.Tempo_TT_Str, 5 ) + // := Trim ( Copy ( Aux , 19 , 5 ) ) ;
              RD_FORCAR_LENGTH ( Registro.Tempo_VT_Str, 5 ) + //  := Trim ( Copy ( Aux , 24 , 5 ) ) ;
              RD_FORCAR_LENGTH ( Registro.Tempo_Ext_Str, 5 ) + // := Trim ( Copy ( Aux , 29 , 5 ) ) ;
              //RD_FORCAR_LENGTH ( Registro.Tempo_TT := MMSSToSegundos2 ( Registro.Tempo_TT_Str ) ;
              //RD_FORCAR_LENGTH ( Registro.Tempo_VT := MMSSToSegundos2 ( Registro.Tempo_VT_Str ) ;
              //RD_FORCAR_LENGTH ( Registro.Tempo_Ext := MMSSToSegundos2 ( Registro.Tempo_Ext_Str ) ;
              RD_FORCAR_LENGTH ( Registro.GC_Modificado, 1 ) + //  := Trim ( Copy ( Aux , 34 , 1 ) ) ;
              RD_FORCAR_LENGTH ( Registro.Editor, 6 ) + //  := Trim ( Copy ( Aux , 35 , 6 ) ) ;
              RD_FORCAR_LENGTH ( StrZero(Registro.Status,3), 3 ) + //  := StrToIntDef ( Trim ( Copy ( Aux , 41 , 3 ) ) , 0 ) ;
              //RD_FORCAR_LENGTH ( Registro.Protegida, 1 ) + //  := ( Registro.Status = 10 ) ;
              RD_FORCAR_LENGTH ( StrZero(Registro.Status_TP, 3 ) , 3 ) + //  := StrToIntDef ( Trim ( Copy ( Aux , 44 , 3 ) ) , 0 ) ;
              RD_FORCAR_LENGTH ( Registro.Tipo, 3 ) + //  := Trim ( Copy ( Aux , 47 , 3 ) ) ;
              RD_FORCAR_LENGTH ( Registro.Fita, 3 ) + //  := Trim ( Copy ( Aux , 50 , 3 ) ) ;
              RD_FORCAR_LENGTH ( Registro.Categoria, 1 ) + //  := Trim ( Copy ( Aux , 53 , 1 ) ) ;
              '<VT>' + Registro.VT + '</VT>' ;
       Conteudo := Conteudo + Aux + sLineBreak ;
   End ;
   //FN := RD_MONTAR_NOME_JORNAL + '_' + DATAHORA_INVERSA(Now) + '.TXT' ;
   FN := RD_MONTAR_NOME_JORNAL ;
   RD_CRIAR_BACKUP_ESPELHO ( FN ) ;
   PUT_LOG ( 'RD SALVAR_ESPELHO_FULL Len[' + IntToStr(Length(Conteudo)) + '] FN[' + FN + ']' ) ;
   PUT_CACHE_GRAVACAO ( 'RD SALVAR_ESPELHO_FULL', 500, FN, Conteudo ) ;
   //WRITE_FILE_CORE ( 'RD SALVAR_ESPELHO_FULL', FN, Conteudo, DELAYED_FALSE ) ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception TEspelho_RD RD SALVAR_ESPELHO_FULL [' + E.Message + ']' ) ;
   End ;
End ;
_Debug ( 'FIM Espelho_RD SALVAR_ESPELHO_FULL' ) ;
End ;

Procedure TEspelho_RD.RD_INSERIR_REGISTRO_PREVIEW ( Registro : T_Clip_Retranca ) ;
Begin
End ;

Function TEspelho_RD.RD_ATUALIZAR_REGISTRO_RETRANCA_SAVE : LongInt ;
Var Local    : LongInt ;
//    Registro : T_Clip_Retranca ;
Begin
_Debug ( 'INI Espelho_RD ATUALIZAR_REGISTRO_RETRANCA_SAVE' ) ;
Result := -1 ;
Try
   If RD_VAR_QTDE_RETRANCAS_SAVE = 0 Then Begin
      _Debug ( 'Exit Save 0 Espelho_RD ATUALIZAR_REGISTRO_RETRANCA_SAVE' ) ;
      Exit ;
   End ;
   For Local := 0 To RD_VAR_QTDE_RETRANCAS_SAVE - 1 Do
      Begin
      If RD_VAR_Array_RETRANCAS_SAVE[Local].Retranca =
         RD_VAR_ESPELHO_ATUAL.Selecionada.Retranca Then
         Begin
         RD_VAR_Array_RETRANCAS_SAVE[Local] := RD_VAR_ESPELHO_ATUAL.Selecionada ;
         Result := Local ;
         Break ;
         End ;
      End ;
   If Result = -1 Then Begin // Retranca a ser salva n?o encontrada no espelho atualizado
      RD_INSERIR_REGISTRO_PREVIEW ( RD_VAR_ESPELHO_ATUAL.Selecionada ) ;
   End ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception TEspelho_RD RD ATUALIZAR_REGISTRO_RETRANCA_SAVE [' + E.Message + ']' ) ;
   End ;
End ;
_Debug ( 'FIM Espelho_RD ATUALIZAR_REGISTRO_RETRANCA_SAVE' ) ;
End ;

Procedure TEspelho_RD.RD_CRIAR_BACKUP_ESPELHO ( Origem : String ) ;
Var FN : String ;
Begin
_Debug ( 'INI Espelho_RD CRIAR_BACKUP_ESPELHO' ) ;
Try
   //Origem := RD_MONTAR_NOME_JORNAL ;
   FN := RD_GET_DIR_JORNAL_BACKUP + DATAHORA_INVERSA(Now) + '_' +
         ExtractFileName ( Origem ) ;
   CHECAR_DIRETORIO_FILENAME ( FN ) ;
   PUT_LOG ( 'CRIAR_BACKUP_ESPELHO [' + Origem + '][' + FN + ']' ) ;
   CopiaArquivo ( 'TEspelho_RD.RD_CRIAR_BACKUP_ESPELHO',
                  Origem , FN, SOBREPOE ) ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception TEspelho_RD RD CRIAR_ESPELHO_BACKUP [' + E.Message + ']' ) ;
   End ;
End ;
_Debug ( 'FIM Espelho_RD CRIAR_BACKUP_ESPELHO' ) ;
End ;

Procedure TEspelho_RD.RD_SALVAR_ESPELHO_EDITOR ;
Begin
_Debug ( 'INI Espelho_RD SALVAR_ESPELHO_EDITOR' ) ;
If Sys_Usuario_Aplicativo.Sys_GC Then Begin
   SHOW_OPERACAO_NAO_PERMITIDA ( 'RD SALVAR_ESPELHO_EDITOR' ) ;
   Exit ;
End ;
Try
   RD_KERNEL_SET_ESPELHO_SAVE ( RD_KERNEL_GET_CONTEUDO_ESPELHO_ABERTO ( 'RD SALVAR_ESPELHO_EDITOR/1' ) ) ;
   PUT_LOG ( 'Length RD VAR_CONTEUDO_ESP_SAVE [' + IntToStr(Length( RD_KERNEL_GET_ESPELHO_SAVE )) + ']' ) ;
   RD_CRIAR_BACKUP_ESPELHO ( RD_KERNEL_GET_ESPELHO_SAVE ) ;
   If RD_KERNEL_GET_ESPELHO_SAVE <> '' Then Begin
      RD_RESET_ABRIR_ESPELHO ( 'RD SALVAR_ESPELHO_EDITOR', RD_BUFFER_SAVE ) ;
      RD_DECOMPOR_E_MONTAR_ARRAY_ESPELHO ( 'RD SALVAR_ESPELHO_EDITOR', RD_BUFFER_SAVE, '' ) ;
      RD_ATUALIZAR_REGISTRO_RETRANCA_SAVE ;
      RD_SALVAR_ESPELHO_FULL ( RD_BUFFER_SAVE ) ;
   End ;
   RD_PRINT_LOG_ME ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception TEspelho_RD RD SALVAR_ESPELHO_EDITOR [' + E.Message + ']' ) ;
   End ;
End ;
_Debug ( 'FIM Espelho_RD SALVAR_ESPELHO_EDITOR' ) ;
End ;

Procedure TEspelho_RD.RD_CARREGAR_ESPELHO_AUX ( FileName : String ) ;
Begin
_Debug ( 'INI Espelho_RD CARREGAR_ESPELHO_AUX' ) ;
Try
   RD_KERNEL_SET_ESPELHO_AUX ( RD_KERNEL_GET_CONTEUDO ( 'RD CARREGAR_ESPELHO_AUX/1',
                                                       FileName ) ) ;
   PUT_LOG ( 'Length RD VAR_CONTEUDO_ESP_AUX ' +
             '[' + IntToStr ( Length ( RD_KERNEL_GET_ESPELHO_AUX ) ) + ']' ) ;
   RD_CRIAR_BACKUP_ESPELHO ( RD_KERNEL_GET_ESPELHO_AUX ) ;
   If RD_KERNEL_GET_ESPELHO_AUX <> '' Then Begin
      RD_RESET_ABRIR_ESPELHO ( 'RD_BUFFER_AUX', RD_BUFFER_AUX ) ;
      RD_DECOMPOR_E_MONTAR_ARRAY_ESPELHO ( 'RD CARREGAR_ESPELHO_AUX',
                                           RD_BUFFER_AUX, '' ) ;
      RD_MONTAR_TODOS_SGS ( 'RD CARREGAR_ESPELHO_AUX',
                            RD_BUFFER_AUX, 3, OPEN_VIDEO_FALSE ) ;
   End ;
   RD_PRINT_LOG_ME ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception TEspelho_RD RD CARREGAR_ESPELHO_AUX ' +
                '[' + E.Message + ']' ) ;
   End ;
End ;
_Debug ( 'FIM Espelho_RD CARREGAR_ESPELHO_AUX' ) ;
End ;

Function TEspelho_RD.RD_GET_REGISTRO_POR_RETRANCA
         ( Buffer : LongInt ; Retranca : String ) : T_Clip_Retranca ;
Var Local    : LongInt ;
    Registro : T_Clip_Retranca ;
Begin
_Debug ( 'INI Espelho_RD GET_REGISTRO_POR_RETRANCA' ) ;
Try
   Result.Valido2 := FALSE ;
   Case Buffer Of
   RD_BUFFER_MAIN : Begin
      If RD_VAR_QTDE_RETRANCAS = 0 Then Begin
         Exit ;
      End ;
      For Local := 0 To RD_VAR_QTDE_RETRANCAS - 1 Do Begin
         Registro := RD_VAR_ARRAY_RETRANCAS [ Local ] ;
         If Registro.Retranca = Retranca Then Begin
            Result := Registro ;
            _Debug ( 'Exit OK /1 Espelho_RD GET_REGISTRO_POR_RETRANCA' ) ;
            Exit ;
         End ;
      End ;
      End ;
   RD_BUFFER_SAVE : Begin
      If RD_VAR_QTDE_RETRANCAS_SAVE = 0 Then Begin
         Exit ;
      End ;
      For Local := 0 To RD_VAR_QTDE_RETRANCAS_SAVE - 1 Do Begin
         Registro := RD_VAR_ARRAY_RETRANCAS_SAVE [ Local ] ;
         If Registro.Retranca = Retranca Then Begin
            Result := Registro ;
            _Debug ( 'Exit OK Save Espelho_RD GET_REGISTRO_POR_RETRANCA' ) ;
            Exit ;
         End ;
      End ;
      End ;
   RD_BUFFER_AUX : Begin
      If RD_VAR_QTDE_RETRANCAS_AUX = 0 Then Begin
         Exit ;
      End ;
      For Local := 0 To RD_VAR_QTDE_RETRANCAS_AUX - 1 Do Begin
         Registro := RD_VAR_ARRAY_RETRANCAS_AUX [ Local ] ;
         If Registro.Retranca = Retranca Then Begin
            Result := Registro ;
            _Debug ( 'Exit OK Aux Espelho_RD GET_REGISTRO_POR_RETRANCA' ) ;
            Exit ;
         End ;
      End ;
      End ;
   End ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception TEspelho_RD RD GET_REGISTRO_POR_RETRANCA ' +
                '[' + E.Message + ']' ) ;
   End ;
End ;
_Debug ( 'FIM Espelho_RD GET_REGISTRO_POR_RETRANCA' ) ;
End ;

Procedure TEspelho_RD.RD_CRIAR_NOVA_RETRANCA ( Posicao_Destino : LongInt ) ;
{$IFDEF NW}
Var Local    : LongInt ;
    Registro : T_Clip_Retranca ;
    FN       : String ;
    Qtde     : LongInt ;
{$ENDIF}
Begin
{$IFDEF NW}
_Debug ( 'INI Espelho_RD CRIAR_NOVA_RETRANCA' ) ;
If Sys_Usuario_Aplicativo.Sys_GC Then Begin
   SHOW_OPERACAO_NAO_PERMITIDA ( 'RD_CRIAR_NOVA_RETRANCA' ) ;
   Exit ;
End ;
Try
   Inc ( RD_VAR_QTDE_RETRANCAS ) ;
   SetLength ( RD_VAR_ARRAY_RETRANCAS, RD_VAR_QTDE_RETRANCAS ) ;
   For Local := RD_VAR_QTDE_RETRANCAS - 1 DownTo
                Posicao_Destino + 1 Do Begin
      RD_VAR_ARRAY_RETRANCAS[Local] := RD_VAR_ARRAY_RETRANCAS[Local-1] ;
   End ;
   RD_LIMPAR_REGISTRO_RETRANCA ( 'RD_CRIAR_NOVA_RETRANCA', Registro ) ;
   Registro.Valido2 := TRUE ;
   Registro.Retranca := RD_CALC_NOVA_RETRANCA ;
   FN := RD_GET_DIR_JORNAL_DATA + Registro.Retranca ;
   PUT_CACHE_GRAVACAO ( 'RD CRIAR_NOVA_RETRANCA/1', 500, FN, '' ) ;
   //WRITE_FILE_CORE ( 'RD CRIAR_NOVA_RETRANCA/1', FN, '', DELAYED_FALSE ) ;
   Qtde := RD_VAR_EXTENSOES.Count ;
   For Local := 0 To Qtde - 1 Do Begin
      FN := RD_GET_DIR_JORNAL_DATA + Registro.Retranca + '.' +
            RD_VAR_EXTENSOES[Local] ;
      PUT_CACHE_GRAVACAO ( 'RD CRIAR_NOVA_RETRANCA/2', 500, FN, '' ) ;
      //WRITE_FILE_CORE ( 'RD_CRIAR_NOVA_RETRANCA/2', FN, '', DELAYED_FALSE ) ;
   End ;
   Registro.Status := J_NORMAL ;
   Registro.Editor := RD_FORCAR_LENGTH ( Sys_Usuario_Aplicativo.Sys_Editor, 3 ) ;
   RD_VAR_ARRAY_RETRANCAS[Posicao_Destino] := Registro ;
   RD_MONTAR_TODOS_SGS ( 'RD_CRIAR_NOVA_RETRANCA', RD_BUFFER_MAIN,
                         Posicao_Destino + 1, OPEN_VIDEO_FALSE ) ;
   RD_SALVAR_ESPELHO_FULL ( RD_BUFFER_MAIN ) ;
   RD_POSICIONAR_E_SELECIONAR_RETRANCA_NO_SG ( Registro.Retranca,
                                               Main.SG_J2 ) ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception TEspelho_RD RD CRIAR_NOVA_RETRANCA ' +
                '[' + E.Message + ']' ) ;
   End ;
End ;
_Debug ( 'FIM Espelho_RD CRIAR_NOVA_RETRANCA' ) ;
{$ENDIF}
End ;

Function TEspelho_RD.RD_CALC_NOVA_RETRANCA : String ;
Var Indice   : LongInt ;
    Local    : LongInt ;
    Retranca : String ;
    Temp     : T_Clip_Retranca ;
    FN       : String ;
    OK       : Boolean ;
    Qtde     : LongInt ;
Begin
_Debug ( 'INI Espelho_RD CALC_NOVA_RETRANCA' ) ;
Try
   Indice := 0 ;
   Repeat
      Inc ( Indice ) ;
      Retranca := '@' + IntToStr ( Indice ) ;
      OK := TRUE ;
      FN := RD_GET_DIR_JORNAL_DATA + Retranca ;
      If RR_FileExists ( 'RD_CALC_NOVA_RETRANCA/1', FN ) Then Begin
         OK := FALSE ;
      End ;
      Qtde := RD_VAR_EXTENSOES.Count ;
      For Local := 0 To Qtde - 1 Do Begin
         FN := RD_GET_DIR_JORNAL_DATA + Retranca + '.' +
               RD_VAR_EXTENSOES[Local] ;
         If RR_FileExists ( 'RD_CALC_NOVA_RETRANCA/2', FN ) Then Begin
            OK := FALSE ;
            Break  ;
         End ;
      End ;
   Until ( RD_RETRANCA_EXISTE_NO_ESPELHO ( RD_BUFFER_MAIN, Retranca, Temp ) = -1 ) AND
         ( OK ) ;
   Result := Retranca ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception TEspelho_RD RD CALC_NOVA_RETRANCA ' +
                '[' + E.Message + ']' ) ;
   End ;
End ;
_Debug ( 'FIM Espelho_RD CALC_NOVA_RETRANCA [' + Result + ']' ) ;
End ;

Function TEspelho_RD.RD_EXEC_RENOMEAR_RETRANCA
         ( Old_Retranca, New_Retranca : String ) : Boolean ;
Var Posicao : LongInt ;
    FN1     ,
    FN2     : String ;
    Lista1  ,
    Lista2  : TStringList ;
    Local   : LongInt ;
    Ok      : Boolean ;
    Sucesso : Boolean ;
    Qtde    : LongInt ;
Begin
_Debug ( 'INI Espelho_RD EXEC_RENOMEAR_RETRANCA' ) ;
Result := FALSE ;
If Sys_Usuario_Aplicativo.Sys_GC Then Begin
   SHOW_OPERACAO_NAO_PERMITIDA ( 'RD_EXEC_RENOMEAR_RETRANCA' ) ;
   Exit ;
End ;
Try
   Posicao := RD_RETRANCA_EXISTE_NO_ESPELHO ( RD_BUFFER_MAIN,
                                              Old_Retranca, LAUDA_TEMP ) ;
   PUT_LOG ( 'INI RD_RENOMEAR_RETRANCA [' + Old_Retranca + ']' +
             '[' + New_Retranca + '] ' +
             'Pos[' + IntToStr(Posicao) + ']' ) ;
   If Posicao = -1 Then Begin
      PUT_LOG ( 'Exit RD_RENOMEAR_RETRANCA N?o Encontrado no Espelho' ) ;
      _Debug ( 'Exit Posicao -1 Espelho_RD EXEC_RENOMEAR_RETRANCA' ) ;
      Exit ;
   End ;
   Lista1 := TStringList.Create ;
   Lista2 := TStringList.Create ;
   FN1 := RD_GET_DIR_JORNAL_DATA + Old_Retranca ;
   FN2 := RD_GET_DIR_JORNAL_DATA + New_Retranca ;
   Lista1.Add ( FN1 ) ;
   Lista2.Add ( FN2 ) ;
   Qtde := RD_VAR_EXTENSOES.Count ;
   For Local := 0 To Qtde - 1 Do Begin
      FN1 := RD_GET_DIR_JORNAL_DATA + Old_Retranca + '.' +
             RD_VAR_EXTENSOES[Local] ;
      FN2 := RD_GET_DIR_JORNAL_DATA + New_Retranca + '.' +
             RD_VAR_EXTENSOES[Local] ;
      Lista1.Add ( FN1 ) ;
      Lista2.Add ( FN2 ) ;
   End ;
   Ok := TRUE ;
   Sucesso := TRUE ;
   Qtde := Lista2.Count ;
   For Local := 0 To Qtde - 1 Do Begin
      If RR_FileExists ( 'RD_EXEC_RENOMEAR_RETRANCA', Lista2[Local] ) Then Begin

         ShowNewMessage ( 'Arquivo "' + Lista2[Local] +
                          '" j? existe no jornal' ) ;
         Sucesso := FALSE ;
         Ok := FALSE ;
      End ;
   End ;
   If Ok Then Begin
      For Local := 0 To Qtde - 1 Do Begin
         If System.SysUtils.RenameFile ( Lista1[Local] ,
                                         Lista2[Local] ) Then Begin
            PUT_LOG ( 'RENAME OK para [' + Lista2[Local] + ']' ) ;
         End Else Begin
            PUT_LOG ( 'RENAME N?O OK de [' + Lista1[Local] +
                      '] para [' + Lista2[Local] + ']' ) ;
            Sucesso := FALSE ;
         End ;
      End ;
   End ;
   If Sucesso Then Begin
      Result := TRUE ;
      RD_VAR_ARRAY_RETRANCAS[Posicao].Retranca := New_Retranca ;
      RD_REGISTRAR_RENAME_LAUDA ( Old_Retranca, New_Retranca ) ;
      RD_SALVAR_ESPELHO_FULL ( RD_BUFFER_MAIN ) ;
   End ;
   RD_MONTAR_TODOS_SGS ( 'RD_EXEC_RENOMEAR_RETRANCA', RD_BUFFER_MAIN,
                         Posicao+1, OPEN_VIDEO_FALSE ) ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception TEspelho_RD RD EXEC_RENOMEAR_RETRANCA ' +
                '[' + E.Message + ']' ) ;
   End ;
End ;
_Debug ( 'FIM Espelho_RD EXEC_RENOMEAR_RETRANCA' ) ;
End ;

Procedure TEspelho_RD.RD_REGISTRAR_RENAME_LAUDA ( _Old , _New : String ) ;
Var Lista    : TStringList ;
    FileName : String ;
Begin
_Debug ( 'INI Espelho_RD REGISTRAR_RENAME_LAUDA' ) ;
Try
   Lista := TStringList.Create ;
   Lista.Clear ;
   FileName := RD_VAR_FILENAME_REN ;
   PUT_LOG ( 'RD_REGISTRAR_RENAME_LAUDA OLD[' + _Old + '] ' +
             'NEW[' + _New + ']' ) ;
   PUT_LOG ( 'RD_REGISTRAR_RENAME_LAUDA FN [' + FileName + ']' ) ;
   PUT_LOG ( 'RD_REGISTRAR_RENAME_LAUDA REN ' +
             '[' + RD_VAR_FILENAME_REN + ']' ) ;
   If RR_FileExists ( 'RD REGISTRAR_RENAME_LAUDA', FileName ) Then Begin
      Try
         PUT_LOG ( 'RD_REGISTRAR_RENAME_LAUDA ' +
                   '[' + FileName + ']' ) ;
         Lista.Text := RD_KERNEL_GET_CONTEUDO ( 'RD_REGISTRAR_RENAME_LAUDA', FileName ) ;
      Except
         On E : Exception Do Begin
            PUT_LOG ( 'Exception REGISTRAR_RENAME_LAUDA ' +
                      '[' + FileName + '][' + E.Message + ']' ) ;
         End ;
      End ;
   End ;
   Lista.Add ( DateTimeToStr ( Now ) + #32 + '"' +
               COMPLETE ( Trim ( _Old ) + '"' , 17 ) + ' -> "' +
               COMPLETE ( Trim ( _New ) + '"' , 17 ) +
               ' [Por ' + Sys_Usuario_Aplicativo.Usuario + ' em ' +
               COMPUTADOR + ']' ) ;
   Try
      Lista.SaveToFile ( FileName ) ;
   Except
      On E : Exception Do Begin
         PUT_LOG ( 'Exception REGISTRAR_RENAME_LAUDA ' +
                   '[' + FileName + '][' + E.Message + ']' ) ;
      End ;
   End ;
   Lista.Free ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception TEspelho_RD RD REGISTRAR_RENAME_LAUDA ' +
                '[' + E.Message + ']' ) ;
   End ;
End ;
_Debug ( 'FIM Espelho_RD REGISTRAR_RENAME_LAUDA' ) ;
End ;

Function TEspelho_RD.RD_GC_GET_FN_IMAGEM_TARJA_GC ( _Msg : LongInt ) : String ;
Begin
_Debug ( 'INI RD GC GET_FN_IMAGEM_TARJA_GC' ) ;
Result := RD_GC_GET_DIR_IMAGENS_TARJAS + StrZero(_Msg,4) + '.bmp' ;
_Debug ( 'FIM RD GC GET_FN_IMAGEM_TARJA_GC' ) ;
End ;

Function TEspelho_RD.RD_GC_GET_FN_IMAGEM_RELOGIO_GC ( _Msg : LongInt ) : String ;
Begin
_Debug ( 'INI RD GC GET_FN_IMAGEM_RELOGIO_GC' ) ;
Result := RD_GC_GET_DIR_IMAGENS_TARJAS + StrZero(10,4) + '.bmp' ;
_Debug ( 'FIM RD GC GET_FN_IMAGEM_RELOGIO_GC' ) ;
End ;

Procedure TEspelho_RD.RD_SELECIONAR_REGISTRO_RETRANCA ( _Retranca : String ) ;
Var Local : LongInt ;
    Qtde  : LongInt ;
Begin
Try
   Qtde := Length ( RD_VAR_ARRAY_RETRANCAS ) ;
   If Qtde = 0 Then Begin
      PUT_LOG ( 'Exit/Qtde 0/TEspelho_RD SELECIONAR_REGISTRO_RETRANCA [' +
                _Retranca + ']' ) ;
      Exit ;
   End ;
   For Local := 0 To Qtde - 1 Do Begin
      If RD_VAR_ARRAY_RETRANCAS[Local].Retranca = _Retranca Then Begin
         //RD_VAR_ESPELHO_ATUAL.Selecionada := RD_VAR_ARRAY_RETRANCAS[Local] ;
         RD_ATUALIZAR_SEL_RETRANCA ( 'TEspelho_RD.SELECIONAR_REGISTRO_RETRANCA/' + _Retranca ,
                                     RD_VAR_ARRAY_RETRANCAS[Local],
                                     RD_VAR_ESPELHO_ATUAL.Temp ) ;
         PUT_LOG ( 'OK TEspelho_RD SELECIONAR_REGISTRO_RETRANCA ' +
                   '[' + _Retranca + ']' ) ;
         Exit ;
      End ;
   End ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception TEspelho_RD RD SELECIONAR_REGISTRO_RETRANCA ' +
                '[' + E.Message + ']' ) ;
   End ;
End ;
PUT_LOG ( 'NOK TEspelho_RD SELECIONAR_REGISTRO_RETRANCA ' +
          '[' + _Retranca + ']' ) ;
End ;

Function TEspelho_RD.RD_POSICIONAR_E_SELECIONAR_RETRANCA_NO_SG
         ( _Retranca : String ; SG : TStringGrid ) : Boolean  ;
Var Local : LongInt ;
    Qtde  : LongInt ;
Begin
Result := FALSE ;
Try
   Qtde := SG.RowCount ;
   If Qtde = 0 Then Begin
      PUT_LOG ( 'Exit/Qtde 0/TEspelho_RD POSICIONAR_E_SELECIONAR_RETRANCA_NO_SG [' + _Retranca + ']' ) ;
      Exit ;
   End ;
   For Local := 0 To Qtde - 1 Do Begin
       If SG.Cells[SG_J_RETRANCA,Local] = _Retranca Then Begin
          PUT_LOG ( 'OK TEspelho_RD POSICIONAR_E_SELECIONAR_RETRANCA_NO_SG/1 [' + _Retranca + ']' ) ;
          RD_SG_CLICK_MODO_FORCADO := TRUE ;
          RD_SELECT_SG_ROW ( SG, Local, TRUE ) ;
          PUT_LOG ( 'OK TEspelho_RD POSICIONAR_E_SELECIONAR_RETRANCA_NO_SG [' + _Retranca + ']' ) ;
          RD_SELECIONAR_REGISTRO_RETRANCA ( _Retranca ) ;
          Result := TRUE ;
          Exit ;
       End ;
   End ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception TEspelho_RD RD POSICIONAR_E_SELECIONAR_RETRANCA_NO_SG [' + E.Message + ']' ) ;
   End ;
End ;
PUT_LOG ( 'NOK TEspelho_RD POSICIONAR_E_SELECIONAR_RETRANCA_NO_SG ' +
          '[' + _Retranca + ']' ) ;
End ;

Procedure TEspelho_RD.RD_INTERCAMBIAR_POSICOES
          ( Pos1, Pos2: LongInt ; Var SG : TStringGrid ; Linha : LongInt ) ;
Var Temp    : T_Clip_Retranca ;
    Salvar  : T_Clip_Retranca ;
Begin
_Debug ( 'INI Espelho_RD INTERCAMBIAR_POSICOES' ) ;
If Sys_Usuario_Aplicativo.Sys_GC Then Begin
   SHOW_OPERACAO_NAO_PERMITIDA ( 'RD_INTERCAMBIAR_POSICOES' ) ;
   Exit ;
End ;
Try
   Salvar := RD_VAR_ESPELHO_ATUAL.Selecionada ;
   Temp := RD_VAR_ARRAY_RETRANCAS[Pos1] ;
   RD_VAR_ARRAY_RETRANCAS[Pos1] := RD_VAR_ARRAY_RETRANCAS[Pos2] ;
   RD_VAR_ARRAY_RETRANCAS[Pos2] := Temp ;
   RD_MONTAR_TODOS_SGS ( 'RD_INTERCAMBIAR_POSICOES',
                         RD_BUFFER_MAIN, Pos2+1, OPEN_VIDEO_FALSE ) ;
   RD_SALVAR_ESPELHO_FULL ( RD_BUFFER_MAIN ) ;
   PUT_LOG ( 'MODIFY_ROW SG.Row ' + SG.Name + ' RD_INTERCAMBIAR_POSICOES' ) ;
   RD_POSICIONAR_E_SELECIONAR_RETRANCA_NO_SG ( Salvar.Retranca, SG ) ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception TEspelho_RD RD INTERCAMBIAR_POSICOES ' +
                '[' + E.Message + ']' ) ;
   End ;
End ;
_Debug ( 'FIM Espelho_RD INTERCAMBIAR_POSICOES' ) ;
End ;

Function TEspelho_RD.RD_GET_RETRANCA_HEADER_PREVIEW
         ( Buffer : LongInt ) : LongInt ;
Begin
Result := RD_GET_INDICE_RETRANCA ( Buffer, RD_STR_INICIO_PREVIEW ) ;
End ;

Function TEspelho_RD.RD_REMOVER_RETRANCA
         ( Origem : String ; Buffer, Indice : LongInt ) : T_Clip_Retranca ;
Var Local : LongInt ;
Begin
_Debug ( 'INI Espelho_RD REMOVER_RETRANCA' ) ;
If Sys_Usuario_Aplicativo.Sys_GC Then Begin
   SHOW_OPERACAO_NAO_PERMITIDA ( 'RD_REMOVER_RETRANCA' ) ;
   Exit ;
End ;
Try
   PUT_LOG ( 'RD_REMOVER_RETRANCA [' + Origem + ']' ) ;
   RD_LIMPAR_REGISTRO_RETRANCA ( 'RD_REMOVER_RETRANCA', Result ) ;
   Case Buffer Of
   RD_BUFFER_MAIN : Begin
      If Indice >= RD_VAR_QTDE_RETRANCAS Then Begin
         _Debug ( 'Exit Indice > Main Espelho_RD REMOVER_RETRANCA' ) ;
         Exit ;
      End ;
      Result := RD_VAR_ARRAY_RETRANCAS[Indice] ;
      If Indice < ( RD_VAR_QTDE_RETRANCAS - 1 ) Then Begin
         For Local := Indice To RD_VAR_QTDE_RETRANCAS - 2 Do Begin
             RD_VAR_ARRAY_RETRANCAS[Local] := RD_VAR_ARRAY_RETRANCAS[Local+1] ;
         End ;
      End ;
      Dec ( RD_VAR_QTDE_RETRANCAS ) ;
      SetLength ( RD_VAR_ARRAY_RETRANCAS, RD_VAR_QTDE_RETRANCAS ) ;
      End ;
   RD_BUFFER_SAVE : Begin
      If Indice >= RD_VAR_QTDE_RETRANCAS_SAVE Then Begin
         _Debug ( 'Exit Indice > Save Espelho_RD REMOVER_RETRANCA' ) ;
         Exit ;
      End ;
      Result := RD_VAR_ARRAY_RETRANCAS_SAVE[Indice] ;
      If Indice < ( RD_VAR_QTDE_RETRANCAS_SAVE - 1 ) Then Begin
         For Local := Indice To RD_VAR_QTDE_RETRANCAS_SAVE - 2 Do Begin
             RD_VAR_ARRAY_RETRANCAS_SAVE[Local] := RD_VAR_ARRAY_RETRANCAS_SAVE[Local+1] ;
         End ;
      End ;
      Dec ( RD_VAR_QTDE_RETRANCAS_SAVE ) ;
      SetLength ( RD_VAR_ARRAY_RETRANCAS_SAVE, RD_VAR_QTDE_RETRANCAS_SAVE ) ;
      End ;
   RD_BUFFER_AUX : Begin
      If Indice >= RD_VAR_QTDE_RETRANCAS_AUX Then Begin
         _Debug ( 'Exit Indice > Aux Espelho_RD REMOVER_RETRANCA' ) ;
         Exit ;
      End ;
      Result := RD_VAR_ARRAY_RETRANCAS_AUX[Indice] ;
      If Indice < ( RD_VAR_QTDE_RETRANCAS_AUX - 1 ) Then Begin
         For Local := Indice To RD_VAR_QTDE_RETRANCAS_AUX - 2 Do Begin
             RD_VAR_ARRAY_RETRANCAS_AUX[Local] :=
                 RD_VAR_ARRAY_RETRANCAS_AUX[Local+1] ;
         End ;
      End ;
      Dec ( RD_VAR_QTDE_RETRANCAS_AUX ) ;
      SetLength ( RD_VAR_ARRAY_RETRANCAS_AUX, RD_VAR_QTDE_RETRANCAS_AUX ) ;
      End ;
   End ;
   RD_SALVAR_ESPELHO_FULL ( Buffer ) ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception TEspelho_RD RD REMOVER_RETRANCA ' +
                '[' + E.Message + ']' ) ;
   End ;
End ;
_Debug ( 'FIM Espelho_RD REMOVER_RETRANCA' ) ;
End ;

Function TEspelho_RD.RD_INSERIR_RETRANCA
         ( Origem : String ; Buffer : LongInt ;
           Registro : T_Clip_Retranca ; Indice : LongInt ) : LongInt ;
Var Local : LongInt ;
Begin
_Debug ( 'INI Espelho_RD INSERIR_RETRANCA' ) ;
Result := -1 ;
If Sys_Usuario_Aplicativo.Sys_GC Then Begin
   SHOW_OPERACAO_NAO_PERMITIDA ( 'RD_INSERIR_RETRANCA' ) ;
   Exit ;
End ;
Try
   PUT_LOG ( 'RD_INSERIR_RETRANCA [' + Origem + ']' ) ;
   Case Buffer Of
   RD_BUFFER_MAIN : Begin
      Indice := MIN ( Indice, RD_VAR_QTDE_RETRANCAS - 2 ) ;
      Inc ( RD_VAR_QTDE_RETRANCAS ) ;
      SetLength ( RD_VAR_ARRAY_RETRANCAS, RD_VAR_QTDE_RETRANCAS ) ;
      For Local := RD_VAR_QTDE_RETRANCAS - 1 DownTo Indice+1 Do Begin
          RD_VAR_ARRAY_RETRANCAS[Local] := RD_VAR_ARRAY_RETRANCAS[Local-1] ;
      End ;
      RD_VAR_ARRAY_RETRANCAS[Indice] := Registro ;
      Result := Indice ;
      End ;
   RD_BUFFER_SAVE : Begin
      Indice := MIN ( Indice, RD_VAR_QTDE_RETRANCAS_SAVE - 2 ) ;
      Inc ( RD_VAR_QTDE_RETRANCAS_SAVE ) ;
      SetLength ( RD_VAR_ARRAY_RETRANCAS_SAVE, RD_VAR_QTDE_RETRANCAS_SAVE ) ;
      For Local := RD_VAR_QTDE_RETRANCAS_SAVE - 1 DownTo Indice+1 Do Begin
          RD_VAR_ARRAY_RETRANCAS_SAVE[Local] :=
             RD_VAR_ARRAY_RETRANCAS_SAVE[Local-1] ;
      End ;
      RD_VAR_ARRAY_RETRANCAS_SAVE[Indice] := Registro ;
      Result := Indice ;
      End ;
   RD_BUFFER_AUX : Begin
      Indice := MIN ( Indice, RD_VAR_QTDE_RETRANCAS_AUX - 2 ) ;
      Inc ( RD_VAR_QTDE_RETRANCAS_AUX ) ;
      SetLength ( RD_VAR_ARRAY_RETRANCAS_AUX, RD_VAR_QTDE_RETRANCAS_AUX ) ;
      For Local := RD_VAR_QTDE_RETRANCAS_AUX - 1 DownTo Indice+1 Do Begin
          RD_VAR_ARRAY_RETRANCAS_AUX[Local] :=
             RD_VAR_ARRAY_RETRANCAS_AUX[Local-1] ;
      End ;
      RD_VAR_ARRAY_RETRANCAS_AUX[Indice] := Registro ;
      Result := Indice ;
      End ;
   End ;
   RD_SALVAR_ESPELHO_FULL ( Buffer ) ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception TEspelho_RD RD INSERIR_RETRANCA ' +
                '[' + E.Message + ']' ) ;
   End ;
End ;
_Debug ( 'FIM Espelho_RD INSERIR_RETRANCA' ) ;
End ;

Function TEspelho_RD.RD_MOVER_RETRANCA
         ( Origem : String ; Buffer, Inicio, Fim : LongInt ) : LongInt ;
Var Fim2 : LongInt ;
    Temp : T_Clip_Retranca ;
Begin
_Debug ( 'INI Espelho_RD MOVER_RETRANCA' ) ;
Result := -1 ;
Try
   PUT_LOG ( 'RD_MOVER_RETRANCA [' + Origem + ']' ) ;
   If Inicio = Fim Then Begin
      _Debug ( 'Exit Inicio = Fim Espelho_RD MOVER_RETRANCA' ) ;
      Exit ;
   End ;
   If Fim > Inicio Then Begin
      Fim2 := Fim ;
   End Else Begin
      Fim2 := Fim + 1 ;
   End ;
   Temp := RD_REMOVER_RETRANCA ( 'RD_MOVER_RETRANCA', Buffer, Inicio ) ;
   Result := RD_INSERIR_RETRANCA ( 'RD_MOVER_RETRANCA', Buffer, Temp, Fim2 ) ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception TEspelho_RD RD MOVER_RETRANCA '  +
                '[' + E.Message + ']' ) ;
   End ;
End ;
_Debug ( 'FIM Espelho_RD MOVER_RETRANCA' ) ;
End ;

Function TEspelho_RD.RD_ENVIAR_PARA_O_PREVIEW
         ( Origem : String ; Buffer : LongInt ;
           Registro : T_Clip_Retranca ) : LongInt ;
Var Preview : LongInt ;
    Indice  : LongInt ;
Begin
_Debug ( 'INI Espelho_RD ENVIAR_PARA_O_PREVIEW' ) ;
Result := -1 ;
Try
   PUT_LOG ( 'RD_ENVIAR_PARA_O_PREVIEW [' + Origem + ']' ) ;
   If Registro.Is_Especial Then
      Begin
      Result := -2 ;
      _Debug ( 'Exit Is_Especial Espelho_RD ENVIAR_PARA_O_PREVIEW' ) ;
      Exit ;
      End ;
   Preview := RD_GET_RETRANCA_HEADER_PREVIEW ( Buffer ) ;
   If Preview = -1 Then Begin
      _Debug ( 'Exit Preview -1 Espelho_RD ENVIAR_PARA_O_PREVIEW' ) ;
      Result := -3 ;
      Exit ;
   End ;
   Indice := RD_GET_INDICE_RETRANCA ( Buffer, Registro.Retranca ) ;
   If Indice = -1 Then Begin
      _Debug ( 'Exit Indice -1 Espelho_RD ENVIAR_PARA_O_PREVIEW' ) ;
      Result := -4 ;
      Exit ;
   End ;
   PUT_LOG ( 'RD_ENVIAR_PARA_O_PREVIEW [' + IntToStr(Indice) + ']'  +
             '[' + IntToStr(Preview) + ']' ) ;
   If Indice <> Preview + 1 Then
      Result := RD_MOVER_RETRANCA ( 'RD_ENVIAR_PARA_O_PREVIEW',
                                    Buffer, Indice, Preview ) ;
   RD_MONTAR_TODOS_SGS ( 'RD_ENVIAR_PARA_O_PREVIEW', Buffer,
                         Preview+1, OPEN_VIDEO_FALSE ) ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception TEspelho_RD RD ENVIAR_PARA_O_PREVIEW ' +
                '[' + E.Message + ']' ) ;
   End ;
End ;
_Debug ( 'FIM Espelho_RD ENVIAR_PARA_O_PREVIEW' ) ;
End ;

Procedure TEspelho_RD.RD_CRIAR_BACKUP_RETRANCA_EXCLUIDA
          ( _Origem, Retranca : String ) ;
Var Local    : LongInt ;
    Lista    : TStringList ;
    Origem   : String ;
    Destino  : String ;
    Qtde     : LongInt ;
Begin
_Debug ( 'INI Espelho_RD CRIAR_BACKUP_RETRANCA_EXCLUIDA' ) ;
Lista := TStringList.Create ;
Try
   PUT_LOG ( 'RD_CRIAR_BACKUP_RETRANCA_EXCLUIDA [' + _Origem + ']' ) ;
   CHECAR_DIRETORIO_FILENAME ( RD_GET_DIR_JORNAL_BACKUP_RETRANCAS_EXCLUIDAS ) ;
   Lista.Add ( Retranca ) ;
   Qtde := RD_VAR_EXTENSOES.Count ;
   For Local := 0 To Qtde - 1 Do Begin
      Lista.Add ( Retranca + '.' + RD_VAR_EXTENSOES[Local] ) ;
   End ;
   Qtde := Lista.Count ;
   For Local := 0 To Qtde - 1 Do Begin
      Origem := RD_GET_DIR_JORNAL_DATA + Lista[Local] ;
      Destino := RD_GET_DIR_JORNAL_BACKUP_RETRANCAS_EXCLUIDAS + Lista[Local] ;
      If CopiaArquivo ( 'TEspelho_RD.RD_CRIAR_BACKUP_RETRANCA_EXCLUIDA',
                        Origem, Destino, SOBREPOE ) Then Begin
         PUT_LOG ( 'RD_CRIAR_BACKUP_RETRANCA_EXCLUIDA OK ' +
                   '[' + Origem + '][' + Destino + ']' ) ;
      End Else Begin
         PUT_LOG ( 'RD_CRIAR_BACKUP_RETRANCA_EXCLUIDA N?O OK ' +
                   '[' + Origem + '][' + Destino + ']' ) ;
      End ;
   End ;
   Lista.Free ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception TEspelho_RD RD CRIAR_BACKUP_RETRANCA_EXCLUIDA ' +
                '[' + E.Message + ']' ) ;
   End ;
End ;
_Debug ( 'FIM Espelho_RD CRIAR_BACKUP_RETRANCA_EXCLUIDA' ) ;
End ;

Function TEspelho_RD.RD_EXCLUIR_RETRANCA : Boolean ;
{$IFDEF NW}
Var Indice   : LongInt ;
    Local    : LongInt ;
    Retranca : String ;
    Lista    : TStringList ;
    Qtde     : LongInt ;
    _Salvar  : String ;
{$ENDIF}
Begin
Result := FALSE ;
{$IFDEF NW}
_Debug ( 'INI Espelho_RD EXCLUIR_RETRANCA' ) ;
Try
   Retranca := RD_VAR_ESPELHO_ATUAL.Selecionada.Retranca ;
   If RD_VAR_ESPELHO_ATUAL.Selecionada.Is_Especial Then Begin
      ShowNewMessage ( 'Esta linha n?o pode ser removida do espelho.' ) ;
      _Debug ( 'Exit Is_Especial Espelho_RD EXCLUIR_RETRANCA' ) ;
      Exit ;
   End ;
   If NOT MyMessageDlg ( 'Confirma a exclus?o da retranca "' + Retranca + '" ?' ,
                         mtInformation, [mbYes, mbNo],
                         ['Sim','N?o'], 'Confirma??o', Resposta_Dialog ) Then Begin
      ShowNewMessage ( 'A opera?ao de exclus?o foi cancelada.' ) ;
      _Debug ( 'Exit Not Confirm Espelho_RD EXCLUIR_RETRANCA' ) ;
      Exit ;
   End ;
   Indice := RD_GET_INDICE_RETRANCA ( RD_BUFFER_MAIN, Retranca ) ;
   If Indice = -1 Then Begin
      ShowNewMessage ( 'A retranca n?o foi encontrada no espelho.' ) ;
      _Debug ( 'Exit Indice -1 Espelho_RD EXCLUIR_RETRANCA' ) ;
      Exit ;
   End ;
   _Salvar := Main.SG_J2.Cells[SG_J_RETRANCA, Main.SG_J2.Row+1] ;
   RD_CRIAR_BACKUP_RETRANCA_EXCLUIDA ( 'RD_EXCLUIR_RETRANCA', Retranca ) ;
   RD_REMOVER_RETRANCA ( 'RD_EXCLUIR_RETRANCA', RD_BUFFER_MAIN, Indice ) ;
   RD_MONTAR_TODOS_SGS ( 'RD_EXCLUIR_RETRANCA', RD_BUFFER_MAIN, Indice+1,
                         OPEN_VIDEO_FALSE ) ;
   Lista := TStringList.Create ;
   Lista.Add ( RD_GET_DIR_JORNAL_DATA + Retranca ) ;
   Qtde := RD_VAR_EXTENSOES.Count ;
   For Local := 0 To Qtde - 1 Do Begin
      Lista.Add ( RD_GET_DIR_JORNAL_DATA + Retranca + '.' +
                  RD_VAR_EXTENSOES[Local] ) ;
   End ;
   Qtde := Lista.Count ;
   For Local := 0 To Qtde - 1 Do Begin
      If RR_DeleteFile ( 'RD EXCLUIR_RETRANCA', Lista[Local] ) Then Begin
         PUT_LOG ( 'RD_EXCLUIR_RETRANCA OK [' + Lista[Local] + ']' ) ;
      End Else Begin
         PUT_LOG ( 'RD_EXCLUIR_RETRANCA N?O OK [' + Lista[Local] + ']' ) ;
      End ;
   End ;
   Lista.Free ;
   RD_POSICIONAR_E_SELECIONAR_RETRANCA_NO_SG ( _Salvar, Main.SG_J2 ) ;
   Result := TRUE ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception TEspelho_RD RD EXCLUIR_RETRANCA ' +
                '[' + E.Message + ']' ) ;
   End ;
End ;
_Debug ( 'FIM Espelho_RD EXCLUIR_RETRANCA' ) ;
{$ENDIF}
End ;

Procedure TEspelho_RD.RD_SAVE_VT_RETRANCA
          ( Registro : T_Clip_Retranca ; FN : String ) ;
Var Indice : LongInt ;
Begin
_Debug ( 'INI Espelho_RD SAVE_VT_RETRANCA' ) ;
If Sys_Usuario_Aplicativo.Sys_GC Then Begin
   SHOW_OPERACAO_NAO_PERMITIDA ( 'RD_SAVE_VT_RETRANCA' ) ;
   Exit ;
End ;
Try
   //RD_VAR_CONTEUDO_VT := FN ;
   //WRITE_FILE_REAL_WIN ( FN, RD_VAR_CONTEUDO_VT ) ;
   Indice := RD_GET_INDICE_RETRANCA ( RD_BUFFER_MAIN, Registro.Retranca ) ;
   If Indice = -1 Then Begin
      ShowNewMessage ( 'A retranca n?o foi encontrada no espelho.' ) ;
      _Debug ( 'Exit Indice -1 Espelho_RD SAVE_VT_RETRANCA' ) ;
      Exit ;
   End ;
   RD_VAR_ARRAY_RETRANCAS[Indice].VT := FN ;
   RD_SALVAR_ESPELHO_FULL ( RD_BUFFER_MAIN ) ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception TEspelho_RD RD SAVE_VT_RETRANCA ' +
                '[' + E.Message + ']' ) ;
   End ;
End ;
_Debug ( 'FIM Espelho_RD SAVE_VT_RETRANCA' ) ;
End ;

Function TEspelho_RD.RD_GET_DIR_VIDEOS : String ;
Begin
Result := INSERE_BARRA ( 'C:\Users\Ricardo\Dropbox\Documentos\Projetos\R-News\Videos' ) ;
End ;

Procedure TEspelho_RD.RD_CRIAR_ARVORE_JORNAL
          ( Origem : String ) ;
Var Lista : TStringList ;
Begin
_Debug ( 'INI Espelho_RD CRIAR_ARVORE_JORNAL' ) ;
PUSH_TICK ( 'RD CRIAR ARVORE_JORNAL' ) ;
Try
   PUT_LOG ( 'RD_CRIAR_ARVORE_JORNAL [' + Origem + ']' ) ;
   Lista := TStringList.Create ;
   Lista.Add ( RD_VAR_SERVIDOR ) ;
   Lista.Add ( RD_GET_DIR_JORNAIS ) ;
   Lista.Add ( RD_GET_DIR_JORNAIS + RD_VAR_ESPELHO_ATUAL.Jornal ) ;
   Lista.Add ( RD_GET_DIR_JORNAIS + RD_VAR_ESPELHO_ATUAL.Jornal + '\' + RD_GET_DATA_CURTA ) ;
   Lista.Add ( RD_GET_DIR_JORNAIS + RD_VAR_ESPELHO_ATUAL.Jornal + '\' + RD_GET_DATA_CURTA + '\backup' ) ;
   Lista.Add ( RD_GET_DIR_JORNAIS + RD_VAR_ESPELHO_ATUAL.Jornal + '\' + RD_GET_DATA_CURTA + '\artes' ) ;
   Lista.Add ( RD_GET_DIR_JORNAIS + RD_VAR_ESPELHO_ATUAL.Jornal + '\' + RD_GET_DATA_CURTA + '\logs' ) ;
   Lista.Add ( RD_GET_DIR_JORNAIS + RD_VAR_ESPELHO_ATUAL.Jornal + '\' + RD_GET_DATA_CURTA + '\logs\gc' ) ;
   Lista.Add ( RD_GET_DIR_JORNAL_LOCAL + 'logs\gc' ) ;
   MKDIR_LIST ( Lista ) ;
   Lista.Free ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception TEspelho_RD RD CRIAR_ARVORE_JORNAL ' +
                '[' + E.Message + ']' ) ;
   End ;
End ;
POP_TICK ( 'Espelho_RD CRIAR_ARVORE_JORNAL' ) ;
_Debug ( 'FIM Espelho_RD CRIAR_ARVORE_JORNAL' ) ;
End ;

Procedure TEspelho_RD.RD_LOAD_FORM_EDITOR_LAUDAS
          ( Origem : String ) ;
Var Local  : LongInt ;
Begin
_Debug ( 'INI Espelho_RD LOAD_FORM_EDITOR_LAUDAS' ) ;
Try
   PUT_LOG ( 'RD_LOAD_FORM_EDITOR_LAUDAS[1] [' + Origem + ']' ) ;
   For Local := 0 To RD_MAX_SECOES - 1 Do Begin
      {
      RD_VAR_SECAO[Local].ED_OBS.Text := RD_VAR_RNEWS.SECAO[Local].TXT_OBS ;
      RD_VAR_SECAO[Local].Tipo := RD_VAR_RNEWS.SECAO[Local].Tipo ;
      RD_VAR_SECAO[Local].TEXTO.ME_TEXTO.Text := RD_VAR_RNEWS.SECAO[Local].TXT_ME ;
      RD_VAR_SECAO[Local].VT.ED_VT_FN.Text := RD_VAR_RNEWS.SECAO[Local].VT_FN ;
      RD_VAR_SECAO[Local].VT.ED_VT_DURACAO.Text := RD_VAR_RNEWS.SECAO[Local].VT_DURACAO_STR ;
      RD_VAR_SECAO[Local].VIVO.ED_VIVO_INFO.Text := RD_VAR_RNEWS.SECAO[Local].VIVO_INFO ;
      RD_VAR_SECAO[Local].VIVO.ED_VIVO_DURACAO.Text := RD_VAR_RNEWS.SECAO[Local].VIVO_DURACAO_STR ;
      RD_VAR_FLAG_NAO_ATUALIZAR_ED_GC := FALSE ;
      For Tag_ED := 0 To RD_MAX_EDITS - 1 Do Begin
         RD_VAR_SECAO[Local].GC.ED_GC[Tag_ED].Text := RD_VAR_RNEWS.SECAO[Local].ED_TXT[Tag_ED] ;
      End ;
      }
      RD_VAR_FLAG_NAO_ATUALIZAR_ED_GC := TRUE ;
      {
      If ( RD_VAR_SECAO[Local].Tipo = RD_TIPO_TEXTO ) Then Begin
         RD_VAR_SECAO[Local].PN_SECAO.Height := RD_ALTURA_PN_TEXTO ;
      End Else If ( RD_VAR_SECAO[Local].Tipo = RD_TIPO_VT ) Then Begin
         RD_VAR_SECAO[Local].PN_SECAO.Height := RD_ALTURA_PN_VT ;
      End Else If ( RD_VAR_SECAO[Local].Tipo = RD_TIPO_VIVO ) Then Begin
         RD_VAR_SECAO[Local].PN_SECAO.Height := RD_ALTURA_PN_VIVO ;
      End Else If ( RD_VAR_SECAO[Local].Tipo = RD_TIPO_GC ) Then Begin
         RD_VAR_SECAO[Local].PN_SECAO.Height := RD_ALTURA_PN_GC ;
      End Else If ( RD_VAR_SECAO[Local].Tipo = RD_TIPO_TELAO ) Then Begin
         RD_VAR_SECAO[Local].PN_SECAO.Height := RD_ALTURA_PN_TELAO ;
      End Else Begin
         RD_VAR_SECAO[Local].PN_SECAO.Height := RD_ALTURA_PN ;
      End ;
      }
   End ;
   PUT_LOG ( 'RD_LOAD_FORM_EDITOR_LAUDAS[2]' ) ;
   For Local := 0 To RD_MAX_SECOES - 1 Do Begin
      RD_SELECIONAR_PN_LAUDA ( Local, RD_VAR_RNEWS.SECAO[Local].Tipo ) ;
      If ( RD_VAR_RNEWS.SECAO[Local].COD_GC > 0 ) Then Begin
         //RRCT RD_CARREGAR_IMAGEM_TARJA_GC ( 'RD_LOAD_FORM_EDITOR_LAUDAS', Local,
         //                              RD_VAR_RNEWS.SECAO[Local].COD_GC ) ;
      End Else Begin
         //RRCT GC_CLEAR_IMG ( 'RD_LOAD_FORM_EDITOR_LAUDAS', Local ) ;
      End ;
   End ;
   RD_MODIFICAR_EDITS ( 'RD_LOAD_FORM_EDITOR_LAUDAS', FALSE, FALSE ) ;
   //RRCT RD_REFRESH_FORM ( 'RD_LOAD_FORM_EDITOR_LAUDAS' ) ;
   PUT_LOG ( 'FIM/RD_LOAD_FORM_EDITOR_LAUDAS' ) ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception TEspelho_RD RD LOAD_FORM_EDITOR_LAUDAS ' +
                '[' + E.Message + ']' ) ;
   End ;
End ;
_Debug ( 'FIM Espelho_RD LOAD_FORM_EDITOR_LAUDAS' ) ;
End ;

Procedure TEspelho_RD.RD_CLEAR_RD_SECAO_NEWS ( Reg : LongInt ) ;
Var Local : LongInt ;
Begin
With RD_VAR_RNEWS.SECAO[Reg] Do Begin
   Tipo := RD_TIPO_TEXTO ;
   COD_GC := 0 ;
   Qtde_Edits := 0 ;
   GC_Descricao := '' ;
   Ancora := '' ;
   TXT_ME := '' ;
   TXT_OBS := '' ;
   VT_FN := '' ;
   VT_DURACAO := 0 ;
   FN_GC := '' ;
   For Local := 0 To RD_MAX_EDITS - 1 Do Begin
      ED_TXT[Local] := '' ;
   End ;
End ;
End ;

Procedure TEspelho_RD.RD_CARREGAR_LAUDA_DO_ARQUIVO ( Origem, FN, FN_GC : String ) ;
Begin
_Debug ( 'INI Espelho_RD CARREGAR_LAUDA_DO_ARQUIVO [' + FN + ']' ) ;
PUT_LOG ( 'RD CARREGAR_LAUDA_DO_ARQUIVO [' + Origem + '][' + FN + ']' ) ;
If NOT RR_FileExists ( 'RD_CARREGAR_LAUDA_DO_ARQUIVO', FN ) Then Begin
   _Debug ( 'Exit Not RR_FileExists Espelho_RD CARREGAR_LAUDA_DO_ARQUIVO ' +
            '[' + FN + ']' ) ;
   Exit ;
End ;
RD_VAR_FLAG_AUTO_SAVE := FALSE ;
Try
   RD_VAR_RE_MODO_TEXTO.Lines.Text :=
              RD_KERNEL_GET_CONTEUDO ( 'RD CARREGAR_LAUDA_DO_ARQUIVO/1', FN ) ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception CARREGAR_LAUDA_DO_ARQUIVO ' +
                '[' + FN + '][' + E.Message + ']' ) ;
   End ;
End ;
Try
   RD_VAR_RE_MODO_TEXTO_GC.Lines.Text :=
              RD_KERNEL_GET_CONTEUDO ( 'RD CARREGAR_LAUDA_DO_ARQUIVO/2', FN_GC ) ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception CARREGAR_LAUDA_DO_ARQUIVO GC ' +
                '[' + FN_GC + '][' + E.Message + ']' ) ;
   End ;
End ;
RD_POSICIONAR_SB_INICIO ( 'RD CARREGAR_LAUDA_DO_ARQUIVO' ) ;
RD_LOAD_FORM_EDITOR_LAUDAS ( 'RD CARREGAR_LAUDA_DO_ARQUIVO' ) ;
_Debug ( 'FIM Espelho_RD CARREGAR_LAUDA_DO_ARQUIVO [' + FN + ']' ) ;
End ;

Procedure TEspelho_RD.RD_VIEW_ME ( Origem,  Aux : String ) ;
Begin
_Debug ( 'INI Espelho_RD VIEW_ME' ) ;
PUT_LOG ( 'RD_VIEW_ME [' + Origem + ']' ) ;
View_ME.ME.Text := Aux ;
View_ME.Show ;
View_ME.BringToFront ;
_Debug ( 'FIM Espelho_RD VIEW_ME' ) ;
End ;

Function TEspelho_RD.RD_GET_PRINT_VIEW_LAUDA : String ;
Var Local   : LongInt ;
    Local2  : LongInt ;
Begin
_Debug ( 'INI Espelho_RD GET_PRINT_VIEW_LAUDA' ) ;
Try
   Result := '' ;
   Result := Result + 'JORNAL=' + RD_VAR_ESPELHO_ATUAL.Jornal + sLineBreak ;
   Result := Result + 'DATA=' + DateToStr ( RD_VAR_ESPELHO_ATUAL.Data ) + sLineBreak ;
   Result := Result + 'NOW=' + DateTimeToStr ( Now ) + sLineBreak ;
   Result := Result + 'USUARIO=' + NOME_DO_USUARIO + sLineBreak ;
   Result := Result + 'COMPUTADOR=' + COMPUTADOR + sLineBreak ;
   Result := Result + 'SECOES=' + IntToStr(RD_MAX_SECOES) + sLineBreak ;
   For Local := 0 To RD_MAX_SECOES - 1 Do Begin
      Result := Result + '###### SECAO [' + StrZero(Local,4) + ']' + sLineBreak ;
      Result := Result + 'TIPO=' + IntToStr(RD_VAR_RNEWS.SECAO[Local].Tipo) + sLineBreak ;
      Result := Result + 'COD_GC=' + IntToStr(RD_VAR_RNEWS.SECAO[Local].COD_GC) + sLineBreak ;
      Result := Result + 'ANCORA=' + RD_VAR_RNEWS.SECAO[Local].Ancora + sLineBreak ;
      Result := Result + 'TXT_ME=' + RD_VAR_RNEWS.SECAO[Local].TXT_ME + sLineBreak ;
      Result := Result + 'TXT_OBS=' + RD_VAR_RNEWS.SECAO[Local].TXT_OBS + sLineBreak ;
      Result := Result + 'VT_FN=' + RD_VAR_RNEWS.SECAO[Local].VT_FN + sLineBreak ;
      Result := Result + 'VT_DURACAO=' + IntToStr(RD_VAR_RNEWS.SECAO[Local].VT_DURACAO) + sLineBreak ;
      Result := Result + 'VT_DURACAO_STR=' + RD_VAR_RNEWS.SECAO[Local].VT_DURACAO_STR + sLineBreak ;
      Result := Result + 'FN_GC=' + RD_VAR_RNEWS.SECAO[Local].FN_GC + sLineBreak ;
      Result := Result + 'VIVO_INFO=' + RD_VAR_RNEWS.SECAO[Local].VIVO_INFO + sLineBreak ;
      Result := Result + 'VIVO_DURACAO=' + IntToStr(RD_VAR_RNEWS.SECAO[Local].VIVO_DURACAO) + sLineBreak ;
      Result := Result + 'VIVO_DURACAO_STR=' + RD_VAR_RNEWS.SECAO[Local].VIVO_DURACAO_STR + sLineBreak ;
      For Local2 := 0 To RD_MAX_EDITS - 1 Do Begin
         Result := Result + 'ED_TXT_' + StrZero(Local2,4) + '=' +
                   RD_VAR_RNEWS.SECAO[Local].ED_TXT[Local2] + sLineBreak ;
      End ;
      Result := Result + sLineBreak ;
   End ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception TEspelho_RD RD GET_PRINT_VIEW_LAUDA ' +
                '[' + E.Message + ']' ) ;
   End ;
End ;
_Debug ( 'FIM Espelho_RD GET_PRINT_VIEW_LAUDA' ) ;
End ;

Procedure TEspelho_RD.RD_VIEW_LAUDA ( Origem : String ) ;
Var Aux : String ;
Begin
_Debug ( 'INI Espelho_RD VIEW_LAUDA' ) ;
Try
   PUT_LOG ( 'RD_VIEW_LAUDA [' + Origem + ']' ) ;
   Aux := RD_GET_PRINT_VIEW_LAUDA ;
   RD_VIEW_ME ( 'RD_VIEW_LAUDA', Aux ) ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception TEspelho_RD RD VIEW_LAUDA ' +
                '[' + E.Message + ']' ) ;
   End ;
End ;
_Debug ( 'FIM Espelho_RD VIEW_LAUDA' ) ;
End ;

Procedure TEspelho_RD.RD_EXEC_LIMPAR_RETRANCA_RET ( Origem : String ) ;
Var Local : LongInt ;
Begin
Try
   PUT_LOG ( 'RD_EXEC_LIMPAR_RETRANCA_RET [' + Origem + ']' ) ;
   For Local := 0 To RD_MAX_SECOES - 1 Do Begin
      RD_CLEAR_RD_SECAO_NEWS ( Local ) ;
   End ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception TEspelho_RD RD EXEC_LIMPAR_RETRANCA_RET ' +
                '[' + E.Message + ']' ) ;
   End ;
End ;
End ;

Function TEspelho_RD.RD_GET_FN_LAU_EDICAO : String ;
Begin
Result := RD_GET_DIR_JORNAL_DATA +
          RD_VAR_ESPELHO_ATUAL.Selecionada.Retranca ; // + '.LAU' ;
End ;

Function TEspelho_RD.RD_GET_FN_LAU_ORIGINAL : String ;
Begin
Result := RD_GET_DIR_JORNAL_DATA +
          RD_VAR_ESPELHO_ATUAL.Selecionada.Retranca ;
End ;

Function TEspelho_RD.RD_GET_FN_LAU_OLD : String ;
Begin
Result := RD_GET_DIR_JORNAL_DATA +
          RD_VAR_ESPELHO_ATUAL.Selecionada.Retranca + '.OLD' ;
End ;

Procedure TEspelho_RD.RD_CARREGAR_LAUDA ( Origem : String ; Registro : T_Clip_Retranca ) ;
Var FN     : String ;
    FN_GC  : String ;
Begin
_Debug ( 'INI Espelho_RD CARREGAR_LAUDA' ) ;
Try
   PUT_LOG ( 'INI RD_CARREGAR_LAUDA [' + Origem + ']' ) ;
   RD_EXEC_LIMPAR_RETRANCA_RET ( 'RD_CARREGAR_LAUDA' ) ;
   FN := RD_GET_FN_LAU_EDICAO ;
   FN_GC := Registro.FN_GC1 ;
   {
   If NOT RR_FileExists ( 'RD_CARREGAR_LAUDA/1', FN ) AND RR_FileExists ( 'RD_CARREGAR_LAUDA/2',  RD_GET_FN_LAU_ORIGINAL ) Then Begin
      FN := RD_GET_FN_LAU_ORIGINAL ;
   End ;
   }
   If RR_FileExists ( 'RD_CARREGAR_LAUDA/3', FN ) Then Begin
      PUT_LOG ( 'FN EXISTS RD_CARREGAR_LAUDA [' + FN + ']' ) ;
      RD_CARREGAR_LAUDA_DO_ARQUIVO ( 'RD CARREGAR_LAUDA', FN, FN_GC ) ;
   End Else Begin
      PUT_LOG ( 'FN NOT EXISTS RD_CARREGAR_LAUDA REAL [' + FN + ']' ) ;
      RD_POSICIONAR_SB_INICIO ( 'RD_CARREGAR_LAUDA' ) ;
      RD_LOAD_FORM_EDITOR_LAUDAS ( 'RD_CARREGAR_LAUDA' ) ;
   End ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception TEspelho_RD RD CARREGAR_LAUDA ' +
                '[' + E.Message + ']' ) ;
   End ;
End ;
_Debug ( 'FIM Espelho_RD CARREGAR_LAUDA' ) ;
End ;

Function TEspelho_RD.RD_GET_COR_JORNAL : TColor ;
Begin
If RD_VAR_ESPELHO_ATUAL.Jornal = 'BOMDIA' Then Begin
   Result := RD_COR_JORNAL[1] ;
End Else If RD_VAR_ESPELHO_ATUAL.Jornal = 'CETV1' Then Begin
   Result := RD_COR_JORNAL[2] ;
End Else If RD_VAR_ESPELHO_ATUAL.Jornal = 'CETV2' Then Begin
   Result := RD_COR_JORNAL[3] ;
End Else If RD_VAR_ESPELHO_ATUAL.Jornal = 'ESPORTE' Then Begin
   Result := RD_COR_JORNAL[4] ;
End Else Begin
   Result := cLRed ;
End ;
End ;

Function TEspelho_RD.RD_GET_COLOR_STR ( _Str : String ) : TColor ;
Var Lista : TStringList ;
Begin
Try
   _Str := UpperCase ( System.SysUtils.StringReplace ( _Str, ' ', '',
                                                       [rfReplaceAll] ) ) ;
   If _Str = '' Then Begin
      Result := 0 ;
      Exit  ;
   End ;
   If _Str[1] = '$' Then Begin
      Result := StrToIntDef ( _Str, 0 ) ;
      Exit  ;
   End ;
   If ( _Str = 'RD_JORNAL' ) OR
      ( _Str = 'JORNAL' ) Then Begin
      Result := RD_GET_COR_JORNAL ;
      Exit  ;
   End ;
   If Pos ( 'RGB', _Str) = 1 Then Begin
      _Str := System.SysUtils.StringReplace ( _Str, 'RGB', '', [rfReplaceAll] ) ;
      _Str := System.SysUtils.StringReplace ( _Str, ';', ',', [rfReplaceAll] ) ;
      _Str := System.SysUtils.StringReplace ( _Str, '/', ',', [rfReplaceAll] ) ;
      _Str := System.SysUtils.StringReplace ( _Str, '-', ',', [rfReplaceAll] ) ;
      _Str := System.SysUtils.StringReplace ( _Str, '(', '', [rfReplaceAll] ) ;
      _Str := System.SysUtils.StringReplace ( _Str, ')', '', [rfReplaceAll] ) ;
      Lista := EXPLODE_SIMPLES ( _Str, ',' ) ;
      If Lista.Count < 3 Then Begin
         Result := 0 ;
         Exit ;
      End ;
      Result := RGB ( StrToIntDef(Lista[0],0),
                      StrToIntDef(Lista[1],0),
                      StrToIntDef(Lista[2],0) ) ;
      Lista.Free ;
      Exit  ;
   End ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception TEspelho_RD RD GET_COLOR_STR ' +
                '[' + E.Message + ']' ) ;
   End ;
End ;
Result := 0 ;
End ;

Function TEspelho_RD.RD_AJUSTAR_TEXTO_LAUDA : String ;
Var Banco : String ;
    Local : LongInt ;
    Qtde  : LongInt ;
    Aux   : String ;
    Lista : TStringList ;
Begin
_Debug ( 'INI Espelho_RD AJUSTAR_TEXTO_LAUDA' ) ;
Try
   Result := '' ;
   RD_VAR_EDITOR_LAUDA_TXT := Trim ( RD_VAR_EDITOR_LAUDA_TXT ) ;
   If RD_VAR_EDITOR_LAUDA_TXT = '' Then Begin
      _Debug ( 'Exit Empty Espelho_RD AJUSTAR_TEXTO_LAUDA' ) ;
      Exit ;
   End ;
   Lista := TStringList.Create ;
   Lista.Text := RD_VAR_EDITOR_LAUDA_TXT ;
   Qtde := Lista.Count ;
   Banco := '' ;
   For Local := 0 To Qtde - 1 Do Begin
      Aux := Trim ( Lista[Local] ) ;
      If Aux = '' Then Begin
         //Banco := Banco + sLineBreak ;
         Continue ;
      End Else If Pos ( '#OBS', Aux ) > 0 Then Begin
         Banco := Banco + Aux + sLineBreak ;
      End Else If Aux[1] = '#' Then Begin
         Banco := Banco + sLineBreak + Aux + sLineBreak ;
      End Else Begin
         Banco := Banco + Aux + sLineBreak ;
      End ;
   End  ;
   Banco := Trim ( Banco ) ;
   Lista.Free ;
   Result := Banco ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception TEspelho_RD RD AJUSTAR_TEXTO_LAUDA ' +
                '[' + E.Message + ']' ) ;
   End ;
End ;
_Debug ( 'FIM Espelho_RD AJUSTAR_TEXTO_LAUDA' ) ;
End ;

Procedure TEspelho_RD.RD_CONVERTE_LAUDA_TEXTO_EM_GRAFICA
          ( Salvar : Boolean ) ;
Begin
_Debug ( 'INI Espelho_RD CONVERTE_LAUDA_TEXTO_EM_GRAFICA' ) ;
RD_VAR_RASCUNHO := RD_AJUSTAR_TEXTO_LAUDA ;
_Debug ( 'Exit Abort Espelho_RD CONVERTE_LAUDA_TEXTO_EM_GRAFICA' ) ;
End ;

Procedure TEspelho_RD.RD_CONVERTE_LAUDA_GRAFICA_EM_TEXTO
          ( Salvar : Boolean ) ;
Var xLocal      : LongInt ;
    xLocal2     : LongInt ;
    _MAX_SECOES : LongInt ;
    Qtde        : LongInt ;
Begin
_Debug ( 'INI Espelho_RD CONVERTE_LAUDA_GRAFICA_EM_TEXTO' ) ;
Try
   RD_VAR_EDITOR_LAUDA_FN_TXT := RD_GET_FN_LAU_ORIGINAL ; // + '.TXT' ;
   RD_VAR_EDITOR_LAUDA_TXT := '' ;
   _MAX_SECOES := RD_MAX_SECOES - 1 ;
   For xLocal := 0 To _MAX_SECOES Do Begin
      If RD_VAR_RNEWS.SECAO[xLocal].Tipo = RD_TIPO_TEXTO Then Begin
         If Trim ( RD_VAR_RNEWS.SECAO[xLocal].TXT_ME ) <> '' Then Begin
            RD_VAR_EDITOR_LAUDA_TXT := RD_VAR_EDITOR_LAUDA_TXT + sLineBreak +
                   '#TP' + sLineBreak ;
            RD_VAR_SUPER_MEMO.Text := Trim ( RD_VAR_RNEWS.SECAO[xLocal].TXT_ME ) ;
            Qtde := RD_VAR_SUPER_MEMO.Lines.Count ;
            If Qtde > 0 Then Begin
               For xLocal2 := 0 To Qtde - 1 Do Begin
                  RD_VAR_EDITOR_LAUDA_TXT := RD_VAR_EDITOR_LAUDA_TXT +
                                             RD_VAR_SUPER_MEMO.Lines[xLocal2] + sLineBreak ;
               End ;
            End ;
            If RD_VAR_RNEWS.SECAO[xLocal].TXT_OBS <> '' Then Begin
               RD_VAR_EDITOR_LAUDA_TXT := RD_VAR_EDITOR_LAUDA_TXT +
                                          '@OBS=' + RD_VAR_RNEWS.SECAO[xLocal].TXT_OBS + sLineBreak ;
            End ;
         End ;
      End Else If RD_VAR_RNEWS.SECAO[xLocal].Tipo = RD_TIPO_VT Then Begin
         If ( RD_VAR_RNEWS.SECAO[xLocal].VT_DURACAO > 0 ) OR
            ( RD_VAR_RNEWS.SECAO[xLocal].TXT_OBS <> '' ) OR
            ( RD_VAR_RNEWS.SECAO[xLocal].VT_FN <> '' ) Then Begin
            RD_VAR_EDITOR_LAUDA_TXT := RD_VAR_EDITOR_LAUDA_TXT + sLineBreak +
                   '#RODA_VT=' + SegundosToMMSS ( RD_VAR_RNEWS.SECAO[xLocal].VT_DURACAO ) + sLineBreak ;
            If RD_VAR_RNEWS.SECAO[xLocal].VT_FN <> '' Then Begin
               RD_VAR_EDITOR_LAUDA_TXT := RD_VAR_EDITOR_LAUDA_TXT +
                                          '@CLIP=' + RD_VAR_RNEWS.SECAO[xLocal].VT_FN + sLineBreak ;
            End ;
            If RD_VAR_RNEWS.SECAO[xLocal].TXT_OBS <> '' Then Begin
               RD_VAR_EDITOR_LAUDA_TXT := RD_VAR_EDITOR_LAUDA_TXT +
                                          '@OBS=' + RD_VAR_RNEWS.SECAO[xLocal].TXT_OBS + sLineBreak ;
            End ;
         End ;
      End Else If RD_VAR_RNEWS.SECAO[xLocal].Tipo = RD_TIPO_VIVO Then Begin
         If ( RD_VAR_RNEWS.SECAO[xLocal].VIVO_DURACAO > 0 ) OR
            ( RD_VAR_RNEWS.SECAO[xLocal].TXT_OBS <> '' ) OR
            ( RD_VAR_RNEWS.SECAO[xLocal].VIVO_INFO <> '' ) Then Begin
            RD_VAR_EDITOR_LAUDA_TXT := RD_VAR_EDITOR_LAUDA_TXT + sLineBreak +
                   '#VIVO=' + SegundosToMMSS ( RD_VAR_RNEWS.SECAO[xLocal].VIVO_DURACAO ) + sLineBreak ;
            If RD_VAR_RNEWS.SECAO[xLocal].VIVO_INFO <> '' Then Begin
               RD_VAR_EDITOR_LAUDA_TXT := RD_VAR_EDITOR_LAUDA_TXT +
                                          '@LOCAL=' + RD_VAR_RNEWS.SECAO[xLocal].VIVO_INFO + sLineBreak ;
            End ;
            If RD_VAR_RNEWS.SECAO[xLocal].TXT_OBS <> '' Then Begin
               RD_VAR_EDITOR_LAUDA_TXT := RD_VAR_EDITOR_LAUDA_TXT +
                                          '@OBS=' + RD_VAR_RNEWS.SECAO[xLocal].TXT_OBS + sLineBreak ;
            End ;
         End ;
      End Else If RD_VAR_RNEWS.SECAO[xLocal].Tipo = RD_TIPO_GC Then Begin
         If RD_VAR_RNEWS.SECAO[xLocal].COD_GC > 0 Then Begin
            RD_VAR_EDITOR_LAUDA_TXT := RD_VAR_EDITOR_LAUDA_TXT + sLineBreak +
                   '#GC=' + StrZero ( RD_VAR_RNEWS.SECAO[xLocal].COD_GC, 4 ) +
                   ' [' + RD_VAR_RNEWS.SECAO[xLocal].GC_Descricao + ']' + sLineBreak ;
            If RD_VAR_RNEWS.SECAO[xLocal].Qtde_Edits > 0 Then Begin
               For xLocal2 := 0 To RD_VAR_RNEWS.SECAO[xLocal].Qtde_Edits - 1 Do Begin
                  RD_VAR_EDITOR_LAUDA_TXT := RD_VAR_EDITOR_LAUDA_TXT +
                                             RD_VAR_RNEWS.SECAO[xLocal].ED_TXT[xLocal2] + sLineBreak ;
               End ;
            End ;
            If RD_VAR_RNEWS.SECAO[xLocal].TXT_OBS <> '' Then Begin
               RD_VAR_EDITOR_LAUDA_TXT := RD_VAR_EDITOR_LAUDA_TXT +
                                          '@OBS=' + RD_VAR_RNEWS.SECAO[xLocal].TXT_OBS + sLineBreak ;
            End ;
         End ;
      End Else If RD_VAR_RNEWS.SECAO[xLocal].Tipo = RD_TIPO_TELAO Then Begin
      End
   End ;
   RD_VAR_EDITOR_LAUDA_TXT := Trim ( RD_VAR_EDITOR_LAUDA_TXT ) ;
   If Salvar Then Begin
      Try
         CHECAR_DIRETORIO_FILENAME ( RD_VAR_EDITOR_LAUDA_FN_TXT ) ;
         RD_VAR_SUPER_MEMO.Text := RD_VAR_EDITOR_LAUDA_TXT ;
         RD_VAR_SUPER_MEMO.Lines.SaveToFile ( RD_VAR_EDITOR_LAUDA_FN_TXT ) ;
      Except
         On E : Exception Do Begin
            PUT_LOG ( 'Exception/2 RD_SALVAR_LAUDA_INI ' +
                      '[' + RD_VAR_EDITOR_LAUDA_FN_TXT + ']' +
                      '[' + E.Message + ']' ) ;
         End ;
      End ;
   End ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception TEspelho_RD RD CONVERTE_LAUDA_GRAFICA_EM_TEXTO ' +
                '[' + E.Message + ']' ) ;
   End ;
End ;
_Debug ( 'FIM Espelho_RD CONVERTE_LAUDA_GRAFICA_EM_TEXTO' ) ;
End ;

Procedure TEspelho_RD.RD_SALVAR_LAUDA ( RE, RE_GC : TMyRichEdit ) ;
Var FN          : String ;
    FN_GC       : String ;
    FN_SAVE     : String ;
    Save_Plain : Boolean ;
Begin
_Debug ( 'INI Espelho_RD SALVAR_LAUDA' ) ;
Try
   FN := RD_GET_FN_LAU_EDICAO ;
   FN_GC := RD_GET_FN_LAU_EDICAO + '.gc' ;
   FN_SAVE := Diretorio + 'Log_Save_Lauda.TXT' ;
   PUT_LOG ( 'INICIO RD_SALVAR_LAUDA_LIST [' + FN + ']' ) ;
   Try
      RD_CRIAR_BACKUP_ESPELHO ( FN ) ;
      CHECAR_DIRETORIO_FILENAME ( FN ) ;
      Save_Plain := RE.PlainText ;
      RE.PlainText := TRUE ;
      RE.Lines.SaveToFile ( FN ) ;
      RE.PlainText := Save_Plain ;
   Except
      On E : Exception Do Begin
         PUT_LOG ( 'Exception/1 RD_SALVAR_LAUDA_INI [' + FN + ']' +
                   '[' + E.Message + ']' ) ;
      End ;
   End ;
   Try
      RD_CRIAR_BACKUP_ESPELHO ( FN_GC ) ;
      Save_Plain := RE_GC.PlainText ;
      RE_GC.PlainText := TRUE ;
      RE_GC.Lines.SaveToFile ( FN_GC ) ;
      RE_GC.PlainText := Save_Plain ;
   Except
      On E : Exception Do Begin
         PUT_LOG ( 'Exception/2 RD_SALVAR_LAUDA_INI GC [' + FN_GC + ']' +
                   '[' + E.Message + ']' ) ;
      End ;
   End ;
   PUT_LOG ( 'FINAL RD_SALVAR_LAUDA_LIST [' + FN + ']' ) ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception TEspelho_RD RD SALVAR_LAUDA ' +
                '[' + E.Message + ']' ) ;
   End ;
End ;
_Debug ( 'FIM Espelho_RD SALVAR_LAUDA' ) ;
End ;

Procedure TEspelho_RD.RD_SALVAR_LAUDA_INI ;
Var FN     : String ;
    Local  : LongInt ;
    Local2 : LongInt ;
    Ini    : TMemIniFile ;
    Secao  : String ;
Begin
_Debug ( 'INI Espelho_RD SALVAR_LAUDA_INI' ) ;
Try
   FN := RD_GET_FN_LAU_EDICAO ;
   //FN := RD_GET_DIR_JORNAL_DATA + RD_VAR_REGISTRO_EDITOR_RET.Retranca + '.LAU' ;
   PUT_LOG ( 'INICIO RD_SALVAR_LAUDA_INI [' + FN + ']' ) ;
   Ini := TMemIniFile.Create ( FN ) ;
   Ini.WriteString ( 'GERAL', 'JORNAL', RD_VAR_ESPELHO_ATUAL.Jornal ) ;
   Ini.WriteString ( 'GERAL', 'DATA', DateToStr ( RD_VAR_ESPELHO_ATUAL.Data ) ) ;
   Ini.WriteString ( 'GERAL', 'NOW', DateTimeToStr ( Now ) ) ;
   Ini.WriteString ( 'GERAL', 'USUARIO', NOME_DO_USUARIO ) ;
   Ini.WriteString ( 'GERAL', 'COMPUTADOR', COMPUTADOR ) ;
   For Local := 0 To RD_MAX_SECOES - 1 Do Begin
      Secao := StrZero(Local,4) ;
      Ini.EraseSection ( Secao ) ;
      //If RD_VAR_RNEWS.SECAO[Local].Tipo < 1 Then Begin
      //   RD_VAR_RNEWS.SECAO[Local].Tipo := 1 ;
      //   //Continue ;
      //End ;
      Ini.WriteInteger ( Secao, 'TIPO', RD_VAR_RNEWS.SECAO[Local].Tipo ) ;
      Ini.WriteInteger ( Secao, 'COD_GC', RD_VAR_RNEWS.SECAO[Local].COD_GC ) ;
      Ini.WriteString ( Secao, 'ANCORA', RD_VAR_RNEWS.SECAO[Local].Ancora ) ;
      Ini.WriteString ( Secao, 'TXT_ME', String_To_Hexa ( RD_VAR_RNEWS.SECAO[Local].TXT_ME ) ) ;
      Ini.WriteString ( Secao, 'TXT_OBS', String_To_Hexa ( RD_VAR_RNEWS.SECAO[Local].TXT_OBS ) ) ;
      Ini.WriteString ( Secao, 'VT_FN', RD_VAR_RNEWS.SECAO[Local].VT_FN ) ;
      Ini.WriteInteger ( Secao, 'VT_DURACAO', RD_VAR_RNEWS.SECAO[Local].VT_DURACAO ) ;
      Ini.WriteString ( Secao, 'FN_GC', RD_VAR_RNEWS.SECAO[Local].FN_GC ) ;
      For Local2 := 0 To RD_MAX_EDITS - 1 Do Begin
         Ini.WriteString ( Secao, 'ED_TXT_' + StrZero(Local2,4), String_To_Hexa ( RD_VAR_RNEWS.SECAO[Local].ED_TXT[Local2] ) ) ;
      End ;
   End ;
   Ini.UpdateFile ;
   Ini.Free ;
   PUT_LOG ( 'FINAL RD_SALVAR_LAUDA_INI [' + FN + ']' ) ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception TEspelho_RD RD SALVAR_LAUDA_INI ' +
                '[' + E.Message + ']' ) ;
   End ;
End ;
_Debug ( 'FIM Espelho_RD SALVAR_LAUDA_INI' ) ;
End ;

Procedure TEspelho_RD.RD_BOT_IM_GC_DBLCLICK(Sender: TObject);
{$IFDEF NW}
Var _Tag : LongInt ;
    Cod  : LongInt ;
{$ENDIF}
Begin
{$IFDEF NW}
_Debug ( 'INI Espelho_RD BOT_IM_GC_DBLCLICK' ) ;
Try
   If (Sender Is TPanel) Then Begin
      _Tag := (Sender AS TPanel).Tag ;
      GC_LIMPAR_PREVIEW ;
      SELECIONAR_TARJA_VIDEOGRAFISMO ( 'RD_BOT_IM_GC_DBLCLICK/PN:' +
                                       (Sender AS TPanel).Name, _Tag,
                                       '', Cod, -1 ) ;
   End Else Begin
      _Tag := (Sender AS TImage).Tag ;
      GC_LIMPAR_PREVIEW ;
      SELECIONAR_TARJA_VIDEOGRAFISMO ( 'RD_BOT_IM_GC_DBLCLICK/IM:' +
                                       (Sender AS TImage).Name, _Tag,
                                       '', Cod, -1 ) ;
   End ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception TEspelho_RD RD BOT_IM_GC_DBLCLICK ' +
                '[' + E.Message + ']' ) ;
   End ;
End ;
_Debug ( 'FIM Espelho_RD BOT_IM_GC_DBLCLICK' ) ;
{$ENDIF}
End ;

Procedure TEspelho_RD.RD_MODIFICAR_EDITS
          ( Origem : String ; Bordas, Transparencia : Boolean ) ;
Var Local  : LongInt ;
    Local2 : LongInt ;
Begin
_Debug ( 'INI Espelho_RD MODIFICAR_EDITS' ) ;
Try
   PUT_LOG ( 'RD_MODIFICAR_EDITS(1) [' + Origem + ']' ) ;
   For Local := 0 To RD_MAX_SECOES - 1 Do Begin
      For Local2 := 0 To RD_MAX_EDITS - 1 Do Begin
         With RD_VAR_SECAO.GC Do Begin
            If Bordas Then Begin
            //   ED_GC[Local2].BorderStyle := bsSingle ;
            End Else Begin
            //   ED_GC[Local2].BorderStyle := bsNone ;
            End ;
            (*
            If Transparencia Then Begin
               ED_GC[Local2].Transparent := TRUE ;
            End Else Begin
               ED_GC[Local2].Transparent := FALSE ;
               ED_GC[Local2].Color := clWhite ;
            End ;
            *)
         End ;
      End ;
   End ;
   PUT_LOG ( 'RD_MODIFICAR_EDITS(2) [' + Origem + ']' ) ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception TEspelho_RD RD MODIFICAR_EDITS ' +
                '[' + E.Message + ']' ) ;
   End ;
End ;
_Debug ( 'FIM Espelho_RD MODIFICAR_EDITS' ) ;
End ;

Procedure TEspelho_RD.RD_PRINT_DUMP ( Origem : String ) ;
Var Local  : LongInt ;
//    Local2 : LongInt ;
    Aux    : String ;
Begin
_Debug ( 'INI Espelho_RD RD_PRINT_DUMP' ) ;
Try
   Aux := '' ;
   PUT_LOG ( 'RD_PRINT_DUMP [' + Origem + ']' ) ;
   For Local := 0 To RD_MAX_SECOES - 1 Do Begin
      //For Local2 := 0 To RD_MAX_EDITS - 1 Do Begin
         If Assigned ( RD_VAR_SECAO.GC.IM_GC ) Then Begin
            Aux := Aux + 'OK RD_VAR_ARRAY_REG_LAUDAS[' +
                         IntToStr(Local)+ ']' + LF ;
         End Else Begin
            Aux := Aux + 'NOK RD_VAR_ARRAY_REG_LAUDAS[' +
                         IntToStr(Local)+ ']' + LF ;
         End ;
         //With RD_VAR_ARRAY_REG_LAUDAS[Local] Do Begin
         //   Result := Result +
         //End ;
      //End ;
   End ;
   ShowNewMessage ( Aux ) ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception TEspelho_RD RD PRINT_DUMP ' +
                '[' + E.Message + ']' ) ;
   End ;
End ;
_Debug ( 'FIM Espelho_RD RD_PRINT_DUMP' ) ;
End ;

Procedure TEspelho_RD.RD_LOAD_LAUDA_INFO
          ( Origem : String ; _Tag : LongInt ) ;
Var Local : LongInt ;
Begin
_Debug ( 'INI Espelho_RD LOAD_LAUDA_INFO' ) ;
Try
   PUT_LOG ( 'RD_LOAD_LAUDA_INFO [' + Origem + ']' ) ;
   Lauda_Info.ED_Geral.Text := '_Tag[' + IntToStr(_Tag) + '] ' +
                               'Tipo[' + IntToStr(RD_VAR_SECAO.Tipo) + ']' ;
   If Assigned ( RD_VAR_SECAO.TEXTO.ME_TEXTO ) Then Begin
      Lauda_Info.ME_TEXTO.Lines.Text := RD_VAR_SECAO.TEXTO.ME_TEXTO.Lines.Text ;
   End Else Begin
      Lauda_Info.ME_TEXTO.Lines.Text := 'NOT ASSIGNED' ;
   End ;
   {
   If Assigned ( RD_VAR_SECAO[_Tag].ED_OBS ) Then Begin
      Lauda_Info.ED_OBS.Text := RD_VAR_SECAO[_Tag].ED_OBS.Text
   End Else Begin
      Lauda_Info.ED_OBS.Text := 'NOT ASSIGNED' ;
   End ;
   }
   For Local := 0 To RD_MAX_EDITS - 1 Do Begin
      If Assigned ( RD_VAR_SECAO.GC.ED_GC[Local] ) Then Begin
         Case Local Of
           0 : Lauda_Info.ED_1.Text := RD_VAR_SECAO.GC.ED_GC[Local].Text ;
           1 : Lauda_Info.ED_2.Text := RD_VAR_SECAO.GC.ED_GC[Local].Text ;
           2 : Lauda_Info.ED_3.Text := RD_VAR_SECAO.GC.ED_GC[Local].Text ;
           3 : Lauda_Info.ED_4.Text := RD_VAR_SECAO.GC.ED_GC[Local].Text ;
           End ;
      End Else Begin
         Case Local Of
           0 : Lauda_Info.ED_1.Text := 'NOT ASSIGNED/0' ;
           1 : Lauda_Info.ED_2.Text := 'NOT ASSIGNED/1' ;
           2 : Lauda_Info.ED_3.Text := 'NOT ASSIGNED/2' ;
           3 : Lauda_Info.ED_4.Text := 'NOT ASSIGNED/3' ;
           End ;
      End ;
   End ;
   If Assigned ( RD_VAR_SECAO.GC.IM_GC ) Then Begin
      Lauda_Info.IM.Picture.Bitmap.Assign ( RD_VAR_SECAO.GC.IM_GC.Picture.Bitmap ) ;
      Lauda_Info.IM.Width := Lauda_Info.IM.Picture.Bitmap.Width DIV 2 ;
      Lauda_Info.IM.Height := Lauda_Info.IM.Picture.Bitmap.Height DIV 2 ;
   End Else Begin
   End ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception TEspelho_RD RD LOAD_LAUDA_INFO ' +
                '[' + E.Message + ']' ) ;
   End ;
End ;
_Debug ( 'FIM Espelho_RD LOAD_LAUDA_INFO' ) ;
End ;

Procedure TEspelho_RD.RD_LAUDA_INFO ( Origem : String ; _Tag : LongInt ) ;
Begin
_Debug ( 'INI Espelho_RD LAUDA_INFO' ) ;
Try
   PUT_LOG ( 'RD_LAUDA_INFO [' + Origem + ']' ) ;
   RD_LOAD_LAUDA_INFO ( 'RD_LAUDA_INFO', _Tag ) ;
   Lauda_Info.Show ;
   Lauda_Info.BringToFront ;
_Debug ( 'INI Espelho_RD LAUDA_INFO' ) ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception TEspelho_RD RD LAUDA_INFO ' +
                '[' + E.Message + ']' ) ;
   End ;
End ;
End ;

Function TEspelho_RD.RD_GET_TIPO_STR ( Reg : LongInt ) : String ;
Begin
If RD_VAR_SECAO.Tipo = RD_TIPO_TEXTO Then Begin
   Result := 'LOC' ;
End Else If RD_VAR_SECAO.Tipo = RD_TIPO_VT Then Begin
   Result := 'VT' ;
End Else If RD_VAR_SECAO.Tipo = RD_TIPO_VIVO Then Begin
   Result := 'VIVO' ;
End Else If RD_VAR_SECAO.Tipo = RD_TIPO_GC Then Begin
   Result := 'GC' ;
End Else If RD_VAR_SECAO.Tipo = RD_TIPO_TELAO Then Begin
   Result := 'TEL?O' ;
End Else Begin
   Result := '???' ;
End ;
End ;

procedure TEspelho_RD.RD_BUTTON_DragOver
          ( Sender, Source: TObject; X, Y: Integer;
            State: TDragState; var Accept: Boolean);
begin
Accept := (Source Is TPanel) AND (Source <> Sender) ;
end;

procedure TEspelho_RD.RD_PN_DragOver
          ( Sender, Source: TObject; X, Y: Integer;
            State: TDragState; var Accept: Boolean);
begin
Accept := (Source Is TPanel) AND (Source <> Sender) ;
end;

procedure TEspelho_RD.RD_RXCLOCK_DragOver
          ( Sender, Source: TObject; X, Y: Integer;
            State: TDragState; var Accept: Boolean);
begin
Accept := (Source Is TPanel) AND (Source <> Sender) ;
end;

procedure TEspelho_RD.RD_IM_DragOver
          ( Sender, Source: TObject; X, Y: Integer;
            State: TDragState; var Accept: Boolean);
begin
If NOT (Source Is TPanel) Then Begin
   Accept := FALSE ;
   Exit ;
End ;
Accept := TRUE ;
end;

procedure TEspelho_RD.RD_ME_DragOver
          ( Sender, Source: TObject; X, Y: Integer;
            State: TDragState; var Accept: Boolean);
begin
If NOT (Source Is TPanel) Then Begin
   Accept := FALSE ;
   Exit ;
End ;
Accept := TRUE ;
end;

procedure TEspelho_RD.RD_EDT_DragOver
          ( Sender, Source: TObject; X, Y: Integer;
            State: TDragState; var Accept: Boolean);
begin
If NOT (Source Is TPanel) Then Begin
   Accept := FALSE ;
   Exit ;
End ;
Accept := TRUE ;
end;

procedure TEspelho_RD.RD_EDIT_DragOver
          ( Sender, Source: TObject; X, Y: Integer;
            State: TDragState; var Accept: Boolean);
begin
If NOT (Source Is TPanel) Then Begin
   Accept := FALSE ;
   Exit ;
End ;
Accept := TRUE ;
end;

procedure TEspelho_RD.RD_MASKEDIT_DragOver
          ( Sender, Source: TObject; X, Y: Integer;
            State: TDragState; var Accept: Boolean);
begin
If NOT (Source Is TPanel) Then Begin
   Accept := FALSE ;
   Exit ;
End ;
Accept := TRUE ;
end;

procedure TEspelho_RD.RD_LABEL_DragOver
          ( Sender, Source: TObject; X, Y: Integer;
            State: TDragState; var Accept: Boolean);
begin
If NOT (Source Is TPanel) Then Begin
   Accept := FALSE ;
   Exit ;
End ;
Accept := TRUE ;
end;

Function TEspelho_RD.RD_SECAO_VALIDA ( _Tag : LongInt ) : Boolean ;
Begin
Result := ( _Tag >= 0 ) AND ( _Tag < RD_MAX_SECOES ) ;
End ;

Procedure TEspelho_RD.RD_TRATAR_DRAGDROP
          ( Tag_Origem, Tag_Destino : LongInt ) ;
{$IFDEF NW}
Var Cod : LongInt ;
{$ENDIF}
Begin
{$IFDEF NW}
Cod := 0 ;
_Debug ( 'INI Espelho_RD TRATAR_DRAGDROP ' +
         'Orig[' + IntToStr(Tag_Origem) + '] ' +
         'Dest[' + IntToStr(Tag_Destino) + ']'  ) ;
If Tag_Origem = -101 Then Begin
   RD_ADD_SECAO ( 'RD_TRATAR_DRAGDROP,Tag:' + IntToStr(Tag_Origem),
                  Tag_Destino, RD_TIPO_TEXTO, RELOAD_TRUE ) ;
End Else If Tag_Origem = -103 Then Begin
   RD_ADD_SECAO ( 'RD_TRATAR_DRAGDROP,Tag:' + IntToStr(Tag_Origem),
                  Tag_Destino, RD_TIPO_VT, RELOAD_TRUE ) ;
End Else If Tag_Origem = -104 Then Begin
   RD_ADD_SECAO ( 'RD_TRATAR_DRAGDROP,Tag:' + IntToStr(Tag_Origem),
                  Tag_Destino, RD_TIPO_GC, RELOAD_TRUE ) ;
End Else If Tag_Origem = -105 Then Begin
   RD_ADD_SECAO ( 'RD_TRATAR_DRAGDROP,Tag:' + IntToStr(Tag_Origem),
                  Tag_Destino, RD_TIPO_TELAO, RELOAD_TRUE ) ;
End Else If Tag_Origem = -106 Then Begin
   RD_ADD_SECAO ( 'RD_TRATAR_DRAGDROP,Tag:' + IntToStr(Tag_Origem),
                  Tag_Destino, RD_TIPO_VIVO, RELOAD_TRUE ) ;
End Else If Tag_Origem = -111 Then Begin
   RD_SET_TIPO_SECAO ( 'RD_TRATAR_DRAGDROP,Tag:' + IntToStr(Tag_Origem),
                       Tag_Destino, RD_TIPO_TEXTO, RELOAD_TRUE ) ;
End Else If Tag_Origem = -113 Then Begin
   RD_SET_TIPO_SECAO ( 'RD_TRATAR_DRAGDROP,Tag:' + IntToStr(Tag_Origem),
                       Tag_Destino, RD_TIPO_VT, RELOAD_TRUE ) ;
End Else If Tag_Origem = -114 Then Begin
   RD_SET_TIPO_SECAO ( 'RD_TRATAR_DRAGDROP,Tag:' + IntToStr(Tag_Origem),
                       Tag_Destino, RD_TIPO_GC, RELOAD_TRUE ) ;
End Else If Tag_Origem = -115 Then Begin
   RD_SET_TIPO_SECAO ( 'RD_TRATAR_DRAGDROP,Tag:' + IntToStr(Tag_Origem),
                       Tag_Destino, RD_TIPO_TELAO, RELOAD_TRUE ) ;
End Else If Tag_Origem = -116 Then Begin
   RD_SET_TIPO_SECAO ( 'RD_TRATAR_DRAGDROP,Tag:' + IntToStr(Tag_Origem),
                       Tag_Destino, RD_TIPO_VIVO, RELOAD_TRUE ) ;
End Else If Tag_Origem = -199 Then Begin
   RD_REMOVER_SECAO ( 'RD_TRATAR_DRAGDROP,Tag:' + IntToStr(Tag_Origem),
                      Tag_Destino, RELOAD_TRUE ) ;
End Else If Tag_Origem = -121 Then Begin
   RD_LAUDA_INFO ( 'RD_TRATAR_DRAGDROP,Tag:' + IntToStr(Tag_Origem),
                   Tag_Destino ) ;
End Else If Tag_Origem = -122 Then Begin
   GC_REMOVER_IMG_GC ( 'RD_TRATAR_DRAGDROP,Tag:' + IntToStr(Tag_Origem),
                       Tag_Destino ) ;
End Else If Tag_Origem = -120 Then Begin
   RD_SET_TIPO_SECAO ( 'RD_TRATAR_DRAGDROP,Tag:' + IntToStr(Tag_Origem),
                       Tag_Destino, RD_TIPO_GC, RELOAD_TRUE ) ;
   GC_LIMPAR_PREVIEW ;
   SELECIONAR_TARJA_VIDEOGRAFISMO ( 'DragDrop/Bot?o', Tag_Destino, '',
                                    Cod, -1 ) ;
End Else Begin
   RD_MOVER_SECAO ( 'RD_TRATAR_DRAGDROP,Tag:' + IntToStr(Tag_Origem),
                    Tag_Origem, Tag_Destino, Tag_Destino, RELOAD_TRUE ) ;
End ;
_Debug ( 'FIM Espelho_RD TRATAR_DRAGDROP' ) ;
{$ENDIF}
End ;

procedure TEspelho_RD.RD_PN_DragDrop
          (Sender, Source: TObject; X, Y: Integer);
Var Tag_Origem  : LongInt ;
    Tag_Destino : LongInt ;
begin
Tag_Origem := (Source AS TPanel).Tag MOD 1000 ;
Tag_Destino := (Sender AS TPanel).Tag MOD 1000 ;
PUT_LOG ( 'PN Tag_Origem[' + IntToStr(Tag_Origem) +
          ' Destino[' + IntToStr(Tag_Destino) ) ;
RD_TRATAR_DRAGDROP ( Tag_Origem, Tag_Destino ) ;
end;

procedure TEspelho_RD.RD_RXCLOCK_DragDrop
          (Sender, Source: TObject; X, Y: Integer);
Var Tag_Origem  : LongInt ;
    Tag_Destino : LongInt ;
begin
Tag_Origem := (Source AS TPanel).Tag MOD 1000 ;
Tag_Destino := (Sender AS TLabel).Tag MOD 1000 ;
PUT_LOG ( 'RxClock Tag_Origem[' + IntToStr(Tag_Origem) +
          ' Destino[' + IntToStr(Tag_Destino) ) ;
RD_TRATAR_DRAGDROP ( Tag_Origem, Tag_Destino ) ;
end;

procedure TEspelho_RD.RD_BUTTON_DragDrop
          (Sender, Source: TObject; X, Y: Integer);
Var Tag_Origem  : LongInt ;
    Tag_Destino : LongInt ;
begin
Tag_Origem := (Source AS TPanel).Tag MOD 1000 ;
Tag_Destino := (Sender AS TButton).Tag MOD 1000 ;
PUT_LOG ( 'BUTTON Tag_Origem[' + IntToStr(Tag_Origem) +
          ' Destino[' + IntToStr(Tag_Destino) ) ;
RD_TRATAR_DRAGDROP ( Tag_Origem, Tag_Destino ) ;
end;

procedure TEspelho_RD.RD_IM_DragDrop
          (Sender, Source: TObject; X, Y: Integer);
Var Tag_Origem  : LongInt ;
    Tag_Destino : LongInt ;
begin
Tag_Origem := (Source AS TPanel).Tag MOD 1000 ;
Tag_Destino := (Sender AS TImage).Tag MOD 1000 ;
PUT_LOG ( 'IM Tag_Origem[' + IntToStr(Tag_Origem) +
          ' Destino[' + IntToStr(Tag_Destino) ) ;
RD_TRATAR_DRAGDROP ( Tag_Origem, Tag_Destino ) ;
end;

procedure TEspelho_RD.RD_ME_DragDrop
          (Sender, Source: TObject; X, Y: Integer);
Var Tag_Origem  : LongInt ;
    Tag_Destino : LongInt ;
begin
Tag_Origem := (Source AS TPanel).Tag MOD 1000 ;
Tag_Destino := (Sender AS TMemo).Tag MOD 1000 ;
PUT_LOG ( 'ME Tag_Origem[' + IntToStr(Tag_Origem) + '] ' +
          'Destino[' + IntToStr(Tag_Destino) + ']' ) ;
RD_TRATAR_DRAGDROP ( Tag_Origem, Tag_Destino ) ;
end;

procedure TEspelho_RD.RD_EDT_DragDrop
          (Sender, Source: TObject; X, Y: Integer);
Var Tag_Origem  : LongInt ;
    Tag_Destino : LongInt ;
begin
Tag_Origem := (Source AS TPanel).Tag MOD 1000 ;
Tag_Destino := (Sender AS TTransEdit).Tag MOD 1000 ;
PUT_LOG ( 'ED Tag_Origem[' + IntToStr(Tag_Origem) + '] ' +
          'Destino[' + IntToStr(Tag_Destino) + ']' ) ;
RD_TRATAR_DRAGDROP ( Tag_Origem, Tag_Destino ) ;
end;

procedure TEspelho_RD.RD_EDIT_DragDrop
          (Sender, Source: TObject; X, Y: Integer);
Var Tag_Origem  : LongInt ;
    Tag_Destino : LongInt ;
begin
Tag_Origem := (Source AS TPanel).Tag MOD 1000 ;
Tag_Destino := (Sender AS TEdit).Tag MOD 1000 ;
PUT_LOG ( 'EDIT Tag_Origem[' + IntToStr(Tag_Origem) + '] ' +
          'Destino[' + IntToStr(Tag_Destino) + ']' ) ;
RD_TRATAR_DRAGDROP ( Tag_Origem, Tag_Destino ) ;
end;

procedure TEspelho_RD.RD_MASKEDIT_DragDrop
          (Sender, Source: TObject; X, Y: Integer);
Var Tag_Origem  : LongInt ;
    Tag_Destino : LongInt ;
begin
Tag_Origem := (Source AS TPanel).Tag MOD 1000 ;
Tag_Destino := (Sender AS TMaskEdit).Tag MOD 1000 ;
PUT_LOG ( 'MASKEDIT Tag_Origem[' + IntToStr(Tag_Origem) + '] ' +
          'Destino[' + IntToStr(Tag_Destino) + ']' ) ;
RD_TRATAR_DRAGDROP ( Tag_Origem, Tag_Destino ) ;
end;

procedure TEspelho_RD.RD_LABEL_DragDrop
          (Sender, Source: TObject; X, Y: Integer);
Var Tag_Origem  : LongInt ;
    Tag_Destino : LongInt ;
begin
Tag_Origem := (Source AS TPanel).Tag MOD 1000 ;
Tag_Destino := (Sender AS TLabel).Tag MOD 1000 ;
PUT_LOG ( 'LABEL Tag_Origem[' + IntToStr(Tag_Origem) + '] ' +
          'Destino[' + IntToStr(Tag_Destino) + ']' ) ;
RD_TRATAR_DRAGDROP ( Tag_Origem, Tag_Destino ) ;
end;

Procedure TEspelho_RD.RD_CHECAR_SE_RETRANCA_GC_MODIFICADO
          ( _Retranca : String ; PN : TPanel ) ;
Var Local : LongInt ;
    Passo : LongInt ;
Begin
Passo := 1 ;
If NOT RD_VAR_ESPELHO_ATUAL.Aberto2 Then Begin
   PN.Color := clSilver ;
   PN.Font.Color := clGray ;
   PN.Caption := 'JORNAL FECHADO' ;
   Exit ;
End ;
Try
   Passo := 2 ;
   For Local := 0 To RD_VAR_QTDE_RETRANCAS - 1 Do Begin
      Passo := 3 ;
      With RD_VAR_ARRAY_RETRANCAS[Local] Do Begin
         Passo := 4 ;
         If Retranca <> _Retranca Then Begin
            Continue ;
         End ;
         Passo := 5 ;
         If GC_Modificado = '#' Then Begin
            PN.Color := clLaranja ;
            PN.Font.Color := clBlack ;
            PN.Caption := 'RETRANCA MODIFICADA (' + _Retranca + ')' ;
         End Else Begin
            PN.Color := clSilver ;
            PN.Font.Color := clGray ;
            PN.Caption := 'RETRANCA N?O MODIFICADA (' + _Retranca + ')' ;
         End ;
         Exit ;
      End ;
   End ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception RD CHECAR_SE_RETRANCA_GC_MODIFICADO ' +
                'Passo[' + IntToStr(Passo) + ']' +
                '[' + E.Message + ']' ) ;
   End ;
End ;
End ;

Function TEspelho_RD.RD_SELECT_TEXT_GC2 ( Origem : String ; Registro : T_Clip_Retranca ) : String ;
Begin
Result := RD_KERNEL_GET_GC2 ( Registro.Retranca ) ;
If Result = '' Then Begin
   Result := RD_GC_ANTIGO ( Registro.Retranca, Result, DEBUG_FALSE ) ;
End ;
End ;

Function TEspelho_RD.RD_GET_FN_ULTIMO_JORNAL_ABERTO : String ;
Begin
Result := Diretorio + 'Config\ultimo_jornal_aberto.dat' ;
End ;

Procedure TEspelho_RD.RD_REGISTRAR_ULTIMO_JORNAL_ABERTO ;
Var Aux : String ;
Begin
If NOT RD_VAR_ESPELHO_ATUAL.Aberto2 Then Begin
   Exit ;
End ;
Aux := 'JORNAL=' + RD_VAR_ESPELHO_ATUAL.Jornal + sLineBreak +
       'DATA=' + DateToStr ( RD_VAR_ESPELHO_ATUAL.Data ) ;
PUT_CACHE_GRAVACAO ( 'RD REGISTRAR_ULTIMO_JORNAL_ABERTO', 500,
                     RD_GET_FN_ULTIMO_JORNAL_ABERTO, Aux ) ;
//WRITE_FILE_CORE ( 'RD_REGISTRAR_ULTIMO_JORNAL_ABERTO',
//                  RD_GET_FN_ULTIMO_JORNAL_ABERTO, Aux, DELAYED_TRUE ) ;
End ;

Function TEspelho_RD.RD_GET_DIR_SELO : String ;
Begin
//Result := INSERE_BARRA ( RD_GET_DIR_JORNAL_DATA ) + 'selos\' ;
Result := INSERE_BARRA ( RD_GET_DIR_JORNAL_DATA ) + 'artes\' ;
End ;

Function TEspelho_RD.RD_GET_DIR_SELO_FIXO : String ;
Begin
Result := INSERE_BARRA ( RD_GET_DIR_JORNAL_CURTO ) + 'selos\' ;
End ;

Function TEspelho_RD.RD_GET_DIR_SELO_OUTROS : String ;
Begin
Result := INSERE_BARRA ( RD_GET_DIR_JORNAL_CURTO ) + 'outros\' ;
End ;

Function TEspelho_RD.RD_GC_GET_DIR_IMAGENS_TARJAS : String ;
Begin
Result := RD_GET_DIR_DATABASE + 'Config\Tarjas\' + RD_VAR_ESPELHO_ATUAL.Jornal + '\' ;
//PUT_LOG ( 'RESULT RD GC_GET_DIR_IMAGENS_TARJAS [' + Result + ']' ) ;
End ;

Function TEspelho_RD.RD_FIND_RETRANCA_EM_SG
         ( SG : TStringGrid ; _Retranca : String ) : LongInt ;
Var Local : LongInt ;
    Qtde  : LongInt ;
Begin
_Debug ( 'INI TEspelho_RD FIND RETRANCA_EM_SG [' + _Retranca + ']' ) ;
Result := -1 ;
If NOT Assigned ( SG ) Then Begin
   _Debug ( 'Exit 1 !Assigned TEspelho_RD FIND RETRANCA_EM_SG [' +
            _Retranca + ']' ) ;
   Exit ;
End ;
Qtde := SG.RowCount ;
Try
   For Local := 0 To Qtde - 1 Do Begin
      If SG.Cells[SG_J_RETRANCA,Local] = _Retranca Then Begin
         Result := Local ;
         Break ;
      End ;
   End ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception FIND RETRANCA_EM_SG [' + E.Message + ']' ) ;
   End ;
End ;
_Debug ( 'FIM TEspelho_RD FIND RETRANCA_EM_SG [' + _Retranca + ']' ) ;
End ;

Function TEspelho_RD.RD_FIND_INDICE_EM_SG
         ( SG : TStringGrid ; _Indice : String ) : LongInt ;
Var Local : LongInt ;
    Qtde  : LongInt ;
Begin
_Debug ( 'INI TEspelho_RD FIND_INDICE_EM_SG [' + _Indice + ']' ) ;
Result := -1 ;
If NOT Assigned ( SG ) Then Begin
   _Debug ( 'Exit 1 !Assigned TEspelho_RD FIND_INDICE_EM_SG [' +
            _Indice + ']' ) ;
   Exit ;
End ;
Qtde := SG.RowCount ;
Try
   For Local := 0 To Qtde - 1 Do Begin
      If SG.Cells[SG_J_NO,Local] = _Indice Then Begin
         Result := Local ;
         Break ;
      End ;
   End ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception FIND_INDICE_EM_SG [' + E.Message + ']' ) ;
   End ;
End ;
_Debug ( 'FIM TEspelho_RD FIND_INDICE_EM_SG [' + _Indice + ']' ) ;
End ;

Function TEspelho_RD.RD_FIND_PRIMEIRA_RETRANCA_EM_SG : LongInt ;
Var Local    : LongInt ;
Begin
//PUT_LOG ( 'INI TEspelho_RD FIND_PRIMEIRA_RETRANCA_EM_SG' ) ;
Result := -1 ;
Try
   For Local := 0 To RD_VAR_QTDE_RETRANCAS - 1 Do Begin
      If RD_VAR_ARRAY_RETRANCAS [ Local ].Is_Retranca Then Begin
         Result := Local + 1 ;
         Break ;
      End ;
   End ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception FIND_PRIMEIRA_RETRANCA_EM_SG ' +
                '[' + E.Message + ']' ) ;
   End ;
End ;
//PUT_LOG ( 'FIM TEspelho_RD FIND_PRIMEIRA_RETRANCA_EM_SG ' +
//          '[' + IntToStr ( Result ) + ']' ) ;
End ;

Function TEspelho_RD.RD_VAR_GET_FN_HTML_CORRETOR : String ;
Begin
Result := RD_GET_DIR_DATABASE + 'Corretor\' +
          COMPUTADOR_SERIAL + '\corretor.html' ;
End ;

Function TEspelho_RD.RD_GET_FN_VOTACAO_POPULAR : String ;
Begin
Result := Diretorio + 'Config\votacao_popular.dat' ;
End ;

Procedure TEspelho_RD.RD_CRIAR_FN_DIRETORIOS_MESSAGES ;
Var Aux : String ;
Begin
If NOT RR_FileExists ( 'RD CRIAR_FN_DIRETORIOS_MESSAGES', RD_GET_FN_DIRETORIOS_MESSAGES ) Then Begin
   Aux := 'I:\2018\TVM\' + sLineBreak +
          'I:\2018\FUTEBOL CEARENSE\' + sLineBreak ;
   PUT_CACHE_GRAVACAO ( 'RD CRIAR_FN_DIRETORIOS_MESSAGES', 500,
                        RD_GET_FN_DIRETORIOS_MESSAGES, Aux ) ;
   //WRITE_FILE_CORE ( 'RD CRIAR_FN_DIRETORIOS_MESSAGES',
   //                  RD_GET_FN_DIRETORIOS_MESSAGES, Aux, DELAYED_FALSE ) ;
End ;
End ;

Procedure TEspelho_RD.RD_CRIAR_FN_BROWSERS ;
Var Aux : String ;
Begin
If NOT RR_FileExists ( 'RD CRIAR_FN_BROWSERS', RD_GET_FN_BROWSERS ) Then Begin
   Aux := 'FUTEBOL_2018' + sLineBreak +
          'TVM_2018' + sLineBreak ;
   PUT_CACHE_GRAVACAO ( 'RD CRIAR_FN_BROWSERS', 500, RD_GET_FN_BROWSERS, Aux ) ;
   //WRITE_FILE_CORE ( 'RD CRIAR_FN_BROWSERS',
   //                  RD_GET_FN_BROWSERS, Aux, DELAYED_FALSE ) ;
End ;
End ;

Procedure TEspelho_RD.RD_LOAD_BROWSERS ( LB : TListBox ) ;
Begin
If NOT Assigned ( LB ) Then Begin
   Exit ;
End ;
If NOT RR_FileExists ( 'RD LOAD_BROWSERS/1', RD_GET_FN_BROWSERS ) Then Begin
   RD_CRIAR_FN_BROWSERS ;
End ;
If NOT RR_FileExists ( 'RD LOAD_BROWSERS/2', RD_GET_FN_BROWSERS ) Then Begin
   ShowMessage ( 'Browsers do Chyronhego n?o foram carregados.' + sLineBreak +
                 'Ser?o utilizadas as configura??es realizadas diretamente no console do Chyron' ) ;
   Exit ;
End ;
Try
   LB.Items.LoadFromFile ( RD_GET_FN_BROWSERS ) ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception RD_LOAD_BROWSERS [' + E.Message + '][' + RD_GET_FN_BROWSERS + ']' ) ;
   End ;
End ;
End ;

Procedure TEspelho_RD.RD_LOAD_DIRETORIOS_MESSAGES ( LB : TListBox ) ;
Begin
If NOT Assigned ( LB ) Then Begin
   Exit ;
End ;
If NOT RR_FileExists ( 'RD LOAD_DIRETORIOS_MESSAGES/1',
                       RD_GET_FN_DIRETORIOS_MESSAGES ) Then Begin
   RD_CRIAR_FN_DIRETORIOS_MESSAGES ;
End ;
If NOT RR_FileExists ( 'RD LOAD_DIRETORIOS_MESSAGES/2',
                       RD_GET_FN_DIRETORIOS_MESSAGES ) Then Begin
   ShowMessage ( 'Diret?rios Messages do Chyronhego n?o foram carregados' + sLineBreak +
                 'Ser?o utilizadas as configura??es realizadas diretamente no console do Chyron' ) ;
   Exit ;
End ;
Try
   LB.Items.LoadFromFile ( RD_GET_FN_DIRETORIOS_MESSAGES ) ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception RD_LOAD_DIRETORIOS_MESSAGES [' + E.Message + ']' +
                '[' + RD_GET_FN_DIRETORIOS_MESSAGES + ']' ) ;
   End ;
End ;
End ;

Function TEspelho_RD.RD_GET_FN_BROWSERS : String ;
Begin
Result := Diretorio + 'Config\browsers.dat' ;
End ;

Function TEspelho_RD.RD_GET_FN_DIRETORIOS_MESSAGES : String ;
Begin
Result := Diretorio + 'Config\diretorios_messages.dat' ;
End ;

Function TEspelho_RD.RD_GET_FN_HISTORICO_ESPELHOS : String ;
Begin
Result := RD_GET_DIR_DATABASE + 'historico\' +
          SUPER_LowerCase ( Sys_Usuario_Aplicativo.Usuario ) + '.txt' ;
End ;

Function TEspelho_RD.RD_GET_FN_DICIONARIO_ATALHOS : String ;
Begin
Result := RD_GET_DIR_DATABASE_CONFIG + 'dicionario_atalhos.txt' ;
End ;

Function TEspelho_RD.RD_GET_FN_TIPOS_ARTES : String ;
Begin
Result := RD_GET_DIR_DATABASE_CONFIG + 'tipos_artes.dat' ;
End ;

Procedure TEspelho_RD.PUT_HISTORICO_ESPELHOS ;
Var Lista : TStringList ;
    Str   : String ;
Begin
If NOT RD_VAR_ESPELHO_ATUAL.Aberto2 Then Begin
   Exit ;
End ;
Str := COMPLETE ( RD_VAR_ESPELHO_ATUAL.Jornal, 12 ) +
       DateToStr ( RD_VAR_ESPELHO_ATUAL.Data ) ;
Lista := TStringList.Create ;
Lista.Clear ;
Try
   If RR_FileExists ( 'PUT_HISTORICO_ESPELHOS',
                      RD_GET_FN_HISTORICO_ESPELHOS ) Then Begin
      Try
         //PUT_LOG ( 'PUT HISTORICO_ESPELHOS ' +
         //          '[' + GET_FN_HISTORICO_ESPELHOS + ']' ) ;
         Lista.Text := RD_KERNEL_GET_CONTEUDO ( 'PUT_HISTORICO_ESPELHOS',
                                                RD_GET_FN_HISTORICO_ESPELHOS ) ;
      Except
         On E : Exception Do Begin
            PUT_LOG ( 'Exception PUT HISTORICO_ESPELHOS/1 ' +
                      '[' + E.Message + ']' ) ;
         End ;
      End ;
   End ;
   While Lista.IndexOf ( Str ) > -1 Do Begin
       Lista.Delete ( Lista.IndexOf ( Str ) ) ;
   End ;
   Lista.Insert ( 0 , Str ) ;
   While Lista.Count > 10 Do Begin
      Lista.Delete ( 10 ) ;
   End ;
   CHECAR_DIRETORIO_FILENAME ( RD_GET_FN_HISTORICO_ESPELHOS ) ;
   Lista.SaveToFile ( RD_GET_FN_HISTORICO_ESPELHOS ) ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception PUT HISTORICO_ESPELHOS/2 ' +
                '[' + E.Message + ']' ) ;
   End ;
End ;
Lista.Free ;
End ;

Procedure TEspelho_RD.RD_REGISTRAR_DT_GC ( _Retranca : String ; DT : TDateTime ) ;
{$IFDEF USAR_CHYRON}
Var Lista     : TStringList ;
    RecDos    : TSearchRec ;
    Resultado : LongInt ;
    FN        : String ;
    Indice    : LongInt ;
    Aux       : String ;
{$ENDIF}
Begin
{$IFDEF USAR_CHYRON}
_Debug ( 'INI RD REGISTRAR_DT_GC' ) ;
PUSH_TICK ( 'RD REGISTRAR_DT_GC' ) ;
Try
   Indice := RD_GET_INDICE_RETRANCA ( RD_BUFFER_MAIN, _Retranca ) ;
   If Indice > -1 Then Begin
      Aux := RD.RD_KERNEL_GET_GC ( _Retranca ) ;
      WRITE_FILE_CORE ( 'RD REGISTRAR_DT_GC', RD.RD_VAR_ARRAY_RETRANCAS[Indice].FN_GC_LAST,
                        Aux, DELAYED_FALSE ) ;
   End ;
   If DT = 0 Then Begin
      FN := RD_GET_DIR_JORNAL_DATA + _Retranca + '.GC' ;
      Resultado := RR_FindFirst ( 'RD REGISTRAR_DT_GC', FN, 0, RecDos ) ;
      If Resultado = 0 Then Begin
         DT := RecDos.TimeStamp ;
      End ;
      System.SysUtils.FindClose ( RecDos ) ;
   End ;
   If DT = 0 Then Begin
      POP_TICK ( 'Exit RD REGISTRAR_DT_GC' ) ;
      Exit ;
   End ;
   Lista := TStringList.Create ;
   If RR_FileExists ( 'RD_REGISTRAR_DT_GC', RD_GET_FN_GC_RESUMO2 ) Then Begin
      Lista.Text := RD_KERNEL_GET_CONTEUDO ( 'RD_REGISTRAR_DT_GC', RD_GET_FN_GC_RESUMO2 ) ;
   End Else Begin
      Lista.Clear ;
   End ;
   If DT <> -1 Then Begin
      Lista.Values[_Retranca] := DateTimeToStr(DT) ;
   End Else Begin
      Lista.Values[_Retranca] := '' ;
   End ;
   Lista.SaveToFile ( RD_GET_FN_GC_RESUMO2 ) ;
   Lista.Free ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception RD_REGISTRAR_DT_GC [' + E.Message + ']' ) ;
   End ;
End ;
POP_TICK ( 'RD REGISTRAR_DT_GC' ) ;
_Debug ( 'FIM RD REGISTRAR_DT_GC' ) ;
{$ENDIF}
End ;

Procedure TEspelho_RD.RD_COMPARAR_E_SALVAR_ATUALIZACOES_GC
          ( SG : TStringGrid ; LB : TListBox ) ;
{$IFDEF USAR_CHYRON}
Var RecDos      : TSearchRec ;
    Resultado   : LongInt ;
    Local       : LongInt ;
    Dir         : String ;
    FN          : String ;
    Aux_GC      : String ;
    Aux_Copia   : String ;
    _Retranca   : String ;
    Indice      : LongInt ;
    Indice2     : LongInt ;
{$ENDIF}
Begin
{$IFDEF USAR_CHYRON}
_Debug ( 'INI TEspelho_RD.RD COMPARAR_E_SALVAR_ATUALIZACOES_GC' ) ;
If NOT RD_VAR_ESPELHO_ATUAL.Aberto2 Then Begin
   PUT_LOG ( 'Exit RD COMPARAR_E_SALVAR_ATUALIZACOES_GC NOT RD_VAR_ESPELHO_ATUAL.Aberto2' ) ;
   Exit ;
End Else Begin
   PUT_LOG ( 'INI RD COMPARAR_E_SALVAR_ATUALIZACOES_GC OK RD_VAR_ESPELHO_ATUAL.Aberto2' ) ;
End ;
Try
   If RR_FileExists ( 'RD_COMPARAR_E_SALVAR_ATUALIZACOES_GC', RD_GET_FN_GC_RESUMO2 ) Then Begin
      RD_VAR_LAST_GC_ATUALIZADO.Text :=
             RD_KERNEL_GET_CONTEUDO ( 'RD COMPARAR_E_SALVAR_ATUALIZACOES_GC',
                                      RD_GET_FN_GC_RESUMO2 ) ;
   End Else Begin
      RD_VAR_LAST_GC_ATUALIZADO.Clear ;
   End ;
Except
End ;
//Dir := INSERE_BARRA ( RD_GET_DIR_JORNAL_DATA ) ;
Dir := RD_GET_DIR_JORNAL_LOCAL ;
//PUT_LOG ( 'RD COMPARAR_E_SALVAR_ATUALIZACOES_GC Dir[' + Dir + ']' ) ;
Resultado := RR_FindFirst ( 'RD COMPARAR_E_SALVAR_ATUALIZACOES_GC',
                            Dir + '*.GC', 0, RecDos ) ;
While Resultado = 0 Do Begin
   If RecDos.Size = 0 Then Begin
      Resultado := System.SysUtils.FindNext ( RecDos ) ;
      Continue ;
   End ;
   FN := ExtractFileNameSemExt( RecDos.Name ) ;
   Indice := RD_FIND_RETRANCA_EM_SG ( SG, FN ) ;
   Indice2 := RD_GET_INDICE_RETRANCA ( RD_BUFFER_MAIN, FN ) ;
   If Indice < 0 Then Begin
      Resultado := System.SysUtils.FindNext ( RecDos ) ;
      Continue ;
   End ;
   If RD_VAR_LAST_GC_ATUALIZADO.Values[FN] = DateTimeToStr(RecDos.TimeStamp) Then Begin
      SG.Cells[SG_J_GC, Indice] := ' ' ;
      If Indice2 >= 0 Then Begin
         RD_VAR_ARRAY_RETRANCAS[Indice2].GC_Modificado := ' ' ;
      End ; ;
   End Else If RD_VAR_LAST_GC_ATUALIZADO.Values[FN] = '' Then Begin
      SG.Cells[SG_J_GC, Indice] := '#' ;
      If Indice2 >= 0 Then Begin
         RD_VAR_ARRAY_RETRANCAS[Indice2].GC_Modificado := '#' ;
      End ; ;
//      PUT_LOG ( 'CHECK GC DIFERENTE/1 [' + FN + ']' ) ;
//      RD_REGISTRAR_DT_GC ( FN, RecDos.TimeStamp-10 ) ;
      //RD_VAR_LAST_GC_ATUALIZADO.Values[FN] := DateTimeToStr(RecDos.TimeStamp-10) ;
   End Else Begin
      Aux_GC := RD_KERNEL_GET_CONTEUDO ( 'RD COMPARAR_E_SALVAR_ATUALIZACOES_GC/1',
                                         Dir + RecDos.Name ) ;
      Aux_GC := RD_FILTRAR_TEXTO_RD ( Aux_GC ) ;
      Aux_Copia := RD_KERNEL_GET_CONTEUDO ( 'RD COMPARAR_E_SALVAR_ATUALIZACOES_GC/2',
                                            Dir + RecDos.Name + '.copia' ) ;
      Aux_Copia := RD_FILTRAR_TEXTO_RD ( Aux_Copia ) ;
      If Aux_GC <> Aux_Copia Then Begin
         SG.Cells[SG_J_GC, Indice] := '#' ;
         If Indice2 >= 0 Then Begin
            RD_VAR_ARRAY_RETRANCAS[Indice2].GC_Modificado := '#' ;
         End ; ;
         //PUT_LOG ( 'CHECK GC DIFERENTE/3 [' + FN + ']' ) ;
         RD_REGISTRAR_DT_GC ( FN, -1 ) ;
         //RD_VAR_LAST_GC_ATUALIZADO.Values[FN] := DateTimeToStr(RecDos.TimeStamp-10) ;
      End Else Begin
         SG.Cells[SG_J_GC, Indice] := ' ' ;
         //PUT_LOG ( 'CHECK GC IGUAL/3 [' + FN + ']' ) ;
         RD_REGISTRAR_DT_GC ( FN, RecDos.TimeStamp ) ;
         //RD_VAR_LAST_GC_ATUALIZADO.Values[FN] := DateTimeToStr(RecDos.TimeStamp) ;
      End ;
      //PUT_LOG ( 'RD COMPARAR_E_SALVAR_ATUALIZACOES_GC ADD [' + FN + ']' ) ;
   End;
   Resultado := System.SysUtils.FindNext ( RecDos ) ;
End ;
System.SysUtils.FindClose ( RecDos ) ;
//
For Local := 2 To SG.RowCount - 1 Do Begin
   _Retranca := SG.Cells[SG_J_RETRANCA, Local] ;
   If RD_IS_COMERCIAL( _Retranca ) Then Begin
      Continue ;
   End ;
   If RD_IS_FIM ( _Retranca ) Then Begin
      Break ;
   End ;
End ;
_Debug ( 'FIM TEspelho_RD.RD COMPARAR_E_SALVAR_ATUALIZACOES_GC' ) ;
{$ENDIF}
End ;

Procedure TEspelho_RD.RD_FECHAR_ESPELHO ( Origem : String ) ;
{$IFDEF NW}
Var Local : LongInt ;
{$ENDIF}
Begin
{$IFDEF USAR_CHYRON}
{$IFDEF NW}
RD_VAR_ESPELHO_ATUAL.Lista_Simplificada_Atual.Clear ;
RD_VAR_ESPELHO_ATUAL.Aberto2 := FALSE ;
RD_EXEC_LIMPAR_RETRANCA_RET ( 'TEspelho_RD.RD FECHAR_ESPELHO' ) ;
CCH.CCH_LIMPAR_CONTROLE ( 0, DEF_CCH_MAX - 1 ) ;
CCH_Next.CCH_LIMPAR_CONTROLE ( 0, DEF_CCH_MAX - 1 ) ;
Main.LB_Jornal_Aberto.Caption := '-' ;
Main.PN_Abrir_Espelho2.Show ;
RD_EXEC_LIMPAR_RETRANCA_RET ( 'TEspelho_RD.RD FECHAR_ESPELHO' ) ;
If Assigned ( RD_VAR_RE_MODO_TEXTO ) Then Begin
   RD_VAR_RE_MODO_TEXTO.Lines.Clear ;
End ;
If Assigned ( RD_VAR_RE_MODO_TEXTO_GC ) Then Begin
   RD_VAR_RE_MODO_TEXTO_GC.Lines.Clear ;
End ;
If RD_VAR_QTDE_RE > 0 Then Begin
   For Local := 0 To RD_VAR_QTDE_RE - 1 Do Begin
      If Assigned ( RD_VAR_ARRAY_RE[Local].RE ) Then Begin
         RD_VAR_ARRAY_RE[Local].RE.Lines.Clear ;
      End ;
   End ;
End ;
If RD_VAR_QTDE_RE_MY > 0 Then Begin
   For Local := 0 To RD_VAR_QTDE_RE_MY - 1 Do Begin
      If Assigned ( RD_VAR_ARRAY_RE_MY[Local].RE ) Then Begin
         RD_VAR_ARRAY_RE_MY[Local].RE.Lines.Clear ;
      End ;
   End ;
End ;
If RD_VAR_QTDE_RE_GC > 0 Then Begin
   For Local := 0 To RD_VAR_QTDE_RE_GC - 1 Do Begin
      If Assigned ( RD_VAR_ARRAY_RE_GC[Local].RE ) Then Begin
         RD_VAR_ARRAY_RE_GC[Local].RE.Lines.Clear ;
      End ;
   End ;
End ;
If RD_VAR_QTDE_RE_MY_GC > 0 Then Begin
   For Local := 0 To RD_VAR_QTDE_RE_MY_GC - 1 Do Begin
      If Assigned ( RD_VAR_ARRAY_RE_MY_GC[Local].RE ) Then Begin
         RD_VAR_ARRAY_RE_MY_GC[Local].RE.Lines.Clear ;
      End ;
   End ;
End ;
If RD_VAR_QTDE_RE_MY_GC2 > 0 Then Begin
   For Local := 0 To RD_VAR_QTDE_RE_MY_GC2 - 1 Do Begin
      If Assigned ( RD_VAR_ARRAY_RE_MY_GC2[Local].RE ) Then Begin
         RD_VAR_ARRAY_RE_MY_GC2[Local].RE.Lines.Clear ;
      End ;
   End ;
End ;
If RD_VAR_QTDE_RE_MY_GC2_AUTO > 0 Then Begin
   For Local := 0 To RD_VAR_QTDE_RE_MY_GC2_AUTO - 1 Do Begin
      If Assigned ( RD_VAR_ARRAY_RE_MY_GC2_AUTO[Local].RE ) Then Begin
         RD_VAR_ARRAY_RE_MY_GC2_AUTO[Local].RE.Lines.Clear ;
      End ;
   End ;
End ;
If RD_VAR_QTDE_RE_CC > 0 Then Begin
   For Local := 0 To RD_VAR_QTDE_RE_CC - 1 Do Begin
      If Assigned ( RD_VAR_ARRAY_RE_CC[Local].RE ) Then Begin
         RD_VAR_ARRAY_RE_CC[Local].RE.Lines.Clear ;
      End ;
   End ;
End ;
If RD_VAR_QTDE_RE_OFF > 0 Then Begin
   For Local := 0 To RD_VAR_QTDE_RE_OFF - 1 Do Begin
      If Assigned ( RD_VAR_ARRAY_RE_OFF[Local].RE ) Then Begin
         RD_VAR_ARRAY_RE_OFF[Local].RE.Lines.Clear ;
      End ;
   End ;
End ;
If RD_VAR_QTDE_PN_RET > 0 Then Begin
   For Local := 0 To RD_VAR_QTDE_PN_RET - 1 Do Begin
      If Assigned ( RD_VAR_ARRAY_PN_RET2[Local].PN ) Then Begin
         RD_VAR_ARRAY_PN_RET2[Local].PN.Caption := '' ;
      End ;
   End ;
End ;
LIMPAR_RASTROS_RETRANCA ;
RD_RESET_ESPELHO ( 'TEspelho_RD.RD FECHAR_ESPELHO/' + Origem ) ;
Main.DESABILITAR_CONTROLES ;
{$ENDIF}
{$ENDIF}
End ;

Function TEspelho_RD.RD_FN_DICIONARIO : String ;
Begin
Result := RD_GET_DIR_DATABASE_CONFIG + 'dicionario.txt' ;
End ;

(*
Function TEspelho_RD.RD_FN_CAMERA_TRANSITO : String ;
Begin
Result := RD_GET_DIR_DATABASE_CONFIG + 'Apps\window.dat' ;
End ;
*)

Procedure TEspelho_RD.RD_VERIFICAR_FN_IPS_CAMERA_TRANSITO ;
Var Str : String ;
Begin
If NOT RR_FileExists ( 'RD VERIFICAR_FN_IPS_CAMERA_TRANSITO',
                       RD_FN_TABELA_CAMERA_TRANSITO ) Then Begin
   Str := '' ;
   Str := Str + '192.168.0.1/' + '=' + 'Av. RAUL BARBOSA|Fortaleza' + sLineBreak ;
   Str := Str + '192.168.0.2/' + '=' + 'Av. WASHINGTON SOARES|Fortaleza' + sLineBreak ;
   Str := Str + '192.168.0.3/' + '=' + 'Av. AGUANAMBI|Fortaleza' + sLineBreak ;
   Str := Str + '192.168.0.4/' + '=' + 'Av. 13 DE MAIO|Fortaleza' + sLineBreak ;
   Str := Str + '192.168.0.5/' + '=' + 'Av. ANT?NIO SALES|Fortaleza' + sLineBreak ;
   Str := Str + '192.168.0.6/' + '=' + 'Av. DESEMBARGADOR MOREIRA|Fortaleza' + sLineBreak ;
   Str := Str + '192.168.0.7/' + '=' + 'BR-116|Fortaleza' + sLineBreak ;
   Str := Str + '192.168.0.8/' + '=' + 'AV. SILAS MUNGUBA|Fortaleza' + sLineBreak ;
   Str := Str + '192.168.0.9/' + '=' + 'AV. LESTE-OESTE|Fortaleza' + sLineBreak ;
   PUT_CACHE_GRAVACAO ( 'CONVERTER APP_EM_CAMERA_DE_VIDEO', 500,
                        RD_FN_TABELA_CAMERA_TRANSITO, Str ) ;
   //WRITE_FILE_CORE ( 'CONVERTER APP_EM_CAMERA_DE_VIDEO',
   //                  RD_FN_TABELA_CAMERA_TRANSITO, Str, DELAYED_FALSE ) ;
End ;
End ;

Function TEspelho_RD.RD_FN_TABELA_CAMERA_TRANSITO : String ;
Begin
Result := RD_GET_DIR_DATABASE_CONFIG + 'ips_cameras_de_video.dat' ;
End ;

Procedure TEspelho_RD.RD_LOAD_IPS_CAMERAS_DE_TRANSITO ;
Begin
PUT_LOG ( 'RD LOAD_IPS_CAMERAS_DE_TRANSITO' ) ;
RD_VAR_SL_IPS_CAMERAS_DE_TRANSITO.Clear ;
RD_VERIFICAR_FN_IPS_CAMERA_TRANSITO ;
Try
   If RR_FileExists ( 'RD LOAD_IPS_CAMERAS_DE_TRANSITO',
                      RD_FN_TABELA_CAMERA_TRANSITO ) Then Begin
      RD_VAR_SL_IPS_CAMERAS_DE_TRANSITO.Text :=
           GET_CONTEUDO_M ( 'RD LOAD_IPS_CAMERAS_DE_TRANSITO',
                            RD_FN_TABELA_CAMERA_TRANSITO ) ;
   End ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception RD LOAD_IPS_CAMERAS_DE_TRANSITO [' + E.Message + ']' ) ;
   End ;
End ;
PUT_LOG ( 'FIM RD LOAD_IPS_CAMERAS_DE_TRANSITO ' +
          'Qtde[' + IntToStr ( RD_VAR_SL_IPS_CAMERAS_DE_TRANSITO.Count ) + ']' ) ;
End ;

Procedure TEspelho_RD.RD_REMOVER_EXPRESSAO_DO_DICIONARIO ( Aux : String ) ;
{$IFDEF USAR_CHYRON}
Var Qtde     : LongInt ;
    Indice   : LongInt ;
    Removido : Boolean ;
{$ENDIF}
Begin
{$IFDEF USAR_CHYRON}
_Debug ( 'INI RD REMOVER EXPRESSAO_DO_DICIONARIO' ) ;
Qtde := Dicionario_MM.Count ;
If Qtde = 0 Then Begin
   _Debug ( 'Exit/1 !Qtde RD REMOVER EXPRESSAO_DO_DICIONARIO' ) ;
   Exit ;
End ;
Removido := FALSE ;
Indice := Dicionario_MM.IndexOf ( Aux ) ;
While Indice > -1 Do Begin
   Removido := TRUE ;
   Dicionario_MM.Delete ( Indice ) ;
   Indice := Dicionario_MM.IndexOf ( Aux ) ;
End ;
If Removido Then Begin
   CRIAR_BACKUP ( RD_FN_DICIONARIO ) ;
   WRITE_FILE_CORE ( 'RD REMOVER EXPRESSAO_DO_DICIONARIO',
                     RD.RD_FN_DICIONARIO,
                     Dicionario_MM.Text, DELAYED_FALSE ) ;
   RD_CARREGAR_DICIONARIO ( 'RD REMOVER EXPRESSAO_DO_DICIONARIO' ) ;
End ;
_Debug ( 'FIM RD REMOVER EXPRESSAO_DO_DICIONARIO' ) ;
{$ENDIF}
End ;

Procedure TEspelho_RD.RD_CARREGAR_DICIONARIO ( Origem : String ) ;
Var FN   : String ;
//    Aux  : String ;
Begin
_Debug ( 'INI TEspelho_RD.RD CARREGAR_DICIONARIO [' +
         RD_FN_DICIONARIO + ']' ) ;
If RD_VAR_LAST_CARREGAR_DICIONARIO > GetTickCount Then Begin
   PUT_LOG ( 'Exit Tick CARREGAR_DICIONARIO Or[' + Origem + ']' ) ;
   Exit ;
End ;
RD_VAR_LAST_CARREGAR_DICIONARIO := GetTickCount + 1000 ;
//PUT_LOG ( 'INI CARREGAR_DICIONARIO Or[' + Origem + '][' + RD_FN_DICIONARIO + ']' ) ;
Try
   CHECAR_DIRETORIO_FILENAME ( RD_FN_DICIONARIO ) ;
   (*
   If NOT RR_FileExists ( 'RD CARREGAR_DICIONARIO', RD_FN_DICIONARIO ) Then Begin
      Aux := 'Fortaleza'#13#10'Cear?' ;
      PUT_CACHE_GRAVACAO ( 'RD CARREGAR_DICIONARIO', 500, RD_FN_DICIONARIO, Aux ) ;
      {
      //WRITE_FILE_CORE ( 'RD CARREGAR_DICIONARIO',
                          RD_FN_DICIONARIO, Aux, DELAYED_FALSE ) ;
      }
   End ;
   *)
   Dicionario_MM.Text := RD_KERNEL_GET_CONTEUDO ( 'RD CARREGAR_DICIONARIO', RD_FN_DICIONARIO ) ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception CARREGAR_DICIONARIO/1 [' + E.Message + ']' ) ;
      Exit ;
   End ;
End ;
Try
   FN := Diretorio + 'log\Proc_Dicionario.txt' ;
   PUT_LOG ( 'CARREGAR_DICIONARIO/2 [' + FN + ']' ) ;
   CHECAR_DIRETORIO_FILENAME ( FN ) ;
   Dicionario_MM.SaveToFile ( FN ) ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception CARREGAR_DICIONARIO/2 [' + E.Message + ']' ) ;
   End ;
End ;
//PUT_LOG ( 'FIM CARREGAR_DICIONARIO/2' ) ;
_Debug ( 'FIM TEspelho_RD.RD CARREGAR_DICIONARIO' ) ;
End ;

Procedure TEspelho_RD.RD_COLAR_MM ( ME : TMemo ) ;
Var Aux              : String ;
    Local            : LongInt ;
//    Prox_Maiuscula   : Boolean ;
    Ignorar          : Boolean ;
    Flag_Next_Upper  ,
    Flag_Next_Lower  ,
    Flag_Next_1Upper : Boolean ;
    Qtde             : LongInt ;
    HistDic          : String ;
Begin
If ME = Nil Then Begin
   Exit ;
End ;
HistDic := '' ;
ME.Lines.Clear ;
ME.PasteFromClipboard ;
Qtde := ME.Lines.Count ;
If Qtde = 0 Then Begin
   Exit ;
End ;
Ignorar := FALSE ;
//RD_CARREGAR_DICIONARIO ;
Flag_Next_Upper := FALSE ;
Flag_Next_Lower := FALSE ;
Flag_Next_1Upper := FALSE ;
For Local := 0 To Qtde - 1 Do Begin
   Aux := Trim ( ME.Lines[Local] ) ;
   If NOT Ignorar Then Begin
      If Pos ( '#GC=IMAGENS', UpperCase ( Aux ) ) = 1 Then Begin
         Flag_Next_Upper := TRUE ;
         Ignorar := TRUE ;
         ME.Lines[Local] := Super_Uppercase ( Aux ) ;
         Continue ;
      End Else If Pos ( '#GC=', UpperCase ( Aux ) ) = 1 Then Begin
         Flag_Next_Lower := TRUE ;
         Ignorar := TRUE ;
         Continue ;
      End Else If Pos ( '#TARJA=', UpperCase ( Aux ) ) = 1 Then Begin
         Flag_Next_1Upper := TRUE ;
         Ignorar := TRUE ;
         Continue ;
      End ;
   End ;
   Ignorar := FALSE ;
   If Flag_Next_Upper Then Begin
      Aux := Super_UpperCase ( Aux ) ;
   End Else If Flag_Next_Lower Then Begin
      Aux := Super_LowerCase ( Aux ) ;
      Aux := PELO_DICIONARIO ( Aux, HistDic ) ;
   End Else If Flag_Next_1Upper Then Begin
      Aux := Super_LowerCase ( Aux ) ;
      If Aux <> '' Then
         Aux[1] := Upcase ( Aux[1] ) ;
      Aux := PELO_DICIONARIO ( Aux, HistDic ) ;
   End ;
   Flag_Next_Upper := FALSE ;
   Flag_Next_Lower := FALSE ;
   Flag_Next_1Upper := FALSE ;
   ME.Lines[Local] := Aux ;
End ;
Aux := ME.Text ;
Aux := System.SysUtils.StringReplace ( Aux, '=', '=' + #13#10, [rfReplaceAll] ) ;
ME.Text := Aux ;
End ;

Function TEspelho_RD.RD_GET_FN_ABREVIATURAS_COMANDOS : String ;
Begin
Result := RD_GET_DIR_DATABASE_CONFIG + 'atalhos_efeitos.dat' ;
End ;

Procedure TEspelho_RD.RD_REGISTRA_LOG_ESPELHO ( _Msg : String ) ;
{$IFDEF USAR_CHYRON}
Var Lista    : TStringList ;
    FileName : String ;
{$ENDIF}
Begin
{$IFDEF USAR_CHYRON}
_Debug ( 'INI REGISTRA_LOG_ESPELHO' ) ;
If NOT Assigned ( RD ) Then Begin
   Exit ;
End ;
If NOT DirectoryUsable ( INSERE_BARRA ( ExtractFilePath ( RD_MONTAR_NOME_JORNAL ) ) ) Then Begin
   _Debug ( 'Exit NOT DirectoryUsable REGISTRA_LOG_ESPELHO' ) ;
   Exit ;
End ;
FileName := INSERE_BARRA ( ExtractFilePath ( RD_MONTAR_NOME_JORNAL ) ) +
            'logs\' + COMPUTADOR_SERIAL + '.txt' ;
Lista := TStringList.Create ;
Lista.Clear ;
If RR_FileExists ( 'RD_REGISTRA_LOG_ESPELHO', FileName ) Then Begin
   Try
      PUT_LOG ( 'REGISTRA_LOG_ESPELHO [' + FileName + ']' ) ;
      Lista.Text := RD_KERNEL_GET_CONTEUDO ( 'RD_REGISTRA_LOG_ESPELHO', FileName ) ;
   Except
      On E : Exception Do Begin
         PUT_LOG ( 'Exception REGISTRA_LOG_ESPELHO/1 [' + FileName + '][' + E.Message + ']' ) ;
      End ;
   End ;
End ;
Lista.Add ( DateTimeToStr ( Now ) + #32 +
            Sys_Usuario_Aplicativo.Usuario + #32 +
            COMPLETE ( Sys_Usuario_Aplicativo.SYS_EDITOR , 3 ) + #32 + _Msg ) ;
Try
   CHECAR_DIRETORIO_FILENAME ( FileName ) ;
   Lista.SaveToFile ( FileName ) ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception REGISTRA_LOG_ESPELHO/2 [' + FileName + '][' + E.Message + ']' ) ;
   End ;
End ;
Lista.Free ;
_Debug ( 'FIM REGISTRA_LOG_ESPELHO' ) ;
{$ENDIF}
End ;

Procedure TEspelho_RD.RD_CARREGAR_TIPOS_ARTES ;
Begin
If NOT RR_FileExists ( 'RD CARREGAR_TIPOS_ARTES', RD_GET_FN_TIPOS_ARTES ) Then Begin
   PUT_LOG ( 'RD_CARREGAR_TIPOS_ARTES !FileExists [' + RD_GET_FN_TIPOS_ARTES + ']' ) ;
   RD_VAR_SL_TIPOS_ARTES.Clear ;
   Exit ;
End ;
Try
   RD_VAR_SL_TIPOS_ARTES.Text :=
            RD_KERNEL_GET_CONTEUDO ( 'RD_CARREGAR_TIPOS_ARTES', RD_GET_FN_TIPOS_ARTES ) ;
   PUT_LOG ( 'OK RD_CARREGAR_TIPOS_ARTES [' + RD_GET_FN_TIPOS_ARTES + ']' ) ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception RD_CARREGAR_TIPOS_ARTES [' + E.Message + ']' ) ;
   End ;
End ;
End ;

Function TEspelho_RD.RD_RETRANCA_NEXT_HABILITADA : Boolean ;
Begin
{$IFDEF NW}
Result := ( Main.PC_Left.ActivePage = Main.TS_Left_Proxima ) ;
{$ELSE}
Result := FALSE ;
{$ENDIF}
End ;

Procedure TEspelho_RD.RD_LIMPAR_DIRETORIO_LOCAL ( Origem : String ) ;
Var RecDos    : TSearchRec ;
    Resultado : LongInt ;
//    Dir       : String ;
Begin
_Debug ( 'INI RD LIMPAR_DIRETORIO_LOCAL[' + Origem + ']' ) ;
PUT_LOG ( 'RD LIMPAR_DIRETORIO_LOCAL [' + Origem + ']' ) ;
PUSH_TICK ( 'RD LIMPAR_DIRETORIO_LOCAL' ) ;
Resultado := RR_FindFirst ( 'RD LIMPAR_DIRETORIO_LOCAL',
                            RD_GET_DIR_JORNAL_LOCAL + '*.*', 0, RecDos ) ;
While Resultado = 0 Do Begin
   If RR_DeleteFile ( 'RD LIMPAR_DIRETORIO_LOCAL',
                      RD_GET_DIR_JORNAL_LOCAL + RecDos.Name ) Then Begin
      //PUT_LOG ( 'DeleteFile OK [' + RD_GET_DIR_JORNAL_LOCAL + RecDos.Name + ']' ) ;
      PUT_STATUS ( 'Deletando local [' + RecDos.Name + ']' ) ;
   End Else Begin
      PUT_LOG ( 'DeleteFile N?O OK [' + RD_GET_DIR_JORNAL_LOCAL + RecDos.Name + ']' ) ;
   End ;
   Resultado := System.SysUtils.FindNext ( RecDos ) ;
End ;
System.SysUtils.FindClose ( RecDos ) ;
PUT_STATUS ( 'Expurgo completo' ) ;
POP_TICK ( 'RD LIMPAR_DIRETORIO_LOCAL' ) ;
_Debug ( 'FIM RD LIMPAR_DIRETORIO_LOCAL[' + Origem + ']' ) ;
End ;

Procedure TEspelho_RD.RD_THREAD_SINCRONIZAR_JORNAL_COMPLETO ;
Var RecDos    : TSearchRec ;
    Resultado : LongInt ;
    Dir       : String ;
    Lista     : TStringList ;
    Aux       : String ;
    _Total    : LongInt ;
    _Iguais   : LongInt ;
    _Novos    : LongInt ;
    Tick      : Cardinal ;
    _Mesma_Retranca : Boolean ;
Begin
_Debug ( 'INI THREAD RD SINCRONIZAR_JORNAL_COMPLETO (Modo THREAD ' +
         IFSN ( RD_VAR_TASK_SYNC_MODO_THREAD ) + ']' ) ;
PUSH_TICK ( 'THREAD RD SINCRONIZAR_JORNAL_COMPLETO' ) ;
Tick := GetTickCount ;
Lista := TStringList.Create ;
_Total := 0 ;
_Iguais := 0  ;
_Novos := 0 ;
PUT_LOG ( 'Task_Sync_Limpar [' + IFSN ( RD_VAR_TASK_SYNC_LIMPAR ) + ']' ) ;
If RD_VAR_TASK_SYNC_LIMPAR Then Begin
   RD_LIMPAR_DIRETORIO_LOCAL ( 'RD THREAD SINCRONIZAR_JORNAL_COMPLETO' ) ;
End Else Begin
   Resultado := RR_FindFirst ( 'THREAD RD SINCRONIZAR_JORNAL_COMPLETO/1',
                               RD_GET_DIR_JORNAL_LOCAL + '*.*', 0, RecDos ) ;
   While Resultado = 0 Do Begin
      Aux := RecDos.Name + '=' + CASA9_PONTO ( RecDos.TimeStamp ) ;
      //PUT_LOG ( 'Aux [' + RecDos.Name + '=' + CASA9_PONTO ( RecDos.TimeStamp ) + ']' ) ;
      //PUT_LOG ( 'ADD TimeStamp [' + RecDos.Name + ']' ) ;
      Lista.Add ( Aux ) ;
      Inc ( _Total ) ;
      Resultado := System.SysUtils.FindNext ( RecDos ) ;
   End ;
   System.SysUtils.FindClose ( RecDos ) ;
End ;
//
Dir := RD_GET_DIR_JORNAL_DATA ;
PUT_LOG ( 'Mascara [' + Dir + RD_VAR_SYNC_JORNAL_MASCARA + ']' ) ;
Resultado := RR_FindFirst ( 'THREAD RD SINCRONIZAR_JORNAL_COMPLETO/2',
                            Dir + RD_VAR_SYNC_JORNAL_MASCARA, 0, RecDos ) ;
While Resultado = 0 Do Begin
   If ( TRUE ) OR
      ( Lista.Values [ RecDos.Name ] <> CASA9_PONTO ( RecDos.TimeStamp ) ) Then Begin
      Inc ( _Novos ) ;
      PUT_STATUS ( 'Sincronizando [' + RecDos.Name + ']' ) ;
      //PUT_LOG ( 'Sincronizando [' + RecDos.Name + ']' ) ;
      RD_SINCRONIZAR_JORNAL_LOCAL ( 'THREAD RD SINCRONIZAR_JORNAL_COMPLETO',
                                    Dir + RecDos.Name, _Mesma_Retranca ) ;
   End Else Begin
      Inc ( _Iguais ) ;
   End ;
   Resultado := System.SysUtils.FindNext ( RecDos ) ;
End ;
If _Mesma_Retranca Then Begin
   RD_MESMA_RETRANCA ;
End ;
System.SysUtils.FindClose ( RecDos ) ;
//
Lista.Free ;
Tick := GetTickCount - Tick ;
PUT_LOG ( 'SYNC_ALL ' +
          'T[' + IntToStr(Tick) + '] ' +
          'TT[' + IntToStr(_Total) + '] ' +
          'Novos[' + IntToStr(_Novos) + '] ' +
          'Iguais[' + IntToStr(_Iguais) + ']' ) ;
PUT_STATUS ( 'Sincronismo completo Novos[' + IntToStr(_Novos) + ']' ) ;
POP_TICK ( 'THREAD RD SINCRONIZAR_JORNAL_COMPLETO' ) ;
_Debug ( 'FIM THREAD RD SINCRONIZAR_JORNAL_COMPLETO' ) ;
End ;

Procedure TEspelho_RD.RD_SINCRONIZAR_JORNAL_COMPLETO ( Origem : String ;
                                        Modo_Thread : Boolean ;
                                        Mascara : String ; Limpar : Boolean ) ;
Begin
_Debug ( 'INI RD SINCRONIZAR_JORNAL_COMPLETO' ) ;
RD_VAR_TASK_SYNC_MODO_THREAD := Modo_Thread ;
RD_VAR_TASK_SYNC_LIMPAR := Limpar ;
RD_VAR_SYNC_JORNAL_MASCARA := Mascara ;
(*
If RD_VAR_TASK_SYNC_MODO_THREAD Then Begin
   If Assigned ( RD_VAR_TASK_SYNC_JORNAL ) Then Begin
      If RD_VAR_TASK_SYNC_JORNAL.Status = TTaskStatus.Running Then Begin
         PUT_LOG ( 'Task RD SINCRONIZAR_JORNAL_COMPLETO em execu??o' ) ;
         Exit ;
      End ;
   End ;
   RD_VAR_TASK_SYNC_JORNAL := TTask.Create ( RD_THREAD_SINCRONIZAR_JORNAL_COMPLETO ) ;
   RD_VAR_TASK_SYNC_JORNAL.Start ;
End Else Begin
   RD_THREAD_SINCRONIZAR_JORNAL_COMPLETO ;
End ;
*)
RD_THREAD_SINCRONIZAR_JORNAL_COMPLETO ;
_Debug ( 'FIM RD SINCRONIZAR_JORNAL_COMPLETO' ) ;
End ;

Procedure TEspelho_RD.RD_SINCRONIZAR_JORNAL_LOCAL ( Origem, FN : String ;
                                                    Var _Mesma_Retranca : Boolean ) ;
{$IFDEF USAR_CHYRON}
Var FN_Local : String ;
    Tick     : Cardinal ;
    Retranca : String ;
    Indice   : LongInt ;
    Aux      : String ;
    FLAG_ATUALIZAR_ESPELHO : Boolean ;
{$ENDIF}
Begin
{$IFDEF USAR_CHYRON}
PUT_LOG ( 'INI RD SINCRONIZAR_JORNAL_LOCAL [' + FN + ']') ;
PUSH_TICK ( 'RD SINCRONIZAR_JORNAL_LOCAL' ) ;
Tick := GetTickCount ;
_Mesma_Retranca := FALSE ;
FLAG_ATUALIZAR_ESPELHO := NOT FALSE ;
Try
   {
   \\127.0.0.1\rd\
   \\127.0.0.1\rd\Jornais\BOMDIA\190708\
   \\127.0.0.1\rd\Jornais\BOMDIA\190708\GC_RESUMO2.GC
   }
   {
   C:\Program Files\Programacao\NW_10.2\Local\rd\Jornais\BOMDIA\190708\GC_RESUMO2.GC
                                  \\127.0.0.1\rd\Jornais\BOMDIA\190708\GC_RESUMO2.GC
   }
   FN_Local := FN ;
   FN_Local := System.SysUtils.StringReplace ( FN,
                                               RD_GET_DIR_JORNAL_DATA, // RD_VAR_SERVIDOR,
                                               RD_GET_DIR_JORNAL_LOCAL, [rfReplaceAll] ) ;
   CHECAR_DIRETORIO_FILENAME ( FN_Local ) ;
   CopiaArquivo ( 'TEspelho_RD.RD SINCRONIZAR_JORNAL_LOCAL/' + Origem,
                  FN, FN_Local, SOBREPOE ) ;
   Retranca := ExtractFileNameSemExt ( FN ) ;
   Indice := RD_GET_INDICE_RETRANCA ( RD_BUFFER_MAIN, Retranca ) ;
   If Indice >= 0 Then Begin
      Aux := RD_KERNEL_GET_CONTEUDO ( 'RD SINCRONIZAR_JORNAL_LOCAL/1/' + Origem, FN_Local ) ;
      If ExtractFileExt ( FN ) = '' Then Begin
         If Aux <> RD.RD_KERNEL_GET_GC_CABECA_PROCESSADA ( Retranca ) Then Begin
            RD_KERNEL_SET_CABECA ( 'RD SINCRONIZAR_JORNAL_LOCAL',
                                   Retranca,
                                   Aux,
                                   SALVAR_FALSE ) ;
            //PUT_LOG ( 'SYNC Atualizando CONTEUDO_CABECA [' + Retranca + ']' ) ;
         End Else Begin
            PUT_LOG ( 'CABE?A IGUAL [' + FN + ']' ) ;
         End ;
      End Else If UpperCase ( ExtractFileExt ( FN ) ) = '.GC' Then Begin
         If Aux <> RD.RD_KERNEL_GET_GC_LAST_PROCESSADO ( Retranca ) Then Begin
            Aux := RD_FILTRAR_TEXTO_RD ( Aux ) ;
            RD_KERNEL_SET_GC ( 'RD SINCRONIZAR_JORNAL_LOCAL',
                               Retranca,
                               Aux,
                               SALVAR_FALSE ) ;
            Aux := RD_GC_ANTIGO ( Retranca, Aux, DEBUG_FALSE ) ;
            RD_KERNEL_SET_GC2_AUTO ( Retranca, Aux ) ;
            If RD_KERNEL_GET_GC2 ( Retranca ) = '' Then Begin
               RD_KERNEL_SET_GC2 ( 'RD SINCRONIZAR_JORNAL_LOCAL',
                                      Retranca,
                                      Aux,
                                      SALVAR_FALSE ) ;
            FLAG_ATUALIZAR_ESPELHO := TRUE ;
            End ;
         End Else Begin
            PUT_LOG ( 'GC IGUAL [' + FN + ']' ) ;
         End ;
         //PUT_LOG ( 'SYNC Atualizando CONTEUDO_GC [' + Retranca + ']' ) ;
      End Else If UpperCase ( ExtractFileExt ( FN ) ) = '.GC2' Then Begin
         If Aux = '' Then Begin
            RD_KERNEL_SET_GC2 ( 'RD SINCRONIZAR_JORNAL_LOCAL',
                                   Retranca,
                                   RD_GC_ANTIGO ( Retranca,
                                                  RD_KERNEL_GET_GC(Retranca),
                                                  DEBUG_FALSE ),
                                   SALVAR_FALSE
                                 );
         End Else Begin
            RD_KERNEL_SET_GC2 ( 'RD SINCRONIZAR_JORNAL_LOCAL',
                                   Retranca,
                                   Aux,
                                   SALVAR_FALSE ) ;
         End ;
         //PUT_LOG ( 'SYNC Atualizando CONTEUDO_GC2 [' + Retranca + ']' ) ;
      End Else If UpperCase ( ExtractFileExt ( FN ) ) = '.VT' Then Begin
         RD_KERNEL_SET_VT ( Retranca, Aux ) ;
         //PUT_LOG ( 'SYNC Atualizando CONTEUDO_VT [' + Retranca + ']' ) ;
      End Else If UpperCase ( ExtractFileExt ( FN ) ) = '.OFF' Then Begin
         RD_KERNEL_SET_OFF ( Retranca, Aux ) ;
         //PUT_LOG ( 'SYNC Atualizando CONTEUDO_OFF [' + Retranca + ']' ) ;
      End Else If UpperCase ( ExtractFileExt ( FN ) ) = '.CC' Then Begin
         RD_KERNEL_SET_CC ( Retranca, Aux ) ;
         //PUT_LOG ( 'SYNC Atualizando CONTEUDO_CC [' + Retranca + ']' ) ;
      End ;
   End ;
   If ( RD_VAR_ESPELHO_ATUAL.Aberto2 ) AND
      ( Retranca = RD_VAR_ESPELHO_ATUAL.Selecionada.Retranca ) AND
      ( FLAG_ATUALIZAR_ESPELHO ) Then Begin
      //RD_MESMA_RETRANCA ;
      _Mesma_Retranca := TRUE ;
   End ;
   //PUT_LOG ( 'SYNC Or[' + Origem + '] ' +
   //          'Indice[' + IntToStr(Indice) + ']' +
   //          '[' + FN_Local + '][' + FN + ']' ) ;
   Tick := GetTickCount - Tick ;
   If Assigned ( Log ) AND ( NOT Application.Terminated ) Then Begin
      PUT_LOG_EVENTO ( Log.LB_Sync, Log.CK_Rolagem.Checked,
                       TimeToStr ( Now ) + ' ' +
                       'SYNC OK. ' + IntToStr ( Cnt_Log_Read ) + ' ' +
                       'T[' + IntToStr(Tick) + ']' +
                       //'[' + ExtractFileName(FN) + ']' +
                       '[' + FN + ']' +
                       '[' + Origem + ']' ) ;
   End ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception RD SINCRONIZAR_JORNAL_LOCAL [' + E.Message + ']' ) ;
      Tick := GetTickCount - Tick ;
      If Assigned ( Log ) AND ( NOT Application.Terminated ) Then Begin
         PUT_LOG_EVENTO ( Log.LB_Sync, Log.CK_Rolagem.Checked,
                          TimeToStr ( Now ) + ' ' +
                          'SYNC EXC ' + IntToStr ( Cnt_Log_Read ) + ' ' +
                          'T[' + IntToStr(Tick) + ']' +
                          //'[' + ExtractFileName(FN) + ']' +
                          '[' + FN + ']' +
                          '[' + Origem + ']' ) ;
      End ;
   End ;
End ;
POP_TICK ( 'RD SINCRONIZAR_JORNAL_LOCAL' ) ;
_Debug ( 'FIM RD SINCRONIZAR_JORNAL_LOCAL' ) ;
{$ENDIF}
End ;

Function TEspelho_RD.RD_GET_DIR_JORNAL_LOCAL : String ;
Begin
If Flag_Modo_RD2 Then Begin
   Result := Diretorio + 'Local\rd\jornal2\' ;
End Else If Flag_Modo_RD3 Then Begin
   Result := Diretorio + 'Local\rd\jornal3\' ;
End Else Begin
   Result := Diretorio + 'Local\rd\jornal\' ;
End ;
End ;

Procedure TEspelho_RD.RD_SET_POSICAO_CCH_RETRANCA ( _Tag : LongInt ) ;
Begin
RD_VAR_SL_POSICOES_CCH.Values[RD_VAR_ESPELHO_ATUAL.Selecionada.Retranca] := IntToStr(_Tag) ;
{
PUT_LOG ( 'RD SET_POSICAO_CCH_RETRANCA Ret[' +
          RD_VAR_ESPELHO_ATUAL.Selecionada.Retranca + '] = ' +
          IntToStr ( _Tag ) ) ;
}
End ;

Function TEspelho_RD.RD_GET_POSICAO_CCH_RETRANCA ( Ret : String ) : LongInt ;
Begin
Result := StrToIntDef ( RD_VAR_SL_POSICOES_CCH.Values[Ret], 0 ) ;
{
PUT_LOG ( 'RD GET_POSICAO_CCH_RETRANCA Ret[' +
          Ret + '] = ' +
          IntToStr ( Result ) ) ;
}
End ;

Function TEspelho_RD.RD_FN_LOCAL ( FN : String ) : String ;
Begin
FN := System.SysUtils.StringReplace ( FN,
                                      RD_GET_DIR_JORNAL_DATA,// RD_VAR_SERVIDOR,
                                      RD_GET_DIR_JORNAL_LOCAL, [rfReplaceAll] ) ;
Result := FN ;
End ;

Function TEspelho_RD.RD_GC_ANTIGO ( Retranca, Texto : String ;
                                    Debug : Boolean ) : String ;
Var SL     : TStringList ;
    Local  : LongInt ;
    Qtde   : LongInt ;
    FN     : String ;
    Gravar : Boolean ;
Begin
_Debug ( 'INI RD GC_ANTIGO Ret[ ]' + Retranca + ']' ) ;
PUSH_TICK ( 'RD GC_ANTIGO' ) ;
//
Gravar := FALSE ;
//
Texto := SUBSTITUICAO_BASICA_GC ( Texto, Retranca ) ;
If Gravar Then Begin
   FN := RD_FN_LOCAL ( RD_GET_DIR_JORNAL_LOCAL + 'Logs\gc\' + Retranca + '_1.GC2' ) ;
   PUT_CACHE_GRAVACAO ( 'RD GC_ANTIGO/1', 500, FN, Texto ) ;
   //WRITE_FILE_CORE ( 'RD GC_ANTIGO/1', FN, Texto, DELAYED_TRUE ) ;
End ;
//
Texto := Trim ( Texto ) ;
If Gravar Then Begin
   FN := RD_FN_LOCAL ( RD_GET_DIR_JORNAL_LOCAL + 'Logs\gc\' + Retranca + '_2.GC2' ) ;
   PUT_CACHE_GRAVACAO ( 'RD GC_ANTIGO/2', 500, FN, Texto ) ;
   //WRITE_FILE_CORE ( 'RD GC_ANTIGO/2', FN, Texto, DELAYED_TRUE ) ;
End ;
//
Texto := Trim ( REMOVER_BLOCOS_TEXTOS_AVULSOS ( Texto ) ) ;
If Gravar Then Begin
   FN := RD_FN_LOCAL ( RD_GET_DIR_JORNAL_LOCAL + 'Logs\gc\' + Retranca + '_3.GC2' ) ;
   PUT_CACHE_GRAVACAO ( 'RD GC_ANTIGO/3', 500, FN, Texto ) ;
   //WRITE_FILE_CORE ( 'RD GC_ANTIGO/3', FN, Texto, DELAYED_TRUE ) ;
End ;
//
Texto := Trim ( REMOVER_LINHAS_COM_COMENTARIOS ( Texto ) ) ;
If Gravar Then Begin
   FN := RD_FN_LOCAL ( RD_GET_DIR_JORNAL_LOCAL + 'Logs\gc\' + Retranca + '_3a.GC2' ) ;
   PUT_CACHE_GRAVACAO ( 'RD GC_ANTIGO/3a', 500, FN, Texto ) ;
   //WRITE_FILE_CORE ( 'RD GC_ANTIGO/3a', FN, Texto, DELAYED_TRUE ) ;
End ;
//
FN := RD_FN_LOCAL ( RD_GET_DIR_JORNAL_LOCAL + 'Logs\gc\' + Retranca + '_4.GC2' ) ;
Texto := Trim ( REMOVER_LINHAS_DUPLAS_TEXTO ( Texto ) ) ;
If Gravar Then Begin
   PUT_CACHE_GRAVACAO ( 'RD GC_ANTIGO/4', 500, FN, Texto ) ;
   //WRITE_FILE_CORE ( 'RD GC_ANTIGO/4', FN, Texto, DELAYED_TRUE ) ;
End ;
//
Texto := Trim ( REMOVER_LINHAS_VAZIAS_E_PERDIDAS ( Texto ) ) ;
If Gravar Then Begin
   FN := RD_FN_LOCAL ( RD_GET_DIR_JORNAL_LOCAL + 'Logs\gc\' + Retranca + '_5.GC2' ) ;
   PUT_CACHE_GRAVACAO ( 'RD GC_ANTIGO/5', 500, FN, Texto ) ;
   //WRITE_FILE_CORE ( 'RD GC_ANTIGO/5', FN, Texto, DELAYED_TRUE ) ;
End ;
//
Texto := Trim ( CONVERSAO_SIMPLES ( Texto ) ) ;
If Gravar Then Begin
   FN := RD_FN_LOCAL ( RD_GET_DIR_JORNAL_LOCAL + 'Logs\gc\' + Retranca + '_6.GC2' ) ;
   PUT_CACHE_GRAVACAO ( 'RD GC_ANTIGO/6', 500, FN, Texto ) ;
   //WRITE_FILE_CORE ( 'RD GC_ANTIGO/6', FN, Texto, DELAYED_TRUE ) ;
End ;
//
Texto := Trim ( CONVERSAO_SIMPLES ( Texto ) ) ;
If Gravar Then Begin
   FN := RD_FN_LOCAL ( RD_GET_DIR_JORNAL_LOCAL + 'Logs\gc\' + Retranca + '_7.GC2' ) ;
   PUT_CACHE_GRAVACAO ( 'RD GC_ANTIGO/7', 500, FN, Texto ) ;
   //WRITE_FILE_CORE ( 'RD GC_ANTIGO/7', FN, Texto, DELAYED_TRUE ) ;
End ;
//
SL := TStringList.Create ;
SL.Text := Texto ;
Qtde := SL.Count ;
If Qtde > 0 Then Begin
   For Local := Qtde - 1 DownTo 0 Do Begin
      SL[Local] := Trim ( SL[Local] ) ;
      If SL[Local] = '' Then Begin
         //SL.Delete(Local) ;
      End ;
   End ;
End ;
Result := Trim ( SL.Text ) ;
SL.Free ;
POP_TICK ( 'RD GC_ANTIGO' ) ;
_Debug ( 'FIM RD GC_ANTIGO Ret[ ]' + Retranca + ']' ) ;
End ;

Procedure TEspelho_RD.RD_MESMA_RETRANCA ;
Begin
_Debug ( 'INI MESMA RETRANCA' ) ;
PUT_LOG ( 'MESMA RETRANCA' ) ;
Try
   RD_SG_CLICK_MODO_FORCADO := TRUE ;
   RD_VAR_PROCESSAR_CHYRON := TRUE ;
   RD_EXECUTE_SG_CLICK ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception MESMA RETRANCA [' + E.Message + ']' ) ;
   End ;
End ;
_Debug ( 'FIM MESMA RETRANCA' ) ;
End ;

(*
Procedure TEspelho_RD.RD_CARREGAR_SELOS ( Tipo : LongInt ; LB1, LB2 : TListBox ) ;
Var RecDos    : TSearchRec ;
    Resultado : LongInt ;
    Dir       : String ;
    Aux       : String ;
    Lista     : TStringList ;
Begin
_Debug ( 'INI RD CARREGAR_SELOS_FIXOS' ) ;
PUSH_TICK ( 'RD CARREGAR_SELOS_FIXOS' ) ;
Aux := '[' ;
If Assigned ( LB1 ) Then Begin
   LB1.Visible := FALSE ;
   Aux := Aux + LB1.Name ;
End ;
Aux := Aux + '][' ;
If Assigned ( LB2 ) Then Begin
   LB2.Visible := FALSE ;
   Aux := Aux + LB2.Name ;
End ;
Lista := TStringList.Create ;
Lista.Clear ;
Aux := Aux + ']' ;
PUT_LOG ( 'PROC RD CARREGAR_SELOS ' + Aux ) ;
Case Tipo Of
1 : Begin
    Dir := RD_GET_DIR_JORNAL_SELOS_FIXOS ;
    End ;
2 : Begin
    Dir := RD_GET_DIR_JORNAL_SELOS_DIARIOS ;
    End ;
3 : Begin
    Dir := RD_GET_DIR_SELO_OUTROS ;
    End ;
End ;
Resultado := RR_FindFirst ( 'RD CARREGAR_SELOS', Dir + '*.*', 0, RecDos ) ;
While Resultado = 0 Do Begin
   If RecDos.Name[1] = '.' Then Begin
      Resultado := System.SysUtils.FindNext ( RecDos ) ;
      Continue ;
   End ;
   Lista.Add ( RecDos.Name + StringOfChar(#32,100) + ';' + Dir + RecDos.Name ) ;
   {
   Case Tipo Of
   1 : RD_VAR_SL_SELOS_FIXOS.Add ( RecDos.Name + StringOfChar(#32,100) + ';' +
                                   Dir + RecDos.Name ) ;
   2 : RD_VAR_SL_SELOS_FIXOS.Add ( RecDos.Name + StringOfChar(#32,100) + ';' +
                                   Dir + RecDos.Name ) ;
   End ;
   }
   Resultado := System.SysUtils.FindNext ( RecDos ) ;
End ;
System.SysUtils.FindClose ( RecDos ) ;
If Assigned ( LB1 ) Then Begin
   LB1.Items.Clear  ;
   LB1.Items.AddStrings ( Lista ) ;
   If LB1.Items.Count > 0 Then Begin
      LB1.ItemIndex := 0 ;
   End ;
   LB1.Visible := TRUE ;
End ;
If Assigned ( LB2 ) Then Begin
   LB2.Items.Clear  ;
   LB2.Items.AddStrings ( Lista ) ;
   If LB2.Items.Count > 0 Then Begin
      LB2.ItemIndex := 0 ;
   End ;
   LB2.Visible := TRUE ;
End ;
Case Tipo Of
1 : Begin
    RD_VAR_SL_SELOS_FIXOS.Clear ;
    RD_VAR_SL_SELOS_FIXOS.AddStrings ( Lista ) ;
    End ;
2 : Begin
    RD_VAR_SL_SELOS_DIARIOS.Clear ;
    RD_VAR_SL_SELOS_DIARIOS.AddStrings ( Lista ) ;
    End ;
3 : Begin
    RD_VAR_SL_SELOS_OUTROS.Clear ;
    RD_VAR_SL_SELOS_OUTROS.AddStrings ( Lista ) ;
    End ;
End ;
POP_TICK ( 'RD CARREGAR_SELOS_FIXOS' ) ;
_Debug ( 'FIM RD CARREGAR_SELOS_FIXOS' ) ;
End ;
*)

Procedure TEspelho_RD.RD_REMOVER_GC2_TODAS_AS_RETRANCAS ;
Var RecDos    : TSearchRec ;
    Resultado : LongInt ;
    Dir       : String ;
    Contador  : LongInt ;
Begin
Dir := RD_GET_DIR_JORNAL_DATA ;
Contador := 0 ;
Resultado := RR_FindFirst ( 'RD REMOVER_GC2_TODAS_AS_RETRANCAS',
                            Dir + '*.GC2', 0, RecDos ) ;
While Resultado = 0 Do Begin
   PUT_LOG ( 'FIND ' + Dir + RecDos.Name ) ;
   Inc ( Contador ) ;
   If RR_DeleteFile ( 'RD REMOVER_GC2_TODAS_AS_RETRANCAS',
                      Dir + RecDos.Name ) Then Begin
   End ;
   Resultado := System.SysUtils.FindNext ( RecDos ) ;
End ;
System.SysUtils.FindClose ( RecDos ) ;
PUT_LOG ( 'Arquivos GC2 removidos: ' + IntToStr ( Contador ) ) ;
End ;

Procedure TEspelho_RD.RD_CARREGAR_DICIONARIO_ATALHOS ( LB : TListBox ) ;
Begin
{$IFDEF USAR_CHYRON}
RD_VAR_SL_DICIONARIO_ATALHOS.Clear ;
If Assigned ( LB ) Then Begin
   LB.Items.Clear  ;
End ;
If NOT FileExists ( RD_GET_FN_DICIONARIO_ATALHOS ) Then Begin
   Exit ;
End ;
Try
   RD_VAR_SL_DICIONARIO_ATALHOS.LoadFromFile ( RD_GET_FN_DICIONARIO_ATALHOS ) ;
   If Assigned ( LB ) Then Begin
      LB.Items.AddStrings ( RD.RD_VAR_SL_DICIONARIO_ATALHOS ) ;
   End ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception RD CARREGAR_DICIONARIO_ATALHOS [' + E.Message + ']' +
                '[' + RD_GET_FN_DICIONARIO_ATALHOS + ']' ) ;
   End ;
End ;
{$ENDIF}
End ;

Procedure TEspelho_RD.RD_SALVAR_DICIONARIO_ATALHOS ( Origem : String ) ;
Begin
Try
   RD_VAR_SL_DICIONARIO_ATALHOS.SaveToFile ( RD_GET_FN_DICIONARIO_ATALHOS ) ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception RD SALVAR_DICIONARIO_ATALHOS [' + E.Message + '] ' +
                '[' + RD_GET_FN_DICIONARIO_ATALHOS + ']' ) ;
   End ;
End ;
End ;

Procedure TEspelho_RD.RD_CARREGAR_CAMPEONATOS ( CB : TComboBox ) ;
Var RecDos    : TSearchRec ;
    Resultado : LongInt ;
//    Local     : LongInt ;
    Dir       : String ;
    Aux       : String ;
Begin
Dir := RD_GET_DIR_CAMPEONATOS ;
PUT_LOG ( 'RD_CARREGAR_CAMPEONATOS [' + Dir + ']') ;
Resultado := RR_FindFirst ( 'RD_CARREGAR_CAMPEONATOS',
                            Dir + '*.dat', 0, RecDos ) ;
CB.Items.Clear ;
While Resultado = 0 Do Begin
   Aux := ExtractFileNameSemExt ( RecDos.Name ) ;
   CB.Items.Add ( Aux ) ;
   Resultado := System.SysUtils.FindNext ( RecDos ) ;
End ;
System.SysUtils.FindClose ( RecDos ) ;
//
End ;

Function TEspelho_RD.RD_IS_STR_ADD ( Str : String ) : Boolean ;
Begin
Result := RD_VAR_SL_STR_ADD.IndexOf ( Str ) > -1 ;
End ;

Procedure TEspelho_RD.RD_CARREGAR_STR_ADD ;
Var Dir       : String ;
    RecDos    : TSearchRec ;
    Resultado : LongInt ;
    FN        : String ;
    Str       : String ;
Begin
Dir := Diretorio + 'Config\' + RD_VAR_ESPELHO_ATUAL.Jornal + '\' + RD_GET_DATA_CURTA + '\' ;
Resultado := RR_FindFirst ( 'RD CARREGAR_STR_ADD', Dir + '????.DAT', 0, RecDos ) ;
RD_VAR_SL_STR_ADD.Clear ;
While Resultado = 0 Do Begin
   FN := Dir + RecDos.Name ;
   Str := GET_CONTEUDO_M( 'RD CARREGAR_STR_ADD', FN ) ;
   If Length ( Str ) >= 3 Then Begin
      RD_VAR_SL_STR_ADD.Add ( Str ) ;
   End ;
   Resultado := System.SysUtils.FindNext ( RecDos ) ;
End ;
System.SysUtils.FindClose ( RecDos ) ;
End ;

Function TEspelho_RD.RD_FN_Sem_Servidor ( FN : String ) : String ;
Begin
Result := System.SysUtils.StringReplace ( FN, RD_VAR_SERVIDOR, '{SERVIDOR}', [rfReplaceAll] ) ;
Result := System.SysUtils.StringReplace ( Result, '\', ':', [rfReplaceAll] ) ;
End ;

Function TEspelho_RD.RD_GET_DIRETORIOS ( Dir : String ) : TStringList ;
Var RecDos    : TSearchRec ;
    Resultado : LongInt ;
Begin
PUT_LOG ( 'INI Espelho_RD RD GET_DIRETORIOS [' + Dir + ']' ) ;
Result := TStringList.Create ;
Result.Clear ;
Try
   Resultado := RR_FindFirst ( 'Espelho_RD RD GET_DIRETORIOS', Dir + '*.*', faDirectory, RecDos ) ;
   //PUT_LOG ( 'Espelho_RD RD GET_DIRETORIOS [' + Dir + ']' ) ;
   While Resultado = 0 Do Begin
      If ( RecDos.Name[1] = '.' ) OR
         ( UpperCase(RecDos.Name) = 'PERFIS' ) OR
         ( UpperCase(RecDos.Name) = 'DEPOSITO' ) Then Begin
         Resultado := System.SysUtils.FindNext ( RecDos ) ;
         Continue ;
      End ;
      If ( RecDos.Attr AND faDirectory ) > 0 Then Begin
         Result.Add ( RecDos.Name ) ;
      End ;
      Resultado := System.SysUtils.FindNext ( RecDos ) ;
   End ;
   System.SysUtils.FindClose ( RecDos ) ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception Espelho_RD RD GET_DIRETORIOS ' +
                '[' + E.Message + ']' ) ;
   End ;
End ;
_Debug ( 'FIM Espelho_RD RD GET_DIRETORIOS' ) ;
End ;

Function TEspelho_RD.RD_FILTRAR_TEXTO_RD ( Str : String ) : String ;
Var Local : LongInt ;
    Lista : TStringList ;
    Qtde  : LongInt ;
    Aux   : String ;
Begin
If Trim ( Str ) = '' Then Begin
   Result := '' ;
   Exit ;
End ;
Lista := TStringList.Create ;
Lista.Text := Trim ( Str ) ;
Qtde := Lista.Count ;
For Local := 0 To Qtde - 1 Do Begin
   Aux := Lista[Local] ;
   While Pos ( #32, Aux ) = 1 Do Begin
      Delete ( Aux, 1, 1 ) ;
   End ;
   Lista[Local] := Aux ;
End ;
Str := Lista.Text ;
For Local := 40 DownTo 4 Do Begin
   Str := System.SysUtils.StringReplace ( Str, StringOfChar(#32,Local), sLinebreak, [rfReplaceAll] ) ;
End ;
For Local := 3 DownTo 2 Do Begin
   Str := System.SysUtils.StringReplace ( Str, StringOfChar(#32,Local), #32, [rfReplaceAll] ) ;
End ;
Result := Str ;
//Result := '*' + Str + '$' ;
Lista.Free ;
End ;

// ================================================================== KERNEL

Function TEspelho_RD.RD_KERNEL_LOAD_RETRANCA_CABECA ( Origem, Ret : String ) : String ;
Var FN : String ;
Begin
_Debug ( 'INI RD KERNEL_LOAD_RETRANCA_CABECA [' + Ret + ']' ) ;
FN := RD_FN_LOCAL ( RD_GET_DIR_JORNAL_DATA + Ret ) ;
If NOT RR_FileExists ( 'RD KERNEL_LOAD_RETRANCA_CABECA', FN ) Then Begin
   Result := '' ;
   Exit ;
End ;
Result := RD_KERNEL_GET_CONTEUDO ( 'RD KERNEL_LOAD_RETRANCA_CABECA/' + Origem, FN ) ;
_Debug ( 'FIM RD KERNEL_LOAD_RETRANCA_CABECA' ) ;
End ;

Function TEspelho_RD.RD_KERNEL_LOAD_RETRANCA_GC ( Origem, Ret : String ) : String ;
Var FN : String ;
Begin
_Debug ( 'INI RD KERNEL_LOAD_RETRANCA_GC [' + Ret + ']' ) ;
FN := RD_FN_LOCAL ( RD_GET_DIR_JORNAL_DATA + Ret + '.gc' ) ;
If NOT RR_FileExists ( 'RD_KERNEL_LOAD_RETRANCA_GC', FN ) Then Begin
   Result := '' ;
   Exit ;
End ;
Result := RD_KERNEL_GET_CONTEUDO ( 'RD_KERNEL_LOAD_RETRANCA_GC/' + Origem, FN ) ;
Result := RD_FILTRAR_TEXTO_RD ( Result ) ;
_Debug ( 'FIM RD KERNEL_LOAD_RETRANCA_GC' ) ;
End ;

Function TEspelho_RD.RD_KERNEL_LOAD_RETRANCA_GC2 ( Origem, Ret : String ) : String ;
Var FN : String ;
Begin
_Debug ( 'INI RD KERNEL_LOAD_RETRANCA_GC2 [' + Ret + ']' ) ;
FN := RD_FN_LOCAL ( RD_GET_DIR_JORNAL_DATA + Ret + '.gc2' ) ;
If NOT RR_FileExists ( 'RD_KERNEL_LOAD_RETRANCA_GC2', FN ) Then Begin
   Result := '' ;
   Exit ;
End ;
Result := RD_KERNEL_GET_CONTEUDO ( 'RD_KERNEL_LOAD_RETRANCA_GC2/' + Origem, FN ) ;
_Debug ( 'FIM RD KERNEL_LOAD_RETRANCA_GC2' ) ;
End ;

Function TEspelho_RD.RD_KERNEL_LOAD_RETRANCA_CC ( Origem, Ret : String ) : String ;
Var FN : String ;
Begin
_Debug ( 'INI RD KERNEL_LOAD_RETRANCA_CC [' + Ret + ']' ) ;
FN := RD_FN_LOCAL ( RD_GET_DIR_JORNAL_DATA + Ret + '.cc' ) ;
If NOT RR_FileExists ( 'RD_KERNEL_LOAD_RETRANCA_CC', FN ) Then Begin
   Result := '' ;
   Exit ;
End ;
Result := RD_KERNEL_GET_CONTEUDO ( 'RD KERNEL_LOAD_RETRANCA_CC/' + Origem, FN ) ;
_Debug ( 'FIM RD KERNEL_LOAD_RETRANCA_CC' ) ;
End ;

Function TEspelho_RD.RD_KERNEL_LOAD_RETRANCA_VT ( Origem, Ret : String ) : String ;
Var FN : String ;
Begin
_Debug ( 'INI RD KERNEL_LOAD_RETRANCA_VT [' + Ret + ']' ) ;
FN := RD_FN_LOCAL ( RD_GET_DIR_JORNAL_DATA + Ret + '.vt' ) ;
If NOT RR_FileExists ( 'RD_KERNEL_LOAD_RETRANCA_VT', FN ) Then Begin
   Result := '' ;
   Exit ;
End ;
Result := RD_KERNEL_GET_CONTEUDO ( 'RD_KERNEL_LOAD_RETRANCA_VT/' + Origem, FN ) ;
_Debug ( 'FIM RD KERNEL_LOAD_RETRANCA_VT' ) ;
End ;

Function TEspelho_RD.RD_KERNEL_LOAD_RETRANCA_OFF ( Origem, Ret : String ) : String ;
Var FN : String ;
Begin
_Debug ( 'INI RD KERNEL_LOAD_RETRANCA_OFF [' + Ret + ']' ) ;
FN := RD_FN_LOCAL ( RD_GET_DIR_JORNAL_DATA + Ret + '.off' ) ;
If NOT RR_FileExists ( 'RD_KERNEL_LOAD_RETRANCA_OFF', FN ) Then Begin
   Result := '' ;
   Exit ;
End ;
Result := RD_KERNEL_GET_CONTEUDO ( 'RD_KERNEL_LOAD_RETRANCA_OFF/' + Origem, FN ) ;
_Debug ( 'FIM RD KERNEL_LOAD_RETRANCA_OFF' ) ;
End ;

Function TEspelho_RD.RD_KERNEL_LOAD_RETRANCA_PRIORIDADE ( Origem, Ret : String ) : String ;
Var FN : String ;
Begin
_Debug ( 'INI RD KERNEL_LOAD_RETRANCA_PRIORIDADE [' + Ret + ']' ) ;
FN := RD_FN_LOCAL ( RD_GET_DIR_JORNAL_DATA + Ret + '.prioridade' ) ;
If NOT RR_FileExists ( 'RD_KERNEL_LOAD_RETRANCA_PRIORIDADE', FN ) Then Begin
   Result := '' ;
   Exit ;
End ;
Result := RD_KERNEL_GET_CONTEUDO ( 'RD_KERNEL_LOAD_RETRANCA_PRIORIDADE/' + Origem, FN ) ;
_Debug ( 'FIM RD KERNEL_LOAD_RETRANCA_PRIORIDADE' ) ;
End ;

Function TEspelho_RD.RD_KERNEL_LOAD_ESPELHO ( Origem : String ) : String ;
Var FN : String ;
Begin
_Debug ( 'INI RD KERNEL_LOAD_ESPELHO Or[' + Origem + ']' ) ;
FN := RD_FN_LOCAL ( RD_VAR_ESPELHO_ATUAL.FN_Espelho ) ;
If NOT RR_FileExists ( 'RD_KERNEL_LOAD_ESPELHO', FN ) Then Begin
   Result := '' ;
   Exit ;
End ;
Result := RD_KERNEL_GET_CONTEUDO ( 'RD_KERNEL_LOAD_ESPELHO/' + Origem, FN ) ;
_Debug ( 'FIM RD KERNEL_LOAD_ESPELHO' ) ;
End ;

Function TEspelho_RD.RD_KERNEL_GET_CONTEUDO_ULTIMO_ESPELHO_ABERTO ( Origem : String ) : String ;
Begin
Result := RD_KERNEL_GET_CONTEUDO ( 'RD_GET_CONTEUDO_ULTIMO_ESPELHO_ABERTO',
                                   RD_FN_ULTIMO_ESPELHO_ABERTO ) ;
End ;

Function TEspelho_RD.RD_KERNEL_GET_CONTEUDO_ESPELHO_ABERTO ( Origem : String ) : String ;
Begin
Result := RD_KERNEL_GET_CONTEUDO ( 'RD GET_CONTEUDO_ESPELHO_ABERTO',
                                   RD_FN_LOCAL ( RD_VAR_ESPELHO_ATUAL.FN_Espelho ) ) ;
End ;

Function TEspelho_RD.RD_KERNEL_GET_CONTEUDO ( Origem, FN : String ) : String ;
Begin
Result := GET_CONTEUDO_M ( Origem, FN ) ;
End ;

Function TEspelho_RD.RD_KERNEL_GET_CONTEUDO_JORNAL ( Origem, FN : String ) : String ;
Begin
Result := RD_KERNEL_GET_CONTEUDO ( Origem, RD_FN_LOCAL ( FN ) ) ;
End ;

Function TEspelho_RD.RD_KERNEL_FILE_AGE ( FN : String ; Var DT : TDateTime ) : String ;
Begin
FN := RD_FN_LOCAL ( FN ) ;
FileAge ( FN, DT ) ;
End ;

Function TEspelho_RD.RD_KERNEL_FILE_EXISTS_JORNAL_LOCAL ( Origem, FN : String ) : Boolean ;
Begin
Result := RR_FileExists ( 'RD KERNEL_FILE_EXISTS_JORNAL_LOCAL',
                          RD_FN_LOCAL ( FN ) ) ;
//
End ;

Function TEspelho_RD.RD_KERNEL_GET_CABECA ( Retranca : String ) : String ;
Begin
Result := Trim ( RD_VAR_ESPELHO_ATUAL.TXT_Cabeca.Values[Retranca] ) ;
End ;

Procedure TEspelho_RD.RD_KERNEL_SET_CABECA ( Origem, Retranca, Conteudo : String ;
                                             Salvar : Boolean ) ;
Var FN : String ;
Begin
Try
   RD_VAR_ESPELHO_ATUAL.TXT_Cabeca.Values[Retranca] := Trim ( Conteudo ) ;
   RD_VAR_ESPELHO_ATUAL.TXT_CABECA_LAST_PROCESSADA.Values[Retranca] := Trim ( Conteudo ) ;
   If Salvar Then Begin
      FN := RD_GET_DIR_JORNAL_DATA + Retranca ;
      PUT_LOG ( 'RD_KERNEL_SET_CABECCA [' + FN + ']' ) ;
      PUT_CACHE_GRAVACAO ( 'RD_KERNEL_SET_CABECA/' + Origem, 500, FN, Conteudo ) ;
      //WRITE_FILE_CORE ( 'RD_KERNEL_SET_CABECA/' + Origem,
      //                  FN, Conteudo, DELAYED_FALSE ) ;
   End ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception RD_KERNEL_SET_CABECA [' + E.Message + ']' )  ;
   End ;
End ;
End ;

Function TEspelho_RD.RD_KERNEL_GET_GC ( Retranca : String ) : String ;
Begin
Result := Trim ( RD_VAR_ESPELHO_ATUAL.TXT_GC.Values[Retranca] ) ;
End ;

Procedure TEspelho_RD.RD_KERNEL_SET_GC ( Origem, Retranca, Conteudo : String ;
                                         Salvar : Boolean ) ;
Var FN : String ;
Begin
Try
   RD_VAR_ESPELHO_ATUAL.TXT_GC.Values[Retranca] := Trim ( Conteudo ) ;
   RD_VAR_ESPELHO_ATUAL.TXT_GC_LAST_PROCESSADO.Values[Retranca] := Trim ( Conteudo ) ;
   If Salvar Then Begin
      FN := RD_GET_DIR_JORNAL_DATA + Retranca + '.gc' ;
      PUT_LOG ( 'RD_KERNEL_SET_GC [' + FN + ']' ) ;
      PUT_CACHE_GRAVACAO ( 'RD_KERNEL_SET_GC/' + Origem, 500, FN, Conteudo ) ;
      //WRITE_FILE_CORE ( 'RD_KERNEL_SET_GC/' + Origem,
      //                  FN, Conteudo, DELAYED_FALSE ) ;
   End ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception RD_KERNEL_SET_GC [' + E.Message + ']' )  ;
   End ;
End ;
End ;

Function TEspelho_RD.RD_KERNEL_GET_GC2 ( Retranca : String ) : String ;
Begin
Result := Trim ( RD_VAR_ESPELHO_ATUAL.TXT_GC2.Values[Retranca] ) ;
End ;

Function TEspelho_RD.RD_KERNEL_GET_GC_LAST_PROCESSADO ( Retranca : String ) : String ;
Begin
Result := Trim ( RD_VAR_ESPELHO_ATUAL.TXT_GC_LAST_PROCESSADO.Values[Retranca] ) ;
End ;

Function TEspelho_RD.RD_KERNEL_GET_GC_CABECA_PROCESSADA ( Retranca : String ) : String ;
Begin
Result := Trim ( RD_VAR_ESPELHO_ATUAL.TXT_CABECA_LAST_PROCESSADA.Values[Retranca] ) ;
End ;

Procedure TEspelho_RD.RD_KERNEL_SET_GC2 ( Origem, Retranca, Conteudo : String ;
                                          Salvar : Boolean ) ;
Var FN     : String ;
    //Indice : LongInt ;
Begin
Try
   _Debug ( 'RD KERNEL_SET_GC2 Or[' + Origem + '] ' +
            'Save[' + IFSN(Salvar) + '] ' +
            '[' + Retranca + ']=>[' + Conteudo + ']' ) ;
   RD_VAR_ESPELHO_ATUAL.TXT_GC2.Values[Retranca] := Trim ( Conteudo ) ;
   If Salvar Then Begin
      FN := RD_GET_DIR_JORNAL_DATA + Retranca + '.gc2' ;
      //PUT_LOG ( 'RD_KERNEL_SET_GC2 [' + FN + ']' ) ;
      PUT_CACHE_GRAVACAO ( 'RD_KERNEL_SET_GC2/' + Origem, 500, FN, Conteudo ) ;
      //WRITE_FILE_CORE ( 'RD_KERNEL_SET_GC2/' + Origem,
      //                  FN, Conteudo, DELAYED_FALSE ) ;
   End ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception RD_KERNEL_SET_GC2 [' + E.Message + ']' )  ;
   End ;
End ;
End ;

Function TEspelho_RD.RD_KERNEL_GET_VT ( Retranca : String ) : String ;
Begin
Result := Trim ( RD_VAR_ESPELHO_ATUAL.TXT_VT.Values[Retranca] ) ;
End ;

Procedure TEspelho_RD.RD_KERNEL_SET_VT ( Retranca, Conteudo : String ) ;
Begin
RD_VAR_ESPELHO_ATUAL.TXT_VT.Values[Retranca] := Trim ( Conteudo ) ;
End ;

Function TEspelho_RD.RD_KERNEL_GET_CC ( Retranca : String ) : String ;
Begin
Result := Trim ( RD_VAR_ESPELHO_ATUAL.TXT_CC.Values[Retranca] ) ;
End ;

Procedure TEspelho_RD.RD_KERNEL_SET_CC ( Retranca, Conteudo : String ) ;
Begin
RD_VAR_ESPELHO_ATUAL.TXT_CC.Values[Retranca] := Trim ( Conteudo ) ;
End ;

Function TEspelho_RD.RD_KERNEL_GET_OFF ( Retranca : String ) : String ;
Begin
Result := Trim ( RD_VAR_ESPELHO_ATUAL.TXT_OFF.Values[Retranca] ) ;
End ;

Procedure TEspelho_RD.RD_KERNEL_SET_OFF ( Retranca, Conteudo : String ) ;
Begin
RD_VAR_ESPELHO_ATUAL.TXT_OFF.Values[Retranca] := Trim ( Conteudo ) ;
End ;

Function TEspelho_RD.RD_KERNEL_GET_GC2_AUTO ( Retranca : String ) : String ;
Begin
Result := Trim ( RD_VAR_ESPELHO_ATUAL.TXT_GC2_AUTO.Values[Retranca] ) ;
End ;

Procedure TEspelho_RD.RD_KERNEL_SET_GC2_AUTO ( Retranca, Conteudo : String ) ;
Begin
RD_VAR_ESPELHO_ATUAL.TXT_GC2_AUTO.Values[Retranca] := Trim ( Conteudo ) ;
End ;

Function TEspelho_RD.RD_KERNEL_GET_ESPELHO : String ;
Begin
Result := Trim ( RD_VAR_ESPELHO_ATUAL.TXT_ESPELHO ) ;
End ;

Procedure TEspelho_RD.RD_KERNEL_SET_ESPELHO ( Conteudo : String ) ;
Begin
RD_VAR_ESPELHO_ATUAL.TXT_ESPELHO := Trim ( Conteudo ) ;
End ;

Function TEspelho_RD.RD_KERNEL_GET_ESPELHO_SAVE : String ;
Begin
Result := Trim ( RD_VAR_ESPELHO_ATUAL.TXT_ESPELHO_SAVE ) ;
End ;

Procedure TEspelho_RD.RD_KERNEL_SET_ESPELHO_SAVE ( Conteudo : String ) ;
Begin
RD_VAR_ESPELHO_ATUAL.TXT_ESPELHO_SAVE := Trim ( Conteudo ) ;
End ;

Function TEspelho_RD.RD_KERNEL_GET_ESPELHO_AUX : String ;
Begin
Result := Trim ( RD_VAR_ESPELHO_ATUAL.TXT_ESPELHO_AUX ) ;
End ;

Procedure TEspelho_RD.RD_KERNEL_SET_ESPELHO_AUX ( Conteudo : String ) ;
Begin
RD_VAR_ESPELHO_ATUAL.TXT_ESPELHO_AUX := Trim ( Conteudo ) ;
End ;

Function TEspelho_RD.RD_KERNEL_GET_GC2_INICIALIZADO ( Retranca : String ) : Boolean ;
Begin
Result := Trim ( RD_VAR_ESPELHO_ATUAL.TXT_GC2_INICIALIZADO.Values[Retranca] ) = '1' ;
End ;

Function TEspelho_RD.RD_KERNEL_GET_GC2_CONVERTIDO ( Retranca : String ) : String ;
Begin
Result := Trim ( RD_VAR_ESPELHO_ATUAL.GC2_CONVERTIDO.Values[Retranca] ) ;
End ;

Procedure TEspelho_RD.RD_KERNEL_SET_GC2_INICIALIZADO ( Origem, Retranca : String ) ;
Begin
//PUT_LOG ( 'RD_KERNEL_SET_GC2_INICIALIZADO [' + Retranca + ']' ) ;
RD_VAR_ESPELHO_ATUAL.TXT_GC2_INICIALIZADO.Values[Retranca] := '1' ;
End ;

Procedure TEspelho_RD.RD_KERNEL_SET_GC2_CONVERTIDO ( Origem, Retranca, Conteudo : String ) ;
Begin
//PUT_LOG ( 'RD_KERNEL_SET_GC2_CONVERTIDO [' + Retranca + ']' ) ;
RD_VAR_ESPELHO_ATUAL.GC2_CONVERTIDO.Values[Retranca] := Conteudo ;
End ;

End.

