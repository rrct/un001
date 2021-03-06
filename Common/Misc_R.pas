Unit Misc_R;

Interface

Uses Misc_Def_U,
     Misc_Const_U,
     Misc_Type_U,
     Transparentes_U,
     T_Supervisor_Pasta_U,
     Log_U,
     //T_FFMpeg,
     //Carregando_Sistema_U,
     //Espelho_RD_Def_U,
     T_TPanel,
     MyRichEdit_U,
     WinInet,
     //ActiveX,
     //Shdocvw_tlb,
     //MSHTML_TLB,
     RichEdit,
     XMLDoc,
     ddeman,
     //shdocvw_tlb,
     XMLIntf,
     //Form_Misc_U,
     SysUtils,
     TypInfo,
     //SynaUtil,
     Winapi.Messages,
     IdGlobal, IdHash, IdHashMessageDigest,
     //USock_U,
     System.NetEncoding,
     System.Variants, System.Win.StdVCL, Vcl.OleServer, Winapi.ActiveX,
     System.Win.ComObj,
     //ALBasicAudioOut, ALAudioOut, Mitov.Types, ALAudioIn,
     IdComponent, IdTCPConnection, IdTCPClient, AdFtp,
     IdExplicitTLSClientServerBase, IdFTP, IdFTPList,
     AdPort , OoMisc,
     //UDP_Ux,
     Math,
     ShellAPI,
     Vcl.Mask,
     Vcl.Controls,
     Vcl.ExtCtrls,
     VCLTee.Chart,
     VCLTee.Series,
     Vcl.OleCtrls,
     Vcl.Menus,
     Vcl.Buttons,
     Vcl.StdCtrls,
     DBGrids,
     System.Types,
     System.Threading,
     System.UITypes, System.Classes,
     Vcl.Forms, Vcl.Dialogs,
     Vcl.Imaging.pngimage,
     Vcl.Imaging.jpeg,
     Windows ,
     TlHelp32 ,
     IniFiles ,
     VCL.Grids ,
     Vcl.Graphics,
     Vcl.Samples.Spin, Vcl.ComCtrls,
     Registry ,
     DateUtils,
     System.IOUtils,
     System.UIConsts,
     AppEvnts,
     Printers ,
//
     System.Win.ScktComp,
     IdIcmpClient,
     IdUDPClient,
     IdCmdTCPClient,
//     AdPort,
     MMSystem,
     IdTelnetServer,
     IdHTTP,
     //WMPLib_TLB,
//
//     ALDSAudioPlayer,
//     MLDSPlayer,
//     VLDSVideoPlayer ,
//
     FireDAC.Stan.Intf, FireDAC.Stan.Option,
     FireDAC.Stan.Param, FireDAC.Stan.Error,
     FireDAC.DatS, FireDAC.Phys.Intf,
     FireDAC.DApt.Intf, FireDAC.Stan.Async,
     FireDAC.DApt, FireDAC.Phys.MySQLDef,
     FireDAC.UI.Intf, FireDAC.Stan.Def,
     FireDAC.Stan.Pool, FireDAC.Phys,
     FireDAC.VCLUI.Wait,
     FireDAC.Phys.MySQL, Data.DB,
     FireDAC.Comp.Client, FireDAC.Comp.DataSet;

Type

TMyPanel = class(TPanel)
public
 property Canvas;
end;

Const MAX_COND      = 100 ;
      MAX_CELULAS   = 20 ;
      MAX_CONFIG    = 50 ;
      CR            = #13 ;
      LF            : String = #10 ;
      LFLF          : String = #10#10 ;
      CRLF          : String = #13#10 ;
      CRLF2         : String = #13#10#13#10 ;
      TAB           = #9 ;

      clNone	       = $1FFFFFFF ;
      clAqua	       = $FFFF00 ;
      clBlack	      = $000000 ;
      clBlue	       = $FF0000 ;
      clCream 	     = $F0FBFF ;
      clDkGray	     = $808080 ;
      clFuchsia     = $FF00FF ;
      clGray	       = $808080 ;
      clGreen 	     = $008000 ;
      clLime	       = $00FF00 ;
      clLtGray	     = $C0C0C0 ;
      clMaroon	     = $000080 ;
      clMedGray	    = $A4A0A0 ;
      clMoneyGreen  = $C0DCC0 ;
      clNavy  	     = $800000 ;
      clOlive	      = $008080 ;
      clPurple  	   = $800080 ;
      clRed	        = $0000FF ;
      clSilver	     = $C0C0C0 ;
      clSkyBlue	    = $F0CAA6 ;
      clTeal	       = $808000 ;
      clWhite	      = $FFFFFF ;
      clYellow	     = $00FFFF ;

Const SIZE_DEBUG          = 30 ;
      MAX_ARRAY_DIRETORIO = 10 ;
      MAX_ARRAY_CC        = 5000 ;
      //
      IDX_ARRAY_DIRETORIO_HD      = 1 ;
      IDX_ARRAY_DIRETORIO_HD_AUTO = 2 ;
      IDX_ARRAY_DIRETORIO_VIDEO   = 3 ;
      IDX_ARRAY_DIRETORIO_AUDIO   = 4 ;
      //
    EVENTO_TEXTO_CC            = 1 ;
    EVENTO_BREAK_INI           = 2 ;
    EVENTO_BREAK_FIM           = 3 ;
    EVENTO_PROTECAO_AGENDA_INI = 4 ;
    EVENTO_PROTECAO_AGENDA_FIM = 5 ;
    EVENTO_FORMCREATE_ENCODER  = 6 ;
    EVENTO_FORMCREATE_HARRIS   = 7 ;
    EVENTO_FORMCREATE_SPLITTER = 8 ;
    EVENTO_PLAY_HARRIS         = 9 ;
    EVENTO_CUE_HARRIS          = 10 ;

    EVENTO_P2_SHOW             = 11 ;
    EVENTO_P2_START_FFMPEG     = 12 ;
    EVENTO_P2_END_FFMPEG       = 13 ;
    EVENTO_P2_START_COPY       = 14 ;
    EVENTO_P2_END_COPY_OK      = 15 ;
    EVENTO_P2_END_COPY_NOK     = 16 ;
    EVENTO_P2_CLOSE            = 17 ;

Function GET_FN_LICENCA : String  ;
Function DISTANCIA_MT ( Lat1, Long1, Lat2, Long2 : Double ) : LongInt ;
Function DISTANCIA_MT_COS ( Lat1, Long1, Lat2, Long2 : Double ) : Double ;
Function Distancia_Dois_Pontos ( x1, y1, x2, y2 : Double): Double ;
Function Distancia_Dois_Pontos_M ( x1, y1, x2, y2 : Double): Double ;
Function PointInPolygon ( Point: TPoint; Const Polygon: Array of TPoint ) : Boolean ;
Function DistancePointLine ( px, py, x1, y1, x2, y2 : Double): Double ;
Function DISTANCIA_MT_COS_ANGULO ( Lat1, Long1, Lat2, Long2 : Double ;
                                   Indice : LongInt ;
                                   Var Angulo : Double ; Var Regiao : String ;
                                   Var Poligono : String ; Estilo : String ;
                                   Var PlaceMark : String ) : Double ;
Function IIF ( Condicao : Boolean ; S1, S2 : String ) : String ;
Function IF01 ( Condicao : Boolean ) : String ;
Function IFSN ( Condicao : Boolean ) : String ;
Function IIFN ( Condicao : Boolean ; N1 , N2 : LongInt ) : LongInt ;
Function IIFF ( Condicao : Boolean ; N1 , N2 : Single ) : Single ;
Function SegundosToMMSS ( Aux : LongInt ) : String ;
Function CASA0_PONTO ( Aux : Double ) : String ;
Function CASA1_PONTO ( Aux : Double ) : String ;
Function CASA2_PONTO ( Aux : Double ) : String ;
Function CASA3_PONTO ( Aux : Double ) : String ;
Function CASA4_PONTO ( Aux : Double ) : String ;
Function CASA6_PONTO ( Aux : Double ) : String ;
Function CASA7_PONTO ( Aux : Double ) : String ;
Function CASA8_PONTO ( Aux : Double ) : String ;
Function CASA9_PONTO ( Aux : Double ) : String ;
Function StrZero ( Aux, Casas : LongInt ) : String ;
Function FORMAT_DISTANCIA ( Metros : LongInt ) : String ;
Function StrToFloat_RR ( Valor : String ; Default : Double ) : Double ;
Procedure EXPLODE_RR ( Delimitador : Char ; Texto : String ; Var Lista : TStringList ) ;
Function EXPLODE ( StrLinha, Delimitador : String ) : TStringList ;
Function FORMATAR_IP ( IP : Cardinal ) : String ;
Function LISTA_TO_CARDINAL ( Origem, Delimitador : String ) : Cardinal ;
Function INSERE_BARRA ( Dir : String ) : String ;
Function INSERE_BARRA_LINUX ( Dir : String ) : String ;
Function INSERE_BARRA_NORMAL ( Dir : String ) : String ;
Function REMOVE_BARRAS ( Str : String ) : String ;
Function REMOVE_BARRA ( Dir : String ) : String ;
Function DATAHORA_INVERSA_TO_DATETIME ( Data : String ) : TDateTime ;
Function DATA_INVERSA_TO_DATETIME ( Data : String ) : TDateTime ;
Function DATAHORA_INVERSA ( Data : TDateTime ) : String ;
Function DATA_INVERSA ( Data : TDateTime ) : String ;
Procedure CHECAR_DIRETORIO_FILENAME ( _FileName : String ) ;
Procedure CHECAR_DIRETORIO_DIRNAME ( _DirName : String ) ;
Procedure GRAVAR_BUFFER_WRITE_FILE ;
//Procedure WRITE_FILE_CORE2 ( Origem, FN, Conteudo : String ; _Delayed : Boolean ) ;
Procedure WRITE_FILE_CORE ( Origem, FN, Conteudo : String ; _Delayed : Boolean ) ;
//Procedure WRITE_FILE_REAL ( _FileName , _Conteudo : String ; _Delayed : Boolean ) ;
//Procedure WRITE_FILE_REAL_WIN ( _FileName , _Conteudo : String ; _Delayed : Boolean ) ;
//Procedure WRITE_FILE_REAL_WIN_UTF8 ( _FileName , _Conteudo : String ; _Delayed : Boolean ) ;
Function SAVE_CONTEUDO_HEXA ( _FileName , Conteudo : String ;
                              Basico : Boolean ; _Delayed : Boolean ) : LongInt ;
Function IS_STRING_HEXA_VALIDA ( Str : String ) : Boolean ;
Function Single_To_Hexa ( _Single : Single ) : String ;
Function HexToChar ( _Hexa : String ) : Char ;
//Function String_Hexa_To_String ( H : RawByteString ) : RawByteString ;
Function String_Hexa_To_String ( HexStr: String ) : String ;
//Function String_Hexa_To_String_OLD ( H : RawByteString ) : RawByteString ;
Procedure Single_To_Char ( _Single : Single ;
                           Var C1 : Char ; Var C2 : Char ;
                           Var C3 : Char ; Var C4 : Char ) ;
Function SINGLE_TO_STR ( _Single : Single ) : String ;
Function SINGLE_TO_STR_INVERSO ( _Single : Single ) : String ;
Procedure _Debug ( Msg : String ) ;
Function RR_FileSize_KB ( Filename : String ): Int64 ;
Function RR_FileSize ( Filename : String ): Int64 ;
Procedure APPEND_TEXTO ( Origem, FN , Texto : String ) ;
Function SQL_STR ( Aux : String ) : String ;
Function STR_SQL ( Aux : String ) : String ;
Function DT_SQL ( Aux : TDateTime ) : String ;
Function DATE_SQL ( Aux : TDateTime ) : String ;
Function TIME_SQL ( Aux : TDateTime ) : String ;
Function BinToDec (Valor: String): Cardinal ;
Function DecToBin (Valor: Integer; Largura : LongInt): String ;
Function INT_TO_BIN ( B1, B2, B3, B4 : Cardinal ) : RawByteString ;
Function MES_STR_TO_INT ( Mes : String ) : LongInt ;
Function NOME_MES ( Mes : LongInt ) : String ;
Function DT_UNIX_TO_DATETIME ( Mes, Dia, Aux : String ) : TDateTime ;
Function TEXTO_RANDOMICO ( Qtde : LongInt ) : String ;
Function Super_UpCase ( Key : Char ) : Char ;
Function Super_UpperCase ( Str : String ) : String ;
Function RETIRAR_EXTENSOES_AUDIO_VIDEO ( FN : String ) : String ;
Function RETIRAR_EXTENSOES_CC ( FN : String ) : String ;
Function IS_ARQUIVO_EXECUTAVEL ( FN : String ) : Boolean ;
Function IS_ARQUIVO_AUDIO ( FN : String ) : Boolean ;
Function IS_ARQUIVO_IMAGEM ( FN : String ) : Boolean ;
Function IS_ARQUIVO_PLT ( FN : String ) : Boolean ;
Function IS_ARQUIVO_TC ( FN : String ) : Boolean ;
Function IS_ARQUIVO_VIDEO ( FN : String ) : Boolean ;
Function IS_ARQUIVO_CC ( FN : String ) : Boolean ;
Function IS_ARQUIVO_TEXTO ( FN : String ) : Boolean ;
Function CONFIRMAR_EXCLUSAO_DE_ARQUIVO ( FN : String ) : Boolean ;
Function NEW_CONFIRMACAO ( Mensagem : String ) : Boolean ;
Function GET_HOME_PATH : String ;
Function GET_DOCUMENTS_PATH : String ;
Function GET_DESKTOP_PATH : String ;
Function GET_PICTURES_PATH : String ;
Function GET_MUSIC_PATH : String ;
Function GET_MOVIES_PATH : String ;
Function GET_TEMP_PATH : String ;
Function DIR_BASE_PROGRAMAS : String ;
Function DIR_BASE_SISTEMA : String ;
Function DIR_BASE_HD : String ;
Function DIR_BASE_VIDEO_TRANSFERINDO : String ;
Function DIR_BASE_HD_AUTO : String ;
Function DIR_BASE_DOWNLOADS : String ;
Function DIR_BASE_CACHE: String ;
Function DIR_BASE_AUDIO: String ;
Function DIR_BASE_VIDEO: String ;
Function DIR_BASE_VIDEO_META: String ;
Function DIR_BASE_DEPOSITO : String ;
Function IS_HD_RICARDO : Boolean ;
Function GERAR_CHAVE_CC_PELO_SERIAL_HD ( Aux : String ) : String ;
Function IS_RICARDO : Boolean ;
Function VALIDAR_CHAVE_CC_SERIAL_HD ( Chave : String ) : Boolean ;
Function DEF_EXTENSAO_CC : String ;
Procedure INICIALIZACAO_ULTRA_BASICA ;

Function CASA_X ( _Valor : Real ; Casas : LongInt ) : String ;
Function CASA_X_DOUBLE ( _Valor : Double ; Casas : LongInt ) : String ;
Function CASA_0 ( _Valor : Real ) : String ;
Function CASA_1 ( _Valor : Real ) : String ;
Function CASA_1V ( _Valor : Real ) : String ;
Function CASA_TEMP ( _Valor : Real ; _Word : Boolean ) : String ;
Function CASA_1_TEMP ( _Valor : Real ) : String ;
Function CASA_2 ( _Valor : Real ) : String ;
Function CASA_3 ( _Valor : Real ) : String ;
Function CASA_4 ( _Valor : Real ) : String ;
Function CASA_5 ( _Valor : Real ) : String ;
Function CASA_6 ( _Valor : Real ) : String ;
Function CASA_7 ( _Valor : Real ) : String ;
Function CASA_8 ( _Valor : Real ) : String ;
Function Is_Float ( _Valor : Real ) : Boolean ;
Function Explode_Simples (str , separador : String ) : TStringList ;
Function HHMMSSMMM_2 ( Valor : Double ) : String ;
Function HHHMMSSM ( Valor : Double ) : String ;
Function HHMMSS ( Valor : Double ) : String ;
Function MMSS ( Valor : LongInt ) : String ;
Function HHMMSS_REGRESSIVA ( Valor : Double ) : String ;
Function HHHMMSSMMM_To_Double ( TC : String ) : Double ;
Function StrToFloat_RR2 ( Valor : String ; Default : Double ) : Double ;
Function COMPLETEC ( _String : String ; Casas : Word ) : String ;
Function COMPLETEL ( _String : String ; Casas : Word ) : String ;
Function COMPLETEL_CUT ( _String : String ; Casas : Word ) : String ;
Function COMPLETE_PONTOS ( _String : String ; Casas : Word ) : String ;
Function COMPLETE_PONTOS_L ( _String : String ; Casas : Word ) : String ;
Function COMPLETEP ( _String : String ; Casas : Word ) : String ;
Function COMPLETE ( _String : String ; Casas : Word ) : String ;
Function COMPLETEN ( _Valor : LongInt ; Casas : Word ) : String ;
Function COMPLETE_CUT ( _String : String ; Casas : Word ) : String ;
Function EXTRAIR_CONTEUDO ( _Cmd : String ; _Chave : String ; Var Residuo : String ) : String ;
Function IS_DATA_INVERSA ( Str : String ) : Boolean ;
Function IS_DIGIT ( Digito : Char ) : Boolean ;
Function IS_01 ( Digito : Char ) : Boolean ;
Function MIDIEncodeMessage ( Msg, Param1, Param2: byte): Integer ;
Procedure NoteOn ( NewNote, NewIntensity : Byte) ;
Procedure NoteOff ( NewNote, NewIntensity : Byte) ;
Procedure SetInstrument ( NewInstrument : Byte) ;
Procedure InitMIDI ;
Procedure GET_PROCESSOS ( Filtro : String ) ;
Function GET_PROCESSOS_STR ( Filtro : String ) : String ;
Procedure RE_ME_REMOVER_LINHAS_VAZIAS ( RE : TRichEdit ; ME : TMemo ) ;
Procedure REMOVER_LINHA_SG ( SG : TStringGrid ; Linha : LongInt ) ;
Procedure INSERIR_LINHA_SG ( SG : TStringGrid ; Nova_Posicao, Inicial : LongInt ) ;
Procedure RENUMERAR_ITENS_SG ( SG : TStringGrid ; Coluna : LongInt ) ;
Procedure LIMPAR_LINHA_SG ( SG : TStringGrid ; Linha : LongInt ) ;
Procedure DeleteNodeByText ( TV : TTreeview; sText : String ) ;
Procedure CARREGAR_EXTREMOS ( SG : TStringGrid ;
                              Linha1, Linha2, Coluna : LongInt ;
                              Var S1 : String ; Var S2 : String ;
                              Var D1 : Double ; Var D2 : Double ;
                              Var SM : String ; Var DM : Double ) ;
Function CALC_TIMECODE_MEDIO ( T1, T2 : String ; Var Media : Double ) : String ;
Function ExtractFileName_RR ( FN : String ) : String ;
Function IS_ROW_SELECTED ( SG : TStringGrid ; Row : LongInt ) : Boolean ;
Function INT_STR_TO_SEPARADOR ( Str : String ) : String ;
Function SIZE_TO_XB ( Size : Int64 ) : String ;
Procedure RunDosInMemo ( DosApp : String ; AMemo : TMemo ) ;
Function FN_MINI_EXTRAIR_EXTENSAO ( FN : String ) : String ;
Function FN_EXTRAIR_EXTENSAO ( FN : String ) : String ;
Procedure EXECUTAVEL ( Const aCommando, Parametro : String ) ;
Procedure ExecuteAndWait ( Const aCommando : String ) ;
Function GET_FN_METADADOS ( FN : String ) : String ;
Function GET_DADOS_METADADOS ( Origem, FN : String ) : String ;
Function FORMATAR_METADADOS ( FN_Full, Str : String ) : String ;
Function GET_PRIMEIRO_ARQUIVO ( FN : String ; Mascara : String ) : String ;
Function DataInversa ( DataHora : TDateTime ) : String ;
Function CODIFICAR_STRING ( _Str : String ) : String ;
Function GET_CONTEUDO_M ( Origem, FN : String ) : String ;
Function GET_BITMAP ( _Bitmap : TBitmap ; FN : String ) : Boolean ;
Function GET_PICTURE ( Origem : String ; IM : TImage ; _Picture : TPicture ; FN : String ) : Boolean ;
Function GET_PNG ( Origem : String ; _Png : TPNGImage ; FN : String ) : Boolean ;
Procedure SUBSTITUIR_SIMPLES ( Var Nome : String ; Origem , Destino : String ) ;
Procedure SUBSTITUIR ( Var Nome : String ; Origem , Destino : String ;
                       Var OCORREU_SUBSTITUICAO : Boolean ) ;
Function DT_SQL_TIMESTAMP ( DT : TDateTime ) : String ;
(*
Procedure CARREGAR_DIRETORIO ( Indice : LongInt ; Dir : String ;
                               Full : Boolean ; Mascara : String ) ;
Function CARREGAR_DIRETORIO_FULL ( Dir : String ; Mascara : String ) : String ;
Function GET_FN_ESTAVEL_ARRAY_DIRETORIO ( Indice : LongInt ; Var Idx : LongInt ; Flag : LongInt ) : String ;
Function GET_TEXTO_ARRAY_DIRETORIO ( Indice : LongInt ) : String ;
Procedure SETAR_FLAG_ARRAY_DIRETORIO ( Indice_Array, Indice, Flag : LongInt ) ;
*)
Function COMANDO_FFMPEG_EXTRAIR_AUDIO ( Dir_Base2 : String ; FN_Video : String ;
                                        Var Comando : String ; Var Parametros : String ) : String ;
Function COMANDO_FFMPEG_CONVERTER_PARA_FORMATO ( Dir_Convertido : String ;
                                                 FN_Video : String ;
                                                 Dir_MP3 : String ;
                                                 Formato : String ;
                                                 Opcoes : String ;
                                                 Var Comando : String ;
                                                 Var Parametros : String ) : String ;
Procedure BATCH_EXECUTE ( Tag : String ; Show : Boolean ; Pause : Boolean ) ;
Procedure BATCH_INICIALIZAR ;
Procedure BATCH_ADD ( Linha : String ) ;
Procedure CORTAR_VIDEO ( Dir_Base2 : String ; FN : String ; Posicao : String ) ;
Procedure CONVERTER_VIDEO_PARA_AUDIO ( FN_Video : String ; Posicao : String ) ;
Function GET_DURACAO_MEDIA ( FN : String ) : Double ;
Procedure OPEN_URL ( URL : String ) ;
Procedure INICIALIZAR_ARRAY_CC ( Indice : LongInt ) ;
//Function GET_FN_FULL_ARRAY_DIRETORIO ( Indice : LongInt ; Ponteiro : LongInt ) : String ;
//Function GET_LIST_FN_FULL_ARRAY_DIRETORIO ( Indice : LongInt ) : TStringList ;
//Procedure PUT_ARRAY_CC ( TC : Double ; Texto : String ) ;
Function ASCII_CC ( Letra : Char ) : Char ;
Function STRING_ASCII_CC ( _Str : String ) : String ;
Function String_To_Hexa(S: String): String ;
Function String_To_Hexa_Delimitador(S : RawByteString ;  Delimitador : Char ): RawByteString ;
Function String_Raw_To_Hexa_Delimitador(S, Delimitador: RawByteString ): RawByteString ;
Function Hexa_To_String(H: String): String ;
Function Bytes_To_Hexa ( _Array : Array Of Byte ) : String ;
Function Bytes_To_Hexa_Delimitador ( _Array : Array Of Byte ; Delimitador : RawByteString ) : RawByteString ;
Function CONVERTER_TEXTO_CAPTADO ( Aux : String ) : String ;
Procedure SetPNGOpacity ( Image : TImage; Alpha: Byte ) ;
Function REMOVER_STRING ( Var Str : String ; Particula : String ) : String ;
Function SUBSTITUIR_STRING ( Var Str : String ; _Inicial, _Final : String ) : String ;
Function ASCII_PADRAO ( Letra : Char ) : Char ;
Function MyMessageDlg ( Const Msg: String; DlgTypt: TmsgDlgType;
                        Button: TMsgDlgButtons;
                        Caption: Array Of String; dlgcaption: String ;
                        Var Resposta : Integer ) : Boolean ;
Procedure OPEN_FILE_EXPLORER ( FN : String ) ;
Procedure OPEN_FOLDER_EXPLORER ( FN : String ) ;
Procedure OPEN_FILE_NOTEPAD ( FN : String ) ;
Procedure PUT_CLIPBOARD ( _Form : TForm ; _Str : String ) ;
Procedure COPIAR_TEXTO ( _Form : TForm ; Texto : String ) ;
Function COLAR_TEXTO ( _Form : TForm ) : String ;
Function SEGUNDOS_TO_MMSS_CRONO ( CONTADOR : LongInt ) : String ;
Function SEGUNDOS_TO_MMSS_CRONO_RESUMIDO ( CONTADOR : LongInt ) : String ;
Procedure CARREGAR_CONFIGURACAO_FILENAME ( Form : TForm ; _FileName : String ) ;
Procedure SALVAR_CONFIGURACAO_FILENAME ( Form : TForm ; _FileName : String ;
                                         Var Conteudo : String ;
                                         Var Conteudo_Avancado : String ) ;
Function tbKeyIsDown ( Const Key : Integer ) : Boolean ;
Function IS_CTRL : Boolean ;
Function IS_ALT : Boolean ;
Function IS_SHIFT : Boolean ;
Function RR_DEBUG : String ;
Function StrToFloatRic ( _Str : String ; _Default : Double ) : Double ;
Function HexToInt ( _Hexa : String ) : Cardinal ;
Function GET_COLOR_HTML ( Cor : String ) : LongInt ;
Procedure ShowMessage_Old ( Msg : String ) ;
Procedure SALVAR_LB_LOGS ;
Function FORMATAR_COMANDO_RR_LINK ( Conteudo : String ) : String ;
Procedure PUT_STATUS1 ( Texto : String ) ;
Procedure PUT_STATUS2 ( Texto : String ) ;
Procedure PUT_LOG_EVENTO ( LB : TListBox ; Rolagem : Boolean ; Str : String ) ;
Procedure PUT_LOG ( Texto : String ) ;
Procedure PUT_STATUS ( _Msg : String ) ;
Procedure PUT_LOG_CHYRON ( Texto : String ) ;
Procedure ENVIAR_BUFFER_TCP ( Cliente : TClientSocket; RE : TRichEdit ;
                              Incondicional : Boolean ) ;
Procedure SEND_COMANDO ( Cliente : TClientSocket ; Comando : String ;
                         Incondicional : Boolean ) ;
Procedure MISC_SEND_TEXTO_TCP ( Cliente : TClientSocket ; Str : String ;
                           Incondicional : Boolean ) ;
Procedure MISC_MODO_REDE_REMOTO ( PN_Local, PN_Rede : TPanel ;
                             Cliente : TClientSocket ; Origem : String ;
                             Incondicional : Boolean ) ;
Procedure MISC_MODO_LOCAL_REMOTO ( PN_Local, PN_Rede : TPanel ;
                              Cliente : TClientSocket ; Origem : String ;
                              Incondicional : Boolean ) ;
Procedure CONEXAO_TCP ( Cliente : TClientSocket ) ;
Procedure EXECUTAR_CONEXAO_TCP ( Cliente : TClientSocket ) ;
Function IS_STRING_CODIFICADA ( _Str : String ) : Boolean ;
Function DECODIFICAR_STRING ( _Str : String ) : String ;
Function RR_TEXT_WIDTH ( Str : String ; _Font : TFont ) : LongInt ;
Function GET_COR_PARTIDO_2016 ( Tag : String ) : TColor ;
Procedure SAVE_SCREEN (FN : String ; Sender: TObject ; FullWindow : Boolean ) ;
Procedure SAVE_IMAGE_FORM ( FN : String ; _Form : TForm ) ;
Function STRING_ASCII_PADRAO ( _Str : String ) : String ;
Function STRING_ASCII_PADRAO_CRLF ( _Str : String ) : String ;
Procedure SALVAR_SELECAO_RE ( _RE : TRichEdit ) ;
Procedure RESTAURAR_SELECAO_RE ( _RE : TRichEdit ) ;
Function SG_GET_LINHA_VAZIA_COM_ADD ( Var SG : TStringGrid ; Coluna : LongInt ) : LongInt ;
Function C1C2 ( C1 , C2 : Char ) : Word ;
Function C1C2_WORD ( C1 , C2 : Char ) : Word ;
Function B1B2 ( B1 , B2 : Byte ) : Word ;
Function B1B2B3B4 ( B1 , B2, B3 , B4 : Byte ) : Cardinal ;
Function C1C2_STR ( _c1 , _c2 : Char ) : String  ;
Function C1C2_Byte ( _c1 , _c2 : Byte ) : Word ;
Function C1C2_Byte_Str ( _c1 , _c2 : Byte ) : String ;
Function C1C2C3C4 ( _c1 , _c2 , _c3 , _c4 : Char ) : Cardinal ;
Function C1C2C3C4_LongInt ( _c1 , _c2 , _c3 , _c4 : Char ) : LongInt ;
Function Bytes_To_Cardinal ( C1 , C2 , C3 , C4 : Byte ) : Cardinal ;
Function CHAR_TO_WORD ( C1 , C2 : Char ) : Word ;
Function BYTE_TO_WORD ( C1 , C2 : Byte ) : Word ;
Function BYTE_TO_LONG ( C1, C2, C3, C4 : Byte ) : Cardinal ;
Function WORD_TO_STR ( W : Word ) : String ;
Function CARDINAL_TO_STR ( C : Cardinal ) : String ;
Function CHAR_TO_SINGLE ( C1 , C2 , C3 , C4 : Char ) : Single ;
Procedure CARDINAL_TO_CHAR ( C : Cardinal ; Var C1 : Char ; Var C2 : Char ;
                             Var C3 : Char ; Var C4 : Char ) ;
Procedure CARDINAL_TO_BYTE ( C : Cardinal ; Var C1 : Byte ; Var C2 : Byte ;
                             Var C3 : Byte ; Var C4 : Byte ) ;
Procedure LONGWORD_TO_BYTE ( C : LongWord ; Var C1 : Byte ; Var C2 : Byte ;
                             Var C3 : Byte ; Var C4 : Byte ) ;
Procedure LONGWORD_TO_CHAR ( C : LongWord ; Var C1 : Char ; Var C2 : Char ;
                             Var C3 : Char ; Var C4 : Char ) ;
Function CHAR_TO_CARDINAL ( C1 , C2 , C3 , C4 : Char ) : Cardinal ;
Function CHAR_TO_CARDINAL_MSB ( C1 , C2 , C3 , C4 : Char ) : Cardinal ;
Function CHAR_TO_LONGWORD ( C1 , C2 , C3 , C4 : Char ) : LongWord ;
Function BYTE_TO_SINGLE ( C1 , C2 , C3 , C4 : Byte ) : Single ;
Function BYTE_TO_SINGLE_INVERSO ( C1 , C2 , C3 , C4 : Byte ) : Single ;
Function CHAR_TO_SINGLE_INVERSO ( C4 , C3 , C2 , C1 : Char ) : Single ;
Procedure ADICIONAR_SCROLLBAR_VERTICAL_RE ( RE : TRichEdit ) ;
Procedure ADICIONAR_SCROLLBAR_VERTICAL_ME ( ME : TMemo ) ;
Function CALC_CRC_SOMA_SIMPLES ( Str : RawByteString ) : LongInt ;
Function FORMAT_TIMESTAMP_MS ( ms : Cardinal ) : String ;
Procedure COPIAR_FORMATO_SG ( SG1, SG2 : TStringGrid ) ;
Procedure COPIAR_FORMATO_SG_HEADER ( SG1, SG2 : TStringGrid ) ;
Function BYTES_TO_FLOAT_FULL ( B1, B2, B3, B4 : Cardinal ;
                               Var Sinal : Integer ;
                               Var Expoente : Integer ;
                               Var Mantissa : Single ;
                               Var Bin : RawByteString ;
                               Var Base : Cardinal ) : Single ;
Function BYTES_TO_FLOAT ( B1, B2, B3, B4 : Byte ) : Single ;
Function MIN_DOUBLE ( A, B : Double ) : Double ;
Function MIN_SINGLE ( A, B : Single ) : Single ;
Function MAX_DOUBLE ( A, B : Double ) : Double ;
Function MAX_SINGLE ( A, B : Single ) : Single ;
Function IS_PACOTE_CAN_29_VALIDO ( Str : String ) : Boolean ;
Function EXISTE_COMPONENTE ( Form : TForm ; Nome : String ) : Boolean ;
Function GET_LARGURA_DISPONIVEL_SG ( SG : TStringGrid ) : LongInt ;
Function EXTRAIR_QUALQUER_NUMERO ( Str : String ) : LongInt ;
Function MAP ( Min_Saida, Max_Saida, Min_Valor, Max_Valor,
               Valor : Single ) : Single ;
Function FN_SUBSTITUIR_EXTENSAO ( FN, Extensao : String ) : String ;
Function GET_FN_RESUMO ( FN : String ) : String ;
Function GET_FN_BUFFER ( FN : String ) : String ;
Function GET_DPI_MONITOR : LongInt ;
Procedure REMOVE_ITEM_ARRAY_BUFFER ( Var A: A_T_ID ; Const Index: Cardinal ) ;
Procedure GERAR_PREVIEW ( FN_BMP, FN_PNG, FN_JPG, FN_TGA : String ;
                          _Left, _Top : LongInt ;
                          _Width, _Height : LongInt ) ;
Function DT_SQL_TO_DATETIME ( _DT : String ) : TDateTime ;
Function GET_MONITOR_PRINCIPAL : TMonitor ;
Function GET_MONITORES ( _Monitor : LongInt ; Var _Left : LongInt ) : String ;
Function DEFINIR_MONITOR_FORM ( _Form : TForm ; _Monitor : LongInt ) : LongInt ;
Function IF_VerdeVermelho ( Condicao : Boolean ) : TColor ;
Function LL_VALIDAS ( Latitude, Longitude : Double ) : Boolean ;
Function CopiaArquivo ( Origem, FN_Origem , FN_Destino : String ;
                        SobrePoe : Boolean ) : Boolean ;
Function CopiaListaArquivos ( Origem : String ; Lista : TStringList ;
                              Dir : String ) : LongInt ;
Function DiaDaSemana ( Data : TDateTime ) : String ;
Function DiaDaSemanaAscii ( Data : TDateTime ) : String ;
Function ARRENDONDA_DATETIME ( Valor : Double ) : Double ;
Function FORMATO_CC_MS ( ms : Cardinal ) : String ;
Function FORMATO_SMPTE ( ms : Cardinal ; Separador : Char ) : String ;
Function GET_INDICE_COMBOBOX ( CB : TComboBox ; Key : String ; Default : String ) : LongInt ;
Function INPUT_FLOAT ( Titulo, Descricao, Default : String ; Invalido : Double ) : Double ;
Function WideStringToString(const Source: UnicodeString; CodePage: UINT): RawByteString ;
Function TEMPO_DECORRIDO_MS ( Tick : Cardinal ) : Cardinal ;
Function GET_FIRST_FILE ( Dir, Mascara : String ) : String ;
Procedure ELIMINAR_LINHAS_VAZIAS_ME ( Var ME : TMemo ) ;
Procedure ELIMINAR_LINHAS_DUPLICADAS_ME ( Var ME : TMemo ) ;
Procedure ELIMINAR_LINHAS_DUPLICADAS_SL ( Var SL : TStringList ) ;
Procedure ELIMINAR_COMANDOS_INVALIDOS_ME ( Var ME : TMemo ) ;
Procedure ELIMINAR_COMANDOS_INVALIDOS_SL ( Var SL : TStringList ) ;
Function CMD_SCC_PARA_TEXTO ( Aux : String ) : String ;
Function HEADER_XML : String ;
Function TAG_XML_INT ( Tag : String ; Valor : LongInt ) : String ;
Function TAG_XML_STRING ( Tag : String ; Valor : String ) : String ;
Function TAG_XML_01 ( Tag : String ; Condicao : Boolean ) : String ;
Function NOME_USUARIO : String ;
Function COMPUTADOR_CORE : String ;
Function COMPUTADOR : String ;
Function COMPUTADOR_SERIAL : String ;
Procedure OPEN_FILE_WINDOWS_MEDIA_PLAYER ( FN : String ) ;
Procedure PLAY_WAV ( FN : String );
Procedure STOP_WAV ;
Function SUPRIMIR_ASPAS ( Aux : String ) : String ;
Function ASPAS_CHYRON ( Aux : String ) : String ;
Function ASPAS_SIMPLES ( Aux : String ) : String ;
Procedure CRIAR_BACKUP ( FN : String ) ;
Function COMP_MOD ( V1 , V2 : Comp ) : Comp ;
Function CALC_CRC ( Dados : String ) : Comp ;
Function CALC_CRC_DWORD ( Dados : String ) : DWORD ;
Function CALC_CRC_DWORD_BUFFER ( _Buffer : Array Of Byte ) : DWORD ;
Function GET_ALTURA_LINHA ( Tamanho : LongInt ) : LongInt ;
Procedure TTY ( LB : TListBox ; Msg: String ) ;
Function VALIDA_BLOCO_TCP ( Bloco : String ;
                            Var _CRC_Calculado : Comp ;
                            Var _CRC_Recebido : Comp ) : LongInt ;
Function CompToStr ( Valor : Comp ) : String ;
Function DIF_TICK ( Tick1 , Tick2 : Comp ) : Comp ;
Function GET_COMANDO ( Dados : String ) : String ;
Function GET_PARAMETROS ( Dados : String ) : String ;
Function GET_JORNAIS ( Empresa : String ) : String ;
Function HHMMSSToSegundos ( Aux : String ) : LongInt ;
Function CONVERTER_ESPELHO ( Nome : String ; RE : TRichEdit ;
                             SG3 : TStringGrid ; Dir_Tmp : String ;
                             Var CRC_Atual : Comp ;
                             Modo_Zews : Boolean ) : String ;
Procedure LIMPA_LINHA_SG ( SG : TStringGrid ; Linha : LongInt ) ;
Function MMSSToSegundos2 ( Aux : String ) : LongInt ;
Function Explode2 ( cDelimiter, sValue : String ; iCount : Integer) : TArray ;
Function SegundosToMMSS2 ( Aux : LongInt ; Casas : Byte ) : String ;
Procedure CONVERTE_USUARIOS ( Nome : String ; RE : TRichEdit ) ;
Function Filtro_NW ( Str : String ) : String ;
Function GET_COMANDO_DIRETO ( Dados : String ) : String ;
Function MSEG ( Tick : Comp ) : Comp ;
Function IF_TIMEOUT ( Ticks , Max : Comp ) : Boolean ;
//Procedure CRIA_LOG ( FileName : String ) ;
Function FILTRAR_TEXTO_PARA_TELETIPO ( Form : TForm ;
                                       _FileName : String ;
                                       Flag_Insere_Espacos : Boolean ;
                                       Qtde_Espacos : LongInt ;
                                       Modo_Zews : Boolean ) : String ;
Function SegundosToMMMSS ( Aux : LongInt ; Casas : Byte ) : String ;
Function DATA_INVERSA_NW ( DataHora : TDateTime ) : String ;
Function Ping ( Host : String ; TimeOut : LongInt ; Var Tempo : LongInt ;
                Var Bytes_RX : LongInt ; Var Erro : String ) : Boolean ;
Function GET_KEY_REGISTRY ( Grupo, Chave : String ) : String ;
Function GET_VLC_EXE : String ;
Function GET_DIR_PROGRAM_FILE : String ;
Function GET_DIR_PROGRAM_FILE_X86 : String ;
Function CONVERTER_BARRA ( Str : String ) : String ;
Function _FileSize ( FN : wideString ; Var DT : TDateTime ) : Int64 ;
Function GET_EXTENSAO_FN ( FN : String ) : String ;
Procedure QuickSort_Int (var A: Array Of Integer; iLo, iHi: Integer) ;
Procedure QuickSort_FN_CHAVE (Var A: Array Of T_FN; iLo, iHi: Integer) ;
Procedure QuickSort_FN_DT (Var A: Array Of T_FN; iLo, iHi: Integer) ;
Procedure QuickSort_TSearchRec (Var A: Array Of TSearchRec; iLo, iHi: Integer) ;
Procedure Reverse_T_FN ( Var Value: Array of T_FN ) ;
Function CURSOR_XY_FORM ( _Form : TForm ) : TPoint ;
Function GET_CB ( CB : TComboBox ) : String ;
Function GET_HHMM ( DT : TDateTime ) : String ;
Procedure SALVAR_SG ( SG : TStringGrid ; FN : String ;
                      Lin_Ini, Col_Ini : LongInt ) ;
Procedure CARREGAR_SG ( SG : TStringGrid ; FN : String ;
                        Lin_Ini, Col_Ini : LongInt ) ;
Procedure LIMPAR_SG ( SG : TStringGrid ; Lin_Ini, Col_Ini : LongInt ) ;
Function GET_SOMENTE_JOGADOR ( Str : String ) : String ;
Procedure EXTRAIR_JOGADOR_NOME_CAMISA ( Full : String ; Var Nome : String ;
                                        Var Camisa : LongInt ) ;
Function FN_MODO_CHYRON ( FN : String ) : String ;
Procedure POSICIONAR_JANELA_PELO_FORM ( _Log, _Main : TForm ) ;
//Procedure DoLoad ( Image : TImage; Const FileName: String ) ;
Function REMOVER_ZERO_INICIAL_JOGADOR ( Temp : String ) : String ;
Function LIMPAR_NOME_JOGADOR_COM_BARRA ( Str : String ) : String ;
Procedure SG_TROCAR_LINHA ( SG : TStringGrid ; Row1, Row2 : LongInt ; Col_Inicial : LongInt  ) ;
Procedure ABRIR_PASTA_EXPLORER ( Dir : String ) ;
Function REMOVE_PONTOS ( Str : String ) : String ;
Function CONVERSAO_HHMMSS_SS_TO_MS ( Aux : String ; Var Retorno : String ) : LongInt ;
Procedure SetDateTime(Year, Month, Day, Hour, Minu, Sec, MSec: Word);
Procedure SetDateTime_DT(DT: TDateTime);
Function RETIRAR_NUMERAIS_INICIAIS ( Str : String ) : String ;
Procedure REFRESH_ARQUIVO ( FN : String ) ;
Function GET_LAST_DIR ( Dir : String ) : String ;
Function TC_TO_MILISSEGUNDOS ( Str : String ; Var Res : String ) : LongInt ;
Procedure CENTRALIZAR_FORM_PN ( Formulario : TForm ; PN : TPanel) ;
Procedure CENTRALIZAR_FORM ( Formulario : TForm ) ;
Procedure CENTRALIZAR_FORM_ALTURA ( Formulario : TForm ) ;
Function SALVAR_LISTA_GERAL ( _FileName : String ) : Boolean ;
Function CARREGAR_LISTA_GERAL ( Origem, FN : String ) : Boolean ;
Procedure EXEC_Msg ( Str : String ) ;
Procedure ORDENAR_SG_WIN_NW ( SG : TStringGrid ;
                              Coluna_Chave : LongInt ;
                              _Data : Boolean ;
                              Largura , Linha_Inicial , Coluna_Inicial : LongInt ;
                              Ordem_Crescente : Boolean ;
                              _Parent : TWinControl ;
                              _Inteiro : Boolean ;
                              _Real    : Boolean ;
                              _DT : Boolean ;
                              _Coluna_Hora : LongInt ) ;
Procedure INVERTE_STRINGS ( LB : TStrings ) ;
Function FileName_Valido ( FileName : String ) : LongInt ;
Function GET_CODIGO_RANDOM : String ;
Procedure CENTRALIZAR_ACIMA ( Form : TForm ) ;
Procedure REMOVE_LINHA_SG ( SG : TStringGrid ; Linha : LongInt ) ;
Procedure INSERE_LINHA_SG ( SG : TStringGrid ; Linha : LongInt ) ;
Function RETORNA_CRC_STRING ( Aux : String ) : Comp ;
Procedure CARREGA_LB_COM_DIRETORIO_NW ( LB : TListBox ; Dir : String ;
                                        Extensao : String ; Invertido : Boolean ) ;
Function ExtractFileNameSemExt ( FN : String ) : String ;
Function INVERTE_STRINGLIST ( LB : TStringList ) : TStringList ;
Function Space ( Inteiro : LongInt ) : String ;
Procedure LIMPAR_MEMO ( MEMO : TMemo ) ;
Function LIMPAR_TEXTO ( Aux : String ) : String ;
Procedure FORMATAR_TELEFONE ( Var Telefone : String ) ;
Procedure DECOMPOR_TELEFONE_2 ( Origem : String ;
                                Var Tel_1 : String ;
                                Var Tel_2 : String ) ;
Procedure DECOMPOR_TELEFONE_3 ( Origem : String ;
                                Var Tel_1 : String ;
                                Var Tel_2 : String ;
                                Var Tel_3 : String ) ;
Procedure FORMATAR_TELEFONES ( Var c_DDD : LongInt ; Var c_tel_fixo_1 : String ;
                               Var c_tel_fixo_2 : String ; Var c_tel_fixo_3 : String ;
                               Var c_tel_cel_1 : String ; Var c_tel_cel_2 : String ;
                               Var c_tel_cel_3 : String ;
                               Var c_fax_1 : String ; Var c_fax_2 : String ) ;
Function SOMENTE_NUMERAIS ( _Aux : String ) : String ;
Function LIMPAR_LINHAS_DUPLAS ( Aux : String ) : String ;
Function IS_WINDOWS_XP : Boolean ;
Function IS_WINDOWS_VISTA : Boolean ;
Function IS_WINDOWS_7 : Boolean ;
Function IS_WINDOWS_8 : Boolean ;
Function GetVersaoWindows : String ; // TVersaoWindows ;
Function RICARDO ( ByPass : Char ) : Boolean ;
Function RICARDO_REAL : Boolean ;
Function IS_COMPUTADOR_RICARDO ( _Computador : String ) : Boolean ;
Function RICARDO_SIMPLES : Boolean ;
Function RR_StrToDate ( _Str : String ) : TDateTime ;
Function FUNC_CODIGO_CATEGORIA ( Cat : String ) : String ;
Function SegundosToMMSS_2 ( Aux : LongInt ; Casas : Byte ) : String ;
Function NOME_DO_USUARIO : String ;
Function DIR_TEMP : String ;
Function GET_CDROM_DISK : Char ;
Function GET_DISK_TYPE ( _Drive : Char ) : String ;
Function IS_DRIVE_HD ( _Letra : Char ) : Boolean ;
Function IS_DRIVE_REDE ( _Letra : Char ) : Boolean ;
Function IS_DRIVE_CDROM ( _Letra : Char ) : Boolean ;
Function IS_DRIVE_REMOVIVEL ( _Letra : Char ) : Boolean ;
Function IS_DRIVE_RAMDISK ( _Letra : Char ) : Boolean ;
Function IS_DRIVE_VALID ( _Letra : Char ) : Boolean ;
Function GET_DISK_TYPE_CODE ( _Drive : Char ) : LongInt ;
Function TickToDateTime : TDateTime ;
Function EXISTE_EM_LB ( Aux : String ; LB : TListBox ) : Boolean ;
Procedure PUT_LOG_FILE ( Dir , _Msg : String ) ;
Function IS_LOGIN_RICARDO : Boolean ;
Function NOSPACE ( Str : String ) : String ;
Procedure PUT_ERRO_DE_SISTEMA ( _Msg : String ) ;
Function ERRO_IORESULT ( Erro : Integer ; Msg : String ) : Boolean ;
Function RR_FileExists ( Origem, FN : String ) : Boolean ;
Function Dir_Windows : String ;
Function Dir_System : String ;
Function Dir_Windows_Fonts : String ;
Procedure CARREGA_CB_COM_DIRETORIO ( CB : TComboBox ; Dir : String ;
                                     Extensao : String ) ;
Procedure ADICIONA_LB_COM_ARQUIVO ( LB : TListBox ; FileName : String ) ;
Function RICARDO_NB_SIMPLES : Boolean ;
Procedure REGISTRA_LOGIN_LOGOUT ( Bool_Login : Boolean ; _Sys_Usuario : String ) ;
Function Tick_To_HHMMSSCC ( Valor : LongInt ) : String ;
Function MOVER_MENSAGEM_CP ( Dir_Origem , Dir_Destino , FileName : String ) : Boolean ;
Function QTDE_CHAR ( _Char : Char ; _Str : String ) : LongInt ;
Function IS_DATA_INVERSA_NW ( _Str : String ; Var _DT : TDateTime ) : Boolean ;
Function Repli ( Tipo : Char ; Inteiro : LongInt ) : String ;
Function CONTA_ARQUIVOS_SIMPLES ( Dir : String ; _ProcessMessages : Boolean ) : LongInt ;
Function CONTAR_ARQUIVOS ( Dir , _Mascara : String ; _ProcessMessages : Boolean ) : LongInt ;
Function Primeira_Maiuscula ( _Str : String ) : String ;
Function Super_LowerCase ( Str : String ) : String ;
Function SUPER_LOCASE ( Letra : Char ) : Char ;
Function LoCase_NW ( _Char : Char ) : Char ;
Function Data_Inversa_DT ( _DT : String ) : TDateTime ;
Procedure KEY_NOME ( Var Key : Char ) ;
Procedure KEY_NUMERO ( Var Key : Char ) ;
Procedure KEY_NOME_NUMERO ( Var Key : Char ) ;
Function DIAS_POR_MES_DT ( DT : TDateTime ) : LongInt ;
Function REMOVE_DA_STRING ( Str : String ; _Char : Char ) : String ;
Function EXISTE_EM_SG ( Aux : String ; SG : TStringGrid ; Coluna : LongInt ) : LongInt ;
Procedure MKDIR_LIST ( Lista : TStringList ) ;
Function SE ( Expressao : Boolean ; Str : String ) : String ;
Function SENAO ( Expressao : Boolean ; Str : String ) : String ;
Function FontExists ( Nome : String ) : Boolean ;
Function Impressora_Default ( Formulario : TForm ) : String ;
Function RR_Performance_CPU : LongInt ;
Procedure INVERTER_TSTRINGLIST ( Var LB : TStringList ) ;
Function CONVERTE_ESPELHO2 ( Nome : String ; RE : TRichEdit ;
                             SG : TStringGrid ; Dir_Tmp : String ;
                             Var CRC_Atual : Comp ) : String ;
Function EXTRAIR_CONTEUDO2 ( _Cmd : String ; _Chave : String ; Var Residuo : String ;
                             Delimitadores : String ) : String ;
Function SegundosToHHMMSS ( Exibe_Traco : Boolean ; Aux : LongInt ) : String ;
Function Status_Hora : String ;
Function FUNC_GET_CATEGORIA_POR_CODIGO ( Codigo : String ) : String ;
Procedure LISTAR_TIMERS ( Form1 : TForm ) ;
Function COPIAR_LINHA_SG ( _SG : TStringGrid ; _Linha : LongInt ) : Boolean ;
Function IS_DATAINVERSA ( _Str : String ) : Boolean ;
Function IS_ANO_FELIPE ( _Ano : LongInt ) : Boolean ;
Function IS_MES ( _Mes : LongInt ) : Boolean ;
Function IS_DIA ( _Dia : LongInt ) : Boolean ;
Function FORCA_DATA ( _Aux : String ; Var _Result : String ) : TDateTime ;
Procedure FREE_SAFE ( Obj : TObject ) ;
Procedure DESTROY_BASICO ;
Function TEXTO_VERTICAL ( Str, Sufixo : String ) :String ;
Procedure PREPARAR_PN_PADRAO ( Var PN : TPainel ) ;
Procedure PREPARAR_PN_PADRAO_2 ( Var PN : TPainel ) ;
Function CORRECAO_CC ( Texto : String ) : String ;
Function LIMPAR_LINHA ( Str : String ) : String ;
Function GET_FN_EXPRESSOES_SUBSTITUIDAS : String ;
Function GET_FN_EXPRESSOES_PROIBIDAS : String ;
Procedure PUT_LOG_SISTEMA ( Str : String ) ;
Procedure SALVAR_STRING ( FN, Secao : String ; Key, Valor : String ) ;
Procedure SALVAR_INTEGER ( FN, Secao : String ; Key : String ; Valor : Int64 ) ;
Procedure SALVAR_BOOLEAN ( FN, Secao : String ; Key : String ; Valor : Boolean ) ;
Function CARREGAR_STRING ( FN, Secao : String ; Key, Default : String ) : String ;
Function CARREGAR_BOOLEAN ( FN, Secao : String ; Key : String ; Default : Boolean ) : Boolean ;
Function CARREGAR_INTEGER ( FN, Secao : String ; Key : String ; Default : LongInt ) : Int64 ;
Function DateTimeToStrNZ ( DT : TDateTime ) : String ;
Function REMOVE_BARRA_DUPLA ( Str : String ) : String ;
Procedure PUT_LB_GERAL ( LB : TObject ; Msg : String ;
                         Const Rolagem : Boolean = TRUE ;
                         Const Tempo : Boolean = TRUE ;
                         Const Limite : LongInt = 1000 ) ;
Procedure ADD_EVENTO_HTTP ( Evento : LongInt ; Evento_Str, Texto : String ) ;
Function VERIFICAR_SL_HTTP : LongInt ;
Procedure SALVAR_PROPRIEDADES ( FileName, Chave, Valor : String ) ;
Function Hora ( THora : TDateTime ) : LongInt ;
Function Minuto ( Hora : TDateTime ) : LongInt ;
Function Segundo ( Hora : TDateTime ) : LongInt ;
Function  Dia ( Data : TDateTime ) : LongInt ;
Function  Mes ( Data : TDateTime ) : LongInt ;
Function  Ano ( Data : TDateTime ) : LongInt ;
//Function GET_FN_CONFIG2 : String ;
Function GET_FN_CONFIGURACAO : String ;
Procedure INICIALIZAR_REGISTRO_CHYRON ( Var Reg :  T_Registro_Chyron ) ;
Procedure PUT_LISTA_REGISTRO_CHYRON ( Var Reg : T_REgistro_Chyron ; Str :  String ) ;
Function GET_PROPRIEDADES_DE_OBJETOS ( F1, F2, F3, F4, F5, F6, F7, F8, F9, F10 : TForm ) : String ;
Procedure GET_PROPRIEDADES_DE_FORMS ( F1, F2, F3, F4, F5, F6, F7, F8, F9, F10 : TForm ) ;
Function TEXT_TO_VB ( Txt : String ) : String ;
//Function FN_DICIONARIO : String ;
Function FN_CONFIG_CHYRON : String ;
Procedure CARREGAR_CONFIG_CHYRON ;
//Procedure CARREGAR_DICIONARIO ;
Function PELO_DICIONARIO ( Aux : String ; Var HistDic : String ) : String ;
//Procedure COLAR_MM ( ME : TMemo ) ;
Function LINHA_CURSOR_MEMO ( ME : TMemo ) : LongInt ;
Function LINHA_CURSOR_RE ( RE : TRichEdit ) : LongInt ;
Function LINHA_CURSOR_RE_MY ( RE : TMyRichEdit ) : LongInt ;
Function COLUNA_CURSOR_MEMO ( ME : TMemo ) : LongInt ;
Function GET_FULL_PARENT ( Obj : TWinControl ) : String ;
Function SETAR_ITEM_CB ( Var CB : TComboBox ; Str : String ; _Add : Boolean ) : LongInt ;
//Procedure RXCLOCK_PADRAO ( Var PN : TRxClock ) ;
Procedure PN_PADRAO ( Var PN : TPanel ) ;
Procedure RE_MY_PADRAO ( Var RE : TMyRichEdit ) ;
Procedure RE_PADRAO ( Var RE : TRichEdit ) ;
Procedure BOT_PADRAO ( Var BOT : TButton ) ;
//Procedure BOT_RX_PADRAO ( Var BOT : TRxSpeedButton ) ;
Procedure EDT_PADRAO ( Var ED : TTransEdit ) ;
Procedure CK_PADRAO ( Var CK : TCheckBox ) ;
Procedure MEMO_PADRAO ( Var MEMO : TMemo ) ;
Procedure EDIT_PADRAO ( Var ED : TEdit ) ;
Procedure MASKEDIT_PADRAO ( Var ED : TMaskEdit ) ;
Procedure LABEL_PADRAO ( Var ED : TLabel ) ;
Procedure IM_PADRAO ( Var IM : TImage ) ;
Function GET_COLOR_STR ( _Str : String ) : TColor ;
Function EXTRACT_FN_INTEGER ( FN : String ; _Default : LongInt ) : LongInt ;
Function GET_PENULTIMO_DIRETORIO ( FN : String ) : String ;
Function GET_ANTEPENULTIMO_DIRETORIO ( FN : String ) : String ;
Function IMPLODE ( Delimitador : String ; Lista : TStringList ) : String ;
Function GET_INFO_PN ( PN : TPanel ) : String ;
Function GET_INFO_FORM ( Form : TForm ) : String ;
Function GET_INFO_SB ( SB : TScrollBox ) : String ;
Function GET_INFO_IM ( IM : TImage ) : String ;
Function GET_INFO_RE ( RE : TRichEdit ) : String ;
Function GET_STATUS_TASK ( Task : ITask ) : String ;
procedure setmargins(m:TMemo; L,R:integer);
procedure setmargins_RE(m:TRichEdit; L,R:integer);
procedure SetParamsX(m:TMemo);
procedure SetParams_REX(m:TRichEdit);
procedure reformatMemo(const m:TCustomMemo);
procedure SetMemoMargins(m:TCustomMemo; const L,T,R,B:integer);

procedure AdjustGridSize(grid:TDrawGrid);
procedure DeleteGridRow(Grid: TStringGrid; Const ARow:integer);
procedure InsertgridRow(Grid: TStringGrid; Const ARow:integer);
procedure Sortgrid(Grid : TStringGrid; Const SortCol:integer);

procedure sortstrDown(var s: string); {sort string characters descending}
procedure sortstrUp(var s: string);   {sort string characters ascending}
procedure rotatestrleft(var s: string); {rotate stringleft}
Function strtofloatdef(s:string; default:extended):extended;

{Load comma separated text into a stringlist}
Procedure loadcommatext(list: TStringList; filename: string);

{Free objects contained in a string list and clear the strings}
Procedure FreeAndClear(C:TListBox); overload;
Procedure FreeAndClear(C:TMemo);   overload;
Procedure FreeAndClear(C:TStringList);   overload;
Function FILTRAR_TEXTO_TP ( Texto : String ) : String ;
Function GET_CURSOR_RE ( RE : TObject ) : TPoint ;
Procedure PRINT_LOG_FORMAT_SETTINGS ;
Procedure PADRAO_BRASILEIRO ( Origem : String ) ;
Procedure PADRAO_BRASILEIRO_MINI ( Origem : String ) ;
Procedure PUT_CARREGANDO_SISTEMA ( _Msg : String ; Const _StatusBar : String = '' ) ;
Procedure RE_MODO_SILENCIOSO ( RE : TMyRichEdit ; Var Contexto : T_Contexto_RichEdit ) ;
Procedure RE_MODO_NORMAL ( RE : TMyRichEdit ; Contexto : T_Contexto_RichEdit ) ;
Procedure DEFINIR_CONTEXTO_FORMAT_FRENTE ( Var Contexto : T_Contexto_RichEdit ; Cor : TColor ) ;
Procedure DEFINIR_CONTEXTO_FORMAT_BACK ( Var Contexto : T_Contexto_RichEdit ; Cor : TColor ) ;
//Procedure RE_SELECTION_CHANGE(Sender: TObject);
Function GET_LINHA_RE ( RE : TMyRichEdit ; Linha : LongInt ) : String ;
//Procedure PLOTAR_TEMPOS_LAUDA ( Reg : T_RD_Tempos ;
//                _Total, _Locucao, _VTs, _Externas, _Entrevista : TLabel ) ;
Function G1ToDateTime ( Str : String ) : TDateTime ;
Function GET_HASH ( Aux : String ) : String ;
Function SG_CELL ( SG : TStringGrid ; Linha, Coluna : LongInt ; Conteudo : String ) : Boolean ;
Procedure ShowNewMessage ( Aux : String ) ;
Function GET_COR_FONTE_AJUSTADA ( Cor : TColor ) : TColor ;
Procedure PROC_SLEEP ( _Delay : LongInt ) ;
Function UNICODE_TO_STRING ( Str : String ) : String ;
Procedure RE_ADD ( RE : TRichEdit ; Const atext: String; acolor: TColor; astyles : TFontStyles) ;
Procedure VIEW_LOG ( Forcar : Boolean ) ;
Function GET_ARQUIVO_NAO_EXISTENTE ( Dir, FN, Extensao : String ) : String ;
Function FileIsBusy ( AFileName : String ) : Boolean ;
Function FileIsLivre ( AFileName : String ) : Boolean ;
//Procedure SUBMETER_FLAC_PARA_GOOGLE ( Flac : String ) ;
//Procedure CONVERTER_AUDIO_PARA_FLAC ( Wav : String ) ;
Function GET_RGB_DE_COR_HTML ( Cor : String ) : TColor ;
//Procedure CLOSE_ALL_TASKS ;
//procedure CLOSE_ALL_TASKS_VIDEOS ;
Function GERAR_CODIGO_CC_PARA_HD_SERIAL ( Serial : String ) : String ;
Function INVERTE_STRING ( S : String ) : String ;
Function GET_SERIAL_MASTER : Boolean ;
//Function CHECAR_INTERFACES_DE_REDE_OLD ( LB : TListBox ) : LongInt ;
//Function CHECAR_INTERFACES_DE_REDE ( PN : TPanel ; LB : TListBox ; Var Qtde : LongInt ) : TStringList ;
Function CARREGAR_DEVICES_AUDIO_IN ( PN : TPanel ; LB : TListBox ; Var Qtde : LongInt ) : TStringList ;
Function CARREGAR_DEVICES_AUDIO_OUT ( PN : TPanel ; LB : TListBox ; Var Qtde : LongInt ) : TStringList ;
Function ProcessExists ( ExeFileName : String) : Boolean ;
//Procedure ADD_APP_VERIFICADA ( ExeName : String ; Timeout : LongInt ) ;
Function GET_CODIGO_DO_CB_ACAO ( CB : TComboBox ) : LongInt ;
Function GET_FN_ACOES : String ;
Function GET_VALUE_CB ( CB : TComboBox ; Casas : LongInt ) : LongInt ;
function IsIP(const Value: string): Boolean;
function IsIP6(const Value: string): Boolean;
function IPToID(Host: string): Ansistring;
Function StrToIp ( Value : String ) : Cardinal ;
Function IpToStr ( Value : Cardinal ) : String ;
//function ExpandIP6(Value: AnsiString): AnsiString;
//function StrToIp6(Value: string): TIp6Bytes;
function Ip6ToStr(value: TIp6Bytes): string;
function ReverseIP(Value: AnsiString): AnsiString;
//function ReverseIP6(Value: AnsiString): AnsiString;
Procedure PUT_EVENTO ( LB : TListBox ; _Msg : String ) ;
Procedure COMPARAR_LISTAS ( LB : TListBox ; Prefixo : String ;
                            Lista1, Lista2 : TStringList ;
                            Var Lista_ADD : TStringList ;
                            Var Lista_DEL : TStringList ) ;
//Function STATUS_MEMORIA ( Var _Perc_Uso : LongInt ; Var _MB_Total : LongInt ) : String ;
Function NUMERO ( Aux : Int64 ; _Size : LongInt ) : String ;
Function GetUrlContent ( Const Url : String ) : String ;
Function SEND_FALA ( Mensagem : String ) : String ;
Function GlobalMemoryStatusEx ( Var lpBuffer: TMemoryStatusEx) : BOOL; Stdcall; External kernel32 ;
Function GET_VERSAO_WINDOWS_REGISTRY : String;
Function FUNC_Is64BitWindows : Boolean ;
Function CPUType : String ;
Function R_AA ( Str : String ) : String ;
Function Is_Win_Server : Boolean ;
Function OLE_ARRAY_TO_STRING ( Key : OLEVariant ) : String ;
Function KillTask ( ExeFileName : String ) : Integer ;
Function ByteToBinStr(AValue : Byte) : String ;
Function UtcToDateTime ( Const V : OleVariant ) : TDateTime ;
Function CONVERT_IDSTATUS_TO_STR ( Code : TIdStatus ) : String ;
Function CONVERT_LOGCODE_TO_STR ( Code : TFtpLogCode ) : String ;
Function CONVERT_STATUSCODE_TO_STR ( Code : TFtpStatusCode ) : String ;
Function GET_ERROR_EVENT ( Evento : TErrorEvent ) : String ;
Function DT_FTP_TO_DATETIME ( _Mes, _Dia, _Ano_Hora : String ) : TDateTime ;
{
Function xCODIFICA ( Chave : String ; Tamanho : Integer ) : String ;
Function xDECODIFICA ( Chave : String ; Tamanho : Integer ) : String ;
Function xEncryptSTR ( InString : String ) : String ;
Function xDecryptSTR ( InString : String ) : String ;
}
Procedure PREENCHER_BUFFER ;
Procedure CRIAR_PN_DRIVES ( _Form : TForm ; _Parent : TWinControl ) ;
Procedure PREPARAR_SUP ( _Form : TForm ) ;
Function PROC_COD_DECOD_ARQUIVO ( Codifica : Boolean ;
                                  Origem , Destino : String ) : Byte ;
Function GET_AUDIO_DO_VIDEO ( FN : String ; Canal : LongInt ) : String ;
Function GET_ICONE_DO_VIDEO ( FN : String ) : String ;
Function GET_XML_DO_VIDEO ( FN : String ) : String ;
Function FUNC_IF_APP_EM_EXECUCAO ( Handle : THandle ; App : String ) : Boolean ;
Function IS_P2 ( Drive : String ) : Boolean ;
Function GET_DRIVE_TYPE ( Drive : String ; _Type : LongInt ) : String ;
Procedure FECHAR_COMPONENTES ( _Form : TForm ) ;
//Procedure PROC_TRATAR_REG_TASK_CMD ;
Function PROC_TRATAR_REG_TASK_CMD : Boolean ;
//Procedure GET_CMD_PROMPT_PIPE_FILE ;
Procedure INICIALIZAR_REG_TASK_CMD ( Var Reg : T_Reg_Task_Cmd ) ;
Procedure FN_PNG_To_BMP ( FN : String ; Const ADest : TBitmap ) ;
Procedure PNG_To_BMP ( Const ASource: TStream ; Const ADest : TBitmap ) ;
Procedure Convert_PNG_BMP ( Origem : String ; xFile : String ) ;
Function ELIMINAR_LINHAS_VAZIAS_DO_TEXTO ( Conteudo : String ) : String ;
Procedure ELIMINAR_LINHAS_VAZIAS_DA_STRINGLIST ( Var SL : TStringList ) ;
Procedure ELIMINAR_SECAO_STRINGLIST ( Var SL : TStringList ; Tag : String ) ;
Function ELIMINAR_SLINEBREAK_DE_XML ( FN, Conteudo : String ) : String ;
Function GET_CONTEUDO_XML_FORMATADO ( FN : String ) : String ;
Function ATRIBUIR_TAG_STRINGLIST ( Var SL : TStringList ; Tag, Valor : String ) : Boolean ;
Function RE_GetLastVisibleLine ( RichEdit : TRichEdit ) : Integer ;
Function RE_MY_GetLastVisibleLine ( RichEdit : TMyRichEdit ) : Integer ;
Function RE_GetFirstVisibleLine ( RichEdit : TRichEdit ) : Integer ;
Function ME_GetFirstVisibleLine ( ME : TMemo ) : Integer ;
Function RE_MY_GetFirstVisibleLine ( RichEdit : TMyRichEdit ) : Integer ;
Procedure AJUSTAR_FORM_POS_CURSOR_MAIN ( Ponto : TPoint ; _Form : TForm ) ;
Function SELECT_LB_PONTO_E_VIRGULA ( LB : TListBox ) : String ;
Procedure ALTERNAR_LOG ;
Procedure SHOW_LOG ;
Function GET_FN_CONFIG_PADRAO : String ;
Function GET_FN_DATETIME  ( FN : String ) : TDateTime ;
Function GET_LINHA_MEMO ( ME : TMemo ; Linha : LongInt ) : String ;
Procedure REMOVER_LINHAS_DUPLAS ( RE : TRichEdit ) ;
Procedure INSERIR_LINHAS_ANTES_DE_TAGS ( RE : TRichEdit ) ;
Function GET_FN_FRAMES_GERADOS : String ;
Function GET_FN_FFMPEG_EXE : String ;
Function GET_FN_FFPROBE_EXE : String ;
Function GET_FN_HISTORICO_FRAMES : String ;
Function GET_FN_HISTORICO_VIDEO : String ;
Function ExecAndWait_Retorno ( Cmd : String ; _Put_Log : Boolean ) : String ;
//Procedure PROC_GetDosOutput ;
(*
Procedure GetDosOutput ( Var Reg : T_GetDosOutput ;
                         FN : String ;
                         _Tipo : LongInt ; _Cmd, _Dir: String ;
                         _LB_Progresso : TLabel ;
                         _LB_Total_Frames : TLabel ;
                         _LB_Progresso_Frames : TLabel ;
                         _LB_Time : TLabel ;
                         _ME : TMemo ; _LB, _LB_Status : TListBox ;
                         _SB : TStatusBar ) ;
*)
Procedure LIMPAR_CONTAGEM_CARACTERES ( Var Reg : R_Contagem_Caracteres ) ;
Procedure CONTAR_CARACTERES_REG ( Aux : String ; Var Reg : R_Contagem_Caracteres ) ;
Function GET_LICENSE_FFVLC_PLAYER : String ;
Function SUBTRAIR_TIMECODES_HHMMSSsss ( TC1, TC2 : String ) : String ;
Procedure ATUALIZAR_LB_STATUS_CONVERSAO_FF ( Origem : String ;
                                             Reg : T_GetDosOutput ; _PUT_LOG : Boolean ) ;
Procedure LIMPAR_REG_GetDosOutput ( Var Reg : T_GetDosOutput ) ;
Function IS_DATAHORA_INVERSA ( Str : String ) : Boolean ;
Procedure CONECTAR_DRIVE_LOG ( Drive, Host, User, Pass : String ) ;
Procedure PUT_LOG_REMOTO ( Log : String ) ;
Function IS_ARQUIVO_DAV ( FN : String ) : Boolean ;
Function GET_INFO_DAV ( FN : String ) : LongInt  ;
Function MD5 ( Const Texto : String) : String ;
Function GET_OBJECT_NAME ( Obj : TObject ) : String ;
Function ATIVAR_HINT_COMPONENTES ( Origem : String ; _Form : TForm ;
                                   Ativar, SALVAR : Boolean ) : String ;
Function GET_STR_CLASS ( Classe : TObject ) : String ;
Function IS_MSG_SELO ( _Msg : LongInt ; _Tag : String ) : Boolean ;
Function LOAD_IMAGE ( Origem : String ; Incluir_Name : Boolean ;
                      Dir1, Dir2, Dir3 : String ; IM : TImage ; FN : String ) : Boolean ;
Procedure MISC_PREVIEW_SELO ( _Form : TForm ; PN_Res : TPanel ; LB_Res : TLabel ;
                              IM_Preview, IM : TImage ; FN : String ) ;
Function IS_MSG_SEGUNDA_LINHA_MAIUSCULA ( _Msg : LongInt ; _Tag : String ) : Boolean ;
Function IS_MSG_SEGUNDA_LINHA_PRIMEIRA_MAIUSCULA ( _Msg : LongInt ; _Tag : String ) : Boolean ;
Function IS_MSG_SEGUNDA_LINHA_MINUSCULA ( _Msg : LongInt ; _Tag : String ) : Boolean ;
Function CARREGAR_CONTROLE ( Controle : TObject ) : Boolean ;
Function GET_FN_IMAGEM_X : String ;
Function SELECT_FIND_FN ( Dir1, Dir2, FN : String ) : String ;
Function TEXT_WIDTH ( _Form : TForm  ; Texto : String ; _Font : TFont ) : LongInt ;
Procedure AJUSTAR_ALTURA_PANEL ( _Form : TForm ; PN : TPanel ) ;
Function IS_DOMINGO ( DT : TDateTime ) : Boolean ;
Function IS_SEGUNDA ( DT : TDateTime ) : Boolean ;
Function IS_TERCA ( DT : TDateTime ) : Boolean ;
Function IS_QUARTA ( DT : TDateTime ) : Boolean ;
Function IS_QUINTA ( DT : TDateTime ) : Boolean ;
Function IS_SEXTA ( DT : TDateTime ) : Boolean ;
Function IS_SABADO ( DT : TDateTime ) : Boolean ;
Function GET_GN_CNT_CARREGANDO_SISTEMA : String ;
Function SUBSTITUICAO_BASICA_GC ( Texto, Retranca : String ) : String ;
Function GetModuleVersion ( Instance : THandle ; out iMajor, iMinor,  iRelease,  iBuild : Integer )  : Boolean ;
Function GetBuildInfo ( var V1, V2, V3, V4: Word ) : String ;
Function GetBuildInfoStr : String ;
Function IDENTIFICACAO_OK ( Usuario, Senha : String ) : Boolean ;
Procedure ELIMINAR_LINHAS_VAZIAS_MEMO ( Var ME : TMemo ) ;
Procedure ELIMINAR_LINHAS_VAZIAS_SL ( Var SL : TStringList ) ;
Function REMOVER_LINHAS_COM_COMENTARIOS ( Texto : String ) : String ;
Function REMOVER_BLOCOS_TEXTOS_AVULSOS ( Texto : String ) : String ;
Function REMOVER_LINHAS_DUPLAS_TEXTO ( Texto : String ) : String ;
Function REMOVER_LINHAS_VAZIAS_E_PERDIDAS ( Texto : String ) : String ;
Function CONVERSAO_SIMPLES ( Texto : String ) : String ;
Procedure DEF_SG_TOPROW ( Origem : String ; SG : TStringGrid ; Linha : LongInt ) ;
Procedure DEF_SG_ROW ( Origem : String ; SG : TStringGrid ; Linha : LongInt ) ;
Procedure DEF_SG_COL ( Origem : String ; SG : TStringGrid ; Coluna : LongInt ) ;
Procedure LIMPAR_REGISTRO_TX_CHYRON ( Var Reg : T_Registro_TX_Chyron ) ;
Procedure ABRIR_PORTA_SERIAL ( Porta : TApdComPort ; _Porta, _BaudRate : LongInt ) ;
Function TRIM_LINHAS ( Str : String ) : String ;
Function REMOVER_LINHAS_DUPLAS_STR ( Str : String ) : String ;
Procedure SALVAR_PANEL_BMP ( FN : String ; PN : TPanel ) ;
Procedure AJUSTAR_LARGURA_IM ( IM : TImage ) ;
Procedure PUSH_TICK ( _Origem : String ) ;
Procedure POP_TICK ( _Origem : String ) ;
Procedure PROC_COMBINAR_IMAGENS ( IM1, IM2, IM3 : TImage ; SB : TStatusBar ) ;
Procedure SALVAR_PNG32 ( FN : String  ; IM : TImage ) ;
Function ALGUMA_MAISCULA ( Str : String ) : Boolean ;
Function RR_FindFirst ( Origem, Dir : String ; Attr : Integer ; Var RecDos : TSearchRec ) : LongInt ;
Function RR_FILE_AGE ( Origem, FN : String ; Var DT : TDateTime ) : String ;
Function TEMPO_OCIOSIDADE : Cardinal ;
Procedure REFRESH_TIMEOUT ;
Function RR_DeleteFile ( Origem, FN : String ) : Boolean ;
Function IS_ARQUIVO_PNG ( FN : String ) : Boolean ;
Procedure COLAR_FORMS ( Form1, Form2 : TForm ) ;
Procedure MISC_LIMPAR_DIR_CONVERSAO ( Dir : String ) ;
(*
Procedure MISC_EXTRAIR_FRAMES ( FN : String ; FPS : Double ;
                           Frames : LongInt ;
                           Desentrelacar, Ajustar_FHD : Boolean ;
                           Extensao, Cue_In, Filtro : String ;
                           Var Cmd : String ) ;
*)
//Procedure MISC_GET_INFO_VIDEO ( FN : String ) ;
Function CHECAR_FFMPEG_EXE : Boolean ;
Procedure PREPARAR_CENARIO_DIRETORIOS ( Indice : LongInt ; Dir : String ; SubPastas : Boolean ) ;
Procedure LOG_ON_OFF ;
Function GERAR_CONTEUDO_HTML_EDITOR ( Conteudo : String ) : String ;
Procedure CARREGAR_ARQUIVOS_CEF ;
Procedure CARREGAR_ARQUIVOS_LIBAV ;
Procedure SHOW_OPERACAO_NAO_PERMITIDA ( Str : String ) ;
Function STRINGS_PARECIDAS ( Str1, Str2 : String ; Metodo : LongInt ;
                             Var Distancia : Single ;
                             Var Percentual : Single ;
                             Var Qtde1 : LongInt ;
                             Var Qtde2 : LongInt ) : Boolean ;
Function EditDistance ( s, t : String ) : LongInt ;
Function PERCENTUAL_PALAVRAS_EM_COMUM ( Str1, Str2 : String ;
                                        Var Qtde1 : LongInt ;
                                        Var Qtde2 : LongInt ) : Single ;
Procedure ORDENAR_INT ( Var I1 : LongInt ; Var I2 : LongInt ) ;
Function GET_URL_EXPLORER_1 : String ;
Function TESTE_CHROME_1 : String ;
Procedure TRANSFERIR_CONTEUDO_MEMO ( Sender, Source : TMemo ) ;
Function SALVAR_LOG_FULL ( Origem : String ) : String ;
Procedure INIBIR_RELOAD_FN ( FN : String ; ms : Cardinal ) ;
Function CHECAR_RELOAD_OK ( FN : String ) : Boolean ;
Function FN_CHYRON ( FN : String ) : String ;
Function GetTituloAtivo ( Var H : THandle ) : String ;
Function GET_DESCONSIDERE_MONITOR_ARQUIVO ( FN : String ) : Boolean ;
Procedure ADD_DESCONSIDERE_MONITOR_ARQUIVO ( FN : String ; Tempo_ms : LongInt ) ;
Function EXTRAIR_URL_PRINCIPAL_OU_IP ( Url : String ) : String ;
Procedure LIMPAR_CAMERAS_E_POSICOES ;
Function GET_CAMERAS_CARREGADAS : String ;
//Function GET_INFO_CAMERA_E_POSICAO ( Shell : T_Registro_ShellWindow ; Var Reg : T_Camera_Posicoes ) : Boolean ;
Procedure CARREGAR_CAMERAS_E_POSICOES ( FN : String ) ;
Function OleVariantToString ( const Value : OleVariant ) : String ;
Function OleVariantIsNull ( _Var : OleVariant ) : Boolean ;
Function REMOVER_COMENTARIOS ( Str : String ) : String ;
Function ActiveControl_Name ( _Form : TForm ) : String ;
//Procedure PUT_CACHE_GRAVACAO ( Origem : String ; _Tempo : LongInt ; _FN : String ; _Conteudo : String ) ;
//Procedure VERIFICAR_CACHE_GRAVACAO ;
Procedure CHANGE_MEMO_SE_DIFF ( ME : TMemo ; Aux : String ) ;
Procedure CHANGE_SL_SE_DIFF ( SL : TStringList ; Aux : String ) ;
Procedure GRAY_TO_RGB ( FN, Dir_Destino : String ; Cor : TColor ; Fator : Single ) ;
Procedure ATUALIZAR_PNG_COLOR ( FN : String ;
                                Dir_Destino : String ;
                                Cor1_Origem, Cor1_Destino : TColor ;
                                Cor2_Origem, Cor2_Destino : TColor ;
                                Cor3_Origem, Cor3_Destino : TColor ) ;
Function HEX_CONDICIONAL ( Str : String ) : String ;
Function STR_TO_CC_LINK ( Str : String ) : String ;
Procedure ATUALIZAR_PROGRESSO_DA_CONVERSAO ( Var Reg : T_GetDosOutput ) ;
//Function GET_FTP_STATE_TO_STR ( State : TFtpState ) : String ;
Procedure PUT_LB ( LB : TListBox ; Str : String ) ;
Function GET_FN_NEXT_TAREFA_CONVERSAO_XDCAM : String ;
Function GET_FN_NEXT_TAREFA_UPLOAD_FTP : String ;
Procedure CARREGAR_DIRETORIOS_INGEST_P2 ;
Procedure AJUSTAR_FLAGS_DE_EXIBICAO ( _Cmd : LongInt ; _Macro : String ) ;
Function DirectoryUsable ( const Directory : String ; FollowLink : Boolean = TRUE ) : Boolean ;
Function FileUsable ( const _File : String ) : Boolean ;

Var
    Supervisor_Pasta       : Array Of TSupervisor_Pasta ;

Implementation

Uses
{$IFDEF NW}
Espelho_RD_U,
Chamada_U,
{$ENDIF}
Main ;

Function GET_FN_LICENCA : String  ;
Begin
Result := Diretorio + 'Config\licenca.dat' ;
End ;

Procedure INICIALIZAR_ARRAY_CC ( Indice : LongInt ) ;
Begin
//SetLength ( Array_CC, 0 ) ;
End ;

(*
Procedure PUT_ARRAY_CC ( TC : Double ; Texto : String ) ;
Var Tamanho : LongInt ;
Begin
Tamanho := Length ( Array_CC ) ;
Inc ( Tamanho ) ;
SetLength ( Array_CC, Tamanho ) ;
Array_CC[Tamanho-1].TC := TC ;
Array_CC[Tamanho-1].Texto := Texto ;
End ;
*)

(*
Procedure INICIALIZAR_ARRAY_DIRETORIO ( Indice : LongInt ) ;
Var Local : LongInt ;
Begin
Try
   If Indice = -1 Then Begin
      For Local := 1 To MAX_ARRAY_DIRETORIO Do Begin
         SetLength ( Array_Diretorio[Local], 0 ) ;
      End ;
   End Else Begin
      SetLength ( Array_Diretorio[Indice], 0 ) ;
   End ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception INICIALIZAR_ARRAY_DIRETORIO [' + IntToStr ( Indice ) + ']' + LFLF +
                E.Message ) ;
   End ;
End;
End ;
*)

(*
Function GET_LIST_FN_FULL_ARRAY_DIRETORIO ( Indice : LongInt ) : TStringList ;
Var Qtde  : LongInt ;
    Local : LongINt ;
Begin
Qtde := Length ( Array_Diretorio[Indice] ) ;
Result := TStringList.Create ;
Result.Clear ;
If Qtde = 0 Then Begin
   Exit ;
End ;
For Local := 0 To Qtde - 1 Do Begin
   Result.Add ( Array_Diretorio[Indice][Local].FN_Full ) ;
End ;
End ;
*)
  
(*
Function GET_FN_FULL_ARRAY_DIRETORIO ( Indice : LongInt ; Ponteiro : LongInt ) : String ;
Var Qtde : LongInt ;
Begin
Qtde := Length ( Array_Diretorio[Indice] ) ;
Result := '' ;
If Qtde = 0 Then Begin
   Exit ;
End ;
If Ponteiro >= Qtde Then Begin
   Exit ;
End ;
Result := Array_Diretorio[Indice][Ponteiro].FN_Full ;
End ;
*)

(*
Function FN_CURTO_IN_ARRAY_DIRETORIO ( Indice : LongInt ; FN : String ) : LongInt ;
Var Local : LongInt ;
    Qtde  : LongInt ;
Begin
Try
   Result := -1 ;
   Qtde := Length ( Array_Diretorio[Indice] ) ;
   If Qtde = 0 Then Begin
      Exit ;
   End ;
   For Local := 0 To Qtde - 1 Do Begin
      If Array_Diretorio[Indice][Local].FN_Curto = FN Then Begin
         Result := Local ;
         Exit ;
      End ;
   End ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception FN_CURTO_IN_ARRAY_DIRETORIO [' + IntToStr ( Indice ) + ']' + LFLF +
                E.Message ) ;
   End ;
End ;
Result := -2 ;
End ;
*)

(*
Procedure SETAR_FLAG_ARRAY_DIRETORIO ( Indice_Array, Indice, Flag : LongInt ) ;
Begin
Array_Diretorio[Indice_Array][Indice].Flag := Flag ;
End ;
*)

(*
Procedure INSERT_REPLACE_DIRETORIO ( Indice_Array : LongInt ;
                                     Dir, Name : String ; Size : Int64 ;
                                     DT : TDateTime ; isDir : Boolean ) ;
Var Indice : LongInt ;
Begin
Try
   Indice := FN_CURTO_IN_ARRAY_DIRETORIO ( Indice_Array, Name ) ;
   If Indice >= 0 Then Begin
      If Array_Diretorio[Indice_Array][Indice].Size = Size Then Begin
         Array_Diretorio[Indice_Array][Indice].Cnt_Igual := Array_Diretorio[Indice_Array][Indice].Cnt_Igual + 1
      End Else Begin
         Array_Diretorio[Indice_Array][Indice].Cnt_Igual := 1 ;
      End ;
   End Else Begin
      SetLength ( Array_Diretorio[Indice_Array], Length(Array_Diretorio[Indice_Array]) + 1 ) ;
      Array_Diretorio[Indice_Array][Length(Array_Diretorio[Indice_Array])-1].FileName  := Name ;
      Array_Diretorio[Indice_Array][Length(Array_Diretorio[Indice_Array])-1].FN_Curto  := Name ;
      Array_Diretorio[Indice_Array][Length(Array_Diretorio[Indice_Array])-1].FN_Full   := Dir + Name ;
      Array_Diretorio[Indice_Array][Length(Array_Diretorio[Indice_Array])-1].Size      := Size ;
      Array_Diretorio[Indice_Array][Length(Array_Diretorio[Indice_Array])-1].Data      := DT ;
      Array_Diretorio[Indice_Array][Length(Array_Diretorio[Indice_Array])-1].isDir     := isDir ;
      Array_Diretorio[Indice_Array][Length(Array_Diretorio[Indice_Array])-1].Cnt_Igual := 1 ;
      Array_Diretorio[Indice_Array][Length(Array_Diretorio[Indice_Array])-1].Flag      := 0 ;
   End ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception INSERT_REPLACE_DIRETORIO [' + IntToStr ( Indice_Array ) + ']' + LFLF +
                E.Message ) ;
   End ;
End ;
End ;
*)

Function CARREGAR_DIRETORIO_FULL ( Dir : String ; Mascara : String ) : String ;
Var RecDos    : TSearchRec ;
    Resultado : LongInt ;
Begin
Dir := INSERE_BARRA ( Dir ) ;
Result := '' ;
Try
   Resultado := RR_FindFirst ( 'CARREGAR_DIRETORIO_FULL', Dir + Mascara, 255, RecDos ) ;
   While Resultado = 0 Do Begin
      If ( RecDos.Attr AND faDirectory ) = 0 Then Begin
         Result := Result + Dir + RecDos.Name + #13#10 ;
      End ;
      Resultado := SysUtils.FindNext ( RecDos ) ;
   End ;
   SysUtils.FindClose ( RecDos ) ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception CARREGAR_DIRETORIO_FULL [' + Dir + ']' + LFLF +
                E.Message ) ;
   End ;
End ;
End ;

(*
Procedure CARREGAR_DIRETORIO ( Indice : LongInt ; Dir : String ;
                               Full : Boolean ; Mascara : String ) ;
Var RecDos    : TSearchRec ;
    Resultado : LongInt ;
Begin
If Full Then Begin
   INICIALIZAR_ARRAY_DIRETORIO ( Indice ) ;
End ;
Try
   Dir := INSERE_BARRA ( Dir ) ;
   Resultado := RR_FindFirst ( 'CARREGAR_DIRETORIO', Dir + Mascara, 255, RecDos ) ;
   While Resultado = 0 Do Begin
      If ( RecDos.Attr AND faDirectory ) = 0 Then Begin
         INSERT_REPLACE_DIRETORIO ( Indice, Dir, RecDos.Name, RecDos.Size, RecDos.TimeStamp, FALSE ) ;
      End ;
      Resultado := SysUtils.FindNext ( RecDos ) ;
   End ;
   SysUtils.FindClose ( RecDos ) ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception CARREGAR_DIRETORIO [' + IntToStr ( Indice ) + ']' + LFLF +
                E.Message ) ;
   End ;
End ;
End ;
*)

(*
Function GET_FN_ESTAVEL_ARRAY_DIRETORIO ( Indice : LongInt ; Var Idx : LongInt ; Flag : LongInt ) : String ;
Var Local  ,
    Qtde   : LongInt ;
Begin
Idx := -1 ;
Try
   Result := '' ;
   Qtde := Length(Array_Diretorio[Indice]) ;
   If Qtde = 0 Then Begin
      Exit ;
   End ;
   For Local := 0 To Qtde - 1 Do Begin
      If ( Array_Diretorio[Indice][Local].Cnt_Igual >= 2 ) AND
         ( ( Flag = -1 ) OR ( Array_Diretorio[Indice][Local].Flag = Flag ) ) Then Begin
         Idx := Local ;
         Result := Array_Diretorio[Indice][Local].FN_Full ;
         Exit ;
      End ;
   End ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception GET_FN_ESTAVEL_ARRAY_DIRETORIO [' + IntToStr ( Indice ) + ']' + LFLF +
                E.Message ) ;
   End ;
End ;
End ;
*)

(*
Function GET_TEXTO_ARRAY_DIRETORIO ( Indice : LongInt ) : String ;
Var Local  ,
    Qtde   : LongInt ;
Begin
Try
   Result := '' ;
   Qtde := Length(Array_Diretorio[Indice]) ;
   If Qtde = 0 Then Begin
      Exit ;
   End ;
   For Local := 0 To Qtde - 1 Do Begin
      Result := Result +
                COMPLETE ( Array_Diretorio[Indice][Local].FN_Curto , 50 ) + ' ' +
                DateTimeToStr ( Array_Diretorio[Indice][Local].Data ) + ' ' +
                COMPLETEL ( IntToStr(Array_Diretorio[Indice][Local].Size), 15 ) + ' ' +
                StrZero ( Array_Diretorio[Indice][Local].Cnt_Igual , 8 ) +
                CRLF ;
   End ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception GET_TEXTO_ARRAY_DIRETORIO [' + IntToStr ( Indice ) + ']' + LFLF +
                E.Message ) ;
   End ;
End ;
End ;
*)

Function DISTANCIA_MT ( Lat1, Long1, Lat2, Long2 : Double ) : LongInt ;
Begin
Result := TRUNC ( SQRT ( (Lat1-Lat2)*(Lat1-Lat2) + (Long1-Long2)*(Long1-Long2) ) * 111319 ) ;
End ;

Function DISTANCIA_MT_COS ( Lat1, Long1, Lat2, Long2 : Double ) : Double ;
Var Angulo_Rad : Double ;
    DLat       : Double ;
Begin
Angulo_Rad := DegToRad ( ( Lat1 + Lat2 ) / 2 ) ;
DLat := (Lat1-Lat2) * cos ( Angulo_Rad ) ;
Result := SQRT ( DLat*DLat + (Long1-Long2)*(Long1-Long2) ) * 111319 ;
End ;

Function PointInPolygon ( Point: TPoint; Const Polygon: Array of TPoint ) : Boolean ;
Var rgn: HRGN ;
Begin
rgn := CreatePolygonRgn(Polygon[0], Length(Polygon), WINDING) ;
Result := PtInRegion(rgn, Point.X, Point.Y) ;
DeleteObject(rgn) ;
End ;

Const
 EPS    = 0.000001 ;        // smallest positive value: less than that to be considered zero
 EPSEPS = EPS * EPS ;       // and its square

Function SqLineMagnitude(x1, y1, x2, y2 : Double ) : Double ;
Begin
Result := (x2 - x1) * (x2 - x1) + (y2 - y1) * (y2 - y1) ;
End ;

Function Distancia_Dois_Pontos ( x1, y1, x2, y2 : Double): Double ;
Begin
Result := SQRT ( SQR ( x1 - x2 ) + SQR ( y1 - y2 ) ) ;
End ;

Function Distancia_Dois_Pontos_M ( x1, y1, x2, y2 : Double): Double ;
Begin
Result := SQRT ( SQR ( x1 - x2 ) + SQR ( y1 - y2 ) ) * 111319 ;
End ;

Function DistancePointLine ( px, py, x1, y1, x2, y2 : Double): Double ;
{
px, py is the point to test.
x1, y1, x2, y2 is the line to check distance.

Returns distance from the line, or if the intersecting point on the line nearest
the point tested is outside the endpoints of the line, the distance to the
nearest endpoint.

On zero-valued denominator conditions (this seems to be when the Line is
infinitely short, e.g. the Line is a dot), returns the distance between
the two points (e.g. a^2 + b^2 = c^2).
}
Var SqLineMag : Double ;
    u         : Double ;
    ix        : Double ;
    iy        : Double ;
Begin
SqLineMag := SqLineMagnitude (x1, y1, x2, y2) ;
If SqLineMag < EPS Then Begin
   Result := - SQRT ( SQR(px - x1) + SQR(py - y1) ) ;
   Exit ;
End ;
u := ( (px - x1)*(x2 - x1) + (py - y1)*(y2 - y1) ) / SqLineMag ;
If (u < EPS) or (u > 1) Then Begin
   ix := SqLineMagnitude (px, py, x1, y1) ;
   iy := SqLineMagnitude (px, py, x2, y2) ;
   Result := MIN (ix, iy) ;
End Else Begin
   ix := x1 + u * (x2 - x1) ;
   iy := y1 + u * (y2 - y1) ;
   Result := SqlineMagnitude (px, py, ix, iy) ;
End ;
//Result := SQRT ( Result ) * 111319 ;
Result := SQRT ( Result ) ;
End ;

Function KML_POLIGONO_INI ( Lat1, Long1, Lat2, Long2 : Double ;
                            Coordenadas, Comentario : String ;
                            Indice : LongInt ; Estilo : String ;
                            Var PlaceMark : String ) : String ;
Begin
PlaceMark :=
'<Placemark>' + LF +
'<name>Indice ' + IntToStr(Indice) + '</name>' + LF +
'<styleUrl>#' + Estilo + '</styleUrl>' + LF +
//'<styleUrl>#m_ylw-pushpin</styleUrl>' + LF +
'<Polygon>' + LF +
'<tessellate>1</tessellate>' + LF +
'<outerBoundaryIs>' + LF +
'<LinearRing>' + LF +
'<coordinates>' + LF +
Coordenadas + LF +
'</coordinates>' + LF +
'</LinearRing>' + LF +
'</outerBoundaryIs>' + LF +
'</Polygon>' + LF +
'</Placemark>' + LF +
'' +
'<Placemark>' + LF +
'<name>Ponto-1</name>' + LF +
'<visibility>0</visibility>' + LF +
'<Point>' + LF +
'<extrude>1</extrude>' + LF +
'<altitudeMode>relativeToGround</altitudeMode>' + LF +
'<gx:drawOrder>1</gx:drawOrder>' + LF +
'<coordinates>' + LF +
//'      -38.55081849649349,-3.77220840539432,17' + LF +
CASA6_PONTO(Long1) + ',' + CASA6_PONTO(Lat1) + ',' + ',17 ' + LF +
'</coordinates>' + LF +
'</Point>' + LF +
'</Placemark>' + LF +
'' +
'<Placemark>' + LF +
'<name>Ponto-2</name>' + LF +
'<visibility>0</visibility>' + LF +
'<Point>' + LF +
'<extrude>1</extrude>' + LF +
'<altitudeMode>relativeToGround</altitudeMode>' + LF +
'<gx:drawOrder>1</gx:drawOrder>' + LF +
'<coordinates>' + LF +
//'      -38.55081849649349,-3.77220840539432,17' + LF +
CASA6_PONTO(Long2) + ',' + CASA6_PONTO(Lat2) + ',' + ',17 ' + LF +
'</coordinates>' + LF +
'</Point>' + LF +
'</Placemark>' + LF ;

Result := '<?xml version="1.0" encoding="UTF-8"?>' + LF +
'<kml xmlns="http://www.opengis.net/kml/2.2" xmlns:gx="http://www.google.com/kml/ext/2.2" xmlns:kml="http://www.opengis.net/kml/2.2" xmlns:atom="http://www.w3.org/2005/Atom">' + LF +
'<' + '!--' + LF +
Comentario +
'-->' + LF +
'<Document>' + LF +
'	<name>Poligono sem titulo.kml</name>' + LF +
'<Style id="azul">' + LF +
'<LineStyle>' + LF +
'<width>1.5</width>' + LF +
'</LineStyle>' + LF +
'<PolyStyle>' + LF +
'<color>ffff0000</color>' + LF +
'</PolyStyle>' + LF +
'</Style>' + LF +
'' + LF +
'<Style id="verde">' + LF +
'<LineStyle>' + LF +
'<width>1.5</width>' + LF +
'</LineStyle>' + LF +
'<PolyStyle>' + LF +
'<color>ff00FF00</color>' + LF +
'</PolyStyle>' + LF +
'</Style>' + LF +
'' + LF +
'<Style id="vermelho">' + LF +
'<LineStyle>' + LF +
'<width>1.5</width>' + LF +
'</LineStyle>' + LF +
'<PolyStyle>' + LF +
'<color>ff0000FF</color>' + LF +
'</PolyStyle>' + LF +
'</Style>' + LF +
{
'	<StyleMap id="m_ylw-pushpin">' + LF +
'		<Pair>' + LF +
'			<key>normal</key>' + LF +
'			<styleUrl>#s_ylw-pushpin</styleUrl>' + LF +
'		</Pair>' + LF +
'		<Pair>' + LF +
'			<key>highlight</key>' + LF +
'			<styleUrl>#s_ylw-pushpin_hl</styleUrl>' + LF +
'		</Pair>' + LF +
'	</StyleMap>' + LF +
'	<Style id="s_ylw-pushpin_hl">' + LF +
'		<IconStyle>' + LF +
'			<scale>1.3</scale>' + LF +
'			<Icon>' + LF +
'				<href>http://maps.google.com/mapfiles/kml/pushpin/ylw-pushpin.png</href>' + LF +
'			</Icon>' + LF +
'			<hotSpot x="20" y="2" xunits="pixels" yunits="pixels"/>' + LF +
'		</IconStyle>' + LF +
'	</Style>' + LF +
'	<Style id="s_ylw-pushpin">' + LF +
'		<IconStyle>' + LF +
'			<scale>1.1</scale>' + LF +
'			<Icon>' + LF +
'				<href>http://maps.google.com/mapfiles/kml/pushpin/ylw-pushpin.png</href>' + LF +
'			</Icon>' + LF +
'			<hotSpot x="20" y="2" xunits="pixels" yunits="pixels"/>' + LF +
'		</IconStyle>' + LF +
'	</Style>' + LF +
}
Placemark +
'' + LF +
'</Document>' + LF +
'</kml>' + LF ;
End ;


Function DISTANCIA_MT_COS_ANGULO ( Lat1, Long1, Lat2, Long2 : Double ;
                                   Indice : LongInt ;
                                   Var Angulo : Double ; Var Regiao : String ;
                                   Var Poligono : String ; Estilo : String ;
                                   Var PlaceMark : String ) : Double ;
Var Angulo_Rad : Double ;
    DLat       : Double ;
    DLong      : Double ;
    DX         ,
    DY         : Double ;
    OffSet     : Double ;
    Comentario : String ;
    Lat_Temp   ,
    Long_Temp  : Double ;
Begin
If Long1 > Long2 Then Begin
   //PUT_LOG ( 'Inversao de pontos/Antes, ' +
   //          'P1:' + CASA6_PONTO(Lat1) + '/' + CASA6_PONTO(Long1) + ' ' +
   //          'P2:' + CASA6_PONTO(Lat2) + '/' + CASA6_PONTO(Long2) ) ;
   Lat_Temp := Lat1 ;
   Long_Temp := Long1 ;
   Lat1 := Lat2 ;
   Long1 := Long2 ;
   Lat2 := Lat_Temp ;
   Long2 := Long_Temp ;
   //PUT_LOG ( 'Inversao de pontos/Depois, ' +
   //          'P1:' + CASA6_PONTO(Lat1) + '/' + CASA6_PONTO(Long1) + ' ' +
   //          'P2:' + CASA6_PONTO(Lat2) + '/' + CASA6_PONTO(Long2) ) ;
End ;
Angulo_Rad := DegToRad ( ( Lat1 + Lat2 ) / 2 ) ;
DLat := ABS ( (Lat1-Lat2) * cos ( Angulo_Rad ) ) ;
DLong := ABS ( Long1 - Long2 ) ;
Regiao := '' ;
OffSet := 30 / 111319 ;
Comentario := 'P1: ' + CASA6_PONTO(Lat1) + ',' + CASA6_PONTO(Long1) + LF +
              'P2: ' + CASA6_PONTO(Lat2) + ',' + CASA6_PONTO(Long2) + LF +
              'OffSet: ' + CASA6_PONTO(OffSet) + LF +
              'DLat: ' + CASA6_PONTO(DLat) + LF +
              'DLong: ' + CASA6_PONTO(DLong) + LF ;
If IsZero ( DLong, 1E-6) Then Begin
   Angulo := 89.99 ;
End Else If IsZero ( DLat, 1E-6) Then Begin
   Angulo := 0.01 ;
End Else Begin
   Angulo := RadToDeg ( ArcTan ( DLat / DLong ) ) ;
   If Lat1 < Lat2 Then Begin
      Angulo := - Angulo ;
   End ;
End ;
DX := ABS ( OffSet * Cos ( DegToRad ( 90 - ABS ( Angulo ) ) ) ) ;
DY := ABS ( OffSet * Sin ( DegToRad ( 90 - ABS ( Angulo ) ) ) ) ;
Comentario := Comentario +
              'DX: ' + CASA6_PONTO ( DX ) + LF +
              'DY: ' + CASA6_PONTO ( DY ) + LF +
              'Angulo: ' + CASA3_PONTO ( Angulo ) + LF ;
If Lat1 > Lat2 Then Begin
   Poligono := CASA6_PONTO(Long1+DX) + ',' + CASA6_PONTO(Lat1+DY) + ',0 ' + LF +
               CASA6_PONTO(Long2+DX) + ',' + CASA6_PONTO(Lat2+DY) + ',0 ' + LF +
               CASA6_PONTO(Long2-DX) + ',' + CASA6_PONTO(Lat2-DY) + ',0 ' + LF +
               CASA6_PONTO(Long1-DX) + ',' + CASA6_PONTO(Lat1-DY) + ',0 ' + LF +
               CASA6_PONTO(Long1+DX) + ',' + CASA6_PONTO(Lat1+DY) + ',0 ' + LF ;
End Else Begin
   Poligono := CASA6_PONTO(Long1-DX) + ',' + CASA6_PONTO(Lat1+DY) + ',0 ' + LF +
               CASA6_PONTO(Long2-DX) + ',' + CASA6_PONTO(Lat2+DY) + ',0 ' + LF +
               CASA6_PONTO(Long2+DX) + ',' + CASA6_PONTO(Lat2-DY) + ',0 ' + LF +
               CASA6_PONTO(Long1+DX) + ',' + CASA6_PONTO(Lat1-DY) + ',0 ' + LF +
               CASA6_PONTO(Long1-DX) + ',' + CASA6_PONTO(Lat1+DY) + ',0 ' + LF ;
End ;
Regiao := KML_POLIGONO_INI ( Lat1, Long1, Lat2, Long2, Poligono, Comentario,
                             Indice, Estilo, Placemark ) ;
Result := SQRT ( DLat * DLat + DLong * DLong ) * 111319 ;
End ;

Function IIF ( Condicao : Boolean ; S1, S2 : String ) : String ;
Begin
If Condicao Then Result := S1 Else Result := S2 ;
End ;

Function IF01 ( Condicao : Boolean ) : String ;
Begin
If Condicao Then Result := '1' Else Result := '0' ;
End ;

Function IFSN ( Condicao : Boolean ) : String ;
Begin
If Condicao Then Result := 'SIM' Else Result := 'NAO' ;
End ;

Function IIFN ( Condicao : Boolean ; N1 , N2 : LongInt ) : LongInt ;
Begin
If Condicao Then Result := N1 Else Result := N2 ;
End ;

Function IIFF ( Condicao : Boolean ; N1 , N2 : Single ) : Single ;
Begin
If Condicao Then Result := N1 Else Result := N2 ;
End ;

Function CASA0_PONTO ( Aux : Double ) : String ;
Begin
Result := Format('%d', [TRUNC(Aux)]) ;
Result := StringReplace ( Result, ',', '.', [rfReplaceAll] ) ;
End ;

Function CASA1_PONTO ( Aux : Double ) : String ;
Begin
Result := Format('%0.1f', [Aux]) ;
Result := StringReplace ( Result, ',', '.', [rfReplaceAll] ) ;
End ;

Function CASA2_PONTO ( Aux : Double ) : String ;
Begin
Result := Format('%0.2f', [Aux]) ;
Result := StringReplace ( Result, ',', '.', [rfReplaceAll] ) ;
End ;

Function CASA3_PONTO ( Aux : Double ) : String ;
Begin
Result := Format('%0.3f', [Aux]) ;
Result := StringReplace ( Result, ',', '.', [rfReplaceAll] ) ;
End ;

Function CASA4_PONTO ( Aux : Double ) : String ;
Begin
Result := Format('%0.4f', [Aux]) ;
Result := StringReplace ( Result, ',', '.', [rfReplaceAll] ) ;
End ;

Function CASA6_PONTO ( Aux : Double ) : String ;
Begin
Result := Format('%0.6f', [Aux]) ;
Result := StringReplace ( Result, ',', '.', [rfReplaceAll] ) ;
End ;

Function CASA7_PONTO ( Aux : Double ) : String ;
Begin
Result := Format('%0.7f', [Aux]) ;
Result := StringReplace ( Result, ',', '.', [rfReplaceAll] ) ;
End ;

Function CASA8_PONTO ( Aux : Double ) : String ;
Begin
Result := Format('%0.8f', [Aux]) ;
Result := StringReplace ( Result, ',', '.', [rfReplaceAll] ) ;
End ;

Function CASA9_PONTO ( Aux : Double ) : String ;
Begin
Result := Format('%0.9f', [Aux]) ;
Result := StringReplace ( Result, ',', '.', [rfReplaceAll] ) ;
End ;

Function StrZero ( Aux, Casas : LongInt ) : String ;
//Var Mascara : String ;
Begin
Result := IntToStr ( Aux ) ;
While Length ( Result ) < Casas Do Result := '0' + Result ;
End ;

Function FORMAT_DISTANCIA ( Metros : LongInt ) : String ;
Begin
If Metros < 1000 Then Begin
   Result := Format('%0d', [metros]) + 'm'
End Else Begin
   Result := Format('%0.1f', [metros/1000]) + 'km' ;
End ;
End ;

Function StrToFloat_RR ( Valor : String ; Default : Double ) : Double ;
Begin
Try
   If SysUtils.FormatSettings.DecimalSeparator = '.' Then Begin
      While Pos ( ',', Valor ) > 0 Do Begin
         Valor [ Pos ( ',', Valor ) ] := '.' ;
      End ;
   End Else Begin
      While Pos ( '.', Valor ) > 0 Do Begin
         Valor [ Pos ( '.', Valor ) ] := ',' ;
      End ;
   End ;
//SysUtils.FormatSettings.ThousandSeparator := ',' ;
   Result := StrToFloat ( Valor ) ;
Except
   If Pos ( '.', Valor ) > 0 Then Begin
      //While Pos ( '.', Valor ) > 0 Do Valor [ Pos ( '.', Valor ) ] := ',' ;
   End ;
   Try
      Result := StrToFloat ( Valor ) ;
   Except
      Result := Default ;
   End ;
End ;
End ;

Procedure EXPLODE_RR ( Delimitador: Char ; Texto : String ; Var Lista : TStringList ) ;
Var Local : LongInt ;
    Part  : String ;
Begin
Lista.Clear ;
Part := '' ;
For Local := 1 To Length(Texto) Do Begin
   If Texto[Local] = Delimitador Then Begin
      Lista.Add ( Part ) ;
      Part := '' ;
   End Else Begin
      Part := Part + Texto[Local] ;
   End ;
End ;
If Part<>'' Then Begin
   Lista.Add ( Part ) ;
End ;
//Lista.Add ( '' ) ;
End ;

Function EXPLODE ( StrLinha, Delimitador : String ) : TStringList ;
Begin
Result := TStringList.Create ;
Try
   Result.Clear ;
   If Delimitador = ';' Then Begin
      ExtractStrings([';'],[], PChar(strLinha), Result)
   End Else If Delimitador = #9 Then Begin
      ExtractStrings([#9],[], PChar(strLinha), Result)
   End Else If Delimitador = #32 Then Begin
      ExtractStrings([#32],[], PChar(strLinha), Result)
   End Else If Delimitador = '/' Then Begin
      ExtractStrings(['/'],[], PChar(strLinha), Result)
   End Else If Delimitador = '!' Then Begin
      ExtractStrings(['!'],[], PChar(strLinha), Result)
   End Else If Delimitador = '#' Then Begin
      ExtractStrings(['#'],[], PChar(strLinha), Result)
   End Else If Delimitador = ':' Then Begin
      ExtractStrings([':'],[], PChar(strLinha), Result)
   End Else If Delimitador = '.' Then Begin
      ExtractStrings(['.'],[], PChar(strLinha), Result)
   End Else If Delimitador = ',' Then Begin
      ExtractStrings([','],[], PChar(strLinha), Result)
   End Else If Delimitador = '=' Then Begin
      ExtractStrings(['='],[], PChar(strLinha), Result)
   End Else If Delimitador = '|' Then Begin
      ExtractStrings(['|'],[], PChar(strLinha), Result)
   End Else Begin
      ExtractStrings([';'],[], PChar(strLinha), Result) ;
   End ;
   //ExtractStrings([';'],[], PChar(strLinha), Parte) ;
Finally
End ;
End ;

Function FORMATAR_IP ( IP : Cardinal ) : String ;
Begin
Result := StrZero ( ((IP AND $FF000000) SHR 24), 3 ) + '.' +
          StrZero ( ((IP AND $00FF0000) SHR 16), 3 ) + '.' +
          StrZero ( ((IP AND $0000FF00) SHR 8), 3 ) + '.' +
          StrZero ( ((IP AND $000000FF) ) , 3 ) ;
End ;

Function LISTA_TO_CARDINAL ( Origem, Delimitador : String ) : Cardinal ;
Var Aux3  : String ;
    Lista : TStringList ;
    Local : LongInt ;
    Qtde  : LongInt ;
Begin
//Lista := TStringList.Create ;
//PUT_MEMO ( 'Origem [' + Origem + '][' + Delimitador + ']' ) ;
Lista := EXPLODE ( Origem, Delimitador ) ;
//PUT_MEMO ( 'Lista [' + IntToStr(Lista.Count) + ']' ) ;
Aux3 := '' ;
Result := 0 ;
Qtde := Lista.Count ;
If Qtde > 0 Then Begin
   For Local := 0 To Qtde - 1 Do Begin
      Result := Result SHL 8 + StrToIntDef(Lista[Local],0) ;
   End ;
End ;
//PUT_MEMO ( 'Result [' + IntToStr(Result) + ']' ) ;
Lista.Free ;
End ;

Function INSERE_BARRA ( Dir : String ) : String ;
Begin
If Length ( Dir ) = 0 Then Begin
   Result := '\' ;
   Exit ;
End ;
If Dir [ Length ( Dir ) ] <> '\' Then Begin
   Dir := Dir + '\' ;
End ;
Result := Dir ;
End ;

Function INSERE_BARRA_LINUX ( Dir : String ) : String ;
Begin
Result := INSERE_BARRA_NORMAL ( Dir ) ;
End ;

Function INSERE_BARRA_NORMAL ( Dir : String ) : String ;
Begin
If Length ( Dir ) = 0 Then Begin
   Result := '/' ;
   Exit ;
End ;
If Dir [ Length ( Dir ) ] <> '/' Then Begin
   Dir := Dir + '/' ;
End ;
Result := Dir ;
End ;

Function REMOVE_BARRA ( Dir : String ) : String ;
Begin
Result := '' ;
If Length ( Dir ) = 0 Then Begin
   Exit ;
End ;
While Dir [ Length ( Dir ) ] = '\' Do Begin
   Delete ( Dir , Length ( Dir ) , 1 ) ;
End ;
Result := Dir ;
End ;

Function REMOVE_BARRAS ( Str : String ) : String ;
Begin
Result := '' ;
While Pos ( '\', Str ) > 0 Do Begin
   Delete ( Str , 1 , 1 ) ;
End ;
While Pos ( '/', Str ) > 0 Do Begin
   Delete ( Str , 1 , 1 ) ;
End ;
Result := Str ;
End ;

Function DATAHORA_INVERSA_TO_DATETIME ( Data : String ) : TDateTime ;
Begin
{
20161231010203
}
Try
   Result := StrToDateTime ( Copy ( Data , 7 , 2 ) + '/' +
                             Copy ( Data , 5 , 2 ) + '/' +
                             Copy ( Data , 1 , 4 ) + ' ' +
                             Copy ( Data , 9 , 2 ) + ':' +
                             Copy ( Data , 11 , 2 ) + ':' +
                             Copy ( Data , 13 , 2 ) ) ;
Except
   Result := 0 ;
End ;
End ;

Function DATA_INVERSA_TO_DATETIME ( Data : String ) : TDateTime ;
Begin
{
20161231
}
Try
   Result := StrToDateTime ( Copy ( Data , 7 , 2 ) + '/' +
                             Copy ( Data , 5 , 2 ) + '/' +
                             Copy ( Data , 1 , 4 ) + ' 00:00:00' ) ;
Except
   Result := 0 ;
End ;
End ;

Function DATAHORA_INVERSA ( Data : TDateTime ) : String ;
Begin
Result := Copy ( DateToStr ( Data ) , 7 , 4 ) +
          Copy ( DateToStr ( Data ) , 4 , 2 ) +
          Copy ( DateToStr ( Data ) , 1 , 2 ) +
          Copy ( TimeToStr ( Data ) , 1 , 2 ) +
          Copy ( TimeToStr ( Data ) , 4 , 2 ) +
          Copy ( TimeToStr ( Data ) , 7 , 2 ) ;
End ;

Function DATA_INVERSA ( Data : TDateTime ) : String ;
Begin
Result := Copy ( DateToStr ( Data ) , 7 , 4 ) +
          Copy ( DateToStr ( Data ) , 4 , 2 ) +
          Copy ( DateToStr ( Data ) , 1 , 2 ) ;
End ;

Procedure CHECAR_DIRETORIO_FILENAME ( _FileName : String ) ;
Var Tick : Cardinal ;
Begin
Tick := GetTickCount ;
Try
   //SetFileAttributes ( PChar ( _FileName ) , 0 ) ;
   If NOT DirectoryUsable ( ExtractFilePath ( _FileName ) ) Then Begin
      ForceDirectories ( ExtractFilePath ( _FileName ) ) ;
   End ;
   While Pos ( '/', _FileName ) > 0 Do Begin
      _FileName[Pos ( '/', _FileName)] := '\' ;
   End ;
   If NOT DirectoryUsable  ( ExtractFilePath ( _FileName ) ) Then Begin
      ForceDirectories ( ExtractFilePath ( _FileName ) ) ;
   End ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception CHECAR_DIRETORIO_FILENAME [' + _FileName + '][' + E.Message + ']' ) ;
   End ;
End ;
Tick := GetTickCount - Tick ;
If Tick > 200 Then Begin
   PUT_LOG ( 'ERRO CHECAR_DIRETORIO_FILENAME Tick[' + IntToStr(Tick) + '][' + _FileName + ']' ) ;
End ;
End ;

Procedure CHECAR_DIRETORIO_DIRNAME ( _DirName : String ) ;
Var Tick : Cardinal ;
Begin
Tick := GetTickCount ;
Try
   If NOT DirectoryUsable  ( _DirName ) Then Begin
      ForceDirectories ( _DirName ) ;
   End ;
Except
End ;
Tick := GetTickCount - Tick ;
If Tick > 200 Then Begin
   PUT_LOG ( 'ERRO CHECAR_DIRETORIO_DIRNAME Tick[' + IntToStr(Tick) + '][' + _DirName + ']' ) ;
End ;
End ;

Function SAVE_CONTEUDO_HEXA ( _FileName , Conteudo : String ; Basico : Boolean ; _Delayed : Boolean ) : LongInt ;
Var Aux     : String ;
    Local   : LongInt ;
    FN_Temp : String ;
Begin
Aux := '' ;
If Conteudo <> '' Then Begin
   For Local := 1 To Length ( Conteudo ) Do Begin
       If Basico Then Begin
          Aux := Aux + IntToHex ( Ord ( Conteudo [ Local ] ) , 2 ) ;
       End Else Begin
          Aux := Aux + IntToHex ( Ord ( Conteudo [ Local ] ) , 2 ) + #32 ;
          If Local MOD 4 = 0 Then
             Aux := Aux + '.' ;
          If Local MOD 32 = 0 Then
             Aux := Aux + CRLF ;
       End ;
   End ;
End ;
Aux := Aux + CRLF ;
FN_Temp := _FileName + '.tmp' ;
WRITE_FILE_CORE ( 'SAVE CONTEUDO_HEXA',
                  FN_Temp , Aux, DELAYED_TRUE ) ;
If RR_FileExists ( 'SAVE CONTEUDO_HEXA', _FileName ) Then Begin
   If RR_DeleteFile ( 'SAVE CONTEUDO_HEXA', _FileName ) Then Begin
   End ;
End ;
RenameFile(FN_Temp, _FileName) ;
Result := Length ( Aux ) ;
End ;

(*
Procedure WRITE_FILE_REAL ( _FileName , _Conteudo : String ; _Delayed : Boolean ) ;
Var //Arquivo : TextFile ;
    Tick    : Cardinal ;
Begin
Tick := GetTickCount ;
WRITE_FILE_CORE ( 'WRITE_FILE_REAL', _FileName, _Conteudo, _Delayed ) ;
*)
(*
Try
{$i-}
   CHECAR_DIRETORIO_FILENAME ( _FileName ) ;
   AssignFile ( Arquivo , _FileName ) ;
   //ShowMessage_Old ( _FileName ) ;
   ReWrite ( Arquivo ) ;
   Write ( Arquivo , _Conteudo ) ;
   CloseFile ( Arquivo ) ;
{$i+}
   If IOResult <> 0 Then Begin
      PUT_LOG ( 'Exception I/O WRITE FILE_REAL ' +
                '[' + _FileName  + ']' ) ;
   End ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception WRITE FILE_REAL [' + E.Message + ']' +
                '[' + _FileName  + ']' ) ;
   End ;
End ;
*)
(*
Tick := GetTickCount - Tick ;
If Tick > 200 Then Begin
   PUT_LOG ( 'ERRO WRITE FILE_REAL Tick[' + IntToStr(Tick) + '][' + _FileName + ']' ) ;
End ;
End ;
*)

Const szChar = SizeOf(Char);

Procedure GRAVAR_BUFFER_WRITE_FILE ;
Var Qtde     : LongInt ;
    Local    : LongInt ;
    FN       : String ;
    Conteudo : String ;
Begin
Qtde := Length ( A_Write_Delay ) ;
If Qtde = 0 Then Begin
   Exit ;
End ;
_Debug ( 'GRAVAR BUFFER_WRITE_FILE Qtde[' + IntToStr(Qtde) + ']' ) ;
For Local := 0 To Qtde - 1 Do Begin
   Try
      If Local >= Length ( A_Write_Delay ) Then Begin
         PUT_LOG ( 'ABORTANDO GRAVAR_BUFFER_WRITE_FILE Idx[' + IntToStr(Local) + ']' ) ;
         Exit ;
      End ;
      FN := A_Write_Delay[Local].FN ;
      A_Write_Delay[Local].FN := '' ;
      If FN <> '' Then Begin
         //PUT_LOG ( 'ANTES GRAVAR_BUFFER_WRITE_FILE [' + A_Write_Delay[Local].FN + ']' ) ;
         _Debug ( 'GRAVAR BUFFER_WRITE_FILE FN[' + FN + ']' ) ;
         Conteudo := A_Write_Delay[Local].Conteudo ;
         WRITE_FILE_CORE ( 'GRAVAR_BUFFER_WRITE_FILE',
                           FN,
                           Conteudo,
                           DELAYED_FALSE ) ;
         PUT_LOG ( 'DEPOIS GRAVAR_BUFFER_WRITE_FILE [' + FN + ']' ) ;
      End ;
   Except
      On E : Exception Do Begin
         PUT_LOG ( 'Exception GRAVAR_BUFFER_WRITE_FILE ' +
                   'Idx[' + IntToStr(Local) + ']' +
                   '[' + E.Message + ']' ) ;
      End ;
   End ;
End ;
SetLength ( A_Write_Delay, 0 ) ;
End ;

Procedure TASK_WRITE_FILE_CORE ;
Var Stream   : TStringStream ;
//    Passo    : LongInt ;
//    Tick     : Cardinal ;
Begin
//_Debug ( 'INI TASK_WRITE FILE_CORE' ) ;
//PUSH_TICK ( 'TASK_WRITE FILE_CORE' ) ;
//Tick := GetTickCount ;
Try
//   Passo := 1 ;
   Stream := TStringStream.Create ( '', TEncoding.ANSI ) ;
//   Passo := 2 ;
   Stream.Clear ;
//   Passo := 3 ;
   Stream.WriteString ( TASK_WRITE_FILE_CORE_Conteudo ) ;
//   Passo := 4 ;
   Stream.SaveToFile  ( TASK_WRITE_FILE_CORE_FN ) ;
//   Passo := 5 ;
Except
   On E : Exception Do Begin
      //PUT_LOG ( 'Exception WRITE FILE_CORE ' +
      //          'P[' + IntToStr(Passo) + ']' +
      //          '[' + TASK_WRITE_FILE_CORE_FN + '][' + E.Message + ']' ) ;
      If Assigned ( Log ) AND ( NOT Application.Terminated ) Then Begin
      //   PUT_LOG_EVENTO ( Log.LB_Write, Log.CK_Rolagem.Checked,
      //                    TimeToStr ( Now ) + ' ' +
      //                    'WCORE EXC ' + IntToStr ( Cnt_Log_Write ) + ' ' +
      //                    'T[' + IntToStr(Tick) + ']' +
      //                    //'[' + ExtractFileName(FN) + ']' +
      //                    '[' + TASK_WRITE_FILE_CORE_FN + ']' +
      //                    '[' + TASK_WRITE_FILE_CORE_Origem + ']' ) ;
      End ;
   End ;
End ; // try
If Assigned ( Stream ) Then Begin
   FreeAndNil ( Stream ) ;
End ;
//POP_TICK ( 'TASK_WRITE FILE_CORE' ) ;
//_Debug ( 'FIM TASK_WRITE FILE_CORE' ) ;
End ;

Procedure WRITE_FILE_CORE ( Origem, FN, Conteudo : String ; _Delayed : Boolean ) ;
Var //Passo    : LongInt ;
    Qtde     : LongInt ;
//    Task     : iTask ;
Begin
_Debug ( 'INI WRITE FILE_CORE' ) ;
PUSH_TICK ( 'WRITE FILE_CORE' ) ;
Inc ( Cnt_Log_Write ) ;
If NOT DirectoryUsable  ( ExtractFilePath ( FN ) ) Then Begin
   CHECAR_DIRETORIO_FILENAME ( FN ) ;
End ;
If _Delayed Then Begin
   Qtde := Length ( A_Write_Delay ) + 1 ;
   SetLength ( A_Write_Delay, Qtde ) ;
   A_Write_Delay [ Qtde - 1 ].FN := FN ;
   A_Write_Delay [ Qtde - 1 ].Conteudo := Conteudo ;
   Exit ;
End ;
//Passo := 0 ;
TASK_WRITE_FILE_CORE_Conteudo := Conteudo ;
TASK_WRITE_FILE_CORE_FN := FN  ;
TASK_WRITE_FILE_CORE_Origem := Origem ;
(*
If FLAG_MODO_TASK Then Begin
   Task := TTask.Create ( TASK_WRITE_FILE_CORE ) ;
   Task.Start ;
End Else Begin
   TASK_WRITE_FILE_CORE ;
End ;
*)
TASK_WRITE_FILE_CORE ;
If Assigned ( Log ) AND ( NOT Application.Terminated ) Then Begin
   PUT_LOG_EVENTO ( Log.LB_Write, Log.CK_Rolagem.Checked,
                    TimeToStr ( Now ) + ' ' +
                    'WCORE OK. ' + IntToStr ( Cnt_Log_Write ) + ' ' +
                    //'T[' + IntToStr(Tick) + ']' +
                    //'[' + ExtractFileName(FN) + ']' +
                    '[' + TASK_WRITE_FILE_CORE_FN + ']' +
                    '[' + TASK_WRITE_FILE_CORE_Origem + ']' ) ;
End ;
POP_TICK ( 'WRITE FILE_CORE' ) ;
_Debug ( 'FIM WRITE FILE_CORE' ) ;
End ;

(*
Procedure WRITE_FILE_CORE2 ( Origem, FN, Conteudo : String ; _Delayed : Boolean ) ;
Var FS      : TFileStream ;
    Flags   : Word ;
    Tick    : Cardinal ;
Begin
Tick := GetTickCount ;
Flags := fmOpenReadWrite ;
If NOT RR_FileExists( FN ) Then Begin
   Flags := Flags OR fmCreate ;
End ;
If Conteudo = '' Then Begin
   Conteudo := ' ' ;
End ;
FS := TFileStream.Create( FN , Flags) ;
Try
   FS.Position := FS.Size ;  // Will be 0 if file created, end of text if not
   FS.Write(Conteudo[1], Length(Conteudo) * SizeOf(Char)) ;
   Tick := GetTickCount - Tick ;
   PUT_LOG_EVENTO ( Log.LB_Write, Log.CK_Rolagem.Checked,
                    TimeToStr ( Now ) + ' ' +
                    'WRITE OK. ' + IntToStr ( Cnt_Log_Write ) + ' ' +
                    'T[' + IntToStr(Tick) + ']' +
                    '[' + ExtractFileName(FN) + ']' +
                    '[' + FN + ']' +
                    '[' + Origem + ']' ) ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception WRITE_FILE_CORE2 [' + E.Message + '][' + FN + ']' ) ;
      PUT_LOG_EVENTO ( Log.LB_Write, Log.CK_Rolagem.Checked,
                       TimeToStr ( Now ) + ' ' +
                       'WRITE OK. ' + IntToStr ( Cnt_Log_Write ) + ' ' +
                       'T[' + IntToStr(Tick) + ']' +
                       '[' + ExtractFileName(FN) + ']' +
                       '[' + FN + ']' +
                       '[' + Origem + ']' ) ;
   End ;
End ;
If Assigned ( FS ) Then Begin
   FS.Free ;
End ;
End ;
*)

(*
Var c1, c2 : dword;
begin
c1 := CreateFile ( PChar(FN), GENERIC_READ or GENERIC_WRITE, 0, nil, OPEN_ALWAYS, 0, 0) ;
If c1 <> INVALID_HANDLE_VALUE Then Begin
   SetFilePointer ( c1, 0, Nil, FILE_END ) ;
   WriteFile ( c1, pointer(str)^, Length(str), c2, Nil) ;
   CloseHandle ( c1 ) ;
End;
End ;
*)

(*
Procedure WRITE_FILE_REAL_WIN ( _FileName , _Conteudo : String ; _Delayed : Boolean ) ;
Var // Arquivo : TextFile ;
//    Lista   : TStringList ;
    Tick    : Cardinal ;
Begin
Tick := GetTickCount ;
WRITE_FILE_CORE ( 'WRITE_FILE_REAL_WIN',
                  _FileName, _Conteudo, _Delayed ) ;
*)
(*
CHECAR_DIRETORIO_FILENAME ( _FileName ) ;
Lista := TStringList.Create ;
Lista.Text := _Conteudo ;
Try
   Lista.SaveToFile ( _FileName ) ;
   Except
   On E : Exception Do
      Begin
      {
      PUT_LOG ( 'Exception durante WRITE FILE_REAL_WIN' + LFLF +
                '"' + _FileName + '"' + LFLF +
                E.Message ) ;
      }
      End ;
   End ;
Lista.Free ;
*)
(*
Tick := GetTickCount - Tick ;
If Tick > 200 Then Begin
   PUT_LOG ( 'ERRO DELAY WRITE FILE_REAL_WIN Tick[' + IntToStr(Tick) + '][' + _FileName + ']' ) ;
End ;
End ;
*)

(*
Procedure WRITE_FILE_REAL_WIN_UTF8 ( _FileName , _Conteudo : String ; _Delayed : Boolean ) ;
Var // Arquivo : TextFile ;
//    Lista   : TStringList ;
    Tick    : Cardinal  ;
Begin
Tick := GetTickCount ;
WRITE_FILE_CORE ( 'WRITE_FILE_REAL_WIN_UTF8',
                  _FileName, _Conteudo, _Delayed ) ;
*)
(*
CHECAR_DIRETORIO_FILENAME ( _FileName ) ;
Lista := TStringList.Create ;
Lista.Text := _Conteudo ;
Try
   Lista.SaveToFile ( _FileName, TEncoding.UTF8) ;
   Except
   On E : Exception Do
      Begin
      {
      PUT_LOG ( 'Exception durante WRITE FILE_REAL_WIN' + LFLF +
                '"' + _FileName + '"' + LFLF +
                E.Message ) ;
      }
      End ;
   End ;
Lista.Free ;
*)
(*
Tick := GetTickCount - Tick ;
If Tick > 200 Then Begin
   PUT_LOG ( 'ERRO WRITE FILE_REAL_WIN_UTF8 Tick[' + IntToStr(Tick) + '][' + _FileName + ']' ) ;
End ;
End ;
*)

Function Single_To_Hexa ( _Single : Single ) : String ;
Var C1 , C2 , C3 , C4 : Char ;
Begin
Single_To_Char ( _Single , C1 , C2 , C3 , C4 ) ;
Result := IntToHex ( Ord ( C1 ) , 2 ) + IntToHex ( Ord ( C2 ) , 2 ) +
          IntToHex ( Ord ( C3 ) , 2 ) + IntToHex ( Ord ( C4 ) , 2 ) ;
End ;

Function IS_STRING_HEXA_VALIDA ( Str : String ) : Boolean ;
Var Local : LongInt ;
Begin
Result := FALSE ;
If Str = '' Then Begin
   Exit ;
End ;
Str := UpperCase ( Str ) ;
For Local := 1 To Length ( Str ) Do Begin
   If Pos ( Str[Local], '0123456789ABCDEF' ) = 0 Then Begin
      Exit ;
   End ;
End ;
Result := TRUE ;
End ;

Function HexToChar ( _Hexa : String ) : Char ;
//Const HEXA : String = '0123456789ABCDEF' ;
//Var   Code : Interger ;
Begin
Result := #0 ;
If Length ( _Hexa ) <> 2 Then Begin
   Exit ;
End ;
{
_Hexa := UpperCase ( _Hexa ) ;
Result := Chr ( Pos ( _Hexa[1] , HEXA ) - 1 ) ;
Result := Chr ( Ord ( Result ) * 16 + ( Pos ( _Hexa[2] , HEXA ) - 1 ) ) ;
}
Result := Char ( StrToInt ( '$' + _Hexa ) ) ;
End ;

Function HexToInt ( _Hexa : String ) : Cardinal ;
//Const HEXA : String = '0123456789ABCDEF' ;
//Var   Code : Interger ;
Begin
//Result := 0 ;
//If Length ( _Hexa ) <> 2 Then
//   Exit ;
{
_Hexa := UpperCase ( _Hexa ) ;
Result := Chr ( Pos ( _Hexa[1] , HEXA ) - 1 ) ;
Result := Chr ( Ord ( Result ) * 16 + ( Pos ( _Hexa[2] , HEXA ) - 1 ) ) ;
}
Result := StrToInt ( '$' + _Hexa ) ;
End ;

Function String_To_Hexa(S: String): String ;
Var I : Integer ;
Begin
Result := '' ;
If S = '' Then Begin
   Exit ;
End ;
For I := 1 To Length (S) Do Begin
    Result := Result + IntToHex (Ord(S[i]),2) ;
End ;
End ;

Function String_To_Hexa_Delimitador(S : RawByteString ;  Delimitador : Char ): RawByteString ;
Const SIZE_BUFFER = 1500 * 4 * 3 ;
Var I    : Integer ;
    Len  : LongInt ;
    Len2 : LongInt ;
    Aux  : String ;
    //Buffer : Array [ 0 .. SIZE_BUFFER - 1 ] Of Char ;
Begin
Result := '' ;
If S = '' Then Begin
   Exit ;
End ;
Len := Length (S) ;
Len2 := 0 ;
//FillChar ( Buffer, SIZE_BUFFER, #0 ) ;
For I := 1 To Len Do Begin
    Aux := IntToHex (Ord(S[i]),2) ;
    Result := Result + Aux + String(Delimitador) ;
    //Result := Result + Aux[1] + Aux[2] + Delimitador ;
    //If Length(Aux)<2 Then
    //   Continue ;
    //Buffer[Len2] := Aux[1] ;
    //Inc ( Len2 ) ;
    //Buffer[Len2] := Aux[2] ;
    //Inc ( Len2 ) ;
   // Buffer[Len2] := Delimitador ;
    //Inc ( Len2 ) ;
End ;
//Dec ( Len2 ) ;
{
If Len2 > 0 Then Begin
   SetString ( Result, PChar(@Buffer[0]), Len2 )
End Else Begin
    Result := '' ;
End ;
}
Delete ( Result, Len2, 1 ) ;
End ;

Function String_Raw_To_Hexa_Delimitador(S, Delimitador: RawByteString ): RawByteString ;
Var I : Integer ;
Begin
Result:= '' ;
If S = '' Then Begin
   Exit ;
End ;
For I := 1 To Length (S) Do Begin
    Result:= Result + String(IntToHex (Ord(S[i]),2)) + String(Delimitador) ;
End ;
Delete ( Result, Length(Result), 1 ) ;
End ;

Function Hexa_To_String(H: String): String ;
Var I : Integer ;
Begin
Result:= '' ;
If NOT IS_STRING_HEXA_VALIDA ( H ) Then Begin
   Exit ;
End ;
For I := 1 to length (H) div 2 Do Begin
    Result:= Result+Char(StrToInt('$'+Copy(H,(I-1)*2+1,2))) ;
End ;
End ;

Function Bytes_To_Hexa_Delimitador ( _Array : Array Of Byte ; Delimitador : RawByteString ) : RawByteString ;
Var Local : LongInt ;
    Qtde  : LongInt ;
Begin
Result := '' ;
Qtde := Length ( _Array ) ;
If Qtde = 0 Then Begin
   Exit ;
End ;
For Local := 0 To Qtde - 1 Do Begin
   Result := Result + IntToHex ( _Array[Local], 2 ) + String(Delimitador) ;
End ;
Delete ( Result, Length ( Result ), 1 ) ;
End ;

Function Bytes_To_Hexa ( _Array : Array Of Byte ) : String ;
Var Local : LongInt ;
    Qtde  : LongInt ;
Begin
Result := '' ;
Qtde := Length ( _Array ) ;
If Qtde = 0 Then Begin
   Exit ;
End ;
For Local := 0 To Qtde - 1 Do Begin
   Result := Result + IntToHex ( _Array[Local], 2 ) ;
End ;
End ;

{
Function String_Hexa_To_String_OLD ( _Str : String ) : String ;
//Var Local : LongInt ;
Begin
_Str := UpperCase ( Trim ( _Str ) ) ;
If Odd ( Length ( _Str ) ) Then
   _Str := '0' + _Str ;
Result := '' ;
If _Str = '' Then
   Exit ;
While Length ( _Str ) > 0 Do
   Begin
   Result := Result + HexToChar ( Copy ( _Str , 1 , 2 ) ) ;
   Delete ( _Str , 1 , 2 ) ;
   End ;
End ;
}

Function String_Hexa_To_String ( HexStr: String ) : String ;
Var tmp : AnsiString ;
Begin
HexStr := Trim ( HexStr ) ;
If HexStr = '' Then Begin
   Result := '' ;
   Exit ;
End ;
HexStr := StringReplace ( HexStr, ' ', '', [rfReplaceAll] ) ;
HexStr := StringReplace ( HexStr, ':', '', [rfReplaceAll] ) ;
HexStr := StringReplace ( HexStr, '.', '', [rfReplaceAll] ) ;
Assert(not Odd(Length(HexStr)), 'A entrada hexa deve ter tamanho par');
SetLength(tmp, Length(HexStr) div 2);
HexToBin(PWideChar(HexStr), @tmp[1], Length(tmp)) ;
Result := String(tmp) ;
end;

Function String_Hexa_To_String_OLD2 ( H : RawByteString ) : RawByteString ;
Var I : Integer ;
Begin
Result:= '';
If NOT IS_STRING_HEXA_VALIDA ( String(H) ) Then Begin
   Exit ;
End ;
For I := 1 to Length (H) DIV 2 Do Begin
   Result := Result + String(Char ( StrToInt ( '$' + String(Copy(H,(I-1)*2+1,2)) ) ) ) ;
End ;
End ;

Procedure Single_To_Char ( _Single : Single ;
                           Var C1 : Char ; Var C2 : Char ;
                           Var C3 : Char ; Var C4 : Char ) ;
Var _P      : ^Char ;
Begin
Try
   _P := @_Single ;
   C1 := _P^;
   Inc ( _P ) ;
   C2 := _P^;
   Inc ( _P ) ;
   C3 := _P^;
   Inc ( _P ) ;
   C4 := _P^ ;
Except
   C1 := #0 ;
   C2 := #0 ;
   C3 := #0 ;
   C4 := #0 ;
End ;
End ;

Function SINGLE_TO_STR ( _Single : Single ) : String ;
Var _P      : ^Char ;
Begin
Try
   _P := @_Single ;
   Result := _P^;
   Inc ( _P ) ;
   Result := Result + _P^;
   Inc ( _P ) ;
   Result := Result + _P^;
   Inc ( _P ) ;
   Result := Result + _P^;
Except
End ;
End ;

Function SINGLE_TO_STR_INVERSO ( _Single : Single ) : String ;
Var _P      : ^Char ;
Begin
Try
   _P := @_Single ;
   Result := _P^;
   Inc ( _P ) ;
   Result := Result + _P^;
   Inc ( _P ) ;
   Result := Result + _P^;
   Inc ( _P ) ;
   Result := Result + _P^;
   Result := Result[4] + Result[3] + Result[2] + Result[1] ;
Except
   Result := #0#0#0#0 ;
End ;
End ;

Procedure APPEND_TEXTO ( Origem, FN , Texto : String ) ;
Var Str   : String ;
    Tick  : Cardinal ;
Begin
_Debug ( 'INI APPEND TEXTO [' + FN + ']' ) ;
Tick := GetTickCount ;
PUSH_TICK ( 'APPEND TEXTO' ) ;
Inc ( Cnt_Log_Append ) ;
CHECAR_DIRETORIO_FILENAME ( FN ) ;
Try
   Str := GET_CONTEUDO_M ( 'APPEND TEXTO/' + Origem, FN ) ;
   Str := Str + sLineBreak + Texto ;
   WRITE_FILE_CORE ( 'APPEND TEXTO/'  + Origem, FN, Str, DELAYED_FALSE ) ;
   Tick := GetTickCount - Tick ;
   If Assigned ( Log ) AND ( NOT Application.Terminated ) Then Begin
      PUT_LOG_EVENTO ( Log.LB_Append, Log.CK_Rolagem.Checked,
                       TimeToStr ( Now ) + ' ' +
                       'APPEND OK. ' + IntToStr ( Cnt_Log_Append ) + ' ' +
                       'T[' + IntToStr(Tick) + ']' +
                       '[' + ExtractFileName(FN) + ']' +
                       '[' + FN + ']' +
                       '[' + Origem + ']' ) ;
   End ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception APPEND TEXTO [' + E.Message + '][' + FN + ']' ) ;
      Tick := GetTickCount - Tick ;
      If Assigned ( Log ) AND ( NOT Application.Terminated ) Then Begin
         PUT_LOG_EVENTO ( Log.LB_Append, Log.CK_Rolagem.Checked,
                          TimeToStr ( Now ) + ' ' +
                          'APPEND EXC ' + IntToStr ( Cnt_Log_Append ) + ' ' +
                          'T[' + IntToStr(Tick) + ']' +
                          '[' + ExtractFileName(FN) + ']' +
                          '[' + FN + ']' +
                          '[' + Origem + ']' ) ;
      End ;
   End ;
End ;
POP_TICK ( 'APPEND TEXTO' ) ;
_Debug ( 'FIM APPEND TEXTO [' + FN + ']' ) ;
End ;

(*
Procedure APPEND_TEXTO ( _FileName , Texto : String ; Origem : LongInt ) ;
Var Arquivo : TextFile ;
    Lista   : TStringList ;
    Qtde    : LongInt ;
    Local   : LongInt ;
Begin
//REG_ALLOC ( 'ATI[' + IntToStr ( Origem ) + ']' , FALSE ) ;
_Debug ( 'INI APPEND_TEXTO [' + _FileName + ']' ) ;
CHECAR_DIRETORIO_FILENAME ( _FileName ) ;
If RR_FileSize ( _FileName ) < -1 Then Begin
   If SysUtils.DeleteFile ( _FileName ) Then Begin
   End ;
End ;
If RR_FileExists ( _FileName ) Then Begin
   //_Debug ( '1 APPEND_TEXTO [' + _FileName + ']' ) ;
   If RR_FileSize_KB ( _FileName ) > (1*1024*1024) Then Begin
      //_Debug ( '3 APPEND_TEXTO [' + _FileName + ']' ) ;
      Lista := TStringList.Create ;
      Lista.Clear ;
      Try
         //_Debug ( '4 APPEND_TEXTO [' + _FileName + ']' ) ;
         Lista.Text := GET_CONTEUDO_M ( 'APPEND_TEXTO', _FileName ) ;
         //_Debug ( '5 APPEND_TEXTO [' + _FileName + ']' ) ;
      Except
         //_Debug ( '6 APPEND_TEXTO [' + _FileName + ']' ) ;
      End ;
      //_Debug ( '7 APPEND_TEXTO [' + _FileName + ']' ) ;
      Qtde := Lista.Count ;
      If Qtde > 2 Then Begin
         //_Debug ( '8 APPEND_TEXTO [' + _FileName + ']' ) ;
         For Local := 1 To ( Qtde * 9 DIV 10 ) Do Begin
             //_Debug ( '8 APPEND_TEXTO [' + _FileName + ']' ) ;
             Lista.Delete ( 0 ) ;
             //_Debug ( '9 APPEND_TEXTO [' + _FileName + ']' ) ;
         End ;
         //_Debug ( '10 APPEND_TEXTO [' + _FileName + ']' ) ;
         Try
            //_Debug ( '11 APPEND_TEXTO [' + _FileName + ']' ) ;
            Lista.SaveToFile ( _FileName ) ;
            //_Debug ( '12 APPEND_TEXTO [' + _FileName + ']' ) ;
         Except
            //_Debug ( '13 APPEND_TEXTO [' + _FileName + ']' ) ;
         End ;
         //_Debug ( '14 APPEND_TEXTO [' + _FileName + ']' ) ;
         _Debug ( '15 APPEND_TEXTO [' + _FileName + ']' ) ;
      End ;
      //_Debug ( '16 APPEND_TEXTO [' + _FileName + ']' ) ;
      Lista.Free ;
      //_Debug ( '17 APPEND_TEXTO [' + _FileName + ']' ) ;
   End ;
End ;
//_Debug ( '18 APPEND_TEXTO [' + _FileName + ']' ) ;
AssignFile ( Arquivo , _FileName ) ;
//REG_ALLOC ( 'AT1' , FALSE ) ;
//_Debug ( '19 APPEND_TEXTO [' + _FileName + ']' ) ;
If NOT RR_FileExists ( _FileName ) Then Begin
   ReWrite ( Arquivo ) ;
   If IoResult <> 0 Then Begin
      //PUT_ERRO ( 'Append_Linha ReWrite "' + Texto + '" "' + _FileName + '"' , Nil ) ;
   End ;
End ;
//REG_ALLOC ( 'AT2' , FALSE ) ;
//_Debug ( '20 APPEND_TEXTO [' + _FileName + ']' ) ;
Append ( Arquivo ) ;
//_Debug ( '20a APPEND_TEXTO [' + _FileName + ']' ) ;
If IoResult = 0 Then Begin
   //_Debug ( '21 APPEND_TEXTO [' + _FileName + ']' ) ;
   Write ( Arquivo , Texto ) ;
   If IoResult <> 0 Then Begin
      //PUT_ERRO ( 'Append_Linha WriteLn "' + Texto + '" "' + _FileName + '"' , Nil ) ;
   End ;
   //_Debug ( '22 APPEND_TEXTO [' + _FileName + ']' ) ;
   CloseFile ( Arquivo ) ;
   If IoResult <> 0 Then Begin
      //PUT_ERRO ( 'Append_Linha CloseFile "' + Texto + '" "' + _FileName + '"' , Nil ) ;
   End ;
   //_Debug ( '23 APPEND_TEXTO [' + _FileName + ']' ) ;
End Else Begin
   //PUT_ERRO ( 'Append_Linha Append "' + Texto + '" "' + _FileName + '"' , Nil ) ;
End ;
//REG_ALLOC ( 'ATF' , FALSE ) ;
_Debug ( 'FIM APPEND_TEXTO [' + _FileName + ']' ) ;
End ;
*)

Procedure _Debug ( Msg : String ) ;
Begin
If First_Tick_Log = 0 Then Begin
   First_Tick_Log := GetTickCount ;
End ;
If NOT Assigned ( xSL_Linhas_Debug ) Then Begin
   xSL_Linhas_Debug := TStringList.Create ;
End ;
If NOT Assigned ( SL_Debug_Full ) Then Begin
   SL_Debug_Full := TStringList.Create ;
End ;
Msg := StringReplace ( Msg, ',', '<:VG:>', [rfReplaceAll] ) ;
Msg := DateTimeToStr ( Now ) + ',' +
       COMPLETEL ( IntToStr ( GetTickCount - Last_Log ), 5 ) + ',' +
       #32#32 + Msg + #32#32 + ',' +
       IntToStr ( Cnt_Debug_Full ) + ',' +
       IntToStr ( GetTickCount ) +  ',' +
       IntToStr ( GetTickCount - First_Tick_Log ) ;
Msg := StringReplace ( Msg, #13#10, '<:CRLF:>', [rfReplaceAll] ) ;
Msg := StringReplace ( Msg, #13, '<:CR:>', [rfReplaceAll] ) ;
Msg := StringReplace ( Msg, #10, '<:LF:>', [rfReplaceAll] ) ;
Msg := StringReplace ( Msg, #9, '<:TAB:>', [rfReplaceAll] ) ;
Msg := StringReplace ( Msg, #8, '<:DEL:>', [rfReplaceAll] ) ;
Msg := StringReplace ( Msg, #7, '<:BS:>', [rfReplaceAll] ) ;
Msg := StringReplace ( Msg, #0, '<:NIL:>', [rfReplaceAll] ) ;
xSL_Linhas_Debug.Add ( Msg ) ;
SL_Debug_Full.Add ( Msg ) ;
Inc ( Cnt_Debug ) ;
Inc ( Cnt_Debug_Full ) ;
While Cnt_Debug > SIZE_DEBUG Do Begin
   xSL_Linhas_Debug.Delete ( 0 ) ;
   Dec ( Cnt_Debug ) ;
End ;
Msg := '' ;
Last_Log := GetTickCount ;
End ;

Function RR_FileSize_KB ( Filename : String ): Int64 ;
//Var //Size    : Int64 ;
//    _Handle : Integer ;
Begin
_Debug ( 'INI RR FileSize KB [' + FileName + ']' ) ;
Result := RR_FileSize ( FileName ) DIV 1024 ;
(*
_Handle := FileOpen ( Filename, fmOpenRead ) ;
_Debug ( '1 RR FileSize KB [' + FileName + ']' ) ;
Size := -1 ;
If _Handle <> -1 Then Begin
   _Debug ( '2 RR FileSize KB [' + FileName + ']' ) ;
   Try
      _Debug ( '3 RR FileSize KB [' + FileName + ']' ) ;
      Size := LongInt ( FileSeek ( _Handle , Int64(0) , 2 ) DIV 1024 ) ;
//      Size := ( FileSeek ( _Handle , 0 , 2 ) DIV 1024 ) ;
      _Debug ( '4 RR FileSize KB [' + FileName + ']' ) ;
   Finally
      _Debug ( '5 RR FileSize KB [' + FileName + ']' ) ;
      FileClose ( _Handle ) ;
   End;
End ;
_Debug ( '6 RR FileSize KB [' + FileName + ']' ) ;
Result := Size ;
*)
_Debug ( 'FIM RR FileSize KB [' + FileName + ']' ) ;
End ;

Function RR_FileSize ( FileName : String ) : Int64 ;
Var RecDos : TSearchRec ;
Begin
_Debug ( 'INI RR_FileSize "' + FileName + '"' ) ;
If RR_FindFirst ( 'RR FileSize', FileName , 0 , RecDos ) = 0 Then Begin
   Result := RecDos.Size
End Else Begin
   Result := -1 ;
End ;
_Debug ( '2 RR_FileSize [SIZE=' + IntToStr ( RecDos.Size ) + ']' ) ;
SysUtils.FindClose ( RecDos ) ;
_Debug ( 'FIM RR_FileSize' ) ;
End ;

Function SQL_STR ( Aux : String ) : String ;
Begin
//Result := '''' + UTF8Encode ( Aux ) + '''' ;
Result := '''' + Aux + '''' ;
End ;

Function STR_SQL ( Aux : String ) : String ;
Begin
Result := SQL_STR ( Aux ) ;
End ;

Function DT_SQL ( Aux : TDateTime ) : String ;
Begin
//Result := '''' + DateTimeToStr(Aux) + '''' ;
Result := '''' + StrZero(YearOf(Aux),4) + '-' +
          StrZero(MonthOf(Aux),2) + '-' +
          StrZero(DayOf(Aux),2) + ' ' +
          StrZero(HourOf(Aux),2) + ':' +
          StrZero(MinuteOf(Aux),2) + ':' +
          StrZero(SecondOf(Aux),2) + '''' ;
End ;

Function DATE_SQL ( Aux : TDateTime ) : String ;
Begin
Result := '''' + StrZero(YearOf(Aux),4) + '-' +
          StrZero(MonthOf(Aux),2) + '-' +
          StrZero(DayOf(Aux),2) + '''' ;
End ;

Function TIME_SQL ( Aux : TDateTime ) : String ;
Begin
Result := '''' + StrZero(HourOf(Aux),2) + ':' +
          StrZero(MinuteOf(Aux),2) + ':' +
          StrZero(SecondOf(Aux),2) + '''' ;
End ;

Function BinToDec (Valor: String): Cardinal ;
Var Decimal : Cardinal ;
    x       : Integer ;
Begin
Decimal := 0 ;
For x := 1 To Length(valor) Do Begin
   Decimal := Decimal SHL 1 ;
   If Valor[x] = '1' Then Begin
      Decimal := Decimal + 1 ;
   End ;
End;
Result := Decimal ;
End;

Function DecToBin (Valor: Integer; Largura: LongInt): String ;
Var Binario : String ;
Begin
While Valor >= 1 Do Begin
   Binario := IntToStr(valor MOD 2) + Binario ;
   Valor := (Valor DIV 2) ;
End ;
Result := Binario ;
While Length(Result) < Largura Do Begin
   Result := '0' + Result ;
End ;
End ;

Function INT_TO_BIN ( B1, B2, B3, B4 : Cardinal ) : RawByteString ;
Var Local : LongInt ;
    Aux   : Cardinal ;
Begin
Result := '' ;
Aux := B1 ;
Aux := Aux * 256 ;
Aux := Aux + B2 ;
Aux := Aux * 256 ;
Aux := Aux + B3 ;
Aux := Aux * 256 ;
Aux := Aux + B4 ;
For Local := 1 To 32 Do Begin
   If ( Aux AND (1 SHL (32-Local)) ) > 0 Then Begin
      Result := Result + '1'
   End Else Begin
      Result := Result + '0' ;
   End ;
   If ( Local = 8 ) OR ( Local = 16 ) OR ( Local = 24 ) Then Begin
      Result := Result + '.' ;
   End ;
End ;
End ;

Function MES_STR_TO_INT ( Mes : String ) : LongInt ;
Begin
Mes := UpperCase ( Mes ) ;
If ( Mes = 'JAN' )                         Then Result := 1
Else If ( Mes = 'FEV' ) OR ( Mes = 'FEB' ) Then Result := 2
Else If ( Mes = 'MAR' )                    Then Result := 3
Else If ( Mes = 'ABR' ) OR ( Mes = 'APR' ) Then Result := 4
Else If ( Mes = 'MAI' ) OR ( Mes = 'MAY' ) Then Result := 5
Else If ( Mes = 'JUN' )                    Then Result := 6
Else If ( Mes = 'JUL' )                    Then Result := 7
Else If ( Mes = 'AGO' ) OR ( Mes = 'AUG' ) Then Result := 8
Else If ( Mes = 'SET' ) OR ( Mes = 'SEP' ) Then Result := 9
Else If ( Mes = 'OUT' ) OR ( Mes = 'OCT' ) Then Result := 10
Else If ( Mes = 'NOV' )                    Then Result := 11
Else If ( Mes = 'DEZ' ) OR ( Mes = 'DEC' ) Then Result := 12
Else
   Result := 0 ;
End ;

Function NOME_MES ( Mes : LongInt ) : String ;
Begin
Case Mes Of
1 : Result := 'Jan' ;
2 : Result := 'Fev' ;
3 : Result := 'Mar' ;
4 : Result := 'Abr' ;
5 : Result := 'Mai' ;
6 : Result := 'Jun' ;
7 : Result := 'Jul' ;
8 : Result := 'Ago' ;
9 : Result := 'Set' ;
10 : Result := 'Out' ;
11 : Result := 'Nov' ;
12 : Result := 'Dez' ;
Else
     Result := '---' ;
End ;
End ;

Function DT_UNIX_TO_DATETIME ( Mes, Dia, Aux : String ) : TDateTime ;
Var _Dia : Integer ;
    _Mes : Integer ;
    _Ano : Integer ;
    _Hor : TDateTime ;
Begin
Mes := UpperCase ( Mes ) ;
_Mes := MES_STR_TO_INT ( Mes ) ;
If _Mes = 0 Then Begin
   Result := EncodeDateTime ( 2000, 1, 1, 0, 0, 1, 0) ;
   Exit ;
End ;
_Dia := StrToIntDef ( Dia , 0 ) ;
If _Dia = 0 Then Begin
   Result := EncodeDateTime ( 2000, 1, 1, 0, 0, 2, 0) ;
   Exit ;
End ;
If Pos ( ':' , Aux ) > 0 Then Begin
   _Ano := YearOf ( Now ) ;
   _Hor := StrToTime ( Aux + ':01' ) ;
End Else Begin
   _Ano := StrToIntDef ( Aux , 0 ) ;
   _Hor := 1/SecsPerDay ;
End ;
Result := EncodeDateTime ( _Ano, _Mes, _Dia,
                           HourOf(_Hor), MinuteOf(_Hor), SecondOf(_Hor), 0) ;
End ;

Function TEXTO_RANDOMICO ( Qtde : LongInt ) : String ;
Begin
Result := '' ;
While Qtde > 0 Do Begin
   If Random(10)=0 Then Begin
      Result := Result + #32 ;
   End ;
   Result := Result + Chr(64+1+Random(26)) ;
   Dec ( Qtde ) ;
End ;
End ;

Function Super_UpCase ( Key : Char ) : Char ;
Const ORIGEM  = 'áéíóúãõñàèìòùâêîôûçäëïöü' ;
      DESTINO = 'ÁÉÍÓÚÃÕÑÀÈÌÒÙÂÊÎÔÛÇÄËÏÖÜ' ;
Begin
If Pos ( Key, ORIGEM ) > 0 Then Begin
   Key := DESTINO [ Pos ( Key, ORIGEM ) ] ;
End ;
Result := UpCase ( Key ) ;
End ;

Function Super_UpperCase ( Str : String ) : String ;
Var Local : LongInt ;
Begin
Result := '' ;
If Str = '' Then Begin
   Exit ;
End ;
For Local := 1 To Length ( Str ) Do Begin
   Result := Result + Super_UpCase ( Str[Local] ) ;
End ;
End ;

Function RETIRAR_EXTENSOES_AUDIO_VIDEO ( FN : String ) : String ;
Begin
Result := FN ;
Result := StringReplace ( Result , '.mp4', '', [rfReplaceAll, rfIgnoreCase] ) ;
Result := StringReplace ( Result , '.wmv', '', [rfReplaceAll, rfIgnoreCase] ) ;
Result := StringReplace ( Result , '.avi', '', [rfReplaceAll, rfIgnoreCase] ) ;
Result := StringReplace ( Result , '.wav', '', [rfReplaceAll, rfIgnoreCase] ) ;
End ;

Function RETIRAR_EXTENSOES_CC ( FN : String ) : String ;
Begin
Result := FN ;
Result := StringReplace ( Result , '.cc', '', [rfReplaceAll, rfIgnoreCase] ) ;
Result := StringReplace ( Result , '.PLT', '', [rfReplaceAll, rfIgnoreCase] ) ;
End ;

Function IS_ARQUIVO_PLT ( FN : String ) : Boolean ;
Begin
Result := ( UpperCase ( ExtractFileExt( FN ) ) = '.PLT' ) ;
End ;

Function IS_ARQUIVO_TC ( FN : String ) : Boolean ;
Begin
Result := ( UpperCase ( ExtractFileExt( FN ) ) = UpperCase ( DEF_EXTENSAO_CC ) ) ;
End ;

Function IS_ARQUIVO_VIDEO ( FN : String ) : Boolean ;
Var Ext : String ;
Begin
Ext := UpperCase ( ExtractFileExt( FN ) ) ;
Result := ( Ext = '.M4V' ) OR
          ( Ext = '.MXF' ) OR
          ( Ext = '.MOV' ) OR
          ( Ext = '.M4V' ) OR
          ( Ext = '.AVI' ) OR
          ( Ext = '.WMV' ) OR
          ( Ext = '.MP4' ) ;
End ;

Function IS_ARQUIVO_EXECUTAVEL ( FN : String ) : Boolean ;
Var Ext : String ;
Begin
Ext := UpperCase ( ExtractFileExt( FN ) ) ;
Result := ( Ext = '.EXE' ) OR
          ( Ext = '.COM' ) ;
End ;

Function IS_ARQUIVO_AUDIO ( FN : String ) : Boolean ;
Var Ext : String ;
Begin
Ext := UpperCase ( ExtractFileExt( FN ) ) ;
Result := ( Ext = '.WAV' ) OR
          ( Ext = '.MP3' ) OR
          ( Ext = '.AAC' ) OR
          ( Ext = '.WMA' ) OR
          ( Ext = '.PCM' ) ;
End ;

Function IS_ARQUIVO_IMAGEM ( FN : String ) : Boolean ;
Var Ext : String ;
Begin
Ext := UpperCase ( ExtractFileExt( FN ) ) ;
Result := ( Ext = '.BMP' ) OR
          ( Ext = '.TIFF' ) OR
          ( Ext = '.PNG' ) OR
          ( Ext = '.JPG' ) OR
          ( Ext = '.TGA' ) ;
End ;

Function IS_ARQUIVO_CC ( FN : String ) : Boolean ;
Begin
Result := ( UpperCase ( ExtractFileExt( FN ) ) = '.CC' ) ;
End ;

Function IS_ARQUIVO_TEXTO ( FN : String ) : Boolean ;
Var Ext : String ;
Begin
Ext := UpperCase ( ExtractFileExt( FN ) ) ;
Result := ( Ext = '.TXT' ) OR
          ( Ext = '.DAT' ) OR
          ( Ext = '.DOC' ) OR
          ( Ext = '.CVS' ) ;
End ;

Function MyMessageDlg ( Const Msg: String; DlgTypt: TmsgDlgType;
                        Button: TMsgDlgButtons;
                        Caption: Array Of String; dlgcaption: String ;
                        Var Resposta : Integer ) : Boolean ;
Var aMsgdlg      : TForm ;
    i            : Integer ;
    Dlgbutton    : Tbutton ;
    Captionindex : Integer ;
Begin
aMsgdlg := createMessageDialog(Msg, DlgTypt, Button) ;
aMsgdlg.Caption := dlgcaption ;
//aMsgdlg.BiDiMode := bdRightToLeft ;
Captionindex := 0 ;
For i := 0 To aMsgdlg.componentcount - 1 Do Begin
   If (aMsgdlg.components[i] IS Tbutton) Then Begin
      Dlgbutton := Tbutton(aMsgdlg.components[i]) ;
      If Captionindex <= High(Caption) Then Begin
         Dlgbutton.Caption := Caption[Captionindex] ;
      End ;
      Inc(Captionindex) ;
   End ;
End ;
Resposta := aMsgdlg.Showmodal ;
Result := Resposta = mrYes ;
End ;

Function CONFIRMAR_EXCLUSAO_DE_ARQUIVO ( FN : String ) : Boolean ;
Begin
Result := MyMessageDlg ( 'Confirma a exclusão de arquivo ?' + CRLF + FN ,
                         mtInformation, [mbYes, mbNo],
                         ['Sim','Não'], Title_RNews + ' - Confirmação', Resposta_Dialog ) ;
End ;

Function NEW_CONFIRMACAO ( Mensagem : String ) : Boolean ;
Begin
Result := MyMessageDlg ( Mensagem ,
                         mtInformation, [mbYes, mbNo],
                         ['Sim','Não'], Title_RNews + ' - Confirmação', Resposta_Dialog ) ;
End ;

Function GET_HOME_PATH : String ;
Begin
Result := INSERE_BARRA ( TPath.GetHomePath ) ;
End ;

Function GET_DOCUMENTS_PATH : String ;
Begin
Result := INSERE_BARRA ( TPath.GetDocumentsPath ) ;
End ;

Function GET_DESKTOP_PATH : String ;
Begin
Result := StringReplace ( INSERE_BARRA ( TPath.GetDocumentsPath ) , 'Documents', 'Desktop',
          [rfReplaceAll, rfIgnoreCase] ) ;
End ;

Function GET_PICTURES_PATH : String ;
Begin
Result := INSERE_BARRA ( TPath.GetPicturesPath ) ;
End ;

Function GET_MUSIC_PATH : String ;
Begin
Result := INSERE_BARRA ( TPath.GetMusicPath ) ;
End ;

Function GET_MOVIES_PATH : String ;
Begin
Result := INSERE_BARRA ( TPath.GetMoviesPath ) ;
End ;

Function GET_TEMP_PATH : String ;
Begin
Result := INSERE_BARRA ( TPath.GetTempPath ) ;
End ;

Function DIR_BASE_PROGRAMAS : String ;
Begin
//Result := INSERE_BARRA(Dir_Base) + 'Playlist\' ;
Result := DEF_BASE_PROGRAMAS_MASTER + 'Playlist\' ;
End;

Function DIR_BASE_SISTEMA : String ;
Begin
Result := INSERE_BARRA(Dir_Base) + 'Sistema\' ;
End ;

Function DIR_BASE_HD : String ;
Begin
Result := INSERE_BARRA(CONFIG_DIR_VIDEO_HD) ;
End ;

Function DIR_BASE_VIDEO_TRANSFERINDO : String ;
Begin
Result := INSERE_BARRA(CONFIG_DIR_VIDEO_TRANSFERINDO) ;
End ;

Function DIR_BASE_HD_AUTO : String ;
Begin
Result := INSERE_BARRA(CONFIG_DIR_VIDEO_HD) + 'AUTO\' ;
End ;

Function DIR_BASE_DOWNLOADS : String ;
Begin
Result := INSERE_BARRA(Dir_Base) + 'Downloads\' ;
End ;

Function DIR_BASE_CACHE: String ;
Begin
Result := DIR_BASE_SISTEMA + 'Cache\' ;
End ;

Function DIR_BASE_AUDIO: String ;
Begin
//Result := INSERE_BARRA(Dir_Base) + 'Media\Audio\' ;
Result := INSERE_BARRA ( CONFIG_DIR_AUDIO ) ;
End ;

Function DIR_BASE_VIDEO: String ;
Begin
//Result := INSERE_BARRA(Dir_Base) + 'Media\Video\' ;
Result := INSERE_BARRA ( CONFIG_DIR_VIDEO ) ;
End ;

Function DIR_BASE_VIDEO_META: String ;
Begin
//Result := INSERE_BARRA(Dir_Base) + 'Media\Video\' ;
Result := INSERE_BARRA ( CONFIG_DIR_VIDEO ) + 'Meta\' ;
End ;

Function DIR_BASE_DEPOSITO : String ;
Begin
Result := INSERE_BARRA(Dir_Base) + 'Video_Deposito\' ;
End ;

Function IS_HD_RICARDO : Boolean ;
Begin
Result := TRUE OR ( Pos ( Sys_Serial_C , '24C93DA1/' ) > 0 ) ;
End ;

Function IS_RICARDO : Boolean ;
Begin
Result := DirectoryUsable ( 'C:\Users\Ricardo\Dropbox\Programacao' ) OR
          DirectoryUsable ( 'C:\Users\Home\Dropbox\Programacao' ) OR
          DirectoryUsable  ( 'C:\Users\Douglas\Dropbox\Documentos' ) ;
End ;

Function RETORNAR_SERIAL_HD ( Aux : String ) : String ;
Var Chave : Int64 ;
Begin
Try
   Aux := StringReplace ( Aux , '.', '', [rfReplaceAll, rfIgnoreCase] ) ;
   Aux := StringReplace ( Aux , '-', '', [rfReplaceAll, rfIgnoreCase] ) ;
   If Pos ( '$' , Aux ) = 0 Then Begin
      Aux := '$' + Aux ;
   End ;
   Chave := StrToInt64( Aux ) ;
   //ShowMessage_Old ( '[' + Aux + ']' + CRLF +
   //              IntToStr ( Chave ) ) ;
   Chave := Chave - $4716720000000000 ;
   Chave := ( Chave - ( 24 * 1 * 1999 ) ) DIV 13 ;
   Chave := ( Chave - ( 29 * 5 * 1972 ) ) DIV 17 ;
   Result := IntToHex ( Chave , 8 ) ;
Except
   Result := '00000000' ;
End ;
End ;

Function GERAR_CODIGO_CC_PARA_HD_SERIAL ( Serial : String ) : String ;
Var _Serial : Int64 ;
    Aux     : String ;
    Local   : LongInt ;
Begin
If Pos ( '$' , Serial ) = 0 Then
   Serial := '$' + Serial ;
_Serial := ( StrToInt64 ( Serial ) * 17 + ( 29 * 5 * 1972 ) ) * 13 + ( 24 * 1 * 1999 ) +
           $4716720000000000 ;
Aux := IntToHex ( _Serial , 16 ) ;
Result := '' ;
For Local := 1 To Length ( Aux ) Do Begin
   Result := Result + Aux[Local] ;
   If ( ( Local MOD 4 ) = 0 ) AND ( Local < 16 ) Then Begin
       Result := Result + '.' ;
   End ;
End ;
{
PUT_LOG ( //IntToStr ( _Serial ) + CRLF +
          Result + CRLF +
          RETORNAR_SERIAL_HD ( Result ) ) ;
}
End ;

Function INVERTE_STRING ( S : String ) : String ;
Var Local : LongInt ;
Begin
Result := S ;
If Result = '' Then Begin
   Exit ;
End ;
Result := '' ;
For Local := 1 To Length ( S ) Do Begin
   Result := S[Local] + Result ;
End ;
End ;

Function GET_SERIAL_MASTER : Boolean ;
Var Aux : String ;
Begin
Aux := InputBox ( 'Acesso', 'Acesso:', '' ) ;
Result := ( Aux = INVERTE_STRING ( 'BB8092rr' ) ) ;
End ;

Function GERAR_CHAVE_CC_PELO_SERIAL_HD ( Aux : String ) : String ;
Begin
If Aux = '' Then Begin
   Aux := InputBox ( 'Serial do HD C:', 'Número de série:', Sys_Serial_C ) ;
End ;
If Aux = '' Then Begin
   Exit ;
End ;
Result := GERAR_CODIGO_CC_PARA_HD_SERIAL ( '$' + Aux ) ;
End ;

Function VALIDAR_CHAVE_CC_SERIAL_HD ( Chave : String ) : Boolean ;
Begin
Result := RETORNAR_SERIAL_HD ( Chave ) = Sys_Serial_C ;
End ;

Function GET_INFO_VOLUME ( Letra : Char ;
                           Var _Volume : String ; Var _Serial : String ;
                           Var _FileSystem : String ) : String ;
Var SLabel        ,
    SSysName      : PChar ;
    Serial        ,
    FileNameLen   ,
    X             : DWord ;
Begin
Result := '' ;
GetMem ( SLabel , 255 ) ;
GetMem ( SSysName , 255 ) ;
_Volume := '' ;
_Serial := '' ;
_FileSystem := '' ;
Try
   GetVolumeInformation ( PChar ( Letra + ':\' ) , SLabel , 255 , @Serial ,
                          FileNameLen , X , SSysName , 255 ) ;
   _Volume := String ( SLabel ) ;
   _Serial := IntToHex ( Serial, 8 ) ;
   _FileSystem := String ( SSysName ) ;
   Result := Result +
             '#VOLUME=' + _Volume + CRLF +
             '#SERIAL=' + _Serial + CRLF +
             '#MAXLENGTH=' + IntToStr ( FileNameLen ) + CRLF +
             '#FILESYSTEM=' + _FileSystem ;
Finally
   FreeMem ( SLAbel , 255 ) ;
   FreeMem ( SSysName , 255 ) ;
End ;
End;

Function DEF_EXTENSAO_CC : String ;
Begin
Result := '.PLT' ;
End ;

Function Explode_Simples (str , separador : String ) : TStringList ;
Var p : Integer ;
Begin
Result := TStringList.Create ;
p := Pos(separador, str) ;
While (p > 0) Do Begin
   Result.Add(Copy(str, 1, p-1)) ;
   Delete(str, 1, p + Length(separador) - 1) ;
   p := Pos(separador, str) ;
End ;
If str <> '' Then Begin
   Result.Add ( str ) ;
End ;
End ;

Procedure PRINT_LOG_FORMAT_SETTINGS ;
//var FormatSettings : TFormatSettings ;
Begin
//FormatSettings := TFormatSettings.Create(GetThreadLocale); // Or one of the overloads
PUT_LOG ( 'FormatSettings.TimeSeparator [' + SysUtils.FormatSettings.TimeSeparator + ']' ) ;
PUT_LOG ( 'FormatSettings.ThousandSeparator [' + SysUtils.FormatSettings.ThousandSeparator + ']' ) ;
PUT_LOG ( 'FormatSettings.DecimalSeparator [' + SysUtils.FormatSettings.DecimalSeparator + ']' ) ;
PUT_LOG ( 'FormatSettings.DateSeparator [' + SysUtils.FormatSettings.DateSeparator + ']' ) ;
PUT_LOG ( 'FormatSettings.ShortDateFormat [' + SysUtils.FormatSettings.ShortDateFormat + ']' ) ;
PUT_LOG ( 'FormatSettings.LongTimeFormat [' + SysUtils.FormatSettings.LongTimeFormat + ']' ) ;
End ;

Procedure PADRAO_BRASILEIRO_MINI ( Origem : String ) ;
//var FormatSettings : TFormatSettings ;
Begin
//PUT_LOG ( 'PADRAO_BRASILEIRO_MINI [' + Origem + ']' ) ;
//SysUtils.FormatSettings := TFormatSettings.Create(GetThreadLocale); // Or one of the overloads
SysUtils.FormatSettings.TimeSeparator := ':' ;
SysUtils.FormatSettings.ThousandSeparator := '.' ;
SysUtils.FormatSettings.DecimalSeparator := ',' ;
SysUtils.FormatSettings.DateSeparator := '/' ;
SysUtils.FormatSettings.ShortDateFormat := 'dd/mm/yyyy' ;
SysUtils.FormatSettings.LongTimeFormat := 'hh:mm:ss' ;
Application.UpdateFormatSettings := FALSE ;
Application.UpdateMetricSettings := FALSE ;
End ;

Function SegundosToMMSS ( Aux : LongInt ) : String ;
Begin
If Aux < 0 Then Begin
   Result := '00:00' ;
   Exit ;
End ;
If Aux >= (999*3600) Then Begin
   Result := '00:00' ;
   Exit ;
End ;
//Result := StrZero ( Aux DIV 3600 , IIFN ( ( Aux DIV 3600 ) > 99 , 3 , 2 ) ) + ':' +
Result := StrZero ( Aux DIV 60 , 2 ) + ':' +
          StrZero ( Aux MOD 60 , 2 ) ;
End ;

Function SegundosToHHHMMSS ( Aux : LongInt ) : String ;
Begin
If Aux < 0 Then Begin
   Result := '00:00:00' ;
   Exit ;
End ;
If Aux >= (999*3600) Then Begin
   Result := '000:00:00' ;
   Exit ;
End ;
//Result := StrZero ( Aux DIV 3600 , IIFN ( ( Aux DIV 3600 ) > 99 , 3 , 2 ) ) + ':' +
Result := StrZero ( Aux DIV 3600 , 3 ) + ':' +
          StrZero ( ( Aux MOD 3600 ) DIV 60 , 2 ) + ':' +
          StrZero ( Aux MOD 60 , 2 ) ;
End ;

Function HHMMSSMMM_2 ( Valor : Double ) : String ;
Var _Int : LongInt ;
Begin
_Int := TRUNC ( Valor ) ;
Result := SegundosToHHHMMSS(_Int) + '.' + StrZero(TRUNC(Frac(Valor)*1000),3) ;
End ;

Function HHHMMSSM ( Valor : Double ) : String ;
Var _Int : LongInt ;
Begin
_Int := TRUNC ( Valor ) ;
Result := SegundosToHHHMMSS(_Int) + ',' + StrZero(TRUNC(Frac(Valor)*10),1) ;
End ;

Function HHMMSSMMM ( Valor : Double ) : String ;
Var _Int : LongInt ;
Begin
_Int := TRUNC ( Valor ) ;
Result := SegundosToHHMMSS(FALSE,_Int) + '.' + StrZero(TRUNC(Frac(Valor)*1000),3) ;
End ;

Function HHMMSS ( Valor : Double ) : String ;
Var _Int : LongInt ;
Begin
_Int := TRUNC ( Valor ) ;
Result := SegundosToHHHMMSS(_Int) ;
End ;

Function MMSS ( Valor : LongInt ) : String ;
Var _Int : LongInt ;
Begin
If Valor >= (99*60) Then Begin
   Valor := 99 * 60 - 1 ;
End ;
_Int := TRUNC ( Valor ) ;
Result := SegundosToMMSS(_Int) ;
End ;

Function HHMMSS_REGRESSIVA ( Valor : Double ) : String ;
Var _Int : LongInt ;
Begin
_Int := TRUNC ( Valor ) ;
Result := HHMMSS(_Int) ;
End ;

Function StrToFloat_RR2 ( Valor : String ; Default : Double ) : Double ;
Begin
Try
   Result := StrToFloat ( Valor ) ;
Except
   If Pos ( '.', Valor ) > 0 Then Begin
      While Pos ( '.', Valor ) > 0 Do Valor [ Pos ( '.', Valor ) ] := ',' ;
   End ;
   Try
      Result := StrToFloat ( Valor ) ;
   Except
      Result := Default ;
   End ;
End ;
End ;

Function HHHMMSSMMM_To_Double ( TC : String ) : Double ;
Var Lista : TStringList ;
Begin
TC := Trim ( TC ) ;
Result := 0 ;
If Length(TC)<5 Then Begin
   Exit ;
End ;
Lista := Explode_Simples ( TC, ':' ) ;
While Lista.Count < 3 Do Begin
   Lista.Insert(0, '0' ) ;
End ;
Try
   Result := StrToIntDef(Lista[0],0) * 3600 +
             StrToIntDef(Lista[1],0) * 60 +
             StrToFloat_RR2(Lista[2],0) ;
Except
   On E : Exception Do Begin
      Result := 0 ;
   End ;
End ;
Lista.Free ;
End ;

Procedure PADRAO_BRASILEIRO ( Origem : String ) ;
Begin
PADRAO_BRASILEIRO_MINI ( 'PADRAO_BRASILEIRO/' + Origem ) ;
//ShortMonthNames [ 01 ] := 'Jan' ;
//ShortMonthNames [ 02 ] := 'Fev' ;
//ShortMonthNames [ 03 ] := 'Mar' ;
//ShortMonthNames [ 04 ] := 'Abr' ;
//ShortMonthNames [ 05 ] := 'Mai' ;
//ShortMonthNames [ 06 ] := 'Jun' ;
//ShortMonthNames [ 07 ] := 'Jul' ;
//ShortMonthNames [ 08 ] := 'Ago' ;
//ShortMonthNames [ 09 ] := 'Set' ;
//ShortMonthNames [ 10 ] := 'Out' ;
//ShortMonthNames [ 11 ] := 'Nov' ;
//ShortMonthNames [ 12 ] := 'Dez' ;
//LongMonthNames [ 01 ] := 'Janeiro' ;
//LongMonthNames [ 02 ] := 'Fevereiro' ;
//LongMonthNames [ 03 ] := 'Março' ;
//LongMonthNames [ 04 ] := 'Abril' ;
//LongMonthNames [ 05 ] := 'Maio' ;
//LongMonthNames [ 06 ] := 'Junho' ;
//LongMonthNames [ 07 ] := 'Julho' ;
//LongMonthNames [ 08 ] := 'Agosto' ;
//LongMonthNames [ 09 ] := 'Setembro' ;
//LongMonthNames [ 10 ] := 'Outubro' ;
//LongMonthNames [ 11 ] := 'Novembro' ;
//LongMonthNames [ 12 ] := 'Dezembro' ;
//ShortDayNames [ 1 ] := 'Dom' ;
//ShortDayNames [ 2 ] := 'Seg' ;
//ShortDayNames [ 3 ] := 'Ter' ;
//ShortDayNames [ 4 ] := 'Qua' ;
//ShortDayNames [ 5 ] := 'Qui' ;
//ShortDayNames [ 6 ] := 'Sex' ;
//ShortDayNames [ 7 ] := 'Sáb' ;
//LongDayNames [ 1 ] := 'Domingo' ;
//LongDayNames [ 2 ] := 'Segunda' ;
//LongDayNames [ 3 ] := 'Terça' ;
//LongDayNames [ 4 ] := 'Quarta' ;
//LongDayNames [ 5 ] := 'Quinta' ;
//LongDayNames [ 6 ] := 'Sexta' ;
//LongDayNames [ 7 ] := 'Sábado' ;
//Application.UpdateFormatSettings := FALSE ;
//Application.UpdateMetricSettings := FALSE ;
End ;

(*
Procedure CLOSE_ALL_TASKS ;
Var Local : LongInt ;
    Qtde  : LongInt ;
Begin
Qtde := Length ( Tasks ) ;
If Qtde = 0 Then Begin
   Exit ;
End ;
For Local := 0 To Qtde - 1 Do Begin
   If Tasks[Local].Status = TTaskStatus.Running Then Begin
      Tasks[Local].Cancel ;
   End ;
End ;
If Sup.Task_Alter_Volume.Status = TTaskStatus.Running Then Begin
   Sup.Task_Alter_Volume.Cancel ;
End ;
If Sup.Task_Get_Volume.Status = TTaskStatus.Running Then Begin
   Sup.Task_Get_Volume.Cancel ;
End ;
If Sup.Task_System_Info.Status = TTaskStatus.Running Then Begin
   Sup.Task_System_Info.Cancel ;
End ;
If Sup.Task_Drives.Status = TTaskStatus.Running Then Begin
   Sup.Task_Drives.Cancel ;
End ;
If Sup.Task_Ping.Status = TTaskStatus.Running Then Begin
   Sup.Task_Ping.Cancel ;
End ;
CLOSE_ALL_TASKS_VIDEOS ;
End ;

procedure CLOSE_ALL_TASKS_VIDEOS ;
Var Local : LongInt ;
Begin
If Length ( Task_GetDosOutput ) > 0 Then Begin
   For Local := 0 To Length ( Task_GetDosOutput ) - 1 Do Begin
      If Task_GetDosOutput[Local].Status = TTaskStatus.Running Then Begin
         Task_GetDosOutput[Local].Cancel ;
      End ;
   End ;
End ;
SetLength ( Task_GetDosOutput, 0 ) ;
End ;
*)

Procedure INICIALIZACAO_ULTRA_BASICA ;
Begin
Last_Log := GetTickCount ;
SL_Inibicao_Reload_FN := TStringList.Create ;
SL_DESCONSIDERAR_ARQUIVOS := TStringList.Create ;
_Debug ( 'INI INICIALIZACAO ULTRA_BASICA' ) ;
//INICIALIZAR_ARRAY_DIRETORIO ( -1 ) ;
//SetLength ( Tasks, 0 ) ;
//SetLength ( Cache_Gravacao, 0 ) ;
Flag_Mudanca_de_Hora := FALSE ;
Last_Mudanca_de_Hora := HourOf ( Now ) ;
SL_Arqivos_CEF := TStringList.Create ;
SL_Arqivos_LibAV := TStringList.Create ;
//CARREGAR_ARQUIVOS_CEF ;
//CARREGAR_ARQUIVOS_LIBAV ;
SL_HTTP := TStringList.Create ;
Sys_Usuario_Aplicativo.Usuario := '-' ;
Sys_Usuario_Aplicativo.c_xLogin := Now ;
SL_Dicionario_MM := TStringList.Create ;
SetLength ( A_Write_Delay, 0 ) ;
SL_Lista_Geral                  := TStringList.Create ;
_Debug ( '1 INICIALIZACAO ULTRA_BASICA' ) ;
// NW
SL_Carregando_Sistema := TStringList.Create ;
SL_Carregando_Sistema_Total := TStringList.Create ;
_Debug ( '2 INICIALIZACAO ULTRA_BASICA' ) ;
PADRAO_BRASILEIRO_MINI ( 'INICIALIZACAO_ULTRA_BASICA' ) ;
PADRAO_BRASILEIRO ( 'INICIALIZACAO_ULTRA_BASICA' ) ;
Randomize ;
Diretorio := INSERE_BARRA ( ExtractFilePath ( ParamStr(0) ) ) ;
SL_Batch := TStringList.Create ;
GET_INFO_VOLUME ( 'C' , Sys_Volume_C , Sys_Serial_C , Sys_FileSystem_C ) ;
_Debug ( 'FIM INICIALIZACAO ULTRA_BASICA' ) ;
End ;

Function COMPLETEC ( _String : String ; Casas : Word ) : String ;
Var Ordem : LongInt ;
Begin
Ordem := 0 ;
While Length ( _String ) < Casas Do Begin
   If Odd ( Ordem ) Then Begin
      _String := #32 + _String
   End Else Begin
      _String := _String + #32 ;
   End ;
   Inc ( Ordem ) ;
End ;
Result := Copy ( _String , 1 , Casas ) ;
End ;

Function COMPLETEL ( _String : String ; Casas : Word ) : String ;
Begin
While Length ( _String ) < Casas Do Begin
   _String := #32 + _String ;
End ;
Result := Copy ( _String , 1 , Casas ) ;
End ;

Function COMPLETEL_CUT ( _String : String ; Casas : Word ) : String ;
Begin
While Length ( _String ) < Casas Do Begin
   _String := #32 + _String ;
End ;
Result := Copy ( _String , 1 , Casas ) ;
End ;

Function COMPLETE_PONTOS ( _String : String ; Casas : Word ) : String ;
Begin
While Length ( _String ) < Casas Do Begin
   _String := _String + '.' ;
End ;
Result := Copy ( _String , 1 , Casas ) ;
End ;

Function COMPLETE_PONTOS_L ( _String : String ; Casas : Word ) : String ;
Begin
While Length ( _String ) < Casas Do Begin
   _String := '.' + _String ;
End ;
Result := Copy ( _String , 1 , Casas ) ;
End ;

Function COMPLETEP ( _String : String ; Casas : Word ) : String ;
Begin
If Trim ( _String ) = '-' Then Begin
   _String := '' ;
End ;
{
If Trim ( _String ) <> '' Then
   _String := _String + #32 ;
}
While Length ( _String ) < Casas Do Begin
   _String := _String + '.' ;
End ;
Result := Copy ( _String , 1 , Casas ) ;
End ;

Function COMPLETE ( _String : String ; Casas : Word ) : String ;
Begin
While Length ( _String ) < Casas Do Begin
   _String := _String + #32 ;
End ;
Result := Copy ( _String , 1 , Casas ) ;
End ;

Function COMPLETEN ( _Valor : LongInt ; Casas : Word ) : String ;
Var _String : String ;
Begin
_String := IntToStr ( _Valor ) ;
While Length ( _String ) < Casas Do Begin
   _String := _String + #32 ;
End ;
Result := Copy ( _String , 1 , Casas ) ;
End ;

Function COMPLETE_CUT ( _String : String ; Casas : Word ) : String ;
Begin
While Length ( _String ) < Casas Do Begin
   _String := _String + #32 ;
End ;
Result := Copy ( _String , 1 , Casas ) ;
End ;

Function Is_Float ( _Valor : Real ) : Boolean ;
Begin
Result := TRUE ;
End ;

Function CASA_X ( _Valor : Real ; Casas : LongInt ) : String ;
Begin
Assert ( Casas >= 0 ) ;
Try
   Result := '' ;
   If NOT IS_Float ( _Valor ) Then Begin
      Exit ;
   End ;
   Try
     //Result := Trim ( FloatToStrF ( _Valor , ffFixed , 10 , Casas ) ) ;
     Result := Trim ( FloatToStrF(_Valor, ffFixed, 15, Casas) ) ;
   Except
     Result := '' ;
   End ;
Except
   Result := '' ;
End ;
End ;

Function CASA_X_DOUBLE ( _Valor : Double ; Casas : LongInt ) : String ;
Begin
Try
   Result := '' ;
   If NOT IS_Float ( _Valor ) Then Begin
      Exit ;
   End ;
   Try
     Result := Trim ( FloatToStrF ( _Valor , ffFixed , 10 , Casas ) ) ;
   Except
     Result := '' ;
   End ;
Except
   Result := '' ;
End ;
End ;

Function CASA_0 ( _Valor : Real ) : String ;
Begin
Result := CASA_X ( _Valor , 0 ) ;
End ;

Function CASA_1 ( _Valor : Real ) : String ;
Begin
Result := CASA_X ( _Valor , 1 ) ;
End ;

Function CASA_1V ( _Valor : Real ) : String ;
Begin
Result := CASA_X ( _Valor , 1 ) ;
Result := StringReplace ( Result, '.', ',', [rfReplaceAll] ) ;
End ;

Function CASA_TEMP ( _Valor : Real ; _Word : Boolean ) : String ;
Begin
If _Word Then Begin
   CASA_TEMP := Trim ( IntToStr ( TRUNC ( _Valor * 4096 / 50 ) ) )
End Else Begin
   CASA_TEMP := Trim ( FloatToStrF ( _Valor * 10 , ffFixed , 10 , 1 ) ) ;
End ;
If _Valor < 1 Then Begin
   CASA_TEMP := '' ;
End ;
End ;

Function CASA_1_TEMP ( _Valor : Real ) : String ;
Begin
CASA_1_TEMP := Trim ( FloatToStrF ( _Valor , ffFixed , 10 , 1 ) ) ;
If _Valor < 1 Then Begin
   CASA_1_TEMP := '' ;
End ;
End ;

Function CASA_2 ( _Valor : Real ) : String ;
Begin
Result := CASA_X ( _Valor , 2 ) ;
End ;

Function CASA_3 ( _Valor : Real ) : String ;
Begin
Result := CASA_X ( _Valor , 3 ) ;
End ;

Function CASA_4 ( _Valor : Real ) : String ;
Begin
Result := CASA_X ( _Valor , 4 ) ;
End ;

Function CASA_5 ( _Valor : Real ) : String ;
Begin
Result := CASA_X ( _Valor , 5 ) ;
End ;

Function CASA_6 ( _Valor : Real ) : String ;
Begin
Result := CASA_X ( _Valor , 6 ) ;
End ;

Function CASA_7 ( _Valor : Real ) : String ;
Begin
Result := CASA_X ( _Valor , 7 ) ;
End ;

Function CASA_8 ( _Valor : Real ) : String ;
Begin
Result := CASA_X ( _Valor , 8 ) ;
End ;

Function EXTRAIR_CONTEUDO ( _Cmd : String ; _Chave : String ; Var Residuo : String ) : String ;
Var Pos_Ini : LongInt ;
    _Ini    : String ;
    _Fim    : String ;
    Pos_Fim : LongInt ;
Begin
Result := '' ;
While Pos ( '<' , _Chave ) > 0 Do Begin
    Delete ( _Chave , Pos ( '<' , _Chave ) , 1 ) ;
End ;
While Pos ( '>' , _Chave ) > 0 Do Begin
    Delete ( _Chave , Pos ( '>' , _Chave ) , 1 ) ;
End ;
_Ini := _Chave ;
If _Ini = 'INI' Then Begin
   _Fim := 'FIM'
End Else Begin
   _Fim := '/' + _Chave ;
End ;
_Ini := '<' + _Ini + '>' ;
_Fim := '<' + _Fim + '>' ;
Pos_Ini := Pos ( _Ini , _Cmd ) ;
Pos_Fim := Pos ( _Fim , _Cmd ) ;
Residuo := _Cmd ;
If ( Pos_Ini > 0 ) AND
   ( Pos_Fim > 0 ) AND
   ( Pos_Fim > Pos_Ini ) Then Begin
   Delete ( _Cmd , 1 , Pos_Ini + Length ( _Ini ) - 1 ) ;
   Residuo := _Cmd ;
   Pos_Fim := Pos ( _Fim , _Cmd ) ;
   Delete ( _Cmd , Pos_Fim , Length ( _Cmd ) ) ;
   Delete ( Residuo , 1 , Pos_Fim + Length ( _Fim ) - 1 ) ;
   Result := _Cmd ;
End ;
End ;

// ===============================

Function DataInversa ( DataHora : TDateTime ) : String ;
Begin
Result := Copy ( DateToStr ( DataHora ) , 7 , 4 ) +
          Copy ( DateToStr ( DataHora ) , 4 , 2 ) +
          Copy ( DateToStr ( DataHora ) , 1 , 2 ) ;
End ;

Function STRING_HEXA_SIMPLES ( _Str : String ) : String ;
Var Local : LongInt ;
Begin
Result := '' ;
If _Str = '' Then Begin
   Exit ;
End ;
For Local := 1 To Length ( _Str ) Do Begin
   Result := Result + IntToHex ( Ord ( _Str[Local] ) , 2 ) ;
End ;
_Str := '' ;
End ;

Procedure CARREGAR_CONFIGURACAO_FILENAME ( Form : TForm ; _FileName : String ) ;
Var Ini       : TMemIniFile ;
    Local     ,
    Local2    : LongInt ;
    _Linha    ,
    _Coluna   : LongInt ;
    Aux       : String ;
    _FN2      : String ;
    _Tag      : String ;
Begin
If Form = Nil Then Begin
   Exit ;
End ;
Try
   If _FileName = '' Then Begin
      _FileName := Diretorio + 'Config\' + Form.Name + '.INI' ;
   End ;
   If NOT RR_FileExists ( 'CARREGAR_CONFIGURACAO_FILENAME/1', _FileName ) Then Begin
      CHECAR_DIRETORIO_FILENAME ( _FileName ) ;
      WRITE_FILE_CORE ( 'CARREGAR_CONFIGURACAO_FILENAME',
                        _FileName, '', DELAYED_FALSE ) ;
   End ;
   Ini := TMemIniFile.Create ( _FileName ) ;
   With Form, Ini Do Begin
     // Carregar componentes
     For Local := 0 To ComponentCount - 1 Do Begin
        If Components[Local] Is TListBox Then Begin
           (Components[Local] As TListBox).Items.Clear ;
           _FN2 := INSERE_BARRA ( ExtractFilePath ( _FileName ) ) +
                   UpperCase ( Components[Local].Name ) + '.DAT' ;
           If RR_FileExists ( 'CARREGAR_CONFIGURACAO_FILENAME/2', _FN2 ) Then Begin
              (Components[Local] As TListBox).Items.Text :=
                    GET_CONTEUDO_M ( 'CARREGAR_CONFIGURACAO_FILENAME/1', _FN2 ) ;
           End ;
        End ;
        If Components[Local] Is TCheckBox Then Begin
           (Components[Local] As TCheckBox).Checked := ReadBool ( 'CHECKBOXES' ,
                       UpperCase ( Components[Local].Name ) , Components[Local].Tag = 1 ) ;
        End ;
        If Components[Local] Is TEdit Then Begin
           _Tag := IntToStr ( (Components[Local] As TEdit).Tag ) ;
           If _Tag = '0' Then Begin
              _Tag := '' ;
           End ;
           (Components[Local] As TEdit).Text := ReadString ( 'TEDITS' ,
                                                UpperCase ( Components[Local].Name ) , _Tag ) ;
        End ;
        If Components[Local] Is TLabeledEdit Then Begin
           (Components[Local] As TLabeledEdit).Text := DECODIFICAR_STRING ( ReadString ( 'TLABELEDEDITS' ,
                       UpperCase ( Components[Local].Name ) , '-' ) ) ;
        End ;
        //If Components[Local] Is TDirectoryEdit Then
        //   (Components[Local] As TDirectoryEdit).Text := ReadString ( 'TDIRECTORYEDIT' ,
        //               UpperCase ( Components[Local].Name ) , '-' ) ;
        If Components[Local] Is TSpinEdit Then Begin
           (Components[Local] As TSpinEdit).Value := ReadInteger ( 'TSPINEDITS' ,
                      UpperCase ( Components[Local].Name ) , Components[Local].Tag ) ;
        End ;
        //If Components[Local] Is TTrackBar Then
        //   (Components[Local] As TTrackBar).Position := ReadInteger ( 'TTRACKBAR' ,
        //               UpperCase ( Components[Local].Name ) , Components[Local].Tag ) ;
        //If Components[Local] Is TRxSpinEdit Then
        //   (Components[Local] As TRxSpinEdit).Value := ReadInteger ( 'TRXSPINEDITS' ,
        //               UpperCase ( Components[Local].Name ) , 0 ) / 10 ;
        If Components[Local] Is TShape Then Begin
           (Components[Local] As TShape).Brush.Color := ReadInteger ( 'TSHAPES' ,
                       UpperCase ( Components[Local].Name ) ,
                       (Components[Local] As TShape).Tag ) ;
        End ;
        If Components[Local] Is TPanel Then Begin
           (Components[Local] As TPanel).Brush.Color := ReadInteger ( 'TPANELS' ,
                       UpperCase ( Components[Local].Name ) , clWhite ) ;
           {
           PUT_LOG ( UpperCase ( Components[Local].Name ) + CRLF +
                     IntToStr ( (Components[Local] As TPanel).Brush.Color ) ) ;
           }
        End ;
        //If Components[Local] Is TRxSlider Then
        //   (Components[Local] As TRxSlider).Value := ReadInteger ( 'TRXSLIDER' ,
        //               UpperCase ( Components[Local].Name ) , Components[Local].Tag ) ;
        If Components[Local] Is TRadioGroup Then Begin
           (Components[Local] As TRadioGroup).ItemIndex := ReadInteger ( 'TRADIOGROUP' ,
                       UpperCase ( Components[Local].Name ) , Components[Local].Tag ) ;
        End ;
        If Components[Local] Is TComboBox Then Begin
           (Components[Local] As TComboBox).ItemIndex := ReadInteger ( 'TCOMBOBOX' ,
                       UpperCase ( Components[Local].Name ) , Components[Local].Tag ) ;
        End ;
        //If Components[Local] Is TFileNameEdit Then
        //   (Components[Local] As TFileNameEdit).FileName := ReadString ( 'TFILENAMEDIT' ,
        //               UpperCase ( Components[Local].Name ) , Diretorio + 'Mapa\' + 'RJ.WMF' ) ;
        If Components[Local] Is TStringGrid Then Begin
           For _Linha := 1 To (Components[Local] As TStringGrid).RowCount - 1 Do Begin
             For _Coluna := 1 To (Components[Local] As TStringGrid).ColCount - 1 Do Begin
                 (Components[Local] As TStringGrid).Cells[_Coluna,_Linha] :=
                      ReadString ( UpperCase ( (Components[Local] As TStringGrid).Name ) ,
                                               StrZero ( _Linha , 3 ) + '_' + StrZero ( _Coluna , 3 ) ,
                                               '' ) ;
             End ;
           End ;
        End ;
        If Components[Local] Is TMemo Then Begin
           (Components[Local] As TMemo).Lines.Clear ;
           For Local2 := 0 To 30 Do Begin
              Aux := ReadString ( (Components[Local] As TMemo).Name ,
                                  'LINE_' + StrZero ( Local2 , 3 ) , '' ) ;
              If Aux <> '' Then Begin
                 (Components[Local] As TMemo).Lines.Add ( Aux ) ;
              End  ;
           End ;
        End ;
     End ;
     //CB_BaudRate_COM1.ItemIndex := ReadInteger ( 'SERIAL' , 'BAUDRATE' , 3 ) ;
     //ED_USER_PASSWORD.Text := DECODIFICA_SENHA ( ReadString ( 'TEDITS' , 'ED_USER_PASSWORD' , CODIFICA_SENHA ( 'tvm00015' ) ) ) ;
     //CK_Manter_Conexoes_TCP_4000.Checked := TRUE ;
   End ;
   Ini.UpdateFile ;
   Ini.Free ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception CARREGAR_CONFIGURACAO_FILENAME [' + E.Message + ']' ) ;
   End ;
End ;
End ;

Function IS_STRING_CODIFICADA ( _Str : String ) : Boolean ;
Begin
Result := FALSE ;
If Length ( _Str ) < Length ( SYNC_STRING_CODIFICADA ) Then Begin
   Exit ;
End ;
Result := ( Pos ( SYNC_STRING_CODIFICADA , _Str ) = 1 ) ;
End ;

Function DECODIFICAR_STRING ( _Str : String ) : String ;
Var _Word : Word ;
Begin
Result := _Str ;
If NOT IS_STRING_CODIFICADA ( _Str ) Then Begin
   Exit ;
End ;
Delete ( _Str , 1 , Length ( SYNC_STRING_CODIFICADA ) ) ;
Result := '' ;
While Length ( _Str ) >= 4 Do Begin
   _Word := StrToIntDef ( '$' + Copy ( _Str , 1 , 4 ) , 0 ) ;
   _Word := _Word - $2008 ;
   _Word := ( _Word SHR 5 ) AND $00FF ;
   Delete ( _Str , 1 , 4 ) ;
   Result := Result + Chr ( _Word ) ;
End ;
End ;

Function CODIFICAR_STRING ( _Str : String ) : String ;
Var Local   : LongInt ;
    _Word   : Word ;
    _Random : Word ;
Begin
Result := _Str ;
If IS_STRING_CODIFICADA ( _Str ) Then Begin
   Exit ;
End ;
Result := '' ;
If Length ( _Str ) > 0 Then Begin
   For Local := 1 To Length ( _Str ) Do Begin
      _Word := Ord ( _Str [ Local ] ) ;
      _Word := _Word SHL 5 ;
      _Random := Random ( $7FFF ) AND $E01F ; // 1110.0000.0001.1111
      _Word := ( _Word OR _Random ) ;
      _Word := _Word + $2008 ;
      Result := Result + IntToHex ( _Word , 4 ) ;
   End ;
End ;
Result := SYNC_STRING_CODIFICADA + Result ;
End ;

Procedure SALVAR_CONFIGURACAO_FILENAME ( Form : TForm ; _FileName : String ;
                                         Var Conteudo : String ;
                                         Var Conteudo_Avancado : String ) ;
Var Ini       : TMemIniFile ;
    Campo     : String ;
    Tipo      : String ;
    Valor_Str : String ;
    Local     ,
    Local2    : LongInt ;
    _Linha    ,
    _Coluna   : LongInt ;
    _FN2      : String ;
    Bak       : String ;
Begin
If Form = Nil Then
   Exit ;
Try
   //ShowMessage_Old ( '1:' + LF + _FileName ) ;
   If _FileName = '' Then Begin
      _FileName := Diretorio + 'Config\' + Form.Name + '.INI' ;
   End ;
   //ShowMessage_Old ( '2:' + LF + _FileName ) ;
   //ShowMessage_Old ( 'Salvar: "' + _FileName + '"' ) ;
   CHECAR_DIRETORIO_FILENAME ( _FileName ) ;
   PUT_LOG( 'SALVAR_CONFIGURACAO_FILENAME [' + _FileName + ']' ) ;
   If SysUtils.DeleteFile ( _FileName ) Then ;
   Ini := TMemIniFile.Create ( _FileName ) ;
   Conteudo_Avancado := '' ;
   With Form,Ini Do Begin
     // Salvar Componentes
     For Local := 0 To ComponentCount - 1 Do Begin
       If Components[Local] Is TListBox Then Begin
          Try
            _FN2 := INSERE_BARRA ( ExtractFilePath ( _FileName ) ) +
                    UpperCase ( Components[Local].Name ) + '.DAT' ;
            (Components[Local] As TListBox).Items.SaveToFile ( _FN2 ) ;
          Except
          End ;
       End ;
       If Components[Local] Is TCheckBox Then Begin
          Campo := UpperCase ( Components[Local].Name ) ;
          Tipo := 'BOOL' ;
          Valor_Str := IF01 ( (Components[Local] As TCheckBox).Checked ) ;
          WriteBool ( 'CHECKBOXES' , Campo , (Components[Local] As TCheckBox).Checked ) ;
          Conteudo_Avancado := Conteudo_Avancado +
                               '<OBJ>' + Campo + '</OBJ>' +
                               '<TIPO>' + TIPO + '</TIPO>' +
                               '<VALOR>' + Valor_Str + '<VALOR>' + CRLF ;
       End ;
       If Components[Local] Is TEdit Then Begin
          If TRUE Then Begin // NOT (Components[Local] As TEdit).PassWord Then
             Campo := UpperCase ( Components[Local].Name ) ;
             Tipo := 'CHAR[100]' ;
             Valor_Str := (Components[Local] As TEdit).Text ;
             WriteString ( 'TEDITS' , Campo , Valor_Str ) ;
             Conteudo_Avancado := Conteudo_Avancado +
                                  '<OBJ>' + Campo + '</OBJ>' +
                                  '<TIPO>' + TIPO + '</TIPO>' +
                                  '<VALOR>' + Valor_Str + '<VALOR>' + CRLF ;
          End Else Begin
             Campo := UpperCase ( Components[Local].Name ) ;
             Tipo := 'CHAR[100]' ;
             Valor_Str := CODIFICAR_STRING ( (Components[Local] As TEdit).Text ) ;
             WriteString ( 'TEDITS' , Campo , Valor_Str ) ;
             Conteudo_Avancado := Conteudo_Avancado +
                                  '<OBJ>' + Campo + '</OBJ>' +
                                  '<TIPO>' + TIPO + '</TIPO>' +
                                  '<VALOR>' + Valor_Str + '<VALOR>' + CRLF ;
          End ;
       End ;
       If Components[Local] Is TLabeledEdit Then Begin
          If (Components[Local] As TLabeledEdit).PassWordChar = #0 Then Begin
             Campo := UpperCase ( Components[Local].Name ) ;
             Tipo := 'CHAR[100]' ;
             Valor_Str := (Components[Local] As TLabeledEdit).Text ;
             WriteString ( 'TLABELEDEDITS' , Campo , Valor_Str ) ;
             Conteudo_Avancado := Conteudo_Avancado +
                                  '<OBJ>' + Campo + '</OBJ>' +
                                  '<TIPO>' + TIPO + '</TIPO>' +
                                  '<VALOR>' + Valor_Str + '<VALOR>' + CRLF ;
          End Else Begin
             Campo := UpperCase ( Components[Local].Name ) ;
             Tipo := 'CHAR[100]' ;
             Valor_Str := CODIFICAR_STRING ( (Components[Local] As TLabeledEdit).Text ) ;
             WriteString ( 'TLABELEDEDITS' , Campo , Valor_Str ) ;
             Conteudo_Avancado := Conteudo_Avancado +
                                  '<OBJ>' + Campo + '</OBJ>' +
                                  '<TIPO>' + TIPO + '</TIPO>' +
                                  '<VALOR>' + Valor_Str + '<VALOR>' + CRLF ;
          End ;
       End ;
       //If Components[Local] Is TDirectoryEdit Then
       //   Begin
       //   Campo := UpperCase ( Components[Local].Name ) ;
       //   Tipo := 'CHAR[100]' ;
       //   Valor_Str := (Components[Local] As TDirectoryEdit).Text ;
       //   WriteString ( 'TDIRECTORYEDIT' , Campo , Valor_Str ) ;
       //   Conteudo_Avancado := Conteudo_Avancado +
       //                        '<OBJ>' + Campo + '</OBJ>' +
       //                        '<TIPO>' + TIPO + '</TIPO>' +
       //                        '<VALOR>' + Valor_Str + '<VALOR>' + CRLF ;
       //   End ;
       If Components[Local] Is TSpinEdit Then Begin
          Campo := UpperCase ( Components[Local].Name ) ;
          Tipo := 'INT[8]' ;
          Valor_Str := IntToStr ( (Components[Local] As TSpinEdit).Value ) ;
          WriteInteger ( 'TSPINEDITS' , Campo , (Components[Local] As TSpinEdit).Value ) ;
          Conteudo_Avancado := Conteudo_Avancado +
                               '<OBJ>' + Campo + '</OBJ>' +
                               '<TIPO>' + TIPO + '</TIPO>' +
                               '<VALOR>' + Valor_Str + '<VALOR>' + CRLF ;
       End ;
       If Components[Local] Is TRadioGroup Then Begin
          Campo := UpperCase ( Components[Local].Name ) ;
          Tipo := 'INT[8]' ;
          Valor_Str := IntToStr ( (Components[Local] As TRadioGroup).ItemIndex ) ;
          WriteInteger ( 'TRADIOGROUP' , Campo , (Components[Local] As TRadioGroup).ItemIndex ) ;
          Conteudo_Avancado := Conteudo_Avancado +
                               '<OBJ>' + Campo + '</OBJ>' +
                               '<TIPO>' + TIPO + '</TIPO>' +
                               '<VALOR>' + Valor_Str + '<VALOR>' + CRLF ;
       End ;
       If Components[Local] Is TShape Then Begin
          Campo := UpperCase ( Components[Local].Name ) ;
          Tipo := 'INT[8]' ;
          Valor_Str := IntToStr ( (Components[Local] As TShape).Brush.Color ) ;
          WriteInteger ( 'TSHAPES' , Campo , (Components[Local] As TShape).Brush.Color ) ;
          Conteudo_Avancado := Conteudo_Avancado +
                               '<OBJ>' + Campo + '</OBJ>' +
                               '<TIPO>' + TIPO + '</TIPO>' +
                               '<VALOR>' + Valor_Str + '<VALOR>' + CRLF ;
       End ;
       If Components[Local] Is TPanel Then Begin
          Campo := UpperCase ( Components[Local].Name ) ;
          Tipo := 'INT[8]' ;
          Valor_Str := IntToStr ( (Components[Local] As TPanel).Brush.Color ) ;
          WriteInteger ( 'TPANELS' , Campo , (Components[Local] As TPanel).Brush.Color ) ;
          Conteudo_Avancado := Conteudo_Avancado +
                               '<OBJ>' + Campo + '</OBJ>' +
                               '<TIPO>' + TIPO + '</TIPO>' +
                               '<VALOR>' + Valor_Str + '<VALOR>' + CRLF ;
       End ;
       If Components[Local] Is TStringGrid Then Begin
          Campo := UpperCase ( (Components[Local] As TStringGrid).Name ) ;
          Valor_Str := '' ;
          For _Linha := 1 To (Components[Local] As TStringGrid).RowCount - 1 Do Begin
             For _Coluna := 1 To (Components[Local] As TStringGrid).ColCount - 1 Do Begin
                 WriteString ( Campo ,
                               StrZero ( _Linha , 3 ) + '_' + StrZero ( _Coluna , 3 ) ,
                               (Components[Local] As TStringGrid).Cells[_Coluna,_Linha] ) ;
             End ;
          End ;
       End ;
       If Components[Local] Is TMemo Then Begin
          Campo := (Components[Local] As TMemo).Name ;
          Tipo := 'MEMO' ;
          (Components[Local] As TMemo).Text := Trim ( (Components[Local] As TMemo).Text ) ;
          Valor_Str := (Components[Local] As TMemo).Lines.Text ;
          If (Components[Local] As TMemo).Lines.Count > 0 Then Begin
             For Local2 := 0 To (Components[Local] As TMemo).Lines.Count - 1 Do
                 WriteString ( Campo ,
                               'LINE_' + StrZero ( Local2 , 3 ) ,
                               (Components[Local] As TMemo).Lines[Local2] ) ;
          End ;
          Conteudo_Avancado := Conteudo_Avancado +
                               '<OBJ>' + Campo + '</OBJ>' +
                               '<TIPO>' + TIPO + '</TIPO>' +
                               '<VALOR>' + Valor_Str + '<VALOR>' + CRLF ;
       End ;
     End ;
   End ;
   Ini.UpdateFile ;
   Ini.Free ;
   //Conteudo := GET_CONTEUDO_LOCAL ( _FileName ) ;
   Try
      Bak := _FileName + '.bak' ;
      If CopiaArquivo ( 'SALVAR_CONFIGURACAO_FILENAME/1',
                        _FileName, Bak, SOBREPOE ) Then Begin
      End ;
   Except
      On E : Exception Do Begin
         PUT_LOG ( 'Exception SALVAR_CONFIGURACAO_FILENAME Save-Bak-1 [' + Bak + '][' + E.Message + ']' ) ;
      End ;
   End ;
   Try
      Bak := INSERE_BARRA ( ExtractFilePath ( _FileName ) ) + 'Backup\' +
             DATAHORA_INVERSA(Now) + '_' + ExtractFileName ( _FileName ) + '.bak' ;
      CHECAR_DIRETORIO_FILENAME ( Bak ) ;
      If CopiaArquivo ( 'SALVAR_CONFIGURACAO_FILENAME/2',
                        _FileName, BAK, SOBREPOE ) Then Begin
      End ;
   Except
      On E : Exception Do Begin
         PUT_LOG ( 'Exception SALVAR_CONFIGURACAO_FILENAME Save-Bak-2 [' + Bak + '][' + E.Message + ']' ) ;
      End ;
   End ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception SALVAR_CONFIGURACAO_FILENAME [' + _FileName + '][' + E.Message + ']' ) ;
   End ;
End ;
End ;

Function GET_TYPE_COMPONENT ( Componente : TComponent ) : String ;
Begin
     If Componente Is TLabel       Then Result := 'TLabel'
Else If Componente Is TEdit        Then Result := 'TEdit'
Else If Componente Is TMemo        Then Result := 'TMemo'
Else If Componente Is TPanel       Then Result := 'TPanel'
Else If Componente Is TImage       Then Result := 'TImage'
Else If Componente Is TRichEdit    Then Result := 'TRichEdit'
Else If Componente Is TBitBtn      Then Result := 'TBitBtn'
Else If Componente Is TStringGrid  Then Result := 'TStringGrid'
Else If Componente Is TButton      Then Result := 'TButton'
Else If Componente Is TMainMenu    Then Result := 'TMainMenu'
//Else If Componente Is TApdComPort  Then Result := 'TApdComPort'

Else If Componente Is TMaskEdit    Then Result := 'TMaskEdit'
Else If Componente Is TLabeledEdit Then Result := 'TLabeledEdit'
//Else If Componente Is TRxLabel     Then Result := 'TRxLabel'
//Else If Componente Is TTextListBox Then Result := 'TTextListBox'
Else If Componente Is TTimer       Then Result := 'TTimer'
Else If Componente Is TIdTelnetServer Then Result := 'TIdTelnetServer'
Else If Componente Is TIdUDPClient Then Result := 'TIdUDPClient'
//Else If Componente Is TDirectoryEdit Then Result := 'TDirectoryEdit'
Else If Componente Is TDateTimePicker Then Result := 'TDateTimePicker'
Else If Componente Is TPopupMenu   Then Result := 'TPopupMenu'
//Else If Componente Is TRxSlider    Then Result := 'TRxSlider'
Else If Componente Is TChart       Then Result := 'TChart'
Else If Componente Is TLineSeries  Then Result := 'TLineSeries'
Else If Componente Is TBevel       Then Result := 'TBevel'
Else If Componente Is TServerSocket Then Result := 'TServerSocket'
Else If Componente Is TClientSocket Then Result := 'TClientSocket'
Else If Componente Is TFDQuery     Then Result := 'TFDQuery'
Else If Componente Is TFDConnection Then Result := 'TFDConnection'
Else If Componente Is TIdCmdTCPClient Then Result := 'TIdCmdTCPClient'
Else If Componente Is TDataSource  Then Result := 'TDataSource'
Else If Componente Is TRadioGroup  Then Result := 'TRadioGroup'
Else If Componente Is TDBGrid      Then Result := 'TDBGrid'
//Else If Componente Is TRxSpinButton Then Result := 'TRxSpinButton'
//Else If Componente Is TRxSpeedButton Then Result := 'TRxSpeedButton'
Else If Componente Is TProgressBar Then Result := 'TProgressBar'
Else If Componente Is TShape       Then Result := 'TShape'
//Else If Componente Is TRxRichEdit  Then Result := 'TRxRichEdit'
//Else If Componente Is TRxCalculator  Then Result := 'TRxCalculator'
Else If Componente Is TOpenDialog  Then Result := 'TOpenDialog'
Else If Componente Is TSaveDialog  Then Result := 'TSaveDialog'
Else If Componente Is TPageControl Then Result := 'TPageControl'
Else If Componente Is TPrinterSetupDialog Then Result := 'TPrinterSetupDialog'
Else If Componente Is TPrintDialog Then Result := 'TPrintDialog'
//Else If Componente Is TDualListDialog  Then Result := 'TDualListDialog'
Else If Componente Is TImageList   Then Result := 'TImageList'
//Else If Componente Is TSpeedBarSection Then Result := 'TSpeedBarSection'
//Else If Componente Is TSpeedItem   Then Result := 'TSpeedItem'
Else If Componente Is TSpeedButton Then Result := 'TSpeedButton'
Else If Componente Is TMenuItem    Then Result := 'TMenuItem'
//Else If Componente Is TSLScope     Then Result := 'TSLScope'
//Else If Componente Is TALAudioIn   Then Result := 'TALAudioIn'
//Else If Componente Is TALAudioOut  Then Result := 'TALAudioOut'
//Else If Componente Is TALGenericFilter Then Result := 'TALGenericFilter'
//Else If Componente Is TALRepack    Then Result := 'TALRepack'
//Else If Componente Is TALPPMMeter  Then Result := 'TALPPMMeter'
//Else If Componente Is TALDelayLine Then Result := 'TALDelayLine'
//Else If Componente Is TALLAVAudioLogger Then Result := 'TALLAVAudioLogger'
//Else If Componente Is TALChannelSplitter Then Result := 'TALChannelSplitter'
Else If Componente Is TListBox     Then Result := 'TListBox'
Else If Componente Is TToolBar     Then Result := 'TToolBar'
Else If Componente Is TToolButton  Then Result := 'TToolButton'
Else If Componente Is TSplitter    Then Result := 'TSplitter'
Else If Componente Is TRadioButton Then Result := 'TRadioButton'
//Else If Componente Is TSpeedBar    Then Result := 'TSpeedBar'
Else If Componente Is TSpinEdit    Then Result := 'TSpinEdit'
Else If Componente Is TCheckBox    Then Result := 'TCheckBox'
Else If Componente Is TStatusBar   Then Result := 'TStatusBar'
Else If Componente Is TComboBox    Then Result := 'TComboBox'
Else If Componente Is TTabSheet    Then Result := 'TTabSheet'
//Else If Componente Is TALDSAudioOut Then Result := 'TALDSAudioOut'
//Else If Componente Is TVLDSVideoPlayer Then Result := 'TVLDSVideoPlayer'
//Else If Componente Is TVLDSImageDisplay Then Result := 'TVLDSImageDisplay'
//Else If Componente Is TApplicationEvents Then Result := 'TApplicationEvents'
Else
      Result := 'Não Identificado' ;
End ;

Procedure GET_PROPRIEDADES_DE_FORMS ( F1, F2, F3, F4, F5, F6, F7, F8, F9, F10 : TForm ) ;
Var Aux : String ;
    FN  : String ;
Begin
FN := Diretorio + 'Config\Propriedades_de_Objetos.DAT' ;
Aux := '' ;
Aux := Aux + GET_PROPRIEDADES_DE_OBJETOS ( F1, F2, F3, F4, F5, F6, F7, F8, F9, F10 ) ;
WRITE_FILE_CORE ( 'GET_PROPRIEDADES_DE_FORMS',
                  FN, Aux, DELAYED_FALSE ) ;
OPEN_FILE_NOTEPAD ( FN ) ;
End ;

Function GET_PROPRIEDADES_DE_OBJETOS ( F1, F2, F3, F4, F5, F6, F7, F8, F9, F10 : TForm ) : String ;
Var Local_F   : LongInt ;
    Local     : LongInt ;
    Indice    : LongInt ;
    F         : T_Forms ;
    Qtde      : LongInt ;
    Index     : LongInt ;
Begin
If F1 = Nil Then Begin
   Exit ;
End ;
Result := '' ;
SetLength( F._Forms, 0 ) ;
Qtde := 0 ;
If Assigned ( F1 ) Then Begin
   Inc ( Qtde ) ;
   SetLength( F._Forms, Qtde ) ;
   F._Forms[Qtde-1] := F1 ;
End ;
If Assigned ( F2 ) Then Begin
   Inc ( Qtde ) ;
   SetLength( F._Forms, Qtde ) ;
   F._Forms[Qtde-1] := F2 ;
End ;
If Assigned ( F3 ) Then Begin
   Inc ( Qtde ) ;
   SetLength( F._Forms, Qtde ) ;
   F._Forms[Qtde-1] := F3 ;
End ;
If Assigned ( F4 ) Then Begin
   Inc ( Qtde ) ;
   SetLength( F._Forms, Qtde ) ;
   F._Forms[Qtde-1] := F4 ;
End ;
If Assigned ( F5 ) Then Begin
   Inc ( Qtde ) ;
   SetLength( F._Forms, Qtde ) ;
   F._Forms[Qtde-1] := F5 ;
End ;
If Assigned ( F6 ) Then Begin
   Inc ( Qtde ) ;
   SetLength( F._Forms, Qtde ) ;
   F._Forms[Qtde-1] := F6 ;
End ;
If Assigned ( F7 ) Then Begin
   Inc ( Qtde ) ;
   SetLength( F._Forms, Qtde ) ;
   F._Forms[Qtde-1] := F7 ;
End ;
If Assigned ( F8 ) Then Begin
   Inc ( Qtde ) ;
   SetLength( F._Forms, Qtde ) ;
   F._Forms[Qtde-1] := F8 ;
End ;
If Assigned ( F9 ) Then Begin
   Inc ( Qtde ) ;
   SetLength( F._Forms, Qtde ) ;
   F._Forms[Qtde-1] := F9 ;
End ;
If Assigned ( F10 ) Then Begin
   Inc ( Qtde ) ;
   SetLength( F._Forms, Qtde ) ;
   F._Forms[Qtde-1] := F10 ;
End ;
For Local_F := 0 To Qtde - 1 Do Begin
   Indice := 0 ;
   With F._Forms[Local_F] Do Begin
      Result := Result +
                Repli('=',80) + SLineBreak +
                'FORM: ' + Name + sLineBreak +
                Repli('=',80) + SLineBreak +
                'TForm' + SLineBreak +
                'Left=' + IntToStr(Left) + sLineBreak +
                'Top=' + IntToStr(Top) + sLineBreak +
                'Width=' + IntToStr(Width) + sLineBreak +
                'Height=' + IntToStr(Height) + sLineBreak +
                'Caption=' + Caption + sLineBreak +
                'Visible=' + IFSN(Visible) + sLineBreak +
                'Componentes=' + IntToStr(ComponentCount) + sLineBreak +
                sLineBreak ;
      For Local := 0 To ComponentCount - 1 Do Begin
         Result := Result + StrZero(Local+1,3) + ':' +
                   UpperCase ( Components[Local].Name ) + ' [' +
                   GET_TYPE_COMPONENT ( Components[Local] ) + ']' +
                   sLineBreak ;
      End ;
      For Local := 0 To ComponentCount - 1 Do Begin
         If Components[Local] Is TCheckBox Then Begin
            Inc ( Indice ) ;
            Result := Result + sLineBreak + GET_TYPE_COMPONENT ( Components[Local] ) + ' ' +
                      '(' + IntToStr(Indice) + ') ' +
                      UpperCase ( Components[Local].Name ) + sLineBreak ;
            Result := Result +
                      'Checked=' + IFSN((Components[Local] AS TCheckBox).Checked ) + sLineBreak ;
         End Else If Components[Local] Is TRadioButton Then Begin
            Inc ( Indice ) ;
            Result := Result + sLineBreak + GET_TYPE_COMPONENT ( Components[Local] ) + ' ' +
                      '(' + IntToStr(Indice) + ') ' +
                      UpperCase ( Components[Local].Name ) + sLineBreak ;
            Result := Result +
                      'Caption=' + (Components[Local] AS TRadioButton).Caption + sLineBreak +
                      'Checked=' + IFSN((Components[Local] AS TRadioButton).Checked ) + sLineBreak ;
         End Else If Components[Local] Is TEdit Then Begin
            Inc ( Indice ) ;
            Result := Result + sLineBreak + GET_TYPE_COMPONENT ( Components[Local] ) + ' ' +
                      '(' + IntToStr(Indice) + ') ' +
                      UpperCase ( Components[Local].Name ) + sLineBreak ;
            Result := Result +
                      'TEXT=' + (Components[Local] AS TEdit).Text + sLineBreak ;
         {
         End Else If Components[Local] Is TDirectoryEdit Then Begin
            Inc ( Indice ) ;
            Result := Result + sLineBreak + GET_TYPE_COMPONENT ( Components[Local] ) + ' ' +
                      '(' + IntToStr(Indice) + ') ' +
                      UpperCase ( Components[Local].Name ) + sLineBreak ;
            Result := Result +
                      'TEXT=' + (Components[Local] AS TDirectoryEdit).Text + sLineBreak ;
         }
         End Else If Components[Local] Is TOpenDialog Then Begin
            Inc ( Indice ) ;
            Result := Result + sLineBreak + GET_TYPE_COMPONENT ( Components[Local] ) + ' ' +
                      '(' + IntToStr(Indice) + ') ' +
                      UpperCase ( Components[Local].Name ) + sLineBreak ;
            Result := Result +
                      'InitialDir=' + (Components[Local] AS TOpenDialog).InitialDir + sLineBreak +
                      'Title=' + (Components[Local] AS TOpenDialog).Title + sLineBreak +
                      'Filter=' + (Components[Local] AS TOpenDialog).Filter + sLineBreak +
                      'FilterIndex=' + IntToStr((Components[Local] AS TOpenDialog).FilterIndex) + sLineBreak +
                      'DefaultExt=' + (Components[Local] AS TOpenDialog).DefaultExt + sLineBreak +
                      'FileName=' + (Components[Local] AS TOpenDialog).FileName + sLineBreak ;
         End Else If Components[Local] Is TSaveDialog Then Begin
            Inc ( Indice ) ;
            Result := Result + sLineBreak + GET_TYPE_COMPONENT ( Components[Local] ) + ' ' +
                      '(' + IntToStr(Indice) + ') ' +
                      UpperCase ( Components[Local].Name ) + sLineBreak ;
            Result := Result +
                      'InitialDir=' + (Components[Local] AS TSaveDialog).InitialDir + sLineBreak +
                      'Title=' + (Components[Local] AS TSaveDialog).Title + sLineBreak +
                      'Filter=' + (Components[Local] AS TSaveDialog).Filter + sLineBreak +
                      'FilterIndex=' + IntToStr((Components[Local] AS TSaveDialog).FilterIndex) + sLineBreak +
                      'DefaultExt=' + (Components[Local] AS TSaveDialog).DefaultExt + sLineBreak +
                      'FileName=' + (Components[Local] AS TSaveDialog).FileName + sLineBreak ;
         End Else If Components[Local] Is TMaskEdit Then Begin
            Inc ( Indice ) ;
            Result := Result + sLineBreak + GET_TYPE_COMPONENT ( Components[Local] ) + ' ' +
                      '(' + IntToStr(Indice) + ') ' +
                      UpperCase ( Components[Local].Name ) + sLineBreak ;
            Result := Result +
                      'TEXT=' + (Components[Local] AS TMaskEdit).Text + sLineBreak ;
         End Else If Components[Local] Is TLabeledEdit Then Begin
            Inc ( Indice ) ;
            Result := Result + sLineBreak + GET_TYPE_COMPONENT ( Components[Local] ) + ' ' +
                      '(' + IntToStr(Indice) + ') ' +
                      UpperCase ( Components[Local].Name ) + sLineBreak ;
            Result := Result +
                      'TEXT=' + (Components[Local] AS TLabeledEdit).Text + sLineBreak ;
         End Else If Components[Local] Is TDateTimePicker Then Begin
            Inc ( Indice ) ;
            Result := Result + sLineBreak + GET_TYPE_COMPONENT ( Components[Local] ) + ' ' +
                      '(' + IntToStr(Indice) + ') ' +
                      UpperCase ( Components[Local].Name ) + sLineBreak ;
            Result := Result +
                      'DATE=' + DateToStr((Components[Local] AS TDateTimePicker).Date) + sLineBreak +
                      'TIME=' + TimeToStr((Components[Local] AS TDateTimePicker).Time) + sLineBreak ;
         End Else If Components[Local] Is TComboBox Then Begin
            Inc ( Indice ) ;
            Result := Result + sLineBreak + GET_TYPE_COMPONENT ( Components[Local] ) + ' ' +
                      '(' + IntToStr(Indice) + ') ' +
                      UpperCase ( Components[Local].Name ) + sLineBreak ;
            Index := (Components[Local] AS TComboBox).ItemIndex ;
            Result := Result + 'ItemIndex=' + IntToStr(Index) + sLineBreak ;
            If Index > -1 Then
               Result := Result +
                         'TEXT=' + (Components[Local] AS TComboBox).Items[Index] + sLineBreak ;
         End Else If Components[Local] Is TSpinEdit Then Begin
            Inc ( Indice ) ;
            Result := Result + sLineBreak + GET_TYPE_COMPONENT ( Components[Local] ) + ' ' +
                      '(' + IntToStr(Indice) + ') ' +
                      UpperCase ( Components[Local].Name ) + sLineBreak ;
            Result := Result +
                      'VALUE=' + IntToStr((Components[Local] AS TSpinEdit).Value ) + sLineBreak +
                      'MINVALUE=' + IntToStr((Components[Local] AS TSpinEdit).MinValue ) + sLineBreak +
                      'MAXVALUE=' + IntToStr((Components[Local] AS TSpinEdit).MaxValue ) + sLineBreak ;
         {
         End Else If Components[Local] Is TRxSlider Then Begin
            Inc ( Indice ) ;
            Result := Result + sLineBreak + GET_TYPE_COMPONENT ( Components[Local] ) + ' ' +
                      '(' + IntToStr(Indice) + ') ' +
                      UpperCase ( Components[Local].Name ) + sLineBreak ;
            Result := Result +
                      'VALUE=' + IntToStr((Components[Local] AS TRxSlider).Value ) + sLineBreak +
                      'MINVALUE=' + IntToStr((Components[Local] AS TRxSlider).MinValue ) + sLineBreak +
                      'MAXVALUE=' + IntToStr((Components[Local] AS TRxSlider).MaxValue ) + sLineBreak ;
         }
         End Else If Components[Local] Is TProgressBar Then Begin
            Inc ( Indice ) ;
            Result := Result + sLineBreak + GET_TYPE_COMPONENT ( Components[Local] ) + ' ' +
                      '(' + IntToStr(Indice) + ') ' +
                      UpperCase ( Components[Local].Name ) + sLineBreak ;
            Result := Result +
                      'POSITION=' + IntToStr((Components[Local] AS TProgressBar).Position ) + sLineBreak +
                      'MIN=' + IntToStr((Components[Local] AS TProgressBar).Min ) + sLineBreak +
                      'MAX=' + IntToStr((Components[Local] AS TProgressBar).Max ) + sLineBreak ;
         End Else If Components[Local] Is TRadioGroup Then Begin
            Inc ( Indice ) ;
            Result := Result + sLineBreak + GET_TYPE_COMPONENT ( Components[Local] ) + ' ' +
                      '(' + IntToStr(Indice) + ') ' +
                      UpperCase ( Components[Local].Name ) + sLineBreak ;
            Result := Result +
                      'ItemIndex=' + IntToStr((Components[Local] AS TRadioGroup).ItemIndex ) + sLineBreak ;
         End Else If Components[Local] Is TShape Then Begin
            Inc ( Indice ) ;
            Result := Result + sLineBreak + GET_TYPE_COMPONENT ( Components[Local] ) + ' ' +
                      '(' + IntToStr(Indice) + ') ' +
                      UpperCase ( Components[Local].Name ) + sLineBreak ;
            Result := Result +
                      'LEFT=' + IntToStr((Components[Local] AS TShape).Left ) + sLineBreak +
                      'TOP=' + IntToStr((Components[Local] AS TShape).Top ) + sLineBreak +
                      'WIDTH=' + IntToStr((Components[Local] AS TShape).Width ) + sLineBreak +
                      'HEIGHT=' + IntToStr((Components[Local] AS TShape).Height ) + sLineBreak +
                      'VISIBLE=' + IFSN((Components[Local] AS TShape).Visible ) + sLineBreak +
                      'COLOR=' + IntToStr((Components[Local] AS TShape).Brush.Color AND $FFFFFF ) +
                               ' [' + IntToHex ( (Components[Local] AS TShape).Brush.Color , 8 ) + ']' + sLineBreak ;
         End Else If Components[Local] Is TPanel Then Begin
            Inc ( Indice ) ;
            Result := Result + sLineBreak + GET_TYPE_COMPONENT ( Components[Local] ) + ' ' +
                      '(' + IntToStr(Indice) + ') ' +
                      UpperCase ( Components[Local].Name ) + sLineBreak ;
            Result := Result +
                      'CAPTION=' + (Components[Local] AS TPanel).Caption + sLineBreak +
                      'LEFT=' + IntToStr((Components[Local] AS TPanel).Left ) + sLineBreak +
                      'TOP=' + IntToStr((Components[Local] AS TPanel).Top ) + sLineBreak +
                      'WIDTH=' + IntToStr((Components[Local] AS TPanel).Width ) + sLineBreak +
                      'HEIGHT=' + IntToStr((Components[Local] AS TPanel).Height ) + sLineBreak +
                      'VISIBLE=' + IFSN((Components[Local] AS TPanel).Visible ) + sLineBreak +
                      'COLOR=' + IntToStr((Components[Local] AS TPanel).Color AND $FFFFFF ) +
                               ' [' + IntToHex ( (Components[Local] AS TPanel).Color , 8 ) + ']' + sLineBreak ;
         End Else If Components[Local] Is TMemo Then Begin
            Inc ( Indice ) ;
            Result := Result + sLineBreak + GET_TYPE_COMPONENT ( Components[Local] ) + ' ' +
                      '(' + IntToStr(Indice) + ') ' +
                      UpperCase ( Components[Local].Name ) + sLineBreak ;
            Result := Result +
                      'TEXT=' + Trim((Components[Local] AS TMemo).Text) + sLineBreak ;
         End Else If Components[Local] Is TRichEdit Then Begin
            Inc ( Indice ) ;
            Result := Result + sLineBreak + GET_TYPE_COMPONENT ( Components[Local] ) + ' ' +
                      '(' + IntToStr(Indice) + ') ' +
                      UpperCase ( Components[Local].Name ) + sLineBreak ;
            Result := Result +
                      'TEXT=' + Trim((Components[Local] AS TRichEdit).Text) + sLineBreak ;
         End Else If Components[Local] Is TStatusBar Then Begin
            Inc ( Indice ) ;
            Result := Result + sLineBreak + GET_TYPE_COMPONENT ( Components[Local] ) + ' ' +
                      '(' + IntToStr(Indice) + ') ' +
                      UpperCase ( Components[Local].Name ) + sLineBreak ;
            Result := Result +
                      'SIMPLETEXT=' + (Components[Local] AS TStatusBar).SimpleText + sLineBreak ;
         End Else Begin
         End ;
      End ;
   End ;
   Result := Result + sLineBreak ;
End ;
Result := Result + sLineBreak ;
End ;

Function TEXT_SQL ( _Texto : String ) : String ;
Begin
SUBSTITUIR_SIMPLES ( _Texto , '\' , '<<CONTRABARRASQL>>' ) ;
SUBSTITUIR_SIMPLES ( _Texto , #0 , '\0' ) ;
SUBSTITUIR_SIMPLES ( _Texto , #8 , '\b' ) ;
SUBSTITUIR_SIMPLES ( _Texto , #9 , '\t' ) ;
SUBSTITUIR_SIMPLES ( _Texto , #10 , '\n' ) ;
SUBSTITUIR_SIMPLES ( _Texto , #13 , '\r' ) ;
SUBSTITUIR_SIMPLES ( _Texto , #26 , '\Z' ) ;
SUBSTITUIR_SIMPLES ( _Texto , '"' , '\"' ) ;
SUBSTITUIR_SIMPLES ( _Texto , '''' , '\''' ) ;
SUBSTITUIR_SIMPLES ( _Texto , '%' , '\%' ) ;
//SUBSTITUIR_SIMPLES ( _Texto , '_' , '\_' ) ;
SUBSTITUIR_SIMPLES ( _Texto , '<<CONTRABARRASQL>>' , '\\' ) ;
Result := _Texto ;
End ;

Function IF01_SQL ( Condicao : Boolean ) : String ;
Begin
If Condicao Then Begin
   Result := STR_SQL ( '1' )
End Else Begin
   Result := STR_SQL ( '0' ) ;
End ;
End ;

Function IF01N ( Condicao : Boolean ) : LongInt ;
Begin
If Condicao Then Begin
   Result := 1
End Else Begin
   Result := 0 ;
End ;
End ;

Procedure DEF_ERRO_GET_CONTEUDO ( Origem, Erro, FN : String ; Tick : Cardinal ) ;
Var Aux : String ;
Begin
Aux := Origem + '|' +
       IntToStr ( GetTickCount - Tick ) + '|' +
       Erro + '|' +
       FN ;
Origem := StringReplace ( Origem, '|', ':', [rfReplaceAll] ) ;
Erro := StringReplace ( Erro, '|', ':', [rfReplaceAll] ) ;
Erro_Get_Conteudo := Aux ;
If ( Erro <> '' ) Then Begin
   PUT_LOG ( 'ERR_READ [' + Erro + '] ' + Aux ) ;
   //SL_Erro_Get_Conteudo.Add ( DateTimeToStr(Now) + '|' + Aux ) ;
End ;
If ( Tick >= 200 ) Then Begin
   PUT_LOG ( 'TICK [' + IntToStr ( Tick ) + '] ' + Aux ) ;
   //SL_Erro_Get_Conteudo.Add ( DateTimeToStr(Now) + '|' + Aux ) ;
End ;
End ;

Function GET_BITMAP ( _Bitmap : TBitmap ; FN : String ) : Boolean ;
Var Tick : Cardinal ;
Begin
Tick := GetTickCount ;
Result := FALSE ;
Try
   _Bitmap.LoadFromFile ( FN ) ;
   Tick :=  GetTickCount - Tick ;
   If FN <> '' Then Begin
      Inc ( Cnt_Log_Img_Bitmap ) ;
      If Assigned ( Log ) AND ( NOT Application.Terminated ) Then Begin
         PUT_LOG_EVENTO ( Log.LB_IMG, Log.CK_Rolagem.Checked,
                          TimeToStr(Now) + ' ' +
                          'IMG BITMAP OK ' + IntToStr(Cnt_Log_Img_Bitmap) + ' ' +
                          'T[' + IntToStr(Tick) + ']' +
                          '[' + ExtractFileName(FN) + ']' +
                          '[' + FN + ']' ) ;
      End ;
   End ;
   Result := TRUE ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception GET_BITMAP [' + FN + '][' + E.Message + ']' ) ;
   End ;
End ;
End ;

Function GET_PICTURE ( Origem : String ; IM : TImage ; _Picture : TPicture ; FN : String ) : Boolean ;
Var Tick : Cardinal ;
Begin
_Debug ( 'GET_PICTURE Or[' + Origem + '] IM[' + IM.Name + '] FN[' + FN + ']' ) ;
Tick := GetTickCount ;
Result := FALSE ;
Try
   _Picture.LoadFromFile ( FN ) ;
   If Assigned ( IM ) Then Begin
      IM.Hint := FN ;
      IM.ShowHint := TRUE ;
   End ;
   Tick :=  GetTickCount - Tick ;
   If FN <> '' Then Begin
      Inc ( Cnt_Log_Img_Picture ) ;
      If Assigned ( Log ) AND ( NOT Application.Terminated ) Then Begin
         PUT_LOG_EVENTO ( Log.LB_IMG, Log.CK_Rolagem.Checked,
                          TimeToStr(Now) + ' ' +
                          'IMG PICTURE OK ' + IntToStr(Cnt_Log_Img_Picture) + ' ' +
                          'T[' + IntToStr(Tick) + ']' +
                          '[' + ExtractFileName(FN) + ']' +
                          '[' + FN + ']' ) ;
      End ;
   End ;
   Result := TRUE ;
Except
   On E : Exception Do Begin
      If Assigned ( IM ) Then Begin
         IM.Hint := '' ;
         IM.ShowHint := TRUE ;
      End ;
      PUT_LOG ( 'Exception GET_PICTURE_BITMAP [' + FN + '][' + E.Message + ']' ) ;
   End ;
End ;
End ;

Function GET_PNG ( Origem : String ; _Png : TPNGImage ; FN : String ) : Boolean ;
Var Tick : Cardinal ;
Begin
_Debug ( 'GET PNG Or[' + Origem +  '] FN[' + FN + ']' ) ;
Tick := GetTickCount ;
Result := FALSE ;
Try
   _Png.LoadFromFile ( FN ) ;
   Tick :=  GetTickCount - Tick ;
   If FN <> '' Then Begin
      Inc ( Cnt_Log_Img_Png ) ;
      If Assigned ( Log ) AND ( NOT Application.Terminated ) Then Begin
         PUT_LOG_EVENTO ( Log.LB_IMG, Log.CK_Rolagem.Checked,
                          TimeToStr(Now) + ' ' +
                          'IMG PNG OK ' + IntToStr(Cnt_Log_Img_Png) + ' ' +
                          'T[' + IntToStr(Tick) + ']' +
                          '[' + ExtractFileName(FN) + ']' +
                          '[' + FN + ']' ) ;
      End ;
   End ;
   _Debug ( 'GET PNG OK Or[' + Origem +  '] FN[' + FN + ']' ) ;
   Result := TRUE ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception GET PNG [' + FN + '][' + E.Message + ']' ) ;
   End ;
End ;
End ;

Function GET_CONTEUDO_M ( Origem, FN : String ) : String ;
Var Lista       : TStringList ;
    Tick        : Cardinal ;
    oFileStream : TFileStream ;
Begin
_Debug ( 'INI GET CONTEUDO_M [' + Origem + '][' + FN + ']' ) ;
Tick := GetTickCount ;
Inc ( Cnt_Log_Read ) ;
Result := '' ;
PUSH_TICK ( 'GET CONTEUDO_M [' + Origem + '][' + FN + ']' ) ;
If NOT RR_FileExists ( 'GET_CONTEUDO_M', FN ) Then Begin
   Tick := GetTickCount - Tick ;
   DEF_ERRO_GET_CONTEUDO ( Origem, '!FN', FN, Tick ) ;
   POP_TICK ( 'GET CONTEUDO_M [' + Origem + '][' + FN + ']' ) ;
   If Assigned ( Log ) AND ( NOT Application.Terminated ) Then Begin
      PUT_LOG_EVENTO ( Log.LB_Read, Log.CK_Rolagem.Checked,
                       TimeToStr ( Now ) + ' ' +
                       'READ !FN ' + IntToStr ( Cnt_Log_Read ) + ' ' +
                       'T[' + IntToStr(Tick) + ']' +
                       //'[' + ExtractFileName(FN) + ']' +
                       '[' + FN + ']' +
                       '[' + Origem + ']' ) ;
   End ;
   Exit ;
End ;
Erro_Get_Conteudo := 'GET CONTEUDO [' + FN + ']' ;
Lista := TStringList.Create ;
//READ_ARQUIVO ( FileName, Lista, Erro_Get_Conteudo ) ;
Try
   oFileStream := TFileStream.Create ( FN, fmShareDenyNone ) ;
   Lista.LoadFromStream ( oFileStream ) ;
   Result := Trim ( Lista.Text ) ;
   Tick := GetTickCount - Tick ;
   DEF_ERRO_GET_CONTEUDO ( Origem, '', FN, Tick ) ;
   If Assigned ( Log ) AND ( NOT Application.Terminated ) Then Begin
      PUT_LOG_EVENTO ( Log.LB_Read, Log.CK_Rolagem.Checked,
                       TimeToStr ( Now ) + ' ' +
                       'READ OK. ' + IntToStr ( Cnt_Log_Read ) + ' ' +
                       'T[' + IntToStr(Tick) + ']' +
                       //'[' + ExtractFileName(FN) + ']' +
                       '[' + FN + ']' +
                       '[' + Origem + ']' ) ;
   End ;
Except
   On E : Exception Do Begin
      Tick := GetTickCount - Tick ;
      Result := '' ;
      DEF_ERRO_GET_CONTEUDO ( Origem, 'Exc ' + E.Message, FN, Tick ) ;
      If Assigned ( Log ) AND ( NOT Application.Terminated ) Then Begin
         PUT_LOG_EVENTO ( Log.LB_Read, Log.CK_Rolagem.Checked,
                          TimeToStr ( Now ) + ' ' +
                          'READ EXC ' + IntToStr ( Cnt_Log_Read ) + ' ' +
                          'T[' + IntToStr(Tick) + ']' +
                          //'[' + ExtractFileName(FN) + ']' +
                          '[' + FN + ']' +
                          '[' + Origem + ']' ) ;
      End ;
      Lista.Clear ;
   End ;
End ;
If oFileStream <> Nil Then Begin
   FreeAndNil(oFileStream) ;
End ;
Lista.Free ;
POP_TICK ( 'GET CONTEUDO_M [' + Origem + '][' + FN + ']' ) ;
_Debug ( 'FIM GET CONTEUDO_M [' + Origem + '][' + FN + ']' ) ;
End ;

Procedure SUBSTITUIR_SIMPLES ( Var Nome : String ; Origem , Destino : String ) ;
Var OCORREU_SUBSTITUICAO : Boolean ;
Begin
SUBSTITUIR ( Nome , Origem , Destino , OCORREU_SUBSTITUICAO ) ;
End ;

Procedure SUBSTITUIR ( Var Nome : String ; Origem , Destino : String ;
                       Var OCORREU_SUBSTITUICAO : Boolean ) ;
Var Resultado : String ;
Begin
Resultado := StringReplace ( Nome , Origem , Destino , [rfReplaceAll] ) ;
Ocorreu_Substituicao := Resultado <> Nome ;
Nome := Resultado ;
End ;

Function DateTimeToStrNZ ( DT : TDateTime ) : String ;
Begin
Result := DateToStr ( DT ) + #32 + TimeToStr ( DT ) ;
End ;

Procedure PUT_LB_GERAL ( LB : TObject ; Msg : String ;
                         Const Rolagem : Boolean = TRUE ;
                         Const Tempo : Boolean = TRUE ;
                         Const Limite : LongInt = 1000 ) ;
Begin
_Debug ( 'INI PUT_LB_GERAL' ) ;
If Tempo Then
   Msg := TimeToStr ( Now ) + #32 + Msg ;
If LB Is TListBox Then Begin
   With LB As TListBox Do Begin
      Items.Add ( Msg ) ;
      If Items.Count > LIMITE Then Begin
         While Items.Count > TRUNC ( LIMITE * 8 / 10 ) Do Begin
            Items.Delete ( 0 ) ;
         End ;
      End ;
      If Rolagem Then Begin
         ItemIndex := Items.Count - 1 ;
      End ;
   End ;
End ;
_Debug ( 'FIM PUT_LB_GERAL' ) ;
End ;

Function PACOTE_RD ( Comando : Char ; Parametros : String ) : String ;
Begin
_Debug ( 'INI PACOTE_RD' ) ;
While Length ( Parametros ) < 20 Do Begin
   Parametros := Parametros + #0 ;
End ;
Parametros := Copy ( Parametros , 1 , 20 ) ;
Result := 'RRCT' + #1 + #0 + Comando + Parametros + #0 + #0#0 + #0 + #2 ;
_Debug ( 'FIM PACOTE_RD' ) ;
End ;

Function RR_DEBUG : String ;
Begin
If Assigned ( xSL_Linhas_Debug ) Then Begin
   Result := xSL_Linhas_Debug.Text
End Else Begin
   Result := '<Null>' ;
End ;
End ;

Function COMPUTADOR_CORE : String ;
Var CompName : Array[0..256] Of Char ;
    i        : DWord ;
Begin
i := 256 ;
GetComputerName ( CompName, i ) ;
Result := StrPas ( CompName ) ;
End ;

Function COMPUTADOR : String ;
Begin
Result := COMPUTADOR_CORE + '_' + Sys_Serial_C ;
End ;

Function COMPUTADOR_SERIAL : String ;
Begin
Result := COMPUTADOR_CORE + '_' + Sys_Serial_C ;
End ;

Function DT_SQL_TIMESTAMP ( DT : TDateTime ) : String ;
Begin
Result := 'TIMESTAMP ' + SYS_ASPAS_SQL +
          StrZero ( YearOf ( DT ) , 4 ) + '-' +
          StrZero ( MonthOf ( DT ) , 2 ) + '-' +
          StrZero ( DayOf ( DT ) , 2 ) + ' ' +
          StrZero ( HourOf ( DT ) , 2 ) + ':' +
          StrZero ( MinuteOf ( DT ) , 2 ) + ':' +
          StrZero ( SecondOf ( DT ) , 2 ) +
          SYS_ASPAS_SQL ;
End ;

Function DT_SQL_SEM_ASPAS ( DT : TDateTime ) : String ;
Begin
Result := StrZero ( YearOf ( DT ) , 4 ) + '-' +
          StrZero ( MonthOf ( DT ) , 2 ) + '-' +
          StrZero ( DayOf ( DT ) , 2 ) + ' ' +
          StrZero ( HourOf ( DT ) , 2 ) + ':' +
          StrZero ( MinuteOf ( DT ) , 2 ) + ':' +
          StrZero ( SecondOf ( DT ) , 2 ) ;
End ;

Function DT_SQL_SIMPLES ( DT : TDateTime ) : String ;
Begin
Result := StrZero ( YearOf ( DT ) , 4 ) + '-' +
          StrZero ( MonthOf ( DT ) , 2 ) + '-' +
          StrZero ( DayOf ( DT ) , 2 ) + ' ' +
          StrZero ( HourOf ( DT ) , 2 ) + ':' +
          StrZero ( MinuteOf ( DT ) , 2 ) + ':' +
          StrZero ( SecondOf ( DT ) , 2 ) ;
End ;

Function DT_SQL_TO_DATETIME ( _DT : String ) : TDateTime ;
Begin
//2006-12-31 12:23:34
Try
   Result := StrToDateTime ( Copy ( _DT , 9 , 2 ) + '/' +
                             Copy ( _DT , 6 , 2 ) + '/' +
                             Copy ( _DT , 1 , 4 ) + ' ' +
                             Copy ( _DT , 2 , 2 ) + ':' +
                             Copy ( _DT , 15 , 2 ) + ':' +
                             Copy ( _DT , 18 , 2 ) ) ;
Except
   Result := -2 ;
End ;
End ;

Function Data_Inversa_DT ( _DT : String ) : TDateTime ;
Begin
Result := -1 ;
If Length ( _DT ) <> 8 Then Begin
   Exit ;
End ;
Try
  Result := StrToDate ( Copy ( _DT , 07 , 2 ) + '/' +
                        Copy ( _DT , 05 , 2 ) + '/' +
                        Copy ( _DT , 01 , 4 ) ) ;
Except
  Result := -2 ;
End ;
End ;

{
Function FileVerInfo ( Const _FileName : String ;
                       Var Log : String ;
                       Var FileInfo : TStringList ) : Boolean ;
//
// Obtem diversas informações de um arquivo executável
// Requer um StringList criado antes de executar a função
// deve ser declarado na clausula Var no inicio da Unit
// StrLst := TStringList.Create;
//
Const QTDE = 10 ;
Const Key : Array[1..QTDE] Of String = ( 'CompanyName' ,
                                         'FileDescription' ,
                                         'FileVersion' ,
                                         'InternalName' ,
                                         'LegalCopyright' ,
                                         'OriginalFilename' ,
                                         'ProductName' ,
                                         'ProductVersion' ,
                                         'Compilacao' ,
                                         'Comments' ) ;
      KeyBr : Array [1..QTDE] Of String = ( 'Empresa' ,
                                            'Descricao' ,
                                            'Versao do Arquivo' ,
                                            'Nome Interno' ,
                                            'Copyright' ,
                                            'Nome Original do Arquivo' ,
                                            'Produto' ,
                                            'Versao do Produto' ,
                                            'Compilação' ,
                                            'Comentarios' ) ;
Var Dummy         : THandle ;
    BufferSize    ,
    Len           : Integer ;
    Buffer        : PChar ;
    LoCharSet     ,
    HiCharSet     : Word ;
    Translate     ,
    Return        : Pointer ;
    StrFileInfo   ,
    Flags         : String ;
    TargetOS      ,
    TypeArq       : String ;
    FixedFileInfo : Pointer ;
    i             : Byte ;
Begin
Result := False;
FileInfo.Text := '' ;
Log := '' ;
Sys_Usuario_Aplicativo.c_Versao_App := '' ;
Sys_Usuario_Aplicativo.c_Compilacao := '' ;
If NOT RR_FileExists ( 'FileVerInfo', _FileName ) then
   begin
   FileInfo.Text := 'Arquivo não encontrado "' + _FileName + '"' ;
   Log := FileInfo.Text ;
   PUT_LOG ( FileInfo.Text ) ;
   Result := FALSE ;
   Exit ;
   End ;
BufferSize := GetFileVersionInfoSize ( PWideChar ( _FileName ) , Dummy ) ;
Log := Log + 'Passo 1 [BufferSize=' + IntToStr ( BufferSize ) + ']' + CRLF ;
If BufferSize <> 0 Then
   Begin
   Log := Log + 'Passo 2' + CRLF ;
   GetMem ( Buffer , Succ ( BufferSize ) ) ;
   Log := 'Passo 3' + CRLF ;
   Try
     Log := Log + 'Passo 4' + CRLF ;
     If GetFileVersionInfo ( PChar ( _FileName ) , 0, BufferSize , Buffer ) Then
        Begin
        Log := Log + 'Passo 5' + CRLF ;
        If VerQueryValue(Buffer, '\VarFileInfo\Translation', Translate, UINT(Len)) Then
           Begin
           Log := Log + 'Passo 6' + CRLF ;
           LoCharSet := LoWord(Longint(Translate^));
           HiCharSet := HiWord(Longint(Translate^));
           For i := 1 To QTDE Do
              Begin
              Log := Log + 'Passo 7 [i=' + IntToStr ( i ) + ']' + CRLF ;
              StrFileInfo := Format('\StringFileInfo\0%x0%x\%s',[LoCharSet, HiCharSet, Key[i]]);
              If VerQueryValue(Buffer,PChar(StrFileInfo), Return,UINT(Len)) then
                 Begin
                 Log := Log + 'Passo 8' + CRLF ;
                 Case i Of
                    3 : Sys_Usuario_Aplicativo.c_Versao_App := PChar ( Return ) ;
                    9 : Sys_Usuario_Aplicativo.c_Compilacao := PChar ( Return ) ;
                    End ;
                 FileInfo.Add(KeyBr[i] + ': ' + PChar ( Return ) ) ;
                 End ;
              End ;
           If VerQueryValue(Buffer,'\',FixedFileInfo, UINT(Len)) Then
              Begin
              Log := Log + 'Passo 9' + CRLF ;
              With TVSFixedFileInfo(FixedFileInfo^) Do
                 Begin
                 Log := Log + 'Passo 10' + CRLF ;
                 Flags := '';
                 If (dwFileFlags AND VS_FF_DEBUG) = VS_FF_DEBUG Then
                    Begin
                    Flags := Concat ( Flags , '*Debug* ' ) ;
                    End ;
                 If (dwFileFlags AND VS_FF_SPECIALBUILD) = VS_FF_SPECIALBUILD Then
                    Begin
                    Flags := Concat ( Flags , '*Special Build* ' ) ;
                    End ;
                 If (dwFileFlags AND VS_FF_PRIVATEBUILD) = VS_FF_PRIVATEBUILD Then
                    Begin
                    Flags := Concat ( Flags , '*Private Build* ' ) ;
                    End ;
                 If (dwFileFlags AND VS_FF_PRERELEASE) = VS_FF_PRERELEASE Then
                    Begin
                    Flags := Concat ( Flags , '*Pre-Release Build* ' ) ;
                    End ;
                 If (dwFileFlags and VS_FF_PATCHED) = VS_FF_PATCHED Then
                    Begin
                    Flags := Concat ( Flags , '*Patched* ' ) ;
                    End ;
                 If Flags <> '' Then
                    Begin
                    FileInfo.Add ( 'Atributos: ' + Flags ) ;
                    End ;
                 TargetOS := 'Plataforma (OS): ';
                 Log := Log + 'Passo 11' + CRLF ;
                 Case dwFileOS Of
                    VOS_UNKNOWN : TargetOS := Concat(TargetOS, 'Desconhecido');
                    VOS_DOS : TargetOS := Concat(TargetOS, 'MS-DOS');
                    VOS_OS216 : TargetOS := Concat(TargetOS, '16-bit OS/2');
                    VOS_OS232 : TargetOS := Concat(TargetOS, '32-bit OS/2');
                    VOS_NT : TargetOS := Concat(TargetOS, 'Windows NT');
                    VOS_NT_WINDOWS32, 4: TargetOS := Concat(TargetOS, 'Win32 API');
                    VOS_DOS_WINDOWS16: TargetOS := Concat(TargetOS, '16-bit Windows ','sob MS-DOS');
                    Else
                      TargetOS := Concat(TargetOS, 'Fora do Padrão. Código: ', IntToStr(dwFileOS));
                    End ;
                 FileInfo.Add ( TargetOS ) ;
                 Log := Log + 'Passo 12' + CRLF ;
                 TypeArq := 'Tipo de Arquivo: ' ;
                 Case dwFileType Of
                    VFT_UNKNOWN : TypeArq := Concat(TypeArq,'Desconhecido');
                    VFT_APP : TypeArq := Concat(TypeArq,'Aplicacao');
                    VFT_DLL : TypeArq := Concat(TypeArq,'Dynamic-Link Lib.');
                    VFT_DRV : Begin
                              TypeArq := Concat(TypeArq,'Device driver - Driver ');
                              Case dwFileSubtype Of
                                 VFT2_UNKNOWN : TypeArq := Concat(TypeArq,'Desconhecido');
                                 VFT2_DRV_PRINTER : TypeArq := Concat(TypeArq,'de Impressao');
                                 VFT2_DRV_KEYBOARD : TypeArq := Concat(TypeArq,'de Teclado');
                                 VFT2_DRV_LANGUAGE : TypeArq := Concat(TypeArq,'de Idioma');
                                 VFT2_DRV_DISPLAY : TypeArq := Concat(TypeArq,'de Vídeo');
                                 VFT2_DRV_MOUSE : TypeArq := Concat(TypeArq,'de Mouse');
                                 VFT2_DRV_NETWORK : TypeArq := Concat(TypeArq,'de Rede');
                                 VFT2_DRV_SYSTEM : TypeArq := Concat(TypeArq,'de Sistema');
                                 VFT2_DRV_INSTALLABLE : TypeArq := Concat(TypeArq,'Instalavel');
                                 VFT2_DRV_SOUND : TypeArq := Concat(TypeArq,'Multimida');
                                 End ;
                              End ;
                    VFT_FONT : Begin
                               TypeArq := Concat(TypeArq,'Fonte - Fonte ');
                               Case dwFileSubtype Of
                                  VFT2_UNKNOWN : TypeArq := Concat(TypeArq, 'Desconhecida');
                                  VFT2_FONT_RASTER : TypeArq := Concat(TypeArq,'Raster');
                                  VFT2_FONT_VECTOR : TypeArq := Concat(TypeArq,'Vetorial');
                                  VFT2_FONT_TRUETYPE : TypeArq := Concat(TypeArq,'TrueType');
                                  End ;
                               End ;
                    VFT_VXD : TypeArq := Concat ( TypeArq , 'Virtual Device' ) ;
                    VFT_STATIC_LIB: TypeArq := Concat ( TypeArq , 'Static-Link Lib.' ) ;
                    End ;
                 Log := Log + 'Passo 13' + CRLF ;
                 FileInfo.Add(TypeArq);
                 End ;
              End ;
           End ;
        End ;
     Log := Log + 'Passo 14' + CRLF ;
     Finally
     Log := Log + 'Passo 15' + CRLF ;
     FreeMem ( Buffer , Succ ( BufferSize ) ) ;
     Result := FileInfo.Text <> '' ;
     End ;
   End;
Log := Log + 'Passo FIM' + CRLF ;
End ;
}

//Function GET_INFO_EXECUTAVEL ( Var Log : String ; Var Resultado : String ) : Boolean ;
//Var Lista : TStringList ;
//Begin
//Lista := TStringList.Create ;
//Lista.Clear ;
//Result := FileVerInfo ( ParamStr(0) , Log , Lista ) ;
//Resultado := Lista.Text ;
//Lista.Free ;
//End ;

Function Conversao_COMPACTAR_DATA_HORA ( DT : TDateTime ; Var _DT : DWord ; Var _HR : DWord ) : DWord ;
Var Aux : DWord ;
Begin
Aux := YearOf ( DT ) MOD 100 ;
Aux := Aux SHL 4 ; Aux := Aux + MonthOf ( DT ) ;
Aux := Aux SHL 5 ; Aux := Aux + DayOf ( DT ) ;
Result := Aux SHL 16 ;
_DT := Aux ;
Aux := HourOf ( DT ) ;
Aux := Aux SHL 6 ; Aux := Aux + MinuteOf ( DT ) ;
Aux := Aux SHL 5 ; Aux := Aux + SecondOf ( DT ) DIV 2 ;
_HR := Aux ;
Result := Result + Aux ;
End ;

Function COUNT_DIRETORIO ( Dir : String ; Mascara : String ) : LongInt ;
Var Resultado : LongInt ;
    RecDos    : TSearchRec ;
Begin
Result := 0 ;
Resultado := RR_FindFirst ( 'COUNT_DIRETORIO', INSERE_BARRA ( Dir ) + Mascara , 0 , RecDos ) ;
While Resultado = 0 Do Begin
   If RecDos.Name[1] <> '.' Then Begin
      Inc ( Result ) ;
   End ;
   Resultado := SysUtils.FindNext ( RecDos ) ;
End ;
SysUtils.FindClose ( RecDos ) ;
End ;

(*
Function STATUS_MEMORIA ( Var _Perc_Uso : LongInt ; Var _MB_Total : LongInt ) : String ;
Begin
//Misc_MemoryStatus.dwLength := SizeOf ( MemoryStatus ) ;
//GlobalMemoryStatusEx ( Misc_MemoryStatus ) ;
FillChar(Misc_MemoryStatus, SizeOf(Misc_MemoryStatus), 0);
Misc_MemoryStatus.dwLength := SizeOf(Misc_MemoryStatus);
  // check return code for errors
Win32Check(GlobalMemoryStatusEx(Misc_MemoryStatus));
with Misc_MemoryStatus do begin
   // Size of MemoryStatus record
   _Perc_Uso := dwMemoryLoad ;
   _MB_Total := ullTotalPhys DIV _1MB ;
   Result := DateTimeToStr ( Now ) + CRLF +
      // Per-Cent of Memory in use by your system
      NUMERO(dwMemoryLoad, 8) + '% da memória em uso' + CRLF +
      // The amount of Total Physical memory allocated to your system.
      NUMERO ( ullTotalPhys DIV _1MB, 8 ) + ' MB de RAM' + CRLF +
      // The amount available of physical memory in your system.
      NUMERO ( ullAvailPhys DIV _1MB, 8 ) +
                 ' MB disponíveis na memória dísica' + CRLF +
      // The amount of Total Bytes allocated to your page file.
      NUMERO ( ullTotalPageFile DIV _1MB, 8 ) + ' MB no arquivo de paginação' + CRLF +
      // The amount of available bytes in your page file.
      NUMERO ( ullAvailPageFile DIV _1MB, 8 ) +
                ' MB disponíveis no arquivo de paginação' + CRLF +
      // The amount of Total bytes allocated to this program
      // (generally 2 gigabytes of virtual space).
      NUMERO ( ullTotalVirtual DIV _1MB, 8 ) +
                 ' MB de espaço endereçável' + CRLF +
      // The amount of avalable bytes that is left to your program to use.
      NUMERO ( ullAvailVirtual DIV _1MB, 8 ) +
                 ' MB disponíveis no espaço endereçável' + CRLF ;
end ; // with
//Linha := 'AllocMemCount = ' + IntToStr ( AllocMemCount ) + ' / ' +
///          'AllocMemSize = ' + IntToStr ( AllocMemSize ) ;
//Result := Result +
//          'AllocMemCount = ' + IntToStr ( AllocMemCount ) + CRLF +
//          'AllocMemSize = ' + IntToStr ( AllocMemSize ) ;
End ;
*)

Function C1C2 ( C1 , C2 : Char ) : Word ;
Begin
Result := Ord ( C1 ) ;
Result := Result * 256 ;
Result := Result + Ord ( C2 ) ;
End ;

Function C1C2_WORD ( C1 , C2 : Char ) : Word ;
Begin
Result := Ord ( C1 ) ;
Result := Result * 256 ;
Result := Result + Ord ( C2 ) ;
End ;

Function B1B2B3B4 ( B1 , B2, B3 , B4 : Byte ) : Cardinal ;
Begin
Result := B1 ;          Result := Result * 256 ;
Result := Result + B2 ; Result := Result * 256 ;
Result := Result + B3 ; Result := Result * 256 ;
Result := Result + B4 ;
End ;

Function B1B2 ( B1 , B2 : Byte ) : Word ;
Begin
Result := B1 ;
Result := Result * 256 ;
Result := Result + B2 ;
End ;

Function C1C2_STR ( _c1 , _c2 : Char ) : String  ;
Begin
Result := IntToStr ( Ord ( _c1 ) * 256 + Ord ( _c2 ) ) ;
End ;

Function C1C2_Byte ( _c1 , _c2 : Byte ) : Word ;
Begin
Result := _c1 * 256 + _c2 ;
End ;

Function C1C2_Byte_Str ( _c1 , _c2 : Byte ) : String ;
Begin
Result := IntToStr ( _c1 * 256 + _c2 ) ;
End ;

Function C1C2C3C4 ( _c1 , _c2 , _c3 , _c4 : Char ) : Cardinal ;
Begin
Result := Ord ( _c1 ) ;
Result := Result SHL 8 ;
Result := Result + Ord ( _c2 ) ;
Result := Result SHL 8 ;
Result := Result + Ord ( _c3 ) ;
Result := Result SHL 8 ;
Result := Result + Ord ( _c4 ) ;
End ;

Function C1C2C3C4_LongInt ( _c1 , _c2 , _c3 , _c4 : Char ) : LongInt ;
Begin
Result := Ord ( _c1 ) AND $7F ;
Result := Result SHL 8 + Ord ( _c2 ) ;
Result := Result SHL 8 + Ord ( _c3 ) ;
Result := Result SHL 8 + Ord ( _c4 ) ;
If _c1 > #127 Then Begin
   Result := - ( $7FFFFFFF - ( Result AND $7FFFFFFF ) ) ;
End ;
End ;

Function Bytes_To_Cardinal ( C1 , C2 , C3 , C4 : Byte ) : Cardinal ;
Begin
Result := C1 ;
Result := Result * 256 ; Result := Result + C2 ;
Result := Result * 256 ; Result := Result + C3 ;
Result := Result * 256 ; Result := Result + C4 ;
End ;

{
Function Char_To_Cardinal ( C1 , C2 , C3 , C4 : Char ) : Cardinal ;
Begin
Result := Ord ( C1 ) ;
Result := Result * 256 ; Result := Result + Ord ( C2 ) ;
Result := Result * 256 ; Result := Result + Ord ( C3 ) ;
Result := Result * 256 ; Result := Result + Ord ( C4 ) ;
End ;
}
Function CHAR_TO_WORD ( C1 , C2 : Char ) : Word ;
Begin
Result := Ord ( C1 ) ;
Result := Result * 256 ;
Result := Result + Ord ( C2 ) ;
End ;

Function BYTE_TO_WORD ( C1 , C2 : Byte ) : Word ;
Begin
Result := C1 ;
Result := Result * 256 ;
Result := Result + C2 ;
End ;

Function BYTE_TO_LONG ( C1, C2, C3, C4 : Byte ) : Cardinal ;
Begin
Result := C1 ;
Result := Result * 256 ;
Result := Result + C2 ;
Result := Result * 256 ;
Result := Result + C3 ;
Result := Result * 256 ;
Result := Result + C4 ;
End ;

Function WORD_TO_STR ( W : Word ) : String ;
Begin
Result := Chr ( W DIV 256 ) + Chr ( W MOD 256 ) ;
End ;

Function CARDINAL_TO_STR ( C : Cardinal ) : String ;
Begin
Result := Chr ( C SHR 24 ) +
          Chr ( ( C AND $00FFFFFF ) SHR 16 ) +
          Chr ( ( C AND $0000FFFF ) SHR 8 ) +
          Chr ( ( C AND $FF ) ) ;
End ;

Function CHAR_TO_SINGLE ( C1 , C2 , C3 , C4 : Char ) : Single ;
Var _P : ^Char ;
Begin
Try
   _P := @Result ;
   _P^ := C1 ; Inc ( _P ) ;
   _P^ := C2 ; Inc ( _P ) ;
   _P^ := C3 ; Inc ( _P ) ;
   _P^ := C4 ;
Except
   Result := -1 ;
End ;
End ;

Procedure CARDINAL_TO_CHAR ( C : Cardinal ; Var C1 : Char ; Var C2 : Char ;
                             Var C3 : Char ; Var C4 : Char ) ;
Var _P : ^Char ;
Begin
Try
   _P := @C ;
   C4 := _P^ ; Inc ( _P ) ;
   C3 := _P^ ; Inc ( _P ) ;
   C2 := _P^ ; Inc ( _P ) ;
   C1 := _P^ ;
Except
End ;
End ;

Procedure CARDINAL_TO_BYTE ( C : Cardinal ; Var C1 : Byte ; Var C2 : Byte ;
                             Var C3 : Byte ; Var C4 : Byte ) ;
Var _P : ^Byte ;
Begin
Try
   _P := @C ;
   C4 := _P^ ; Inc ( _P ) ;
   C3 := _P^ ; Inc ( _P ) ;
   C2 := _P^ ; Inc ( _P ) ;
   C1 := _P^ ;
Except
End ;
End ;

Procedure LONGWORD_TO_BYTE ( C : LongWord ; Var C1 : Byte ; Var C2 : Byte ;
                             Var C3 : Byte ; Var C4 : Byte ) ;
Var _P : ^Byte ;
Begin
Try
   _P := @C ;
   C4 := _P^ ; Inc ( _P ) ;
   C3 := _P^ ; Inc ( _P ) ;
   C2 := _P^ ; Inc ( _P ) ;
   C1 := _P^ ;
Except
End ;
End ;

Procedure LONGWORD_TO_CHAR ( C : LongWord ; Var C1 : Char ; Var C2 : Char ;
                             Var C3 : Char ; Var C4 : Char ) ;
Var _P : ^Char ;
Begin
Try
   _P := @C ;
   C4 := _P^ ; Inc ( _P ) ;
   C3 := _P^ ; Inc ( _P ) ;
   C2 := _P^ ; Inc ( _P ) ;
   C1 := _P^ ;
Except
End ;
End ;

Function CHAR_TO_CARDINAL ( C1 , C2 , C3 , C4 : Char ) : Cardinal ;
Var _P : ^Char ;
Begin
Try
   _P := @Result ;
   _P^ := C4 ; Inc ( _P ) ;
   _P^ := C3 ; Inc ( _P ) ;
   _P^ := C2 ; Inc ( _P ) ;
   _P^ := C1 ;
Except
   Result := 0 ;
End ;
End ;

Function CHAR_TO_CARDINAL_MSB ( C1 , C2 , C3 , C4 : Char ) : Cardinal ;
Var _P : ^Char ;
Begin
Try
   _P := @Result ;
   _P^ := C1 ; Inc ( _P ) ;
   _P^ := C2 ; Inc ( _P ) ;
   _P^ := C3 ; Inc ( _P ) ;
   _P^ := C4 ;
   Except
   Result := 0 ;
   End ;
End ;

Function CHAR_TO_LONGWORD ( C1 , C2 , C3 , C4 : Char ) : LongWord ;
Var _P : ^Char ;
Begin
Try
   _P := @Result ;
   _P^ := C4 ; Inc ( _P ) ;
   _P^ := C3 ; Inc ( _P ) ;
   _P^ := C2 ; Inc ( _P ) ;
   _P^ := C1 ;
Except
   Result := 0 ;
End ;
End ;

Function BYTE_TO_SINGLE ( C1 , C2 , C3 , C4 : Byte ) : Single ;
Var _P      : ^Byte ;
Begin
Try
   _P := @Result ;
   _P^ := C1 ; Inc ( _P ) ;
   _P^ := C2 ; Inc ( _P ) ;
   _P^ := C3 ; Inc ( _P ) ;
   _P^ := C4 ;
Except
   Result := -1 ;
End ;
End ;

Function BYTE_TO_SINGLE_INVERSO ( C1 , C2 , C3 , C4 : Byte ) : Single ;
Var _P      : ^Byte ;
Begin
Try
   _P := @Result ;
   _P^ := C4 ; Inc ( _P ) ;
   _P^ := C3 ; Inc ( _P ) ;
   _P^ := C2 ; Inc ( _P ) ;
   _P^ := C1 ;
Except
   Result := -1 ;
End ;
End ;

Function CHAR_TO_SINGLE_INVERSO ( C4 , C3 , C2 , C1 : Char ) : Single ;
Var _P      : ^Char ;
Begin
Try
   _P := @Result ;
   _P^ := C1 ; Inc ( _P ) ;
   _P^ := C2 ; Inc ( _P ) ;
   _P^ := C3 ; Inc ( _P ) ;
   _P^ := C4 ;
Except
   Result := -1 ;
End ;
End ;

{
Function Conversao_COMPACTAR_DATA_HORA ( DT : TDateTime ; Var _DT : DWord ; Var _HR : DWord ) : DWord ;
Var Aux : DWord ;
Begin
Aux := YearOf ( DT ) MOD 100 ;
Aux := Aux SHL 4 ; Aux := Aux + MonthOf ( DT ) ;
Aux := Aux SHL 5 ; Aux := Aux + DayOf ( DT ) ;
Result := Aux SHL 16 ;
_DT := Aux ;
Aux := HourOf ( DT ) ;
Aux := Aux SHL 6 ; Aux := Aux + MinuteOf ( DT ) ;
Aux := Aux SHL 5 ; Aux := Aux + SecondOf ( DT ) DIV 2 ;
_HR := Aux ;
Result := Result + Aux ;
End ;
}

Function Conversao_DESCOMPACTAR_DATA ( Data : Word ) : TDateTime ;
Var _Dia , _Mes , _Ano : Word ;
Begin
_Debug ( 'INI Conversao_DESCOMPACTAR_DATA [' + IntToStr ( Data ) + ']' ) ;
_Dia := Data AND $001F ;
_Mes := ( Data SHR 5 ) AND $000F ;
_Ano := ( ( Data AND $7FFF ) SHR 9 ) ;
Try
   Result := EncodeDate( 2000 + _Ano, _Mes, _Dia );
Except
   Result := -1 ;
End ;
_Debug ( 'FIM Conversao_DESCOMPACTAR_DATA [' + IntToStr ( Data ) + ']' ) ;
End ;

Function Conversao_DESCOMPACTAR_HORA ( Data : Word ) : TDateTime ;
Var _Hor   ,
    _Min   ,
    _Seg   : Word ;
Begin
_Debug ( 'INI Conversao_DESCOMPACTAR_HORA [' + IntToStr ( Data ) + ']' ) ;
_Seg := Data AND $001F * 2 ;
_Min := ( Data SHR 5 ) AND $003F ;
_Hor := ( Data SHR 11 ) ;
Try
   Result := EncodeTime (_Hor, _Min, _Seg , 0 );
Except
   Result := -1 ;
End ;
_Debug ( 'FIM Conversao_DESCOMPACTAR_HORA [' + IntToStr ( Data ) + ']' ) ;
End ;

Function Conversao_DESCOMPACTAR_DATAHORA ( Data , Hora : Word ) : TDateTime ;
Begin
Result := Conversao_DESCOMPACTAR_DATA ( Data ) + Conversao_DESCOMPACTAR_HORA ( Hora ) ;
End ;

Function DATA_HORA_DESCOMPACTADA ( DT : LongWord {; Var Str_Debug : String }) : TDateTime ;
Var _Hor ,
    _Min ,
    _Seg ,
    _Dia ,
    _Mes ,
    _Ano ,
    Data : Word ;
    C1 , C2 , C3 , C4 : Byte ;
Begin
_Debug ( 'INI DATA_HORA_DESCOMPACTADA' ) ;
CARDINAL_TO_BYTE ( DT , C1 , C2 , C3 , C4 ) ;
Data := DT SHR 16 ;
_Dia := Data AND $001F ;
_Mes := ( Data SHR 5 ) AND $000F ;
_Ano := ( ( Data AND $7FFF ) SHR 9 ) ;
_Seg := IIFN ( ( Data AND $8000 ) > 0 , 1 , 0 ) ;
_Debug ( '1 DATA_HORA_DESCOMPACTADA' ) ;
Data := Word ( DT ) ;
_Seg := _Seg + ( Data AND $001F ) * 2 ;
_Min := ( Data SHR 5 ) AND $003F ;
_Hor := ( Data SHR 11 ) ;
_Debug ( '2 DATA_HORA_DESCOMPACTADA' ) ;
If ( _Ano > 20 ) OR ( _Ano < 7 ) Then Begin
   Result := StrToDateTime ( '29/05/1972 13:10:00' )  ;
   _Debug ( 'Exit 1 DATA_HORA_DESCOMPACTADA' ) ;
   Exit ;
End ;
Try
   Result := EncodeDate ( 2000 + _Ano, _Mes, _Dia ) +
             EncodeTime ( _Hor, _Min, _Seg , 0 ) ;
Except
   Result := StrToDateTime ( '01/03/1974 13:14:00' )  ;
End ;
_Debug ( 'FIM DATA_HORA_DESCOMPACTADA' ) ;
End ;

{
Function DATA_HORA_COMPACTADA ( DT : TDateTime ) : DWord ;
Var Aux : DWord ;
    Dia ,
    Mes ,
    Ano ,
    Hora ,
    Minuto ,
    Segundo ,
    MSeg : Word ;
Begin
DecodeTime ( DT , Hora , Minuto , Segundo , MSeg ) ;
DecodeDate ( DT , Ano  , Mes , Dia ) ;
Aux := Ano MOD 100 ;
Aux := Aux SHL 4 ; Aux := Aux + Mes ;
Aux := Aux SHL 5 ; Aux := Aux + Dia ;
If Odd ( Segundo ) Then
   Aux := Aux OR $8000 ;
Result := Aux SHL 16 ;
Aux := Hora ;
Aux := Aux SHL 6 ; Aux := Aux + Minuto ;
Aux := Aux SHL 5 ; Aux := Aux + Segundo DIV 2 ;
Result := Result + Aux ;
End ;
}

Function IFColor ( Expressao : Boolean ; Str1 , Str2 : TColor ) : TColor ;
Begin
If Expressao Then Begin
   Result := Str1
End Else Begin
   Result := Str2 ;
End ;
End ;

Function IIFN1 ( Expressao : Boolean ; Str1 , Str2 : LongInt ) : LongInt ;
Begin
If Expressao Then Begin
   Result := Str1
End Else Begin
   Result := Str2 ;
End ;
End ;

Function IIFC ( Expressao : Boolean ; Str1 , Str2 : Char ) : Char ;
Begin
If Expressao Then Begin
   Result := Str1
End Else Begin
   Result := Str2 ;
End ;
End ;

Function IFSNL ( Expressao : Boolean ) : String ;
Begin
If Expressao Then Begin
   Result := 'S'
End Else Begin
   Result := 'N' ;
End ;
End ;

Function IFSN_SQL ( Expressao : Boolean ) : String ;
Begin
If Expressao Then Begin
   Result := STR_SQL ( 'S' )
End Else Begin
   Result := STR_SQL ( 'N' ) ;
End ;
End ;

Function IIFNL ( Expressao : Boolean ; Str1 , Str2 : LongInt ) : LongInt ;
Begin
If Expressao Then Begin
   Result := Str1
End Else Begin
   Result := Str2 ;
End ;
End ;

Function IIF_SG ( Expressao : Boolean ; Str1 , Str2 : TStringGrid ) : TStringGrid ;
Begin
If Expressao Then Begin
   Result := Str1
End Else Begin
   Result := Str2 ;
End ;
End ;

Function ASCII_PADRAO ( Letra : Char ) : Char ;
Const ORIGEM  = 'áéíóúãõñàèìòùâêîôûÁÉÍÓÚÃÕÑÀÈÌÒÙÂÊÎÔÎçÇªº°''´' ;
      DESTINO = 'aeiouaonaeiouaeiouAEIOUAONAEIOUAEIOIcCaoo""''' ;
Begin
Result := Letra ;
If ( Letra = #13 ) OR ( Letra = #8 ) Then Begin
   Exit ;
End ;
If Pos ( Letra , Origem ) <> 0 Then Begin
   Result := Destino [ Pos ( Letra , Origem ) ]
End Else Begin
   If ( Letra < #32 ) OR ( Letra > #127 ) Then Begin
      Result := '.'
   End Else Begin
      Result := Letra ;
   End ;
End ;
End ;

Function STRING_ASCII_PADRAO ( _Str : String ) : String ;
Var Local : LongInt ;
Begin
If Length ( _Str ) > 0 Then Begin
   For Local := 1 To Length ( _Str ) Do Begin
       _Str [ Local ] := ASCII_PADRAO ( _Str [ Local ] ) ;
   End ;
End ;
Result := _Str ;
End ;

Function STRING_ASCII_PADRAO_CRLF ( _Str : String ) : String ;
Var Local : LongInt ;
Begin
If Length ( _Str ) > 0 Then Begin
   For Local := 1 To Length ( _Str ) Do Begin
      If (_Str[Local]<>#13 ) AND (_Str[Local]<>#10) Then Begin
         _Str [ Local ] := ASCII_PADRAO ( _Str [ Local ] ) ;
      End ;
   End ;
End ;
Result := _Str ;
End ;

Function StrToFloatRic ( _Str : String ; _Default : Double ) : Double ;
Begin
PADRAO_BRASILEIRO ( 'StrToFloatRic' ) ;
While Pos ( '.' , _Str ) > 0 Do Begin
  _Str[ Pos ( '.' , _Str ) ] := ',' ;
End ;
Try
   Result := StrToFloat ( _Str ) ;
Except
   PADRAO_BRASILEIRO ( 'StrToFloatRic' ) ;
   Try
      Result := StrToFloat ( _Str ) ;
   Except
      Result := _Default ;
   End ;
End ;
End ;

Function StrToFloatRicSingle ( _Str : String ; _Default : Single ) : Single ;
Begin
PADRAO_BRASILEIRO ( 'StrToFloatRicSingle' ) ;
While Pos ( '.' , _Str ) > 0 Do Begin
  _Str[ Pos ( '.' , _Str ) ] := ',' ;
End ;
Try
   Result := StrToFloat ( _Str ) ;
Except
   PADRAO_BRASILEIRO ( 'StrToFloatRicSingle' ) ;
   Try
      Result := StrToFloat ( _Str ) ;
   Except
      Result := _Default ;
   End ;
End ;
End ;

Function DT_URL ( Data : TDateTime ) : String ;
Begin
Result := DateToStr ( Data ) ;
While Pos ( '/' , Result ) > 0 Do Begin
   Insert ( '%2F' , Result , Pos ( '/' , Result ) ) ;
   Delete ( Result, Pos ( '/' , Result ), 1 ) ;
End ;
End ;

Function HR_URL ( Data : TDateTime ) : String ;
Begin
Result := Copy ( TimeToStr ( Data ) , 1 , 5 ) ;
While Pos ( ':' , Result ) > 0 Do Begin
   Insert ( '%3A' , Result , Pos ( ':' , Result ) ) ;
   Delete ( Result, Pos ( ':' , Result ), 1 ) ;
End ;
End ;

Function IS_DIGIT ( Digito : Char ) : Boolean ;
Const NUMERAIS = '0123456789' ;
Begin
Result := Pos ( Digito , NUMERAIS ) > 0 ;
End ;

Function IS_01 ( Digito : Char ) : Boolean ;
Begin
Result := Pos ( Digito , '01' ) > 0 ;
End ;

Function IS_DATA_INVERSA ( Str : String ) : Boolean ;
Begin
Result := FALSE ;
//PUT_PROGRESSO ( FALSE, 'INI IS_DATA_INVERSA [' + Str + ']' ) ;
If Length(Str)<>8          Then Begin
   //PUT_PROGRESSO ( FALSE, 'IS_DATA_INVERSA FALSE/1' ) ;
   Exit ;
End ;
If Copy(Str,1,2)<>'20'     Then Begin
   //PUT_PROGRESSO ( FALSE, 'IS_DATA_INVERSA FALSE/2' ) ;
   Exit ;
End ;
If NOT IS_DIGIT ( Str[3] ) Then Begin
   //PUT_PROGRESSO ( FALSE, 'IS_DATA_INVERSA FALSE/3' ) ;
   Exit ;
End ;
If NOT IS_DIGIT ( Str[4] ) Then Begin
   //PUT_PROGRESSO ( FALSE, 'IS_DATA_INVERSA FALSE/4' ) ;
   Exit ;
End ;
If NOT IS_01 ( Str[5] )    Then Begin
   //PUT_PROGRESSO ( FALSE, 'IS_DATA_INVERSA FALSE/5' ) ;
   Exit ;
End ;
If NOT IS_DIGIT ( Str[6] ) Then Begin
   //PUT_PROGRESSO ( FALSE, 'IS_DATA_INVERSA FALSE/6' ) ;
   Exit ;
End ;
If NOT IS_DIGIT ( Str[7] ) Then Begin
   //PUT_PROGRESSO ( FALSE, 'IS_DATA_INVERSA FALSE/7' ) ;
   Exit ;
End ;
If NOT IS_DIGIT ( Str[8] ) Then Begin
   //PUT_PROGRESSO ( FALSE, 'IS_DATA_INVERSA FALSE/8' ) ;
   Exit ;
End ;
//PUT_PROGRESSO ( FALSE, 'IS_DATA_INVERSA TRUE [' + Str + ']' ) ;
Result := TRUE ;
End ;

var mo : HMIDIOUT ;

Const MIDI_NOTE_ON = $90;
      MIDI_NOTE_OFF = $80;
      MIDI_CHANGE_INSTRUMENT = $C0;

function MIDIEncodeMessage(Msg, Param1, Param2: byte): Integer;
begin
result := Msg + (Param1 shl 8) + (Param2 shl 16);
end;

procedure NoteOn(NewNote, NewIntensity: byte);
begin
midiOutShortMsg(mo, MIDIEncodeMessage(MIDI_NOTE_ON, NewNote, NewIntensity));
end;

procedure NoteOff(NewNote, NewIntensity: byte);
begin
midiOutShortMsg(mo, MIDIEncodeMessage(MIDI_NOTE_OFF, NewNote, NewIntensity));
end;

procedure SetInstrument(NewInstrument: byte);
begin
midiOutShortMsg(mo, MIDIEncodeMessage(MIDI_CHANGE_INSTRUMENT, NewInstrument, 0));
end;

procedure InitMIDI;
begin
midiOutOpen(@mo, 0, 0, 0, CALLBACK_NULL);
midiOutShortMsg(mo, MIDIEncodeMessage(MIDI_CHANGE_INSTRUMENT, 0, 0));
end;

Procedure GET_PROCESSOS ( Filtro : String ) ;
Var Snapshot : THandle ;
    pe       : TProcessEntry32 ;
Begin
Snapshot := CreateToolhelp32Snapshot(TH32CS_SNAPALL, 0) ;
Filtro := UpperCase ( Filtro ) ;
SetLength ( Sup.Apps, 0 ) ;
Try
  pe.dwSize := SizeOf(pe) ;
  If Process32First(Snapshot, pe) Then Begin
     While Process32Next(Snapshot, pe) Do Begin
        //Writeln(pe.szExeFile);
        If ( Filtro = '' ) OR ( Pos ( Filtro, UpperCase(pe.szExeFile) ) > 0 ) Then Begin
           SetLength ( Sup.Apps, Length ( Sup.Apps ) + 1 ) ;
           Sup.Apps[Length(Sup.Apps)-1].Nome := pe.szExeFile ;
           Sup.Apps[Length(Sup.Apps)-1].ID := pe.th32ProcessID ;
           Sup.Apps[Length(Sup.Apps)-1].cntUsage := pe.cntUsage ;
        End ;
     End ;
  End ;
Finally
  CloseHandle(Snapshot) ;
End ;
End ;

Function GET_PROCESSOS_STR ( Filtro : String ) : String ;
Var Local : LongInt ;
    Qtde  : LongInt ;
Begin
Result := '' ;
GET_PROCESSOS ( Filtro ) ;
Qtde := Length ( Sup.Apps ) ;
If Qtde = 0 Then Begin
   Exit ;
End ;
For Local := 0 To Qtde - 1 Do Begin
   Result := Result +
             Sup.Apps[Local].Nome + '@@@' +
             IntToStr ( Sup.Apps[Local].ID ) + '@@@' +
             IntToStr ( Sup.Apps[Local].CntUsage ) + sLineBreak ;
End ;
End ;

Procedure RE_ME_REMOVER_LINHAS_VAZIAS ( RE : TRichEdit ; ME : TMemo ) ;
Var Local : LongInt ;
Begin
If RE <> Nil Then Begin
   If RE.Lines.Count > 0 Then Begin
      For Local := RE.Lines.Count - 1 DownTo 0 Do Begin
         If Trim ( RE.Lines[Local] ) = '' Then Begin
            RE.Lines.Delete ( Local ) ;
         End ;
      End ;
   End ;
End ;
If ME <> Nil Then Begin
   If ME.Lines.Count > 0 Then Begin
      For Local := ME.Lines.Count - 1 DownTo 0 Do Begin
         If Trim ( ME.Lines[Local] ) = '' Then Begin
            ME.Lines.Delete ( Local ) ;
         End ;
      End ;
   End ;
End ;
End ;

Procedure REMOVER_LINHA_SG ( SG : TStringGrid ; Linha : LongInt ) ;
Var Local : LongInt ;
Begin
If SG = Nil Then Begin
   Exit ;
End ;
If Linha >= SG.RowCount Then Begin
   Exit ;
End ;
If Linha < ( SG.RowCount - 1 ) Then Begin
   For Local := Linha To SG.RowCount - 2 Do Begin
      SG.Rows[Local].Assign(SG.Rows[Local + 1]);
   End ;
End ;
SG.RowCount := SG.RowCount - 1 ;
End ;

Procedure INSERIR_LINHA_SG ( SG : TStringGrid ; Nova_Posicao, Inicial : LongInt ) ;
Var Linha : LongInt ;
Begin
If SG = Nil Then Begin
   Exit ;
End ;
If Nova_Posicao >= SG.RowCount Then Begin
   Exit ;
End ;
SG.RowCount := SG.RowCount + 1 ;
For Linha := SG.RowCount - 1 DownTo Nova_Posicao Do Begin
   SG.Rows[Linha].Assign(SG.Rows[Linha-1]);
End ;
LIMPAR_LINHA_SG ( SG, Nova_Posicao ) ;
End ;

Procedure RENUMERAR_ITENS_SG ( SG : TStringGrid ; Coluna : LongInt ) ;
Var Local : LongInt ;
Begin
If SG = Nil Then Begin
   Exit ;
End ;
If SG.RowCount < 2 Then Begin
   Exit ;
End ;
For Local := 1 To SG.RowCount - 1 Do Begin
   SG.Cells[Coluna,Local] := StrZero(Local,4) ;
End ;
End ;

Procedure LIMPAR_LINHA_SG ( SG : TStringGrid ; Linha : LongInt ) ;
Var Coluna : LongInt ;
Begin
If SG = Nil Then Begin
   Exit ;
End ;
If Linha >= SG.RowCount Then Begin
   Exit ;
End ;
For Coluna := 0 To SG.ColCount - 1 Do Begin
   SG.Cells[Coluna,Linha] := '' ;
End ;
End ;

Procedure DeleteNodeByText ( TV : TTreeview; sText : String ) ;
Var i     : Integer ;
    iItem : String ;
Begin
For i := 0 To TV.Items.Count - 1 Do Begin
   iItem := TV.Items[i].Text;
   If sText = iItem Then Begin
      TV.Items[i].Delete;
      Exit ;
   End ;
End ;
End ;

Procedure CARREGAR_EXTREMOS ( SG : TStringGrid ;
                              Linha1, Linha2, Coluna : LongInt ;
                              Var S1 : String ; Var S2 : String ;
                              Var D1 : Double ; Var D2 : Double ;
                              Var SM : String ; Var DM : Double ) ;
Begin
S1 := '' ;
S2 := '' ;
If Linha1 >= 1 Then Begin
   S1 := Trim ( SG.Cells[Coluna,Linha1] ) ;
End ;
If Linha2 <= SG.RowCount - 1 Then Begin
   S2 := Trim ( SG.Cells[Coluna,Linha2] ) ;
End ;
SM := Trim ( CALC_TIMECODE_MEDIO ( S1, S2, DM ) ) ;
D1 := HHHMMSSMMM_To_Double ( S1 ) ;
D2 := HHHMMSSMMM_To_Double ( S2 ) ;
End ;

Function CALC_TIMECODE_MEDIO ( T1, T2 : String ; Var Media : Double ) : String ;
Var T1D ,
    T2D : Double ;
Begin
T1D := HHHMMSSMMM_To_Double ( T1 ) ;
T2D := HHHMMSSMMM_To_Double ( T2 ) ;
If T1 = T2 Then Begin
   Result := HHHMMSSM ( T1D ) ;
   Exit ;
End ;
If ( T1D >= 0 ) AND ( T2D > T1D ) Then Begin
   Media := ( T1D + T2D ) / 2
End Else If ( T1D > 0 ) AND ( T2D = 0 ) Then Begin
   Media := T1D + 5
End Else Begin
   Media := 0 ;
End ;
//PUT_PROGRESSO ( FALSE, CASA_3(T1D) + ', ' + CASA_3(T2D) + ', ' + CASA_3(TM), '' ) ;
Result := HHHMMSSM ( Media ) ;
End ;

Function ExtractFileName_RR ( FN : String ) : String ;
Begin
Result := ExtractFileName ( FN ) ;
While Pos ( '/', FN ) > 0 Do Begin
   Delete ( Result , 1 , 1 ) ;
End ;
End ;

Function IS_ROW_SELECTED ( SG : TStringGrid ; Row : LongInt ) : Boolean ;
Begin
Result := ( SG.Selection.Top <= Row ) AND ( Row <= SG.Selection.Bottom ) ;
End ;

Function INT_STR_TO_SEPARADOR ( Str : String ) : String ;
Var Local : LongInt ;
Begin
Result := Str ;
If Length ( Str ) < 4 Then Begin
   Exit ;
End ;
While Length(Str) MOD 3 <> 0 Do Begin
   Str := #32 + Str ;
End ;
Result := '' ;
For Local := 1 To Length ( Str ) Do Begin
   Result := Result + Str[Local] ;
   If Local = Length ( Str ) Then Begin
      Break ;
   End ;
   If Local MOD 3 = 0 Then Begin
      Result := Result + '.' ;
   End ;
End ;
End ;

Function SIZE_TO_XB ( Size : Int64 ) : String ;
//Var Local : LongInt ;
Begin
If Size < 1000 Then Begin
   Result := COMPLETEL ( IntToStr(Size) , 7 ) + ' B '
End Else If Size < 1E6 Then Begin
   Result := COMPLETEL ( CASA_3(Size/1024) , 7 ) + ' KB'
End Else If Size < 1E9 Then Begin
   Result := COMPLETEL ( CASA_3(Size/1024/1024) , 7 ) + ' MB'
End Else If Size < 1E12 Then Begin
   Result := COMPLETEL ( CASA_3(Size/1024/1024/1024) , 7 ) + ' GB'
End Else If Size < 1E15 Then Begin
   Result := COMPLETEL ( CASA_3(Size/1024/1024/1024/1024) , 7 ) + ' TB'
End Else If Size < 1E18 Then Begin
   Result := COMPLETEL ( CASA_3(Size/1024/1024/1024/1024/1024) , 7 ) + ' PB' ;
End ;
End ;

Procedure RunDosInMemo ( DosApp : String ; AMemo : TMemo ) ;
Const ReadBuffer = 2400 ;
Var Security    : TSecurityAttributes ;
    ReadPipe    ,
    WritePipe   : THandle ;
    Start       : TStartUpInfo ;
    ProcessInfo : TProcessInformation ;
    Buffer      : Pchar ;
    BytesRead   : DWord ;
    Apprunning  : DWord ;
    Passo       : LongInt ;
Begin
Passo := 1 ;
Try
   Passo := 2 ;
   With Security Do Begin
      Passo := 3 ;
      nlength := SizeOf(TSecurityAttributes) ;
      Passo := 4 ;
      binherithandle := TRUE ;
      Passo := 5 ;
      lpsecuritydescriptor := Nil ;
      Passo := 6 ;
   End ;
   Passo := 7 ;
   If Createpipe (ReadPipe, WritePipe, @Security, 0) Then Begin
      Passo := 8 ;
      Buffer := AllocMem(ReadBuffer + 1) ;
      Passo := 9 ;
      FillChar(Start,Sizeof(Start),#0) ;
      Passo := 10 ;
      Start.cb := SizeOf(Start) ;
      Passo := 11 ;
      Start.hStdOutput := WritePipe ;
      Passo := 12 ;
      Start.hStdInput := ReadPipe ;
      Passo := 13 ;
      Start.dwFlags := STARTF_USESTDHANDLES + STARTF_USESHOWWINDOW ;
      Passo := 14 ;
      Start.wShowWindow := SW_SHOW ;
      Passo := 15 ;
      UniqueString(DosApp);
      If CreateProcess(nil ,
              PChar('cmd.exe /C ' + DosApp), //
              @Security ,
              @Security ,
              TRUE ,
              NORMAL_PRIORITY_CLASS,
              Nil ,
              Nil ,
              Start ,
              ProcessInfo) Then Begin
         Passo := 16 ;
         Repeat
            Apprunning := WaitForSingleObject (ProcessInfo.hProcess,100) ;
            Application.ProcessMessages ;
         Until ( Apprunning <> WAIT_TIMEOUT ) OR
               ( Application.Terminated ) OR
               ( FLAG_FINALIZAR ) ;
         Passo := 17 ;
         Repeat
            BytesRead := 0 ;
            ReadFile(ReadPipe,Buffer[0], ReadBuffer,BytesRead,nil) ;
            Buffer[BytesRead]:= #0 ;
            OemToAnsi(PAnsiChar(Buffer), PAnsiChar(Buffer) ) ;
            AMemo.Text := AMemo.text + String(Buffer) ;
         Until ( BytesRead < ReadBuffer ) OR
               ( Application.Terminated ) OR
               ( FLAG_FINALIZAR ) ;
         Passo := 18 ;
      End ;
      Passo := 19 ;
      FreeMem(Buffer) ;
      Passo := 20 ;
      CloseHandle(ProcessInfo.hProcess) ;
      Passo := 21 ;
      CloseHandle(ProcessInfo.hThread) ;
      Passo := 22 ;
      CloseHandle(ReadPipe) ;
      Passo := 23 ;
      CloseHandle(WritePipe) ;
      Passo := 24 ;
   End ;
   Passo := 25 ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception RunDosInMemo passo ' + IntToStr(Passo) + LFLF +
                'Comando: ' + DosApp + LFLF +
                'Mensagem: ' + E.Message ) ;
   End ;
End ;
End ;

Function FN_MINI_EXTRAIR_EXTENSAO ( FN : String ) : String ;
Var Extensao : String ;
Begin
Extensao := ExtractFileExt ( FN ) ;
FN := ExtractFileName ( FN ) ;
Result := StringReplace ( FN, Extensao, '', [rfReplaceAll, rfIgnoreCase]) ;
End ;

Function FN_EXTRAIR_EXTENSAO ( FN : String ) : String ;
Var Extensao : String ;
Begin
Extensao := ExtractFileExt ( FN ) ;
Result := StringReplace ( FN, Extensao, '', [rfReplaceAll, rfIgnoreCase]) ;
End ;

Procedure EXECUTAVEL ( Const aCommando, Parametro : String ) ;
//var tmpStartupInfo        : TStartupInfo ;
//    tmpProcessInformation : TProcessInformation ;
//    tmpProgram            : String ;
Begin
//RunCommand('cmd', ['/c', 'dir'], output, [poNoConsole]);
ShellExecute(0, nil,PChar(aCommando), PChar(Parametro), nil, SW_MAXIMIZE ) ;
End ;

Procedure ExecuteAndWait ( Const aCommando : String ) ;
//var tmpStartupInfo        : TStartupInfo ;
//    tmpProcessInformation : TProcessInformation ;
//    tmpProgram            : String ;
Begin
//RunCommand('cmd', ['/c', 'dir'], output, [poNoConsole]);
ShellExecute(0, nil, 'cmd.exe', PChar('/C ' + aCommando), nil, SW_MINIMIZE ) ;
{
tmpProgram := trim(aCommando);
FillChar(tmpStartupInfo, SizeOf(tmpStartupInfo), 0);
With tmpStartupInfo Do
   Begin
   cb := SizeOf(TStartupInfo);
   wShowWindow := SW_SHOW;
   End ;
If CreateProcess ( nil, pchar(tmpProgram), nil, nil, true, CREATE_NO_WINDOW,
                   nil, nil, tmpStartupInfo, tmpProcessInformation) Then
   Begin
   // loop every 10 ms
   While WaitForSingleObject(tmpProcessInformation.hProcess, 10) > 0 Do
      Begin
      Application.ProcessMessages ;
      If FLAG_FINALIZAR OR Application.Terminated Then
         Break ;
      End ;
   CloseHandle(tmpProcessInformation.hProcess) ;
   CloseHandle(tmpProcessInformation.hThread) ;
   End
   Else
   Begin
   RaiseLastOSError ;
   End ;
}
End ;

Function CONTAR_CARACTERES ( Str : String ; Caracter : Char ) : LongInt ;
Var Local : LongInt ;
Begin
Result := 0 ;
If Str = '' Then Begin
   Exit ;
End ;
For Local := 1 To Length ( Str ) Do Begin
   If Str[Local] = Caracter Then Begin
      Inc ( Result ) ;
   End ;
End ;
End ;

Function FORMATAR_METADADOS ( FN_Full, Str : String ) : String ;
Var Lista : TStringList ;
    Local : LongInt ;
    Aux   : String ;
Begin
Lista := TStringList.Create ;
Lista.Text := Str ;
Result := Str ;
If CONTAR_CARACTERES ( Str, '=' ) < Lista.Count Then Begin
   Result := '' ;
   For Local := 0 To Lista.Count - 1 Do Begin
      Aux := Lista[Local] ;
      While Pos ( #32#32 , Aux ) > 0 Do Begin
         Aux := StringReplace ( Aux, #32#32, #32, [rfReplaceAll] ) ;
      End ;
      While ( Pos ( #32 , Aux ) > 0 ) AND ( Pos ( #32 , Aux ) < Pos ( ':' , Aux ) ) Do Begin
         Delete ( Aux, Pos ( #32 , Aux ), 1 ) ;
      End ;
      If Pos ( ':', Aux ) > 0 Then Begin
         Aux [ Pos ( ':', Aux ) ] := '=' ;
      End ;
      Aux := StringReplace ( Aux, '= ', '=', [rfReplaceAll] ) ;
      Result := Result + Aux + #13#10 ;
   End ;
   If Trim ( Str ) <> Trim ( Result ) Then Begin
      //ShowMessage_Old ( 'Gravando' + LF + Result ) ;
      WRITE_FILE_CORE ( 'FORMATAR_METADADOS',
                        FN_Full, Result, DELAYED_FALSE ) ;
   End ;
End ;
//ShowMessage_Old ( 'Caracteres: ' + IntToStr ( CONTAR_CARACTERES ( Str, '=' ) ) + LF +
//              'Linhas: ' + IntToStr ( Lista.Count ) ) ;
Lista.Free ;
//Result := Str ;
End ;

Function GET_DADOS_METADADOS ( Origem, FN : String ) : String ;
Begin
FN := GET_FN_METADADOS ( FN ) ;
Result := GET_CONTEUDO_M ( 'GET_DADOS_METADADOS/' + Origem , FN ) ;
Result := FORMATAR_METADADOS ( FN, Result ) ;
End ;

Function GET_FN_METADADOS ( FN : String ) : String ;
Begin
Result := DIR_BASE_VIDEO_META + FN_MINI_EXTRAIR_EXTENSAO ( FN ) + '.txt' ;
End ;

Function GET_PRIMEIRO_ARQUIVO ( FN : String ; Mascara : String ) : String ;
Var RecDos    : TSearchRec ;
    Resultado : LongInt ;
Begin
Result := '' ;
Resultado := RR_FindFirst ( 'GET_PRIMEIRO_ARQUIVO',
                            INSERE_BARRA(FN) + Mascara, 255, RecDos ) ;
While Resultado = 0 Do Begin
   If ( RecDos.Attr AND faDirectory ) = 0 Then Begin
      Result := INSERE_BARRA ( FN ) + RecDos.Name ;
      Break ;
   End ;
   Resultado := SysUtils.FindNext ( RecDos ) ;
End ;
SysUtils.FindClose ( RecDos ) ;
End ;

Function GET_DURACAO_MEDIA ( FN : String ) : Double ;
Begin
Result := -1 ;
End ;

Procedure OPEN_URL ( URL : String ) ;
Begin
URL := StringReplace(URL, '"', '%22', [rfReplaceAll]);
ShellExecute(0, 'open', PChar(URL), nil, nil, SW_SHOWNORMAL);
End ;

Function COMANDO_FFMPEG_EXTRAIR_AUDIO ( Dir_Base2 : String ;
                                        FN_Video : String ;
                                        Var Comando : String ;
                                        Var Parametros : String ) : String ;
Var FN_Audio : String ;
Begin
If Dir_Base <> '' Then Begin
   FN_Audio := Dir_Base2 + RETIRAR_EXTENSOES_AUDIO_VIDEO ( ExtractFileName(FN_Video) ) + '.wav'
End Else Begin
   FN_Audio := INSERE_BARRA ( ExtractFilePath ( FN_Video ) ) +
               RETIRAR_EXTENSOES_AUDIO_VIDEO ( ExtractFileName(FN_Video) ) + '.wav' ;
End ;
Comando := Diretorio + 'ffmpeg\bin\ffmpeg.exe' ;
Parametros := ' -y -i "' + FN_Video + '" "' + FN_Audio + '"' ;
Result := Comando + ' ' + Parametros ;
End ;

Function COMANDO_FFMPEG_CONVERTER_PARA_FORMATO ( Dir_Convertido : String ;
                                                 FN_Video : String ;
                                                 Dir_MP3 : String ;
                                                 Formato : String ;
                                                 Opcoes : String ;
                                                 Var Comando : String ;
                                                 Var Parametros : String ) : String ;
//Var FN_Audio : String ;
Begin
//If Dir_Base <> '' Then
//   FN_Audio := Dir_Base2 + RETIRAR_EXTENSOES_AUDIO_VIDEO ( ExtractFileName(FN_Video) ) + '.wav'
//   Else
//   FN_Audio := INSERE_BARRA ( ExtractFilePath ( FN_Video ) ) +
//               RETIRAR_EXTENSOES_AUDIO_VIDEO ( ExtractFileName(FN_Video) ) + '.wav' ;
Comando := Diretorio + 'ffmpeg\bin\ffmpeg.exe' ;
Parametros := ' -y -i "' + FN_Video + '" ' + Opcoes + ' "' +
              Dir_Convertido + FN_EXTRAIR_EXTENSAO ( ExtractFileName ( FN_Video ) ) + '.' + Formato + '"' ;
Result := Comando + ' ' + Parametros ;
BATCH_INICIALIZAR ;
BATCH_ADD ( 'Echo 1 > "' + Diretorio + 'convertendo.txt' + '"' ) ;
BATCH_ADD ( Result ) ;
Comando := Diretorio + 'ffmpeg\bin\ffmpeg.exe' ;
Parametros := ' -y -i "' + FN_Video + '" "' +
              Dir_MP3 + FN_EXTRAIR_EXTENSAO ( ExtractFileName ( FN_Video ) ) + '.wav' + '"' ;
Result := Comando + ' ' + Parametros ;
BATCH_ADD ( Result ) ;
BATCH_ADD ( 'Del "' + Diretorio + 'convertendo.txt' + '"' ) ;
BATCH_EXECUTE ( 'CONVERTER_VIDEO_PARA_WMV', FALSE, FALSE ) ;
End ;

Function COMANDO_FFMPEG_CORTAR_VIDEO ( FN : String ; Posicao : String ;
                                       FN_New : String ;
                                       Var Comando : String ;
                                       Var Parametros : String ) : String ;
Begin
Delete ( Posicao , 1 , 1 ) ;
While Pos ( ',', Posicao ) > 0 Do Begin
   Posicao [ Pos ( ',', Posicao ) ] := '.' ;
End ;
Comando := DIR_BASE_SISTEMA + 'ffmpeg\bin\ffmpeg.exe' ;
Parametros := ' -ss ' + Posicao + ' -y -i "' + FN_New + '" ' +
              '-t 04:00:00.000 -c copy "' + FN + '"' ;
Result := Comando + ' ' + Parametros ;
End ;

Procedure CORTAR_VIDEO ( Dir_Base2 : String ; FN : String ; Posicao : String ) ;
Var Comando           : String ;
    Parametros        : String ;
    FN_New            : String ;
    Cmd_Extrair_Audio : String ;
    Cmd_Cortar_Video  : String ;
Begin
FN_New := INSERE_BARRA ( ExtractFilePath ( FN ) ) + 'new.' + ExtractFileName ( FN ) ;
Cmd_Extrair_Audio := COMANDO_FFMPEG_EXTRAIR_AUDIO ( Dir_Base2, FN, Comando, Parametros ) ;
Cmd_Cortar_Video := COMANDO_FFMPEG_CORTAR_VIDEO ( FN, Posicao,
                                                  FN_New, Comando, Parametros ) ;
If RenameFile ( FN, FN_NEW ) Then Begin
End ;
BATCH_INICIALIZAR ;
BATCH_ADD ( Cmd_Cortar_Video ) ;
BATCH_ADD ( 'DEL ' + FN_New ) ;
BATCH_ADD ( Cmd_Extrair_Audio ) ;
BATCH_EXECUTE ( 'CORTAR_VIDEO', FALSE, FALSE ) ;
End ;

Procedure CONVERTER_VIDEO_PARA_AUDIO ( FN_Video : String ; Posicao : String ) ;
Var Comando           : String ;
    Parametros        : String ;
    FN_New            : String ;
    Cmd_Extrair_Audio : String ;
Begin
FN_New := INSERE_BARRA ( ExtractFilePath ( FN_Video ) ) + 'new.' + ExtractFileName ( FN_Video ) ;
Cmd_Extrair_Audio := COMANDO_FFMPEG_EXTRAIR_AUDIO ( '', FN_New, Comando, Parametros ) ;
If RenameFile ( FN_Video, FN_New ) Then Begin
End ;
BATCH_INICIALIZAR ;
//BATCH_ADD ( Cmd_Cortar_Video ) ;
//BATCH_ADD ( 'DEL ' + FN_New ) ;
BATCH_ADD ( Cmd_Extrair_Audio ) ;
BATCH_EXECUTE ( 'EXTRAIR_VIDEO', FALSE, FALSE ) ;
End ;

Procedure BATCH_INICIALIZAR ;
Begin
SL_Batch.Clear ;
End ;

Procedure BATCH_ADD ( Linha : String ) ;
Begin
SL_Batch.Add ( Linha ) ;
End ;

Procedure BATCH_EXECUTE ( Tag : String ; Show : Boolean ; Pause : Boolean ) ;
Var FN_BAT     : String ;
Begin
FN_BAT := Diretorio + 'Bat_' + Tag + '.BAT' ;
If Pause Then Begin
   BATCH_ADD ( 'PAUSE' ) ;
End ;
WRITE_FILE_CORE ( 'BATCH_EXECUTE',
                  FN_BAT, SL_Batch.Text, DELAYED_FALSE ) ;
If Show Then Begin
   ShellExecute ( 0, nil, PChar(FN_BAT), Nil, nil, SW_NORMAL )
End Else Begin
   ShellExecute ( 0, nil, PChar(FN_BAT), Nil, nil, SW_HIDE ) ;
End ;
PUT_LOG ( 'BATCH [' + FN_BAT + ']' ) ;
End ;

Function ASCII_CC ( Letra : Char ) : Char ;
Const ORIGEM  = 'áéíóúçñ' +               'ÁÉÍÓÚÇÑ' +
                'ãõàèìòùâêîôûÃÕÀÈÌÒÙÂÊÎÔÎªº°´' +
                '\' + #10 +
                '''' ;
      DESTINO = #42#92#94#95#96#123#126 + #42#92#94#95#96#123#125 +
                'aoaeiouaeiouAOAEIOUAEIOIaoo"' +
                #13 + ' ' +
                '"' ;
Begin
If Pos ( Letra , Origem ) <> 0 Then Begin
   Result := Destino [ Pos ( Letra , Origem ) ]
End Else Begin
   Result := Letra ;
End ;
End ;

Function STRING_ASCII_CC ( _Str : String ) : String ;
Var Local : LongInt ;
Begin
If Length ( _Str ) > 0 Then Begin
   For Local := 1 To Length ( _Str ) Do Begin
       _Str [ Local ] := ASCII_CC ( _Str [ Local ] ) ;
   End ;
End ;
Result := _Str ;
End ;

Function CONVERTER_TEXTO_CAPTADO ( Aux : String ) : String ;
Var Lista : TStringList ;
    Local : LongInt ;
    Qtde  : LongInt ;
    Aux1  ,
    Aux2  : String ;
Begin
Aux := ' ' + Aux + ' ' ;
Aux := StringReplace ( Aux , ' SETAS ', '>>' , [rfReplaceAll, rfIgnoreCase] ) ;
Aux := StringReplace ( Aux , ' DOIS PONTOS ', ': ' , [rfReplaceAll, rfIgnoreCase] ) ;
Aux := StringReplace ( Aux , ' PONTO E VIRGULA ', '; ' , [rfReplaceAll, rfIgnoreCase] ) ;
Aux := StringReplace ( Aux , ' PONTO E VÍRGULA ', '; ' , [rfReplaceAll, rfIgnoreCase] ) ;
Aux := StringReplace ( Aux , ' PONTO FINAL ', '.' + #13#10 , [rfReplaceAll, rfIgnoreCase] ) ;
If ( Pos ( ' PONTO A SER ' , Aux ) = 0 ) AND
   ( Pos ( ' PONTO DE ' , Aux ) = 0 ) AND
   ( Pos ( ' PONTO MÉDIO ', Aux ) = 0 ) AND
   ( Pos ( ' PONTO MEDIO ', Aux ) = 0 ) Then Begin
   Aux := StringReplace ( Aux , ' PONTO ', '.' + #13#10 , [rfReplaceAll, rfIgnoreCase] ) ;
End ;
Aux := StringReplace ( Aux , ' VIRGULA ', ', ' , [rfReplaceAll, rfIgnoreCase] ) ;
Aux := StringReplace ( Aux , ' VÍRGULA ', ', ' , [rfReplaceAll, rfIgnoreCase] ) ;
Aux := StringReplace ( Aux , ' E POSSIVEL ', ' É POSSIVEL ' , [rfReplaceAll, rfIgnoreCase] ) ;
Aux := StringReplace ( Aux , 'PIS COFINS', 'PIS/COFINS' , [rfReplaceAll, rfIgnoreCase] ) ;
Aux := StringReplace ( Aux , ' PODEMOS SIM', ' PODEMOS SIM, ' , [rfReplaceAll, rfIgnoreCase] ) ;
Aux := StringReplace ( Aux , ' EXCLAMAÇÃO', '!' + #13#10 , [rfReplaceAll, rfIgnoreCase] ) ;
Aux := StringReplace ( Aux , ' EXCLAMACAO', '!' + #13#10 , [rfReplaceAll, rfIgnoreCase] ) ;
Aux := StringReplace ( Aux , ' :', ': ' , [rfReplaceAll, rfIgnoreCase] ) ;
Aux := StringReplace ( Aux , ' .', '.' , [rfReplaceAll, rfIgnoreCase] ) ;
Aux := StringReplace ( Aux , ' ,', ', ' , [rfReplaceAll, rfIgnoreCase] ) ;
Aux := StringReplace ( Aux , '[]', '', [rfReplaceAll, rfIgnoreCase] ) ;
//
Aux := StringReplace ( Aux , '\\' , #13#10, [rfReplaceAll, rfIgnoreCase] ) ;
Aux := StringReplace ( Aux , '>>', #13#10 + '>>' , [rfReplaceAll, rfIgnoreCase] ) ;
Aux := StringReplace ( Aux , '.', '.' + #13#10 , [rfReplaceAll, rfIgnoreCase] ) ;
Aux := StringReplace ( Aux , ':', ':' + #13#10 , [rfReplaceAll, rfIgnoreCase] ) ;
Aux := StringReplace ( Aux , ';', '; ' + #13#10 , [rfReplaceAll, rfIgnoreCase] ) ;
Aux := StringReplace ( Aux , '?', '?' + #13#10 , [rfReplaceAll, rfIgnoreCase] ) ;
Aux := StringReplace ( Aux , '!', '!' + #13#10 , [rfReplaceAll, rfIgnoreCase] ) ;
//
Aux := StringReplace ( Aux , ' MAS ', ', MAS ' + #13#10 , [rfReplaceAll, rfIgnoreCase] ) ;
//Aux := StringReplace ( Aux , 'MAS ', 'MAS, ' + #13#10 , [rfReplaceAll, rfIgnoreCase] ) ;
Aux := StringReplace ( Aux , '  ', ' ' , [rfReplaceAll, rfIgnoreCase] ) ;
Aux := StringReplace ( Aux , ' OK OK ', ' OK ' , [rfReplaceAll, rfIgnoreCase] ) ;
Aux := StringReplace ( Aux , ' BARRA BARRA ', ' [[]] ' , [rfReplaceAll, rfIgnoreCase] ) ;
Aux := StringReplace ( Aux , ' BARRA DUPLA ', ' [[]] ' , [rfReplaceAll, rfIgnoreCase] ) ;
Aux := StringReplace ( Aux , ' ' + TERMO_FALANTE + ' ' + TERMO_FALANTE + ' ',
                             ' ' + TERMO_FALANTE + ' ' , [rfReplaceAll, rfIgnoreCase] ) ;
Aux := StringReplace ( Aux , #13#10#13#10, #13#10 , [rfReplaceAll, rfIgnoreCase] ) ;
Aux := StringReplace ( Aux , ',,', ',' , [rfReplaceAll, rfIgnoreCase] ) ;
If Aux <> '' Then Begin
   //Lista := TStringList.Create ;
   Lista := Explode_Simples ( Aux, ' ' ) ;
   Qtde := Lista.Count ;
   For Local := 0 To Qtde - 2 Do Begin
      Aux1 := Trim ( Lista[Local] ) ;
      Aux2 := Trim ( Lista[Local+1] ) ;
      //PUT_PROGRESSO( FALSE, 'Aux1 [' + Aux1 + '][' + Aux2 + ']', '' ) ;
      If Aux1 = '[[]]' Then Begin
         //PUT_PROGRESSO( FALSE, 'ALTERANDO BB Aux1 [' + Aux1 + '][' + Aux2 + ']', '' ) ;
         Lista[Local] := #13#10 + '[' + Aux2 + ']' + '\\' ;
         Lista[Local+1] := '' ;
      End ;
      If Aux1 = TERMO_FALANTE Then Begin
         //PUT_PROGRESSO( FALSE, 'ALTERANDO FALANTE Aux1 [' + Aux1 + '][' + Aux2 + ']', '' ) ;
         Lista[Local] := #13#10 + '>>[' + Aux2 + ']: ' ;
         Lista[Local+1] := '' ;
      End ;
   End ;
   Aux := '' ;
   For Local := 0 To Qtde - 1 Do Begin
      Aux := Aux + Lista[Local] + #32 ;
   End ;
   Lista.Free ;
End ;
Aux := StringReplace ( Aux , '\\' , #13#10, [rfReplaceAll, rfIgnoreCase] ) ;
Aux := StringReplace ( Aux , '  ', ' ' , [rfReplaceAll, rfIgnoreCase] ) ;
Aux := StringReplace ( Aux , #13#10#13#10, #13#10 , [rfReplaceAll, rfIgnoreCase] ) ;
Result := Trim ( Aux ) ;
End ;

Procedure SetPNGOpacity ( Image : TImage; Alpha: Byte ) ;
Var Bmp     : TBitmap ;
    BlendFn : TBlendFunction ;
    PNG     : TPNGImage ;
Begin
Png := TPngImage.Create ;
Png.Assign(TPNGImage(Image.Picture.Graphic)) ;
Bmp := TBitmap.Create ;
Bmp.Assign(Png) ;
Image.Picture.Bitmap.PixelFormat := pf32bit ;
Image.Picture.Bitmap.AlphaFormat := afPremultiplied ;
Image.Picture.Bitmap.Canvas.Brush.Color := clBlack ;
Image.Picture.Bitmap.SetSize(Png.Width, Png.Height) ;
BlendFn.BlendOp := AC_SRC_OVER ;
BlendFn.BlendFlags := 0 ;
BlendFn.SourceConstantAlpha := Alpha ;
BlendFn.AlphaFormat := AC_SRC_ALPHA ;
Windows.AlphaBlend(
    Image.Picture.Bitmap.Canvas.Handle,
    0, 0, Image.Picture.Bitmap.Width,
    Image.Picture.Bitmap.Height,
    Bmp.Canvas.Handle,
    0, 0, Bmp.Width,
    Bmp.Height,
    BlendFn ) ;
Bmp.FreeImage ;
Bmp.Free ;
Png.Free ;
End ;

Function REMOVER_STRING ( Var Str : String ; Particula : String ) : String ;
Begin
While Pos ( Particula, Str ) > 0 Do Begin
   Str := StringReplace ( Str , Particula, '', [rfReplaceAll, rfIgnoreCase] ) ;
End ;
Result := Str ;
End ;

Function SUBSTITUIR_STRING ( Var Str : String ; _Inicial, _Final : String ) : String ;
Begin
While Pos ( _Inicial, Str ) > 0 Do Begin
   Str := StringReplace ( Str , _Inicial, _Final, [rfReplaceAll, rfIgnoreCase] ) ;
End ;
Result := Str ;
End ;

Function REMOVE_BARRA_DUPLA ( Str : String ) : String ;
Begin
Str := StringReplace ( Str, '\\', '\', [rfReplaceAll] ) ;
Str := StringReplace ( Str, '//', '/', [rfReplaceAll] ) ;
Result := Str ;
End ;

Procedure OPEN_FILE_EXPLORER ( FN : String ) ;
Begin
If NOT RR_FileExists ( 'OPEN_FILE_EXPLORER', FN ) Then Begin
   PUT_LOG ( 'Arquivo não encontrado' + LFLF +
             FN ) ;
   Exit ;
End ;
ShellExecute ( Application.Handle, 'open', 'explorer.exe',
               PChar('/select,"' + FN+'"'), nil, SW_NORMAL);
End ;

Procedure OPEN_FOLDER_EXPLORER ( FN : String ) ;
Begin
CHECAR_DIRETORIO_DIRNAME ( FN ) ;
If NOT DirectoryUsable  ( FN ) Then Begin
   PUT_LOG ( 'Diretório não encontrado' + LFLF +
             FN ) ;
   Exit ;
End ;
ShellExecute ( Application.Handle, 'open', 'explorer.exe',
               PChar('/select,"' + FN+'"'), nil, SW_NORMAL);
End ;

Procedure OPEN_FILE_NOTEPAD ( FN : String ) ;
Begin
If NOT RR_FileExists ( 'OPEN_FILE_NOTEPAD', FN ) Then Begin
   PUT_LOG ( 'Arquivo não encontrado' + LFLF +
             FN ) ;
   Exit ;
End ;
ShellExecute ( Application.Handle, 'open', 'notepad.exe',
               PChar('"' + FN+'"'), nil, SW_NORMAL);
End ;

Procedure PUT_CLIPBOARD ( _Form : TForm ; _Str : String ) ;
Var Memo : TMemo ;
begin
_Debug ( 'INI PUT_CLIPBOARD' ) ;
Memo := TMemo.Create ( _Form ) ;
Memo.Parent := _Form ;
Memo.Lines.Clear ;
Memo.Text := _Str ;
Memo.SelectAll ;
Memo.CopyToClipboard ;
Memo.Free ;
_Debug ( 'FIM PUT_CLIPBOARD' ) ;
End ;

Procedure COPIAR_TEXTO ( _Form : TForm ; Texto : String ) ;
Var RE        : TRichEdit ;
Begin
_Debug ( 'INI COPIAR_TEXTO' ) ;
RE := TRichEdit.Create ( _Form ) ;
RE.Parent := _Form ;
RE.Visible := FALSE  ;
RE.Width := 1024 ;
RE.Height := 0 ;
RE.Text := Texto ;
RE.SelectAll ;
RE.CopyToClipBoard ;
RE.Free ;
_Debug ( 'FIM COPIAR_TEXTO' ) ;
End ;

Function COLAR_TEXTO ( _Form : TForm ) : String ;
Var RE        : TRichEdit ;
Begin
_Debug ( 'INI COPIAR_TEXTO' ) ;
RE := TRichEdit.Create ( _Form ) ;
RE.Parent := _Form ;
RE.Visible := FALSE  ;
RE.Width := 1024 ;
RE.Height := 100 ;
RE.PasteFromClipBoard ;
Result := RE.Text ;
RE.Free ;
_Debug ( 'FIM COPIAR_TEXTO' ) ;
End ;

Function SEGUNDOS_TO_MMSS_CRONO ( CONTADOR : LongInt ) : String ;
Begin
Result := StrZero ( CONTADOR DIV 60 , 1 ) + ':' + StrZero ( CONTADOR MOD 60 , 2 ) ;
End ;

Function SEGUNDOS_TO_MMSS_CRONO_RESUMIDO ( CONTADOR : LongInt ) : String ;
Begin
Result := StrZero ( CONTADOR DIV 60 , 2 ) + ':' + StrZero ( CONTADOR MOD 60 , 2 ) ;
While ( Result[1] = '0' ) OR ( Result[1] = ':' ) Do Begin
   Delete ( Result , 1 , 1 ) ;
   If Result = '' Then Begin
      Result := '0' ;
      Break ;
   End ;
End ;
End ;

Function tbKeyIsDown ( Const Key : Integer ) : Boolean ;
Begin
Result := ( GetKeyState ( Key ) AND 128 ) > 0 ;
End ;

Function IS_CTRL : Boolean ;
Begin
Result := tbKeyIsDown(VK_CONTROL) ;
End ;

Function IS_ALT : Boolean ;
Begin
Result := tbKeyIsDown(VK_MENU) ;
End ;

Function IS_SHIFT : Boolean ;
Begin
Result := tbKeyIsDown(VK_SHIFT) ;
End ;

{
Function HexToInt ( _Hexa : String ) : Cardinal ;
Const HEXA : String = '0123456789ABCDEF' ;
Begin
Result := 0 ;
_Hexa := Trim ( UpperCase ( _Hexa ) ) ;
If Length ( _Hexa ) = 0 Then
   Exit ;
While Length ( _Hexa ) > 0 Do
   Begin
   Result := Result * 16 ;
   Result := Result + Pos ( _Hexa[1] , HEXA ) - 1 ;
   Delete ( _Hexa , 1 , 1 ) ;
   End ;
End ;
}

Function GET_COLOR_HTML ( Cor : String ) : LongInt ;
Begin
Cor := Trim ( Cor ) ;
//ShowMessage_Old ( 'Param: [' + Cor + ']' ) ;
If Pos ( '#' , Cor ) = 1 Then Begin
   Delete ( Cor , 1 , 1 ) ;
   Result := HexToInt ( Cor ) ;
   //ShowMessage_Old ( 'Cor: [' + Cor + ']' + LF +
   //              'Result: [' + IntToStr ( Result ) + ']' ) ;
   Exit ;
End ;
If StrToIntDef ( Cor , -1 ) >= 0 Then Begin
   Result := StrToIntDef ( Cor , -1 ) ;
   Exit ;
End ;
Result := -1 ;
End ;

Procedure ShowMessage_Old ( Msg : String ) ;
Begin
MessageBox ( Application.MainForm.Handle, PChar(Msg), PChar(Msg), MB_OK ) ;
End ;

Procedure PUT_LOG_EVENTO ( LB : TListBox ; Rolagem : Boolean ; Str : String ) ;
Begin
Try
   If NOT Assigned ( LB ) Then Begin
      Exit ;
   End ;
   LB.Items.Add ( Str ) ;
   _Debug ( 'EVT ' + LB.Name + ' ' + Str ) ;
   If Rolagem Then Begin
      LB.ItemIndex := LB.Items.Count - 1 ;
   End ;
Except
End ;
End ;

Function FORMATAR_COMANDO_RR_LINK ( Conteudo : String ) : String ;
Begin
Result := '[R]' + Conteudo + '[/R]' ;
End ;

Procedure SALVAR_LB_LOGS ;
Var Dir : String ;
Begin
Dir := Diretorio + 'Config\Logs\' + DATA_INVERSA(Now) + '\' ;
CHECAR_DIRETORIO_DIRNAME ( Dir ) ;
Try
   Log.LB_Main.Items.SaveToFile ( Dir + DATAHORA_INVERSA(Now) + '_Log_LB_Main.log' ) ;
   Log.LB_Erros.Items.SaveToFile ( Dir + DATAHORA_INVERSA(Now) + '_Log_LB_Erros.log' ) ;
   Log.LB_FileExists.Items.SaveToFile ( Dir + DATAHORA_INVERSA(Now) + '_Log_LB_FileExists.log' ) ;
   Log.LB_IMG.Items.SaveToFile ( Dir + DATAHORA_INVERSA(Now) + '_Log_LB_IMG.log' ) ;
   Log.LB_DirMon.Items.SaveToFile ( Dir + DATAHORA_INVERSA(Now) + '_Log_LB_DirMon.log' ) ;
   Log.LB_Excecoes.Items.SaveToFile ( Dir + DATAHORA_INVERSA(Now) + '_Log_LB_Excecoes.log' ) ;
   Log.LB_PushPop.Items.SaveToFile ( Dir + DATAHORA_INVERSA(Now) + '_Log_LB_PushPop.log' ) ;
   Log.LB_Atencao.Items.SaveToFile ( Dir + DATAHORA_INVERSA(Now) + '_Log_LB_Atencao.log' ) ;
Except
End ;
End ;

Procedure EXPURGAR_LB ( LB : TListBox ; Pico, Qtde : LongInt ) ;
Var Local : LongInt ;
Begin
PUSH_TICK ( 'EXPURGAR_LB' ) ;
While LB.Items.Count > Pico Do Begin
   For Local := 0 To Qtde Do Begin
      LB.Selected[Local] := TRUE ;
   End ;
   LB.DeleteSelected ;
End ;
POP_TICK ( 'EXPURGAR_LB [' + LB.Name + ']' ) ;
End ;

Procedure TH_PUT_LOG ;
Var Decorrido : Cardinal ;
    Texto     : String ;
Begin
If NOT Assigned ( Log ) Then Begin
   Inc ( Cnt_Log_Not_Assigned ) ;
   If Cnt_Log_Not_Assigned = 1 Then Begin
      //ShowMessage ( 'Exit Log Not Assigned' + sLineBreak + sLineBreak +
      //              TEXTO_PUT_LOG ) ;
   End ;
   Exit ;
End ;
Try
   If NOT PUT_LOG_ATIVO Then Begin
      Exit ;
   End ;
   Texto := TEXTO_PUT_LOG ;
   If Last_Put_Log = 0 Then Begin
      Last_Put_Log := GetTickCount ;
   End ;
   Misc_Log_Indice := ( Misc_Log_Indice + 1 ) MOD 1000 ;
   Decorrido := GetTickCount - Last_Put_Log ;
   Last_Put_Log := GetTickCount ;
   Try
      If LOG_USAR_TICK Then Begin
         Texto := TimeToStr ( Now ) +
                  // '.' + StrZero(Misc_Log_Indice,3) +
                  #32 + IntToStr(Decorrido) + #32 + Texto
      End Else Begin
         Texto := TimeToStr ( Now ) +
                  //'.' + StrZero(Misc_Log_Indice,3) +
                  #32 + Texto ;
      End ;
      If Misc_Log_Timeout > 0 Then Begin
         If Decorrido < Misc_Log_Timeout Then Begin
            Misc_Log_Last := Texto ;
            Exit ;
         End ;
      End ;
      If NOT Assigned ( Log ) Then Begin
         Exit ;
      End ;
      If NOT Assigned ( Log.LB_Main ) Then Begin
         Exit ;
      End ;
      If NOT Assigned ( Log.LB_Filtro ) Then Begin
         Exit ;
      End ;
      _Debug ( 'PUT_DEBUG [' + Texto + ']' ) ;
      If Misc_Log_Last <> '' Then Begin
         Log.LB_Main.Items.Add ( Misc_Log_Last ) ;
      End ;
      Misc_Log_Last := '' ;
      If Application.Terminated Then Begin
         Exit ;
      End ;
      Log.LB_Main.Items.Add ( Texto ) ;
      If Pos ( Super_UpperCase(Global_Log_Filtro), Super_UpperCase(Texto) ) > 0 Then Begin
         If Assigned ( Log ) Then Begin
            If Assigned ( Log.LB_Filtro ) Then Begin
               Log.LB_Filtro.Items.Add ( Texto ) ;
               If Log.CK_Rolagem.Checked Then Begin
                  Log.LB_Filtro.ItemIndex := Log.LB_Filtro.Items.Count - 1 ;
               End ;
            End ;
         End ;
      End ;
      If FLAG_CARREGANDO_SISTEMA_PUT_LOG Then Begin
         PUT_CARREGANDO_SISTEMA ( Texto ) ;
      End ;
      If Application.Terminated Then Begin
         Exit ;
      End ;
      If ( Pos ( 'EXCEPTION', UpperCase ( Texto ) ) > 0 ) Then Begin
         Inc ( Misc_Log_Cnt_Exception ) ;
         Log.PN_Excecoes.Caption := 'Exc: ' + IntToStr ( Misc_Log_Cnt_Exception ) ;
         Log.PN_Excecoes.Color := clYellow ;
         Log.LB_Excecoes.Items.Add ( Texto ) ;
         If ( NOT Log.Visible ) AND ( PERMITIR_ABERTURA_AUTOMATICA_DO_LOG ) Then Begin
            //Log.Show ;
            //Log.BringToFront ;
         End ;
      End Else Begin
         Log.PN_Excecoes.Color := clSilver ;
      End ;
      If Application.Terminated Then Begin
         Exit ;
      End ;
      If ( Pos ( 'PUSHPOP ', UpperCase ( Texto ) ) > 0 ) Then Begin
         Inc ( Misc_Log_Cnt_PushPop ) ;
         Log.TS_PushPop.Caption := 'PushPop ' + IntToStr ( Misc_Log_Cnt_PushPop ) ;
         Log.LB_PushPop.Items.Add ( Texto ) ;
         If ( NOT Log.Visible ) AND ( PERMITIR_ABERTURA_AUTOMATICA_DO_LOG ) Then Begin
            //Log.Show ;
            //Log.BringToFront ;
         End ;
      End ;
      If Application.Terminated Then Begin
         Exit ;
      End ;
      If ( ( Pos ( 'ERROR ', UpperCase ( Texto ) ) > 0 ) OR
           ( Pos ( 'ERRO ', UpperCase ( Texto ) ) > 0 ) ) Then Begin
         Inc ( Misc_Log_Cnt_Erros ) ;
         Log.PN_Erros.Caption := 'Err: ' + IntToStr ( Misc_Log_Cnt_Erros ) ;
         Log.PN_Erros.Color := clYellow ;
         Log.LB_Erros.Items.Add ( Texto ) ;
         If ( NOT Log.Visible ) AND ( PERMITIR_ABERTURA_AUTOMATICA_DO_LOG ) Then Begin
            //Log.Show ;
            //Log.BringToFront ;
         End ;
      End Else Begin
         Log.PN_Erros.Color := clSilver ;
      End ;
      If Application.Terminated Then Begin
         Exit ;
      End ;
      If ( Pos ( '!!!', UpperCase ( Texto ) ) > 0 ) Then Begin
         Inc ( Misc_Log_Cnt_Atencao ) ;
         Log.PN_Atencao.Caption := 'Atc: ' + IntToStr ( Misc_Log_Cnt_Atencao ) ;
         Log.PN_Atencao.Color := clYellow ;
         Log.LB_Erros.Items.Add ( Texto ) ;
         If ( NOT Log.Visible ) AND ( PERMITIR_ABERTURA_AUTOMATICA_DO_LOG ) Then Begin
            //Log.Show ;
            //Log.BringToFront ;
         End ;
      End Else Begin
         Log.PN_Atencao.Color := clSilver ;
      End ;
      If Application.Terminated Then Begin
         Exit ;
      End ;
      PUSH_TICK ( 'EXPURGAR_LB' ) ;
      EXPURGAR_LB ( Log.LB_Main, 5000, 2500 ) ;
      EXPURGAR_LB ( Log.LB_Erros, 5000, 2500 ) ;
      EXPURGAR_LB ( Log.LB_Read, 5000, 2500 ) ;
      EXPURGAR_LB ( Log.LB_FileExists, 5000, 2500 ) ;
      EXPURGAR_LB ( Log.LB_IMG, 5000, 2500 ) ;
      EXPURGAR_LB ( Log.LB_DirMon, 5000, 2500 ) ;
      EXPURGAR_LB ( Log.LB_Excecoes, 5000, 2500 ) ;
      EXPURGAR_LB ( Log.LB_PushPop, 5000, 2500 ) ;
      EXPURGAR_LB ( Log.LB_Atencao, 5000, 2500 ) ;
      POP_TICK ( 'EXPURGAR_LB' ) ;
      If Application.Terminated Then Begin
         Exit ;
      End ;
      If Log.CK_Rolagem.Checked Then Begin
         Log.LB_Main.ItemIndex := Log.LB_Main.Items.Count - 1 ;
         If Log.LB_Erros.Items.Count > 0 Then Begin
            Log.LB_Erros.ItemIndex := Log.LB_Erros.Items.Count - 1 ;
         End ;
         If Log.LB_Excecoes.Items.Count > 0 Then Begin
            Log.LB_Excecoes.ItemIndex := Log.LB_Excecoes.Items.Count - 1 ;
         End ;
         If Log.LB_PushPop.Items.Count > 0 Then Begin
            Log.LB_PushPop.ItemIndex := Log.LB_PushPop.Items.Count - 1 ;
         End ;
         If Log.LB_Atencao.Items.Count > 0 Then Begin
            Log.LB_Atencao.ItemIndex := Log.LB_Atencao.Items.Count - 1 ;
         End ;
      End ;
      Log.LB_Main.Update ;
      Log.LB_Erros.Update ;
      If NOT Application.Terminated Then Begin
         Application.ProcessMessages ;
      End ;
   Except
   End ;
Except
End ;
End ;

Procedure PUT_STATUS1 ( Texto : String ) ;
Begin
_Debug ( 'PUT_STATUS1 [' + Texto + ']' ) ;
If NOT Assigned ( SB_Log_Status1 ) Then Begin
   Exit ;
End ;
SB_Log_Status1.SimpleText := TimeToStr(Now) + ' ' +
                             IntToStr(Cnt_Indice_Put_Status1) + ' ' +
                             Texto ;
Inc ( Cnt_Indice_Put_Status1 ) ;
End ;

Procedure PUT_STATUS2 ( Texto : String ) ;
Begin
_Debug ( 'PUT_STATUS2 [' + Texto + ']' ) ;
If NOT Assigned ( SB_Log_Status2 ) Then Begin
   Exit ;
End ;
SB_Log_Status2.SimpleText := TimeToStr(Now) + ' ' +
                             IntToStr(Cnt_Indice_Put_Status2) + ' ' +
                             Texto ;
Inc ( Cnt_Indice_Put_Status2 ) ;
End ;

Procedure PUT_STATUS ( _Msg : String ) ;
Begin
_Debug ( 'PUT_STATUS [' + _Msg + ']' ) ;
If NOT Assigned ( MISC_PN_STATUS ) Then Begin
   Exit ;
End ;
If Application.Terminated Then Begin
   Exit ;
End ;
MISC_PN_STATUS.Caption := _Msg ;
MISC_PN_STATUS.Update ;
End ;

Procedure PUT_LOG ( Texto : String ) ;
Begin
If NOT FLAG_PUT_LOG Then Begin
   Exit ;
End ;
If Application.Terminated Then Begin
   Exit ;
End ;
Try
   TEXTO_PUT_LOG := Texto ;
   TH_PUT_LOG ;
Except
End ;
//SetLength ( Tasks, Length(Tasks)+1 ) ;
//Tasks[Length(Tasks)-1] := TTask.Create ( TH_PUT_LOG ) ;
//Tasks[Length(Tasks)-1].Start ;
End ;

Procedure PUT_LOG_CHYRON ( Texto : String ) ;
Var Local : LongInt ;
//    FN    : String ;
Begin
If Application.Terminated Then Begin
   Exit ;
End ;
_Debug ( 'PUT_LOG_CHYRON [' + Texto + ']' ) ;
Try
   Texto := TimeToStr ( Now ) + #32 + Texto ;
   //FN := Diretorio + 'Log\' + Data_Inversa(Now) + '.log' ;
   //APPEND_LINHA_TSTRINGLIST ( FN, Texto ) ;
   If NOT Assigned ( Misc_LB_Log_Chyron ) Then Begin
      Exit ;
   End ;
   //If NOT Assigned ( Misc_LB_Log_Chyron_Erros ) Then
   //   Exit ;
   If NOT Assigned ( Misc_CK_Rolagem_Chyron_Log ) Then Begin
      Exit ;
   End ;
   If Misc_CK_Rolagem_Chyron_Log = Nil Then Begin
      Exit ;
   End ;
   Misc_LB_Log_Chyron.Items.Add ( Texto ) ;
   {
   If ( Pos ( 'EXCEPT', UpperCase ( Texto ) ) > 0 ) OR
      ( Pos ( 'EXCECAO', UpperCase ( STRING_ASCII_PADRAO ( Texto ) ) ) > 0 ) OR
      ( Pos ( 'ERRO', UpperCase ( Texto ) ) > 0 ) Then
      Begin
      Misc_LB_Log_Chyron_Erros.Items.Add ( Texto ) ;
      End ;
   }
   While Misc_LB_Log_Chyron.Items.Count > 2000 Do Begin
      For Local := 1 To 1000 Do Begin
         Misc_LB_Log_Chyron.Items.Delete(0) ;
      End ;
   End ;
   {
   While Misc_LB_Log_Chyron_Erros.Items.Count > 2000 Do
      Begin
      For Local := 1 To 1000 Do
         Misc_LB_Log_Chyron_Erros.Items.Delete(0) ;
      End ;
   }
   If Misc_CK_Rolagem_Chyron_Log.Checked Then Begin
      Misc_LB_Log_Chyron.ItemIndex := Misc_LB_Log_Chyron.Items.Count - 1 ;
      {
      If Misc_LB_Log_Chyron.Items.Count > 0 Then
         Misc_LB_Log_Chyron.ItemIndex := Misc_LB_Log_Chyron.Items.Count - 1 ;
      }
   End ;
Except
End ;
End ;

Procedure CONEXAO_TCP ( Cliente : TClientSocket ) ;
Begin
Try
   Cliente.Close ;
   Cliente.Host := SETUP_Host_TCP ;
   Cliente.Port := SETUP_Porta_TCP ;
   Cliente.Open ;
   PUT_LOG ( 'Conexão OK em ' + SETUP_Host_TCP + ':' + IntToStr ( SETUP_Porta_TCP ) ) ;
Except
   On E : Exception Do Begin
     PUT_LOG ( 'FormShow Cliente.Open Exception [' + E.Message + ']' ) ;
   End ;
End ;
End ;

Procedure ENVIAR_BUFFER_TCP ( Cliente : TClientSocket; RE : TRichEdit ;
                              Incondicional : Boolean ) ;
Var Aux : String ;
Begin
If Cliente.Active OR Incondicional Then Begin
   Aux := Buffer_TCP ;
   Buffer_TCP := '' ;
   Tick_Buffer_TCP := 0 ;
   If Cliente.Active Then Begin
      Cliente.Socket.SendText( Aux ) ;
   End ;
   //ShowMessage_Old ( IntToStr(Length(Aux)) + LF + '[' + Aux + ']' ) ;
   RE.Text := RE.Text + Aux ;
   While RE.Lines.Count > 10 Do Begin
      RE.Lines.Delete ( 0 ) ;
   End ;
   //PUT_LOG ( 'Enviando Socket [' + Trim ( Aux )
End ;
End ;

Procedure PUT_BUFFER_SEND_TCP ( Str : String ) ;
Begin
Buffer_TCP := Buffer_TCP + Str ;
Tick_Buffer_TCP := GetTickCount + 500 ;
End ;

Procedure MISC_SEND_TEXTO_TCP ( Cliente : TClientSocket ; Str : String ;
                           Incondicional : Boolean ) ;
Begin
If Cliente.Active OR Incondicional Then Begin
   PUT_LOG ( 'SEND_COMANDO {' + Str + '}' ) ;
   PUT_BUFFER_SEND_TCP ( Str ) ;
End Else Begin
   PUT_LOG ( 'Cliente desconectado [' + Cliente.Host + ':' +
             IntToStr ( Cliente.Port ) + ']' ) ;
End ;
End ;

Procedure EXECUTAR_CONEXAO_TCP ( Cliente : TClientSocket ) ;
Begin
If NOT Cliente.Active Then Begin
   CONEXAO_TCP ( Cliente ) ;
End ;
End ;

Procedure SEND_COMANDO ( Cliente : TClientSocket ; Comando : String ;
                         Incondicional : Boolean ) ;
Begin
Comando := FORMATAR_COMANDO_RR_LINK ( Comando ) ;
EXECUTAR_CONEXAO_TCP ( Cliente ) ;
MISC_SEND_TEXTO_TCP ( Cliente, Comando, Incondicional ) ;
End ;

Procedure PLOTAR_STATUS ( PN_Local, PN_Rede : TPanel ) ;
Begin
If Flag_Modo_Rede Then Begin
   PN_Local.Brush.Color := clSilver ;
   PN_Rede.Brush.Color := clYellow ;
   PN_Local.Color := clSilver ;
   PN_Rede.Color := clYellow ;
End Else Begin
   PN_Local.Brush.Color := clYellow ;
   PN_Rede.Brush.Color := clSilver ;
   PN_Local.Color := clYellow ;
   PN_Rede.Color := clSilver ;
End ;
End ;

Procedure MISC_MODO_REDE_REMOTO ( PN_Local, PN_Rede : TPanel ;
                             Cliente : TClientSocket ; Origem : String ;
                             Incondicional : Boolean ) ;
Begin
PUT_LOG ( 'MODO REDE [' + Origem + ']' ) ;
SEND_COMANDO ( Cliente, 'REDE', Incondicional ) ;
Flag_Modo_Rede := TRUE ;
PLOTAR_STATUS ( PN_Local, PN_Rede ) ;
End ;

Procedure MISC_MODO_LOCAL_REMOTO ( PN_Local, PN_Rede : TPanel ;
                              Cliente : TClientSocket ; Origem : String ;
                              Incondicional : Boolean ) ;
Begin
PUT_LOG ( 'MODO LOCAL [' + Origem + ']' ) ;
SEND_COMANDO ( Cliente, 'LOCAL', Incondicional ) ;
Flag_Modo_Rede := FALSE ;
PLOTAR_STATUS ( PN_Local, PN_Rede ) ;
End ;

Function RR_TEXT_WIDTH ( Str : String ; _Font : TFont ) : LongInt ;
Var c : TBitmap ;
Begin
c := TBitmap.Create ;
//Result := -1 ;
Try
   c.Canvas.Font.Assign(_Font) ;
   Result := c.Canvas.TextWidth ( Str ) ;
Finally
   c.Free ;
End ;
End ;

Function GET_COR_PARTIDO_2016 ( Tag : String ) : TColor ;
Begin
Result := RGB ( 0, 0, 0 ) ;
If ( Tag = 'BN' ) OR
   ( Tag = 'BRANCOS/NULOS' ) OR
   ( Tag = 'Brancos e Nulos' ) Then Begin
   Result := RGB ( 130, 130, 130 ) ;
End ;
If Tag = 'DEM' Then Result := RGB ( 0, 126, 246 ) ;
If Tag = 'NS/NR' Then Result := RGB ( 103, 79, 19 ) ;
If Tag = 'OTIMO/BOM' Then Result := RGB ( 9, 161, 84 ) ;
If Tag = 'PARTIDOS MENORES' Then Result := RGB ( 133, 96, 169 ) ;
If Tag = 'PCB' Then Result := RGB ( 222, 172, 0 ) ;
If Tag = 'PCdoB' Then Result := RGB ( 190, 0, 0 ) ;
If Tag = 'PCO' Then Result := RGB ( 190, 0, 0 ) ;
If Tag = 'PDT' Then Result := RGB ( 0, 78, 231 ) ;
If Tag = 'PEN' Then Result := RGB ( 252, 255, 0 ) ;
If Tag = 'PHS' Then Result := RGB ( 0, 245, 225 ) ;
If Tag = 'PMDB' Then Result := RGB ( 0, 118, 11 ) ;
If Tag = 'PMN' Then Result := RGB ( 131, 0, 0 ) ;
If Tag = 'PP' Then Result := RGB ( 0, 76, 232 ) ;
If Tag = 'PPL' Then Result := RGB ( 0, 170, 35 ) ;
If Tag = 'PPS' Then Result := RGB ( 196, 92, 0 ) ;
If Tag = 'PR' Then Begin
   //Result := RGB ( 0, 89, 191 ) ; // Globo
   Result := RGB ( 127, 0, 55 ) ; // TVM - Conflito com PDT em Fortaleza
End ;
If Tag = 'PRB' Then Begin
   //Result := RGB ( 0, 136, 216 ) ; // Globo
   Result := RGB ( 0, 127, 14 ) ; // TVM - Conflito com PDT em Fortaleza
End ;
If Tag = 'PROS' Then Result := RGB ( 216, 132, 0 ) ;
If Tag = 'PRP' Then Result := RGB ( 0, 126, 246 ) ;
If Tag = 'PRTB' Then Result := RGB ( 0, 89, 191 ) ;
If Tag = 'PSB' Then Result := RGB ( 191, 171, 0 ) ;
If Tag = 'PSC' Then Result := RGB ( 0, 155, 5 ) ;
If Tag = 'PSD' Then Result := RGB ( 248, 193, 0 ) ;
If Tag = 'PSDB' Then Result := RGB ( 0, 89, 191 ) ;
If Tag = 'PSDC' Then Result := RGB ( 0, 89, 191 ) ;
If Tag = 'PSL' Then Result := RGB ( 240, 215, 0 ) ;
If Tag = 'PSOL' Then Begin
   //Result := RGB ( 190, 0, 0 ) ;
   Result := RGB ( 255, 216, 0 ) ; // TVM - Conflito com PT em Fortaleza
End ;
If Tag = 'PSTU' Then Begin
   //Result := RGB ( 210, 143, 0 ) ;
   Result := RGB ( 0, 109, 33 ) ; // TVM - Conflito com PSOL em Fortaleza
End ;
If Tag = 'PT' Then Result := RGB ( 190, 0, 0 ) ;
If Tag = 'PTB' Then Result := RGB ( 190, 0, 0 ) ;
If Tag = 'PTC' Then Result := RGB ( 0, 126, 246 ) ;
If Tag = 'PTDOB' Then Result := RGB ( 70, 186, 0 ) ;
If Tag = 'PTN' Then Result := RGB ( 0, 134, 44 ) ;
If Tag = 'PV' Then Result := RGB ( 0, 170, 35 ) ;
If Tag = 'REGULAR' Then Result := RGB ( 0, 6, 182 ) ;
If Tag = 'RUIM/PESSIMO' Then Result := RGB ( 133, 30, 15 ) ;
If Tag = 'SDD' Then Result := RGB ( 216, 91, 0 ) ;
End ;

Procedure SAVE_SCREEN ( FN : String ; Sender: TObject ; FullWindow : Boolean ) ;
//Const FullWindow = TRUE ; // Set to false if you only want the client area.
Var Win      : HWND ;
    DC       : HDC ;
    Bmp      : TBitmap ;
    //FileName : String ;
    WinRect  : TRect ;
    Width    : Integer ;
    Height   : Integer ;
Begin
//  Form1.Hide;
Try
   Application.ProcessMessages ; // Was Sleep(500);
   Win := GetForegroundWindow ;
   If FullWindow Then Begin
      GetWindowRect(Win, WinRect) ;
      DC := GetWindowDC(Win) ;
   End Else Begin
      Windows.GetClientRect(Win, WinRect) ;
      DC := GetDC(Win) ;
   End ;
   Try
      Width := WinRect.Right - WinRect.Left ;
      Height := WinRect.Bottom - WinRect.Top ;
      Bmp := TBitmap.Create ;
      Try
        Bmp.Height := Height ;
        Bmp.Width := Width ;
        BitBlt( Bmp.Canvas.Handle, 0, 0, Width, Height, DC, 0, 0, SRCCOPY ) ;
        //FileName := 'Screenshot_' + FormatDateTime('mm-dd-yyyy-hhnnss', Now()) ;
        //Bmp.SaveToFile(Format('C:\Screenshots\%s.bmp', [FileName])) ;
        CHECAR_DIRETORIO_FILENAME ( FN ) ;
        Bmp.SaveToFile(FN) ;
      Finally
        Bmp.Free ;
      End ;
   Finally
      ReleaseDC(Win, DC) ;
   End ;
Finally
  //Form1.Show;
End ;
End ;

Procedure SAVE_IMAGE_FORM ( FN : String ; _Form : TForm ) ;
Var Bmp   : TBitmap ;
    //Png   : TPngImage ;
    Passo : LongInt ;
Begin
Bmp := TBitmap.Create ;
Passo := 1 ;
Try
   Passo := 2 ;
   Bmp.SetSize ( _Form.Canvas.ClipRect.Right, _Form.Canvas.ClipRect.Bottom ) ;
   Passo := 3 ;
   BitBlt ( Bmp.Canvas.Handle, 0, 0, _Form.Width, _Form.Height, _Form.Canvas.Handle, 0, 0, SRCCOPY ) ;
   Passo := 4 ;
   //Png := TPngImage.Create ;
   Passo := 5 ;
   Try
      Passo := 6 ;
      //Png.Assign ( Bmp ) ;
      Passo := 7 ;
      CHECAR_DIRETORIO_FILENAME ( FN ) ;
      Passo := 8 ;
      //Png.SaveToFile ( FN ) ;
      Bmp.SaveToFile ( FN ) ;
      Passo := 9 ;
   Except
      On E : Exception Do Begin
         PUT_LOG ( 'Exception SAVE_IMAGE_FORM 1:' + LF +
                   'FN: "' + FN + '"' + LF  +
                   'Passo ' + IntToStr ( Passo ) + LF +
                   E.Message ) ;
      End ;
   End ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception SAVE_IMAGE_FORM 2:' + LF +
                'FN: "' + FN + '"' + LF  +
                'Passo ' + IntToStr ( Passo ) + LF +
                E.Message ) ;
   End ;
End ;
//If Assigned ( Png ) Then
//   Png.Free ;
If Assigned ( Bmp ) Then Begin
   Bmp.Free ;
End ;
End ;

Procedure SALVAR_SELECAO_RE ( _RE : TRichEdit ) ;
Begin
Cursor_Inicio := _RE.SelStart ;
Cursor_Size := _RE.SelLength ;
End ;

Procedure RESTAURAR_SELECAO_RE ( _RE : TRichEdit ) ;
Begin
_RE.SelStart := Cursor_Inicio ;
_RE.SelLength := Cursor_Size ;
End ;

Function SG_GET_LINHA_VAZIA_COM_ADD ( Var SG : TStringGrid ; Coluna : LongInt ) : LongInt ;
Begin
If Trim ( SG.Cells[Coluna,SG.RowCount-1] ) <> '' Then Begin
   SG.RowCount := SG.RowCount + 1 ;
   LIMPAR_LINHA_SG( SG, SG.RowCount - 1 ) ;
End ;
Result := SG.RowCount-1 ;
End ;

Procedure ADICIONAR_SCROLLBAR_VERTICAL_RE ( RE : TRichEdit ) ;
Begin
//SendMessage ( RE.Handle, WM_VSCROLL, SB_BOTTOM, 0 ) ;
//SendMessage ( RE.Handle, EM_SHOWSCROLLBAR, SB_VERT, TRUE);
//SendMessage ( RE.Handle, EM_SHOWSCROLLBAR, SB_VERT, TRUE);
End ;

Procedure ADICIONAR_SCROLLBAR_VERTICAL_ME ( ME : TMemo ) ;
Begin
//SendMessage ( ME.Handle, WM_VSCROLL, SB_BOTTOM, 0 ) ;
//SendMessage ( ME.Handle, EM_SHOWSCROLLBAR, SB_VERT, TRUE);
//SendMessage ( ME.Handle, EM_SHOWSCROLLBAR, SB_VERT, TRUE);
End ;

Function CALC_CRC_SOMA_SIMPLES ( Str : RawByteString ) : LongInt ;
Var Local : LongInt ;
Begin
Result := 0 ;
If Str = '' Then Begin
   Exit ;
End ;
For Local := 1 To Length ( Str ) Do Begin
   Result := Result + Ord ( Str[Local] ) ;
End ;
End ;

Function FORMAT_TIMESTAMP_MS ( ms : Cardinal ) : String ;
Var _Int : LongInt ;
Begin
_Int := ms DIV 1000 ;
Result := IntToStr(_Int) + '.' + StrZero ( ms MOD 1000, 3 ) ;
End ;

Procedure COPIAR_FORMATO_SG ( SG1, SG2 : TStringGrid ) ;
Var Coluna ,
    Linha  : LongInt ;
Begin
SG2.RowCount := SG1.RowCount ;
SG2.ColCount := SG1.ColCount ;
For Coluna := 0 To SG1.ColCount - 1 Do Begin
   SG2.ColWidths[Coluna] := SG1.ColWidths[Coluna] ;
   For Linha := 0 To SG1.RowCount - 1 Do Begin
      SG2.Cells[Coluna, Linha] := SG1.Cells[Coluna, Linha] ;
   End ;
End ;
End ;

Procedure COPIAR_FORMATO_SG_HEADER ( SG1, SG2 : TStringGrid ) ;
Var Coluna : LongInt ;
    //Linha  : LongInt ;
Begin
For Coluna := 0 To SG1.ColCount - 1 Do Begin
   SG2.ColWidths[Coluna] := SG1.ColWidths[Coluna] ;
   SG2.Cells[Coluna, 0] := SG1.Cells[Coluna, 0] ;
End ;
End ;

Function BYTES_TO_FLOAT_FULL ( B1, B2, B3, B4 : Cardinal ;
                               Var Sinal : Integer ;
                               Var Expoente : Integer ;
                               Var Mantissa : Single ;
                               Var Bin : RawByteString ;
                               Var Base : Cardinal ) : Single ;
//Var //Aux      : Cardinal ;
    //Restante : Cardinal ;
Var Expoente_Bits : LongInt ;
    Aux           : String ;
Begin
Result := 0 ;
//Base := B1 ;
//Base := Base * 256 + B2 ;
//Base := Base * 256 + B3 ;
//Base := Base * 256 + B4 ;
Bin := INT_TO_BIN ( B1, B2, B3, B4 ) ;
Base := B1 ;        Base := Base * 256 ;
Base := Base + B2 ; Base := Base * 256 ;
Base := Base + B3 ; Base := Base * 256 ;
Base := Base + B4 ;
//SHL 24 + B2 SHL 16 + B3 SHL 8 + B4 ;
If ( Base AND $80000000 ) = 0 Then Begin
   Sinal := 1
End Else Begin
   Sinal := -1 ;
End ;
//Expoente := ( B1 AND $7F ) * 2 ;
//If ( B1 AND $80 ) > 0 Then
//   Inc ( Expoente ) ;
Expoente := ( B1 AND $7F ) * 2 ;
Expoente_Bits := Expoente ;
If ( B2 AND $80 ) > 0 Then Begin
   Inc ( Expoente ) ;
   Inc ( Expoente_Bits ) ;
End ;
Expoente := Expoente - 127 ;
// Expoente := Expoente - 127 ;
//Restante := B2 AND $7F ;
//Restante := Restante * 256 + B3 ;
//Restante := Restante * 256 + B4 ;
//Cardinal(B2 AND $7F) SHL 16 + Cardinal(B3) SHL 8 + Cardinal(B4) ;
// Mantissa := 1 + Restante / $800000 ;
Base := Base AND $7FFFFF ;
If Expoente_Bits > 0 Then Begin
   Mantissa := 1 + Base / $800000
End Else Begin
   Mantissa := 1 + Base / $400000 ;
End ;
//Aux := Cardinal(B1) SHL 24 + Cardinal(B2) SHL 16 + Cardinal(B3) SHL 8 + Cardinal(B4) ;
Aux := 'Bin:' + String(Bin) + ' ' +
       'Float:' + CASA1_PONTO(Result) + ' ' +
       'Mantissa:' + CASA6_PONTO(Mantissa) + ' ' +
       'Expoente:' + CASA1_PONTO(Expoente) ;
Try
   If Expoente  > 20 Then Begin
      Result := Base // Usar como Int/Long
   End Else Begin
      Result := Sinal * Mantissa * Power ( 2 , Expoente ) ;
   End ;
   If Result > 1E6 Then Begin
      //PUT_EVENTO ( 'Aviso: ' + Aux ) ;
   End ;
Except
   On E : Exception Do Begin
      //PUT_EVENTO ( 'Excecao: ' + E.Message ) ;
      //PUT_EVENTO ( Aux ) ;
   End ;
End ;
End ;

Function BYTES_TO_FLOAT ( B1, B2, B3, B4 : Byte ) : Single ;
Var Sinal : Integer ;
    Expoente : Integer ;
    Mantissa : Single ;
    Bin : RawByteString ;
    Base : Cardinal ;
Begin
Result := BYTES_TO_FLOAT_FULL ( B1, B2, B3, B4,
                                Sinal, Expoente, Mantissa, Bin, Base ) ;
End ;

Function MIN_DOUBLE ( A, B : Double ) : Double ;
Begin
If A < B Then Begin
   Result := A
End Else Begin
   Result := B ;
End ;
End ;

Function MIN_SINGLE ( A, B : Single ) : Single ;
Begin
Try
   If A < B Then Begin
      Result := A
   End Else Begin
      Result := B ;
   End ;
Except
   Result := A ;
End ;
End ;

Function MAX_DOUBLE ( A, B : Double ) : Double ;
Begin
If A > B Then Begin
   Result := A
End Else Begin
   Result := B ;
End ;
End ;

Function MAX_SINGLE ( A, B : Single ) : Single ;
Begin
Try
   If A > B Then Begin
      Result := A
   End Else Begin
      Result := B ;
   End ;
Except
   Result := A ;
End ;
End ;

Function IS_PACOTE_CAN_29_VALIDO ( Str : String ) : Boolean ;
Begin
Result := FALSE ;
If Length(Str)<29 Then Begin
   Exit ;
End ;
If Str[1] <> #$23 Then Begin
   Exit ;
End ;
If Str[2] > #9 Then Begin
   Exit ;
End ;
If Str[6] <> #0 Then Begin
   Exit ;
End ;
If Str[27] <> #0 Then Begin
   Exit ;
End ;
If Str[29] <> #$2A Then Begin
   Exit ;
End ;
Result := TRUE ;
End ;

Function EXISTE_COMPONENTE ( Form : TForm ; Nome : String ) : Boolean ;
Var Local : LongInt ;
Begin
Result := FALSE ;
Nome := UpperCase ( Nome ) ;
PUT_LOG ( 'Find [' + Nome + ']' ) ;
For Local := 0 To Form.ComponentCount - 1 Do Begin
   PUT_LOG ( 'Key [' + UpperCase(Form.Components[Local].Name) + ']' ) ;
   If UpperCase(Form.Components[Local].Name) = Nome Then Begin
      Result := TRUE ;
      Exit ;
   End ;
End ;
End ;

Function GET_LARGURA_DISPONIVEL_SG ( SG : TStringGrid ) : LongInt ;
Var Local : LongInt ;
Begin
Result := 0 ;
For Local := 0 To SG.ColCount - 2 Do Begin
   Result := Result + 1 + SG.ColWidths[Local] ;
End ;
Result := SG.Width - Result - 10 ;
End ;

Function EXTRAIR_QUALQUER_NUMERO ( Str : String ) : LongInt ;
Var Local : LongInt ;
    Aux   : String ;
Begin
Result := -1 ;
If Str = '' Then Begin
   Exit ;
End ;
Aux := '' ;
For Local := 1 To Length ( Str ) Do Begin
   If IS_DIGIT ( Str[Local] ) Then Begin
      Aux := Aux + Str[Local] ;
   End ;
End ;
Result := StrToIntDef ( Aux, -1 ) ;
End ;

Function MAP ( Min_Saida, Max_Saida, Min_Valor, Max_Valor,
               Valor : Single ) : Single ;
Begin
Result := Min_Saida + ( Max_Saida - Min_Saida ) * ( Valor / ( Max_Valor - Min_Valor ) ) ;
End ;

Function FN_SUBSTITUIR_EXTENSAO ( FN, Extensao : String ) : String ;
Begin
While Pos ( '.', FN ) > 0 Do Begin
   Delete ( FN, Length ( FN ) , 1 ) ;
End ;
Result := FN + '.' + Extensao ;
End ;

Function GET_FN_RESUMO ( FN : String ) : String ;
Begin
Result := FN_SUBSTITUIR_EXTENSAO ( FN, 'Resumo' ) ;
End ;

Function GET_FN_BUFFER ( FN : String ) : String ;
Begin
Result := FN_SUBSTITUIR_EXTENSAO ( FN, 'Buffer' ) ;
End ;

Procedure REMOVE_ITEM_ARRAY_BUFFER ( Var A: A_T_ID ; Const Index: Cardinal ) ;
Var ALength : Cardinal ;
    i       : Cardinal ;
Begin
ALength := Length(A) ;
Assert ( ALength > 0 ) ;
Assert ( Index < ALength ) ;
For i := Index + 1 to ALength - 1 Do Begin
   A[i - 1] := A[i] ;
End ;
SetLength(A, ALength - 1) ;
End ;

Function GET_DPI_MONITOR : LongInt ;
//Var  dc    : HDC;
Begin
//GetDeviceCaps(dc, RASTERCAPS) ;
Result := Screen.PixelsPerInch ;
End ;

Procedure ScreenShot(x : Integer; y : Integer; Width : Integer; Height : Integer; bm : TBitMap) ;
Var  dc    : HDC;
     lpPal : PLOGPALETTE ;
     Passo : LongInt ;
Begin
Passo := 1 ;
Try
   {test width and height}
   Passo := 2 ;
   If ((Width = 0) OR (Height = 0)) Then Begin
      Exit ;
   End ;
   Passo := 3 ;
   bm.Width := Width ;
   Passo := 4 ;
   bm.Height := Height ;
   Passo := 5 ;
   {get the screen dc}
   dc := GetDc(0) ;
   Passo := 6 ;
   if (dc = 0) then Begin
      Exit ;
   End ;
   {do we have a palette device?}
   Passo := 7 ;
   If (GetDeviceCaps(dc, RASTERCAPS) AND RC_PALETTE = RC_PALETTE) Then Begin
      Passo := 8 ;
      {allocate memory for a logical palette}
      GetMem(lpPal, sizeof(TLOGPALETTE) + (255 * sizeof(TPALETTEENTRY))) ;
      {zero it out to be neat}
      Passo := 9 ;
      FillChar(lpPal^, sizeof(TLOGPALETTE) + (255 * sizeof(TPALETTEENTRY)), #0) ;
      {fill in the palette version}
      Passo := 10 ;
      lpPal^.palVersion := $300 ;
      {grab the system palette entries}
      Passo := 11 ;
      lpPal^.palNumEntries :=GetSystemPaletteEntries(dc,0,256,lpPal^.palPalEntry) ;
      Passo := 12 ;
      If (lpPal^.PalNumEntries <> 0) Then Begin
         Passo := 13 ;
         {create the palette}
         bm.Palette := CreatePalette(lpPal^) ;
      End ;
      Passo := 14 ;
      FreeMem(lpPal, sizeof(TLOGPALETTE) + (255 * sizeof(TPALETTEENTRY))) ;
      Passo := 15 ;
   End ;
   {copy from the screen to the bitmap}
   Passo := 16 ;
   BitBlt(bm.Canvas.Handle,0,0,Width,Height,Dc,x,y,SRCCOPY);
   {release the screen dc}
   Passo := 17 ;
   ReleaseDc(0, dc);
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception em ScreenShot' + LF +
                E.Message + LF +
                'Passo: ' + IntToStr ( Passo ) ) ;
   End ;
End ;
End ;

Procedure GERAR_PREVIEW ( FN_BMP, FN_PNG, FN_JPG, FN_TGA : String ;
                          _Left, _Top : LongInt ;
                          _Width, _Height : LongInt ) ;
Var PNG         : TPNGImage ;
    JPG         : TJPEGImage ;
    Passo       : LongInt ;
Begin
Passo := 1 ;
Try
   Passo := 2 ;
   If NOT Assigned(PREVIEW_BMP) Then Begin
      PREVIEW_BMP := TBitmap.Create ;
   End ;
   Passo := 3 ;
   ScreenShot ( _Left, _Top, _Width, _Height, PREVIEW_BMP ) ;
   If FN_BMP <> '' Then Begin
      CHECAR_DIRETORIO_FILENAME ( FN_BMP ) ;
   End ;
   If FN_PNG <> '' Then Begin
      CHECAR_DIRETORIO_FILENAME ( FN_PNG ) ;
   End ;
   If FN_JPG <> '' Then Begin
      CHECAR_DIRETORIO_FILENAME ( FN_JPG ) ;
   End ;
   If FN_TGA <> '' Then Begin
      CHECAR_DIRETORIO_FILENAME ( FN_TGA ) ;
   End ;
   Passo := 4 ;
   Try
      Passo := 5 ;
      If FN_BMP <> '' Then Begin
         Passo := 6 ;
         PREVIEW_BMP.SaveToFile( FN_BMP ) ;
      End ;

      Passo := 7 ;
      If FN_PNG <> '' Then Begin
         Passo := 8 ;
         PNG := TPNGImage.Create;
         Try
            Passo := 9 ;
            PNG.Assign ( PREVIEW_BMP ) ;
            Passo := 10 ;
            PNG.SaveToFile ( FN_PNG ) ;
            Passo := 11 ;
         Finally
            PNG.Free;
         End ;
      End ;

      Passo := 12 ;
      If FN_JPG <> '' Then Begin
         Passo := 13 ;
         Try
            Passo := 14 ;
            JPG := TJPEGImage.Create ;
            Passo := 15 ;
            JPG.Assign ( PREVIEW_BMP ) ;
            Passo := 16 ;
            JPG.SaveToFile ( FN_JPG ) ;
            Passo := 17 ;
            JPG.Free;
         Except
         End ;
      End ;

      Passo := 18 ;
   Except
      On E : Exception Do Begin
         PUT_LOG ( 'Exception 1 ao GERAR_PREVIEW' + LF +
                   E.Message + LF +
                   'FN_PNG: ' + FN_PNG + LF +
                   'FN_JPG: ' + FN_JPG + LF +
                   'FN_BMP: ' + FN_BMP ) ;
      End ;
   End ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception 2 ao GERAR_PREVIEW' + LF +
                E.Message + LF +
                'Passo: ' + IntToStr ( Passo ) + LF +
                'FN_PNG: ' + FN_PNG + LF +
                'FN_JPG: ' + FN_JPG + LF +
                'FN_BMP: ' + FN_BMP ) ;
   End ;
End ;
End ;

Function GET_MONITOR_PRINCIPAL : TMonitor ;
Var Local : LongInt ;
Begin
For Local := 0 To Screen.MonitorCount - 1 Do Begin
   If Screen.Monitors[Local].Primary Then Begin
      Result := Screen.Monitors[Local] ;
      Exit ;
   End ;
End ;
Result := Nil ;
//Result.Width := 0 ;
//Result.Height := 0 ;
End ;

Function GET_MONITORES ( _Monitor : LongInt ; Var _Left : LongInt ) : String ;
Var Local : LongInt ;
Begin
If Screen.MonitorCount = 0 Then Begin
   Result := 'NENHUM' ;
   Exit ;
End ;
_Left := 0 ;
Result := '' ;
For Local := 0 To Screen.MonitorCount - 1 Do Begin
   If Result <> '' Then Begin
      Result := Result + sLineBreak ;
   End ;
   If ( Local > 0 ) AND ( Local <= ( _Monitor - 1 ) ) Then Begin
      _Left := _Left + Screen.Monitors[Local-1].Width ;
   End ;
   Result := Result + IntToStr(Local) + ':' +
             'W[' + IntToStr(Screen.Monitors[Local].Width) + ']' +
             'H[' + IntToStr(Screen.Monitors[Local].Height) + ']' +
             'L[' + IntToStr(Screen.Monitors[Local].Left) + ']' +
             'T[' + IntToStr(Screen.Monitors[Local].Top) + ']' +
             'P[' + IFSN(Screen.Monitors[Local].Primary) + ']' +
             'N[' + IntToStr(Screen.Monitors[Local].MonitorNum) + ']' +
             'PPI[' + IntToStr(Screen.Monitors[Local].PixelsPerInch) + ']' ;
End ;
End ;

Function GET_LEFT_MONITOR ( _Monitor : LongInt ) : LongInt ;
Begin
Result := 0 ;
If ( _Monitor > 1 ) AND ( Screen.MonitorCount = 1 ) Then Begin
   Exit ;
End ;
If ( _Monitor = 2 ) Then Begin
   Result := Screen.Monitors[1].Left ;
End ;
End ;

Function DEFINIR_MONITOR_FORM ( _Form : TForm ; _Monitor : LongInt ) : LongInt ;
Begin
Result := GET_LEFT_MONITOR ( _Monitor ) ;
//_Form.Hide ;
_Form.WindowState := wsNormal ;
_Form.Left := Result ;
_Form.Top := 0 ;
_Form.WindowState := wsMaximized ;
//_Form.Show ;
End ;

Function IF_VerdeVermelho ( Condicao : Boolean ) : TColor ;
Begin
If Condicao Then Begin
   Result := clLime
End Else Begin
   Result := clRed ;
End ;
End ;

Function LL_VALIDAS ( Latitude, Longitude : Double ) : Boolean ;
Begin
Result := FALSE ;
If Longitude > -30 Then Begin
   Exit ;
End ;
If Longitude < -80 Then Begin
   Exit ;
End ;
If Latitude < -35 Then Begin
   Exit ;
End ;
If Latitude > 5 Then Begin
   Exit ;
End ;
Result := TRUE ;
End ;

Function CopiaListaArquivos ( Origem : String ; Lista : TStringList ;
                              Dir : String ) : LongInt ;
Var Qtde  : LongInt ;
    Local : LongInt ;
Begin
_Debug ( 'INI CopiaListaArquivos' ) ;
Result := 0 ;
Qtde := Lista.Count ;
If Qtde = 0 Then Begin
   _Debug ( 'Exit Qtde=0 CopiaListaArquivos' ) ;
   Exit ;
End ;
CHECAR_DIRETORIO_DIRNAME ( Dir ) ;
For Local := 0 To Qtde - 1 Do Begin
   If CopiaArquivo ( 'CopiaListaArquivos[' + IntToStr(Local) + ']',
                     Lista[Local],
                     INSERE_BARRA(Dir) + ExtractFileName(Lista[Local]),
                     SOBREPOE ) Then Begin
      Inc ( Result ) ;
   End ;
End ;
_Debug ( 'FIM CopiaListaArquivos' ) ;
End ;

Function CopiaArquivo ( Origem, FN_Origem , FN_Destino : String ;
                        SobrePoe : Boolean ) : Boolean ;
Var _Origem ,
    _Destino : Array [ 0 .. 250] Of Char ;
    Tick     : Cardinal ;
Begin
_Debug ( 'INI Copia Arquivo [' + FN_Origem + '][' + FN_Destino + ']' ) ;
PUSH_TICK ( 'Copia Arquivo' ) ;
Tick := GetTickCount ;
Result := FALSE ;
Inc ( Cnt_Log_Copy ) ;
CHECAR_DIRETORIO_FILENAME ( FN_Destino ) ;
Try
   If NOT RR_FileExists ( 'Copia Arquivo', FN_Origem ) Then Begin
      Tick := GetTickCount - Tick ;
      If Assigned ( Log ) AND ( NOT Application.Terminated ) Then Begin
         PUT_LOG_EVENTO ( Log.LB_Copy, Log.CK_Rolagem.Checked,
                          TimeToStr ( Now ) + ' ' +
                          'COPY !FN ' + IntToStr ( Cnt_Log_Copy ) + ' ' +
                          'T[' + IntToStr(Tick) + ']' +
                          //'[' + ExtractFileName(FN) + ']' +
                          '[' + Origem + ']' +
                          '[' + FN_Origem + ']' +
                          '[' + FN_Destino + ']' ) ;
      End ;
      Exit ;
   End ;
   StrPCopy ( _Origem , FN_Origem ) ;
   StrPCopy ( _Destino , FN_Destino ) ;
   CopiaArquivo := CopyFile ( @_Origem , @_Destino , SobrePoe ) ;
   Tick := GetTickCount - Tick ;
   If Assigned ( Log ) AND ( NOT Application.Terminated ) Then Begin
      PUT_LOG_EVENTO ( Log.LB_Copy, Log.CK_Rolagem.Checked,
                       TimeToStr ( Now ) + ' ' +
                       'COPY OK. ' + IntToStr ( Cnt_Log_Copy ) + ' ' +
                       'T[' + IntToStr(Tick) + ']' +
                       //'[' + ExtractFileName(FN) + ']' +
                       '[' + Origem + ']' +
                       '[' + FN_Origem + ']' +
                       '[' + FN_Destino + ']' ) ;
   End ;
   Result := TRUE ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception CopiaArquivo ' +
                '[' + E.Message + ']' +
                '[' + FN_Origem + ']' +
                '[' + FN_Destino + ']' ) ;
      Tick := GetTickCount - Tick ;
      If Assigned ( Log ) AND ( NOT Application.Terminated ) Then Begin
         PUT_LOG_EVENTO ( Log.LB_Copy, Log.CK_Rolagem.Checked,
                          TimeToStr ( Now ) + ' ' +
                          'COPY EXC ' + IntToStr ( Cnt_Log_Copy ) + ' ' +
                          'T[' + IntToStr(Tick) + ']' +
                          //'[' + ExtractFileName(FN) + ']' +
                          '[' + Origem + ']' +
                          '[' + FN_Origem + ']' +
                          '[' + FN_Destino + ']' ) ;
      End ;
   End ;
End ;
POP_TICK ( 'Copia Arquivo' ) ;
_Debug ( 'FIM Copia Arquivo' ) ;
End ;

Function DiaDaSemana ( Data : TDateTime ) : String ;
Const Dias : Array [ 1 .. 7 ] Of String =
             ( 'Domingo' , 'Segunda' , 'Terça' , 'Quarta' ,
               'Quinta' , 'Sexta' , 'Sábado' ) ;
Begin
DiaDaSemana := Dias [ DayOfWeek ( Data ) ] ;
End ;

Function DiaDaSemanaAscii ( Data : TDateTime ) : String ;
Const Dias : Array [ 1 .. 7 ] Of String =
             ( 'Domingo' , 'Segunda' , 'Terca' , 'Quarta' ,
               'Quinta' , 'Sexta' , 'Sabado' ) ;
Begin
DiaDaSemanaAscii := Dias [ DayOfWeek ( Data ) ] ;
End ;

Function ARRENDONDA_DATETIME ( Valor : Double ) : Double ;
Var Hora   ,
    Minuto    ,
    Segundo    : Integer ;
    Data       : LongInt ;
Begin
Data := TRUNC ( Valor ) ;
Hora := TRUNC ( FRAC ( Valor ) /  (1/24) ) ;
Minuto  := TRUNC ( ( FRAC ( Valor ) - Hora * (1/24) ) /  (1/1440) ) ;
Segundo := TRUNC ( ( FRAC ( Valor ) -
                     Hora * (1/24) -
                     Minuto * (1/1440) ) / (1/1440/60) +
                     1/1440/60/20 ) ;
Result := Data + Hora * (1/24) +
          Minuto * ( 1/1440 ) + Segundo * ( 1/1440/60 ) ;
End ;

Function FORMATO_CC_MS ( ms : Cardinal ) : String ;
Var _H, _M, _S, _MS : LongInt ;
Begin
_MS := ms MOD 1000 ;
ms := ms DIV 1000 ;
_S := ms MOD 60 ;
ms := ms DIV 60 ;
_M := ms MOD 60 ;
ms := ms DIV 60 ;
_H := ms ;
If ( _H = 0 ) AND ( _M = 0 ) Then Begin
   Result := StrZero ( _S, 2 ) + ',' +
             StrZero ( _MS, 3 )
End Else If ( _H = 0 ) Then Begin
   Result := StrZero ( _M, 2 ) + ':' +
             StrZero ( _S, 2 ) + ',' +
             StrZero ( _MS, 3 )
End Else Begin
   Result := StrZero ( _H, 2 ) + ':' +
             StrZero ( _M, 2 ) + ':' +
             StrZero ( _S, 2 ) + ',' +
             StrZero ( _MS, 3 ) ;
End ;
End ;

Function TC_TO_MILISSEGUNDOS ( Str : String ; Var Res : String ) : LongInt ;
Var Lista : TStringList ;
Begin
//Lista := TStringList.Create ;
Str := StringReplace ( Str, ';', ':', [rfReplaceAll] ) ;
Lista := Explode_Simples ( Str, ':' ) ;
While Lista.Count < 4 Do Begin
   Lista.Insert ( 0, '00' ) ;
End ;
Result := TRUNC ( ( StrToIntDef(Lista[0],0) * 3600 +
                    StrToIntDef(Lista[1],0) * 60 +
                    StrToIntDef(Lista[2],0) ) * 1000 +
                    StrToIntDef(Lista[3],0) * 33.3333334 ) ;
Res := '(' + Lista[0] + '/' + Lista[1] + '/' + Lista[2] + '/' + Lista[3] + ')' ;
Lista.Free ;
End ;

Function FORMATO_SMPTE ( ms : Cardinal ; Separador : Char ) : String ;
Var _H, _M, _S, _MS : LongInt ;
Begin
_MS := ms MOD 1000 ;
ms := ms DIV 1000 ;
_S := ms MOD 60 ;
ms := ms DIV 60 ;
_M := ms MOD 60 ;
ms := ms DIV 60 ;
_H := ms ;
If ( _H = 0 ) AND ( _M = 0 ) Then Begin
   Result := StrZero ( _S, 2 ) + Separador +
             StrZero ( TRUNC ( _MS / 33 ) , 2 )
End Else If ( _H = 0 ) Then Begin
   Result := StrZero ( _M, 2 ) + ':' +
             StrZero ( _S, 2 ) + Separador +
             StrZero ( TRUNC ( _MS / 33 ) , 2 )
End Else Begin
   Result := StrZero ( _H, 2 ) + ':' +
             StrZero ( _M, 2 ) + ':' +
             StrZero ( _S, 2 ) + Separador +
             StrZero ( TRUNC ( _MS / 33 ) , 2 ) ;
End ;
End ;

Function GET_INDICE_COMBOBOX ( CB : TComboBox ; Key : String ; Default : String ) : LongInt ;
Var Local : LongInt ;
    Qtde  : LongInt ;
Begin
Result := -1 ;
If CB = Nil Then Begin
   Exit ;
End ;
Qtde := CB.Items.Count ;
If Qtde = 0 Then Begin
   Exit ;
End ;
For Local := 0 To Qtde - 1 Do Begin
   If CB.Items[Local] = Key Then Begin
      Result := Local ;
      Exit ;
   End ;
End ;
If Default <> '' Then Begin
   CB.Text := Default ;
End ;
End ;

Function INPUT_FLOAT ( Titulo, Descricao, Default : String ; Invalido : Double ) : Double ;
Var Aux : String ;
Begin
Aux := InputBox ( Titulo, Descricao, Default ) ;
Result := StrToFloat_RR ( Aux, Invalido ) ;
End ;

Function WideStringToString ( Const Source: UnicodeString; CodePage: UINT): RawByteString ;
Var strLen : Integer ;
Begin
strLen := LocaleCharsFromUnicode ( CodePage, 0, PWideChar(Source), Length(Source), Nil, 0, Nil, Nil ) ;
If strLen > 0 Then Begin
   SetLength(Result, strLen) ;
   LocaleCharsFromUnicode(CodePage, 0, PWideChar(Source), Length(Source), PAnsiChar(Result), strLen, nil, nil) ;
   SetCodePage(Result, CodePage, FALSE ) ;
End ;
End ;

Function TEMPO_DECORRIDO_MS ( Tick : Cardinal ) : Cardinal ;
Begin
Result := MAX ( 0, GetTickCount - Tick ) ;
End ;

(*
Procedure APPEND_LINHA_TSTRINGLIST ( FN, Texto : String ) ;
Var Linhas : TStringList ;
Begin
CHECAR_DIRETORIO_FILENAME ( FN ) ;
Linhas := TStringList.Create ;
Linhas.Clear ;
Try
   If RR_FileExists ( 'APPEND_LINHA_TSTRINGLIST', FN ) Then Begin
      Linhas.Text := GET_CONTEUDO_M ( 'APPEND_LINHA_TSTRINGLIST', FN ) ;
   End ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception APPEND_LINHA_STRINGLIST/1 [' + FN + '][' + E.Message + ']' ) ;
   End ;
End ;
Linhas.Add ( Texto ) ;
Try
   Linhas.SaveToFile ( FN ) ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception APPEND_LINHA_STRINGLIST/2 [' + FN + '][' + E.Message + ']' ) ;
   End ;
End ;
Linhas.Free ;
End ;
*)

Function GET_FIRST_FILE ( Dir, Mascara : String ) : String ;
Var RecDos    : TSearchRec ;
    Resultado : LongInt ;
Begin
Dir := INSERE_BARRA ( Dir ) ;
Resultado := RR_FindFirst ( 'GET_FIRST_FILE', Dir + Mascara, 0, RecDos ) ;
//PUT_LOG ( 'GET_FIRST_FILE [' + Dir + '][' + Mascara + ']' ) ;
If Resultado = 0 Then Begin
   Result := Dir + RecDos.Name ;
   SysUtils.FindClose ( RecDos ) ;
   //PUT_LOG ( 'OK GET_FIRST_FILE [' + Result + ']' ) ;
   Exit ;
End ;
Result := '' ;
//PUT_LOG ( 'NOK GET_FIRST_FILE [' + Result + ']' ) ;
End ;

Procedure ELIMINAR_LINHAS_VAZIAS_ME ( Var ME : TMemo ) ;
Var Local : LongInt ;
    Qtde  : LongInt ;
Begin
If NOT Assigned ( ME ) Then Begin
   Exit ;
End ;
Qtde := ME.Lines.Count ;
If Qtde = 0 Then Begin
   Exit ;
End ;
For Local := Qtde - 1 DownTo 0 Do Begin
   If Trim ( ME.Lines[Local] ) = '' Then Begin
      ME.Lines.Delete ( Local ) ;
   End ;
End ;
End ;

Procedure ELIMINAR_LINHAS_DUPLICADAS_ME ( Var ME : TMemo ) ;
Var Local : LongInt ;
    Qtde  : LongInt ;
Begin
If NOT Assigned ( ME ) Then Begin
   Exit ;
End ;
Qtde := ME.Lines.Count ;
If Qtde < 2 Then Begin
   Exit ;
End ;
For Local := Qtde - 1 DownTo 1 Do Begin
   If Trim ( ME.Lines[Local] ) = Trim ( ME.Lines[Local-1] ) Then Begin
      ME.Lines.Delete ( Local ) ;
   End ;
End ;
End ;

Procedure ELIMINAR_LINHAS_VAZIAS_SL ( Var SL : TStringList ) ;
Var Local : LongInt ;
    Qtde  : LongInt ;
Begin
If NOT Assigned ( SL ) Then Begin
   Exit ;
End ;
Qtde := SL.Count ;
If Qtde = 0 Then Begin
   Exit ;
End ;
For Local := Qtde - 1 DownTo 0 Do Begin
   If Trim ( SL[Local] ) = '' Then Begin
      SL.Delete ( Local ) ;
   End ;
End ;
End ;

Procedure ELIMINAR_LINHAS_DUPLICADAS_SL ( Var SL : TStringList ) ;
Var Local : LongInt ;
    Qtde  : LongInt ;
Begin
If NOT Assigned ( SL ) Then Begin
   Exit ;
End ;
Qtde := SL.Count ;
If Qtde < 2 Then Begin
   Exit ;
End ;
For Local := Qtde - 1 DownTo 1 Do Begin
   If Trim ( SL[Local] ) = Trim ( SL[Local-1] ) Then Begin
      SL.Delete ( Local ) ;
   End ;
End ;
End ;

Procedure ELIMINAR_COMANDOS_INVALIDOS_ME ( Var ME : TMemo ) ;
Var Local : LongInt ;
    Aux   : String ;
    Qtde  : LongInt ;
Begin
If NOT Assigned ( ME ) Then Begin
   Exit ;
End ;
Qtde := ME.Lines.Count ;
If Qtde = 0 Then Begin
   Exit ;
End ;
For Local := Qtde - 1 DownTo 0 Do Begin
   Aux := ME.Lines[Local] ;
   If Copy ( Aux, 1 , 7)  = '[@COLOR' Then Begin
      ME.Lines.Delete ( Local ) ;
   End ;
End ;
End ;

Procedure ELIMINAR_COMANDOS_INVALIDOS_SL ( Var SL : TStringList ) ;
Var Local : LongInt ;
    Aux   : String ;
    Qtde  : LongInt ;
Begin
If NOT Assigned ( SL ) Then Begin
   Exit ;
End ;
Qtde := SL.Count ;
If Qtde = 0 Then Begin
   Exit ;
End ;
For Local := Qtde - 1 DownTo 0 Do Begin
   Aux := SL[Local] ;
   If Copy ( Aux, 1 , 7)  = '[@COLOR' Then Begin
      SL.Delete ( Local ) ;
   End ;
End ;
End ;

Function CMD_SCC_PARA_TEXTO ( Aux : String ) : String ;
Var Lista : TStringList ;
Begin
Lista := TStringList.Create ;
Aux := StringReplace ( Aux, '[@', #13#10'[@', [rfReplaceAll] ) ;
Aux := StringReplace ( Aux, ']', ']'#13#10, [rfReplaceAll] ) ;
Lista.Text := Aux ;
ELIMINAR_LINHAS_VAZIAS_SL ( Lista ) ;
ELIMINAR_COMANDOS_INVALIDOS_SL ( Lista ) ;
ELIMINAR_LINHAS_DUPLICADAS_SL ( Lista ) ;
Result := Lista.Text ;
Lista.Free ;
End ;

Function HEADER_XML : String ;
Begin
Result := '<?xml version="1.0" encoding="utf-8"?>' ;
End ;

Function TAG_XML_INT ( Tag : String ; Valor : LongInt ) : String ;
Begin
Result := '<' + Tag + '>' + IntToStr ( Valor ) + '</' + Tag + '>' ;
End ;

Function TAG_XML_STRING ( Tag : String ; Valor : String ) : String ;
Begin
Result := '<' + Tag + '>' + Valor + '</' + Tag + '>' ;
End ;

Function TAG_XML_01 ( Tag : String ; Condicao : Boolean ) : String ;
Begin
Result := '<' + Tag + '>' + IF01(Condicao) + '</' + Tag + '>' ;
End ;

Procedure OPEN_FILE_WINDOWS_MEDIA_PLAYER ( FN : String ) ;
Begin
If ( NOT RR_FileExists ( 'OPEN FILE_WINDOWS_MEDIA_PLAYER', FN ) ) AND
   ( FN <> '' ) Then Begin
   PUT_LOG ( 'Arquivo não encontrado' + LFLF +
             FN ) ;
   Exit ;
End ;
ShellExecute ( Application.Handle, 'open', 'wmplayer.exe',
               PChar('"' + FN+'"'), nil, SW_HIDE);
End ;

Procedure PLAY_WAV ( FN : String );
Begin
sndPlaySound ( PChar(FN) , SND_NODEFAULT Or SND_ASYNC ) ;
End ;

Procedure STOP_WAV ;
Begin
sndPlaySound ( nil, 0 ) ; // Stops the sound
End ;

Function SUPRIMIR_ASPAS ( Aux : String ) : String ;
Begin
While Pos ( '"', Aux ) > 0 Do Begin
   Delete ( Aux, Pos ( '"', Aux ), 1 ) ;
End ;
//While Pos ( 'a', Aux ) > 0 Do
//   Delete ( Aux, Pos ( 'a', Aux ), 1 ) ;
Result := Aux ; // StringReplace ( Aux, '"', '', [rfReplaceAll] ) ;
End ;

Function ASPAS_CHYRON ( Aux : String ) : String ;
Begin
Aux := StringReplace ( Aux, '"', '@@@!', [rfReplaceAll] ) ;
Result := '"' + Aux + '"' ;
End  ;

Function ASPAS_SIMPLES ( Aux : String ) : String ;
Begin
Result := '"' + Aux + '"' ;
End  ;

Procedure CRIAR_BACKUP ( FN : String ) ;
Var Destino : String ;
Begin
Destino := INSERE_BARRA ( ExtractFilePath( FN ) ) + 'Backup\' +
           DATAHORA_INVERSA ( Now ) + '@@@' +
           NOME_USUARIO + '@@@' +
           COMPUTADOR_SERIAL + '@@@' +
           ExtractFileName ( FN ) ;
CHECAR_DIRETORIO_FILENAME ( Destino ) ;
CopyFile ( PChar(FN), PChar(Destino), FALSE ) ;
End ;

Function COMP_MOD ( V1 , V2 : Comp ) : Comp ;
Begin
COMP_MOD := V1 - V2 * ( Trunc ( V1 / V2 ) ) ;
End ;

Function CALC_CRC ( Dados : String ) : Comp ;
Var Local : LongInt ;
    Aux   : Comp ;
    AuxC  : Comp ;
Begin
_Debug ( 'INI CALC_CRC' ) ;
Aux := 0 ;
CALC_CRC := 0 ;
If Length ( Dados ) = 0 Then Begin
   _Debug ( 'Exit 1 CALC_CRC' ) ;
   Exit ;
End ;
For Local := 1 To Length ( Dados ) Do Begin
    AuxC := Ord ( Dados [ Local ] ) ;
    Aux := Aux + AuxC * Local ;
End ;
CALC_CRC := COMP_MOD ( Aux , MaxLongInt ) ;
_Debug ( 'FIM CALC_CRC' ) ;
End ;

Function CALC_CRC_DWORD ( Dados : String ) : DWORD ;
Var Local : LongInt ;
Begin
_Debug ( 'INI CALC_CRC_DWORD' ) ;
Result := 0 ;
If Length ( Dados ) = 0 Then Begin
   _Debug ( 'Exit 1 CALC_CRC_DWORD' ) ;
   Exit ;
End ;
For Local := 1 To Length ( Dados ) Do Begin
    Result := Result + Ord ( Dados [ Local ] ) ;
End ;
// Result := Aux ; // COMP_MOD ( Aux , MaxLongInt ) ;
_Debug ( 'FIM CALC_CRC_DWORD' ) ;
End ;

Function CALC_CRC_DWORD_BUFFER ( _Buffer : Array Of Byte ) : DWORD ;
Var Local : LongInt ;
Begin
_Debug ( 'INI CALC_CRC_DWORD_BUFFER' ) ;
Result := 0 ;
If Length ( _Buffer ) = 0 Then Begin
   _Debug ( 'Exit 1 CALC_CRC_DWORD_BUFFER' ) ;
   Exit ;
End ;
For Local := 1 To Length ( _Buffer ) Do Begin
    Result := Result + Ord ( _Buffer [ Local ] ) ;
End ;
// Result := Aux ; // COMP_MOD ( Aux , MaxLongInt ) ;
_Debug ( 'FIM CALC_CRC_DWORD_BUFFER' ) ;
End ;

Function GET_ALTURA_LINHA ( Tamanho : LongInt ) : LongInt ;
Begin
Case Tamanho Of
  1 .. 20  : Result := 50 ;
  21 .. 35 : Result := 60 ;
  36       : Result := 75 ;
  37 .. 39 : Result := 75 ;
  40       : Result := 85 ;
  41 .. 43 : Result := 85 ;
  44       : Result := 91 ;
  45 .. 47 : Result := 91 ;
  48       : Result := 98 ;
  49 .. 51 : Result := 105 ;
  52       : Result := 105 ;
  53 .. 55 : Result := 110 ;
  56       : Result := 110 ;
  57 .. 59 : Result := 120 ;
  60       : Result := 120 ;
  61 .. 63 : Result := 130 ;
  64       : Result := 130 ;
  65 .. 67 : Result := 138 ;
  68       : Result := 138 ;
  69 .. 71 : Result := 145 ;
  72       : Result := 145 ;
  Else
             Result := 180 ;
  End ;
End ;

Procedure TTY ( LB : TListBox ; Msg: String ) ;
Begin
_Debug ( 'INI TTY "' + Msg + '"' ) ;
With LB.Items do Begin
   While Count > 100 Do Begin
      Delete ( 0 ) ;
   End ;
   Inc ( Cnt_TTY ) ;
   Add ( IntToStr ( Cnt_TTY ) + ' - ' + Msg ) ;
   If Count > 0 Then Begin
      LB.ItemIndex := Count - 1 ;
   End ;
   End ;
_Debug ( 'FIM TTY' ) ;
End ;

Function VALIDA_BLOCO_TCP ( Bloco : String ;
                            Var _CRC_Calculado : Comp ;
                            Var _CRC_Recebido : Comp ) : LongInt ;
Var Tamanho       : LongInt ;
    CRC_Calculado ,
    CRC_Recebido  ,
    C1            ,
    C2            ,
    C3            ,
    C4            : Comp ;
Begin
_Debug ( 'INI VALIDA_BLOCO_TCP' ) ;
VALIDA_BLOCO_TCP := 0 ;
Tamanho := Ord ( Bloco [ 5 ] ) * 256 + Ord ( Bloco [ 6 ] ) ;
If Tamanho <> Length ( Bloco ) Then Begin
   //PUT_EVENTO ( FALSE , DISCO_FALSE , 'VALIDA_BLOCO_TCP=1 / Tamanho=' + IntToStr ( Tamanho ) +
   //             '/Length(Bloco)=' + IntToStr ( Length ( Bloco ) ) ) ;
   VALIDA_BLOCO_TCP := 1 ;
   _Debug ( 'Exit 1 VALIDA_BLOCO_TCP' ) ;
   Exit ;
End ;
If Bloco [ 1 ] <> _TCP_SOB1 Then Begin
   VALIDA_BLOCO_TCP := 2 ;
   _Debug ( 'Exit 2 VALIDA_BLOCO_TCP' ) ;
   Exit ;
End ;
If Bloco [ 2 ] <> _TCP_SOB2 Then Begin
   VALIDA_BLOCO_TCP := 4 ;
   _Debug ( 'Exit 3 VALIDA_BLOCO_TCP' ) ;
   Exit ;
End ;
If Bloco [ 3 ] <> _TCP_SOB3 Then Begin
   VALIDA_BLOCO_TCP := 8 ;
   _Debug ( 'Exit 4 VALIDA_BLOCO_TCP' ) ;
   Exit ;
End ;
If Bloco [ 4 ] <> _TCP_SOB4 Then Begin
   VALIDA_BLOCO_TCP := 16 ;
   _Debug ( 'Exit 5 VALIDA_BLOCO_TCP' ) ;
   Exit ;
End ;
If Bloco [ 8 ] <> _TCP_SOD Then Begin
   VALIDA_BLOCO_TCP := 32 ;
   _Debug ( 'Exit 6 VALIDA_BLOCO_TCP' ) ;
   Exit ;
End ;
If Bloco [ Tamanho ] <> _TCP_EOB Then Begin
   VALIDA_BLOCO_TCP := 64 ;
   _Debug ( 'Exit 7 VALIDA_BLOCO_TCP' ) ;
   Exit ;
End ;
C4 := Ord ( Bloco [ Tamanho - 4 ] ) ;
C3 := Ord ( Bloco [ Tamanho - 3 ] ) ;
C2 := Ord ( Bloco [ Tamanho - 2 ] ) ;
C1 := Ord ( Bloco [ Tamanho - 1 ] ) ;
CRC_Recebido := COMP_MOD ( C4 * 256 * 256 * 256 + C3 * 256 * 256 + C2 * 256 + C1 ,
                           MaxLongInt ) ;
{If ( CRC_Recebido < 0 ) OR ( CRC_Recebido > MaxLongInt ) Then
   PUT_LOG ( 'CRC Recebido : ' + CompToStr ( CRC_Recebido ) ) ;}
_CRC_Recebido := CRC_Recebido ;
CRC_Calculado := CALC_CRC ( Copy ( Bloco , 1 , Tamanho - 5 ) ) ;
_CRC_Calculado := CRC_Calculado ;
{ShowMessage ( 'CRC_Calculado : ' + IntToStr ( CRC_Calculado ) + LF +
              'CRC_Recebido  : ' + IntToStr ( CRC_Recebido ) ) ;}
If CRC_Calculado <> CRC_Recebido Then Begin
   VALIDA_BLOCO_TCP := 128 ;
   _Debug ( 'Exit 8 VALIDA_BLOCO_TCP' ) ;
   Exit ;
End ;
_Debug ( 'FIM VALIDA_BLOCO_TCP' ) ;
End ;

Function CompToStr ( Valor : Comp ) : String ;
Begin
Result := Trim ( FloatToStrF ( Valor , ffFixed , 20 , 0 ) ) ;
End ;

Function DIF_TICK ( Tick1 , Tick2 : Comp ) : Comp ;
Begin
If Tick1 >= Tick2 Then Begin
   DIF_TICK := Tick1 - Tick2 ;
End Else Begin
   DIF_TICK := MaxLongInt - Tick2 + Tick1 ;
End ;
End ;

Function GET_COMANDO ( Dados : String ) : String ;
Begin
If Length ( Dados ) >= 20 Then Begin
   GET_COMANDO := Trim ( Copy ( Dados , 1 , 20 ) )
End Else Begin
   GET_COMANDO := '' ;
End ;
End ;

Function GET_PARAMETROS ( Dados : String ) : String ;
Begin
If Length ( Dados ) > 20 Then Begin
   GET_PARAMETROS := Copy ( Dados , 21 , Length ( Dados ) - 20 )
End Else Begin
   GET_PARAMETROS := '' ;
End ;
End ;

Function GET_JORNAIS ( Empresa : String ) : String ;
Var Aux     : String ;
    Retorno : String ;
    Ini     : TMemIniFile ;
    Local   : LongInt ;
Begin
_Debug ( 'INI GET_JORNAIS "' + Empresa + '"' ) ;
Ini := TMemIniFile.Create ( 'C:\tj\jornais.txt' ) ;
Retorno := '' ;
With Ini Do Begin
   For Local := 1 To 999 Do Begin
      Aux := ReadString ( Empresa , 'J' + StrZero ( Local , 3 ) ,
                          'X' ) ;
      If Aux <> 'X' Then Begin
         Retorno := Retorno +
                    COMPLETE ( Copy ( Aux , 1 , 20 ) , 20 ) +
                    COMPLETE ( Copy ( Aux , 23 , 8 ) , 8 ) ;
      End ;
   End ;
   UpdateFile ;
   Free ;
End ;
GET_JORNAIS := Retorno ;
_Debug ( 'FIM GET_JORNAIS' ) ;
End ;

Function HHMMSSToSegundos ( Aux : String ) : LongInt ;
Begin
While Pos ( #32 , Aux ) > 0 Do Begin
   Aux [ Pos ( #32 , Aux ) ] := '0' ;
End ;
Result := TRUNC ( ( StrToTime ( Aux ) + 1E-7 ) * SecsPerDay ) ;
{
If Length ( Aux ) = 8 Then
   Result := StrToInt ( Copy ( Aux , 1 , 2 ) ) * 3600 +
             StrToInt ( Copy ( Aux , 4 , 2 ) ) * 60 +
             StrToInt ( Copy ( Aux , 7 , 2 ) )
   Else
   Result := 0 ;
}
End ;

Function CONVERTER_ESPELHO ( Nome : String ; RE : TRichEdit ;
                             SG3 : TStringGrid ; Dir_Tmp : String ;
                             Var CRC_Atual : Comp ;
                             Modo_Zews : Boolean ) : String ;
Const MAX_LINHAS = 200 ;
Var //Lauda               : T_Lauda_News ;
    //Local               ,
    //Local2              ,
    //Local3              ,
    //Local4              ,
    //Inicio              ,
    //Final               ,
    Linha_SG            : Longint ;
    Contador            : LongInt ;
    Novo_Nome           ,
    Aux                 : String ;
//    Aux2                : String ;
    _Retranca           : String ;
    Espelho             : String ;
    OK                  : Boolean ;
    Tempo_Bloco         : LongInt ;
    _FileName_Comercial : String ;
    Espelho_Comercial   : String ;
    Log                 : String ;
    Modo_CSV            : Boolean ;
    Lista               : TStringList ;
//
Function Str2MMSS ( Str : String ) : String ;
Var Segundos : LongInt ;
Begin
Segundos := Ord ( Str [ 1 ] ) + Ord ( Str [ 2 ] ) * 60 ;
Str2MMSS := StrZero ( Segundos DIV 60 , 2 ) + ':' +
            StrZero ( Segundos MOD 60 , 2 ) ;
End ;
//
Function Segundos2MMSS ( Valor : LongInt ) : String ;
Begin
Result := StrZero ( Valor DIV 60 , 2 ) + ':' +
          StrZero ( Valor MOD 60 , 2 ) ;
End ;
//
Function Str2Segundos ( Str : String ) : LongInt ;
Begin
Result := Ord ( Str [ 1 ] ) + Ord ( Str [ 2 ] ) * 60 ;
End ;
//
Function Filtro ( Str : String ) : String ;
Var Local2 : LongInt ;
    CANCELE : Boolean ;
Begin
CANCELE := FALSE ;
For Local2 := 1 To Length ( Str ) Do Begin
    If Str [ Local2 ] = #0 Then Begin
       CANCELE := TRUE ;
    End ;
    If CANCELE Then Begin
       Str [ Local2 ] := #32 ;
    End ;
End ;
Filtro := Trim ( Str ) ;
End ;
//
Function IS_COMERCIAL ( Str : String ) : Boolean ;
Begin
Result := ( Filtro ( Copy ( Aux , 11 , 15 ) ) = 'COMERCIAL' ) OR
          ( Filtro ( Copy ( Aux , 11 , 15 ) ) = 'COMERCIAL-01' ) OR
          ( Filtro ( Copy ( Aux , 11 , 15 ) ) = 'COMERCIAL-02' ) OR
          ( Filtro ( Copy ( Aux , 11 , 15 ) ) = 'COMERCIAL-03' ) OR
          ( Filtro ( Copy ( Aux , 11 , 15 ) ) = 'COMERCIAL-04' ) OR
          ( Filtro ( Copy ( Aux , 11 , 15 ) ) = 'COMERCIAL-05' ) OR
          ( Filtro ( Copy ( Aux , 11 , 15 ) ) = 'COMERCIAL-06' ) OR
          ( Filtro ( Copy ( Aux , 11 , 15 ) ) = 'COMERCIAL-07' ) OR
          ( Filtro ( Copy ( Aux , 11 , 15 ) ) = 'COMERCIAL-08' ) OR
          ( Filtro ( Copy ( Aux , 11 , 15 ) ) = 'COMERCIAL-09' ) OR
          ( Filtro ( Copy ( Aux , 11 , 15 ) ) = 'COMERCIAL-10' ) OR
          ( Filtro ( Copy ( Aux , 11 , 15 ) ) = 'COMERCIAL-11' ) OR
          ( Filtro ( Copy ( Aux , 11 , 15 ) ) = 'COMERCIAL-12' ) OR
          ( Filtro ( Copy ( Aux , 11 , 15 ) ) = 'COMERCIAL-13' ) OR
          ( Filtro ( Copy ( Aux , 11 , 15 ) ) = 'COMERCIAL-14' ) OR
          ( Filtro ( Copy ( Aux , 11 , 15 ) ) = 'COMERCIAL-15' ) OR
          ( Filtro ( Copy ( Aux , 11 , 15 ) ) = 'COMERCIAL-16' ) OR
          ( Filtro ( Copy ( Aux , 11 , 15 ) ) = 'COMERCIAL-17' ) OR
          ( Filtro ( Copy ( Aux , 11 , 15 ) ) = 'COMERCIAL-18' ) OR
          ( Filtro ( Copy ( Aux , 11 , 15 ) ) = 'COMERCIAL-19' ) OR
          ( Filtro ( Copy ( Aux , 11 , 15 ) ) = 'COMERCIAL-20' ) ;
End ;
//
Function MARCADOR_ZEWS ( Str : String ) : Boolean ;
Begin
Result := ( Filtro ( Str ) = 'INÍCIO' ) OR
          ( Filtro ( Str ) = 'COMERCIAL' ) OR
          ( Filtro ( Str ) = 'BREAK' ) OR
          ( Filtro ( Str ) = 'COMERCIAL-01' ) OR
          ( Filtro ( Str ) = 'COMERCIAL-02' ) OR
          ( Filtro ( Str ) = 'COMERCIAL-03' ) OR
          ( Filtro ( Str ) = 'COMERCIAL-04' ) OR
          ( Filtro ( Str ) = 'COMERCIAL-05' ) OR
          ( Filtro ( Str ) = 'COMERCIAL-06' ) OR
          ( Filtro ( Str ) = 'COMERCIAL-07' ) OR
          ( Filtro ( Str ) = 'COMERCIAL-08' ) OR
          ( Filtro ( Str ) = 'COMERCIAL-09' ) OR
          ( Filtro ( Str ) = 'COMERCIAL-10' ) OR
          ( Filtro ( Str ) = 'COMERCIAL-11' ) OR
          ( Filtro ( Str ) = 'COMERCIAL-12' ) OR
          ( Filtro ( Str ) = 'COMERCIAL-13' ) OR
          ( Filtro ( Str ) = 'COMERCIAL-14' ) OR
          ( Filtro ( Str ) = 'COMERCIAL-15' ) OR
          ( Filtro ( Str ) = 'COMERCIAL-16' ) OR
          ( Filtro ( Str ) = 'COMERCIAL-17' ) OR
          ( Filtro ( Str ) = 'COMERCIAL-18' ) OR
          ( Filtro ( Str ) = 'COMERCIAL-19' ) OR
          ( Filtro ( Str ) = 'COMERCIAL-20' ) OR
          ( Filtro ( Str ) = 'PREVIEW' ) OR
          ( Filtro ( Str ) = 'FIM DO PREVIEW' ) OR
          ( Filtro ( Str ) = 'FIM' ) ;
End ;
//
Function MARCADOR ( Str : String ) : Boolean ;
Begin
MARCADOR := ( Filtro ( Copy ( Aux , 11 , 15 ) ) = 'INÍCIO' ) OR
            ( Filtro ( Copy ( Aux , 11 , 15 ) ) = 'COMERCIAL' ) OR
            ( Filtro ( Copy ( Aux , 11 , 15 ) ) = 'COMERCIAL-01' ) OR
            ( Filtro ( Copy ( Aux , 11 , 15 ) ) = 'COMERCIAL-02' ) OR
            ( Filtro ( Copy ( Aux , 11 , 15 ) ) = 'COMERCIAL-03' ) OR
            ( Filtro ( Copy ( Aux , 11 , 15 ) ) = 'COMERCIAL-04' ) OR
            ( Filtro ( Copy ( Aux , 11 , 15 ) ) = 'COMERCIAL-05' ) OR
            ( Filtro ( Copy ( Aux , 11 , 15 ) ) = 'COMERCIAL-06' ) OR
            ( Filtro ( Copy ( Aux , 11 , 15 ) ) = 'COMERCIAL-07' ) OR
            ( Filtro ( Copy ( Aux , 11 , 15 ) ) = 'COMERCIAL-08' ) OR
            ( Filtro ( Copy ( Aux , 11 , 15 ) ) = 'COMERCIAL-09' ) OR
            ( Filtro ( Copy ( Aux , 11 , 15 ) ) = 'COMERCIAL-10' ) OR
            ( Filtro ( Copy ( Aux , 11 , 15 ) ) = 'COMERCIAL-11' ) OR
            ( Filtro ( Copy ( Aux , 11 , 15 ) ) = 'COMERCIAL-12' ) OR
            ( Filtro ( Copy ( Aux , 11 , 15 ) ) = 'COMERCIAL-13' ) OR
            ( Filtro ( Copy ( Aux , 11 , 15 ) ) = 'COMERCIAL-14' ) OR
            ( Filtro ( Copy ( Aux , 11 , 15 ) ) = 'COMERCIAL-15' ) OR
            ( Filtro ( Copy ( Aux , 11 , 15 ) ) = 'COMERCIAL-16' ) OR
            ( Filtro ( Copy ( Aux , 11 , 15 ) ) = 'COMERCIAL-17' ) OR
            ( Filtro ( Copy ( Aux , 11 , 15 ) ) = 'COMERCIAL-18' ) OR
            ( Filtro ( Copy ( Aux , 11 , 15 ) ) = 'COMERCIAL-19' ) OR
            ( Filtro ( Copy ( Aux , 11 , 15 ) ) = 'COMERCIAL-20' ) OR
            ( Filtro ( Copy ( Aux , 11 , 15 ) ) = 'PREVIEW' ) OR
            ( Filtro ( Copy ( Aux , 11 , 15 ) ) = 'FIM' ) ;
End ;
//
Procedure NOVA_LINHA_SG ( Var Linha : LongInt ) ;
Begin
Inc ( Linha ) ;
If Linha >= SG3.RowCount Then Begin
   SG3.RowCount := SG3.RowCount + 1 ;
End ;
LIMPA_LINHA_SG ( SG3 , Linha ) ;
End ;
//
Procedure CARREGAR_ESPELHO_MODO_ESP ( Novo_Nome : String ) ;
//Var //Arquivo    : File ;
(*
    Buffer     : Array [ 1 .. 128 ] Of Char ;
    Super_Buf  : Array [ 1 .. 32000 ] Of Byte ;
    Local      : LongInt ;
    Local2     : LongInt ;
    Calc_CRC   : Comp ;
    Lidos      : LongInt ;
    Soma       : LongInt ;
*)
Begin
(*
AssignFile ( Arquivo , Novo_Nome ) ;
Reset ( Arquivo , 1 ) ;
BlockRead( Arquivo , Super_Buf , SizeOf(Super_Buf), Lidos ) ;
Calc_CRC := 0 ;
For Local := 1 To Lidos Do
  Calc_CRC := Calc_CRC + Super_Buf [ Local ] * Local ;
CloseFile ( Arquivo ) ;
If Calc_CRC = CRC_Atual Then
   Begin
   Result := 'Arquivo <' + Nome + '> Inalterado (' +
             CompToStr ( Calc_CRC ) + ') [' +
             IntToStr ( Cnt_Converte_Espelho ) + ']' ;
   _Debug ( 'Exit 3 CONVERTE_ESPELHO' ) ;
   Exit ;
   End ;
Reset ( Arquivo , 1 ) ;
If RE <> nil Then
   RE.Lines.Clear ;
If SG3 <> nil Then
   Begin
   SG3.RowCount := 2 ;
   For Local := 0 To SG3.ColCount Do
     SG3.Cells[Local,1] := '' ;
   End ;
Repeat
  BlockRead( Arquivo , Buffer , SizeOf(Buffer), Lidos ) ;
  Soma := 0 ;
  If ( Lidos = 128 ) Then
     Begin
     Aux := '' ;
     For Local := 1 To Lidos Do
         Begin
         Aux := Aux + Buffer [ Local ] ;
         Inc ( Soma , Ord ( Buffer [ Local ] ) ) ;
         End ;
     _Retranca := Trim ( Filtro ( Copy ( Aux , 11 , 15 ) ) ) ;
     If RE <> nil Then
       If Soma <> 0 Then
         If MARCADOR ( Aux ) Then
            Begin
            RE.Lines.Add (
              Complete ( #32 , 3 ) + #32#32 +
              Complete ( #32 , 6 ) + #32#32 +
              Complete ( Filtro ( Copy ( Aux , 11 , 15 ) ) , 15 ) + #32#32 ) ;
            End
            Else
            Begin
            RE.Lines.Add (
               Complete ( Filtro ( Copy ( Aux , 85 , 3 ) ) , 3 ) + #32#32 +
               Complete ( Filtro ( Copy ( Aux , 27 , 6 ) ) , 6 ) + #32#32 +
               Complete ( Filtro ( Copy ( Aux , 11 , 15 ) ) , 15 ) + #32#32 +
               Str2MMSS ( Copy ( Aux , 65 , 2 ) ) + #32#32 +
               Str2MMSS ( Copy ( Aux , 83 , 2 ) ) + #32#32 +
               Complete ( Filtro ( Copy ( Aux , 49 , 3 ) ) + #32 +
                          StrZero ( Ord ( Aux [ 75 ] ) , 2 ) , 6 ) + #32#32 ) ;
            End ;
     If SG3 <> nil Then
       If Soma <> 0 Then
         If MARCADOR ( Aux ) Then
            Begin
            Inc ( Linha_SG ) ;
            If Linha_SG >= SG3.RowCount Then
               SG3.RowCount := SG3.RowCount + 1 ;
            LIMPA_LINHA_SG ( SG3 , Linha_SG ) ;
            SG3.Cells[SG_TP_ITEM,Linha_SG] := '' ;
            SG3.Cells[SG_TP_ANCORA,Linha_SG] := '' ;
            SG3.Cells[SG_TP_RETRANCA,Linha_SG] := Complete ( Filtro ( Copy ( Aux , 11 , 15 ) ) , 15 ) ;
            SG3.Cells[SG_TP_TEMPO,Linha_SG] := '' ;
            SG3.Cells[SG_TP_EDITOR,Linha_SG] := '' ;
            If IS_COMERCIAL ( Aux ) Then
               Begin
               SG3.Cells[SG_TP_TEMPO,Linha_SG] := Segundos2MMSS ( Tempo_Bloco ) ;
               Tempo_Bloco := 0 ;
               End
            End
            Else
            Begin
            Inc ( Linha_SG ) ;
            If Linha_SG >= SG3.RowCount Then
               SG3.RowCount := SG3.RowCount + 1 ;
            LIMPA_LINHA_SG ( SG3 , Linha_SG ) ;
            _Retranca := Trim ( Filtro ( Copy ( Aux , 11 , 15 ) ) ) ;
            If _Retranca <> '' Then
               If ( Linha_SG > 0 ) AND
                  (
                    ( _Retranca[1]='@' ) OR
                    (
                    ( Length ( Trim ( Filtro ( Copy ( Aux , 27 , 6 ) ) ) ) > 0 ) AND
                    ( _Retranca <> 'FINAL PREVIEW' ) AND
                    ( _Retranca <> 'PREVIEW' ) AND
                    ( Copy ( _Retranca , 1 , 10 ) <> 'COMERCIAL-' )
                    )
                  ) Then
                  Begin
                  Inc ( Contador ) ;
                  SG3.Cells[SG_TP_ITEM,Linha_SG] := IntToStr ( Contador ) ;
                  End
                  Else
                  SG3.Cells[SG_TP_ANCORA,Linha_SG] := ''
               Else
               SG3.Cells[SG_TP_ANCORA,Linha_SG] := '' ;
            SG3.Cells[SG_TP_ANCORA,Linha_SG] :=
              Complete ( Filtro ( Copy ( Aux , 27 , 6 ) ) , 6 ) ;
            SG3.Cells[SG_TP_RETRANCA,Linha_SG] :=
              Complete ( _Retranca , 15 ) ;
            SG3.Cells[SG_TP_TEMPO,Linha_SG] :=
              Str2MMSS ( Copy ( Aux , 65 , 2 ) ) ;
            SG3.Cells[SG_TP_EDITOR,Linha_SG] :=
              Complete ( Filtro ( Copy ( Aux , 49 , 3 ) ) + #32 +
                         StrZero ( Ord ( Aux [ 75 ] ) , 2 ) , 6 ) ;
            Tempo_Bloco := Tempo_Bloco + Str2Segundos ( Copy ( Aux , 65 , 2 ) ) ;
            End ;
     If Trim ( _Retranca ) = 'PREVIEW' Then
        OK := FALSE ;
     If OK Then
        If Copy ( Trim ( _Retranca ) , 1 , 10 ) = 'COMERCIAL-' Then
           Espelho := Espelho + //'#=' + LF +
                                '#' + _Retranca + LF
        Else If Copy ( Trim ( _Retranca ) , 1 , 10 ) = 'INÍCIO' Then
           Begin
           Espelho := Espelho + '#' + _Retranca + LF ;
           End
        Else
           Espelho := Espelho +
                      StrZero ( Contador , 2 ) + #32#32 +
                      Complete ( _Retranca , 15 ) + #32 +
                      LF ;
     End ;
  Until ( Lidos <> 128 ) OR ( Soma = 0 ) ;
WRITE_FILE_REAL ( INSERE_BARRA ( Dir_Tmp ) + 'INÍCIO' , Espelho ) ;
If SG3 <> nil Then
   Begin
   Inc ( Linha_SG ) ;
   If Linha_SG >= SG3.RowCount Then
      SG3.RowCount := SG3.RowCount + 1 ;
   LIMPA_LINHA_SG ( SG3 , Linha_SG ) ;
   SG3.Cells[SG_TP_RETRANCA,Linha_SG] := 'FIM DO PREVIEW' ;
   For Local := 1 To SG3.RowCount - 1 Do
      Begin
      If Copy ( SG3.Cells[SG_TP_RETRANCA,Local] , 1 , 10 ) <> 'COMERCIAL-' Then
         Continue ;
      _FileName_Comercial := INSERE_BARRA ( Dir_Tmp ) + SG3.Cells[SG_TP_RETRANCA,Local] ;
      Espelho_Comercial := '' ; // '#=' + LF ;
      For Local2 := Local To SG3.RowCount - 1 Do
         Begin
         _Retranca := Trim ( SG3.Cells[SG_TP_RETRANCA,Local2] ) ;
         If Copy ( _Retranca , 1 , 10 ) = 'COMERCIAL-' Then
            Espelho_Comercial := Espelho_Comercial + '#' +
                                 //StringOfChar ( '*' , 3 ) + ' ' +
                                 _Retranca + LF
         Else If Copy ( _Retranca , 1 , 6 ) = 'INÍCIO' Then
            Espelho_Comercial := Espelho_Comercial + '#' +
                                 //StringOfChar ( '*' , 3 ) + ' ' +
                                 _Retranca + ' ' + LF
         Else
            Espelho_Comercial := Espelho_Comercial +
                              StrZero ( StrToIntDef ( SG3.Cells[SG_TP_ITEM,Local2] , 0 ) , 2 ) + ' ' +
                              _Retranca +
                              LF ;
         End ;
      WRITE_FILE_REAL ( _FileName_Comercial , Espelho_Comercial ) ;
      End ;
   End ;
CloseFile ( Arquivo ) ;
CRC_Atual := Calc_CRC ;
Result := 'Carregado : <' + Nome + '> [' +
          IntToStr ( Cnt_Converte_Espelho ) + ']' ;
WRITE_FILE_REAL ( Diretorio + 'log\log_converte_espelho.log' , Log ) ;
*)
End ;
//
Function SOMAR_TEXTO ( Texto : String ) : LongInt ;
Var Local : LongInt ;
Begin
Result := 0 ;
For Local := 1 To Length ( Texto ) Do Begin
   Result := Result + ( Local * Ord ( Texto[Local] ) ) ;
End ;
End ;
//
Procedure CARREGAR_ARQUIVO_MODO_CSV ( Novo_Nome : String ) ;
Var Local        : LongInt ;
    Local2       : LongInt ;
    Calc_CRC     : Comp ;
//    Soma         : LongInt ;
    Local_Linhas : LongInt ;
    Matriz       : TArray ;
    Registro     : T_Espelho_DB ;
    Log          : String ;
    Qtde         : LongInt ;
Begin
_Debug ( 'INI CARREGAR_ARQUIVO_MODO_CSV [' + Novo_Nome + ']' ) ;
Lista := TStringList.Create ;
Lista.Text := GET_CONTEUDO_M ( 'CARREGAR_ARQUIVO_MODO_CSV', Novo_Nome ) ;
Calc_CRC := SOMAR_TEXTO ( Lista.Text ) ;
If Calc_CRC = CRC_Atual Then Begin
   Result := 'Arquivo <' + Nome + '> Inalterado (' +
             CompToStr ( Calc_CRC ) + ') [' +
             IntToStr ( Cnt_Converte_Espelho ) + ']' ;
   _Debug ( 'Exit 1 Calc_CRC <> CRC_Atual CARREGAR_ARQUIVO_MODO_CSV' ) ;
   Exit ;
End ;
If RE <> nil Then Begin
   RE.Lines.Clear ;
End ;
If SG3 <> nil Then Begin
   SG3.RowCount := 2 ;
   For Local := 0 To SG3.ColCount Do Begin
     SG3.Cells[Local,1] := '' ;
   End ;
End ;
Qtde := Lista.Count ;
If Qtde < 3 Then Begin
   _Debug ( 'Exit 2 Lista.Count CARREGAR_ARQUIVO_MODO_CSV' ) ;
   Exit ;
End ;
Log := '' ;
For Local_Linhas := 0 To Qtde - 1 Do Begin
   Aux := Trim ( Lista[Local_Linhas] ) ;
   //Soma := 0 ;
   If ( Length ( Aux ) > 10 ) Then Begin
      Matriz := Explode2 ( ';' , Aux , 0 ) ;
      //Log := Log + Aux + ' [' + IntToStr ( Length ( Matriz ) ) + ']' + LF ;
      If Length ( Matriz ) < 5 Then Begin
         _Debug ( 'Continue 1 Matriz<5 CARREGAR_ARQUIVO_MODO_CSV' ) ;
         Continue ;
      End ;
      _Debug ( '7 CARREGAR_ARQUIVO_MODO_CSV' ) ;
      Registro.Ancora := Trim ( Matriz[0] ) ;
      Registro.Retranca := Trim ( Matriz[1] ) ;
      Registro.Tempo_Total := MMSSToSegundos2 ( Matriz[2] ) ;
      _Debug ( '8 CARREGAR_ARQUIVO_MODO_CSV' ) ;
      If Registro.Tempo_Total > 0 Then Begin
         Registro.Tempo_Total_Str := SegundosToMMSS2 ( Registro.Tempo_Total , 5 )
      End Else Begin
         Registro.Tempo_Total_Str := '-' ;
      End ;
      Registro.Tempo_VT := MMSSToSegundos2 ( Matriz[3] ) ;
      _Debug ( '9 CARREGAR_ARQUIVO_MODO_CSV' ) ;
      If Registro.Tempo_VT > 0 Then Begin
         Registro.Tempo_VT_Str := SegundosToMMSS2 ( Registro.Tempo_VT , 5 )
      End Else Begin
         Registro.Tempo_VT_Str := '-' ;
      End ;
      Registro.Tempo_Externa := MMSSToSegundos2 ( Matriz[4] ) ;
      _Debug ( '10 CARREGAR_ARQUIVO_MODO_CSV' ) ;
      If Registro.Tempo_Externa > 0 Then Begin
         Registro.Tempo_Externa_Str := SegundosToMMSS2 ( Registro.Tempo_Externa , 5 )
      End Else Begin
         Registro.Tempo_Externa_Str := '-' ;
      End ;
      _Debug ( '11 CARREGAR_ARQUIVO_MODO_CSV' ) ;
      Registro.GC_Modificado := Trim ( Matriz[5] ) ;
      Registro.Editor := Trim ( Matriz[6] ) ;
      Registro.Status := StrToIntDef ( Matriz[7] , 0 ) ;
      _Debug ( '12 CARREGAR_ARQUIVO_MODO_CSV' ) ;
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
      _Debug ( '13 CARREGAR_ARQUIVO_MODO_CSV' ) ;
      //VIEW_REGISTRO ( Registro ) ;
      {
      If ( RE <> nil ) AND ( Soma <> 0 ) Then
         Begin
         If MARCADOR ( Aux ) Then
            Begin
            RE.Lines.Add (
              Complete ( #32 , 3 ) + #32#32 +
              Complete ( #32 , 6 ) + #32#32 +
              Complete ( Filtro ( Registro.Retranca ) , SIZE_NOME_RETRANCA ) + #32#32 ) ;
            End
            Else
            Begin
            End ;
         End ;
      }
      //Soma := 1 ;
      _Debug ( '14 CARREGAR_ARQUIVO_MODO_CSV' ) ;
      If ( SG3 <> nil ) Then Begin
         _Debug ( '15 CARREGAR_ARQUIVO_MODO_CSV' ) ;
         If MARCADOR ( Aux ) Then Begin
            _Debug ( '16 CARREGAR_ARQUIVO_MODO_CSV' ) ;
            Inc ( Linha_SG ) ;
            If Linha_SG >= SG3.RowCount Then Begin
               SG3.RowCount := SG3.RowCount + 1 ;
            End ;
            LIMPA_LINHA_SG ( SG3 , Linha_SG ) ;
            SG3.Cells[SG_TP_ITEM,Linha_SG] := '' ;
            SG3.Cells[SG_TP_ANCORA,Linha_SG] := '' ;
            SG3.Cells[SG_TP_RETRANCA,Linha_SG] := Registro.Retranca ;
            SG3.Cells[SG_TP_TEMPO,Linha_SG] := '' ;
            SG3.Cells[SG_TP_EDITOR,Linha_SG] := '' ;
            If IS_COMERCIAL ( Registro.Retranca ) Then Begin
               SG3.Cells[SG_TP_TEMPO,Linha_SG] := SegundosToMMSS2 ( Registro.Tempo_Total , 0 ) ;
               Tempo_Bloco := 0 ;
            End
         End Else Begin
            _Debug ( '17 CARREGAR_ARQUIVO_MODO_CSV' ) ;
            Inc ( Linha_SG ) ;
            If Linha_SG >= SG3.RowCount Then Begin
               SG3.RowCount := SG3.RowCount + 1 ;
            End ;
            LIMPA_LINHA_SG ( SG3 , Linha_SG ) ;
            _Debug ( '18 CARREGAR_ARQUIVO_MODO_CSV' ) ;
            If Registro.Retranca <> '' Then Begin
               _Debug ( '18a CARREGAR_ARQUIVO_MODO_CSV' ) ;
               If ( Linha_SG > 0 ) AND
                  (
                    ( Registro.Retranca[1]='@' ) OR
                    (
                    ( Length ( Trim ( Filtro ( Copy ( Aux , 27 , 6 ) ) ) ) > 0 ) AND
                    ( Registro.Retranca <> 'FINAL PREVIEW' ) AND
                    ( Registro.Retranca <> 'PREVIEW' ) AND
                    ( Copy ( Registro.Retranca , 1 , 10 ) <> 'COMERCIAL-' )
                    )
                  ) Then Begin
                  _Debug ( '18b CARREGAR_ARQUIVO_MODO_CSV' ) ;
                  Inc ( Contador ) ;
                  SG3.Cells[SG_TP_ITEM,Linha_SG] := IntToStr ( Contador ) ;
               End Else Begin
                  _Debug ( '18c CARREGAR_ARQUIVO_MODO_CSV' ) ;
                  SG3.Cells[SG_TP_ANCORA,Linha_SG] := ''
               End ;
            End Else Begin
               _Debug ( '18d CARREGAR_ARQUIVO_MODO_CSV' ) ;
               SG3.Cells[SG_TP_ANCORA,Linha_SG] := '' ;
            End ;
            _Debug ( '18e CARREGAR_ARQUIVO_MODO_CSV' ) ;
            SG3.Cells[SG_TP_ANCORA,Linha_SG] := Complete ( Filtro ( Registro.Ancora ) , 6 ) ;
            SG3.Cells[SG_TP_RETRANCA,Linha_SG] := Complete ( Registro.Retranca , SIZE_NOME_RETRANCA ) ;
            _Debug ( '18f CARREGAR_ARQUIVO_MODO_CSV' ) ;
            SG3.Cells[SG_TP_TEMPO,Linha_SG] := SegundosToMMSS2 ( Registro.Tempo_Total , 0 ) ;
            SG3.Cells[SG_TP_EDITOR,Linha_SG] := Filtro ( Registro.Editor ) ;
            _Debug ( '18g CARREGAR_ARQUIVO_MODO_CSV' ) ;
            //Tempo_Bloco := Tempo_Bloco + Str2Segundos ( Copy ( Aux , 65 , 2 ) ) ;
         End ;
      End ;
      If Trim ( Registro.Retranca ) = 'PREVIEW' Then Begin
         OK := FALSE ;
      End ;
      If OK Then Begin
         If Copy ( Trim ( Registro.Retranca ) , 1 , 10 ) = 'COMERCIAL-' Then Begin
            Espelho := Espelho + '#' + Registro.Retranca + LF ;
         End Else If Copy ( Trim ( Registro.Retranca ) , 1 , 10 ) = 'INÍCIO' Then Begin
            Espelho := Espelho + '#' + Registro.Retranca + LF ;
         End Else Begin
            Espelho := Espelho +
                       StrZero ( Contador , 2 ) + #32#32 +
                       Complete ( Registro.Retranca , SIZE_NOME_RETRANCA ) + #32 +
                       LF ;
         End ;
      End ;
   End ;
End ;
_Debug ( '2 Lista.Count CARREGAR_ARQUIVO_MODO_CSV' ) ;
WRITE_FILE_CORE ( 'CARREGAR_ARQUIVO_MODO_CSV/1',
                  INSERE_BARRA ( Dir_Tmp ) + 'INÍCIO' , Espelho, DELAYED_FALSE ) ;
If SG3 <> nil Then Begin
   Inc ( Linha_SG ) ;
   If Linha_SG >= SG3.RowCount Then Begin
      SG3.RowCount := SG3.RowCount + 1 ;
   End ;
   LIMPA_LINHA_SG ( SG3 , Linha_SG ) ;
   SG3.Cells[SG_TP_RETRANCA,Linha_SG] := 'FIM DO PREVIEW' ;
   For Local := 1 To SG3.RowCount - 1 Do Begin
      If Copy ( SG3.Cells[SG_TP_RETRANCA,Local] , 1 , 10 ) <> 'COMERCIAL-' Then Begin
         Continue ;
      End ;
      _FileName_Comercial := INSERE_BARRA ( Dir_Tmp ) + SG3.Cells[SG_TP_RETRANCA,Local] ;
      Espelho_Comercial := '' ; // '#=' + LF ;
      For Local2 := Local To SG3.RowCount - 1 Do Begin
         _Retranca := Trim ( SG3.Cells[SG_TP_RETRANCA,Local2] ) ;
         If Copy ( _Retranca , 1 , 10 ) = 'COMERCIAL-' Then Begin
            Espelho_Comercial := Espelho_Comercial + '#' +
                                 //StringOfChar ( '*' , 3 ) + ' ' +
                                 _Retranca + LF
         End Else If Copy ( _Retranca , 1 , 6 ) = 'INÍCIO' Then Begin
            Espelho_Comercial := Espelho_Comercial + '#' +
                                 //StringOfChar ( '*' , 3 ) + ' ' +
                                 _Retranca + ' ' + LF
         End Else Begin
            Espelho_Comercial := Espelho_Comercial +
                              StrZero ( StrToIntDef ( SG3.Cells[SG_TP_ITEM,Local2] , 0 ) , 2 ) + ' ' +
                              _Retranca +
                              LF ;
         End ;
      End ;
      WRITE_FILE_CORE ( 'CARREGAR_ARQUIVO_MODO_CSV/2',
                        _FileName_Comercial , Espelho_Comercial, DELAYED_FALSE ) ;
   End ;
End ;
_Debug ( '3 Lista.Count CARREGAR_ARQUIVO_MODO_CSV' ) ;
//CloseFile ( Arquivo ) ;
CRC_Atual := Calc_CRC ;
Result := 'Carregado : <' + Nome + '> [' +
          IntToStr ( Cnt_Converte_Espelho ) + ']' ;
_Debug ( '4 Lista.Count CARREGAR_ARQUIVO_MODO_CSV' ) ;
//WRITE_FILE_REAL ( Diretorio + 'log\log_converte_espelho.log' , Log ) ;
{
PUT_LOG ( 'CONVERTER_ESPELHO' + LF +
              'Modo_Zews: ' + IFSN ( Modo_Zews ) + LF +
              'Modo_CSV: ' + IFSN ( Modo_CSV ) + LF +
              'Novo Nome: ' + Novo_Nome + LF +
              'Tag: 1' + LF +
              'Log: ' + Log + LF +
              'SG3: ' + IFSN ( Assigned ( SG3 ) ) + LF +
              'SG3.Nome: ' + SG3.Name + LF +
              'Lista.Count: ' + IntToStr ( Lista.Count ) + LF +
              Nome ) ;
}
_Debug ( 'FIM Lista.Count CARREGAR_ARQUIVO_MODO_CSV' ) ;
End ;
// ============================================================================
Begin
_Debug ( 'INI CONVERTE_ESPELHO / Nome="' + Nome + '"' ) ;
PUT_LOG ( 'CONVERTER_JORNAL [' + Nome + '][MODO_ZEWS:' + IFSN(Modo_Zews) + ']' ) ;
Log := 'Inicio' + LF ;
Inc ( Cnt_Converte_Espelho ) ;
Linha_SG := 0 ;
Contador := 0 ;
OK := TRUE ;
Log := Log + 'MODO_ZEWS: ' + IFSN ( Modo_Zews ) + LF ;
If (Modo_Zews) Then Begin
   (*
   If RE <> nil Then
      RE.Lines.Clear ;
   If SG3 <> nil Then
      Begin
      SG3.RowCount := 2 ;
      For Local := 0 To SG3.ColCount Do
        SG3.Cells[Local,1] := '' ;
      End ;
   For Local4 := 1 To 2 Do
      Begin
      If Local4 = 1 Then
         Begin
         Inicio := 1 ;
         Final := MAX_LAUDAS_SCRIPT_NEWS ;
         NOVA_LINHA_SG ( Linha_SG ) ;
         SG3.Cells[SG_TP_ITEM,SG3.RowCount-1] := '' ;
         SG3.Cells[SG_TP_SEQUENCIA,SG3.RowCount-1] := '' ;
         SG3.Cells[SG_TP_ANCORA,SG3.RowCount-1] := '' ;
         SG3.Cells[SG_TP_RETRANCA,SG3.RowCount-1] := 'INÍCIO' ;
         SG3.Cells[SG_TP_TEMPO,SG3.RowCount-1] := '' ;
         SG3.Cells[SG_TP_EDITOR,SG3.RowCount-1] := '' ;
         Log := Log + 'DEF INTERVALO 1: ' + IntToStr ( Inicio ) + ':' + IntToStr ( Final ) + LF ;
         End
         Else
         Begin
         Inicio := - MAX_LAUDAS_SCRIPT_NEWS ;
         Final := -1 ;
         NOVA_LINHA_SG ( Linha_SG ) ;
         SG3.Cells[SG_TP_ITEM,SG3.RowCount-1] := '' ;
         SG3.Cells[SG_TP_SEQUENCIA,SG3.RowCount-1] := '' ;
         SG3.Cells[SG_TP_ANCORA,SG3.RowCount-1] := '' ;
         SG3.Cells[SG_TP_RETRANCA,SG3.RowCount-1] := 'FIM' ;
         SG3.Cells[SG_TP_TEMPO,SG3.RowCount-1] := '' ;
         SG3.Cells[SG_TP_EDITOR,SG3.RowCount-1] := '' ;
         NOVA_LINHA_SG ( Linha_SG ) ;
         SG3.Cells[SG_TP_ITEM,SG3.RowCount-1] := '' ;
         SG3.Cells[SG_TP_SEQUENCIA,SG3.RowCount-1] := '' ;
         SG3.Cells[SG_TP_ANCORA,SG3.RowCount-1] := '' ;
         SG3.Cells[SG_TP_RETRANCA,SG3.RowCount-1] := 'PREVIEW' ;
         SG3.Cells[SG_TP_TEMPO,SG3.RowCount-1] := '' ;
         SG3.Cells[SG_TP_EDITOR,SG3.RowCount-1] := '' ;
         Log := Log + 'DEF INTERVALO 2: ' + IntToStr ( Inicio ) + ':' + IntToStr ( Final ) + LF ;
         End ;
      For Local3 := Inicio To Final Do
         Begin
         Lauda := Script_Zews[Local3] ;
         Log := Log + 'Passo Loop Local3 [' + IntToStr ( Local3 ) + '][' + Lauda.Lau_Descricao + ']' + LF ;
         _Retranca := Trim ( Lauda.Lau_Descricao ) ;
         If Trim ( _Retranca ) = '' Then
            Continue ;
         Aux := '' ;
         If SG3 <> nil Then
            Begin
            NOVA_LINHA_SG ( Linha_SG ) ;
            SG3.Cells[SG_TP_ITEM,SG3.RowCount-1] := IntToStr ( Local3 ) ;
            SG3.Cells[SG_TP_SEQUENCIA,SG3.RowCount-1] := IntToStr ( Lauda.Scr_Lau_Sequencia ) ;
            If MARCADOR_ZEWS ( _Retranca ) Then
               Begin
               SG3.Cells[SG_TP_ANCORA,SG3.RowCount-1] := '' ;
               SG3.Cells[SG_TP_RETRANCA,SG3.RowCount-1] := _Retranca ;
               SG3.Cells[SG_TP_TEMPO,SG3.RowCount-1] := '' ;
               SG3.Cells[SG_TP_EDITOR,SG3.RowCount-1] := '' ;
               If IS_COMERCIAL ( Aux ) Then
                  Begin
                  SG3.Cells[SG_TP_TEMPO,SG3.RowCount-1] := Segundos2MMSS ( Tempo_Bloco ) ;
                  Tempo_Bloco := 0 ;
                  End
               End
               Else
               Begin
               {
               If ( Linha_SG > 0 ) AND
                  (
                    ( _Retranca[1]='@' ) OR
                    (
                    ( Length ( Trim ( Filtro ( Copy ( Aux , 27 , 6 ) ) ) ) > 0 ) AND
                    ( _Retranca <> 'FINAL PREVIEW' ) AND
                    ( _Retranca <> 'PREVIEW' ) AND
                    ( Copy ( _Retranca , 1 , 10 ) <> 'COMERCIAL-' )
                    )
                  ) Then
                  Begin
                  Inc ( Contador ) ;
                  End
                  Else
                  SG3.Cells[SG_TP_ANCORA,Linha_SG] := '' ;
               }
               SG3.Cells[SG_TP_ANCORA,Linha_SG] := Lauda.Loc_Nome ;
               SG3.Cells[SG_TP_RETRANCA,Linha_SG] := _Retranca ;
               SG3.Cells[SG_TP_TEMPO,Linha_SG] := Segundos2MMSS ( Lauda.Lau_Tempo ) ;
               SG3.Cells[SG_TP_EDITOR,Linha_SG] := Filtro ( Copy ( Lauda.Ope_Codigo , 1 , 3 ) ) ; // + #32 + StrZero ( Ord ( Aux [ 75 ] ) , 2 ) , 6 ) ;
               Tempo_Bloco := Tempo_Bloco + Lauda.Lau_Tempo ;
               End ;
            End ;
         If Trim ( _Retranca ) = 'PREVIEW' Then
            OK := FALSE ;
         If OK Then
            If Copy ( _Retranca , 1 , 10 ) = 'COMERCIAL-' Then
               Espelho := Espelho + //'#=' + LF +
                                    '#' + _Retranca + LF
            Else If Copy ( _Retranca , 1 , 10 ) = 'INÍCIO' Then
               Begin
               Espelho := Espelho + '#' + _Retranca + LF ;
               End
            Else
               Espelho := Espelho +
                          StrZero ( Contador , 2 ) + #32#32 +
                          _Retranca + #32 +
                          LF ;
         End ;
      End ;
   WRITE_FILE_REAL ( INSERE_BARRA ( Dir_Tmp ) + 'INÍCIO' , Espelho ) ;
   If SG3 <> nil Then
      Begin
      NOVA_LINHA_SG ( Linha_SG ) ;
      SG3.Cells[SG_TP_RETRANCA,SG3.RowCount-1] := 'FIM DO PREVIEW' ;
      For Local := 1 To SG3.RowCount - 1 Do
         Begin
         If Copy ( SG3.Cells[SG_TP_RETRANCA,Local] , 1 , 10 ) <> 'COMERCIAL-' Then
            Continue ;
         _FileName_Comercial := INSERE_BARRA ( Dir_Tmp ) + SG3.Cells[SG_TP_RETRANCA,Local] ;
         Espelho_Comercial := '' ; // '#=' + LF ;
         For Local2 := Local To SG3.RowCount - 1 Do
            Begin
            _Retranca := Trim ( SG3.Cells[SG_TP_RETRANCA,Local2] ) ;
            If Copy ( _Retranca , 1 , 10 ) = 'COMERCIAL-' Then
               Espelho_Comercial := Espelho_Comercial + '#' +
                                    //StringOfChar ( '*' , 3 ) + ' ' +
                                    _Retranca + LF
            Else If Copy ( _Retranca , 1 , 6 ) = 'INÍCIO' Then
               Espelho_Comercial := Espelho_Comercial + '#' +
                                    //StringOfChar ( '*' , 3 ) + ' ' +
                                    _Retranca + ' ' + LF
            Else
               Espelho_Comercial := Espelho_Comercial +
                                 StrZero ( StrToIntDef ( SG3.Cells[SG_TP_ITEM,Local2] , 0 ) , 2 ) + ' ' +
                                 _Retranca +
                                 LF ;
            End ;
         WRITE_FILE_REAL ( _FileName_Comercial , Espelho_Comercial ) ;
         End ;
      End ;
   *)
End Else Begin
   Modo_CSV := ( UpperCase ( Copy ( Nome , Length ( Nome ) - 3 , 4 ) ) = '.CSV' ) ;
   If NOT RR_FileExists ( 'CONVERTER_ESPELHO/1', Nome )  Then Begin
      Result := 'Arquivo <' + Nome + '> Não Encontrado. [' +
                IntToStr ( Cnt_Converte_Espelho ) + ']' ;
      _Debug ( 'Exit 1 CONVERTE_ESPELHO' ) ;
      Exit ;
   End ;
   Novo_Nome := INSERE_BARRA ( Dir_Tmp ) + ExtractFileName ( Nome ) ;
   CHECAR_DIRETORIO_FILENAME ( Novo_Nome ) ;
   If NOT CopiaArquivo ( 'CARREGAR_ARQUIVO_MODO_CSV',
                         Nome , Novo_Nome , SOBREPOE ) Then Begin
      Result := 'Erro ao copiar <' + Nome + '> para <' + Novo_Nome +
                '> [' + IntToStr ( Cnt_Converte_Espelho ) + ']' ;
      _Debug ( 'Exit 2 CONVERTE_ESPELHO' ) ;
      Exit ;
   End ;
   If MODO_CSV Then Begin
      CARREGAR_ARQUIVO_MODO_CSV ( Novo_Nome ) ;
   End Else Begin
      CARREGAR_ESPELHO_MODO_ESP ( Novo_Nome ) ;
   End ;
End ;
_Debug ( 'FIM CONVERTE_ESPELHO' ) ;
End ;

Procedure LIMPA_LINHA_SG ( SG : TStringGrid ; Linha : LongInt ) ;
Var Local : LongInt ;
Begin
If SG.RowCount > Linha Then Begin
   For Local := 0 To SG.ColCount - 1 Do Begin
      SG.Cells[Local,Linha] := '' ;
   End ;
End ;
End ;

Function MMSSToSegundos2 ( Aux : String ) : LongInt ;
Begin
If Length ( Aux ) = 5 Then Begin
   Try
      Result := StrToIntDef ( Copy ( Aux , 1 , 2 ), 0 ) * 60 +
                StrToIntDef ( Copy ( Aux , 4 , 2 ), 0 ) ;
   Except
      Result := 0 ;
   End ;
End Else Begin
   If Aux = '-' Then Begin
      Result := 0
   End Else Begin
      Result := -1 ;
   End ;
End ;
End ;

Function Explode2 ( cDelimiter, sValue : String ; iCount : Integer) : TArray ;
Var  s   : String ;
     i   ,
     p   : Integer ;
Begin
s := sValue ;
i := 0 ;
While Length(s) > 0 Do Begin
   Inc(i) ;
   SetLength ( Result, i ) ;
   p := Pos ( cDelimiter, s ) ;
   if ( p > 0 ) AND ( ( i < iCount ) OR ( iCount = 0) ) Then Begin
      Result[i-1] := Trim ( Copy (s,0,p-1) ) ;
      s := Copy ( s, p + Length(cDelimiter), Length(s) ) ;
   End Else Begin
      Result[i - 1] := Trim ( s ) ;
      s := '' ;
   End ;
End ;
End ;

Function SegundosToMMSS2 ( Aux : LongInt ; Casas : Byte ) : String ;
Begin
If Aux < 0 Then Begin
   Result := '0' ;
   Exit ;
End ;
If Aux > (59*99) Then Begin
   Result := '99-99' ;
   Exit ;
End ;
Result := StrZero ( Aux DIV 60 , 2 ) + ':' +
          StrZero ( Aux MOD 60 , 2 ) ;
If ( Casas = 1 ) AND ( Aux = 0 ) Then Begin
   Result := '-' ;
End ;
End ;

Procedure CONVERTE_USUARIOS ( Nome : String ; RE : TRichEdit ) ;
Const MAX_LINHAS = 500 ;
Var Arquivo : File ;
    Buffer  : Array [ 1 .. 36 ] Of Char ;
    Local   ,
    Soma    ,
    Lidos   : Longint ;
    Aux     : String ;
    Lista   : TStringList ;
Function Str2MMSS ( Str : String ) : String ;
Var Segundos : LongInt ;
Begin
Segundos := Ord ( Str [ 1 ] ) + Ord ( Str [ 2 ] ) * 60 ;
Str2MMSS := StrZero ( Segundos DIV 60 , 2 ) + ':' +
            StrZero ( Segundos MOD 60 , 2 ) ;
End ;
//===
Function RET_USUARIO_WINSCRIPT ( Usr : String ) : String ;
Const BASE =  'ABCDEFGHIJKLM' +
              'NOPQRSTUVWXYZ' +
              '0123456789' +
              '@*,,/<>()?' +
              '!;:+%&|_\' + #32 ;
      GRUPO1 = #$BE#$BD#$BC#$BB#$BA#$B9#$B8#$B7#$B6#$B5#$B4#$B3#$B2 +
               #$B1#$B0#$AF#$AE#$AD#$AC#$AB#$AA#$A9#$A8#$A7#$A6#$A5 +
               #$CF#$CE#$CD#$CC#$CB#$CA#$C9#$C8#$C7#$C6 +
               #$BF#$D5#$D3#$D1#$D0#$C3#$C1#$D7#$D6#$C0 +
               #$DE#$C4#$C5#$D4#$DA#$D9#$83#$A0#$A3#$DF ;
      GRUPO2 = #$F6#$F5#$F4#$F3#$F2#$F1#$F0#$FF#$FE#$FD#$FC#$FB#$FA +
               #$F9#$F8#$E7#$E6#$E5#$E4#$E3#$E2#$E1#$E0#$EF#$EE#$ED +
               #$87#$86#$85#$84#$83#$82#$81#$80#$8F#$8E +
               #$F7#$9D#$9B#$99#$98#$8B#$89#$9F#$9E#$88 +
               #$96#$8C#$8D#$9C#$92#$91#$CB#$E8#$EB#$97 ;
      GRUPO3 = #$5A#$59#$58#$5F#$5E#$5D#$5C#$53#$52#$51#$50#$57#$56 +
               #$55#$54#$4B#$4A#$49#$48#$4F#$FE#$4D#$4C#$43#$42#$41 +
               #$2B#$2A#$29#$28#$2F#$2E#$2D#$2C#$23#$22 +
               #$5B#$31#$37#$35#$34#$27#$25#$33#$32#$24 +
               #$3A#$20#$21#$30#$3E#$3D#$67#$44#$47#$32 ;
Var Local   : LongInt ;
    Grupo   ,
    Aux     : String ;
    Posicao : LongInt ;
Begin
Usr := Filtro_NW ( Usr ) ;
Aux := '' ;
If Length ( Usr ) > 0 Then Begin
   For Local := 1 To Length ( Usr ) Do Begin
      Case Local Of
          01 .. 04 : Grupo := GRUPO1 ;
          05 .. 09 : Grupo := GRUPO2 ;
          10 .. 15 : Grupo := GRUPO3 ;
          End ;
      Posicao := Pos ( Usr [ Local ] , GRUPO ) ;
      If ( Grupo = GRUPO1 ) AND ( Usr [ Local ] = #$FF ) Then Begin
         Break ;
      End ;
      If ( Grupo = GRUPO2 ) AND ( Usr [ Local ] = #$B7 ) Then Begin
         Break ;
      End ;
      If ( Grupo = GRUPO3 ) AND ( Usr [ Local ] = #$1B ) Then Begin
         Break ;
      End ;
      If Posicao <> 0 Then Begin
         Aux := Aux + BASE [ Posicao ]
      End Else Begin
         Aux := Aux + '?' ;
      End ;
   End ;
End ;
RET_USUARIO_WINSCRIPT := Aux ;
End ;
//==
Function DECODIFICA_SENHA ( Str : String ) : String ;
Begin
End ;
//--
{ Inicio do Corpo Principal da Funcao CONVERTE_USUARIOS }
//--
Begin
_Debug ( 'INI CONVERTE_USUARIOS' ) ;
RE.Lines.Clear ;
AssignFile ( Arquivo , Nome ) ;
Reset ( Arquivo , 1 ) ;
Lista := TStringList.Create ;
Lista.Clear ;
Repeat
   BlockRead( Arquivo , Buffer , SizeOf(Buffer), Lidos ) ;
   Soma := 0 ;
   If ( Lidos = 36 ) Then Begin
      Aux := '' ;
      For Local := 1 To Lidos Do Begin
          Aux := Aux + Buffer [ Local ] ;
          Inc ( Soma , Ord ( Buffer [ Local ] ) ) ;
      End ;
      If Soma <> 0 Then Begin
         Lista.Add (
           Complete ( RET_USUARIO_WINSCRIPT ( Copy ( Aux , 1 , 15 ) ) , 15 ) + #32#32 +
           Complete ( Filtro_NW ( Copy ( Aux , 17 , 3 ) ) , 3 ) + #32#32 +
           Complete ( Filtro_NW ( Copy ( Aux , 21 , 9 ) ) , 9 ) + #32#32 ) ;
 {
         RE.Lines.Add (
           Complete ( RET_USUARIO_WINSCRIPT ( Copy ( Aux , 1 , 15 ) ) , 15 ) + #32#32 +
           Complete ( Filtro ( Copy ( Aux , 17 , 3 ) ) , 3 ) + #32#32 +
           Complete ( Filtro ( Copy ( Aux , 21 , 9 ) ) , 9 ) + #32#32 ) ;
 }
      End ;
   End ;
Until ( Lidos <> 36 ) OR ( Soma = 0 ) ;
Lista.Sort ;
RE.Lines.AddStrings ( Lista ) ;
CloseFile ( Arquivo ) ;
Lista.Clear ;
_Debug ( 'FIM CONVERTE_USUARIOS' ) ;
End ;

Function Filtro_NW ( Str : String ) : String ;
Var Local2 : LongInt ;
    CANCELE : Boolean ;
Begin
_Debug ( 'INI FILTRO_NW "' + Str + '"' ) ;
CANCELE := FALSE ;
For Local2 := 1 To Length ( Str ) Do Begin
   If Str [ Local2 ] = #0 Then Begin
      CANCELE := TRUE ;
   End ;
   If CANCELE Then Begin
      Str [ Local2 ] := #32 ;
   End ;
End ;
Result := Trim ( Str ) ;
_Debug ( 'FIM FILTRO_NW' ) ;
End ;

Function GET_COMANDO_DIRETO ( Dados : String ) : String ;
Begin
If Length ( Dados ) >= 20 Then Begin
   Result := Trim ( Copy ( Dados , 9 , 20 ) )
End Else Begin
   Result := '' ;
End ;
End ;

Function MSEG ( Tick : Comp ) : Comp ;
Begin
Result := GetTickCount - Tick ;
End ;

Function IF_TIMEOUT ( Ticks , Max : Comp ) : Boolean ;
Begin
Result := MSEG ( Ticks ) > Max ;
End ;

(*
Procedure CRIA_LOG ( FileName : String ) ;
Var LogFile : TextFile ;
Begin
_Debug ( 'INI CRIA_LOG "' + FileName + '"' ) ;
Assign ( LogFile , FileName ) ;
{$i-}
Reset ( LogFile ) ;
If IoResult <> 0 Then
   Begin
   ReWrite ( LogFile ) ;
   If IoResult <> 0 Then
      Begin
      {$i+}
      Exit ;
      End ;
   End ;
CloseFile ( LogFile ) ;
If IoResult <> 0 Then ;
{$i+}
_Debug ( 'FIM CRIA_LOG' ) ;
End ;
*)

Function FILTRAR_TEXTO_PARA_TELETIPO ( Form : TForm ;
                                       _FileName : String ;
                                       Flag_Insere_Espacos : Boolean ;
                                       Qtde_Espacos : LongInt ;
                                       Modo_Zews : Boolean ) : String ;
Var Aux         : String ;
    Espacos     : String ;
    Linha       : String ;
    Local       : LongInt ;
    Linha_Vazia : Boolean ;
    RE_Preview2 : TRichEdit ;
    Aux_Int     : LongInt ;
    Original    : String ;
    Qtde        : LongInt ;
Begin
_FileName := Trim ( _FileName ) ;
_Debug ( 'INI FILTRAR_TEXTO_PARA_TELETIPO [' + _FileName + ']' ) ;
Result := '' ;
If NOT Modo_Zews Then Begin
   If NOT RR_FileExists ( 'FILTRAR_TEXTO_PARA_TELETIPO/1',_FileName ) Then Begin
      _Debug ( 'Exit FILTRAR_TEXTO_PARA_TELETIPO [' + _FileName + ']' ) ;
      Exit ;
   End ;
End ;
_Debug ( '1 FILTRAR_TEXTO_PARA_TELETIPO' ) ;
RE_Preview2 := TRichEdit.Create ( Form ) ;
RE_Preview2.Parent := Form ;
RE_Preview2.Visible := FALSE ;
RE_Preview2.Width := 5000 ;
RE_Preview2.Font.Name := 'Arial' ;
RE_Preview2.Font.Size := 10 ;
_Debug ( '4 FILTRAR_TEXTO_PARA_TELETIPO' ) ;
If NOT Modo_Zews Then Begin
   RE_Preview2.Lines.Text := GET_CONTEUDO_M ( 'FILTRAR_TEXTO_PARA_TELETIPO', _FileName ) ;
End Else Begin
   RE_Preview2.Lines.Text := _FileName ;
End ;
Original := RE_Preview2.Lines.Text ;
_Debug ( '8 FILTRAR_TEXTO_PARA_TELETIPO' ) ;
Texto_Enviado := RE_Preview2.Text ;
Linha_Vazia := TRUE ;
_Debug ( '9 FILTRAR_TEXTO_PARA_TELETIPO' ) ;
Aux_Int := RE_Preview2.Lines.Count ;
_Debug ( '9a FILTRAR_TEXTO_PARA_TELETIPO [' + IntToStr ( Aux_Int ) + ']' ) ;
Aux := '' ;
Qtde := RE_Preview2.Lines.Count ;
If Qtde > 0 Then Begin
   _Debug ( '10 FILTRAR_TEXTO_PARA_TELETIPO' ) ;
   For Local := 0 To Qtde - 1 Do Begin
       Linha := Trim ( RE_Preview2.Lines[Local] ) ;
       If Linha = '' Then
          Linha := #32#32#32 ;
       If Copy(Linha,1,9)= '#RETRANCA' Then
          Delete ( Linha , 5 , 5 ) ;
       If Copy(Linha,1,7)= '#ÂNCORA' Then
          Delete ( Linha , 5 , 3 ) ;
       If Length ( Linha ) >  0 Then
          If ( Copy(Linha,1,1) <> '#' ) OR
{             ( Copy(Linha,1,4) = '#RET' ) OR}
             ( Copy(Linha,1,6) = '#DEIXA' ) OR
             ( Copy(Linha,1,5) = '#HORA' ) OR
             ( Copy(Linha,1,8) = '#RELOGIO' ) OR
             ( Copy(Linha,1,2) = '#=' ) OR
             ( Copy(Linha,1,2) = '##' ) OR
             ( Copy(Linha,1,3) = '#H=' ) OR
             ( Copy(Linha,1,3) = '#R=' ) OR
             ( Copy(Linha,1,4) = '#ÂNC' ) OR
             ( Copy(Linha,1,4) = '#ANC' ) OR
             ( Copy(Linha,1,3) = '#C=' ) OR
             ( Copy(Linha,1,5) = '#CAM=' ) OR
             ( Copy(Linha,1,8) = '#CAMERA=' ) OR
             ( Copy(Linha,1,8) = '#CAMARA=' ) OR
             ( Copy(Linha,1,8) = '#INÍCIO=' ) OR
             ( Copy(Linha,1,8) = '#INICIO=' ) OR
             ( Copy(Linha,1,10) = '#COMERCIAL' ) OR
             ( Copy(Linha,1,11)= '#MICROONDAS' ) OR
             ( Copy(Linha,1,8) = '#RODA VT' ) Then Begin
             If ( ( Trim ( Linha ) = '' ) AND ( NOT Linha_Vazia ) ) OR
                ( Trim ( Linha ) <> '' ) Then Begin
                Aux := Aux + Linha + LF ;
             End ;
             Linha_Vazia := Trim ( Linha ) = '' ;
             If Copy(Linha,1,4) = '#RET' Then Begin
                Aux := Aux + '-----------------------------' + LF ;
                Linha_Vazia := TRUE ;
             End ;
          End ;
       End ;
   _Debug ( '11 FILTRAR_TEXTO_PARA_TELETIPO' ) ;
   End ;
_Debug ( '12 FILTRAR_TEXTO_PARA_TELETIPO' ) ;
If ( Flag_Insere_Espacos ) AND
   ( Trim ( Aux ) <> '' ) AND
   ( Qtde_Espacos > 0 ) Then Begin
   _Debug ( '13 FILTRAR_TEXTO_PARA_TELETIPO' ) ;
   Espacos := '' ;
   _Debug ( '14 FILTRAR_TEXTO_PARA_TELETIPO' ) ;
   For Local := 1 To Qtde_Espacos Do Begin
       Espacos := Espacos + #32 ;
   End ;
   _Debug ( '15 FILTRAR_TEXTO_PARA_TELETIPO' ) ;
   Local := 0 ;
   //ShowMessage ( Aux ) ;
   If Length ( Aux ) > 2 Then Begin
      Repeat
         Inc ( Local ) ;
         If ( Aux [ Local ] = #32 ) AND
            ( Aux [ Local + 1 ] <> #32 ) Then Begin
            Aux := Copy ( Aux , 1 , Local ) + Espacos +
                   Copy ( Aux , Local + 1 , Length ( Aux ) ) ;
            Inc ( Local , Qtde_Espacos ) ;
         End ;
      Until Local >= ( Length ( Aux ) - 1 ) ;
   End ;
End ;
_Debug ( '16 FILTRAR_TEXTO_PARA_TELETIPO' ) ;
RE_Preview2.Free ;
_Debug ( '17 FILTRAR_TEXTO_PARA_TELETIPO' ) ;
//ShowMessage ( '2:' + Aux ) ;
Result := Aux ;
//ShowMessage ( Diretorio + 'logs\filtro_de_retrancas\original.dat' ) ;
WRITE_FILE_CORE ( 'FILTRAR_TEXTO_PARA_TELETIPO/1',
                  Diretorio + 'logs\filtro_de_retrancas\original.dat' , Original, DELAYED_TRUE ) ;
WRITE_FILE_CORE ( 'FILTRAR_TEXTO_PARA_TELETIPO/2',
                  Diretorio + 'logs\filtro_de_retrancas\filtrado.dat' , Aux, DELAYED_TRUE ) ;
_Debug ( 'FIM FILTRAR_TEXTO_PARA_TELETIPO' ) ;

End ;

Function SegundosToMMMSS ( Aux : LongInt ; Casas : Byte ) : String ;
Begin
If Aux < 0 Then Begin
   Result := '0' ;
   Exit ;
End ;
If Aux >= (999*60) Then Begin
   Result := '999-99' ;
   Exit ;
End ;
Result := StrZero ( Aux DIV 60 , IIFN ( ( Aux DIV 60 ) > 99 , 3 , 2 ) ) + ':' +
          StrZero ( Aux MOD 60 , 2 ) ;
If ( Casas = 1 ) AND ( Aux = 0 ) Then Begin
   Result := '-' ;
End ;
End ;

Function DATA_INVERSA_NW ( DataHora : TDateTime ) : String ;
Begin
Result := Copy ( DateToStr ( DataHora ) , 9 , 2 ) +
          Copy ( DateToStr ( DataHora ) , 4 , 2 ) +
          Copy ( DateToStr ( DataHora ) , 1 , 2 ) ;
End ;

Function Ping ( Host: String ; TimeOut : LongInt ; Var Tempo : LongInt ;
                Var Bytes_RX : LongInt ; Var Erro : String ) : Boolean ;
Var IdICMPClient: TIdICMPClient ;
Begin
Erro := '' ;
Try
   IdICMPClient := TIdICMPClient.Create( Nil ) ;
   IdICMPClient.Host := Host ;
   IdICMPClient.PacketSize := 128 ;
   IdICMPClient.ReceiveTimeout := TimeOut ;
   IdICMPClient.Ping ;
   Tempo := IdICMPClient.ReplyStatus.MsRoundTripTime ;
   If Tempo = 0 Then Begin
      Tempo := 1 ;
   End ;
   Bytes_RX := IdICMPClient.ReplyStatus.BytesReceived ;
   Result := Bytes_RX > 0 ;
   IdICMPClient.Free ;
Except
   On E : Exception Do Begin
      Erro := 'Exception/1 [' + E.Message + ']' ;
      Result := FALSE ;
   End ;
End ;
{
Try
   If Assigned ( IdICMPClient ) Then
      IdICMPClient.Free ;
   Except
   On E : Exception Do
      Begin
      Erro := 'Exception/2 [' + E.Message + ']' ;
      End ;
   End ;
}
End ;

Function GET_KEY_REGISTRY ( Grupo, Chave : String ) : String ;
//Const C_KEY='Software\MyCompanyName\MyName\';
Var RegistryEntry  : TRegistry ;
//    RegistryString : String ;
Begin
RegistryEntry := TRegistry.Create(KEY_READ or KEY_WOW64_64KEY) ;
Try
   RegistryEntry.RootKey := HKEY_LOCAL_MACHINE ;
   If NOT RegistryEntry.KeyExists(Grupo) Then Begin
      {
      RegistryEntry.Access := KEY_WRITE or KEY_WOW64_64KEY ;
      If RegistryEntry.OpenKey(C_KEY, TRUE) Then
         RegistryEntry.WriteString('', 'MyFirstProject') ;
      }
      Result := '?' ;
   End Else Begin
      RegistryEntry.Access := KEY_READ or KEY_WOW64_64KEY ;
      If RegistryEntry.OpenKey(Grupo, FALSE) Then Begin
         Result := RegistryEntry.ReadString(Chave) ;
         //RegistryEntry.CreateKey('Ultimo_Acesso_App') ;
         //RegistryEntry.CreateKey('Ultimo_Acesso_DH') ;
         //   RegistryEntry.WriteString('Ultimo_Acesso_App', Application.ExeName ) ;
         //   RegistryEntry.WriteString('Ultimo_Acesso_DH', DateTimeToStr(Now) ) ;
         RegistryEntry.CloseKey() ;
      End ;
      {
      Try
         RegistryEntry.Access := KEY_READ or KEY_WOW64_64KEY ;
         If RegistryEntry.OpenKey(Grupo, TRUE) Then
            Begin
            RegistryEntry.WriteString('Ultimo_Acesso_App', Application.ExeName ) ;
            RegistryEntry.WriteString('Ultimo_Acesso_DH', DateTimeToStr(Now) ) ;
            End ;
         RegistryEntry.CloseKey() ;
         Except
         End ;
      }
   End ;
Finally
   RegistryEntry.Free ;
End ;
End ;

Function GET_VLC_EXE : String ;
Begin
{
Computador\HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\VideoLAN\VLC
[InstallDir]
C:\Program Files (x86)\VideoLAN\VLC
[(Padrão)]
C:\Program Files (x86)\VideoLAN\VLC\vlc.exe
[Version]
2.2.4
[Language]
1046
}
Result := GET_KEY_REGISTRY ( 'SOFTWARE\WOW6432Node\VideoLAN\VLC' , '' ) ;
If Result = '?' Then Begin
   Result := GET_KEY_REGISTRY ( 'SOFTWARE\VideoLAN\VLC' , '' ) ;
End ;
End ;

Function GET_DIR_PROGRAM_FILE : String ;
Begin
Result := GetEnvironmentVariable('ProgramFiles');
End ; // ProgramFiles(x86)

Function GET_DIR_PROGRAM_FILE_X86 : String ;
Begin
Result := GetEnvironmentVariable('ProgramFiles(x86)');
End ; // ProgramFiles(x86)

Function CONVERTER_BARRA ( Str : String ) : String ;
Begin
Result := StringReplace ( Str, '\', '/', [rfReplaceAll] ) ;
End ;

Function _FileSize ( FN : wideString ; Var DT : TDateTime ) : Int64 ;
Var sr : TSearchRec ;
Begin
If RR_FindFirst ( '_FileSize', FN, faAnyFile, sr ) = 0 Then Begin
   DT := sr.TimeStamp ;
   Result := sr.Size ;
End Else Begin
   DT := 0 ;
   Result := -1 ;
End ;
SysUtils.FindClose(sr) ;
End ;

Function GET_EXTENSAO_FN ( FN : String ) : String ;
Begin
Result := UpperCase ( ExtractFileExt ( FN ) ) ;
If Length ( Result ) <> 4 Then Begin
   Exit ;
End ;
While Pos ( '.', Result ) > 0 Do Begin
   Delete ( Result, 1, 1 ) ;
End ;
End ;

Procedure QuickSort_Int (var A: Array Of Integer; iLo, iHi: Integer) ;
Var Lo, Hi, Pivot, T: Integer;
Begin
Lo := iLo ;
Hi := iHi ;
Pivot := A[(Lo + Hi) DIV 2] ;
Repeat
   While A[Lo] < Pivot Do Begin
      Inc(Lo) ;
   End ;
   While A[Hi] > Pivot Do Begin
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
   QuickSort_Int (A, iLo, Hi) ;
End ;
If Lo < iHi Then Begin
   QuickSort_Int (A, Lo, iHi) ;
End ;
End ;

Procedure QuickSort_FN_CHAVE (Var A: Array Of T_FN; iLo, iHi: Integer) ;
Var Lo, Hi : Integer ;
    Pivot  : T_FN ;
    T      : T_FN ;
Begin
Lo := iLo ;
Hi := iHi ;
Pivot := A[(Lo + Hi) DIV 2] ;
Repeat
   While A[Lo].Chave_Str < Pivot.Chave_Str Do Begin
      Inc(Lo) ;
   End ;
   While A[Hi].Chave_Str > Pivot.Chave_Str Do Begin
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
   QuickSort_FN_CHAVE (A, iLo, Hi) ;
End ;
If Lo < iHi Then Begin
   QuickSort_FN_CHAVE (A, Lo, iHi) ;
End ;
End ;

Procedure QuickSort_TSearchRec (Var A: Array Of TSearchRec; iLo, iHi: Integer) ;
Var Lo, Hi : Integer ;
    Pivot  : TSearchRec ;
    T      : TSearchRec ;
Begin
Lo := iLo ;
Hi := iHi ;
Pivot := A[(Lo + Hi) DIV 2] ;
Repeat
   While A[Lo].Name < Pivot.Name Do Begin
      Inc(Lo) ;
   End ;
   While A[Hi].Name > Pivot.Name Do Begin
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
   QuickSort_TSearchRec (A, iLo, Hi) ;
End ;
If Lo < iHi Then Begin
   QuickSort_TSearchRec (A, Lo, iHi) ;
End ;
End ;


Procedure QuickSort_FN_DT (Var A: Array Of T_FN; iLo, iHi: Integer) ;
Var Lo, Hi : Integer ;
    Pivot  : T_FN ;
    T      : T_FN ;
Begin
Lo := iLo ;
Hi := iHi ;
Pivot := A[(Lo + Hi) DIV 2] ;
Repeat
   While A[Lo].Chave_DT < Pivot.Chave_DT Do Begin
      Inc(Lo) ;
   End ;
   While A[Hi].Chave_DT > Pivot.Chave_DT Do Begin
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
   QuickSort_FN_CHAVE (A, iLo, Hi) ;
End ;
If Lo < iHi Then Begin
   QuickSort_FN_CHAVE (A, Lo, iHi) ;
End ;
End ;

{
Procedure INVERTER_ARRAY_FN ( FN : Array Of T_FN ) ;
Var FN2   : Array Of T_FN ;
    Qtde  : LongInt ;
    Local : LongInt ;
Begin
Qtde := Length ( FN ) ;
If Qtde = 0 Then
   Exit ;
SetLength ( FN2 , Qtde ) ;
FN2 := FN ;
For Local := Qtde - 1 DownTo 0 Do
   Begin
   FN2[Local] := FN[Qtde-Local] ;
   End ;
End ;
}

procedure Swap (var Value1, Value2: T_FN);
var Temp: T_FN;
begin
  Temp := Value1;
  Value1 := Value2;
  Value2 := Temp;
end;

Procedure Reverse_T_FN ( Var Value: Array of T_FN ) ;
Var i    : Integer ;
    Temp : T_FN ;
Begin
if Length(Value) > 0 Then Begin
   For i := Low(Value) To High(Value) DIV 2 Do Begin
      //Swap<T_FN>(Value[i], Value[High(Value) - i]);
      Temp := Value[i];
      Value[i] := Value[High(Value) - i];
      Value[High(Value) - i] := Temp;
   End ;
End ;
End ;

Function CURSOR_XY_FORM ( _Form : TForm ) : TPoint ;
Begin
GetCursorPos ( Result ) ;
Result.X := Result.X - _Form.Left ;
Result.Y := Result.Y - _Form.Top ;
End ;

Function GET_CB ( CB : TComboBox ) : String ;
Begin
Result := '' ;
If CB = Nil Then Begin
   Exit ;
End ;
If CB.ItemIndex = -1 Then Begin
   Exit ;
End ;
Result := Trim ( CB.Items[CB.ItemIndex] ) ;
End ;

Function GET_HHMM ( DT : TDateTime ) : String ;
Begin
Result := TimeToStr ( DT ) ;
Result := Copy ( Result, 1, 2 ) + Copy ( Result, 4, 2 ) ;
End ;

Procedure SALVAR_SG ( SG : TStringGrid ; FN : String ;
                      Lin_Ini, Col_Ini : LongInt ) ;
Var //Local  : LongInt ;
    Linha  ,
    Coluna : LongInt ;
    Ini    : TMemIniFile ;
Begin
If SG = Nil Then Begin
   Exit ;
End ;
PUT_LOG ( 'SALVAR_SG [' + FN + ']' ) ;
CHECAR_DIRETORIO_FILENAME ( FN ) ;
Ini := TMemIniFile.Create ( FN ) ;
For Linha := Lin_Ini To SG.RowCount - 1 Do Begin
   For Coluna := Col_Ini To SG.ColCount - 1 Do Begin
      //SG.Rows[Linha].Assign(SG.Rows[Linha + 1]);
      Ini.WriteString ( 'GRID' ,
                        'LC_' + StrZero ( Linha, 3 ) + '_' + StrZero(Coluna,4) ,
                        SG.Cells[Coluna, Linha] ) ;
   End ;
End ;
Ini.UpdateFile ;
Ini.Free ;
End ;

Procedure CARREGAR_SG ( SG : TStringGrid ; FN : String ;
                        Lin_Ini, Col_Ini : LongInt ) ;
Var //Local  : LongInt ;
    Linha  ,
    Coluna : LongInt ;
    Ini    : TMemIniFile ;
Begin
If SG = Nil Then Begin
   PUT_LOG ( 'CARREGAR_SG SG=Nil [' + FN + ']' ) ;
   Exit ;
End ;
//PUT_LOG ( 'CARREGAR_SG SG=[' + SG.Name + '][' + FN + ']' ) ;
CHECAR_DIRETORIO_FILENAME ( FN ) ;
Ini := TMemIniFile.Create ( FN ) ;
For Linha := Lin_Ini To SG.RowCount - 1 Do Begin
   For Coluna := Col_Ini To SG.ColCount - 1 Do Begin
      //SG.Rows[Local].Assign(SG.Rows[Local + 1]);
      SG.Cells[Coluna, Linha] := Ini.ReadString ( 'GRID' ,
                                 'LC_' + StrZero ( Linha, 3 ) + '_' + StrZero(Coluna,4) ,
                                 '' ) ;
   End ;
End ;
Ini.UpdateFile ;
Ini.Free ;
End ;

Procedure LIMPAR_SG ( SG : TStringGrid ; Lin_Ini, Col_Ini : LongInt ) ;
Var Linha  ,
    Coluna : LongInt ;
Begin
If SG = Nil Then Begin
   Exit ;
End ;
For Linha := Lin_Ini To SG.RowCount - 1 Do Begin
   For Coluna := Col_Ini To SG.ColCount - 1 Do Begin
      SG.Cells[Coluna, Linha] := '' ;
   End ;
End ;
End ;

Function GET_SOMENTE_JOGADOR ( Str : String ) : String ;
Begin
Result := Trim ( Str ) ;
If Result = '' Then Begin
   Exit ;
End ;
If IS_DIGIT ( Result[1] ) Then Begin
   Delete ( Result, 1, Pos ( #32, Result ) ) ;
End ;
End ;

Procedure EXTRAIR_JOGADOR_NOME_CAMISA ( Full : String ; Var Nome : String ;
                                        Var Camisa : LongInt ) ;
Begin
Full := Trim ( Full ) ;
If Full = '' Then Begin
   Exit ;
End ;
If IS_DIGIT ( Full[1] ) Then Begin
   Camisa := StrToIntDef ( Copy ( Full, 1, Pos ( #32, Full ) - 1 ), 0 ) ;
   Delete ( Full, 1, Pos ( #32, Full ) ) ;
   Nome := Full ;
End Else Begin
   Camisa := 0 ;
   Nome := Full ;
End ;
End ;

Function REMOVER_ZERO_INICIAL_JOGADOR ( Temp : String ) : String ;
Begin
Result := Trim ( Temp ) ;
If Result = '' Then Begin
   Exit ;
End ;
If Result[1] = '0' Then Begin
   Delete ( Result, 1, 1 ) ;
End ;
End ;

Function FN_MODO_CHYRON ( FN : String ) : String ;
Begin
Result := '[' + StringReplace ( FN, '\', '/', [rfReplaceAll] ) + ']' ;
End ;

Procedure POSICIONAR_JANELA_PELO_FORM ( _Log, _Main : TForm ) ;
Begin
If ( _Main.Left + _Main.Width ) < Screen.Width Then Begin
   _Log.Left := _Main.Left + _Main.Width ;
   _Log.Top := _Main.Top ;
End Else Begin
   _Log.Left := _Main.Left - _Log.Width - 2 ;
   _Log.Top := _Main.Top ;
End ;
End ;

(*
Procedure DoLoad ( Image : TImage; Const FileName: String ) ;
Var //Start        : DWORD ;
    GraphicClass : TGraphicExGraphicClass ;
    Graphic      : TGraphic ;
Begin
Screen.Cursor := crHourGlass ;
//PUT_LOG ( 'DoLoad ' + FileName ) ;
Try
  Try
    GraphicClass := FileFormatList.GraphicFromContent(FileName) ;
    If GraphicClass = Nil Then Begin
       //Image.Picture.LoadFromFile(FileName) ;
       GET_PICTURE ( 'Misc DoLoad', Image, Image.Picture, FileName ) ;
    End Else Begin
       Graphic := GraphicClass.Create ;
       Graphic.LoadFromFile(FileName) ;
       Image.Picture.Graphic := Graphic ;
    End ;
  Except
    On E : Exception Do Begin
       PUT_LOG ( 'Exception DoLoad ' + FileName + ' [' + E.Message + ']' ) ;
       Raise;
    End ;
  End ;
Finally
  Screen.Cursor := crDefault ;
End ;
End ;
*)

Function LIMPAR_NOME_JOGADOR_COM_BARRA ( Str : String ) : String ;
Begin
While Pos ( '/', Str ) >  0 Do Begin
  Delete ( Str, Length(Str), 1 ) ;
End ;
Result := Trim ( Str ) ;
End ;

Procedure SG_TROCAR_LINHA ( SG : TStringGrid ; Row1, Row2 : LongInt ; Col_Inicial : LongInt  ) ;
Var Coluna : LongInt ;
    Aux    : String ;
Begin
If SG = Nil Then Begin
   Exit ;
End ;
If Col_Inicial > ( SG.ColCount - 1 ) Then Begin
   Exit ;
End ;
For Coluna := Col_Inicial To SG.ColCount - 1 Do Begin
   Aux := SG.Cells[Coluna,Row1] ;
   SG.Cells[Coluna,Row1] := SG.Cells[Coluna,Row2] ;
   SG.Cells[Coluna,Row2] := Aux ;
End ;
DEF_SG_ROW ( 'SG_TROCAR_LINHA', SG, Row2 ) ;
End ;

Procedure ABRIR_PASTA_EXPLORER ( Dir : String ) ;
Begin
ShellExecute ( Application.Handle, 'open', 'explorer.exe',
               PChar('/select,"' + Dir + '"'), nil, SW_NORMAL);
End ;

Function REMOVE_PONTOS ( Str : String ) : String ;
Begin
Result := Str ;
If Result = '' Then Begin
   Exit ;
End ;
While Result[1] = '.' Do Begin
   Delete ( Result, 1, 1 ) ;
   If Result = '' Then Begin
      Break ;
   End ;
End ;
If Result <> '' Then Begin
   While Result[Length(Result)] = '.' Do Begin
      Delete ( Result, Length(Result), 1 ) ;
      If Result = '' Then Begin
         Break ;
      End ;
   End ;
End ;
End ;

Function CONVERSAO_HHMMSS_SS_TO_MS ( Aux : String ; Var Retorno : String ) : LongInt ;
Var Hora    ,
    Minuto  : LongInt ;
    Segundo : Double ;
Begin
// 01:02:03.84
Retorno := 'A' ;
Result := 0 ;
If Length ( Aux ) <> 11 Then Begin
   Exit ;
End ;
Hora := StrToIntDef ( Copy ( Aux, 1, 2 ), -1 ) ;
Minuto := StrToIntDef ( Copy ( Aux, 4, 2 ), -1 ) ;
Segundo := StrToFloat_RR ( Copy ( Aux, 7, 5 ), -1 ) ;
Retorno := 'B' ;
If ( Hora < 0 ) OR ( Minuto < 0 ) OR ( Segundo < 0 ) Then Begin
   Exit ;
End ;
Hora := Hora * 3600 ;
Minuto := Minuto * 60 ;
Result := TRUNC ( ( Hora + Minuto + Segundo ) * 1000 ) ;
Retorno := '{' + Aux + '} ' + IntToStr ( Hora ) + '/' + IntToStr ( Minuto ) + '/' + CASA6_PONTO(Segundo) ;
End ;

Procedure SetDateTime(Year, Month, Day, Hour, Minu, Sec, MSec: Word);
var NewDateTime: TSystemTime;
begin
FillChar(NewDateTime, SizeOf(NewDateTime), #0);
NewDateTime.wYear := Year;
NewDateTime.wMonth := Month;
NewDateTime.wDay := Day;
NewDateTime.wHour := Hour;
NewDateTime.wMinute := Minu;
NewDateTime.wSecond := Sec;
NewDateTime.wMilliseconds := MSec;
SetLocalTime(NewDateTime);
End ;

Procedure SetDateTime_DT(DT: TDateTime);
var NewDateTime: TSystemTime;
begin
FillChar(NewDateTime, SizeOf(NewDateTime), #0);
NewDateTime.wYear := YearOf(DT);
NewDateTime.wMonth := MonthOf(DT);
NewDateTime.wDay := DayOf(dT);
NewDateTime.wHour := HourOf(DT);
NewDateTime.wMinute := MinuteOf(DT);
NewDateTime.wSecond := SecondOf(DT);
NewDateTime.wMilliseconds := 0 ;
SetLocalTime(NewDateTime);
End ;

Function RETIRAR_NUMERAIS_INICIAIS ( Str : String ) : String ;
Begin
Result := Str ;
If Result = '' Then Begin
   Exit ;
End ;
If StrToIntDef ( Result, 0 ) > 0 Then Begin
   Exit ;
End ;
While IS_DIGIT ( Result[1] ) Do Begin
   Delete ( Result, 1, 1 ) ;
   If Result = '' Then Begin
      Break ;
   End ;
End ;
End ;

Procedure REFRESH_ARQUIVO ( FN : String ) ;
//Var Temp  : String ;
//    Passo : LongInt ;
Begin
Exit ;
{
Passo := 0 ;
Try
   Passo := 1 ;
   Temp := INSERE_BARRA ( ExtractFilePath ( FN ) ) + 'Temp\' + ExtractFileName ( FN ) + '.Temp' ;
   Passo := 2 ;
   CHECAR_DIRETORIO_FILENAME ( Temp ) ;
   Passo := 3 ;
   If CopiaArquivo ( FN, Temp, SOBREPOE ) Then Begin
      Passo := 4 ;
      If RR_DeleteFile ( 'REFRESH ARQUIVO', FN ) Then ;
      Passo := 5 ;
      If CopiaArquivo ( Temp, FN, SOBREPOE ) Then
      Passo := 6 ;
   End ;
   Passo := 7 ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception REFRESH_ARQUIVO Passo ' + IntToStr(Passo) + LFLF +
                E.Message ) ;
   End ;
End ;
}
End ;

Function GET_LAST_DIR ( Dir : String ) : String ;
Var Lista : TStringList ;
    Qtde  : LongInt ;
Begin
Lista := EXPLODE_SIMPLES ( Dir, '\' ) ;
Qtde := Lista.Count ;
If Qtde = 0 Then Begin
   Result := '' ;
   Exit ;
End ;
Result := Lista[Qtde-1] ;
End ;

Procedure CENTRALIZAR_FORM_PN ( Formulario : TForm ; PN : TPanel) ;
Begin
PN.Left := ( Formulario.Width  - PN.Width  ) DIV 2 ;
PN.Top  := ( Formulario.Height - PN.Height ) DIV 2 ;
End ;

Procedure CENTRALIZAR_FORM ( Formulario : TForm ) ;
Begin
Formulario.Left := ( Screen.Width  - Formulario.Width  ) DIV 2 ;
Formulario.Top  := ( Screen.Height - Formulario.Height ) DIV 2 ;
End ;

Procedure CENTRALIZAR_FORM_ALTURA ( Formulario : TForm ) ;
Begin
Formulario.Top  := ( Screen.Height - Formulario.Height ) DIV 2 ;
End ;

Function SALVAR_LISTA_GERAL ( _FileName : String ) : Boolean ;
Begin
Result := FALSE ;
Try
   CHECAR_DIRETORIO_FILENAME ( _FileName ) ;
   SL_Lista_Geral.SaveToFile ( _FileName );
   Result := TRUE ;
Except
End ;
End ;

Function CARREGAR_LISTA_GERAL ( Origem, FN : String ) : Boolean ;
Begin
Result := FALSE ;
SL_Lista_Geral.Clear ;
If RR_FileExists ( 'CARREGAR LISTA_GERAL', FN ) Then Begin
   SL_Lista_Geral.Text := GET_CONTEUDO_M ( 'CARREGAR LISTA_GERAL', FN ) ;
End ;
End ;

(*
Function APPEND_LISTA_GERAL ( Origem, FN : String ; _Str : String ) : Boolean ;
Begin
If CARREGAR_LISTA_GERAL ( 'APPEND_LISTA_GERAL/' + Origem, FN ) Then ;
Lista_Geral.Add ( _Str ) ;
Result := SALVAR_LISTA_GERAL ( FN ) ;
End ;
*)

Procedure EXEC_Msg ( Str : String ) ;
Begin
ShowMessage ( Str ) ;
End ;

Procedure ORDENAR_SG_WIN_NW ( SG : TStringGrid ;
                              Coluna_Chave : LongInt ;
                              _Data : Boolean ;
                              Largura , Linha_Inicial , Coluna_Inicial : LongInt ;
                              Ordem_Crescente : Boolean ;
                              _Parent : TWinControl ;
                              _Inteiro : Boolean ;
                              _Real    : Boolean ;
                              _DT : Boolean ;
                              _Coluna_Hora : LongInt ) ;
Var _SG2     : TStringGrid ;
    Lista    : TStringList ;
    Aux      ,
    Linha    ,
    Coluna   : LongInt ;
    _Str     ,
    Data     : String ;
    Tick     : Cardinal ;
    _Hora    : TDateTime ;
    Qtde     : LongInt ;
Begin
_Debug ( 'INI ORDENAR_SG_WIN_NW' ) ;
If ( SG.RowCount = 0 ) OR ( SG.ColCount = 0 ) Then Begin
   _Debug ( 'Exit 1 ORDENAR_SG_WIN_NW' ) ;
   Exit ;
End ;
_SG2 := TStringGrid.Create ( Nil ) ;
_SG2.Visible := FALSE ;
_SG2.Parent := _Parent ;
_SG2.RowCount := SG.RowCount ;
_SG2.ColCount := SG.ColCount ;
Lista := TStringList.Create ;
Lista.Clear ;
SG.Update ;
Tick := GetTickCount ;
For Linha := Linha_Inicial To SG.RowCount - 1 Do Begin
   For Coluna := Coluna_Inicial To SG.ColCount - 1 Do Begin
      _SG2.Cells [ Coluna , Linha ] := SG.Cells [ Coluna , Linha ] ;
   End ;
End ;
For Linha := Linha_Inicial To SG.RowCount - 1 Do Begin
   If GetTickCount - Tick > 100 Then Begin
      Application.ProcessMessages ;
      Tick := GetTickCount ;
   End ;
   If _DT Then Begin
      Try
         Data := SG.Cells[Coluna_Chave,Linha] ;
         If _Coluna_Hora >= 0 Then Begin
            Try
               _Hora := StrToTime ( SG.Cells[_Coluna_Hora,Linha] )
            Except
               _Hora := 0 ;
            End
         End Else Begin
            _Hora := 0 ;
         End ;
         If ABS ( _Hora ) >= 1 Then Begin
            _Hora := 0 ;
         End ;
         Lista.Add ( COMPLETE ( DATAHORA_INVERSA ( StrToDateTime ( Data ) + _Hora ) , LARGURA ) +
                     StrZero ( Linha , 5 ) ) ;

      Except
         Lista.Add ( COMPLETE ( Data , LARGURA ) +
                     StrZero ( 50000 + Linha , 5 ) ) ;
      End
   End Else If _Data Then Begin
      Try
         Data := SG.Cells[Coluna_Chave,Linha] ;
         Lista.Add ( COMPLETE ( DATAHORA_INVERSA ( StrToDate ( Data ) ) , LARGURA ) +
                     StrZero ( Linha , 5 ) ) ;

      Except
         Lista.Add ( COMPLETE ( Data , LARGURA ) +
                     StrZero ( 50000 + Linha , 5 ) ) ;
      End ;
   End Else If _Real Then Begin
      Begin
      Try
         _Str := StrZero ( TRUNC ( StrToFloat ( SG.Cells[Coluna_Chave,Linha] ) * 1000 ) , LARGURA )
      Except
         _Str := StrZero ( 0 , LARGURA ) ;
      End ;
      Lista.Add ( _Str  + StrZero ( Linha , 5 ) )
      End
   End Else
      Lista.Add ( COMPLETE ( SG.Cells[Coluna_Chave,Linha] , LARGURA ) +
                  StrZero ( Linha , 5 ) ) ;
   End ;
Qtde := Lista.Count ;
If Qtde > 0 Then Begin
   Try
//      Lista.SaveToFile ( Dir_Temp + 'lista_nao_ordenada.txt' ) ;
   Except
   End ;
   Lista.Sort ;
   Try
//      Lista.SaveToFile ( Dir_Temp + 'lista_ordenada.txt' ) ;
   Except
   End ;
   If NOT Ordem_Crescente Then Begin
      INVERTE_STRINGS ( Lista ) ;
   End ;
   For Linha := 0 To Qtde - 1 Do Begin
      If GetTickCount - Tick > 100 Then Begin
         Application.ProcessMessages ;
         Tick := GetTickCount ;
      End ;
      Aux := StrToIntDef ( Copy ( Lista.Strings[Linha] , LARGURA + 1 , 5 ) , -1 ) ;
      If Aux > 50000 Then Begin
         Dec ( Aux , 50000 ) ;
      End ;
      If Aux >= 0 Then Begin
         For Coluna := COLUNA_INICIAL To SG.ColCount - 1 Do Begin
            If GetTickCount - Tick > 100 Then Begin
               Application.ProcessMessages ;
               Tick := GetTickCount ;
            End ;
            SG.Cells[Coluna,Linha_Inicial+Linha] := _SG2.Cells[Coluna,Aux] ;
         End ;
      End ;
   End ;
End ;
Lista.Free ;
_SG2.Free ;
_Debug ( 'FIM ORDENAR_SG_WIN_NW' ) ;
End ;

Procedure INVERTE_STRINGS ( LB : TStrings ) ;
Var _LB    : TStrings ;
    Local  : LongInt ;
    Qtde   : LongInt ;
Begin
_Debug ( 'INI INVERTE_STRINGS' ) ;
Qtde := LB.Count ;
If Qtde = 0 Then Begin
   _Debug ( 'Exit 1 INVERTE_STRINGS' ) ;
   Exit ;
End ;
_LB := TStringList.Create ;
_LB.Clear ;
For Local := Qtde - 1 DownTo 0 Do Begin
   _LB.Add ( LB.Strings[Local] ) ;
End ;
LB.Clear ;
Qtde := _LB.Count ;
For Local := 0 To Qtde - 1 Do Begin
    LB.Add ( _LB.Strings[Local] ) ;
End ;
_LB.Free ;
_Debug ( 'FIM INVERTE_STRINGS' ) ;
End ;

Function FileName_Valido ( FileName : String ) : LongInt ;
Var Local : LongInt ;
Const INVALIDOS : String = '=+*/?;:,.<>{}[]!@#$%¨&´''^~\|ñÑ' ;
Begin
Result := 0 ;
If Length ( FileName ) > 0 Then Begin
   For Local := 1 To Length ( FileName ) Do Begin
      If Pos ( FileName [ Local ] , Invalidos ) <> 0 Then Begin
         Result := Pos ( FileName [ Local ] , Invalidos ) ;
         Exit ;
      End ;
   End ;
End ;
End ;

Function GET_CODIGO_RANDOM : String ;
Begin
(*
9cfc387b-95ae-11e3-9e27-39ee979bdb57
*)
Result := StrZero ( Random ( 9999 ) , 4 ) + StrZero ( Random ( 9999 ) , 4 ) + '-' +
          StrZero ( Random ( 9999 ) , 4 ) + '-' +
          StrZero ( Random ( 9999 ) , 4 ) + '-' +
          StrZero ( Random ( 9999 ) , 4 ) + '-' +
          StrZero ( Random ( 999999 ) , 6 ) + StrZero ( Random ( 999999 ) , 6 ) ;
End ;

Procedure CENTRALIZAR_ACIMA ( Form : TForm ) ;
Begin
Form.Left := ( Screen.Width - Form.Width ) DIV 2 ;
Form.Top  := ( Screen.Height - Form.Height ) DIV 2 ;
If Form.Top < 50 Then Begin
   Form.Top := 0 ;
End ;
End ;

Procedure REMOVE_LINHA_SG ( SG : TStringGrid ; Linha : LongInt ) ;
Var Local   ,
    Local2  : Longint ;
Begin
If SG.RowCount > 2 Then Begin
   For Local := Linha To SG.RowCount - 2 Do Begin
      For Local2 := 0 To SG.ColCount - 1 Do Begin
        SG.Cells[Local2,Local] := SG.Cells[Local2,Local+1] ;
      End ;
   SG.RowCount := SG.RowCount - 1 ;
   End ;
End ;
End ;

Procedure INSERE_LINHA_SG ( SG : TStringGrid ; Linha : LongInt ) ;
Var Local   ,
    Local2  : Longint ;
Begin
SG.RowCount := SG.RowCount + 1 ;
If Linha <> SG.RowCount - 2 Then Begin
   For Local := SG.RowCount - 1 DownTo Linha + 1 Do Begin
       For Local2 := 0 To SG.ColCount - 1 Do Begin
           SG.Cells[Local2,Local] := SG.Cells[Local2,Local-1] ;
       End ;
   End ;
End ;
For Local2 := 0 To SG.ColCount - 1 Do Begin
    SG.Cells[Local2,Linha+1] := '' ;
End ;
End ;

Function RETORNA_CRC_STRING ( Aux : String ) : Comp ;
Var Local : LongInt ;
    CRC   : Comp ;
Begin
CRC := 0 ;
If Length ( Aux ) > 0 Then Begin
   For Local := 1 To Length ( Aux ) Do Begin
       CRC := CRC + Local * Ord ( Aux [ Local ] ) ;
   End ;
End ;
Result := CRC ;
End ;

Procedure CARREGA_LB_COM_DIRETORIO_NW ( LB : TListBox ; Dir : String ;
                                        Extensao : String ; Invertido : Boolean ) ;
Var RecDos    : TSearchRec ;
    Resultado : LongInt ;
    Lista     : TStringList ;
Begin
_Debug ( 'INI CARREGA LB_COM_DIRETORIO_NW "' + Dir + '"' ) ;
LB.Items.Clear ;
Dir := INSERE_BARRA ( Dir ) ;
Resultado := RR_FindFirst ( 'CARREGA_LB_COM_DIRETORIO_NW',
                            Dir + '*.' + Extensao , 255 , RecDos ) ;
Lista := TStringList.Create ;
Lista.Clear ;
//ShowMessage ( Dir + '*.' + Extensao ) ;
While Resultado = 0 Do Begin
   If RecDos.Name [ 1 ] <> '.' Then Begin
      Lista.Add ( Super_UpperCase ( ExtractFileNameSemExt ( RecDos.Name ) ) ) ;
   End ;
   Resultado := SysUtils.FindNext ( RecDos ) ;
End ;
Lista.Sort ;
If Invertido Then Begin
   INVERTE_STRINGLIST ( Lista ) ;
End ;
LB.Items.AddStrings ( Lista ) ;
Lista.Free ;
If LB.Items.Count > 0 Then Begin
   LB.ItemIndex := 0 ;
End ;
SysUtils.FindClose ( RecDos ) ;
_Debug ( 'FIM CARREGA_LB_COM_DIRETORIO_NW' ) ;
End ;

Function ExtractFileNameSemExt ( FN : String ) : String ;
//Var Aux : String ;
Begin
FN := Trim ( FN ) ;
Result := '' ;
If FN = '' Then Begin
   Exit ;
End ;
If Pos ( '\', FN ) > 0 Then Begin
   FN := ExtractFileName ( FN ) ;
End ;
//FN := ExtractFileName ( FN ) ;
Result := ExtractFileExt ( FN ) ;
//ShowMessage ( '[' + FN + ']' + sLineBreak +
//              '[' + Result + ']' ) ;
If Length ( Result ) > 0 Then Begin
   Result := Copy ( FN, 1, Length ( FN ) - Length ( Result ) ) ;
End Else Begin
   Result := FN ;
End ;
End ;

Function INVERTE_STRINGLIST ( LB : TStringList ) : TStringList ;
Var _LB    : TStringList ;
    Local  : LongInt ;
    Qtde   : LongInt ;
Begin
Qtde := LB.Count;
If Qtde = 0 Then Begin
   Result := LB ;
   Exit ;
End ;
_LB := TStringList.Create ;
For Local := Qtde - 1 DownTo 0 Do Begin
  _LB.Add ( LB.Strings[Local] ) ;
End ;
Result := _LB ;
_LB.Free ;
End ;

Function Space ( Inteiro : LongInt ) : String ;
Var Palavra : String ;
Begin
Palavra := '' ;
If Inteiro > 0 Then Begin
   While Length ( Palavra ) < Inteiro Do Palavra := Palavra + #32 ;
End ;
Result := Palavra ;
End ;

Procedure LIMPAR_MEMO ( MEMO : TMemo ) ;
Var Local : LongInt ;
    Qtde  : LongInt ;
Begin
Qtde := MEMO.Lines.Count ;
If Qtde = 0 Then Begin
   Exit ;
End ;
For Local := Qtde - 1 DownTo 0 Do Begin
   If Trim ( MEMO.Lines[Local] ) = '' Then Begin
      MEMO.Lines.Delete ( Local ) ;
   End ;
End ;
End ;

Function LIMPAR_TEXTO ( Aux : String ) : String ;
Begin
While Pos ( #13 , Aux ) > 0 Do Begin
   Aux [ Pos ( #13 , Aux ) ] := #32 ;
End ;
While Pos ( #10 , Aux ) > 0 Do Begin
   Aux [ Pos ( #10 , Aux ) ] := #32 ;
End ;
While Pos ( #32#32 , Aux ) > 0 Do Begin
   Delete ( Aux , Pos ( #32#32 , Aux ) , 1 ) ;
End ;
Result := Trim ( Aux ) ;
End ;

Procedure FORMATAR_TELEFONE ( Var Telefone : String ) ;
Begin
Telefone := SOMENTE_NUMERAIS ( Telefone ) ;
Case Length ( Telefone ) Of
   7 : Telefone := Copy ( Telefone , 1 , 3 ) + '-' + Copy ( Telefone , 4 , 4 ) ;
   8 : Telefone := Copy ( Telefone , 1 , 4 ) + '-' + Copy ( Telefone , 5 , 4 ) ;
   9 : Telefone := '(' + Copy ( Telefone , 1 , 2 ) + ')' +
                   Copy ( Telefone , 3 , 3 ) + '-' + Copy ( Telefone , 6 , 4 ) ;
   10 : Telefone := '(' + Copy ( Telefone , 1 , 2 ) + ')' +
                   Copy ( Telefone , 3 , 4 ) + '-' + Copy ( Telefone , 7 , 4 ) ;
   End ;
End ;

Procedure DECOMPOR_TELEFONE_2 ( Origem : String ;
                                Var Tel_1 : String ;
                                Var Tel_2 : String ) ;
Begin
If Length ( Origem ) = 20 Then Begin
   Tel_1 := Copy ( Origem , 1 , 10 ) ;
   Tel_2 := Copy ( Origem , 11 , 10 ) ;
End ;
If Length ( Origem ) = 18 Then Begin
   Tel_1 := Copy ( Origem , 1 , 9 ) ;
   Tel_2 := Copy ( Origem , 10 , 9 ) ;
End ;
If Length ( Origem ) = 16 Then Begin
   Tel_1 := Copy ( Origem , 1 , 8 ) ;
   Tel_2 := Copy ( Origem , 9 , 8 ) ;
End ;
If Length ( Origem ) = 14 Then Begin
   Tel_1 := Copy ( Origem , 1 , 7 ) ;
   Tel_2 := Copy ( Origem , 8 , 7 ) ;
End ;
End ;

Procedure DECOMPOR_TELEFONE_3 ( Origem : String ;
                                Var Tel_1 : String ;
                                Var Tel_2 : String ;
                                Var Tel_3 : String ) ;
Begin
If Length ( Origem ) = 30 Then Begin
   Tel_1 := Copy ( Origem , 1 , 10 ) ;
   Tel_2 := Copy ( Origem , 21 , 10 ) ;
   Tel_3 := Copy ( Origem , 11 , 10 ) ;
End ;
If Length ( Origem ) = 27 Then Begin
   Tel_1 := Copy ( Origem , 1 , 9 ) ;
   Tel_2 := Copy ( Origem , 19 , 9 ) ;
   Tel_3 := Copy ( Origem , 10 , 9 ) ;
End ;
If Length ( Origem ) = 24 Then Begin
   Tel_1 := Copy ( Origem , 1 , 8 ) ;
   Tel_2 := Copy ( Origem , 9 , 8 ) ;
   Tel_3 := Copy ( Origem , 17 , 8 ) ;
End ;
If Length ( Origem ) = 21 Then Begin
   Tel_1 := Copy ( Origem , 1 , 7 ) ;
   Tel_2 := Copy ( Origem , 8 , 7 ) ;
   Tel_3 := Copy ( Origem , 15 , 7 ) ;
End ;
DECOMPOR_TELEFONE_2 ( Origem , Tel_1 , Tel_2 ) ;
DECOMPOR_TELEFONE_2 ( Tel_2 , Tel_2 , Tel_3 ) ;
End ;

Procedure FORMATAR_TELEFONES ( Var c_DDD : LongInt ; Var c_tel_fixo_1 : String ;
                               Var c_tel_fixo_2 : String ; Var c_tel_fixo_3 : String ;
                               Var c_tel_cel_1 : String ; Var c_tel_cel_2 : String ;
                               Var c_tel_cel_3 : String ;
                               Var c_fax_1 : String ; Var c_fax_2 : String ) ;
Var Residuo_1 : String ;
    Residuo_2 : String ;
Begin
Residuo_1 := '' ;
Residuo_2 := '' ;
If ( Pos ( '/' , c_tel_fixo_1 ) > 0 ) AND
   ( Pos ( '/' , c_tel_fixo_1 ) < Length ( c_tel_fixo_1 ) ) Then Begin
   Residuo_1 := Copy ( c_tel_fixo_1 , Pos ( '/' , c_tel_fixo_1 ) + 1 , Length ( c_tel_fixo_1 ) ) ;
   Delete ( c_tel_fixo_1 , Pos ( '/' , c_tel_fixo_1 ) , length ( c_tel_fixo_1 ) ) ;
End ;
If ( Pos ( '/' , c_tel_fixo_2 ) > 0 ) AND
   ( Pos ( '/' , c_tel_fixo_2 ) < Length ( c_tel_fixo_2 ) ) Then Begin
   Residuo_2 := Copy ( c_tel_fixo_2 , Pos ( '/' , c_tel_fixo_2 ) + 1 , Length ( c_tel_fixo_2 ) ) ;
   Delete ( c_tel_fixo_2 , Pos ( '/' , c_tel_fixo_2 ) , length ( c_tel_fixo_2 ) ) ;
End ;
c_tel_fixo_1 := SOMENTE_NUMERAIS ( c_tel_fixo_1 ) ;
c_tel_fixo_2 := SOMENTE_NUMERAIS ( c_tel_fixo_2 ) ;
c_tel_fixo_3 := SOMENTE_NUMERAIS ( c_tel_fixo_3 ) ;
If c_tel_fixo_2 = '' Then Begin
   c_tel_fixo_2 := SOMENTE_NUMERAIS ( Residuo_1 ) ;
End ;
If c_tel_fixo_3 = '' Then Begin
   c_tel_fixo_3 := SOMENTE_NUMERAIS ( Residuo_2 ) ;
End ;
c_tel_cel_1 := SOMENTE_NUMERAIS ( c_tel_cel_1 ) ;
c_tel_cel_2 := SOMENTE_NUMERAIS ( c_tel_cel_2 ) ;
c_tel_cel_3 := SOMENTE_NUMERAIS ( c_tel_cel_3 ) ;
c_fax_1 := SOMENTE_NUMERAIS ( c_fax_1 ) ;
c_fax_2 := SOMENTE_NUMERAIS ( c_fax_2 ) ;

c_DDD := 0 ;
If ( Length ( c_tel_fixo_1 ) = 10 ) OR
   ( Length ( c_tel_fixo_1 ) = 9 ) Then Begin
   c_DDD := StrToIntDef ( Copy ( c_tel_fixo_1 , 1 , 2 ) , 0 ) ;
End ;
If ( Length ( c_fax_1 ) = 10 ) OR
   ( Length ( c_fax_1 ) = 9 ) Then Begin
   c_DDD := StrToIntDef ( Copy ( c_fax_1 , 1 , 2 ) , 0 ) ;
End ;

DECOMPOR_TELEFONE_3 ( c_tel_fixo_1 , c_tel_fixo_1 , c_tel_fixo_2 , c_tel_fixo_3 ) ;
DECOMPOR_TELEFONE_2 ( c_fax_1 , c_fax_1 , c_fax_2 ) ;

FORMATAR_TELEFONE ( c_tel_fixo_1 ) ;
FORMATAR_TELEFONE ( c_tel_fixo_2 ) ;
FORMATAR_TELEFONE ( c_tel_fixo_3 ) ;
FORMATAR_TELEFONE ( c_tel_cel_1 ) ;
FORMATAR_TELEFONE ( c_tel_cel_2 ) ;
FORMATAR_TELEFONE ( c_tel_cel_3 ) ;
FORMATAR_TELEFONE ( c_fax_1 ) ;
FORMATAR_TELEFONE ( c_fax_2 ) ;
End ;

Function SOMENTE_NUMERAIS ( _Aux : String ) : String ;
Var Local : LongInt ;
Begin
Result := '' ;
If Length ( _Aux ) > 0 Then Begin
   For Local := 1 To Length ( _Aux ) Do Begin
      If Pos ( _Aux[Local] , NUMERAIS ) > 0 Then Begin
         Result := Result + _Aux[Local] ;
      End ;
   End ;
End ;
End ;

Function LIMPAR_LINHAS_DUPLAS ( Aux : String ) : String ;
Begin
While Pos ( #32#32 , Aux ) > 0 Do Begin
   Delete ( Aux , Pos ( #32#32 , Aux ) , 1 ) ;
End ;
Result := Trim ( Aux ) ;
End ;

Function IS_WINDOWS_XP : Boolean ;
Begin
Result := Pos ( 'XP' , UpperCase ( GetVersaoWindows ) ) > 0 ;
End ;

Function IS_WINDOWS_VISTA : Boolean ;
Begin
Result := Pos ( 'VISTA' , UpperCase ( GetVersaoWindows ) ) > 0 ;
End ;

Function IS_WINDOWS_7 : Boolean ;
Begin
Result := Pos ( ' 7' , UpperCase ( GetVersaoWindows ) ) > 0 ;
End ;

Function IS_WINDOWS_8 : Boolean ;
Begin
Result := Pos ( ' 8' , UpperCase ( GetVersaoWindows ) ) > 0 ;
End ;

Function GetVersaoWindows : String ; // TVersaoWindows ;
//Type TVersaoWindows = (vw95, vw98, vwNT, vw2000, vwXP, vwVista, vw7 ) ;
//Var verInfo : TOsVersionInfo ;
//    S       : string;
Begin
Result := GET_VERSAO_WINDOWS_REGISTRY ;
(*
Result := 'Windows 95' ; // vw95 ;
verInfo.dwOSVersionInfoSize := SizeOf(TOSVersionInfo) ;
If GetVersionEx(verInfo) Then Begin
   S := 'Windows ';
   Case verInfo.dwPlatformId Of
      VER_PLATFORM_WIN32s        : Result := 'Windows 95' ; // vw95;
      VER_PLATFORM_WIN32_WINDOWS : Result := 'Windows 98' ; // vw98;
      VER_PLATFORM_WIN32_NT      : Result := 'Windows NT' ; // vwNT;
   End ;
   If verInfo.dwMajorVersion = 5 Then Begin
      If verInfo.dwMinorVersion = 0 Then Begin
         Result := 'Windows 2000' // vw2000
      End Else Begin
         Result := 'Windows XP' ; // vwXP;
      End ;
   End Else If verInfo.dwMajorVersion = 6 Then Begin
      Result := 'Windows Vista' ; // vwVista
   End Else If verInfo.dwMajorVersion = 7 Then Begin
      Result := 'Windows 7' ; // vw7
   End Else If verInfo.dwMajorVersion = 8 Then Begin
      Result := 'Windows 8' ; // vw8
   End ;
End ;
*)
End ;

Function RICARDO ( ByPass : Char ) : Boolean ;
Begin
{$IF Defined(PROJETO_GPRS)}
Result := TRUE ;
Exit ;
{$IFEND}
If MODO_NAO_RICARDO_FORCADO Then Begin
   Result := FALSE ;
   Exit ;
End ;
If MODO_RICARDO_FORCADO Then Begin
   Result := TRUE ;
   Exit ;
End ;
If ByPass = '0' Then Begin
   Result := FALSE ;
   Exit ;
End ;
Result := IS_COMPUTADOR_RICARDO ( COMPUTADOR ) ;
If RR_FileExists ( 'RICARDO', Diretorio + 'config\ricardo.nao' ) Then Begin
   Result := FALSE ;
End ;
End ;

Function RICARDO_REAL : Boolean ;
Begin
Result := TRUE ;
(*
Exit ;
{$IF Defined(PROJETO_GPRS)}
  Result := TRUE ;
  Exit ;
{$IFEND}
{$IF NOT Defined(PROJETO_GPRS)}
If MODO_NAO_RICARDO_FORCADO Then Begin
   Motivo_RICARDO_REAL := 10 ;
   Result := FALSE ;
   Exit ;
End ;
If MODO_RICARDO_REAL_FORCADO Then Begin
   Motivo_RICARDO_REAL := 11 ;
   Result := TRUE ;
   Exit ;
End ;
If RR_FileExists ( 'RICARDO_REAL', Diretorio + 'config\ricardo.nao' ) Then Begin
   Motivo_RICARDO_REAL := 12 ;
   Result := FALSE ;
   Exit ;
End ;
{
Result := ( DirectoryUsable ( 'C:\programacao\d6\biblioteca ricardo' ) ) AND
          ( DirectoryUsable  ( 'C:\accel' ) ) AND
          ( ( UpperCase ( Nome_Usuario ) = 'RICARDO' ) OR
            ( UpperCase ( Nome_Usuario ) = 'FLAVIO' ) ) AND
          ( ( UpperCase ( COMPUTADOR ) = 'NB-TELEMETRIA' ) OR
            ( UpperCase ( COMPUTADOR ) = 'NB-TELEMETRIA2' ) OR
            ( UpperCase ( COMPUTADOR ) = 'NB_TELEMETRIA' ) OR
            ( UpperCase ( COMPUTADOR ) = 'DELL-GPRS' ) OR
            ( UpperCase ( COMPUTADOR ) = 'SERV-GPRS' ) OR
            ( UpperCase ( COMPUTADOR ) = 'SERV_GPRS' ) ) ;
}
If UpperCase ( COMPUTADOR ) = 'XP' Then Begin
   Result := TRUE ;
   Exit ;
End ;
Result := ( UpperCase ( Nome_Usuario ) = 'RICARDO' ) AND
          ( DirectoryUsable ( 'C:\programacao\d6\biblioteca ricardo' ) ) AND
          ( DirectoryUsable  ( 'C:\accel' ) ) ;
Motivo_RICARDO_REAL := 1 ;
{$ENDIF}
*)
End ;

Function IS_COMPUTADOR_RICARDO ( _Computador : String ) : Boolean ;
Begin
//Result := TRUE ;
{$IF Defined(PROJETO_GPRS)}
Result := TRUE ;
Exit ;
{$IFEND}
If MODO_NAO_RICARDO_FORCADO Then Begin
   Result := FALSE ;
   Exit ;
End ;
If MODO_RICARDO_FORCADO Then Begin
   Result := TRUE ;
   Exit ;
End ;
Result := RICARDO_REAL ;
If RR_FileExists ( 'IS_COMPUTADOR_RICARDO', Diretorio + 'config\ricardo.nao' ) Then Begin
   Result := FALSE ;
End ;
End ;

Function RICARDO_SIMPLES : Boolean ;
Begin
{$IF Defined(PROJETO_GPRS)}
Result := TRUE ;
Exit ;
{$IFEND}
If MODO_NAO_RICARDO_FORCADO Then Begin
   Result := FALSE ;
   Exit ;
End ;
If MODO_RICARDO_FORCADO Then Begin
   Result := TRUE ;
   Exit ;
End ;
Result := IS_COMPUTADOR_RICARDO ( COMPUTADOR ) ;
If RR_FileExists ( 'RICARDO_SIMPLES', Diretorio + 'config\ricardo.nao' ) Then Begin
   Result := FALSE ;
End ;
End ;

Function RR_StrToDate ( _Str : String ) : TDateTime ;
Begin
_Debug ( 'INI RR_StrToDate "' + _Str + '"' ) ;
If Length ( _Str ) < 5 Then Begin
   Result := -1 ;
   _Debug ( 'Exit 1 RR_StrToDate' ) ;
   Exit ;
End ;
While Pos ( '.' , _Str ) <> 0 Do Begin
   _Str [ Pos ( '.' , _Str ) ] := '/' ;
End ;
While Pos ( '-' , _Str ) <> 0 Do Begin
   _Str [ Pos ( '-' , _Str ) ] := '/' ;
End ;
While Pos ( '\' , _Str ) <> 0 Do Begin
   _Str [ Pos ( '\' , _Str ) ] := '/' ;
End ;
While Pos ( ',' , _Str ) <> 0 Do Begin
   _Str [ Pos ( ',' , _Str ) ] := '/' ;
End ;
While Pos ( ';' , _Str ) <> 0 Do Begin
   _Str [ Pos ( ';' , _Str ) ] := '/' ;
End ;
While Pos ( ':' , _Str ) <> 0 Do Begin
   _Str [ Pos ( ':' , _Str ) ] := '/' ;
End ;
While Pos ( #32 , _Str ) <> 0 Do Begin
   _Str [ Pos ( #32 , _Str ) ] := '/' ;
End ;
Try
   Result := StrToDate ( _Str ) ;
Except
   Result := -1 ;
End ;
_Debug ( 'FIM RR_StrToDate' ) ;
End ;

Function FUNC_CODIGO_CATEGORIA ( Cat : String ) : String ;
Begin
Cat := UpperCase ( STRING_ASCII_PADRAO ( Cat ) ) ;
If Cat = 'CULTURAL' Then Result := '03' ;
If Cat = 'ESPECIAL VERAO' Then Result := '04' ;
If Cat = 'REPORTAGEM ESPECIAL' Then Result := '1bc07cdd-2e07-11db-85ae-39a3bbdf7873' ;
If Cat = 'CERIMONIAL' Then Result := '200c43b0-8851-11e3-9365-b1477232eb87' ;
If Cat = 'PLENARIO' Then Result := '2380d101-8851-11e3-9365-b1477232eb87' ;
If Cat = 'CASA ADMINISTRATIVA' Then Result := '2b5ab442-8851-11e3-9365-b1477232eb87' ;
If Cat = 'COMISSOES' Then Result := '30eec633-8851-11e3-9365-b1477232eb87' ;
If Cat = 'PRESIDENCIA' Then Result := '33c87314-8851-11e3-9365-b1477232eb87' ;
If Cat = 'DOCUMENTARIO' Then Result := '53bf297b-26e3-11db-959b-39b3e4e7de78' ;
If Cat = 'POLICIAL' Then Result := '92808080808080808080808080808D80' ;
If Cat = 'MODA' Then Result := '92808080808080808080808080808E80' ;
If Cat = 'COTIDIANO' Then Result := '92808080808080808080808080808F80' ;
If Cat = 'NACIONAL' Then Result := '92808080808080808080808080809080' ;
If Cat = 'INTERNACIONAL' Then Result := '92808080808080808080808080809180' ;
If Cat = 'POLITICA NACIONAL' Then Result := '92808080808080808080808080809280' ;
If Cat = 'POLITICA ESTADUAL' Then Result := '92808080808080808080808080809380' ;
If Cat = 'POLITICA REGIONAL' Then Result := '92808080808080808080808080809480' ;
If Cat = 'INTERNET' Then Result := '92808080808080808080808080809580' ;
If Cat = 'ESPORTE FUTEBOL' Then Result := '92808080808080808080808080809E80' ;
If Cat = 'ESPORTE GINASTICA' Then Result := '92808080808080808080808080809F80' ;
If Cat = 'ESPORTE BOX' Then Result := '9280808080808080808080808080A080' ;
If Cat = 'INFORM. NACIONAL' Then Result := '93808080808080808080808080809580' ;
If Cat = 'LIVRE' Then Result := 'f3c6248e-2636-11db-8deb-27b8dd43eb2d' ;
End ;

Function SegundosToMMSS_2 ( Aux : LongInt ; Casas : Byte ) : String ;
Begin
If Aux < 0 Then Begin
   Result := '0' ;
   Exit ;
End ;
If Aux > (59*99) Then Begin
   Result := '99-99' ;
   Exit ;
End ;
Result := StrZero ( Aux DIV 60 , 2 ) + ':' +
          StrZero ( Aux MOD 60 , 2 ) ;
If ( Casas = 1 ) AND ( Aux = 0 ) Then Begin
   Result := '-' ;
End ;
End ;

Function NOME_USUARIO : String ;
Var buffer    : Array[0..255] Of Char ;
    buffSize  : DWord ;
//    Retorno_B : Boolean ;
Begin
buffSize := SizeOf(buffer);
//Retorno_B :=
GetUserName ( @buffer, buffSize ) ;
Result := buffer ;
End ;

Function NOME_DO_USUARIO : String ;
Begin
Result := NOME_USUARIO ;
End ;

Function DIR_TEMP : String ;
Begin
//Result := 'C:\temp\' + NOME_USUARIO + '\' ;
Result := Diretorio + 'Users\' + NOME_DO_USUARIO + '\' ;
End ;

Function GET_CDROM_DISK : Char ;
Var Local : LongInt ;
Begin
_Debug ( 'INI GET_CDROM_DISK' ) ;
Result := #0 ;
For Local := Ord ( 'A' ) To Ord ( 'Z' ) Do Begin
   If GetDriveType ( PChar ( Chr(Local) + ':\' ) )  = DRIVE_CDROM Then Begin
      Result := Chr(Local) ;
      Break ;
   End ;
End ;
_Debug ( 'FIM GET_CDROM_DISK' ) ;
End ;

Function GET_DISK_TYPE ( _Drive : Char ) : String ;
Begin
_Debug ( 'INI GET_DISK_TYPE' ) ;
Case GetDriveType ( PChar ( _Drive + ':\' ) ) Of
   0                : Result := '' ;
   1                : Result := '???' ;
   DRIVE_REMOVABLE  : Result := 'REMOVÍVEL' ;
   DRIVE_FIXED      : Result := 'FIXO' ;
   DRIVE_REMOTE     : Result := 'REDE' ;
   DRIVE_CDROM      : Result := 'CD-ROM' ;
   DRIVE_RAMDISK    : Result := 'RAM-DISK' ;
   Else
                      Result := '???' ;
End ;
_Debug ( 'FIM GET_DISK_TYPE' ) ;
End ;

Function IS_DRIVE_HD ( _Letra : Char ) : Boolean ;
Begin
_Debug ( 'INI IS_DRIVE_HD "' + _Letra + ':"' ) ;
Result := GetDriveType ( PChar ( _Letra + ':\' ) ) = DRIVE_FIXED ;
_Debug ( 'FIM IS_DRIVE_HD' ) ;
End ;

Function IS_DRIVE_REDE ( _Letra : Char ) : Boolean ;
Begin
_Debug ( 'INI IS_DRIVE_REDE "' + _Letra + ':"' ) ;
Result := GetDriveType ( PChar ( _Letra + ':\' ) ) = DRIVE_REMOTE ;
_Debug ( 'FIM IS_DRIVE_REDE' ) ;
End ;

Function IS_DRIVE_CDROM ( _Letra : Char ) : Boolean ;
Begin
_Debug ( 'INI IS_DRIVE_CDROM "' + _Letra + ':"' ) ;
Result := GetDriveType ( PChar ( _Letra + ':\' ) ) = DRIVE_CDROM ;
_Debug ( 'FIM IS_DRIVE_CDROM' ) ;
End ;

Function IS_DRIVE_REMOVIVEL ( _Letra : Char ) : Boolean ;
Begin
_Debug ( 'INI IS_DRIVE_REMOVIVEL "' + _Letra + ':"' ) ;
Result := GetDriveType ( PChar ( _Letra + ':\' ) ) = DRIVE_REMOVABLE ;
_Debug ( 'FIM IS_DRIVE_REMOVIVEL' ) ;
End ;

Function IS_DRIVE_RAMDISK ( _Letra : Char ) : Boolean ;
Begin
_Debug ( 'INI IS_DRIVE_RAMDISK "' + _Letra + ':"' ) ;
Result := GetDriveType ( PChar ( _Letra + ':\' ) ) = DRIVE_RAMDISK ;
_Debug ( 'FIM IS_DRIVE_RAMDISK' ) ;
End ;

Function IS_DRIVE_VALID ( _Letra : Char ) : Boolean ;
Begin
_Debug ( 'INI IS_DRIVE_VALID "' + _Letra + ':"' ) ;
Result := GetDriveType ( PChar ( _Letra + ':\' ) ) > 1 ;
_Debug ( 'FIM IS_DRIVE_VALID' ) ;
End ;

Function GET_DISK_TYPE_CODE ( _Drive : Char ) : LongInt ;
Begin
_Debug ( 'INI GET_DISK_TYPE_CODE "' + _Drive + ':"' ) ;
Result := GetDriveType ( PChar ( _Drive + ':\' ) ) ;
_Debug ( 'FIM GET_DISK_TYPE_CODE' ) ;
End ;

Function TickToDateTime : TDateTime ;
Var Aux : Cardinal ;
Begin
Aux := GetTickCount DIV 1000 ;
Result := Aux DIV ( SecsPerDay ) + ( ( Aux MOD SecsPerDay ) / SecsPerDay ) ;
End ;

Function EXISTE_EM_LB ( Aux : String ; LB : TListBox ) : Boolean ;
Var Local : LongInt ;
    Qtde  : LongInt ;
Begin
_Debug ( 'INI EXISTE_EM_LB "' + Aux + '"' ) ;
Result := FALSE ;
Aux := Trim ( Aux ) ;
If Aux = '' Then Begin
   Exit ;
End ;
Qtde := LB.Items.Count ;
If Qtde > 0 Then Begin
   For Local := 0 To Qtde - 1 Do Begin
      If LB.Items[Local] = Aux Then Begin
         Result := TRUE ;
         Exit ;
      End ;
   End ;
End ;
_Debug ( 'FIM EXISTE_EM_LB' ) ;
End ;

Procedure PUT_LOG_FILE ( Dir , _Msg : String ) ;
Var Lista    : TStringList ;
    FileName : String ;
Begin
_Debug ( 'INI PUT_LOG_FILE "' + Dir + '"' ) ;
Lista := TStringList.Create ;
Lista.Clear ;
FileName := INSERE_BARRA ( Dir ) +
            StrZero ( YearOf ( Now ) , 4 ) + StrZero ( MonthOf ( Now ) , 2 ) + '\' +
            DataInversa ( Now ) + '.txt' ;
If NOT DirectoryUsable  ( ExtractFilePath ( FileName ) ) Then Begin
   ForceDirectories ( ExtractFilePath ( FileName ) ) ;
End ;
If RR_FileExists ( 'PUT_LOG_FILE', FileName ) Then Begin
   Lista.Text := GET_CONTEUDO_M ( 'PUT_LOG_FILE', FileName ) ;
End ;
Lista.Add ( DateTimeToStr ( Now ) + #32 +
            COMPLETE ( Sys_Usuario_Aplicativo.Usuario , 16 ) + #32 + _Msg ) ;
Try
  Lista.SaveToFile ( FileName ) ;
Except
End ;
Lista.Free ;
_Debug ( 'FIM PUT_LOG_FILE' ) ;
End ;

Function IS_LOGIN_RICARDO : Boolean ;
Begin
//Result := UpperCase ( Sys_Usuario_Aplicativo.Usuario ) = 'RICARDO' ;
Result := FALSE ;
End ;

Function NOSPACE ( Str : String ) : String ;
Begin
While Pos ( #32 , Str ) <> 0 Do Begin
   Delete ( Str , Pos ( #32 , Str ) , 1 ) ;
End ;
While Pos ( #0 , Str ) <> 0 Do Begin
   Delete ( Str , Pos ( #0 , Str ) , 1 ) ;
End ;
Result := Str ;
End ;

Procedure PUT_ERRO_DE_SISTEMA ( _Msg : String ) ;
Var LogFile    : TextFile ;
    Aux        : String ;
    _FileName  : String ;
Begin
_Debug ( 'INI PUT_ERRO_DE_SISTEMA "' + _Msg + '"' ) ;
If Trim ( _Msg ) = '' Then Begin
   _Debug ( 'INI PUT_ERRO_DE_SISTEMA (Msg Vazia)' ) ;
   Exit ;
End ;
Aux := DateToStr ( Now ) + '-' + TimeToStr ( Now ) + ' - ' + _Msg ;
{$i-}
_FileName := Dir_Database + 'erros_sistema\' +
             DataInversa ( Now ) +
             '\erros_sistema.dat' ;
If NOT DirectoryUsable  ( ExtractFilePath ( _FileName ) ) Then Begin
   ForceDirectories ( ExtractFilePath ( _FileName ) ) ;
End ;
Assign ( LogFile , _FileName ) ;
Append ( LogFile ) ;
If IoResult <> 0 Then Begin
   ReWrite ( LogFile ) ;
   If IoResult = 0 Then ;
   Append ( LogFile ) ;
End ;
If IoResult = 0 Then Begin
   Writeln ( LogFile , Aux ) ;
   If IoResult <> 0 Then ;
   Flush ( LogFile ) ;
   If IoResult <> 0 Then ;
   CloseFile ( LogFile ) ;
   If IoResult <> 0 Then ;
End ;
_Debug ( 'FIM PUT_ERRO_DE_SISTEMA' ) ;
End ;

Function ERRO_IORESULT ( Erro : Integer ; Msg : String ) : Boolean ;
Begin
Result := FALSE ;
If Erro <> 0 Then Begin
   Result := True ;
   If Msg <> '' Then Begin
      PUT_LOG ( 'ERRO IoResult = ' + IntToStr ( Erro ) + LF + Msg ) ;
   End ;
End ;
End ;

Function FN_CHYRON ( FN : String ) : String ;
Begin
Result := System.SysUtils.StringReplace ( FN,
                                          '\\192.168.201.171\rd',
                                          'R:', [rfReplaceAll] ) ;
End ;

Function RR_FileExists ( Origem, FN : String ) : Boolean ;
//Var RecDos    : TSearchRec ;
//    Resultado : LongInt ;
Begin
FN := FN_CHYRON ( FN ) ;
PUSH_TICK ( 'RR_FileExists [' + FN + ']' ) ;
Try
   If Assigned ( Log ) AND ( NOT Application.Terminated ) Then Begin
      If Assigned ( Log.LB_FileExists ) Then Begin
         Inc ( Cnt_Log_FN ) ;
         PUT_LOG_EVENTO ( Log.LB_FileExists, Log.CK_Rolagem.Checked,
                          'FN ' + IntToStr ( Cnt_Log_FN ) + ' ' +
                          'Or[' + Origem + ']' +
                          '[' + ExtractFileName(FN) + ']' +
                          '[' + FN + ']' ) ;
      End ;
   End ;
Except
End ;
Try
   Result := FileUsable ( FN ) ; //  FileExists ( FN ) ;
   //Result := ( RR_FindFirst ( 'RR_FileExists', FN, 0, RecDos ) = 0 ) ;
   //System.SysUtils.FindClose ( RecDos ) ;
Except
   On E : Exception Do Begin
      Result :=  FALSE ;
      PUT_LOG ( 'Exception RR_FileExists [' + E.Message + '][' + FN + ']' );
   End ;
End ;
//PUT_LOG ( 'RR_FileExists [' + IFSN(Result) + '][' + FN + ']' ) ;
POP_TICK ( 'RR_FileExists [' + FN + ']' ) ;
//Result := ( RR_FindFirst ( 'RR_FileExists', _FileName , 255 , RecDos ) = 0 ) ;
//SysUtils.FindClose ( RecDos ) ;
End ;

Function Dir_Windows : String ;
Var a   : Array[0..MAX_PATH] of char ;
    Aux : String ;
Begin
GetWindowsDirectory( a , sizeof(a));
Aux := StrPas(a) ;
Result := INSERE_BARRA ( Aux ) ;
end;

Function Dir_System : String ;
var a   : Array[0..MAX_PATH] of char;
    Aux : String ;
begin
GetSystemDirectory(a, sizeof(a));
Aux := StrPas(a) ;
Result := INSERE_BARRA ( Aux ) ;
end;

Function Dir_Windows_Fonts : String ;
var a   : Array[0..MAX_PATH] of char;
    Aux : String ;
begin
GetWindowsDirectory( a , sizeof(a));
Aux := StrPas(a) ;
If Length ( Aux ) > 0 Then Begin
   If Aux [ Length ( Aux ) ] <> '\' Then Begin
      Aux := Aux + '\' ;
   End ;
End ;
Result := Aux + 'fonts\' ;
end;

Procedure CARREGA_CB_COM_DIRETORIO ( CB : TComboBox ; Dir : String ;
                                     Extensao : String ) ;
Var RecDos    : TSearchRec ;
    Resultado : LongInt ;
Begin
_Debug ( 'INI CARREGA CB_COM_DIRETORIO "' + Dir + '"' ) ;
CB.Items.Clear ;
Dir := INSERE_BARRA ( Dir ) ;
Resultado := RR_FindFirst ( 'CARREGA CB_COM_DIRETORIO', Dir + '*.' + Extensao , 255 , RecDos ) ;
While Resultado = 0 Do Begin
   If RecDos.Name [ 1 ] <> '.' Then
      CB.Items.Add ( {Super_UpperCase} ( ExtractFileNameSemExt ( RecDos.Name ) ) ) ;
   Resultado := SysUtils.FindNext ( RecDos ) ;
End ;
If CB.Items.Count > 0 Then Begin
   CB.ItemIndex := 0 ;
End ;
SysUtils.FindClose ( RecDos ) ;
_Debug ( 'FIM CARREGA CB_COM_DIRETORIO' ) ;
End ;

Procedure ADICIONA_LB_COM_ARQUIVO ( LB : TListBox ; FileName : String ) ;
Var Arquivo : TextFile ;
    Linha   : String ;
Begin
_Debug ( 'INI ADICIONAR LB_COM_DIRETORIO "' + FileName + '"' ) ;
If NOT RR_FileExists ( 'ADICIONA LB_COM_ARQUIVO', FileName ) Then Begin
   _Debug ( 'Exit Pre-1 ADICIONAR LB_COM_DIRETORIO "' + FileName + '"' ) ;
   PUT_LOG ( 'ADICIONA LB_COM_ARQUIVO' + LFLF +
             'Arquivo ' + FileName + ' Não Encontrado' ) ;
   _Debug ( 'Exit 1 ADICIONAR LB_COM_DIRETORIO (NOT RR_FileExists)' ) ;
   Exit ;
End ;
AssignFile ( Arquivo , FileName ) ;
Reset ( Arquivo ) ;
If Erro_IoResult ( IoResult , 'Reset Adiciona LB_Com_Arquivo ' + FileName ) Then ;
While NOT EOF ( Arquivo ) Do Begin
   ReadLn ( Arquivo , Linha ) ;
   Linha := Trim ( Linha ) ;
   If Erro_IoResult ( IoResult , 'ReadLn Adiciona LB_Com_Arquivo ' + FileName ) Then ;
   If Length ( Trim ( Linha ) ) > 0 Then Begin
      If NOT Existe_EM_LB ( Linha , LB ) Then Begin
         LB.Items.Add ( Linha ) ;
      End ;
   End ;
End ;
If LB.Items.Count > 0 Then Begin
   LB.ItemIndex := 0 ;
End ;
CloseFile ( Arquivo ) ;
If Erro_IoResult ( IoResult , 'CloseFile Adiciona LB_Com_Arquivo ' + FileName ) Then ;
_Debug ( 'FIM ADICIONAR LB_COM_DIRETORIO' ) ;
End ;

Function RICARDO_NB_SIMPLES : Boolean ;
Begin
_Debug ( 'INI RICARDO_NB_SIMPLES' ) ;
Result := IS_RICARDO ;
Exit ;
RICARDO_NB_SIMPLES := ( TRUE OR
                        ( UpperCase ( COMPUTADOR ) = 'RICARDO-PC' ) OR
                        ( UpperCase ( COMPUTADOR ) = 'XXNB-TELEMETRIA2' ) OR
                        ( UpperCase ( COMPUTADOR ) = 'XXSERV_TM' ) OR
                        ( UpperCase ( COMPUTADOR ) = 'XXSERV_GPRS' ) OR
                        ( UpperCase ( COMPUTADOR ) = 'XXTELEMETRIA' ) OR
                        ( UpperCase ( COMPUTADOR ) = 'XXRICARDOR2' ) ) AND
                      ( UpperCase ( NOME_DO_USUARIO ) = 'RICARDO' ) ;
_Debug ( 'FIM RICARDO_NB_SIMPLES=' + IFSN ( Result ) ) ;
End ;

Procedure REGISTRA_LOGIN_LOGOUT ( Bool_Login : Boolean ; _Sys_Usuario : String ) ;
Var FileName : String ;
    Aux      : String ;
    Lista    : TStringList ;
Begin
_Debug ( 'INI REGISTRA_LOGIN_LOGOUT "' + _Sys_Usuario + '" (' + IFSN ( Bool_Login ) + ')' ) ;
FileName := Dir_DataBase + 'usuarios\login_logout\' +
            StrZero ( YearOf ( Now ) , 4 ) +
            StrZero ( MonthOf ( Now ) , 2 ) + '\' +
            Super_LowerCase ( Sys_Usuario_Aplicativo.Usuario ) + '.dat' ;
If NOT DirectoryUsable  ( ExtractFilePath ( FileName ) ) Then Begin
   ForceDirectories ( ExtractFilePath ( FileName ) ) ;
End ;
If Bool_Login Then Begin
   Aux := DateTimeToStr ( Now ) + ' LOGIN  ' + COMPLETE ( _Sys_Usuario , 16 ) + ' ' + COMPUTADOR ;
End Else Begin
   Aux := DateTimeToStr ( Now ) + ' LOGOUT ' + COMPLETE ( _Sys_Usuario , 16 ) + ' ' + COMPUTADOR ;
End ;
Lista := TStringList.Create ;
Lista.Clear ;
If RR_FileExists ( 'REGISTRA_LOGIN_LOGOUT', FileName ) Then Begin
   Lista.Text := GET_CONTEUDO_M ( 'REGISTRA_LOGIN_LOGOUT', FileName ) ;
End ;
Lista.Add ( Aux ) ;
Try
   Lista.SaveToFile ( FileName ) ;
Except
End ;
Lista.Free ;
_Debug ( 'FIM REGISTRA_LOGIN_LOGOUT' ) ;
End ;

Function Tick_To_HHMMSSCC ( Valor : LongInt ) : String ;
Begin
Valor := Valor DIV 10 ;
Valor := Valor MOD ( 99 * 3600 + 59 * 60 + 59 ) ;
Result := StrZero ( Valor DIV 360000 , 2 ) + ':' +
          StrZero ( ( Valor MOD 360000 ) DIV 6000 , 2 ) + ':' +
          StrZero ( ( Valor MOD 6000 ) DIV 100 , 2 ) + ',' +
          StrZero ( Valor MOD 100 , 2 ) ;
End ;

Function MOVER_MENSAGEM_CP ( Dir_Origem , Dir_Destino , FileName : String ) : Boolean ;
Var Arquivo : TextFile ;
Begin
_Debug ( 'INI MOVER_MENSAGEM_CP "' + Dir_Origem + '" "' +
         Dir_Destino + '" "' + FileName + '"' ) ;
Result := TRUE ;
If RR_FileExists ( 'MOVER_MENSAGEM_CP/1', Dir_Destino + FileName + '.CAB' ) Then Begin
   AssignFile ( Arquivo , Dir_Destino + FileName + '.CAB' ) ;
   Erase ( Arquivo ) ;
   If Erro_IoResult ( IoResult , 'Erase ' + Dir_Destino + FileName + '.CAB' ) Then ;
End ;
If NOT MoveFile ( PChar ( Dir_Origem + FileName + '.CAB' ) ,
                  PChar ( Dir_Destino + FileName + '.CAB' ) ) Then Begin
   PUT_LOG ( 'ERRO movendo' + LFLF + Dir_Origem + FileName + '.CAB' + LFLF +
             'para' + LFLF +
             Dir_Destino + FileName + '.CAB' ) ;
   Result := FALSE ;
End ;
If RR_FileExists ( 'MOVER_MENSAGEM_CP/2', Dir_Destino + FileName + '.RTF' ) Then Begin
   AssignFile ( Arquivo , Dir_Destino + FileName + '.RTF' ) ;
   Erase ( Arquivo ) ;
   If Erro_IoResult ( IoResult , 'Erase ' + Dir_Destino + FileName + '.RTF' ) Then ;
End ;
If NOT MoveFile ( PChar ( Dir_Origem + FileName + '.RTF' ) ,
                  PChar ( Dir_Destino + FileName + '.RTF' ) ) Then Begin
   PUT_LOG ( 'ERRO movendo' + LFLF + Dir_Origem + FileName + '.RTF' + LFLF +
             'para' + LFLF +
             Dir_Destino + FileName + '.RTF' ) ;
   Result := FALSE ;
End ;
_Debug ( 'FIM MOVER_MENSAGEM_CP' ) ;
End ;

Function QTDE_CHAR ( _Char : Char ; _Str : String ) : LongInt ;
Var Local : LongInt ;
Begin
Result := 0 ;
If Length ( _Str ) = 0 Then Begin
   Exit ;
End ;
For Local := 1 To Length ( _Str ) Do Begin
   If _Str[Local] = _Char Then Begin
      Inc ( Result ) ;
   End ;
End ;
End ;

Function IS_DATA_INVERSA_NW ( _Str : String ; Var _DT : TDateTime ) : Boolean ;
Var Aux : LongInt ;
Begin
Result := FALSE ;
If Length ( _Str ) < 8 Then Begin
   Exit ;
End ;
Aux := StrToIntDef ( Copy ( _Str , 1 , 4 ) , 0 ) ;
If ( Aux < 1899 ) OR ( Aux > 2099 ) Then Begin
   Exit ;
End ;
Aux := StrToIntDef ( Copy ( _Str , 5 , 2 ) , 0 ) ;
If ( Aux < 1 ) OR ( Aux > 12 ) Then Begin
   Exit ;
End ;
Aux := StrToIntDef ( Copy ( _Str , 7 , 2 ) , 0 ) ;
If ( Aux < 1 ) OR ( Aux > 31 ) Then Begin
   Exit ;
End ;
Try
   _DT := StrToDate ( Copy ( _Str , 7 , 2 ) + '/' +
                      Copy ( _Str , 5 , 2 ) + '/' +
                      Copy ( _Str , 1 , 4 ) ) ;
   If ( YearOf ( _DT ) < 1980 ) OR
      ( YearOf ( _DT ) > 2020 ) Then Begin
      _DT := -1 ;
   End ;
Except
   Exit ;
End ;
Result := TRUE ;
End ;

Function Repli ( Tipo : Char ; Inteiro : LongInt ) : String ;
Var Palavra : String ;
Begin
Palavra := '' ;
If Inteiro < 1 Then Begin
   Result := Palavra ;
   Exit ;
End ;
While Length ( Palavra ) < Inteiro Do Begin
      Palavra := Palavra + Tipo ;
End ;
Result := Palavra ;
End ;

Function CONTA_ARQUIVOS_SIMPLES ( Dir : String ; _ProcessMessages : Boolean ) : LongInt ;
Var Resultado : LongInt ;
    RecDos    : TSearchRec;
    Contador  : LongInt ;
begin
_Debug ( 'INI CONTAR ARQUIVO_SIMPLES "' + Dir + '"' ) ;
Dir := INSERE_BARRA ( Dir ) ;
Contador := 0 ;
PUT_LOG ( '1 CONTAR ARQUIVOS_SIMPLES [' + Dir + '] FIXO[*.*]' ) ;
Resultado := RR_FindFirst ( 'CONTAR ARQUIVO_SIMPLES', Dir + '*.*' , 255 , RecDos ) ;
While Resultado = 0 Do Begin
  If RecDos.Name [ 1 ] <> '.' Then Begin
     Inc ( Contador ) ;
  End ;
  PUT_LOG ( 'RecDos [' + Dir + RecDos.Name + ']' ) ;
  If ( Contador MOD 100 = 0 ) AND ( _ProcessMessages ) Then Begin
     Application.ProcessMessages ;
  End ;
  Resultado := SysUtils.FindNext ( RecDos ) ;
End ;
PUT_LOG ( '2 CONTAR ARQUIVOS_SIMPLES [' + Dir + '] FIXO[*.*]' ) ;
SysUtils.FindClose ( RecDos ) ;
Result := Contador ;
_Debug ( 'FIM CONTAR ARQUIVO_SIMPLES' ) ;
End ;

Function CONTAR_ARQUIVOS ( Dir , _Mascara : String ; _ProcessMessages : Boolean ) : LongInt ;
Var Resultado : LongInt ;
    RecDos    : TSearchRec;
    Contador  : LongInt ;
begin
_Debug ( 'INI CONTAR ARQUIVO "' + Dir + '"' ) ;
PUT_LOG ( '1 CONTAR ARQUIVOS [' + Dir + '][' + _Mascara +  ']' ) ;
Contador := 0 ;
Dir := INSERE_BARRA ( Dir ) ;
Resultado := RR_FindFirst ( 'CONTAR ARQUIVO', Dir + _Mascara , 0 , RecDos ) ;
While Resultado = 0 Do Begin
   If RecDos.Name [ 1 ] <> '.' Then Begin
      Inc ( Contador ) ;
   End ;
   PUT_LOG ( 'RecDos [' + Dir + RecDos.Name + ']' ) ;
   If ( Contador MOD 100 = 0 ) AND ( _ProcessMessages ) Then Begin
      Application.ProcessMessages ;
   End ;
   Resultado := SysUtils.FindNext ( RecDos ) ;
End ;
SysUtils.FindClose ( RecDos ) ;
Result := Contador ;
PUT_LOG ( '2 CONTAR ARQUIVOS [' + Dir + '][' + _Mascara +  ']' ) ;
_Debug ( 'FIM CONTAR ARQUIVO' ) ;
End ;

Function Primeira_Maiuscula ( _Str : String ) : String ;
Var Aux   : String ;
    Local : LongInt ;
Begin
Aux := Super_LowerCase ( _Str ) ;
Aux[1] := Super_UpCase ( Aux[1] ) ;
If Length ( Aux ) > 4 Then Begin
   For Local := 3 To Length ( Aux ) - 1 Do Begin
      If Aux[Local-1] = #32 Then Begin
         Aux[Local] := UpCase ( Aux[Local] ) ;
      End ;
   End ;
End ;
Result := Aux ;
End ;

Function Super_LowerCase ( Str : String ) : String ;
Var Local : LongInt ;
Begin
Result := '' ;
If Str = '' Then Begin
   Exit ;
End ;
If Length ( Str ) > 0 Then Begin
   For Local := 1 To Length ( Str ) Do Begin
     Str [ Local ] := Super_LoCase ( Str [ Local ] ) ;
   End ;
End ;
Result := Str ;
End ;

Function SUPER_LOCASE ( Letra : Char ) : Char ;
Const DESTINO = 'áéíóúãõñàèìòùâêîôûç' ;
      ORIGEM  = 'ÁÉÍÓÚÃÕÑÀÈÌÒÙÂÊÎÔÛÇ' ;
Begin
If Pos ( Letra , Origem ) <> 0 Then Begin
   Result := Destino [ Pos ( Letra , Origem ) ]
End Else Begin
   Result := LoCase_NW ( Letra ) ;
End ;
End ;

Function LoCase_NW ( _Char : Char ) : Char ;
Const ORIGEM  = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ' ;
      DESTINO = 'abcdefghijklmnopqrstuvwxyz' ;
Begin
If POS ( _Char , ORIGEM ) <> 0 Then Begin
   Result := DESTINO [ POS ( _Char , ORIGEM ) ]
End Else Begin
   Result := _Char ;
End ;
End ;

Procedure KEY_NOME ( Var Key : Char ) ;
Begin
If Pos ( Key , ALFABETO + #08#13#32 ) = 0 Then Begin
   Key := #0 ;
End ;
End ;

Procedure KEY_NUMERO ( Var Key : Char ) ;
Begin
If Pos ( Key , NUMERAIS + #08#13 ) = 0 Then Begin
   Key := #0 ;
End ;
End ;

Procedure KEY_NOME_NUMERO ( Var Key : Char ) ;
Begin
If Pos ( Key , ALFABETO + NUMERAIS + #08#13#32 ) = 0 Then Begin
   Key := #0 ;
End ;
End ;

Function DIAS_POR_MES_DT ( DT : TDateTime ) : LongInt ;
Begin
Case MonthOf ( DT ) Of
  1,3,5,7,8,10,12 : Result := 31 ;
  4,6,9,11 : Result := 30 ;
  2 : If YearOf ( DT ) MOD 4 = 0 Then
      Result := 29
      Else
      Result := 28 ;
  Else
      Result := 28 ;
  End ;
End ;

Function REMOVE_DA_STRING ( Str : String ; _Char : Char ) : String ;
Begin
While Pos ( _Char , Str ) <> 0 Do Begin
   Delete ( Str , Pos ( _Char , Str ) , 1 ) ;
End ;
Result := Str ;
End ;

Function EXISTE_EM_SG ( Aux : String ; SG : TStringGrid ; Coluna : LongInt ) : LongInt ;
Var Local : LongInt ;
Begin
Result := -1 ;
Aux := Trim ( Aux ) ;
If Aux = '' Then Begin
   Exit ;
End ;
If SG.RowCount > 0 Then Begin
   For Local := 0 To SG.RowCount - 1 Do Begin
      If Trim ( SG.Cells[Coluna,Local] ) = Aux Then Begin
         Result := Local ;
         Exit ;
      End ;
   End ;
End ;
End ;

Procedure MKDIR_LIST ( Lista : TStringList ) ;
Var Local : LongInt ;
    Qtde  : LongInt ;
Begin
If NOT Assigned ( Lista ) Then Begin
   Exit ;
End ;
Qtde := Lista.Count ;
If Qtde = 0 Then Begin
   Exit ;
End ;
For Local := 0 To Qtde - 1  Do Begin
   If NOT DirectoryUsable (  Lista[Local] ) Then Begin
      If NOT ForceDirectories ( Lista[Local] ) Then Begin
         PUT_LOG ( 'ERRO MkDir Lista[' + IntToStr ( Local ) + '][' + Lista[Local] + ']' ) ;
      End ;
   End ;
End ;
End ;

Function SE ( Expressao : Boolean ; Str : String ) : String ;
Begin
If Expressao Then Begin
   Result := Str
End Else Begin
   Result := '' ;
End ;
End ;

Function SENAO ( Expressao : Boolean ; Str : String ) : String ;
Begin
If NOT Expressao Then Begin
   Result := Str
End Else Begin
   Result := '' ;
End ;
End ;

Function FontExists ( Nome : String ) : Boolean ;
Var Aux    : Boolean ;
    Local  : LongInt ;
    Lista  : TStrings ;
    Qtde   : LongInt ;
Begin
_Debug ( 'INI FontExists "' + Nome + '"' ) ;
Aux := FALSE ;
Lista := Screen.Fonts ;
Nome := UpperCase ( Nome ) ;
Qtde := Lista.Count ;
If Qtde > 0 Then Begin
   For Local := 0 To Qtde - 1 Do Begin
      If UpperCase ( Lista.Strings[Local] ) = Nome Then Begin
         Aux := TRUE ;
         Break ;
      End ;
   End ;
End ;
FontExists := Aux ;
_Debug ( 'FIM FontExists' ) ;
End ;

Function Impressora_Default ( Formulario : TForm ) : String ;
Var Lista : TListBox ;
    Aux   : String ;
    Qtde  : LongInt ;
Begin
_Debug ( 'INI Impressora_Default' ) ;
Aux := '-' ;
Lista := TListBox.Create ( Formulario ) ;
Lista.Parent := Formulario ;
Lista.Items := Printer.Printers ;
Qtde := Lista.Items.Count ;
If Qtde > 0 Then Begin
   If Printer.PrinterIndex <= Qtde - 1 Then Begin
      Aux := Lista.Items[Printer.PrinterIndex] ;
   End ;
End ;
Lista.Free ;
Result := Aux ;
_Debug ( 'FIM Impressora_Default' ) ;
End ;

Function RR_Performance_CPU : LongInt ;
Var Contador : LongInt ;
    Tick     : Cardinal ;
Begin
Tick := GetTickCount ;
While Tick = GetTickCount Do Begin
End ;
Tick := GetTickCount ;
Contador := 0 ;
While Tick = GetTickCount Do Begin
   Inc ( Contador ) ;
End ;
Result := Contador ;
End ;

Procedure INVERTER_TSTRINGLIST ( Var LB : TStringList ) ;
Var _LB    : TStrings ;
    Local  : LongInt ;
    Qtde   : LongInt ;
Begin
Qtde := LB.Count ;
If Qtde = 0 Then Begin
   Exit ;
End ;
_LB := TStringList.Create ;
_LB.Clear ;
For Local := Qtde - 1 DownTo 0 Do Begin
  _LB.Add ( LB.Strings[Local] ) ;
End ;
LB.Clear ;
Qtde := _LB.Count ;
For Local := 0 To Qtde - 1 Do Begin
    LB.Add ( _LB.Strings[Local] ) ;
End ;
_LB.Free ;
End ;

Function CONVERTE_ESPELHO2 ( Nome : String ; RE : TRichEdit ;
                             SG : TStringGrid ; Dir_Tmp : String ;
                             Var CRC_Atual : Comp ) : String ;
Const MAX_LINHAS = 200 ;
Var Arquivo    : File ;
    Buffer     : Array [ 1 .. 128 ] Of Char ;
    Local      ,
    Soma       ,
    Linha_SG   ,
    Lidos      : Longint ;
    Novo_Nome  ,
    Aux        : String ;
    Super_Buf  : Array [ 1 .. 32000 ] Of Byte ;
    Calc_CRC   : Comp ;
Function Str2MMSS ( Str : String ) : String ;
Var Segundos : LongInt ;
Begin
Segundos := Ord ( Str [ 1 ] ) + Ord ( Str [ 2 ] ) * 60 ;
Str2MMSS := StrZero ( Segundos DIV 60 , 2 ) + ':' +
            StrZero ( Segundos MOD 60 , 2 ) ;
End ;
Function Filtro ( Str : String ) : String ;
Var Local2 : LongInt ;
Begin
For Local2 := 1 To Length ( Str ) Do
    If Str [ Local2 ] = #0 Then
       Str [ Local2 ] := #32 ;
Filtro := Trim ( Str ) ;
End ;
Function MARCADOR ( Str : String ) : Boolean ;
Begin
MARCADOR := ( Filtro ( Copy ( Aux , 11 , 15 ) ) = 'INÍCIO' ) OR
            ( Filtro ( Copy ( Aux , 11 , 15 ) ) = 'COMERCIAL-01' ) OR
            ( Filtro ( Copy ( Aux , 11 , 15 ) ) = 'COMERCIAL-03' ) OR
            ( Filtro ( Copy ( Aux , 11 , 15 ) ) = 'PREVIEW' ) OR
            ( Filtro ( Copy ( Aux , 11 , 15 ) ) = 'FIM' ) ;
End ;
Begin
_Debug ( 'INI CONVERTE_ESPELHO2 "' + Nome + '"' ) ;
Inc ( Cnt_Converte_Espelho ) ;
If NOT RR_FileExists ( 'CONVERTE_ESPELHO2', Nome ) Then Begin
   Result := 'Arquivo <' + Nome + '> Não Encontrado. [' +
             IntToStr ( Cnt_Converte_Espelho ) + ']' ;
   _Debug ( 'Exit 1 CONVERTE_ESPELHO2 (NOT RR_FileExists)' ) ;
   Exit ;
End ;
Dir_Tmp := INSERE_BARRA ( Dir_Tmp ) ;
Novo_Nome := Dir_Tmp + 'espelho.txt' ;
CHECAR_DIRETORIO_FILENAME ( Novo_Nome ) ;
If NOT CopiaArquivo ( 'CONVERTE_ESPELHO2',
                      Nome , Novo_Nome , SOBREPOE ) Then Begin
   Result := 'Erro ao copiar <' + Nome + '> para <' + Novo_Nome +
             '> [' + IntToStr ( Cnt_Converte_Espelho ) + ']' ;
   _Debug ( 'Exit 2 CONVERTE_ESPELHO2 (NOT CopiaArquivo)' ) ;
   Exit ;
End ;
AssignFile ( Arquivo , Novo_Nome ) ;
Reset ( Arquivo , 1 ) ;
BlockRead( Arquivo , Super_Buf , SizeOf(Super_Buf), Lidos ) ;
Calc_CRC := 0 ;
For Local := 1 To Lidos Do Begin
   Calc_CRC := Calc_CRC + Super_Buf [ Local ] * Local ;
End ;
CloseFile ( Arquivo ) ;
If Calc_CRC = CRC_Atual Then Begin
   Result := 'Arquivo <' + Nome + '> Inalterado (' +
              CompToStr ( Calc_CRC ) + ') [' +
              IntToStr ( Cnt_Converte_Espelho ) + ']' ;
   _Debug ( 'Exit 3 CONVERTE_ESPELHO2 (Calc_CRC=CRC_Atual)' ) ;
   Exit ;
End ;
Reset ( Arquivo , 1 ) ;
If RE <> nil Then Begin
   RE.Lines.Clear ;
End ;
If SG <> nil Then Begin
   SG.RowCount := 2 ;
   For Local := 0 To SG.ColCount Do Begin
     SG.Cells[Local,1] := '' ;
   End ;
End ;
Linha_SG := 0 ;
Repeat
   BlockRead( Arquivo , Buffer , SizeOf(Buffer), Lidos ) ;
   Soma := 0 ;
   If ( Lidos = 128 ) Then Begin
      Aux := '' ;
      For Local := 1 To Lidos Do Begin
          Aux := Aux + Buffer [ Local ] ;
          Inc ( Soma , Ord ( Buffer [ Local ] ) ) ;
      End ;
      If RE <> nil Then Begin
         If Soma <> 0 Then Begin
            If MARCADOR ( Aux ) Then Begin
               RE.Lines.Add (
                 Complete ( #32 , 3 ) + #32#32 +
                 Complete ( #32 , 6 ) + #32#32 +
                 Complete ( Filtro ( Copy ( Aux , 11 , 15 ) ) , 15 ) + #32#32 ) ;
            End Else Begin
               RE.Lines.Add (
                 Complete ( Filtro ( Copy ( Aux , 85 , 3 ) ) , 3 ) + #32#32 +
                 Complete ( Filtro ( Copy ( Aux , 27 , 6 ) ) , 6 ) + #32#32 +
                 Complete ( Filtro ( Copy ( Aux , 11 , 15 ) ) , 15 ) + #32#32 +
                 Str2MMSS ( Copy ( Aux , 65 , 2 ) ) + #32#32 +
                 Str2MMSS ( Copy ( Aux , 83 , 2 ) ) + #32#32 +
                 Complete ( Filtro ( Copy ( Aux , 49 , 3 ) ) + #32 +
                            StrZero ( Ord ( Aux [ 75 ] ) , 2 ) , 6 ) + #32#32 ) ;
            End ;
         End ;
      End ;
      If SG <> nil Then Begin
         If Soma <> 0 Then Begin
            If MARCADOR ( Aux ) Then Begin
               Inc ( Linha_SG ) ;
               If Linha_SG >= SG.RowCount Then Begin
                  SG.RowCount := SG.RowCount + 1 ;
               End ;
               LIMPA_LINHA_SG ( SG , Linha_SG ) ;
               SG.Cells[0,Linha_SG] := '' ;
               SG.Cells[1,Linha_SG] := '' ;
               SG.Cells[2,Linha_SG] :=
                            Complete ( Filtro ( Copy ( Aux , 11 , 15 ) ) , 15 ) ;
               SG.Cells[3,Linha_SG] := '' ;
               SG.Cells[4,Linha_SG] := '' ;
            End Else Begin
               Inc ( Linha_SG ) ;
               If Linha_SG >= SG.RowCount Then Begin
                  SG.RowCount := SG.RowCount + 1 ;
               End ;
               LIMPA_LINHA_SG ( SG , Linha_SG ) ;
               SG.Cells[0,Linha_SG] :=
                 Trim ( Complete ( Filtro ( Copy ( Aux , 85 , 3 ) ) , 3 ) ) ;
               SG.Cells[1,Linha_SG] :=
                 Complete ( Filtro ( Copy ( Aux , 27 , 3 ) ) , 3 ) ;
               SG.Cells[2,Linha_SG] :=
                 Complete ( Filtro ( Copy ( Aux , 11 , 15 ) ) , 15 ) ;
               SG.Cells[3,Linha_SG] :=
                 Str2MMSS ( Copy ( Aux , 65 , 2 ) ) ;
               SG.Cells[6,Linha_SG] :=
                 Complete ( COMPLETE ( Filtro ( Copy ( Aux , 49 , 3 ) ) , 3 ) + '-' +
                            IntToStr ( Ord ( Aux [ 75 ] ) ) , 5 ) ;
            End ;
         End ;
      End ;
   End ;
Until ( Lidos <> 128 ) OR ( Soma = 0 ) ;
If SG <> nil Then Begin
   Inc ( Linha_SG ) ;
   If Linha_SG >= SG.RowCount Then Begin
      SG.RowCount := SG.RowCount + 1 ;
   End ;
   LIMPA_LINHA_SG ( SG , Linha_SG ) ;
   SG.Cells[2,Linha_SG] := 'FIM DO PREVIEW' ;
End ;
CloseFile ( Arquivo ) ;
CRC_Atual := Calc_CRC ;
Result := 'Carregado : <' + Nome + '> [' +
          IntToStr ( Cnt_Converte_Espelho ) + ']' ;
_Debug ( 'FIM CONVERTE_ESPELHO2' ) ;
End ;

(*
Function APPEND_FILE_REAL ( _FileName , _Conteudo : String ) : Boolean ;
Var Arquivo : TextFile ;
Begin
CHECAR_DIRETORIO_FILENAME ( _FileName ) ;
AssignFile ( Arquivo , _FileName ) ;
If NOT RR_FileExists ( 'APPEND_FILE_REAL', _FileName ) Then Begin
   ReWrite ( Arquivo )
End Else Begin
   Append ( Arquivo ) ;
End ;
Write ( Arquivo , _Conteudo ) ;
CloseFile ( Arquivo ) ;
Result := TRUE ;
End ;
*)

Function EXTRAIR_CONTEUDO2 ( _Cmd : String ; _Chave : String ; Var Residuo : String ;
                             Delimitadores : String ) : String ;
Var Pos_Ini : LongInt ;
    _Ini    : String ;
    _Fim    : String ;
    Pos_Fim : LongInt ;
Begin
//_Debug ( 'INI EXTRAIR_CONTEUDO "' + _Chave + '" "' + _Cmd + '"' ) ;
Result := '' ;
If Delimitadores = '' Then Begin
   Delimitadores := '<>' ;
End ;
While Pos ( Delimitadores[1] , _Chave ) > 0 Do Begin
   Delete ( _Chave , Pos ( Delimitadores[1] , _Chave ) , 1 ) ;
End ;
While Pos ( Delimitadores[2] , _Chave ) > 0 Do Begin
   Delete ( _Chave , Pos ( Delimitadores[2] , _Chave ) , 1 ) ;
End ;
_Ini := _Chave ;
If _Ini = 'INI' Then Begin
   _Fim := 'FIM'
End Else Begin
   _Fim := '/' + _Chave ;
End ;
_Ini := Delimitadores[1] + _Ini + Delimitadores[2] ;
_Fim := Delimitadores[1] + _Fim + Delimitadores[2] ;
Pos_Ini := Pos ( _Ini , _Cmd ) ;
Pos_Fim := Pos ( _Fim , _Cmd ) ;
Residuo := _Cmd ;
If ( Pos_Ini > 0 ) AND
   ( Pos_Fim > 0 ) AND
   ( Pos_Fim > Pos_Ini ) Then Begin
   Delete ( _Cmd , 1 , Pos_Ini + Length ( _Ini ) - 1 ) ;
   Residuo := _Cmd ;
   Pos_Fim := Pos ( _Fim , _Cmd ) ;
   Delete ( _Cmd , Pos_Fim , Length ( _Cmd ) ) ;
   Delete ( Residuo , 1 , Pos_Fim + Length ( _Fim ) - 1 ) ;
   Result := _Cmd ;
End ;
//_Debug ( 'FIM EXTRAIR_CONTEUDO' ) ;
End ;

Function SegundosToHHMMSS ( Exibe_Traco : Boolean ; Aux : LongInt ) : String ;
Var Casas : LongInt ;
Begin
If Aux DIV 3600 > 99 Then Begin
   Casas := 3
End Else Begin
   Casas := 2 ;
End ;
If ( Aux > 0 ) OR ( NOT Exibe_Traco ) Then Begin
   Result := StrZero ( Aux DIV 3600 , Casas ) + ':' +
             StrZero ( ( Aux MOD 3600 ) DIV 60 , 2 ) + ':' +
             StrZero ( Aux MOD 60 , 2 )
End Else Begin
   Result := '-' ;
End ;
End ;

Function Status_Hora : String ;
Begin
Result := DiaDaSemana ( Now ) + ' - ' +
          DateToStr ( Now ) + ' - ' +
          TimeToStr ( Now ) ;
End ;

Function FUNC_GET_CATEGORIA_POR_CODIGO ( Codigo : String ) : String ;
Begin
Codigo := UpperCase ( STRING_ASCII_PADRAO ( Codigo ) ) ;
If Codigo = UpperCase ( '03' ) Then Result := 'CULTURAL' ;
If Codigo = UpperCase ( '04' ) Then Result := 'ESPECIAL VERAO' ;
If Codigo = UpperCase ( '1bc07cdd-2e07-11db-85ae-39a3bbdf7873' ) Then Result := 'REPORTAGEM ESPECIAL' ;
If Codigo = UpperCase ( '200c43b0-8851-11e3-9365-b1477232eb87' ) Then Result := 'CERIMONIAL' ;
If Codigo = UpperCase ( '2380d101-8851-11e3-9365-b1477232eb87' ) Then Result := 'PLENARIO' ;
If Codigo = UpperCase ( '2b5ab442-8851-11e3-9365-b1477232eb87' ) Then Result := 'CASA ADMINISTRATIVA' ;
If Codigo = UpperCase ( '30eec633-8851-11e3-9365-b1477232eb87' ) Then Result := 'COMISSOES' ;
If Codigo = UpperCase ( '33c87314-8851-11e3-9365-b1477232eb87' ) Then Result := 'PRESIDENCIA' ;
If Codigo = UpperCase ( '53bf297b-26e3-11db-959b-39b3e4e7de78' ) Then Result := 'DOCUMENTARIO' ;
If Codigo = UpperCase ( '92808080808080808080808080808D80' ) Then Result := 'POLICIAL' ;
If Codigo = UpperCase ( '92808080808080808080808080808E80' ) Then Result := 'MODA' ;
If Codigo = UpperCase ( '92808080808080808080808080808F80' ) Then Result := 'COTIDIANO' ;
If Codigo = UpperCase ( '92808080808080808080808080809080' ) Then Result := 'NACIONAL' ;
If Codigo = UpperCase ( '92808080808080808080808080809180' ) Then Result := 'INTERNACIONAL' ;
If Codigo = UpperCase ( '92808080808080808080808080809280' ) Then Result := 'POLITICA NACIONAL' ;
If Codigo = UpperCase ( '92808080808080808080808080809380' ) Then Result := 'POLITICA ESTADUAL' ;
If Codigo = UpperCase ( '92808080808080808080808080809480' ) Then Result := 'POLITICA REGIONAL' ;
If Codigo = UpperCase ( '92808080808080808080808080809580' ) Then Result := 'INTERNET' ;
If Codigo = UpperCase ( '92808080808080808080808080809E80' ) Then Result := 'ESPORTE FUTEBOL' ;
If Codigo = UpperCase ( '92808080808080808080808080809F80' ) Then Result := 'ESPORTE GINASTICA' ;
If Codigo = UpperCase ( '9280808080808080808080808080A080' ) Then Result := 'ESPORTE BOX' ;
If Codigo = UpperCase ( '93808080808080808080808080809580' ) Then Result := 'INFORM. NACIONAL' ;
If Codigo = UpperCase ( 'f3c6248e-2636-11db-8deb-27b8dd43eb2d' ) Then Result := 'LIVRE' ;
End ;

Procedure LISTAR_TIMERS ( Form1 : TForm ) ;
Var Local : LongInt ;
    Aux   : String ;
    Forms : Array [ 1 .. 200 ] Of TForm ;
    Pnt   : LongInt ;
Function TIMER_DO_FORM ( Form2 : TForm ) : String ;
Begin
End ;
Begin
Aux := '' ;
Pnt := 1 ;
For Local := 1 To 200 Do Begin
   Forms [ Local ] := Nil ;
End ;
Forms [ Pnt ] := Form1 ;
Repeat
   Dec ( Pnt ) ;
   For Local := 0 To Forms[Pnt+1].ComponentCount - 1 Do Begin
      If Forms[Pnt+1].Components[Local] Is TForm Then Begin
         Aux := Aux + Forms[Pnt+1].Components[Local].Name + LF ;
 {        Inc ( Pnt ) ;
         Forms[Pnt] := Forms[Pnt+1].Components[Local] As TTimer ;}
      End ;
    End ;
Until Pnt = 0 ;
ShowMessage ( 'Lista de Timers' + LFLF + Aux ) ;
End ;

Function COPIAR_LINHA_SG ( _SG : TStringGrid ; _Linha : LongInt ) : Boolean ;
{$IF NOT Defined(PROJETO_SETUP) AND NOT Defined(PROJETO_SERVICO)}
Var Local : LongInt ;
{$ENDIF}
Begin
_Debug ( 'INI COPIAR_LINHA_SG (Linha=' + IntToStr ( _Linha ) + ')' ) ;
Result := FALSE ;
If ( _Linha > ( _SG.RowCount - 1 ) ) OR
   ( _SG.ColCount = 0 ) OR
   ( _SG.RowCount < 2 ) OR
   ( _SG.Row < 0 ) Then Begin
   _Debug ( 'Exit 1 COPIAR_LINHA_SG' ) ;
   Exit ;
End ;
Result := TRUE ;
_Debug ( 'FIM COPIAR_LINHA_SG' ) ;
End ;

Function IS_DATAINVERSA ( _Str : String ) : Boolean ;
Begin
Result := FALSE ;
If Length ( _Str ) < 8 Then Begin
   Exit ;
End ;
_Str := Copy ( _Str , 1 , 8 ) ;
If ( NOT IS_ANO_FELIPE ( StrToIntDef ( Copy ( _Str , 1 , 4 ) , 0 ) ) ) OR
   ( NOT IS_MES ( StrToIntDef ( Copy ( _Str , 5 , 2 ) , 0 ) ) ) OR
   ( NOT IS_DIA ( StrToIntDef ( Copy ( _Str , 7 , 2 ) , 0 ) ) ) Then Begin
   Exit ;
End ;
Result := TRUE ;
End ;

Function IS_ANO_FELIPE ( _Ano : LongInt ) : Boolean ;
Begin
Result := ( _Ano >= 1999 ) AND ( _Ano <= 2099 ) ;
End ;

Function IS_MES ( _Mes : LongInt ) : Boolean ;
Begin
Result := ( _Mes >= 1 ) AND ( _Mes <= 12 ) ;
End ;

Function IS_DIA ( _Dia : LongInt ) : Boolean ;
Begin
Result := ( _Dia >= 1 ) AND ( _Dia <= 31 ) ;
End ;

Function FORCA_DATA ( _Aux : String ; Var _Result : String ) : TDateTime ;
Var _Mes : LongInt ;
Begin
_Debug ( 'INI FORCA_DATA "' + _Aux + '"' ) ;
_Aux := Trim ( _Aux ) ;
Result := -1 ;
_Result := _Aux + '@' ;
If Length ( _Aux ) = 0 Then Begin
   _Debug ( 'Exit 1 FORCA_DATA (Length=0)' ) ;
   Exit ;
End ;
While Pos ( '.' , _Aux ) <> 0 Do Begin
   _Aux [ Pos ( '.' , _Aux ) ] := '/' ;
End ;
While Pos ( '-' , _Aux ) <> 0 Do Begin
   _Aux [ Pos ( '-' , _Aux ) ] := '/' ;
End ;
While Pos ( '/' , _Aux ) = Length ( _Aux ) Do Begin
   Delete ( _Aux , Length ( _Aux ) , 1 ) ;
End ;
If Length ( _Aux ) = 0 Then Begin
   _Debug ( 'Exit 2 FORCA_DATA (Length=0)' ) ;
   Exit ;
End ;
If Pos ( '/' , _Aux ) = 2 Then Begin // Condicao = 1/2/3
   _Aux := '0' + _Aux ;
End ;
If Pos ( '/' , _Aux ) = 3 Then Begin
   _Aux [ 3 ] := '\' ;
End ;
If ( Pos ( '/' , _Aux ) = 0 ) Then Begin
   If Length ( _Aux ) = 4 Then Begin
      _Aux := Copy ( _Aux , 1 , 3 ) + '0' + _Aux [4] ;
   End ;
   If Length ( _Aux ) = 5 Then Begin
      _Mes := StrToIntDef ( Copy ( _Aux , 4 , 2 ) , 0 ) ;
      If _Mes = 0 Then
         _Aux := '' ;
      If ( MonthOf ( Now ) >= 10 ) AND
         ( _Mes <= 6 ) Then Begin
         _Aux := _Aux + '/' + StrZero ( YearOf ( Now ) + 1 , 4 )
      End Else Begin
         _Aux := _Aux + '/' + StrZero ( YearOf ( Now ) , 4 ) ;
      End ;
   End ;
End ;
If Pos ( '/' , _Aux ) = 5 Then Begin // Condicao = 01/2/3
   _Aux := Copy ( _Aux , 1 , 3 ) + '0' + Copy ( _Aux , 4 , Length ( _Aux ) ) ;
End ;
If Pos ( '/' , _Aux ) = 5 Then Begin // Condicao = 01/02/3
   _Aux := Copy ( _Aux , 1 , 3 ) + '0' + Copy ( _Aux , 4 , Length ( _Aux ) ) ;
End ;
If Length ( _Aux ) = 7 Then Begin // Condicao = 01/02/3
   _Aux := Copy ( _Aux , 1 , 6 ) + '200' + Copy ( _Aux , 7 , Length ( _Aux ) ) ;
End ;
If Length ( _Aux ) = 8 Then Begin // Condicao = 01/02/03
   _Aux := Copy ( _Aux , 1 , 6 ) + '20' + Copy ( _Aux , 7 , Length ( _Aux ) ) ;
End ;
While Pos ( '\' , _Aux ) <> 0 Do Begin
   _Aux [ Pos ( '\' , _Aux ) ] := '/' ;
End ;
If Length ( _Aux ) = 10 Then Begin
   Try
      Result := StrToDate ( _Aux ) ;
   Except
      Result := -1 ;
   End ;
End ;
_Result := _Result + _Aux ;
_Debug ( 'FIM FORCA_DATA' ) ;
End ;

Procedure FREE_SAFE ( Obj : TObject ) ;
Begin
Try
   If Assigned ( Obj ) Then Begin
      If ( UpperCase ( Obj.QualifiedClassName ) = 'TSTRINGLIST' ) OR
         ( UpperCase ( Obj.QualifiedClassName ) = 'SYSTEM.CLASSES.TSTRINGLIST' ) Then Begin
         (Obj AS TStringList).Free ;
         //Obj := Nil ;
      End Else Begin
         ShowMessage ( Obj.QualifiedClassName ) ;
      End ;
   End ;
Except
   ShowMessage ( 'Erro FREE_SAFE ' + Obj.QualifiedClassName ) ;
End ;
End ;

Procedure DESTROY_BASICO ;
Begin
_Debug ( 'INI DESTROY_BASICO' ) ;
Try
   _Debug ( '1 INI DESTROY_BASICO' ) ;
   PUT_CARREGANDO_SISTEMA ( 'Salvando Log Full/DESTROY_BASICO' ) ;
   SALVAR_LOG_FULL ( 'DESTROY_BASICO' ) ;
Except
   _Debug ( 'EXCEPTION DESTROY_BASICO' ) ;
End ;
FREE_SAFE ( xSL_Linhas_Debug ) ;
FREE_SAFE ( SL_Debug_Full ) ;
FREE_SAFE ( SL_DESCONSIDERAR_ARQUIVOS ) ;
FREE_SAFE ( SL_Carregando_Sistema ) ;
FREE_SAFE ( SL_Carregando_Sistema_Total ) ;
FREE_SAFE ( SL_Arqivos_CEF ) ;
FREE_SAFE ( SL_Arqivos_LibAV ) ;
FREE_SAFE ( SL_Lista_Geral ) ;
FREE_SAFE ( SL_Inibicao_Reload_FN ) ;
FREE_SAFE ( SL_HTTP ) ;
FREE_SAFE ( Logs ) ;
FREE_SAFE ( SL_Dicionario_MM ) ;
FREE_SAFE ( SL_Batch ) ;
FREE_SAFE ( SL_Ignorar_Monitoramento ) ;
_Debug ( 'FIM DESTROY_BASICO' ) ;
End ;

Function TEXTO_VERTICAL ( Str, Sufixo : String ) :String ;
Var Local : LongInt ;
Begin
Result := '' ;
If Str = '' Then Begin
   Exit ;
End ;
For Local := 1 To Length ( Str ) Do Begin
   Result := Result + Str[Local] + Sufixo ;
   If Local < Length ( Str ) Then Begin
      Result := Result + #13 ;
   End ;
End ;
End ;

Procedure PREPARAR_PN_PADRAO ( Var PN : TPainel ) ;
Begin
PN.StyleElements := [] ;
PN.ShowHint := TRUE ;
//
PN.ParentBackground := FALSE ;
PN.ParentBiDiMode := FALSE ;
PN.ParentColor := FALSE ;
PN.ParentCtl3D := FALSE ;
PN.ParentCustomHint := FALSE ;
PN.ParentDoubleBuffered := FALSE ;
PN.ParentFont := FALSE ;
PN.ParentShowHint := FALSE ;
//
PN.BevelOuter := bvNone ;
PN.DoubleBuffered := TRUE ;
PN.Caption := '' ;
PN.Visible := TRUE ;
End ;

Procedure PREPARAR_PN_PADRAO_2 ( Var PN : TPainel ) ;
Begin
PN.StyleElements := [] ;
PN.ShowHint := TRUE ;
//
PN.ParentBackground := FALSE ;
PN.ParentBiDiMode := FALSE ;
PN.ParentColor := FALSE ;
PN.ParentCtl3D := FALSE ;
PN.ParentCustomHint := FALSE ;
PN.ParentDoubleBuffered := FALSE ;
PN.ParentFont := FALSE ;
PN.ParentShowHint := FALSE ;
//
PN.BevelOuter := bvNone ;
PN.DoubleBuffered := TRUE ;
PN.Caption := '' ;
PN.Visible := TRUE ;
End ;

Procedure REMOVER_EXPRESSAO ( Var Texto : String ; Expressao : String ) ;
Begin
Texto := StringReplace ( Texto, Expressao , '*', [rfReplaceAll] ) ;
End ;

Function LIMPAR_LINHA ( Str : String ) : String ;
Begin
Str := Trim ( Str ) ;
Result := Str ;
If Str = '' Then Begin
   Exit ;
End ;
If ( Str[1] = '.' ) OR ( Str[1] = ',' ) Then Begin
   Delete(Str, 1, 1 ) ;
   Result := Trim ( Str ) ;
End ;
If Str = '' Then Begin
   Exit ;
End ;
Result := Trim ( Result ) ;
End ;

Function GET_FN_EXPRESSOES_SUBSTITUIDAS : String ;
Begin
Result := Diretorio + 'Config\Expressoes_Substituidas.txt' ;
End ;

Function GET_FN_EXPRESSOES_PROIBIDAS : String ;
Begin
Result := Diretorio + 'Config\Expressoes_Proibidas.txt' ;
End ;

Function GET_FN_LOG_SISTEMA : String ;
Begin
Result := Diretorio + 'Log_Sistema\' + DATA_INVERSA(Now) + '.txt' ;
//ShowMessage_Old ( Result ) ;
ForceDirectories ( ExtractFilePath ( Result ) ) ;
End ;

Procedure PUT_LOG_SISTEMA ( Str : String ) ;
Var Lista : TStringList ;
Begin
//ShowMessage ( GET_FN_LOG_SISTEMA ) ;
Lista := TStringList.Create ;
If RR_FileExists ( 'PUT_LOG_SISTEMA', GET_FN_LOG_SISTEMA ) Then Begin
   Lista.Text := GET_CONTEUDO_M ( 'PUT_LOG_SISTEMA', GET_FN_LOG_SISTEMA ) ;
End ;
Lista.Add ( DateTimeToStr(Now) + ' ' + Str ) ;
Try
   Lista.SaveToFile ( GET_FN_LOG_SISTEMA ) ;
Except
   On E : Exception Do Begin
      //PUT_LOG_LOCAL ( 'Exception PUT_LOG_SISTEMA/2 Save [' + E.Message + ']' ) ;
   End ;
End ;
Lista.Free ;
End ;

Function PREFIXO_EXENAME : String ;
Begin
Result := ExtractFileName ( Application.ExeName ) ;
Delete ( Result, Length ( Result ) - 3, 4 ) ;
End ;

Function GET_FN_CONFIG_PADRAO : String ;
//Var FN : String ;
Begin
Result := Diretorio + 'Config\Config.dat' ;
{
Result := Diretorio + 'Config\Config_' + PREFIXO_EXENAME + '.dat' ;
If NOT RR_FileExists ( 'GET FN_CONFIG_PADRAO/1', Result ) Then Begin
   PUT_LOG ( 'ARQUIVO CONFIG "' + Result + '" NÃO ENCONTRADO' ) ;
   FN := Diretorio + 'Config\Config.dat' ;
   If RR_FileExists ( 'GET FN_CONFIG_PADRAO/2', FN ) Then Begin
      PUT_LOG ( 'COPIANDO CONFIG.DAT ENCONTRADO' ) ;
      CopiaArquivo ( FN, Result, SOBREPOE ) ;
   End ;
End ;
}
End ;

Procedure SALVAR_STRING ( FN, Secao : String ; Key, Valor : String ) ;
Var Ini : TMemIniFile ;
Begin
//PUT_LOG ( 'SALVAR_STRING [' + Key + '][' + Valor + ']' ) ;
If FN = '' Then Begin
   FN := GET_FN_CONFIG_PADRAO ;
End ;
If Secao = '' Then Begin
   Secao := 'CONFIG' ;
End ;
CHECAR_DIRETORIO_FILENAME ( FN ) ;
Ini := TMemIniFile.Create ( FN ) ;
Ini.WriteString ( Secao, Key, Valor ) ;
Ini.UpdateFile ;
Ini.Free ;
End ;

Procedure SALVAR_INTEGER ( FN, Secao : String ; Key : String ; Valor : Int64 ) ;
Var Ini : TMemIniFile ;
Begin
//PUT_LOG ( 'SALVAR_INTEGER [' + Key + '][' + IntToStr(Valor) + ']' ) ;
If FN = '' Then Begin
   FN := GET_FN_CONFIG_PADRAO ;
End ;
If Secao = '' Then Begin
   Secao := 'CONFIG' ;
End ;
CHECAR_DIRETORIO_FILENAME ( FN ) ;
Ini := TMemIniFile.Create ( FN ) ;
Ini.WriteInteger ( Secao, Key, Valor ) ;
Ini.UpdateFile ;
Ini.Free ;
End ;

Procedure SALVAR_BOOLEAN ( FN, Secao : String ; Key : String ; Valor : Boolean ) ;
Var Ini : TMemIniFile ;
Begin
//PUT_LOG ( 'SALVAR_BOOLEAN [' + Key + '][' + IFSN(Valor) + ']' ) ;
If FN = '' Then Begin
   FN := GET_FN_CONFIG_PADRAO ;
End ;
If Secao = '' Then Begin
   Secao := 'CONFIG' ;
End ;
CHECAR_DIRETORIO_FILENAME ( FN ) ;
Ini := TMemIniFile.Create ( FN ) ;
Ini.WriteBool ( Secao, Key, Valor ) ;
Ini.UpdateFile ;
Ini.Free ;
End ;

Function CARREGAR_STRING ( FN, Secao : String ; Key, Default : String ) : String ;
Var Ini : TMemIniFile ;
Begin
If FN = '' Then Begin
   FN := GET_FN_CONFIG_PADRAO ;
End ;
If Secao = '' Then Begin
   Secao := 'CONFIG' ;
End ;
Ini := TMemIniFile.Create ( FN ) ;
Result := Ini.ReadString ( Secao, Key, Default ) ;
Ini.Free ;
//PUT_LOG ( 'CARREGAR_STRING [' + Key + '][' + Result + ']' ) ;
End ;

Function CARREGAR_BOOLEAN ( FN, Secao : String ; Key : String ; Default : Boolean ) : Boolean ;
Var Ini : TMemIniFile ;
Begin
If FN = '' Then Begin
   FN := GET_FN_CONFIG_PADRAO ;
End ;
If Secao = '' Then Begin
   Secao := 'CONFIG' ;
End ;
Ini := TMemIniFile.Create ( FN ) ;
Result := Ini.ReadBool ( Secao, Key, Default ) ;
Ini.Free ;
//PUT_LOG ( 'CARREGAR_BOOLEAN [' + Key + '][' + IFSN(Result) + ']' ) ;
End ;

Function CARREGAR_INTEGER ( FN, Secao : String ; Key : String ; Default : LongInt ) : Int64 ;
Var Ini : TMemIniFile ;
Begin
If FN = '' Then Begin
   FN := GET_FN_CONFIG_PADRAO ;
End ;
If Secao = '' Then Begin
   Secao := 'CONFIG' ;
End ;
Ini := TMemIniFile.Create ( FN ) ;
Result := Ini.ReadInteger ( Secao, Key, Default ) ;
Ini.Free ;
//PUT_LOG ( 'CARREGAR_INTEGER [' + Key + '][' + IntToStr(Result) + ']' ) ;
End ;

Function CORRECAO_CC ( Texto : String ) : String ;
//Var Local : LongInt ;
Begin
While Pos ( '\\', Texto ) > 0 Do Begin
   Texto := StringReplace ( Texto, '\\' , '\', [rfReplaceAll] ) ;
End ;
While Pos ( '\ ', Texto ) > 0 Do Begin
   Texto := StringReplace ( Texto, '\ ' , '\', [rfReplaceAll] ) ;
End ;
While Pos ( ' \', Texto ) > 0 Do Begin
   Texto := StringReplace ( Texto, ' \' , '\', [rfReplaceAll] ) ;
End ;
If ( Pos ( 'MAS', Texto ) > 1 ) Then Begin
   Texto := StringReplace ( Texto, ' MAS' , ', MAS', [rfReplaceAll] ) ;
End ;
If ( Pos ( 'PORÉM', Texto ) > 1 ) AND
   ( Pos ( ', PORÉM', Texto ) = 0 ) Then Begin
   Texto := StringReplace ( Texto, ' PORÉM' , ', PORÉM', [rfReplaceAll] ) ;
End ;
REMOVER_EXPRESSAO ( Texto, 'BOSTA' ) ;
REMOVER_EXPRESSAO ( Texto, 'PORRA' ) ;
REMOVER_EXPRESSAO ( Texto, 'CARALHO' ) ;
REMOVER_EXPRESSAO ( Texto, 'BAITOLA' ) ;
REMOVER_EXPRESSAO ( Texto, ' CU ' ) ;
REMOVER_EXPRESSAO ( Texto, ' CÚ ' ) ;
REMOVER_EXPRESSAO ( Texto, ' SEIO ' ) ;
REMOVER_EXPRESSAO ( Texto, 'VAGINA' ) ;
REMOVER_EXPRESSAO ( Texto, 'PENIS' ) ;
REMOVER_EXPRESSAO ( Texto, 'PÊNIS' ) ;
REMOVER_EXPRESSAO ( Texto, 'CACETE' ) ;
REMOVER_EXPRESSAO ( Texto, ' VIADO' ) ;
REMOVER_EXPRESSAO ( Texto, 'SAPATAO' ) ;
REMOVER_EXPRESSAO ( Texto, 'SAPATÃO' ) ;
REMOVER_EXPRESSAO ( Texto, 'PRIQUITO' ) ;
REMOVER_EXPRESSAO ( Texto, 'PERIQUITA' ) ;
REMOVER_EXPRESSAO ( Texto, 'FIO-TERRA' ) ;
REMOVER_EXPRESSAO ( Texto, 'FIO TERRA' ) ;
REMOVER_EXPRESSAO ( Texto, 'JAQUEIRA' ) ;
REMOVER_EXPRESSAO ( Texto, 'TREPAR' ) ;
REMOVER_EXPRESSAO ( Texto, 'TRAPADEIRA' ) ;
REMOVER_EXPRESSAO ( Texto, 'PUTARIA' ) ;
REMOVER_EXPRESSAO ( Texto, 'PUTEIRO' ) ;
REMOVER_EXPRESSAO ( Texto, 'CABARE' ) ;
REMOVER_EXPRESSAO ( Texto, 'CABARÉ' ) ;
REMOVER_EXPRESSAO ( Texto, 'DELICIA' ) ;
REMOVER_EXPRESSAO ( Texto, 'DELÍCIA' ) ;
REMOVER_EXPRESSAO ( Texto, 'PUTA QUE PARIU' ) ;
REMOVER_EXPRESSAO ( Texto, 'PQP' ) ;
REMOVER_EXPRESSAO ( Texto, 'SACANAGEM' ) ;
REMOVER_EXPRESSAO ( Texto, 'FULERAGEM' ) ;
REMOVER_EXPRESSAO ( Texto, 'FULEIRAGEM' ) ;
REMOVER_EXPRESSAO ( Texto, 'VAGABUNDOS' ) ;
REMOVER_EXPRESSAO ( Texto, 'VAGABUNDAS' ) ;
REMOVER_EXPRESSAO ( Texto, 'VAGABUNDO' ) ;
REMOVER_EXPRESSAO ( Texto, 'VAGABUNDA' ) ;
REMOVER_EXPRESSAO ( Texto, 'FODER ' ) ;
REMOVER_EXPRESSAO ( Texto, 'FUDER ' ) ;
REMOVER_EXPRESSAO ( Texto, 'FODIDO ' ) ;
REMOVER_EXPRESSAO ( Texto, 'FODIDA ' ) ;
REMOVER_EXPRESSAO ( Texto, 'FUDIDO ' ) ;
REMOVER_EXPRESSAO ( Texto, 'FUDIDA ' ) ;
REMOVER_EXPRESSAO ( Texto, 'FIOFO' ) ;
REMOVER_EXPRESSAO ( Texto, 'FIOFÓ' ) ;
REMOVER_EXPRESSAO ( Texto, 'BOGA' ) ;
REMOVER_EXPRESSAO ( Texto, 'RAPARIGA' ) ;
REMOVER_EXPRESSAO ( Texto, ' PICA ' ) ;
REMOVER_EXPRESSAO ( Texto, 'URINAR' ) ;
REMOVER_EXPRESSAO ( Texto, 'URINA' ) ;
REMOVER_EXPRESSAO ( Texto, ' BUNDA' ) ;
REMOVER_EXPRESSAO ( Texto, ' ALISADOR' ) ;
REMOVER_EXPRESSAO ( Texto, 'GOOGLE' ) ;
REMOVER_EXPRESSAO ( Texto, 'YOUTUBE' ) ;
REMOVER_EXPRESSAO ( Texto, 'MERDA' ) ;
Texto := StringReplace ( Texto, ' MODESTIAPARTE ' , ' MODÉSTIA A PARTE ', [rfReplaceAll] ) ;
Texto := StringReplace ( Texto, ' ARROBA ' , '@', [rfReplaceAll] ) ;
Texto := StringReplace ( Texto, 'SÉRIO CENI' , 'ROGÉRIO CENI', [rfReplaceAll] ) ;
Texto := StringReplace ( Texto, ' LEIDE ' , ' LADY ', [rfReplaceAll] ) ;
Texto := StringReplace ( Texto, 'RUMO LESSA' , 'VAMO LESSA', [rfReplaceAll] ) ;
Texto := StringReplace ( Texto, 'MODA AÍ' , 'RODA AÍ', [rfReplaceAll] ) ;
Texto := StringReplace ( Texto, 'MAS A DE TODA' , 'MAS APESAR DE TODA', [rfReplaceAll] ) ;
Texto := StringReplace ( Texto, 'VAMOS LESSA' , 'VAMO LESSA', [rfReplaceAll] ) ;
Texto := StringReplace ( Texto, ' SÃO PROVA ' , ' Só PROVA ', [rfReplaceAll] ) ;
Texto := StringReplace ( Texto, ' TÉCNICO POLÍCIA ' , ' TÉCNICO LISCA ', [rfReplaceAll] ) ;
Texto := StringReplace ( Texto, ' ZÉBIO ' , ' EUSÉBIO ', [rfReplaceAll] ) ;
Texto := StringReplace ( Texto, ' UVA NISIUS ' , ' VINÍCIUS ', [rfReplaceAll] ) ;
Texto := StringReplace ( Texto, ' OZÉBIO ' , ' EUSÉBIO ', [rfReplaceAll] ) ;
Texto := StringReplace ( Texto, 'PECADORA' , 'TELESPECTADORA', [rfReplaceAll] ) ;
Texto := StringReplace ( Texto, 'MUNDO BITA' , 'MONDUBIM', [rfReplaceAll] ) ;
Texto := StringReplace ( Texto, 'PECADOR' , 'TELESPECTADOR', [rfReplaceAll] ) ;
Texto := StringReplace ( Texto, ' ZEBE ' , ' EUSÉBIO ', [rfReplaceAll] ) ;
Texto := StringReplace ( Texto, ' PONTO COM PONTO BR ' , '.COM.BR ', [rfReplaceAll] ) ;
Texto := StringReplace ( Texto, ' PONTO COM ' , '.COM', [rfReplaceAll] ) ;
Texto := StringReplace ( Texto, 'SÁ DATA' , 'SADAT', [rfReplaceAll] ) ;
Texto := StringReplace ( Texto, 'INCLUSIVE ' , 'INCLUSIVE, ', [rfReplaceAll] ) ;
Texto := StringReplace ( Texto, 'OU SEJA ' , 'OU SEJA, ', [rfReplaceAll] ) ;
Texto := StringReplace ( Texto, 'PAULO SADAO' , 'PAULO SADAT', [rfReplaceAll] ) ;
Texto := StringReplace ( Texto, 'PAULO SÓ DÁ' , 'PAULO SADAT', [rfReplaceAll] ) ;
Texto := StringReplace ( Texto, 'NAO TEVE FAZER' , 'NAO DEVE FAZER', [rfReplaceAll] ) ;
Texto := StringReplace ( Texto, 'CURTINDO AO DESVIAR' , 'COLIDINDO AO DESVIAR', [rfReplaceAll] ) ;
Texto := StringReplace ( Texto, 'CURTINDO AO TENTAR DESVIAR' , 'COLIDINDO AO TENTAR DESVIAR', [rfReplaceAll] ) ;
Texto := StringReplace ( Texto, 'PRÓTON COLADOS' , 'PROTOCOLADOS', [rfReplaceAll] ) ;
Texto := StringReplace ( Texto, 'PRÓTON COLADO' , 'PROTOCOLADO', [rfReplaceAll] ) ;
Texto := StringReplace ( Texto, 'POR NÓS TELESPECTADORES' , 'POR NÓS PECADORES', [rfReplaceAll] ) ;
Texto := StringReplace ( Texto, 'CORPOS SEGURANÇA' , 'CORPVS SEGURANÇA', [rfReplaceAll] ) ;
Texto := StringReplace ( Texto, 'DA CORPOS' , 'DA CORPVS', [rfReplaceAll] ) ;
Texto := StringReplace ( Texto, ' A CORPOS' , ' A CORPVS', [rfReplaceAll] ) ;
Texto := StringReplace ( Texto, 'RASTREAMENTO CORPOS' , 'RASTREAMENTO CORPVS', [rfReplaceAll] ) ;
Texto := StringReplace ( Texto, 'CORPOS RASTREAMENTO' , 'CORPVS RASTREANENTO', [rfReplaceAll] ) ;
Texto := StringReplace ( Texto, 'ESTILOS DE PISTOLA ' , 'TIROS DE PISTOLA', [rfReplaceAll] ) ;
Texto := StringReplace ( Texto, ' 5990 ' , '59,90', [rfReplaceAll] ) ;
Texto := StringReplace ( Texto, ' 1010 ' , ' 2010 ', [rfReplaceAll] ) ;
Texto := StringReplace ( Texto, ' 1011 ' , ' 2011 ', [rfReplaceAll] ) ;
Texto := StringReplace ( Texto, ' 1012 ' , ' 2012 ', [rfReplaceAll] ) ;
Texto := StringReplace ( Texto, ' 1013 ' , ' 2013 ', [rfReplaceAll] ) ;
Texto := StringReplace ( Texto, ' 1014 ' , ' 2014 ', [rfReplaceAll] ) ;
Texto := StringReplace ( Texto, ' 1015 ' , ' 2015 ', [rfReplaceAll] ) ;
Texto := StringReplace ( Texto, ' 1016 ' , ' 2016 ', [rfReplaceAll] ) ;
Texto := StringReplace ( Texto, ' 1017 ' , ' 2017 ', [rfReplaceAll] ) ;
Texto := StringReplace ( Texto, ' 1018 ' , ' 2018 ', [rfReplaceAll] ) ;
Texto := StringReplace ( Texto, ' 1019 ' , ' 2019 ', [rfReplaceAll] ) ;
Texto := StringReplace ( Texto, ' 1020 ' , ' 2020 ', [rfReplaceAll] ) ;
Texto := StringReplace ( Texto, ' 1021 ' , ' 2021 ', [rfReplaceAll] ) ;
Texto := StringReplace ( Texto, ' 1022 ' , ' 2022 ', [rfReplaceAll] ) ;
Texto := StringReplace ( Texto, ' 1023 ' , ' 2023 ', [rfReplaceAll] ) ;
Texto := StringReplace ( Texto, ' 1024 ' , ' 2024 ', [rfReplaceAll] ) ;
Texto := StringReplace ( Texto, ' 1025 ' , ' 2025 ', [rfReplaceAll] ) ;
Texto := StringReplace ( Texto, 'DISTRIBUIÇÃO É MILÍCIA', 'DISTRIBUIÇÃO MCA', [rfReplaceAll] ) ;
Texto := StringReplace ( Texto, ' BEM QUANDO ' , ' NEM QUANDO ', [rfReplaceAll] ) ;
Texto := StringReplace ( Texto, ' PERGUNTO ' , ' PERGUNTO: ', [rfReplaceAll] ) ;
Texto := StringReplace ( Texto, ' BOLEIRO' , ' MOLEIRO', [rfReplaceAll] ) ;
Texto := StringReplace ( Texto, ' ITATINGA' , ' ITAITINGA', [rfReplaceAll] ) ;
Texto := StringReplace ( Texto, ' RIMAR DE VEÍCULOS' , ', RIMAG VEÍCULOS', [rfReplaceAll] ) ;
Texto := StringReplace ( Texto, ' DE REPENTE ' , ', DE REPENTE, ', [rfReplaceAll] ) ;
//Texto := StringReplace ( Texto, ' VIU.' , ' VIU? ', [rfReplaceAll] ) ;
Texto := StringReplace ( Texto, ' HEIN ' , ', HEIN? ', [rfReplaceAll] ) ;
Texto := StringReplace ( Texto, ' NÉ' , ', NÉ? ', [rfReplaceAll] ) ;
Texto := Trim ( Texto ) ;
Texto := StringReplace ( Texto, '.', '.' + #13, [rfReplaceAll] ) ;
Texto := StringReplace ( Texto, #13#13, #13, [rfReplaceAll] ) ;
While Pos ( ',,', Texto ) > 0 Do Begin
   Texto := StringReplace ( Texto, ',,' , ',', [rfReplaceAll] ) ;
End ;
While Pos ( '..', Texto ) > 0 Do Begin
   Texto := StringReplace ( Texto, '..' , '.', [rfReplaceAll] ) ;
End ;
While Pos ( '**', Texto ) > 0 Do Begin
   Texto := StringReplace ( Texto, '**' , '*', [rfReplaceAll] ) ;
End ;
While Pos ( #32#32, Texto ) > 0 Do Begin
   Texto := StringReplace ( Texto, #32#32 , #32, [rfReplaceAll] ) ;
End ;
Result := Texto ;
End ;

Procedure ADD_EVENTO_HTTP ( Evento : LongInt ; Evento_Str, Texto : String ) ;
Begin
SL_HTTP.Add ( IntToStr(Evento) + '@@@' + Texto + '@@@' +
              DateTimeToStr(Now) + '@@@' + Evento_Str ) ;
End ;

Function PROC_GET_HTTP ( URL : String ; Var Erro : LongInt ) : String ;
Var lHTTP : TIdHTTP ;
Begin
Erro := 1 ;
Try
   lHTTP := TIdHTTP.Create ;
Except
   On E : Exception Do Begin
      Erro := 2 ;
      //PUT_LOG_LOCAL ( 'Exception/1 PROC_GET_HTTP [' + E.Message + ']' ) ;
      PUT_LOG_SISTEMA ( 'Exception/1 PROC_GET_HTTP [' + E.Message + ']' ) ;
      Exit ;
   End ;
End ;
Try
   //PUT_LOG_LOCAL ( 'URL [' + URL + ']' ) ;
   Result := lHTTP.Get(URL) ;
   Erro := 0 ;
Except
   On E : Exception Do Begin
      Erro := 3 ;
      //PUT_LOG_LOCAL ( 'Exception/2 PROC_GET_HTTP [' + E.Message + ']' ) ;
      PUT_LOG_SISTEMA ( 'Exception/2 PROC_GET_HTTP [' + E.Message + ']' ) ;
   End ;
End;
Try
   lHTTP.Free ;
Except
End ;
End ;

Function MONTAR_URL_CC ( Evento : LongInt ; Aux : String ;
                         DT : TDateTime ; Evento_Str : String ) : String ;
Begin
Result := 'http://www.rabelorastreamento.com.br/lib/r_add_cc.php?' +
          '&servidor=' + IntToStr ( Setup_Servidor ) +
          '&evento=' + IntToStr ( Evento ) +
          '&evento_str=' + Evento_Str +
          '&indice=' + IntToStr ( Indice_HTTP ) +
          '&now=' + String_To_Hexa ( DateTimeToStr ( DT ) ) +
          '&texto=' + String_To_Hexa ( Aux ) ;
Inc ( Indice_HTTP ) ;
End ;

Procedure GRAVAR_URL ( URL : String ) ;
Var FN : String ;
Begin
Inc ( Indice_Geral ) ;
FN := Diretorio + 'Config\URL_NOK\' + DATAHORA_INVERSA(Now) + '_' + StrZero(Indice_Geral,6) + '.DAT' ;
CHECAR_DIRETORIO_FILENAME ( FN ) ;
WRITE_FILE_CORE ( 'GRAVAR URL', FN, URL, DELAYED_FALSE ) ;
End ;

Function VERIFICAR_SL_HTTP : LongInt ;
Var Qtde       : LongInt ;
    Local      : LongInt ;
    Aux        : String ;
    Lista      : TStringList ;
    Retorno    : String ;
    Evento     : LongInt ;
    Evento_Str : String ;
    Texto      : String ;
    Erro       : LongInt ;
    DT         : TDateTime ;
    URL        : String ;
Begin
Result := 0 ;
//PUT_LOG ( 'VERIFICAR SL HTTP' ) ;
Qtde := SL_HTTP.Count ;
If Qtde = 0 Then Begin
   Exit ;
End ;
Lista := TStringList.Create ;
Try
   For Local := 0 To Qtde - 1 Do Begin
      Aux := SL_HTTP[0] ;
      SL_HTTP.Delete(0) ;
      Lista := Explode_Simples ( Aux, '@@@' ) ;
      //PUT_LOG_LOCAL ( 'HTTP EXPLODE [' + Aux + '][Qtde=' + IntToStr(Lista.Count) + ']' ) ;
      If Lista.Count < 4 Then Begin
         //PUT_LOG_LOCAL ( 'HTTP NAO OK/1 [' + Aux + ']' ) ;
         Continue ;
      End ;
      Evento := StrToIntDef ( Lista[0], 0 ) ;
      Texto := Lista[1] ;
      DT := StrToDateTime ( Lista[2] ) ;
      Evento_Str := Lista[3] ;
      URL := MONTAR_URL_CC ( Evento, Texto, DT, Evento_Str ) ;
      Retorno := Trim ( PROC_GET_HTTP ( URL, Erro ) ) ;
      If Erro > 0 Then Begin
         PUT_LOG ( 'ERRO [' + IntToStr ( Erro ) + '] GET HTTP URL[' + URL + ']' ) ;
         Result := 1000 + Erro ;
         GRAVAR_URL ( URL ) ;
         Exit ;
      End ;
      If Retorno <> '' Then Begin
         //PUT_LOG_LOCAL ( 'HTTP OK [' + Retorno + ']' ) ;
      End Else Begin
         //PUT_LOG_LOCAL ( 'HTTP NAO OK IDX (Qtde=' + IntToStr(SL_HTTP.Count) + ')' ) ;
      End ;
      If Local = 10 Then Begin
         Break ;
      End ;
   End ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception VERIFICAR_SL_HTTP [' + E.Message + ']' ) ;
   End ;
End ;
Lista.Free ;
End ;

Procedure SALVAR_PROPRIEDADES ( FileName, Chave, Valor : String ) ;
Var Lista : TStringList ;
Begin
CHECAR_DIRETORIO_FILENAME ( FileName ) ;
Lista := TStringList.Create ;
Lista.Clear ;
If RR_FileExists ( 'SALVAR PROPRIEDADES', FileName ) Then Begin
   Lista.Text := GET_CONTEUDO_M ( 'SALVAR PROPRIEDADES', FileName ) ;
End ;
Lista.Values[Chave] := Valor ;
{
PUT_LOG ( 'FN [' + FileName + ']' + LFLF +
         'Chave [' + Chave + ']' + LF +
         'Valor [' + Valor + ']' + LF +
         'Texto [' + Lista.Text + ']') ;
}
Try
   WRITE_FILE_CORE ( 'SALVAR_PROPRIEDADES',
                     FileName, Lista.Text, DELAYED_FALSE ) ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception SALVAR_PROPRIEDADES/2 [' + FileName + '][' + E.Message + ']' ) ;
   End ;
End ;
Lista.Free ;
End ;

Function Hora ( THora : TDateTime ) : LongInt ;
Begin
Result := HourOf ( THora ) ;
End ;

Function Minuto ( Hora : TDateTime ) : LongInt ;
Begin
Result := MinuteOf ( Hora ) ;
End ;

Function Segundo ( Hora : TDateTime ) : LongInt ;
Begin
Result := SecondOf ( Hora ) ;
End ;

Function  Dia ( Data : TDateTime ) : LongInt ;
Begin
Result := DayOf ( Data ) ;
End ;

Function  Mes ( Data : TDateTime ) : LongInt ;
Begin
Result := MonthOf ( Data ) ;
End ;

Function  Ano ( Data : TDateTime ) : LongInt ;
Begin
Result := YearOf ( Data ) ;
End ;

Function GET_FN_CONFIGURACAO : String ;
Begin
Result := INSERE_BARRA ( ExtractFilePath ( Application.ExeName ) ) +
          'config\config.dat' ;
CHECAR_DIRETORIO_FILENAME ( Result ) ;
End ;

Procedure INICIALIZAR_REGISTRO_CHYRON ( Var Reg :  T_Registro_Chyron ) ;
Begin
With Reg Do Begin
  Tag := '' ;
  Msg := '' ;
  Qtde := 0 ;
  SetLength ( Lista, 0 ) ;
End ;
End ;

Procedure PUT_LISTA_REGISTRO_CHYRON ( Var Reg : T_REgistro_Chyron ; Str :  String ) ;
Var Qtde : LongInt ;
Begin
Qtde := Length ( Reg.Lista ) ;
SetLength ( Reg.Lista, Qtde + 1 ) ;
Reg.Lista[Qtde] := Str ;
//PUT_LOG ( 'ADD REG, [' + IntToStr(Qtde)+ '] = [' + Str + ']' ) ;
End ;

Function TEXT_TO_VB ( Txt : String ) : String ;
Var Lista : TStringList ;
    Local : LongInt ;
    Qtde  : LongInt ;
Begin
Txt := Trim ( Txt ) ;
Result := '' ;
If Txt = '' Then Begin
   Exit ;
End ;
Lista := TStringList.Create ;
Lista.Text := Txt ;
Qtde := Lista.Count ;
For Local := 0 To Qtde - 1 Do Begin
   If Local < ( Qtde - 1 ) Then Begin
      Result := Result + {Trim} ( Lista[Local] ) + '~'
   End Else Begin
      Result := Result + {Trim} ( Lista[Local] ) ;
   End ;
End ;
Lista.Free ;
End ;

Function FN_CONFIG_CHYRON : String ;
Begin
Result := Diretorio + 'config\config_chyron.txt' ;
End ;

Procedure CARREGAR_CONFIG_CHYRON ;
Var Ini : TMemIniFile ;
Begin
CHECAR_DIRETORIO_FILENAME ( FN_CONFIG_CHYRON ) ;
Ini := TMemIniFile.Create ( FN_CONFIG_CHYRON ) ;
PUT_LOG ( 'CARREGAR_CONFIG_CHYRON [' + FN_CONFIG_CHYRON + ']' ) ;
Config_Chyron.Wait_Frames_Effect_Out := Ini.ReadInteger ( 'CHYRON', 'WAIT_FRAMES_EFFECT_OUT', 12 ) ;
//Ini.WriteInteger ( 'CHYRON', 'WAIT_FRAMES_EFFECT_OUT', Config_Chyron.Wait_Frames_Effect_Out ) ;
//Ini.UpdateFile ;
Ini.Free ;
PUT_LOG ( 'CARREGAR_CONFIG_CHYRON [WAIT_FRAMES_EFFECT_OUT]' +
          '[' + IntToStr(Config_Chyron.Wait_Frames_Effect_Out) + ']' ) ;
End ;

Function PELO_DICIONARIO ( Aux : String ; Var HistDic : String ) : String ;
Var Local     : LongInt ;
    Qtde      : LongInt ;
    Aux_Old   : String ;
    Contador  : LongInt ;
Begin
_Debug ( 'INI PELO_DICIONARIO [' + Aux + ']' ) ;
Qtde := SL_Dicionario_MM.Count ;
If Qtde = 0 Then Begin
   _Debug ( 'EXIT !Qtde PELO_DICIONARIO' ) ;
   Exit ;
End ;
Contador :=  0 ;
For Local := 0 To Qtde - 1 Do Begin
   Aux_Old := Aux ;
   Aux := StringReplace ( Aux,
                          Trim(SL_Dicionario_MM[Local]),
                          Trim(SL_Dicionario_MM[Local]),
                          [rfIgnoreCase, rfReplaceAll] ) ;
   If Aux <> Aux_Old Then Begin
      Inc ( Contador ) ;
      If HistDic <> '' Then Begin
         HistDic := HistDic + sLineBreak ;
      End ;
      HistDic := HistDic + SL_Dicionario_MM[Local] ;
      _Debug ( 'SUBST ' + IntToStr(Contador) + ' ' +
               'Key[' + Trim(SL_Dicionario_MM[Local]) + '] ' +
               '[' + Aux_Old + ']==>[' + Aux + ']' ) ;
   End ;
End ;
_Debug ( 'FIM PELO DICIONARIO [' + Aux + '] Cnt[' + IntToStr(Contador) + ']'  ) ;
Result := Aux ;
End ;

Function LINHA_CURSOR_MEMO ( ME : TMemo ) : LongInt ;
Begin
Result := ME.Perform(EM_LINEFROMCHAR, ME.SelStart,0) ;
End ;

Function LINHA_CURSOR_RE ( RE : TRichEdit ) : LongInt ;
Begin
Result := RE.Perform(EM_LINEFROMCHAR, RE.SelStart,0) ;
End ;

Function LINHA_CURSOR_RE_MY ( RE : TMyRichEdit ) : LongInt ;
Begin
Result := RE.Perform(EM_LINEFROMCHAR, RE.SelStart,0) ;
End ;

Function COLUNA_CURSOR_MEMO ( ME : TMemo ) : LongInt ;
Var Linha : LongInt ;
Begin
Linha := LINHA_CURSOR_MEMO(ME) ;
Result := ME.SelStart - ME.Perform(EM_LINEINDEX, Linha, 0) ;
End ;

Function GET_FULL_PARENT ( Obj : TWinControl ) : String ;
Begin
Result := '' ;
//ShowMessage ( Obj.Name ) ;
While Assigned ( Obj.Parent ) Do Begin
   //If Result <> '' Then
   //   Result := Result + '.' ;
   Result := Obj.Parent.Name + '.' + Result ;
   Obj := Obj.Parent ;
End ;
If Result <> '' Then Begin
   If Result[Length(Result)] = '.' Then Begin
      Delete ( Result, Length(Result), 1 ) ;
   End ;
End ;
End ;

Function SETAR_ITEM_CB ( Var CB : TComboBox ; Str : String ; _Add : Boolean ) : LongInt ;
//Var Local : LongInt ;
Begin
Result := -1 ;
If NOT Assigned ( CB ) Then Begin
   Exit ;
End ;
If CB.Items.Count = 0 Then Begin
   Exit ;
End ;
Result := CB.Items.IndexOf ( Str ) ;
If ( Result = -1 ) AND ( _Add ) Then Begin
   CB.Items.Add ( Str ) ;
   Result := CB.Items.IndexOf ( Str ) ;
End ;
CB.ItemIndex := Result ;
End ;

Procedure PN_PADRAO ( Var PN : TPanel ) ;
Begin
PN.ParentBackground := FALSE ;
PN.ParentBiDiMode := FALSE ;
PN.ParentColor := FALSE ;
PN.ParentCtl3D := FALSE ;
PN.ParentCustomHint := FALSE ;
PN.ParentDoubleBuffered := FALSE ;
PN.ParentFont := FALSE ;
PN.ParentShowHint := FALSE ;
PN.StyleElements := [] ;
End ;

Procedure RE_MY_PADRAO ( Var RE : TMyRichEdit ) ;
Begin
RE.ParentBiDiMode := FALSE ;
RE.ParentColor := FALSE ;
RE.ParentCtl3D := FALSE ;
RE.ParentCustomHint := FALSE ;
RE.ParentFont := FALSE ;
RE.ParentShowHint := FALSE ;
RE.StyleElements := [] ;
End ;

Procedure RE_PADRAO ( Var RE : TRichEdit ) ;
Begin
RE.ParentBiDiMode := FALSE ;
RE.ParentColor := FALSE ;
RE.ParentCtl3D := FALSE ;
RE.ParentCustomHint := FALSE ;
RE.ParentFont := FALSE ;
RE.ParentShowHint := FALSE ;
RE.StyleElements := [] ;
End ;

(*
Procedure RXCLOCK_PADRAO ( Var PN : TRxClock ) ;
Begin
PN.ParentColor := FALSE ;
PN.ParentCtl3D := FALSE ;
PN.ParentCustomHint := FALSE ;
PN.ParentFont := FALSE ;
PN.ParentShowHint := FALSE ;
PN.StyleElements := [] ;
End ;
*)

Procedure BOT_PADRAO ( Var BOT : TButton ) ;
Begin
BOT.ParentBiDiMode := FALSE ;
BOT.ParentCustomHint := FALSE ;
BOT.ParentDoubleBuffered := FALSE ;
BOT.ParentFont := FALSE ;
BOT.ParentShowHint := FALSE ;
BOT.StyleElements := [] ;
End ;

(*
Procedure BOT_RX_PADRAO ( Var BOT : TRxSpeedButton ) ;
Begin
BOT.ParentBiDiMode := FALSE ;
BOT.ParentCustomHint := FALSE ;
BOT.ParentFont := FALSE ;
BOT.ParentShowHint := FALSE ;
BOT.StyleElements := [] ;
End ;
*)

Procedure CK_PADRAO ( Var CK : TCheckBox ) ;
Begin
CK.ParentBiDiMode := FALSE ;
CK.ParentColor := FALSE ;
CK.ParentCtl3D := FALSE ;
CK.ParentCustomHint := FALSE ;
CK.ParentDoubleBuffered := FALSE ;
CK.ParentFont := FALSE ;
CK.ParentShowHint := FALSE ;
CK.StyleElements := [] ;
End ;

Procedure EDT_PADRAO ( Var ED : TTransEdit ) ;
Begin
ED.ParentColor := FALSE ;
ED.ParentFont := FALSE ;
ED.ParentShowHint := FALSE ;
ED.ParentCustomHint := FALSE ;
ED.ParentDoubleBuffered := FALSE ;
ED.ParentCtl3D := FALSE ;
ED.ParentBiDiMode := FALSE ;
End ;

Procedure MEMO_PADRAO ( Var MEMO : TMemo ) ;
Begin
MEMO.ParentBiDiMode := FALSE ;
MEMO.ParentColor := FALSE ;
MEMO.ParentCtl3D := FALSE ;
MEMO.ParentCustomHint := FALSE ;
MEMO.ParentDoubleBuffered := FALSE ;
MEMO.ParentFont := FALSE ;
MEMO.ParentShowHint := FALSE ;
MEMO.StyleElements := [] ;
End ;

Procedure EDIT_PADRAO ( Var ED : TEdit ) ;
Begin
ED.ParentBiDiMode := FALSE ;
ED.ParentColor := FALSE ;
ED.ParentCtl3D := FALSE ;
ED.ParentCustomHint := FALSE ;
ED.ParentDoubleBuffered := FALSE ;
ED.ParentFont := FALSE ;
ED.ParentShowHint := FALSE ;
ED.StyleElements := [] ;
End ;

Procedure MASKEDIT_PADRAO ( Var ED : TMaskEdit ) ;
Begin
ED.ParentBiDiMode := FALSE ;
ED.ParentColor := FALSE ;
ED.ParentCtl3D := FALSE ;
ED.ParentCustomHint := FALSE ;
ED.ParentDoubleBuffered := FALSE ;
ED.ParentFont := FALSE ;
ED.ParentShowHint := FALSE ;
ED.StyleElements := [] ;
End ;

Procedure LABEL_PADRAO ( Var ED : TLabel ) ;
Begin
ED.ParentBiDiMode := FALSE ;
ED.ParentColor := FALSE ;
ED.ParentCustomHint := FALSE ;
ED.ParentFont := FALSE ;
ED.ParentShowHint := FALSE ;
ED.StyleElements := [] ;
End ;

Procedure IM_PADRAO ( Var IM : TImage ) ;
Begin
IM.ParentCustomHint := FALSE ;
IM.ParentShowHint := FALSE ;
IM.StyleElements := [] ;
End ;

Function GET_COLOR_STR ( _Str : String ) : TColor ;
Var Lista : TStringList ;
Begin
_Str := UpperCase ( StringReplace ( _Str, ' ', '', [rfReplaceAll] ) ) ;
If _Str = '' Then Begin
   Result := 0 ;
   Exit  ;
End ;
If _Str[1] = '$' Then Begin
   Result := StrToIntDef ( _Str, 0 ) ;
   Exit  ;
End ;
If Pos ( 'RGB', _Str) = 1 Then Begin
   _Str := StringReplace ( _Str, 'RGB', '', [rfReplaceAll] ) ;
   _Str := StringReplace ( _Str, ';', ',', [rfReplaceAll] ) ;
   _Str := StringReplace ( _Str, '/', ',', [rfReplaceAll] ) ;
   _Str := StringReplace ( _Str, '-', ',', [rfReplaceAll] ) ;
   _Str := StringReplace ( _Str, '(', '', [rfReplaceAll] ) ;
   _Str := StringReplace ( _Str, ')', '', [rfReplaceAll] ) ;
   Lista := EXPLODE_SIMPLES ( _Str, ',' ) ;
   If Lista.Count < 3 Then Begin
      Result := 0 ;
      Exit ;
   End ;
   Result := RGB ( StrToIntDef(Lista[0],0), StrToIntDef(Lista[1],0), StrToIntDef(Lista[2],0) ) ;
   Lista.Free ;
   Exit  ;
End ;
Result := 0 ;
End ;

Function EXTRACT_FN_INTEGER ( FN : String ; _Default : LongInt ) : LongInt ;
Begin
FN := ExtractFileName ( FN ) ;
While Pos ( '.', FN ) > 0 Do Begin
   Delete ( FN, Length(FN), 1 ) ;
End ;
Result := StrToIntDef ( FN, _Default ) ;
End ;

Function GET_PENULTIMO_DIRETORIO ( FN : String ) : String ;
Var Lista : TStringList ;
Begin
Result := '' ;
FN := StringReplace ( FN, '/', '\', [rfReplaceAll] ) ;
Lista := TStringList.Create ;
EXPLODE_RR ( '\', FN, Lista ) ;
If Lista.Count > 1 Then Begin
   Result := Lista[Lista.Count-2] ;
End ;
//PUT_LOG ( 'IMPLODE [' + IMPLODE(',', Lista ) + ']' ) ;
Lista.Free ;
End ;

Function GET_ANTEPENULTIMO_DIRETORIO ( FN : String ) : String ;
Var Lista : TStringList ;
Begin
Result := '' ;
FN := StringReplace ( FN, '/', '\', [rfReplaceAll] ) ;
Lista := TStringList.Create ;
EXPLODE_RR ( '\', FN, Lista ) ;
If Lista.Count > 2 Then Begin
   Result := Lista[Lista.Count-3] ;
End ;
//PUT_LOG ( 'IMPLODE [' + IMPLODE(',', Lista ) + ']' ) ;
Lista.Free ;
End ;

Function IMPLODE ( Delimitador : String ; Lista : TStringList ) : String ;
Var Local : LongInt ;
    Qtde  : LongInt ;
Begin
Result := '' ;
If Lista = Nil Then Begin
   Exit ;
End ;
Qtde := Lista.Count;
If Qtde = 0 Then Begin
   Exit ;
End ;
For Local := 0 To Qtde - 1 Do Begin
   If Result <> '' Then Begin
      Result := Result + Delimitador + Lista[Local] ;
   End Else Begin
      Result := Result + Lista[Local] ;
   End ;
End ;
End ;

Function GET_ALIGN_STR ( _Align : TAlign ) : String ;
Begin
If _Align = alClient Then Begin
   Result := 'alClient' ;
End Else If _Align = alTop Then Begin
   Result := 'alTop' ;
End Else If _Align = alBottom Then Begin
   Result := 'alBottom' ;
End Else If _Align = alRight Then Begin
   Result := 'alRight' ;
End Else If _Align = alLeft Then Begin
   Result := 'alLeft' ;
End Else If _Align = alNone Then Begin
   Result := 'alNone' ;
End Else Begin
   Result := 'alINDEF' ;
End ;
End ;

Function GET_INFO_PN ( PN : TPanel ) : String ;
Begin
Result := '' ;
End ;

Function GET_INFO_FORM ( Form : TForm ) : String ;
Begin
Result := '*** INFO FORM [' + Form.Name + ']' + sLineBreak +
          '[Left/Top][Width/Height] [' + IntToStr(Form.Left) + '/' +
              IntToStr(Form.Top) + '][' + IntToStr(Form.Width) + '/' +
              IntToStr(Form.Height) + ']' + sLineBreak ;
End ;

Function GET_INFO_SB ( SB : TScrollBox ) : String ;
Begin
Result := '*** INFO SB [' + SB.Name + ']' + sLineBreak +
          '[Left/Top][Width/Height] [' + IntToStr(SB.Left) + '/' +
              IntToStr(SB.Top) + '][' + IntToStr(SB.Width) + '/' +
              IntToStr(SB.Height) + ']' + sLineBreak +
          'Align [' + GET_ALIGN_STR(SB.Align) + ']' + sLineBreak +
          'Horz[Range/Position] [' + IntToStr(SB.HorzScrollBar.Range) + '/' +
              IntToStr(SB.HorzScrollBar.Position) + ']' + sLineBreak +
          'Vert[Range/Position] [' + IntToStr(SB.VertScrollBar.Range) + '/' +
              IntToStr(SB.VertScrollBar.Position) + ']' + sLineBreak ;
End ;

Function GET_INFO_RE ( RE : TRichEdit ) : String ;
Var Height_Line : LongInt ;
Begin
Height_Line := RE.Font.Size * RE.Font.PixelsPerInch DIV 72 ; // Screen.PixelsPerInch ;
Result := '*** INFO RE [' + Re.Name + ']' + sLineBreak +
          '[Count][' + IntToStr(RE.Lines.Count) + ']' + sLineBreak +
          '[Line Height ' + IntToStr(Height_Line) + ']' + sLineBreak +
          '[Font]' + RE.Font.Name + ':' + IntToStr(RE.Font.Size) + sLineBreak +
          '[Left/Top][Width/Height] [' + IntToStr(RE.Left) + '/' +
              IntToStr(RE.Top) + '][' + IntToStr(RE.Width) + '/' +
              IntToStr(RE.Height) + ']' + sLineBreak +
          'Align [' + GET_ALIGN_STR(RE.Align) + ']' + sLineBreak ;
End ;

Function GET_STATUS_TASK ( Task : ITask ) : String ;
Begin
If NOT Assigned ( Task ) Then Begin
   Result := 'Nil' ;
End Else If Task.Status = TTaskStatus.Created Then Begin
   Result := 'Created' ;
End Else If Task.Status = TTaskStatus.WaitingToRun Then Begin
   Result := 'WaitingToRun' ;
End Else If Task.Status = TTaskStatus.Running Then Begin
   Result := 'Running' ;
End Else If Task.Status = TTaskStatus.Completed Then Begin
   Result := 'Completed' ;
End Else If Task.Status = TTaskStatus.WaitingForChildren Then Begin
   Result := 'WaitingForChildren' ;
End Else If Task.Status = TTaskStatus.Canceled Then Begin
   Result := 'Canceled' ;
End Else If Task.Status = TTaskStatus.Exception Then Begin
   Result := 'Exception' ;
End Else Begin
   Result := 'INDEF' ;
End ;
End ;

Function GET_INFO_IM ( IM : TImage ) : String ;
Begin
Result := '' ;
End ;

{************ Setmargins *********}
Procedure setmargins ( m : TMemo; L,R : Integer ) ;
{change the margins in a Tmemo}
Begin
setMemoMargins( m, L, -1, R, -1 ) ;
RE_ME_leftmargin := L ;
RE_ME_rightmargin := R ;
End ;

Procedure setmargins_RE ( m : TRichEdit; L,R : Integer ) ;
{change the margins in a TRichEdit}
Begin
setMemoMargins ( m, L, -1, R, -1 ) ;
RE_ME_leftmargin := L ;
RE_ME_rightmargin := R ;
End ;

{******** SetParams ************}
procedure SetParamsX ( m : TMemo ) ;
{extract some metrics about the current font for Tmemo}
var t : TTextMetric ;
    b : TBitmap ;
begin
{Get text metric fields}
b := TBitmap.Create ;
b.canvas.font.assign(m.font) ;  {assign font to something with a canvas }
Gettextmetrics(b.canvas.handle,t) ;  {so that we can get the text metrics}
b.free;
RE_ME_lineheight := t.tmHeight ;
RE_ME_externalleading := t.tmExternalLeading ;
//topmargin := lineheight-t.tmascent -t.tmdescent ;
RE_ME_avgcharwidth := t.tmAvecharWidth ;
end;

procedure SetParams_REX ( m : TRichEdit ) ;
{extract some metrics about the current font for TRichEdit}
Var t : TTextMetric ;
    b : TBitmap ;
Begin
{Get text metric fields}
b := TBitmap.Create ;
b.canvas.font.assign(m.font) ;  {assign font to something with a canvas }
Gettextmetrics(b.canvas.handle,t) ;  {so that we can get the text metrics}
b.free ;
RE_ME_lineheight := t.tmHeight ;
RE_ME_externalleading := t.tmExternalLeading ;
//topmargin := lineheight-t.tmascent -t.tmdescent ;
RE_ME_avgcharwidth := t.tmAvecharWidth ;
End ;

{************ Reformat **********}
Procedure ReformatMemo ( Const m : TCustomMemo ) ;
{reformat the lines after removing existing Carriage returns and Line feeds}
{necessary to reformat input text from design time since text has hard breaks included}
Var s     : String ;
    CRLF  ,
    CRCR  : String ;
Begin
{remove EXTRA carriage returns & line feeds}
s := m.text; {get memo text lines}
CRLF := char(13) + char(10) ;  {CR=#13=carriage retutn, LF=10=Linefeed}
CRCR := char(13) + char(13) ;
{temporarily change real paragraphs (blank line), CRLFCRLF to double CR}
s := stringreplace(s, CRLF+CRLF, CRCR, [RfReplaceall]) ;
{Eliminate input word wrap CRLFs}
s := stringreplace(s, CRLF, ' ', [RfReplaceall]) ;
{now change CRCR back to CRLFCRLF}
s := stringreplace(s, CRCR, CRLF+CRLF, [RfReplaceall]) ;
m.text := s ;
If m is TMemo Then Begin
   TMemo(m).wordwrap := TRUE ; {make sure that word wrap is on}
End ;
End ;

Procedure SetMemoMargins ( m : TCustomMemo; Const L,T,R,B : Integer ) ;
Var cr : TRect ;
Begin
{Reduce clientrect by L & R margins}
cr := m.clientrect ;
If L >= 0 Then Begin
   cr.left := L ;
End ;
If T >= 0 Then Begin
   cr.top := T ;
End ;
If R >= 0 Then Begin
   cr.right := cr.right-r ;
End ;
If B >= 0 Then Begin
   cr.bottom := cr.Bottom-b ;
End ;
m.perform ( EM_SETRECT, 0, longint(@cr) ) ;
End ;

{**************** AdjustGridSize *************}
Procedure AdjustGridSize ( grid : TDrawGrid ) ;
{Adjust borders of grid to just fit cells}
Var  w ,
     h ,
     i : Integer ;
Begin
With grid Do Begin
   w := 0 ;
   For i := 0 to colcount-1 Do Begin
      w := w + colwidths[i] ;
   End ;
   width := w ;
   Repeat
      width := width + 1 ;
   Until ( fixedcols + visiblecolcount ) = colcount ;
   h := 0 ;
   For i :=  0 To rowcount-1 Do Begin
      h := h + rowheights[i] ;
   End ;
   height := h ;
   Repeat
      height := height + 1 ;
   Until ( fixedrows + visiblerowcount ) = rowcount ;
   Invalidate ;
End ;
End ;

{************* InsertGridRow *************}
Procedure InsertGridRow ( Grid : TStringGrid; Const ARow : Integer ) ;
{Insert blank row after Arow}
Var i : Integer ;
Begin
With Grid Do Begin
   If (arow>=0) and (ARow<=RowCount-1) Then Begin
      RowCount := RowCount + 1 ;
      For i := RowCount-1 DownTo Arow + 2 Do Begin
         rows[i] := rows[i-1] ;
      End ;
      rows[arow+1].clear ;
      DEF_SG_ROW ( 'InsertGridRow', Grid, ARow + 1 ) ;
      {if insert is within fixed rows then increase fixed row count}
      {if insert is at or after the last fixed row, leave fixed row count alone}
      If FixedRows > ARow Then Begin
         FixedRows := FixedRows + 1 ;
      End ;
   End ;
End ;
End ;

{************* DeleteGridRow *************}
Procedure DeleteGridRow ( Grid : TStringGrid ; Const ARow : Integer ) ;
{delete a stringgrid row.  Arow is a row index between 0 and rowcount-1}
Var i : Integer ;
Begin
With Grid Do Begin
  If (arow>=0) and (ARow <= RowCount-1) Then Begin
    //rows[arow].clear;
    For i := Arow To RowCount - 1 Do Begin
       rows[i] := rows[i+1] ;
    End ;
    RowCount := RowCount - 1 ;
    If FixedRows > arow Then Begin
       FixedRows := FixedRows - 1 ;
    End ;
  End ;
End ;
End;

{*********** SortGrid ************}
Procedure Sortgrid ( Grid : TStringGrid ; Const SortCol : Integer ) ;
Var i    ,
    j    : Integer ;
    temp : TStringList ;
Begin
temp := TStringlist.Create ;
With Grid Do Begin
  For i := FixedRows To RowCount - 2 Do Begin {because last row has no next row}
     For j:= i+1 To RowCount - 1 Do Begin {from next row to end}
        If AnsiCompareText ( Cells[SortCol, i], Cells[SortCol, j] ) > 0 Then Begin
          temp.assign ( rows[j] ) ;
          rows[j].assign ( rows[i] ) ;
          rows[i].assign ( temp ) ;
        End ;
     End ;
  End ;
End ;
temp.free;
End;

{************** SortStrDown ************}
Procedure SortStrDown ( Var s : String ) ;
Var i  ,
    j  : Integer ;
    ch : Char ;
begin
For i := 1 To Length(s) - 1 Do Begin
   For j := i + 1 To Length(s) Do Begin
      If s[j] > s[i] Then Begin
         {swap}
         ch := s[i] ;
         s[i] := s[j] ;
         s[j] := ch ;
      End ;
   End ;
End ;
end;

{************** SortStrUp ************}
Procedure SortStrUp ( Var s : String ) ;
Var i  ,
    j  : Integer ;
    ch : Char ;
Begin
For i := 1 To length(s) - 1 Do Begin
   For j := i + 1 To length(s) Do Begin
      If s[j] < s[i] Then Begin
        {swap}
        ch := s[i] ;
        s[i] := s[j] ;
        s[j] := ch ;
      End ;
   End ;
End ;
End;

{************ RotateStrLeft **********}
Procedure RotateStrLeft ( Var s : String ) ;
Var ch  : Char ;
    len : Integer ;
Begin
len := length(s) ;
If len > 1 Then Begin
   ch := s[1] ;
   move ( s[2], s[1], len-1 ) ;
   s[len] := ch ;
End ;
End ;

{********** StrToFloatDef **********}
Function StrToFloatDef ( s : String ; Default : Extended ) : Extended ;
{Convert input string to extended}
{Return "default" if input string is not a valid real number}
Begin
Try
   Result := StrToFloat ( trim(s) ) ;
Except
 {on any conversion error}
   Result := Default ; {use the default}
End;
End ;

{**************** LoadCommaText **********}
Procedure LoadCommaText ( list : TStringList; Filename : String ) ;
Var f    : Textfile ;
    line : String ;
Begin
assignfile ( f, Filename ) ;
reset(f) ;
readln(f, line) ;
list.commatext := line ;
closefile(f) ;
End ;

{*************** FreeAndClear *********}
procedure FreeAndClear ( C : TListbox ) ; Overload ;
Var i : Integer ;
Begin
With c.items Do Begin
  For i := 0 to Count - 1 Do Begin
     If assigned ( objects[i] ) Then Begin
        objects[i].free ;
     End ;
  End ;
End ;
c.clear ;
End ;

Procedure FreeAndClear ( C : TMemo ) ; Overload ;
Var i : Integer ;
Begin
With c.lines Do Begin
  For i := 0 To Count - 1 Do Begin
     If assigned(objects[i]) Then Begin
        objects[i].free ;
     End ;
  End ;
c.clear;
End ;
End ;

Procedure FreeAndClear ( C : TStringList ) ; Overload ;
Var i : Integer ;
Begin
With c Do Begin
  For i := 0 To Count-1 Do Begin
     If assigned(objects[i]) Then Begin
        objects[i].free ;
     End ;
  End ;
End ;
c.clear ;
End ;

Function FILTRAR_TEXTO_TP ( Texto : String ) : String ;
Var Lista : TStringList ;
    Local : LongInt ;
    Qtde  : LongInt ;
    Aux   : String ;
Begin
Result := '' ;
Lista := TStringList.Create ;
Lista.Text := Texto ;
Qtde := Lista.Count ;
If Qtde = 0 Then Begin
   Exit ;
End ;
For Local := 0 To Qtde - 1 Do Begin
   Aux := Lista[Local] ;
   If Pos ( '#FD', Aux ) > 0 Then Begin
      Continue ;
   End ;
   Result := Result + Aux + sLineBreak
End ;
End ;

Function GET_CURSOR_RE ( RE : TObject ) : TPoint ;
Begin
If RE Is TRichEdit Then Begin
   Result.X := SendMessage ( (RE AS TRichEdit).Handle , EM_EXLINEFROMCHAR, 0, (RE AS TRichEdit).SelStart) ;
   Result.Y := ( (RE AS TRichEdit).SelStart - SendMessage ( (RE AS TRichEdit).Handle, EM_LINEINDEX, Result.X, 0 ) ) ;
End Else If RE Is TMyRichEdit Then Begin
   Result.X := SendMessage ( (RE AS TMyRichEdit).Handle , EM_EXLINEFROMCHAR, 0, (RE AS TMyRichEdit).SelStart) ;
   Result.Y := ( (RE AS TMyRichEdit).SelStart - SendMessage ( (RE AS TMyRichEdit).Handle, EM_LINEINDEX, Result.X, 0 ) ) ;
End Else Begin
   Result.X := -1 ;
   Result.Y := -1 ;
End ;
Inc ( Result.X ) ;
Inc ( Result.Y ) ;
End ;

Procedure PUT_CARREGANDO_SISTEMA ( _Msg : String ; Const _StatusBar : String = '' ) ;
Var _Str      : String ;
    Decorrido : Cardinal ;
Begin
//_Debug ( 'INI PUT_CARREGANDO_SISTEMA "' + _Msg + '"' ) ;
Try
   Inc ( Cnt_Carregando_Sistema ) ;
   //If Carregando_Sistema = Nil Then Begin
      //_Debug ( 'Exit 1 PUT_CARREGANDO_SISTEMA "' + _Msg + '"' ) ;
   //   Exit ;
   //End ;
   If NOT Boot_OK Then Begin
      If FLAG_CANCELAR_PROCESSO Then Begin
         ShowMessage ( 'Aguarde Cancelado' + LF + _Msg ) ;
      End ;
      Application.ProcessMessages ;
      If FLAG_CANCELAR_PROCESSO Then Begin
         Saida_Forcada := TRUE ;
         Application.Terminate ;
      End ;
   End ;
   (*
   If TT_Carregando_Sistema > 0 Then Begin
      If Carregando_Sistema.GA.MaxValue <> TT_Carregando_Sistema Then Begin
         Carregando_Sistema.GA.MaxValue := TT_Carregando_Sistema ;
      End
   End Else Begin
      If Carregando_Sistema.GA.MaxValue <> 50 Then Begin
         Carregando_Sistema.GA.MaxValue := 50 ;
      End
   End ;
   Carregando_Sistema.GA.Progress := Cnt_Carregando_Sistema ;
   *)
   If Sys_Usuario_Aplicativo.c_versao_App <> '' Then Begin
      //LB_Carga.Caption := 'Carga do Sistema - ' +
      //                    Sys_Usuario_Aplicativo.c_Compilacao +
      //                    ' [v.' + Sys_Usuario_Aplicativo.c_versao_App + ']' ;
   End ;
   If Tick_Last_Carregando_Sistema = 0 Then Begin
      Tick_Last_Carregando_Sistema := GetTickCount ;
   End ;
   If _Msg <> '' Then Begin
      Decorrido := GetTickCount - Tick_Last_Carregando_Sistema ;
      _Msg := '[' + IntToStr ( Decorrido ) + '] ' + _Msg ;
      If Decorrido > 500 Then Begin
         _Msg := '******** ' + _Msg ;
      End ;
      _Str := //'[' + DateTimeToStr ( Now ) + '.' +
              //StrZero ( GetTickCount MOD 1000 , 3 ) + '] ' +
              _Msg ;
      SL_Carregando_Sistema.Add ( _Str ) ;
      SL_Carregando_Sistema_Total.Add ( _Str ) ;
      //Carregando_Sistema.LB.Items.Add ( _Str ) ;
      _Debug ( _Str ) ;
      //Carregando_Sistema.LB.ItemIndex := Carregando_Sistema.LB.Items.Count - 1 ;
      //Carregando_Sistema.LB.Update ;
   End ;
   Tick_Last_Carregando_Sistema := GetTickCount ;
   If _StatusBar <> '' Then Begin
      //Carregando_Sistema.StatusBar.SimpleText := _StatusBar ;
   End ;
   (*
   If Carregando_Sistema.Visible Then Begin
      Carregando_Sistema.BringToFront ;
      Carregando_Sistema.Update ;
      Carregando_Sistema.Repaint ;
   End ;
   *)
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception PUT_CARREGANDO_SISTEMA [' + E.Message + ']' ) ;
   End ;
End ;
End ;

Procedure RE_MODO_SILENCIOSO ( RE : TMyRichEdit ; Var Contexto : T_Contexto_RichEdit ) ;
Begin
Contexto.Save := RE.SelStart ;
SendMessage ( RE.handle, WM_SETREDRAW, 0, 0 ) ;
Contexto.Linha_Top := SendMessage ( RE.Handle, EM_GETFIRSTVISIBLELINE, 0, 0 ) ; // SaveFirstVisibleLine ; // look at EM_GETFIRSTVISIBLELINE in win32.hlp
Contexto.eventMask := SendMessage ( RE.Handle, EM_SETEVENTMASK, 0, 0) ;
End ;

Procedure RE_MODO_NORMAL ( RE : TMyRichEdit ; Contexto : T_Contexto_RichEdit ) ;
Begin
RE.SelStart := Contexto.Save ;
RE.Perform ( EM_LINESCROLL, 0, - 10000 ) ;
RE.Perform ( EM_LINESCROLL, 0, Contexto.Linha_Top ) ;
SendMessage ( RE.Handle, EM_SETEVENTMASK, 0, Contexto.eventMask ) ;
SendMessage ( RE.handle, WM_SETREDRAW, 1, 0 ) ;
RE.ScrollBars := ssVertical ;
RE.Repaint ;
End ;

Procedure DEFINIR_CONTEXTO_FORMAT_FRENTE ( Var Contexto : T_Contexto_RichEdit ; Cor : TColor ) ;
Begin
FillChar ( Contexto.Format, SizeOf(Contexto.Format), 0 ) ;
With Contexto.Format Do Begin
   cbSize := SizeOf(Contexto.Format) ;
   dwMask := CFM_COLOR ;
   crTextColor := Cor ;
End ;
End ;

Procedure DEFINIR_CONTEXTO_FORMAT_BACK ( Var Contexto : T_Contexto_RichEdit ; Cor : TColor ) ;
Begin
FillChar ( Contexto.Format, SizeOf(Contexto.Format), 0 ) ;
With Contexto.Format Do Begin
   cbSize := SizeOf(Contexto.Format) ;
   dwMask := CFM_BACKCOLOR ;
   crBackColor := Cor ;
End ;
End ;

Function GET_LINHA_RE ( RE : TMyRichEdit ; Linha : LongInt ) : String ;
Begin
Result := '' ;
If Linha < 0 Then Begin
   Exit ;
End ;
If Linha > RE.Lines.Count Then Begin
   Exit ;
End ;
Result := RE.Lines[Linha] ;
End ;

(*
Procedure PLOTAR_TEMPOS_LAUDA ( Reg : T_RD_Tempos ;
                  _Total, _Locucao, _VTs, _Externas, _Entrevista : TLabel ) ;
Begin
If Reg.TT = 0 Then Begin
   _Total.Caption := '-' ;
   _Locucao.Caption := '-' ;
   _VTs.Caption := '-' ;
   _Externas.Caption := '-' ;
   _Entrevista.Caption := '-' ;
End Else Begin
   _Total.Caption := SegundosToMMSS ( Reg.TT ) ;
   _Locucao.Caption := SegundosToMMSS ( Reg.Locucao ) ;
   _VTs.Caption := SegundosToMMSS ( Reg.VTs ) ;
   _Externas.Caption := SegundosToMMSS ( Reg.Vivo ) ;
   _Entrevista.Caption := SegundosToMMSS ( Reg.Entrevista ) ;
End ;
End ;
*)

Function G1ToDateTime ( Str : String ) : TDateTime ;
Var Lista : TStringList ;
    _Dia  ,
    _Mes  ,
    _Ano  : LongInt ;
Begin
Result := 0 ;
If Length ( Str ) < 30 Then Begin
   Exit ;
End ;
{
Thu, 10 Jan 2019 11:52:57 -0000
Thu,
10
Jan
2019
11:52:57
-0000
}
Str := UpperCase ( Str ) ;
Lista := TStringList.Create ;
EXPLODE_RR ( ' ', Str, Lista ) ;
If Lista.Count <> 6 Then Begin
   Lista.Free ;
   Exit ;
End ;
_Dia := StrToIntDef ( Lista[1], 0 ) ;
If _Dia = 0 Then Begin
   Lista.Free ;
   Exit ;
End ;
_Mes := MES_STR_TO_INT ( Lista[2] ) ;
If _Mes = 0 Then Begin
   Lista.Free ;
   Exit ;
End ;
_Ano := StrToIntDef ( Lista[3], 0 ) ;
If _Ano < 2000 Then Begin
   Lista.Free ;
   Exit ;
End ;
Result := StrToDateTime ( StrZero(_Dia,2) + '/' + StrZero(_Mes,2) + '/' + StrZero(_Ano,4) + ' ' +
          Lista[4] ) ;
If Lista[5]='-0000' Then Begin
   Result := Result - 3/24
End Else If Lista[5]='-0100' Then Begin
   Result := Result - 2/24
End Else If Lista[5]='-0200' Then Begin
   Result := Result - 1/24
End Else If Lista[5]='-0300' Then Begin
   Result := Result - 1/24 // O correto seria -2/24, fora do horario de verão no Sudeste
End Else If Lista[5]='-0400' Then Begin
   Result := Result + 1/24 ;
End ;
Lista.Free ;
End ;

Function GET_HASH ( Aux : String ) : String ;
Var Hash : TIdHashMessageDigest5 ;
Begin
Result := '' ;
Hash := TIdHashMessageDigest5.Create ;
Try
   Result := Hash.HashStringAsHex ( Aux ) ;
Finally
   Hash.Free ;
End;
End ;

Function SG_CELL ( SG : TStringGrid ; Linha, Coluna : LongInt ; Conteudo : String ) : Boolean ;
Begin
Result := FALSE ;
If SG.Cells[Coluna,Linha] <> Conteudo Then Begin
   SG.Cells[Coluna,Linha] := Conteudo ;
   Result := TRUE ;
End ;
End ;

Procedure ShowNewMessage ( Aux : String ) ;
Begin
ShowMessage ( Aux ) ;
End ;

Procedure PROC_SLEEP ( _Delay : LongInt ) ;
Begin
While _Delay > 0 Do Begin
  Sleep ( 10 ) ;
  Dec ( _Delay, 10 ) ;
  Application.ProcessMessages ;
End ;
End ;

Function GET_COR_FONTE_AJUSTADA ( Cor : TColor ) : TColor ;
Begin
Case Cor Of
   clRed : Result := clWhite ;
   clBlue : Result :=  clwhite ;
   Else
      Result := clBlack ;
   End ;
End ;

Function UNICODE_TO_STRING ( Str : String ) : String ;
Begin
Str := StringReplace ( Str, ',', '.', [rfReplaceAll, rfIgnoreCase] ) ;
Str := StringReplace ( Str, '\u00e1', 'á', [rfReplaceAll, rfIgnoreCase] ) ;
Str := StringReplace ( Str, '\u00e0', 'à', [rfReplaceAll, rfIgnoreCase] ) ;
Str := StringReplace ( Str, '\u00e2', 'â', [rfReplaceAll, rfIgnoreCase] ) ;
Str := StringReplace ( Str, '\u00e3', 'ã', [rfReplaceAll, rfIgnoreCase] ) ;
Str := StringReplace ( Str, '\u00e4', 'ä', [rfReplaceAll, rfIgnoreCase] ) ;
Str := StringReplace ( Str, '\u00c1', 'Á', [rfReplaceAll, rfIgnoreCase] ) ;
Str := StringReplace ( Str, '\u00c0', 'À', [rfReplaceAll, rfIgnoreCase] ) ;
Str := StringReplace ( Str, '\u00c2', 'Â', [rfReplaceAll, rfIgnoreCase] ) ;
Str := StringReplace ( Str, '\u00c3', 'Ã', [rfReplaceAll, rfIgnoreCase] ) ;
Str := StringReplace ( Str, '\u00c4', 'Ä', [rfReplaceAll, rfIgnoreCase] ) ;
Str := StringReplace ( Str, '\u00e9', 'é', [rfReplaceAll, rfIgnoreCase] ) ;
Str := StringReplace ( Str, '\u00e8', 'è', [rfReplaceAll, rfIgnoreCase] ) ;
Str := StringReplace ( Str, '\u00ea', 'ê', [rfReplaceAll, rfIgnoreCase] ) ;
Str := StringReplace ( Str, '\u00ea', 'ê', [rfReplaceAll, rfIgnoreCase] ) ;
Str := StringReplace ( Str, '\u00c9', 'É', [rfReplaceAll, rfIgnoreCase] ) ;
Str := StringReplace ( Str, '\u00c8', 'È', [rfReplaceAll, rfIgnoreCase] ) ;
Str := StringReplace ( Str, '\u00ca', 'Ê', [rfReplaceAll, rfIgnoreCase] ) ;
Str := StringReplace ( Str, '\u00cb', 'Ë', [rfReplaceAll, rfIgnoreCase] ) ;
Str := StringReplace ( Str, '\u00ed', 'í', [rfReplaceAll, rfIgnoreCase] ) ;
Str := StringReplace ( Str, '\u00ec', 'ì', [rfReplaceAll, rfIgnoreCase] ) ;
Str := StringReplace ( Str, '\u00ee', 'î', [rfReplaceAll, rfIgnoreCase] ) ;
Str := StringReplace ( Str, '\u00ef', 'ï', [rfReplaceAll, rfIgnoreCase] ) ;
Str := StringReplace ( Str, '\u00cd', 'Í', [rfReplaceAll, rfIgnoreCase] ) ;
Str := StringReplace ( Str, '\u00cc', 'Ì', [rfReplaceAll, rfIgnoreCase] ) ;
Str := StringReplace ( Str, '\u00ce', 'Î', [rfReplaceAll, rfIgnoreCase] ) ;
Str := StringReplace ( Str, '\u00cf', 'Ï', [rfReplaceAll, rfIgnoreCase] ) ;
Str := StringReplace ( Str, '\u00f3', 'ó', [rfReplaceAll, rfIgnoreCase] ) ;
Str := StringReplace ( Str, '\u00f2', 'ò', [rfReplaceAll, rfIgnoreCase] ) ;
Str := StringReplace ( Str, '\u00f4', 'ô', [rfReplaceAll, rfIgnoreCase] ) ;
Str := StringReplace ( Str, '\u00f5', 'õ', [rfReplaceAll, rfIgnoreCase] ) ;
Str := StringReplace ( Str, '\u00f6', 'ö', [rfReplaceAll, rfIgnoreCase] ) ;
Str := StringReplace ( Str, '\u00d3', 'Ó', [rfReplaceAll, rfIgnoreCase] ) ;
Str := StringReplace ( Str, '\u00d2', 'Ò', [rfReplaceAll, rfIgnoreCase] ) ;
Str := StringReplace ( Str, '\u00d4', 'Ô', [rfReplaceAll, rfIgnoreCase] ) ;
Str := StringReplace ( Str, '\u00d5', 'Õ', [rfReplaceAll, rfIgnoreCase] ) ;
Str := StringReplace ( Str, '\u00d6', 'Ö', [rfReplaceAll, rfIgnoreCase] ) ;
Str := StringReplace ( Str, '\u00fa', 'ú', [rfReplaceAll, rfIgnoreCase] ) ;
Str := StringReplace ( Str, '\u00f9', 'ù', [rfReplaceAll, rfIgnoreCase] ) ;
Str := StringReplace ( Str, '\u00fb', 'û', [rfReplaceAll, rfIgnoreCase] ) ;
Str := StringReplace ( Str, '\u00fc', 'ü', [rfReplaceAll, rfIgnoreCase] ) ;
Str := StringReplace ( Str, '\u00da', 'Ú', [rfReplaceAll, rfIgnoreCase] ) ;
Str := StringReplace ( Str, '\u00d9', 'Ù', [rfReplaceAll, rfIgnoreCase] ) ;
Str := StringReplace ( Str, '\u00db', 'Û', [rfReplaceAll, rfIgnoreCase] ) ;
Str := StringReplace ( Str, '\u00e7', 'ç', [rfReplaceAll, rfIgnoreCase] ) ;
Str := StringReplace ( Str, '\u00c7', 'Ç', [rfReplaceAll, rfIgnoreCase] ) ;
Str := StringReplace ( Str, '\u00f1', 'ñ', [rfReplaceAll, rfIgnoreCase] ) ;
Str := StringReplace ( Str, '\u00d1', 'Ñ', [rfReplaceAll, rfIgnoreCase] ) ;
Str := StringReplace ( Str, '\u0026', '&', [rfReplaceAll, rfIgnoreCase] ) ;
Str := StringReplace ( Str, '\u0027', '''', [rfReplaceAll, rfIgnoreCase] ) ;
Result := Str ;
End ;

Procedure RE_ADD ( RE : TRichEdit ; Const atext: String; acolor: TColor; astyles : TFontStyles) ;
Begin
With RE Do Begin
   SelStart := Length ( RE.Text ) ;
   SelLength := 0 ;
   SelText := atext ;
   SelLength := Length ( atext ) ;
   SelAttributes.Color := acolor ;
   SelAttributes.Style := astyles ;
End ;
End ;

Procedure VIEW_LOG ( Forcar : Boolean ) ;
Begin
If NOT Log.Visible OR Forcar Then Begin
   Log.Show ;
   Log.BringToFront ;
   Exit ;
End Else Begin
   Log.Close ;
End ;
End ;

Function GET_ARQUIVO_NAO_EXISTENTE ( Dir, FN, Extensao : String ) : String ;
Var Indice : LongInt ;
Begin
Dir := INSERE_BARRA ( Dir ) ;
CHECAR_DIRETORIO_DIRNAME ( Dir ) ;
Indice := 1 ;
Repeat
   Result := Dir + FN + '_' + StrZero(Indice,8) + Extensao ;
   Inc ( Indice ) ;
Until NOT RR_FileExists ( 'GET ARQUIVO_NAO_EXISTENTE', Result ) ;
End ;

Function FileIsBusy ( AFileName : String ) : Boolean ;
Var F : Integer ;
begin
F := FileOpen ( AFileName, fmShareExclusive ) ;
Result := F = -1 ;
FileClose(F) ;
End ;

Function FileIsLivre ( AFileName : String ) : Boolean ;
Var F : Integer ;
begin
F := FileOpen ( AFileName, fmShareExclusive ) ;
Result := F <> -1 ;
{
If Result Then Begin
   _Size := FileSize ( F ) ;
End Else Begin
   _Size := -1 ;
End ;
}
FileClose(F) ;
End ;

Procedure TASK_CONVERTER_AUDIO_PARA_FLAC ;
Var Flac : String ;
    Cmd  : String ;
Begin
Flac := Global_FN_Wav + PREFIXO_AUDIO_FLAC + '.flac' ;
Flac := StringReplace ( Flac, PREFIXO_AUDIO_WAV, '', [rfReplaceAll, rfIgnoreCase] ) ;
Flac := StringReplace ( Flac, '.wav', '', [rfReplaceAll, rfIgnoreCase] ) ;
If RR_DeleteFile ( 'TASK CONVERTER_AUDIO_PARA_FLAC', Flac ) Then Begin
End ;
Cmd := 'ffmpeg -y -i "' + Global_FN_Wav + '" -ac 1 -ar 16000 "' + Flac + '"' ;
PUT_LOG ( 'CONVERTER_AUDIO_PARA_FLAC [' + Cmd + ']' ) ;
ShellExecute ( 0, nil, 'cmd.exe', PChar('/C ' + Cmd), Nil, SW_MINIMIZE ) ;
End ;

(*
Procedure CONVERTER_AUDIO_PARA_FLAC ( Wav : String ) ;
Begin
Global_FN_Wav := Wav ;
SetLength ( Tasks, Length(Tasks)+1 ) ;
Tasks[Length(Tasks)-1] := TTask.Create ( TASK_CONVERTER_AUDIO_PARA_FLAC ) ;
Tasks[Length(Tasks)-1].Start ;
End ;
*)

Procedure TASK_SUBMETER_FLAC_PARA_GOOGLE ;
Var Cmd     : String ;
    FN_Json : String ;
Begin
FN_Json := Global_FN_Flac + PREFIXO_JSON_GOOGLE + '.json' ;
FN_Json := StringReplace ( FN_JSon, PREFIXO_AUDIO_FLAC, '', [rfReplaceAll, rfIgnoreCase] ) ;
FN_Json := StringReplace ( FN_Json, '.flac', '', [rfReplaceAll, rfIgnoreCase] ) ;
Cmd := 'gcloud ml speech recognize "' + Global_FN_Flac + '" --language-code="pt-BR" > "' + FN_Json + '"' ;
PUT_LOG ( 'GOOGLE ENVIANDO CMD [' + Cmd + ']' ) ;
ShellExecute ( 0, nil, 'cmd.exe', PChar('/C ' + Cmd), Nil, SW_MINIMIZE ) ;
End ;

(*
Procedure SUBMETER_FLAC_PARA_GOOGLE ( Flac : String ) ;
Begin
Global_FN_Flac := Flac ;
SetLength ( Tasks, Length(Tasks)+1 ) ;
Tasks[Length(Tasks)-1] := TTask.Create ( TASK_SUBMETER_FLAC_PARA_GOOGLE ) ;
Tasks[Length(Tasks)-1].Start ;
End ;
*)

Function GET_RGB_DE_COR_HTML ( Cor : String ) : TColor ;
Begin
_Debug ( 'INI GET_RGB_DE_COR_HTML' ) ;
Cor := UpperCase ( Cor ) ;
If Cor = 'YELLOW' Then Begin
   Result := clYellow
End Else If Cor = 'BLUE' Then Begin
   Result := clBlue
End Else If Cor = 'GREEN' Then Begin
   Result := clLime
End Else If Cor = 'RED' Then Begin
   Result := clRed
End Else If Cor = 'GRAY' Then Begin
   Result := clGray
End Else If Cor = 'SILVER' Then Begin
   Result := clSilver
End Else If Cor = 'BLACK' Then Begin
   Result := clBlack
End Else If Cor = 'NAVY' Then Begin
   Result := clNavy
End Else If Cor = 'FUCHSIA' Then Begin
   Result := clFuchsia
End Else Begin
   Result := clWhite ;
End ;
_Debug ( 'FIM GET_RGB_DE_COR_HTML' ) ;
End ;

(*
Procedure CHECAR_INTERFACES_DE_REDE_OLD ( LB : TListBox ) ;
Var i                 : Integer ;
    aNetInterfaceList : tNetworkInterfaceList ;
    _IP               : String ;
Begin
LB.Items.Clear ;
LB.Items.Add ( DateTimeToStr ( Now ) ) ;
LB.Items.Add ( '' ) ;
If (GetNetworkInterfaces (aNetInterfaceList)) Then Begin
   //Cnt_Interfaces_de_Rede := High (aNetInterfaceList) + 1 ;
   //LB.Items.Add ( 'Resumo [Qtde:' + IntToStr (Cnt_Interfaces_de_Rede) + ']' ) ;
   For i := 0 to High (aNetInterfaceList) Do Begin
      _IP := aNetInterfaceList[i].AddrIP ;
      //Interfaces_de_Rede[i].IP := aNetInterfaceList[i].AddrIP ;
      LB.Items.Add ( '[' + IntToStr(i+1) + '] ' + _IP ) ;
   End ;
   LB.Items.Add ( '' ) ;
   LB.Items.Add ( 'Modo Ampliado' ) ;
   For i := 0 to High (aNetInterfaceList) Do Begin
      LB.Items.Add ( '' ) ;
      LB.Items.Add ( '#: ' + IntToStr(i+1) ) ;
      LB.Items.Add ( 'Interface: ' + aNetInterfaceList[i].ComputerName ) ;
      LB.Items.Add ( 'IP: ' + _IP ) ;
      LB.Items.Add ( 'Máscara: ' + aNetInterfaceList[i].SubnetMask ) ;
      LB.Items.Add ( 'Net: ' + aNetInterfaceList[i].AddrNet ) ;
      LB.Items.Add ( 'Limited broadcast address  : ' + aNetInterfaceList[i].AddrLimitedBroadcast ) ;
      LB.Items.Add ( 'Directed Broadcast address : ' + aNetInterfaceList[i].AddrDirectedBroadcast ) ;
      LB.Items.Add ( 'Interface up: ' + BoolToStr (aNetInterfaceList[i].IsInterfaceUp, True) ) ;
      LB.Items.Add ( 'Broadcast supported: ' + BoolToStr (aNetInterfaceList[i].BroadcastSupport, True) ) ;
      LB.Items.Add ( 'Loopback interface: ' + BoolToStr (aNetInterfaceList[i].IsLoopback, True) ) ;
      LB.Items.Add ( '' ) ;
   End ;
End Else Begin
   //Cnt_Interfaces_de_Rede := 0 ;
End ;
End ;
*)

Function OLE_ARRAY_TO_STRING ( Key : OLEVariant ) : String ;
Var i : LongInt ;
Begin
Result := '' ;
For i := VarArrayLowBound(Key, 1) To VarArrayHighBound(Key, 1) Do Begin
   If Result <> '' Then Begin
      Result := Result + '@@@' ;
   End ;
   Result := Result + String(Key[i]) ;
End ;
End ;

Function CARREGAR_DEVICES_AUDIO_IN ( PN : TPanel ; LB : TListBox ; Var Qtde : LongInt ) : TStringList ;
//Var Local : LongInt ;
Begin
Result := TStringList.Create ;
Try
   PN.Caption := 'Áudio IN - ' + TimeToStr ( Now ) ;
   (*
   If NOT Assigned ( MISC_Audio_In ) Then Begin
      MISC_Audio_In := TALAudioIn.Create ( Form_Misc ) ;
   End ;
   If Assigned ( MISC_Audio_In ) Then Begin
      MISC_Audio_In.Device.GetDeviceList ( Result ) ;
      Sup.SL_Audio_IN.Clear ;
      Sup.SL_Audio_IN.AddStrings ( Result ) ;
      Qtde := Result.Count ;
      If Assigned ( LB ) Then Begin
         While LB.Items.Count > Qtde Do Begin
            LB.Items.Delete ( LB.Items.Count - 1 ) ;
         End ;
         While LB.Items.Count < Qtde Do Begin
            LB.Items.Add ( '' ) ;
         End ;
         For Local := 0 To Qtde - 1 Do Begin
            LB.Items[Local] := Result[Local] ;
         End ;
      End ;
   End ;
   *)
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception CARREGAR_DEVICES_AUDIO_IN/1 [' + E.Message + ']' ) ;
   End ;
End ;
End ;

Function CARREGAR_DEVICES_AUDIO_OUT ( PN : TPanel ; LB : TListBox ; Var Qtde : LongInt ) : TStringList ;
//Var Local : LongInt ;
Begin
Result := TStringList.Create ;
Try
   PN.Caption := 'Áudio OUT - ' + TimeToStr ( Now ) ;
   (*
   If NOT Assigned ( MISC_Audio_Out ) Then Begin
      MISC_Audio_Out := TALAudioOut.Create ( Form_Misc ) ;
   End ;
   If Assigned ( MISC_Audio_Out ) Then Begin
      MISC_Audio_Out.Device.GetDeviceList ( Result ) ;
      Sup.SL_Audio_OUT.Clear ;
      Sup.SL_Audio_OUT.AddStrings ( Result ) ;
      Qtde := Result.Count ;
      If Assigned ( LB ) Then Begin
         While LB.Items.Count > Qtde Do Begin
            LB.Items.Delete ( LB.Items.Count - 1 ) ;
         End ;
         While LB.Items.Count < Qtde Do Begin
            LB.Items.Add ( '' ) ;
         End ;
         For Local := 0 To Qtde - 1 Do Begin
            LB.Items[Local] := Result[Local] ;
         End ;
      End ;
   End ;
   *)
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception CARREGAR_DEVICES_AUDIO_OUT/1 [' + E.Message + ']' ) ;
   End ;
End ;
End ;

Function ProcessExists ( ExeFileName : String ) : Boolean ;
Var ContinueLoop    : BOOL ;
    FSnapshotHandle : THandle ;
    FProcessEntry32 : TProcessEntry32 ;
Begin
FSnapshotHandle := CreateToolhelp32Snapshot ( TH32CS_SNAPPROCESS, 0 ) ;
FProcessEntry32.dwSize := SizeOf ( FProcessEntry32 ) ;
ContinueLoop := Process32First ( FSnapshotHandle, FProcessEntry32 ) ;
Result := FALSE ;
While Integer(ContinueLoop) <> 0 Do Begin
   If ( ( UpperCase(ExtractFileName ( FProcessEntry32.szExeFile ) ) = UpperCase ( ExeFileName ) ) OR
      ( UpperCase(FProcessEntry32.szExeFile) = UpperCase(ExeFileName))) Then Begin
      Result := TRUE ;
      Exit ;
   End;
   ContinueLoop := Process32Next ( FSnapshotHandle, FProcessEntry32 ) ;
End ;
CloseHandle ( FSnapshotHandle ) ;
End ;

{
Procedure ADD_APP_VERIFICADA ( ExeName : String ; Timeout : LongInt ) ;
Begin
SetLength ( Apps_Verificadas, Length ( Apps_Verificadas ) + 1 ) ;
Apps_Verificadas [ Length ( Apps_Verificadas ) - 1 ].Executavel := ExeName ;
Apps_Verificadas [ Length ( Apps_Verificadas ) - 1 ].Timeout_Para_Execucao := TimeOut ;
Apps_Verificadas [ Length ( Apps_Verificadas ) - 1 ].Off_Desde := 0 ;
Apps_Verificadas [ Length ( Apps_Verificadas ) - 1 ].On_Desde := 0 ;
End ;
}

Function GET_CODIGO_DO_CB_ACAO ( CB : TComboBox ) : LongInt ;
Var Aux  : String ;
Begin
If CB.ItemIndex = -1 Then Begin
   Result := 0 ;
   Exit ;
End ;
Aux := CB.Items [ CB.ItemIndex ] ;
Result := StrToIntDef ( Copy ( Aux, 1, 2 ), 0 ) ;
End ;

Function GET_FN_ACOES : String ;
Begin
Result := Diretorio + 'Config\Acoes.DAT' ;
End ;

Function GET_VALUE_CB ( CB : TComboBox ; Casas : LongInt ) : LongInt ;
Begin
Result := 0 ;
If NOT Assigned ( CB ) Then Begin
   Exit ;
End ;
If CB.ItemIndex = -1 Then Begin
   Exit ;
End ;
Result := StrToIntDef ( Copy ( CB.Items[CB.ItemIndex], 1, Casas ) , 0 ) ;
End ;

Function IsIP ( Const Value: String ) : Boolean ;
Var TempIP : String ;
//===
Function ByteIsOk ( Const Value: String ) : Boolean ;
Var x ,
    n : Integer ;
Begin
x := StrToIntDef(Value, -1) ;
Result := (x >= 0) AND (x < 256) ;
// X may be in correct range, but value still may not be correct value!
// i.e. "$80"
If Result Then Begin
   For n := 1 to Length(Value) Do Begin
      If not (AnsiChar(Value[n]) in ['0'..'9']) then Begin
         Result := FALSE ;
         Break ;
      End;
   End ;
End ;
End;
//===
Begin
TempIP := Value ;
Result := False ;
If NOT ByteIsOk(Fetch(TempIP, '.')) Then Begin
   Exit ;
End ;
If NOT ByteIsOk(Fetch(TempIP, '.')) Then Begin
   Exit ;
End ;
If NOT ByteIsOk(Fetch(TempIP, '.')) Then Begin
   Exit ;
End ;
If ByteIsOk(TempIP) then Begin
   Result := TRUE ;
End ;
End ;

{==============================================================================}

Function SeparateRight ( Const Value, Delimiter : String ) : String ;
var x : Integer ;
Begin
x := Pos ( Delimiter, Value ) ;
If x > 0 Then Begin
   x := x + Length ( Delimiter ) - 1 ;
End ;
Result := Copy ( Value, x + 1, Length(value) - x ) ;
End ;

Function SeparateLeft ( Const Value, Delimiter : String ) : String ;
var x : Integer ;
Begin
x := Pos ( Delimiter, Value ) ;
If x < 1 Then Begin
   Result := Value
End Else Begin
   Result := Copy ( Value, 1, x - 1 ) ;
End ;
End ;

Function IsIP6 ( Const Value : String ) : Boolean ;
Var TempIP    : String ;
    s         : String ;
    t         : String ;
    x         : Integer ;
    partcount : Integer ;
    zerocount : Integer ;
    First     : Boolean ;
Begin
TempIP := Value ;
Result := FALSE ;
If Value = '::' Then Begin
   Result := TRUE ;
   Exit;
End ;
partcount := 0 ;
zerocount := 0 ;
First := TRUE ;
While tempIP <> '' Do Begin
   s := fetch(TempIP, ':') ;
   If NOT(First) AND (s = '') Then Begin
      Inc(zerocount) ;
   End ;
   First := FALSE ;
   If zerocount > 1 Then Begin
      Break ;
   End ;
   Inc(partCount) ;
   If s = '' Then Begin
      Continue ;
   End ;
   If partCount > 8 Then Begin
      Break ;
   End ;
   If tempIP = '' Then Begin
      t := SeparateRight(s, '%') ;
      s := SeparateLeft(s, '%') ;
      x := StrToIntDef('$' + t, -1) ;
      if (x < 0) or (x > $ffff) Then Begin
         break ;
      End ;
   End ;
   x := StrToIntDef('$' + s, -1) ;
   If (x < 0) OR (x > $ffff) Then Begin
      Break ;
   End ;
   If tempIP = '' Then Begin
      If not((PartCount = 1) AND (ZeroCount = 0)) Then Begin
         Result := TRUE ;
      End ;
   End ;
End ;
End ;

{==============================================================================}
Function IPToID ( Host : String ) : Ansistring ;
Var s : String ;
    i : Integer ;
    x : Integer ;
Begin
_Debug ( 'INI IpToID [' + Host + ']' ) ;
Result := '';
For x := 0 To 3 Do Begin
   s := Fetch(Host, '.');
   i := StrToIntDef(s, 0);
   Result := Result + AnsiChar(i);
End ;
_Debug ( 'FIM IpToID [' + Host + ']' ) ;
End ;

{==============================================================================}

Function StrToIp ( Value : String ) : Cardinal ;
Var s : String ;
    i : Integer ;
    x : Integer ;
Begin
//_Debug ( 'INI StrToIp [' + Value + ']' ) ;
Result := 0;
For x := 0 To 3 Do Begin
   s := Fetch ( value, '.' ) ;
   //_Debug ( 'Fetch [' + s + ']' ) ;
   i := StrToIntDef ( s, 0) ;
   Result := (256 * Result) + i ;
End ;
//_Debug ( 'FIM StrToIp [' + Value + ']' ) ;
End ;

{==============================================================================}

Function IpToStr ( Value : Cardinal ) : String ;
var x1 ,
    x2 : Word ;
    y1 ,
    y2 : Byte ;
begin
Result := '' ;
x1 := value shr 16 ;
x2 := value and $FFFF ;
y1 := x1 div $100 ;
y2 := x1 mod $100 ;
Result := inttostr(y1) + '.' + inttostr(y2) + '.' ;
y1 := x2 div $100 ;
y2 := x2 mod $100 ;
Result := Result + inttostr(y1) + '.' + inttostr(y2) ;
End ;

{==============================================================================}
(*
function ExpandIP6(Value: AnsiString): AnsiString;
var
 n: integer;
 s: ansistring;
 x: integer;
begin
  Result := '';
  if value = '' then
    exit;
  x := countofchar(value, ':');
  if x > 7 then
    exit;
  if value[1] = ':' then
    value := '0' + value;
  if value[length(value)] = ':' then
    value := value + '0';
  x := 8 - x;
  s := '';
  for n := 1 to x do
    s := s + ':0';
  s := s + ':';
  Result := replacestring(value, '::', s);
end;
*)
{==============================================================================}

(*
function StrToIp6(Value: string): TIp6Bytes;
var
 IPv6: TIp6Words;
 Index: Integer;
 n: integer;
 b1, b2: byte;
 s: string;
 x: integer;
begin
  for n := 0 to 15 do
    Result[n] := 0;
  for n := 0 to 7 do
    Ipv6[n] := 0;
  Index := 0;
  Value := ExpandIP6(value);
  if value = '' then
    exit;
  while Value <> '' do
  begin
    if Index > 7 then
      Exit;
    s := fetch(value, ':');
    if s = '@' then
      break;
    if s = '' then
    begin
      IPv6[Index] := 0;
    end
    else
    begin
      x := StrToIntDef('$' + s, -1);
      if (x > 65535) or (x < 0) then
        Exit;
      IPv6[Index] := x;
    end;
    Inc(Index);
  end;
  for n := 0 to 7 do
  begin
    b1 := ipv6[n] div 256;
    b2 := ipv6[n] mod 256;
    Result[n * 2] := b1;
    Result[(n * 2) + 1] := b2;
  end;
end;
*)
{==============================================================================}
//based on routine by the Free Pascal development team
Function Ip6ToStr ( Value : TIp6Bytes ) : String ;
var i, x         : Byte ;
    zr1,zr2      : Set Of Byte ;
    zc1,zc2      : Byte ;
    have_skipped : Boolean ;
    ip6w         : TIp6words ;
Begin
zr1 := [] ;
zr2 := [] ;
zc1 := 0 ;
zc2 := 0 ;
For i := 0 to 7 Do Begin
   x := i * 2 ;
   ip6w[i] := value[x] * 256 + value[x + 1] ;
   If ip6w[i] = 0 Then Begin
      include(zr2, i) ;
      inc(zc2) ;
   End Else Begin
      If zc1 < zc2 then begin
         zc1 := zc2 ;
         zr1 := zr2 ;
         zc2 := 0 ;
         zr2 := [] ;
      End ;
   End ;
End ;
If zc1 < zc2 Then Begin
   zr1 := zr2 ;
End ;
SetLength(Result, 8*5-1) ;
SetLength(Result, 0) ;
have_skipped := FALSE ;
For i := 0 To 7 Do Begin
   If NOT(i IN zr1) Then Begin
      If have_skipped Then Begin
         If Result = '' Then Begin
            Result := '::'
         End Else Begin
            Result := Result + ':' ;
         End ;
         have_skipped := FALSE ;
       End ;
   Result := Result + IntToHex(Ip6w[i], 1) + ':' ;
   End Else Begin
      have_skipped := TRUE ;
   End ;
End ;
If have_skipped Then Begin
   If Result = '' Then Begin
      Result := '::0'
   End Else Begin
      Result := Result + ':' ;
   End ;
End ;
If Result = '' Then Begin
   Result := '::0' ;
End ;
If NOT (7 in zr1) Then Begin
   SetLength(Result, Length(Result)-1) ;
End ;
Result := Super_LowerCase(result) ;
End ;

{==============================================================================}
Function ReverseIP ( Value: AnsiString ) : AnsiString ;
Var x : Integer ;
begin
Result := '' ;
Repeat
   x := LastDelimiter('.', String(Value) ) ;
   Result := Result + '.' + Copy(Value, x + 1, Length(Value) - x) ;
   Delete(Value, x, Length(Value) - x + 1) ;
Until x < 1 ;
If Length(Result) > 0 Then Begin
   if Result[1] = '.' Then Begin
     Delete(Result, 1, 1) ;
   End ;
End ;
End ;

{==============================================================================}
(*
function ReverseIP6(Value: AnsiString): AnsiString;
var
  ip6: TIp6bytes;
  n: integer;
  x, y: integer;
begin
  ip6 := StrToIP6(Value);
  x := ip6[15] div 16;
  y := ip6[15] mod 16;
  Result := IntToHex(y, 1) + '.' + IntToHex(x, 1);
  for n := 14 downto 0 do
  begin
    x := ip6[n] div 16;
    y := ip6[n] mod 16;
    Result := Result + '.' + IntToHex(y, 1) + '.' + IntToHex(x, 1);
  end;
end;
*)

Procedure PUT_EVENTO ( LB : TListBox ; _Msg : String ) ;
Begin
LB.Items.Add ( _Msg ) ;
LB.ItemIndex := LB.Items.Count - 1 ;
End ;

Procedure COMPARAR_LISTAS ( LB : TListBox ; Prefixo : String ;
                            Lista1, Lista2 : TStringList ;
                            Var Lista_ADD : TStringList ;
                            Var Lista_DEL : TStringList ) ;
Var Local : LongInt ;
Begin
If Lista1.Count > 0 Then Begin
   For Local := 0 To Lista1.Count - 1 Do Begin
      If Lista2.IndexOf ( Lista1[Local] ) = -1 Then Begin
         PUT_EVENTO ( LB,
                      '[' + IntToStr ( Indice_Comparacao_Listas ) + '] ' +
                      Prefixo + ' ADICIONADA [' + Lista1[Local] + ']' ) ;
      End ;
   End ;
End ;
If Lista2.Count > 0 Then Begin
   For Local := 0 To Lista2.Count - 1 Do Begin
      If Lista1.IndexOf ( Lista2[Local] ) = -1 Then Begin
         PUT_EVENTO ( LB,
                      '[' + IntToStr ( Indice_Comparacao_Listas ) + '] ' +
                      Prefixo + ' REMOVIDA [' + Lista2[Local] + ']' ) ;
      End ;
   End ;
End ;
End ;

Function NUMERO ( Aux : Int64 ; _Size : LongInt ) : String ;
Begin
Result := Format ( '%.0n', [ Aux * 1.0] ) ;
While Length ( Result ) < _Size Do Begin
   Result := #32 + Result ;
End ;
End ;

Function GetUrlContent ( Const Url : String ) : String ;
var NetHandle: HINTERNET;
    UrlHandle: HINTERNET;
    Buffer: array[0..1024] of Char;
    BytesRead: dWord;
begin
Result := '';
Try
   NetHandle := InternetOpen('Rabelo Sistemas', INTERNET_OPEN_TYPE_PRECONFIG, Nil, Nil, 0) ;
   If Assigned(NetHandle) Then Begin
      UrlHandle := InternetOpenUrl(NetHandle, PChar(Url), nil, 0, INTERNET_FLAG_RELOAD, 0);
      { UrlHandle valid? Proceed with download }
      If Assigned(UrlHandle) Then Begin
         FillChar(Buffer, SizeOf(Buffer), 0);
         Repeat
           Result := Result + Buffer ;
           FillChar(Buffer, SizeOf(Buffer), 0);
           InternetReadFile(UrlHandle, @Buffer, SizeOf(Buffer), BytesRead);
         Until BytesRead = 0 ;
         InternetCloseHandle(UrlHandle);
       End Else Begin
         { UrlHandle is not valid. Raise an exception. }
          //Raise Exception.CreateFmt('Cannot open URL %s', [Url]);
       End ;
       InternetCloseHandle(NetHandle);
   End Else Begin
       { NetHandle is not valid. Raise an exception }
       //Raise Exception.Create('Unable to initialize Wininet') ;
   End ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception GetUrlContent [' + E.Message + ']' ) ;
   End ;
End ;
End ;

Procedure TASK_GetURLAsString ;
Var lHTTP : TIdHTTP ;
Begin
lHTTP := TIdHTTP.Create ;
Try
   RETORNO_URL_AGENDADA := lHTTP.Get ( URL_AGENDADA ) ;
   PUT_LOG ( 'RETORNO_URL [' + RETORNO_URL_AGENDADA + ']' ) ;
Finally
   lHTTP.Free;
End ;
End ;

Procedure GetURLAsString ( Url : String ) ;
//Var Task : iTask ;
Begin
URL_AGENDADA := Url ;
//Task := TTask.Create ( TASK_GetURLAsString ) ;
//Task.Start ;
TASK_GetURLAsString
End ;

Function SEND_FALA ( Mensagem : String ) : String ;
Begin
Inc ( Indice_GCM ) ;
Mensagem := Mensagem + '. Código ' + IntToStr ( Indice_GCM ) + '.' ;
Result := 'http://www.rabelorastreamento.com.br/lib/r_gcm_teste_comunicacao.php?' +
          '&cliente=' + '156' +
          '&codigo=' + '23' +
          '&conteudo=' + String_To_Hexa ( Mensagem ) +
          '&forcado=' + '1' ;
//GetUrlContent ( Result ) ;
GetURLAsString ( Result ) ;
PUT_LOG ( 'SEND_FALA [' + Mensagem + ']' ) ;
End ;

Function GET_VERSAO_WINDOWS_REGISTRY : String;
var vNome,
    vVersao,
    vCurrentBuild: String;
    Reg: TRegistry;
begin
Reg         := TRegistry.Create ; //Criando um Registro na Memória
Reg.Access  := KEY_READ ; //Colocando nosso Registro em modo Leitura
Reg.RootKey := HKEY_LOCAL_MACHINE ; //Definindo a Raiz
//Abrindo a chave desejada
Reg.OpenKey('\SOFTWARE\Microsoft\Windows NT\CurrentVersion\', true);
//Obtendo os Parâmetros desejados
vNome         := Reg.ReadString('ProductName') ;
vVersao       := Reg.ReadString('CurrentVersion') ;
vCurrentBuild := Reg.ReadString('CurrentBuild') ;
//Montando uma String com a Versão e alguns detalhes
//Result := vNome + ' - ' + vVersao + ' - ' + vCurrentBuild;
Result := vNome ; // + ' - ' + vVersao + ' - ' + vCurrentBuild;
End ;

Function FUNC_Is64BitWindows : Boolean ;
Type TIsWow64Process = function ( hProcess: THandle; var Wow64Process: BOOL ): BOOL ; stdcall ;
Var DLLHandle: THandle ;
    pIsWow64Process: TIsWow64Process ;
Var   IsWow64: BOOL ;
      //WasCalled: BOOL ;
Begin
IsWow64 := FALSE ;
//WasCalled := FALSE ;
//If NOT WasCalled Then Begin
   DllHandle := LoadLibrary('kernel32.dll') ;
   If DLLHandle <> 0 Then Begin
      pIsWow64Process := GetProcAddress(DLLHandle, 'IsWow64Process') ;
      If Assigned(pIsWow64Process) Then Begin
         pIsWow64Process ( GetCurrentProcess, IsWow64 ) ;
      End ;
      //WasCalled := TRUE ;
      FreeLibrary(DLLHandle) ;
   End ;
//End;
Result := IsWow64 ;
End ;

Function CPUType : String ;
Var Reg : TRegistry ;
Begin
CPUType := '' ;
Reg := TRegistry.Create ;
Try
   Reg.RootKey := HKEY_LOCAL_MACHINE ;
   If Reg.OpenKey ( '\Hardware\Description\System\CentralProcessor\0', FALSE ) Then Begin
      CPUType := Reg.ReadString ( 'Identifier' ) ;
   End ;
Finally
   Reg.Free ;
End ;
End ;

function SetToString(Info: PTypeInfo; const Value): String;
var
  LTypeInfo  : PTypeInfo;
  LIntegerSet: TIntegerSet;
  I: Integer;

begin
  Result := '';

    Integer(LIntegerSet) := 0;
    case GetTypeData(Info)^.OrdType of
      otSByte, otUByte: Integer(LIntegerSet)  := Byte(Value);
      otSWord, otUWord: Integer(LIntegerSet)  := Word(Value);
      otSLong, otULong: Integer(LIntegerSet)  := Integer(Value);
    end;

  LTypeInfo  := GetTypeData(Info)^.CompType{$IFNDEF FPC}^{$ENDIF};
  for I := 0 to SizeOf(Integer) * 8 - 1 do
    if I in LIntegerSet then
    begin
      if Result <> '' then Result := Result + ',';
      Result := Result + GetEnumName(LTypeInfo, I);
    end;
end;

Function R_AA ( Str : String ) : String ;
Begin
Str := StringReplace ( Str, '&', '&#38;', [rfReplaceAll, rfIgnoreCase] ) ;
Str := StringReplace ( Str, '"', '&#35;', [rfReplaceAll, rfIgnoreCase] ) ;
Str := StringReplace ( Str, '''', '&#39;', [rfReplaceAll, rfIgnoreCase] ) ;
//Str := StringReplace ( Str, '\', '&#92;', [rfReplaceAll, rfIgnoreCase] ) ;
Result := Str ;
End ;

//Procedure xWriteln ( _Msg : String ) ;
//Begin
//PUT_LOG ( _Msg ) ;
//End ;

//Procedure xxWriteln ( _Msg : String ) ;
//Begin
//End ;

Function KillTask ( ExeFileName : String ) : Integer ;
Const PROCESS_TERMINATE = $0001 ;
Var ContinueLoop    : BOOL ;
    FSnapshotHandle : THandle ;
    FProcessEntry32 : TProcessEntry32 ;
    Contador        : LongInt ;
Begin
Result := 0 ;
FSnapshotHandle := CreateToolhelp32Snapshot ( TH32CS_SNAPPROCESS, 0) ;
FProcessEntry32.dwSize := SizeOf ( FProcessEntry32 ) ;
ContinueLoop := Process32First ( FSnapshotHandle, FProcessEntry32) ;
Contador := 0 ;
While Integer(ContinueLoop) <> 0 Do Begin
   If (
      ( UpperCase(ExtractFileName(FProcessEntry32.szExeFile)) = UpperCase(ExeFileName) ) OR
      ( UpperCase(FProcessEntry32.szExeFile) = UpperCase(ExeFileName) )
      ) Then Begin
      Result := Integer ( TerminateProcess ( OpenProcess ( PROCESS_TERMINATE, BOOL(0),
                                                           FProcessEntry32.th32ProcessID), 0 ) ) ;
      Inc ( Contador ) ;
      PUT_LOG ( 'KillProcess [' + ExeFileName + '][' + FProcessEntry32.szExeFile + '][Cnt ' + IntToStr(Contador) + ']' ) ;
   End ;
   ContinueLoop := Process32Next ( FSnapshotHandle, FProcessEntry32 ) ;
End ;
CloseHandle ( FSnapshotHandle ) ;
PUT_LOG ( 'Final de KillProcess [' + ExeFileName + '][Cnt ' + IntToStr(Contador) + ']' ) ;
End ;

Function Is_Win_Server : Boolean ;
Const VER_NT_SERVER      = $0000003 ;
      VER_EQUAL          = 1 ;
      VER_GREATER_EQUAL  = 3 ;
Var osvi             : OSVERSIONINFOEX ;
    dwlConditionMask : DWORDLONG ;
    op               : Integer ;
Begin
dwlConditionMask := 0 ;
op := VER_GREATER_EQUAL ;
ZeroMemory(@osvi, sizeof(OSVERSIONINFOEX)) ;
osvi.dwOSVersionInfoSize := sizeof(OSVERSIONINFOEX) ;
osvi.dwMajorVersion := 5 ;
osvi.dwMinorVersion := 0 ;
osvi.wServicePackMajor := 0 ;
osvi.wServicePackMinor := 0 ;
osvi.wProductType := VER_NT_SERVER ;
dwlConditionMask:=VerSetConditionMask( dwlConditionMask, VER_MAJORVERSION, op ) ;
dwlConditionMask:=VerSetConditionMask( dwlConditionMask, VER_MINORVERSION, op ) ;
dwlConditionMask:=VerSetConditionMask( dwlConditionMask, VER_SERVICEPACKMAJOR, op ) ;
dwlConditionMask:=VerSetConditionMask( dwlConditionMask, VER_SERVICEPACKMINOR, op ) ;
dwlConditionMask:=VerSetConditionMask( dwlConditionMask, VER_PRODUCT_TYPE, VER_EQUAL ) ;
Result := VerifyVersionInfo ( osvi , VER_MAJORVERSION OR
                                     VER_MINORVERSION OR
                                     VER_SERVICEPACKMAJOR OR
                                     VER_SERVICEPACKMINOR OR
                                     VER_PRODUCT_TYPE, dwlConditionMask ) ;
End ;

Function ByteToBinStr(AValue : Byte) : String ;
Const Bits : array [1 .. 8] of Byte = (128, 64, 32, 16, 8, 4, 2, 1);
Var i : integer;
Begin
Result := '00000000' ;
If (AValue <> 0) Then
   For i := 1 To 8 Do
      If (AValue AND Bits[i]) <> 0 Then
         Result[i] := '1' ;
End;

//Universal Time (UTC) format of YYYYMMDDHHMMSS.MMMMMM(+-)OOO.
//20091231000000.000000+000
Function UtcToDateTime ( Const V : OleVariant ) : TDateTime ;
Var DT : OleVariant ;
Begin
Result := 0 ;
If VarIsNull(V) Then Begin
   Exit ;
End ;
DT := CreateOleObject ( 'WbemScripting.SWbemDateTime' ) ;
DT.Value := V ;
Result := DT.GetVarDate ;
End ;

Function CONVERT_IDSTATUS_TO_STR ( Code : TIdStatus ) : String ;
Begin
Case Code Of
hsResolving     : Result :=  'hsResolving' ;
hsConnecting    : Result :=  'hsConnecting' ;
hsConnected     : Result :=  'hsConnected' ;
hsDisconnecting : Result :=  'hsDisconnecting' ;
hsDisconnected  : Result :=  'hsDisconnected' ;
hsStatusText    : Result :=  'hsStatusText' ;
ftpTransfer     : Result :=  'ftpTransfer' ;
ftpReady        : Result :=  'ftpReady' ;
ftpAborted      : Result :=  'ftpAborted' ;
End ;
End ;

Function CONVERT_LOGCODE_TO_STR ( Code : TFtpLogCode ) : String ;
Begin
Case Code Of
lcClose     : Result :=  'lcClose' ;
lcOpen      : Result :=  'lcOpen' ;
lcLogout    : Result :=  'lcLogout' ;
lcLogin     : Result :=  'lcLogin' ;
lcDelete    : Result :=  'lcDelete' ;
lcRename    : Result :=  'lcRename' ;
lcReceive   : Result :=  'lcReceive' ;
lcStore     : Result :=  'lcStore' ;
lcComplete  : Result :=  'lcComplete' ;
lcRestart   : Result :=  'lcRestart' ;
lcTimeout   : Result :=  'lcTimeout' ;
lcUserAbort : Result :=  'lcUserAbort' ;
End ;
End ;

Function CONVERT_STATUSCODE_TO_STR ( Code : TFtpStatusCode ) : String ;
Begin
Case Code Of
scClose      : Result :=  'scClose' ;
scOpen       : Result :=  'scOpen' ;
scLogout     : Result :=  'scLogout' ;
scLogin      : Result :=  'scLogin' ;
scComplete   : Result :=  'scComplete' ;
scCurrentDir : Result :=  'scCurrentDir' ;
scDataAvail  : Result :=  'scDataAvail' ;
scProgress   : Result :=  'scProgress' ;
scTransferOK : Result :=  'scTransferOK' ;
scTimeout    : Result :=  'scTimeout' ;
End ;
End ;

Function GET_ERROR_EVENT ( Evento : TErrorEvent ) : String ;
Begin
If Evento = eeGeneral Then Begin
   Result := 'eeGeneral' ;
End Else If Evento = eeSend Then Begin
   Result := 'eeSend' ;
End Else If Evento = eeReceive Then Begin
   Result := 'eeReceive' ;
End Else If Evento = eeConnect Then Begin
   Result := 'eeConnect' ;
End Else If Evento = eeDisconnect Then Begin
   Result := 'eeDisconnect' ;
End Else If Evento = eeAccept Then Begin
   Result := 'eeAccept' ;
End Else If Evento = eeLookup Then Begin
   Result := 'eeLookup' ;
End Else Begin
   Result := 'INDEFINIDO' ;
End ;
End ;

Function DT_FTP_TO_DATETIME ( _Mes, _Dia, _Ano_Hora : String ) : TDateTime ;
Var Dia, Mes : LongInt ;
//    HR : TDateTime ;
Begin
Result := 0 ;
Mes := MES_STR_TO_INT ( _Mes ) ;
Dia := StrToIntDef ( _Dia, 0 ) ;
//PUT_LOG ( 'DT_FTP [' + _Mes + '][' + _Dia + '][' + _Ano_Hora + ']' ) ;
If ( Dia = 0 ) OR ( Mes = 0 ) Then Begin
   Exit ;
End ;
If Pos ( ':', _Ano_Hora ) > 0 Then Begin
   Result := StrToDateTime ( StrZero(Dia,2) + '/' +
                             StrZero(Mes,2) + '/' +
                             StrZero(YearOf ( Now ),4) + ' ' +
                             _Ano_Hora + ':00' ) ;
End Else Begin
   Result := StrToDateTime ( StrZero(Dia,2) + '/' +
                             StrZero(Mes,2) + '/' +
                             _Ano_Hora + ' ' +
                             '00:00:00' ) ;
End ;
End ;

{
Function codifica(chave: String; tamanho : Integer): String;
var c : char;
    i : Integer;
begin
i := 1;
c := #0;
while (tamanho <> 0) do begin
   chave[i] := chr(((ord(chave[i]) xor 53) + 41) xor ord(c));
   c := chave[i];
   inc(i);
   dec(tamanho);
end;
codifica := chave;
end;


function decodifica ( Chave: String ; Tamanho : Integer ) : String;
var c, c1 : char;
    i     : Integer;
begin
i := 1;
c := #0;
while (tamanho <> 0) do begin
   c1 := chave[i];
   chave[i] := chr(((ord(chave[i]) xor ord(c)) - 41) xor 53);
   c := c1;
   inc(i);
   dec(tamanho);
end;
decodifica := chave;
end;

Function xEncryptSTR( InString : String ) : String ;
Var I       : Byte ;
    Base64  : TBase64Encoding ;
Begin
Result := '' ;
For I := 1 To Length(InString) Do Begin
   Result := Result + Char(Byte(InString[I]) XOR (StartKey SHR 8)) ;
   StartKey := (Byte(Result[I]) + StartKey) * MultKey + AddKey ;
End ;
Base64 := TBase64Encoding.Create(0);
Result := Base64.Encode ( Result ) ;
End ;

Function xDecryptSTR( InString : String ) : String ;
Var I : Byte ;
    Base64  : TBase64Encoding ;
Begin
Base64 := TBase64Encoding.Create(0);
InString := Base64.Decode ( InString ) ;
Result := '' ;
For I := 1 To Length(InString) Do Begin
   Result := Result + Char(Byte(InString[I]) XOR (StartKey SHR 8)) ;
   StartKey := (Byte(InString[I]) + StartKey) * MultKey + AddKey ;
End ;
End ;
}

Function PROC_COD_DECOD_ARQUIVO ( Codifica : Boolean ;
                                  Origem , Destino : String ) : Byte ;
Var   _Arq_Origem    ,
      _Arq_Destino   : File ;
      Local          ,
      //TT_Lidos       ,
      //TT_Gravados    ,
      Pnt_Chave      ,
      Lidos          ,
      Gravados       : LongInt ;
      Direita        : Boolean ;
      Original       : Byte ;
      _Temporario    : String ;
      _Byte          : Byte ;
Begin
If CopiaArquivo ( 'PROC_COD_DECOD_ARQUIVO/1',
                  Origem, Destino, SOBREPOE ) Then Begin
End ;
//Exit ;
_Debug ( 'INI COD_DECOD_ARQUIVO [' + Origem + '/' + Destino + ']' ) ;
_Temporario := Dir_Temp + 'Cod_Decod.Tmp' ;
//_Debug ( '1 COD_DECOD_ARQUIVO [' + Origem + '/' + Destino + ']' ) ;
If RR_DeleteFile ( 'PROC COD_DECOD_ARQUIVO/1', _Temporario ) Then Begin
End ;
//_Debug ( '2 COD_DECOD_ARQUIVO [' + Origem + '/' + Destino + ']' ) ;
AssignFile ( _Arq_Origem  , Origem ) ;
//_Debug ( '3 COD_DECOD_ARQUIVO [' + Origem + '/' + Destino + ']' ) ;
AssignFile ( _Arq_Destino , _Temporario ) ;
//_Debug ( '4 COD_DECOD_ARQUIVO [' + Origem + '/' + Destino + ']' ) ;
If NOT RR_FileExists ( 'PROC COD_DECOD_ARQUIVO/1', Origem ) Then Begin
   Result := 1 ;
   _Debug ( 'Exit 1 COD_DECOD_ARQUIVO [' + Origem + '/' + Destino + ']' ) ;
   Exit ;
End ;
{$i-}
//_Debug ( '5 COD_DECOD_ARQUIVO [' + Origem + '/' + Destino + ']' ) ;
Reset ( _Arq_Origem , 1 ) ;
//_Debug ( '6 COD_DECOD_ARQUIVO [' + Origem + '/' + Destino + ']' ) ;
If IoResult <> 0 Then Begin
   Result := 2 ;
   _Debug ( 'Exit 2 COD_DECOD_ARQUIVO [' + Origem + '/' + Destino + ']' ) ;
   Exit ;
End ;
//_Debug ( '7 COD_DECOD_ARQUIVO [' + Origem + '/' + Destino + ']' ) ;
ReWrite ( _Arq_Destino , 1 ) ;
//_Debug ( '8 COD_DECOD_ARQUIVO [' + Origem + '/' + Destino + ']' ) ;
If IoResult <> 0 Then Begin
   Result := 3 ;
   _Debug ( 'Exit 3 COD_DECOD_ARQUIVO [' + Origem + '/' + Destino + ']' ) ;
   Exit ;
End ;
//_Debug ( '9 COD_DECOD_ARQUIVO [' + Origem + '/' + Destino + ']' ) ;
Lidos := 1 ;
Pnt_Chave := 1 ;
//TT_Lidos := 0 ;
//TT_Gravados := 0 ;
//COD_DECOD_ARQUIVO := 0 ;
Direita := TRUE ;
Randomize ;
//_Debug ( '10 COD_DECOD_ARQUIVO [' + Origem + '/' + Destino + ']' ) ;
PREENCHER_BUFFER ;
//_Debug ( '11 COD_DECOD_ARQUIVO [' + Origem + '/' + Destino + ']' ) ;
If Codifica Then Begin
   //_Debug ( '12 COD_DECOD_ARQUIVO [' + Origem + '/' + Destino + ']' ) ;
   BlockWrite ( _Arq_Destino , Buffer_Login , 1200 , Gravados ) ;
   Inc ( Cnt_Codifica ) ;
   //_Debug ( '13 COD_DECOD_ARQUIVO [' + Origem + '/' + Destino + ']' ) ;
End Else Begin
   //_Debug ( '14 COD_DECOD_ARQUIVO [' + Origem + '/' + Destino + ']' ) ;
   BlockRead ( _Arq_Origem , Buffer_Login , 1200 , Lidos ) ;
   Inc ( Cnt_Decodifica ) ;
   //_Debug ( '15 COD_DECOD_ARQUIVO [' + Origem + '/' + Destino + ']' ) ;
End ;
//_Debug ( '16 COD_DECOD_ARQUIVO [' + Origem + '/' + Destino + ']' ) ;
Repeat
   //_Debug ( '17 COD_DECOD_ARQUIVO [' + Origem + '/' + Destino + ']' ) ;
   BlockRead ( _Arq_Origem , Buffer_Login , SIZE_BUFFER_LOGIN , Lidos ) ;
   //_Debug ( '18 COD_DECOD_ARQUIVO [' + Origem + '/' + Destino + ']' ) ;
   //Inc ( TT_Lidos , Lidos ) ;
   For Local := 1 To SIZE_BUFFER_LOGIN Do Begin
       Original := Buffer_Login[Local] ;
       If Codifica Then Begin
          Buffer_Login[Local] := Ord(Chr(Buffer_Login[Local] + Ord(Chave[Pnt_Chave]))) ;
          Buffer_Login[Local] := Ord(Chr(Buffer_Login[Local] + Ord(Chave2[Pnt_Chave]))) ;
          If Direita Then Begin
             Buffer_Login[Local] := 255 - Buffer_Login[Local] ;
          End ;
          Direita := Odd ( Original ) ;
       End Else Begin
          If Direita Then Begin
             Buffer_Login[Local] := 255 - Buffer_Login[Local] ;
          End ;
          _Byte := Ord(Chr(Buffer_Login[Local] - Ord(Chave[Pnt_Chave]))) ;
          Buffer_Login[Local] := _Byte ;
          _Byte := Ord(Chr(Buffer_Login[Local] - Ord(Chave2[Pnt_Chave]))) ;
          Buffer_Login[Local] := _Byte ;
          Direita := Odd ( Buffer_Login[Local] ) ;
       End ;
       Inc ( Pnt_Chave ) ;
       If Pnt_Chave > Length ( Chave ) Then
          Pnt_Chave := 1 ;
       End ;
   If Lidos > 0 Then Begin
      //_Debug ( '19 COD_DECOD_ARQUIVO [' + Origem + '/' + Destino + ']' ) ;
      BlockWrite ( _Arq_Destino , Buffer_Login , Lidos , Gravados ) ;
      //_Debug ( '20 COD_DECOD_ARQUIVO [' + Origem + '/' + Destino + ']' ) ;
      //Inc ( TT_Gravados , Gravados ) ;
   End ;
   //_Debug ( '21 COD_DECOD_ARQUIVO [' + Origem + '/' + Destino + ']' ) ;
Until ( Lidos = 0 ) OR ( Lidos <> Gravados ) ;
_Debug ( '22 COD_DECOD_ARQUIVO [' + Origem + '/' + Destino + ']' ) ;
If ByPass AND FALSE Then Begin
   PUT_LOG ( 'Função : ' + IIF ( Codifica , 'Codificar' , 'Decodificar' ) + ' ' +
             'Origem : "' + Origem + '"' + ' ' +
             'Destino : "' + Destino + '"' + ' ' ) ;
End ;
_Debug ( '23 COD_DECOD_ARQUIVO [' + Origem + '/' + Destino + ']' ) ;
CloseFile ( _Arq_Origem ) ;
If IoResult <> 0 Then Begin
   Result := 4 ;
   _Debug ( 'Exit 4 COD_DECOD_ARQUIVO [' + Origem + '/' + Destino + ']' ) ;
   Exit ;
End ;
_Debug ( '24 COD_DECOD_ARQUIVO [' + Origem + '/' + Destino + ']' ) ;
CloseFile ( _Arq_Destino ) ;
_Debug ( '25 COD_DECOD_ARQUIVO [' + Origem + '/' + Destino + ']' ) ;
If IoResult <> 0 Then Begin
   Result := 5 ;
   _Debug ( 'Exit 5 COD_DECOD_ARQUIVO [' + Origem + '/' + Destino + ']' ) ;
   Exit ;
End ;
_Debug ( '26 COD_DECOD_ARQUIVO [' + Origem + '/' + Destino + ']' ) ;
If RR_FileExists ( 'PROC_COD_DECOD_ARQUIVO/2', _Temporario ) Then Begin
   _Debug ( '27 COD_DECOD_ARQUIVO [' + Origem + '/' + Destino + ']' ) ;
   If CopiaArquivo ( 'PROC_COD_DECOD_ARQUIVO/2',
                     _Temporario , Destino , SOBREPOE ) Then Begin
      Result := 0
   End Else Begin
      Result := 6 ;
   End ;
   _Debug ( '28 COD_DECOD_ARQUIVO [' + Origem + '/' + Destino + ']' ) ;
End Else Begin
   Result := 7 ;
End ;
_Debug ( '29 COD_DECOD_ARQUIVO [' + Origem + '/' + Destino + ']' ) ;
If IS_LOGIN_RICARDO Then Begin
   _Debug ( '30 COD_DECOD_ARQUIVO [' + Origem + '/' + Destino + ']' ) ;
   MIN_DISKFREE_TEMP := MIN ( MIN_DISKFREE_TEMP , DiskFree ( Ord ( Dir_TempX3[1] ) - 64 ) ) ;
   _Debug ( '31 COD_DECOD_ARQUIVO [' + Origem + '/' + Destino + ']' ) ;
End ;
_Debug ( '32 COD_DECOD_ARQUIVO [' + Origem + '/' + Destino + ']' ) ;
If RR_DeleteFile ( 'PROC COD_DECOD_ARQUIVO/2', _Temporario ) Then Begin
End ;
_Debug ( 'FIM COD_DECOD_ARQUIVO [' + Origem + '/' + Destino + ']' ) ;
End ;

Procedure PREENCHER_BUFFER ;
Var Local : LongInt ;
Begin
For Local := 1 To 1200 Do Begin
   Buffer_Login[Local] := Random ( 256 ) ;
End ;
End ;

Procedure CRIAR_PN_DRIVES ( _Form : TForm ; _Parent : TWinControl ) ;
Var Local : LongInt ;
Begin
For Local := 1 To 26 Do Begin
   Sup.PN_Drives[Local].PN := TPanel.Create ( _Form ) ;
   Sup.PN_Drives[Local].PN.Parent := _Parent ;
   Sup.PN_Drives[Local].PN.Visible := FALSE ;
   Sup.PN_Drives[Local].PN.Caption := '' ;
   Sup.PN_Drives[Local].PN.Align := alLeft ;
   Sup.PN_Drives[Local].PN.Width := 60 ;
   Sup.PN_Drives[Local].PN.Tag := Local ;
   Sup.PN_Drives[Local].PN.ShowHint := FALSE ;
   PN_PADRAO ( Sup.PN_Drives[Local].PN ) ;
   //
   Sup.PN_Drives[Local].LB_Ocupado := TLabel.Create ( _Form ) ;
   Sup.PN_Drives[Local].LB_Ocupado.Parent := Sup.PN_Drives[Local].PN ;
   Sup.PN_Drives[Local].LB_Ocupado.Visible := TRUE ;
   Sup.PN_Drives[Local].LB_Ocupado.Align := alTop ;
   Sup.PN_Drives[Local].LB_Ocupado.Alignment := taCenter ;
   Sup.PN_Drives[Local].LB_Ocupado.Caption := '' ;
   Sup.PN_Drives[Local].LB_Ocupado.Height := 14 ;
   Sup.PN_Drives[Local].LB_Ocupado.Tag := Local ;
   Sup.PN_Drives[Local].LB_Ocupado.ShowHint := TRUE ;
   Sup.PN_Drives[Local].LB_Ocupado.Transparent := TRUE ;
   Sup.PN_Drives[Local].LB_Ocupado.Font.Style := [fsBold] ;
   LABEL_PADRAO ( Sup.PN_Drives[Local].LB_Ocupado ) ;
   //
   Sup.PN_Drives[Local].LB_Size := TLabel.Create ( _Form ) ;
   Sup.PN_Drives[Local].LB_Size.Parent := Sup.PN_Drives[Local].PN ;
   Sup.PN_Drives[Local].LB_Size.Visible := TRUE ;
   Sup.PN_Drives[Local].LB_Size.Align := alTop ;
   Sup.PN_Drives[Local].LB_Size.Alignment := taCenter ;
   Sup.PN_Drives[Local].LB_Size.Caption := '' ;
   Sup.PN_Drives[Local].LB_Size.Height := 14 ;
   Sup.PN_Drives[Local].LB_Size.Tag := Local ;
   Sup.PN_Drives[Local].LB_Size.ShowHint := TRUE ;
   Sup.PN_Drives[Local].LB_Size.Transparent := TRUE ;
   Sup.PN_Drives[Local].LB_Size.Font.Style := [fsBold] ;
   LABEL_PADRAO ( Sup.PN_Drives[Local].LB_Size ) ;
   //
   Sup.PN_Drives[Local].LB_Type := TLabel.Create ( _Form ) ;
   Sup.PN_Drives[Local].LB_Type.Parent := Sup.PN_Drives[Local].PN ;
   Sup.PN_Drives[Local].LB_Type.Visible := TRUE ;
   Sup.PN_Drives[Local].LB_Type.Alignment := taCenter ;
   Sup.PN_Drives[Local].LB_Type.Align := alTop ;
   Sup.PN_Drives[Local].LB_Type.Caption := '' ;
   Sup.PN_Drives[Local].LB_Type.Height := 14 ;
   Sup.PN_Drives[Local].LB_Type.Tag := Local ;
   Sup.PN_Drives[Local].LB_Type.ShowHint := TRUE ;
   Sup.PN_Drives[Local].LB_Type.Transparent := TRUE ;
   Sup.PN_Drives[Local].LB_Type.Font.Style := [fsBold] ;
   LABEL_PADRAO ( Sup.PN_Drives[Local].LB_Type ) ;
   //
   Sup.PN_Drives[Local].LB_Drive := TLabel.Create ( _Form ) ;
   Sup.PN_Drives[Local].LB_Drive.Parent := Sup.PN_Drives[Local].PN ;
   Sup.PN_Drives[Local].LB_Drive.Visible := TRUE ;
   Sup.PN_Drives[Local].LB_Drive.Align := alTop ;
   Sup.PN_Drives[Local].LB_Drive.Alignment := taCenter ;
   Sup.PN_Drives[Local].LB_Drive.Caption := '' ;
   Sup.PN_Drives[Local].LB_Drive.Height := 14 ;
   Sup.PN_Drives[Local].LB_Drive.Tag := Local ;
   Sup.PN_Drives[Local].LB_Drive.ShowHint := TRUE ;
   Sup.PN_Drives[Local].LB_Drive.Transparent := TRUE ;
   Sup.PN_Drives[Local].LB_Drive.Font.Style := [fsBold] ;
   LABEL_PADRAO ( Sup.PN_Drives[Local].LB_Drive ) ;
   //
   //Sup.PN_Drives[Local].Disponivel := FALSE ;
   //Sup.PN_Drives[Local].Ok := FALSE ;
   //Sup.PN_Drives[Local].Nova_Midia := FALSE ;
   //Sup.PN_Drives[Local].Last_OK := Now - 1 ;
   //Sup.PN_Drives[Local].Last_NOK := Now - 1 ;
End ;
For Local := 26 DownTo 1 Do Begin
   Sup.PN_Drives[Local].PN.Visible := ( Local >= INI_PN_DRIVES ) AND ( Local <= FIM_PN_DRIVES ) ;
End ;
End ;

Procedure PREPARAR_SUP ( _Form : TForm ) ;
Begin
Sup.Sup_Form := _Form ;
Sup.DT_Load := Now ;
Sup.Tick_Load := GetTickCount ;
Sup.Indice_Registro := 1 ;
Sup.Lista_Interfaces_Old := TStringList.Create ;
Sup.Lista_Audio_In_Old := TStringList.Create ;
Sup.Lista_Audio_Out_Old := TStringList.Create ;
Sup.Lista_Add := TStringList.Create ;
Sup.Lista_Del := TStringList.Create ;
Sup.Sup_Drives_de_Rede := TStringList.Create ;
Sup.SL_Audio_IN := TStringList.Create ;
Sup.SL_Audio_OUT := TStringList.Create ;
Sup.SL_Interfaces := TStringList.Create ;
//Sup.Apps_em_Execucao := TStringList.Create ;
Sup.FLAG_CHECAR_NOVA_MIDIA := FALSE ;
Sup.Flag_Primeira_Execucao_Checar_Audio      := TRUE ;
Sup.Flag_Primeira_Execucao_Checar_Interfaces := TRUE ;
Sup.Flag_Primeira_Execucao_Checar_Apps       := TRUE ;
Sup.Flag_Primeira_Execucao_Checar_Drives     := TRUE ;
Sup.Pendente_Checar_Rede := TRUE ;
Sup.Pendente_Checar_Drives := TRUE ;
Sup.Pendente_Checar_Ping := TRUE ;
Sup.Pendente_Checar_Apps := TRUE ;
Sup.Pendente_Checar_Audio := TRUE ;
Sup.Pendente_Checar_System := TRUE ;
Sup.Pendente_Envio_Primeiro_OK := TRUE ;
Sup.BIOS.SL_OEM_Strings := TStringList.Create ;
//
Sup.Sup_PN_Base_Aplicacoes := Nil ;
Sup.Sup_PN_Ping := Nil ;
Sup.Sup_PN_Hardware_Top_Interfaces_Rede := Nil ;
Sup.Sup_LB_Interfaces_de_Rede := Nil ;
Sup.Sup_PN_Software_Top_Aplicacoes := Nil ;
Sup.Sup_LB_Eventos := Nil ;
Sup.Sup_PN_Hardware_Top_Audio_IN := Nil ;
Sup.Sup_PN_Hardware_Top_Audio_OUT := Nil ;
Sup.Sup_LB_Audio_IN := Nil ;
Sup.Sup_LB_Audio_OUT := Nil ;
Sup.Sup_LB_Computador := Nil ;
Sup.Sup_LB_Usuario := Nil ;
Sup.Sup_LB_Serial_C := Nil ;
Sup.Sup_ME_RAM := Nil ;
//Sup.Sup_ME_Drives := Nil ;
Sup.Sup_LB_Ram_TT := Nil ;
Sup.Sup_LB_Ram_Uso := Nil ;
Sup.Sup_LB_Monitores := Nil ;
//
End ;

Function GET_AUDIO_DO_VIDEO ( FN : String ; Canal : LongInt ) : String ;
Begin
FN := StringReplace ( FN, '\VIDEO\', '\AUDIO\', [rfReplaceAll] ) ;
Insert ( StrZero( Canal, 2 ) , FN, Length(FN) - 3 ) ;
Result := FN ;
End ;

Function GET_ICONE_DO_VIDEO ( FN : String ) : String ;
Begin
FN := StringReplace ( FN, '\VIDEO\', '\ICON\', [rfReplaceAll] ) ;
Delete ( FN, Length(FN) - 2, 3  ) ;
Result := FN + 'BMP' ;
End ;

Function GET_XML_DO_VIDEO ( FN : String ) : String ;
Begin
FN := StringReplace ( FN, '\VIDEO\', '\CLIP\', [rfReplaceAll] ) ;
Delete ( FN, Length(FN) - 2, 3  ) ;
Result := FN + 'XML' ;
End ;

Function FUNC_IF_APP_EM_EXECUCAO ( Handle : THandle ; App : String ) : Boolean ;
Var Wnd      : hWnd ;
    Buff     : Array [0..127] Of Char ;
    _Caption : Integer ;
Begin
_Debug ( 'INI IF-APP_EM_EXECUCAO' ) ;
//ListBox1.Clear ;
Result := FALSE ;
_Debug ( '1 IF-APP_EM_EXECUCAO' ) ;
Wnd := GetWindow ( Handle, gw_HWndFirst) ;
_Debug ( '2 IF-APP_EM_EXECUCAO' ) ;
While Wnd <> 0 Do Begin
   //_Debug ( '3 IF APP_EM_EXECUCAO' ) ;
   _Caption := GetWindowText ( Wnd, Buff, SizeOf(buff)) ;
   If ( Wnd <> Application.Handle ) AND
//      ( IsWindowVisible( Wnd ) ) AND
      ( GetWindow ( Wnd, gw_Owner ) = 0 ) AND
      ( _Caption <> 0 ) Then Begin
      //_Debug ( '4 IF-APP_EM_EXECUCAO' ) ;
      //GetWindowText ( Wnd, Buff, SizeOf(Buff) ) ;
      //_Debug ( '5 IF APP_EM_EXECUCAO' ) ;
     // App := App + StrPas(Buff) + sLineBreak ;
      //PUT_LOG ( 'PROC IF-APP_EM_EXECUCAO [' + StrPas(Buff) + ']' ) ;
      //_Debug ( '6 IF-APP_EM_EXECUCAO' ) ;
      If Pos ( App, StrPas(Buff) ) > 0 Then Begin
         Result := TRUE ;
         Break ;
      End ;
      //_Debug ( '7 IF-APP_EM_EXECUCAO' ) ;
      //Result.Add ( StrPas(Buff) ) ;
      End ;
   //_Debug ( '8 IF-APP_EM_EXECUCAO' ) ;
   Wnd := GetWindow ( Wnd, gw_hWndNext ) ;
   //_Debug ( '9 IF-APP_EM_EXECUCAO' ) ;
End ;
_Debug ( 'FIM IF-APP_EM_EXECUCAO' ) ;
End ;

Function IS_P2 ( Drive : String ) : Boolean ;
Begin
Result := TRUE ;
Exit ;
{
Try
   Result := DirectoryUsable  ( INSERE_BARRA ( Drive ) + 'CONTENTS' ) ;
Except
   On E : Exception Do Begin
      Result := FALSE ;
      PUT_LOG ( 'Exception IS_P2 [' + Drive + '][' + E.Message + ']' ) ;
   End ;
End ;
}
End ;

Function GET_DRIVE_TYPE ( Drive : String ; _Type : LongInt ) : String ;
Begin
Case _Type Of
   0 : Result := '-' ;
   1 : Result := 'INDEF' ;
   2 : Begin
       Result := 'USB' ;
       If Drive = '' Then Begin
          Exit ;
       End ;
       {
       If DirectoryUsable  ( INSERE_BARRA ( Drive ) + 'CONTENTS' ) Then Begin
          Result := 'P2' ;
       End Else Begin
          Result := 'USB' ;
       End ;
       }
       End ;
   3 : Result := 'HD' ;
   4 : Result := 'REDE' ;
   5 : Result := 'ÓTICO' ;
   6 : Result := 'RAM' ;
   Else
       Result := '???' ;
End ;
End ;

Procedure FECHAR_COMPONENTES ( _Form : TForm ) ;
Var Local : LongInt ;
Begin
For Local := 0 To _Form.ComponentCount - 1 Do Begin
   //If (_Form.Components[Local] Is TALDSAudioPlayer) Then Begin
   //   (_Form.Components[Local] As TALDSAudioPlayer).Enabled := FALSE ;
   //End ;
   If (_Form.Components[Local] Is TApdComPort) Then Begin
      If (_Form.Components[Local] As TApdComPort).Open Then Begin
         (_Form.Components[Local] As TApdComPort).DonePort ;
      End ;
   End ;
End ;
End ;

(*
Procedure TASK_GET_CMD_PROMPT_PIPE_FILE ;
Var Erro     : String ;
    Cmd      : String ;
    _Timeout : Cardinal ;
Begin
If RR_FileExists ( 'TASK_GET_CMD_PROMPT_PIPE_FILE/1', VAR_REG_TASK_CMD.FN ) Then Begin
   If RR_DeleteFile ( 'TASK GET_CMD_PROMPT_PIPE_FILE', VAR_REG_TASK_CMD.FN ) Then Begin
   End ;
End ;
Cmd := '/C ' + VAR_REG_TASK_CMD.Cmd + ' > ' + VAR_REG_TASK_CMD.FN ;
PUT_LOG ( 'START TASK_GET_CMD_PROMPT_PIPE_FILE [' + Cmd + ']' ) ;
ShellExecute ( 0, Nil, 'cmd.exe', PChar( Cmd ), Nil, SW_HIDE) ;
_Timeout := GetTickCount + VAR_REG_TASK_CMD.Timeout ;
While GetTickCount < _Timeout Do Begin
   If RR_FileExists ( 'TASK_GET_CMD_PROMPT_PIPE_FILE/2', VAR_REG_TASK_CMD.FN ) Then Begin
      VAR_REG_TASK_CMD.Tick_End := GetTickCount ;
      Sleep ( 300 ) ;
      VAR_REG_TASK_CMD.Retorno := Trim ( GET_CONTEUDO_2 ( VAR_REG_TASK_CMD.FN, Erro ) ) ;
      Break ;
   End ;
   Sleep ( 100 ) ;
End ;
PUT_LOG ( 'END TASK_GET_CMD_PROMPT_PIPE_FILE' ) ;
VAR_REG_TASK_CMD.Concluido := TRUE ;
VAR_REG_TASK_CMD.Sucesso := VAR_REG_TASK_CMD.Retorno <> '' ;
VAR_REG_TASK_CMD.Flag_Tratar := VAR_REG_TASK_CMD.Sucesso ;
VAR_REG_TASK_CMD.Executando := FALSE ;
End ;
*)

Function PROC_TRATAR_REG_TASK_CMD : Boolean ;
Const COL_TRATAR_REG_TASK_CMD_NODE        = 0 ;
      COL_TRATAR_REG_TASK_CMD_DESCRIPTION = 1 ;
      COL_TRATAR_REG_TASK_CMD_TYPE        = 2 ;
      COL_TRATAR_REG_TASK_CMD_FS          = 3 ;
      COL_TRATAR_REG_TASK_CMD_FREE        = 4 ;
      COL_TRATAR_REG_TASK_CMD_DRIVE       = 5 ;
      COL_TRATAR_REG_TASK_CMD_SIZE        = 6 ;
      COL_TRATAR_REG_TASK_CMD_SERIAL      = 7 ;
      QTDE_TRATAR_REG_TASK_CMD            = 8 ;
Var Lista  : TStringList ;
    //Qtde1  : LongInt ;
    Qtde2  : LongInt ;
    Local  : LongInt ;
    Aux    : String ;
    Matriz : TStringList ;
    Drive  : String ;
    _Log   : String ;
    Indice : LongInt ;
Begin
_Debug( 'INI PROC_TRATAR_REG_TASK_CMD' ) ;
Result := FALSE ;
If NOT RR_FileExists ( 'PROC_TRATAR_REG_TASK_CMD', FN_FTP_P2_Ret_Loop_WMI ) Then Begin
   _Debug( '1 PROC_TRATAR_REG_TASK_CMD' ) ;
   Exit ;
End ;
_Debug( '2 PROC_TRATAR_REG_TASK_CMD' ) ;
VAR_REG_TASK_CMD.Retorno := GET_CONTEUDO_M ( 'PROC_TRATAR_REG_TASK_CMD', FN_FTP_P2_Ret_Loop_WMI ) ;
//VAR_REG_TASK_CMD.Retorno := Trim ( VAR_REG_TASK_CMD.Retorno ) + sLineBreak +
//                            'DESKTOP-B1U99LQ,Removable Disk,2,FAT32,10749411328,E:,16013852672,A663C01D' ;
Lista := TStringList.Create ;
Lista.Text := VAR_REG_TASK_CMD.Retorno ;
_Log := '' ;
Qtde2 := Lista.Count ;
If Qtde2 < 1 Then Begin
   Lista.Free ;
   _Debug( 'Exit 1 PROC_TRATAR_REG_TASK_CMD' ) ;
   Exit ;
End ;
_Debug( '3 PROC_TRATAR_REG_TASK_CMD' ) ;
For Local := 1 To 26 Do Begin
   With Sup.Win32_Volume [ Local ] Do Begin
      Ativo_Old := Ativo_Atual ;
      Ativo_Atual := FALSE ;
   End ;
End ;
//Qtde1 := 0 ;
_Debug( '4 PROC_TRATAR_REG_TASK_CMD' ) ;
For Local := 0 To Qtde2 - 1 Do Begin
   Aux := Trim ( Lista[Local] ) ;
   While Pos ( #32#32, Aux ) > 0 Do Begin
      Aux := StringReplace ( Aux, #32#32, #32, [rfReplaceAll, rfIgnoreCase] ) ;
   End ;
   If Pos ( ',Local Fixed Disk,', Aux ) > 0 Then Begin
      If FLAG_BLOQUEAR_INGEST_DRIVES_FIXOS Then Begin
         Continue ;
      End ;
   End ;
   If Pos ( ',Network Connection,', Aux ) > 0 Then Begin
      Continue ;
   End ;
   If Pos ( '2,,,', Aux ) > 0 Then Begin
      Continue ;
   End ;
   If Pos ( ',Removable Disk,2,FAT32,', Aux ) = 0 Then Begin
      //Continue ;
   End ;
   //PUT_LOG ( 'RETORNO [' + Aux + ']' ) ;
   Matriz := Explode_Simples ( Aux, ',' ) ;
   If Matriz.Count < QTDE_TRATAR_REG_TASK_CMD Then Begin
      Continue ;
   End ;
   //PUT_LOG ( 'Aux [' + Aux + ']' ) ;
   If Length ( Matriz[COL_TRATAR_REG_TASK_CMD_DRIVE] ) = 2 Then Begin
      Drive := UpperCase ( Matriz[COL_TRATAR_REG_TASK_CMD_DRIVE] ) ;
      _Log := _Log + 'OK 1 DRIVE ' + Drive + ' ' + TimeToStr ( Now ) + sLineBreak ;
   End Else Begin
      _Log := _Log + 'CONT 1 ' + TimeToStr ( Now ) + sLineBreak ;
      Continue ;
   End ;
   If Drive = '' Then Begin
      _Log := _Log + 'CONT 2 ' + TimeToStr ( Now ) + sLineBreak ;
      Continue ;
   End ;
   //Inc ( Qtde1 ) ;
   Indice := Ord ( Drive[1] ) - 64 ;
   With Sup.Win32_Volume [ Indice ] Do Begin
      DriveLetter := Drive ;
      Ativo_Atual := TRUE ;
      Inc ( Cnt_WMI ) ;
      Try
         Capacity := StrToInt64(Matriz[COL_TRATAR_REG_TASK_CMD_SIZE]) ;
      Except
         Capacity := 0 ;
      End ;
      Try
         FreeSpace := StrToInt64(Matriz[COL_TRATAR_REG_TASK_CMD_FREE]) ;
      Except
         FreeSpace := 0 ;
      End ;
      Try
         SerialNumberDisk := StrToInt64('$' + Matriz[COL_TRATAR_REG_TASK_CMD_SERIAL]) ;
      Except
         SerialNumberDisk := 0 ;
      End ;
      Try
         FileSystem := Matriz[COL_TRATAR_REG_TASK_CMD_FS] ;
      Except
         FileSystem := 'DESC' ;
      End ;
      Try
         Description := Matriz[COL_TRATAR_REG_TASK_CMD_DESCRIPTION] ;
      Except
         Description := 'DESC' ;
      End ;
      Try
         DriveType := StrToIntDef ( Matriz[COL_TRATAR_REG_TASK_CMD_TYPE], 0 ) ;
      Except
         DriveType := 0 ;
      End ;
      Tipo_Drive := GET_DRIVE_TYPE ( DriveLetter, DriveType ) ;
      _Log := _Log + TimeToStr ( Now ) + ' ' +
              'Size:' + IntToStr(Capacity DIV 1024 DIV 1024 ) + ' MB / ' +
              'Free:' + IntToStr(FreeSpace DIV 1024 DIV 1024 ) + ' MB' +
              sLineBreak ;
      {
      PUT_LOG ( 'DRIVE [' + Drive + '] ' +
                'Size:' + IntToStr(Capacity DIV 1024 DIV 1024 ) + ' MB / ' +
                'Free:' + IntToStr(FreeSpace DIV 1024 DIV 1024 ) + ' MB' ) ;
      }
   End ;
End ;
//ShowMessage ( _Log ) ;
Lista.Free ;
_Debug( '5 PROC_TRATAR_REG_TASK_CMD' ) ;
For Local := 1 To 26 Do Begin
   With Sup.Win32_Volume [ Local ] Do Begin
      If Ativo_Atual Then Begin
         If ( Capacity = 0 ) AND ( Capacity_Old > 0 ) Then Begin
            Flag_Midia_Removida := TRUE ;
         End ;
         If ( Tipo_Drive = 'P2' ) AND ( Tipo_Drive_Old <> 'P2' ) Then Begin
            Flag_Midia_Inserida := DriveLetter ;
            PUT_LOG ( 'SETANDO FLAG Midia_Inserida / ' + DriveLetter + ' / Indice ' + IntToStr ( Indice ) ) ;
         End ;
         Capacity_Old := Capacity ;
         Tipo_Drive_Old := Tipo_Drive ;
      End Else Begin
         If Drive_Selecionado = DriveLetter Then Begin
            Flag_Midia_Removida := TRUE ;
         End ;
         Capacity := 0 ;
         Capacity_Old := 0 ;
         FreeSpace := 0 ;
         Tipo_Drive := '' ;
         Tipo_Drive_Old := '' ;
      End ;
   End ;
End ;
Result := TRUE ;
_Debug( '6 PROC_TRATAR_REG_TASK_CMD' ) ;
INICIALIZAR_REG_TASK_CMD ( VAR_REG_TASK_CMD ) ;
_Debug( 'FIM PROC_TRATAR_REG_TASK_CMD' ) ;
End ;

(*
Procedure GET_CMD_PROMPT_PIPE_FILE ;
Begin
If Assigned ( Sup.Task_Get_Volume ) Then Begin
   If Sup.Task_Get_Volume.Status = TTaskStatus.Running Then Begin
      PUT_LOG ( 'Task Volume em execução' ) ;
      Exit ;
   End ;
End ;
PUT_LOG ( 'EXEC Task GET_CMD_PROMPT_PIPE_FILE' ) ;
VAR_REG_TASK_CMD.Executando := TRUE ;
VAR_REG_TASK_CMD.FN := Diretorio + 'Config\PIPE_FILE.DAT' ;
VAR_REG_TASK_CMD.Tick_Start := GetTickCount ;
VAR_REG_TASK_CMD.Timeout := 3000 ;
VAR_REG_TASK_CMD.FN := Diretorio + 'Config\GET_CMD_PROMPT_PIPE_FILE.DAT' ;
//TASK_GET_CMD_PROMPT_PIPE_FILE ;
Sup.Task_Get_Volume := TTask.Create ( TASK_GET_CMD_PROMPT_PIPE_FILE ) ;
Sup.Task_Get_Volume.Start ;
End ;
*)

Procedure INICIALIZAR_REG_TASK_CMD ( Var Reg : T_Reg_Task_Cmd ) ;
Begin
//Reg.Cmd := '' ;
_Debug( 'INI INICIALIZAR_REG_TASK_CMD' ) ;
Reg.FN := '' ;
Reg.Timeout := 5000 ;
Reg.Retorno := '' ;
Reg.Sucesso := FALSE ;
Reg.Executando := FALSE ;
Reg.Concluido := FALSE ;
Reg.Flag_Tratar := FALSE ;
_Debug( 'FIM INICIALIZAR_REG_TASK_CMD' ) ;
End ;

Procedure FN_PNG_To_BMP ( FN : String ; Const ADest : TBitmap ) ;
Var Stream : TMemoryStream ;
Begin
If NOT RR_FileExists ( 'FN_PNG_To_BMP', FN ) Then Begin
   Exit ;
End ;
Try
   Stream := TMemoryStream.Create ;
   Stream.LoadFromFile ( FN ) ;
   PNG_To_BMP ( Stream, ADest ) ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception FN_PNG_To_BMP [' + FN + '][' + E.Message + ']' ) ;
   End ;
End ;
End ;

Procedure PNG_To_BMP ( Const ASource: TStream ; Const ADest : TBitmap ) ;
Var imgSource : TPNGImage ;
Begin
imgSource := TPNGImage.Create() ;
Try
   ASource.Position := 0 ;
   imgSource.LoadFromStream(ASource) ;
   ADest.Width := imgSource.Width ;
   ADest.Height := imgSource.Height ;
   ADest.Canvas.Pen.Style := psClear ;
   ADest.Canvas.Brush.Color := clwhite ; // cor do fundo, pode usar a função rgb(x,x,x);
   ADest.Canvas.Brush.Style := bsSolid ;
   ADest.Canvas.Rectangle(0, 0, ADest.Width+1, ADest.Height+1) ;
   imgSource.Draw(ADest.Canvas, ADest.Canvas.ClipRect) ;
Finally
   FreeAndNil(imgSource) ;
End ;
End ;

procedure Convert_PNG_BMP ( Origem : String ; xFile : String ) ;
Var BMP : TBitmap;
    PNG : TPNGImage;
Begin
If UpperCase ( ExtractFileExt(xFile) ) <> '.PNG' Then Begin
   ShowMessage ( 'Formato diferente de png' + sLineBreak +
                 'Formato atual : ' + ExtractFileExt(xFile) ) ;
   Exit ;
End ;
PNG := TPNGImage.Create ;
Try
   //PNG.LoadFromFile(xFile) ;
   GET_PNG ( 'Convert_PNG_BMP/' + Origem, PNG, xFile ) ;
   BMP := TBitmap.Create ;
   Try
      BMP.Assign ( PNG ) ;
      BMP.SaveToFile ( ChangeFileExt(xFile, '.bmp' ) ) ;
   Finally
      FreeAndNil(BMP) ;
   End ;
Finally
   FreeAndNil(PNG) ;
End ;
End ;

Function ELIMINAR_LINHAS_VAZIAS_DO_TEXTO ( Conteudo : String ) : String ;
Var SL    : TStringList ;
    Local : LongInt ;
    Qtde  : LongInt ;
Begin
Conteudo := Trim ( Conteudo ) ;
If Conteudo = '' Then Begin
   Result := '' ;
   Exit ;
End ;
SL := TStringList.Create ;
SL.Text := Conteudo ;
Qtde := SL.Count ;
For Local := Qtde - 1 DownTo 0 Do Begin
   If Trim ( SL[Local] ) = '' Then Begin
      SL.Delete(Local) ;
      Continue ;
   End ;
End ;
Result := SL.Text ;
SL.Free ;
End ;

Procedure ELIMINAR_LINHAS_VAZIAS_DA_STRINGLIST ( Var SL : TStringList ) ;
Var Local : LongInt ;
    Qtde  : LongInt ;
Begin
Qtde := SL.Count ;
If Qtde = 0 Then Begin
   Exit ;
End ;
For Local := Qtde - 1 DownTo 0 Do Begin
   If Trim ( SL[Local] ) = '' Then Begin
      SL.Delete(Local) ;
      Continue ;
   End ;
End ;
End ;

Procedure ELIMINAR_SECAO_STRINGLIST ( Var SL : TStringList ; Tag : String ) ;
Var Local    : LongInt ;
    Qtde     : LongInt ;
    Suprimir : Boolean ;
Begin
Qtde := SL.Count ;
If Qtde = 0 Then Begin
   Exit ;
End ;
Suprimir := FALSE ;
For Local := Qtde - 1 DownTo 0 Do Begin
   If Trim ( SL[Local] ) = ( '</' + Tag + '>' ) Then Begin
      Suprimir := TRUE ;
      SL.Delete(Local) ;
      Continue ;
   End ;
   If Trim ( SL[Local] ) = ( '<' + Tag + '>' ) Then Begin
      Suprimir := FALSE ;
      SL.Delete(Local) ;
      Continue ;
   End ;
   If Suprimir Then
      SL.Delete(Local) ;
      Continue ;
   End ;
End ;

Function ATRIBUIR_TAG_STRINGLIST ( Var SL : TStringList ; Tag, Valor : String ) : Boolean ;
Var Local    : LongInt ;
    Qtde     : LongInt ;
Begin
PUT_LOG ( 'INI ATRIBUIR_TAG_STRINGLIST [' + Tag + '][' + Valor + ']' ) ;
Result := FALSE ;
Qtde := SL.Count ;
If Qtde = 0 Then Begin
   PUT_LOG ( 'Exit Qtde=0 ATRIBUIR_TAG_STRINGLIST [' + Tag + '][' + Valor + ']' ) ;
   Exit ;
End ;
Tag := UpperCase ( Tag ) ;
For Local := 0 To Qtde - 2 Do Begin
   If Trim ( UpperCase ( SL[Local] ) ) = ( '<' + Tag + '>' ) Then Begin
      SL[Local+1] := Valor ;
      Result := TRUE ;
      PUT_LOG ( 'Exit OK ATRIBUIR_TAG_STRINGLIST [' + Tag + '][' + Valor + ']' ) ;
      Exit ;
   End ;
End ;
PUT_LOG ( 'Exit NAO OK ATRIBUIR_TAG_STRINGLIST [' + Tag + '][' + Valor + ']' ) ;
End ;

Function ELIMINAR_SLINEBREAK_DE_XML ( FN, Conteudo : String ) : String ;
Begin
If FN <> '' Then Begin
   If NOT RR_FileExists ( 'ELIMINAR_SLINEBREAK_DE_XML', FN ) Then Begin
      Result := '' ;
      Exit ;
   End ;
   Conteudo := GET_CONTEUDO_M ( 'ELIMINAR_SLINEBREAK_DE_XML', FN ) ;
End ;
Conteudo := StringReplace ( Conteudo, sLineBreak + '<' , '<' , [rfReplaceAll] ) ;
Conteudo := StringReplace ( Conteudo, '>' + sLineBreak , '>' , [rfReplaceAll] ) ;
Result := Conteudo ;
If FN <> '' Then Begin
   WRITE_FILE_CORE ( 'ELIMINAR_SLINEBREAK_DE_XML',
                     FN, Result, DELAYED_FALSE ) ;
End ;
End ;

Function GET_CONTEUDO_XML_FORMATADO ( FN : String ) : String ;
Var Conteudo : String ;
    Tick     : Cardinal ;
Begin
Tick := GetTickCount ;
Result := '' ;
If NOT RR_FileExists ( 'GET_CONTEUDO_XML_FORMATADO', FN ) Then Begin
   Exit ;
End ;
Conteudo := GET_CONTEUDO_M ( 'GET_CONTEUDO_XML_FORMATADO', FN ) ;
Conteudo := StringReplace ( Conteudo, '<', sLineBreak + '<' , [rfReplaceAll] ) ;
Conteudo := StringReplace ( Conteudo, '>', '>' + sLineBreak , [rfReplaceAll] ) ;
While Pos ( '> ', Conteudo ) > 0 Do Begin
   Conteudo := StringReplace ( Conteudo, '> ', '>', [rfReplaceAll] ) ;
End ;
While Pos ( ' <', Conteudo ) > 0 Do Begin
   Conteudo := StringReplace ( Conteudo, ' <', '<', [rfReplaceAll] ) ;
End ;
While Pos ( #13#13, Conteudo ) > 0 Do Begin
   Conteudo := StringReplace ( Conteudo, #13#13, #13, [rfReplaceAll] ) ;
End ;
While Pos ( #10#10, Conteudo ) > 0 Do Begin
   Conteudo := StringReplace ( Conteudo, #10#10, #10, [rfReplaceAll] ) ;
End ;
While Pos ( sLineBreak + sLineBreak, Conteudo ) > 0 Do Begin
   Conteudo := StringReplace ( Conteudo, sLineBreak + sLineBreak, sLineBreak , [rfReplaceAll] ) ;
End ;
Conteudo := ELIMINAR_LINHAS_VAZIAS_DO_TEXTO ( Conteudo ) ;
Result := Conteudo ;
Tick := GetTickCount - Tick ;
If Tick > 200 Then Begin
   PUT_LOG ( 'ERRO GET CONTEUDO_XML_FORMATADO Tick[' + IntToStr(Tick) + '][' + FN + ']' ) ;
End ;
End ;

Function RE_GetLastVisibleLine ( RichEdit : TRichEdit ) : Integer ;
Const EM_EXLINEFROMCHAR = WM_USER + 54 ;
Var r : TRect ;
    i : Integer ;
Begin
{
 The EM_GETRECT message retrieves the formatting rectangle
 of an edit control.
}
RichEdit.Perform(EM_GETRECT, 0, Longint(@r));
r.Left := r.Left + 1;
r.Top  := r.Bottom - 2;
{
  The EM_CHARFROMPOS message retrieves information about the character
  closest to a specified point in the client area of an edit control
}
i := RichEdit.Perform(EM_CHARFROMPOS, 0, Integer(@r.topleft));
{
  The EM_EXLINEFROMCHAR message determines which
  line contains the specified character in a rich edit control
}
Result := RichEdit.Perform(EM_EXLINEFROMCHAR, 0, i);
end;

Function RE_MY_GetLastVisibleLine ( RichEdit : TMyRichEdit ) : Integer ;
Const EM_EXLINEFROMCHAR = WM_USER + 54 ;
Var r : TRect ;
    i : Integer ;
begin
{
 The EM_GETRECT message retrieves the formatting rectangle
 of an edit control.
}
RichEdit.Perform(EM_GETRECT, 0, Longint(@r));
r.Left := r.Left + 1;
r.Top  := r.Bottom - 2;
{
  The EM_CHARFROMPOS message retrieves information about the character
  closest to a specified point in the client area of an edit control
}
i := RichEdit.Perform(EM_CHARFROMPOS, 0, Integer(@r.topleft));
{
  The EM_EXLINEFROMCHAR message determines which
  line contains the specified character in a rich edit control
}
Result := RichEdit.Perform(EM_EXLINEFROMCHAR, 0, i);
end;

{
  Sending the EM_GETFIRSTVISIBLELINE message to a multi-line edit control
  finds out which line is the first line visible.
  This is the line that is currently displayed at the top of the control.
}

Function RE_GetFirstVisibleLine ( RichEdit : TRichEdit ) : Integer ;
Begin
Result := RichEdit.Perform(EM_GETFIRSTVISIBLELINE, 0, 0);
End ;

Function ME_GetFirstVisibleLine ( ME : TMemo ) : Integer ;
Begin
Result := ME.Perform(EM_GETFIRSTVISIBLELINE, 0, 0);
End ;

Function RE_MY_GetFirstVisibleLine ( RichEdit : TMyRichEdit ) : Integer ;
Begin
Result := RichEdit.Perform(EM_GETFIRSTVISIBLELINE, 0, 0);
End ;

Procedure AJUSTAR_FORM_POS_CURSOR_MAIN ( Ponto : TPoint ; _Form : TForm ) ;
Begin
_Form.Left := MAX ( 0, MIN ( Ponto.X - _Form.Width - 20, Screen.Width - _Form.Width ) - 20 ) ;
_Form.Top := MAX ( 0, MIN ( Ponto.Y, Screen.Height - _Form.Height ) - 30 ) ;
End ;

Function SELECT_LB_PONTO_E_VIRGULA ( LB : TListBox ) : String ;
Begin
Result := '' ;
If LB.ItemIndex = -1 Then Begin
   Exit ;
End ;
Result := LB.Items[LB.ItemIndex] ;
If Pos ( ';', Result ) = 0 Then Begin
   Exit ;
End ;
Delete ( Result, 1, Pos ( ';', Result ) ) ;
//ShowMessage ( Result ) ;
End ;

Procedure ALTERNAR_LOG ;
Begin
If Log.Visible Then Begin
   Log.Close ;
End Else Begin
   Log.Show ;
   Log.BringToFront ;
End ;
End ;

Procedure SHOW_LOG ;
Begin
If NOT Assigned ( Log ) Then Begin
   Exit ;
End ;
If NOT Log.Visible Then Begin
   Log.Show ;
   Log.BringToFront ;
End ;
End ;

Function GET_FN_DATETIME  ( FN : String ) : TDateTime ;
Var RecDos    : TSearchRec ;
    Resultado : LongInt ;
Begin
Result := 0 ;
If NOT RR_FileExists ( 'GET_FN_DATETIME', FN ) Then Begin
   Exit ;
End ;
Resultado := RR_FindFirst ( 'GET_FN_DATETIME', FN, 0, RecDos ) ;
If Resultado = 0 Then Begin
   Result := RecDos.TimeStamp ;
End ;
SysUtils.FindClose ( RecDos ) ;
End ;

Function GET_LINHA_MEMO ( ME : TMemo ; Linha : LongInt ) : String ;
Begin
Result := '' ;
If ME = Nil Then Begin
   Exit ;
End ;
If Linha >= ME.Lines.Count Then Begin
   Exit ;
End ;
Result := ME.Lines[Linha] ;
End ;

Procedure REMOVER_LINHAS_DUPLAS ( RE : TRichEdit ) ;
Var Qtde  : LongInt ;
    Local : LongInt ;
    Aux   : String ;
Begin
If NOT Assigned ( RE ) Then Begin
   Exit ;
End ;
Qtde := RE.Lines.Count ;
If Qtde < 2 Then Begin
   Exit ;
End ;
For Local := Qtde - 1 DownTo 1 Do Begin
   Aux := Trim ( RE.Lines[Local] ) ;
   If Aux <> '' Then Begin
      Continue ;
   End ;
   If Trim ( RE.Lines[Local-1] ) = '' Then Begin
      RE.Lines.Delete(Local) ;
   End ;
End ;
End ;

Procedure INSERIR_LINHAS_ANTES_DE_TAGS ( RE : TRichEdit ) ;
Var Qtde  : LongInt ;
    Local : LongInt ;
    Str   : String ;
Begin
If NOT Assigned ( RE ) Then Begin
   Exit ;
End ;
Qtde := RE.Lines.Count ;
If Qtde < 2 Then Begin
   Exit ;
End ;
For Local := Qtde - 1 DownTo 1 Do Begin
   Str := Trim ( RE.Lines[Local] ) ;
   If Str = '' Then Begin
      Continue ;
   End ;
   If ( Str[1] = '#' ) AND ( Trim ( RE.Lines[Local] ) <> '' ) Then Begin
      RE.Lines.Insert(Local, '') ;
   End ;
End ;
End ;

Function GET_FN_FRAMES_GERADOS : String ;
Begin
Result := Diretorio + 'Config\Frames_Gerados.TXT' ;
End ;

Function GET_FN_FFMPEG_EXE : String ;
Begin
Result := Diretorio + 'config\ffmpeg\bin\ffmpeg.exe' ;
End ;

Function GET_FN_FFPROBE_EXE : String ;
Begin
Result := Diretorio + 'config\ffmpeg\bin\ffprobe.exe' ;
End ;

Function GET_FN_HISTORICO_FRAMES : String ;
Begin
Result := Diretorio + 'Config\Historico.DAT' ;
End ;

Function GET_FN_HISTORICO_VIDEO : String ;
Begin
Result := Diretorio + 'Config\Historico_Video.DAT' ;
End ;

Function CONDICIONAR_PARCIAL ( Parcial : String ) : String ;
Begin
Result := Parcial ;
While Pos ( #32#32, Result ) > 0 Do Begin
   Result := StringReplace ( Result, #32#32, #32, [rfReplaceAll] ) ;
End ;
While Pos ( '= ', Result ) > 0 Do Begin
   Result := StringReplace ( Result, '= ', '=', [rfReplaceAll] ) ;
End ;
While Pos ( ' :', Result ) > 0 Do Begin
   Result := StringReplace ( Result, ' :', ':', [rfReplaceAll] ) ;
End ;
While Pos ( ', ', Result ) > 0 Do Begin
   Result := StringReplace ( Result, ', ', ' ', [rfReplaceAll] ) ;
End ;
While Pos ( ' / ', Result ) > 0 Do Begin
   Result := StringReplace ( Result, ' / ', '/', [rfReplaceAll] ) ;
End ;
While Pos ( ' -> ', Result ) > 0 Do Begin
   Result := StringReplace ( Result, ' -> ', '->', [rfReplaceAll] ) ;
End ;
Result := Trim ( Result ) ;
End ;

Function GET_IDX_STR ( Str, Tag : String ) : LongInt ;
Begin
Result := Pos ( Tag, Str ) ;
End ;

Function GET_PARAMETRO_ANTERIOR ( Str, _Tag : String ) : String ;
Var Idx   : LongInt ;
    Local : LongInt ;
Begin
//PUT_LOG ( 'GPA/1 [' + Str + '][' + _Tag + ']' ) ;
Result := '' ;
Idx := Pos ( _Tag, Str ) ;
If Idx = 0 Then Begin
   //PUT_LOG ( 'GPA/2 Exit' ) ;
   Exit ;
End ;
Delete ( Str, Idx, Length ( Str ) ) ;
If Str = '' Then Begin
   //PUT_LOG ( 'GPA/3 Exit' ) ;
   Exit ;
End ;
//PUT_LOG ( 'GPA/4 [' + IntToStr(Idx) + '][' + Str + ']' ) ;
For Local := Length ( Str ) DownTo 1 Do Begin
   If Pos ( Str[Local], ' [{,' ) > 0 Then Begin
      Exit ;
   End ;
   Result := Str[Local] + Result ;
End ;
End ;

Function GET_PARAMETRO_POSTERIOR ( Str, _Tag : String ) : String ;
Var Idx   : LongInt ;
    Local : LongInt ;
Begin
//PUT_LOG ( 'GPP/1 [' + Str + '][' + _Tag + ']' ) ;
Result := '' ;
Idx := Pos ( _Tag, Str ) ;
If Idx = 0 Then Begin
   //PUT_LOG ( 'GPP/2 Exit' ) ;
   Exit ;
End ;
Delete ( Str, 1, Idx + Length(_Tag) - 1 ) ;
If Str = '' Then Begin
   //PUT_LOG ( 'GPP/3 Exit' ) ;
   Exit ;
End ;
//PUT_LOG ( 'GPP/4 [' + IntToStr(Idx) + '][' + Str + ']' ) ;
For Local := 1 To Length ( Str ) Do Begin
   If Pos ( Str[Local], ' ]},' ) > 0 Then Begin
      Exit ;
   End ;
   Result := Result + Str[Local] ;
End ;
End ;

Function PONTO_TO_VIRG ( Aux : String ) : String ;
Begin
Result := StringReplace ( Aux, '.', ',', [rfReplaceAll] ) ;
End ;

(*
Function TC_STR_TO_FRAMES ( Segundos : String ; FPS : Single ) : LongInt ;
Begin
{
00:20:22.58
}
Result := 0 ;
If Length ( TC ) <> 14 Then Begin
   Exit ;
End ;
Result := TRUNC ( _Segundos ) ;
End ;
*)

Procedure LIMPAR_CONTAGEM_CARACTERES ( Var Reg : R_Contagem_Caracteres ) ;
Begin
With Reg Do Begin
   _Total := 0 ;
   Nulos := 0 ;
   Especiais := 0 ;
   _Delete := 0 ;
   Backspace := 0 ;
   _Tab := 0 ;
   _LF := 0 ;
   _CR := 0 ;
   Espacos := 0 ;
   Pontos := 0 ;
   Virgulas := 0 ;
   Letras := 0 ;
   X := 0 ;
   Digitos := 0 ;
   Superiores := 0 ;
   Outros := 0 ;
End ;
End ;

Procedure CONTAR_CARACTERES_REG ( Aux : String ; Var Reg : R_Contagem_Caracteres ) ;
Var Local : LongInt ;
Begin
LIMPAR_CONTAGEM_CARACTERES ( Reg ) ;
If Aux = '' Then Begin
   Exit ;
End ;
Reg._Total := Length ( Aux ) ;
For Local := 1 To Reg._Total Do Begin
   Case Ord ( Aux[Local] ) Of
   0                  : Inc ( Reg.Nulos ) ;
   1..6               : Inc ( Reg.Especiais ) ;
   7                  : Inc ( Reg._Delete ) ;
   8                  : Inc ( Reg.Backspace ) ;
   9                  : Inc ( Reg._Tab ) ;
   10                 : Inc ( Reg._LF ) ;
   11..12             : Inc ( Reg.Especiais ) ;
   13                 : Inc ( Reg._CR ) ;
   14..31             : Inc ( Reg.Especiais ) ;
   32                 : Inc ( Reg.Espacos ) ;
   Ord('.')           : Inc ( Reg.Pontos ) ;
   Ord(',')           : Inc ( Reg.Virgulas ) ;
   Ord('X'),Ord('x')  : Begin
                        Inc ( Reg.Letras ) ;
                        Inc ( Reg.X ) ;
                        End ;
   Ord('A')..Ord('V') ,
   Ord('Y')..Ord('Z') ,
   Ord('a')..Ord('v') ,
   Ord('y')..Ord('z') : Inc ( Reg.Letras ) ;
   Ord('0')..Ord('9') : Inc ( Reg.Digitos ) ;
   128..255           : Inc ( Reg.Superiores ) ;
   Else
                        Inc ( Reg.Outros ) ;
   End ;
End ;
End ;

Function IS_RESOLUCAO ( Aux : String ) : TPoint ;
Var Reg   : R_Contagem_Caracteres ;
    Pos_X : LongInt ;
    _Len   : LongInt ;
Begin
Aux := UpperCase ( Trim ( Aux ) ) ;
CONTAR_CARACTERES_REG ( Aux, Reg ) ;
Pos_X := Pos ( 'X', Aux ) ;
_Len := Length ( Aux ) ;
If ( Reg._Total = ( Reg.X + Reg.Digitos ) ) AND
   ( Reg.X = 1 ) AND
   ( Pos ( 'X', Aux ) > 1 ) AND
   ( Pos_X < _Len ) Then Begin
   Result.X := StrToIntDef ( Copy ( Aux, 1, Pos_X - 1 ), 0 ) ;
   Result.Y := StrToIntDef ( Copy ( Aux, Pos_X + 1, _Len ) , 0 ) ;
End Else Begin
   Result.X := 0 ;
   Result.Y := 0 ;
End ;
//PUT_LOG ( 'IS_RESOLUCAO [' + Aux + '] x[' + IntToStr(Reg.X) + '] ' +
//          'XY[' + IntToStr(Result.X) + ':' + IntToStr(Result.Y) + ']' ) ;
End ;

Function FIND_RESOLUCAO ( Orig : String ) : TPoint ;
Var Matriz : TStringList ;
    Local  : LongInt ;
    Qtde   : LongInt ;
Begin
Result.X := 0 ;
Result.Y := 0 ;
//Matriz := TStringList.Create ;
Matriz := EXPLODE ( Orig, ' ' ) ;
Qtde := Matriz.Count ;
If Qtde = 0 Then Begin
   Exit ;
End ;
For Local := 0 To Qtde - 1 Do Begin
   Result := IS_RESOLUCAO ( Matriz[Local] ) ;
   If Result.X > 0 Then Begin
      PUT_LOG ( 'FIND_RESOLUCAO [' + Orig + '] ' +
                'X[' + IntToStr(Result.X) + '] ' +
                'Y[' + IntToStr(Result.Y) + ']' ) ;
      Exit ;
   End ;
End ;
Matriz.Free ;
End ;

(*
ffprobe version N-93125-gdbfd042983 Copyright (c) 2007-2019 the FFmpeg developers
built with gcc 8.2.1 (GCC) 20190212
configuration: --enable-gpl --enable-version3 --enable-sdl2 --enable-fontconfig --enable-gnutls --enable-iconv --enable-libass --enable-libdav1d --enable-libbluray --enable-libfreetype --enable-libmp3lame --enable-libopencore-amrnb --enable-libopencore-amrwb --enable-libopenjpeg --enable-libopus --enable-libshine --enable-libsnappy --enable-libsoxr --enable-libtheora --enable-libtwolame --enable-libvpx --enable-libwavpack --enable-libwebp --enable-libx264 --enable-libx265 --enable-libxml2 --enable-libzimg --enable-lzma --enable-zlib --enable-gmp --enable-libvidstab --enable-libvorbis --enable-libvo-amrwbenc --enable-libmysofa --enable-libspeex --enable-libxvid --enable-libaom --enable-libmfx --enable-amf --enable-ffnvcodec --enable-cuvid --enable-d3d11va --enable-nvenc --enable-nvdec --enable-dxva2 --enable-avisynth --enable-libopenmpt
libavutil      56. 26.100 / 56. 26.100
libavcodec     58. 47.100 / 58. 47.100
libavformat    58. 26.101 / 58. 26.101
libavdevice    58.  6.101 / 58.  6.101
libavfilter     7. 48.100 /  7. 48.100
libswscale      5.  4.100 /  5.  4.100
libswresample   3.  4.100 /  3.  4.100
libpostproc    55.  4.100 / 55.  4.100
Input #0, mov,mp4,m4a,3gp,3g2,mj2, from '_prefeito.mp4':
Metadata:
major_brand     : isom
minor_version   : 512
compatible_brands: isomiso2avc1mp41
encoder         : Lavf58.12.100
Duration: 00:00:52.48, start: 0.000000, bitrate: 1555 kb/s
Stream #0:0(und): Video: h264 (High) (avc1 / 0x31637661), yuv420p, 1440x1080 [SAR 4:3 DAR 16:9], 1546 kb/s, 29.97 fps, 29.97 tbr, 11988 tbn, 59.94 tbc (default)
Metadata:
handler_name    : VideoHandler
timecode        : 00:00:20;07
Stream #0:1(und): Audio: aac (LC) (mp4a / 0x6134706D), 44100 Hz, stereo, fltp, 2 kb/s (default)
Metadata:
handler_name    : SoundHandler
Stream #0:2(eng): Data: none (tmcd / 0x64636D74)
Metadata:
handler_name    : TimeCodeHandler
timecode        : 00:00:20;07
Unsupported codec with id 0 for input stream 2
*)

(*
ffprobe version N-93125-gdbfd042983 Copyright (c) 2007-2019 the FFmpeg developers
built with gcc 8.2.1 (GCC) 20190212
configuration: --enable-gpl --enable-version3 --enable-sdl2 --enable-fontconfig --enable-gnutls --enable-iconv --enable-libass --enable-libdav1d --enable-libbluray --enable-libfreetype --enable-libmp3lame --enable-libopencore-amrnb --enable-libopencore-amrwb --enable-libopenjpeg --enable-libopus --enable-libshine --enable-libsnappy --enable-libsoxr --enable-libtheora --enable-libtwolame --enable-libvpx --enable-libwavpack --enable-libwebp --enable-libx264 --enable-libx265 --enable-libxml2 --enable-libzimg --enable-lzma --enable-zlib --enable-gmp --enable-libvidstab --enable-libvorbis --enable-libvo-amrwbenc --enable-libmysofa --enable-libspeex --enable-libxvid --enable-libaom --enable-libmfx --enable-amf --enable-ffnvcodec --enable-cuvid --enable-d3d11va --enable-nvenc --enable-nvdec --enable-dxva2 --enable-avisynth --enable-libopenmpt
libavutil      56. 26.100 / 56. 26.100
libavcodec     58. 47.100 / 58. 47.100
libavformat    58. 26.101 / 58. 26.101
libavdevice    58.  6.101 / 58.  6.101
libavfilter     7. 48.100 /  7. 48.100
libswscale      5.  4.100 /  5.  4.100
libswresample   3.  4.100 /  3.  4.100
libpostproc    55.  4.100 / 55.  4.100
Input #0, mxf, from 'C:\util\prefeito.mxf':
Metadata:
product_uid     : c03d2336-97c9-7410-9138-001111be66ea
uid             : 5379db01-76af-11e9-8400-0cc47ab187c6
generation_uid  : 5379db02-76af-11e9-a8db-0cc47ab187c6
company_name    : Imagine Communications
product_name    : Nexio MXFConverter
product_version : 4.4.32.0
application_platform: win32
modification_date: 2019-05-14T13:03:01.388000Z
material_package_umid: 0x060A2B340101010501010D21130001003C2A9C3E90371443A094F0ACA600B48E
timecode        : 00:00:20;07
Duration: 00:00:52.45, start: 0.000000, bitrate: 59014 kb/s
Stream #0:0: Data: none
Metadata:
file_package_umid: 0x060A2B340101010501010D12136CEACAB0B8470018860583DA9B0CC47AB187C6
file_package_name: Source Package
track_name      : Track 1
data_type       : vbi_vanc_smpte_436M
Stream #0:1: Video: h264 (High 10 Intra), yuv420p10le(pc, bt709, top first), 1440x1080 [SAR 3:4 DAR 1:1], SAR 4:3 DAR 16:9, 29.97 fps, 29.97 tbr, 29.97 tbn, 59.94 tbc
Metadata:
file_package_umid: 0x060A2B340101010501010D12136CEACAB0B8470018860583DA9B0CC47AB187C6
file_package_name: Source Package
track_name      : Track 2
Stream #0:2: Audio: pcm_s16le, 48000 Hz, 1 channels, s16, 768 kb/s
Metadata:
file_package_umid: 0x060A2B340101010501010D12136CEACAB0B8470018860583DA9B0CC47AB187C6
file_package_name: Source Package
track_name      : Track 3
Stream #0:3: Audio: pcm_s16le, 48000 Hz, 1 channels, s16, 768 kb/s
Metadata:
file_package_umid: 0x060A2B340101010501010D12136CEACAB0B8470018860583DA9B0CC47AB187C6
file_package_name: Source Package
track_name      : Track 4
Stream #0:4: Audio: pcm_s16le, 48000 Hz, 1 channels, s16, 768 kb/s
Metadata:
file_package_umid: 0x060A2B340101010501010D12136CEACAB0B8470018860583DA9B0CC47AB187C6
file_package_name: Source Package
track_name      : Track 5
Stream #0:5: Audio: pcm_s16le, 48000 Hz, 1 channels, s16, 768 kb/s
Metadata:
file_package_umid: 0x060A2B340101010501010D12136CEACAB0B8470018860583DA9B0CC47AB187C6
file_package_name: Source Package
track_name      : Track 6
Unsupported codec with id 0 for input stream 0
*)

Procedure TRATAR_PARCIAL ( Var Reg : T_GetDosOutput ; Aux : String ) ;
Var Orig     : String ;
    //Idx  : LongInt ;
    //Idx_Prev : LongInt ;
    //Idx_Next : LongInt ;
    //Local    : LongInt ;
    Param     : String ;
    Aux2      : String ;
Begin
{
Input #0 mov,mp4,m4a,3gp,3g2,mj2 from 'C:\util\prefeito.mp4':
Duration: 00:00:52.48 start: 0.000000 bitrate: 1555 kb/s
Stream #0:0(und): Video: h264 (High) (avc1/0x31637661) yuv420p 1440x1080 [SAR 4:3 DAR 16:9] 1546 kb/s 29.97 fps 29.97 tbr 11988 tbn 59.94 tbc (default)
frame=0 fps=0.0 q=0.0 size=0kB time=-577014:32:22.77 bitrate=-0.0kbits/s speed=N/A
Stream #0:0->#0:0 (h264 (native)->msmpeg4v3 (msmpeg4))
Stream #0:1->#0:1 (aac (native)->wmav2 (native))
Output #0 asf to 'C:\util\prefeito_CONVERTIDO.wmv':
Stream #0:0(und): Video: msmpeg4v3 (msmpeg4) (MP43/0x3334504D) yuv420p 1440x1080 [SAR 4:3 DAR 16:9] q=2-31 200 kb/s 29.97 fps 1k tbn 29.97 tbc (default)
frame=33 fps=0.0 q=31.0 size=260kB time=00:00:01.16 bitrate=1836.9kbits/s speed=2.28x
frame=52 fps=47 q=31.0 size=360kB time=00:00:01.81 bitrate=1629.0kbits/s speed=1.65x
frame=1572 fps=110 q=31.0 Lsize=23070kB time=00:00:52.43 bitrate=3604.6kbits/s speed=3.67x
video:21913kB audio:820kB subtitle:0kB other streams:0kB global headers:0kB muxing overhead: 1.481806%
}
Orig := Aux ;
//PUT_LOG ( 'PARCIAL Idx[' + IntToStr(Reg.Idx) + '] [' + Orig + ']' ) ;
If Pos ( 'Input #0', Aux ) = 1 Then Begin
   Aux2 := Aux ;
   Delete ( Aux2, 1 , Pos ( '''', Aux2 ) ) ;
   Delete ( Aux2, Pos ( '''', Aux2 ) , Length ( Aux2 ) ) ;
   Reg.Parse_Input := TRUE ;
   Reg.Parse_Output := FALSE ;
   Reg.IN_FN := Aux2 ;
   //PUT_LOG ( 'PARCIAL Idx[' + IntToStr(Reg.Idx) + '] OK/1[' + Orig + ']' ) ;
   ATUALIZAR_LB_STATUS_CONVERSAO_FF ( 'Parc1', Reg, TRUE ) ;
End ;
If Pos ( 'Output #0', Aux ) = 1 Then Begin
   Aux2 := Aux ;
   Delete ( Aux2, 1 , Pos ( '''', Aux2 ) ) ;
   Delete ( Aux2, Pos ( '''', Aux2 ) , Length ( Aux2 ) ) ;
   Reg.Parse_Input := FALSE ;
   Reg.Parse_Output := TRUE ;
   Reg.OUT_FN := Aux2 ;
   //PUT_LOG ( 'PARCIAL Idx[' + IntToStr(Reg.Idx) + '] OK/2[' + Orig + ']' ) ;
   ATUALIZAR_LB_STATUS_CONVERSAO_FF ( 'Parc2', Reg, TRUE ) ;
End ;
If Reg.Tipo = FF_TIPO_FFPROBE Then Begin
   If Reg.Parse_Input Then Begin
      If ( Pos ( 'Stream #0:0(', Aux ) = 1 ) OR
         ( ( Pos ( 'Stream #0:', Aux ) = 1 ) AND
           ( Pos ( 'Video:', Aux ) > 1 ) ) Then Begin
         Aux2 := Aux ;
         Delete ( Aux2, 1 , Pos ( '''', Aux2 ) ) ;
         Delete ( Aux2, Pos ( '''', Aux2 ) , Length ( Aux2 ) ) ;
         Param := PONTO_TO_VIRG ( GET_PARAMETRO_ANTERIOR ( Orig, ' fps' ) ) ;
         Reg.IN_FPS2 := StrToFloat_RR ( Param , 0 ) ;
         //PUT_LOG ( 'PARAM FPS [' + Param + '] IN_FPS[' + CASA2_PONTO(Reg.IN_FPS) + ']' ) ;
         Reg.IN_Bitrate_kbps := StrToIntDef ( GET_PARAMETRO_ANTERIOR ( Orig, ' kb/s' ), 0 )  ;
         Reg.IN_DAR := GET_PARAMETRO_POSTERIOR ( Orig, 'DAR ' ) ;
         Reg.IN_SAR := GET_PARAMETRO_POSTERIOR ( Orig, 'SAR ' ) ;
         Reg.IN_Frames := TRUNC ( Reg.IN_Segundos * 30 ) ; // Reg.IN_FPS2 ) ;
         Reg.IN_Resolucao := FIND_RESOLUCAO ( Orig ) ;
         //PUT_LOG ( 'PARCIAL Idx IN_FPS2/a[' + IntToStr(Reg.Idx) + '] OK/3[' + Orig + ']' ) ;
         ATUALIZAR_LB_STATUS_CONVERSAO_FF ( 'Parc3', Reg, TRUE ) ;
      End ;
      If Pos ( 'Duration: ', Aux ) = 1 Then Begin
         Aux2 := Aux ;
         Delete ( Aux2, 1 , 10 ) ;
         Delete ( Aux2, Pos ( ' ', Aux2 ) , Length ( Aux2 ) ) ;
         Reg.IN_Seg_Str := Trim ( Aux2 ) ;
         If Length ( Reg.IN_Seg_Str ) <> 14 Then Begin
            Reg.IN_Segundos := StrToIntDef ( Copy ( Reg.IN_Seg_Str, 1, 2 ), 0 ) * 3600 +
                               StrToIntDef ( Copy ( Reg.IN_Seg_Str, 4, 2 ), 0 ) * 60 +
                               StrToFloat_RR ( PONTO_TO_VIRG ( Copy ( Reg.IN_Seg_Str, 7, 4 ) ), 0 ) ;
         End Else Begin
            Reg.IN_Segundos := 0 ;
         End ;
         //PUT_LOG ( 'PARCIAL Idx[' + IntToStr(Reg.Idx) + '] OK/4[' + Orig + ']' ) ;
         ATUALIZAR_LB_STATUS_CONVERSAO_FF ( 'Parc4', Reg, TRUE ) ;
      End ;
   End ;
End ;
If Reg.Parse_Output Then Begin
   If Pos ( 'Stream #0:0(', Aux ) = 1 Then Begin
      Aux2 := Aux ;
      Delete ( Aux2, 1 , Pos ( '''', Aux2 ) ) ;
      Delete ( Aux2, Pos ( '''', Aux2 ) , Length ( Aux2 ) ) ;
      //Reg.IN_FN := Aux2 ;
      //PUT_LOG ( 'PARCIAL OK/5[' + Orig + ']' ) ;
      ATUALIZAR_LB_STATUS_CONVERSAO_FF ( 'Parc5', Reg, TRUE ) ;
   End ;
   If Pos ( 'speed=', Aux ) > 0 Then Begin
      Aux2 := Aux ;
      Delete ( Aux2, 1 , Pos ( 'speed=', Aux2 ) + Length ( 'speed=' ) - 1 ) ;
      If Pos ( ' ' , Aux2 ) > 0 Then Begin
         Delete ( Aux2, Pos ( ' ', Aux2 ) , Length ( Aux2 ) ) ;
      End ;
      Reg._Speed := Aux2 ;
   End ;
   If Pos ( 'time=', Aux ) > 0 Then Begin
      Aux2 := Aux ;
      Delete ( Aux2, 1 , Pos ( 'time=', Aux2 ) + Length ( 'time=' ) - 1 ) ;
      Delete ( Aux2, Pos ( ' ', Aux2 ) , Length ( Aux2 ) ) ;
      //PUT_LOG ( 'TIME [' + Aux2 + ']' ) ;
      Reg._Time := Aux2 ;
      If Assigned ( Reg.LB_Time ) Then Begin
         Reg.LB_Time.Caption := Copy ( Reg._Time, 1, 8 ) + ' / ' + Reg._Speed ;
      End ;
   End ;
   If Pos ( 'frame=', Aux ) = 1 Then Begin
      Aux2 := Aux ;
      Delete ( Aux2, 1 , Length ( 'frame=' ) ) ;
      Delete ( Aux2, Pos ( ' ', Aux2 ) , Length ( Aux2 ) ) ;
      Reg.Frame := StrToIntDef ( Aux2, -1 ) ;
      //PUT_LOG ( 'PARCIAL OK/6[' + Orig + ']' ) ;
      ATUALIZAR_LB_STATUS_CONVERSAO_FF ( 'Parc6', Reg, TRUE ) ;
   End ;
End ;
End ;

Procedure ATUALIZAR_PROGRESSO_DA_CONVERSAO ( Var Reg : T_GetDosOutput ) ;
Var Progresso : LongInt ;
Begin
If Assigned ( Reg.LB_Progresso_Frames ) Then Begin
   Reg.LB_Progresso_Frames.Caption := IntToStr ( Reg.Frame ) ;
End ;
If Assigned ( Reg.LB_Total_Frames ) Then Begin
   If Reg.Sel_TT_Frames > 0 Then Begin
      Reg.LB_Total_Frames.Caption := IntToStr ( Reg.Sel_TT_Frames ) ;
   End Else If Reg.In_Frames > 0 Then Begin
      Reg.LB_Total_Frames.Caption := IntToStr ( Reg.In_Frames ) ;
   End Else Begin
      Reg.LB_Total_Frames.Caption := '-' ;
   End ;
End ;
If Assigned ( Reg.LB_Progresso_Parcial ) Then Begin
   If Reg.Sel_TT_Frames > 0 Then Begin
      Progresso := MAX ( 0, MIN ( 100, TRUNC ( Reg.Frame / Reg.Sel_TT_Frames * 100 ) ) ) ;
      Reg.LB_Progresso_Parcial.Caption := IntToStr ( Progresso ) + '%' ;
      Case Progresso Of
         0 .. 50 : Begin
                   Reg.LB_Progresso_Parcial.Color := clRed ;
                   Reg.LB_Progresso_Parcial.Font.Color := clWhite ;
                   End ;
         51 .. 75 : Begin
                    Reg.LB_Progresso_Parcial.Color := clYellow ;
                    Reg.LB_Progresso_Parcial.Font.Color := clBlack ;
                    End ;
         76 .. 99 : Begin
                    Reg.LB_Progresso_Parcial.Color := clGreen ;
                    Reg.LB_Progresso_Parcial.Font.Color := clYellow ;
                    End ;
         Else Begin
                    Reg.LB_Progresso_Parcial.Color := clLime ;
                    Reg.LB_Progresso_Parcial.Font.Color := clBlack ;
         End ;
      End ;
   End Else If Reg.In_Frames > 0 Then Begin
      Progresso := MAX ( 0, MIN ( 100, TRUNC ( Reg.Frame / Reg.In_Frames * 100 ) ) ) ;
      Reg.LB_Progresso_Parcial.Caption := IntToStr ( Progresso ) + '%' ;
      Case Progresso Of
         0 .. 50 : Begin
                   Reg.LB_Progresso_Parcial.Color := clRed ;
                   Reg.LB_Progresso_Parcial.Font.Color := clWhite ;
                   End ;
         51 .. 75 : Begin
                    Reg.LB_Progresso_Parcial.Color := clYellow ;
                    Reg.LB_Progresso_Parcial.Font.Color := clBlack ;
                    End ;
         76 .. 99 : Begin
                    Reg.LB_Progresso_Parcial.Color := clGreen ;
                    Reg.LB_Progresso_Parcial.Font.Color := clYellow ;
                    End ;
         Else Begin
                    Reg.LB_Progresso_Parcial.Color := clLime ;
                    Reg.LB_Progresso_Parcial.Font.Color := clBlack ;
         End ;
      End ;
   End Else Begin
      Reg.LB_Progresso_Parcial.Caption := '-' ;
   End ;
End ;
End ;

Procedure ATUALIZAR_LB_STATUS_CONVERSAO_FF ( Origem : String ;
                                             Reg : T_GetDosOutput ; _PUT_LOG : Boolean ) ;
Var Lista : TStringList ;
    Aux   : String ;
Begin
If NOT Assigned ( Reg.LB_Status ) Then Begin
   Exit ;
End ;
Lista := TStringList.Create ;
Lista.Clear ;
Inc ( Cnt_Status_Conversao ) ;
Lista.Add ( 'Orig[' + Origem + '] IN[' + Reg.IN_FN + ']' ) ;
Lista.Add ( 'Cnt[' + IntToStr(Cnt_Status_Conversao) + '] ' +
            'IDX[' + IntToStr(Reg.Idx) + ']' ) ;
Lista.Add ( 'Seg[' + Reg.IN_Seg_Str + '] ' +
            'FPS[' + CASA2_PONTO(Reg.IN_FPS2) + '] ' +
            'Frames[' + IntToStr(Reg.IN_Frames) + ']' ) ;
Lista.Add ( 'Rate[' + IntToStr(Reg.IN_Bitrate_kbps) + ' kbps] ' +
            'Res[' + IntToStr(Reg.IN_Resolucao.X) + ':' +
                     IntToStr(Reg.IN_Resolucao.Y) + '] ' +
            'DAR[' + Reg.IN_DAR + '] ' +
            'SAR[' + Reg.IN_SAR + '] ' ) ;
Lista.Add ( 'Frame[' + IntToStr(Trunc(Reg.Frame)) + '] ' ) ;
Lista.Add ( 'OUT[' + Reg.OUT_FN + ']' ) ;
Reg.LB_Status.Items.Clear ;
Reg.LB_Status.Items.AddStrings ( Lista ) ;
If Reg.Sel_TT_Frames > 0 Then Begin
   Reg.LB_Total_Frames.Caption := IntToStr ( Reg.Sel_TT_Frames ) ;
End Else If Reg.In_Frames > 0 Then Begin
   Reg.LB_Total_Frames.Caption := IntToStr ( Reg.In_Frames ) ;
End ;
//if ( Indice_Fila_Conversao > 0 ) AND ( Andamento_Fila.Show
If FALSE Then Begin // _PUT_LOG Then Begin
   {
   Aux := '' ;
   For Local := 0 To Lista.Count - 1 Do Begin
      Aux := Aux + Lista[Local] ;
   End ;
   PUT_LOG ( 'ATUAL_LB_STAT [' + Aux + ']' ) ;
   }
End Else Begin
   PUT_STATUS ( 'ATUAL_LB_STAT [' + Aux + ']' ) ;
End ;
Lista.Free ;
ATUALIZAR_PROGRESSO_DA_CONVERSAO ( Reg ) ;
End ;

Function ExecAndWait_Retorno ( Cmd : String ; _Put_Log : Boolean ) : String ;
Var SA              : TSecurityAttributes ;
    SI              : TStartupInfo ;
    PI              : TProcessInformation ;
    StdOutPipeRead  ,
    StdOutPipeWrite : THandle ;
    WasOK           : Boolean ;
    Buffer          : Array [0..255] Of AnsiChar ;
    BytesRead       : Cardinal ;
    Handle          : Boolean ;
    Parcial         : String ;
    Log2            : String ;
    Local           : LongInt ;
    Cancelado       : Boolean ;
Begin
Log2 := '' ;
With SA Do Begin
   nLength := SizeOf(SA);
   bInheritHandle := True;
   lpSecurityDescriptor := nil;
End ;
CreatePipe(StdOutPipeRead, StdOutPipeWrite, @SA, 0);
Try
   With SI Do Begin
      FillChar(SI, SizeOf(SI), 0) ;
      cb := SizeOf(SI) ;
      dwFlags := STARTF_USESHOWWINDOW OR STARTF_USESTDHANDLES ;
      wShowWindow := SW_HIDE ;
      hStdInput := GetStdHandle ( STD_INPUT_HANDLE ) ; // don't redirect stdin
      hStdOutput := StdOutPipeWrite ;
      hStdError := StdOutPipeWrite ;
   End ;
   Handle := CreateProcess ( Nil,
                             PChar(Cmd),
                             //PChar('cmd.exe /C ' + Cmd),
                             //Nil, PChar(Cmd),
                             Nil, Nil, True, 0, Nil,
                             PChar(ExtractFilePath(Application.ExeName)), SI, PI) ;
   CloseHandle ( StdOutPipeWrite ) ;
   Parcial := '' ;
   If Handle Then
      Try
         Repeat
            WasOK := ReadFile ( StdOutPipeRead, Buffer, 255, BytesRead, Nil ) ;
            If BytesRead > 0 Then Begin
               Buffer[BytesRead] := #0 ;
               For Local := 0 To BytesRead - 1 Do Begin
                   If Buffer[Local] = #13 Then Begin
                      Log2 := Log2 + Parcial + sLineBreak ;
                      If _Put_Log Then Begin
                         PUT_LOG ( '** ' + Parcial ) ;
                      End ;
                      Parcial := '' ;
                   End Else If Buffer[Local] = #10 Then Begin
                   End Else If Ord(Buffer[Local]) < 31 Then Begin
                      Parcial := Parcial + '{{*' + IntToStr ( Ord(Buffer[Local]) ) + '}}' ;
                      Parcial := Parcial + String(Buffer[Local]) ;
                   End Else Begin
                      Parcial := Parcial + String(Buffer[Local]) ;
                   End ;
               End ;
            End ;
            Application.ProcessMessages ;
            Cancelado := Application.Terminated OR FLAG_CANCELAR_PROCESSO ;
            If Cancelado Then Begin
               Break ;
            End ;
         Until ( NOT WasOK ) OR ( BytesRead = 0 ) ;
         If NOT Cancelado Then Begin
            If Parcial <> '' Then Begin
               Log2 := Log2 + Parcial + sLineBreak ;
               If _Put_Log Then Begin
                  PUT_LOG ( '## ' + Parcial ) ;
               End ;
            End ;
         End ;
         //PUT_LOG ('Antes WaitForSingleObject') ;
         WaitForSingleObject ( PI.hProcess, 1000 ) ; // INFINITE
         //PUT_LOG ('Depois WaitForSingleObject') ;
      Finally
         CloseHandle ( PI.hThread ) ;
         CloseHandle ( PI.hProcess ) ;
      End ;
Finally
   CloseHandle ( StdOutPipeRead ) ;
End ;
Result := Log2 ;
End ;

(*
Procedure PROC_GetDosOutput ;
Var SA              : TSecurityAttributes ;
    SI              : TStartupInfo ;
    PI              : TProcessInformation ;
    StdOutPipeRead  ,
    StdOutPipeWrite : THandle ;
    WasOK           : Boolean ;
    Buffer          : Array [0..255] Of AnsiChar ;
    //Buffer2         : String ;
    BytesRead       : Cardinal ;
    Handle          : Boolean ;
    Log             : String ;
    Log2            : String ;
    Local           : LongInt ;
    Parcial         : String ;
//    Reg             : T_GetDosOutput ;
//    Tick            : Cardinal ;
    Indice          : LongInt ;
    Cancelado       : Boolean ;
Begin
Indice := 0 ;
ATUALIZAR_LB_STATUS_CONVERSAO_FF ( 'AT1', Reg_GetDosOutput, TRUE ) ;
PUT_LOG ( 'INI PROC/GetDos/Output Idx[' + IntToStr(Indice) + ']' ) ;
If FLAG_CANCELAR_PROCESSO Then Begin
   PUT_LOG ( 'ERRO PROC_GetDosOutput por flag CANCELAR_PROCESSO' ) ;
   Exit ;
End ;
PUT_LOG ( 'Cmd[' + Reg_GetDosOutput.Cmd + ']' ) ;
Log := '' ;
Log2 := '' ;
If Assigned ( Reg_GetDosOutput.ME ) Then Begin
//   Reg.ME.Lines.Clear ;
   Reg_GetDosOutput.ME.Lines.Add('Iniciando processamento [' + Reg_GetDosOutput.IN_FN + ']...') ;
End ;
If Assigned ( Reg_GetDosOutput.LB ) Then Begin
//   Reg.LB.Items.Clear ;
   Reg_GetDosOutput.LB.Items.Add('Iniciando processamento [' + Reg_GetDosOutput.IN_FN + ']...') ;
End ;
With SA Do Begin
   nLength := SizeOf(SA) ;
   bInheritHandle := TRUE ;
   lpSecurityDescriptor := Nil ;
End ;
Cancelado := FALSE ;
CreatePipe(StdOutPipeRead, StdOutPipeWrite, @SA, 0);
Try
   With SI Do Begin
      FillChar(SI, SizeOf(SI), 0) ;
      cb := SizeOf(SI) ;
      dwFlags := STARTF_USESHOWWINDOW OR STARTF_USESTDHANDLES ;
      wShowWindow := SW_HIDE ;
      hStdInput := GetStdHandle ( STD_INPUT_HANDLE ) ; // don't redirect stdin
      hStdOutput := StdOutPipeWrite ;
      hStdError := StdOutPipeWrite ;
   End ;
   Handle := CreateProcess ( Nil,
                             //PChar('cmd.exe /C ' + Reg_GetDosOutput.Cmd ),
                             PChar( Reg_GetDosOutput.Cmd ),
                             Nil, Nil, True, 0, Nil,
                             PChar(Reg_GetDosOutput.Dir), SI, PI) ;
   CloseHandle ( StdOutPipeWrite ) ;
   Parcial := '' ;
   If Handle Then Begin
      Try
         Repeat
            WasOK := ReadFile ( StdOutPipeRead, Buffer, 255, BytesRead, Nil ) ;
            If BytesRead > 0 Then Begin
               Buffer[BytesRead] := #0 ;
               For Local := 0 To BytesRead - 1 Do Begin
                   If Buffer[Local] = #13 Then Begin
                      If Assigned ( Reg_GetDosOutput.ME ) Then Begin
                         Reg_GetDosOutput.ME.Text := Reg_GetDosOutput.ME.Text +
                                                     StrZero(Reg_GetDosOutput.Idx,4) + ' ' +
                                                     Parcial + sLineBreak ;
                         Reg_GetDosOutput.ME.Update ;
                      End ;
                      If Assigned ( Reg_GetDosOutput.SB ) Then Begin
                         Reg_GetDosOutput.SB.SimpleText := StrZero(Reg_GetDosOutput.Idx,4) + ' ' + Trim ( Parcial ) ;
                      End ;
                      Parcial := CONDICIONAR_PARCIAL ( Parcial ) ;
                      TRATAR_PARCIAL ( Reg_GetDosOutput, Parcial ) ;
                      ATUALIZAR_LB_STATUS_CONVERSAO_FF ( 'P1', Reg_GetDosOutput, FALSE ) ;
                      Log2 := Log2 + Parcial + sLineBreak ;
                      If Assigned ( Reg_GetDosOutput.LB ) Then Begin
                         Reg_GetDosOutput.LB.Items.Add ( StrZero(Reg_GetDosOutput.Idx,4) + ' ' + Parcial ) ;
                         Reg_GetDosOutput.LB.ItemIndex := Reg_GetDosOutput.LB.Items.Count - 1 ;
                      End ;
                      Parcial := '' ;
                      Log := Log + String(Buffer[Local]) ;
                   End Else If Buffer[Local] = #10 Then Begin
                   End Else If Ord(Buffer[Local]) < 31 Then Begin
                      Log := Log + '{{*' + IntToStr ( Ord(Buffer[Local]) ) + '}}' ;
                      Log := Log + String(Buffer[Local]) ;
                      Parcial := Parcial + '{{*' + IntToStr ( Ord(Buffer[Local]) ) + '}}' ;
                      Parcial := Parcial + String(Buffer[Local]) ;
                   End Else Begin
                      Log := Log + String(Buffer[Local]) ;
                      Parcial := Parcial + String(Buffer[Local]) ;
                   End ;
               End ;
            End ;
            Application.ProcessMessages ;
            Cancelado := Application.Terminated OR FLAG_CANCELAR_PROCESSO ;
            If Cancelado Then Begin
               Break ;
            End ;
         Until ( NOT WasOK ) OR ( BytesRead = 0 ) ;
         If NOT Cancelado Then Begin
            If Parcial <> '' Then Begin
               If Assigned ( Reg_GetDosOutput.ME ) Then Begin
                  Reg_GetDosOutput.ME.Text := Reg_GetDosOutput.ME.Text +
                                              StrZero(Reg_GetDosOutput.Idx, 4) + ' ' +
                                              Parcial + sLineBreak ;
                  Reg_GetDosOutput.ME.Update ;
               End ;
               If Assigned ( Reg_GetDosOutput.SB ) Then Begin
                  Reg_GetDosOutput.SB.SimpleText := StrZero(Reg_GetDosOutput.Idx, 4) + ' ' +
                                                    Trim ( Parcial ) ;
               End ;
               Parcial := CONDICIONAR_PARCIAL ( Parcial ) ;
               TRATAR_PARCIAL ( Reg_GetDosOutput, Parcial ) ;
               ATUALIZAR_LB_STATUS_CONVERSAO_FF ( 'P2', Reg_GetDosOutput, FALSE ) ;
               Log2 := Log2 + Parcial + sLineBreak ;
               If Assigned ( Reg_GetDosOutput.LB ) Then Begin
                  Reg_GetDosOutput.LB.Items.Add ( StrZero(Reg_GetDosOutput.Idx,4) + ' ' + Parcial ) ;
                  Reg_GetDosOutput.LB.ItemIndex := Reg_GetDosOutput.LB.Items.Count - 1 ;
               End ;
            End ;
         End ;
         //PUT_LOG ('Antes WaitForSingleObject') ;
         WaitForSingleObject ( PI.hProcess, 1000 ) ; // INFINITE
         //PUT_LOG ('Depois WaitForSingleObject') ;
      Finally
         CloseHandle ( PI.hThread ) ;
         CloseHandle ( PI.hProcess ) ;
      End ;
   End ;
Finally
   CloseHandle ( StdOutPipeRead ) ;
   If Assigned ( Reg_GetDosOutput.ME ) Then Begin
      If Cancelado Then Begin
         Reg_GetDosOutput.ME.Lines.Add ( 'Processo cancelado ME (' + Reg_GetDosOutput.IN_FN + ')' ) ;
         PUT_LOG ('Processo cancelado ME (' + Reg_GetDosOutput.IN_FN + ')' ) ;
      End Else Begin
         Reg_GetDosOutput.ME.Lines.Add ( 'Processo finalizado ME (' + Reg_GetDosOutput.IN_FN + ')' ) ;
         PUT_LOG ('Processo finalizado ME (' + Reg_GetDosOutput.IN_FN + ')' ) ;
      End ;
      Reg_GetDosOutput.ME.Lines.Add ( '*******************' ) ;
      Reg_GetDosOutput.ME.Lines.Add ( '' ) ;
   End ;
   If Assigned ( Reg_GetDosOutput.LB ) Then Begin
      If Cancelado Then Begin
         Reg_GetDosOutput.LB.Items.Add ( 'Processo cancelado LB (' + Reg_GetDosOutput.IN_FN + ')' ) ;
         PUT_LOG ('Processo cancelado LB (' + Reg_GetDosOutput.IN_FN + ')') ;
      End Else Begin
         Reg_GetDosOutput.LB.Items.Add ( 'Processo finalizado LB (' + Reg_GetDosOutput.IN_FN + ')' ) ;
         PUT_LOG ('Processo finalizado LB (' + Reg_GetDosOutput.IN_FN + ')') ;
      End ;
      Reg_GetDosOutput.LB.Items.Add ( '*******************' ) ;
      Reg_GetDosOutput.LB.Items.Add ( '' ) ;
      Reg_GetDosOutput.LB.ItemIndex := Reg_GetDosOutput.LB.Items.Count - 1 ;
   End ;
End ;
ATUALIZAR_LB_STATUS_CONVERSAO_FF ( 'P3', Reg_GetDosOutput, TRUE ) ;
CHECAR_DIRETORIO_FILENAME ( Diretorio + 'Config' ) ;
CHECAR_DIRETORIO_FILENAME ( Diretorio + 'Config\Log_Geral' ) ;
//Tick := GetTickCount ;
If Cancelado Then Begin
   Log := Log + '[CANCELADO]' + sLineBreak ;
   Log2 := Log2 + '[CANCELADO]' + sLineBreak ;
End ;
WRITE_FILE_CORE ( 'PROC_GetDosOutput/1',
                  Diretorio + 'Config\Log_GetDosOutput_Parcial.TXT', Log2, DELAYED_FALSE ) ;
WRITE_FILE_CORE ( 'PROC_GetDosOutput/2',
                  Diretorio + 'Config\Log_Geral\Log_GetDosOutput_Parcial_' +
                  DATAHORA_INVERSA(Now) + '_' + StrZero(Indice_Log_GetDosOutput, 6 ) +
                  '.TXT',
                  Log2, DELAYED_FALSE ) ;
WRITE_FILE_CORE ( 'PROC_GetDosOutput/3',
                  Diretorio + 'Config\Log_GetDosOutput.TXT', Log, DELAYED_FALSE ) ;
WRITE_FILE_CORE ( 'PROC_GetDosOutput/4',
                  Diretorio + 'Config\Log_Geral\Log_GetDosOutput_' +
                  DATAHORA_INVERSA(Now) + '_' + StrZero(Indice_Log_GetDosOutput, 6 ) +
                  '.TXT',
                  Log, DELAYED_FALSE ) ;
Log2 := '' ;
Log := '' ;
ATUALIZAR_LB_STATUS_CONVERSAO_FF ( 'P3a', Reg_GetDosOutput, TRUE ) ;
PUT_LOG ( 'FIM PROC/GetDos/Output Idx[' + IntToStr(Indice) + ']' ) ;
ATUALIZAR_LB_STATUS_CONVERSAO_FF ( 'P3b', Reg_GetDosOutput, TRUE ) ;
End ;
*)

(*
Procedure GetDosOutput ( Var Reg : T_GetDosOutput ;
                         FN : String ;
                         _Tipo : LongInt ; _Cmd, _Dir: String ;
                         _LB_Progresso : TLabel ;
                         _LB_Total_Frames : TLabel ;
                         _LB_Progresso_Frames : TLabel ;
                         _LB_Time : TLabel ;
                         _ME : TMemo ; _LB, _LB_Status : TListBox ;
                         _SB : TStatusBar ) ;
Var _Idx_Forcado : LongInt ;
Begin
_Idx_Forcado := 0 ;
Indice_GetDosOutput := 0 ;
With Reg Do Begin
   Idx := Indice_GetDosOutput ;
   Tipo := _Tipo ;
   Cmd := _Cmd ;
   Dir := _Dir ;
   LB_Progresso_Parcial := _LB_Progresso ;
   LB_Total_Frames := _LB_Total_Frames ;
   LB_Progresso_Frames := _LB_Progresso_Frames ;
   LB_Time := _LB_Time ;
   ME := _ME ;
   LB := _LB ;
   LB_Status := _LB_Status ;
   SB := _SB ;
   Parse_Input := FALSE ;
   Parse_Output := FALSE ;
   If _Idx_Forcado = -1 Then Begin
      PUT_LOG ( 'START INIT Reg_GetDosOutput' ) ;
      IN_Resolucao.X := -1 ;
      IN_Resolucao.Y := -1 ;
      IN_FN := '' ;
      IN_Segundos := -1 ;
      IN_Frames := -1 ;
      IN_Seg_Str := '' ;
      IN_Bitrate_kbps := -1 ;
   End ;
End ;
PUT_LOG ( 'GetDosOutput/2 [' + IntToStr(Indice_GetDosOutput) + ']' ) ;
IDX_PROC_GetDosOutput := Indice_GetDosOutput ;
PROC_GetDosOutput ;
//Task_GetDosOutput[Indice_GetDosOutput] := TTask.Create ( PROC_GetDosOutput ) ;
//Task_GetDosOutput[Indice_GetDosOutput].Start ;
If _Idx_Forcado = -1 Then Begin
   Inc ( Indice_GetDosOutput ) ;
   PUT_LOG ( 'GetDosOutput Inc indice para [' + IntToStr(Indice_GetDosOutput) + ']' ) ;
End ;
End ;
*)

Function GET_LICENSE_FFVLC_PLAYER : String ;
Begin
Result := 'PSDEBKNM-LURWCABH-CQPIZMZE-BKPPENSY-HDSQZEQJ' ;
End ;

Function SUBTRAIR_TIMECODES_HHMMSSsss ( TC1, TC2 : String ) : String ;
Var D1 ,
    D2 : Double ;
Begin
D1 := HHHMMSSMMM_To_Double ( TC1 ) ;
D2 := HHHMMSSMMM_To_Double ( TC2 ) ;
Result := HHMMSSMMM ( ABS ( D2 - D1 ) ) ;
End ;

Procedure LIMPAR_REG_GetDosOutput ( Var Reg : T_GetDosOutput ) ;
Begin
PUT_LOG ( 'LIMPAR_REG_GetDosOutput' ) ;
With Reg Do Begin
   IN_DAR := '' ;
   IN_SAR := '' ;
   IN_FN := '' ;
   IN_FPS2 := 0 ;
   IN_Resolucao := Point(-1,-1) ;
   IN_Segundos := 0 ;
   IN_Seg_Str := '' ;
   IN_Frames := 0 ;
   IN_Bitrate_kbps := 0 ;
   OUT_FN := '' ;
   OUT_FPS := 0 ;
   OUT_Resolucao := Point(-1,-1) ;
   Frame := 0 ;
   Speed := 0 ;
   _Time := '' ;
   _Size_kb := 0 ;
   Parse_Input := FALSE ;
   Parse_Output := FALSE ;
End ;
End ;

Function IS_DATAHORA_INVERSA ( Str : String ) : Boolean ;
Var DT  : TDateTime ;
//    Aux : Int64 ;
Begin
{
20190528104119_prefeito_CONVERTIDO.wmv
}
Result := FALSE ;
If Length ( Str ) <> 14 Then Begin
   Exit ;
End ;
{
Try
   Aux := StrToInt64 ( Str ) ;
Except
   Aux := 0 ;
End ;
}
DT := DATAHORA_INVERSA_TO_DATETIME ( Str ) ;
If DT = 0 Then Begin
   Exit ;
End ;
{
If ( Aux < 19000000000000 ) OR
   ( Aux > 20990000000000 ) Then Begin // Validar ano
   Exit ;
End ;
Aux := Aux MOD 10000000000 ;
If ( Aux <  100000000 ) OR
   ( Aux > 1300000000 ) Then Begin // Validar mês
   Exit ;
End ;
Aux := Aux MOD 100000000 ;
If ( Aux <  1000000 ) OR
   ( Aux > 31000000 ) Then Begin // Validar dia
   Exit ;
End ;
Aux := Aux MOD 1000000 ;
If ( Aux > 240000 ) Then Begin // Validar hora
   Exit ;
End ;
Aux := Aux MOD 10000 ;
If ( Aux > 6000 ) Then Begin // Validar minuto
   Exit ;
End ;
Aux := Aux MOD 100 ;
If ( Aux > 60 ) Then Begin // Validar segundo
   Exit ;
End ;
}
Result := TRUE ;
End ;

Procedure CONECTAR_DRIVE_LOG ( Drive, Host, User, Pass : String ) ;
Var Cmd : String ;
    Aux : String ;
Begin
If DirectoryUsable  ( Drive ) Then Begin
   PUT_LOG_REMOTO ( 'CONECTAR DRIVE_LOG ' + Drive + ' [JÁ CONECTADO]' ) ;
   Exit ;
End ;
Cmd := 'net use ' + Drive + ' ' + Host + ' ' + Pass + ' /user:' + User + ' /persistent:YES' ;
PUT_LOG ( 'CMD NET [' + Cmd + ']' ) ;
//ExecuteAndWait ( Cmd ) ;
Aux := ExecAndWait_Retorno ( Cmd, TRUE ) ;
PUT_LOG ( Aux ) ;
PUT_LOG_REMOTO ( 'CONECTAR DRIVE_LOG ' + Drive + ' Host[' + Host + '] User[' + User + ']' ) ;
End ;

Procedure PUT_LOG_REMOTO ( Log : String ) ;
Var Dir : String ;
    FN  : String ;
Begin
Exit ;
Dir := Log_Drive ;
If NOT DirectoryUsable ( Dir ) Then Begin
   Exit ;
End ;
Dir := INSERE_BARRA ( Dir ) + 'Logs' ;
CHECAR_DIRETORIO_DIRNAME ( Dir ) ;
If NOT DirectoryUsable ( Dir ) Then Begin
   Exit ;
End ;
Dir := INSERE_BARRA ( Dir ) + COMPUTADOR_SERIAL ;
CHECAR_DIRETORIO_DIRNAME ( Dir ) ;
If NOT DirectoryUsable ( Dir ) Then Begin
   Exit ;
End ;
Dir := INSERE_BARRA ( Dir ) + DATA_INVERSA(Now) ;
CHECAR_DIRETORIO_DIRNAME ( Dir ) ;
If NOT DirectoryUsable  ( Dir ) Then Begin
   Exit ;
End ;
Dir := INSERE_BARRA ( Dir ) + ExtractFileNameSemExt ( Application.ExeName ) ;
CHECAR_DIRETORIO_DIRNAME ( Dir ) ;
If NOT DirectoryUsable ( Dir ) Then Begin
   Exit ;
End ;
FN := INSERE_BARRA ( Dir ) + DATA_INVERSA ( Now ) + '.log' ;
Log := '@@@' +
       DateTimeToStr(Now) + '@@@' +
       NOME_USUARIO + '@@@' +
       IntToStr(GetTickCount) + '@@@' +
       sLineBreak +
       '<<<' + Log + '>>>' + sLineBreak ;
APPEND_TEXTO ( 'PUT_LOG_REMOTO',
               FN, Log + sLineBreak ) ;
End ;

Function IS_ARQUIVO_DAV ( FN : String ) : Boolean ;
Begin
Result := UpperCase ( ExtractFileExt ( FN ) ) = '.DAV' ;
End ;

Function GET_INFO_DAV ( FN : String ) : LongInt  ;
Var Cmd       : String ;
    Lista     : TStringList ;
    Lista_OK  : TStringList ;
    Aux       : String ;
    Qtde      : LongInt ;
    Local     : LongInt ;
    Is_Video  : Boolean ;
    Last      : String ;
Begin
PUT_LOG ( 'INICIO GET_INFO_DAV' ) ;
Cmd := '"' + GET_FN_FFPROBE_EXE + '" ' +
       '-show_packets ' + '"' + FN + '"' + ' ' +
       '| findstr /C:"pts=" /C:"codec"' + ' ' +
       '> "' + FN + '.txt"' +
       '' ;
Cmd := '"' + GET_FN_FFPROBE_EXE + '" ' +
       '-show_packets ' + '"' + FN + '"' + ' ' +
//       '| findstr /C:"pts=" /C:"codec"' + ' ' +
//       '> "' + FN + '.txt"' +
       '' ;
Lista := TStringList.Create ;
Lista_OK := TStringList.Create ;
PUT_LOG ( 'PASSO 1 GET_INFO_DAV' ) ;
Aux := ExecAndWait_Retorno ( Cmd, PUT_LOG_FALSE ) ;
PUT_LOG ( 'PASSO 2 GET_INFO_DAV' ) ;
Lista.Text := Aux ;
PUT_LOG ( 'PASSO 3 GET_INFO_DAV' ) ;
Qtde := Lista.Count ;
Is_Video := FALSE ;
Last := '' ;
If Qtde > 0 Then Begin
   For Local := 0 To Qtde - 1 Do Begin
       If ( Pos ( 'codec_type=video', Lista[Local] ) > 0 ) Then Begin
          Is_Video := TRUE ;
       End ;
       If ( Pos ( 'codec_type=audio', Lista[Local] ) > 0 ) Then Begin
          Is_Video := FALSE ;
       End ;
       If ( Pos ( 'pts=', Lista[Local] ) > 0 ) AND
          ( Is_Video ) Then Begin
          Last := Lista[Local] ;
          Lista_OK.Add ( Last ) ;
       End ;
   End ;
End ;
PUT_LOG ( 'PASSO 4 GET_INFO_DAV' ) ;
Try
   //Lista.SaveToFile ( FN + '.txt2' ) ;
   Lista_OK.SaveToFile ( FN + '.txt_ok' ) ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception GET_INFO_DAV [' + FN + '][' + E.Message + ']' ) ;
   End ;
End ;
PUT_LOG ( 'PASSO 5 GET_INFO_DAV' ) ;
Lista.Free ;
Lista_OK.Free ;
PUT_LOG ( Cmd ) ;
If Last = '' Then Begin
   Result := 0 ;
End Else Begin
   While Pos ( '=', Last ) > 0 Do Begin
      Delete ( Last, 1, 1 ) ;
   End ;
   Result := StrToIntDef ( Last, -1 ) ;
End ;
PUT_LOG ( 'FINAL GET_INFO_DAV [Result ' + IntToStr(Result) + ']' ) ;
End ;

Function MD5 ( Const Texto : String) : String ;
Begin
End ;

Function GET_OBJECT_NAME ( Obj : TObject ) : String ;
Begin
If NOT Assigned ( Obj ) Then Begin
   Result := '<<NULL>>' ;
   Exit ;
End ;
If Obj Is TEdit Then                        Begin Result := (Obj As TEdit).Name ;
{$IFDEF NW}
End Else If Obj Is TEspelho_RD Then         Begin Result := (Obj As TEspelho_RD).Name ;
{$ENDIF}
End Else If Obj Is TTransEdit Then          Begin Result := (Obj As TTransEdit).Name ;
End Else If Obj Is TMyRichEdit Then         Begin Result := (Obj As TMyRichEdit).Name ;
End Else If Obj Is TForm Then               Begin Result := (Obj As TForm).Name ;
End Else If Obj Is TMenuItem Then           Begin Result := (Obj As TMenuItem).Name ;
End Else If Obj Is TPageControl Then        Begin Result := (Obj As TPageControl).Name ;
End Else If Obj Is TTabSheet Then           Begin Result := (Obj As TTabSheet).Name ;
End Else If Obj Is TScrollBox Then          Begin Result := (Obj As TScrollBox).Name ;
End Else If Obj Is TButton Then             Begin Result := (Obj As TButton).Name ;
End Else If Obj Is TLabel Then              Begin Result := (Obj As TLabel).Name ;
End Else If Obj Is TPanel Then              Begin Result := (Obj As TPanel).Name ;
End Else If Obj Is TCheckBox Then           Begin Result := (Obj As TCheckBox).Name ;
End Else If Obj Is TListBox Then            Begin Result := (Obj As TListBox).Name ;
End Else If Obj Is TComboBox Then           Begin Result := (Obj As TComboBox).Name ;
End Else If Obj Is TImage Then              Begin Result := (Obj As TImage).Name ;
End Else If Obj Is TMemo Then               Begin Result := (Obj As TMemo).Name ;
End Else If Obj Is TRichEdit Then           Begin Result := (Obj As TRichEdit).Name ;
End Else If Obj Is TBitBtn Then             Begin Result := (Obj As TBitBtn).Name ;
End Else If Obj Is TStatusBar Then          Begin Result := (Obj As TStatusBar).Name ;
End Else If Obj Is TStringGrid Then         Begin Result := (Obj As TStringGrid).Name ;
End Else If Obj Is TSpeedButton Then        Begin Result := (Obj As TSpeedButton).Name ;
End Else If Obj Is TToolButton Then         Begin Result := (Obj As TToolButton).Name ;
End Else If Obj Is TToolBar Then            Begin Result := (Obj As TToolBar).Name ;
End Else If Obj Is TSpinEdit Then           Begin Result := (Obj As TSpinEdit).Name ;
End Else If Obj Is TDateTimePicker Then     Begin Result := (Obj As TDateTimePicker).Name ;
End Else If Obj Is TTreeView Then           Begin Result := (Obj As TTreeView).Name ;
End Else If Obj Is TSplitter Then           Begin Result := (Obj As TSplitter).Name ;
End Else If Obj Is TRadioButton Then        Begin Result := (Obj As TRadioButton).Name ;
//End Else If Obj Is TSpeedBar Then           Begin Result := (Obj As TSpeedBar).Name ;
End Else If Obj Is TMaskEdit Then           Begin Result := (Obj As TMaskEdit).Name ;
End Else If Obj Is TLabeledEdit Then        Begin Result := (Obj As TLabeledEdit).Name ;
//End Else If Obj Is TRxLabel Then            Begin Result := (Obj As TRxLabel).Name ;
//End Else If Obj Is TTextListBox Then        Begin Result := (Obj As TTextListBox).Name ;
End Else If Obj Is TTimer Then              Begin Result := (Obj As TTimer).Name ;
End Else If Obj Is TIdTelnetServer Then     Begin Result := (Obj As TIdTelnetServer).Name ;
End Else If Obj Is TIdUDPClient Then        Begin Result := (Obj As TIdUDPClient).Name ;
//End Else If Obj Is TDirectoryEdit Then      Begin Result := (Obj As TDirectoryEdit).Name ;
End Else If Obj Is TPopupMenu Then          Begin Result := (Obj As TPopupMenu).Name ;
//End Else If Obj Is TRxSlider Then           Begin Result := (Obj As TRxSlider).Name ;
End Else If Obj Is TChart Then              Begin Result := (Obj As TChart).Name ;
End Else If Obj Is TLineSeries Then         Begin Result := (Obj As TLineSeries).Name ;
End Else If Obj Is TBevel Then              Begin Result := (Obj As TBevel).Name ;
End Else If Obj Is TServerSocket Then       Begin Result := (Obj As TServerSocket).Name ;
End Else If Obj Is TClientSocket Then       Begin Result := (Obj As TClientSocket).Name ;
End Else If Obj Is TFDQuery Then            Begin Result := (Obj As TFDQuery).Name ;
End Else If Obj Is TFDConnection Then       Begin Result := (Obj As TFDConnection).Name ;
End Else If Obj Is TIdCmdTCPClient Then     Begin Result := (Obj As TIdCmdTCPClient).Name ;
End Else If Obj Is TDataSource Then         Begin Result := (Obj As TDataSource).Name ;
End Else If Obj Is TRadioGroup Then         Begin Result := (Obj As TRadioGroup).Name ;
End Else If Obj Is TDBGrid Then             Begin Result := (Obj As TDBGrid).Name ;
//End Else If Obj Is TRxSpinButton Then       Begin Result := (Obj As TRxSpinButton).Name ;
//End Else If Obj Is TRxSpeedButton Then      Begin Result := (Obj As TRxSpeedButton).Name ;
End Else If Obj Is TProgressBar Then        Begin Result := (Obj As TProgressBar).Name ;
End Else If Obj Is TShape Then              Begin Result := (Obj As TShape).Name ;
//End Else If Obj Is TRxRichEdit Then         Begin Result := (Obj As TRxRichEdit).Name ;
//End Else If Obj Is TRxCalculator Then       Begin Result := (Obj As TRxCalculator).Name ;
End Else If Obj Is TOpenDialog Then         Begin Result := (Obj As TOpenDialog).Name ;
End Else If Obj Is TSaveDialog Then         Begin Result := (Obj As TSaveDialog).Name ;
End Else If Obj Is TPageControl Then        Begin Result := (Obj As TPageControl).Name ;
End Else If Obj Is TPrinterSetupDialog Then Begin Result := (Obj As TPrinterSetupDialog).Name ;
End Else If Obj Is TPrintDialog Then        Begin Result := (Obj As TPrintDialog).Name ;
//End Else If Obj Is TDualListDialog Then     Begin Result := (Obj As TDualListDialog).Name ;
End Else If Obj Is TImageList Then          Begin Result := (Obj As TImageList).Name ;
//End Else If Obj Is TSpeedBarSection Then    Begin Result := (Obj As TSpeedBarSection).Name ;
//End Else If Obj Is TSpeedItem Then          Begin Result := (Obj As TSpeedItem).Name ;
End Else                                    Begin Result := '<<INDEFINIDO>>' ;
End ;
End ;

Function GET_STR_CLASS ( Classe : TObject ) : String ;
Begin
If NOT Assigned ( Classe ) Then Begin
   Result := '<<NOT ASSIGNED>>' ;
   Exit ;
End ;
If Classe.ClassType = TMyRichEdit Then Begin
   Result := 'TMyRichEdit' ;
End Else If Classe.ClassType = TTransEdit Then Begin
   Result := 'TTransEdit' ;
{$IFDEF NW}
End Else If Classe.ClassType = TEspelho_RD Then Begin
   Result := 'TEspelho_RD' ;
{$ENDIF}
End Else Begin
   Result := Classe.QualifiedClassName ;
End ;
End ;

Function GET_OBJ_DIMENSOES ( Obj : TControl ) : String ;
Begin
If NOT Assigned ( Obj ) Then Begin
   Result := '<<TCONTROL NOT ASSIGNED>>' + sLineBreak ;
   Exit ;
End ;
Try
   Result := 'T[' + IntToStr ( Obj.Top ) + '] ' +
             'L[' + IntToStr ( Obj.Left ) + '] ' +
             'W[' + IntToStr ( Obj.Width ) + '] ' +
             'H[' + IntToStr ( Obj.Height ) + '] ' +
             'V[' + IF01 ( Obj.Visible ) + '] ' +
             'E[' + IF01 ( Obj.Enabled ) + '] ' +
             'G[' + IntToStr ( Obj.Tag ) + '] ' +
             sLineBreak ;
Except
   On E : Exception Do Begin
      Result := '<<GET_OBJ_DIMENSOES Exception>> [' + E.Message + ']' + sLineBreak ;
   End ;
End ;
End ;

Function GET_INFO_OBJ ( Obj : TComponent ) : String ;
Begin
If NOT Assigned ( Obj ) Then Begin
   Result := '<<TOBJECT NOT ASSIGNED>>' + sLineBreak ;
   Exit ;
End ;
Try
   Result := Obj.Name + ' [' + Obj.QualifiedClassName + ']' + sLineBreak ;
Except
   On E : Exception Do Begin
      Result := '<<GET_INFO_OBJ EXCEPTION>> [' + E.Message + ']' + sLineBreak ;
   End ;
End ;
End ;

Function GET_INFO_PARENT ( _Parent : TObject ) : String ;
Var Compo : TControl ;
Begin
If NOT Assigned ( _Parent ) Then Begin
   Result := '<<PARENT NOT ASSIGNED>>' + sLineBreak ;
   Exit ;
End ;
Try
   Compo := _Parent AS TControl ;
Except
   Compo := Nil ;
End ;
Try
   Result := GET_OBJECT_NAME ( _Parent ) + ' [' + GET_STR_CLASS ( _Parent ) + ']' + sLineBreak ;
   If Assigned ( Compo ) Then Begin
      Result := Result +
                'T[' + IntToStr ( Compo.Top ) + '] ' +
                'L[' + IntToStr ( Compo.Left ) + '] ' +
                'W[' + IntToStr ( Compo.Width ) + '] ' +
                'H[' + IntToStr ( Compo.Height ) + '] ' +
                'V[' + IF01 ( Compo.Visible ) + '] ' +
                'E[' + IF01 ( Compo.Enabled ) + '] ' +
                'G[' + IntToStr ( Compo.Tag ) + '] ' +
                sLineBreak ;
   End ;
Except
   On E : Exception Do Begin
      Result := '<<GET_INFO_PARENT EXCEPTION>> [' + E.Message + ']' + sLineBreak ;
   End ;
End ;
End ;

Function ATIVAR_HINT_COMPONENTES ( Origem : String ; _Form : TForm ;
                                   Ativar, SALVAR : Boolean ) : String ;
Var Local : LongInt ;
    Obj   : TObject ;
    FN    : String ;
    Aux   : String ;
    Contr : TControl ;
    Compo : TComponent ;
Begin
Result := '' ;
If NOT ATIVAR Then Begin
   Exit ;
End ;
If NOT IS_RICARDO Then Begin
   Exit ;
End ;
If NOT Assigned ( _Form ) Then Begin
   PUT_LOG ( 'ERRO _Form NULL ATIVAR HINT COMPONENTES [' + Origem + ']' ) ;
   Exit ;
End Else Begin
   PUT_LOG ( 'ATIVAR HINT COMPONENTES [' + Origem + ']' ) ;
End ;
_Form.ShowHint := TRUE ;
_Form.Hint := DateTimeToStr ( Now ) + sLineBreak +
              'TForm [' + _Form.Name + ']' + sLineBreak ;
Result := _Form.Hint + sLineBreak ;
For Local := 0 To _Form.ComponentCount - 1 Do Begin
   Try
      Obj := _Form.Components[Local] ;
      If NOT Assigned ( Obj ) Then Begin
         Continue ;
      End ;
      If (Obj As TComponent).Tag = 999999 Then Begin
         Continue ;
      End ;
      Try
         Contr := Obj AS TControl ;
      Except
         Contr := Nil ;
      End ;
      Try
         Compo := Obj AS TComponent ;
         If (Obj As TComponent).Tag = 999999 Then Begin
            Continue ;
         End ;
      Except
         Compo := Nil ;
      End ;
      If Obj Is TTransEdit Then Begin
         With (Obj As TTransEdit) Do Begin
            ShowHint := TRUE ;
            Hint := GET_INFO_OBJ ( Compo ) +
                    GET_OBJ_DIMENSOES ( Contr ) +
                    GET_INFO_PARENT ( Parent ) +
                    '' ;
            Result := Result + Hint + sLineBreak ;
         End
{$IFDEF NW}
      End Else If Obj Is TEspelho_RD Then Begin
         With (Obj As TEspelho_RD) Do Begin
            ShowHint := TRUE ;
            Hint := GET_INFO_OBJ ( Compo ) +
                    GET_OBJ_DIMENSOES ( Contr ) +
                    GET_INFO_PARENT ( Parent ) +
                    '' ;
            Result := Result + Hint + sLineBreak ;
         End
{$ENDIF}
      End Else If Obj Is TCheckBox Then Begin
         With (Obj As TCheckBox) Do Begin
            ShowHint := TRUE ;
            Hint := GET_INFO_OBJ ( Compo ) +
                    GET_OBJ_DIMENSOES ( Contr ) +
                    GET_INFO_PARENT ( Parent ) +
                    '' ;
            Result := Result + Hint + sLineBreak ;
         End
      End Else If Obj Is TEdit Then Begin
         With (Obj As TEdit) Do Begin
            ShowHint := TRUE ;
            Hint := GET_INFO_OBJ ( Compo ) +
                    GET_OBJ_DIMENSOES ( Contr ) +
                    GET_INFO_PARENT ( Parent ) +
                    '' ;
            Result := Result + Hint + sLineBreak ;
         End
      End Else If Obj Is TScrollBox Then Begin
         With (Obj As TScrollBox) Do Begin
            ShowHint := TRUE ;
            Hint := GET_INFO_OBJ ( Compo ) +
                    GET_OBJ_DIMENSOES ( Contr ) +
                    GET_INFO_PARENT ( Parent ) +
                    '' ;
            Result := Result + Hint + sLineBreak ;
         End
      End Else If Obj Is TMyRichEdit Then Begin
         With (Obj As TMyRichEdit) Do Begin
            ShowHint := TRUE ;
            Hint := GET_INFO_OBJ ( Compo ) +
                    GET_OBJ_DIMENSOES ( Contr ) +
                    GET_INFO_PARENT ( Parent ) +
                    '' ;
            Result := Result + Hint + sLineBreak ;
         End
      End Else If Obj Is TListBox Then Begin
         With (Obj As TListBox) Do Begin
            ShowHint := TRUE ;
            Hint := GET_INFO_OBJ ( Compo ) +
                    GET_OBJ_DIMENSOES ( Contr ) +
                    GET_INFO_PARENT ( Parent ) +
                    '' ;
            Result := Result + Hint + sLineBreak ;
         End
      End Else If Obj Is TBitBtn Then Begin
         With (Obj As TBitBtn) Do Begin
            ShowHint := TRUE ;
            Hint := GET_INFO_OBJ ( Compo ) +
                    GET_OBJ_DIMENSOES ( Contr ) +
                    GET_INFO_PARENT ( Parent ) +
                    '' ;
            Result := Result + Hint + sLineBreak ;
         End
      End Else If Obj Is TSpeedButton Then Begin
         With (Obj As TSpeedButton) Do Begin
            ShowHint := TRUE ;
            Hint := GET_INFO_OBJ ( Compo ) +
                    GET_OBJ_DIMENSOES ( Contr ) +
                    GET_INFO_PARENT ( Parent ) +
                    '' ;
            Result := Result + Hint + sLineBreak ;
         End
      End Else If Obj Is TToolButton Then Begin
         With (Obj As TToolButton) Do Begin
            ShowHint := TRUE ;
            Hint := GET_INFO_OBJ ( Compo ) +
                    GET_OBJ_DIMENSOES ( Contr ) +
                    GET_INFO_PARENT ( Parent ) +
                    '' ;
            Result := Result + Hint + sLineBreak ;
         End
      End Else If Obj Is TToolBar Then Begin
         With (Obj As TToolBar) Do Begin
            ShowHint := TRUE ;
            Hint := GET_INFO_OBJ ( Compo ) +
                    GET_OBJ_DIMENSOES ( Contr ) +
                    GET_INFO_PARENT ( Parent ) +
                    '' ;
            Result := Result + Hint + sLineBreak ;
         End
      End Else If Obj Is TSpinEdit Then Begin
         With (Obj As TSpinEdit) Do Begin
            ShowHint := TRUE ;
            Hint := GET_INFO_OBJ ( Compo ) +
                    GET_OBJ_DIMENSOES ( Contr ) +
                    GET_INFO_PARENT ( Parent ) +
                    '' ;
            Result := Result + Hint + sLineBreak ;
         End
      End Else If Obj Is TDateTimePicker Then Begin
         With (Obj As TDateTimePicker) Do Begin
            ShowHint := TRUE ;
            Hint := GET_INFO_OBJ ( Compo ) +
                    GET_OBJ_DIMENSOES ( Contr ) +
                    GET_INFO_PARENT ( Parent ) +
                    '' ;
            Result := Result + Hint + sLineBreak ;
         End
      End Else If Obj Is TTreeView Then Begin
         With (Obj As TTreeView) Do Begin
            ShowHint := TRUE ;
            Hint := GET_INFO_OBJ ( Compo ) +
                    GET_OBJ_DIMENSOES ( Contr ) +
                    GET_INFO_PARENT ( Parent ) +
                    '' ;
            Result := Result + Hint + sLineBreak ;
         End
      End Else If Obj Is TSplitter Then Begin
         With (Obj As TSplitter) Do Begin
            ShowHint := TRUE ;
            Hint := GET_INFO_OBJ ( Compo ) +
                    GET_OBJ_DIMENSOES ( Contr ) +
                    GET_INFO_PARENT ( Parent ) +
                    '' ;
            Result := Result + Hint + sLineBreak ;
         End
      End Else If Obj Is TStringGrid Then Begin
         With (Obj As TStringGrid) Do Begin
            ShowHint := TRUE ;
            Hint := GET_INFO_OBJ ( Compo ) +
                    GET_OBJ_DIMENSOES ( Contr ) +
                    GET_INFO_PARENT ( Parent ) +
                    '' ;
            Result := Result + Hint + sLineBreak ;
         End
      End Else If Obj Is TMenuItem Then Begin
         With (Obj As TMenuItem) Do Begin
            //ShowHint := TRUE ;
            Hint := GET_INFO_OBJ ( Compo ) +
                    GET_OBJ_DIMENSOES ( Contr ) +
                    GET_INFO_PARENT ( Parent ) +
                    '' ;
            Result := Result + Hint + sLineBreak ;
         End
      End Else If Obj Is TImage Then Begin
         With (Obj As TImage) Do Begin
            ShowHint := TRUE ;
            Hint := GET_INFO_OBJ ( Compo ) +
                    GET_OBJ_DIMENSOES ( Contr ) +
                    GET_INFO_PARENT ( Parent ) +
                    '' ;
            Result := Result + Hint + sLineBreak ;
         End
      End Else If Obj Is TComboBox Then Begin
         With (Obj As TComboBox) Do Begin
            ShowHint := TRUE ;
            Hint := GET_INFO_OBJ ( Compo ) +
                    GET_OBJ_DIMENSOES ( Contr ) +
                    GET_INFO_PARENT ( Parent ) +
                    '' ;
            Result := Result + Hint + sLineBreak ;
         End
      End Else If Obj Is TRadioButton Then Begin
         With (Obj As TRadioButton) Do Begin
            ShowHint := TRUE ;
            Hint := GET_INFO_OBJ ( Compo ) +
                    GET_OBJ_DIMENSOES ( Contr ) +
                    GET_INFO_PARENT ( Parent ) +
                    '' ;
            Result := Result + Hint + sLineBreak ;
         End
      End Else If Obj Is TButton Then Begin
         With (Obj As TButton) Do Begin
            ShowHint := TRUE ;
            Hint := GET_INFO_OBJ ( Compo ) +
                    GET_OBJ_DIMENSOES ( Contr ) +
                    GET_INFO_PARENT ( Parent ) +
                    '' ;
            Result := Result + Hint + sLineBreak ;
         End
      {
      End Else If Obj Is TSpeedBar Then Begin
         With (Obj As TSpeedBar) Do Begin
            ShowHint := TRUE ;
            Hint := GET_INFO_OBJ ( Compo ) +
                    GET_OBJ_DIMENSOES ( Contr ) +
                    GET_INFO_PARENT ( Parent ) +
                    '' ;
            Result := Result + Hint + sLineBreak ;
         End
      }
      End Else If Obj Is TPanel Then Begin
         With (Obj As TPanel) Do Begin
            ShowHint := TRUE ;
            Hint := GET_INFO_OBJ ( Compo ) +
                    GET_OBJ_DIMENSOES ( Contr ) +
                    GET_INFO_PARENT ( Parent ) +
                    '' ;
            Result := Result + Hint + sLineBreak ;
         End
      End Else If Obj Is TStatusBar Then Begin
         With (Obj As TStatusBar) Do Begin
            ShowHint := TRUE ;
            Hint := GET_INFO_OBJ ( Compo ) +
                    GET_OBJ_DIMENSOES ( Contr ) +
                    GET_INFO_PARENT ( Parent ) +
                    '' ;
            Result := Result + Hint + sLineBreak ;
         End
      End Else If Obj Is TMemo Then Begin
         With (Obj As TMemo) Do Begin
            ShowHint := TRUE ;
            Hint := GET_INFO_OBJ ( Compo ) +
                    GET_OBJ_DIMENSOES ( Contr ) +
                    GET_INFO_PARENT ( Parent ) +
                    '' ;
            Result := Result + Hint + sLineBreak ;
         End
      End Else If Obj Is TRichEdit Then Begin
         With (Obj As TRichEdit) Do Begin
            ShowHint := TRUE ;
            Hint := GET_INFO_OBJ ( Compo ) +
                    GET_OBJ_DIMENSOES ( Contr ) +
                    GET_INFO_PARENT ( Parent ) +
                    '' ;
            Result := Result + Hint + sLineBreak ;
         End
      End Else If Obj Is TLabel Then Begin
         With (Obj As TLabel) Do Begin
            ShowHint := TRUE ;
            Hint := GET_INFO_OBJ ( Compo ) +
                    GET_OBJ_DIMENSOES ( Contr ) +
                    GET_INFO_PARENT ( Parent ) +
                    '' ;
            Result := Result + Hint + sLineBreak ;
         End
      End Else If Obj Is TPageControl Then Begin
         With (Obj As TPageControl) Do Begin
            ShowHint := TRUE ;
            Hint := GET_INFO_OBJ ( Compo ) +
                    GET_OBJ_DIMENSOES ( Contr ) +
                    GET_INFO_PARENT ( Parent ) +
                    '' ;
            Result := Result + Hint + sLineBreak ;
         End
//
      End Else If Obj Is TMaskEdit Then Begin
         With (Obj As TMaskEdit) Do Begin
            ShowHint := TRUE ;
            Hint := GET_INFO_OBJ ( Compo ) +
                    GET_INFO_PARENT ( Parent ) +
                    GET_OBJ_DIMENSOES ( Contr ) +
                    '' ;
            Result := Result + Hint + sLineBreak ;
         End
      End Else If Obj Is TLabeledEdit Then Begin
         With (Obj As TLabeledEdit) Do Begin
            ShowHint := TRUE ;
            Hint := GET_INFO_OBJ ( Compo ) +
                    GET_OBJ_DIMENSOES ( Contr ) +
                    GET_INFO_PARENT ( Parent ) +
                    '' ;
            Result := Result + Hint + sLineBreak ;
         End
      {
      End Else If Obj Is TRxLabel Then Begin
         With (Obj As TRxLabel) Do Begin
            ShowHint := TRUE ;
            Hint := GET_INFO_OBJ ( Compo ) +
                    GET_OBJ_DIMENSOES ( Contr ) +
                    GET_INFO_PARENT ( Parent ) +
                    '' ;
            Result := Result + Hint + sLineBreak ;
         End
      }
      {
      End Else If Obj Is TTextListBox Then Begin
         With (Obj As TTextListBox) Do Begin
            ShowHint := TRUE ;
            Hint := GET_INFO_OBJ ( Compo ) +
                    GET_OBJ_DIMENSOES ( Contr ) +
                    GET_INFO_PARENT ( Parent ) +
                    '' ;
            Result := Result + Hint + sLineBreak ;
         End
      }
      End Else If Obj Is TTimer Then Begin
         With (Obj As TTimer) Do Begin
            //ShowHint := TRUE ;
            Aux := GET_INFO_OBJ ( Compo ) +
                   GET_OBJ_DIMENSOES ( Contr ) +
                   //GET_INFO_PARENT ( Parent ) +
                   '' ;
            Result := Result + Aux + sLineBreak ;
         End
      End Else If Obj Is TIdTelnetServer Then Begin
         With (Obj As TIdTelnetServer) Do Begin
            //ShowHint := TRUE ;
            Aux := GET_INFO_OBJ ( Compo ) +
                   GET_OBJ_DIMENSOES ( Contr ) +
                   //GET_INFO_PARENT ( Parent ) +
                   '' ;
            Result := Result + Aux + sLineBreak ;
         End
      End Else If Obj Is TIdUDPClient Then Begin
         With (Obj As TIdUDPClient) Do Begin
            //ShowHint := TRUE ;
            Aux := GET_INFO_OBJ ( Compo ) +
                   GET_OBJ_DIMENSOES ( Contr ) +
                   //GET_INFO_PARENT ( Parent ) +
                   '' ;
            Result := Result + Aux + sLineBreak ;
         End
      {
      End Else If Obj Is TDirectoryEdit Then Begin
         With (Obj As TDirectoryEdit) Do Begin
            ShowHint := TRUE ;
            Hint := GET_INFO_OBJ ( Compo ) +
                    GET_OBJ_DIMENSOES ( Contr ) +
                    GET_INFO_PARENT ( Parent ) +
                    '' ;
            Result := Result + Hint + sLineBreak ;
         End
      }
      End Else If Obj Is TPopupMenu Then Begin
         With (Obj As TPopupMenu) Do Begin
            //ShowHint := TRUE ;
            Aux := GET_INFO_OBJ ( Compo ) +
                   GET_OBJ_DIMENSOES ( Contr ) +
                   //GET_INFO_PARENT ( Parent ) +
                   '' ;
            Result := Result + Aux + sLineBreak ;
         End
      {
      End Else If Obj Is TRxSlider Then Begin
         With (Obj As TRxSlider) Do Begin
            ShowHint := TRUE ;
            Hint := GET_INFO_OBJ ( Compo ) +
                    GET_OBJ_DIMENSOES ( Contr ) +
                    GET_INFO_PARENT ( Parent ) +
                    '' ;
            Result := Result + Hint + sLineBreak ;
         End
      }
      End Else If Obj Is TChart Then Begin
         With (Obj As TChart) Do Begin
            ShowHint := TRUE ;
            Hint := GET_INFO_OBJ ( Compo ) +
                    GET_OBJ_DIMENSOES ( Contr ) +
                    GET_INFO_PARENT ( Parent ) +
                    '' ;
            Result := Result + Hint + sLineBreak ;
         End
      End Else If Obj Is TLineSeries Then Begin
         With (Obj As TLineSeries) Do Begin
            //ShowHint := TRUE ;
            Aux := GET_INFO_OBJ ( Compo ) +
                   GET_OBJ_DIMENSOES ( Contr ) +
                   //GET_INFO_PARENT ( Parent ) +
                   '' ;
            Result := Result + Aux + sLineBreak ;
         End
      End Else If Obj Is TBevel Then Begin
         With (Obj As TBevel) Do Begin
            ShowHint := TRUE ;
            Hint := GET_INFO_OBJ ( Compo ) +
                    GET_OBJ_DIMENSOES ( Contr ) +
                    GET_INFO_PARENT ( Parent ) +
                    '' ;
            Result := Result + Hint + sLineBreak ;
         End
      End Else If Obj Is TServerSocket Then Begin
         With (Obj As TServerSocket) Do Begin
            //ShowHint := TRUE ;
            Aux := GET_INFO_OBJ ( Compo ) +
                   GET_OBJ_DIMENSOES ( Contr ) +
                   //GET_INFO_PARENT ( Parent ) +
                   '' ;
            Result := Result + Aux + sLineBreak ;
         End
      End Else If Obj Is TClientSocket Then Begin
         With (Obj As TClientSocket) Do Begin
            //ShowHint := TRUE ;
            Aux := GET_INFO_OBJ ( Compo ) +
                   GET_OBJ_DIMENSOES ( Contr ) +
                   //GET_INFO_PARENT ( Parent ) +
                   '' ;
            Result := Result + Aux + sLineBreak ;
         End
      End Else If Obj Is TFDQuery Then Begin
         With (Obj As TFDQuery) Do Begin
            //ShowHint := TRUE ;
            Aux := GET_INFO_OBJ ( Compo ) +
                   GET_OBJ_DIMENSOES ( Contr ) +
                   //GET_INFO_PARENT ( Parent ) +
                   '' ;
            Result := Result + Aux + sLineBreak ;
         End
      End Else If Obj Is TFDConnection Then Begin
         With (Obj As TFDConnection) Do Begin
            //ShowHint := TRUE ;
            Aux := GET_INFO_OBJ ( Compo ) +
                   GET_OBJ_DIMENSOES ( Contr ) +
                   //GET_INFO_PARENT ( Parent ) +
                   '' ;
            Result := Result + Aux + sLineBreak ;
         End
      End Else If Obj Is TIdCmdTCPClient Then Begin
         With (Obj As TIdCmdTCPClient) Do Begin
            //ShowHint := TRUE ;
            Aux := GET_INFO_OBJ ( Compo ) +
                   GET_OBJ_DIMENSOES ( Contr ) +
                   //GET_INFO_PARENT ( Parent ) +
                   '' ;
            Result := Result + Aux + sLineBreak ;
         End
      End Else If Obj Is TDataSource Then Begin
         With (Obj As TDataSource) Do Begin
            //ShowHint := TRUE ;
            Aux := GET_INFO_OBJ ( Compo ) +
                   GET_OBJ_DIMENSOES ( Contr ) +
                   //GET_INFO_PARENT ( Parent ) +
                   '' ;
            Result := Result + Aux + sLineBreak ;
         End
      End Else If Obj Is TRadioGroup Then Begin
         With (Obj As TRadioGroup) Do Begin
            ShowHint := TRUE ;
            Hint := GET_INFO_OBJ ( Compo ) +
                    GET_OBJ_DIMENSOES ( Contr ) +
                    GET_INFO_PARENT ( Parent ) +
                    '' ;
            Result := Result + Hint + sLineBreak ;
         End
      End Else If Obj Is TDBGrid Then Begin
         With (Obj As TDBGrid) Do Begin
            ShowHint := TRUE ;
            Hint := GET_INFO_OBJ ( Compo ) +
                    GET_OBJ_DIMENSOES ( Contr ) +
                    GET_INFO_PARENT ( Parent ) +
                    '' ;
            Result := Result + Hint + sLineBreak ;
         End
      {
      End Else If Obj Is TRxSpinButton Then Begin
         With (Obj As TRxSpinButton) Do Begin
            ShowHint := TRUE ;
            Hint := GET_INFO_OBJ ( Compo ) +
                    GET_OBJ_DIMENSOES ( Contr ) +
                    GET_INFO_PARENT ( Parent ) +
                    '' ;
            Result := Result + Hint + sLineBreak ;
         End
      }
      {
      End Else If Obj Is TRxSpeedButton Then Begin
         With (Obj As TRxSpeedButton) Do Begin
            ShowHint := TRUE ;
            Hint := GET_INFO_OBJ ( Compo ) +
                    GET_OBJ_DIMENSOES ( Contr ) +
                    GET_INFO_PARENT ( Parent ) +
                    '' ;
            Result := Result + Hint + sLineBreak ;
         End
      }
      End Else If Obj Is TProgressBar Then Begin
         With (Obj As TProgressBar) Do Begin
            ShowHint := TRUE ;
            Hint := GET_INFO_OBJ ( Compo ) +
                    GET_OBJ_DIMENSOES ( Contr ) +
                    GET_INFO_PARENT ( Parent ) +
                    '' ;
            Result := Result + Hint + sLineBreak ;
         End
      End Else If Obj Is TShape Then Begin
         With (Obj As TShape) Do Begin
            ShowHint := TRUE ;
            Hint := GET_INFO_OBJ ( Compo ) +
                    GET_OBJ_DIMENSOES ( Contr ) +
                    GET_INFO_PARENT ( Parent ) +
                    '' ;
            Result := Result + Hint + sLineBreak ;
         End
      {
      End Else If Obj Is TRxRichEdit Then Begin
         With (Obj As TRxRichEdit) Do Begin
            ShowHint := TRUE ;
            Hint := GET_INFO_OBJ ( Compo ) +
                    GET_OBJ_DIMENSOES ( Contr ) +
                    GET_INFO_PARENT ( Parent ) +
                    '' ;
            Result := Result + Hint + sLineBreak ;
         End
      }
      {
      End Else If Obj Is TRxCalculator Then Begin
         With (Obj As TRxCalculator) Do Begin
            //ShowHint := TRUE ;
            Aux := GET_INFO_OBJ ( Compo ) +
                   GET_OBJ_DIMENSOES ( Contr ) +
                   //GET_INFO_PARENT ( Parent ) +
                   '' ;
            Result := Result + Aux + sLineBreak ;
         End
      }
      End Else If Obj Is TOpenDialog Then Begin
         With (Obj As TOpenDialog) Do Begin
            //ShowHint := TRUE ;
            Aux := GET_INFO_OBJ ( Compo ) +
                   GET_OBJ_DIMENSOES ( Contr ) +
                   //GET_INFO_PARENT ( Parent ) +
                   '' ;
            Result := Result + Aux + sLineBreak ;
         End
      End Else If Obj Is TSaveDialog Then Begin
         With (Obj As TSaveDialog) Do Begin
            //ShowHint := TRUE ;
            Aux := GET_INFO_OBJ ( Compo ) +
                   GET_OBJ_DIMENSOES ( Contr ) +
                   //GET_INFO_PARENT ( Parent ) +
                   '' ;
            Result := Result + Aux + sLineBreak ;
         End
      End Else If Obj Is TPageControl Then Begin
         With (Obj As TPageControl) Do Begin
            ShowHint := TRUE ;
            Hint := GET_INFO_OBJ ( Compo ) +
                    GET_OBJ_DIMENSOES ( Contr ) +
                    GET_INFO_PARENT ( Parent ) +
                    '' ;
            Result := Result + Hint + sLineBreak ;
         End
      End Else If Obj Is TPrinterSetupDialog Then Begin
         With (Obj As TPrinterSetupDialog) Do Begin
            //ShowHint := TRUE ;
            Aux := GET_INFO_OBJ ( Compo ) +
                   GET_OBJ_DIMENSOES ( Contr ) +
                   //GET_INFO_PARENT ( Parent ) +
                   '' ;
            Result := Result + Aux + sLineBreak ;
         End
      End Else If Obj Is TPrintDialog Then Begin
         With (Obj As TPrintDialog) Do Begin
            //ShowHint := TRUE ;
            Aux := GET_INFO_OBJ ( Compo ) +
                   GET_OBJ_DIMENSOES ( Contr ) +
                   //GET_INFO_PARENT ( Parent ) +
                   '' ;
            Result := Result + Aux + sLineBreak ;
         End
      {
      End Else If Obj Is TDualListDialog Then Begin
         With (Obj As TDualListDialog) Do Begin
            //ShowHint := TRUE ;
            Aux := GET_INFO_OBJ ( Compo ) +
                   GET_OBJ_DIMENSOES ( Contr ) +
                   //GET_INFO_PARENT ( Parent ) +
                   '' ;
            Result := Result + Aux + sLineBreak ;
         End
      }
      End Else If Obj Is TImageList Then Begin
         With (Obj As TImageList) Do Begin
            //ShowHint := TRUE ;
            Aux := GET_INFO_OBJ ( Compo ) +
                   GET_OBJ_DIMENSOES ( Contr ) +
                   //GET_INFO_PARENT ( Parent ) +
                   '' ;
            Result := Result + Aux + sLineBreak ;
         End
      {
      End Else If Obj Is TSpeedBarSection Then Begin
         With (Obj As TSpeedBarSection) Do Begin
            //ShowHint := TRUE ;
            Aux := GET_INFO_OBJ ( Compo ) +
                   GET_OBJ_DIMENSOES ( Contr ) +
                   //GET_INFO_PARENT ( Parent ) +
                   '' ;
            Result := Result + Aux + sLineBreak ;
         End
      }
      {
      End Else If Obj Is TSpeedItem Then Begin
         With (Obj As TSpeedItem) Do Begin
            ShowHint := TRUE ;
            Hint := GET_INFO_OBJ ( Compo ) +
                    GET_OBJ_DIMENSOES ( Contr ) +
                    //GET_INFO_PARENT ( Parent ) +
                    '' ;
            Result := Result + Hint + sLineBreak ;
         End
      }
      End Else If Obj Is TTabSheet Then Begin
         With (Obj As TTabSheet) Do Begin
            ShowHint := TRUE ;
            Hint := GET_INFO_OBJ ( Compo ) +
                    GET_OBJ_DIMENSOES ( Contr ) +
                    GET_INFO_PARENT ( Parent ) +
                    '' ;
            Result := Result + Hint + sLineBreak ;
         End
      End ;
   Except
   End ;
End ;
If SALVAR Then Begin
   Try
      FN := Diretorio + 'Config\Logs\' + _Form.Name + '.DAT' ;
      WRITE_FILE_CORE ( 'ATIVAR_HINT_COMPONENTES',
                        FN, Result, DELAYED_TRUE ) ;
   Except
   End ;
End ;
End ;

Function IS_MSG_SELO ( _Msg : LongInt ; _Tag : String ) : Boolean ;
Begin
_Tag := Trim ( _Tag ) ;
If _Tag <> '' Then Begin
   While Pos ( '#', _Tag ) > 0 Do Begin
      Delete ( _Tag, Pos ( '#', _Tag ), 1 ) ;
   End ;
   _Tag := Trim ( _Tag ) ;
End ;
If _Msg > 0 Then Begin
   Result := ( _Msg = DEF_MSG_CHYRON_SELO_2 ) OR
             ( _Msg = DEF_MSG_CHYRON_TELAO ) OR
             ( _Msg = DEF_MSG_CHYRON_SELO ) OR
             ( _Msg = DEF_MSG_CHYRON_SELO1 ) OR
             ( _Msg = DEF_MSG_CHYRON_SELO2 ) OR
             ( _Msg = DEF_MSG_CHYRON_SELO3 ) OR
             ( _Msg = DEF_MSG_CHYRON_CONF1 ) OR
             ( _Msg = DEF_MSG_CHYRON_CONF2 ) OR
             ( _Msg = DEF_MSG_CHYRON_CONF3 ) OR
             ( _Msg = DEF_MSG_CHYRON_CONF4 ) ;
End Else If ( _Tag = 'CONF1' ) OR
            ( _Tag = 'CONF2' ) OR
            ( _Tag = 'CONF3' ) OR
            ( _Tag = 'CONF4' ) OR
            ( _Tag = 'TELAO' ) OR
            ( _Tag = 'SELO' ) OR
            ( _Tag = 'SELO1' ) OR
            ( _Tag = 'SELO2' ) OR
            ( _Tag = 'SELO3' ) Then Begin
   Result := TRUE ;
End Else Begin
   Result := FALSE ;
End ;
End ;

Function IS_MSG_SEGUNDA_LINHA_MAIUSCULA ( _Msg : LongInt ; _Tag : String ) : Boolean ;
Begin
_Tag := Trim ( Super_UpperCase ( _Tag ) ) ;
If _Tag <> '' Then Begin
   While Pos ( '#', _Tag ) > 0 Do Begin
      Delete ( _Tag, Pos ( '#', _Tag ), 1 ) ;
   End ;
   _Tag := Trim ( _Tag ) ;
End ;
If _Msg > 0 Then Begin
   Result := ( _Msg = DEF_MSG_CHYRON_MANCHETE ) OR
             ( _Msg = DEF_MSG_CHYRON_INFO2 ) OR
             ( _Msg = DEF_MSG_CHYRON_INFO3 ) OR
             ( _Msg = DEF_MSG_CHYRON_IMAGENS_2 ) OR
             ( _Msg = DEF_MSG_CHYRON_IMAGENS_3 ) OR
             ( _Msg = DEF_MSG_CHYRON_EDICAO_2 ) OR
             ( _Msg = DEF_MSG_CHYRON_EDICAO_3 ) OR
             ( _Msg = DEF_MSG_CHYRON_INFORMACAO_2 ) OR
             ( _Msg = DEF_MSG_CHYRON_INFORMACAO_3 ) OR
             ( _Msg = DEF_MSG_CHYRON_CAMERA ) ;
End Else If ( _Tag = 'MANCHETE' ) OR
            ( _Tag = 'DESTAQUE' ) OR
            ( _Tag = 'INFO2' ) OR
            ( _Tag = 'INFO3' ) OR
            ( _Tag = 'INFORMACAO_2' ) OR
            ( _Tag = 'INFORMACAO_3' ) OR
            ( _Tag = 'IMAGENS2' ) OR
            ( _Tag = 'IMAGENS3' ) OR
            ( _Tag = 'EDICAO2' ) OR
            ( _Tag = 'EDICAO3' ) OR
            ( _Tag = 'CAMERA' ) OR
            ( _Tag = 'CÂMERA' ) Then Begin
   Result := TRUE ;
End Else Begin
   Result := FALSE ;
End ;
End ;

Function IS_MSG_SEGUNDA_LINHA_PRIMEIRA_MAIUSCULA ( _Msg : LongInt ; _Tag : String ) : Boolean ;
Begin
_Tag := Trim ( Super_UpperCase ( _Tag ) ) ;
If _Tag <> '' Then Begin
   While Pos ( '#', _Tag ) > 0 Do Begin
      Delete ( _Tag, Pos ( '#', _Tag ), 1 ) ;
   End ;
   _Tag := Trim ( _Tag ) ;
End ;
If _Msg > 0 Then Begin
   Result := ( _Msg = DEF_MSG_CHYRON_FIXA ) ;
End Else If ( _Tag = 'FIXA' ) OR
            ( _Tag = 'TARJA' ) Then Begin
   Result := TRUE ;
End Else Begin
   Result := FALSE ;
End ;
End ;

Function IS_MSG_SEGUNDA_LINHA_MINUSCULA ( _Msg : LongInt ; _Tag : String ) : Boolean ;
Begin
_Tag := Trim ( Super_UpperCase ( _Tag ) ) ;
If _Tag <> '' Then Begin
   While Pos ( '#', _Tag ) > 0 Do Begin
      Delete ( _Tag, Pos ( '#', _Tag ), 1 ) ;
   End ;
   _Tag := Trim ( _Tag ) ;
End ;
If _Msg > 0 Then Begin
   Result := ( _Msg = DEF_MSG_CHYRON_GC ) OR
             ( _Msg = DEF_MSG_CHYRON_SYS_CGV ) ;
End Else If ( _Tag = 'GC' ) OR
            ( _Tag = 'GCV' ) Then Begin
   Result := TRUE ;
End Else Begin
   Result := FALSE ;
End ;
End ;

Procedure ALPHA_PNG ( Origem : String ; IM : TImage ; FN : String ) ;
var Png     : TPngImage ;
    Bmp     : TBitmap ;
    BlendFn : TBlendFunction ;
Begin
_Debug ( 'INI ALPHA PNG IM[' + IM.Name + '] FN[' + FN + ']' ) ;
Png := TPngImage.Create ;
//Png.LoadFromFile ( FN ) ;
GET_PNG ( 'ALPHA_PNG/' + Origem, Png, FN ) ;
Bmp := TBitmap.Create ;
Bmp.Assign ( Png ) ;
Try
   //IM.Picture.LoadFromFile ( '' ) ;
   GET_PICTURE ( 'ALPHA_PNG', IM, IM.Picture, '' ) ;
   IM.Invalidate ;
   IM.Repaint ;
Except
End ;
IM.Picture.Bitmap.PixelFormat := pf32bit ;
IM.Picture.Bitmap.AlphaFormat := afPremultiplied ;
IM.Picture.Bitmap.Canvas.Brush.Color := clBlack ;
IM.Picture.Bitmap.SetSize ( Png.Width, Png.Height ) ;
// alpha blend the temporary bitmap to the bitmap of the image
BlendFn.BlendOp := AC_SRC_OVER ;
BlendFn.BlendFlags := 0 ;
BlendFn.SourceConstantAlpha := 255 ; // 128 ; // opacity
BlendFn.AlphaFormat := AC_SRC_ALPHA ;
Winapi.Windows.AlphaBlend ( IM.Picture.Bitmap.Canvas.Handle,
                            0, 0,
                            IM.Picture.Bitmap.Width, IM.Picture.Bitmap.Height,
                            Bmp.Canvas.Handle, 0, 0, Bmp.Width, Bmp.Height,
                            BlendFn ) ;
Bmp.Free ;
Png.Free ;
_Debug ( 'FIM ALPHA PNG' ) ;
End ;

Function LOAD_IMAGE ( Origem : String ; Incluir_Name : Boolean ;
                      Dir1, Dir2, Dir3 : String ; IM : TImage ; FN : String ) : Boolean ;
Begin
_Debug ( 'INI LOAD_IMAGE [' + FN + ']' ) ;
Result := FALSE ;
Try
   If NOT Assigned ( IM ) Then Begin
      _Debug ( 'Exit 1 LOAD_IMAGE [' + FN + ']' ) ;
      Exit ;
   End ;
   If ( FN <> '' ) AND ( Pos ( '\', FN ) = 0 ) Then Begin
      FN := Trim ( FN ) ;
      If ( Dir1 <> '' ) AND ( RR_FileExists ( 'LOAD_IMAGE/1', Dir1 + FN ) ) Then Begin
         FN := Dir1 + FN ;
      End Else If ( Dir2 <> '' ) AND ( RR_FileExists ( 'LOAD_IMAGE/2', Dir2 + FN ) ) Then Begin
         FN := Dir2 + FN ;
      End Else If ( Dir3 <> '' ) AND ( RR_FileExists ( 'LOAD_IMAGE/3', Dir3 + FN ) ) Then Begin
         FN := Dir3 + FN ;
      End Else Begin
         _Debug ( 'Exit 1 LOAD_IMAGE [' + FN + ']' ) ;
         Exit ;
      End ;
   End ;
   If FN = '' Then Begin
      Try
         GET_PICTURE ( 'LOAD_IMAGE', IM, IM.Picture, '' ) ;
         IM.Hint := '' ;
      Except
         On E : Exception Do Begin
            PUT_LOG ( 'Exception LOAD_IMAGE/1 ' +
                      '[' + E.Message + '][' + FN + ']' ) ;
         End ;
      End ;
      Exit ;
   End ;
   Try
      If RR_FileExists ( 'LOAD_IMAGE/4', FN ) Then Begin
         Try
            ALPHA_PNG ( 'LOAD_IMAGE/1', IM, FN ) ;
            If Incluir_Name Then Begin
               IM.Hint := FN + ';' + IM.Name ;
            End Else Begin
               IM.Hint := FN ;
            End ;
            Result := TRUE ;
         Except
            On E : Exception Do Begin
               IM.Hint := '' ;
               PUT_LOG ( 'Exception LOAD_IMAGE/2 ' +
                         '[' + E.Message + '][' + FN + ']' ) ;
            End ;
         End ;
      End Else Begin
         FN := GET_FN_IMAGEM_X ;
         If RR_FileExists ( 'LOAD_IMAGE/5', FN ) Then Begin
            Try
               ALPHA_PNG ( 'LOAD_IMAGE/2', IM, FN ) ;
               If Incluir_Name Then Begin
                  IM.Hint := FN + ';' + IM.Name ;
               End Else Begin
                  IM.Hint := FN ;
               End ;
               Result := TRUE ;
               _Debug ( 'Exit 2 LOAD_IMAGE [' + FN + ']' ) ;
               Exit ;
            Except
               On E : Exception Do Begin
                  IM.Hint := '' ;
                  PUT_LOG ( 'Exception LOAD_IMAGE/2 ' +
                            '[' + E.Message + '][' + FN + ']' ) ;
               End ;
            End ;
         End ;
         Try
            GET_PICTURE ( 'LOAD_IMAGE/3',
                          IM, IM.Picture, '' ) ;
            IM.Hint := '' ;
         Except
            On E : Exception Do Begin
               PUT_LOG ( 'Exception LOAD_IMAGE/3 ' +
                         '[' + E.Message + '][' + FN + ']' ) ;
            End ;
         End ;
      End ;
   Except
      On E : Exception Do Begin
         IM.Hint := '' ;
         PUT_LOG ( 'Exception LOAD_IMAGE/4 ' +
                   '[' + E.Message + '][' + FN + ']' ) ;
      End ;
   End ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception LOAD_IMAGE/5 ' +
                '[' + E.Message + '][' + FN + ']' ) ;
   End ;
End ;
_Debug ( 'FIM LOAD_IMAGE [' + FN + ']' ) ;
End ;

Procedure MISC_PREVIEW_SELO ( _Form : TForm ;
                              PN_Res : TPanel ; LB_Res : TLabel ;
                              IM_Preview, IM : TImage ; FN : String ) ;
Var Aux    : String ;
    Res_OK : Boolean ;
Begin
If NOT Assigned ( _Form ) Then Begin
   PUT_LOG ( 'Exit/1 !_Form MISC_PREVIEW_SELO' ) ;
   Exit ;
End ;
If NOT Assigned ( IM_Preview ) Then Begin
   PUT_LOG ( 'Exit/2 !_IM_Preview MISC_PREVIEW_SELO' ) ;
   Exit ;
End ;
If NOT Assigned ( IM ) Then Begin
   PUT_LOG ( 'Exit/1 !IM MISC_PREVIEW_SELO' ) ;
   Exit ;
End ;
//Res_OK := FALSE ;
If FN = '' Then Begin
   FN := IM.Hint ;
End ;
If FN = '' Then Begin
   PUT_LOG ( 'Exit/1 !FN MISC_PREVIEW_SELO' ) ;
   Exit ;
End ;
LB_Res.Caption := 'Resolução Incorreta' ;
If RR_FileExists ( 'MISC_PREVIEW_SELO', FN ) Then Begin
   Try
      //IM_Preview.Picture.LoadFromFile ( FN ) ;
      GET_PICTURE ( 'MISC PREVIEW_SELO/1',
                    IM_Preview, IM_Preview.Picture, FN ) ;
      If NOT _Form.Visible Then Begin
         _Form.Show ;
      End ;
      _Form.BringToFront ;
      Aux := '' ;
      If Assigned ( IM.Picture.Bitmap ) Then Begin
         Try
            Aux := Aux + 'Imagem[' +
                   IntToStr ( IM.Picture.Bitmap.Width ) + ':' +
                   IntToStr ( IM.Picture.Bitmap.Height ) + ']' ;
            Res_OK := ( IM.Picture.Bitmap.Width = 1920 ) AND
                      ( IM.Picture.Bitmap.Height = 1080 ) ;
            If NOT Res_OK Then Begin
               LB_Res.Caption := 'Resolução Incorreta' + sLineBreak +
                                 IntToStr ( IM.Picture.Bitmap.Width ) + ' x ' +
                                 IntToStr ( IM.Picture.Bitmap.Height ) ;

            End ;
         Except
            On E : Exception Do Begin
               Aux := Aux + ' Imagem[Erro]' ;
               PUT_LOG ( 'Exception TCCH.DBL_CLICK_IM_SELO/1 [' + E.Message + ']' ) ;
            End ;
         End ;
      End ;
      Try
         Aux := Aux + ' Objeto[' +
                IntToStr ( IM.Width ) + ':' +
                IntToStr ( IM.Height ) + ']' ;
      Except
         On E : Exception Do Begin
            Aux := Aux + ' Objeto[Erro]' ;
            PUT_LOG ( 'Exception TCCH.DBL_CLICK_IM_SELO/2 [' + E.Message + ']' ) ;
         End ;
      End ;
      Try
         Aux := Aux + ' Janela[' +
                IntToStr ( _Form.ClientWidth ) + ':' +
                IntToStr ( _Form.ClientHeight ) + ']' ;
      Except
         On E : Exception Do Begin
            Aux := Aux + ' Janela[Erro]' ;
            PUT_LOG ( 'Exception TCCH.DBL_CLICK_IM_SELO/3 [' + E.Message + ']' ) ;
         End ;
      End ;
      _Form.Caption := Title_RNews + ' - Preview Selo - ' + Aux ;
   Except
      On E : Exception Do Begin
         //IM_Preview.Picture.LoadFromFile ( '' ) ;
         GET_PICTURE ( 'MISC_PREVIEW_SELO/2',
                       IM_Preview, IM_Preview.Picture, '' ) ;
         PUT_LOG ( 'Exception TCCH.DBL_CLICK_IM_SELO/4 ' +
                   '[' + E.Message + '][' + FN + ']' ) ;
      End ;
   End ;
End Else Begin
   Try
      //IM_Preview.Picture.LoadFromFile ( '' ) ;
      GET_PICTURE ( 'MISC_PREVIEW_SELO/3',
                    IM_Preview, IM_Preview.Picture, '' ) ;
   Except
   End ;
End ;
PN_Res.Visible := FALSE ; // NOT Res_OK ;
PN_Res.BringToFront ;
End ;

Function TEXT_WIDTH ( _Form : TForm  ; Texto : String ; _Font : TFont ) : LongInt ;
Var _Edit   : TLabel ;
Begin
_Edit := TLabel.Create ( _Form ) ;
_Edit.Parent := _Form ;
_Edit.Visible := FALSE ;
_Edit.Canvas.Font := _Font ;
Result := _Edit.Canvas.TextWidth ( Texto ) ;
_Edit.Free ;
End ;

Function CARREGAR_CONTROLE ( Controle : TObject ) : Boolean ;
Var Ini     : TMemIniFile ;
    FN      : String ;
    _Name   : String ;
    _Canvas : TForm ;
Begin
Result := FALSE ;
FN := Dir_DataBase + 'config\controles.txt' ;
If NOT RR_FileExists ( 'CARREGAR CONTROLE', FN ) Then Begin
   //PUT_LOG ( 'CARREGAR_CONTROLE !FN [' + FN + ']' ) ;
   Exit ;
End ;
//PUT_LOG ( 'INICIO CARREGAR_CONTROLE OK [' + _Name + '][' + (Controle As TSpeedButton).Caption + ']' ) ;
Ini := TMemIniFile.Create ( FN ) ;
If Controle Is TSpeedButton Then Begin
   {
   CAPTION=EMOJI-7
   PARAM1=PLAY_EMOJI_7
   HINT=EXECUTAR EMOJI-7
   VISIBLE=1
   ENABLED=0
   }
   _Name := UpperCase ( (Controle As TSpeedButton).Name ) ;
   If NOT Ini.SectionExists ( _Name ) Then Begin
      //PUT_LOG ( 'CARREGAR_CONTROLE !Section [' + _Name + ']' ) ;
      Exit ;
   End ;
   (Controle As TSpeedButton).Caption := Ini.ReadString ( _Name, 'CAPTION', '' ) ;
   If (Controle As TSpeedButton).Caption = '' Then Begin
      //PUT_LOG ( 'CARREGAR_CONTROLE !Caption [' + _Name + ']' ) ;
      Exit ;
   End ;
   (Controle As TSpeedButton).Hint := //Ini.ReadString ( _Name, 'HINT', '' ) + sLineBreak +
                                 Ini.ReadString ( _Name, 'PARAM1', 'EXEC--EMOJI--1' ) ;
   (Controle As TSpeedButton).ShowHint := TRUE ;
   (Controle As TSpeedButton).Tag := 999999 ;
   (Controle As TSpeedButton).Visible := Ini.ReadBool ( _Name, 'VISIBLE', TRUE ) ;
   (Controle As TSpeedButton).Enabled := Ini.ReadBool ( _Name, 'ENABLED', TRUE ) ;
   _Canvas := TForm.Create ( (Controle As TSpeedButton).Parent ) ;
   _Canvas.Font := (Controle As TSpeedButton).Font ;
   (Controle As TSpeedButton).Width := _Canvas.Canvas.TextWidth ( (Controle As TSpeedButton).Caption ) + 15 ;
   _Canvas.Free ;
   Result := TRUE ;
End ;
Ini.Free ;
//PUT_LOG ( 'FINAL CARREGAR_CONTROLE OK [' + _Name + '][' + (Controle As TSpeedButton).Caption + ']' ) ;
End ;

Function GET_FN_IMAGEM_X : String ;
Begin
Result := Dir_Database + 'config\imagens\imagem_x.png' ;
End ;

Function SELECT_FIND_FN ( Dir1, Dir2, FN : String ) : String ;
Begin
Result := FN ;
If FN <> '' Then Begin
   If RR_FileExists ( 'SELECT_FIND_FN/1', Dir1 + FN ) Then Begin
      Result := Dir1 + FN ;
   End Else If RR_FileExists ( 'SELECT_FIND_FN/2', Dir2 + FN ) Then Begin
      Result := Dir2 + FN ;
   End Else Begin
   End ;
End ;
End ;

Function IS_PANEL_VAZIO ( _Form : TForm ; PN : TPanel ) : Boolean ;
Var Local     : LongInt ;
    Qtde      : LongInt ;
    Aux       : String ;
    _WControl : TWinControl ;
//    _Altura   : LongInt ;
    _Control  : TControl ;
Begin
Result := TRUE ;
Qtde := _Form.ComponentCount ;
//PUT_LOG ( 'IS_PANEL_VAZIO Qtde: ' + IntToStr(Qtde) ) ;
If Qtde = 0 Then Begin
   Exit ;
End ;
Aux := '' ;
//_Altura := 0 ;
For Local := 0 To Qtde - 1 Do Begin
    If _Form.Components[Local] Is TSpeedButton Then Begin
       If (_Form.Components[Local] As TSpeedButton).Parent = PN Then Begin
          If (_Form.Components[Local] As TSpeedButton).Visible Then Begin
             Result := FALSE  ;
             Exit ;
          End ;
       End ;
    End ;
    If NOT ( _Form.Components[Local] Is TWinControl ) Then Begin
       Continue ;
    End ;
    _WControl := _Form.Components[Local] As TWinControl ;
    If _WControl.Parent <> PN Then Begin
       Continue ;
    End ;
    If NOT _WControl.Visible Then Begin
       Continue ;
    End ;
    If NOT ( _Form.Components[Local] Is TControl ) Then Begin
       Continue ;
    End ;
    _Control := _Form.Components[Local] As TControl ;
    If _Control.Height > 0 Then Begin
       Result := FALSE  ;
       Exit ;
    End ;
End ;
End ;

Procedure AJUSTAR_ALTURA_PANEL ( _Form : TForm ; PN : TPanel ) ;
Var Local     : LongInt ;
    Qtde      : LongInt ;
//    Aux       : String ;
    _WControl : TWinControl ;
    _Altura   : LongInt ;
    _Control  : TControl ;
Begin
Qtde := _Form.ComponentCount ;
//PUT_LOG ( 'AJUSTAR_ALTURA_PANEL Qtde: ' + IntToStr(Qtde) ) ;
If Qtde = 0 Then Begin
   Exit ;
End ;
//Aux := '' ;
_Altura := 6 ; // PN_Top Fino Amarelo (espaçador)
For Local := 0 To Qtde - 1 Do Begin
    If _Form.Components[Local] Is TSpeedButton Then Begin
       If (_Form.Components[Local] As TSpeedButton).Parent = PN Then Begin
          If (_Form.Components[Local] As TSpeedButton).Visible Then Begin
             _Altura := _Altura + (_Form.Components[Local] As TSpeedButton).Height ;
             Continue ;
          End ;
       End ;
    End ;
    If _Form.Components[Local] Is TPanel Then Begin
       If (_Form.Components[Local] As TPanel).Parent = PN Then Begin
          If (_Form.Components[Local] As TPanel).Visible Then Begin
             If IS_PANEL_VAZIO ( _Form, (_Form.Components[Local] As TPanel) ) Then Begin
                Continue ;
             End ;
             _Altura := _Altura + (_Form.Components[Local] As TPanel).Height ;
             Continue ;
          End ;
       End ;
    End ;
    If NOT ( _Form.Components[Local] Is TWinControl ) Then Begin
       Continue ;
    End ;
    _WControl := _Form.Components[Local] As TWinControl ;
    If _WControl.Parent <> PN Then Begin
       Continue ;
    End ;
    If NOT _WControl.Visible Then Begin
       //PUT_LOG ( 'AJUSTAR_ALTURA_PANEL !Visible ' + _WControl.Name ) ;
       Continue ;
    End ;
    If NOT ( _Form.Components[Local] Is TControl ) Then Begin
       //PUT_LOG ( 'AJUSTAR_ALTURA_PANEL !Control ' + _WControl.Name ) ;
       Continue ;
    End ;
    _Control := _Form.Components[Local] As TControl ;
    If _Form.Components[Local] Is TPanel Then Begin
       If IS_PANEL_VAZIO ( _Form, (_Form.Components[Local] As TPanel) ) Then Begin
          Continue ;
       End ;
    End ;
    _Altura := _Altura + _Control.Height ;
//    Aux := Aux + (_Control.Name ) + sLineBreak ;
End ;
PN.Height := _Altura + 2 ;
//ShowMessage ( Aux + sLineBreak + IntToStr ( _Altura ) ) ;
End ;

Function IS_DOMINGO ( DT : TDateTime ) : Boolean ;
Begin
Result := DayOfWeek ( DT ) = 1 ;
End ;

Function IS_SEGUNDA ( DT : TDateTime ) : Boolean ;
Begin
Result := DayOfWeek ( DT ) = 2 ;
End ;

Function IS_TERCA ( DT : TDateTime ) : Boolean ;
Begin
Result := DayOfWeek ( DT ) = 3 ;
End ;

Function IS_QUARTA ( DT : TDateTime ) : Boolean ;
Begin
Result := DayOfWeek ( DT ) = 4 ;
End ;

Function IS_QUINTA ( DT : TDateTime ) : Boolean ;
Begin
Result := DayOfWeek ( DT ) = 5 ;
End ;

Function IS_SEXTA ( DT : TDateTime ) : Boolean ;
Begin
Result := DayOfWeek ( DT ) = 6 ;
End ;

Function IS_SABADO ( DT : TDateTime ) : Boolean ;
Begin
Result := DayOfWeek ( DT ) = 7 ;
End ;

Function GET_GN_CNT_CARREGANDO_SISTEMA : String ;
Begin
Result := Diretorio + 'Config\Cnt_Carregando_Sistema.DAT' ;
End ;

Function SUBSTITUICAO_BASICA_GC ( Texto, Retranca : String ) : String ;
Begin
While Pos ( '#TARJA: ', Texto ) > 0 Do Begin
   Texto := StringReplace ( Texto, '#TARJA: ', '#TARJA:' , [rfReplaceAll] ) ;
End ;
While Pos ( '#GC: ', Texto ) > 0 Do Begin
   Texto := StringReplace ( Texto, '#GC: ', '#GC:' , [rfReplaceAll] ) ;
End ;
Texto := StringReplace ( Texto,
                         '#TARJA:',
                         '#TARJA=' , [rfReplaceAll] ) ;
Texto := StringReplace ( Texto,
                         '#SON:',
                         '#SON=' , [rfReplaceAll] ) ;
Texto := StringReplace ( Texto,
                         '#GC:',
                         '#GC=' , [rfReplaceAll] ) ;
Texto := StringReplace ( Texto,
                         '#GC=' + sLineBreak ,
                         '#GC=' , [rfReplaceAll] ) ;
Texto := StringReplace ( Texto,
                         '#GC=' + #13 ,
                         '#GC=' , [rfReplaceAll] ) ;
Texto := StringReplace ( Texto,
                         '#GC=' + #10 ,
                         '#GC=' , [rfReplaceAll] ) ;
While Pos ( '#TARJA= ', Texto ) > 0 Do Begin
   Texto := StringReplace ( Texto,
                            '#TARJA= ',
                            '#TARJA=' , [rfReplaceAll] ) ;
End ;
While Pos ( '#SON= ', Texto ) > 0 Do Begin
   Texto := StringReplace ( Texto,
                            '#SON= ',
                            '#SON=' , [rfReplaceAll] ) ;
End ;
While Pos ( '#GC= ', Texto ) > 0 Do Begin
   Texto := StringReplace ( Texto,
                            '#GC= ',
                            '#GC=' , [rfReplaceAll] ) ;
End ;
Texto := StringReplace ( Texto,
                         '#TARJA=G1.COM.BR/CE',
                         '#G1' + sLineBreak +
                         'g1.com.br/ce' + sLineBreak, [rfReplaceAll] ) ;
Texto := StringReplace ( Texto,
                         '#TARJA=WHATSAPP',
                         '#WA' + sLineBreak , [rfReplaceAll] ) ;
Texto := StringReplace ( Texto,
                         '#SONORA SEM CREDITO',
                         '#FAKE' + sLineBreak +
                         'SONORA SEM CRÉDITO' , [rfReplaceAll] ) ;
Texto := StringReplace ( Texto,
                         '#GC= SEM CREDITO',
                         '#FAKE' + sLineBreak +
                         'SONORA SEM CRÉDITO' , [rfReplaceAll] ) ;
Texto := StringReplace ( Texto,
                         '#GC= SEM CRÉDITO',
                         '#FAKE' + sLineBreak +
                         'SONORA SEM CRÉDITO' , [rfReplaceAll] ) ;
Texto := StringReplace ( Texto,
                         '#SONORA SEM CRÉDITO',
                         '#FAKE' + sLineBreak +
                         'SONORA SEM CRÉDITO' , [rfReplaceAll] ) ;
Texto := StringReplace ( Texto,
                         '#SONORA' + sLineBreak + 'SEM CRÉDITO',
                         '#FAKE' + sLineBreak +
                         'SONORA SEM CRÉDITO' , [rfReplaceAll] ) ;
Texto := StringReplace ( Texto,
                         '#SONORA' + sLineBreak + 'SEM CREDITO',
                         '#FAKE' + sLineBreak +
                         'SONORA SEM CRÉDITO' , [rfReplaceAll] ) ;
Texto := StringReplace ( Texto,
                         '#GC=SONORA',
                         '#FAKE' + sLineBreak +
                         'SONORA SEM CRÉDITO' , [rfReplaceAll] ) ;
Texto := StringReplace ( Texto,
                         '#GC=SONORA',
                         '#FAKE' + sLineBreak +
                         'SONORA SEM CRÉDITO' , [rfReplaceAll] ) ;
Texto := StringReplace ( Texto,
                         '#GC=REPETE ',
                         '#FAKE=REPETE ' , [rfReplaceAll] ) ;
Texto := StringReplace ( Texto,
                         '#GC=REPETIR ',
                         '#FAKE=REPETIR ' , [rfReplaceAll] ) ;
Texto := StringReplace ( Texto,
                         '#TARJA=JORNAL NACIONAL',
                         '#CHAMADA' + sLineBreak +
                         'JORNAL NACIONAL' , [rfReplaceAll] ) ;
Texto := StringReplace ( Texto,
                         '#TARJA=NORDESTE RURAL',
                         '#CHAMADA' + sLineBreak +
                         'NORDESTE RURAL' , [rfReplaceAll] ) ;
Texto := StringReplace ( Texto,
                         '#TARJA=FANTASTICO',
                         '#CHAMADA' + sLineBreak +
                         'FANTÁSTICO' , [rfReplaceAll] ) ;
Texto := StringReplace ( Texto,
                         '#TARJA=FANTÁSTICO',
                         '#CHAMADA' + sLineBreak +
                         'FANTÁSTICO' , [rfReplaceAll] ) ;
Texto := StringReplace ( Texto,
                         '#GC=JORNAL NACIONAL',
                         '#CHAMADA' + sLineBreak +
                         'JORNAL NACIONAL' , [rfReplaceAll] ) ;
Texto := StringReplace ( Texto,
                         '#GC=NORDESTE RURAL',
                         '#CHAMADA' + sLineBreak +
                         'NORDESTE RURAL' , [rfReplaceAll] ) ;
Texto := StringReplace ( Texto,
                         '#GC=FANTASTICO',
                         '#CHAMADA' + sLineBreak +
                         'FANTÁSTICO' , [rfReplaceAll] ) ;
Texto := StringReplace ( Texto,
                         '#GC=FANTÁSTICO',
                         '#CHAMADA' + sLineBreak +
                         'FANTÁSTICO' , [rfReplaceAll] ) ;
Texto := StringReplace ( Texto,
                         '#TARJA=A SEGUIR',
                         '#ASEGUIR' + sLineBreak +
                         'A SEGUIR' + sLineBreak, [rfReplaceAll] ) ;
Texto := StringReplace ( Texto,
                         '#TARJA=ASEGUIR',
                         '#ASEGUIR' + sLineBreak +
                         'A SEGUIR' + sLineBreak, [rfReplaceAll] ) ;
Texto := StringReplace ( Texto,
                         '#TARJA=',
                         '#TARJA' + sLineBreak , [rfReplaceAll] ) ;
Texto := StringReplace ( Texto,
                         '#TARJA:',
                         '#TARJA' + sLineBreak , [rfReplaceAll] ) ;
Texto := StringReplace ( Texto,
                         '#SON:',
                         '#SON' + sLineBreak , [rfReplaceAll] ) ;
Texto := StringReplace ( Texto,
                         '#TARJA.',
                         '#TARJA' + sLineBreak , [rfReplaceAll] ) ;
Texto := StringReplace ( Texto,
                         '#SON.',
                         '#SON' + sLineBreak , [rfReplaceAll] ) ;
Texto := StringReplace ( Texto,
                         '#TARJA ',
                         '#TARJA' + sLineBreak , [rfReplaceAll] ) ;
Texto := StringReplace ( Texto,
                         '#SON ',
                         '#SON' + sLineBreak , [rfReplaceAll] ) ;
Texto := StringReplace ( Texto,
                         '#GC=IMAGENS',
                         '#EQUIPE=' +
                         'imagens', [rfReplaceAll] ) ;
Texto := StringReplace ( Texto,
                         '#GC= IMAGENS',
                         '#EQUIPE=' +
                         'imagens', [rfReplaceAll] ) ;
Texto := StringReplace ( Texto,
                         '#GC=VIVO',
                         '#VIVO' + sLineBreak +
                         '** LOGO VIVO **' + sLineBreak, [rfReplaceAll] ) ;
Texto := StringReplace ( Texto,
                         '#GC=AO VIVO',
                         '#VIVO' + sLineBreak +
                         '** LOGO VIVO **' + sLineBreak, [rfReplaceAll] ) ;
Texto := StringReplace ( Texto,
                         '#GC=ARQUIVO',
                         '#ARQUIVO' + sLineBreak +
                         '** LOGO ARQUIVO **' + sLineBreak, [rfReplaceAll] ) ;
Texto := StringReplace ( Texto,
                         '#GC=EXCLUSIVO',
                         '#EXCLUSIVO' + sLineBreak +
                         '** LOGO EXCLUSIVO **' + sLineBreak, [rfReplaceAll] ) ;
Texto := StringReplace ( Texto,
                         '#GC=REMOVER',
                         '#REMOVER' + sLineBreak +
                         '** REMOVER LOGO **' + sLineBreak, [rfReplaceAll] ) ;
Texto := StringReplace ( Texto,
                         '#GC=MARCA',
                         '#MARCA' + sLineBreak +
                         '** LOGO MARCA **' + sLineBreak, [rfReplaceAll] ) ;
Texto := StringReplace ( Texto,
                         '#GC=EDIÇÃO',
                         '#EQUIPE=' +
                         'edição' , [rfReplaceAll] ) ;
Texto := StringReplace ( Texto,
                         '#GC=EDICAO',
                         '#EQUIPE=' +
                         'edição' , [rfReplaceAll] ) ;
Texto := StringReplace ( Texto,
                         '#GC=PRODUÇÃO',
                         '#EQUIPE=' +
                         'produção' , [rfReplaceAll] ) ;
Texto := StringReplace ( Texto,
                         '#GC=PRODUCAO',
                         '#EQUIPE=' +
                         'produção' , [rfReplaceAll] ) ;
Texto := StringReplace ( Texto,
                         '#GC= PRODUÇÃO',
                         '#EQUIPE=' +
                         'produção' , [rfReplaceAll] ) ;
Texto := StringReplace ( Texto,
                         '#GC= PRODUCAO',
                         '#EQUIPE=' +
                         'produção' , [rfReplaceAll] ) ;
Texto := StringReplace ( Texto,
                         '#GC=REPORTAGEM',
                         '#EQUIPE=' +
                         'reportagem' , [rfReplaceAll] ) ;
Texto := StringReplace ( Texto,
                         '#GC= REPORTAGEM',
                         '#EQUIPE=' +
                         'reportagem' , [rfReplaceAll] ) ;
Texto := StringReplace ( Texto,
                         '#GC=ÁUDIO',
                         '#EQUIPE=' +
                         'áudio' , [rfReplaceAll] ) ;
Texto := StringReplace ( Texto,
                         '#GC=AUDIO',
                         '#EQUIPE=' +
                         'áudio' , [rfReplaceAll] ) ;
Texto := StringReplace ( Texto,
                         '#GC= ÁUDIO',
                         '#EQUIPE=' +
                         'áudio' , [rfReplaceAll] ) ;
Texto := StringReplace ( Texto,
                         '#GC= AUDIO',
                         '#EQUIPE=' +
                         'áudio' , [rfReplaceAll] ) ;
Texto := StringReplace ( Texto,
                         '#GC=',
                         '#GC' + sLineBreak ,    [rfReplaceAll] ) ;
Texto := StringReplace ( Texto,
                         '#GC:',
                         '#GC' + sLineBreak ,    [rfReplaceAll] ) ;
Texto := StringReplace ( Texto,
                         '#GC.',
                         '#GC' + sLineBreak ,    [rfReplaceAll] ) ;
Texto := StringReplace ( Texto,
                         '#GC ',
                         '#GC' + sLineBreak ,    [rfReplaceAll] ) ;
Texto := StringReplace ( Texto,
                         ' AO VIVO',
                         '' , [rfReplaceAll] ) ;
If Pos ( 'ESCALADA', Retranca ) > 0 Then Begin
   Texto := StringReplace ( Texto,
                            '#TARJA',
                            '#DESTAQUE' , [rfReplaceAll] ) ;
   Texto := StringReplace ( Texto,
                            '---',
                            '#---' + sLineBreak ,    [rfReplaceAll] ) ;
   //Texto := StringReplace ( Texto,
   //                         '#SONORA',
   //                         '#---' + sLineBreak ,    [rfReplaceAll] ) ;
   Texto := StringReplace ( Texto,
                            '#ESC',
                            '' + sLineBreak ,    [rfReplaceAll] ) ;
End ;
Result := Texto ;
End ;

Function GetModuleVersion ( Instance : THandle ;
         out iMajor, iMinor,  iRelease, iBuild : Integer ) : Boolean ;
Var fileInformation : PVSFIXEDFILEINFO ;
    verlen          : Cardinal ;
    rs              : TResourceStream ;
    m               : TMemoryStream ;
    resource        : HRSRC ;
Begin
If Instance = 0 Then Begin
   Instance := HInstance ;
End ;
Result := FALSE ;
resource := FindResource ( Instance, PChar(1), RT_VERSION ) ;
If resource = 0 Then Begin
   iMajor := 0 ;
   iMinor := 0 ;
   iRelease := 0 ;
   iBuild :=  0 ;
   Exit ;
End ;
m := TMemoryStream.Create ;
Try
   rs := TResourceStream.CreateFromID( Instance, 1,  RT_VERSION ) ;
   Try
      m.CopyFrom ( rs, rs.Size ) ;
   Finally
      rs.Free ;
   End ;
   m.Position := 0 ;
   If NOT VerQueryValue ( m.Memory, '\', Pointer(fileInformation), verlen ) Then Begin
      iMajor := 0 ;
      iMinor := 0 ;
      iRelease := 0 ;
      iBuild :=  0 ;
      Exit ;
   End ;
   iMajor := fileInformation.dwFileVersionMS SHR 16 ;
   iMinor := fileInformation.dwFileVersionMS AND $FFFF ;
   iRelease := fileInformation.dwFileVersionLS SHR 16 ;
   iBuild := fileInformation.dwFileVersionLS AND $FFFF ;
Finally
   m.Free ;
End ;
Result := TRUE ;
End ;

Function GetBuildInfo ( var V1, V2, V3, V4: Word ) : String ;
Var VerInfoSize ,
    VerValueSize ,
    Dummy        : DWord ;
    VerInfo      : Pointer ;
    VerValue     : PVSFixedFileInfo ;
Begin
VerInfoSize := GetFileVersionInfoSize ( PChar(ParamStr(0)), Dummy ) ;
If VerInfoSize > 0 Then Begin
   GetMem( VerInfo, VerInfoSize ) ;
   Try
      If GetFileVersionInfo(PChar(ParamStr(0)), 0, VerInfoSize, VerInfo) Then Begin
         VerQueryValue ( VerInfo, '\', Pointer(VerValue), VerValueSize ) ;
         With VerValue^ Do Begin
            V1 := dwFileVersionMS SHR 16 ;
            V2 := dwFileVersionMS AND $FFFF ;
            V3 := dwFileVersionLS SHR 16 ;
            V4 := dwFileVersionLS AND $FFFF ;
         End ;
      End ;
   Finally
      FreeMem ( VerInfo, VerInfoSize ) ;
   End ;
End ;
Result := IntToStr(V1) + '.' + IntToStr(V2) + '.' + IntToStr(V3) + '.' + IntToStr(V4) ;
End ;

Function GetBuildInfoStr : String ;
Var V1, V2, V3, V4 : Word ;
Begin
Result := GetBuildInfo ( V1, V2, V3, V4 ) ;
End ;

Function IDENTIFICACAO_OK ( Usuario, Senha : String ) : Boolean ;
Begin
Result := NOT TRUE ;
End ;

Procedure ELIMINAR_LINHAS_VAZIAS_MEMO ( Var ME : TMemo ) ;
Var Local : LongInt ;
    Qtde  : LongInt ;
Begin
If NOT Assigned ( ME ) Then Begin
   Exit ;
End ;
Qtde := ME.Lines.Count ;
If Qtde = 0 Then Begin
   Exit ;
End ;
For Local := Qtde - 1 DownTo 0 Do Begin
   If Trim ( ME.Lines[Local] ) = '' Then Begin
      ME.Lines.Delete(Local) ;
      Continue ;
   End ;
   ME.Lines[Local] := Trim ( ME.Lines[Local] ) ;
End ;
End ;

Function REMOVER_LINHAS_VAZIAS_E_PERDIDAS ( Texto : String ) : String ;
Var Local      : LongInt ;
    Local2     : LongInt ;
    Lista      : TStringList ;
    Aux        : String ;
    Aux2       : String ;
    Qtde       : LongInt ;
    Cnt        : LongInt ;
    Original   : String ;
//    Last_Vazia : Boolean ;
Begin
//Result := Texto ;
//Exit ;
Result := '' ;
Lista := TStringList.Create ;
Original := Texto ;
Lista.Text := Trim ( Texto ) ;
Qtde := Lista.Count ;
If Qtde = 0 Then Begin
   Exit ;
End ;
Cnt := 0 ;
//Last_Vazia := FALSE ;
For Local := 0 To Qtde - 1 Do Begin
   Aux := Trim ( Lista[Local] ) ;
   If Aux = '' Then Begin
      Inc ( Cnt ) ;
      If Cnt > 1 Then Begin
         For Local2 := Local To Qtde - 1 Do Begin
             Aux2 := Trim ( Lista[Local2] ) ;
             If Pos ( '#', Aux2 ) <> 1 Then Begin
                Lista[Local2] := '' ;
             End Else Begin
                Break ;
             End ;
         End ;
      End ;
   End Else Begin
      Cnt := 0 ;
   End ;
End ;
For Local := Qtde - 1 DownTo 0 Do Begin
   Aux := Trim ( Lista[Local] ) ;
   If Aux = '' Then Begin
      Lista.Delete ( Local ) ;
   End ;
End ;
Result := Lista.Text ;
{
ShowMessage ( Original + sLineBreak +
              '===================' + sLineBreak +
              Result ) ;
}
Lista.Free ;
End ;

Function REMOVER_BLOCOS_TEXTOS_AVULSOS ( Texto : String ) : String ;
Var Local      : LongInt ;
    Lista      : TStringList ;
    Aux1       : String ;
    Aux2       : String ;
    Qtde       : LongInt ;
    Alterado   : Boolean ;
Begin
Result := '' ;
Lista := TStringList.Create ;
Lista.Text := Trim ( Texto ) ;
Qtde := Lista.Count ;
If Qtde = 0 Then Begin
   Exit ;
End ;
Repeat
   Alterado := FALSE ;
   For Local := 0 To Qtde - 1 - 1 Do Begin
      Aux1 := Trim ( Lista[Local] ) ;
      Aux2 := Trim ( Lista[Local+1] ) ;
      If ( Aux1 = '' ) AND ( Aux2 <> '' ) Then Begin
         If Aux2[1] <> '#' Then Begin
            Alterado := TRUE ;
            Lista[Local+1] := '' ;
            Break ;
         End ;
      End ;
   End ;
Until NOT Alterado ;
Result := Lista.Text ;
Lista.Free ;
End ;

Function REMOVER_LINHAS_COM_COMENTARIOS ( Texto : String ) : String ;
Var Local      : LongInt ;
    Lista      : TStringList ;
    Aux        : String ;
    Qtde       : LongInt ;
Begin
Result := '' ;
Lista := TStringList.Create ;
Lista.Text := Trim ( Texto ) ;
Qtde := Lista.Count ;
If Qtde = 0 Then Begin
   Exit ;
End ;
For Local := Qtde - 1 DownTo 0 Do Begin
   Aux := Super_UpperCase ( Trim ( Lista[Local] ) ) ;
   If Aux = '' Then Begin
      Continue ;
   End ;
   If Length ( Aux ) < 2 Then Begin
      Lista.Delete(Local) ;
      Continue ;
   End ;
   If ( Aux[1] = '(' ) AND
      ( NOT IS_DIGIT(Aux[2]) ) Then Begin
      Lista.Delete(Local) ;
      Continue ;
   End ;
   If ( Copy ( Aux, 1, 2 ) = '""' ) OR
      ( Copy ( Aux, 1, 2 ) = '[[' ) OR
      ( Copy ( Aux, 1, 2 ) = '{{' ) OR
      ( Copy ( Aux, 1, 2 ) = '((' ) OR
      ( Copy ( Aux, 1, 2 ) = '**' ) OR
      ( Copy ( Aux, 1, 2 ) = '\\' ) OR
      ( Copy ( Aux, 1, 2 ) = '//' ) Then Begin
      Lista.Delete(Local) ;
      Continue ;
   End ;
End ;
Result := Lista.Text ;
Lista.Free ;
End ;

Function REMOVER_LINHAS_DUPLAS_TEXTO ( Texto : String ) : String ;
Var Local      : LongInt ;
    //Local2     : LongInt ;
    Lista      : TStringList ;
    Aux1       : String ;
    Aux2       : String ;
    Qtde       : LongInt ;
    //Cnt        : LongInt ;
    Original   : String ;
Begin
Result := '' ;
Lista := TStringList.Create ;
Original := Texto ;
Lista.Text := Trim ( Texto ) ;
Qtde := Lista.Count ;
If Qtde = 0 Then Begin
   Exit ;
End ;
//Cnt := 0 ;
For Local := Qtde - 1 DownTo 1 Do Begin
   Aux1 := Trim ( Lista[Local-1] ) ;
   Aux2 := Trim ( Lista[Local] ) ;
   If ( Aux1 = '' ) AND ( Aux2 = '' ) Then Begin
      Lista.Delete ( Local ) ;
   End ;
End ;
Result := Lista.Text ;
Lista.Free ;
End ;

Function CONVERSAO_SIMPLES ( Texto : String ) : String ;
Var Local  : LongInt ;
    Lista  : TStringList ;
    Aux     : String ;
    Qtde    : LongInt ;
Begin
Result := '' ;
Lista := TStringList.Create ;
Lista.Text := Trim ( Texto ) ;
Qtde := Lista.Count ;
If Qtde = 0 Then Begin
   Exit ;
End ;
For Local := 0 To Qtde - 1 Do Begin
   Aux := Trim ( Lista[Local] ) ;
   If Aux = '' Then Begin
      Result := Result + sLineBreak ;
      Continue ;
   End ;
   If Aux[1] <> '#' Then Begin
      Result := Result + Aux + sLineBreak ;
   End Else Begin
      If Pos ( '=', Aux ) > 0 Then Begin
         Result := Result + Copy(Aux,1,Pos('=',Aux)-1) + sLineBreak ;
         Delete ( Aux, 1 , Pos('=',Aux) ) ;
         Result := Result + Aux + sLineBreak ;
      End Else If Pos ( ':', Aux ) > 0 Then Begin
         Result := Result + Copy(Aux,1,Pos(':',Aux)-1) + sLineBreak ;
         Delete ( Aux, 1 , Pos(':',Aux) ) ;
         Result := Result + Aux + sLineBreak ;
      End Else Begin
         Result := Result + Aux + sLineBreak ;
      End ;
   End ;
End ;
Lista.Free ;
End ;

Procedure DEF_SG_TOPROW ( Origem : String ; SG : TStringGrid ; Linha : LongInt ) ;
Begin
If NOT Assigned ( SG ) Then Begin
   //PUT_LOG ( 'ERRO DEF_SG_TOPROW OR[' + Origem + '] SG[Nil] L[' + IntToStr(Linha) + ']' ) ;
   Exit ;
End ;
PUT_LOG ( 'DEF_SG_TOPROW OR[' + Origem + '] SG[' + SG.Name + '] L[' + IntToStr(Linha) + ']' ) ;
SG.TopRow := Linha ;
End ;

Procedure DEF_SG_ROW ( Origem : String ; SG : TStringGrid ; Linha : LongInt ) ;
Begin
If NOT Assigned ( SG ) Then Begin
   //PUT_LOG ( 'ERRO DEF_SG_ROW OR[' + Origem + '] SG[Nil] L[' + IntToStr(Linha) + ']' ) ;
   Exit ;
End ;
//PUT_LOG ( 'DEF_SG_ROW OR[' + Origem + '] SG[' + SG.Name + '] L[' + IntToStr(Linha) + ']' ) ;
If SG.Row <> Linha Then Begin
   SG.Row := Linha ;
End Else Begin
   SG.OnClick ( SG ) ;
End ;
End ;

Procedure DEF_SG_COL ( Origem : String ; SG : TStringGrid ; Coluna : LongInt ) ;
Begin
If NOT Assigned ( SG ) Then Begin
   PUT_LOG ( 'ERRO DEF_SG_COL OR[' + Origem + '] SG[Nil] L[' + IntToStr(Coluna) + ']' ) ;
   Exit ;
End ;
PUT_LOG ( 'DEF_SG_COL OR[' + Origem + '] SG[' + SG.Name + '] L[' + IntToStr(Coluna) + ']' ) ;
SG.Col := Coluna ;
End ;

Procedure LIMPAR_REGISTRO_TX_CHYRON ( Var Reg : T_Registro_TX_Chyron ) ;
Begin
_Debug ( 'INI LIMPAR_REGISTRO_TX_CHYRON' ) ;
Reg.Exibir_Relogio := FALSE ;
Reg.Remover_Relogio := FALSE ;
Reg.C1 := 'LINHA1' ;
Reg.C2 := 'LINHA2' ;
Reg.C3 := 'LINHA3' ;
Reg.C4 := 'LINHA4' ;
Reg.P1 := '' ;
Reg.P2 := '' ;
Reg.P3 := '' ;
Reg.P4 := '' ;
Reg.Livre := FALSE ;
_Debug ( 'FIM LIMPAR_REGISTRO_TX_CHYRON' ) ;
End ;

Procedure ABRIR_PORTA_SERIAL ( Porta : TApdComPort ; _Porta, _BaudRate : LongInt ) ;
Begin
PUT_LOG ( 'INI ABRIR PORTA_SERIAL COM' + IntToStr(_Porta) + ' [' + IntToStr(_BaudRate) + ']' ) ;
If VAR_SERIAL_ATIVA <> 1 Then Begin
   PUT_LOG ( 'Exit/1 !VAR_SERIAL_ATIVA ABRIR PORTA_SERIAL' ) ;
   Exit ;
End ;
If ( _Porta = 0 ) OR ( _BaudRate = 0 ) Then Begin
   PUT_LOG ( 'Exit/2 ABRIR PORTA_SERIAL Port[' + IntToStr(_Porta) + '] ' +
             'Baud[' + IntToStr(_BaudRate) + ']' ) ;
   Exit ;
End ;
If NOT Assigned ( Porta ) Then Begin
   PUT_LOG ( 'Exit/3 !Assigned INI ABRIR PORTA_SERIAL' ) ;
   Exit ;
End ;
Try
   If Porta.Open Then Begin
      Porta.DonePort
   End ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception ABRIR_PORTA_SERIAL/DonePort [' + E.Message + ']' ) ;
   End ;
End ;
Try
   Porta.ComNumber := _Porta ;
   Porta.Baud := _BaudRate ;
   Porta.InitPort
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception ABRIR_PORTA_SERIAL/InitPort [' + E.Message + ']' ) ;
   End ;
End ;
PUT_LOG ( 'FIM INI ABRIR PORTA_SERIAL' ) ;
End ;

Function TRIM_LINHAS ( Str : String ) : String ;
Var Local : LongInt ;
    Qtde  : LongInt ;
    SL    : TStringList ;
begin
Result := '' ;
If Trim ( Str ) = '' Then Begin
   Exit ;
End ;
SL := TStringList.Create ;
SL.Text := Trim ( Str ) ;
Qtde := SL.Count ;
If Qtde = 0 Then Begin
   Exit ;
End  ;
For Local := 0 To Qtde - 1 Do Begin
   Result := Result + Trim ( SL[Local] ) + sLineBreak ;
End ;
SL.Free ;
End ;

Function REMOVER_LINHAS_DUPLAS_STR ( Str : String ) : String ;
Var Qtde  : LongInt ;
    Local : LongInt ;
    Aux   : String ;
    SL    : TStringList ;
Begin
Result := Str ;
If Trim ( Str ) = '' Then Begin
   Exit ;
End ;
SL := TStringList.Create ;
SL.Text := Trim ( Str ) ;
Qtde := SL.Count ;
If Qtde < 2 Then Begin
   Exit ;
End ;
For Local := Qtde - 1 DownTo 1 Do Begin
   Aux := Trim ( SL[Local] ) ;
   If Aux <> '' Then Begin
      Continue ;
   End ;
   If Trim ( SL[Local-1] ) = '' Then Begin
      SL.Delete(Local) ;
   End ;
End ;
Result := SL.Text ;
SL.Free ;
End ;

Procedure SALVAR_PANEL_BMP ( FN : String ; PN : TPanel ) ;
var B   : TBitmap ;
    PNG : TPNGImage ;
Begin
Try
   B := TBitmap.Create ;
   PNG := TPNGImage.Create ;
   B.Width := PN.Width ;
   B.Height := PN.Height ;
   B.Canvas.CopyRect ( Rect(0,0,B.Width,B.Height),
                       TMyPanel(PN).Canvas,
                       Rect(0,0,B.Width,B.Height)) ;
   CHECAR_DIRETORIO_FILENAME ( FN ) ;
   //B.SaveToFile(FN) ;
   PNG.Assign ( B ) ;
   PNG.SaveToFile ( FN ) ;
   PNG.Free ;
   B.Free;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception SALVAR_PANEL [' + E.Message + ']' ) ;
   End ;
End ;
End ;

Procedure AJUSTAR_LARGURA_IM ( IM : TImage ) ;
Var Escala : Single ;
    Lim_W  : LongInt ;
    Lim_H  : LongInt ;
Begin
If NOT Assigned ( IM ) Then Begin
   Exit ;
End ;
If IM.Align = alClient Then Begin
   Exit ;
End ;
If NOT Assigned ( IM.Picture ) Then Begin
   Exit ;
End ;
If NOT Assigned ( IM.Picture.BitMap ) Then Begin
   Exit ;
End ;
Lim_W := IM.Parent.Width ;
Lim_H := IM.Parent.Height ;
If ( IM.Picture.BitMap.Height > 0 ) AND ( IM.Picture.BitMap.Width > 0 ) Then Begin
   Escala := IM.Picture.BitMap.Width / IM.Picture.BitMap.Height ;
   If Escala > DEF_ESCALA_HD Then Begin
      //IM.Align := alTop ;
      //IM.Height := TRUNC ( IM.Width / Escala ) ;
      //IM.Width := Lim_X ;
      //IM.Height := TRUNC ( Lim_X / Escala ) ;
      IM.SetBounds (0, 0, Lim_W, TRUNC ( Lim_W / Escala ) ) ;
   End Else Begin
      //IM.Align := alLeft ;
      //IM.Width := TRUNC ( IM.Height * Escala ) ;
      IM.SetBounds (0, 0, TRUNC ( Lim_H * Escala ), Lim_H ) ;
   End ;
End Else Begin
   Escala := DEF_ESCALA_HD ;
   //IM.Align := alLeft ;
   //IM.Width := TRUNC ( IM.Height * Escala ) ;
   //IM.Height := Lim_Y  ;
   //IM.Width := Lim_Y * Escala ;
   IM.SetBounds (0, 0, TRUNC ( Lim_H * Escala ), Lim_H ) ;
End ;
//
End ;

Procedure PUSH_TICK ( _Origem : String ) ;
Begin
Inc ( SizePushPopTick ) ;
SetLength ( PushPopTick, SizePushPopTick ) ;
With PushPopTick[SizePushPopTick-1] Do Begin
   Tick := GetTickCount ;
   Origem := _Origem ;
End ;
End ;

Procedure POP_TICK ( _Origem : String ) ;
Var Decorrido  : Cardinal ;
    Origem_Old : String ;
Begin
If SizePushPopTick <= 0 Then Begin
   SizePushPopTick := 0 ;
   SetLength ( PushPopTick, SizePushPopTick ) ;
   Exit ;
End ;
Decorrido := GetTickCount - PushPopTick[SizePushPopTick-1].Tick ;
Origem_Old := PushPopTick[SizePushPopTick-1].Origem ;
Dec ( SizePushPopTick ) ;
SetLength ( PushPopTick, SizePushPopTick ) ;
If Decorrido > 150 Then Begin
   PUT_LOG ( 'PUSHPOP ' + IntToStr(Decorrido) + ' ' + _Origem + '/' + Origem_Old ) ;
End ;
End ;

Procedure PROC_COMBINAR_IMAGENS ( IM1, IM2, IM3 : TImage ; SB : TStatusBar ) ;
Var Rect_Origem1  : TRect ;
    Rect_Origem2  : TRect ;
    Rect_Destino  : TRect ;
    Aux           : String ;
begin
IM1.Picture.Bitmap.PixelFormat := pf32bit ; // 24bit ;  // with 32 bit images I need this, don't know why
IM2.Picture.Bitmap.PixelFormat := pf32bit ; // with 32 bit images I need this, don't know why
IM3.Picture.Bitmap.PixelFormat := pf32bit ; // with 32 bit images I need this, don't know why
IM1.Transparent := TRUE ;
IM2.Transparent := TRUE ;
IM3.Transparent := TRUE ;
//IM2.TransparentColor := clWhite ;
IM3.SetBounds ( 0, 0, IM1.Width, IM1.Height ) ;
IM3.Picture.Bitmap.SetSize ( IM1.Picture.Bitmap.Width, IM1.Picture.Bitmap.Height ) ;
If Assigned ( IM3.Picture.Bitmap ) Then Begin
   Aux := 'IMG{' + IntToStr(IM3.Width) + ':' +
                   IntToStr(IM3.Height) + '}' +
          'BMP{' + IntToStr(IM3.Picture.BitMap.Width) + ':' +
                   IntToStr(IM3.Picture.BitMap.Height) + '}' ;
End Else Begin
   Aux := 'Imagem inválida' ;
End ;
SB.SimpleText := Aux ;
//Exit ;
// this is how the merged image looks like
//IM3.Picture.Bitmap.Canvas.Draw(- IM1.Picture.Bitmap.Width DIV 4, 0, IM1.Picture.Bitmap ) ;
//IM3.Picture.Bitmap.Canvas.Draw(IM1.Picture.Bitmap.Width * 3 DIV 4, 0, IM2.Picture.Bitmap ) ;
//
Rect_Origem1.Top := 0 ;
Rect_Origem1.Left := 161 - 20 ;
Rect_Origem1.Width := 320 ;
Rect_Origem1.Height := IM1.Picture.Bitmap.Height ;
//
Rect_Origem2.Top := 0 ;
Rect_Origem2.Left := 160 + 20 ;
Rect_Origem2.Width := 320 ;
Rect_Origem2.Height := IM1.Picture.Bitmap.Height ;
//
Rect_Destino.Top := 0 ;
Rect_Destino.Left := 0 ;
Rect_Destino.Width := 320 ;
Rect_Destino.Height := IM1.Picture.Bitmap.Height ;
//
IM3.Picture.Bitmap.Canvas.CopyRect ( Rect_Destino, IM2.Picture.Bitmap.Canvas, Rect_Origem1 ) ;
//
Rect_Destino.Top := 0 ;
Rect_Destino.Left := 300 ;
Rect_Destino.Width := 320 ;
Rect_Destino.Height := IM1.Picture.Bitmap.Height ;
//
IM3.Picture.Bitmap.Canvas.CopyRect ( Rect_Destino, IM1.Picture.Bitmap.Canvas, Rect_Origem2 ) ;
//IM3.Picture.Bitmap.Canvas.Draw(IM1.Picture.Bitmap.Width * 3 DIV 4, 0, IM2.Picture.Bitmap ) ;
End ;

Procedure SALVAR_PNG32 ( FN : String  ; IM : TImage ) ;
var //B   : TBitmap ;
    PNG : TPNGImage ;
Begin
Try
   {
   B := TBitmap.Create ;
   B.Width := PN.Width ;
   B.Height := PN.Height ;
   B.Canvas.CopyRect ( Rect(0,0,B.Width,B.Height),
                       TMyPanel(PN).Canvas,
                       Rect(0,0,B.Width,B.Height)) ;
   }
   CHECAR_DIRETORIO_FILENAME ( FN ) ;
   //B.SaveToFile(FN) ;
   PNG := TPNGImage.Create ;
   //PNG.PixelFormat := pf32bit ;
   //Image.Picture.Bitmap.AlphaFormat := afPremultiplied ;
   PNG.Assign ( IM.Picture.BitMap ) ;
   PNG.SaveToFile ( FN ) ;
   PNG.Free ;
   //B.Free;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception SALVAR_PNG32 [' + E.Message + ']' ) ;
   End ;
End ;
End ;

Function ALGUMA_MAISCULA ( Str : String ) : Boolean ;
Var Local : LongInt ;
Begin
Result := FALSE ;
If Trim ( Str ) = '' Then Begin
   Exit ;
End ;
For Local := 1 To Length ( Str ) Do Begin
   If (Str[Local]>='A') AND (Str[Local]<='Z') Then Begin
      Result := TRUE ;
      Exit ;
   End ;
   If (Str[Local]='Ç') OR
      (Str[Local]='Ã') OR
      (Str[Local]='Õ') OR
      (Str[Local]='Ñ') OR
      (Str[Local]='Â') OR
      (Str[Local]='Ê') OR
      (Str[Local]='Î') OR
      (Str[Local]='Ô') OR
      (Str[Local]='Û') OR
      (Str[Local]='À') OR
      (Str[Local]='È') OR
      (Str[Local]='Ì') OR
      (Str[Local]='Ò') OR
      (Str[Local]='Ù') OR
      (Str[Local]='Ü') OR
      (Str[Local]='Á') OR
      (Str[Local]='É') OR
      (Str[Local]='Í') OR
      (Str[Local]='Ó') OR
      (Str[Local]='Ú') Then Begin
      Result := TRUE ;
      Exit ;
   End ;
End ;
End ;

Function RR_FindFirst ( Origem, Dir : String ; Attr : Integer ; Var RecDos : TSearchRec ) : LongInt ;
Var Tick : Cardinal ;
Begin
_Debug ( 'INI RR FINDFIRST Dir[' + Dir + ']' ) ;
Inc ( Cnt_Log_FindFirst ) ;
Tick := GetTickCount ;
Result := SysUtils.FindFirst ( Dir, Attr, RecDos ) ;
Tick := GetTickCount - Tick ;
If Assigned ( Log ) AND ( NOT Application.Terminated ) Then Begin
   PUT_LOG_EVENTO ( Log.LB_FindFirst, Log.CK_Rolagem.Checked,
                    TimeToStr ( Now ) + ' ' +
                    'FF ' + IntToStr ( Cnt_Log_FindFirst ) + ' ' +
                    'T[' + IntToStr(Tick) + ']' +
                    'D[' + Dir + ']' +
                    '[' + Origem + ']' ) ;
End ;
_Debug ( 'FIM RR FINDFIRST' ) ;
End ;

Function RR_FILE_AGE ( Origem, FN : String ; Var DT : TDateTime ) : String ;
Var Tick : Cardinal ;
Begin
Tick := GetTickCount ;
FileAge ( FN, DT ) ;
Inc ( Cnt_Log_FileAge ) ;
Tick := GetTickCount - Tick ;
If Assigned ( Log ) AND ( NOT Application.Terminated ) Then Begin
   PUT_LOG_EVENTO ( Log.LB_FileAge, Log.CK_Rolagem.Checked,
                    TimeToStr ( Now ) + ' ' +
                    'FF ' + IntToStr ( Cnt_Log_FileAge ) + ' ' +
                    'T[' + IntToStr(Tick) + ']' +
                    'FN[' + FN + ']' +
                    '[' + Origem + ']' ) ;
End ;
End ;

Procedure REFRESH_TIMEOUT ;
Begin
Timer_Monitor := GetTickCount ;
End ;

Function TEMPO_OCIOSIDADE : Cardinal ;
Begin
If Timer_Monitor = 0 Then Begin
   REFRESH_TIMEOUT ;
End ;
Result := GetTickCount - Timer_Monitor ;
End ;

Function RR_DeleteFile ( Origem, FN : String ) : Boolean ;
Var Tick : Cardinal ;
Begin
_Debug ( 'INI RR Delete File [' + FN + ']' ) ;
Tick := GetTickCount ;
Inc ( Cnt_Log_DeleteFile ) ;
Result := DeleteFile ( PChar ( FN ) ) ;
Tick := GetTickCount - Tick ;
If Assigned ( Log ) AND ( NOT Application.Terminated ) Then Begin
   Try
      PUT_LOG_EVENTO ( Log.LB_DeleteFile, Log.CK_Rolagem.Checked,
                       TimeToStr ( Now ) + ' ' +
                       'DELE ' + IntToStr ( Cnt_Log_DeleteFile ) + ' ' +
                       'T[' + IntToStr(Tick) + ']' +
                       'FN[' + FN + ']' +
                       '[' + Origem + ']' ) ;
   Except
   End ;
End ;
_Debug ( 'FIM RR Delete File' ) ;
End ;

Function IS_ARQUIVO_PNG ( FN : String ) : Boolean ;
Begin
PUT_LOG ( 'ExtractFileExt [' + Trim ( ExtractFileExt( FN ) ) + ']' ) ;
Result := UpperCase ( Trim  ( ExtractFileExt( FN ) ) ) = '.PNG' ;
End ;

Procedure COLAR_FORMS ( Form1, Form2 : TForm ) ;
Var Offset : LongInt ;
Begin
Form2.Top := Form1.Top ;
Form2.Left := Form1.Left + Form1.Width ;
OffSet := Screen.Width - ( Form2.Left + Form2.Width ) ;
If OffSet < 0 Then Begin
   Form1.Left := Form1.Left + OffSet ;
   Form2.Left := Form2.Left + OffSet ;
End ;
End ;

Procedure MISC_LIMPAR_DIR_CONVERSAO ( Dir : String ) ;
Var RecDos    : TSearchRec ;
    Resultado : LongInt ;
    FN        : String ;
Begin
Resultado := RR_FindFirst ( 'MISC_LIMPAR_DIR_CONVERSAO', Dir + '*.*', 0, RecDos ) ;
//Showmessage ( Dir ) ;
While Resultado = 0 Do Begin
   If RecDos.Name[1] = '.' Then Begin
      Resultado := FindNext ( RecDos ) ;
      Continue ;
   End ;
   FN := Dir + RecDos.Name ;
   If RR_DeleteFile ( 'MISC_LIMPAR_DIR_CONVERSAO', FN ) Then Begin
      PUT_LOG ( 'DELETE OK "' + FN + '"' ) ;
   End Else Begin
      PUT_LOG ( 'DELETE NÃO OK "' + FN + '"' ) ;
   End ;
   Resultado := System.SysUtils.FindNext ( RecDos ) ;
End ;
System.SysUtils.FindClose ( RecDos ) ;
End ;

(*
Procedure MISC_EXTRAIR_FRAMES ( FN : String ; FPS : Double ;
                           Frames : LongInt ;
                           Desentrelacar, Ajustar_FHD : Boolean ;
                           Extensao, Cue_In, Filtro : String ;
                           Var Cmd : String ) ;
Var Dir       : String ;
    Temp      : String ;
    Tick      : Cardinal ;
    _Tick     : String ;
    Video     : String ;
    Mascara   : String ;
    Saida     : String ;
    Param_Vf  : TStringList ;
    Vf        : String ;
    Local     : LongInt ;
Begin
FLAG_CANCELAR_PROCESSO := FALSE ;
If Assigned ( Reg_GetDosOutput.LB_Progresso_Parcial ) Then Begin
   Reg_GetDosOutput.LB_Time.Caption := '-' ;
   Reg_GetDosOutput.LB_Progresso_Parcial.Caption := 'PREP' ;
   Reg_GetDosOutput.LB_Progresso_Parcial.Color := clOrange ;
   Reg_GetDosOutput.LB_Progresso_Parcial.Font.Color := clBlack ;
End ;
If Assigned ( Reg_GetDosOutput.LB_Progresso_Frames ) Then Begin
   Reg_GetDosOutput.LB_Progresso_Frames.Caption := '-' ;
End ;
If Assigned ( Reg_GetDosOutput.LB_Total_Frames ) Then Begin
   Reg_GetDosOutput.LB_Total_Frames.Caption := '-' ;
End ;
Video := Trim ( FN ) ;
Dir := INSERE_BARRA ( INSERE_BARRA ( ExtractFilePath ( Video ) ) +
                      INSERE_BARRA ( ExtractFileNameSemExt ( Video ) ) +
                      INSERE_BARRA ( 'Frames' ) ) ;
CHECAR_DIRETORIO_DIRNAME ( Dir ) ;
MISC_LIMPAR_DIR_CONVERSAO ( Dir ) ;
Temp := INSERE_BARRA ( Dir + 'Temp' ) ;
CHECAR_DIRETORIO_DIRNAME ( Temp ) ;
//Saida := Diretorio + 'Config\saida.txt' ;
Tick := GetTickCount ;
_Tick := IntToStr ( Tick ) ;
Saida := Diretorio + 'Config\saida_video_' + _Tick + '.txt' ;
//SL_Tick_FFMPEG.Add ( _Tick ) ;
APPEND_TEXTO ( 'EXTRAIR_FRAMES', GET_FN_FRAMES_GERADOS, Dir ) ;
Mascara := Dir + ExtractFileNameSemExt ( Video ) + '_%06d.' + Extensao ;
Param_Vf := TStringList.Create ;
If Desentrelacar Then Begin
   Param_Vf.Add ( 'yadif=0:-1:0' ) ;
End ;
If Ajustar_FHD Then Begin
   Param_Vf.Add ( 'scale=1920:1080' ) ;
End ;
Vf := '' ;
If Param_Vf.Count > 0 Then Begin
   For Local := 0 To Param_Vf.Count - 1 Do Begin
      If Vf = '' Then Begin
         Vf :=  Vf + Param_Vf[Local] ;
      End Else Begin
         Vf :=  Vf + ',' + Param_Vf[Local] ;
      End ;
   End ;
   Vf := '-vf ' + Vf ;
End ;
Cmd := '' + GET_FN_FFMPEG_EXE + '' + ' -y ' +
       '-i "' + Video + '"' + ' ' +
       '-ss ' + Cue_In + ' ' +
       '-vframes ' + IntToStr ( Frames ) + ' ' +
       Vf + ' ' +
       Filtro + ' ' +
       IIF ( FPS > 0, '-r ' + CASA6_PONTO(FPS) , '' ) + ' ' +
       //'-vsync vfr' + ' ' +
       '"' + Mascara + '"' + ' ' +
       // '2> "' + Saida + '"' +
       '' ;
PUT_LOG_REMOTO ( 'EXTRAIR_FRAMES [' + Cmd + ']' ) ;
//REGISTRAR_HISTORICO_MOV_IMG ( Video, Extensao, Frames, Cue_In, Dir ) ;
PUT_LOG ( Cmd ) ;
//Main.PC.ActivePage := Main.TS_Historico_Extracao ;
Application.ProcessMessages ;
{
GetDosOutput ( Reg_GetDosOutput, Video, FF_TIPO_FFMPEG, Cmd,
               ExtractFilePath(GET_FN_FFMPEG_EXE),
               Main.LB_Progresso,
               Main.LB_Total_Frames, Main.LB_Progresso_Frames,
               Main.LB_Time,
               Main.ME_Conversao, Main.LB_Conversao,
               Main.LB_Status, Main.SB_Main ) ;
}
If Application.Terminated OR FLAG_CANCELAR_PROCESSO Then Begin
   //PUT_LOG ( 'Removendo arquivo gerado [' + Mascara + ']' ) ;
   PUT_LOG_REMOTO ( 'EXTRACAO_DE_FRAMES CANCELADA' ) ;
   //If DeleteFile ( Mascara ) Then Begin
   //End ;
   If Assigned ( Reg_GetDosOutput.LB_Progresso_Parcial ) Then Begin
      Reg_GetDosOutput.LB_Progresso_Parcial.Caption := 'CANC' ;
      Reg_GetDosOutput.LB_Progresso_Parcial.Color := clOrange ;
      Reg_GetDosOutput.LB_Progresso_Parcial.Font.Color := clBlack ;
   End ;
End Else Begin
   PUT_LOG_REMOTO ( 'EXTRACAO_DE_FRAMES FINALIZADA' ) ;
   If Assigned ( Reg_GetDosOutput.LB_Progresso_Parcial ) Then Begin
      Reg_GetDosOutput.LB_Progresso_Parcial.Caption := 'OK' ;
      Reg_GetDosOutput.LB_Progresso_Parcial.Color := clLime ;
      Reg_GetDosOutput.LB_Progresso_Parcial.Font.Color := clBlack ;
   End ;
   If Assigned ( Reg_GetDosOutput.LB_Progresso_Frames ) Then Begin
      Reg_GetDosOutput.LB_Progresso_Frames.Caption := '-' ;
   End ;
End ;
//PREENCHER_SG_HISTORICO_FRAMES ;
If AbrirPastaAposProcesso Then Begin
   OPEN_FOLDER_EXPLORER ( Temp ) ;
End ;
Param_Vf.Free ;
End ;
*)

(*
Procedure MISC_GET_INFO_VIDEO ( FN : String ) ;
Var Cmd     : String ;
Begin
PUT_LOG ( 'INI Main.GET_INFO_VIDEO' ) ;
//CANCELAR_PROCESSO := FALSE ;
LIMPAR_REG_GetDosOutput ( Reg_GetDosOutput ) ;
Cmd := GET_FN_FFPROBE_EXE + ' "' + FN + '"' ;
PUT_LOG ( '1 Main.GET_INFO_VIDEO FFPROBE [' + Cmd + ']' ) ;
PUT_LOG ( 'FIM Main.GET_INFO_VIDEO' ) ;
End ;
*)

Function CHECAR_FFMPEG_EXE : Boolean ;
Begin
If NOT FileExists ( GET_FN_FFMPEG_EXE ) Then Begin
   ShowMessage ( 'Arquivo necessário para a conversão não foi encontrado' + sLineBreak +
                 sLineBreak +
                 GET_FN_FFMPEG_EXE ) ;
   Result := FALSE ;
   Exit ;
End ;
Result := TRUE ;
End ;

Procedure PREPARAR_CENARIO_DIRETORIOS ( Indice : LongInt ; Dir : String ; SubPastas : Boolean ) ;
Begin
_Debug ( 'INI PREPARAR CENARIO_DIRETORIOS' ) ;
PUSH_TICK ( 'PREPARAR CENARIO_DIRETORIOS' ) ;
PUT_LOG ( 'INI PREPARAR CENARIO_DIRETORIOS Idx[' + IntToStr(Indice) + '] ' +
          'DirMon[' + Dir + '] ' +
          'SubPastas[' + IFSN(SubPastas) + ']' ) ;
If ( Indice + 1 ) > Length ( Supervisor_Pasta ) Then Begin
   SetLength ( Sup.Mon, Indice + 1 ) ;
   SetLength ( Supervisor_Pasta, Indice + 1 ) ;
End ;
Try
   If Assigned ( Supervisor_Pasta[Indice] ) Then Begin
      _Debug ( '1 PREPARAR CENARIO_DIRETORIOS' ) ;
      If Supervisor_Pasta[Indice].FFolderMon.IsActive Then Begin
         Supervisor_Pasta[Indice].FFolderMon.Deactivate ;
         Supervisor_Pasta[Indice].FFolderMon.Free ;
      End ;
      Supervisor_Pasta[Indice].Free ;
      Supervisor_Pasta[Indice] := Nil ;
   End ;
   _Debug ( '2 PREPARAR CENARIO_DIRETORIOS' ) ;
   Supervisor_Pasta[Indice] := TSupervisor_Pasta.Create ( Sup.Sup_Form, Indice ) ;
   _Debug ( '3 PREPARAR CENARIO_DIRETORIOS' ) ;
   CHECAR_DIRETORIO_DIRNAME ( Dir ) ;
   _Debug ( '4 PREPARAR CENARIO_DIRETORIOS' ) ;
   {$IFDEF NW}
   Supervisor_Pasta[Indice].ATIVAR_MONITORAMENTO_DE_DIRETORIO (
           Dir, Main.TRATAR_EVENTO_DIR_MONITOR_SUPERVISOR, Log.LB_Monitor, SubPastas ) ;
   _Debug ( '5 PREPARAR CENARIO_DIRETORIOS' ) ;
   Supervisor_Pasta[Indice].SETAR_MONITORAMENTO_PASTA (
           Log.LB_Monitor, Log.PN_Monitoramento_Ignorados, Log.CK_Rolagem_DirMon ) ;
   {$ENDIF}
Except
End ;
POP_TICK ( 'PREPARAR CENARIO DIRETORIOS' ) ;
_Debug ( 'FIM PREPARAR CENARIO_DIRETORIOS' ) ;
End ;

Procedure LOG_ON_OFF ;
Begin
_Debug ( 'INI LOG ON OFF' ) ;
If NOT Assigned ( Log ) Then Begin
  Application.CreateForm ( TLog, Log ) ;
End ;
//Main.Menu_Log_Visualizar.Checked := NOT Main.Menu_Log_Visualizar.Checked ;
Log.BorderStyle := bsSizeable ;
If NOT Log.Visible Then Begin
   Log.Show ;
   Log.BringToFront ;
   If MainForm.CanFocus Then Begin
      MainForm.SetFocus ;
   End ;
End Else Begin
   Log.Close ;
End ;
_Debug ( 'FIM LOG ON OFF' ) ;
End ;

Function GERAR_CONTEUDO_HTML_EDITOR ( Conteudo : String ) : String ;
Begin
Conteudo := StringReplace ( Conteudo, #13#10, '<br>', [rfReplaceAll] ) ;
Conteudo := StringReplace ( Conteudo, #13, '<br>', [rfReplaceAll] ) ;
Conteudo := StringReplace ( Conteudo, #10, '<br>', [rfReplaceAll] ) ;
Result := '<html><head><style>html{height: 100%;width:100%}</style></head><body>' +
          '<textarea style="width:100%;height:100%;">' + Conteudo + '</textarea>' +
          '</body></html>' ;
End ;

Procedure CARREGAR_ARQUIVOS_CEF ;
Begin
SL_Arqivos_CEF.Clear ;
SL_Arqivos_CEF.Add ( 'cef\cef.pak' ) ;
SL_Arqivos_CEF.Add ( 'cef\cef_100_percent.pak' ) ;
SL_Arqivos_CEF.Add ( 'cef\cef_200_percent.pak' ) ;
SL_Arqivos_CEF.Add ( 'cef\cef_extensions.pak' ) ;
SL_Arqivos_CEF.Add ( 'cef\cef_sandbox.lib' ) ;
SL_Arqivos_CEF.Add ( 'cef\chrome_elf.dll' ) ;
SL_Arqivos_CEF.Add ( 'cef\d3dcompiler_43.dll' ) ;
SL_Arqivos_CEF.Add ( 'cef\d3dcompiler_47.dll' ) ;
SL_Arqivos_CEF.Add ( 'cef\devtools_resources.pak' ) ;
SL_Arqivos_CEF.Add ( 'cef\icudtl.dat' ) ;
SL_Arqivos_CEF.Add ( 'cef\libcef.dll' ) ;
SL_Arqivos_CEF.Add ( 'cef\libcef.lib' ) ;
SL_Arqivos_CEF.Add ( 'cef\libEGL.dll' ) ;
SL_Arqivos_CEF.Add ( 'cef\libGLESv2.dll' ) ;
SL_Arqivos_CEF.Add ( 'cef\natives_blob.bin' ) ;
SL_Arqivos_CEF.Add ( 'cef\snapshot_blob.bin' ) ;
SL_Arqivos_CEF.Add ( 'cef\v8_context_snapshot.bin' ) ;
SL_Arqivos_CEF.Add ( 'cef\cache\Visited Links' ) ;
SL_Arqivos_CEF.Add ( 'cef\cache\Code Cache\js\index' ) ;
SL_Arqivos_CEF.Add ( 'cef\cache\Code Cache\js\index-dir\the-real-index' ) ;
SL_Arqivos_CEF.Add ( 'cef\locales\am.pak' ) ;
SL_Arqivos_CEF.Add ( 'cef\locales\ar.pak' ) ;
SL_Arqivos_CEF.Add ( 'cef\locales\bg.pak' ) ;
SL_Arqivos_CEF.Add ( 'cef\locales\bn.pak' ) ;
SL_Arqivos_CEF.Add ( 'cef\locales\ca.pak' ) ;
SL_Arqivos_CEF.Add ( 'cef\locales\cs.pak' ) ;
SL_Arqivos_CEF.Add ( 'cef\locales\da.pak' ) ;
SL_Arqivos_CEF.Add ( 'cef\locales\de.pak' ) ;
SL_Arqivos_CEF.Add ( 'cef\locales\el.pak' ) ;
SL_Arqivos_CEF.Add ( 'cef\locales\en-GB.pak' ) ;
SL_Arqivos_CEF.Add ( 'cef\locales\en-US.pak' ) ;
SL_Arqivos_CEF.Add ( 'cef\locales\es-419.pak' ) ;
SL_Arqivos_CEF.Add ( 'cef\locales\es.pak' ) ;
SL_Arqivos_CEF.Add ( 'cef\locales\et.pak' ) ;
SL_Arqivos_CEF.Add ( 'cef\locales\fa.pak' ) ;
SL_Arqivos_CEF.Add ( 'cef\locales\fi.pak' ) ;
SL_Arqivos_CEF.Add ( 'cef\locales\fil.pak' ) ;
SL_Arqivos_CEF.Add ( 'cef\locales\fr.pak' ) ;
SL_Arqivos_CEF.Add ( 'cef\locales\gu.pak' ) ;
SL_Arqivos_CEF.Add ( 'cef\locales\he.pak' ) ;
SL_Arqivos_CEF.Add ( 'cef\locales\hi.pak' ) ;
SL_Arqivos_CEF.Add ( 'cef\locales\hr.pak' ) ;
SL_Arqivos_CEF.Add ( 'cef\locales\hu.pak' ) ;
SL_Arqivos_CEF.Add ( 'cef\locales\id.pak' ) ;
SL_Arqivos_CEF.Add ( 'cef\locales\it.pak' ) ;
SL_Arqivos_CEF.Add ( 'cef\locales\ja.pak' ) ;
SL_Arqivos_CEF.Add ( 'cef\locales\kn.pak' ) ;
SL_Arqivos_CEF.Add ( 'cef\locales\ko.pak' ) ;
SL_Arqivos_CEF.Add ( 'cef\locales\lt.pak' ) ;
SL_Arqivos_CEF.Add ( 'cef\locales\lv.pak' ) ;
SL_Arqivos_CEF.Add ( 'cef\locales\ml.pak' ) ;
SL_Arqivos_CEF.Add ( 'cef\locales\mr.pak' ) ;
SL_Arqivos_CEF.Add ( 'cef\locales\ms.pak' ) ;
SL_Arqivos_CEF.Add ( 'cef\locales\nb.pak' ) ;
SL_Arqivos_CEF.Add ( 'cef\locales\nl.pak' ) ;
SL_Arqivos_CEF.Add ( 'cef\locales\pl.pak' ) ;
SL_Arqivos_CEF.Add ( 'cef\locales\pt-BR.pak' ) ;
SL_Arqivos_CEF.Add ( 'cef\locales\pt-PT.pak' ) ;
SL_Arqivos_CEF.Add ( 'cef\locales\ro.pak' ) ;
SL_Arqivos_CEF.Add ( 'cef\locales\ru.pak' ) ;
SL_Arqivos_CEF.Add ( 'cef\locales\sk.pak' ) ;
SL_Arqivos_CEF.Add ( 'cef\locales\sl.pak' ) ;
SL_Arqivos_CEF.Add ( 'cef\locales\sr.pak' ) ;
SL_Arqivos_CEF.Add ( 'cef\locales\sv.pak' ) ;
SL_Arqivos_CEF.Add ( 'cef\locales\sw.pak' ) ;
SL_Arqivos_CEF.Add ( 'cef\locales\ta.pak' ) ;
SL_Arqivos_CEF.Add ( 'cef\locales\te.pak' ) ;
SL_Arqivos_CEF.Add ( 'cef\locales\th.pak' ) ;
SL_Arqivos_CEF.Add ( 'cef\locales\tr.pak' ) ;
SL_Arqivos_CEF.Add ( 'cef\locales\uk.pak' ) ;
SL_Arqivos_CEF.Add ( 'cef\locales\vi.pak' ) ;
SL_Arqivos_CEF.Add ( 'cef\locales\zh-CN.pak' ) ;
SL_Arqivos_CEF.Add ( 'cef\locales\zh-TW.pak' ) ;
SL_Arqivos_CEF.Add ( 'cef\swiftshader\libEGL.dll' ) ;
SL_Arqivos_CEF.Add ( 'cef\swiftshader\libGLESv2.dll' ) ;
End ;

Procedure CARREGAR_ARQUIVOS_LIBAV ;
Begin
SL_Arqivos_LIBAV.Clear ;
SL_Arqivos_LIBAV.Add ( 'cef\cef.pak' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\avcodec-58.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\avdevice-58.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\avfilter-7.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\avformat-58.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\avutil-56.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\axvlc.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\axvlc.dll.manifest' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\libmfx-0.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\libvlc.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\libvlccore.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\npvlc.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\npvlc.dll.manifest' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\README-SDL.txt' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\SDL2.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\SoundTouch.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\swresample-3.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\swscale-5.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\AUTHORS.txt' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\axvlc.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\axvlc.dll.manifest' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\COPYING.txt' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\Documentation.url' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\libvlc.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\libvlccore.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\NEWS.txt' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\New_Skins.url' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\npvlc.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\npvlc.dll.manifest' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\README.txt' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\THANKS.txt' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\uninstall.exe' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\VideoLAN Website.url' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\vlc-cache-gen.exe' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\vlc.exe' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\vlc.exe.manifest' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\locale\ach\LC_MESSAGES\vlc.mo' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\locale\af\LC_MESSAGES\vlc.mo' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\locale\am\LC_MESSAGES\vlc.mo' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\locale\an\LC_MESSAGES\vlc.mo' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\locale\ar\LC_MESSAGES\vlc.mo' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\locale\ast\LC_MESSAGES\vlc.mo' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\locale\az\LC_MESSAGES\vlc.mo' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\locale\be\LC_MESSAGES\vlc.mo' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\locale\bg\LC_MESSAGES\vlc.mo' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\locale\bn\LC_MESSAGES\vlc.mo' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\locale\bn_IN\LC_MESSAGES\vlc.mo' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\locale\br\LC_MESSAGES\vlc.mo' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\locale\bs\LC_MESSAGES\vlc.mo' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\locale\ca\LC_MESSAGES\vlc.mo' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\locale\cgg\LC_MESSAGES\vlc.mo' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\locale\ckb\LC_MESSAGES\vlc.mo' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\locale\co\LC_MESSAGES\vlc.mo' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\locale\cs\LC_MESSAGES\vlc.mo' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\locale\cy\LC_MESSAGES\vlc.mo' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\locale\da\LC_MESSAGES\vlc.mo' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\locale\de\LC_MESSAGES\vlc.mo' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\locale\el\LC_MESSAGES\vlc.mo' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\locale\en_GB\LC_MESSAGES\vlc.mo' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\locale\es\LC_MESSAGES\vlc.mo' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\locale\es_MX\LC_MESSAGES\vlc.mo' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\locale\et\LC_MESSAGES\vlc.mo' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\locale\eu\LC_MESSAGES\vlc.mo' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\locale\fa\LC_MESSAGES\vlc.mo' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\locale\ff\LC_MESSAGES\vlc.mo' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\locale\fi\LC_MESSAGES\vlc.mo' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\locale\fr\LC_MESSAGES\vlc.mo' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\locale\fur\LC_MESSAGES\vlc.mo' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\locale\ga\LC_MESSAGES\vlc.mo' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\locale\gd\LC_MESSAGES\vlc.mo' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\locale\gl\LC_MESSAGES\vlc.mo' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\locale\gu\LC_MESSAGES\vlc.mo' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\locale\he\LC_MESSAGES\vlc.mo' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\locale\hi\LC_MESSAGES\vlc.mo' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\locale\hr\LC_MESSAGES\vlc.mo' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\locale\hu\LC_MESSAGES\vlc.mo' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\locale\hy\LC_MESSAGES\vlc.mo' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\locale\ia\LC_MESSAGES\vlc.mo' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\locale\id\LC_MESSAGES\vlc.mo' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\locale\is\LC_MESSAGES\vlc.mo' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\locale\it\LC_MESSAGES\vlc.mo' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\locale\ja\LC_MESSAGES\vlc.mo' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\locale\ka\LC_MESSAGES\vlc.mo' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\locale\kk\LC_MESSAGES\vlc.mo' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\locale\km\LC_MESSAGES\vlc.mo' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\locale\kn\LC_MESSAGES\vlc.mo' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\locale\ko\LC_MESSAGES\vlc.mo' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\locale\ks_IN\LC_MESSAGES\vlc.mo' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\locale\ky\LC_MESSAGES\vlc.mo' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\locale\lg\LC_MESSAGES\vlc.mo' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\locale\lt\LC_MESSAGES\vlc.mo' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\locale\lv\LC_MESSAGES\vlc.mo' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\locale\mai\LC_MESSAGES\vlc.mo' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\locale\mk\LC_MESSAGES\vlc.mo' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\locale\ml\LC_MESSAGES\vlc.mo' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\locale\mn\LC_MESSAGES\vlc.mo' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\locale\mr\LC_MESSAGES\vlc.mo' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\locale\ms\LC_MESSAGES\vlc.mo' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\locale\my\LC_MESSAGES\vlc.mo' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\locale\nb\LC_MESSAGES\vlc.mo' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\locale\ne\LC_MESSAGES\vlc.mo' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\locale\nl\LC_MESSAGES\vlc.mo' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\locale\nn\LC_MESSAGES\vlc.mo' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\locale\oc\LC_MESSAGES\vlc.mo' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\locale\or\LC_MESSAGES\vlc.mo' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\locale\pa\LC_MESSAGES\vlc.mo' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\locale\pl\LC_MESSAGES\vlc.mo' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\locale\ps\LC_MESSAGES\vlc.mo' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\locale\pt_BR\LC_MESSAGES\vlc.mo' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\locale\pt_PT\LC_MESSAGES\vlc.mo' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\locale\ro\LC_MESSAGES\vlc.mo' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\locale\ru\LC_MESSAGES\vlc.mo' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\locale\si\LC_MESSAGES\vlc.mo' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\locale\sk\LC_MESSAGES\vlc.mo' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\locale\sl\LC_MESSAGES\vlc.mo' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\locale\sq\LC_MESSAGES\vlc.mo' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\locale\sr\LC_MESSAGES\vlc.mo' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\locale\sv\LC_MESSAGES\vlc.mo' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\locale\ta\LC_MESSAGES\vlc.mo' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\locale\te\LC_MESSAGES\vlc.mo' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\locale\tet\LC_MESSAGES\vlc.mo' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\locale\th\LC_MESSAGES\vlc.mo' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\locale\tl\LC_MESSAGES\vlc.mo' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\locale\tr\LC_MESSAGES\vlc.mo' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\locale\uk\LC_MESSAGES\vlc.mo' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\locale\uz\LC_MESSAGES\vlc.mo' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\locale\vi\LC_MESSAGES\vlc.mo' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\locale\wa\LC_MESSAGES\vlc.mo' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\locale\zh_CN\LC_MESSAGES\vlc.mo' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\locale\zh_TW\LC_MESSAGES\vlc.mo' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\locale\zu\LC_MESSAGES\vlc.mo' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\lua\extensions\VLSub.luac' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\lua\http\custom.lua' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\lua\http\favicon.ico' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\lua\http\index.html' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\lua\http\mobile.html' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\lua\http\mobile_browse.html' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\lua\http\mobile_equalizer.html' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\lua\http\mobile_view.html' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\lua\http\view.html' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\lua\http\vlm.html' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\lua\http\vlm_export.html' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\lua\http\css\main.css' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\lua\http\css\mobile.css' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\lua\http\css\ui-lightness\jquery-ui-1.8.13.custom.css' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\lua\http\css\ui-lightness\images\ui-bg_diagonals-thick_18_b81900_40x40.png' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\lua\http\css\ui-lightness\images\ui-bg_diagonals-thick_20_666666_40x40.png' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\lua\http\css\ui-lightness\images\ui-bg_flat_10_000000_40x100.png' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\lua\http\css\ui-lightness\images\ui-bg_glass_100_f6f6f6_1x400.png' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\lua\http\css\ui-lightness\images\ui-bg_glass_100_fdf5ce_1x400.png' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\lua\http\css\ui-lightness\images\ui-bg_glass_65_ffffff_1x400.png' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\lua\http\css\ui-lightness\images\ui-bg_gloss-wave_35_f6a828_500x100.png' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\lua\http\css\ui-lightness\images\ui-bg_highlight-soft_100_eeeeee_1x100.png' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\lua\http\css\ui-lightness\images\ui-bg_highlight-soft_75_ffe45c_1x100.png' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\lua\http\css\ui-lightness\images\ui-icons_222222_256x240.png' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\lua\http\css\ui-lightness\images\ui-icons_228ef1_256x240.png' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\lua\http\css\ui-lightness\images\ui-icons_ef8c08_256x240.png' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\lua\http\css\ui-lightness\images\ui-icons_ffd27a_256x240.png' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\lua\http\css\ui-lightness\images\ui-icons_ffffff_256x240.png' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\lua\http\dialogs\batch_window.html' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\lua\http\dialogs\browse_window.html' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\lua\http\dialogs\create_stream.html' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\lua\http\dialogs\equalizer_window.html' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\lua\http\dialogs\error_window.html' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\lua\http\dialogs\mosaic_window.html' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\lua\http\dialogs\offset_window.html' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\lua\http\dialogs\stream_config_window.html' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\lua\http\dialogs\stream_window.html' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\lua\http\images\Audio-48.png' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\lua\http\images\Back-48.png' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\lua\http\images\buttons.png' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\lua\http\images\Folder-48.png' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\lua\http\images\Other-48.png' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\lua\http\images\speaker-32.png' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\lua\http\images\Video-48.png' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\lua\http\images\vlc-48.png' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\lua\http\images\vlc16x16.png' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\lua\http\js\common.js' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\lua\http\js\controllers.js' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\lua\http\js\jquery.jstree.js' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\lua\http\js\ui.js' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\lua\http\requests\browse.json' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\lua\http\requests\browse.xml' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\lua\http\requests\playlist.json' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\lua\http\requests\playlist.xml' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\lua\http\requests\playlist_jstree.xml' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\lua\http\requests\README.txt' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\lua\http\requests\status.json' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\lua\http\requests\status.xml' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\lua\http\requests\vlm.xml' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\lua\http\requests\vlm_cmd.xml' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\lua\intf\cli.luac' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\lua\intf\dummy.luac' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\lua\intf\dumpmeta.luac' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\lua\intf\http.luac' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\lua\intf\luac.luac' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\lua\intf\telnet.luac' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\lua\intf\modules\host.luac' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\lua\intf\modules\httprequests.luac' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\lua\meta\art\00_musicbrainz.luac' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\lua\meta\art\01_googleimage.luac' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\lua\meta\art\02_frenchtv.luac' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\lua\meta\art\03_lastfm.luac' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\lua\meta\fetcher\tvrage.luac' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\lua\meta\reader\filename.luac' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\lua\modules\common.luac' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\lua\modules\dkjson.luac' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\lua\modules\sandbox.luac' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\lua\modules\simplexml.luac' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\lua\playlist\anevia_streams.luac' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\lua\playlist\anevia_xml.luac' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\lua\playlist\appletrailers.luac' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\lua\playlist\bbc_co_uk.luac' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\lua\playlist\break.luac' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\lua\playlist\canalplus.luac' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\lua\playlist\cue.luac' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\lua\playlist\dailymotion.luac' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\lua\playlist\extreme.luac' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\lua\playlist\france2.luac' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\lua\playlist\googlevideo.luac' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\lua\playlist\jamendo.luac' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\lua\playlist\joox.luac' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\lua\playlist\katsomo.luac' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\lua\playlist\koreus.luac' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\lua\playlist\lelombrik.luac' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\lua\playlist\liveleak.luac' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\lua\playlist\metacafe.luac' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\lua\playlist\metachannels.luac' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\lua\playlist\mpora.luac' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\lua\playlist\pinkbike.luac' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\lua\playlist\pluzz.luac' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\lua\playlist\rockbox_fm_presets.luac' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\lua\playlist\soundcloud.luac' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\lua\playlist\vimeo.luac' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\lua\playlist\youtube.luac' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\lua\playlist\youtube_homepage.luac' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\lua\playlist\zapiks.luac' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\lua\sd\fmc.luac' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\lua\sd\icast.luac' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\lua\sd\icecast.luac' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\lua\sd\jamendo.luac' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\lua\sd\metachannels.luac' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\plugins.dat' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\access\libaccess_bd_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\access\libaccess_mms_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\access\libaccess_realrtsp_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\access\libattachment_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\access\libbluray-j2se-0.9.3.jar' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\access\libcdda_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\access\libdshow_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\access\libdtv_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\access\libdvdnav_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\access\libdvdread_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\access\libfilesystem_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\access\libftp_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\access\libhttp_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\access\libidummy_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\access\libimem_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\access\liblibbluray_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\access\liblive555_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\access\librar_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\access\librtp_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\access\libscreen_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\access\libsdp_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\access\libsftp_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\access\libshm_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\access\libsmb_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\access\libtcp_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\access\libtimecode_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\access\libudp_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\access\libvcd_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\access\libvdr_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\access\libzip_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\access_output\libaccess_output_dummy_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\access_output\libaccess_output_file_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\access_output\libaccess_output_http_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\access_output\libaccess_output_livehttp_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\access_output\libaccess_output_shout_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\access_output\libaccess_output_udp_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\audio_filter\liba52tofloat32_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\audio_filter\liba52tospdif_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\audio_filter\libaudiobargraph_a_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\audio_filter\libaudio_format_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\audio_filter\libchorus_flanger_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\audio_filter\libcompressor_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\audio_filter\libdolby_surround_decoder_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\audio_filter\libdtstofloat32_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\audio_filter\libdtstospdif_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\audio_filter\libequalizer_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\audio_filter\libgain_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\audio_filter\libheadphone_channel_mixer_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\audio_filter\libkaraoke_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\audio_filter\libmono_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\audio_filter\libmpgatofixed32_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\audio_filter\libnormvol_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\audio_filter\libparam_eq_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\audio_filter\libremap_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\audio_filter\libsamplerate_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\audio_filter\libscaletempo_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\audio_filter\libsimple_channel_mixer_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\audio_filter\libspatializer_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\audio_filter\libspeex_resampler_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\audio_filter\libstereo_widen_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\audio_filter\libtrivial_channel_mixer_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\audio_filter\libugly_resampler_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\audio_mixer\libfloat_mixer_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\audio_mixer\libinteger_mixer_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\audio_output\libadummy_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\audio_output\libafile_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\audio_output\libamem_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\audio_output\libdirectsound_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\audio_output\libmmdevice_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\audio_output\libwasapi_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\audio_output\libwaveout_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\codec\liba52_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\codec\libadpcm_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\codec\libaes3_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\codec\libaraw_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\codec\libavcodec_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\codec\libcc_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\codec\libcdg_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\codec\libcrystalhd_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\codec\libcvdsub_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\codec\libddummy_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\codec\libdmo_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\codec\libdts_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\codec\libdvbsub_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\codec\libdxva2_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\codec\libedummy_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\codec\libfaad_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\codec\libflac_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\codec\libg711_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\codec\libjpeg_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\codec\libkate_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\codec\liblibass_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\codec\liblibmpeg2_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\codec\liblpcm_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\codec\libmft_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\codec\libmpeg_audio_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\codec\libopus_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\codec\libpng_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\codec\libqsv_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\codec\libquicktime_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\codec\librawvideo_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\codec\libschroedinger_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\codec\libscte27_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\codec\libspeex_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\codec\libspudec_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\codec\libstl_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\codec\libsubsdec_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\codec\libsubstx3g_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\codec\libsubsusf_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\codec\libsvcdsub_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\codec\libt140_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\codec\libtheora_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\codec\libtwolame_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\codec\libuleaddvaudio_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\codec\libvorbis_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\codec\libvpx_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\codec\libx264_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\codec\libx265_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\codec\libzvbi_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\control\libdummy_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\control\libgestures_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\control\libhotkeys_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\control\libnetsync_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\control\libntservice_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\control\liboldrc_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\control\libwin_hotkeys_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\control\libwin_msg_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\demux\libaiff_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\demux\libasf_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\demux\libau_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\demux\libavi_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\demux\libcaf_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\demux\libdemuxdump_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\demux\libdemux_cdg_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\demux\libdemux_stl_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\demux\libdiracsys_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\demux\libes_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\demux\libflacsys_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\demux\libgme_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\demux\libh264_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\demux\libhevc_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\demux\libimage_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\demux\libmjpeg_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\demux\libmkv_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\demux\libmod_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\demux\libmp4_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\demux\libmpc_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\demux\libmpgv_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\demux\libnsc_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\demux\libnsv_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\demux\libnuv_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\demux\libogg_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\demux\libplaylist_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\demux\libps_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\demux\libpva_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\demux\librawaud_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\demux\librawdv_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\demux\librawvid_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\demux\libreal_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\demux\libsid_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\demux\libsmf_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\demux\libsubtitle_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\demux\libts_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\demux\libtta_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\demux\libty_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\demux\libvc1_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\demux\libvobsub_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\demux\libvoc_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\demux\libwav_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\demux\libxa_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\gui\libqt4_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\gui\libskins2_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\lua\liblua_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\meta_engine\libfolder_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\meta_engine\libtaglib_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\misc\libaddonsfsstorage_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\misc\libaddonsvorepository_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\misc\libaudioscrobbler_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\misc\libexport_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\misc\libfingerprinter_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\misc\libgnutls_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\misc\liblogger_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\misc\libstats_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\misc\libvod_rtsp_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\misc\libxml_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\mux\libmux_asf_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\mux\libmux_avi_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\mux\libmux_dummy_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\mux\libmux_mp4_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\mux\libmux_mpjpeg_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\mux\libmux_ogg_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\mux\libmux_ps_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\mux\libmux_ts_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\mux\libmux_wav_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\packetizer\libpacketizer_copy_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\packetizer\libpacketizer_dirac_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\packetizer\libpacketizer_flac_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\packetizer\libpacketizer_h264_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\packetizer\libpacketizer_hevc_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\packetizer\libpacketizer_mlp_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\packetizer\libpacketizer_mpeg4audio_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\packetizer\libpacketizer_mpeg4video_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\packetizer\libpacketizer_mpegvideo_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\packetizer\libpacketizer_vc1_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\services_discovery\libmediadirs_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\services_discovery\libpodcast_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\services_discovery\libsap_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\services_discovery\libupnp_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\services_discovery\libwindrive_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\stream_filter\libdash_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\stream_filter\libhttplive_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\stream_filter\librecord_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\stream_filter\libsmooth_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\stream_out\libstream_out_autodel_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\stream_out\libstream_out_bridge_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\stream_out\libstream_out_chromaprint_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\stream_out\libstream_out_delay_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\stream_out\libstream_out_description_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\stream_out\libstream_out_display_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\stream_out\libstream_out_dummy_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\stream_out\libstream_out_duplicate_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\stream_out\libstream_out_es_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\stream_out\libstream_out_gather_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\stream_out\libstream_out_langfromtelx_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\stream_out\libstream_out_mosaic_bridge_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\stream_out\libstream_out_raop_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\stream_out\libstream_out_record_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\stream_out\libstream_out_rtp_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\stream_out\libstream_out_setid_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\stream_out\libstream_out_smem_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\stream_out\libstream_out_standard_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\stream_out\libstream_out_stats_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\stream_out\libstream_out_transcode_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\text_renderer\libfreetype_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\text_renderer\libtdummy_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\video_chroma\libchain_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\video_chroma\libgrey_yuv_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\video_chroma\libi420_rgb_mmx_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\video_chroma\libi420_rgb_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\video_chroma\libi420_rgb_sse2_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\video_chroma\libi420_yuy2_mmx_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\video_chroma\libi420_yuy2_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\video_chroma\libi420_yuy2_sse2_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\video_chroma\libi422_i420_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\video_chroma\libi422_yuy2_mmx_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\video_chroma\libi422_yuy2_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\video_chroma\libi422_yuy2_sse2_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\video_chroma\librv32_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\video_chroma\libswscale_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\video_chroma\libyuy2_i420_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\video_chroma\libyuy2_i422_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\video_filter\libadjust_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\video_filter\libalphamask_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\video_filter\libanaglyph_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\video_filter\libantiflicker_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\video_filter\libatmo_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\video_filter\libaudiobargraph_v_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\video_filter\libball_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\video_filter\libblendbench_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\video_filter\libblend_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\video_filter\libbluescreen_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\video_filter\libcanvas_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\video_filter\libcolorthres_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\video_filter\libcroppadd_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\video_filter\libdeinterlace_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\video_filter\liberase_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\video_filter\libextract_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\video_filter\libfreeze_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\video_filter\libgaussianblur_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\video_filter\libgradfun_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\video_filter\libgradient_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\video_filter\libgrain_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\video_filter\libhqdn3d_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\video_filter\libinvert_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\video_filter\liblogo_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\video_filter\libmagnify_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\video_filter\libmarq_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\video_filter\libmirror_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\video_filter\libmosaic_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\video_filter\libmotionblur_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\video_filter\libmotiondetect_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\video_filter\liboldmovie_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\video_filter\libposterize_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\video_filter\libpostproc_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\video_filter\libpsychedelic_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\video_filter\libpuzzle_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\video_filter\libremoteosd_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\video_filter\libripple_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\video_filter\librotate_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\video_filter\librss_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\video_filter\libscale_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\video_filter\libscene_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\video_filter\libsepia_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\video_filter\libsharpen_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\video_filter\libsubsdelay_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\video_filter\libtransform_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\video_filter\libvhs_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\video_filter\libwave_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\video_filter\libyuvp_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\video_output\libcaca_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\video_output\libdirect2d_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\video_output\libdirect3d_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\video_output\libdirectdraw_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\video_output\libdrawable_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\video_output\libglwin32_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\video_output\libgl_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\video_output\libvdummy_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\video_output\libvmem_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\video_output\libwingdi_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\video_output\libyuv_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\video_splitter\libclone_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\video_splitter\libpanoramix_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\video_splitter\libwall_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\visualization\libglspectrum_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\visualization\libgoom_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\visualization\libprojectm_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\plugins\visualization\libvisual_plugin.dll' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\skins\default.vlt' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\skins\skin.catalog' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\skins\skin.dtd' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\skins\winamp2.xml' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\skins\fonts\FreeSans.ttf' ) ;
SL_Arqivos_LIBAV.Add ( 'LibAV\vlc\skins\fonts\FreeSansBold.ttf' ) ;
End ;

Procedure SHOW_OPERACAO_NAO_PERMITIDA ( Str : String ) ;
Begin
ShowMessage ( 'Operação não permitida ['+ Str + ']' ) ;
End ;

Function STRINGS_PARECIDAS ( Str1, Str2 : String ; Metodo : LongInt ;
                             Var Distancia : Single ;
                             Var Percentual : Single ;
                             Var Qtde1 : LongInt ;
                             Var Qtde2 : LongInt ) : Boolean ;
Begin
Distancia := EditDistance ( Str1, Str2 ) ;
Percentual := PERCENTUAL_PALAVRAS_EM_COMUM ( Str1, Str2, Qtde1,  Qtde2 ) ;
ORDENAR_INT( Qtde1, Qtde2 ) ;
If Metodo = 1 Then Begin
   Result := ( Qtde1 >= 2 ) AND ( Distancia < 30 ) AND ( Percentual > 0.5 ) ;
End Else Begin
   Result := ( Qtde1 >= 1 ) AND ( Distancia < 30 ) AND ( Percentual > 0.1 ) ;
End ;
End ;

Function EditDistance ( s, t: String ) : LongInt ;
Var d : Array Of Array of Integer ;
    i,
    j,
    cost : integer;
Begin
{
Compute the edit-distance between two strings.
Algorithm and description may be found at either of these two links:
http://en.wikipedia.org/wiki/Levenshtein_distance
http://www.google.com/search?q=Levenshtein+distance
}
//initialize our cost array
SetLength ( d, Length(s) + 1 ) ;
For i := Low(d) to High(d) do Begin
   SetLength ( d[i],  Length(t)+1 ) ;
End ;
For i := Low(d) To High(d) Do Begin
   d[i,0] := i ;
   For j := Low(d[i]) To High(d[i]) Do Begin
      d[0,j] := j ;
   End ;
End ;
//store our costs in a 2-d grid
For i := Low(d)+1 To High(d) Do Begin
  For j := Low(d[i])+1 To High(d[i]) Do Begin
     If s[i] = t[j] Then Begin
        cost := 0 ;
     End Else Begin
        cost := 1 ;
     End ;
     //to use "Min", add "Math" to your uses clause!
     d[i,j] := Min ( Min (
               d[i-1,j]+1,      //deletion
               d[i,j-1]+1),     //insertion
               d[i-1,j-1]+cost  //substitution
               ) ;
  End ;  //for j
End ;  //for i
//now that we've stored the costs, return the final one
Result := d[Length(s),Length(t)] ;
//dynamic arrays are reference counted.
//no need to deallocate them
End ;

Function PERCENTUAL_PALAVRAS_EM_COMUM ( Str1, Str2 : String ;
                                        Var Qtde1 : LongInt ;
                                        Var Qtde2 : LongInt ) : Single ;
Var SL1   : TStringList ;
    SL2   : TStringList ;
    Local : LongInt ;
Begin
Result := 0 ;
Qtde1 := 0 ;
Qtde2 := 0 ;
If ( Trim ( Str1 ) = '' ) OR ( Trim ( Str2 ) = '' ) Then Begin
   Exit ;
End ;
SL1 := EXPLODE ( Trim ( Super_UpperCase ( Str1 ) ), #32 ) ;
SL2 := EXPLODE ( Trim ( Super_UpperCase ( Str2 ) ), #32 ) ;
Qtde1 := SL1.Count ;
If Qtde1 = 0 Then Begin
   Exit ;
End ;
Qtde2 := SL1.Count ;
If Qtde2 = 0 Then Begin
   Exit ;
End ;
//ORDENAR_INT ( Qtde1, Qtde2 ) ;
Result := 0 ;
If Qtde1 <= Qtde2 Then Begin
   For Local := 0 To Qtde1 - 1 Do Begin
      If SL2.IndexOf ( SL1[Local] ) > -1 Then Begin
         Result := Result + 1 ;
      End ;
   End ;
   Result := Result / Qtde2 ;
End Else Begin
   For Local := 0 To Qtde2 - 1 Do Begin
      If SL1.IndexOf ( SL2[Local] ) > -1 Then Begin
         Result := Result + 1 ;
      End ;
   End ;
   Result := Result / Qtde1 ;
End ;
End ;

Procedure ORDENAR_INT ( Var I1 : LongInt ; Var I2 : LongInt ) ;
Var Temp :  LongInt ;
Begin
Temp := MIN ( I1, I2 ) ;
I2 := MAX ( I1, I2 ) ;
I1 := Temp ;
End ;

// ==============================================


(*
...get the URL from running instances of Internet Explorer?
Autor: Simon Grossenbacher
Homepage: http://www.swissdelphicenter.ch
*)

{ Code 1 **************************************}

function GetURL(Service: string): string;
var
  ClDDE: TDDEClientConv;
  temp: PChar;
begin
  Result := '';
  //create a new DDE Client object
  ClDDE := TDDEClientConv.Create(nil);
  with ClDDE do
  begin
    SetLink(Service, 'WWW_GetWindowInfo');
    temp := PChar ( RequestData ( '0xFFFFFFFF' ) ) ;
    Result := StrPas(temp);
    StrDispose(temp);
    CloseLink;
  end;
  ClDDE.Free;
end;

Function GET_URL_EXPLORER_1 : String  ;
begin
  // the result should be something like:
  // "http://www.swissdelphicenter.ch","SwissDelphiCenter.ch"
Result := GetURL('IExplore') ;
  { ShowMessage(GetURL('Netscape')); }
end;

{ Code 2 **************************************}

procedure GetCurrentURL(out URL, Title: string);
var
   DDEClient : TDDEClientConv;
   p, q: PChar;
   i: Integer;
begin
   DDEClient := TDDEClientConv.Create(nil);
   try
     with DDEClient do if SetLink('IExplore', 'WWW_GetWindowInfo') or
       SetLink('Netscape', 'WWW_GetWindowInfo') or
       SetLink('Mosaic', 'WWW_GetWindowInfo') or
       SetLink('Netscp6', 'WWW_GetWindowInfo') or
       SetLink('Mozilla', 'WWW_GetWindowInfo') or
       SetLink('Firefox', 'WWW_GetWindowInfo') then
       p := PChar ( RequestData('0xFFFFFFFF') )
     else raise Exception.Create('Could not establish browser DDE link');
     if Assigned(p) then try
       q := p;
       Assert(q^ = '"');
       SetLength(URL, StrLen(q));
       Inc(q);
       i := 0;
       while q^ <> '"' do begin
         if (q^ = '\') and (q[1] = '"') then Inc(q);
         Inc(i);
         URL[i] := q^;
         Inc(q);
       end;
       SetLength(URL, i);
       SetLength(Title, StrLen(q));
       i := 0;
       Inc(q, 3);
       while q^ <> '"' do begin
         if (q^ = '\') and (q[1] = '"') then Inc(q);
         Inc(i);
         Title[i] := q^;
         Inc(q);
       end;
       SetLength(Title, i);
     finally
       StrDispose(p);
     end else raise Exception.Create('Could not fetch browser data');
   finally
     DDEClient.Free;
   end;
end;

{ Code 3 **************************************}


// To have the locationurls from all running instances of Internet Explorer -
// including open folders and Windows Explorer - shown in a listbox.
// by http://www.euromind.com/iedelphi/

(*
Function GET_URL_EXPLORER_2 : String  ;
var
  x: Integer;
  Sw: IShellWindows;
begin
  sw := CoShellWindows.Create;
  for x := 0 to SW.Count - 1 do
    Listbox1.Items.Add((Sw.Item(x) as IWebbrowser2).LocationUrl);
end;
*)

{ Code 4 **************************************}

(*
type
  TObjectFromLResult = function(LRESULT: lResult; const IID: TIID;
    wParam: wParam; out pObject): HRESULT;
  stdcall;

function GetIEFromHWND(WHandle: HWND; var IE: IWebbrowser2): HRESULT;
var
  hInst: HWND;
  lRes: Cardinal;
  Msg: Integer;
  pDoc: IHTMLDocument2;
  ObjectFromLresult: TObjectFromLresult;
begin
  hInst := LoadLibrary('Oleacc.dll'); @ObjectFromLresult :=
    GetProcAddress(hInst, 'ObjectFromLresult');
  if @ObjectFromLresult <> nil then
  begin
    try
      Msg := RegisterWindowMessage('WM_HTML_GETOBJECT');
      SendMessageTimeOut(WHandle, Msg, 0, 0, SMTO_ABORTIFHUNG, 1000, lRes);
      Result := ObjectFromLresult(lRes, IHTMLDocument2, 0, pDoc);
      if Result = S_OK then
        (pDoc.parentWindow as IServiceprovider).QueryService(IWebbrowserApp,
          IWebbrowser2, IE);
    finally
      FreeLibrary(hInst);
    end;
  end;
end;

function GetActiveIEURL: string;
var
  Document: IHtmlDocument2;
  IE: IWebBrowser2;
  Wnd: HWND;
  WndChild: HWND;
begin
  Wnd := GetForeGroundWindow;
  WndChild := FindWindowEX(Wnd, 0, 'Shell DocObject View', nil);
  if WndChild <> 0 then
  begin
    WndChild := FindWindowEX(WndChild, 0, 'Internet Explorer_Server', nil);
    if WndChild <> 0 then
    begin
      //Get Iwebbrowser2 from Handle
      GetIEFromHWnd(WndChild, IE);
      if IE <> nil then
      begin
        Result := IE.LocationURL;
        // Document := IE.Document as IHtmlDocument2;
      end;
    end;
  end;
end;

Function GET_URL_EXPLORER_3 : String  ;
begin
Result := GetActiveIEURL ;
end;
*)

// ========================

(* ROTINA RUIM OU ESTRANHA *)
function GetActivePageUrlFromChrome(Handle: HWnd; Param: LParam): Bool; stdcall;
var
  List: TStrings;
  hWndChrome, hWndChromeChild: HWND;
  Buffer            : array[0..255] of Char;
begin
  List := TStrings(Param);
  //get the window caption
  SendMessage(Handle, WM_GETTEXT, Length(Buffer), integer(@Buffer[0]));
  //look for the chrome window with "Buffer" caption
  hWndChrome := FindWindow('Chrome_WidgetWin_0', Buffer);
  if hWndChrome <> 0 then
  begin
    hWndChromeChild := FindWindowEx(hWndChrome, 0, 'Chrome_AutocompleteEditView', nil);
    if hWndChromeChild <> 0 then
    begin
      SendMessage(hWndChromeChild, WM_GETTEXT, Length(Buffer), integer(@Buffer));
      List.Add(Buffer);
    end;
  end;
  Result := True;
end;

Function TESTE_CHROME_1 : String ;    (* ROTINA RUIM OU ESTRANHA *)
var slChromeUrl      : TStringList;
begin
slChromeUrl := TStringList.Create ;
slChromeUrl.Clear ;
  slChromeUrl := TStringList.Create;
  try
    EnumWindows(@GetActivePageUrlFromChrome, LParam(slChromeUrl));
//    Result.AddStrings ( slChromeUrl );
  finally
    FreeAndNil(slChromeUrl);
  end;
Result := slChromeUrl.Text ;
end;

// ========================

Procedure TRANSFERIR_CONTEUDO_MEMO ( Sender, Source : TMemo ) ;
Var Lista   : TStringList ;
Begin
Lista := TStringList.Create ;
Lista.Clear ;
Lista.Text := Trim ( Source.SelText ) ;
If Trim ( Lista.Text ) = '' Then Begin
   Lista.Text := Source.Text ;
End ;
While Lista.Count > 3 Do Begin
   Lista.Delete ( Lista.Count - 1 ) ;
End ;
Sender.Text := Lista.Text ;
Lista.Free ;
End ;

Function SALVAR_LOG_FULL ( Origem : String ) : String ;
Var FN : String ;
Begin
Cnt_Debug_Full := 0 ;
Inc ( Indice_Log ) ;
FN := Diretorio + 'Config\Logs\Debug_Full\' +
      DATAHORA_INVERSA(Now) + '_' + StrZero(Indice_Log, 8) + '.log' ;
CHECAR_DIRETORIO_FILENAME ( FN ) ;
PUT_LOG ( 'WRITE SL_DEBUG_FULL' ) ;
WRITE_FILE_CORE( '_Debug FULL', FN, SL_Debug_Full.Text, DELAYED_FALSE );
SL_Debug_Full.Clear ;
FN_Last_Log_Full := FN ;
Result := FN ;
End ;

Procedure INIBIR_RELOAD_FN ( FN : String ; ms : Cardinal ) ;
Begin
_Debug ( '*** SET INIBIR_RELOAD_FN [' + FN + '][' + IntToStr(ms) + ']' ) ;
SL_Inibicao_Reload_FN.Values[FN] := IntToStr(GetTickCount+ms) ;
End ;

Function CHECAR_RELOAD_OK ( FN : String ) : Boolean ;
Var Aux : Cardinal ;
Begin
Aux := StrToIntDef ( SL_Inibicao_Reload_FN.Values[FN], 0 ) ;
Result := Aux < GetTickCount ;
End ;

Function GetTituloAtivo ( Var H : THandle ) : String ;
var Len    : LongInt ;
    Title  : String ;
Begin
Result := '' ;
H := GetForegroundWindow ;
If H <> 0 Then Begin
   Len := GetWindowTextLength(H) + 1 ;
   SetLength ( Title, Len ) ;
   GetWindowText(H, PChar(Title), Len) ;
   Result := TrimRight(Title) ;
End ;
End ;

(*
Function WindowsVersion() : String ;
Var OSINFO: TOSVersionInfoEx ;
Begin
OSINFO.dwOSVersionInfoSize := SizeOf(OSINFO) ;
if GetVersionExA(OSINFO) then Begin
   if (OSINFO.dwMajorVersion = 5) and (OSINFO.dwMinorVersion = 0) then Begin
      Result := 'Windows 2000'
   End else if (OSINFO.dwMajorVersion = 5) and (OSINFO.dwMinorVersion = 1) then
      Result := 'Windows XP'
   else if (OSINFO.dwMajorVersion = 5) and (OSINFO.dwMinorVersion = 2) and (GetSystemMetrics(SM_SERVERR2) = 0) then
      Result := 'Windows Server 2003'
   else if (OSINFO.dwMajorVersion = 5) and (OSINFO.dwMinorVersion = 2) and (GetSystemMetrics(SM_SERVERR2) <> 0) then
      Result := 'Windows Server 2003 R2'
   else if (OSINFO.dwMajorVersion = 6) and (OSINFO.dwMinorVersion = 0) and (OSINFO.wProductType = VER_NT_WORKSTATION) then
      Result := 'Windows Vista'
   else if (OSINFO.dwMajorVersion = 6) and (OSINFO.dwMinorVersion = 0) and (OSINFO.wProductType <> VER_NT_WORKSTATION) then
      Result := 'Windows Server 2008'
   else if (OSINFO.dwMajorVersion = 6) and (OSINFO.dwMinorVersion = 1) and (OSINFO.wProductType <> VER_NT_WORKSTATION) then
      Result := 'Windows Server 2008 R2'
   else if (OSINFO.dwMajorVersion = 6) and (OSINFO.dwMinorVersion = 1) and (OSINFO.wProductType = VER_NT_WORKSTATION) then
      Result := 'Windows 7'
   else
      Result := 'Unknown';
End ;
End ;
*)

Function GET_DESCONSIDERE_MONITOR_ARQUIVO ( FN : String ) : Boolean ;
Var Aux : Cardinal ;
Begin
FN := Super_UpperCase ( FN ) ;
Aux := StrToIntDef ( SL_DESCONSIDERAR_ARQUIVOS.Values[FN], 0 ) ;
Result := ( Aux > GetTickCount ) ;
End ;

Procedure ADD_DESCONSIDERE_MONITOR_ARQUIVO ( FN : String ; Tempo_ms : LongInt ) ;
Begin
FN := Super_UpperCase ( FN ) ;
SL_DESCONSIDERAR_ARQUIVOS.Values[FN] := IntToStr ( GetTickCount + Tempo_ms ) ;
End ;

Function EXTRAIR_URL_PRINCIPAL_OU_IP ( Url : String ) : String ;
Begin
Url := StringReplace ( Url, 'http://', '', [rfReplaceAll] ) ;
Url := StringReplace ( Url, 'https://', '', [rfReplaceAll] ) ;
Url := StringReplace ( Url, 'file://', '', [rfReplaceAll] ) ;
If IS_DIGIT( Url[1] ) Then Begin
   If Pos ( '/',  Url ) > 0 Then Begin
      Delete ( Url, Pos ( '/',  Url ), Length ( Url ) ) ;
   End ;
   If Pos ( ':',  Url ) > 0 Then Begin
      Delete ( Url, Pos ( ':',  Url ), Length ( Url ) ) ;
   End ;
End ;
Result := Url ;
End ;

Procedure LIMPAR_CAMERA_E_POSICAO ( Var Reg : T_Camera_Posicoes ) ;
Var Local2 : LongInt ;
Begin
Reg.IP := '' ;
Reg.Nome_Atalho := '' ;
For Local2 := 0 To MAX_CAMERAS_QTDE_POSICOES - 1 Do Begin
   Reg.L1[Local2] := '' ;
   Reg.L2[Local2] := '' ;
   Reg.OLD[Local2] := '' ;
End ;
End ;

Procedure LIMPAR_CAMERAS_E_POSICOES ;
Var Local  : LongInt ;
//    Local2 : LongInt ;
Begin
For Local := 0 To MAX_CAMERAS - 1 Do Begin
    LIMPAR_CAMERA_E_POSICAO ( CAMERAS_IP_POSICOES[Local] ) ;
End ;
End ;

Function GET_CAMERAS_CARREGADAS : String ;
Var Aux    : String ;
    Local  : LongInt ;
    Local2 : LongInt ;
Begin
Aux := '' ;
For Local := 0 To MAX_CAMERAS - 1 Do Begin
   If CAMERAS_IP_POSICOES[Local].IP = '' Then Begin
      Continue ;
   End ;
   Aux := Aux +
          sLineBreak +
          'CAMERA-' + StrZero(Local+1, 2) + sLineBreak +
          'IP [' + CAMERAS_IP_POSICOES[Local].IP + ']' + sLineBreak +
          'ATALHO [' + CAMERAS_IP_POSICOES[Local].Nome_Atalho + ']' + sLineBreak ;
   For Local2 := 0 To MAX_CAMERAS_QTDE_POSICOES - 1 Do Begin
      If CAMERAS_IP_POSICOES[Local].L1[Local2] = '' Then Begin
         Continue ;
      End ;
      Aux := Aux +
             'L1-' + IntToStr(Local2) + '[' + CAMERAS_IP_POSICOES[Local].L1[Local2] + ']' + sLineBreak +
             'L2-' + IntToStr(Local2) + '[' + CAMERAS_IP_POSICOES[Local].L2[Local2] + ']' + sLineBreak +
             'OLD-' + IntToStr(Local2) + '[' + CAMERAS_IP_POSICOES[Local].OLD[Local2] + ']' + sLineBreak ;
   End ;
End ;
Result := Aux ;
End ;

Function FN_GET_CAMERAS_CARREGADAS : String ;
Begin
Result := Diretorio + 'Config\cameras_carregadas.txt' ;
End ;

(*
Function GET_INFO_CAMERA_E_POSICAO ( Shell : T_Registro_ShellWindow ; Var Reg : T_Camera_Posicoes ) : Boolean ;
Var Local  : LongInt ;
Begin
Result := FALSE ;
LIMPAR_CAMERA_E_POSICAO ( Reg ) ;
//PUT_LOG ( 'FIND GET INFO_CAMERA_E_POSICAO [' + Shell._IP + ']' ) ;
For Local := 0 To MAX_CAMERAS - 1 Do Begin
   If CAMERAS_IP_POSICOES[Local].IP = '' Then Begin
      Continue ;
   End ;
   If CAMERAS_IP_POSICOES[Local].IP <> Shell._IP Then Begin
      //PUT_LOG ( 'FIND DIFF GET INFO_CAMERA_E_POSICAO [' + CAMERAS_IP_POSICOES[Local].IP + ']' ) ;
      Continue ;
   End ;
   //PUT_LOG ( 'FIND OK GET INFO_CAMERA_E_POSICAO [' + Shell._IP + ']' ) ;
   Reg := CAMERAS_IP_POSICOES[Local] ;
   Result := TRUE ;
   Exit ;
End ;
//PUT_LOG ( 'FIND NOK GET INFO_CAMERA_E_POSICAO [' + Shell._IP + ']' ) ;
End ;
*)

Procedure CARREGAR_CAMERAS_E_POSICOES ( FN : String ) ;
Var Ini    : TMemIniFile ;
    Lista  : TStringList ;
    Local  : LongInt ;
    Local2 : LongInt ;
    Qtde   : LongInt ;
    IP     : String ;
    Indice : LongInt ;
Begin
PUT_LOG ( 'INI CARREGAR_CAMERAS_E_POSICOES [' + FN + ']' ) ;
//If NOT RR_FileExists ( 'CARREGAR_CAMERAS_E_POSICOES', FN ) Then Begin
If NOT FileExists ( FN ) Then Begin
   PUT_LOG ( 'Exit/1 !FN CARREGAR_CAMERAS_E_POSICOES [' + FN + ']' ) ;
   Exit ;
End ;
LIMPAR_CAMERAS_E_POSICOES ;
Ini := TMemIniFile.Create ( FN ) ;
Lista := TStringList.Create ;
Ini.ReadSections ( Lista ) ;
Qtde := Lista.Count ;
If Qtde =  0 Then Begin
   PUT_LOG ( 'Exit/2 !Qtde CARREGAR_CAMERAS_E_POSICOES' ) ;
   Ini.Free ;
   Exit ;
End ;
Indice := 0 ;
For Local := 0 To Qtde - 1 Do Begin
   IP := Trim ( Lista[Local] ) ;
   If IP = '' Then Begin
      Continue ;
   End ;
   CAMERAS_IP_POSICOES[Indice].IP := IP ;
   CAMERAS_IP_POSICOES[Indice].Nome_Atalho := Ini.ReadString ( IP, 'camera', '' ) ;
   For Local2 := 0 To MAX_CAMERAS_QTDE_POSICOES - 1 Do Begin
      CAMERAS_IP_POSICOES[Indice].L1[Local2] := Ini.ReadString ( IP, 'n' + IntToStr(Local2), '' ) ; ;
      CAMERAS_IP_POSICOES[Indice].L2[Local2] := Ini.ReadString ( IP, 'p' + IntToStr(Local2), '' ) ; ;
      CAMERAS_IP_POSICOES[Indice].OLD[Local2] := Ini.ReadString ( IP, 'o' + IntToStr(Local2), '' ) ; ;
   End ;
   Inc ( Indice ) ;
End ;
Ini.Free ;
WRITE_FILE_CORE ( 'CARREGAR_CAMERAS_E_POSICOES',
                  FN_GET_CAMERAS_CARREGADAS,
                  GET_CAMERAS_CARREGADAS, DELAYED_FALSE ) ;
PUT_LOG ( 'FIM CARREGAR_CAMERAS_E_POSICOES Log[' + IntToStr(Indice) + ']' ) ;
End ;

Function OleVariantToString ( const Value : OleVariant ) : String ;
Var ss : TStringStream ;
    Size : Integer ;
    Data : PByteArray ;
Begin
Result := '' ;
Try
   If OleVariantIsNull ( Value ) Then Begin
      Exit ;
   End ;
   If Length (Value) = 0 Then Begin
      Exit ;
   End ;
   ss := TStringStream.Create ;
   Try
      Size := VarArrayHighBound(Value, 1) -
              VarArrayLowBound(Value, 1 ) + 1 ;
      Data := VarArrayLock(Value) ;
      Try
         ss.Position := 0 ;
         ss.WriteBuffer(Data^, Size) ;
         ss.Position := 0 ;
         Result := ss.DataString ;
      Finally
         VarArrayUnlock(Value) ;
      End ;
   Finally
      ss.Free ;
   End ;
Except
   On E : Exception Do Begin
      Result := '' ;
   End ;
End ;
End ;

Function OleVariantIsNull ( _Var : OleVariant ) : Boolean ;
Begin
Try
   Result := VarIsClear(_Var) OR VarIsEmpty(_Var) OR VarIsNull(_Var) OR
             (VarCompareValue(_Var, Unassigned)=vrEqual) ;
Except
   On E : Exception Do Begin
      Result := TRUE ;
   End ;
End ;
End ;

Function REMOVER_COMENTARIOS ( Str : String ) : String ;
Begin
If Pos ( '#', Str ) > 0 Then Begin
   Delete ( Str, Pos ( '#', Str ), Length ( Str ) ) ;
End ;
If Pos ( ';', Str ) > 0 Then Begin
   Delete ( Str, Pos ( ';', Str ), Length ( Str ) ) ;
End ;
Result := Trim ( Str ) ;
End ;

Function ActiveControl_Name ( _Form : TForm ) : String ;
Begin
Result := '' ;
If NOT Assigned ( _Form ) Then Begin
   Exit ;
End ;
If NOT Assigned ( _Form.ActiveControl ) Then Begin
   Exit ;
End ;
Result := _Form.ActiveControl.Name ;
End ;

(*
Procedure PUT_CACHE_GRAVACAO ( Origem : String ; _Tempo : LongInt ; _FN : String ; _Conteudo : String ) ;
Var Qtde   : LongInt ;
    Local  : LongInt ;
    Indice : LongInt ;
Begin
Qtde := Length ( Cache_Gravacao ) ;
Indice := -1 ;
If Qtde > 0 Then Begin
   For Local := 0 To Qtde - 1 Do Begin
      If Cache_Gravacao[Local].FN = _FN Then Begin
         Indice := Local ;
         Break ;
      End ;
   End ;
End ;
If Indice = -1 Then Begin
   SetLength ( Cache_Gravacao, Qtde + 1 ) ;
   Indice := Qtde ;
End ;
Cache_Gravacao[Indice].Origem := Origem ;
Cache_Gravacao[Indice].Tick := GetTickCount + _Tempo ;
Cache_Gravacao[Indice].FN := _FN ;
Cache_Gravacao[Indice].Conteudo := _Conteudo ;
End ;
*)

(*
Procedure VERIFICAR_CACHE_GRAVACAO ;
Var Qtde   : LongInt ;
    Local  : LongInt ;
//    Indice : LongInt ;
Begin
Qtde := Length ( Cache_Gravacao ) ;
If Qtde = 0 Then Begin
   Exit ;
End ;
For Local := 0 To Qtde - 1 Do Begin
   If ( Cache_Gravacao[Local].Tick > 0 ) AND
      ( GetTickCount > Cache_Gravacao[Local].Tick ) Then Begin
      Cache_Gravacao[Local].Tick := 0 ;
      PUT_LOG ( 'EXEC CACHE_GRAVACAO [' + Cache_Gravacao[Local].FN + ']' ) ;
      WRITE_FILE_CORE ( 'CACHE/' + Cache_Gravacao[Local].Origem,
                        Cache_Gravacao[Local].FN,
                        Cache_Gravacao[Local].Conteudo, DELAYED_FALSE ) ;
   End ;
End ;
End ;
*)

Procedure CHANGE_MEMO_SE_DIFF ( ME : TMemo ; Aux : String ) ;
Begin
If NOT Assigned ( ME ) Then Begin
   Exit ;
End ;
If Trim ( ME.Text ) <> Trim ( Aux ) Then Begin
   ME.Text := Aux ;
End ;
End ;

Procedure CHANGE_SL_SE_DIFF ( SL : TStringList ; Aux : String ) ;
Begin
If NOT Assigned ( SL ) Then Begin
   Exit ;
End ;
If Trim ( SL.Text ) <> Trim ( Aux ) Then Begin
   SL.Text := Aux ;
End ;
End ;

Type TRGBBytes = Array [0..2] Of Byte ;

Function COMPARAR_CORES ( C1, C2 : TRGBBytes ) : LongInt ;
Begin
Result := TRUNC ( SQRT ( SQR ( C1[0]-C2[0] ) +
                         SQR ( C1[1]-C2[1] ) +
                         SQR ( C1[2]-C2[2] ) ) ) ;
//
End ;

Procedure ReplaceColor ( ABitmap : TBitmap ;
                         ASource1 , ATarget1 : TColor ;
                         ASource2 , ATarget2 : TColor ;
                         ASource3 , ATarget3 : TColor ) ;
Var I            : Integer ;
    X            : Integer ;
    Y            : Integer ;
    //Cor          : TRGBBytes ;
    Size         : Integer ;
    Pixels       : PByteArray ;
    SourceColor1 : TRGBBytes ;
    TargetColor1 : TRGBBytes ;
    SourceColor2 : TRGBBytes ;
    TargetColor2 : TRGBBytes ;
    SourceColor3 : TRGBBytes ;
    TargetColor3 : TRGBBytes ;
    TargetTransp : TRGBBytes ;
    Alpha        : Byte ;
    MODO_ALPHA   : Boolean ;
Const TripleSize = SizeOf(TRGBBytes) ;
Begin
MODO_ALPHA := FALSE ;
Case ABitmap.PixelFormat Of
    pf24bit: Size := TripleSize ;
    pf32bit: Begin
             Size := SizeOf(TRGBQuad) ;
             MODO_ALPHA := TRUE ;
             End ;
Else
    Raise Exception.Create ( 'Bitmap must be 24-bit or 32-bit format!' ) ;
End ;
For I := 0 To TripleSize - 1 Do Begin
    // fill the array of bytes with color channel values in BGR order,
    // the same would do for the SourceColor from ASource parameter:
    // SourceColor[0] := GetBValue(ASource);
    // SourceColor[1] := GetGValue(ASource);
    // SourceColor[2] := GetRValue(ASource);
    // but this is (just badly readable) one liner
    SourceColor1[I] := Byte(ASource1 shr (16 - (I * 8))) ;
    SourceColor2[I] := Byte(ASource2 shr (16 - (I * 8))) ;
    SourceColor3[I] := Byte(ASource3 shr (16 - (I * 8))) ;
    // the same do for the TargetColor array from the ATarget parameter
    TargetColor1[I] := Byte(ATarget1 shr (16 - (I * 8))) ;
    TargetColor2[I] := Byte(ATarget2 shr (16 - (I * 8))) ;
    TargetColor3[I] := Byte(ATarget3 shr (16 - (I * 8))) ;
End;
TargetTransp[0] := 0 ;
TargetTransp[1] := 0 ;
TargetTransp[2] := 0 ;
For Y := 0 To ABitmap.Height - 1 Do Begin
   // get a pointer to the currently iterated row pixel byte array
   Pixels := ABitmap.ScanLine[Y] ;
   // iterate the row horizontally pixel by pixel
   For X := 0 To ABitmap.Width - 1 Do Begin
      // now imagine, that you have an array of bytes in which the groups of
      // bytes represent a single pixel - e.g. the used Pixels array for the
      // first 2 pixels might look like this for 24-bit and 32-bit bitmaps:

      // Pixels   [0][1][2]     [3][4][5]
      // 24-bit    B  G  R       B  G  R
      // Pixels   [0][1][2][3]  [4][5][6][7]
      // 32-bit    B  G  R  A    B  G  R  A

      // from the above you can see that you'll need to multiply the current
      // pixel iterator by the count of color channels to point to the first
      // (blue) color channel in that array; and that's what that (X * Size)
      // is for here; X is a pixel iterator, Size is size of a single pixel:

      // X * 3    (0 * 3)       (1 * 3)
      //           ?             ?
      // Pixels   [0][1][2]     [3][4][5]
      // 24-bit    B  G  R       B  G  R

      // X * 4    (0 * 4)       (1 * 4)
      //           ?             ?
      // Pixels   [0][1][2][3]  [4][5][6][7]
      // 32-bit    B  G  R  A    B  G  R  A

      // so let's compare a BGR value starting at the (X * Size) position of
      // the Pixels array with the SourceColor array and if it matches we've
      // found the same colored pixel, if so then...
      //Cor[0] := Pixels[(X * Size)] ;
      //Cor[1] := Pixels[(X * Size)+1] ;
      //Cor[2] := Pixels[(X * Size)+2] ;
      Alpha := Pixels[(X * Size)+3] ;
      //If COMPARAR_CORES ( Cor, SourceColor1 ) < 10 Then Begin
      If ( Alpha <> 255 ) AND ( MODO_ALPHA ) Then Begin
         Move ( TargetTransp, Pixels[(X * Size)], TripleSize ) ;
      End Else If CompareMem ( @Pixels[(X * Size)], @SourceColor1, TripleSize ) Then Begin
         // copy the TargetColor color byte array values to that BGR position
         // (in other words, replace the color channel bytes there)
         Move ( TargetColor1, Pixels[(X * Size)], TripleSize ) ;
      End Else If CompareMem ( @Pixels[(X * Size)], @SourceColor2, TripleSize ) Then Begin
      //End Else If COMPARAR_CORES ( Cor, SourceColor2 ) < 10 Then Begin
         // copy the TargetColor color byte array values to that BGR position
         // (in other words, replace the color channel bytes there)
         Move ( TargetColor2, Pixels[(X * Size)], TripleSize ) ;
      End Else If CompareMem ( @Pixels[(X * Size)], @SourceColor3, TripleSize ) Then Begin
      //End Else If COMPARAR_CORES ( Cor, SourceColor3 ) < 10 Then Begin
         // copy the TargetColor color byte array values to that BGR position
         // (in other words, replace the color channel bytes there)
         Move ( TargetColor3, Pixels[(X * Size)], TripleSize ) ;
      End ;
   End ;
End ;
End ;

Function GET_LIMITES_RGB ( ABitmap : TBitmap ) : T_Limites_RGB ;
Var //I            : Integer ;
    X            : Integer ;
    Y            : Integer ;
    Size         : Integer ;
    Pixels       : PByteArray ;
    //MODO_ALPHA   : Boolean ;
    R            : Byte ;
    G            : Byte ;
    B            : Byte ;
    A            : Byte ;
Const TripleSize = SizeOf(TRGBBytes) ;
Begin
Result.R_MIN := 255 ;
Result.R_MAX := 0 ;
Result.G_MIN := 255 ;
Result.G_MAX := 0 ;
Result.B_MIN := 255 ;
Result.B_MAX := 0 ;
Result.A_MIN := 255 ;
Result.A_MAX := 0 ;
//MODO_ALPHA := FALSE ;
Case ABitmap.PixelFormat Of
    pf24bit: Size := TripleSize ;
    pf32bit: Begin
             Size := SizeOf(TRGBQuad) ;
             //MODO_ALPHA := TRUE ;
             End ;
Else
    Raise Exception.Create ( 'Bitmap must be 24-bit or 32-bit format!' ) ;
End ;
For Y := 0 To ABitmap.Height - 1 Do Begin
   // get a pointer to the currently iterated row pixel byte array
   Pixels := ABitmap.ScanLine[Y] ;
   // iterate the row horizontally pixel by pixel
   For X := 0 To ABitmap.Width - 1 Do Begin
      B := Pixels[(X * Size)+0] ;
      G := Pixels[(X * Size)+1] ;
      R := Pixels[(X * Size)+2] ;
      A := Pixels[(X * Size)+3] ;
      Result.R_MIN := MIN ( R, Result.R_MIN ) ;
      Result.R_MAX := MAX ( R, Result.R_MAX ) ;
      Result.G_MIN := MIN ( G, Result.G_MIN ) ;
      Result.G_MAX := MAX ( G, Result.G_MAX ) ;
      Result.B_MIN := MIN ( B, Result.B_MIN ) ;
      Result.B_MAX := MAX ( B, Result.B_MAX ) ;
      Result.A_MIN := MIN ( A, Result.A_MIN ) ;
      Result.A_MAX := MAX ( A, Result.A_MAX ) ;
   End ;
End ;
End ;

Procedure EXEC_GRAY_TO_RGB ( ABitmap : TBitmap ; Cor : TColor ; Fator : Single ) ;
Var I            : Integer ;
    X            : Integer ;
    Y            : Integer ;
    Size         : Integer ;
    Pixels       : PByteArray ;
    //MODO_ALPHA   : Boolean ;
    Nivel        : Single ;
    R            : Byte ;
    //G            : Byte ;
    //B            : Byte ;
    //A            : Byte ;
    Limites      : T_Limites_RGB ;
    TargetColor  : TRGBBytes ;
    Cor_R        : Byte ;
    Cor_G        : Byte ;
    Cor_B        : Byte ;
Const TripleSize = SizeOf(TRGBBytes) ;
Begin
Limites := GET_LIMITES_RGB ( ABitmap ) ;
//PUT_LOG ( 'LIMITES R[' + IntToStr(Limites.R_Min) + ':' + IntToStr(Limites.R_Max) + ']' +
//          'G[' + IntToStr(Limites.G_Min) + ':' + IntToStr(Limites.G_Max) + ']' +
//          'B[' + IntToStr(Limites.B_Min) + ':' + IntToStr(Limites.B_Max) + ']' +
//          'A[' + IntToStr(Limites.A_Min) + ':' + IntToStr(Limites.A_Max) + ']' ) ;
//MODO_ALPHA := FALSE ;
Case ABitmap.PixelFormat Of
    pf24bit: Size := TripleSize ;
    pf32bit: Begin
             Size := SizeOf(TRGBQuad) ;
//             MODO_ALPHA := TRUE ;
             End ;
Else
    Raise Exception.Create ( 'Bitmap must be 24-bit or 32-bit format!' ) ;
End ;
For I := 0 To TripleSize - 1 Do Begin
    TargetColor[I] := Byte(Cor shr (16 - (I * 8))) ;
End;
Cor_B := Byte(Cor shr (16 - (0 * 8))) ;
Cor_G := Byte(Cor shr (16 - (1 * 8))) ;
Cor_R := Byte(Cor shr (16 - (2 * 8))) ;
For Y := 0 To ABitmap.Height - 1 Do Begin
   Pixels := ABitmap.ScanLine[Y] ;
   For X := 0 To ABitmap.Width - 1 Do Begin
      R := Pixels[(X * Size)+2] ;
      If Limites.R_MIN = Limites.R_MAX Then Begin
         Nivel := 1 ;
      End Else Begin
         Nivel := R / 255 ; // ( R - Limites.R_MIN ) / ( Limites.R_MAX - Limites.R_MIN ) ;
      End ;
      TargetColor[0] := MIN ( 255, TRUNC ( Cor_B * Nivel * Fator ) ) ; // + Limites.B_MIN DIV 2 ) ;
      TargetColor[1] := MIN ( 255, TRUNC ( Cor_G * Nivel * Fator ) ) ; // + Limites.G_MIN DIV 2 ) ;
      TargetColor[2] := MIN ( 255, TRUNC ( Cor_R * Nivel * Fator ) ) ; // + Limites.R_MIN DIV 2 ) ;
      Move ( TargetColor, Pixels[(X * Size)], TripleSize ) ;
   End ;
End ;
End ;

Function PNG4TransparentBitMap(aBitmap:TBitmap): TPNGImage ;
Var X       : Word ;
    Y       : Word ;
    //BmpRGBA : ^TRGBAArray ;
    PngRGB  : ^TRGB ;
    Passo   : LongInt ;
Begin
Result := Nil ;
_Debug ( 'INI PNG4TransparentBitMap' ) ;
If NOT Assigned ( aBitmap ) Then Begin
   _Debug ( 'Exit/1 !Assigned aBitmap PNG4TransparentBitMap' ) ;
   Exit ;
End ;
If aBitmap.Width = 0 Then Begin
   _Debug ( 'Exit/2 !Width aBitmap PNG4TransparentBitMap' ) ;
   Exit ;
End ;
If aBitmap.Height = 0 Then Begin
   _Debug ( 'Exit/3 !Height aBitmap PNG4TransparentBitMap' ) ;
   Exit ;
End ;
PUT_LOG ( 'PNG4TransparentBitMap ' +
          'W[' + IntToStr ( aBitmap.Width) + '] ' +
          'H[' + IntToStr ( aBitmap.Height ) + ']' +
          'PredW[' + IntToStr ( Pred(aBitmap.Width) ) + ']' +
          'PredH[' + IntToStr ( Pred(aBitmap.Height) ) + ']' ) ;
Passo := 0 ;
Try
   Result := TPNGImage.CreateBlank ( COLOR_RGBALPHA, 8,
                                     aBitmap.Width , aBitmap.Height ) ;
   Result.CreateAlpha ;
   Result.Canvas.CopyMode := cmSrcCopy ;
   Result.Canvas.Draw ( 0, 0, aBitmap ) ;
   For Y := 0 To Pred(aBitmap.Height) Do Begin
      Passo := Y * 10000 + 9999 ;
      //BmpRGBA := aBitmap.ScanLine[Y] ;
      PngRGB := Result.Scanline[Y] ;
      For X := 0 To Pred(aBitmap.Width) Do Begin
         //Passo := Size ( Result.AlphaScanline[Y] ) ;
         Passo := 50000 + X ; // Y * 10000 + BmpRGBA[X].A ;
         //Result.AlphaScanline[Y][X] := BmpRGBA[X].A ;
         PngRGB^.B := 128 ; // Round ( BmpRGBA[X].B * 255 ) ;
         PngRGB^.R := 128 ; // Round ( BmpRGBA[X].R * 255 ) ;
         PngRGB^.G := 128 ; // Round ( BmpRGBA[X].G * 255 ) ;
         If aBitmap.AlphaFormat In [afDefined, afPremultiplied] Then Begin
            {
            If BmpRGBA[X].A <> 0 Then Begin
               //PngRGB^.B := Round(BmpRGBA[X].B / BmpRGBA[X].A * 255) ;
               //PngRGB^.R := Round(BmpRGBA[X].R / BmpRGBA[X].A * 255) ;
               //PngRGB^.G := Round(BmpRGBA[X].G / BmpRGBA[X].A * 255) ;
            End Else Begin
               //PngRGB^.B := Round(BmpRGBA[X].B * 255) ;
               //PngRGB^.R := Round(BmpRGBA[X].R * 255) ;
               //PngRGB^.G := Round(BmpRGBA[X].G * 255) ;
            End ;
            }
         End ;
      Inc ( PngRGB ) ;
      End ;
   End ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception PNG4TransparentBitMap Passo[' + IntToStr(Passo) + '][' + E.Message + ']' ) ;
   End ;
End ;
_Debug ( 'FIM PNG4TransparentBitMap' ) ;
End ;

Procedure ATUALIZAR_PNG_COLOR ( FN : String ;
                                Dir_Destino : String ;
                                Cor1_Origem, Cor1_Destino : TColor ;
                                Cor2_Origem, Cor2_Destino : TColor ;
                                Cor3_Origem, Cor3_Destino : TColor ) ;
Var BMP : TBitmap;
    PNG : TPNGImage ;
Begin
_Debug ( 'INI ATUALIZAR PNG COLOR [' + FN + ']' ) ;
If NOT RR_FileExists ( 'ATUALIZAR PNG COLOR', FN ) Then Begin
   _Debug ( 'Exit/1 !FN' ) ;
   Exit ;
End ;
PNG := TPNGImage.Create ;
Try
   PNG.LoadFromFile ( FN ) ;
Except
   On E : Exception Do Begin
      _Debug ( 'Exception ATUALIZAR PNG COLOR [' + E.Message + ']' ) ;
      Exit ;
   End ;
End ;
CHECAR_DIRETORIO_DIRNAME ( Dir_Destino ) ;
Try
   BMP := TBitmap.Create ;
   BMP.AlphaFormat := TAlphaFormat.afDefined ;
   BMP.PixelFormat := TPixelFormat.pf32bit ;
   Try
      BMP.Assign ( PNG ) ;
      BMP.PixelFormat := pf32bit ;
      BMP.Transparent := TRUE ;
      BMP.TransparentColor := clBlack ;
      //Bitmap.LoadFromFile('d:\Image.bmp');
      ReplaceColor ( BMP, Cor1_Origem, Cor1_Destino,
                          Cor2_Origem, Cor2_Destino,
                          Cor3_Origem, Cor3_Destino ) ;
      //Image1.Picture.Assign(Bitmap);
      //BMP.SaveToFile ( ChangeFileExt ( FN, '.bmp' ) ) ;
      PNG.Assign ( BMP ) ;
      PNG.SaveToFile ( Dir_Destino + ExtractFileName ( FN ) ) ;
      {
      PNG := PNG4TransparentBitMap ( BMP ) ;
      Try
         PNG.SaveToFile ( ChangeFileExt ( FN, '.2.png' ) );
      Finally
         //PNG.Free;
      End ;
      }
   Finally
      FreeAndNil(BMP) ;
   End ;
Finally
   FreeAndNil(PNG) ;
End ;
_Debug ( 'FIM ATUALIZAR PNG COLOR [' + FN + ']' ) ;
End ;

Procedure GRAY_TO_RGB ( FN, Dir_Destino : String ; Cor : TColor ; Fator : Single ) ;
Var //Limites : T_Limites_RGB ;
    BMP     : TBitmap;
    PNG     : TPNGImage ;
Begin
_Debug ( 'INI GRAY TO RGB [' + FN + ']' ) ;
If NOT RR_FileExists ( 'GRAY TO RGB', FN ) Then Begin
   _Debug ( 'Exit/1 GRAY TO RGB !FN' ) ;
   Exit ;
End ;
PNG := TPNGImage.Create ;
Try
   PNG.LoadFromFile ( FN ) ;
Except
   On E : Exception Do Begin
      _Debug ( 'Exception GRAY TO RGB [' + E.Message + ']' ) ;
      Exit ;
   End ;
End ;
CHECAR_DIRETORIO_DIRNAME ( Dir_Destino ) ;
Try
   BMP := TBitmap.Create ;
   BMP.AlphaFormat := TAlphaFormat.afDefined ;
   BMP.PixelFormat := TPixelFormat.pf32bit ;
   Try
      BMP.Assign ( PNG ) ;
      BMP.PixelFormat := pf32bit ;
      BMP.Transparent := TRUE ;
      BMP.TransparentColor := clBlack ;
      EXEC_GRAY_TO_RGB (  BMP, Cor, Fator ) ;
      PNG.Assign ( BMP ) ;
      PNG.SaveToFile ( Dir_Destino + ExtractFileName ( FN ) ) ;
   Finally
      FreeAndNil(BMP) ;
   End ;
Finally
   FreeAndNil(PNG) ;
End ;
_Debug ( 'FIM GRAY TO RGB [' + FN + ']' ) ;
End ;

Function HEX_CONDICIONAL ( Str : String ) : String ;
Var Local : LongInt ;
Begin
Result := '' ;
If Str = '' Then Begin
   Exit ;
End ;
For Local := 1 To Length ( Str ) Do Begin
   If Str[Local] < #32 Then Begin
      Result := Result + '{x' + IntToHex(Ord(Str[Local]),2) + '}' ;
   End Else Begin
      Result := Result + Str[Local] ;
   End ;
End ;
End ;

Function STR_TO_CC_LINK ( Str : String ) : String ;
Var Local : LongInt ;
Begin
Result := '' ;
If Str = '' Then Begin
   Exit ;
End ;
// 42=á, 92=é, 94=í, 95=ó, 96=ú, 123=ç, 125=Ñ, 126=ñ
For Local := 1 To Length ( Str ) Do Begin
   Case Str[Local] Of
     'á', 'Á' : Result := Result + #42 ;
     'é', 'É' : Result := Result + #92 ;
     'í', 'Í' : Result := Result + #94 ;
     'ó', 'Ó' : Result := Result + #95 ;
     'ú', 'Ú' : Result := Result + #96 ;
     'ç', 'Ç' : Result := Result + #123 ;
     'ñ', 'Ñ' : Result := Result + #125 ;
     'ã'      : Result := Result + 'a' ;
     'Ã'      : Result := Result + 'A' ;
     'õ'      : Result := Result + 'o' ;
     'Õ'      : Result := Result + 'O' ;
     'â'      : Result := Result + 'a' ;
     'Â'      : Result := Result + 'A' ;
     'ê'      : Result := Result + 'e' ;
     'Ê'      : Result := Result + 'E' ;
     'î'      : Result := Result + 'i' ;
     'Î'      : Result := Result + 'I' ;
     'ô'      : Result := Result + 'o' ;
     'Ô'      : Result := Result + 'O' ;
     'û'      : Result := Result + 'u' ;
     'Û'      : Result := Result + 'U' ;
     'à'      : Result := Result + 'a' ;
     'À'      : Result := Result + 'A' ;
     'è'      : Result := Result + 'e' ;
     'È'      : Result := Result + 'E' ;
     'ì'      : Result := Result + 'i' ;
     'Ì'      : Result := Result + 'I' ;
     'ò'      : Result := Result + 'o' ;
     'Ò'      : Result := Result + 'O' ;
     'ù'      : Result := Result + 'u' ;
     'Ù'      : Result := Result + 'U' ;
     'ä'      : Result := Result + 'a' ;
     'Ä'      : Result := Result + 'A' ;
     'ë'      : Result := Result + 'e' ;
     'Ë'      : Result := Result + 'E' ;
     'ï'      : Result := Result + 'i' ;
     'Ï'      : Result := Result + 'I' ;
     'ö'      : Result := Result + 'o' ;
     'Ö'      : Result := Result + 'O' ;
     'ü'      : Result := Result + 'u' ;
     'Ü'      : Result := Result + 'U' ;
     Else
         Result := Result + Str[Local] ;
   End ;
End ;
End ;

(*
Function GET_FTP_STATE_TO_STR ( State : TFtpState ) : String ;
Begin
Case State Of
OverbyteIcsFtpCli.ftpNotConnected    : Result := 'ftpNotConnected' ;
OverbyteIcsFtpCli.ftpReady           : Result := 'ftpReady' ;
OverbyteIcsFtpCli.ftpInternalReady   : Result := 'ftpInternalReady' ;
OverbyteIcsFtpCli.ftpDnsLookup       : Result := 'ftpDnsLookup' ;
OverbyteIcsFtpCli.ftpConnected       : Result := 'ftpConnected' ;
OverbyteIcsFtpCli.ftpAbort           : Result := 'ftpAbort' ;
OverbyteIcsFtpCli.ftpInternalAbort   : Result := 'ftpInternalAbort' ;
OverbyteIcsFtpCli.ftpWaitingBanner   : Result := 'ftpWaitingBanner' ;
OverbyteIcsFtpCli.ftpWaitingResponse : Result := 'ftpWaitingResponse' ;
OverbyteIcsFtpCli.ftpPasvReady       : Result := 'ftpPasvReady' ;
Else
  Result := 'Indefinido' ;
End ;
End ;
*)

Procedure PUT_LB ( LB : TListBox ; Str : String ) ;
Begin
PUT_LOG ( Str ) ;
LB.Items.Add ( Str ) ;
LB.ItemIndex := LB.Items.Count - 1 ;
End ;

Function GET_FN_NEXT_TAREFA_CONVERSAO_XDCAM : String ;
Begin
Inc ( Indice_Geral ) ;
Result := INSERE_BARRA ( Diretorio_Conversao_Tarefas_Gerar_Mov ) +
          DATAHORA_INVERSA(Now) + '_' + StrZero(Indice_Geral,6) + '.DAT' ;
CHECAR_DIRETORIO_FILENAME ( Result ) ;
End ;

Function GET_FN_NEXT_TAREFA_UPLOAD_FTP : String ;
Begin
Inc ( Indice_Geral ) ;
Result := INSERE_BARRA ( Diretorio_Conversao_Tarefas_Upload ) +
          DATAHORA_INVERSA(Now) + '_' + StrZero(Indice_Geral,6) + '.DAT' ;
CHECAR_DIRETORIO_FILENAME ( Result ) ;
End ;

Procedure CARREGAR_DIRETORIOS_INGEST_P2 ;
Var Aux : LongInt ;
Begin
Servidor_Conversao := CARREGAR_STRING ( '', 'DIRETORIOS', 'SERVIDOR_CONVERSAO', '' ) ;
If Servidor_Conversao = '' Then Begin
   Servidor_Conversao := '\\172.16.253.203\DEFAULT\' ;
   PUT_LOG ( 'SALVANDO PADRAO Servidor_Conversao [' + Servidor_Conversao + ']' ) ;
   SALVAR_STRING ( '', 'DIRETORIOS', 'DESCRICAO', 'TVD:\\172.16.253.203\TVD, TVM:\\172.16.253.203\TVM' ) ;
   SALVAR_STRING ( '', 'DIRETORIOS', 'SERVIDOR_CONVERSAO', Servidor_Conversao ) ;
End ;
Servidor_Conversao := INSERE_BARRA ( Servidor_Conversao ) ;
//
Servidor_Conversao_Emissora := Servidor_Conversao ;
If Servidor_Conversao_Emissora <> '' Then Begin
   While Servidor_Conversao_Emissora[Length(Servidor_Conversao_Emissora)] = '\' Do Begin
      Delete ( Servidor_Conversao_Emissora, Length ( Servidor_Conversao_Emissora ), 1 ) ;
      If Servidor_Conversao_Emissora = '' Then Begin
         Break ;
      End ;
   End ;
End ;
If Servidor_Conversao_Emissora <> '' Then Begin
   While Pos ( '\', Servidor_Conversao_Emissora ) > 0 Do Begin
      Delete ( Servidor_Conversao_Emissora, 1, 1 ) ;
      If Servidor_Conversao_Emissora = '' Then Begin
         Break ;
      End ;
   End ;
End ;
//
Funcao_Ingest_P2 := CARREGAR_STRING ( '', 'FUNCOES', 'INGEST_P2', '' ) ;
If Funcao_Ingest_P2 = '' Then Begin
   Funcao_Ingest_P2 := '0' ;
   PUT_LOG ( 'SALVANDO PADRAO Funcao_Ingest_P2 [' + Funcao_Ingest_P2 + ']' ) ;
   SALVAR_STRING ( '', 'FUNCOES', 'DESCRICAO1', 'INGEST_P2=0/1' ) ;
   SALVAR_STRING ( '', 'FUNCOES', 'DESCRICAO2', 'INGEST_DSLR=0/1' ) ;
   SALVAR_STRING ( '', 'FUNCOES', 'INGEST_P2', Funcao_Ingest_P2 ) ;
End ;
//
Funcao_Ingest_DSLR := CARREGAR_STRING ( '', 'FUNCOES', 'INGEST_DSLR', '' ) ;
If Funcao_Ingest_DSLR = '' Then Begin
   Funcao_Ingest_DSLR := '0' ;
   PUT_LOG ( 'SALVANDO PADRAO Funcao_Ingest_DSLR [' + Funcao_Ingest_DSLR + ']' ) ;
   SALVAR_STRING ( '', 'FUNCOES', 'DESCRICAO1', 'INGEST_P2=0/1' ) ;
   SALVAR_STRING ( '', 'FUNCOES', 'DESCRICAO2', 'INGEST_DSLR=0/1' ) ;
   SALVAR_STRING ( '', 'FUNCOES', 'INGEST_DSLR', Funcao_Ingest_DSLR ) ;
End ;
//
Modo_Converter_Mov := CARREGAR_STRING ( '', 'CONVERSAO_MOV', 'FLAG_CONVERTER_MOV', '' ) ;
If Modo_Converter_Mov = '' Then Begin
   Modo_Converter_Mov := '1' ; // 1=FFMPEG_para_Mov, 2=Não Converter
   PUT_LOG ( 'SALVANDO PADRAO Modo_Converter_Mov [' + Modo_Converter_Mov + ']' ) ;
   SALVAR_STRING ( '', 'CONVERSAO_MOV', 'DESCRICAO', '1:Realizar, 0/2:Nao Realiza' ) ;
   SALVAR_STRING ( '', 'CONVERSAO_MOV', 'FLAG_CONVERTER_MOV', Modo_Converter_Mov ) ;
End ;
//
Aux := CARREGAR_INTEGER ( '', 'INGEST_P2', 'FLAG_BLOQUEAR_INGEST_DRIVES_FIXOS', -1 ) ;
If Aux = -1 Then Begin
   Aux := 1 ;
   PUT_LOG ( 'SALVANDO PADRAO FLAG_BLOQUEAR_INGEST_DRIVES_FIXOS [' + IntToStr(Aux) + ']' ) ;
   SALVAR_INTEGER ( '', 'INGEST_P2', 'FLAG_BLOQUEAR_INGEST_DRIVES_FIXOS', Aux ) ;
End ;
FLAG_BLOQUEAR_INGEST_DRIVES_FIXOS := ( Aux = 1 ) ;
//
Setup_Servidor := CARREGAR_INTEGER ( '', 'EMISSORA', 'SETUP_SERVIDOR', -1 ) ;
If Setup_Servidor = -1 Then Begin
   Setup_Servidor := 200 ;
   PUT_LOG ( 'SALVANDO PADRAO Setup_Servidor [' + IntToStr(Setup_Servidor) + ']' ) ;
   SALVAR_STRING ( '', 'EMISSORA', 'DESCRICAO', '200-Default 201-TVD 202-TVM 203-AL 204-PM' ) ;
   SALVAR_INTEGER ( '', 'EMISSORA', 'SETUP_SERVIDOR', Setup_Servidor ) ;
End ;
//
FTP_IP := CARREGAR_STRING ( '', 'SERVIDOR_FTP', 'IP', '' ) ;
If FTP_IP = '' Then Begin
   FTP_IP := '172.16.253.114' ;
   PUT_LOG ( 'Definindo IP Padrão [' + FTP_IP + ']' ) ;
   SALVAR_STRING ( '', 'SERVIDOR_FTP', 'IP', FTP_IP ) ;
End ;
FTP_PORTA := CARREGAR_INTEGER ( '', 'SERVIDOR_FTP', 'PORTA', -1 ) ;
If FTP_PORTA = -1 Then Begin
   FTP_PORTA :=  0 ;
   PUT_LOG ( 'Definindo Porta Padrão [' + IntToStr(FTP_PORTA) + ']' ) ;
   SALVAR_INTEGER ( '', 'SERVIDOR_FTP', 'PORTA', FTP_PORTA ) ;
End ;
{
ShowMessage ( 'CARREGAR_DIRETORIOS_INGEST_P2' + sLineBreak +
              'FTP_IP [' + FTP_IP + ']' + sLineBreak +
              'FTP_PORTA [' + IntToStr ( FTP_PORTA ) + ']' ) ;
}
//
Diretorio_Conversao_Mov := Servidor_Conversao + 'convertidos\' ;
Diretorio_Conversao_Logs := Servidor_Conversao + 'logs\' ;
Diretorio_Conversao_Repositorio := Servidor_Conversao + 'ingest\' ;
Diretorio_Conversao_Tarefas_Gerar_Mov := Servidor_Conversao + 'tarefas\mov\' ;
Diretorio_Conversao_Tarefas_Upload := Servidor_Conversao + 'tarefas\ftp\' ;
//
CHECAR_DIRETORIO_DIRNAME ( Servidor_Conversao ) ;
CHECAR_DIRETORIO_DIRNAME ( Diretorio_Conversao_Mov ) ;
CHECAR_DIRETORIO_DIRNAME ( Diretorio_Conversao_Logs ) ;
CHECAR_DIRETORIO_DIRNAME ( Diretorio_Conversao_Repositorio ) ;
CHECAR_DIRETORIO_DIRNAME ( Diretorio_Conversao_Tarefas_Gerar_Mov ) ;
CHECAR_DIRETORIO_DIRNAME ( Diretorio_Conversao_Tarefas_Upload ) ;
//
PUT_LOG ( 'Servidor_Conversao [' + Servidor_Conversao + ']' ) ;
PUT_LOG ( 'Modo_Converter_Mov [' + Modo_Converter_Mov + ']' ) ;
PUT_LOG ( 'Diretorio Conversao_Tarefas_Gerar_Mov [' + Diretorio_Conversao_Tarefas_Gerar_Mov + ']' ) ;
PUT_LOG ( 'Diretorio Conversao_Tarefas_Upload [' + Diretorio_Conversao_Tarefas_Upload + ']' ) ;
PUT_LOG ( 'Diretorio Conversao_Logs [' + Diretorio_Conversao_Logs + ']' ) ;
PUT_LOG ( 'Diretorio Conversao_Mov [' + Diretorio_Conversao_Mov + ']' ) ;
PUT_LOG ( 'Diretorio Conversao_Repositorio [' + Diretorio_Conversao_Repositorio + ']' ) ;
PUT_LOG ( 'FTP_IP [' + FTP_IP + ']' ) ;
PUT_LOG ( 'FTP_PORTA [' + IntToStr(FTP_PORTA) + ']' ) ;
End ;

Procedure AJUSTAR_FLAGS_DE_EXIBICAO ( _Cmd : LongInt ; _Macro : String ) ;
Begin
//If _Cmd = DEF_MSG_C
Case _Cmd Of
DEF_MSG_CHYRON_LOGO_VIVO : Begin
                           RD_VAR_STATUS_LOGO := DEF_LOGO_VIVO ;
                           Exit ;
                           End ;
DEF_MSG_CHYRON_LOGO_MARC : Begin
                           RD_VAR_STATUS_LOGO := DEF_LOGO_MARCA ;
                           Exit ;
                           End ;
DEF_MSG_CHYRON_LOGO_REMOVE : Begin
                           RD_VAR_STATUS_LOGO := DEF_LOGO_SEM ;
                           Exit ;
                           End ;
DEF_MSG_CHYRON_LOGO_EXCLUSIVO: Begin
                           RD_VAR_STATUS_LOGO := DEF_LOGO_EXCLUSIVO ;
                           Exit ;
                           End ;
DEF_MSG_CHYRON_LOGO_ARQUIVO : Begin
                           RD_VAR_STATUS_LOGO := DEF_LOGO_ARQUIVO ;
                           Exit ;
                           End ;
End ;
If _Macro = 'CLEAR_FB1' Then Begin
   RD_VAR_STATUS_LOGO := DEF_LOGO_SEM ;
   Exit ;
End ;
If _Macro = 'CLEAR_FB12' Then Begin
   RD_VAR_STATUS_LOGO := DEF_LOGO_SEM ;
   Exit ;
End ;
If _Macro = 'CLEAR_FB13' Then Begin
   RD_VAR_STATUS_LOGO := DEF_LOGO_SEM ;
   Exit ;
End ;
If _Macro = 'SEREIA_ARQUIVO' Then Begin
   RD_VAR_STATUS_LOGO := DEF_LOGO_ARQUIVO ;
   Exit ;
End ;
If _Macro = 'SEREIA_EXCLUSIVO' Then Begin
   RD_VAR_STATUS_LOGO := DEF_LOGO_EXCLUSIVO ;
   Exit ;
End ;
If _Macro = 'SEREIA_MARCA' Then Begin
   RD_VAR_STATUS_LOGO := DEF_LOGO_MARCA ;
   Exit ;
End ;
If _Macro = 'SEREIA_ESCONDE' Then Begin
   RD_VAR_STATUS_LOGO := DEF_LOGO_SEM ;
   Exit ;
End ;
If _Macro = 'SEREIA_VIVO' Then Begin
   RD_VAR_STATUS_LOGO := DEF_LOGO_VIVO ;
   Exit ;
End ;
End ;

Function DirectoryUsable ( const Directory : String ; FollowLink : Boolean = TRUE ) : Boolean ;
Begin
Result := GetFileAttributes ( PChar(Directory)) <> INVALID_FILE_ATTRIBUTES ;
If Result Then Begin
   Result := DirectoryExists ( Directory, FollowLink ) ;
End ;
End ;

Function FileUsable ( const _File : String ) : Boolean ;
Begin
Result := GetFileAttributes ( PChar(_File)) <> INVALID_FILE_ATTRIBUTES ;
If Result Then Begin
   Result := FileExists ( _File ) ;
End ;
End ;

Begin
//PUT_CARREGANDO_SISTEMA ( 'Criando Misc_U' ) ;
INICIALIZACAO_ULTRA_BASICA ;
SL_Carregando_Sistema           := TStringList.Create ;
SL_Carregando_Sistema_Total     := TStringList.Create ;
End.

