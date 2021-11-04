Unit T_Futebol ;

Interface

Uses Misc_Def_U, Misc_Const_U, Misc_Type_U,
     Math, IniFiles, ClipBrd, Misc_U,
     Winapi.Windows,
     Vcl.StdCtrls, Vcl.Samples.Spin, Vcl.Grids,
     Vcl.Dialogs, Vcl.Graphics, Vcl.ExtCtrls,
     Classes, SysUtils ;

Const MAX_PERIODOS           = 4 ;
      MAX_EVENTOS            = 100 ;
      MAX_PATROCINADORES     = 6 ;
      MAX_TITULARES          = 11 ;
      MAX_RESERVAS           = 25 ;
      MAX_JOGOS_EM_ANDAMENTO = 8 ;
      MAX_REPORTERES         = 5 ;
      MAX_COMENTARISTAS      = 5 ;
      MAX_SUBSTITUICOES      = 10 ;
      MAX_PGTO_CARTOES       = 1 ;
      MAX_PGTO_GOLS          = 1 ;
      QTDE_CLUBES            = 20 ;
      MAX_PENALTIS           = 5 ;

      MAX_JOGADORES          = 75 ;

      FLAG_FUT_PLACAR         = 1 ;
      FLAG_FUT_ESCALACAO      = 2 ;
      FLAG_FUT_ARBITRAGEM     = 4 ;
      FLAG_FUT_FOGUETES       = 8 ;
      FLAG_FUT_GERAL          = 16 ;
      FLAG_FUT_CRONOMETRO     = 32 ;
      FLAG_FUT_BOLINHAS       = 64 ;
      FLAG_FUT_REPORTERES     = 128 ;
      FLAG_FUT_COMENTARISTAS  = 256 ;
      FLAG_FUT_JOGOS          = 512 ;
      FLAG_FUT_ARBITRAGEM_VAR = 1024 ;

      FUT_ALINHAMENTO_ESQUERDA     = 1 ;
      FUT_ALINHAMENTO_DIREITA      = 2 ;
      FUT_ALINHAMENTO_CENTRALIZADO = 3 ;

      SG_ESTAT_LIN_BOLAS_ROUBADAS = 1 ;
      SG_ESTAT_LIN_LEVANTAMENTOS = 2 ;
      SG_ESTAT_LIN_ERROS_DE_PASSE = 3 ;
      SG_ESTAT_LIN_GOLS_PERDIDOS = 4 ;
      SG_ESTAT_LIN_FALTAS = 5 ;
      SG_ESTAT_LIN_IMPEDIMENTOS = 6 ;
      SG_ESTAT_LIN_ESCANTEIOS = 7 ;
      SG_ESTAT_LIN_CONCLUSOES = 8 ;
      SG_ESTAT_LIN_SUBSTITUICOES = 9 ;
      SG_ESTAT_LIN_CARTOES_AMARELOS = 10 ;
      SG_ESTAT_LIN_CARTOES_VERMELHOS = 11 ;

      SG_EVENTOS_ITEM    = 0 ;
      SG_EVENTOS_PERIODO = 1 ;
      SG_EVENTOS_CRONO   = 2 ;
      SG_EVENTOS_STR     = 3 ;
      SG_EVENTOS_PAR1    = 4 ;
      SG_EVENTOS_PAR2    = 5 ;
      SG_EVENTOS_PAR3    = 6 ;
      SG_EVENTOS_PAR4    = 7 ;
      SG_EVENTOS_COD     = 8 ;

      TEMPLATE_FOGUETE_1                 = 1 ;
      TEMPLATE_FOGUETE_2                 = 2 ;
      TEMPLATE_FOGUETE_3                 = 3 ;
      TEMPLATE_FOGUETE_4                 = 4 ;
      TEMPLATE_FOGUETE_5                 = 5 ;
      TEMPLATE_FOGUETE_6                 = 6 ;
      TEMPLATE_ENCERRAMENTO              = 7 ;
      TEMPLATE_GOL_A                     = 12 ;
      TEMPLATE_GOL_B                     = 13 ;
      TEMPLATE_ACRESCIMO_PATROCINADO_2   = 14 ;
      TEMPLATE_ACRESCIMO_PATROCINADO_1   = 16 ;
      TEMPLATE_VINHETA_NARRADORES        = 17 ;
      TEMPLATE_TELA_DIVIDIDA             = 18 ;
      TEMPLATE_AMARELO_A                 = 20 ;
      TEMPLATE_AMARELO_B                 = 21 ;
      TEMPLATE_SEGUNDO_AMARELO_A         = 22 ;
      TEMPLATE_SEGUNDO_AMARELO_B         = 23 ;
      TEMPLATE_VERMELHO_A                = 25 ;
      TEMPLATE_VERMELHO_B                = 26 ;
      TEMPLATE_SUBST_A1                  = 27 ;
      TEMPLATE_SUBST_A2                  = 28 ;
      TEMPLATE_SUBST_A3                  = 29 ;
      TEMPLATE_SUBST_B1                  = 30 ;
      TEMPLATE_SUBST_B2                  = 31 ;
      TEMPLATE_SUBST_B3                  = 32 ;
      TEMPLATE_ARBITRAGEM                = 34 ;
      TEMPLATE_CLASSIFICACAO             = 35 ;
      TEMPLATE_ARBITRAGEM_VAR            = 36 ;
      TEMPLATE_REPORTER                  = 38 ;
      TEMPLATE_PENALTIS                  = 40 ;
      TEMPLATE_BOLINHA_1                 = 41 ;
      TEMPLATE_BOLINHA_2                 = 42 ;
      TEMPLATE_BOLINHA_3                 = 43 ;
      TEMPLATE_BOLINHA_4                 = 44 ;
      TEMPLATE_BOLINHA_5                 = 45 ;
      TEMPLATE_BOLINHA_6                 = 46 ;
      TEMPLATE_COMENTARISTA_DIREITA      = 50 ;
      TEMPLATE_COMENTARISTA_CENTRO       = 51 ;
      TEMPLATE_COMENTARISTA_ESQUERDA     = 52 ;
      TEMPLATE_JOGO_EM_ANDAMENTO         = 61 ;
      TEMPLATE_JOGO_EM_ANDAMENTO_RODAPE  = 62 ;
      TEMPLATE_CONFRONTO_RODAPE          = 89 ;
      TEMPLATE_CONFRONTO_PATROCINADO     = 90 ;
      TEMPLATE_CLASSIFICACAO_PATROCINADA = 91 ;
      TEMPLATE_CLASSIFICACAO_SIMPLES     = 92 ;
      TEMPLATE_CLASSIFICACAO_RODAPE      = 93 ;
      TEMPLATE_REALIZACAO_GLOBO          = 96 ;
      TEMPLATE_CAMPEAO_MANDANTE          = 98 ;
      TEMPLATE_CAMPEAO_NAO_MANDANTE      = 99 ;
      TEMPLATE_REALIZACAO_TVM            = 100 ;
      TEMPLATE_REALIZACAO_CURTA          = 109 ;
      TEMPLATE_ESCALACAO_A               = 1016 ;
      TEMPLATE_ESCALACAO_B               = 1017 ;

Type
     TParametro_Estatistica = (
                 te_Finalizacoes, te_Cartoes_Amarelos,
                 te_Cartoes_Vermelhos, te_Bolas_Roubadas,
                 te_Erros_de_Passe, te_Conclusoes,
                 te_Impedimentos, te_Faltas,
                 te_Escanteios, te_Chutes_a_Gol,
                 te_Gols_Perdidos, te_Levantamentos ) ;

     TPut_Evento = (
                 pe_Inicio_Jogo, pe_Final_Jogo,
                 pe_Inicio_Periodo, pe_Final_Periodo,
                 pe_Acrescimo,
                 pe_Interrupcao, pe_Continuacao,
                 pe_Gol_A, pe_Gol_B,
                 pe_Substituicao_A, pe_Substituicao_B,
                 pe_Cartao_Amarelo_A, pe_Cartao_Amarelo_B,
                 pe_Cartao_Vermelho_A,
                 pe_Cartao_Vermelho_B,
                 pe_Indefinido,
                 pe_Arbitragem,
                 pe_Classificacao,
                 pe_Escalacao_A, pe_Escalacao_B ) ;

     T_Time = Record
                 Carregado : Boolean ;
                 Codigo : LongInt ;
                 Nome_Curto : String ;
                 Nome_Completo : String ;
                 Tecnico : String ;
                 Sigla : String ;
                 Fundacao : TDateTime ;
                 WebSite : String ;
                 UF : String ;
                 Divisao : String ;
                 End ;

     T_Setup_Jogador = Record
                 PN : TPanel ;
                 PN_Status : TPanel ;
                 LB_Item : TLabel ;
                 ED_Camisa : TEdit ;
                 ED_Nome : TEdit ;
                 End ;

     T_Setup_Jogador_Backup = Record
                 Camisa : LongInt ;
                 Nome : String ;
                 End ;

     T_Chyron_Substituicao = Record
                 Entra_Nome : String ;
                 Entra_Camisa : String ;
                 Sai_Nome : String ;
                 Sai_Camisa : String ;
                 End ;

     T_Confrontos_Semifinal = Record
                 Titulo : String ;
                 Time_1_A : String ;
                 Time_1_B : String ;
                 Placar_1_A : String ;
                 Placar_1_B : String ;
                 Time_2_A : String ;
                 Time_2_B : String ;
                 Placar_2_A : String ;
                 Placar_2_B : String ;
                 End ;

     T_Penalti = Record
                 P_A ,
                 P_B : LongInt ;
                 Icone : Array [ 1..2, 1..MAX_PENALTIS ] Of LongInt ;
                 End ;

     T_Tela_Dividida = Record
                 Linha1 : String ;
                 Linha2 : String ;
                 Linha3 : String ;
                 Linha4 : String ;
                 End ;

     T_Evento = Record
                 Evento2 : TPut_Evento ;
                 Evento_Str : String ;
                 Time_Carregado : Boolean ;
                 Cod_Time : LongInt ;
                 Nome_Time : String ;
                 Evento_Processado : Boolean ;
                 Par1 : String ;
                 Par2 : LongInt ;
                 Par3 : String ;
                 Par4 : LongInt ;
                 Carregado : Boolean ;
                 Periodo : LongInt ;
                 Crono_Seg : LongInt ;
                 Picture : TPicture ;
                 End ;

     T_Jogador = Record
                 Carregado : Boolean ;
                 Codigo : LongInt ;
                 Codigo_Time : LongInt ;
                 Nome : String ;
                 Nome_Completo : String ;
                 Estado : String ;
                 Divisao : String ;
                 Nome_Time : String ;
                 DN : TDateTime ;
                 Posicao : String ;
                 Camisa : LongInt ;
                 Combo : String ;
                 Titular : Boolean ;
                 End ;

     T_Reporter = Record
                 Nome ,
                 Adicional : String ;
                 End ;

     T_Comentarista = Record
                 Nome ,
                 Adicional : String ;
                 Alinhamento : LongInt ;
                 End ;

     T_Diferencas = Record
                 DH_Ini_Eventos : TDateTime ;
                 DH_Ini_Placar : TDateTime ;
                 DH_Ini_Estatisticas : TDateTime ;
                 DH_Ini_Arbitragem : TDateTime ;
                 DH_Ini_Cola_A_Titulares : TDateTime ;
                 DH_Ini_Cola_B_Titulares : TDateTime ;
                 DH_Ini_Cola_A_Reservas : TDateTime ;
                 DH_Ini_Cola_B_Reservas : TDateTime ;
                 DH_Ini_Cola_A_Fora : TDateTime ;
                 DH_Ini_Cola_B_Fora : TDateTime ;
                 //P_A : Boolean ;
                 //P_A_DT : TDateTime ;
                 //P_B : Boolean ;
                 //P_B_DT : TDateTime ;
                 Periodo : Boolean ;
                 Periodo_DT : TDateTime ;
                 Acrescimo : Boolean ;
                 Acrescimo_DT : TDateTime ;
                 End ;

     T_Partida_Estatistica = Record
                 Faltas ,
                 Impedimentos ,
                 Substituicoes ,
                 Cartoes_Amarelos ,
                 Cartoes_Vermelhos ,
                 Finalizacoes ,
                 Escanteios ,
                 Chutes_a_Gol ,
                 Bolas_Roubadas ,
                 Erros_de_Passe ,
                 Gols_Perdidos ,
                 Conclusoes ,
                 Levantamentos : LongInt ;
                 Registro_OK : Boolean ;
                 End ;

     T_Partida_Jogador = Record
                 Codigo : LongInt ;
                 Nome_Curto : String ;
                 Camisa : LongInt ;
                 Titular : Boolean ;
                 Reserva : Boolean ;
                 Substituido : Boolean ;
                 Posicao : String ;
                 FN_Video : String ;
                 FN_Imagem : String ;
                 //
                 Advertido : Boolean ;
                 Expulso : Boolean ;
                 Nome_Completo : String ;
                 DN : TDateTime ;
                 End ;

     T_Arbitragem = Record
                 Arbitro : String ;
                 Estado : String ;
                 Auxiliar_1 : String ;
                 Estado_1 : String ;
                 Auxiliar_2 : String ;
                 Estado_2 : String ;
                 Auxiliar_3 : String ;
                 Estado_3 : String ;
                 End ;

     T_Escalacao = Record
                 Jogadores : Array Of T_Partida_Jogador ;
                 End ;

     T_Partida_Substituicao = Record
                 Indice : LongInt ;
                 Entra ,
                 Sai   : String ;
                 FN_Entra ,
                 FN_Sai   : String ;
                 Codigo_Entra : LongInt ;
                 Codigo_Sai : LongInt ;
                 Periodo : LongInt ;
                 Tempo_seg : LongInt ;
                 End ;

     T_Partida_Cartoes = Record
                 Codigo : LongInt ;
                 Periodo : LongInt ;
                 Tempo_seg : LongInt ;
                 Tipo_Cartao : LongInt ; // 1-Amarelo 2-Vermelho 3-Azul
                 End ;

     T_Partida_Cartao = Record
                 Nome : String ;
                 Camisa : LongInt ;
                 Combo : String ;
                 End ;

     T_Partida_Gol = Record
                 Nome : String ;
                 Camisa : LongInt ;
                 Combo : String ;
                 End ;

     Ti_Partida_Clube = Record
                 FN_Camisa_Goleiro : String ;
                 FN_Camisa_Linha : String ;
                 FN_Escudo : String ;
                 Escalacao : Array Of T_Partida_Jogador ;
                 Gols : LongInt ;
                 Posse_de_Bola_Seg : LongInt ;
                 Estatisticas : T_Partida_Estatistica ;
                 Substituicoes : T_Partida_Substituicao ;
                 Cartoes : T_Partida_Cartoes ;
                 End ;

     T_Partida_Outro_Clube = Record
                 Nome_Curto : String ;
                 Nome_Longo : String ;
                 FN_Camisa : String ;
                 FN_Escudo : String ;
                 Gols : LongInt ;
                 End ;

     Ti_Partida_Definicao = Record
                 Nome_Estadio : String ;
                 Municipio_Estadio : String ;
                 UF_Estadio : String ;
                 DH : TDateTime ;
                 End ;

     T_Outra_Partida = Record
                 Definicao : Ti_Partida_Definicao ;
                 Periodo : LongInt ;
                 DH_Inicio_Periodos : Array [ 1 .. MAX_PERIODOS ] Of TDateTime ;
                 DH_Acrescimos_Periodos : Array [ 1 .. MAX_PERIODOS ] Of TDateTime ;
                 Clube : Array [ 1 .. 2 ] Of T_Partida_Outro_Clube ;
                 End ;

     T_Classificacao = Record
                 Clube : String ;
                 P ,
                 V ,
                 GP ,
                 SG ,
                 J  : LongInt ;
                 Cor_Str : String ;
                 Cor_Int : LongInt ;
                 End ;

     T_Jogo_em_Andamento = Record
                 Time_A ,
                 Time_B : String ;
                 P_A ,
                 P_B : String ;
                 Titulo   : String ;
                 Rodape   : String ;
                 Estadio  : String ;
                 DH       : TDateTime ;
                 End ;

     T_Camisas = Record
                 Camisa : LongInt ;
                 Nome   : String ;
                 End ;

     T_Agendamento = Record
                 Evento : LongInt ;
                 Cod_Time : LongInt ;
                 P1 : String ;
                 P2 : String ;
                 Cor : TColor ;
                 End ;

     T_Partida_Contexto_Clone = Record
                 P_A    : LongInt ;
                 P_B    : LongInt ;
                 V_A    : LongInt ;
                 V_B    : LongInt ;
                 Per    : LongInt ;
                 Acr    : LongInt ;
                 End ;

     T_Partida_Contexto = Record
                 Prot__Placar__A      : LongInt ;
                 Prot__Placar__B      : LongInt ;
                 Prot__Periodo__Atual : LongInt ;
                 Prot__Acrescimo      : LongInt ;
                 Prot__VERMELHOS__A   : LongInt ;
                 Prot__VERMELHOS__B   : LongInt ;
                 End ;

     T_Partida_Cola = Record
                 Cola_A_Titulares                 ,
                 Cola_B_Titulares                 : TStringList ;
                 Cola_A_Reservas                  ,
                 Cola_B_Reservas                  : TStringList ;
                 Cola_A_Fora                      ,
                 Cola_B_Fora                      : TStringList ;
                 End ;

     T_Partida = Record
                 Definicao                        : Ti_Partida_Definicao ;
                 DT                               : TDateTime ;
                 Agendamento                      : T_Agendamento ;
                 Nome                             : String ;
                 Foguetes                         : Array [ 1 .. MAX_PATROCINADORES ] Of String ;
                 Bolinhas                         : Array [ 1 .. MAX_PATROCINADORES ] Of String ;
                 TIME_A_LONGO                     : String ; // = 'IGUATU' ;
                 TIME_B_LONGO                     : String ; // = 'CEARÁ' ;
                 TIME_A_CURTO                     : String ; // = 'IGU' ;
                 TIME_B_CURTO                     : String ; // = 'CEA' ;
                 TECNICO_A                        : String ; // = 'ROBERTO CARLOS' ;
                 TECNICO_B                        : String ; // = 'CHAMUSCA' ;
                 ESQUEMA_A                        : String ; // = '4-4-2' ;
                 ESQUEMA_B                        : String ; // = '4-3-3' ;
                 Diferencas                       : T_Diferencas ;
                 Arbitragem                       : T_Arbitragem ;
                 Arbitragem_Var                   : T_Arbitragem ;
                 Penaltis                         : T_Penalti ;
                 Tela_Dividida                    : T_Tela_Dividida ;
                 Confrontos_Semifinal             : T_Confrontos_Semifinal ;
                 Substituicoes                    : Array [ 1 .. 2, 1 .. MAX_SUBSTITUICOES ] Of T_Partida_Substituicao ;
                 Cartao_Amarelo                   : Array [ 1 .. 2, 1 .. MAX_PGTO_CARTOES ] Of T_Partida_Cartao ;
                 Cartao_Vermelho                  : Array [ 1 .. 2, 1 .. MAX_PGTO_CARTOES ] Of T_Partida_Cartao ;
                 Gol                              : Array [ 1 .. 2, 1 .. MAX_PGTO_GOLS ] Of T_Partida_Gol ;
                 Reporteres                       : Array [ 1 .. MAX_REPORTERES ] Of T_Reporter ;
                 Comentaristas                    : Array [ 1 .. MAX_COMENTARISTAS ] Of T_Comentarista ;
                 Eventos_Estatisticos             : Array Of T_Evento ;
                 Eventos_Controle                 : Array Of T_Evento ;
                 Clube                            : Array [ 1 .. 2 ] Of Ti_Partida_Clube ;
                 Comentarista_Nome                : String ;
                 Comentarista_Auxiliar            : String ;
                 Reporter_Nome                    : String ;
                 Reporter_Auxiliar                : String ;
                 Last_Conteudo_Placar             : String ;
                 Last_Conteudo_Eventos            : String ;
                 Last_Conteudo_Estatisticas       : String ;
                 Jogo_Em_Andamento_Selecionado    : T_Jogo_em_Andamento ;
                 Jogos_E                          : Array [ 1 .. MAX_JOGOS_EM_ANDAMENTO ] Of T_Jogo_em_Andamento ;
                 Jogos_N                          : Array [ 1 .. MAX_JOGOS_EM_ANDAMENTO ] Of T_Jogo_em_Andamento ;
                 Titulares_Originais              : Array [ 1 .. 2 , 1 .. MAX_TITULARES ] Of T_Jogador ;
                 Reservas_Originais               : Array [ 1 .. 2 , 1 .. MAX_RESERVAS ] Of T_Jogador ;
                 Titulares_Andamento              : Array [ 1 .. 2 , 1 .. MAX_TITULARES ] Of T_Jogador ;
                 Reservas_Andamento               : Array [ 1 .. 2 , 1 .. MAX_RESERVAS ] Of T_Jogador ;
                 Fora_Andamento                   : Array [ 1 .. 2 , 1 .. MAX_RESERVAS ] Of T_Jogador ;
                 DH_Inicio_Periodos               : Array [ 1 .. MAX_PERIODOS ] Of TDateTime ;
                 DH_Inicio_Periodos_Pausa         : Array [ 1 .. MAX_PERIODOS ] Of TDateTime ;
                 DH_Inicio_Periodos_Decorrido     : Array [ 1 .. MAX_PERIODOS ] Of TDateTime ;
                 DH_Inicio_Periodos_Pausado       : Array [ 1 .. MAX_PERIODOS ] Of Boolean ;
                 DH_Acrescimos_Periodos           : Array [ 1 .. MAX_PERIODOS ] Of TDateTime ;
                 Camisas2                         : Array [ 1 .. 2 ] Of Array Of T_Camisas ;
                 Bloco_Jogadores                  : Array [  1 .. MAX_JOGADORES ] Of T_Setup_Jogador ;
                 Bloco_Jogadores_Backup           : Array [  1 .. MAX_JOGADORES ] Of T_Setup_Jogador_Backup ;
                 End ;

Type
   TFutebol = class(Vcl.StdCtrls.TLabel)
   Private
     Partida_Contexto    : T_Partida_Contexto ;
     Partida_Colas       : T_Partida_Cola ;
   Public
     Partida             : T_Partida ;
     GRAVACOES_BLOQUEADAS : Boolean ;
     FN_Full             : String ;
     FN_Short            : String ;
     FN_Ext              : String ;
     FN_DT               : TDateTime ;
     Tag1                ,
     Tag2                ,
     Tag3                : LongInt ;
     TagS1               ,
     TagS2               ,
     TagS3               : String ;
     TagB1               ,
     TagB2               ,
     TagB3               : Boolean ;
     TagF1               ,
     TagF2               ,
     TagF3               : Real ;
     Funcao_Terminal           : LongInt ; // 0-Estatistica 1-Exibição 2-Ambos
     Arquivos            : Array Of T_FN ;
     Classificacao       : Array [ 1 .. QTDE_CLUBES ] Of T_Classificacao ;
     Array_Times         : Array Of T_Time ;
     Array_Jogadores     : Array Of T_Jogador ;
     Outras_Partidas     : Array Of T_Outra_Partida ;
     Atualizar_Controles : Boolean ;
     SL_Esquemas_Taticos : TStringList ;
     SG_Estat_1          : TStringGrid ;
     SG_Eventos_1        ,
     SG_Eventos_2        ,
     SG_Eventos_3        : TStringGrid ;
     SG_Classificacao    : TStringGrid ;
     SG_Tit_A            ,
     SG_Tit_B            ,
     SG_Res_A            ,
     SG_Res_B            : TStringGrid ;
     SG_CLASSIF_POSICAO  : LongInt ;
     SG_CLASSIF_CLUBE    : LongInt ;
     SG_CLASSIF_PG       : LongInt ;
     SG_CLASSIF_JG       : LongInt ;
     SG_CLASSIF_VI       : LongInt ;
     SG_CLASSIF_EM       : LongInt ;
     SG_CLASSIF_DE       : LongInt ;
     SG_CLASSIF_GP       : LongInt ;
     SG_CLASSIF_GC       : LongInt ;
     SG_CLASSIF_SG       : LongInt ;
     SG_CLASSIF_APROV    : LongInt ;
     Reg_Substituicao    : T_Chyron_Substituicao ;
     Procedure CLEAR ;
     Procedure PRINT_STATUS ( LB : TListBox ) ;
     Procedure ADD ( Elemento : T_FN ) ;
     Procedure ADD_ESTATISTICA ( Cod_Time : LongInt ; Tipo : TParametro_Estatistica ; Valor : LongInt ) ;
     Procedure SET_PLACAR ( Gols_A, Gols_B : LongInt ;
                            Vermelhos_A, Vermelhos_B : LongInt ; Salvar : Boolean ) ;
     Procedure SET_PERIODO ( Periodo : LongInt ; Salvar : Boolean ) ;
     Procedure SET_ACRESCIMO ( Acrescimo : LongInt ; Salvar : Boolean ) ;
     Procedure ATUALIZAR_ESTATISTICAS ( SG : TStringGrid ) ;
     Procedure SALVAR_PLACAR_PARTIDA ( Origem : String ) ;
     Procedure SALVAR_ESTATISTICAS_PARTIDA ( Origem, FN : String ) ;
     Procedure SALVAR_DADOS_PARTIDA_CRONOMETRO ( Origem : String ) ;
     Procedure SALVAR_DADOS_PRINCIPAIS_DA_PARTIDA ( Origem : String ) ;
     Procedure SALVAR_PARTIDA_OLD ( Origem : String ) ;
     Procedure SALVAR_EVENTOS_ESTATISTICOS ( FN : String ) ;
     Procedure SALVAR_REPORTERES ( Origem : String ) ;
     Procedure SALVAR_COMENTARISTAS ( Origem : String ) ;
     Function GET_DIRETORIO_DATABASE_PARTIDAS : String ;
     Function GET_DIR_PARTIDA : String ;
     Function GET_FN_PARTIDA : String ;
     Function GET_FN_COMENTARISTAS : String ;
     Function GET_FN_REPORTERES : String ;
     Function GET_DIR_FOTOS_LOCAL ( Cod_Time : LongInt ) : String  ;
     Function GET_DIR_FOTOS_CHYRON ( Cod_Time : LongInt ) : String  ;
     Function GET_DIR_ELENCO_LOCAL ( Cod_Time : LongInt ) : String  ;
     Function GET_FN_SILHUETA : String ;
//     Function GET_FN_PARTIDA_PLACAR : String ;
     Function GET_FN_DADOS_GERAIS : String ;
//     Function GET_FN_ARBITRAGEM : String ;
     Function GET_FN_JOGOS_EM_ANDAMENTO : String ;
//     Function GET_FN_PATROCINADORES : String ;
//     Function GET_FN_BOLINHAS : String ;
     Procedure ATUALIZAR_CONFRONTOS_SEMIFINAIS ( Reg : T_Confrontos_Semifinal ) ;
     Function GET_FN_PARTIDA_DADOS_PRINCIPAIS : String ;
     Function GET_FN_PARTIDA_ESTATISTICAS : String ;
     Function GET_FN_PARTIDA_CRONOMETRO : String ;
     Function GET_FN_PARTIDA_ESCALACAO : String ;
     Function GET_FN_PARTIDA_EVENTOS : String ;
     Function GET_FN_PARTIDA_LB_COLA_A_TITULARES : String ;
     Function GET_FN_PARTIDA_LB_COLA_B_TITULARES : String ;
     Function GET_FN_PARTIDA_LB_COLA_A_RESERVAS : String ;
     Function GET_FN_PARTIDA_LB_COLA_B_RESERVAS : String ;
     Function GET_FN_PARTIDA_LB_COLA_A_FORA : String ;
     Function GET_FN_PARTIDA_LB_COLA_B_FORA : String ;
     Function CARREGAR_EVENTOS_ESTATISTICOS : Boolean ;
     Function CARREGAR_PARTIDA_PLACAR : Boolean ;
     Procedure CARREGAR_ESTATISTICAS ( FN : String ) ;
     Function GET_FN_TEMPORARIO : String ;
     Function CARREGAR_PARTIDA ( Origem : String ; Pode_Salvar : Boolean ) : Boolean ;
     Procedure ATUALIZAR_DIR_PARTIDA ( DT : TDateTime ; Nome : String ) ;
     Procedure PROC_PROTAR_EVENTOS_SG ( SG : TStringGrid ) ;
     Procedure PROC_PLOTAR_EVENTOS_ESTATISTICOS ;
     Procedure LIMPAR_REGISTRO_JOGADOR ( Var Jogador : T_Jogador ) ;
     Function GET_DETALHE_JOGADOR ( Nome : String ) : T_Jogador ;
     Procedure PUT_EVENTO_ESTATISTICO ( _Evento : TPut_Evento ;
                                        _Par1 : String ; _Par2 : LongInt ;
                                        _Par3 : String ; _Par4 : LongInt ) ;
     Function STR_EVENTO ( Evento : TPut_Evento ) : String ;
     Function INT_EVENTO ( Evento : TPut_Evento ) : LongInt ;
     Function GET_EVENTO_POR_INT ( Evento : LongInt ) : TPut_Evento ;
     Procedure CARREGAR_ESQUEMAS_TATICOS ;
     Function GET_TIME_CURTO ( Cod_Time : LongInt ) : String ;
     Function GET_TIME_LONGO ( Cod_Time : LongInt ) : String ;
     Function GET_FN_PATROCINADOR ( Indice : LongInt ) : String ;
     Function GET_DIR_TIME ( Cod_Time : LongInt ) : String ;
     Function GET_DIR_TIME_CHYRON ( Cod_Time : LongInt ) : String ;
     Function GET_FN_ESCUDO_TIME_LOCAL ( Cod_Time : LongInt ) : String ;
     Function GET_FN_ESCUDO_TIME_CHYRON ( Cod_Time : LongInt ) : String ;
     Function GET_FN_ESCUDO_TIME_POR_NOME ( Nome_Time : String ) : String ;
     Function GET_FN_TECNICO_TIME ( Cod_Time : LongInt ) : String ;
     Function GET_FN_FOTO_JOGADOR_LOCAL ( Cod_Time : LongInt ; Jogador : String ) : String ;
     Function GET_FN_FOTO_JOGADOR_CHYRON ( Cod_Time : LongInt ; Jogador : String ) : String ;
     Function GET_COD_TIME_POR_EVENTO ( Evento : TPut_Evento ) : LongInt ;
     Procedure CARREGAR_EVENTO_LINHA_SG ( SG : TStringGrid ; _Row : LongInt ; Var Evento : T_Evento ) ;
     Function GET_CRONO_SEG ( Periodo : LongInt ) : LongInt ;
     Procedure INICIALIZAR_SG_ESTATISTICAS ( SG : TStringGrid ) ;
     Constructor Create ( Dono : TComponent ; _SG_1 : TStringGrid ;
                          _SG_Eventos_1, _SG_Eventos_2, _SG_Eventos_3 : TStringGrid ;
                          _SG_Classif : TStringGrid ;
                          SG_Remoto : Boolean ;
                          _SG_Tit_A, _SG_Tit_B , _SG_Res_A, _SG_Res_B : TStringGrid ) ;
     Procedure INICIALIZAR_SG_CLASSIFICACAO ( SG : TStringGrid ) ;
     Function IMPORTAR_TABELA_CLASSIFICACAO : Boolean ;
     Procedure SALVAR_LBS_COLA ;
     Procedure CARREGAR_LBS_COLA ;
     Function GET_FN_TABELA_CLASSIFICACAO : String ;
     Procedure CARREGAR_PATROCINADORES ( FN : String ) ;
     Procedure CARREGAR_BOLINHAS ( FN : String ) ;
     Procedure CARREGAR_COMENTARISTAS ( Origem : String ) ;
     Procedure CARREGAR_REPORTERES ( Origem : String ) ;
     Procedure CARREGAR_ARBITRAGEM (FN : String ) ;
     Procedure CARREGAR_ARBITRAGEM_VAR (FN : String ) ;
     Procedure SALVAR_PATROCINADORES ( Origem : String ) ;
     Procedure SALVAR_BOLINHAS ( Origem : String ) ;
     Procedure SALVAR_ARBITRAGEM ( Origem : String ) ;
     Procedure SALVAR_ARBITRAGEM_VAR ( Origem : String ) ;
     Procedure CARREGAR_CLASSIFICACAO_DA_SG ;
     Procedure SALVAR_JOGOS_EM_ANDAMENTO ( Origem : String ) ;
     Procedure CARREGAR_JOGOS_EM_ANDAMENTO ( FN : String ) ;
     Procedure CARREGAR_SUBSTITUICAO ( Cod_Time : LongInt ; Indice : LongInt ;
                                       _Sai, _Entra : String ) ;
     Procedure ATRIBUIR_REPORTERES ( R1_Nome, R1_Adicional,
                                     R2_Nome, R2_Adicional,
                                     R3_Nome, R3_Adicional,
                                     R4_Nome, R4_Adicional,
                                     R5_Nome, R5_Adicional : String ) ;
     Function CAPTURAR_CLASSIFICACAO_MODO_1 ( Lista : TStringList ) : LongInt ;
     Procedure RESETAR_ESTATISTICAS ;
     Procedure RESETAR_EVENTOS ;
     Procedure RESETAR_SUBSTITUICOES ;
     Procedure RESETAR_CARTOES ;
     Procedure RESETAR_PLACAR ( Origem : String ) ;
     Function GET_NOME_PELA_CAMISA ( Cod_Time, Camisa : LongInt ) : String ;
     Function GET_NEXT_FORA_ANDAMENTO_DISPONIVEL ( Cod_Time : LongInt ) : LongInt ;
     Function GET_NEXT_TITULAR_ANDAMENTO_DISPONIVEL ( Cod_Time : LongInt ) : LongInt ;
     Function GET_NEXT_RESERVA_ANDAMENTO_DISPONIVEL ( Cod_Time : LongInt ) : LongInt ;
     Procedure PUT_FORA_ANDAMENTO ( Cod_Time : LongInt ; Jogador : T_Jogador ) ;
     Procedure PUT_TITULAR_ANDAMENTO ( Cod_Time : LongInt ; Jogador : T_Jogador ) ;
     Procedure PUT_RESERVA_ANDAMENTO ( Cod_Time : LongInt ; Jogador : T_Jogador ) ;
     Procedure REMOVER_TITULAR_ANDAMENTO ( Cod_Time, Camisa : LongInt ) ;
     Procedure REMOVER_RESERVA_ANDAMENTO ( Cod_Time, Camisa : LongInt ) ;
     Procedure REMOVER_FORA_ANDAMENTO ( Cod_Time, Camisa : LongInt ) ;
     Function REALIZAR_SUBSTITUICAO ( Cod_Time, Camisa_Entra, Camisa_Sai : LongInt ) : LongInt ;
     Function REALIZAR_SUBSTITUICAO_REVERSA ( Cod_Time, Camisa_Retorna_do_Banco, Camisa_Retorna_ao_Banco : LongInt ) : LongInt ;
     Function GET_INDICE_TITULAR_ANDAMENTO ( Cod_Time, Camisa : LongInt ) : LongInt ;
     Function GET_INDICE_RESERVA_ANDAMENTO ( Cod_Time, Camisa : LongInt ) : LongInt ;
     Function GET_INDICE_FORA_ANDAMENTO ( Cod_Time, Camisa : LongInt ) : LongInt ;
     Procedure CARREGAR_ESCALACAO ( FN : String ) ;
     Procedure SALVAR_ESCALACAO ( Origem : String ) ;
     Procedure LIMPAR_COLAS ;
     Procedure ADD_COLAS_A_PARTIR_DO_ANDAMENTO ( _Titulares_A, _Reservas_A, _Fora_A,
                                                 _Titulares_B, _Reservas_B, _Fora_B : TStrings ) ;
     Procedure ADD_ANDAMENTO_A_PARTIR_DAS_COLAS ( _Titulares_A, _Reservas_A, _Fora_A,
                                                  _Titulares_B, _Reservas_B, _Fora_B : TListBox ) ;
     //Procedure ADD_COLAS_A ( _Titulares, _Reservas, _Fora : TStrings ) ;
     //Procedure ADD_COLAS_B ( _Titulares, _Reservas, _Fora : TStrings ) ;
     Procedure TRANFERIR_SGS_TIMES_PARA_MEMORIA ;
     Procedure CARREGAR_SG_PELAS_ESCALACOES ;
     Procedure RESETAR_ESCALACAO ;
     Function EVENTO_TO_COMANDO_DIRETO ( Evento : T_Evento ) : String ;
     Procedure LIMPAR_EVENTO ( Var Reg : T_Evento ) ;
     Procedure ATRIBUIR_COMENTARISTAS ( C1_Nome, C1_Adicional : String ; C1_Alinhamento : LongInt ;
                                        C2_Nome, C2_Adicional : String ; C2_Alinhamento : LongInt ;
                                        C3_Nome, C3_Adicional : String ; C3_Alinhamento : LongInt ;
                                        C4_Nome, C4_Adicional : String ; C4_Alinhamento : LongInt ;
                                        C5_Nome, C5_Adicional : String ; C5_Alinhamento : LongInt ) ;
     Function GET_FN_ICONE_PENALTI_CONVERTIDO : String ;
     Function GET_FN_ICONE_PENALTI_PERDIDO : String ;
     Function GET_FN_ICONE_PENALTI_NAO_BATIDO : String ;
     Function GET_ICONE_CHYRON_ICONE_PENALTI ( Tag : LongInt ) : String ;
     Function GET_ICONE_PENALTI_CONVERTIDO : TPicture ;
     Function GET_ICONE_PENALTI_PERDIDO : TPicture ;
     Function GET_ICONE_PENALTI_NAO_BATIDO : TPicture ;
     Procedure SALVAR_MATRIZ ( Origem : String ; Flags : Int64 ) ;
     Function INDEX_OF_CAMISA ( Cod_Time : LongInt ; Camisa : LongInt ) : LongInt ;
     Procedure QuickSort_Jogadores (Var A: Array Of T_Camisas; iLo, iHi: Integer) ;
     Procedure QuickSort_Camisas (Var A: Array Of T_Camisas; iLo, iHi: Integer) ;
     Procedure SALVAR_JOGADORES ( Cod_Time : LongInt ) ;
     Procedure CRIAR_BACKUP_JOGADORES ( Cod_Time : LongInt ) ;
     //Procedure CARREGAR_JOGADORES ( Cod_Time : LongInt ) ;
     Function GET_NOME_JOGADOR_PELA_CAMISA ( Cod_Time : LongInt ; Camisa : LongInt ) : String ;
     Function GET_CAMISA_JOGADOR_PELO_NOME ( Cod_Time : LongInt ; Nome : String ) : LongInt ;
     Procedure ATUALIZAR_LB_JOGADORES ( LB : TListBox ; Cod_Time : LongInt ) ;
     Procedure CARREGAR_CAMISAS_TIME ( Cod_Time : LongInt ) ;
     Function PARTIDA_GET_JOGO_EM_ANDAMENTO_SELECIONADO : T_Jogo_em_Andamento ;
     Function PARTIDA_TIME_A_LONGO : String ;
     Function PARTIDA_TIME_B_LONGO : String ;
     Function PARTIDA_CARTAO_AMARELO ( _Time, _Idx : LongInt ) : T_Partida_Cartao ;
     Function PARTIDA_CARTAO_VERMELHO ( _Time, _Idx : LongInt ) : T_Partida_Cartao ;
     Procedure PARTIDA_SET_CARTAO_AMARELO_COMBO ( _Time, _Idx : LongInt ; _Combo : String ) ;
     Procedure PARTIDA_SET_CARTAO_VERMELHO_COMBO ( _Time, _Idx : LongInt ; _Combo : String ) ;
     Function GET_PARTIDA_CONTEXTO : T_Partida_Contexto_Clone ;
     Function GET_FN_ESQUEMA_TATICO ( Cod_Time : LongInt ) : String ;
     Procedure PREPARAR_SUBSTITUICAO(Sai, Entra: String);
     Function GET_DIR_TIME_A_PASTA : String ;
     Procedure ATUALIZAR_ESCUDOS_E_CAMISAS_DOS_TIMES ;
     Function GET_DIR_TIME_B_PASTA : String ;
     Procedure ABRIR_PASTA ( Dir : String ) ;
     Procedure ABRIR_PASTA_DATABASE ;
     Procedure ABRIR_PASTA_TIMES ;
     Procedure ABRIR_PASTA_TIME ( Cod_Time : LongInt ) ;
     Procedure ABRIR_PASTA_PARTIDA ;
     Procedure ABRIR_PASTA_TIME_FOTOS ( Cod_Time : LongInt ) ;
     Procedure ABRIR_PASTA_TIME_ELENCO ( Cod_Time : LongInt ) ;
     Procedure ABRIR_PASTA_FOGUETES ;
     Procedure ABRIR_PASTA_BOLINHAS ;
     Procedure ABRIR_PASTA_ACRESCIMOS ;
     Procedure ABRIR_PASTA_ESCALACAO ;
     Procedure ABRIR_PASTA_CLASSIFICACAO ;
     Procedure ABRIR_PASTA_ENCERRAMENTO ;
     Function GET_DIR_FOGUETES : String ;
     Function GET_DIR_BOLINHAS : String ;
     Function GET_DIR_ACRESCIMOS : String ;
     Function GET_DIR_ESCALACAO : String ;
     Function GET_DIR_ENCERRAMENTO : String ;
     Function GET_DIR_CLASSIFICACAO : String ;
     Function GET_DIR_CITACAO_NARRADORES : String ;
     Procedure CARREGAR_ARQUIVOS_DATABASE ( LB_All : TListBox ) ;
   End ;

Implementation

Function TFutebol.GET_FN_PATROCINADOR ( Indice : LongInt ) : String ;
Begin
Result := Diretorio_Database_Chyron + 'Patrocinadores\' + Partida.Foguetes[Indice] ;
CHECAR_DIRETORIO_FILENAME ( Result ) ;
End ;

Function TFutebol.GET_FN_ICONE_PENALTI_CONVERTIDO : String ;
Begin
Result := Diretorio_Database + 'Imagens\Penaltis\icone_convertido.png' ;
CHECAR_DIRETORIO_FILENAME ( Result ) ;
End ;

Function TFutebol.GET_DIR_FOGUETES : String ;
Begin
Result := Diretorio_Database + 'foguetes\' ;
CHECAR_DIRETORIO_DIRNAME ( Result ) ;
End ;

Function TFutebol.GET_DIR_BOLINHAS : String ;
Begin
Result := Diretorio_Database + 'bolinhas\' ;
CHECAR_DIRETORIO_DIRNAME ( Result ) ;
End ;

Function TFutebol.GET_DIR_ACRESCIMOS : String ;
Begin
Result := Diretorio_Database + 'acrescimos\' ;
CHECAR_DIRETORIO_DIRNAME ( Result ) ;
End ;

Function TFutebol.GET_DIR_ESCALACAO : String ;
Begin
Result := Diretorio_Database + 'escalacao\' ;
CHECAR_DIRETORIO_DIRNAME ( Result ) ;
End ;

Function TFutebol.GET_DIR_ENCERRAMENTO : String ;
Begin
Result := Diretorio_Database + 'encerramento\' ;
CHECAR_DIRETORIO_DIRNAME ( Result ) ;
End ;

Function TFutebol.GET_DIR_CLASSIFICACAO : String ;
Begin
Result := Diretorio_Database + 'classificacao\' ;
CHECAR_DIRETORIO_DIRNAME ( Result ) ;
End ;

Function TFutebol.GET_DIR_CITACAO_NARRADORES : String ;
Begin
Result := Diretorio_Database + 'Citacao Narradores\' ;
CHECAR_DIRETORIO_DIRNAME ( Result ) ;
End ;

Function TFutebol.GET_DIR_TIME_A_PASTA : String ;
Begin
Result := Diretorio_Database + 'Time_A\' ;
CHECAR_DIRETORIO_DIRNAME ( Result ) ;
End ;

Function TFutebol.GET_DIR_TIME_B_PASTA : String ;
Begin
Result := Diretorio_Database + 'Time_B\' ;
CHECAR_DIRETORIO_DIRNAME ( Result ) ;
End ;

Function TFutebol.GET_FN_ICONE_PENALTI_PERDIDO : String ;
Begin
Result := Diretorio_Database + 'Imagens\Penaltis\icone_perdido.png' ;
CHECAR_DIRETORIO_FILENAME ( Result ) ;
End ;

Function TFutebol.GET_FN_ICONE_PENALTI_NAO_BATIDO : String ;
Begin
Result := Diretorio_Database + 'Imagens\Penaltis\icone_nao_batido.png' ;
CHECAR_DIRETORIO_FILENAME ( Result ) ;
End ;

Function TFutebol.GET_ICONE_CHYRON_ICONE_PENALTI ( Tag : LongInt ) : String ;
Begin
Case Tag Of
   0 : Result := Diretorio_Database_Chyron + 'Imagens\Penaltis\icone_nada.png' ;
   1 : Result := Diretorio_Database_Chyron + 'Imagens\Penaltis\icone_convertido.png' ;
   2 : Result := Diretorio_Database_Chyron + 'Imagens\Penaltis\icone_perdido.png' ;
   Else
      Result := '' ;
   End ;
End ;

Function TFutebol.GET_ICONE_PENALTI_CONVERTIDO : TPicture ;
Begin
Result := TPicture.Create ;
If RR_FileExists ( 'GET ICONE_PENALTI_CONVERTIDO',
                   GET_FN_ICONE_PENALTI_CONVERTIDO ) Then
   Begin
   Try
      //Result.LoadFromFile ( GET_FN_ICONE_PENALTI_CONVERTIDO ) ;
      GET_PICTURE ( 'GET ICONE_PENALTI_CONVERTIDO',
                    Nil, Result, GET_FN_ICONE_PENALTI_CONVERTIDO );
      PUT_LOG ( 'OK [' + GET_FN_ICONE_PENALTI_CONVERTIDO + ']' ) ;
      Except
      On E : Exception Do
         Begin
         PUT_LOG ( 'EXCEPT CONVERTIDO [' + GET_FN_ICONE_PENALTI_CONVERTIDO + ']' ) ;
         PUT_LOG ( E.Message ) ;
         Result := Nil ;
         End ;
      End ;
   End
   Else
   Begin
   PUT_LOG ( 'NOT EXISTS CONVERTIDO [' + GET_FN_ICONE_PENALTI_CONVERTIDO + ']' ) ;
   Result := Nil ;
   End ;
End ;

Function TFutebol.GET_ICONE_PENALTI_PERDIDO : TPicture ;
Begin
Result := TPicture.Create ;
If RR_FileExists ( 'GET_ICONE_PENALTI_PERDIDO',
                   GET_FN_ICONE_PENALTI_PERDIDO ) Then
   Begin
   Try
      //Result.LoadFromFile ( GET_FN_ICONE_PENALTI_PERDIDO ) ;
      GET_PICTURE ( 'GET ICONE_PENALTI_PERDIDO',
                    Nil, Result, GET_FN_ICONE_PENALTI_PERDIDO );
      PUT_LOG ( 'OK [' + GET_FN_ICONE_PENALTI_PERDIDO + ']' ) ;
      Except
      On E : Exception Do
         Begin
         PUT_LOG ( 'EXCEPT PERDIDO [' + GET_FN_ICONE_PENALTI_PERDIDO + ']' ) ;
         PUT_LOG ( E.Message ) ;
         Result := Nil ;
         End ;
      End ;
   End
   Else
   Begin
   PUT_LOG ( 'NOT EXISTS PERDIDO [' + GET_FN_ICONE_PENALTI_PERDIDO + ']' ) ;
   Result := Nil ;
   End ;
End ;

Function TFutebol.GET_ICONE_PENALTI_NAO_BATIDO : TPicture ;
Begin
Result := TPicture.Create ;
If RR_FileExists ( 'GET ICONE_PENALTI_NAO_BATIDO',
                   GET_FN_ICONE_PENALTI_NAO_BATIDO ) Then
   Begin
   Try
      //Result.LoadFromFile ( GET_FN_ICONE_PENALTI_NAO_BATIDO ) ;
      GET_PICTURE ( 'GET ICONE_PENALTI_NAO_BATIDO',
                    Nil, Result, GET_FN_ICONE_PENALTI_NAO_BATIDO );
      PUT_LOG ( 'OK [' + GET_FN_ICONE_PENALTI_NAO_BATIDO + ']' ) ;
      Except
      On E : Exception Do
         Begin
         PUT_LOG ( 'EXCEPT NAO_BATIDO [' + GET_FN_ICONE_PENALTI_NAO_BATIDO + ']' ) ;
         PUT_LOG ( E.Message ) ;
         Result := Nil ;
         End ;
      End ;
   End
   Else
   Begin
   PUT_LOG ( 'NOT EXISTS NAO_BATIDO [' + GET_FN_ICONE_PENALTI_NAO_BATIDO + ']' ) ;
   Result := Nil ;
   End ;
End ;

Function TFutebol.GET_FN_SILHUETA : String ;
Begin
Result := Diretorio_Database + 'Times\silhueta.png' ;
End ;

Function TFutebol.GET_DIR_TIME ( Cod_Time : LongInt ) : String ;
Begin
If Cod_Time = 1 Then Begin
   Result := Diretorio_Database + 'Times\' + Partida.TIME_A_LONGO + '\'
End Else Begin
   Result := Diretorio_Database + 'Times\' + Partida.TIME_B_LONGO + '\' ;
End ;
CHECAR_DIRETORIO_DIRNAME ( Result ) ;
End ;

Function TFutebol.GET_DIR_TIME_CHYRON ( Cod_Time : LongInt ) : String ;
Begin
If Cod_Time = 1 Then
   Result := Diretorio_Database_Chyron + 'Times\' + Partida.TIME_A_LONGO + '\escudo.png'
   Else
   Result := Diretorio_Database_Chyron + 'Times\' + Partida.TIME_B_LONGO + '\escudo.png' ;
CHECAR_DIRETORIO_DIRNAME ( Result ) ;
End ;

Function TFutebol.GET_FN_ESCUDO_TIME_CHYRON ( Cod_Time : LongInt ) : String ;
Begin
If Cod_Time = 1 Then
   Result := Diretorio_Database_Chyron + 'Times\' + Partida.TIME_A_LONGO + '\escudo.png'
   Else
   Result := Diretorio_Database_Chyron + 'Times\' + Partida.TIME_B_LONGO + '\escudo.png' ;
CHECAR_DIRETORIO_FILENAME ( Result ) ;
End ;

Function TFutebol.GET_FN_ESCUDO_TIME_LOCAL ( Cod_Time : LongInt ) : String ;
Begin
If Cod_Time = 1 Then
   Result := Diretorio_Database + 'Times\' + Partida.TIME_A_LONGO + '\escudo.png'
   Else
   Result := Diretorio_Database + 'Times\' + Partida.TIME_B_LONGO + '\escudo.png' ;
CHECAR_DIRETORIO_FILENAME ( Result ) ;
End ;

Function TFutebol.GET_FN_ESCUDO_TIME_POR_NOME ( Nome_Time : String ) : String ;
Begin
Result := Diretorio_Database + 'Times\' + Nome_Time + '\escudo.png' ;
CHECAR_DIRETORIO_FILENAME ( Result ) ;
End ;

Function TFutebol.GET_FN_TECNICO_TIME ( Cod_Time : LongInt ) : String ;
Begin
If Cod_Time = 1 Then
   Result := Diretorio_Database_Chyron + 'Times\' + Partida.TIME_A_LONGO + '\tecnico.png'
   Else
   Result := Diretorio_Database_Chyron + 'Times\' + Partida.TIME_B_LONGO + '\tecnico.png' ;
CHECAR_DIRETORIO_FILENAME ( Result ) ;
End ;

Function TFutebol.GET_FN_FOTO_JOGADOR_LOCAL ( Cod_Time : LongInt ; Jogador : String ) : String ;
Begin
Result := GET_DIR_FOTOS_LOCAL(Cod_Time) + Jogador + '.png' ;
CHECAR_DIRETORIO_FILENAME ( Result ) ;
End ;

Function TFutebol.GET_FN_FOTO_JOGADOR_CHYRON ( Cod_Time : LongInt ; Jogador : String ) : String ;
Begin
Result := GET_DIR_FOTOS_CHYRON(Cod_Time) + Jogador + '.png' ;
CHECAR_DIRETORIO_FILENAME ( Result ) ;
End ;

Function TFutebol.GET_TIME_CURTO ( Cod_Time : LongInt ) : String ;
Begin
Case Cod_Time Of
   1 : Result := Partida.TIME_A_CURTO ;
   2 : Result := Partida.TIME_B_CURTO ;
   Else
       Result := '' ;
   End  ;
End ;

Function TFutebol.GET_TIME_LONGO ( Cod_Time : LongInt ) : String ;
Begin
Case Cod_Time Of
   1 : Result := Partida.TIME_A_LONGO ;
   2 : Result := Partida.TIME_B_LONGO ;
   Else
       Result := '' ;
   End ;
End ;

Procedure TFutebol.ATUALIZAR_DIR_PARTIDA ( DT : TDateTime ; Nome : String ) ;
Begin
Partida.DT := DT ;
Partida.Nome := Nome ;
End ;
Function TFutebol.GET_DIR_PARTIDA : String ;
Begin
If Partida.Nome = '' Then
   Begin
   Result := '' ;
   Exit ;
   End ;
Result := GET_DIRETORIO_DATABASE_PARTIDAS +
          DATA_INVERSA(Partida.DT) + '\' +
          Partida.Nome + '\' ;
If NOT DirectoryUsable ( Result ) Then
   ForceDirectories ( Result ) ;
End ;

Function TFutebol.GET_FN_PARTIDA : String ;
Begin
If Partida.DT = 0 Then
   Begin
   Result := '' ;
   Exit ;
   End ;
If Partida.Nome = '' Then
   Begin
   Result := '' ;
   Exit ;
   End ;
Result := GET_DIR_PARTIDA + Partida.Nome + '.DAT' ;
End ;

Function TFutebol.GET_FN_COMENTARISTAS : String ;
Begin
If Partida.DT = 0 Then
   Begin
   Result := '' ;
   Exit ;
   End ;
If Partida.Nome = '' Then
   Begin
   Result := '' ;
   Exit ;
   End ;
Result := GET_DIR_PARTIDA + 'Comentaristas.DAT' ;
End ;

Function TFutebol.GET_FN_REPORTERES : String ;
Begin
If Partida.DT = 0 Then
   Begin
   Result := '' ;
   Exit ;
   End ;
If Partida.Nome = '' Then
   Begin
   Result := '' ;
   Exit ;
   End ;
Result := GET_DIR_PARTIDA + 'Reporteres.DAT' ;
End ;

Function TFutebol.GET_DIR_FOTOS_LOCAL ( Cod_Time : LongInt ) : String  ;
Begin
Result := GET_DIR_TIME ( Cod_Time ) + 'Fotos\' ;
CHECAR_DIRETORIO_DIRNAME ( Result ) ;
End ;

Function TFutebol.GET_DIR_ELENCO_LOCAL ( Cod_Time : LongInt ) : String  ;
Begin
Result := GET_DIR_TIME ( Cod_Time ) + 'Elenco\' ;
CHECAR_DIRETORIO_DIRNAME ( Result ) ;
End ;

Function TFutebol.GET_DIR_FOTOS_CHYRON ( Cod_Time : LongInt ) : String  ;
Begin
Result := GET_DIR_TIME_CHYRON ( Cod_Time ) + 'Fotos\' ;
CHECAR_DIRETORIO_DIRNAME ( Result ) ;
End ;

{
Function TFutebol.GET_FN_PARTIDA_PLACAR : String ;
Begin
If Partida.DT = 0 Then
   Begin
   Result := '' ;
   Exit ;
   End ;
If Partida.Nome = '' Then
   Begin
   Result := '' ;
   Exit ;
   End ;
Result := GET_DIR_PARTIDA + 'PLACAR.DAT' ;
End ;
}

Function TFutebol.GET_FN_DADOS_GERAIS : String ;
Begin
If Partida.DT = 0 Then
   Begin
   Result := '' ;
   Exit ;
   End ;
If Partida.Nome = '' Then
   Begin
   Result := '' ;
   Exit ;
   End ;
Result := GET_DIR_PARTIDA + 'DADOS_GERAIS.DAT' ;
End ;

{
Function TFutebol.GET_FN_ARBITRAGEM : String ;
Begin
If Partida.DT = 0 Then
   Begin
   Result := '' ;
   Exit ;
   End ;
If Partida.Nome = '' Then
   Begin
   Result := '' ;
   Exit ;
   End ;
Result := GET_DIR_PARTIDA + 'ARBITRAGEM.DAT' ;
End ;
}

Function TFutebol.GET_FN_JOGOS_EM_ANDAMENTO : String ;
Begin
If Partida.DT = 0 Then
   Begin
   Result := '' ;
   Exit ;
   End ;
If Partida.Nome = '' Then
   Begin
   Result := '' ;
   Exit ;
   End ;
Result := GET_DIR_PARTIDA + 'Partidas_em_Andamento.DAT' ;
End ;

{
Function TFutebol.GET_FN_REPORTERES : String ;
Begin
If Partida.DT = 0 Then
   Begin
   Result := '' ;
   Exit ;
   End ;
If Partida.Nome = '' Then
   Begin
   Result := '' ;
   Exit ;
   End ;
Result := GET_DIR_PARTIDA + 'REPORTERES.DAT' ;
End ;

Function TFutebol.GET_FN_COMENTARISTAS : String ;
Begin
If Partida.DT = 0 Then
   Begin
   Result := '' ;
   Exit ;
   End ;
If Partida.Nome = '' Then
   Begin
   Result := '' ;
   Exit ;
   End ;
Result := GET_DIR_PARTIDA + 'COMENTARISTAS.DAT' ;
End ;

Function TFutebol.GET_FN_PATROCINADORES : String ;
Begin
If Partida.DT = 0 Then
   Begin
   Result := '' ;
   Exit ;
   End ;
If Partida.Nome = '' Then
   Begin
   Result := '' ;
   Exit ;
   End ;
Result := GET_DIR_PARTIDA + 'PATROCINADORES.DAT' ;
End ;

Function TFutebol.GET_FN_BOLINHAS : String ;
Begin
If Partida.DT = 0 Then
   Begin
   Result := '' ;
   Exit ;
   End ;
If Partida.Nome = '' Then
   Begin
   Result := '' ;
   Exit ;
   End ;
Result := GET_DIR_PARTIDA + 'BOLINHAS.DAT' ;
End ;
}

Function TFutebol.GET_FN_PARTIDA_DADOS_PRINCIPAIS : String ;
Begin
If Partida.DT = 0 Then
   Begin
   Result := '' ;
   Exit ;
   End ;
If Partida.Nome = '' Then
   Begin
   Result := '' ;
   Exit ;
   End ;
Result := GET_DIR_PARTIDA + 'DADOS_PRINCIPAIS.DAT' ;
End ;

Function TFutebol.GET_FN_PARTIDA_ESTATISTICAS : String ;
Begin
If Partida.DT = 0 Then
   Begin
   Result := '' ;
   Exit ;
   End ;
If Partida.Nome = '' Then
   Begin
   Result := '' ;
   Exit ;
   End ;
Result := GET_DIR_PARTIDA + 'ESTATISTICAS.DAT' ;
End ;

Function TFutebol.GET_FN_PARTIDA_CRONOMETRO : String ;
Begin
If Partida.DT = 0 Then
   Begin
   Result := '' ;
   Exit ;
   End ;
If Partida.Nome = '' Then
   Begin
   Result := '' ;
   Exit ;
   End ;
Result := GET_DIR_PARTIDA + 'CRONOMETRO.DAT' ;
End ;

Function TFutebol.GET_FN_PARTIDA_ESCALACAO : String ;
Begin
If Partida.DT = 0 Then
   Begin
   Result := '' ;
   Exit ;
   End ;
If Partida.Nome = '' Then
   Begin
   Result := '' ;
   Exit ;
   End ;
Result := GET_DIR_PARTIDA + 'ESCALACAO.DAT' ;
End ;

Function TFutebol.GET_FN_PARTIDA_LB_COLA_A_TITULARES : String ;
Begin
If Partida.DT = 0 Then
   Begin
   Result := '' ;
   Exit ;
   End ;
If Partida.Nome = '' Then
   Begin
   Result := '' ;
   Exit ;
   End ;
Result := GET_DIR_PARTIDA + 'COLA_A_TITULARES.DAT' ;
End ;

Function TFutebol.GET_FN_PARTIDA_LB_COLA_B_TITULARES : String ;
Begin
If Partida.DT = 0 Then
   Begin
   Result := '' ;
   Exit ;
   End ;
If Partida.Nome = '' Then
   Begin
   Result := '' ;
   Exit ;
   End ;
Result := GET_DIR_PARTIDA + 'COLA_B_TITULARES.DAT' ;
End ;

Function TFutebol.GET_FN_PARTIDA_LB_COLA_A_RESERVAS : String ;
Begin
If Partida.DT = 0 Then
   Begin
   Result := '' ;
   Exit ;
   End ;
If Partida.Nome = '' Then
   Begin
   Result := '' ;
   Exit ;
   End ;
Result := GET_DIR_PARTIDA + 'COLA_A_RESERVAS.DAT' ;
End ;

Function TFutebol.GET_FN_PARTIDA_LB_COLA_B_RESERVAS : String ;
Begin
If Partida.DT = 0 Then
   Begin
   Result := '' ;
   Exit ;
   End ;
If Partida.Nome = '' Then
   Begin
   Result := '' ;
   Exit ;
   End ;
Result := GET_DIR_PARTIDA + 'COLA_B_RESERVAS.DAT' ;
End ;

Function TFutebol.GET_FN_PARTIDA_LB_COLA_A_FORA : String ;
Begin
If Partida.DT = 0 Then
   Begin
   Result := '' ;
   Exit ;
   End ;
If Partida.Nome = '' Then
   Begin
   Result := '' ;
   Exit ;
   End ;
Result := GET_DIR_PARTIDA + 'COLA_A_FORA.DAT' ;
End ;

Function TFutebol.GET_FN_PARTIDA_LB_COLA_B_FORA : String ;
Begin
If Partida.DT = 0 Then
   Begin
   Result := '' ;
   Exit ;
   End ;
If Partida.Nome = '' Then
   Begin
   Result := '' ;
   Exit ;
   End ;
Result := GET_DIR_PARTIDA + 'COLA_B_FORA.DAT' ;
End ;

Function TFutebol.GET_FN_PARTIDA_EVENTOS : String ;
Begin
If Partida.DT = 0 Then
   Begin
   Result := '' ;
   Exit ;
   End ;
If Partida.Nome = '' Then
   Begin
   Result := '' ;
   Exit ;
   End ;
Result := GET_DIR_PARTIDA + 'EVENTOS.DAT' ;
End ;

Procedure TFutebol.CLEAR ;
Begin
SetLength ( Arquivos, 0 ) ;
End ;

Procedure TFutebol.ADD ( Elemento : T_FN ) ;
Var Qtde : LongInt ;
Begin
Qtde := Length ( Arquivos ) ;
SetLength ( Arquivos, Qtde + 1 ) ;
Arquivos[Qtde-1] := Elemento ;
End ;

Function TFutebol.GET_DIRETORIO_DATABASE_PARTIDAS : String ;
Begin
Result := Diretorio_Database + 'Partidas\' ;
CHECAR_DIRETORIO_DIRNAME ( Result ) ;
End ;

Procedure INICIALIZAR_SG_EVENTOS ( Var SG : TStringGrid ) ;
Begin
With SG Do
  Begin
  ColCount := SG_EVENTOS_COD + 1 ;
  RowCount := 2 ;
  ColWidths[SG_EVENTOS_ITEM] := 40 ;
  ColWidths[SG_EVENTOS_STR] := 150 ;
  ColWidths[SG_EVENTOS_PERIODO] := 30 ;
  ColWidths[SG_EVENTOS_CRONO] := 60 ;
  ColWidths[SG_EVENTOS_PAR1] := 180 ;
  ColWidths[SG_EVENTOS_PAR2] := 40 ;
  ColWidths[SG_EVENTOS_PAR3] := 180 ;
  ColWidths[SG_EVENTOS_PAR4] := 40 ;
  ColWidths[SG_EVENTOS_COD] := 40 ;
  Cells[SG_EVENTOS_ITEM,0] := 'Item' ;
  Cells[SG_EVENTOS_STR,0] := 'Evento' ;
  Cells[SG_EVENTOS_PERIODO,0] := 'Per' ;
  Cells[SG_EVENTOS_CRONO,0] := 'Crono' ;
  Cells[SG_EVENTOS_PAR1,0] := 'Nome-1' ;
  Cells[SG_EVENTOS_PAR2,0] := 'Nº' ;
  Cells[SG_EVENTOS_PAR3,0] := 'Nome-2' ;
  Cells[SG_EVENTOS_PAR4,0] := 'Nº' ;
  Cells[SG_EVENTOS_COD,0] := 'Cód' ;
  End ;
End ;

Function TFutebol.GET_CRONO_SEG ( Periodo : LongInt ) : LongInt ;
Var _Diff : TDateTime ;
Begin
If ( Periodo < 1 ) OR ( Periodo > 2 ) Then
   Begin
   Result := 0 ;
   Exit ;
   End ;
If NOT Partida.DH_Inicio_Periodos_Pausado[Periodo] Then
   Begin
   //PUT_LOG ( 'GET_CRONO_SET ' + DateTimeToStr ( Partida.DH_Inicio_Periodos[Periodo] ) ) ;
   _Diff := Now - Partida.DH_Inicio_Periodos[Periodo] ;
   If ( _Diff > 120/1440 ) OR ( _Diff < 0 ) Then
      _Diff := 0 ;
   Result := TRUNC ( ( _Diff ) * SecsPerDay ) ;
   End
   Else
   Begin
   Result := TRUNC ( Partida.DH_Inicio_Periodos_Decorrido[Periodo] * SecsPerDay ) ;
   End ;
End ;

Procedure TFutebol.INICIALIZAR_SG_ESTATISTICAS ( SG : TStringGrid ) ;
Begin
With SG Do
  Begin
  ColWidths[0] := 120 ;
  ColWidths[1] := 35 ;
  ColWidths[2] := 35 ;
  Cells[0,0]  := 'Eventos/1' ;
  Cells[0,SG_ESTAT_LIN_SUBSTITUICOES]  := 'Substituições' ;
  Cells[0,SG_ESTAT_LIN_CARTOES_AMARELOS]  := 'C. Amarelos' ;
  Cells[0,SG_ESTAT_LIN_CARTOES_VERMELHOS]  := 'C. Vermelhos' ;
  Cells[0,SG_ESTAT_LIN_GOLS_PERDIDOS]  := 'Gols Perdidos' ;
  Cells[0,SG_ESTAT_LIN_FALTAS]  := 'Faltas' ;
  Cells[0,SG_ESTAT_LIN_IMPEDIMENTOS]  := 'Impedimentos' ;
  Cells[0,SG_ESTAT_LIN_ESCANTEIOS]  := 'Escanteios' ;
  Cells[0,SG_ESTAT_LIN_CONCLUSOES]  := 'Conclusões' ;
  Cells[0,SG_ESTAT_LIN_ERROS_DE_PASSE]  := 'Erros de Passe' ;
  Cells[0,SG_ESTAT_LIN_BOLAS_ROUBADAS] := 'Bolas Roubadas' ;
  Cells[0,SG_ESTAT_LIN_LEVANTAMENTOS] := 'Levantamentos' ;
  End ;
End ;

Constructor TFutebol.Create ( Dono : TComponent ; _SG_1 : TStringGrid ;
                              _SG_Eventos_1, _SG_Eventos_2 , _SG_Eventos_3 : TStringGrid ;
                              _SG_Classif : TStringGrid ;
                              SG_Remoto : Boolean ;
                              _SG_Tit_A, _SG_Tit_B , _SG_Res_A, _SG_Res_B : TStringGrid ) ;
Var Local    : LongInt ;
    Cod_Time : LongInt ;
Begin
Inherited Create ( Dono ) ;
Diretorio_Database := '' ;
Diretorio_Database_Chyron := '' ;
SetLength ( Array_Times, 0 ) ;
Funcao_Terminal := 2 ;
SG_Estat_1 := _SG_1 ;
Partida.Last_Conteudo_Placar := '' ;
Partida.Last_Conteudo_Eventos := '' ;
Partida.Last_Conteudo_Estatisticas := '' ;
SG_Eventos_1 := _SG_Eventos_1 ;
SG_Eventos_2 := _SG_Eventos_2 ;
SG_Eventos_3 := _SG_Eventos_3 ;
SG_Classificacao := _SG_Classif ;
SG_Tit_A := _SG_Tit_A ;
SG_Tit_B := _SG_Tit_B ;
SG_Res_A := _SG_Res_A ;
SG_Res_B := _SG_Res_B ;
SL_Esquemas_Taticos := TStringList.Create ;
Partida_Colas.Cola_A_Titulares := TStringList.Create ;
Partida_Colas.Cola_B_Titulares := TStringList.Create ;
Partida_Colas.Cola_A_Reservas := TStringList.Create ;
Partida_Colas.Cola_B_Reservas := TStringList.Create ;
Partida_Colas.Cola_A_Fora := TStringList.Create ;
Partida_Colas.Cola_B_Fora := TStringList.Create ;
Partida.DT := 0 ;
Partida.Nome := '' ;
{
Partida.Diferencas.P_A := FALSE ;
Partida.Diferencas.P_A_DT := 0 ;
Partida.Diferencas.P_B := FALSE ;
Partida.Diferencas.P_B_DT := 0 ;
}
Partida.Diferencas.Periodo := FALSE ;
Partida.Diferencas.Periodo_DT := 0 ;
Partida.Diferencas.Acrescimo := FALSE ;
Partida.Diferencas.Acrescimo_DT := 0 ;
SetLength ( Partida.Camisas2[1], 0 ) ;
SetLength ( Partida.Camisas2[2], 0 ) ;
//Partida.Camisas[1] := TStringList.Create ;
//Partida.Camisas[2] := TStringList.Create ;
For Cod_Time := 1 To 2 Do
   Begin
   For Local := 1 To MAX_TITULARES Do
      Begin
      With Partida.Titulares_Originais[Cod_Time, Local] Do
          Begin
          Camisa := 0 ;
          Nome := '' ;
          Combo := '' ;
          End ;
      With Partida.Titulares_Andamento[Cod_Time, Local] Do
          Begin
          Camisa := 0 ;
          Nome := '' ;
          Combo := '' ;
          End ;
      End ;
   For Local := 1 To MAX_RESERVAS Do
      Begin
      With Partida.Reservas_Originais[Cod_Time, Local] Do
          Begin
          Camisa := 0 ;
          Nome := '' ;
          Combo := '' ;
          End ;
      With Partida.Reservas_Andamento[Cod_Time, Local] Do
          Begin
          Camisa := 0 ;
          Nome := '' ;
          Combo := '' ;
          End ;
      With Partida.Fora_Andamento[Cod_Time, Local] Do
          Begin
          Camisa := 0 ;
          Nome := '' ;
          Combo := '' ;
          End ;
      End ;
   End ;
//
SG_CLASSIF_POSICAO  := 0 ;
SG_CLASSIF_CLUBE    := 1 ;
SG_CLASSIF_PG       := 2 ;
SG_CLASSIF_VI       := 3 ;
SG_CLASSIF_SG       := 4 ;
SG_CLASSIF_GP       := 5 ;
SG_CLASSIF_JG       := 6 ;
SG_CLASSIF_EM       := 7 ;
SG_CLASSIF_DE       := 8 ;
SG_CLASSIF_GC       := 9 ;
SG_CLASSIF_APROV    := 10 ;
//
Atualizar_Controles := TRUE ;
SetLength ( Partida.Eventos_Estatisticos, 0 ) ;
SetLength ( Partida.Eventos_Controle, 0 ) ;
INICIALIZAR_SG_ESTATISTICAS ( SG_Estat_1 ) ;
If SG_Classificacao <> Nil Then
   INICIALIZAR_SG_CLASSIFICACAO ( SG_Classificacao ) ;
If SG_Eventos_1 <> Nil Then
   INICIALIZAR_SG_EVENTOS ( SG_Eventos_1 ) ;
If SG_Eventos_2 <> Nil Then
   INICIALIZAR_SG_EVENTOS ( SG_Eventos_2 ) ;
If SG_Eventos_3 <> Nil Then
   INICIALIZAR_SG_EVENTOS ( SG_Eventos_3 ) ;
GRAVACOES_BLOQUEADAS := FALSE ;
End ;

Function TFutebol.INDEX_OF_CAMISA ( Cod_Time : LongInt ; Camisa : LongInt ) : LongInt ;
//Var Qtde : LongInt ;
Begin
Result := -1 ;
//If Qtde =  0 Then Beg
End ;

Function TFutebol.GET_EVENTO_POR_INT ( Evento : LongInt ) : TPut_Evento ;
Begin
If Evento = 0 Then Result := pe_Inicio_Jogo
Else If Evento = 1 Then Result := pe_Final_Jogo
Else If Evento = 2 Then Result := pe_Inicio_Periodo
Else If Evento = 3 Then Result := pe_Final_Periodo
Else If Evento = 4 Then Result := pe_Acrescimo
Else If Evento = 5 Then Result := pe_Interrupcao
Else If Evento = 6 Then Result := pe_Continuacao
Else If Evento = 7 Then Result := pe_Gol_A
Else If Evento = 8 Then Result := pe_Gol_B
Else If Evento = 9 Then Result := pe_Substituicao_A
Else If Evento = 10 Then Result := pe_Substituicao_B
Else If Evento = 11 Then Result := pe_Cartao_Amarelo_A
Else If Evento = 12 Then Result := pe_Cartao_Amarelo_B
Else If Evento = 13 Then Result := pe_Cartao_Vermelho_A
Else If Evento = 14 Then Result := pe_Cartao_Vermelho_B
Else
  Result := pe_Indefinido ;
End ;

Function TFutebol.GET_COD_TIME_POR_EVENTO ( Evento : TPut_Evento ) : LongInt ;
Begin
Case Evento Of
   pe_Gol_A ,
   pe_Substituicao_A ,
   pe_Cartao_Amarelo_A ,
   pe_Cartao_Vermelho_A : Result := 1 ;
   pe_Gol_B ,
   pe_Substituicao_B ,
   pe_Cartao_Amarelo_B ,
   pe_Cartao_Vermelho_B : Result := 2 ;
   Else
      Result := 0 ;
   End ;
End ;

Procedure TFutebol.CARREGAR_EVENTO_LINHA_SG ( SG : TStringGrid ; _Row : LongInt ; Var Evento : T_Evento ) ;
Var Aux : LongInt ;
Begin
Evento.Carregado := FALSE ;
If _Row < 1 Then
   Begin
   PUT_LOG ( 'ABORT CARREGAR_EVENTO_LINHA_SG Row < 1' ) ;
   Exit ;
   End ;
Aux := StrToIntDef ( SG.Cells[SG_EVENTOS_COD,_Row], -1 ) ;
If Aux = -1 Then
   Begin
   PUT_LOG ( 'ABORT CARREGAR_EVENTO_LINHA_SG Aux -1' ) ;
   Exit ;
   End ;
Evento.Evento2 := GET_EVENTO_POR_INT ( Aux ) ;
Evento.Cod_Time := GET_COD_TIME_POR_EVENTO ( Evento.Evento2 ) ;
Evento.Nome_Time := GET_TIME_LONGO ( Evento.Cod_Time ) ;
Evento.Par1 := Trim ( SG.Cells[SG_EVENTOS_PAR1,_Row] ) ;
Evento.Par2 := StrToIntDef ( Trim ( SG.Cells[SG_EVENTOS_PAR2,_Row] ) , -1 ) ;
Evento.Par3 := Trim ( SG.Cells[SG_EVENTOS_PAR3,_Row] ) ;
Evento.Par4 := StrToIntDef ( Trim ( SG.Cells[SG_EVENTOS_PAR4,_Row] ) , -1 ) ;
Evento.Carregado := TRUE ;
End ;

Function TFutebol.CARREGAR_EVENTOS_ESTATISTICOS : Boolean ;
Var Ini      : TMemIniFile ;
    Local    : LongInt ;
    Aux      : String ;
    Tags     : TStringList ;
    Evento   : T_Evento ;
Begin
If GET_DIR_PARTIDA = '' Then
   Begin
   Result := FALSE ;
   Exit ;
   End ;
PUT_LOG ( 'INI CARREGAR_EVENTOS_ESTATISTICOS' ) ;
Ini := TMemIniFile.Create ( GET_FN_PARTIDA ) ;
SetLength ( Partida.Eventos_Estatisticos, 0 ) ;
For Local := 0 To MAX_EVENTOS - 1 Do
   Begin
   Aux := Ini.ReadString ( 'EVENTOS_ESTATISTICOS', 'EVT_' + StrZero(Local,4), '' ) ;
   If Aux = '' Then
      Break ;
   Tags := Explode_Simples ( Aux, '#' ) ;
   If Tags.Count >= 6 Then
      Begin
      Evento.Evento2 := GET_EVENTO_POR_INT ( StrToIntDef ( Tags[2], 0 ) ) ;
      Evento.Cod_Time := GET_COD_TIME_POR_EVENTO ( Evento.Evento2 ) ;
      Evento.Nome_Time := GET_TIME_LONGO ( Evento.Cod_Time ) ;
      Evento.Par1 := Tags[3] ;
      Evento.Par2 := StrToIntDef ( Tags[4], -1 ) ;
      Evento.Par3 := Tags[5] ;
      Evento.Par4 := StrToIntDef ( Tags[6], -1 ) ;
      SetLength ( Partida.Eventos_Estatisticos, Local + 1 ) ;
      Partida.Eventos_Estatisticos[Local] := Evento ;
      End ;
   End ;
Ini.Free ;
REFRESH_ARQUIVO ( GET_FN_PARTIDA ) ;
Result := TRUE ;
PUT_LOG ( 'FIM CARREGAR_EVENTOS_ESTATISTICOS' ) ;
End ;

Function TFutebol.CARREGAR_PARTIDA_PLACAR : Boolean ;
Var Ini    : TMemIniFile ;
    FN     : String ;
    A      ,
    B      : LongInt ;
    Verm_A ,
    Verm_B : LongInt ;
Begin
Result := TRUE ;
FN := GET_FN_PARTIDA ;
PUT_LOG ( 'INI CARREGAR PARTIDA_PLACAR [' + FN + ']' ) ;
Ini := TMemIniFile.Create ( FN ) ;
A := Ini.ReadInteger ( 'PARTIDA', 'PLACAR_A', 0 ) ;
B := Ini.ReadInteger ( 'PARTIDA', 'PLACAR_B', 0 ) ;
Verm_A := Ini.ReadInteger ( 'PARTIDA', 'VERMELHOS_A', 0 ) ;
Verm_B := Ini.ReadInteger ( 'PARTIDA', 'VERMELHOS_B', 0 ) ;
SET_PLACAR ( A, B, Verm_A, Verm_B, SALVAR_FALSE ) ;
SET_PERIODO ( Ini.ReadInteger ( 'PARTIDA', 'PERIODO', 1 ), SALVAR_FALSE ) ;
SET_ACRESCIMO ( Ini.ReadInteger ( 'PARTIDA', 'ACRESCIMO', 0 ), SALVAR_FALSE ) ;
Ini.Free ;
REFRESH_ARQUIVO ( FN ) ;
PUT_LOG ( 'FIM CARREGAR PARTIDA_PLACAR' ) ;
End ;

Procedure TFutebol.CARREGAR_ESTATISTICAS ( FN : String ) ;
Var Ini      : TMemIniFile ;
    Cod_Time : LongInt ;
    Passo    : LongInt ;
Begin
Passo := 0 ;
Try
   Passo := 1 ;
   PUT_LOG ( 'INI CARREGAR_ESTATISTICAS [' + FN + ']' ) ;
   Passo := 2 ;
   If NOT RR_FileExists ( 'CARREGAR ESTATISTICAS', GET_FN_PARTIDA ) Then
      Begin
      Passo := 3 ;
      PUT_LOG ( 'Arquivo de Estatisticas Não Encontrado [' + GET_FN_PARTIDA + ']' ) ;
      End
      Else
      Begin
      Passo := 4 ;
      PUT_LOG ( 'Arquivo de Estatisticas OK [' + GET_FN_PARTIDA + ']' ) ;
      End ;
   Passo := 5 ;
   Ini := TMemIniFile.Create ( GET_FN_PARTIDA ) ;
   Passo := 6 ;
   For Cod_Time := 1 To 2 Do
      Begin
      Passo := 7 ;
      Partida.Clube[Cod_Time].Estatisticas.Faltas := Ini.ReadInteger ( 'ESTATISTICAS_' + IntToStr(Cod_Time),
                                                                       'FALTAS', 0 ) ;
      Partida.Clube[Cod_Time].Estatisticas.Impedimentos := Ini.ReadInteger ( 'ESTATISTICAS_' + IntToStr(Cod_Time),
                                                                             'IMPEDIMENTOS', 0 ) ;
      Partida.Clube[Cod_Time].Estatisticas.Substituicoes := Ini.ReadInteger ( 'ESTATISTICAS_' + IntToStr(Cod_Time),
                                                                              'SUBSTITUICOES', 0 ) ;
      Partida.Clube[Cod_Time].Estatisticas.Cartoes_Amarelos := Ini.ReadInteger ( 'ESTATISTICAS_' + IntToStr(Cod_Time),
                                                                                 'CARTOES_AMARELOS', 0 ) ;
      Partida.Clube[Cod_Time].Estatisticas.Cartoes_Vermelhos := Ini.ReadInteger ( 'ESTATISTICAS_' + IntToStr(Cod_Time),
                                                                                  'CARTOES_VERMELHOS', 0 ) ;
      Partida.Clube[Cod_Time].Estatisticas.Finalizacoes := Ini.ReadInteger ( 'ESTATISTICAS_' + IntToStr(Cod_Time),
                                                                             'FINALIZACOES', 0 ) ;
      Partida.Clube[Cod_Time].Estatisticas.Escanteios := Ini.ReadInteger ( 'ESTATISTICAS_' + IntToStr(Cod_Time),
                                                                           'ESCANTEIOS', 0 ) ;
      Partida.Clube[Cod_Time].Estatisticas.Chutes_a_Gol := Ini.ReadInteger ( 'ESTATISTICAS_' + IntToStr(Cod_Time),
                                                                             'CHUTES_A_GOL', 0 ) ;
      Partida.Clube[Cod_Time].Estatisticas.Bolas_Roubadas := Ini.ReadInteger ( 'ESTATISTICAS_' + IntToStr(Cod_Time),
                                                                               'BOLAS_ROUBADAS', 0 ) ;
      Partida.Clube[Cod_Time].Estatisticas.Erros_de_Passe := Ini.ReadInteger ( 'ESTATISTICAS_' + IntToStr(Cod_Time),
                                                                               'ERROS_DE_PASSE', 0 ) ;
      Partida.Clube[Cod_Time].Estatisticas.Gols_Perdidos := Ini.ReadInteger ( 'ESTATISTICAS_' + IntToStr(Cod_Time),
                                                                              'GOLS_PERDIDOS', 0 ) ;
      Partida.Clube[Cod_Time].Estatisticas.Conclusoes := Ini.ReadInteger ( 'ESTATISTICAS_' + IntToStr(Cod_Time),
                                                                           'CONCLUSOES', 0 ) ;
      Partida.Clube[Cod_Time].Estatisticas.Levantamentos := Ini.ReadInteger ( 'ESTATISTICAS_' + IntToStr(Cod_Time),
                                                                              'LEVANTAMENTOS', 0 ) ;
      End ;
   Passo := 8 ;
   Passo := 9 ;
   Passo := 10 ;
   Ini.Free ;
   Passo := 11 ;
   REFRESH_ARQUIVO ( FN ) ;
   Passo := 12 ;
   PUT_LOG ( 'FIM CARREGAR_ESTATISTICAS' ) ;
   Passo := 13 ;
   Except
   On E : Exception Do
      Begin
      ShowMessage ( 'Exception CARREGAR_ESTATISTICAS Passo ' + IntToStr(Passo) + LFLF +
                    E.Message ) ;
      End ;
   End ;
End ;

Function TFutebol.GET_FN_TEMPORARIO : String ;
Var Indice : LongInt ;
Begin
CHECAR_DIRETORIO_DIRNAME ( Diretorio_Database + 'Temp' ) ;
Indice := 1 ;
Repeat
   Result := Diretorio_Database + 'Temp\' + IntToStr(GetTickCount) + '_' + StrZero(Indice,6) + '.DAT' ;
   Inc ( Indice ) ;
   Until NOT RR_FileExists ( 'GET FN_TEMPORARIO', Result ) ;
End ;

Function TFutebol.CARREGAR_PARTIDA ( Origem : String ; Pode_Salvar : Boolean ) : Boolean ;
Var Ini       : TMemIniFile ;
    Temp      : String ;
    Local2    : LongInt ;
Begin
If GET_DIR_PARTIDA = '' Then
   Begin
   Result := FALSE ;
   Exit ;
   End ;
GRAVACOES_BLOQUEADAS := TRUE ;
Try
   Temp := GET_FN_TEMPORARIO ;
   PUT_LOG ( 'INI CARREGAR_PARTIDA [' + Origem + '][' + GET_FN_PARTIDA + ']' ) ;
   For Local2 := 1 To 10 Do
      Begin
      PUT_LOG ( 'TEMP [' + TEMP + ']' ) ;
      If CopiaArquivo ( 'TFutebol.CARREGAR_PARTIDA',
                        GET_FN_PARTIDA, Temp, TRUE ) Then
         Break ;
      Sleep ( 100 ) ;
      End ;
   Ini := TMemIniFile.Create ( Temp ) ;
   //
   Partida.TIME_A_LONGO := Ini.ReadString ( 'PARTIDA', 'PLACAR_TIME_A_LONGO', 'Time-123' ) ;
   Partida.TIME_A_CURTO := Ini.ReadString ( 'PARTIDA', 'PLACAR_TIME_A_CURTO', '123' ) ;
   Partida.TECNICO_A := Ini.ReadString ( 'PARTIDA', 'PARTIDA_TECNICO_A', '123' ) ;
   Partida.ESQUEMA_A := Ini.ReadString ( 'PARTIDA', 'PARTIDA_ESQUEMA_A', '1-2-3' ) ;
   //
   Partida.TIME_B_LONGO := Ini.ReadString ( 'PARTIDA', 'PLACAR_TIME_B_LONGO', 'Time-456' ) ;
   Partida.TIME_B_CURTO := Ini.ReadString ( 'PARTIDA', 'PLACAR_TIME_B_CURTO', '456' ) ;
   Partida.TECNICO_B := Ini.ReadString ( 'PARTIDA', 'PARTIDA_TECNICO_B', '456' ) ;
   Partida.ESQUEMA_B := Ini.ReadString ( 'PARTIDA', 'PARTIDA_ESQUEMA_B', '4-5-6' ) ;
   //
   Partida.DH_Inicio_Periodos[1] := StrToDateTime ( Ini.ReadString ( 'PARTIDA', 'DH_INICIO_PERIODO_1', '0' ) ) ;
   Partida.DH_Inicio_Periodos[2] := StrToDateTime ( Ini.ReadString ( 'PARTIDA', 'DH_INICIO_PERIODO_2', '0' ) ) ;
   Partida.DH_Inicio_Periodos[3] := StrToDateTime ( Ini.ReadString ( 'PARTIDA', 'DH_INICIO_PERIODO_3', '0' ) ) ;
   Partida.DH_Inicio_Periodos[4] := StrToDateTime ( Ini.ReadString ( 'PARTIDA', 'DH_INICIO_PERIODO_4', '0' ) ) ;
   //
   Ini.Free ;
   Except
   On E : Exception Do
      Begin
      ShowMessage ( 'Exception CARREGAR_PARTIDA' + LFLF +
                    E.Message ) ;
      End ;
   End ;
If RR_DeleteFile ( 'CARREGAR PARTIDA', Temp ) Then ;
PUT_LOG ( 'FIM CARREGAR_PARTIDA' ) ;
CARREGAR_ESCALACAO ( GET_FN_PARTIDA ) ;
CARREGAR_JOGOS_EM_ANDAMENTO ( GET_FN_PARTIDA ) ;
CARREGAR_ARBITRAGEM ( GET_FN_PARTIDA )  ;
CARREGAR_ARBITRAGEM_VAR ( GET_FN_PARTIDA )  ;
CARREGAR_PATROCINADORES ( GET_FN_PARTIDA ) ;
CARREGAR_BOLINHAS ( GET_FN_PARTIDA ) ;
CARREGAR_ESTATISTICAS ( GET_FN_PARTIDA ) ;
CARREGAR_PARTIDA_PLACAR ;
CARREGAR_EVENTOS_ESTATISTICOS ;
CARREGAR_REPORTERES ( GET_FN_PARTIDA ) ;
CARREGAR_COMENTARISTAS ( 'CARREGAR_PARTIDA' ) ;
Result := TRUE ;
ATUALIZAR_ESTATISTICAS ( SG_Estat_1 ) ;
PROC_PLOTAR_EVENTOS_ESTATISTICOS ;
GRAVACOES_BLOQUEADAS := FALSE ;
End ;

Procedure TFutebol.SALVAR_PLACAR_PARTIDA ( Origem : String ) ;
Begin
_Debug ( 'INI SALVAR_PLACAR_PARTIDA' ) ;
SALVAR_MATRIZ ( Origem, FLAG_FUT_PLACAR ) ;
_Debug ( 'FIM SALVAR_PLACAR_PARTIDA' ) ;
End ;

Procedure TFutebol.SALVAR_DADOS_PRINCIPAIS_DA_PARTIDA ( Origem : String ) ;
Begin
SALVAR_MATRIZ ( Origem, FLAG_FUT_GERAL ) ;
End ;

Procedure TFutebol.SALVAR_DADOS_PARTIDA_CRONOMETRO ( Origem : String ) ;
Begin
SALVAR_MATRIZ ( Origem, FLAG_FUT_CRONOMETRO ) ;
End ;

Procedure TFutebol.CARREGAR_ESCALACAO ( FN : String ) ;
Var Ini      : TMemIniFile ;
    Cod_Time : LongInt ;
    Local    : LongInt ;
    Secao    : String ;
Begin
Ini := TMemIniFile.Create ( FN ) ;
//
For Cod_Time := 1 To 2 Do
   Begin
   If Cod_Time = 1 Then
      Secao := 'ESCALACAO_TITULARES_ORIGINAIS_A'
      Else
      Secao := 'ESCALACAO_TITULARES_ORIGINAIS_B' ;
   For Local := 1 To MAX_TITULARES Do
      Begin
      Partida.Titulares_Originais[Cod_Time, Local].Nome := Ini.ReadString ( Secao, 'NOME_' + StrZero(Local,2), '' ) ;
      Partida.Titulares_Originais[Cod_Time, Local].Camisa := Ini.ReadInteger ( Secao, 'CAMISA_' + StrZero(Local,2), 0 ) ;
      Partida.Titulares_Originais[Cod_Time, Local].Combo := Ini.ReadString ( Secao, 'COMBO_' + StrZero(Local,2), '' ) ;
      End ;
   //
   If Cod_Time = 1 Then
      Secao := 'ESCALACAO_RESERVAS_ORIGINAIS_A'
      Else
      Secao := 'ESCALACAO_RESERVAS_ORIGINAIS_B' ;
   For Local := 1 To MAX_RESERVAS Do
      Begin
      Partida.Reservas_Originais[Cod_Time, Local].Nome := Ini.ReadString ( Secao, 'NOME_' + StrZero(Local,2), '' ) ;
      Partida.Reservas_Originais[Cod_Time, Local].Camisa := Ini.ReadInteger ( Secao, 'CAMISA_' + StrZero(Local,2), 0 ) ;
      Partida.Reservas_Originais[Cod_Time, Local].Combo := Ini.ReadString ( Secao, 'COMBO_' + StrZero(Local,2), '' ) ;
      End ;
   //
   If Cod_Time = 1 Then
      Secao := 'ESCALACAO_TITULARES_ANDAMENTO_A'
      Else
      Secao := 'ESCALACAO_TITULARES_ANDAMENTO_B' ;
   For Local := 1 To MAX_TITULARES Do
      Begin
      Partida.Titulares_Andamento[Cod_Time, Local].Nome := Ini.ReadString ( Secao, 'NOME_' + StrZero(Local,2), '' ) ;
      Partida.Titulares_Andamento[Cod_Time, Local].Camisa := Ini.ReadInteger ( Secao, 'CAMISA_' + StrZero(Local,2), 0 ) ;
      Partida.Titulares_Andamento[Cod_Time, Local].Combo := Ini.ReadString ( Secao, 'COMBO_' + StrZero(Local,2), '' ) ;
      End ;
   //
   If Cod_Time = 1 Then
      Secao := 'ESCALACAO_RESERVAS_ANDAMENTO_A'
      Else
      Secao := 'ESCALACAO_RESERVAS_ANDAMENTO_B' ;
   For Local := 1 To MAX_RESERVAS Do
      Begin
      Partida.Reservas_Andamento[Cod_Time, Local].Nome := Ini.ReadString ( Secao, 'NOME_' + StrZero(Local,2), '' ) ;
      Partida.Reservas_Andamento[Cod_Time, Local].Camisa := Ini.ReadInteger ( Secao, 'CAMISA_' + StrZero(Local,2), 0 ) ;
      Partida.Reservas_Andamento[Cod_Time, Local].Combo := Ini.ReadString ( Secao, 'COMBO_' + StrZero(Local,2), '' ) ;
      End ;
   //
   If Cod_Time = 1 Then
      Secao := 'ESCALACAO_FORA_ANDAMENTO_A'
      Else
      Secao := 'ESCALACAO_FORA_ANDAMENTO_B' ;
   For Local := 1 To MAX_RESERVAS Do
      Begin
      Partida.Fora_Andamento[Cod_Time, Local].Nome := Ini.ReadString ( Secao, 'NOME_' + StrZero(Local,2), '' ) ;
      Partida.Fora_Andamento[Cod_Time, Local].Camisa := Ini.ReadInteger ( Secao, 'CAMISA_' + StrZero(Local,2), 0 ) ;
      Partida.Fora_Andamento[Cod_Time, Local].Combo := Ini.ReadString ( Secao, 'COMBO_' + StrZero(Local,2), '' ) ;
      End ;
   End ;
Ini.Free ;
CARREGAR_SG_PELAS_ESCALACOES ;
End ;

Procedure TFutebol.SALVAR_ESCALACAO ( Origem : String ) ;
Begin
SALVAR_MATRIZ ( Origem, FLAG_FUT_ESCALACAO ) ;
End ;

Procedure TFutebol.ATUALIZAR_ESTATISTICAS ( SG : TStringGrid ) ;
Var Linha  ,
    Coluna : LongInt ;
    Local  : LongInt ;
Begin
Atualizar_Controles := FALSE ;
For Local := 1 To 2 Do
   Begin
   With SG Do
      Begin
      Cells[1,0] := Partida.TIME_A_CURTO ;
      Cells[2,0] := Partida.TIME_B_CURTO ;
      Cells[1,SG_ESTAT_LIN_SUBSTITUICOES] := IntToStr ( Partida.Clube[1].Estatisticas.Substituicoes ) ;
      Cells[2,SG_ESTAT_LIN_SUBSTITUICOES] := IntToStr ( Partida.Clube[2].Estatisticas.Substituicoes ) ;
      Cells[1,SG_ESTAT_LIN_CARTOES_AMARELOS] := IntToStr ( Partida.Clube[1].Estatisticas.Cartoes_Amarelos ) ;
      Cells[2,SG_ESTAT_LIN_CARTOES_AMARELOS] := IntToStr ( Partida.Clube[2].Estatisticas.Cartoes_Amarelos  ) ;
      Cells[1,SG_ESTAT_LIN_CARTOES_VERMELHOS] := IntToStr ( Partida.Clube[1].Estatisticas.Cartoes_Vermelhos ) ;
      Cells[2,SG_ESTAT_LIN_CARTOES_VERMELHOS] := IntToStr ( Partida.Clube[2].Estatisticas.Cartoes_Vermelhos ) ;
      Cells[1,SG_ESTAT_LIN_GOLS_PERDIDOS] := IntToStr ( Partida.Clube[1].Estatisticas.Gols_Perdidos ) ;
      Cells[2,SG_ESTAT_LIN_GOLS_PERDIDOS] := IntToStr ( Partida.Clube[2].Estatisticas.Gols_Perdidos ) ;
      Cells[1,SG_ESTAT_LIN_FALTAS] := IntToStr ( Partida.Clube[1].Estatisticas.Faltas ) ;
      Cells[2,SG_ESTAT_LIN_FALTAS] := IntToStr ( Partida.Clube[2].Estatisticas.Faltas ) ;
      Cells[1,SG_ESTAT_LIN_IMPEDIMENTOS] := IntToStr ( Partida.Clube[1].Estatisticas.Impedimentos ) ;
      Cells[2,SG_ESTAT_LIN_IMPEDIMENTOS] := IntToStr ( Partida.Clube[2].Estatisticas.Impedimentos ) ;
      Cells[1,SG_ESTAT_LIN_ESCANTEIOS] := IntToStr ( Partida.Clube[1].Estatisticas.Escanteios ) ;
      Cells[2,SG_ESTAT_LIN_ESCANTEIOS] := IntToStr ( Partida.Clube[2].Estatisticas.Escanteios ) ;
      Cells[1,SG_ESTAT_LIN_CONCLUSOES] := IntToStr ( Partida.Clube[1].Estatisticas.Chutes_a_Gol ) ;
      Cells[2,SG_ESTAT_LIN_CONCLUSOES] := IntToStr ( Partida.Clube[2].Estatisticas.Chutes_a_Gol ) ;
      Cells[1,SG_ESTAT_LIN_ERROS_DE_PASSE] := IntToStr ( Partida.Clube[1].Estatisticas.Erros_de_Passe ) ;
      Cells[2,SG_ESTAT_LIN_ERROS_DE_PASSE] := IntToStr ( Partida.Clube[2].Estatisticas.Erros_de_Passe ) ;
      Cells[1,SG_ESTAT_LIN_BOLAS_ROUBADAS] := IntToStr ( Partida.Clube[1].Estatisticas.Bolas_Roubadas ) ;
      Cells[2,SG_ESTAT_LIN_BOLAS_ROUBADAS] := IntToStr ( Partida.Clube[2].Estatisticas.Bolas_Roubadas ) ;
      Cells[1,SG_ESTAT_LIN_LEVANTAMENTOS] := IntToStr ( Partida.Clube[1].Estatisticas.Levantamentos  ) ;
      Cells[2,SG_ESTAT_LIN_LEVANTAMENTOS] := IntToStr ( Partida.Clube[2].Estatisticas.Levantamentos  ) ;
      For Linha := 1 To RowCount - 1 Do
        For Coluna := 1 To 2 Do
          If Cells[Coluna,Linha] = '0' Then
             Cells[Coluna,Linha] := '' ;
      End ;
   End ;
Atualizar_Controles := TRUE ;
End ;

Procedure TFutebol.ADD_ESTATISTICA ( Cod_Time : LongInt ;
                                     Tipo : TParametro_Estatistica ;
                                     Valor : LongInt ) ;
Begin
Case Tipo Of
   te_Finalizacoes :     Begin
                         Inc ( Partida.Clube[Cod_Time].Estatisticas.Finalizacoes, Valor ) ;
                         Partida.Clube[Cod_Time].Estatisticas.Finalizacoes := MAX ( 0, Partida.Clube[Cod_Time].Estatisticas.Finalizacoes ) ;
                         End ;
   te_Cartoes_Amarelos : Begin
                         Inc ( Partida.Clube[Cod_Time].Estatisticas.Cartoes_Amarelos, Valor ) ;
                         Partida.Clube[Cod_Time].Estatisticas.Cartoes_Amarelos := MAX ( 0, Partida.Clube[Cod_Time].Estatisticas.Cartoes_Amarelos ) ;
                         End ;
   te_Cartoes_Vermelhos: Begin
                         Inc ( Partida.Clube[Cod_Time].Estatisticas.Cartoes_Vermelhos, Valor ) ;
                         Partida.Clube[Cod_Time].Estatisticas.Cartoes_Vermelhos := MAX ( 0, Partida.Clube[Cod_Time].Estatisticas.Cartoes_Vermelhos ) ;
                         End ;
   te_Bolas_Roubadas :   Begin
                         Inc ( Partida.Clube[Cod_Time].Estatisticas.Bolas_Roubadas, Valor ) ;
                         Partida.Clube[Cod_Time].Estatisticas.Bolas_Roubadas := MAX ( 0, Partida.Clube[Cod_Time].Estatisticas.Bolas_Roubadas ) ;
                         End ;
   te_Erros_de_Passe:    Begin
                         Inc ( Partida.Clube[Cod_Time].Estatisticas.Erros_de_Passe, Valor ) ;
                         Partida.Clube[Cod_Time].Estatisticas.Erros_de_Passe := MAX ( 0, Partida.Clube[Cod_Time].Estatisticas.Erros_de_Passe ) ;
                         End ;
   te_Conclusoes:        Begin
                         Inc ( Partida.Clube[Cod_Time].Estatisticas.Conclusoes, Valor ) ;
                         Partida.Clube[Cod_Time].Estatisticas.Conclusoes := MAX ( 0, Partida.Clube[Cod_Time].Estatisticas.Conclusoes ) ;
                         End ;
   te_Impedimentos :     Begin
                         Inc ( Partida.Clube[Cod_Time].Estatisticas.Impedimentos, Valor ) ;
                         Partida.Clube[Cod_Time].Estatisticas.Impedimentos := MAX ( 0, Partida.Clube[Cod_Time].Estatisticas.Impedimentos ) ;
                         End ;
   te_Faltas :           Begin
                         Inc ( Partida.Clube[Cod_Time].Estatisticas.Faltas, Valor ) ;
                         Partida.Clube[Cod_Time].Estatisticas.Faltas := MAX ( 0, Partida.Clube[Cod_Time].Estatisticas.Faltas ) ;
                         End ;
   te_Escanteios :       Begin
                         Inc ( Partida.Clube[Cod_Time].Estatisticas.Escanteios, Valor ) ;
                         Partida.Clube[Cod_Time].Estatisticas.Escanteios := MAX ( 0, Partida.Clube[Cod_Time].Estatisticas.Escanteios ) ;
                         End ;
   te_Chutes_a_Gol :     Begin
                         Inc ( Partida.Clube[Cod_Time].Estatisticas.Chutes_a_Gol, Valor ) ;
                         Partida.Clube[Cod_Time].Estatisticas.Chutes_a_Gol := MAX ( 0, Partida.Clube[Cod_Time].Estatisticas.Chutes_a_Gol ) ;
                         End ;
   te_Gols_Perdidos :    Begin
                         Inc ( Partida.Clube[Cod_Time].Estatisticas.Gols_Perdidos, Valor ) ;
                         Partida.Clube[Cod_Time].Estatisticas.Gols_Perdidos := MAX ( 0, Partida.Clube[Cod_Time].Estatisticas.Gols_Perdidos ) ;
                         End ;
   te_Levantamentos :    Begin
                         Inc ( Partida.Clube[Cod_Time].Estatisticas.Levantamentos, Valor ) ;
                         Partida.Clube[Cod_Time].Estatisticas.Levantamentos := MAX ( 0, Partida.Clube[Cod_Time].Estatisticas.Levantamentos ) ;
                         End ;
   End ;
ATUALIZAR_ESTATISTICAS ( SG_Estat_1 ) ;
SALVAR_ESTATISTICAS_PARTIDA ( 'ADD_ESTATISTICA', GET_FN_PARTIDA_ESTATISTICAS ) ;
End ;

Function TFutebol.STR_EVENTO ( Evento : TPut_Evento ) : String ;
Begin
If Evento = pe_Inicio_Jogo Then
   Result := 'Início de Partida'
Else If Evento = pe_Final_Jogo Then
   Result := 'Final de Partida'
Else If Evento = pe_Inicio_Periodo Then
   Result := 'Início de Período'
Else If Evento = pe_Final_Periodo Then
   Result := 'Final de Período'
Else If Evento = pe_Acrescimo Then
   Result := 'Acréscimo'
Else If Evento = pe_Interrupcao Then
   Result := 'Interrupção'
Else If Evento = pe_Continuacao Then
   Result := 'Continuação'
Else If Evento = pe_Gol_A Then
   Result := 'Gol Time A'
Else If Evento = pe_Gol_B Then
   Result := 'Gol Time B'
Else If Evento = pe_Substituicao_A Then
   Result := 'Substituição A'
Else If Evento = pe_Substituicao_B Then
   Result := 'Substituição B'
Else If Evento = pe_Cartao_Amarelo_A Then
   Result := 'Cartão Amarelo A'
Else If Evento = pe_Cartao_Amarelo_B Then
   Result := 'Cartão Amarelo B'
Else If Evento = pe_Cartao_Vermelho_A Then
   Result := 'Cartão Vermelho A'
Else If Evento = pe_Cartao_Vermelho_B Then
   Result := 'Cartão Vermelho B'
Else
  Result := 'Indefinido' ;
End ;

Function TFutebol.INT_EVENTO ( Evento : TPut_Evento ) : LongInt ;
Begin
If Evento = pe_Inicio_Jogo Then
   Result := 0
Else If Evento = pe_Final_Jogo Then
   Result := 1
Else If Evento = pe_Inicio_Periodo Then
   Result := 2
Else If Evento = pe_Final_Periodo Then
   Result := 3
Else If Evento = pe_Acrescimo Then
   Result := 4
Else If Evento = pe_Interrupcao Then
   Result := 5
Else If Evento = pe_Continuacao Then
   Result := 6
Else If Evento = pe_Gol_A Then
   Result := 7
Else If Evento = pe_Gol_B Then
   Result := 8
Else If Evento = pe_Substituicao_A Then
   Result := 9
Else If Evento = pe_Substituicao_B Then
   Result := 10
Else If Evento = pe_Cartao_Amarelo_A Then
   Result := 11
Else If Evento = pe_Cartao_Amarelo_B Then
   Result := 12
Else If Evento = pe_Cartao_Vermelho_A Then
   Result := 13
Else If Evento = pe_Cartao_Vermelho_B Then
   Result := 14
Else
  Result := 99 ;
End ;

Procedure TFutebol.PROC_PROTAR_EVENTOS_SG ( SG : TStringGrid ) ;
Var Local    : LongInt ;
    Qtde     : LongInt ;
Begin
INICIALIZAR_SG_EVENTOS ( SG ) ;
Qtde := Length ( Partida.Eventos_Estatisticos ) ;
If Qtde = 0 Then
   Begin
   PUT_LOG ( 'Exit PLOTAR_EVENTOS por Qtde=0' ) ;
   Exit ;
   End ;
SG.RowCount := Qtde + 1 ;
For Local := 0 To Qtde - 1 Do
   Begin
   SG.Cells[SG_EVENTOS_ITEM,Local+1] := StrZero(Local+1,3) ;
   SG.Cells[SG_EVENTOS_STR,Local+1] := STR_EVENTO ( Partida.Eventos_Estatisticos[Local].Evento2 ) ;
   SG.Cells[SG_EVENTOS_PERIODO,Local+1] := IntToStr(Partida.Eventos_Estatisticos[Local].Periodo ) ;
   SG.Cells[SG_EVENTOS_CRONO,Local+1] := SegundosToMMSS ( Partida.Eventos_Estatisticos[Local].Crono_Seg ) ;
   SG.Cells[SG_EVENTOS_PAR1,Local+1] := Partida.Eventos_Estatisticos[Local].Par1 ;
   SG.Cells[SG_EVENTOS_PAR2,Local+1] := IntToStr ( Partida.Eventos_Estatisticos[Local].Par2 ) ;
   SG.Cells[SG_EVENTOS_PAR3,Local+1] := Partida.Eventos_Estatisticos[Local].Par3 ;
   SG.Cells[SG_EVENTOS_PAR4,Local+1] := IntToStr ( Partida.Eventos_Estatisticos[Local].Par4 ) ;
   SG.Cells[SG_EVENTOS_COD,Local+1] := IntToStr ( INT_EVENTO ( Partida.Eventos_Estatisticos[Local].Evento2 ) ) ;
   End ;
SG.Row := SG.RowCount - 1 ;
SG.TopRow := MAX ( 1, SG.RowCount - SG.VisibleRowCount - 1 + 1 ) ;
End ;

Procedure TFutebol.PROC_PLOTAR_EVENTOS_ESTATISTICOS ;
Var Qtde     : LongInt ;
    SG       : TStringGrid ;
    Local_SG : LongInt ;
Begin
Qtde := Length ( Partida.Eventos_Estatisticos ) ;
If Qtde = 0 Then
   Begin
   PUT_LOG ( 'Exit PLOTAR_EVENTOS por Qtde=0' ) ;
   Exit ;
   End ;
PUT_LOG ( 'PLOTAR_EVENTOS Qtde=' + IntToStr(Qtde) ) ;
For Local_SG := 1 To 3 Do
   Begin
   If Local_SG = 1 Then
      SG := SG_Eventos_1
   Else If Local_SG = 2 Then
      Begin
      SG := Nil ;
      End
   Else
      SG := SG_Eventos_3 ;
   If SG = Nil Then
      Continue ;
   PROC_PROTAR_EVENTOS_SG ( SG ) ;
   End ;
End ;

Procedure TFutebol.PUT_EVENTO_ESTATISTICO ( _Evento : TPut_Evento ;
                                            _Par1 : String ; _Par2 : LongInt ;
                                            _Par3 : String ; _Par4 : LongInt ) ;
Var Qtde      : LongInt ;
    Local     : LongInt ;
    FN        : String ;
    Aux       : String ;
    _Cod_Time : LongInt ;
    Crono_Seg : LongInt ;
    Aux_Crono : String ;
    FN_Base   : String ;
    Indice    : LongInt ;
Begin
Qtde := Length ( Partida.Eventos_Estatisticos ) + 1 ;
SetLength ( Partida.Eventos_Estatisticos, Qtde ) ;
PUT_LOG ( 'ADD EVENTO [' + STR_EVENTO(_Evento) + '] ' +
          '1:[' + _Par1 + '/' + IntToStr(_Par2) + '] ' +
          '2:[' + _Par3 + '/' + IntToStr(_Par4) + ']' ) ;
_Cod_Time := GET_COD_TIME_POR_EVENTO ( _Evento ) ;
With Partida.Eventos_Estatisticos[Qtde-1] Do Begin
   Periodo := GET_PARTIDA_CONTEXTO.Per ;
   Crono_Seg := GET_CRONO_SEG ( GET_PARTIDA_CONTEXTO.Per ) ;
   Evento2 := _Evento ;
   Cod_Time := _Cod_Time ;
   Nome_Time := GET_TIME_LONGO ( Cod_Time ) ;
   Par1 := _Par1 ;
   Par2 := _Par2 ;
   Par3 := _Par3 ;
   Par4 := _Par4 ;
End ;
Crono_Seg := GET_CRONO_SEG ( GET_PARTIDA_CONTEXTO.Per ) ;
If Crono_Seg > (99 * 60 + 59) Then Begin
   Aux_Crono := '99:59' ;
End Else Begin
   Aux_Crono := SegundosToMMSS(Crono_Seg) ;
End ;
Aux := 'NOW=' + DateTimeToStr(Now) + sLineBreak +
       'PERIODO=' + IntToStr ( GET_PARTIDA_CONTEXTO.Per ) + sLineBreak +
       'PLACAR_A=' + IntToStr ( GET_PARTIDA_CONTEXTO.P_A ) + sLineBreak +
       'PLACAR_B=' + IntToStr ( GET_PARTIDA_CONTEXTO.P_B ) + sLineBreak +
       'CRONO_SEG=' + IntToStr ( Crono_Seg ) + sLineBreak +
       'AUX_CRONO=' + Aux_Crono + sLineBreak +
       'ACRESCIMO=' + IntToStr ( GET_PARTIDA_CONTEXTO.Acr ) + sLineBreak +
       'INICIO_PERIODO_1=' + DateTimeToStr ( Partida.DH_Inicio_Periodos[1] ) + sLineBreak +
       'INICIO_PERIODO_2=' + DateTimeToStr ( Partida.DH_Inicio_Periodos[2] ) + sLineBreak +
       'INICIO_PERIODO_3=' + DateTimeToStr ( Partida.DH_Inicio_Periodos[3] ) + sLineBreak +
       'INICIO_PERIODO_4=' + DateTimeToStr ( Partida.DH_Inicio_Periodos[4] ) + sLineBreak +
       'TERMINAL=' + IntToStr ( Codigo_Terminal ) + sLineBreak +
       'COD_TIME=' + IntToStr ( _Cod_Time ) + sLineBreak +
       'NOME_TIME=' + GET_TIME_LONGO ( _Cod_Time ) + sLineBreak +
       'EVENTO_INT=' + IntToStr ( GET_COD_TIME_POR_EVENTO ( _Evento ) ) + sLineBreak +
       'EVENTO_STR=' + STR_EVENTO(_Evento) + sLineBreak +
       'PAR1=' + _Par1 + sLineBreak +
       'PAR2=' + IntToStr ( _Par2 ) + sLineBreak +
       'PAR3=' + _Par3 + sLineBreak +
       'PAR4=' + IntToStr ( _Par4 ) + sLineBreak ;
FN := GET_DIR_PARTIDA + 'Indice_Evento.DAT' ;
Indice := StrToIntDef ( GET_CONTEUDO_M ( 'PUT_EVENTO_ESTATISTICO', FN ), 0 ) ;
Inc ( Indice ) ;
WRITE_FILE_CORE ( 'PUT_EVENTO_ESTATISTICO/1',
                  FN, IntToStr ( Indice ), DELAYED_FALSE ) ;
FN_Base := DATAHORA_INVERSA(Now) + '_' + StrZero(Indice,6) + '.DAT' ;
For Local := 1 To 2 Do Begin
   FN := GET_DIR_PARTIDA + IntToStr(Local) + '\' + FN_Base ;
   CHECAR_DIRETORIO_FILENAME ( FN ) ;
   WRITE_FILE_CORE ( 'PUT_EVENTO_ESTATISTICO/2',
                     FN, Aux, DELAYED_FALSE ) ;
   //
   FN := GET_DIR_PARTIDA + IntToStr(Local) + '\GERAL\' + FN_Base ;
   CHECAR_DIRETORIO_FILENAME ( FN ) ;
   WRITE_FILE_CORE ( 'PUT_EVENTO_ESTATISTICO/3',
                     FN, Aux, DELAYED_FALSE ) ;
End ;
//SALVAR_EVENTO_ESTATISTICO ( STR_EVENTO(_Evento), _Par1, _Par2, _Par3, _Par4 ) ;
PROC_PLOTAR_EVENTOS_ESTATISTICOS ;
SALVAR_ESTATISTICAS_PARTIDA ( 'PUT_EVENTO_ESTATISTICO', GET_FN_PARTIDA_ESTATISTICAS ) ;
End ;

Procedure TFutebol.SET_PLACAR ( Gols_A, Gols_B : LongInt ;
                                Vermelhos_A, Vermelhos_B : LongInt ; Salvar : Boolean ) ;
Begin
_Debug ( 'INI SET_PLACAR' ) ;
Partida_Contexto.Prot__PLACAR__A := Gols_A ;
_Debug ( '1 SET_PLACAR' ) ;
Partida_Contexto.Prot__PLACAR__B := Gols_B ;
_Debug ( '2 SET_PLACAR' ) ;
Partida_Contexto.Prot__VERMELHOS__A := Vermelhos_A ;
_Debug ( '3 SET_PLACAR' ) ;
Partida_Contexto.Prot__VERMELHOS__B := Vermelhos_B ;
_Debug ( '4 SET_PLACAR' ) ;
If Salvar Then Begin
   _Debug ( '5 SET_PLACAR' ) ;
   SALVAR_PLACAR_PARTIDA ( 'SET_PLACAR' ) ;
End ;
_Debug ( 'FIM SET_PLACAR' ) ;
End ;

Procedure TFutebol.SET_PERIODO ( Periodo : LongInt ; Salvar : Boolean ) ;
Begin
Partida_Contexto.Prot__Periodo__Atual := Periodo ;
If Salvar Then Begin
   SALVAR_PLACAR_PARTIDA ( 'SET_PERIODO' ) ;
End ;
End ;

Procedure TFutebol.SET_ACRESCIMO ( Acrescimo : LongInt ; Salvar : Boolean ) ;
Begin
Partida_Contexto.Prot__Acrescimo := Acrescimo ;
If Salvar Then Begin
   SALVAR_PLACAR_PARTIDA ( 'SET_ACRESCIMO' ) ;
End ;
End ;

Procedure TFutebol.LIMPAR_REGISTRO_JOGADOR ( Var Jogador : T_Jogador ) ;
Begin
With Jogador Do
   Begin
   Carregado := FALSE ;
   Codigo := -1 ;
   Codigo_Time := -1 ;
   Nome := '' ;
   Nome_Completo := '' ;
   Combo := '' ;
   Estado := '' ;
   Divisao := '' ;
   Nome_Time := '' ;
   DN := 0 ;
   Posicao := '' ;
   Camisa := -1 ;
   Titular := FALSE ;
   End ;
End ;

Function TFutebol.GET_DETALHE_JOGADOR ( Nome : String ) : T_Jogador ;
Begin
LIMPAR_REGISTRO_JOGADOR ( Result ) ;
Nome := Trim ( Nome ) ;
If Length ( Nome ) < 4 Then
   Exit ;
If NOT IS_DIGIT(Nome[1]) Then
   Exit ;
If NOT IS_DIGIT(Nome[2]) Then
   Exit ;
If Nome[3] <> #32 Then
   Exit ;
Result.Carregado := TRUE ;
Result.Camisa := StrToIntDef ( Copy ( Nome, 1, 2 ), 0 ) ;
Result.Nome := Copy ( Nome, 4, Length ( Nome ) ) ;
End ;

Procedure TFutebol.CARREGAR_ESQUEMAS_TATICOS ;
Var Dir       : String ;
    Resultado : LongInt ;
    RecDos    : TSearchRec ;
    Aux       : String ;
Begin
Dir := Diretorio_Database + 'Esquemas\' ;
CHECAR_DIRETORIO_DIRNAME ( Dir ) ;
SL_Esquemas_Taticos.Clear ;
Resultado := RR_FindFirst ( 'CARREGAR_ESQUEMAS_TATICOS', Dir + '*.txt', 0, RecDos ) ;
While Resultado = 0 Do
   Begin
   Aux := FN_EXTRAIR_EXTENSAO ( RecDos.Name ) ;
   SL_Esquemas_Taticos.Add ( Aux ) ;
   Resultado := SysUtils.FindNext ( RecDos ) ;
   End ;
SysUtils.FindClose ( RecDos ) ;
End ;

Procedure TFutebol.PRINT_STATUS ( LB : TListBox ) ;
Var Clube : LongInt ;
    Local : LongInt ;
    Qtde  : LongInt ;
    Aux   : String ;
Begin
If LB = Nil Then
   Exit ;
LB.Items.Clear ;
LB.Items.Add ( 'Diretorio_Database [' + Diretorio_Database + ']' ) ;
LB.Items.Add ( 'Diretorio_Database_Chyron [' + Diretorio_Database_Chyron + ']' ) ;
LB.Items.Add ( '========================================================' ) ;
LB.Items.Add ( 'Partida.DT [' + DateTimeToStr(Partida.DT) + ']' ) ;
LB.Items.Add ( 'Partida.Nome[' + Partida.Nome + ']' ) ;
LB.Items.Add ( 'GET_DIR_PARTIDA [' + GET_DIR_PARTIDA + ']' ) ;
LB.Items.Add ( 'GET_FN_PARTIDA [' + GET_FN_PARTIDA + ']' ) ;
LB.Items.Add ( '========================================================' ) ;
LB.Items.Add ( 'Função do terminal [' + IntToStr(Funcao_Terminal) + ']' ) ;
LB.Items.Add ( '========================================================' ) ;
LB.Items.Add ( 'Partida.Definicao.Nome_Estadio [' + Partida.Definicao.Nome_Estadio + ']' ) ;
LB.Items.Add ( 'Partida.Definicao.Municipio_Estadio [' + Partida.Definicao.Municipio_Estadio + ']' ) ;
LB.Items.Add ( 'Partida.Definicao.UF_Estadio [' + Partida.Definicao.UF_Estadio + ']' ) ;
LB.Items.Add ( 'Partida.Definicao.DH [' + DateTimeToStr(Partida.Definicao.DH) + ']' ) ;
LB.Items.Add ( 'Partida.Periodo [' + IntToStr(GET_PARTIDA_CONTEXTO.Per) + ']' ) ;
LB.Items.Add ( 'Partida.Acrescimo[' + IntToStr(GET_PARTIDA_CONTEXTO.Acr) + ']' ) ;
LB.Items.Add ( '========================================================' ) ;
LB.Items.Add ( 'Partida.TIME_A_LONGO [' + Partida.TIME_A_LONGO + ']' ) ;
LB.Items.Add ( 'Partida.TIME_A_CURTO [' + Partida.TIME_A_CURTO + ']' ) ;
LB.Items.Add ( 'Partida.TECNICO_A [' + Partida.TECNICO_A + ']' ) ;
LB.Items.Add ( 'Partida.ESQUEMA_A [' + Partida.ESQUEMA_A + ']' ) ;
LB.Items.Add ( 'Partida.P_LACAR_A [' + IntToStr(GET_PARTIDA_CONTEXTO.P_A) + ']' ) ;
LB.Items.Add ( '========================================================' ) ;
LB.Items.Add ( 'Partida.TIME_B_LONGO [' + Partida.TIME_B_LONGO + ']' ) ;
LB.Items.Add ( 'Partida.TIME_B_CURTO [' + Partida.TIME_B_CURTO + ']' ) ;
LB.Items.Add ( 'Partida.TECNICO_B [' + Partida.TECNICO_B + ']' ) ;
LB.Items.Add ( 'Partida.ESQUEMA_B [' + Partida.ESQUEMA_B + ']' ) ;
LB.Items.Add ( 'Partida.P_LACAR_B [' + IntToStr(GET_PARTIDA_CONTEXTO.P_B) + ']' ) ;
LB.Items.Add ( '========================================================' ) ;
LB.Items.Add ( 'Partida.Arbitragem.Arbitro [' + Partida.Arbitragem.Arbitro + ']' ) ;
LB.Items.Add ( 'Partida.Arbitragem.Auxiliar-1 [' + Partida.Arbitragem.Auxiliar_1 + ']' ) ;
LB.Items.Add ( 'Partida.Arbitragem.Auxiliar-2 [' + Partida.Arbitragem.Auxiliar_2 + ']' ) ;
LB.Items.Add ( 'Partida.Arbitragem.Auxiliar-3 [' + Partida.Arbitragem.Auxiliar_3 + ']' ) ;
LB.Items.Add ( '========================================================' ) ;
LB.Items.Add ( 'PATROCINADORES:' ) ;
For Local := 1 To MAX_PATROCINADORES Do
    LB.Items.Add ( 'Partida.Foguetes[' + IntToStr(Local) + '] [' + Partida.Foguetes[Local] + ']' ) ;
LB.Items.Add ( '========================================================' ) ;
LB.Items.Add ( 'BOLINHAS:' ) ;
For Local := 1 To MAX_PATROCINADORES Do
    LB.Items.Add ( 'Partida.Bolinhas[' + IntToStr(Local) + '] [' + Partida.Bolinhas[Local] + ']' ) ;
LB.Items.Add ( '========================================================' ) ;
LB.Items.Add ( 'REPÓRTERES:' ) ;
For Local := 1 To MAX_REPORTERES Do
    LB.Items.Add ( 'Reporter[' + Partida.Reporteres[Local].Nome + '] ' +
                   '[' + Partida.Reporteres[Local].Adicional + ']' ) ;
LB.Items.Add ( '========================================================' ) ;
LB.Items.Add ( 'COMENTARISTAS:' ) ;
For Local := 1 To MAX_COMENTARISTAS Do
    LB.Items.Add ( 'Comentarista[' + Partida.Comentaristas[Local].Nome + '] ' +
                   '[' + Partida.Comentaristas[Local].Adicional + ']' ) ;
LB.Items.Add ( '========================================================' ) ;
Qtde := Length(Partida.Eventos_Estatisticos) ;
LB.Items.Add ( 'Partida.Eventos Len [' + IntToStr(Qtde) + ']' ) ;
If Qtde>0 Then
   For Local := 0 To Qtde-1 Do
      Begin
      LB.Items.Add ( 'EVT-'+IntToStr(Local+1) + ' ' +
                     '[' + STR_EVENTO(Partida.Eventos_Estatisticos[Local].Evento2) + '/' +
                     IntToStr(INT_EVENTO(Partida.Eventos_Estatisticos[Local].Evento2)) + ']' +
                     '{' + Partida.Eventos_Estatisticos[Local].Par1 + '}' +
                     '{' + IntToStr(Partida.Eventos_Estatisticos[Local].Par2) + '}' +
                     '{' + Partida.Eventos_Estatisticos[Local].Par3 + '}' +
                     '{' + IntToStr(Partida.Eventos_Estatisticos[Local].Par4) + '}' ) ;
      End ;
LB.Items.Add ( '========================================================' ) ;
For Clube := 1 To 2 Do
   Begin
   LB.Items.Add ( 'CLUBE ' + IntToStr ( Clube ) ) ;
   Qtde := Length(Partida.Clube[Clube].Escalacao) ;
   LB.Items.Add ( 'Escalação [Qtde:' + IntToStr(Qtde) + ']' ) ;
   If Qtde > 0 Then
      For Local := 0 To Qtde - 1 Do
         Begin
         LB.Items.Add ( 'Jog-'+IntToStr(Local+1) + ' ' +
                        Partida.Clube[Clube].Escalacao[Local].Nome_Curto + ' ' +
                        '[' + IntToStr ( Partida.Clube[Clube].Escalacao[Local].Camisa ) + ']' +
                        '[Pos:' + Partida.Clube[Clube].Escalacao[Local].Posicao + ']' +
                        '[TIT:' + IFSN(Partida.Clube[Clube].Escalacao[Local].Titular) + ']' +
                        '[RES:' + IFSN(Partida.Clube[Clube].Escalacao[Local].Reserva) + ']' +
                        '[SUBS:' + IFSN(Partida.Clube[Clube].Escalacao[Local].Substituido) + ']' +
                        '[SUBS:' + IFSN(Partida.Clube[Clube].Escalacao[Local].Substituido) + ']' )
         End ;
   End ;
//
LB.Items.Add ( '========================================================' ) ;
LB.Items.Add ( 'Escalação Original do TIME A / TITULARES' ) ;
For Local := 1 To MAX_TITULARES Do
    Begin
    LB.Items.Add ( 'Titular A/' + IntToStr(Local) + ': ' +
                   Partida.Titulares_Originais[1,Local].Nome + ' {' +
                   IntToStr(Partida.Titulares_Originais[1,Local].Camisa) + '}' ) ;
    End ;
LB.Items.Add ( '========================================================' ) ;
LB.Items.Add ( 'Escalação Original do TIME A / RESERVAS' ) ;
For Local := 1 To MAX_RESERVAS Do
    Begin
    If Trim ( Partida.RESERVAS_Originais[1,Local].Nome ) = '' Then
       Continue ;
    LB.Items.Add ( 'Reserva A/' + IntToStr(Local) + ': ' +
                   Partida.Reservas_Originais[1,Local].Nome + ' {' +
                   IntToStr(Partida.Reservas_Originais[1,Local].Camisa) + '}' ) ;
    End ;
LB.Items.Add ( '========================================================' ) ;
LB.Items.Add ( 'Escalação Original do TIME B / TITULARES' ) ;
For Local := 1 To MAX_TITULARES Do
    Begin
    LB.Items.Add ( 'Titular B/' + IntToStr(Local) + ': ' +
                   Partida.Titulares_Originais[2,Local].Nome + ' {' +
                   IntToStr(Partida.Titulares_Originais[2,Local].Camisa) + '}' ) ;
    End ;
LB.Items.Add ( '========================================================' ) ;
LB.Items.Add ( 'Escalação Original do TIME B / RESERVAS' ) ;
For Local := 1 To MAX_RESERVAS Do
    Begin
    If Trim ( Partida.RESERVAS_Originais[2,Local].Nome ) = '' Then
       Continue ;
    LB.Items.Add ( 'Reserva B/' + IntToStr(Local) + ': ' +
                   Partida.Reservas_Originais[2,Local].Nome + ' {' +
                   IntToStr(Partida.Reservas_Originais[2,Local].Camisa) + '}' ) ;
    End ;
//
LB.Items.Add ( '========================================================' ) ;
LB.Items.Add ( 'Escalação em Andamento do TIME A / TITULARES' ) ;
For Local := 1 To MAX_TITULARES Do
    Begin
    LB.Items.Add ( 'Titular A/' + IntToStr(Local) + ': ' +
                   Partida.Titulares_Andamento[1,Local].Nome + ' {' +
                   IntToStr(Partida.Titulares_Andamento[1,Local].Camisa) + '}' ) ;
    End ;
LB.Items.Add ( '========================================================' ) ;
LB.Items.Add ( 'Escalação em andamento do TIME A / RESERVAS' ) ;
For Local := 1 To MAX_RESERVAS Do
    Begin
    If Trim ( Partida.RESERVAS_Originais[1,Local].Nome ) = '' Then
       Continue ;
    LB.Items.Add ( 'Reserva A/' + IntToStr(Local) + ': ' +
                   Partida.Reservas_Andamento[1,Local].Nome + ' {' +
                   IntToStr(Partida.Reservas_Andamento[1,Local].Camisa) + '}' ) ;
    End ;
LB.Items.Add ( '========================================================' ) ;
LB.Items.Add ( 'Escalação em andamento do TIME B / TITULARES' ) ;
For Local := 1 To MAX_TITULARES Do
    Begin
    LB.Items.Add ( 'Titular B/' + IntToStr(Local) + ': ' +
                   Partida.Titulares_Andamento[2,Local].Nome + ' {' +
                   IntToStr(Partida.Titulares_Andamento[2,Local].Camisa) + '}' ) ;
    End ;
LB.Items.Add ( '========================================================' ) ;
LB.Items.Add ( 'Escalação em andamento do TIME B / RESERVAS' ) ;
For Local := 1 To MAX_RESERVAS Do
    Begin
    If Trim ( Partida.RESERVAS_Originais[2,Local].Nome ) = '' Then
       Continue ;
    LB.Items.Add ( 'Reserva B/' + IntToStr(Local) + ': ' +
                   Partida.Reservas_Andamento[2,Local].Nome + ' {' +
                   IntToStr(Partida.Reservas_Andamento[2,Local].Camisa) + '}' ) ;
    End ;
//
LB.Items.Add ( '========================================================' ) ;
LB.Items.Add ( 'Tabela de classificação' ) ;
For Local := 1 To QTDE_CLUBES Do
     Begin
     Aux := COMPLETE ( Classificacao[Local].Clube, 20 ) + ' ' +
            'PG:' + COMPLETE ( IntToStr ( Classificacao[Local].P ) , 3 ) + ' ' +
            'VI:' + COMPLETE ( IntToStr ( Classificacao[Local].V ) , 3 ) + ' ' +
            'GP:' + COMPLETE ( IntToStr ( Classificacao[Local].GP ) , 3 ) + ' ' +
            'SG:' + COMPLETE ( IntToStr ( Classificacao[Local].SG ) , 3 ) + ' ' +
            'JG:' + COMPLETE ( IntToStr ( Classificacao[Local].J ) , 3 ) ;
     LB.Items.Add ( StrZero ( Local, 2 ) + ' ' + Aux ) ;
     End ;
End ;

Procedure TFutebol.INICIALIZAR_SG_CLASSIFICACAO ( SG : TStringGrid ) ;
Begin
With SG Do
   Begin
   ColCount := SG_CLASSIF_APROV + 1 ;
   RowCount := QTDE_CLUBES + 1 ;
   ColWidths[SG_CLASSIF_POSICAO] := 30 ;
   ColWidths[SG_CLASSIF_CLUBE] := 180 ;
   ColWidths[SG_CLASSIF_PG] := 30 ;
   ColWidths[SG_CLASSIF_JG] := 30 ;
   ColWidths[SG_CLASSIF_VI] := 30 ;
   ColWidths[SG_CLASSIF_SG] := 30 ;
   ColWidths[SG_CLASSIF_GP] := 30 ;
   ColWidths[SG_CLASSIF_EM] := -1 ; // 50 ;
   ColWidths[SG_CLASSIF_DE] := -1 ; // 50 ;
   ColWidths[SG_CLASSIF_GC] := -1 ; // 50 ;
   ColWidths[SG_CLASSIF_APROV] := -1 ; // 70 ;
   //
   Cells[SG_CLASSIF_POSICAO,0] := 'Pos' ;
   Cells[SG_CLASSIF_CLUBE,0] := 'Clube' ;
   Cells[SG_CLASSIF_PG,0] := 'PG' ;
   Cells[SG_CLASSIF_JG,0] := 'JG' ;
   Cells[SG_CLASSIF_VI,0] := 'VI' ;
   Cells[SG_CLASSIF_EM,0] := 'EM' ;
   Cells[SG_CLASSIF_DE,0] := 'DE' ;
   Cells[SG_CLASSIF_GP,0] := 'GP' ;
   Cells[SG_CLASSIF_GC,0] := 'GC' ;
   Cells[SG_CLASSIF_SG,0] := 'SG' ;
   Cells[SG_CLASSIF_APROV,0] := '%' ;
   //
   LIMPAR_SG ( SG, 1, 1 ) ;
   End ;
End ;

Function TFutebol.CAPTURAR_CLASSIFICACAO_MODO_1 ( Lista : TStringList ) : LongInt ;
Var Qtde    : LongInt ;
    Header  : String ;
    Linha   : LongInt ;
    Tags    : TStringList ;
    Local   : LongInt ;
    Aux     : String ;
    Aux2    : String ;
Begin
Result := -1 ;
If Lista = Nil Then
   Exit ;
Result := -2 ;
Qtde := Lista.Count ;
If Qtde = 11 Then
   Begin
   Header := Super_UpperCase ( Lista[0] ) ;
   If ( Pos ( 'CLUBES', Header ) = 0 ) OR
      ( Pos ( 'PG', Header ) = 0 ) OR
      ( Pos ( 'JG', Header ) = 0 ) OR
      ( Pos ( 'VI', Header ) = 0 ) OR
      ( Pos ( 'EM', Header ) = 0 ) OR
      ( Pos ( 'DE', Header ) = 0 ) OR
      ( Pos ( 'GP', Header ) = 0 ) OR
      ( Pos ( 'GC', Header ) = 0 ) OR
      ( Pos ( 'SG', Header ) = 0 ) OR
      ( Pos ( '%', Header ) = 0 ) Then
      Begin
      ShowMessage ( 'Cabeçalho inválido [' + Header + ']' ) ;
      Lista.Free ;
      Exit ;
      End ;
   //Tags := TStringList.Create ;
   INICIALIZAR_SG_CLASSIFICACAO ( SG_Classificacao ) ;
   Linha := 1 ;
   For Local := 1 To Qtde - 1 Do
      Begin
      Aux := Trim ( Lista[Local] ) ;
      Aux := SysUtils.StringReplace ( Aux, 'º', #9, [rfReplaceAll] ) ;
      Aux := SysUtils.StringReplace ( Aux, #9#9, #9, [rfReplaceAll] ) ;
      Aux2 := SysUtils.StringReplace ( Aux, #9, '{TAB}', [rfReplaceAll] ) ;
      PUT_LOG ( Aux2 ) ;
      Tags := EXPLODE_SIMPLES ( Aux, #9 ) ;
      If Tags.Count >= 11 Then
         Begin
         SG_Classificacao.RowCount := Linha + 1 ;
         SG_Classificacao.Cells[SG_CLASSIF_POSICAO,Linha] := Tags[0] ;
         SG_Classificacao.Cells[SG_CLASSIF_CLUBE,Linha] := Tags[1] ;
         SG_Classificacao.Cells[SG_CLASSIF_PG,Linha] := Tags[2] ;
         SG_Classificacao.Cells[SG_CLASSIF_JG,Linha] := Tags[3] ;
         SG_Classificacao.Cells[SG_CLASSIF_VI,Linha] := Tags[4] ;
         SG_Classificacao.Cells[SG_CLASSIF_EM,Linha] := Tags[5] ;
         SG_Classificacao.Cells[SG_CLASSIF_DE,Linha] := Tags[6] ;
         SG_Classificacao.Cells[SG_CLASSIF_GP,Linha] := Tags[7] ;
         SG_Classificacao.Cells[SG_CLASSIF_GC,Linha] := Tags[8] ;
         SG_Classificacao.Cells[SG_CLASSIF_SG,Linha] := Tags[9] ;
         SG_Classificacao.Cells[SG_CLASSIF_APROV,Linha] := Tags[10] ;
         Inc ( Linha ) ;
         End ;
      End ;
   Result := 1 ;
   End ;
End ;

Function TFutebol.IMPORTAR_TABELA_CLASSIFICACAO :  Boolean ;
Var Dados   : String ;
    Local   : LongInt ;
    Qtde    : LongInt ;
    Lista   : TStringList ;
   // Tags    : TStringList ;
Begin
{
Classificação
P	Clubes	PG	JG	VI	EM	DE	GP	GC	SG	%A
1ºFortaleza	9	3	3	0	0	9	1	8	100.0
2ºFloresta	8	4	2	2	0	7	4	3	66.7
3ºFerroviário	7	4	2	1	1	8	6	2	58.3
4ºIguatu	7	4	2	1	1	6	5	1	58.3
5ºHorizonte	4	4	1	1	2	5	9	-4	33.3
6ºCeará	3	3	1	0	2	7	7	0	33.3
7ºUniclinic	3	2	1	0	1	4	5	-1	50.0
8ºGuarani de Juazeiro	3	3	1	0	2	5	7	-2	33.3
9ºTiradentes	2	3	0	2	1	5	6	-1	22.2
10ºMaranguape	1	4	0	1	3	0	6	-6	8.3
}
{
1
Fortaleza	12	6	4	6
2
Ferroviário	11	6	3	4
3
Floresta	11	6	3	2
4
Iguatu	11	6	3	2
5
Ceará	10	6	3	4
6
Uniclinic	7	5	2	-2
7
Horizonte	7	6	2	-4
8
Guarani de Juazeiro	6	5	2	-2
9
Tiradentes	5	6	1	0
10
Maranguape	1	6	0	-10
}
Result := FALSE ;
Dados := Clipboard.AsText ;
Lista := TStringList.Create ;
Lista.Text := Dados ;
Qtde := Lista.Count ;
If Qtde > 0 Then
   For Local := Qtde - 1 DownTo 0 Do
      If Length ( Trim ( Lista[Local] ) ) < 10 Then
         Lista.Delete(Local) ;
Qtde := Lista.Count ;
If Qtde < 10 Then
   Begin
   ShowMessage ( 'A quantidade de linhas é inválida [' + IntToStr(Qtde) + ']' ) ;
   Lista.Free ;
   Exit ;
   End ;
If CAPTURAR_CLASSIFICACAO_MODO_1 ( Lista ) = 1 Then // OK, capturada a tabela completa
   Begin
   //Tags.Free ;
   Lista.Free ;
   Exit ;
   End ;
//Tags.Free ;
Lista.Free ;
End ;

Function TFutebol.GET_FN_ESQUEMA_TATICO ( Cod_Time : LongInt ) : String ;
Begin
Case Cod_Time Of
   1 : Result := GET_DIR_PARTIDA + 'Esquema_Tatico_A.txt' ;
   2 : Result := GET_DIR_PARTIDA + 'Esquema_Tatico_B.txt' ;
   Else
       Result := '' ;
   End ;
End ;

Procedure TFutebol.SALVAR_LBS_COLA ;
Begin
Try
   Partida_Colas.Cola_A_Titulares.SaveToFile ( GET_FN_PARTIDA_LB_COLA_A_TITULARES ) ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception SALVAR_LBS_COLA/1 [' + GET_FN_PARTIDA_LB_COLA_A_TITULARES + ']' ) ;
   End ;
End ;
Try
   Partida_Colas.Cola_B_Titulares.SaveToFile ( GET_FN_PARTIDA_LB_COLA_B_TITULARES ) ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception SALVAR_LBS_COLA/2 [' + GET_FN_PARTIDA_LB_COLA_B_TITULARES + ']' ) ;
   End ;
End ;
Try
   Partida_Colas.Cola_A_Reservas.SaveToFile ( GET_FN_PARTIDA_LB_COLA_A_RESERVAS ) ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception SALVAR_LBS_COLA/3 [' + GET_FN_PARTIDA_LB_COLA_A_RESERVAS + ']' ) ;
   End ;
End ;
Try
   Partida_Colas.Cola_B_Reservas.SaveToFile ( GET_FN_PARTIDA_LB_COLA_B_RESERVAS ) ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception SALVAR_LBS_COLA/4 [' + GET_FN_PARTIDA_LB_COLA_B_RESERVAS + ']' ) ;
   End ;
End ;
Try
   Partida_Colas.Cola_A_Fora.SaveToFile ( GET_FN_PARTIDA_LB_COLA_A_FORA ) ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception SALVAR_LBS_COLA/5 [' + GET_FN_PARTIDA_LB_COLA_A_FORA + ']' ) ;
   End ;
End ;
Try
   Partida_Colas.Cola_B_Fora.SaveToFile ( GET_FN_PARTIDA_LB_COLA_B_FORA ) ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception SALVAR_LBS_COLA/6 [' + GET_FN_PARTIDA_LB_COLA_B_FORA + ']' ) ;
   End ;
End ;
End ;

Procedure TFutebol.CARREGAR_LBS_COLA ;
Begin
Try
   If RR_FileExists ( 'CARREGAR_LBS_COLA/1', GET_FN_PARTIDA_LB_COLA_A_TITULARES ) Then Begin
      Partida_Colas.Cola_A_Titulares.Text :=
             GET_CONTEUDO_M ( 'CARREGAR_LBS_COLA/1', GET_FN_PARTIDA_LB_COLA_A_TITULARES ) ;
   End ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception CARREGAR_LBS_COLA/1 [' + GET_FN_PARTIDA_LB_COLA_A_TITULARES + ']' ) ;
   End ;
End ;
Try
   If RR_FileExists ( 'CARREGAR_LBS_COLA/2', GET_FN_PARTIDA_LB_COLA_B_TITULARES ) Then Begin
      Partida_Colas.Cola_B_Titulares.Text :=
             GET_CONTEUDO_M ( 'CARREGAR_LBS_COLA/2', GET_FN_PARTIDA_LB_COLA_B_TITULARES ) ;
   End ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception CARREGAR_LBS_COLA/2 [' + GET_FN_PARTIDA_LB_COLA_B_TITULARES + ']' ) ;
   End ;
End ;
Try
   If RR_FileExists ( 'CARREGAR_LBS_COLA/3', GET_FN_PARTIDA_LB_COLA_A_RESERVAS ) Then Begin
      Partida_Colas.Cola_A_Reservas.Text :=
             GET_CONTEUDO_M ( 'CARREGAR_LBS_COLA/3', GET_FN_PARTIDA_LB_COLA_A_RESERVAS ) ;
   End ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception CARREGAR_LBS_COLA/3 [' + GET_FN_PARTIDA_LB_COLA_A_RESERVAS + ']' ) ;
   End ;
End ;
Try
   If RR_FileExists ( 'CARREGAR_LBS_COLA/4', GET_FN_PARTIDA_LB_COLA_B_RESERVAS ) Then Begin
      Partida_Colas.Cola_B_Reservas.Text :=
             GET_CONTEUDO_M ( 'CARREGAR_LBS_COLA/4', GET_FN_PARTIDA_LB_COLA_B_RESERVAS ) ;
   End ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception CARREGAR_LBS_COLA/4 [' + GET_FN_PARTIDA_LB_COLA_B_RESERVAS + ']' ) ;
   End ;
End ;
Try
   If RR_FileExists ( 'CARREGAR_LBS_COLA/5', GET_FN_PARTIDA_LB_COLA_A_FORA ) Then Begin
      Partida_Colas.Cola_A_Fora.Text :=
             GET_CONTEUDO_M ( 'CARREGAR_LBS_COLA/5', GET_FN_PARTIDA_LB_COLA_A_FORA ) ;
   End ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception CARREGAR_LBS_COLA/5 [' + GET_FN_PARTIDA_LB_COLA_A_FORA + ']' ) ;
   End ;
End ;
Try
   If RR_FileExists ( 'CARREGAR_LBS_COLA/6', GET_FN_PARTIDA_LB_COLA_B_FORA ) Then Begin
      Partida_Colas.Cola_B_Fora.Text :=
             GET_CONTEUDO_M ( 'CARREGAR_LBS_COLA/6', GET_FN_PARTIDA_LB_COLA_B_FORA ) ;
   End ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception CARREGAR_LBS_COLA/6 [' + GET_FN_PARTIDA_LB_COLA_B_FORA + ']' ) ;
   End ;
End ;
End ;

Function TFutebol.GET_FN_TABELA_CLASSIFICACAO : String ;
Begin
Result := Diretorio_Database + 'Config\Tabela_Classificacao.DAT' ;
End ;

Procedure TFutebol.CARREGAR_CLASSIFICACAO_DA_SG ;
Var Local : LongInt ;
Begin
For Local := 1 To SG_Classificacao.RowCount - 1 Do
   With Classificacao[Local] Do
     Begin
     Clube := SG_Classificacao.Cells[SG_CLASSIF_CLUBE, Local] ;
     P := StrToIntDef ( SG_Classificacao.Cells[SG_CLASSIF_PG, Local], 0 ) ;
     V := StrToIntDef ( SG_Classificacao.Cells[SG_CLASSIF_VI, Local], 0 ) ;
     GP := StrToIntDef ( SG_Classificacao.Cells[SG_CLASSIF_GP, Local], 0 ) ;
     SG := StrToIntDef ( SG_Classificacao.Cells[SG_CLASSIF_SG, Local], 0 ) ;
     J := StrToIntDef ( SG_Classificacao.Cells[SG_CLASSIF_JG, Local], 0 ) ;
     End ;
End ;

Procedure TFutebol.CARREGAR_PATROCINADORES ( FN : String ) ;
Var Ini : TMemIniFile ;
Begin
PUT_LOG ( 'INI CARREGAR_PATROCINADORES [' + FN + ']' ) ;
Ini := TMemIniFile.Create ( FN ) ;
Partida.Foguetes[1] := Ini.ReadString ( 'PATROCINADORES', 'PAT-01', '' ) ;
Partida.Foguetes[2] := Ini.ReadString ( 'PATROCINADORES', 'PAT-02', '' ) ;
Partida.Foguetes[3] := Ini.ReadString ( 'PATROCINADORES', 'PAT-03', '' ) ;
Partida.Foguetes[4] := Ini.ReadString ( 'PATROCINADORES', 'PAT-04', '' ) ;
Partida.Foguetes[5] := Ini.ReadString ( 'PATROCINADORES', 'PAT-05', '' ) ;
Partida.Foguetes[6] := Ini.ReadString ( 'PATROCINADORES', 'PAT-06', '' ) ;
Ini.Free ;
REFRESH_ARQUIVO ( FN ) ;
PUT_LOG ( 'FIM CARREGAR_PATROCINADORES [' + FN + ']' ) ;
End ;

Procedure TFutebol.CARREGAR_BOLINHAS ( FN : String ) ;
Var Ini : TMemIniFile ;
Begin
PUT_LOG ( 'INI CARREGAR_BOLINHAS [' + FN + ']' ) ;
Ini := TMemIniFile.Create ( FN ) ;
Partida.Bolinhas[1] := Ini.ReadString ( 'BOLINHAS', 'BOL-01', '' ) ;
Partida.Bolinhas[2] := Ini.ReadString ( 'BOLINHAS', 'BOL-02', '' ) ;
Partida.Bolinhas[3] := Ini.ReadString ( 'BOLINHAS', 'BOL-03', '' ) ;
Partida.Bolinhas[4] := Ini.ReadString ( 'BOLINHAS', 'BOL-04', '' ) ;
Partida.Bolinhas[5] := Ini.ReadString ( 'BOLINHAS', 'BOL-05', '' ) ;
Partida.Bolinhas[6] := Ini.ReadString ( 'BOLINHAS', 'BOL-06', '' ) ;
Ini.Free ;
REFRESH_ARQUIVO ( FN ) ;
PUT_LOG ( 'FIM CARREGAR_BOLINHAS [' + FN + ']' ) ;
End ;

Procedure TFutebol.SALVAR_PATROCINADORES ( Origem : String ) ;
Begin
SALVAR_MATRIZ ( 'SALVAR_PATROCINADORES/' + Origem, FLAG_FUT_FOGUETES ) ;
End ;

Procedure TFutebol.SALVAR_BOLINHAS ( Origem : String ) ;
Begin
SALVAR_MATRIZ ( 'SALVAR_BOLINHAS/' + Origem, FLAG_FUT_BOLINHAS ) ;
End ;

Procedure TFutebol.CARREGAR_ARBITRAGEM ( FN : String ) ;
Var Ini : TMemIniFile ;
Begin
PUT_LOG ( 'INI CARREGAR_ARBITRAGEM [' + FN + ']' ) ;
Ini := TMemIniFile.Create ( FN ) ;
Partida.Arbitragem.Arbitro := Ini.ReadString ( 'ARBITRAGEM', 'ARBITRO', '' ) ;
Partida.Arbitragem.Estado := Ini.ReadString ( 'ARBITRAGEM', 'ESTADO', '' ) ;
Partida.Arbitragem.Auxiliar_1 := Ini.ReadString ( 'ARBITRAGEM', 'AUXILIAR_1', '' ) ;
Partida.Arbitragem.Estado_1 := Ini.ReadString ( 'ARBITRAGEM', 'ESTADO_1', '' ) ;
Partida.Arbitragem.Auxiliar_2 := Ini.ReadString ( 'ARBITRAGEM', 'AUXILIAR_2', '' ) ;
Partida.Arbitragem.Estado_2 := Ini.ReadString ( 'ARBITRAGEM', 'ESTADO_2', '' ) ;
Partida.Arbitragem.Auxiliar_3 := Ini.ReadString ( 'ARBITRAGEM', 'AUXILIAR_3', '' ) ;
Partida.Arbitragem.Estado_3 := Ini.ReadString ( 'ARBITRAGEM', 'ESTADO_3', '' ) ;
Ini.Free ;
REFRESH_ARQUIVO ( FN ) ;
PUT_LOG ( 'FIM CARREGAR_ARBITRAGEM [' + FN + ']' ) ;
End ;

Procedure TFutebol.CARREGAR_ARBITRAGEM_VAR ( FN : String ) ;
Var Ini : TMemIniFile ;
Begin
PUT_LOG ( 'INI CARREGAR_ARBITRAGEM_VAR [' + FN + ']' ) ;
Ini := TMemIniFile.Create ( FN ) ;
Partida.Arbitragem_Var.Arbitro := Ini.ReadString ( 'ARBITRAGEM_VAR', 'ARBITRO', '' ) ;
Partida.Arbitragem_Var.Auxiliar_1 := Ini.ReadString ( 'ARBITRAGEM_VAR', 'AUXILIAR_1', '' ) ;
Partida.Arbitragem_Var.Auxiliar_2 := Ini.ReadString ( 'ARBITRAGEM_VAR', 'AUXILIAR_2', '' ) ;
Ini.Free ;
REFRESH_ARQUIVO ( FN ) ;
PUT_LOG ( 'FIM CARREGAR_ARBITRAGEM_VAR [' + FN + ']' ) ;
End ;

Procedure TFutebol.CARREGAR_REPORTERES ( Origem : String ) ;
Var Ini   : TMemIniFile ;
    Local : LongInt ;
Begin
PUT_LOG ( 'INI CARREGAR REPORTERES [' + GET_FN_REPORTERES + ']' ) ;
Ini := TMemIniFile.Create ( GET_FN_REPORTERES ) ;
For Local := 1 To MAX_REPORTERES Do
   Begin
   Partida.Reporteres[Local].Nome := Ini.ReadString ( 'REPORTERES', 'NOME_'+StrZero(Local,3), '' ) ;
   Partida.Reporteres[Local].Adicional := Ini.ReadString ( 'REPORTERES', 'ADIC_'+StrZero(Local,3), '' ) ;
   End ;
Ini.Free ;
PUT_LOG ( 'FIM CARREGAR REPORTERES [' + GET_FN_REPORTERES + ']' ) ;
End ;

Procedure TFutebol.CARREGAR_COMENTARISTAS ( Origem : String ) ;
Var Ini   : TMemIniFile ;
    Local : LongInt ;
Begin
PUT_LOG ( 'INI CARREGAR_COMENTARISTAS [' + GET_FN_COMENTARISTAS + ']' ) ;
If GET_FN_COMENTARISTAS = '' Then Begin
   ShowMessage ( 'Verifique se a partida foi carregada' ) ;
   Exit ;
End ;
Ini := TMemIniFile.Create ( GET_FN_COMENTARISTAS ) ;
For Local := 1 To MAX_COMENTARISTAS Do
   Begin
   Partida.Comentaristas[Local].Nome := Ini.ReadString ( 'COMENTARISTAS', 'NOME_'+StrZero(Local,3), '' ) ;
   Partida.Comentaristas[Local].Adicional := Ini.ReadString ( 'COMENTARISTAS', 'ADIC_'+StrZero(Local,3), '' ) ;
   Partida.Comentaristas[Local].Alinhamento := Ini.ReadInteger ( 'COMENTARISTAS', 'ALIN_'+StrZero(Local,3), 0 ) ;
   End ;
Ini.Free ;
PUT_LOG ( 'FIM CARREGAR_COMENTARISTAS [' + GET_FN_COMENTARISTAS + ']' ) ;
End ;

Procedure TFutebol.SALVAR_COMENTARISTAS ( Origem : String ) ;
Var Ini       : TMemIniFile ;
    Local     : LongInt ;
Begin
PUT_LOG ( 'INI SALVAR COMENTARISTAS [' + GET_FN_COMENTARISTAS + ']' ) ;
If GET_FN_COMENTARISTAS = '' Then Begin
   ShowMessage ( 'Verifique se a partida foi carregada' ) ;
   Exit ;
End ;
Ini := TMemIniFile.Create ( GET_FN_COMENTARISTAS ) ;
//
Ini.WriteString ( 'SYSTEM', 'NOW', DateTimeToStr(Now) ) ;
Ini.WriteInteger ( 'SYSTEM', 'TICK_DIV_1000', (GetTickCount DIV 1000) ) ;
Ini.WriteString ( 'SYSTEM', 'ORIGEM', Origem ) ;
//
Ini.WriteString ( 'COMENTARISTAS', 'MODIF', DateTimeToStr(Now) ) ;
For Local := 1 To MAX_COMENTARISTAS Do Begin
   Ini.WriteString ( 'COMENTARISTAS', 'NOME_'+StrZero(Local,3), Partida.Comentaristas[Local].Nome ) ;
   Ini.WriteString ( 'COMENTARISTAS', 'ADIC_'+StrZero(Local,3), Partida.Comentaristas[Local].Adicional ) ;
   Ini.WriteInteger ( 'COMENTARISTAS', 'ALIN_'+StrZero(Local,3), Partida.Comentaristas[Local].Alinhamento ) ;
End ;
//
Ini.UpdateFile ;
Ini.Free ;
REFRESH_ARQUIVO ( GET_FN_COMENTARISTAS ) ;
PUT_LOG ( 'FIM SALVAR COMENTARISTAS' ) ;
End ;

Procedure TFutebol.SALVAR_REPORTERES ( Origem : String ) ;
Var Ini       : TMemIniFile ;
    Local     : LongInt ;
Begin
PUT_LOG ( 'INI SALVAR REPORTERES [' + GET_FN_REPORTERES + ']' ) ;
If GET_FN_REPORTERES = '' Then Begin
   ShowMessage ( 'Verifique se a partida foi carregada' ) ;
   Exit ;
End ;
Ini := TMemIniFile.Create ( GET_FN_REPORTERES ) ;
//
Ini.WriteString ( 'SYSTEM', 'NOW', DateTimeToStr(Now) ) ;
Ini.WriteInteger ( 'SYSTEM', 'TICK_DIV_1000', (GetTickCount DIV 1000) ) ;
Ini.WriteString ( 'SYSTEM', 'ORIGEM', Origem ) ;
//
Ini.WriteString ( 'REPORTERES', 'MODIF', DateTimeToStr(Now) ) ;
For Local := 1 To MAX_REPORTERES Do Begin
   Ini.WriteString ( 'REPORTERES', 'NOME_'+StrZero(Local,3), Partida.Reporteres[Local].Nome ) ;
   Ini.WriteString ( 'REPORTERES', 'ADIC_'+StrZero(Local,3), Partida.Reporteres[Local].Adicional ) ;
End ;
//
Ini.UpdateFile ;
Ini.Free ;
REFRESH_ARQUIVO ( GET_FN_REPORTERES ) ;
PUT_LOG ( 'FIM SALVAR REPORTERES' ) ;
End ;

Procedure TFutebol.SALVAR_ARBITRAGEM ( Origem : String ) ;
Begin
SALVAR_MATRIZ ( 'SALVAR_ARBITRAGEM/' + Origem, FLAG_FUT_ARBITRAGEM ) ;
End ;

Procedure TFutebol.SALVAR_ARBITRAGEM_VAR ( Origem : String ) ;
Begin
SALVAR_MATRIZ ( 'SALVAR_ARBITRAGEM_VAR/' + Origem, FLAG_FUT_ARBITRAGEM_VAR ) ;
End ;

Procedure TFutebol.ATRIBUIR_REPORTERES ( R1_Nome, R1_Adicional,
                                         R2_Nome, R2_Adicional,
                                         R3_Nome, R3_Adicional,
                                         R4_Nome, R4_Adicional,
                                         R5_Nome, R5_Adicional : String ) ;
Begin
Partida.Reporteres[1].Nome := R1_NOME ;
Partida.Reporteres[1].Adicional := R1_ADICIONAL ;
Partida.Reporteres[2].Nome := R2_NOME ;
Partida.Reporteres[2].Adicional := R2_ADICIONAL ;
Partida.Reporteres[3].Nome := R3_NOME ;
Partida.Reporteres[3].Adicional := R3_ADICIONAL ;
Partida.Reporteres[4].Nome := R4_NOME ;
Partida.Reporteres[4].Adicional := R4_ADICIONAL ;
Partida.Reporteres[5].Nome := R5_NOME ;
Partida.Reporteres[5].Adicional := R5_ADICIONAL ;
End ;

Procedure TFutebol.ATRIBUIR_COMENTARISTAS ( C1_Nome, C1_Adicional : String ; C1_Alinhamento : LongInt ;
                                            C2_Nome, C2_Adicional : String ; C2_Alinhamento : LongInt ;
                                            C3_Nome, C3_Adicional : String ; C3_Alinhamento : LongInt ;
                                            C4_Nome, C4_Adicional : String ; C4_Alinhamento : LongInt ;
                                            C5_Nome, C5_Adicional : String ; C5_Alinhamento : LongInt ) ;
Begin
Partida.Comentaristas[1].Nome := C1_NOME ;
Partida.Comentaristas[1].Adicional := C1_ADICIONAL ;
Partida.Comentaristas[1].Alinhamento := C1_Alinhamento ;
Partida.Comentaristas[2].Nome := C2_NOME ;
Partida.Comentaristas[2].Adicional := C2_ADICIONAL ;
Partida.Comentaristas[2].Alinhamento := C2_Alinhamento ;
Partida.Comentaristas[3].Nome := C3_NOME ;
Partida.Comentaristas[3].Adicional := C3_ADICIONAL ;
Partida.Comentaristas[3].Alinhamento := C3_Alinhamento ;
Partida.Comentaristas[4].Nome := C4_NOME ;
Partida.Comentaristas[4].Adicional := C4_ADICIONAL ;
Partida.Comentaristas[4].Alinhamento := C4_Alinhamento ;
Partida.Comentaristas[5].Nome := C5_NOME ;
Partida.Comentaristas[5].Adicional := C5_ADICIONAL ;
Partida.Comentaristas[5].Alinhamento := C5_Alinhamento ;
End ;

Procedure TFutebol.SALVAR_JOGOS_EM_ANDAMENTO ( Origem : String ) ;
Begin
SALVAR_MATRIZ ( 'SALVAR_JOGOS_EM_ANDAMENTO/' + Origem, FLAG_FUT_JOGOS ) ;
End ;

Procedure TFutebol.CARREGAR_JOGOS_EM_ANDAMENTO ( FN : String ) ;
Var Ini   : TMemIniFile ;
    Local : LongInt ;
Begin
PUT_LOG ( 'INI CARREGAR_JOGOS_EM_ANDAMENTO [' + FN + ']' ) ;
Ini := TMemIniFile.Create ( FN ) ;
For Local := 1 To MAX_JOGOS_EM_ANDAMENTO Do
   Begin
   Partida.Jogos_E[Local].Time_A := Ini.ReadString ( 'JOGOS_ESTADUAIS_'+StrZero(Local,3), 'TIME_A', '' ) ;
   Partida.Jogos_E[Local].P_A :=    Ini.ReadString ( 'JOGOS_ESTADUAIS_'+StrZero(Local,3), 'PLACAR_A', '' ) ;
   Partida.Jogos_E[Local].Time_B := Ini.ReadString ( 'JOGOS_ESTADUAIS_'+StrZero(Local,3), 'TIME_B', '' ) ;
   Partida.Jogos_E[Local].P_B :=    Ini.ReadString ( 'JOGOS_ESTADUAIS_'+StrZero(Local,3), 'PLACAR_B', '' ) ;
   Partida.Jogos_E[Local].Titulo := Ini.ReadString ( 'JOGOS_ESTADUAIS_'+StrZero(Local,3), 'TITULO', '' ) ;
   Partida.Jogos_E[Local].Rodape := Ini.ReadString ( 'JOGOS_ESTADUAIS_'+StrZero(Local,3), 'RODAPE', '' ) ;
   End ;
For Local := 1 To MAX_JOGOS_EM_ANDAMENTO Do
   Begin
   Partida.Jogos_N[Local].Time_A := Ini.ReadString ( 'JOGOS_NACIONAIS_'+StrZero(Local,3), 'TIME_A', '' ) ;
   Partida.Jogos_N[Local].P_A :=    Ini.ReadString ( 'JOGOS_NACIONAIS_'+StrZero(Local,3), 'PLACAR_A', '' ) ;
   Partida.Jogos_N[Local].Time_B := Ini.ReadString ( 'JOGOS_NACIONAIS_'+StrZero(Local,3), 'TIME_B', '' ) ;
   Partida.Jogos_N[Local].P_B :=    Ini.ReadString ( 'JOGOS_NACIONAIS_'+StrZero(Local,3), 'PLACAR_B', '' ) ;
   Partida.Jogos_N[Local].Titulo := Ini.ReadString ( 'JOGOS_NACIONAIS_'+StrZero(Local,3), 'TITULO', '' ) ;
   Partida.Jogos_N[Local].Rodape := Ini.ReadString ( 'JOGOS_NACIONAIS_'+StrZero(Local,3), 'RODAPE', '' ) ;
   End ;
Ini.Free ;
REFRESH_ARQUIVO ( FN ) ;
PUT_LOG ( 'FIM CARREGAR_JOGOS_EM_ANDAMENTO [' + FN + ']' ) ;
End ;

Procedure TFutebol.CARREGAR_SUBSTITUICAO ( Cod_Time : LongInt ; Indice : LongInt ;
                                           _Sai, _Entra : String ) ;
Begin
If ( Cod_Time < 1 ) OR ( Cod_Time > 2 ) Then
   Exit ;
With Partida.Substituicoes[Cod_Time,Indice] Do
   Begin
   Sai := _Sai ;
   Entra := _Entra ;
   FN_Sai := GET_FN_FOTO_JOGADOR_CHYRON ( Cod_Time, GET_SOMENTE_JOGADOR ( _Sai ) ) ;
   FN_Sai := '[' + SysUtils.StringReplace ( FN_Sai, '\', '/', [rfReplaceAll] ) + ']' ;
   FN_Entra := GET_FN_FOTO_JOGADOR_CHYRON ( Cod_Time, GET_SOMENTE_JOGADOR ( _Entra ) ) ;
   FN_Entra := '[' + SysUtils.StringReplace ( FN_Entra, '\', '/', [rfReplaceAll] ) + ']' ;
   End ;
End ;

Procedure TFutebol.RESETAR_ESTATISTICAS ;
Var Cod_Time : LongInt ;
Begin
For Cod_Time := 1 To 2 Do
   Begin
   Partida.Clube[Cod_Time].Estatisticas.Faltas := 0 ;
   Partida.Clube[Cod_Time].Estatisticas.Impedimentos := 0 ;
   Partida.Clube[Cod_Time].Estatisticas.Substituicoes := 0 ;
   Partida.Clube[Cod_Time].Estatisticas.Cartoes_Amarelos := 0 ;
   Partida.Clube[Cod_Time].Estatisticas.Cartoes_Vermelhos := 0 ;
   Partida.Clube[Cod_Time].Estatisticas.Finalizacoes := 0 ;
   Partida.Clube[Cod_Time].Estatisticas.Escanteios := 0 ;
   Partida.Clube[Cod_Time].Estatisticas.Chutes_a_Gol := 0 ;
   Partida.Clube[Cod_Time].Estatisticas.Bolas_Roubadas := 0 ;
   Partida.Clube[Cod_Time].Estatisticas.Erros_de_Passe := 0 ;
   Partida.Clube[Cod_Time].Estatisticas.Gols_Perdidos := 0 ;
   Partida.Clube[Cod_Time].Estatisticas.Conclusoes := 0 ;
   Partida.Clube[Cod_Time].Estatisticas.Levantamentos := 0 ;
   End ;
SALVAR_ESTATISTICAS_PARTIDA ( 'RESETAR_ESTATISTICAS', GET_FN_PARTIDA_ESTATISTICAS ) ;
End ;

Procedure TFutebol.RESETAR_EVENTOS ;
Begin
SetLength ( Partida.Eventos_Estatisticos, 0 ) ;
SetLength ( Partida.Eventos_Controle, 0 ) ;
SALVAR_PARTIDA_OLD ( 'RESETAR_EVENTOS' ) ;
End ;

Procedure TFutebol.RESETAR_SUBSTITUICOES ;
Begin
End ;

Procedure TFutebol.RESETAR_CARTOES ;
Begin
End ;

Procedure TFutebol.RESETAR_PLACAR ( Origem : String ) ;
Begin
SET_PLACAR ( 0, 0, 0, 0, SALVAR_FALSE ) ;
SET_PERIODO ( 1, SALVAR_FALSE ) ;
SET_ACRESCIMO ( 0, SALVAR_TRUE ) ;
SALVAR_PLACAR_PARTIDA ( 'RESETAR_PLACAR/' + Origem ) ;
End ;

Function TFutebol.GET_NOME_PELA_CAMISA ( Cod_Time, Camisa : LongInt ) : String ;
Var Local : LongInt ;
Begin
Result := '' ;
If ( Cod_Time < 1 ) OR ( Cod_Time > 2 ) Then
   Exit ;
For Local := 1 To MAX_TITULARES Do
   If Partida.Titulares_Originais[Cod_Time, Local].Camisa = Camisa Then
       Begin
       Result := Partida.Titulares_Originais[Cod_Time, Local].Nome ;
       Exit ;
       End ;
For Local := 1 To MAX_RESERVAS Do
   If Partida.Reservas_Originais[Cod_Time, Local].Camisa = Camisa Then
       Begin
       Result := Partida.Reservas_Originais[Cod_Time, Local].Nome ;
       Exit ;
       End ;
End ;

Function TFutebol.GET_NEXT_FORA_ANDAMENTO_DISPONIVEL ( Cod_Time : LongInt ) : LongInt ;
Var Local : LongInt ;
Begin
For Local := 1 To MAX_RESERVAS Do
  If Partida.Fora_Andamento[Cod_Time, Local].Camisa = 0 Then
     Begin
     Result := Local ;
     Exit ;
     End ;
Result := 0 ;
End ;

Function TFutebol.GET_NEXT_RESERVA_ANDAMENTO_DISPONIVEL ( Cod_Time : LongInt ) : LongInt ;
Var Local : LongInt ;
Begin
For Local := 1 To MAX_RESERVAS Do
  If Partida.Reservas_Andamento[Cod_Time, Local].Camisa = 0 Then
     Begin
     Result := Local ;
     Exit ;
     End ;
Result := 0 ;
End ;

Function TFutebol.GET_NEXT_TITULAR_ANDAMENTO_DISPONIVEL ( Cod_Time : LongInt ) : LongInt ;
Var Local : LongInt ;
Begin
For Local := 1 To MAX_TITULARES Do
  If Partida.Titulares_Andamento[Cod_Time, Local].Camisa = 0 Then
     Begin
     Result := Local ;
     Exit ;
     End ;
Result := 0 ;
End ;

Procedure TFutebol.PUT_FORA_ANDAMENTO ( Cod_Time : LongInt ; Jogador : T_Jogador ) ;
Var Indice : LongInt ;
Begin
Indice := GET_NEXT_FORA_ANDAMENTO_DISPONIVEL ( Cod_Time ) ;
If Indice = 0 Then
   Exit ;
Partida.Fora_Andamento[Cod_Time, Indice] := Jogador ;
End ;

Procedure TFutebol.PUT_TITULAR_ANDAMENTO ( Cod_Time : LongInt ; Jogador : T_Jogador ) ;
Var Indice : LongInt ;
Begin
Indice := GET_NEXT_TITULAR_ANDAMENTO_DISPONIVEL ( Cod_Time ) ;
If Indice = 0 Then
   Exit ;
Partida.Titulares_Andamento[Cod_Time, Indice] := Jogador ;
End ;

Procedure TFutebol.PUT_RESERVA_ANDAMENTO ( Cod_Time : LongInt ; Jogador : T_Jogador ) ;
Var Indice : LongInt ;
Begin
Indice := GET_NEXT_RESERVA_ANDAMENTO_DISPONIVEL ( Cod_Time ) ;
If Indice = 0 Then
   Exit ;
Partida.Reservas_Andamento[Cod_Time, Indice] := Jogador ;
End ;

Procedure TFutebol.REMOVER_TITULAR_ANDAMENTO ( Cod_Time, Camisa : LongInt ) ;
Var Local : LongInt ;
Begin
For Local := 1 To MAX_TITULARES Do
   If Partida.Titulares_Andamento[Cod_Time,Local].Camisa = Camisa Then
      Begin
      PUT_FORA_ANDAMENTO ( Cod_Time, Partida.Titulares_Andamento[Cod_Time,Local] ) ;
      Partida.Titulares_Andamento[Cod_Time,Local].Camisa := 0 ;
      Partida.Titulares_Andamento[Cod_Time,Local].Nome := '' ;
      Partida.Titulares_Andamento[Cod_Time,Local].Combo := '' ;
      Exit ;
      End ;
End ;

Procedure TFutebol.REMOVER_RESERVA_ANDAMENTO ( Cod_Time, Camisa : LongInt ) ;
Var Local : LongInt ;
Begin
For Local := 1 To MAX_RESERVAS Do
   If Partida.Reservas_Andamento[Cod_Time,Local].Camisa = Camisa Then
      Begin
      PUT_FORA_ANDAMENTO ( Cod_Time, Partida.Reservas_Andamento[Cod_Time,Local] ) ;
      Partida.Reservas_Andamento[Cod_Time,Local].Camisa := 0 ;
      Partida.Reservas_Andamento[Cod_Time,Local].Nome := '' ;
      Partida.Reservas_Andamento[Cod_Time,Local].Combo := '' ;
      Exit ;
      End ;
End ;

Procedure TFutebol.REMOVER_FORA_ANDAMENTO ( Cod_Time, Camisa : LongInt ) ;
Var Local : LongInt ;
Begin
For Local := 1 To MAX_RESERVAS Do
   If Partida.Fora_Andamento[Cod_Time,Local].Camisa = Camisa Then
      Begin
      Partida.Fora_Andamento[Cod_Time,Local].Camisa := 0 ;
      Partida.Fora_Andamento[Cod_Time,Local].Nome := '' ;
      Partida.Fora_Andamento[Cod_Time,Local].Combo := '' ;
      Exit ;
      End ;
End ;

Function TFutebol.GET_INDICE_TITULAR_ANDAMENTO ( Cod_Time, Camisa : LongInt ) : LongInt ;
Var Local : LongInt ;
Begin
For Local := 1 To MAX_TITULARES Do
   If Partida.Titulares_Andamento[Cod_Time,Local].Camisa = Camisa Then
      Begin
      Result := Local ;
      Exit ;
      End ;
Result := 0 ;
End ;

Function TFutebol.GET_INDICE_RESERVA_ANDAMENTO ( Cod_Time, Camisa : LongInt ) : LongInt ;
Var Local : LongInt ;
Begin
For Local := 1 To MAX_RESERVAS Do
   If Partida.Reservas_Andamento[Cod_Time,Local].Camisa = Camisa Then
      Begin
      Result := Local ;
      Exit ;
      End ;
Result := 0 ;
End ;

Function TFutebol.GET_INDICE_FORA_ANDAMENTO ( Cod_Time, Camisa : LongInt ) : LongInt ;
Var Local : LongInt ;
Begin
For Local := 1 To MAX_RESERVAS Do
   If Partida.Fora_Andamento[Cod_Time,Local].Camisa = Camisa Then
      Begin
      Result := Local ;
      Exit ;
      End ;
Result := 0 ;
End ;

Function TFutebol.REALIZAR_SUBSTITUICAO ( Cod_Time, Camisa_Entra, Camisa_Sai : LongInt ) : LongInt ;
Var Indice_Entra : LongInt ;
    Indice_Sai   : LongInt ;
    Temp         : T_Jogador ;
Begin
Indice_Sai := GET_INDICE_TITULAR_ANDAMENTO ( Cod_Time, Camisa_Sai ) ;
Indice_Entra := GET_INDICE_RESERVA_ANDAMENTO ( Cod_Time, Camisa_Entra ) ;
If Indice_Sai = 0 Then
   Begin
   Result := -1 ;
   Exit ;
   End ;
If Indice_Entra = 0 Then
   Begin
   Result := -2 ;
   Exit ;
   End ;
If ( Indice_Sai > 0 ) AND ( Indice_Entra > 0 ) Then
   Begin
   Temp := Partida.Titulares_Andamento[Cod_Time, Indice_Sai] ;
   Partida.Titulares_Andamento[Cod_Time, Indice_Sai] := Partida.Reservas_Andamento[Cod_Time, Indice_Entra] ;
   Partida.Reservas_Andamento[Cod_Time, Indice_Entra].Nome := '' ;
   Partida.Reservas_Andamento[Cod_Time, Indice_Entra].Camisa := 0 ;
   Partida.Reservas_Andamento[Cod_Time, Indice_Entra].Combo := '' ;
   PUT_FORA_ANDAMENTO ( Cod_Time, Temp ) ;
   SALVAR_ESCALACAO ( 'REALIZAR_SUBSTITUICAO' ) ;
   End ;
Result := 1 ;
End ;

Procedure TFutebol.LIMPAR_COLAS ;
Begin
Partida_Colas.Cola_A_Titulares.Clear ;
Partida_Colas.Cola_B_Titulares.Clear ;
Partida_Colas.Cola_A_Reservas.Clear ;
Partida_Colas.Cola_B_Reservas.Clear ;
Partida_Colas.Cola_A_Fora.Clear ;
Partida_Colas.Cola_B_Fora.Clear ;
End ;

Procedure TFutebol.ADD_COLAS_A_PARTIR_DO_ANDAMENTO ( _Titulares_A, _Reservas_A, _Fora_A,
                                                     _Titulares_B, _Reservas_B, _Fora_B : TStrings ) ;
Begin
LIMPAR_COLAS ;
Partida_Colas.Cola_A_Titulares.AddStrings ( _Titulares_A ) ;
Partida_Colas.Cola_A_Reservas.AddStrings ( _Reservas_A ) ;
Partida_Colas.Cola_A_Fora.AddStrings ( _Fora_A ) ;
Partida_Colas.Cola_B_Titulares.AddStrings ( _Titulares_B ) ;
Partida_Colas.Cola_B_Reservas.AddStrings ( _Reservas_B ) ;
Partida_Colas.Cola_B_Fora.AddStrings ( _Fora_B ) ;
End ;

Procedure TFutebol.ADD_ANDAMENTO_A_PARTIR_DAS_COLAS ( _Titulares_A, _Reservas_A, _Fora_A,
                                                      _Titulares_B, _Reservas_B, _Fora_B : TListBox ) ;
Begin
_Titulares_A.Items.Clear ;
_Titulares_B.Items.Clear ;
_Reservas_A.Items.Clear ;
_Reservas_B.Items.Clear ;
_Fora_A.Items.Clear ;
_Fora_B.Items.Clear ;
_Titulares_A.Items.AddStrings ( Partida_Colas.Cola_A_Titulares ) ;
_Reservas_A.Items.AddStrings ( Partida_Colas.Cola_A_Reservas ) ;
_Fora_A.Items.AddStrings ( Partida_Colas.Cola_A_Fora ) ;
_Titulares_B.Items.AddStrings ( Partida_Colas.Cola_B_Titulares ) ;
_Reservas_B.Items.AddStrings ( Partida_Colas.Cola_B_Reservas ) ;
_Fora_B.Items.AddStrings ( Partida_Colas.Cola_B_Fora ) ;
End ;

Procedure TFutebol.TRANFERIR_SGS_TIMES_PARA_MEMORIA ;
Var Local : LongInt ;
Begin
_Debug ( 'INI TRANFERIR_SGS_TIMES_PARA_MEMORIA' ) ;
LIMPAR_COLAS ;
For Local := 1 To MAX_TITULARES Do
   Begin
   Partida.Titulares_Originais[1,Local].Camisa := StrToIntDef ( SG_Tit_A.Cells[1,Local], 0 ) ;
   Partida.Titulares_Originais[1,Local].Nome := SG_Tit_A.Cells[2,Local] ;
   Partida.Titulares_Originais[1,Local].Combo := StrZero ( Partida.Titulares_Originais[1,Local].Camisa, 2 ) + ' ' +
                                                 Partida.Titulares_Originais[1,Local].Nome ;
   Partida.Titulares_Andamento[1,Local] := Partida.Titulares_Originais[1,Local] ;
   If Partida.Titulares_Originais[1,Local].Camisa > 0 Then
      Begin
      Partida_Colas.Cola_A_Titulares.Add ( StrZero ( Partida.Titulares_Originais[1,Local].Camisa, 2 ) + ' ' +
                                           Partida.Titulares_Originais[1,Local].Nome ) ;
      End ;
   //
   Partida.Titulares_Originais[2,Local].Camisa := StrToIntDef ( SG_Tit_B.Cells[1,Local], 0 ) ;
   Partida.Titulares_Originais[2,Local].Nome:= SG_Tit_B.Cells[2,Local] ;
   Partida.Titulares_Originais[2,Local].Combo := StrZero ( Partida.Titulares_Originais[2,Local].Camisa, 2 ) + ' ' +
                                                 Partida.Titulares_Originais[2,Local].Nome ;
   Partida.Titulares_Andamento[2,Local] := Partida.Titulares_Originais[2,Local] ;
   If Partida.Titulares_Originais[2,Local].Camisa > 0 Then
      Begin
      Partida_Colas.Cola_B_Titulares.Add ( StrZero ( Partida.Titulares_Originais[2,Local].Camisa, 2 ) + ' ' +
                                           Partida.Titulares_Originais[2,Local].Nome ) ;
      End ;
   End ;
For Local := 1 To MAX_RESERVAS Do
   Begin
   Partida.Reservas_Originais[1,Local].Camisa := StrToIntDef ( SG_Res_A.Cells[1,Local], 0 ) ;
   Partida.Reservas_Originais[1,Local].Nome := SG_Res_A.Cells[2,Local] ;
   Partida.Reservas_Originais[1,Local].Combo := StrZero ( Partida.Reservas_Originais[1,Local].Camisa, 2 ) + ' ' +
                                                Partida.Reservas_Originais[1,Local].Nome ;
   Partida.Reservas_Andamento[1,Local] := Partida.Reservas_Originais[1,Local] ;
   If Partida.Reservas_Originais[1,Local].Camisa > 0 Then
      Begin
      Partida_Colas.Cola_A_Reservas.Add ( StrZero ( Partida.Reservas_Originais[1,Local].Camisa, 2 ) + ' ' +
                                          Partida.Reservas_Originais[1,Local].Nome ) ;
      End ;
   Partida.Fora_Andamento[1,Local].Nome := '' ;
   Partida.Fora_Andamento[1,Local].Camisa := 0 ;
   Partida.Fora_Andamento[1,Local].Combo := '' ;
   //
   Partida.Reservas_Originais[2,Local].Camisa := StrToIntDef ( SG_Res_B.Cells[1,Local], 0 ) ;
   Partida.Reservas_Originais[2,Local].Nome := SG_Res_B.Cells[2,Local] ;
   Partida.Reservas_Originais[2,Local].Combo := StrZero ( Partida.Reservas_Originais[2,Local].Camisa, 2 ) + ' ' +
                                                Partida.Reservas_Originais[2,Local].Nome ;
   Partida.Reservas_Andamento[2,Local] := Partida.Reservas_Originais[2,Local] ;
   If Partida.Reservas_Originais[2,Local].Camisa > 0 Then
      Begin
      Partida_Colas.Cola_B_Reservas.Add ( StrZero ( Partida.Reservas_Originais[2,Local].Camisa, 2 ) + ' ' +
                                          Partida.Reservas_Originais[2,Local].Nome ) ;
      End ;
   Partida.Fora_Andamento[2,Local].Nome := '' ;
   Partida.Fora_Andamento[2,Local].Camisa := 0 ;
   Partida.Fora_Andamento[2,Local].Combo := '' ;
   End ;
_Debug ( 'FIM TRANFERIR_SGS_TIMES_PARA_MEMORIA' ) ;
End ;

Procedure TFutebol.CARREGAR_SG_PELAS_ESCALACOES ;
Var Local : LongInt ;
Begin
_Debug ( 'INI CARREGAR_SG_PELAS_ESCALACOES' ) ;
LIMPAR_COLAS ;
For Local := 1 To MAX_TITULARES Do Begin
   SG_Tit_A.Cells[2,Local] := Partida.Titulares_Originais[1,Local].Nome ;
   SG_Tit_A.Cells[1,Local] := IntToStr ( Partida.Titulares_Originais[1,Local].Camisa ) ;
   //
   SG_Tit_B.Cells[2,Local] := Partida.Titulares_Originais[2,Local].Nome ;
   SG_Tit_B.Cells[1,Local] := IntToStr ( Partida.Titulares_Originais[2,Local].Camisa ) ;
End ;
For Local := 1 To MAX_RESERVAS Do Begin
   SG_Res_A.Cells[2,Local] := Partida.Reservas_Originais[1,Local].Nome ;
   SG_Res_A.Cells[1,Local] := IntToStr ( Partida.Reservas_Originais[1,Local].Camisa ) ;
   //
   SG_Res_B.Cells[2,Local] := Partida.Reservas_Originais[2,Local].Nome ;
   SG_Res_B.Cells[1,Local] := IntToStr ( Partida.Reservas_Originais[2,Local].Camisa ) ;
End ;
_Debug ( 'FIM CARREGAR_SG_PELAS_ESCALACOES' ) ;
End ;

Function TFutebol.REALIZAR_SUBSTITUICAO_REVERSA ( Cod_Time, Camisa_Retorna_do_Banco,
                                                  Camisa_Retorna_ao_Banco : LongInt ) : LongInt ;
Begin
Result := 0 ;
End ;

Procedure TFutebol.RESETAR_ESCALACAO ;
Var Local : LongInt ;
Begin
_Debug ( 'INI RESETAR_ESCALACAO' ) ;
//
LIMPAR_COLAS ;
For Local := 1 To MAX_TITULARES Do Begin
   Partida.Titulares_Originais[1,Local].Nome := SG_Tit_A.Cells[2,Local] ;
   Partida.Titulares_Originais[1,Local].Camisa := StrToIntDef ( SG_Tit_A.Cells[1,Local], 0 ) ;
   Partida.Titulares_Originais[1,Local].Combo := StrZero ( Partida.Titulares_Originais[1,Local].Camisa, 2 ) + ' ' +
                                                 Partida.Titulares_Originais[1,Local].Nome ;
   Partida.Titulares_Andamento[1,Local] := Partida.Titulares_Originais[1,Local] ;
   If Partida.Titulares_Originais[1,Local].Camisa > 0 Then Begin
      Partida_Colas.Cola_A_Titulares.Add ( StrZero ( Partida.Titulares_Originais[1,Local].Camisa, 2 ) + ' ' +
                                           Partida.Titulares_Originais[1,Local].Nome ) ;
   End ;
   //
   Partida.Titulares_Originais[2,Local].Nome:= SG_Tit_B.Cells[2,Local] ;
   Partida.Titulares_Originais[2,Local].Camisa := StrToIntDef ( SG_Tit_B.Cells[1,Local], 0 ) ;
   Partida.Titulares_Originais[2,Local].Combo := StrZero ( Partida.Titulares_Originais[2,Local].Camisa, 2 ) + ' ' +
                                                 Partida.Titulares_Originais[2,Local].Nome ;
   Partida.Titulares_Andamento[2,Local] := Partida.Titulares_Originais[2,Local] ;
   If Partida.Titulares_Originais[2,Local].Camisa > 0 Then Begin
      Partida_Colas.Cola_B_Titulares.Add ( StrZero ( Partida.Titulares_Originais[2,Local].Camisa, 2 ) + ' ' +
                                           Partida.Titulares_Originais[2,Local].Nome ) ;
   End ;
End ;
For Local := 1 To MAX_RESERVAS Do Begin
   Partida.Reservas_Originais[1,Local].Nome := SG_Res_A.Cells[2,Local] ;
   Partida.Reservas_Originais[1,Local].Camisa := StrToIntDef ( SG_Res_A.Cells[1,Local], 0 ) ;
   Partida.Reservas_Originais[1,Local].Combo := StrZero ( Partida.Reservas_Originais[1,Local].Camisa, 2 ) + ' ' +
                                                Partida.Reservas_Originais[1,Local].Nome ;
   Partida.Reservas_Andamento[1,Local] := Partida.Reservas_Originais[1,Local] ;
   If Partida.Reservas_Originais[1,Local].Camisa > 0 Then Begin
      Partida_Colas.Cola_A_Reservas.Add ( StrZero ( Partida.Reservas_Originais[1,Local].Camisa, 2 ) + ' ' +
                                          Partida.Reservas_Originais[1,Local].Nome ) ;
   End ;
   //
   Partida.Reservas_Originais[2,Local].Nome := SG_Res_B.Cells[2,Local] ;
   Partida.Reservas_Originais[2,Local].Camisa := StrToIntDef ( SG_Res_B.Cells[1,Local], 0 ) ;
   Partida.Reservas_Originais[2,Local].Combo := StrZero ( Partida.Reservas_Originais[2,Local].Camisa, 2 ) + ' ' +
                                                Partida.Reservas_Originais[2,Local].Nome ;
   Partida.Reservas_Andamento[2,Local] := Partida.Reservas_Originais[2,Local] ;
   If Partida.Reservas_Originais[2,Local].Camisa > 0 Then Begin
      Partida_Colas.Cola_B_Reservas.Add ( StrZero ( Partida.Reservas_Originais[2,Local].Camisa, 2 ) + ' ' +
                                          Partida.Reservas_Originais[2,Local].Nome ) ;
   End ;
End ;
_Debug ( 'FIM RESETAR_ESCALACAO' ) ;
End ;

Function TFutebol.EVENTO_TO_COMANDO_DIRETO ( Evento : T_Evento ) : String ;
Begin
Result := IntToStr ( Evento.Cod_Time ) + #32 ;
Case Evento.Evento2 Of
  pe_Arbitragem        : Result := Result + 'ARB' + #32 ;
  pe_Classificacao     : Result := Result + 'CLA' + #32 ;
  pe_Acrescimo         : Result := Result + 'AC' + #32 ;
  pe_Escalacao_A       ,
  pe_Escalacao_B       : Result := Result + 'ESC' + #32 ;
  pe_Gol_A             ,
  pe_Gol_B             : Result := Result + 'G' + #32 +
                         IntToStr ( Evento.Par2 ) ;
  pe_Cartao_Amarelo_A  ,
  pe_Cartao_Amarelo_B  : Result := Result + 'A' + #32 +
                         IntToStr ( Evento.Par2 ) ;
  pe_Cartao_Vermelho_A ,
  pe_Cartao_Vermelho_B : Result := Result + 'V' + #32 +
                         IntToStr ( Evento.Par2 ) ;
  pe_Substituicao_A    ,
  pe_Substituicao_B    : Result := Result + 'S' + #32 +
                         IntToStr ( Evento.Par2 ) + #32 +
                         IntToStr ( Evento.Par4 ) ;
  End ;
End ;

Procedure TFutebol.LIMPAR_EVENTO ( Var Reg : T_Evento ) ;
Begin
With Reg Do
   Begin
   Carregado := FALSE ;
   Time_Carregado := FALSE ;
   Cod_Time := 0 ;
   Nome_Time := '' ;
   Evento2 := pe_Indefinido ;
   Evento_Str := '' ;
   Evento_Processado := FALSE ;
   Par1 := '' ;
   Par2 := 0 ;
   Par3 := '' ;
   Par4 := 0 ;
   Picture := Nil ;
   End ;
End ;

Procedure TFutebol.SALVAR_MATRIZ ( Origem : String ; Flags : Int64 ) ;
Var Ini       : TMemIniFile ;
    Ini_Local : TMemIniFile ;
    FN        : String ;
    Cod_Time  : LongInt ;
    Local     : LongInt ;
    Secao     : String ;
Begin
_Debug ( 'INI SALVAR_MATRIZ' ) ;
PUT_LOG ( 'INI SALVAR_PLACAR_MATRIZ [' + GET_FN_PARTIDA + ']' ) ;
If NOT FLAG_SALVAR_MATRIZ Then Begin
   _Debug ( 'Exit /!SALVAR_MATRIZ' ) ;
   Exit ;
End ;
Ini := TMemIniFile.Create ( GET_FN_PARTIDA ) ;
FN := GET_DIR_PARTIDA + 'ini_placar.dat' ;
Ini_Local := TMemIniFile.Create ( FN ) ;
//
_Debug ( '1 SALVAR_MATRIZ' ) ;
Ini.WriteString ( 'SYSTEM', 'NOW', DateTimeToStr(Now) ) ;
Ini.WriteInteger ( 'SYSTEM', 'TICK_DIV_1000', (GetTickCount DIV 1000) ) ;
Ini.WriteString ( 'SYSTEM', 'FLAGS', IntToStr ( Flags ) ) ;
Ini.WriteString ( 'SYSTEM', 'ORIGEM', Origem ) ;
//
_Debug ( '2 SALVAR_MATRIZ' ) ;
If ( Flags AND FLAG_FUT_PLACAR ) > 0 Then Begin
   _Debug ( '3 SALVAR_MATRIZ' ) ;
   Ini.WriteString ( 'PARTIDA', 'MODIF', DateTimeToStr(Now) ) ;
   Ini.WriteInteger ( 'PARTIDA', 'PLACAR_A', GET_PARTIDA_CONTEXTO.P_A ) ;
   Ini.WriteInteger ( 'PARTIDA', 'PLACAR_B', GET_PARTIDA_CONTEXTO.P_B ) ;
   Ini.WriteInteger ( 'PARTIDA', 'VERMELHOS_A', GET_PARTIDA_CONTEXTO.V_A ) ;
   Ini.WriteInteger ( 'PARTIDA', 'VERMELHOS_B', GET_PARTIDA_CONTEXTO.V_B ) ;
   Ini.WriteInteger ( 'PARTIDA', 'PERIODO', GET_PARTIDA_CONTEXTO.Per ) ;
   Ini.WriteInteger ( 'PARTIDA', 'ACRESCIMO', GET_PARTIDA_CONTEXTO.Acr ) ;
   //
   Ini_Local.WriteString ( 'SYSTEM', 'NOW', DateTimeToStr(Now) ) ;
   Ini_Local.WriteInteger ( 'SYSTEM', 'TICK_DIV_1000', (GetTickCount DIV 1000) ) ;
   Ini_Local.WriteString ( 'SYSTEM', 'FLAGS', IntToStr ( Flags ) ) ;
   Ini_Local.WriteString ( 'SYSTEM', 'ORIGEM', Origem ) ;
   //
   Ini_Local.WriteString ( 'PARTIDA', 'MODIF', DateTimeToStr(Now) ) ;
   Ini_Local.WriteInteger ( 'PARTIDA', 'PLACAR_A', GET_PARTIDA_CONTEXTO.P_A ) ;
   Ini_Local.WriteInteger ( 'PARTIDA', 'PLACAR_B', GET_PARTIDA_CONTEXTO.P_B ) ;
   Ini_Local.WriteInteger ( 'PARTIDA', 'PERIODO', GET_PARTIDA_CONTEXTO.Per ) ;
   Ini_Local.WriteInteger ( 'PARTIDA', 'ACRESCIMO', GET_PARTIDA_CONTEXTO.Acr ) ;
End ;
_Debug ( '4 SALVAR_MATRIZ' ) ;
If ( Flags AND FLAG_FUT_GERAL ) > 0 Then Begin
   _Debug ( '5 SALVAR_MATRIZ' ) ;
   Ini.WriteString ( 'PARTIDA_PLACAR', 'MODIF', DateTimeToStr(Now) ) ;
   Ini.WriteString ( 'PARTIDA', 'PLACAR_TIME_A_LONGO', Partida.TIME_A_LONGO ) ;
   Ini.WriteString ( 'PARTIDA', 'PLACAR_TIME_B_LONGO', Partida.TIME_B_LONGO ) ;
   Ini.WriteString ( 'PARTIDA', 'PLACAR_TIME_A_CURTO', Partida.TIME_A_CURTO ) ;
   Ini.WriteString ( 'PARTIDA', 'PLACAR_TIME_B_CURTO', Partida.TIME_B_CURTO ) ;
   Ini.WriteString ( 'PARTIDA_TECNICO_ESQUEMA', 'MODIF', DateTimeToStr(Now) ) ;
   Ini.WriteString ( 'PARTIDA', 'PARTIDA_TECNICO_A', Partida.TECNICO_A ) ;
   Ini.WriteString ( 'PARTIDA', 'PARTIDA_TECNICO_B', Partida.TECNICO_B ) ;
   Ini.WriteString ( 'PARTIDA', 'PARTIDA_ESQUEMA_A', Partida.ESQUEMA_A ) ;
   Ini.WriteString ( 'PARTIDA', 'PARTIDA_ESQUEMA_B', Partida.ESQUEMA_A ) ;
   //
   FN := GET_DIR_PARTIDA + 'ini_geral.dat' ;
   Ini_Local := TMemIniFile.Create ( FN ) ;
   Ini_Local.WriteString ( 'SYSTEM', 'NOW', DateTimeToStr(Now) ) ;
   Ini_Local.WriteInteger ( 'SYSTEM', 'TICK_DIV_1000', (GetTickCount DIV 1000) ) ;
   Ini_Local.WriteString ( 'SYSTEM', 'FLAGS', IntToStr ( Flags ) ) ;
   Ini_Local.WriteString ( 'SYSTEM', 'ORIGEM', Origem ) ;
   //
   Ini_Local.WriteString ( 'PARTIDA_PLACAR', 'MODIF', DateTimeToStr(Now) ) ;
   Ini_Local.WriteString ( 'PARTIDA', 'PLACAR_TIME_A_LONGO', Partida.TIME_A_LONGO ) ;
   Ini_Local.WriteString ( 'PARTIDA', 'PLACAR_TIME_B_LONGO', Partida.TIME_B_LONGO ) ;
   Ini_Local.WriteString ( 'PARTIDA', 'PLACAR_TIME_A_CURTO', Partida.TIME_A_CURTO ) ;
   Ini_Local.WriteString ( 'PARTIDA', 'PLACAR_TIME_B_CURTO', Partida.TIME_B_CURTO ) ;
   Ini_Local.WriteString ( 'PARTIDA_TECNICO_ESQUEMA', 'MODIF', DateTimeToStr(Now) ) ;
   Ini_Local.WriteString ( 'PARTIDA', 'PARTIDA_TECNICO_A', Partida.TECNICO_A ) ;
   Ini_Local.WriteString ( 'PARTIDA', 'PARTIDA_TECNICO_B', Partida.TECNICO_B ) ;
   Ini_Local.WriteString ( 'PARTIDA', 'PARTIDA_ESQUEMA_A', Partida.ESQUEMA_A ) ;
   Ini_Local.WriteString ( 'PARTIDA', 'PARTIDA_ESQUEMA_B', Partida.ESQUEMA_A ) ;
End ;
_Debug ( '6 SALVAR_MATRIZ' ) ;
If ( Flags AND FLAG_FUT_CRONOMETRO ) > 0 Then Begin
   _Debug ( '7 SALVAR_MATRIZ' ) ;
   Ini.WriteString ( 'PARTIDA_INICIO_PERIODO', 'MODIF', DateTimeToStr(Now) ) ;
   Ini.WriteString ( 'PARTIDA', 'DH_INICIO_PERIODO_1', DateTimeToStr(Partida.DH_Inicio_Periodos[1]) ) ;
   Ini.WriteString ( 'PARTIDA', 'DH_INICIO_PERIODO_2', DateTimeToStr(Partida.DH_Inicio_Periodos[2]) ) ;
   Ini.WriteString ( 'PARTIDA', 'DH_INICIO_PERIODO_3', DateTimeToStr(Partida.DH_Inicio_Periodos[3]) ) ;
   Ini.WriteString ( 'PARTIDA', 'DH_INICIO_PERIODO_4', DateTimeToStr(Partida.DH_Inicio_Periodos[4]) ) ;
   //
   FN := GET_DIR_PARTIDA + 'ini_cronometro.dat' ;
   Ini_Local := TMemIniFile.Create ( FN ) ;
   Ini_Local.WriteString ( 'SYSTEM', 'NOW', DateTimeToStr(Now) ) ;
   Ini_Local.WriteInteger ( 'SYSTEM', 'TICK_DIV_1000', (GetTickCount DIV 1000) ) ;
   Ini_Local.WriteString ( 'SYSTEM', 'FLAGS', IntToStr ( Flags ) ) ;
   Ini_Local.WriteString ( 'SYSTEM', 'ORIGEM', Origem ) ;
   //
   Ini_Local.WriteString ( 'PARTIDA_INICIO_PERIODO', 'MODIF', DateTimeToStr(Now) ) ;
   Ini_Local.WriteString ( 'PARTIDA', 'DH_INICIO_PERIODO_1', DateTimeToStr(Partida.DH_Inicio_Periodos[1]) ) ;
   Ini_Local.WriteString ( 'PARTIDA', 'DH_INICIO_PERIODO_2', DateTimeToStr(Partida.DH_Inicio_Periodos[2]) ) ;
   Ini_Local.WriteString ( 'PARTIDA', 'DH_INICIO_PERIODO_3', DateTimeToStr(Partida.DH_Inicio_Periodos[3]) ) ;
   Ini_Local.WriteString ( 'PARTIDA', 'DH_INICIO_PERIODO_4', DateTimeToStr(Partida.DH_Inicio_Periodos[4]) ) ;
End ;
_Debug ( '8 SALVAR_MATRIZ' ) ;
If ( Flags AND FLAG_FUT_ESCALACAO ) > 0 Then Begin
   _Debug ( '9 SALVAR_MATRIZ' ) ;
   FN := GET_DIR_PARTIDA + 'ini_escalacao.dat' ;
   Ini_Local := TMemIniFile.Create ( FN ) ;
   Ini.WriteString ( 'ESCALACAO', 'MODIF', DateTimeToStr(Now) ) ;
   Ini_Local.WriteString ( 'ESCALACAO', 'MODIF', DateTimeToStr(Now) ) ;
   Ini_Local.WriteString ( 'SYSTEM', 'NOW', DateTimeToStr(Now) ) ;
   Ini_Local.WriteInteger ( 'SYSTEM', 'TICK_DIV_1000', (GetTickCount DIV 1000) ) ;
   Ini_Local.WriteString ( 'SYSTEM', 'FLAGS', IntToStr ( Flags ) ) ;
   Ini_Local.WriteString ( 'SYSTEM', 'ORIGEM', Origem ) ;
   _Debug ( '10 SALVAR_MATRIZ' ) ;
   For Cod_Time := 1 To 2 Do Begin
      If Cod_Time = 1 Then Begin
         Secao := 'ESCALACAO_TITULARES_ORIGINAIS_A'
      End Else Begin
         Secao := 'ESCALACAO_TITULARES_ORIGINAIS_B' ;
      End ;
      For Local := 1 To MAX_TITULARES Do Begin
         Ini.WriteString ( Secao, 'NOME_' + StrZero(Local,2),
                           Partida.Titulares_Originais[Cod_Time, Local].Nome ) ;
         Ini.WriteInteger ( Secao, 'CAMISA_' + StrZero(Local,2),
                           Partida.Titulares_Originais[Cod_Time, Local].Camisa ) ;
         Ini.WriteString ( Secao, 'COMBO_' + StrZero(Local,2),
                           Partida.Titulares_Originais[Cod_Time, Local].Combo ) ;
         Ini_Local.WriteString ( Secao, 'NOME_' + StrZero(Local,2),
                                 Partida.Titulares_Originais[Cod_Time, Local].Nome ) ;
         Ini_Local.WriteInteger ( Secao, 'CAMISA_' + StrZero(Local,2),
                                  Partida.Titulares_Originais[Cod_Time, Local].Camisa ) ;
         Ini_Local.WriteString ( Secao, 'COMBO_' + StrZero(Local,2),
                                 Partida.Titulares_Originais[Cod_Time, Local].Combo ) ;
      End ;
      //
      If Cod_Time = 1 Then Begin
         Secao := 'ESCALACAO_RESERVAS_ORIGINAIS_A'
      End Else Begin
         Secao := 'ESCALACAO_RESERVAS_ORIGINAIS_B' ;
      End ;
      For Local := 1 To MAX_RESERVAS Do Begin
         Ini.WriteString ( Secao, 'NOME_' + StrZero(Local,2),
                           Partida.Reservas_Originais[Cod_Time, Local].Nome ) ;
         Ini.WriteInteger ( Secao, 'CAMISA_' + StrZero(Local,2),
                           Partida.Reservas_Originais[Cod_Time, Local].Camisa ) ;
         Ini.WriteString ( Secao, 'COMBO_' + StrZero(Local,2),
                           Partida.Reservas_Originais[Cod_Time, Local].Combo ) ;
         Ini_Local.WriteString ( Secao, 'NOME_' + StrZero(Local,2),
                                 Partida.Reservas_Originais[Cod_Time, Local].Nome ) ;
         Ini_Local.WriteInteger ( Secao, 'CAMISA_' + StrZero(Local,2),
                                  Partida.Reservas_Originais[Cod_Time, Local].Camisa ) ;
         Ini_Local.WriteString ( Secao, 'COMBO_' + StrZero(Local,2),
                                 Partida.Reservas_Originais[Cod_Time, Local].Combo ) ;
      End ;
      //
      If Cod_Time = 1 Then Begin
         Secao := 'ESCALACAO_TITULARES_ANDAMENTO_A'
      End Else Begin
         Secao := 'ESCALACAO_TITULARES_ANDAMENTO_B' ;
      End ;
      For Local := 1 To MAX_TITULARES Do Begin
         Ini.WriteString ( Secao, 'NOME_' + StrZero(Local,2),
                           Partida.Titulares_Andamento[Cod_Time, Local].Nome ) ;
         Ini.WriteInteger ( Secao, 'CAMISA_' + StrZero(Local,2),
                           Partida.Titulares_Andamento[Cod_Time, Local].Camisa ) ;
         Ini.WriteString ( Secao, 'COMBO_' + StrZero(Local,2),
                           Partida.Titulares_Andamento[Cod_Time, Local].Combo ) ;
         Ini_Local.WriteString ( Secao, 'NOME_' + StrZero(Local,2),
                                 Partida.Titulares_Andamento[Cod_Time, Local].Nome ) ;
         Ini_Local.WriteInteger ( Secao, 'CAMISA_' + StrZero(Local,2),
                                  Partida.Titulares_Andamento[Cod_Time, Local].Camisa ) ;
         Ini_Local.WriteString ( Secao, 'COMBO_' + StrZero(Local,2),
                                 Partida.Titulares_Andamento[Cod_Time, Local].Combo ) ;
      End ;
      //
      If Cod_Time = 1 Then Begin
         Secao := 'ESCALACAO_RESERVAS_ANDAMENTO_A'
      End Else Begin
         Secao := 'ESCALACAO_RESERVAS_ANDAMENTO_B' ;
      End ;
      For Local := 1 To MAX_RESERVAS Do Begin
         Ini.WriteString ( Secao, 'NOME_' + StrZero(Local,2),
                           Partida.Reservas_Andamento[Cod_Time, Local].Nome ) ;
         Ini.WriteInteger ( Secao, 'CAMISA_' + StrZero(Local,2),
                           Partida.Reservas_Andamento[Cod_Time, Local].Camisa ) ;
         Ini.WriteString ( Secao, 'COMBO_' + StrZero(Local,2),
                           Partida.Reservas_Andamento[Cod_Time, Local].Combo ) ;
         Ini_Local.WriteString ( Secao, 'NOME_' + StrZero(Local,2),
                                 Partida.Reservas_Andamento[Cod_Time, Local].Nome ) ;
         Ini_Local.WriteInteger ( Secao, 'CAMISA_' + StrZero(Local,2),
                                  Partida.Reservas_Andamento[Cod_Time, Local].Camisa ) ;
         Ini_Local.WriteString ( Secao, 'COMBO_' + StrZero(Local,2),
                                 Partida.Reservas_Andamento[Cod_Time, Local].Combo ) ;
      End ;
      //
      If Cod_Time = 1 Then Begin
         Secao := 'ESCALACAO_FORA_ANDAMENTO_A'
      End Else Begin
         Secao := 'ESCALACAO_FORA_ANDAMENTO_B' ;
      End ;
      For Local := 1 To MAX_RESERVAS Do Begin
         Ini.WriteString ( Secao, 'NOME_' + StrZero(Local,2),
                           Partida.Fora_Andamento[Cod_Time, Local].Nome ) ;
         Ini.WriteInteger ( Secao, 'CAMISA_' + StrZero(Local,2),
                           Partida.Fora_Andamento[Cod_Time, Local].Camisa ) ;
         Ini.WriteString ( Secao, 'COMBO_' + StrZero(Local,2),
                           Partida.Fora_Andamento[Cod_Time, Local].Combo ) ;
         Ini_Local.WriteString ( Secao, 'NOME_' + StrZero(Local,2),
                                 Partida.Fora_Andamento[Cod_Time, Local].Nome ) ;
         Ini_Local.WriteInteger ( Secao, 'CAMISA_' + StrZero(Local,2),
                                  Partida.Fora_Andamento[Cod_Time, Local].Camisa ) ;
         Ini_Local.WriteString ( Secao, 'COMBO_' + StrZero(Local,2),
                                 Partida.Fora_Andamento[Cod_Time, Local].Combo ) ;
      End ;
   End ;
End ;
_Debug ( '11 SALVAR_MATRIZ' ) ;
If ( Flags AND FLAG_FUT_FOGUETES ) > 0 Then Begin
   _Debug ( '12 SALVAR_MATRIZ' ) ;
   FN := GET_DIR_PARTIDA + 'ini_foguetes.dat' ;
   Ini_Local := TMemIniFile.Create ( FN ) ;
   Ini_Local.WriteString ( 'SYSTEM', 'NOW', DateTimeToStr(Now) ) ;
   Ini_Local.WriteInteger ( 'SYSTEM', 'TICK_DIV_1000', (GetTickCount DIV 1000) ) ;
   Ini_Local.WriteString ( 'SYSTEM', 'FLAGS', IntToStr ( Flags ) ) ;
   Ini_Local.WriteString ( 'SYSTEM', 'ORIGEM', Origem ) ;
   //
   Ini.WriteString ( 'PATROCINADORES', 'PAT-01', Partida.Foguetes[1] ) ;
   Ini.WriteString ( 'PATROCINADORES', 'PAT-02', Partida.Foguetes[2] ) ;
   Ini.WriteString ( 'PATROCINADORES', 'PAT-03', Partida.Foguetes[3] ) ;
   Ini.WriteString ( 'PATROCINADORES', 'PAT-04', Partida.Foguetes[4] ) ;
   Ini.WriteString ( 'PATROCINADORES', 'PAT-05', Partida.Foguetes[5] ) ;
   Ini.WriteString ( 'PATROCINADORES', 'PAT-06', Partida.Foguetes[6] ) ;
   //
   Ini_Local.WriteString ( 'PATROCINADORES', 'PAT-01', Partida.Foguetes[1] ) ;
   Ini_Local.WriteString ( 'PATROCINADORES', 'PAT-02', Partida.Foguetes[2] ) ;
   Ini_Local.WriteString ( 'PATROCINADORES', 'PAT-03', Partida.Foguetes[3] ) ;
   Ini_Local.WriteString ( 'PATROCINADORES', 'PAT-04', Partida.Foguetes[4] ) ;
   Ini_Local.WriteString ( 'PATROCINADORES', 'PAT-05', Partida.Foguetes[5] ) ;
   Ini_Local.WriteString ( 'PATROCINADORES', 'PAT-06', Partida.Foguetes[6] ) ;
End ;
_Debug ( '13 SALVAR_MATRIZ' ) ;
If ( Flags AND FLAG_FUT_BOLINHAS ) > 0 Then Begin
   _Debug ( '14 SALVAR_MATRIZ' ) ;
   FN := GET_DIR_PARTIDA + 'ini_bolinhas.dat' ;
   Ini_Local := TMemIniFile.Create ( FN ) ;
   Ini_Local.WriteString ( 'SYSTEM', 'NOW', DateTimeToStr(Now) ) ;
   Ini_Local.WriteInteger ( 'SYSTEM', 'TICK_DIV_1000', (GetTickCount DIV 1000) ) ;
   Ini_Local.WriteString ( 'SYSTEM', 'FLAGS', IntToStr ( Flags ) ) ;
   Ini_Local.WriteString ( 'SYSTEM', 'ORIGEM', Origem ) ;
   //
   Ini.WriteString ( 'BOLINHAS', 'MODIF', DateTimeToStr(Now) ) ;
   Ini.WriteString ( 'BOLINHAS', 'BOL-01', Partida.Bolinhas[1] ) ;
   Ini.WriteString ( 'BOLINHAS', 'BOL-02', Partida.Bolinhas[2] ) ;
   Ini.WriteString ( 'BOLINHAS', 'BOL-03', Partida.Bolinhas[3] ) ;
   Ini.WriteString ( 'BOLINHAS', 'BOL-04', Partida.Bolinhas[4] ) ;
   Ini.WriteString ( 'BOLINHAS', 'BOL-05', Partida.Bolinhas[5] ) ;
   Ini.WriteString ( 'BOLINHAS', 'BOL-06', Partida.Bolinhas[6] ) ;
   //
   Ini_Local.WriteString ( 'BOLINHAS', 'MODIF', DateTimeToStr(Now) ) ;
   Ini_Local.WriteString ( 'BOLINHAS', 'BOL-01', Partida.Bolinhas[1] ) ;
   Ini_Local.WriteString ( 'BOLINHAS', 'BOL-02', Partida.Bolinhas[2] ) ;
   Ini_Local.WriteString ( 'BOLINHAS', 'BOL-03', Partida.Bolinhas[3] ) ;
   Ini_Local.WriteString ( 'BOLINHAS', 'BOL-04', Partida.Bolinhas[4] ) ;
   Ini_Local.WriteString ( 'BOLINHAS', 'BOL-05', Partida.Bolinhas[5] ) ;
   Ini_Local.WriteString ( 'BOLINHAS', 'BOL-06', Partida.Bolinhas[6] ) ;
End ;
_Debug ( '15 SALVAR_MATRIZ' ) ;
If ( Flags AND FLAG_FUT_ARBITRAGEM ) > 0 Then Begin
   _Debug ( '16 SALVAR_MATRIZ' ) ;
   FN := GET_DIR_PARTIDA + 'ini_arbitragem.dat' ;
   Ini_Local := TMemIniFile.Create ( FN ) ;
   Ini_Local.WriteString ( 'SYSTEM', 'NOW', DateTimeToStr(Now) ) ;
   Ini_Local.WriteInteger ( 'SYSTEM', 'TICK_DIV_1000', (GetTickCount DIV 1000) ) ;
   Ini_Local.WriteString ( 'SYSTEM', 'FLAGS', IntToStr ( Flags ) ) ;
   Ini_Local.WriteString ( 'SYSTEM', 'ORIGEM', Origem ) ;
   //
   Ini.WriteString ( 'ARBITRAGEM', 'MODIF', DateTimeToStr(Now) ) ;
   Ini.WriteString ( 'ARBITRAGEM', 'ARBITRO', Partida.Arbitragem.Arbitro ) ;
   Ini.WriteString ( 'ARBITRAGEM', 'ESTADO', Partida.Arbitragem.Estado ) ;
   Ini.WriteString ( 'ARBITRAGEM', 'AUXILIAR_1', Partida.Arbitragem.Auxiliar_1 ) ;
   Ini.WriteString ( 'ARBITRAGEM', 'ESTADO_1', Partida.Arbitragem.Estado_1 ) ;
   Ini.WriteString ( 'ARBITRAGEM', 'AUXILIAR_2', Partida.Arbitragem.Auxiliar_2 ) ;
   Ini.WriteString ( 'ARBITRAGEM', 'ESTADO_2', Partida.Arbitragem.Estado_2 ) ;
   Ini.WriteString ( 'ARBITRAGEM', 'AUXILIAR_3', Partida.Arbitragem.Auxiliar_3 ) ;
   Ini.WriteString ( 'ARBITRAGEM', 'ESTADO_3', Partida.Arbitragem.Estado_3 ) ;
   //
   Ini_Local.WriteString ( 'ARBITRAGEM', 'MODIF', DateTimeToStr(Now) ) ;
   Ini_Local.WriteString ( 'ARBITRAGEM', 'ARBITRO', Partida.Arbitragem.Arbitro ) ;
   Ini_Local.WriteString ( 'ARBITRAGEM', 'ESTADO', Partida.Arbitragem.Estado ) ;
   Ini_Local.WriteString ( 'ARBITRAGEM', 'AUXILIAR_1', Partida.Arbitragem.Auxiliar_1 ) ;
   Ini_Local.WriteString ( 'ARBITRAGEM', 'ESTADO_1', Partida.Arbitragem.Estado_1 ) ;
   Ini_Local.WriteString ( 'ARBITRAGEM', 'AUXILIAR_2', Partida.Arbitragem.Auxiliar_2 ) ;
   Ini_Local.WriteString ( 'ARBITRAGEM', 'ESTADO_2', Partida.Arbitragem.Estado_2 ) ;
   Ini_Local.WriteString ( 'ARBITRAGEM', 'AUXILIAR_3', Partida.Arbitragem.Auxiliar_3 ) ;
   Ini_Local.WriteString ( 'ARBITRAGEM', 'ESTADO_3', Partida.Arbitragem.Estado_3 ) ;
End ;
_Debug ( '16a SALVAR_MATRIZ' ) ;
If ( Flags AND FLAG_FUT_ARBITRAGEM_VAR ) > 0 Then Begin
   _Debug ( '16b SALVAR_MATRIZ' ) ;
   FN := GET_DIR_PARTIDA + 'ini_arbitragem_var.dat' ;
   Ini_Local := TMemIniFile.Create ( FN ) ;
   Ini_Local.WriteString ( 'SYSTEM', 'NOW', DateTimeToStr(Now) ) ;
   Ini_Local.WriteInteger ( 'SYSTEM', 'TICK_DIV_1000', (GetTickCount DIV 1000) ) ;
   Ini_Local.WriteString ( 'SYSTEM', 'FLAGS', IntToStr ( Flags ) ) ;
   Ini_Local.WriteString ( 'SYSTEM', 'ORIGEM', Origem ) ;
   //
   Ini.WriteString ( 'ARBITRAGEM_VAR', 'MODIF', DateTimeToStr(Now) ) ;
   Ini.WriteString ( 'ARBITRAGEM_VAR', 'ARBITRO', Partida.Arbitragem_Var.Arbitro ) ;
   Ini.WriteString ( 'ARBITRAGEM_VAR', 'AUXILIAR_1', Partida.Arbitragem_Var.Auxiliar_1 ) ;
   Ini.WriteString ( 'ARBITRAGEM_VAR', 'AUXILIAR_2', Partida.Arbitragem_Var.Auxiliar_2 ) ;
   //
   Ini_Local.WriteString ( 'ARBITRAGEM_VAR', 'MODIF', DateTimeToStr(Now) ) ;
   Ini_Local.WriteString ( 'ARBITRAGEM_VAR', 'ARBITRO', Partida.Arbitragem_Var.Arbitro ) ;
   Ini_Local.WriteString ( 'ARBITRAGEM_VAR', 'AUXILIAR_1', Partida.Arbitragem_Var.Auxiliar_1 ) ;
   Ini_Local.WriteString ( 'ARBITRAGEM_VAR', 'AUXILIAR_2', Partida.Arbitragem_Var.Auxiliar_2 ) ;
End ;
_Debug ( '17 SALVAR_MATRIZ' ) ;
If ( Flags AND FLAG_FUT_JOGOS ) > 0 Then Begin
   _Debug ( '18 SALVAR_MATRIZ' ) ;
   FN := GET_DIR_PARTIDA + 'ini_jogos.dat' ;
   Ini_Local := TMemIniFile.Create ( FN ) ;
   Ini_Local.WriteString ( 'SYSTEM', 'NOW', DateTimeToStr(Now) ) ;
   Ini_Local.WriteInteger ( 'SYSTEM', 'TICK_DIV_1000', (GetTickCount DIV 1000) ) ;
   Ini_Local.WriteString ( 'SYSTEM', 'FLAGS', IntToStr ( Flags ) ) ;
   Ini_Local.WriteString ( 'SYSTEM', 'ORIGEM', Origem ) ;
   Ini_Local.WriteString ( 'JOGOS_EM_ANDAMENTO', 'MODIF', DateTimeToStr(Now) ) ;
   //
   Ini.WriteString ( 'JOGOS_EM_ANDAMENTO', 'MODIF', DateTimeToStr(Now) ) ;
   _Debug ( '19 SALVAR_MATRIZ' ) ;
   For Local := 1 To MAX_JOGOS_EM_ANDAMENTO Do Begin
      Ini.WriteString ( 'JOGOS_ESTADUAIS_'+StrZero(Local,3), 'TIME_A', Partida.Jogos_E[Local].Time_A ) ;
      Ini.WriteString ( 'JOGOS_ESTADUAIS_'+StrZero(Local,3), 'PLACAR_A', Partida.Jogos_E[Local].P_A ) ;
      Ini.WriteString ( 'JOGOS_ESTADUAIS_'+StrZero(Local,3), 'TIME_B', Partida.Jogos_E[Local].Time_B ) ;
      Ini.WriteString ( 'JOGOS_ESTADUAIS_'+StrZero(Local,3), 'PLACAR_B', Partida.Jogos_E[Local].P_B ) ;
      Ini.WriteString ( 'JOGOS_ESTADUAIS_'+StrZero(Local,3), 'TITULO', Partida.Jogos_E[Local].Titulo ) ;
      Ini.WriteString ( 'JOGOS_ESTADUAIS_'+StrZero(Local,3), 'RODAPE', Partida.Jogos_E[Local].Rodape ) ;
      //
      Ini_Local.WriteString ( 'JOGOS_ESTADUAIS_'+StrZero(Local,3), 'TIME_A', Partida.Jogos_E[Local].Time_A ) ;
      Ini_Local.WriteString ( 'JOGOS_ESTADUAIS_'+StrZero(Local,3), 'PLACAR_A', Partida.Jogos_E[Local].P_A ) ;
      Ini_Local.WriteString ( 'JOGOS_ESTADUAIS_'+StrZero(Local,3), 'TIME_B', Partida.Jogos_E[Local].Time_B ) ;
      Ini_Local.WriteString ( 'JOGOS_ESTADUAIS_'+StrZero(Local,3), 'PLACAR_B', Partida.Jogos_E[Local].P_B ) ;
      Ini_Local.WriteString ( 'JOGOS_ESTADUAIS_'+StrZero(Local,3), 'TITULO', Partida.Jogos_E[Local].Titulo ) ;
      Ini_Local.WriteString ( 'JOGOS_ESTADUAIS_'+StrZero(Local,3), 'RODAPE', Partida.Jogos_E[Local].Rodape ) ;
   End ;
   _Debug ( '20 SALVAR_MATRIZ' ) ;
   For Local := 1 To MAX_JOGOS_EM_ANDAMENTO Do Begin
      Ini.WriteString ( 'JOGOS_NACIONAIS_'+StrZero(Local,3), 'TIME_A', Partida.Jogos_N[Local].Time_A ) ;
      Ini.WriteString ( 'JOGOS_NACIONAIS_'+StrZero(Local,3), 'PLACAR_A', Partida.Jogos_N[Local].P_A ) ;
      Ini.WriteString ( 'JOGOS_NACIONAIS_'+StrZero(Local,3), 'TIME_B', Partida.Jogos_N[Local].Time_B ) ;
      Ini.WriteString ( 'JOGOS_NACIONAIS_'+StrZero(Local,3), 'PLACAR_B', Partida.Jogos_N[Local].P_B ) ;
      Ini.WriteString ( 'JOGOS_NACIONAIS_'+StrZero(Local,3), 'TITULO', Partida.Jogos_N[Local].Titulo ) ;
      Ini.WriteString ( 'JOGOS_NACIONAIS_'+StrZero(Local,3), 'RODAPE', Partida.Jogos_N[Local].Rodape ) ;
      //
      Ini_Local.WriteString ( 'JOGOS_NACIONAIS_'+StrZero(Local,3), 'TIME_A', Partida.Jogos_N[Local].Time_A ) ;
      Ini_Local.WriteString ( 'JOGOS_NACIONAIS_'+StrZero(Local,3), 'PLACAR_A', Partida.Jogos_N[Local].P_A ) ;
      Ini_Local.WriteString ( 'JOGOS_NACIONAIS_'+StrZero(Local,3), 'TIME_B', Partida.Jogos_N[Local].Time_B ) ;
      Ini_Local.WriteString ( 'JOGOS_NACIONAIS_'+StrZero(Local,3), 'PLACAR_B', Partida.Jogos_N[Local].P_B ) ;
      Ini_Local.WriteString ( 'JOGOS_NACIONAIS_'+StrZero(Local,3), 'TITULO', Partida.Jogos_N[Local].Titulo ) ;
      Ini_Local.WriteString ( 'JOGOS_NACIONAIS_'+StrZero(Local,3), 'RODAPE', Partida.Jogos_N[Local].Rodape ) ;
   End ;
End ;
//
_Debug ( '21 SALVAR_MATRIZ' ) ;
Ini_Local.UpdateFile ;
Ini_Local.Free ;
_Debug ( '22 SALVAR_MATRIZ' ) ;
Ini.UpdateFile ;
Ini.Free ;
_Debug ( '23 SALVAR_MATRIZ' ) ;
REFRESH_ARQUIVO ( GET_FN_PARTIDA ) ;
PUT_LOG ( 'FIM SALVAR_MATRIZ' ) ;
_Debug ( 'FIM SALVAR_MATRIZ' ) ;
End ;

Procedure TFutebol.SALVAR_ESTATISTICAS_PARTIDA ( Origem, FN : String ) ;
Var Ini      : TMemIniFile ;
    Cod_Time : LongInt ;
Begin
PUT_LOG ( 'INI SALVAR_ESTATISTICAS_PARTIDA [' + FN + ']' ) ;
Ini := TMemIniFile.Create ( FN ) ;
//
Ini.WriteString ( 'SYSTEM', 'NOW', DateTimeToStr(Now) ) ;
Ini.WriteInteger ( 'SYSTEM', 'TICK_DIV_1000', (GetTickCount DIV 1000) ) ;
//
Ini.WriteString ( 'ESTATISTICAS', 'MODIF', DateTimeToStr(Now) ) ;
For Cod_Time := 1 To 2 Do
   Begin
   Ini.WriteInteger ( 'ESTATISTICAS_' + IntToStr(Cod_Time), 'FALTAS',
                      Partida.Clube[Cod_Time].Estatisticas.Faltas ) ;
   Ini.WriteInteger ( 'ESTATISTICAS_' + IntToStr(Cod_Time), 'IMPEDIMENTOS',
                      Partida.Clube[Cod_Time].Estatisticas.Impedimentos ) ;
   Ini.WriteInteger ( 'ESTATISTICAS_' + IntToStr(Cod_Time), 'SUBSTITUICOES',
                      Partida.Clube[Cod_Time].Estatisticas.Substituicoes ) ;
   Ini.WriteInteger ( 'ESTATISTICAS_' + IntToStr(Cod_Time), 'CARTOES_AMARELOS',
                      Partida.Clube[Cod_Time].Estatisticas.Cartoes_Amarelos ) ;
   Ini.WriteInteger ( 'ESTATISTICAS_' + IntToStr(Cod_Time), 'CARTOES_VERMELHOS',
                      Partida.Clube[Cod_Time].Estatisticas.Cartoes_Vermelhos ) ;
   Ini.WriteInteger ( 'ESTATISTICAS_' + IntToStr(Cod_Time), 'FINALIZACOES',
                      Partida.Clube[Cod_Time].Estatisticas.Finalizacoes ) ;
   Ini.WriteInteger ( 'ESTATISTICAS_' + IntToStr(Cod_Time), 'ESCANTEIOS',
                      Partida.Clube[Cod_Time].Estatisticas.Escanteios ) ;
   Ini.WriteInteger ( 'ESTATISTICAS_' + IntToStr(Cod_Time), 'CHUTES_A_GOL',
                      Partida.Clube[Cod_Time].Estatisticas.Chutes_a_Gol ) ;
   Ini.WriteInteger ( 'ESTATISTICAS_' + IntToStr(Cod_Time), 'BOLAS_ROUBADAS',
                      Partida.Clube[Cod_Time].Estatisticas.Bolas_Roubadas ) ;
   Ini.WriteInteger ( 'ESTATISTICAS_' + IntToStr(Cod_Time), 'ERROS_DE_PASSE',
                      Partida.Clube[Cod_Time].Estatisticas.Erros_de_Passe ) ;
   Ini.WriteInteger ( 'ESTATISTICAS_' + IntToStr(Cod_Time), 'GOLS_PERDIDOS',
                      Partida.Clube[Cod_Time].Estatisticas.Gols_Perdidos ) ;
   Ini.WriteInteger ( 'ESTATISTICAS_' + IntToStr(Cod_Time), 'CONCLUSOES',
                      Partida.Clube[Cod_Time].Estatisticas.Conclusoes ) ;
   Ini.WriteInteger ( 'ESTATISTICAS_' + IntToStr(Cod_Time), 'LEVANTAMENTOS',
                      Partida.Clube[Cod_Time].Estatisticas.Levantamentos ) ;
   End ;
Ini.UpdateFile ;
Ini.Free ;
REFRESH_ARQUIVO ( FN ) ;
PUT_LOG ( 'FIM SALVAR_ESTATISTICAS_PARTIDA' ) ;
End ;

Procedure TFutebol.SALVAR_PARTIDA_OLD ( Origem : String ) ;
Var Ini       : TMemIniFile ;
Begin
If GET_FN_PARTIDA = '' Then
   Begin
   ShowMessage ( 'Nome de arquivo inválido para a partida' + LFLF +
                 '[' + GET_FN_PARTIDA + ']' ) ;
   Exit ;
   End ;
PUT_LOG ( 'INI SALVAR_PARTIDA [' + Origem + '][' + GET_FN_PARTIDA + ']' ) ;
Ini := TMemIniFile.Create ( GET_FN_PARTIDA ) ;
//
Ini.WriteString ( 'SYSTEM', 'NOW', DateTimeToStr(Now) ) ;
Ini.WriteInteger ( 'SYSTEM', 'TICK_DIV_1000', (GetTickCount DIV 1000) ) ;
//
Ini.WriteString ( 'PARTIDA_DT_FN_NOME', 'MODIF', DateTimeToStr(Now) ) ;
Ini.WriteString ( 'PARTIDA', 'DT', DateTimeToStr ( Partida.DT ) ) ;
Ini.WriteString ( 'PARTIDA', 'NOME', Partida.Nome ) ;
Ini.WriteString ( 'PARTIDA', 'FN', GET_FN_PARTIDA ) ;
Ini.UpdateFile ;
Ini.Free ;
SALVAR_ARBITRAGEM ( 'SALVAR_PARTIDA_OLD' ) ;
SALVAR_PATROCINADORES ( 'SALVAR_PARTIDA_OLD' ) ;
SALVAR_DADOS_PARTIDA_CRONOMETRO ( 'SALVAR_PARTIDA_OLD' ) ;
SALVAR_DADOS_PRINCIPAIS_DA_PARTIDA ( 'SALVAR_PARTIDA_OLD' ) ;
SALVAR_ESTATISTICAS_PARTIDA ( 'SALVAR_PARTIDA_OLD', GET_FN_PARTIDA_ESTATISTICAS ) ;
SALVAR_PLACAR_PARTIDA ( 'SALVAR_PARTIDA_OLD' ) ;
SALVAR_EVENTOS_ESTATISTICOS ( GET_FN_PARTIDA ) ;
SALVAR_EVENTOS_ESTATISTICOS ( GET_FN_PARTIDA_EVENTOS ) ;
SALVAR_ESCALACAO ( 'SALVAR_PARTIDA_OLD' ) ;
REFRESH_ARQUIVO ( GET_FN_PARTIDA ) ;
PUT_LOG ( 'FIM SALVAR_PARTIDA' ) ;
End ;

Procedure TFutebol.SALVAR_EVENTOS_ESTATISTICOS ( FN : String ) ;
Var Ini   : TMemIniFile ;
    Qtde  : LongInt ;
    Local : LongInt ;
    Aux   : String ;
Begin
If FN = '' Then
   Begin
   ShowMessage ( 'Nome de arquivo inválido para eventos da partida' + LFLF +
                 '[' + FN + ']' ) ;
   Exit ;
   End ;
PUT_LOG ( 'INI SALVAR_EVENTOS_ESTATISTICOS [' + FN + ']' ) ;
Ini := TMemIniFile.Create ( FN ) ;
//
Ini.WriteString ( 'SYSTEM', 'NOW', DateTimeToStr(Now) ) ;
Ini.WriteInteger ( 'SYSTEM', 'TICK_DIV_1000', (GetTickCount DIV 1000) ) ;
//
Ini.EraseSection ( 'EVENTOS_ESTATISTICOS' ) ;
Qtde := Length ( Partida.Eventos_Estatisticos ) ;
Ini.WriteString ( 'EVENTOS_ESTATISTICOS', 'MODIF', DateTimeToStr(Now) ) ;
For Local := 0 To Qtde - 1 Do
   Begin
   Aux := IntToStr ( Local ) + '#' +
          STR_EVENTO ( Partida.Eventos_Estatisticos[Local].Evento2 ) + '#' +
          IntToStr ( INT_EVENTO ( Partida.Eventos_Estatisticos[Local].Evento2 ) ) + '#' +
          Partida.Eventos_Estatisticos[Local].Par1 + '#' +
          IntToStr ( Partida.Eventos_Estatisticos[Local].Par2 ) + '#' +
          Partida.Eventos_Estatisticos[Local].Par3 + '#' +
          IntToStr ( Partida.Eventos_Estatisticos[Local].Par4 ) + '#' +
          IF01 ( Partida.Eventos_Estatisticos[Local].Carregado ) + '#' +
          IntToStr ( Partida.Eventos_Estatisticos[Local].Periodo ) + '#' +
          IntToStr ( Partida.Eventos_Estatisticos[Local].Crono_Seg ) + '#' ;
   Ini.WriteString ( 'EVENTOS_ESTATISTICOS', 'EVT_' + StrZero(Local,4), Aux ) ;
   End ;
//
Ini.UpdateFile ;
Ini.Free ;
REFRESH_ARQUIVO ( FN ) ;
PUT_LOG ( 'FIM SALVAR_EVENTOS_ESTATISTICOS [' + FN + ']' ) ;
End ;

Procedure TFutebol.QuickSort_Jogadores (Var A: Array Of T_Camisas; iLo, iHi: Integer) ;
Var Lo, Hi : Integer ;
    Pivot  : T_Camisas ;
    T      : T_Camisas ;
Begin
Lo := iLo ;
Hi := iHi ;
Pivot := A[(Lo + Hi) DIV 2] ;
Repeat
  While A[Lo].Nome < Pivot.Nome Do Begin
     Inc(Lo) ;
  End ;
  While A[Hi].Nome > Pivot.Nome Do Begin
     Dec(Hi) ;
  End ;
  If Lo <= Hi Then Begin
     T := A[Lo] ;
     A[Lo] := A[Hi] ;
     A[Hi] := T ;
     Inc(Lo) ;
     Dec(Hi) ;
  End ;
  Until Lo > Hi ;
If Hi > iLo Then Begin
   QuickSort_Jogadores (A, iLo, Hi) ;
End ;
If Lo < iHi Then Begin
   QuickSort_Jogadores (A, Lo, iHi) ;
End ;
End ;

Procedure TFutebol.QuickSort_Camisas (Var A: Array Of T_Camisas; iLo, iHi: Integer) ;
Var Lo, Hi : Integer ;
    Pivot  : T_Camisas ;
    T      : T_Camisas ;
Begin
Lo := iLo ;
Hi := iHi ;
Pivot := A[(Lo + Hi) DIV 2] ;
Repeat
  While A[Lo].Camisa < Pivot.Camisa Do Begin
     Inc(Lo) ;
  End ;
  While A[Hi].Camisa > Pivot.Camisa Do Begin
     Dec(Hi) ;
  End ;
  If Lo <= Hi Then Begin
     T := A[Lo] ;
     A[Lo] := A[Hi] ;
     A[Hi] := T ;
     Inc(Lo) ;
     Dec(Hi) ;
  End ;
  Until Lo > Hi ;
If Hi > iLo Then Begin
   QuickSort_Camisas (A, iLo, Hi) ;
End ;
If Lo < iHi Then Begin
   QuickSort_Camisas (A, Lo, iHi) ;
End ;
End ;

Procedure TFutebol.CRIAR_BACKUP_JOGADORES ( Cod_Time : LongInt ) ;
Var //Qtde   : LongInt ;
//    Local  : LongInt ;
//    Aux    : String ;
    FN     : String ;
    FN_Bak : String ;
Begin
FN := GET_DIR_TIME ( Cod_Time ) + 'Jogadores_Camisas.TXT' ;
FN_Bak := GET_DIR_TIME ( Cod_Time ) + 'Backup\' + DATAHORA_INVERSA(Now) + '_Jogadores_Camisas.TXT' ;
CHECAR_DIRETORIO_FILENAME ( FN_Bak ) ;
If CopiaArquivo ( 'TFutebol.CRIAR_BACKUP_JOGADORES/1',
                  FN, FN_Bak, SOBREPOE ) Then ;
FN := GET_DIR_TIME ( Cod_Time ) + 'Jogadores_Nomes.TXT' ;
FN_Bak := GET_DIR_TIME ( Cod_Time ) + 'Backup\' + DATAHORA_INVERSA(Now) + '_Jogadores_Nomes.TXT' ;
CHECAR_DIRETORIO_FILENAME ( FN_Bak ) ;
If CopiaArquivo ( 'TFutebol.CRIAR_BACKUP_JOGADORES/2',
                  FN, FN_Bak, SOBREPOE ) Then ;
End ;

Procedure TFutebol.SALVAR_JOGADORES ( Cod_Time : LongInt ) ;
Var Qtde  : LongInt ;
    Local : LongInt ;
    Aux   : String ;
    FN    : String ;
Begin
CRIAR_BACKUP_JOGADORES ( Cod_Time ) ;
Qtde := Length ( Partida.Camisas2[Cod_Time] ) ;
If Qtde = 0 Then Begin
   FN := GET_DIR_TIME ( Cod_Time ) + 'Jogadores_Camisas.TXT' ;
   If RR_DeleteFile ( 'SALVAR JOGADORES/1', FN ) Then ;
   FN := GET_DIR_TIME ( Cod_Time ) + 'Jogadores_Nomes.TXT' ;
   If RR_DeleteFile ( 'SALVAR_JOGADORES/2', FN ) Then ;
   Exit ;
End ;
Aux := '' ;
For Local := 0 To Qtde - 1 Do Begin
   If Partida.Camisas2[Cod_Time][Local].Camisa <= 0 Then Begin
      Continue ;
   End ;
   Aux := Aux +
          IntToStr ( Partida.Camisas2[Cod_Time][Local].Camisa ) + '=' +
          Partida.Camisas2[Cod_Time][Local].Nome + sLineBreak ;
End ;
FN := GET_DIR_TIME ( Cod_Time ) + 'Jogadores_Camisas.TXT' ;
WRITE_FILE_CORE ( 'SALVAR_JOGADORES/1', FN, Aux, DELAYED_FALSE ) ;
Aux := '' ;
For Local := 0 To Qtde - 1 Do Begin
   If Trim ( Partida.Camisas2[Cod_Time][Local].Nome ) = '' Then Begin
      Continue ;
   End ;
   Aux := Aux +
          Partida.Camisas2[Cod_Time][Local].Nome + '=' +
          IntToStr ( Partida.Camisas2[Cod_Time][Local].Camisa ) +
          sLineBreak ;
End ;
FN := GET_DIR_TIME ( Cod_Time ) + 'Jogadores_Nomes.TXT' ;
WRITE_FILE_CORE ( 'SALVAR_JOGADORES/1', FN, Aux, DELAYED_FALSE ) ;
End ;

Procedure TFutebol.CARREGAR_CAMISAS_TIME ( Cod_Time : LongInt ) ;
Var FN     : String ;
    Qtde   : LongInt ;
    Local  : LongInt ;
    Aux    : String ;
    Numero : LongInt ;
    Nome   : String ;
    Indice : LongInt ;
    Lista  : TStringList ;
Begin
Indice := 0 ;
SetLength ( Partida.Camisas2[Cod_Time], Indice ) ;
FN := GET_DIR_TIME(Cod_Time) + 'Jogadores_Nomes.TXT' ;
//PUT_LOG ( 'INI CARREGAR CAMISAS_TIME [' + FN + ']' ) ;
Lista := TStringList.Create ;
If RR_FileExists ( 'CARREGAR_CAMISAS_TIME', FN ) Then Begin
   Try
      Lista.Text := GET_CONTEUDO_M ( 'CARREGAR_CAMISAS_TIME', FN ) ;
   Except
      On E : Exception Do Begin
         PUT_LOG ( 'Exception CARREGAR CAMISAS_TIME [' + E.Message + '][' + FN + ']' ) ;
      End ;
   End ;
End Else Begin
   Lista.Free ;
   Exit ;
End ;
Qtde := Lista.Count ;
If Qtde > 0 Then Begin
   For Local := 0 To Qtde - 1 Do Begin
      Aux := Trim ( Lista[Local] ) ;
      If Length ( Aux ) < 3 Then Begin
         PUT_LOG ( 'CARREGAR CAMISAS_TIME AUX/INV1 [' + Aux + ']' ) ;
         Continue ;
      End ;
      If Pos ( '=', Aux ) < 2 Then Begin
         PUT_LOG ( 'CARREGAR CAMISAS_TIME AUX/INV2 [' + Aux + ']' ) ;
         Continue ;
      End ;
      Nome := Copy ( Aux, 1 , Pos ( '=', Aux) - 1 ) ;
      Numero := StrToIntDef ( Copy ( Aux, Pos ( '=', Aux) + 1, Length ( Aux ) ), 0 ) ;
      //PUT_LOG ( 'CARREGAR CAMISAS_TIME Camisas2/1 Idx ' + IntToStr(Indice) + ' {' +
      //          IntToStr(Cod_Time) + '}[' +
      //          IntToStr(Numero) + '][' +
      //          Nome + ']' ) ;
      If Nome <> '' Then Begin
         Inc ( Indice ) ;
         SetLength ( Partida.Camisas2[Cod_Time], Indice ) ;
         Partida.Camisas2[Cod_Time][Indice-1].Camisa := Numero ;
         Partida.Camisas2[Cod_Time][Indice-1].Nome := Nome ;
         {
         PUT_LOG ( 'Camisas2/2 Idx ' + IntToStr(Indice) + ' [' +
                   IntToStr(Cod_Time) + '][' +
                   IntToStr(TFut.Partida.Camisas2[Cod_Time][Indice-1].Camisa) + '][' +
                   TFut.Partida.Camisas2[Cod_Time][Indice-1].Nome + ']' ) ;
         }
      End ;
   End ;
End ;
Lista.Free ;
PUT_LOG ( 'CARREGAR CAMISAS_TIME/x ' + IntToStr(Cod_Time) + ' {' + FN + '} ' +
          'Count[' + IntToStr(Qtde) + ']' ) ;
End ;

(*
Procedure TFutebol.CARREGAR_JOGADORES ( Cod_Time : LongInt ) ;
Var Qtde   : LongInt ;
    Local  : LongInt ;
    Aux    : String ;
    FN     : String ;
    Lista  : TStringList ;
    Indice : LongInt ;
    Nome   : String ;
    Camisa : LongInt ;
Begin
Indice := 0 ;
SetLength ( Partida.Camisas2[Cod_Time], Indice ) ;
FN := GET_DIR_TIME ( Cod_Time ) + 'Jogadores_Camisas.TXT' ;
If NOT RR_FileExists ( 'CARREGAR JOGADORES', FN ) Then Begin
   Exit ;
End ;
Lista := TStringList.Create ;
Try
   Lista.Text := GET_CONTEUDO_M ( 'CARREGAR_JOGADORES', FN ) ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception CARREGAR JOGADORES [' + E.Message + '][' + FN + ']' ) ;
   End ;
End ;
Aux := '' ;
Qtde := Lista.Count ;
If Qtde = 0 Then Begin
   Lista.Free ;
   Exit ;
End ;
For Local := 0 To Qtde - 1 Do Begin
   Aux := Trim ( Lista[Local] ) ;
   If Pos ( '=', Aux ) < 2 Then Begin
      Continue ;
   End ;
   Nome := Copy ( Aux, 1 , Pos ( '=', Aux) - 1 ) ;
   Camisa := StrToIntDef ( Copy ( Aux, Pos ( '=', Aux) + 1, Length ( Aux ) ), 0 ) ;
   Inc ( Indice ) ;
   SetLength ( Partida.Camisas2[Cod_Time], Indice ) ;
   Partida.Camisas2[Cod_Time][Indice-1].Nome := Nome ;
   Partida.Camisas2[Cod_Time][Indice-1].Camisa := Camisa ;
End ;
Lista.Free ;
End ;
*)

Function TFutebol.GET_NOME_JOGADOR_PELA_CAMISA ( Cod_Time : LongInt ; Camisa : LongInt ) : String ;
Var //Indice : String ;
    Local  : LongInt ;
    Qtde   : LongInt ;
Begin
Result := '' ;
If Camisa <= 0 Then Begin
   Exit ;
End ;
Qtde := Length ( Partida.Camisas2[Cod_Time] ) ;
If Qtde = 0 Then Begin
   Exit ;
End ;
For Local := 0 To Qtde - 1 Do Begin
   If Partida.Camisas2[Cod_Time][Local].Camisa = Camisa Then Begin
      Result := Partida.Camisas2[Cod_Time][Local].Nome ;
      Exit ;
   End ;
End ;
End ;

Function TFutebol.GET_CAMISA_JOGADOR_PELO_NOME ( Cod_Time : LongInt ; Nome : String ) : LongInt ;
Var //Indice : String ;
    Local  : LongInt ;
    Qtde   : LongInt ;
Begin
Result := 0 ;
Nome := Trim ( Nome ) ;
If Nome = '' Then Begin
   Exit ;
End ;
Qtde := Length ( Partida.Camisas2[Cod_Time] ) ;
If Qtde = 0 Then Begin
   Exit ;
End ;
For Local := 0 To Qtde - 1 Do Begin
   If Partida.Camisas2[Cod_Time][Local].Nome = Nome Then Begin
      Result := Partida.Camisas2[Cod_Time][Local].Camisa ;
      Exit ;
   End ;
End ;
End ;

Procedure TFutebol.ATUALIZAR_LB_JOGADORES ( LB : TListBox ; Cod_Time : LongInt ) ;
Var Qtde  : LongInt ;
    Local : LongInt ;
Begin
LB.Items.Clear ;
Qtde := Length ( Partida.Camisas2[Cod_Time] ) ;
If Qtde = 0 Then Begin
   Exit ;
End ;
For Local := 0 To Qtde - 1 Do Begin
   If Partida.Camisas2[Cod_Time][Local].Nome <> '' Then Begin
      LB.Items.Add ( Partida.Camisas2[Cod_Time][Local].Nome + '/' +
                     IntToStr(Partida.Camisas2[Cod_Time][Local].Camisa) ) ;
   End ;
End ;
End ;

Function TFutebol.PARTIDA_GET_JOGO_EM_ANDAMENTO_SELECIONADO : T_Jogo_em_Andamento ;
Begin
Result := Partida.Jogo_Em_Andamento_Selecionado ;
End ;

Function TFutebol.PARTIDA_TIME_A_LONGO : String ;
Begin
Result := Partida.TIME_A_LONGO ;
End ;

Function TFutebol.PARTIDA_TIME_B_LONGO : String ;
Begin
Result := Partida.TIME_B_LONGO ;
End ;

Function TFutebol.PARTIDA_CARTAO_AMARELO ( _Time, _Idx : LongInt ) : T_Partida_Cartao ;
Begin
Result := Partida.Cartao_Amarelo[_Time, _Idx] ;
End ;

Function TFutebol.PARTIDA_CARTAO_VERMELHO ( _Time, _Idx : LongInt ) : T_Partida_Cartao ;
Begin
Result := Partida.Cartao_Vermelho[_Time, _Idx] ;
End ;

Procedure TFutebol.PARTIDA_SET_CARTAO_AMARELO_COMBO ( _Time, _Idx : LongInt ; _Combo : String ) ;
Begin
Partida.Cartao_Amarelo[_Time, _Idx].Combo := _Combo ;
End ;

Procedure TFutebol.PARTIDA_SET_CARTAO_VERMELHO_COMBO ( _Time, _Idx : LongInt ; _Combo : String ) ;
Begin
Partida.Cartao_Vermelho[_Time, _Idx].Combo := _Combo ;
End ;

Function TFutebol.GET_PARTIDA_CONTEXTO : T_Partida_Contexto_Clone ;
Begin
_Debug ( 'INI GET_PARTIDA_CONTEXTO' ) ;
Result.P_A := Partida_Contexto.Prot__Placar__A ;
_Debug ( '1 GET_PARTIDA_CONTEXTO' ) ;
Result.P_B := Partida_Contexto.Prot__Placar__B ;
_Debug ( '2 GET_PARTIDA_CONTEXTO' ) ;
Result.V_A := Partida_Contexto.Prot__Vermelhos__A ;
_Debug ( '3 GET_PARTIDA_CONTEXTO' ) ;
Result.V_B := Partida_Contexto.Prot__Vermelhos__B ;
_Debug ( '4 GET_PARTIDA_CONTEXTO' ) ;
Result.Per := Partida_Contexto.Prot__Periodo__Atual ;
_Debug ( '5 GET_PARTIDA_CONTEXTO' ) ;
Result.Acr := Partida_Contexto.Prot__Acrescimo ;
_Debug ( 'FIM GET_PARTIDA_CONTEXTO' ) ;
End ;

Procedure TFutebol.PREPARAR_SUBSTITUICAO(Sai, Entra: String);
Begin
Reg_Substituicao.Sai_Nome := Copy(Sai, Pos(#32,Sai)+1, Length(Sai));
Reg_Substituicao.Sai_Camisa := Copy(Sai, 1, Pos(#32,Sai)-1 );
Reg_Substituicao.Entra_Nome := Copy(Entra, Pos(#32,Entra)+1, Length(Entra));
Reg_Substituicao.Entra_Camisa := Copy(Entra, 1, Pos(#32,Entra)-1);
End;

Procedure TFutebol.ATUALIZAR_ESCUDOS_E_CAMISAS_DOS_TIMES ;
Var Origem  : TStringList ;
    Destino : TStringList ;
    Local   : LongInt ;
    Aux     : String ;
    Nok     : LongInt ;
Begin
Origem := TStringList.Create ;
Destino := TStringList.Create ;
Origem.Add ( GET_DIR_TIME(1) + 'escudo.png' ) ;
Destino.Add ( GET_DIR_TIME_A_PASTA + 'escudo.png' ) ;
Origem.Add ( GET_DIR_TIME(1) + 'escudo_escalacao.png' ) ;
Destino.Add ( GET_DIR_TIME_A_PASTA + 'escudo_escalacao.png' ) ;
Origem.Add ( GET_DIR_TIME(1) + 'escudo_tarjas.png' ) ;
Destino.Add ( GET_DIR_TIME_A_PASTA + 'escudo_tarjas.png' ) ;
Origem.Add ( GET_DIR_TIME(1) + 'camisa.png' ) ;
Destino.Add ( GET_DIR_TIME_A_PASTA + 'camisa.png' ) ;
//
Origem.Add ( GET_DIR_TIME(2) + 'escudo.png' ) ;
Destino.Add ( GET_DIR_TIME_B_PASTA + 'escudo.png' ) ;
Origem.Add ( GET_DIR_TIME(2) + 'escudo_escalacao.png' ) ;
Destino.Add ( GET_DIR_TIME_B_PASTA + 'escudo_escalacao.png' ) ;
Origem.Add ( GET_DIR_TIME(2) + 'escudo_tarjas.png' ) ;
Destino.Add ( GET_DIR_TIME_B_PASTA + 'escudo_tarjas.png' ) ;
Origem.Add ( GET_DIR_TIME(2) + 'camisa.png' ) ;
Destino.Add ( GET_DIR_TIME_B_PASTA + 'camisa.png' ) ;
//
Aux := '' ;
//Nok := 0 ;
For Local := 0 To Origem.Count - 1 Do Begin
   If NOT RR_FileExists ( 'ATUALIZAR ESCUDOS_E_CAMISAS_DOS_TIMES',
                          Origem[Local] ) Then Begin
//      Inc ( Nok ) ;
      Aux := Aux + 'Não encontrado [' + Origem[Local] + ']' + sLineBreak ;
      PUT_LOG ( 'ATUALIZAR_ESCUDOS_E_CAMISAS_DOS_TIMES !FileExists [' + Origem[Local] + ']' ) ;
   End ;
End ;
//If Aux <> '' Then Begin
//   ShowMessage ( 'Não será possível copiar todos os arquivos de escudos dos times:' + sLineBreak +
//                 Aux ) ;
//   Exit ;
//End ;
Nok := 0 ;
Aux := '' ;
For Local := 0 To Origem.Count - 1 Do Begin
   If NOT CopiaArquivo ( 'TFutebol.ATUALIZAR_ESCUDOS_E_CAMISAS_DOS_TIMES',
                         Origem[Local], Destino[Local], SOBREPOE ) Then Begin
      PUT_LOG ( 'ATUALIZAR_ESCUDOS_E_CAMISAS_DOS_TIMES Cópia OK [' + Origem[Local] + '][' + Destino[Local] + ']' ) ;
      Inc ( Nok ) ;
      Aux := Aux + Origem[Local] + sLineBreak +
             Destino[Local] + sLineBreak +
             sLineBreak ;
   End Else Begin
      PUT_LOG ( 'ATUALIZAR_ESCUDOS_E_CAMISAS_DOS_TIMES Cópia NÃO OK [' + Origem[Local] + '][' + Destino[Local] + ']' ) ;
   End ;
End ;
If Nok > 0 Then Begin
   ShowMessage ( 'A atualização dos escudos não foi bem sucedida:' + sLineBreak +
                 Aux ) ;
End Else Begin
   //ShowMessage ( 'A atualização dos escudos foi bem sucedida.' ) ;
End ;
End ;

Procedure TFutebol.ABRIR_PASTA ( Dir : String ) ;
Begin
Dir := INSERE_BARRA ( Dir ) + 'Deposito';
CHECAR_DIRETORIO_DIRNAME ( Dir ) ;
PUT_LOG ( 'OPEN [' + Dir + ']' ) ;
ABRIR_PASTA_EXPLORER ( Dir ) ;
End ;


Procedure TFutebol.ABRIR_PASTA_DATABASE ;
Begin
ABRIR_PASTA ( Diretorio_Database ) ;
End ;

Procedure TFutebol.ABRIR_PASTA_TIMES ;
Begin
ABRIR_PASTA ( Diretorio_Database + 'Times' ) ;
End ;

Procedure TFutebol.ABRIR_PASTA_TIME ( Cod_Time : LongInt ) ;
Begin
ABRIR_PASTA ( GET_DIR_TIME ( Cod_Time ) ) ;
End ;

Procedure TFutebol.ABRIR_PASTA_PARTIDA ;
Begin
ABRIR_PASTA ( GET_DIR_PARTIDA ) ;
End ;

Procedure TFutebol.ABRIR_PASTA_TIME_FOTOS ( Cod_Time : LongInt ) ;
Begin
ABRIR_PASTA ( GET_DIR_FOTOS_LOCAL ( Cod_Time ) ) ;
End ;

Procedure TFutebol.ABRIR_PASTA_TIME_ELENCO ( Cod_Time : LongInt ) ;
Begin
ABRIR_PASTA ( GET_DIR_ELENCO_LOCAL ( Cod_Time ) ) ;
End ;

Procedure TFutebol.ABRIR_PASTA_ACRESCIMOS ;
Begin
ABRIR_PASTA ( GET_DIR_ACRESCIMOS ) ;
End ;

Procedure TFutebol.ABRIR_PASTA_ESCALACAO ;
Begin
ABRIR_PASTA ( GET_DIR_ESCALACAO ) ;
End ;

Procedure TFutebol.ABRIR_PASTA_CLASSIFICACAO ;
Begin
ABRIR_PASTA ( GET_DIR_CLASSIFICACAO ) ;
End ;

Procedure TFutebol.ABRIR_PASTA_ENCERRAMENTO ;
Begin
ABRIR_PASTA ( GET_DIR_ENCERRAMENTO ) ;
End ;

Procedure TFutebol.ABRIR_PASTA_FOGUETES ;
Begin
ABRIR_PASTA ( GET_DIR_FOGUETES ) ;
End ;

Procedure TFutebol.ABRIR_PASTA_BOLINHAS ;
Begin
ABRIR_PASTA ( GET_DIR_BOLINHAS ) ;
End ;

Function CARREGAR_LB_COM_ARQUIVOS ( Dir : String ; Mascara : String ) : TStringList ;
Var RecDos    : TSearchRec ;
    Resultado : LongInt ;
Begin
Result := TStringList.Create ;
Dir := INSERE_BARRA ( Dir ) ;
Try
   Resultado := RR_FindFirst ( 'CARREGAR LB_COM_ARQUIVOS', Dir + Mascara, 0, RecDos ) ;
   While Resultado = 0 Do Begin
      If ( RecDos.Attr AND faDirectory ) = 0 Then Begin
         Result.Add ( Dir + RecDos.Name ) ;
      End ;
      Resultado := SysUtils.FindNext ( RecDos ) ;
   End ;
   SysUtils.FindClose ( RecDos ) ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception CARREGAR LB_COM_ARQUIVOS [' + Dir + '][' + E.Message + ']' ) ;
   End ;
End ;
End ;

Procedure TFutebol.CARREGAR_ARQUIVOS_DATABASE ( LB_All : TListBox ) ;
Var FN    : String ;
    Local : LongInt ;
Begin
LB_All.Items.Clear ;
LB_All.Items.Add ( '** FOGUETES [' + GET_DIR_FOGUETES + ']' ) ;
For Local := 1 To 6 Do Begin
   FN := GET_DIR_FOGUETES + 'p' + IntToStr(Local) + '.mov' ;
   If RR_FileExists ( 'CARREGAR ARQUIVOS_DATABASE/1', FN ) Then Begin
      LB_All.Items.Add ( FN ) ;
   End Else Begin
      LB_All.Items.Add ( '### AUSENTE ' + FN ) ;
   End ;
End ;
LB_All.Items.Add ( '' ) ;
LB_All.Items.Add ( '** BOLINHAS [' + GET_DIR_BOLINHAS + ']' ) ;
For Local := 1 To 6 Do Begin
   FN := GET_DIR_BOLINHAS + 'p' + IntToStr(Local) + '.mov' ;
   If RR_FileExists ( 'CARREGAR ARQUIVOS_DATABASE/2', FN ) Then Begin
      LB_All.Items.Add ( FN ) ;
   End Else Begin
      LB_All.Items.Add ( '### AUSENTE ' + FN ) ;
   End ;
End ;
FN := GET_DIR_BOLINHAS + 'audio.wav' ;
If RR_FileExists ( 'CARREGAR ARQUIVOS_DATABASE/3', FN ) Then Begin
   LB_All.Items.Add ( FN ) ;
End Else Begin
   LB_All.Items.Add ( '### AUSENTE ' + FN ) ;
End ;
LB_All.Items.Add ( '' ) ;
LB_All.Items.Add ( '** ESCALAÇÃO [' + GET_DIR_ESCALACAO + ']' ) ;
FN := GET_DIR_ESCALACAO + 'escalacao.mov' ;
If RR_FileExists ( 'CARREGAR ARQUIVOS_DATABASE/4', FN ) Then Begin
   LB_All.Items.Add ( FN ) ;
End Else Begin
   LB_All.Items.Add ( '### AUSENTE ' + FN ) ;
End ;
LB_All.Items.Add ( '' ) ;
LB_All.Items.Add ( '** ENCERRAMENTO [' + GET_DIR_ENCERRAMENTO + ']' ) ;
FN := GET_DIR_ENCERRAMENTO + 'encerramento.mov' ;
If RR_FileExists ( 'CARREGAR ARQUIVOS_DATABASE/5', FN ) Then Begin
   LB_All.Items.Add ( FN ) ;
End Else Begin
   LB_All.Items.Add ( '### AUSENTE ' + FN ) ;
End ;
LB_All.Items.Add ( '' ) ;
LB_All.Items.Add ( '** ACRÉSCIMOS [' + GET_DIR_ACRESCIMOS + ']' ) ;
FN := GET_DIR_ACRESCIMOS + 'acrescimos1.mov' ;
If RR_FileExists ( 'CARREGAR ARQUIVOS_DATABASE/6', FN ) Then Begin
   LB_All.Items.Add ( FN ) ;
End Else Begin
   LB_All.Items.Add ( '### AUSENTE ' + FN ) ;
End ;
FN := GET_DIR_ACRESCIMOS + 'acrescimos2.mov' ;
If RR_FileExists ( 'CARREGAR ARQUIVOS_DATABASE/7', FN ) Then Begin
   LB_All.Items.Add ( FN ) ;
End Else Begin
   LB_All.Items.Add ( '### AUSENTE ' + FN ) ;
End ;
FN := GET_DIR_ACRESCIMOS + 'acrescimos3.mov' ;
If RR_FileExists ( 'CARREGAR ARQUIVOS_DATABASE/8', FN ) Then Begin
   LB_All.Items.Add ( FN ) ;
End Else Begin
   LB_All.Items.Add ( '### AUSENTE ' + FN ) ;
End ;
FN := GET_DIR_ACRESCIMOS + 'acrescimos4.mov' ;
If RR_FileExists ( 'CARREGAR ARQUIVOS_DATABASE/9', FN ) Then Begin
   LB_All.Items.Add ( FN ) ;
End Else Begin
   LB_All.Items.Add ( '### AUSENTE ' + FN ) ;
End ;
FN := GET_DIR_ACRESCIMOS + 'audio.wav' ;
If RR_FileExists ( 'CARREGAR ARQUIVOS_DATABASE/10', FN ) Then Begin
   LB_All.Items.Add ( FN ) ;
End Else Begin
   LB_All.Items.Add ( '### AUSENTE ' + FN ) ;
End ;
LB_All.Items.Add ( '' ) ;
LB_All.Items.Add ( '** CITAÇÃO NARRADORES [' + GET_DIR_CITACAO_NARRADORES + ']' ) ;
FN := GET_DIR_CITACAO_NARRADORES + 'citacao_narradores.mov' ;
If RR_FileExists ( 'CARREGAR ARQUIVOS_DATABASE/11', FN ) Then Begin
   LB_All.Items.Add ( FN ) ;
End Else Begin
   LB_All.Items.Add ( '### AUSENTE ' + FN ) ;
End ;
LB_All.Items.Add ( '' ) ;
LB_All.Items.Add ( '** CLASSIFICAÇÃO [' + GET_DIR_CLASSIFICACAO + ']' ) ;
FN := GET_DIR_CLASSIFICACAO + 'classificacao.mov' ;
If RR_FileExists ( 'CARREGAR ARQUIVOS_DATABASE/12', FN ) Then Begin
   LB_All.Items.Add ( FN ) ;
End Else Begin
   LB_All.Items.Add ( '### AUSENTE ' + FN ) ;
End ;
LB_All.Items.Add ( '' ) ;
End ;

Procedure TFutebol.ATUALIZAR_CONFRONTOS_SEMIFINAIS ( Reg : T_Confrontos_Semifinal ) ;
Begin
Partida.Confrontos_Semifinal := Reg ;
End ;

End.

