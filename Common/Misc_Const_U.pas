Unit Misc_Const_U;

Interface

Uses Vcl.Controls, Vcl.Dialogs ;

Const

  FLAG_MODO_TASK                   = FALSE ;

  _TCP_SOB1                        = #1 ;
  _TCP_SOB2                        = #2 ;
  _TCP_SOB3                        = #3 ;
  _TCP_SOB4                        = #4 ;
  _TCP_SOD                         = #5 ;
  _TCP_EOD                         = #6 ;
  _TCP_EOB                         = #7 ;

  SG_FILA_ITEM                     = 0 ;
  SG_FILA_FN_IN                    = 1 ;
  SG_FILA_FRAMES_TT                = 2 ;
  SG_FILA_FRAMES                   = 3 ;
  SG_FILA_PERCENTUAL               = 4 ;
  SG_FILA_STATUS                   = 5 ;

  PREFIXO_AUDIO_WAV                = '_(COD_AUDIO_WAV)' ;
  PREFIXO_AUDIO_FLAC               = '_(ARQUIVO_FLAC)' ;
  PREFIXO_JSON_GOOGLE              = '_(JSON_GOOGLE)' ;

  DEF_ESCALA_HD                    = 1.7777777777778 ;

  MAX_CAMERAS                      = 100 ;
  MAX_CAMERAS_QTDE_POSICOES        = 20 ;

  SUPERVISAO_MAX_APP               = 5 ;
  SUPERVISAO_MAX_INTERFACES        = 5 ;
  SUPERVISAO_MAX_PING              = 10 ;
  SUPERVISAO_MAX_DRIVES            = 5 ;
  SUPERVISAO_MAX_AUDIO_IN          = 3 ;
  SUPERVISAO_MAX_AUDIO_OUT         = 3 ;
  SUPERVISAO_MAX_DATABASE          = 5 ;

  FF_TIPO_FFMPEG                   = 1 ;
  FF_TIPO_FFPROBE                  = 2 ;

  CONTROLES_ATIVADOS_TRUE          = TRUE ;
  CONTROLES_ATIVADOS_FALSE         = FALSE ;

  DIALOGO_TRUE                     = TRUE ;
  DIALOGO_FALSE                    = FALSE ;

  SAIR_TRUE                        = TRUE ;
  SAIR_FALSE                       = FALSE ;

  PUT_LOG_TRUE                     = TRUE ;
  PUT_LOG_FALSE                    = FALSE ;

  PLAY_TRUE                        = TRUE ;
  PLAY_FALSE                       = FALSE ;

  SUBPASTAS_TRUE                   = TRUE ;
  SUBPASTAS_FALSE                  = FALSE ;

  STATUS_TCP                       = 0 ;
  STATUS_OFFLINE                   = 1 ;
  STATUS_VELOCIDADE                = 2 ;
  STATUS_FONTE                     = 3 ;
  STATUS_RELOGIO                   = 4 ;
  STATUS_RETRANCA                  = 0 ;
  STATUS_STATUS                    = 1 ;
  STATUS_SETUP                     = 2 ;

  FORCAR_TRUE                      = TRUE ;
  FORCAR_FALSE                     = FALSE ;

  DEF_FUNCAO_GC                    = 1 ;
  DEF_FUNCAO_INDEF                 = 2 ;

  EDITAR_TRUE                      = TRUE ;
  EDITAR_FALSE                     = FALSE ;

  ADD_TRUE                         = TRUE ;
  ADD_FALSE                        = FALSE ;

  CHYRON_CONST_SEREIA              = 5 ;
  CHYRON_CONST_RELOGIO             = 10 ;
  CHYRON_CONST_MANCHETE            = 20 ;
  CHYRON_CONST_APRESENTADOR        = 20 ;
  CHYRON_CONST_GC                  = 25 ;
  CHYRON_CONST_ESCALADA            = 30 ;
  CHYRON_CONST_1_LINHA             = 40 ;
  CHYRON_CONST_1_LINHA_TITULO      = 50 ;
  CHYRON_CONST_2_LINHAS            = 60 ;
  CHYRON_CONST_A_SEGUIR            = 70 ;
  CHYRON_CONST_EQUIPE_1_NOME       = 80 ;
  CHYRON_CONST_EQUIPE_2_NOMES      = 90 ;
  CHYRON_CONST_EQUIPE_3_NOMES      = 100 ;
  CHYRON_CONST_GE_COM              = 111 ;
  CHYRON_CONST_GLOBO_PLAY          = 120 ;
  CHYRON_CONST_HASHTAG             = 130 ;
  CHYRON_CONST_INFO_1_LINHA        = 140 ;
  CHYRON_CONST_INFO_1_LINHA_FONTE  = 150 ;
  CHYRON_CONST_INFO_1_LINHA_TITULO = 160 ;
  CHYRON_CONST_INFO_2_LINHAS       = 170 ;
  CHYRON_CONST_TARJA_LOCALIDADE    = 180 ;
  CHYRON_CONST_TARJA_PLACAR        = 200 ;
  CHYRON_CONST_REP_ENTREVISTADO    = 210 ;
  CHYRON_CONST_TELESP_HASHTAG      = 220 ;
  CHYRON_CONST_TEMPO_NO_LOCAL      = 230 ;
  CHYRON_CONST_WHATSAPP            = 240 ;
  CHYRON_CONST_ENCERRAMENTO        = 250 ;
  CHYRON_CONST_SELO_G1             = 260 ;

  DEF_MAX_ESCUDOS_ANIMADOS         = 20 ;

  SUPERVISOR_PASTA_0               = 0 ;
  SUPERVISOR_PASTA_1               = 1 ;
  SUPERVISOR_PASTA_2               = 2 ;
  SUPERVISOR_PASTA_3               = 3 ;
  SUPERVISOR_PASTA_4               = 4 ;
  SUPERVISOR_PASTA_5               = 5 ;

  DEF_LOGO_SEM                     = 0 ;
  DEF_LOGO_MARCA                   = 1 ;
  DEF_LOGO_VIVO                    = 2 ;
  DEF_LOGO_EXCLUSIVO               = 3 ;
  DEF_LOGO_ARQUIVO                 = 4 ;

  MAX_BANCO_TARJAS                 = 30 ;
  MAX_BANCO_CAMERAS                = 50 ;
  MAX_BANCO_APRESENTADORES         = 30 ;
  MAX_BANCO_REPORTERES             = 30 ;

  DEF_MIN_REPETICAO_TECLAS         = 500 ;

  SIMULACAO_TRUE                   = TRUE ;
  SIMULACAO_FALSE                  = FALSE ;
  MAX_TERMINAIS_CC                 = 7 ;
  DISCO_FALSE                      = FALSE ;
  DISCO_TRUE                       = TRUE ;
  MAX_FONTES                       = 1 ;
  FORCADO                          = TRUE ;
  NAO_FORCADO                      = FALSE ;
  MAX_RETRANCAS                    = 1000 ;

      MAX_EDITS                    = 4 ;

      MAX_LINHAS_CC                = 4 ;
      SIZE_LOG_FFMPEG              = 5 ;

      PARAMETRIZAR_TRUE            = TRUE ;
      PARAMETRIZAR_FALSE           = FALSE ;

      DEF_TEMPLATE_ESCALACAO_MIN   = 1000 ;
      DEF_TEMPLATE_ESCALACAO_MAX   = 1999 ;

      FORCADO_TRUE                 = TRUE ;
      FORCADO_FALSE                = FALSE ;

      THREAD_TRUE                  = TRUE ;
      THREAD_FALSE                 = FALSE ;

      MAX_USUARIOS_DB              = 500 ;
      SIZE_BUFFER_LOGIN            = 512 * 1024 ;

      LF                           = #13#10 ;
      LFLF                         = #13#10#13#10 ;
      LFLFLF                       = #13#10#13#10#13#10 ;

      DIR_CP_ARQUIVO_LIDAS         = 'cp_deposito_entrada\' ;
      DIR_CP_ARQUIVO_RESPONDIDAS   = 'cp_deposito_respondidas\' ;
      DIR_CP_ARQUIVO_ENVIADAS      = 'cp_deposito_saida\' ;
      DIR_CP_LIXEIRA_LIDAS         = 'cp_lixeira_entrada\' ;
      DIR_CP_LIXEIRA_RESPONDIDAS   = 'cp_lixeira_respondidas\' ;
      DIR_CP_LIXEIRA_ENVIADAS      = 'cp_lixeira_saida\' ;
      DIR_CP_LIDAS                 = 'cp_entrada\' ;
      DIR_CP_NOVAS                 = 'cp_novas\' ;
      DIR_CP_NAO_ENVIADAS2         = 'cp_nao_enviadas\' ;
      DIR_CP_RESPONDIDAS           = 'cp_respondidas\' ;
      DIR_CP_ENVIADAS              = 'cp_saida\' ;
      DEF_DIR_GRITOS               = 'gritos\' ;
      DIR_DIVERSOS                 = 'diversos\' ;
      DIRET_MATERIAS               = 'materias\' ;
      DIRET_PAUTAS                 = 'pautas\' ;
      DIR_TAREFAS_CONCLUIDAS       = 'tarefas concluidas\' ;
      DIR_TAREFAS_DEPOSITO         = 'tarefas_deposito\' ;
      DIR_TAREFAS_PENDENTES        = 'tarefas_pendentes\' ;
      DIR_TRAFEGO                  = 'trafego\' ;
      _DIR_PARTICULAR              = 'particular\' ;
      DIR_LEMBRETES                = 'lembretes\' ;
      DIR_LOG_NW                   = 'log\' ;

      MAX_DIR_USUARIO              = 22 ;

      ARRAY_DIR_USUARIO            : Array [ 1 .. MAX_DIR_USUARIO ] Of String =
                                     ( DIR_CP_ARQUIVO_LIDAS ,
                                       DIR_CP_ARQUIVO_RESPONDIDAS ,
                                       DIR_CP_ARQUIVO_ENVIADAS ,
                                       DIR_CP_LIDAS ,
                                       DIR_CP_LIXEIRA_LIDAS ,
                                       DIR_CP_LIXEIRA_RESPONDIDAS ,
                                       DIR_CP_LIXEIRA_ENVIADAS ,
                                       DIR_CP_NOVAS ,
                                       DIR_CP_RESPONDIDAS ,
                                       DIR_CP_ENVIADAS ,
                                       DIR_DIVERSOS ,
                                       DEF_DIR_GRITOS,
                                       DIRET_MATERIAS ,
                                       DIRET_PAUTAS ,
                                       DIR_TAREFAS_CONCLUIDAS ,
                                       DIR_TAREFAS_DEPOSITO ,
                                       DIR_TAREFAS_PENDENTES ,
                                       DIR_TRAFEGO ,
                                       DIR_LOG_NW ,
                                       DIR_CP_NAO_ENVIADAS2 ,
                                       _DIR_PARTICULAR ,
                                       DIR_LEMBRETES ) ;

      VK_PG_DOWN                   = 34 ;
      VK_PG_UP                     = 33 ;
      VK_CEDILHA                   = 186 ;
      VK_IGUAL                     = 187 ;
      VK_PAUSE_BREAK               = 19 ;
      VK_PRINT_SCREEN              = 144 ;
      VK_SCROLL_LOCK               = 145 ;

      MODAL_TRUE                   = TRUE ;
      MODAL_FALSE                  = FALSE ;

      LIMPAR_TRUE                  = TRUE ;
      LIMPAR_FALSE                 = FALSE ;

      DEF_CCH_MAX                  = 50 ;
      DEF_CCH_MAX_LB               = 6 ;

      SIM                          = mrYes ;
      NAO                          = mrNo ;

      MACRO_TRUE                   = TRUE ;
      MACRO_FALSE                  = FALSE ;

      CHAR_RICARDO                 = #0 ;
      SG_AVISOS_No                 = 0 ;
      SG_AVISOS_DATA_HORA          = 1 ;
      SG_AVISOS_QUEM_AVISA         = 2 ;
      SG_AVISOS_MENSAGEM           = 3 ;
      SG_AVISOS_TEXTO              = 4 ;

      EXECUTAR_TRUE                = TRUE ;
      EXECUTAR_FALSE               = FALSE ;
      AGENDAR_TRUE                 = TRUE ;
      AGENDAR_FALSE                = FALSE ;

      DEF_MSG_CHYRON_SELO_2        = 2 ;
      DEF_MSG_CHYRON_TELAO         = 3 ;
      DEF_MSG_CHYRON_INFO1         = 5 ;
      DEF_MSG_CHYRON_INFO2         = 6 ;
      DEF_MSG_CHYRON_INFO3         = 7 ;
      DEF_MSG_CHYRON_RELOGIO       = 10 ;
      DEF_MSG_CHYRON_SELO          = 11 ;
      DEF_MSG_CHYRON_INFORMACAO_1  = 12 ;
      DEF_MSG_CHYRON_INFORMACAO_2  = 13 ;
      DEF_MSG_CHYRON_INFORMACAO_3  = 14 ;
      DEF_MSG_CHYRON_SEREIA        = 15 ;
      DEF_MSG_CHYRON_SELO1         = 17 ;
      DEF_MSG_CHYRON_SELO2         = 16 ;
      DEF_MSG_CHYRON_SELO3         = 18 ;
      DEF_MSG_CHYRON_TEMP_DIRETA   = 19 ;
      DEF_MSG_CHYRON_APRESENTADOR  = 20 ;
      DEF_MSG_CHYRON_GC            = 21 ;
      DEF_MSG_CHYRON_FIXA          = 22 ;
      DEF_MSG_CHYRON_RODIZIO_TEMP  = 23 ;
      DEF_MSG_CHYRON_MOV1          = 24 ;
      DEF_MSG_CHYRON_MOV2          = 25 ;
      DEF_MSG_CHYRON_MOV3          = 26 ;
      DEF_MSG_CHYRON_VEMVEM        = 27 ;
      DEF_MSG_CHYRON_MANCHETE      = 31 ;
      DEF_MSG_CHYRON_EMOJI_1       = 32 ;
      DEF_MSG_CHYRON_EMOJI_2       = 33 ;
      DEF_MSG_CHYRON_EMOJI_3       = 34 ;
      DEF_MSG_CHYRON_EMOJI_4       = 35 ;
      DEF_MSG_CHYRON_EMOJI_5       = 36 ;
      DEF_MSG_CHYRON_EMOJI_6       = 37 ;
      DEF_MSG_CHYRON_EMOJI_7       = 38 ;
      DEF_MSG_CHYRON_EMOJI_8       = 39 ;
      DEF_MSG_CHYRON_EMOJI_9       = 40 ;
      DEF_MSG_CHYRON_EMOJI_10      = 41 ;
      DEF_MSG_CHYRON_EMOJI_11      = 42 ;
      DEF_MSG_CHYRON_EMOJI_12      = 43 ;
      DEF_MSG_CHYRON_GE_INFO       = 61 ;
      DEF_MSG_CHYRON_GE_ENTREVIST  = 62 ;
      DEF_MSG_CHYRON_GE_REPORTER   = 63 ;
      DEF_MSG_CHYRON_LETTERING_1L  = 64 ;
      DEF_MSG_CHYRON_LETTERING_1LT = 65 ;
      DEF_MSG_CHYRON_LETTERING_2L  = 66 ;
      DEF_MSG_CHYRON_A_SEGUIR      = 72 ;
      DEF_MSG_CHYRON_LOGO_VIVO     = 73 ;
      DEF_MSG_CHYRON_LOGO_MARC     = 74 ;
      DEF_MSG_CHYRON_LOGO_REMOVE   = 75 ;
      DEF_MSG_CHYRON_LOGO_EXCLUSIVO= 76 ;
      DEF_MSG_CHYRON_LOGO_ARQUIVO  = 77 ;

      DEF_MSG_CHYRON_IMAGENS_1     = 81 ;
      DEF_MSG_CHYRON_IMAGENS_2     = 82 ;
      DEF_MSG_CHYRON_IMAGENS_3     = 83 ;
      DEF_MSG_CHYRON_EDICAO_1      = 91 ;
      DEF_MSG_CHYRON_EDICAO_2      = 92 ;
      DEF_MSG_CHYRON_EDICAO_3      = 93 ;
      DEF_MSG_CHYRON_G1            = 110 ;
      DEF_MSG_CHYRON_CONF1         = 121 ;
      DEF_MSG_CHYRON_CONF2         = 122 ;
      DEF_MSG_CHYRON_CONF3         = 123 ;
      DEF_MSG_CHYRON_CONF4         = 124 ;
      DEF_MSG_CHYRON_TS            = 239 ;
      DEF_MSG_CHYRON_WHATSAPP      = 240 ;
      DEF_MSG_CHYRON_TELESPECTADOR = 220 ;
      DEF_MSG_CHYRON_EMAIL         = 241 ;
      DEF_MSG_CHYRON_TELEFONE      = 242 ;
      DEF_MSG_CHYRON_CAMERA        = 244 ;
      DEF_MSG_CHYRON_TEMPERATURA   = 245 ;
      DEF_MSG_CHYRON_COMENTARIO    = 888 ;
      DEF_MSG_CHYRON_INDEF         = 999 ;
      DEF_MSG_CHYRON_SYS_CGV       = 5021 ;
      DEF_MSG_CHYRON_SYS_INFO      = 5086 ;
      DEF_MSG_CHYRON_FAKE          = 9999 ;

      EXIBE_SELO_TRUE              = TRUE ;
      EXIBE_SELO_FALSE             = FALSE ;

      PREVIEW_TRUE                 = TRUE ;
      PREVIEW_FALSE                = FALSE ;

      PREVIEW_IMG_TRUE             = TRUE ;
      PREVIEW_IMG_FALSE            = FALSE ;

      INCLUIR_NAME_TRUE            = TRUE ;
      INCLUIR_NAME_FALSE           = FALSE ;

      RD_MAX_SECOES                = 3 ;
      RD_MAX_EDITS                 = 4 ;

      PRESERVAR_CONTEXTO_TRUE      = TRUE ;
      PRESERVAR_CONTEXTO_FALSE     = FALSE ;

      SETAR_FOCO_TRUE              = TRUE ;
      SETAR_FOCO_FALSE             = FALSE ;

      Bool_Login                   = TRUE ;
      Bool_LogOut                  = FALSE ;
      _MODO_DEMO                   : Boolean = FALSE ;

      MODO_TP_TRUE                 = TRUE ;
      MODO_TP_FALSE                = FALSE ;


      ACAO_SUBSTITUICAO_A1         = 1 ;
      ACAO_SUBSTITUICAO_A2         = 2 ;
      ACAO_SUBSTITUICAO_A3         = 3 ;
      ACAO_SUBSTITUICAO_B1         = 4 ;
      ACAO_SUBSTITUICAO_B2         = 5 ;
      ACAO_SUBSTITUICAO_B3         = 6 ;
      ACAO_AMARELO_A               = 7 ;
      ACAO_AMARELO_B               = 8 ;
      ACAO_VERMELHO_A              = 9 ;
      ACAO_VERMELHO_B              = 10 ;
      ACAO_GOL_A                   = 11 ;
      ACAO_GOL_B                   = 12 ;
      ACAO_PLAY_FOGUETE_1          = 13 ;
      ACAO_PLAY_FOGUETE_2          = 14 ;
      ACAO_PLAY_FOGUETE_3          = 15 ;
      ACAO_PLAY_FOGUETE_4          = 16 ;
      ACAO_PLAY_FOGUETE_5          = 17 ;
      ACAO_PLAY_FOGUETE_6          = 18 ;
      ACAO_READ_BOLINHA_1          = 19 ;
      ACAO_READ_BOLINHA_2          = 20 ;
      ACAO_READ_BOLINHA_3          = 21 ;
      ACAO_READ_BOLINHA_4          = 22 ;
      ACAO_READ_BOLINHA_5          = 23 ;
      ACAO_READ_BOLINHA_6          = 24 ;
      ACAO_ESCALACAO_A             = 25 ;
      ACAO_ESCALACAO_B             = 26 ;
      ACAO_REPORTER_1              = 27 ;
      ACAO_REPORTER_2              = 28 ;
      ACAO_REPORTER_3              = 29 ;
      ACAO_COMENTARISTA_1          = 30 ;
      ACAO_COMENTARISTA_2          = 31 ;
      ACAO_COMENTARISTA_3          = 32 ;
      ACAO_PLACAR_INICIO_1         = 33 ;
      ACAO_PLACAR_INICIO_2         = 34 ;
      ACAO_PLACAR_ESCONDE          = 35 ;
      ACAO_PLACAR_MOSTRA           = 36 ;
      ACAO_PLACAR_ACRESCIMO_ON     = 37 ;
      ACAO_PATROCINIO_ACRESCIMO_2  = 38 ;
      ACAO_PLACAR_SET_TIMER        = 39 ;
      ACAO_PATROCINIO_ENCERRAMENTO = 40 ;
      ACAO_ESTATISTICA             = 41 ;
      ACAO_CLEAR_FB1               = 42 ;
      ACAO_CLEAR_FB2               = 43 ;
      ACAO_REMOVER_VOLATEIS        = 44 ;
      ACAO_PLAY                    = 45 ;
      ACAO_PLAY_FB1                = 46 ;
      ACAO_PLAY_FB2                = 47 ;
      ACAO_ATUALIZAR_PLACAR        = 48 ;
      ACAO_JOGO_EM_ANDAMENTO       = 49 ;
      ACAO_ARBITRAGEM              = 50 ;
     // ACAO_F5                      = 51 ;
      ACAO_PLACAR_UPDATE           = 52 ;
      ACAO_PLAY_FOGUETE            = 53 ;
      ACAO_FUT_ESCONDER_TUDO       = 54 ;
      ACAO_ATUALIZACAO_FUTEBOL     = 55 ;
      ACAO_SELECT_FB1              = 56 ;
      ACAO_SELECT_FB2              = 57 ;
      ACAO_SCRIPT                  = 58 ;
      ACAO_PLACAR_INICIO_3         = 59 ;
      ACAO_PLACAR_INICIO_4         = 60 ;
      ACAO_REPORTER_4              = 61 ;
      ACAO_REPORTER_5              = 62 ;
      ACAO_COMENTARISTA_4          = 63 ;
      ACAO_COMENTARISTA_5          = 64 ;
      ACAO_READ_BOLINHA            = 65 ;
      ACAO_SEREIA_MARCA_DAGUA      = 66 ;
      ACAO_SEREIA_AO_VIVO          = 67 ;
      ACAO_SEREIA_EXCLUSIVO        = 68 ;
      ACAO_SEREIA_ARQUIVO          = 69 ;
      ACAO_SEREIA_REMOVER          = 70 ;
      ACAO_PLACAR_ALTERNA          = 71 ;
      ACAO_SEGUNDO_AMARELO_A       = 72 ;
      ACAO_SEGUNDO_AMARELO_B       = 73 ;
      ACAO_REMOVER_VOLATEIS_FB2    = 74 ;
      ACAO_REALIZACAO_TVM          = 75 ;
      ACAO_REALIZACAO_CURTA        = 76 ;
      ACAO_F5_FB1                  = 77 ;
      ACAO_F5_FB2                  = 78 ;
      ACAO_F5_FB1_ESCALACAO        = 79 ;
      ACAO_CLASSIFICACAO_PATROCIN  = 80 ;
      ACAO_PENALTI                 = 81 ;
      ACAO_PATROCINIO_ACRESCIMO_1  = 82 ;
      ACAO_VINHETA_NARRADORES      = 83 ;
      ACAO_CLASSIFICACAO_RODAPE    = 84 ;
      ACAO_TELA_DIVIDIDA           = 85 ;
      ACAO_CONFRONTO_PATROCINADO   = 90 ;
      ACAO_CAMPEAO_MANDANTE        = 91 ;
      ACAO_CAMPEAO_NAO_MANDANTE    = 92 ;
      ACAO_CONFRONTO_RODAPE        = 93 ;
      ACAO_PENALTIS_INICIAR_ARTE   = 94 ;
      ACAO_PENALTIS_BATIDA         = 95 ;
      ACAO_PENALTIS_CLEAR          = 96 ;
      ACAO_REM_TUDO                = 97 ;
      ACAO_PENALTIS_EO             = 98 ;
      ACAO_CONFRONTOS_RODAPE_EO    = 99 ;
      ACAO_CONFRONTOS_PATROC_EO    = 100 ;
      ACAO_TELA_DIVIDIDA_EO        = 101 ;
      ACAO_ARBITRAGEM_VAR          = 102 ;
      ACAO_REALIZACAO_GLOBO        = 103 ;
      ACAO_CRAQUE_ENDERECO         = 110 ;
      ACAO_CRAQUE_PARCIAL          = 111 ;
      ACAO_CRAQUE_FINAL            = 112 ;
      ACAO_CRAQUE_VENCEDOR         = 113 ;
      ACAO_CRAQUE_CARIMBO          = 114 ;

      MODO_MATERIA_TRUE            = TRUE ;
      MODO_MATERIA_FALSE           = FALSE ;

      AVANCAR_PAGINA_TRUE          = TRUE ;
      AVANCAR_PAGINA_FALSE         = FALSE ;

      APENAS_CARREGAR_TRUE         = TRUE ;
      APENAS_CARREGAR_FALSE        = FALSE ;

      DEBUG_TRUE                   = TRUE ;
      DEBUG_FALSE                  = FALSE ;

      LIVRE_TRUE                   = TRUE ;
      LIVRE_FALSE                  = FALSE ;

      MAX_AVISOS                   = 100 + 1 ;
      SIZE_SENHA                   = 3 ; // 6 ;
      MAX_JORNAIS                  = 50 ;
      MAX_ESPELHOS                 = 200 ;
      MAX_USUARIOS                 = 500 ;
      MAX_EMPRESAS                 = 50 ;
      MAX_MSG_CP                   = 2000 ;

      MODAL_SIM                    = 1 ;
      MODAL_NAO                    = 2 ;
      MODAL_ABANDONAR              = 3 ;
      MODAL_CANCELAR               = 4 ;
      MODAL_CONTINUAR              = 5 ;
      MODAL_SALVAR                 = 6 ;
      MODAL_SAIR                   = 7 ;
      MODAL_REPETIR                = 8 ;
      MODAL_ABORTAR                = 9 ;

      TL_LIDAS                     = 1 ;
      TL_NOVAS                     = 2 ;
      TL_ENVIADAS                  = 3 ;
      TL_RESPONDIDAS               = 4 ;
      TL_ARQUIVO_LIDAS             = 5 ;
      TL_ARQUIVO_ENVIADAS          = 6 ;
      TL_ARQUIVO_RESPONDIDAS       = 7 ;
      TL_LIXEIRA_LIDAS             = 8 ;
      TL_LIXEIRA_ENVIADAS          = 9 ;
      TL_LIXEIRA_RESPONDIDAS       = 10 ;
      TL_NAO_ENVIADAS              = 11 ;

      MAX_RESUMOS                  = 10 ;
      MAX_DENUNCIAS                = 100 + 1 ;
      MAX_PAREDE_DE_RECADOS        = 100 ;

      SG_HIST_GRITOS_HORARIO       = 0 ;
      SG_HIST_GRITOS_REMETENTE     = 1 ;
      SG_HIST_GRITOS_DEST_LOGIN    = 2 ;
      SG_HIST_GRITOS_COMPUTADOR    = 3 ;
      SG_HIST_GRITOS_LINK          = 4 ;
      SG_HIST_GRITOS_DEST_NOME     = 5 ;
      SG_HIST_GRITOS_DEST_CODIGO   = 6 ;
      SG_HIST_GRITOS_TEXTO         = 7 ;

      SG_Previsoes_Horario         = 0 ;
      SG_Previsoes_Equipe          = 1 ;
      SG_Previsoes_Pauta           = 2 ;
      SG_Previsoes_Status          = 3 ;
      SG_Previsoes_Obs             = 4 ;
      SG_Previsoes_FileName        = 5 ;

      SG_Escalas_No                = 0 ;
      SG_Escalas_C1                = 1 ;
      SG_Escalas_C2                = 2 ;
      SG_Escalas_C3                = 3 ;
      SG_Escalas_C4                = 4 ;
      SG_Escalas_C5                = 5 ;
      SG_Escalas_C6                = 6 ;

      SG_Pesquisa_Item             = 0 ;
      SG_Pesquisa_Tipo             = 1 ;
      SG_Pesquisa_Arquivo          = 2 ;
      SG_Pesquisa_Tamanho          = 3 ;
      SG_Pesquisa_Modificacao      = 4 ;
      SG_Pesquisa_Diretorio        = 5 ;

      SG_Relat_No                  = 0 ;
      SG_Relat_Tipo                = 1 ;
      SG_Relat_Editor              = 2 ;
      SG_Relat_Modif               = 3 ;

      SG_CONECTADOS_NO             = 0 ;
      SG_CONECTADOS_USUARIO        = 1 ;
      SG_CONECTADOS_COMPUTADOR     = 2 ;
      SG_CONECTADOS_LOGIN          = 3 ;
      SG_CONECTADOS_FLASH          = 4 ;
      SG_CONECTADOS_STATUS         = 5 ;

      SG_Mat_No                    = 0 ;
      SG_Mat_Jornal                = 1 ;
      SG_Mat_Nome                  = 2 ;
      SG_Mat_Criacao               = 3 ;
      SG_Mat_Modificacao           = 4 ;
      SG_Mat_Editor                = 5 ;
      SG_Mat_Rep                   = 6 ;
      SG_Mat_Data                  = 7 ;
      SG_Mat_Codigo                = 8 ;
      SG_Mat_Prot                  = 9 ;

      SG_P_No                      = 0 ;
      SG_P_Jornal                  = 1 ;
      SG_P_Nome                    = 2 ;
      SG_P_Data                    = 3 ;
      SG_P_DDS_Editor              = 4 ;
      SG_P_Hora                    = 5 ;
      SG_P_Time                    = 6 ;
      SG_P_Time2                   = 7 ;
      SG_P_Data2                   = 8 ;
      SG_P_Categoria               = 9 ;
      SG_P_Codigo                  = 10 ;
      SG_P_Script                  = 11 ;
      SG_P_Prot                    = 12 ;

      SG_CP_NO                     = 0 ;
      SG_CP_DATA                   = 1 ;
      SG_CP_ORIGEM                 = 2 ;
      SG_CP_ASSUNTO                = 3 ;
      SG_CP_TAMANHO                = 4 ;
      SG_CP_ARQUIVO                = 5 ;

      MAX_TICK_MONITOR             = 20 ;

      ST_DESCONEXAO                = 0 ;
      ST_GERAL                     = 1 ;
      ST_STATUS                    = 2 ;
      ST_SECAO                     = 3 ;
      ST_CONEXAO                   = 4 ;
      ST_RELOGIO                   = 5 ;

      _ACIMA                       = 1 ;
      _ABAIXO                      = 2 ;

      GC_MARCANDO                  : Boolean = FALSE ;
      GC_DESMARCANDO               : Boolean = TRUE ;

      MAX_EQUIPES_RESUMOS          = 20 ;

      TIMEOUT_PROXIMO_JORNAL_DEFAULT     = 02 * 60000 ;
      TIMEOUT_CHECAGEM_RETRANCA_DEFAULT  = 05 *  1000 ;
      TIMEOUT_SETTIME_DEFAULT            = 60 *  1000 ;
      TIMEOUT_MONITOR_DEFAULT            = 120 * 15 * 60000 ;
      TIMEOUT_POSICAO_MICRO_DEFAULT      = 10 *  1000 ;
      TIMEOUT_EDITOR_RETRANCAS_DEFAULT   = 02 * 60000 ;
      TIMEOUT_EDITOR_PRIORIDADE_DEFAULT  = 01 * 60000 ;
      TIMEOUT_CHECAGEM_SAIA_DEFAULT      = 10 *  1000 ;
      DELAY_NET_SETTIME_DEFAULT          = 2 * 1000 ;
      TIMER_VERIFICA_JORNAIS_DEFAULT     = 1200 ;
      TIMER_VERIFICA_MATERIAS_DEFAULT    = 5000 ;
      TIMER_VERIFICA_PAUTAS_DEFAULT      = 5000 ;
      TIMER_VERIFICA_OUTROS_DEFAULT      = 10000 ;
      INTERVALO_RELOGIO_DEFAULT          = 950 ;
      INTERVALO_TIMER_VERIFICA_DEFAULT   = 1000 ;

      SG_Resumo_Codigo_Horario     = 0 ;
      SG_Resumo_Reporter_Pauta     = 1 ;
      SG_Resumo_Equipe_Jornal_OBS  = 2 ;
      SG_Resumo_FileName           = 3 ;
      SG_Resumo_Evento             = 4 ;

      _RTM_GENERICO                = 1 ;
      _RTM_RELOGIO_TIMER           = 2 ;
      _RTM_RETRANCAS               = 3 ;
      _RTM_VERIFICAR_ESPELHO       = 4 ;
      _RTM_SG_J_CLICK              = 5 ;
      _RTM_SALVAR_ESPELHO          = 6 ;
      _RTM_BACKUP_ESPELHO          = 7 ;

      _1KB                         = 1024 ;
      _1MB                         = 1024 * 1024 ;
      _1GB                         = 1024 * 1024 * 1024 ;

      LARGURA_MAXIMA_MAPA_DEFAULT  = 19440 ;
      ALTURA_MAXIMA_MAPA_DEFAULT   = 10660 ;
      ALTURA_NORMAL_MAPA_DEFAULT   = 461 ;
      LARGURA_NORMAL_MAPA_DEFAULT  = 753 ;
      FATOR_POSICIONAMENTO_DEFAULT = 25 ;
      LATITUDE_TORRE_SVM_DEFAULT   = 250 ;
      LONGITUDE_TORRE_SVM_DEFAULT  = 250 ;

      MAX_TRAFEGO                  = 100 ;

      Num_Arquivos_Sys             = 1 ;
      Num_Arquivos_Del             = 3 ;

      MAX_COL_SG_J                 = 20 ;

      PERFORMANCE_BAIXA_DEFAULT    = 90000 ;
      PERFORMANCE_MINIMA_DEFAULT   = 60000 ;

      Arquivos_Sys                 : Array [ 1 .. NUM_Arquivos_Sys ] Of String =
                                     ( 'Ancoras.Txt' ) ;
      Arquivos_Del                 : Array [ 1 .. NUM_Arquivos_Del ] Of String =
                                     ( 'Ancoras.Txt' , 'Retranca.Txt' , 'Espelho.Txt' ) ;

      TAB                          = #9 ;
      ESC                          = #27 ;
      ENTER                        = #13 ;
      KEY_INS                      = #45 ;
      KEY_DEL                      = #46 ;
      KEY_SETA_UP                  = #38 ;
      KEY_SETA_DOWN                = #40 ;
      KEY_HOME_2                   = 36 ;
      KEY_END_2                    = 35 ;
      KEY_PGUP_2                   = 33 ;
      KEY_PGDN_2                   = 34 ;
      KEY_INS_2                    = 45 ;
      KEY_DEL_2                    = 46 ;
      KEY_LEFT_2                   = 37 ;
      KEY_UP_2                     = 38 ;
      KEY_RIGHT_2                  = 39 ;
      KEY_DOWN_2                   = 40 ;
      KEY_SCROLLLOCK_2             = 145 ;
      KEY_PAUSE                    = 19 ;
      KEY_F1_2                     = 112 ;
      KEY_F2_2                     = 113 ;
      KEY_F3_2                     = 114 ;
      KEY_F4_2                     = 115 ;
      KEY_F5_2                     = 116 ;
      KEY_F6_2                     = 117 ;
      KEY_F7_2                     = 118 ;
      KEY_F8_2                     = 119 ;
      KEY_F9_2                     = 120 ;
      KEY_F10_2                    = 121 ;
      KEY_F11_2                    = 122 ;
      KEY_F12_2                    = 123 ;

      // Flags de Telejornalismo (NW)
      J_INICIO                     = 1 ;
      J_FIM                        = 2 ;
      J_PREVIEW                    = 3 ;
      J_FINAL_PREVIEW              = 4 ;
      J_COMERCIAL                  = 5 ;
      J_NORMAL                     = 6 ;
      J_BR                         = 9 ;
      J_PROTEGIDA                  = 10 ;
      J_EDICAO                     = 11 ;
      J_MOVENDO                    = 12 ;
      J_REMOVENDO                  = 13 ;
      J_COLANDO                    = 14 ;
      {      J_LIXEIRA             = 15 ;
      J_FINAL_LIXEIRA              = 16 ;}
      {      J_TRAFEGO             = 17 ;
      J_FINAL_TRAFEGO              = 18 ;}

      J_TP_NORMAL                  = 0 ;
      J_TP_PLAY                    = 1 ;
      J_TP_CUE                     = 2 ;

      CT_EDITOR_ESPELHO            = 1 ;
      CT_EDITOR_MATERIAS           = 2 ;
      CT_EDITOR_PAUTAS             = 3 ;

      MODAL_VAZIO                  = 1 ;
      MODAL_OK                     = 2 ;

      TRANSMITIR_ON                = TRUE ;
      TRANSMITIR_OFF               = FALSE ;
      REGISTRAR_ON                 = TRUE ;
      REGISTRAR_OFF                = FALSE ;
      SALVAR_TRUE                  = TRUE ;
      SALVAR_FALSE                 = FALSE ;

      DELAYED_FALSE                = FALSE ;
      DELAYED_TRUE                 = TRUE ;

      CCH_ALTURA_LINHA_MEMO        = 22 ;

      clRedBebe                    = $008080FF ;
      clLimeBebe                   = $00CAFFCA ;
      clLaranja                    = $000080FF ;
      clOrange                     = $000080FF ;
      clAmareloBebe                = $0080FFFF ;
      clVerdeBebe                  = $0080FF80 ;
      clVermelhoBebe               = $00D5D5FF ;
      clAzulBebe                   = $00FFFFB9 ;
      clSalmom                     = $008080FF ;
      clRoseo                      = $008000FF ;
      clRoseoClaro                 = $00FF80FF ;
      clCorEdicao                  = $0080FFFF ;
      clGreenClaro                 = $0000BB00 ;
      clGreenEscuro                = $00004200 ;
      clRedClaro                   = $006666FF ;
      clRedEscuro                  = $000000CC ;
      clCinzaClaro                 = $00E0E0E0 ;

      SG_MSG_No                    = 0 ;
      SG_MSG_Sentido               = 1 ;
      SG_MSG_Lida                  = 2 ;
      SG_MSG_Status                = 3 ;
      SG_MSG_Origem                = 4 ;
      SG_MSG_Destino               = 5 ;
      SG_MSG_Assunto               = 6 ;
      SG_MSG_Data_RX               = 7 ;
      SG_MSG_Data_TX               = 8 ;
      SG_MSG_Codigo                = 9 ;
      SG_MSG_Conteudo              = 10 ;

      MAX_CAMPOS_POR_TAG           = 5 ;

      RELOAD_FALSE                 = FALSE ;
      RELOAD_TRUE                  = TRUE ;

      MAIN_TRUE                    = TRUE ;
      MAIN_FALSE                   = FALSE ;

      OPEN_VIDEO_FALSE             = FALSE ;
      OPEN_VIDEO_TRUE              = TRUE ;

      SG_J_NO                      = 0 ;
      SG_J_GC                      = 1 ;
      SG_J_ANCORA                  = 2 ;
      SG_J_RETRANCA                = 3 ;
      SG_J_TIPO                    = 4 ;
      SG_J_TOTAL                   = 5 ;
      SG_J_VT                      = 6 ;
      SG_J_EXT                     = 7 ;
      SG_J_EDITOR                  = 8 ;
      SG_J_ENTRADA                 = 9 ;
      SG_J_FITA                    = 10 ;
      SG_J_STATUS                  = 11 ;
      SG_J_STATUS_TP               = 12 ;
      SG_J_STATUS_PROTECAO	        = 13 ;
      SG_J_VIDEO                   = 14 ;
      SG_J_STATUS_ILHA             = 15 ;
      SG_J_STATUS_EDICAO           = 16 ;
      SG_J_STATUS_CAT              = 17 ;

      {
      SG_J_NO                      = 0 ;
      SG_COL_ANCORA                = 1 ;
      SG_J_RETRANCA                = 2 ;
      SG_J_TIPO                    = 3 ;
      SG_J_TOTAL                   = 4 ;
      SG_J_VT                      = 5 ;
      SG_J_EXT                     = 6 ;
      SG_J_EDITOR                  = 7 ;
      SG_J_GC                      = 8 ;
      SG_J_ENTRADA                 = 9 ;
      SG_J_FITA                    = 10 ;
      SG_J_STATUS                  = 11 ;
      SG_J_STATUS_TP               = 12 ;
      SG_J_STATUS_PROTECAO	        = 13 ;
      SG_J_VIDEO                   = 14 ;
      SG_J_STATUS_ILHA             = 15 ;
      SG_J_STATUS_EDICAO           = 16 ;
      SG_J_STATUS_CAT              = 17 ;
      }

      MAX_ENTREVISTADOS            = 10 ;
      MAX_ANCORAS                  = 100 ;

      SIZE_NOME_RETRANCA           = 15 ; // 50
      MAX_LAUDAS_SCRIPT_NEWS       = 100 ;

      SOBREPOE                     = FALSE ;
      NAO_SOBREPOE                 = TRUE ;

      CABECA_PROTEGIDA_TRUE        = TRUE ;
      CABECA_PROTEGIDA_FALSE       = FALSE ;

      //MAX_CLIENTES               = 9999 ;
      //MAX_ENTIDADES              = 500 ;
      //MAX_SITES_CLIENTE          = 200 ;

      {$IFDEF NW}
      MODO_NAO_RICARDO_FORCADO     : Boolean = FALSE ;
      MODO_RICARDO_FORCADO         : Boolean = FALSE ;
      MODO_RICARDO_REAL_FORCADO    : Boolean = FALSE ;
      {$ELSE}
      MODO_NAO_RICARDO_FORCADO     : Boolean = FALSE ;
      MODO_RICARDO_FORCADO         : Boolean = FALSE ;
      MODO_RICARDO_REAL_FORCADO    : Boolean = FALSE ;
      {$ENDIF}

      NUMERAIS                     = '0123456789' ;
      ALFABETO                     = 'abcdefghijklmnopqrstuvwxyz' +
                                     'ABCDEFGHIJKLMNOPQRSTUVWXYZ' ;
      ACENTUADOS                   = '¡…Õ”⁄√’—¬ Œ‘€¿»Ã“Ÿ«' ;
      ACENTUADOS_BAIXA             = '„ı·ÈÌÛ˙‚ıÒ‚ÍÓÙ˚‡ËÏÚ˘Á' ;
      ALFABETO_ACENTUADO           = 'abcdefghijklmnopqrstuvwxyz' +
                                     'ABCDEFGHIJKLMNOPQRSTUVWXYZ' +
                                     ACENTUADOS ;

      CARACTERES_VALIDOS_PARA_RETRANCA = '«√’¡…Õ”⁄¿»Ã“Ÿ¬ Œ‘€_-' + ALFABETO + NUMERAIS +
                                         '_' + #32#27 + #8 + #13 ;

      SG_TP_ITEM                   = 0 ;
      SG_TP_ANCORA                 = 1 ;
      SG_TP_RETRANCA               = 2 ;
      SG_TP_TEMPO                  = 3 ;
      SG_TP_EDITOR                 = 4 ;
      SG_TP_SEQUENCIA              = 5 ;
      SG_TP_STATUS                 = 6 ;

      MAX_SIZE_LINHA_CC            = 32 ;

      COMANDO_TRUE                 = TRUE ;
      COMANDO_FALSE                = FALSE ;
      SYNC_STRING_CODIFICADA       = '#!RRCTCODE!#' ;

      PAUSE_TRUE                   = TRUE ;
      PAUSE_FALSE                  = FALSE ;

      CLibAVPath                   = 'LibAV';

      CDialogOptions               = [ofHideReadOnly, ofFileMustExist, ofEnableSizing];
      CPictureFiles                = '*.BMP;*.GIF;*.JPEG;*.JPG;*.PNG;';
      CAudioFiles                  = '*.AAC;*.AC3;*.APE;*.DTS;*.FLAC;*.M4A;*.MKA;*.MP2;*.MP3;' +
                                     '*.MPA;*.MPC;*.OFR;*.OGG;*.RA;*.TTA;*.WAV;*.WMA;';
      CVideoFiles                  = '*.MXF;*.3GP;*.ASF;*.AVI;*.AVM;*.AVS;*.DAT;*.FLV;*.MKV;*.MOV;' +
                                     '*.MP4;*.MPEG;*.MPG;*.NSV;*.OGM;*.RM;*.RMVB;*.TP;*.TS;*.VOB;*.WMV;';
      CDialogFilter                = 'Video/Audio/Picture Files|' + CVideoFiles + CAudioFiles + CPictureFiles +
                                     '|Video Files|' + CVideoFiles +
                                     '|Audio Files|' + CAudioFiles +
                                     '|Picture Files|' + CPictureFiles +
                                     '|All Files|*.*';

      SG_Registro_Retrancas_Item      = 0 ;
      SG_Registro_Retrancas_Inicio    = 1 ;
      SG_Registro_Retrancas_Fim       = 2 ;
      SG_Registro_Retrancas_MXF_Inicio = 3 ;
      SG_Registro_Retrancas_MXF_Fim   = 4 ;
      SG_Registro_Retrancas_Retranca  = 5 ;

Implementation

End.
