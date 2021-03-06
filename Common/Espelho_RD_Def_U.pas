Unit Espelho_RD_Def_U ;

Interface

Uses Misc_Def_U, Misc_Const_U, Misc_Type_U,
     Winapi.Windows,
     Transparentes_U,
     Vcl.Forms,
     MyRichEdit_U,
     System.SysUtils, System.Variants, System.Classes,
     Vcl.Controls, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Samples.Spin,
     Vcl.Grids, Vcl.Dialogs, Vcl.Graphics, Vcl.ExtCtrls, Vcl.Mask ;

Const RD_ESPELHO_SG_TIPO_FULL       = 1 ;
      RD_ESPELHO_SG_TIPO_GC         = 2 ;
      RD_ESPELHO_CONTROLADOR_TRUE   = TRUE ;
      RD_ESPELHO_CONTROLADOR_FALSE  = FALSE ;
      RD_ESPELHO_CONTROLADO_TRUE    = TRUE ;
      RD_ESPELHO_CONTROLADO_FALSE   = FALSE ;
      RD_ESPELHO_CORES_TRADICIONAIS = NOT TRUE ;
      RELOAD_EDITOR_LAUDA_TRUE      = TRUE ;
      RELOAD_EDITOR_LAUDA_FALSE     = FALSE ;

      RD_BUFFER_MAIN                = 1 ;
      RD_BUFFER_SAVE                = 2 ;
      RD_BUFFER_AUX                 = 3 ;
      RD_BUFFER_LAST                = RD_BUFFER_AUX ;

      RD_TELAO_MAX_LINHAS           = 10 ;
      RD_TELAO_MAX_COLUNAS          = 10 ;

      RD_STR_INICIO                 = 'IN?CIO' ;
      RD_STR_FINAL                  = 'FIM' ;
      RD_STR_INICIO_PREVIEW         = 'PREVIEW' ;
      RD_STR_FINAL_PREVIEW          = 'FINAL PREVIEW' ;
      RD_STR_INICIO_TRAFEGO         = 'TR?FEGO' ;
      RD_STR_FINAL_TRAFEGO          = 'FINAL TR?FEGO' ;
      RD_STR_INICIO_LIXEIRA         = 'LIXEIRA' ;
      RD_STR_FINAL_LIXEIRA          = 'FINAL LIXEIRA' ;

      RD_SG_J_NO                    = 0 ;
      RD_SG_J_ANCORA                = 1 ;
      RD_SG_J_RETRANCA              = 2 ;
      RD_SG_J_TIPO                  = 3 ;
      RD_SG_J_TOTAL                 = 4 ;
      RD_SG_J_VT                    = 5 ;
      RD_SG_J_EXT                   = 6 ;
      RD_SG_J_EDITOR                = 7 ;
      RD_SG_J_GC                    = 8 ;
      RD_SG_J_ENTRADA               = 9 ;
      RD_SG_J_FITA                  = 10 ;
      RD_SG_J_STATUS                = 11 ;
      RD_SG_J_STATUS_TP             = 12 ;
      RD_SG_J_STATUS_PROTECAO       = 13 ;
      RD_SG_J_VIDEO                 = 14 ;
      RD_SG_J_STATUS_ILHA           = 15 ;
      RD_SG_J_STATUS_EDICAO         = 16 ;
      RD_SG_J_STATUS_CAT            = 17 ;

      //RD_REG_LAUDA_TEXTO            = 1 ;
      //RD_REG_LAUDA_VT               = 2 ;
      //RD_REG_LAUDA_GC               = 3 ;
      //RD_REG_LAUDA_TELAO            = 4 ;

      RD_TIPO_TEXTO                 = 0 ;
      RD_TIPO_VT                    = 1 ;
      RD_TIPO_GC                    = 2 ;
      RD_TIPO_TELAO                 = 3 ;
      RD_TIPO_VIVO                  = 4 ;

      RD_BOT_MOV_IDX                = 1 ;
      RD_BOT_MOV_SUBIR              = 2 ;
      RD_BOT_MOV_DESCER             = 3 ;
      RD_BOT_MOV_DEL                = 4 ;
      RD_BOT_MOV_ADD                = 5 ;

      RD_BOT_MOVE_SUBIR             = 1 ;
      RD_BOT_MOVE_DESCER            = 2 ;

      RD_ALTURA_PN_TEXTO            = 150 ;
      RD_ALTURA_PN_VT               = 80 ;
      RD_ALTURA_PN_VIVO             = 80 ;
      RD_ALTURA_PN_GC               = 100 ;
      RD_ALTURA_PN_TELAO            = 100 ;

      RD_COR_SECAO                  = clRed ;
      RD_COR_PN                     = clGray ;
      RD_COR_MEMO_TEXTO_FOCO        = $00D7FFFF ; // $0066FFFF ;
      RD_COR_MEMO_OBS_FOCO          = $00FFFF80 ;
      RD_COR_MEMO_TEXTO             = clWhite ; // $00D7FFFF ;
      RD_COR_MEMO_OBS               = $00FFFFE6 ;
      RD_COR_PN_FOCO                = clYellow ;
      RD_COR_BORDA                  = clBlack ;
      RD_COR_ED_OBS_FOCO            = clYellow ;
      RD_COR_ED_OBS                 = clWhite ;
      RD_COR_ED_VT                  = clWhite ;
      RD_COR_ED_VIVO                = clAmareloBebe ;
      RD_COR_PN_GC                  = clGray ;
      //
      RD_QTDE_TIPOS                 = 5 ;

      RD_ALTURA_PN                  : LongInt = 100 ;

      RD_LARGURA_BORDA              = 2 ;

      RD_DEF_QTDE_SB_BANCO          = 10 ;
      //MAX_ABAS_TARJAS               = 10 ;
      SIZE_BANCO_TARJAS_POR_ABA     = 20 ;
      SIZE_BANCO_TARJAS             = RD_DEF_QTDE_SB_BANCO * SIZE_BANCO_TARJAS_POR_ABA ;
      RD_QTDE_BOTOES_OPCOES         = 5 ;
      RD_QTDE_BOTOES_MOVIMENTO      = 5 ;
      RD_QTDE_BOTOES_MOVE           = 2 ;
      RD_MAX_MESSAGE                = 9999 ;
      RD_BANCO_INVALIDO             = 255 ;

      RD_DEF_BANCO_TARJAS_01                 = 1 ;
      RD_DEF_BANCO_TARJAS_02                 = 2 ;
      RD_DEF_BANCO_TARJAS_03                 = 3 ;
      RD_DEF_BANCO_TARJAS_04                 = 4 ;
      RD_DEF_BANCO_TARJAS_05                 = 5 ;
      RD_DEF_BANCO_TARJAS_06                 = 6 ;
      RD_DEF_BANCO_TARJAS_07                 = 7 ;
      RD_DEF_BANCO_TARJAS_08                 = 8 ;
      RD_DEF_BANCO_TARJAS_09                 = 9 ;
      RD_DEF_BANCO_TARJAS_10                 = 10 ;

      RD_MAX_JORNAIS                         = 4 ;

      MAX_BUFFER_IMG                         = 400 ;

      RD_STR_BOT_CTRL_OBS_OBS                = 'Obs' ;
      RD_STR_BOT_CTRL_OBS_LIMPAR             = 'Limpar' ;

Type
     T_SG          = Record
                     SG             : TStringGrid ;
                     Buffer         : LongInt ;
                     Salva_X        : LongInt ;
                     Salva_Y        : LongInt ;
                     Main           : Boolean ;
                     Tipo           : LongInt ; // Define o layout do grid
                     Retranca_Sel   : String ;
                     Nome           : String ;
                     Controlado     : Boolean ;
                     Controlador    : Boolean ;  // Determina se o SG controla a sele??o de retranca
                     Reload_Editor_Lauda : Boolean ;
                     End ;
     T_BUFFER_IMG  = Record
                     Jornal         : String ;
                     Key            : String ;
                     Age            : TDateTime ;
                     Bmp2           : TBitmap ;
                     FN             : String ;
                     End ;

     T_Task_SG_DblClick = Record
                       SG         : TStringGrid ;
                       Ativado    : Boolean ;
                       End ;

     T_Task_SG_Click = Record
                       SG         : TStringGrid ;
                       Buffer     : LongInt ;
                       _Tag       : LongInt ;
                       Indice     : LongInt ;
                       Open_Video : Boolean ;
                       Ativado    : Boolean ;
                       End ;

     T_SB_BANCO = Record
                  TS   : TTabsheet ;
                  SB   : TScrollBox ;
                  Qtde : LongInt ;
                  End ;
     T_SECAO_LAUDA = Record
                     Tipo             : LongInt ;
                     Ancora           : String ;
                     Qtde_Edits       : LongInt ;
                     TXT_ME           : String ;
                     TXT_OBS          : String ;
                     VT_FN            : String ;
                     VT_Duracao       : LongInt ;
                     VT_Duracao_Str   : String ;
                     VIVO_INFO        : String ;
                     VIVO_Duracao     : LongInt ;
                     VIVO_Duracao_Str : String ;
                     FN_GC            : String ;
                     COD_GC           : LongInt ;
                     GC_DESCRICAO     : String ;
                     //QTDE_ED_GC     : LongInt ;
                     ED_TXT           : Array [ 0 .. RD_MAX_EDITS - 1 ] Of String ;
                     End ;
     T_LAUDA_RNEWS = Record
                     Retranca       : String ;
                     SECAO          : Array Of T_SECAO_LAUDA ;
                     End ;
     T_PERFIL_GC   = Record
                     Ativo          : Boolean ;
                     X              : LongInt ;
                     Y              : LongInt ;
                     W              : LongInt ;
                     Caixa          : String ;
                     Descricao      : String ;
                     Alinhamento    : Char ;
                     Fonte_Name     : String ;
                     Fonte_Size     : LongInt ;
                     Fonte_Bold     : Boolean ;
                     Fonte_Italico  : Boolean ;
                     Cor_Fonte      : TColor ;
                     Cor_Excesso    : TColor ;
                     Borda          : LongInt ;
                     End ;
     T_PERFIS_GC   = Record
                     Carregado         : Boolean ;
                     Qtde_Edits        : LongInt ;
                     GC_Descricao      : String ;
                     Clock_Ativado     : Boolean ;
                     Clock_Cor         : TColor ;
                     Clock_X           : LongInt ;
                     Clock_Y           : LongInt ;
                     Clock_W           : LongInt ;
                     Clock_H           : LongInt ;
                     Clock_Font_Name   : String ;
                     Clock_Font_Size   : LongInt ;
                     Clock_Font_Bold   : Boolean ;
                     Clock_Font_Italic : Boolean ;
                     ED                : Array [ 0 .. RD_MAX_EDITS - 1 ] Of T_PERFIL_GC ;
                     End ;
     T_RD_PREVIEW  = Record
                     Cod : LongInt ;
                     Parametros : TStringList ;
                     ED1,
                     ED2,
                     ED3,
                     ED4 : String ;
                     Cmd : String ;
                     Last_ID : String ;
                     Last_Linha : LongInt ;
                     Linha_RE : LongInt ;
                     End ;
     T_RD_TEXTO    = Record
                     ME_TEXTO       : TMemo ;
                     End ;
     T_RD_TEMPOS   = Record
                     TT : LongInt ;
                     VTS : LongInt ;
                     Locucao : LongInt ;
                     Vivo : LongInt ;
                     Entrevista : LongInt ;
                     End ;
     T_RD_VT       = Record
                     PN_VT_DURACAO  : TPanel ;
                     LB_VT_DURACAO  : TLabel ;
                     ED_VT_DURACAO  : TEdit ;
                     PN_VT_FN       : TPanel ;
                     LB_VT_FN       : TLabel ;
                     ED_VT_FN       : TEdit ;
                     Bot_VT_FN      : TButton ;
                     End ;
     T_RD_VIVO     = Record
                     PN_VIVO_DURACAO  : TPanel ;
                     LB_VIVO_DURACAO  : TLabel ;
                     ED_VIVO_DURACAO  : TEdit ;
                     PN_VIVO_INFO     : TPanel ;
                     LB_VIVO_INFO     : TLabel ;
                     ED_VIVO_INFO     : TEdit ;
                     End ;
     T_RD_TELAO    = Record
                     ARRAY_Texto    : Array [1..RD_TELAO_MAX_LINHAS, 1..RD_TELAO_MAX_COLUNAS] Of String ;
                     ARRAY_Fonte    : Array [1..RD_TELAO_MAX_LINHAS, 1..RD_TELAO_MAX_COLUNAS] Of TFont ;
                     ARRAY_Alinham  : Array [1..RD_TELAO_MAX_LINHAS, 1..RD_TELAO_MAX_COLUNAS] Of LongInt ;
                     ARRAY_Grupo    : Array [1..RD_TELAO_MAX_LINHAS] Of LongInt ;
                     Base           : String ;
                     Icone          : String ;
                     Opacidade      : LongInt ; // 0-Transparente 100-Opaca
                     Temporizacao   : LongInt ; // 0-Manual ou X segundos para cada grupo
                     _Top           ,
                     _Left          ,
                     _Width         ,
                     _Height        : LongInt ; // Posi??o e dimens?es do tel?o
                     Tempo_TT       : LongInt ; // Tempo total de exibi??o
                     Canal          : LongInt ; // 1/2/3 (FrameBuffer) ou 0(Canvas)
                     End ;
     {
     T_OPCOES      = Record
                     PN_OPCOES      : TPanel ;
                     PN_MOVE        : TPanel ;
                     PN_BOTOES      : TPanel ;
                     PN_MOVIMENTO   : TPanel ;
                     BOT_MOVE       : Array [ 1 .. RD_QTDE_BOTOES_MOVE ] Of TButton ;
                     //BOT_OPCOES : Array [ 1 .. RD_QTDE_BOTOES_OPCOES ] Of TButton ;
                     //BOT_MOVIMENTO : Array [ 1 .. RD_QTDE_BOTOES_MOVIMENTO ] Of TButton ;
                     End ;
    }
    T_Banco_Tarjas = Record
                     PN_BANCO       : TPanel ;
                     PN_HEADER      : TPanel ;
                     IM_BANCO       : TImage ;
                     End ;
     T_REG_LAUDA   = Record
                     Tipo           : LongInt ; //1-Texto 2-OBS 3-VT 4-Tarja 5-Tel?o
                     //PN_SECAO       : TPanel ;
                     //PN_BORDA       : TPanel ;
                     //PN_BLOCO       : TPanel ;
                     //PN_TIPOS       : Array [ 0 .. RD_QTDE_TIPOS ] Of TPanel ;
                     //PN_OBS         : TPanel ;
                     //PN_FLAGS       : TPanel ;
                     //ED_OBS         : TEdit ;
                     //PN_RIGHT       : TPanel ;
                     //PN_LEFT        : TPanel ;
                     //PN_ESPACO_IDX  : TPanel ;
                     //PN_IDX         : TPanel ;
                     //PN_TIPO        : TPanel ;
                     //PN_ERR_ME      : TPanel ;
                     //PN_ERR_GC      : TPanel ;
                     //PN_MOVE        : TPanel ;
                     //BOT_CTRL_OBS   : TButton ;
                     //BOT_PLAY       : TButton ;
                     //BOT_REMOVE     : TButton ;
                     //BOT_FIXA       : TButton ;
                     //BOT_MENU       : TRxSpeedButton ;
                     //BOT_MOVE       : Array [ 1 .. RD_QTDE_BOTOES_MOVE ] Of TButton ;
                     TEXTO          : T_RD_TEXTO ;
                     VT             : T_RD_VT ;
                     VIVO           : T_RD_VIVO ;
                     GC             : T_RD_GC_OK ;
                     TELAO          : T_RD_TELAO ;
                     End ;
     T_Temperaturas = Record
                      Ativado : Boolean ;
                      Localidade : String ;
                      Temperatura : LongInt ;
                      Automacao : LongInt ;
                      Icone : LongInt ;
                      End ;
     T_RE          = Record
                     RE             : TRichEdit ;
                     End ;
     T_RE_MY       = Record
                     RE             : TMyRichEdit ;
                     End ;
     T_RE_GC       = Record
                     RE             : TRichEdit ;
                     End ;
     T_RE_GC_MY    = Record
                     RE             : TMyRichEdit ;
                     End ;
     T_RE_CC       = Record
                     RE             : TRichEdit ;
                     End ;
     T_RE_OFF      = Record
                     RE             : TRichEdit ;
                     End ;
     T_PN_RET      = Record
                     PN             : TPanel ;
                     End ;
     T_PN_WAIT     = Record
                     PN             : TPanel ;
                     End ;
     T_LB_TEMPO    = Record
                     LB             : TLabel ;
                     End ;
     T_Retranca    = Record
                     Registro       : T_Clip_Retranca ;
                     End ;
     T_CB_ANCORAS  = Record
                     CB             : TComboBox ;
                     End ;
     T_Ancora      = Record
                     Nome           : String ;
                     Apelido        : String ;
                     Sigla          : String ;
                     End ;

Implementation

End.

