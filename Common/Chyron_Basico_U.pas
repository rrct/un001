unit Chyron_Basico_U;

interface

uses Misc_Def_U, Misc_Const_U, Misc_Type_U,
     System.Threading,
     Chyron_VB_U,
     {$IFDEF FUTEBOL}
     Chyron_Futebol_U,
     {$ENDIF}
     Log_U, Misc_U, IniFiles,
     Winapi.Windows, Winapi.Messages,
     System.SysUtils, System.Variants, System.Classes,
     Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
     System.Win.ScktComp,
     Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Samples.Spin, Vcl.ComCtrls,
     OoMisc, AdPort;

type
  TChyron_Basico = class(TForm)
    Server_TCP: TServerSocket;
    Telnet_Chyron: TClientSocket;
    PC_Tecnica: TPageControl;
    TS_Tecnica_Configuracao: TTabSheet;
    Label24: TLabel;
    Label25: TLabel;
    Label82: TLabel;
    Label84: TLabel;
    Label83: TLabel;
    Label85: TLabel;
    ED_Drive: TEdit;
    ED_Diretorio: TEdit;
    Bot_Selecionar_Diretorio: TButton;
    CK_Conexao_LAN: TCheckBox;
    CK_Conexao_WAN: TCheckBox;
    SP_Testar_Link_LAN: TSpinEdit;
    SP_Testar_Link_WAN: TSpinEdit;
    CK_Limpar_Frame_Buffer: TCheckBox;
    TS_Tecnica_Template: TTabSheet;
    PN_Template: TPanel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label50: TLabel;
    ED_Campo_1: TEdit;
    SP_Template_Existente: TSpinEdit;
    SP_Novo_Template: TSpinEdit;
    ED_Campo_2: TEdit;
    ED_Campo_3: TEdit;
    ED_Campo_4: TEdit;
    ED_Campo_5: TEdit;
    ED_Campo_6: TEdit;
    ED_Campo_7: TEdit;
    ED_Campo_8: TEdit;
    ED_Campo_9: TEdit;
    ED_Campo_10: TEdit;
    Bot_Enviar: TButton;
    Bot_Conectar: TButton;
    ED_Comando: TEdit;
    Bot_Comando_Direto: TButton;
    Bot_Clear_Canvas: TButton;
    Bot_Continuar: TButton;
    Bot_Play: TButton;
    Bot_Read_Message_Update: TButton;
    PN_Template_Efeito_IN: TPanel;
    RB_Efeito_IN_01: TRadioButton;
    RB_Efeito_IN_02: TRadioButton;
    PN_Header_Efeito_IN: TPanel;
    RB_Efeito_IN_03: TRadioButton;
    RB_Efeito_IN_04: TRadioButton;
    RB_Efeito_IN_05: TRadioButton;
    RB_Efeito_IN_06: TRadioButton;
    RB_Efeito_IN_07: TRadioButton;
    RB_Efeito_IN_08: TRadioButton;
    RB_Efeito_IN_09: TRadioButton;
    RB_Efeito_IN_10: TRadioButton;
    PN_Template_Efeito_OUT: TPanel;
    RB_Efeito_OUT_01: TRadioButton;
    RB_Efeito_OUT_02: TRadioButton;
    PN_Header_Efeito_OUT: TPanel;
    RB_Efeito_OUT_03: TRadioButton;
    RB_Efeito_OUT_04: TRadioButton;
    RB_Efeito_OUT_05: TRadioButton;
    RB_Efeito_OUT_06: TRadioButton;
    RB_Efeito_OUT_07: TRadioButton;
    RB_Efeito_OUT_08: TRadioButton;
    RB_Efeito_OUT_09: TRadioButton;
    RB_Efeito_OUT_10: TRadioButton;
    Bot_Efeito_IN: TButton;
    Bot_Efeito_OUT: TButton;
    Bot_Read_Message: TButton;
    Bot_Read_Update_FB1: TButton;
    Bot_Abortar: TButton;
    CK_Responder_X: TCheckBox;
    Bot_Hotkey: TButton;
    SP_Hotkey: TSpinEdit;
    Bot_Teste_Comunicacao_Chyron: TButton;
    PN_Rodape_Efeitos: TPanel;
    Bot_Read_Update_FB2: TButton;
    TS_Informacoes: TTabSheet;
    ME_Informacoes: TMemo;
    PN_Top_TS_Informacoes: TPanel;
    Bot_Atualizar_Informacoes: TButton;
    TS_Transicoes: TTabSheet;
    TabSheet1: TTabSheet;
    SaveDialog_Script: TSaveDialog;
    OpenDialog_Script: TOpenDialog;
    PN_Scenes: TPanel;
    LB_Messages: TListBox;
    PN_Message_Scene: TPanel;
    SP_Message: TSpinEdit;
    Bot_Carregar_Message: TButton;
    LB_Transicoes: TListBox;
    Panel3: TPanel;
    PN_Ping: TPanel;
    PN_FB_1: TPanel;
    PN_Link_LAN: TPanel;
    PN_FB_2: TPanel;
    PN_Link_WAN: TPanel;
    PN_FB_VGA: TPanel;
    Bot_Play_FB1: TButton;
    Bot_Clear_FB1: TButton;
    Bot_Play_FB2: TButton;
    Bot_Limpar_FB2: TButton;
    Bot_Selecionar_Browser: TButton;
    CB_Jornal: TComboBox;
    TS_Editor: TTabSheet;
    TS_Scripts_Enviados: TTabSheet;
    PC_VB_Script_Intelligent_Interface: TPageControl;
    TS_VB_Script: TTabSheet;
    PN_FileName_VB: TPanel;
    PN_VB_Script: TPanel;
    ME_VB: TMemo;
    PN_Rodape_VB_Script: TPanel;
    Bot_Salvar_Como_Script_VB: TButton;
    Bot_Abrir_Script_VB: TButton;
    Bot_Enviar_Script_VB: TButton;
    TS_II: TTabSheet;
    ME_II: TMemo;
    PN_Rodape_II: TPanel;
    Bot_Salvar_II_Como: TButton;
    Bot_Abrir_II: TButton;
    Bot_Enviar_Script_II: TButton;
    PN_FileName_II: TPanel;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ED_Campo_Direto_1: TEdit;
    ED_Valor_Direto_1: TEdit;
    ED_Valor_Direto_2: TEdit;
    ED_Campo_Direto_2: TEdit;
    ED_Valor_Direto_3: TEdit;
    ED_Campo_Direto_3: TEdit;
    ED_Valor_Direto_4: TEdit;
    ED_Campo_Direto_4: TEdit;
    ED_Valor_Direto_5: TEdit;
    ED_Campo_Direto_5: TEdit;
    SP_Mensagem_Direta: TSpinEdit;
    Bot_Carregar_Menssage_Composta: TButton;
    LB_Scripts_VB: TListBox;
    ME_Scripts_Enviados2: TMemo;
    PN_Header_Scripts_Enviados: TPanel;
    Bot_Limpar: TButton;
    Porta: TApdComPort;
    procedure Server_TCPAccept(Sender: TObject; Socket: TCustomWinSocket);
    procedure Server_TCPClientConnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure Server_TCPClientDisconnect(Sender: TObject;
              Socket: TCustomWinSocket);
    procedure Server_TCPClientError(Sender: TObject; Socket: TCustomWinSocket;
              ErrorEvent: TErrorEvent; var ErrorCode: Integer);
    procedure Server_TCPClientRead(Sender: TObject; Socket: TCustomWinSocket);
    procedure Server_TCPClientWrite(Sender: TObject; Socket: TCustomWinSocket);
    procedure Server_TCPGetSocket(Sender: TObject; Socket: NativeInt;
              var ClientSocket: TServerClientWinSocket);
    procedure Server_TCPListen(Sender: TObject; Socket: TCustomWinSocket);
    procedure Telnet_ChyronConnect(Sender: TObject; Socket: TCustomWinSocket);
    procedure Telnet_ChyronError(Sender: TObject; Socket: TCustomWinSocket;
              ErrorEvent: TErrorEvent; var ErrorCode: Integer);
    procedure Telnet_ChyronRead(Sender: TObject; Socket: TCustomWinSocket);
    procedure FormCreate(Sender: TObject);
    procedure SP_Template_ExistenteClick(Sender: TObject);
    procedure SP_Novo_TemplateClick(Sender: TObject);
    procedure ED_ComandoDblClick(Sender: TObject);
    procedure Bot_Comando_DiretoClick(Sender: TObject);
    procedure Bot_Read_MessageClick(Sender: TObject);
    procedure Bot_Read_Update_FB1Click(Sender: TObject);
    procedure Bot_Clear_CanvasClick(Sender: TObject);
    procedure Bot_ContinuarClick(Sender: TObject);
    procedure Bot_PlayClick(Sender: TObject);
    procedure Bot_AbortarClick(Sender: TObject);
    procedure Bot_Teste_Comunicacao_ChyronClick(Sender: TObject);
    procedure Bot_ConectarClick(Sender: TObject);
    procedure CK_Responder_XClick(Sender: TObject);
    procedure Bot_Play_FB1Click(Sender: TObject);
    procedure Bot_Clear_FB1Click(Sender: TObject);
    procedure Bot_Play_FB2Click(Sender: TObject);
    procedure Bot_Limpar_FB2Click(Sender: TObject);
    procedure Bot_Read_Update_FB2Click(Sender: TObject);
    procedure CK_Conexao_LANClick(Sender: TObject);
    procedure CK_Conexao_WANClick(Sender: TObject);
    procedure SP_Testar_Link_LANClick(Sender: TObject);
    procedure SP_Testar_Link_WANClick(Sender: TObject);
    procedure CK_Limpar_Frame_BufferClick(Sender: TObject);
    procedure PN_FB_1Click(Sender: TObject);
    procedure PN_FB_2Click(Sender: TObject);
    procedure Bot_Selecionar_DiretorioClick(Sender: TObject);
    procedure Bot_Atualizar_InformacoesClick(Sender: TObject);
    procedure SP_Template_ExistenteChange(Sender: TObject);
    procedure SP_Novo_TemplateChange(Sender: TObject);
    procedure LB_MessagesClick(Sender: TObject);
    procedure LB_TransicoesClick(Sender: TObject);
    procedure Bot_Carregar_MessageClick(Sender: TObject);
    procedure Telnet_ChyronConnecting(Sender: TObject; Socket: TCustomWinSocket);
    procedure Telnet_ChyronDisconnect(Sender: TObject; Socket: TCustomWinSocket);
    procedure Telnet_ChyronWrite(Sender: TObject; Socket: TCustomWinSocket);
    procedure Telnet_ChyronLookup(Sender: TObject; Socket: TCustomWinSocket);
    Procedure TRATAR_RX_CHYRON ( Origem : String ; Aux : String ) ;
    procedure FormShow(Sender: TObject);
    procedure PN_FB_VGAClick(Sender: TObject);
    Procedure COMANDO_CHYRON_MSG_DIRETO ( Origem : String ; _Msg : LongInt ) ;
    Procedure SELECIONAR_BROWSER ( Browser : String  ) ;
    procedure Bot_Selecionar_BrowserClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Bot_Salvar_Como_Script_VBClick(Sender: TObject);
    procedure Bot_Abrir_Script_VBClick(Sender: TObject);
    procedure Bot_Enviar_Script_VBClick(Sender: TObject);
    procedure Bot_Enviar_Script_IIClick(Sender: TObject);
    procedure ME_IIExit(Sender: TObject);
    procedure ME_VBExit(Sender: TObject);
    procedure Bot_Salvar_II_ComoClick(Sender: TObject);
    procedure Bot_Abrir_IIClick(Sender: TObject);
    procedure Bot_Carregar_Menssage_CompostaClick(Sender: TObject);
    procedure LB_Scripts_VBClick(Sender: TObject);
    procedure Bot_LimparClick(Sender: TObject);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure PC_TecnicaMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure PC_TecnicaChange(Sender: TObject);
    procedure ME_VBKeyPress(Sender: TObject; var Key: Char);
    procedure PortaTriggerAvail(CP: TObject; Count: Word);
    procedure PortaPortOpen(Sender: TObject);
    procedure PortaPortClose(Sender: TObject);
    procedure PortaTriggerLineError(CP: TObject; Error: Word;
      LineBreak: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

Const
      CHYRON_BASICO_DEF1_CMD_PLAY_FB1         = 'Y\<D5><F3>1' ;
      CHYRON_BASICO_DEF1_CMD_PLAY_FB2         = 'Y\<D5><F3>2' ;

      CHYRON_BASICO_DEF1_CMD_CLEAR_FB1        = 'Y\<D5><FE>1' ;
      CHYRON_BASICO_DEF1_CMD_CLEAR_FB2        = 'Y\<D5><FE>2' ;

Var Chyron_Basico   : TChyron_Basico;
    Task_Chyron     : ITask = Nil ;
    Task_Chyron_Core_Descricao : String = '' ;
    Task_Chyron_Core_Script    : String = '' ;
    Task_Chyron_Core_Retorno   : String = '' ;
    Task_Chyron_Core_Header    : Boolean = TRUE ;
    Flag_Conectar_Chyron       : Boolean = TRUE ;
    Tick_Core                  : Cardinal = 0 ;

Procedure CHYRON_BASICO_REFRESH_TESTE_LINK_LAN ( Forcado : LongInt ) ;
Procedure CHYRON_BASICO_REFRESH_TESTE_LINK_WAN ( Forcado : LongInt ) ;
Function CHYRON_BASICO_GET_EFEITO_IN : String ;
Function CHYRON_BASICO_GET_EFEITO_OUT : String ;
Procedure CHYRON_BASICO_TRATAR_ERRO_CHYRON ( Erro : String ) ;
Function CHYRON_BASICO_GET_BUFFER_FRAME : String ;
Function CHYRON_BASICO_GET_DISPLAY_MODE : String ;
Function CHYRON_BASICO_GET_TEMPLATE : String ;
Function CHYRON_BASICO_GET_NEW_TEMPLATE : String ;
Function CHYRON_BASICO_PORTA_ATIVA : Boolean ;
//Procedure CHYRON_BASICO_PORTA_WRITE_CHAR ( _Char : Char ; Origem : String ) ;
//Procedure CHYRON_BASICO_PORTA_WRITE_STRING_OLD ( _String : String ; Origem : String ) ;
Procedure CHYRON_BASICO_PORTA_WRITE_STRING_SIMPLES ( _String : String ; Origem : String ) ;
Procedure CHYRON_BASICO_CONEXAO_TELNET_SE_CLOSED ;
Procedure CHYRON_BASICO_CONEXAO_TELNET ;
Function CHYRON_BASICO_GET_VB_HOTKEY ( HotKey : String ) : String ;
Function CONVERT_MACRO ( Macro : String ) : String ;
Procedure CHYRON_BASICO_ENVIAR_SCRIPT ( Origem, Script, Descricao : String ) ;
//Procedure CHYRON_SCRIPT ( Origem, Script : String ) ;
//Function CHYRON_BASICO_SCRIPT ( Descricao, Script : String ) : Boolean ;
//Function CHYRON_BASICO_TEMPLATE_SIMPLES ( Descricao, Comando : String ) : Boolean ;
Function CHYRON_BASICO_GET_GERADOR : String ;
//Function CHYRON_BASICO_GET_MENSAGEM_ERRO_CHYRON ( Erro : LongInt ) : String ;
//Procedure CHYRON_BASICO_PRINT_MENSAGENS_DE_ERRO_CHYRON ;
Procedure CHYRON_BASICO_CARREGAR_ERROS_CHYRON ;
Procedure CHYRON_BASICO_CARREGAR_CONFIGURACAO_TELNET_CHYRON ;
Procedure CHYRON_BASICO_TRATAR_CONEXAO_LAN_CHYRON ( _Checked : Boolean ) ;
Procedure CHYRON_BASICO_ATIVAR_SERVIDOR_TELNET_CHYRON ;
Procedure CHYRON_BASICO_TESTE_DE_COMUNICACAO_LAN ( Debug : Boolean ;
                                     CK_Conexao_LAN : TCheckBox ;
                                     PN_Link_LAN : TPanel ) ;
Procedure CHYRON_BASICO_TESTE_DE_COMUNICACAO_WAN ( Debug : Boolean ;
                                     CK_Conexao_WAN : TCheckBox ;
                                     PN_Link_WAN : TPanel ) ;
Procedure CHYRON_BASICO_CLEAR_FB ( Origem : String ) ;
Function CHYRON_BASICO_GET_FB_PLAY ( Indice : LongInt ) : String ;
Procedure CHYRON_BASICO_CLEAR_FB1 ( Origem : String ) ;
Procedure CHYRON_BASICO_CLEAR_FB2 ( Origem : String ) ;
Function CHYRON_BASICO_GET_FB_CLEAR ( Indice : LongInt ) : String ;
//Procedure CHYRON_BASICO_PLAY_FB ( Origem : String ) ;
Procedure CHYRON_BASICO_DEFINIR_FRAME_BUFFER ( Origem : String ) ;
//Procedure CHYRON_BASICO_SHOW_CHYRON_MESSAGE ( Mensagem, Parametros : String ) ;
Procedure CHYRON_BASICO_EXEC_TRANSICAO ( Cena, Transicao : String ; Jornal : String ) ;
//Procedure CHYRON_BASICO_PREPARAR_CHYRON_MESSAGE ( Mensagem, Parametros : String ) ;
//Procedure CHYRON_BASICO_PREPARAR_CHYRON_MESSAGE_READ ( FB : LongInt ; Mensagem : String ) ;
Procedure CHYRON_BASICO_SELECIONAR_FRAME_BUFFER ( FB : Integer ;
                                                  PN_FB_VGA, PN_FB_1, PN_FB_2 : TPanel ) ;
//Procedure CHYRON_BASICO_PLAY_FB1 ( Origem : String ) ;
//procedure CHYRON_BASICO_PLAY_FB2 ( Origem : String ) ;
//Procedure CHYRON_BASICO_READ_UPDATE_FB1 ( Origem : String ) ;
//Procedure CHYRON_BASICO_READ_UPDATE_FB2 ( Origem : String ) ;
//Procedure CHYRON_BASICO_COMANDO_DIRETO ( Origem, Comando : String ) ;
//Procedure CHYRON_BASICO_CONTINUAR_PLAY ( Origem : String ) ;
//Procedure CHYRON_BASICO_ABORTAR_PLAY ( Origem : String ) ;
//Procedure CHYRON_BASICO_ATUALIZAR_GERADOR ( Origem : String ) ;
//Function CHYRON_BASICO_GET_VB_TEMPLATE ( Chave, Valor : String ) : String ;
//Procedure CHYRON_BASICO_ENVIAR_MACRO ( Origem, Macro : String ) ;
//Procedure CHYRON_BASICO_CLEAR_CANVAS ( Origem : String ) ;
//Procedure CHYRON_BASICO_VB_CLEAR_ACTIVE_CANVAS ( Origem : String ) ;
//Procedure CHYRON_BASICO_PLAY ( Origem : String ) ;
//Procedure CHYRON_BASICO_READ_MESSAGE ( Origem : String ) ;
//Procedure CHYRON_BASICO_SELECIONAR_DIRETORIO ( Origem, Dir : String ) ;
Procedure CHYRON_BASICO_SALVAR_CONFIGURACAO ;
Procedure CHYRON_BASICO_CARREGAR_CONFIGURACAO ;
Procedure CHYRON_BASICO_ATUALIZAR_STATUS_INFORMACOES ;
//Procedure TRATAR_RETORNO_CHYRON ( Modo_LAN : Boolean ; Str : String ) ;
Procedure VB_FECHAR_NAO_PERSISTENTES ( FB : LongInt ; Efeito : Boolean ;
                                       Var Script : String ) ;
Procedure VB_FECHAR_ATE_PERSISTENTES ( FB : LongInt ; Efeito : Boolean ;
                                       Var Script : String ) ;
Procedure VB_OUT ( Tag : String ; Jornal : String ) ;
Procedure ATIVAR_TRANSICAO ( Msg : LongInt ; Cena, Transicao : String ;
                             Var Script : String ; Jornal : String ) ;
Procedure ATIVAR_MSG_SENAO ( Msg : LongInt ; Var Script : String ;
                             Jornal : String ; Cena : String ) ;
Procedure VB_ALTERAR_IMAGEM ( Msg : LongInt ; Campo, FN : String ;
                              Var Script : String ; Jornal : String ) ;
Procedure CHYRON_CARREGAR_GLOBAIS ( Var Script : String ) ;
Procedure CHYRON_MACRO_ATIVAR_ARTE ( Origem : String ) ;
Procedure CLEAR_CHYRON_REG ( Var Reg : T_Automacao_Chyron ) ;
Procedure EXECUTE_PLAY_CHYRON_OUT_GC ( _Tag : LongInt ;
                                       _Macro : String ;
                                       _Msg : LongInt ;
                                       _L1, _L2, _L3 : String ;
                                       _Jornal : String ;
                                       Script : String ;
                                       Descricao : String ) ;
//Function GET_DESCRICAO_POR_MSG ( Msg : LongInt ) : String ;
//Function GET_IDENTIFICACAO_POR_MSG ( Msg : LongInt ) : String ;
Function CHYRON_SCRIPT_CORE_NEW2 ( Descricao, Script : String ; IsMacro : Boolean ) : Boolean ;
Procedure EXEC_DIRETO_APAGAR_VOLATEIS ;
Procedure EXEC_DIRETO_APAGAR_VOLATEIS_ADD_RELOGIO ;
Procedure EXEC_DIRETO_SELO_MOV_ESPORTE ;
Procedure EXEC_DIRETO_SEREIA_ARQUIVO ;
Procedure EXEC_DIRETO_SEREIA_EXCLUSIVO ;
Procedure EXEC_DIRETO_SEREIA_ALTERNAR_VIVO ;
Procedure EXEC_DIRETO_SEREIA_ALTERNAR_VIVO_INICIAR_VIVO ;
Procedure EXEC_DIRETO_SEREIA_ALTERNAR_MARCA ;
Procedure EXEC_DIRETO_SEREIA_ALTERNAR_EXCLUSIVO ;
Procedure EXEC_DIRETO_SEREIA_ALTERNAR_ARQUIVO ;
Procedure EXEC_DIRETO_G1 ;
Procedure EXEC_DIRETO_A_SEGUIR ;
Procedure EXEC_DIRETO_REM_VOLATEIS ;
Procedure EXEC_DIRETO_REM_VOLATEIS_REM_RELOGIO ;
Procedure EXEC_DIRETO_REM_VOLATEIS_REM_RELOGIO_REM_SEREIA ;
Procedure EXEC_DIRETO_REM_TUDO_LIGHT_REM_SEREIA ;
Procedure EXEC_DIRETO_REM_TUDO_LIGHT ;
Procedure EXEC_DIRETO_REM_VOLATEIS_LOGO_MARCA ;
Procedure EXEC_DIRETO_REM_VOLATEIS_SEM_LOGO ;
Procedure EXEC_DIRETO_REM_VOLATEIS_E_SEREIA ;
Procedure EXEC_DIRETO_WHATSAPP ;
Procedure EXEC_DIRETO_REMOVER_RELOGIO ;
Procedure EXEC_DIRETO_ALTERNAR_RELOGIO ;
Procedure EXEC_DIRETO_ATIVAR_RELOGIO_REAL ;
Procedure EXEC_DIRETO_ATIVAR_RELOGIO_FAKE ( Horario : String ) ;
Procedure EXEC_DIRETO_ATIVAR_E_EXIBIR_RELOGIO_FAKE ( Horario : String ) ;
Procedure EXEC_DIRETO_RELOGIO_ON ;
Procedure EXEC_DIRETO_RELOGIO_OFF ;
Procedure EXEC_INICIALIZAR_CHAMADA_MARCA ;
Procedure EXEC_INICIALIZAR_CHAMADA_VIVO ;
Procedure EXEC_DIRETO_REM_VOLATEIS_ADD_RELOGIO ;
Procedure EXEC_DIRETO_SOMENTE_RELOGIO ;
Procedure EXEC_DIRETO_RELOGIO_SEREIA ;
Procedure EXEC_DIRETO_JORNAL_INICIALIZACAO ;
Procedure EXEC_DIRETO_APAGAR_TUDO ;
//Procedure EXEC_DIRETO_APAGAR_VOLATEIS ;
Procedure EXEC_DIRETO_FICHA_CURTA ;
Procedure EXEC_DIRETO_FICHA_LONGA ;
Procedure EXEC_DIRETO_SEREIA_VIVO ;
Procedure EXEC_DIRETO_SEREIA_MARCA ;
Procedure EXEC_DIRETO_SEREIA_ESCONDE ;
Procedure EXEC_DIRETO_ULTIMA_TARJA_FIXA ;
Procedure EXEC_DIRETO_TELEFONE ( Telefone : String ) ;
Procedure EXEC_DIRETO_INFORMACAO ( Informacao1, Informacao2 : String ) ;
Procedure EXEC_DIRETO_SELO_NEUTRO ( Selo : LongInt ) ;
Procedure EXEC_DIRETO_RELOGIO_SEM_SEREIA ;
Procedure EXEC_DIRETO_VEM_VEM ;

Implementation

{$R *.dfm}

uses T_Futebol ,
     Tipos_GC_U ,
     {$IFDEF NW}
     Config_GC_U,
     {$ENDIF}
{$IFDEF USAR_CHYRON}
     Acoes_U,
{$ENDIF}
     Main ;

Procedure CHYRON_BASICO_REFRESH_TESTE_LINK_LAN ( Forcado : LongInt ) ;
Begin
If CHYRON_VAR_SP_Testar_Link_LAN > 0 Then Begin
   If Forcado = 0 Then Begin
      CHYRON_VAR_Tick_Next_Teste_Link_LAN := GetTickCount + Cardinal(CHYRON_VAR_SP_Testar_Link_LAN * 1000)
   End Else Begin
      CHYRON_VAR_Tick_Next_Teste_Link_LAN := GetTickCount + Cardinal(Forcado * 1000) ;
   End ;
End ;
End ;

Procedure CHYRON_BASICO_REFRESH_TESTE_LINK_WAN ( Forcado : LongInt ) ;
Begin
If CHYRON_VAR_SP_Testar_Link_WAN > 0 Then Begin
   If Forcado = 0 Then Begin
      CHYRON_VAR_Tick_Next_Teste_Link_WAN := GetTickCount + Cardinal(CHYRON_VAR_SP_Testar_Link_WAN * 1000)
   End Else Begin
      CHYRON_VAR_Tick_Next_Teste_Link_WAN := GetTickCount + Cardinal(Forcado * 1000) ;
   End ;
End ;
End ;

Function CHYRON_BASICO_GET_EFEITO_IN : String ;
Begin
End ;

Function CHYRON_BASICO_GET_EFEITO_OUT : String ;
Begin
End ;

Function CHYRON_BASICO_GET_DESCRICAO_ERRO ( Key : String ) : String ;
Var Local : LongInt ;
    Qtde  : LongInt ;
Begin
Key := UpperCase ( Key ) ;
Qtde := Length ( Array_Erros_Chyron ) ;
If Qtde = 0 Then Begin
   Exit ;
End ;
While Length ( Key ) < 8 Do Begin
   Key :=  '0' + Key ;
End ;
For Local := 0 To Qtde - 1 Do Begin
   If Array_Erros_Chyron[Local].Key = Key Then Begin
      Result := Array_Erros_Chyron[Local].Valor ;
      Exit ;
   End ;
End ;
Result := '<INDEF-1>' ;
End ;

Procedure CHYRON_BASICO_TRATAR_ERRO_CHYRON ( Erro : String ) ;
Begin
PUT_LOG ( 'Erro {' + Erro + '}' ) ;
PUT_LOG ( 'String Erro {' + CHYRON_BASICO_GET_DESCRICAO_ERRO ( Erro ) + '}' ) ;
End ;

Function CHYRON_BASICO_GET_BUFFER_FRAME : String ;
Begin
If CHYRON_VAR_FRAME_BUFFER = 0 Then Begin // VGA
   Result := '\0' ;
End Else If CHYRON_VAR_FRAME_BUFFER = 1 Then Begin // FB-1
   Result := '\1' ;
End Else If CHYRON_VAR_FRAME_BUFFER = 2 Then Begin // FB-2
   Result := '\2' ;
End Else Begin
   Result := '\0' ;
End ;
End ;

Function CHYRON_BASICO_GET_DISPLAY_MODE : String ;
Begin
If CHYRON_VAR_FRAME_BUFFER = 0 Then Begin // VGA
   Result := '\0' ;
End Else Begin
   Result := '\1' ;
End ;
End ;

Function CHYRON_BASICO_GET_TEMPLATE : String ;
Begin
Result := '\' + IntToStr ( CHYRON_VAR_SP_Template_Existente ) ;
End ;

Function CHYRON_BASICO_GET_NEW_TEMPLATE : String ;
Begin
Result := '\' + IntToStr ( CHYRON_VAR_SP_Novo_Template ) ;
End ;

procedure TChyron_Basico.Bot_AbortarClick(Sender: TObject);
begin
//CHYRON_BASICO_ABORTAR_PLAY ( 'Main/Bot_Abortar' ) ;
end;

Procedure CHYRON_BASICO_ATUALIZAR_STATUS_INFORMACOES ;
Var Aux : String ;
Begin
Aux := 'Now=' + DateTimeToStr(Now) + sLineBreak +
       'Server_TCP.Active=' + IFSN(Chyron_Basico.Server_TCP.Active) + sLineBreak +
       'Server_TCP.Host=' + IntToStr(Chyron_Basico.Server_TCP.Port) + sLineBreak +
       'Server_TCP.Conexoes=' + IntToStr(Chyron_Basico.Server_TCP.Socket.ActiveConnections) + sLineBreak +
       'Telnet.Active=' + IFSN(Chyron_Basico.Telnet_Chyron.Active) + sLineBreak +
       'Telnet.Host=' + Chyron_Basico.Telnet_Chyron.Host + sLineBreak +
       'Telnet.Port=' + IntToStr(Chyron_Basico.Telnet_Chyron.Port) + sLineBreak ;
Chyron_Basico.ME_Informacoes.Text :=  Aux ;
End ;

procedure TChyron_Basico.Bot_Abrir_IIClick(Sender: TObject);
begin
If OpenDialog_Script.InitialDir = '' Then Begin
   OpenDialog_Script.InitialDir := Diretorio + 'Config\Scripts' ;
   CHECAR_DIRETORIO_DIRNAME ( OpenDialog_Script.InitialDir ) ;
End ;
If OpenDialog_Script.Execute Then Begin
   If RR_FileExists ( 'TChyron_Basico.Bot_Abrir_IIClick',
                      OpenDialog_Script.FileName ) Then Begin
      Try
         ME_II.Lines.Text := GET_CONTEUDO_M ( 'TChyron_Basico.Bot_Abrir_IIClick',
                                              OpenDialog_Script.FileName ) ;
         PN_FileName_II.Caption := OpenDialog_Script.FileName ;
      Except
      End ;
   End ;
End ;
End ;

procedure TChyron_Basico.Bot_Abrir_Script_VBClick(Sender: TObject);
begin
Timer_Inatividade := Now ;
If OpenDialog_Script.InitialDir = '' Then Begin
   OpenDialog_Script.InitialDir := Diretorio + 'Config\Scripts' ;
   CHECAR_DIRETORIO_DIRNAME ( OpenDialog_Script.InitialDir ) ;
End ;
If OpenDialog_Script.Execute Then Begin
   If RR_FileExists ( 'TChyron_Basico.Bot_Abrir_Script_VBClick',
                      OpenDialog_Script.FileName ) Then Begin
      Try
         ME_VB.Lines.Text :=
             GET_CONTEUDO_M ( 'TChyron_Basico.Bot_Abrir_Script_VBClick',
                              OpenDialog_Script.FileName ) ;
         PN_FileName_VB.Caption := OpenDialog_Script.FileName ;
      Except
      End ;
   End ;
End ;
End ;

procedure TChyron_Basico.Bot_Atualizar_InformacoesClick(Sender: TObject);
begin
CHYRON_BASICO_ATUALIZAR_STATUS_INFORMACOES ;
end;

procedure TChyron_Basico.Bot_Clear_CanvasClick(Sender: TObject);
begin
//CHYRON_BASICO_CLEAR_CANVAS ( 'Bot_Clear_Canvas' ) ; ;
end;

procedure TChyron_Basico.Bot_Clear_FB1Click(Sender: TObject);
begin
EXECUTE_PLAY_CHYRON_OUT_GC ( -2, 'CLEAR_FB1', 0, '', '', '', '', '', 'CLEAR_FB1/A' ) ;
end;

procedure TChyron_Basico.Bot_Comando_DiretoClick(Sender: TObject);
begin
//CHYRON_BASICO_COMANDO_DIRETO ( 'Bot_Comando_Direto', ED_Comando.Text ) ;
end;

procedure TChyron_Basico.Bot_ConectarClick(Sender: TObject);
begin
CHYRON_BASICO_CONEXAO_TELNET ;
end;

procedure TChyron_Basico.Bot_ContinuarClick(Sender: TObject);
begin
//CHYRON_BASICO_CONTINUAR_PLAY ( 'Bot_Continuar' ) ;
end;

procedure TChyron_Basico.Bot_Enviar_Script_IIClick(Sender: TObject);
begin
{$IFDEF USAR_CHYRON}
Acao_Script_Str := Trim ( ME_II.Text ) ;
EXECUTE_ACAO ( ACAO_SCRIPT, EXECUTAR_TRUE, 0, Array_Strings, 'Enviar_Script_II' ) ;
//CHYRON_SCRIPT_CORE_NEW ( 'Bot_Enviar_Script_II', Trim ( ME_II.Text ), MACRO_TRUE ) ;
{$ENDIF}
end;

procedure TChyron_Basico.Bot_Enviar_Script_VBClick(Sender: TObject);
begin
{$IFDEF USAR_CHYRON}
Timer_Inatividade := Now ;
//CHYRON_SCRIPT_CORE_NEW ( 'Bot_Enviar_VB' , Trim ( ME_VB.Text ), MACRO_TRUE ) ;
Acao_Script_Str := Trim ( ME_VB.Text ) ;
EXECUTE_ACAO ( ACAO_SCRIPT, EXECUTAR_TRUE, 0, Array_Strings, 'Bot_Enviar_Script_VB' ) ;
{$ENDIF}
end;

procedure TChyron_Basico.Bot_LimparClick(Sender: TObject);
begin
ME_Scripts_Enviados2.Lines.Clear ;
end;

procedure TChyron_Basico.Bot_Limpar_FB2Click(Sender: TObject);
begin
EXECUTE_PLAY_CHYRON_OUT_GC ( -2, 'CLEAR_FB2', 0, '', '', '', '', '', 'CLEAR_FB2/A' ) ;
end;

procedure TChyron_Basico.Bot_PlayClick(Sender: TObject);
begin
//CHYRON_BASICO_PLAY ( 'Bot_Play' ) ;
end;

procedure TChyron_Basico.Bot_Play_FB1Click(Sender: TObject);
begin
//CHYRON_BASICO_PLAY_FB1 ( 'Bot_Play_FB1' ) ;
end;

procedure TChyron_Basico.Bot_Play_FB2Click(Sender: TObject);
begin
//CHYRON_BASICO_PLAY_FB2 ( 'Bot_Play_FB2' ) ;
end;

procedure TChyron_Basico.Bot_Read_MessageClick(Sender: TObject);
begin
//CHYRON_BASICO_READ_MESSAGE ( 'Bot_Read_Message' ) ;
end;

procedure TChyron_Basico.Bot_Read_Update_FB1Click(Sender: TObject);
begin
//CHYRON_BASICO_READ_UPDATE_FB1 ( 'Bot_Read_Update_FB1' ) ;
end;

procedure TChyron_Basico.Bot_Read_Update_FB2Click(Sender: TObject);
begin
//CHYRON_BASICO_READ_UPDATE_FB2 ( 'Bot_Read_Update_FB2' ) ;
end;

Procedure SALVAR_ME_VB ;
Begin
Try
   CHECAR_DIRETORIO_FILENAME ( Chyron_Basico.PN_FileName_VB.Caption ) ;
   Chyron_Basico.ME_VB.Lines.SaveToFile ( Chyron_Basico.PN_FileName_VB.Caption ) ;
   PUT_LOG ( 'SALVAR_ME_VB [' + Chyron_Basico.PN_FileName_VB.Caption + ']' ) ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception SALVAR_ME_VB [' + Chyron_Basico.PN_FileName_VB.Caption + ']' +
                '[' + E.Message + ']' ) ;
   End ;
End ;
End ;

Procedure SALVAR_ME_II ;
Begin
Try
   CHECAR_DIRETORIO_FILENAME ( Chyron_Basico.PN_FileName_II.Caption ) ;
   Chyron_Basico.ME_II.Lines.SaveToFile ( Chyron_Basico.PN_FileName_II.Caption ) ;
   PUT_LOG ( 'SALVAR_ME_II [' + Chyron_Basico.PN_FileName_II.Caption + ']' ) ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception SALVAR_ME_II [' + Chyron_Basico.PN_FileName_II.Caption + ']' +
                '[' + E.Message + ']' ) ;
   End ;
End ;
End ;

procedure TChyron_Basico.Bot_Salvar_Como_Script_VBClick(Sender: TObject);
begin
Timer_Inatividade := Now ;
If SaveDialog_Script.InitialDir = '' Then Begin
   SaveDialog_Script.InitialDir := Diretorio + 'Config\Scripts' ;
   CHECAR_DIRETORIO_DIRNAME ( SaveDialog_Script.InitialDir ) ;
End ;
If SaveDialog_Script.Execute Then Begin
   PN_FileName_VB.Caption := SaveDialog_Script.FileName ;
   SALVAR_ME_VB ;
End ;
End ;

procedure TChyron_Basico.Bot_Salvar_II_ComoClick(Sender: TObject);
begin
If SaveDialog_Script.InitialDir = '' Then Begin
   SaveDialog_Script.InitialDir := Diretorio + 'Config\Scripts' ;
   CHECAR_DIRETORIO_DIRNAME ( SaveDialog_Script.InitialDir ) ;
End ;
If SaveDialog_Script.Execute Then Begin
   PN_FileName_II.Caption := SaveDialog_Script.FileName ;
   SALVAR_ME_II ;
End ;
End ;

Procedure TChyron_Basico.COMANDO_CHYRON_MSG_DIRETO ( Origem : String ; _Msg : LongInt ) ;
Var Script : String ;
Begin
Script := 'Lyric.Message ' + IntToStr ( _Msg ) + sLineBreak +
          'Lyric.Read' ;
CHYRON_SCRIPT_CORE_NEW2 ( 'COMANDO_CHYRON_DIRETO/' + Origem + '/' + IntToStr(_Msg),
                          Script, MACRO_TRUE ) ;
End  ;

Procedure TChyron_Basico.SELECIONAR_BROWSER ( Browser : String ) ;
Var Script : String ;
Begin
Script := GET_VB_OPEN_BROWSER ( 'Bot_Selecionar_Browser', Browser ) ;
CHYRON_BASICO_ENVIAR_SCRIPT ( 'Bot_Selecionar_Browser/' + Browser , Script, 'Selecionar_Browser' ) ;
End ;

procedure TChyron_Basico.Bot_Selecionar_BrowserClick(Sender: TObject);
Var //Script : String ;
    DSNName : String ;
Begin
If CB_Jornal.ItemIndex = -1 Then Begin
   ShowMessage ( 'Jornal não selecionado' ) ;
   Exit ;
End ;
DSNName := CB_Jornal.Items[CB_Jornal.ItemIndex] + '_2018' ;
SELECIONAR_BROWSER ( DSNName ) ;
End ;

Procedure ATIVAR_TRANSICAO ( Msg : LongInt ; Cena, Transicao : String ;
                             Var Script : String ; Jornal : String ) ;
Var FB     : LongInt ;
Begin
FB := TIPOS_GC_GET_FB_POR_MSG ( Msg ) ;
Script := Script + GET_VB_TRANSICAO ( 'ATIVAR_TRANSICAO/'+Cena+'/'+Transicao, FB, Msg,
                   Cena, Transicao, Jornal ) ;
If CHYRON_FLAG_ENVIAR_SCRIPT Then Begin
   CHYRON_BASICO_ENVIAR_SCRIPT ( 'ATIVAR_TRANSICAO/' + Cena + '/' + Transicao ,
                                 Script, 'ATIVAR_TRANSICAO' ) ;
   Script := '' ;
End ;
End ;

Procedure ATIVAR_MSG_SENAO ( Msg : LongInt ; Var Script : String ;
                             Jornal : String ; Cena : String ) ;
Var FB     : LongInt ;
Begin
FB := TIPOS_GC_GET_FB_POR_MSG ( Msg ) ;
Script := Script + GET_VB_ATIVAR_MSG_SENAO ( 'ATIVAR_MSG_SENAO', FB, Msg, Jornal, Cena ) ;
If CHYRON_FLAG_ENVIAR_SCRIPT Then Begin
   CHYRON_BASICO_ENVIAR_SCRIPT ( 'ATIVAR_MSG_SENAO/' + IntToStr(FB) + '/' + IntToStr(Msg) ,
                                 Script, 'ATIVAR_MSG_SENAO' ) ;
   Script := '' ;
End ;
End ;

procedure TChyron_Basico.Bot_Selecionar_DiretorioClick(Sender: TObject);
Var Dir : String ;
Begin
Dir :=  ED_Drive.Text + '\' + ED_Diretorio.Text ;
//CHYRON_BASICO_SELECIONAR_DIRETORIO ( 'Bot_Selecionar_Diretorio [' + Dir + ']', Dir ) ;
end;

procedure TChyron_Basico.Bot_Teste_Comunicacao_ChyronClick(Sender: TObject);
begin
CHYRON_BASICO_TESTE_DE_COMUNICACAO_LAN ( TRUE, CK_Conexao_LAN, PN_Link_LAN ) ;
CHYRON_BASICO_TESTE_DE_COMUNICACAO_WAN ( TRUE, CK_Conexao_WAN, PN_Link_WAN ) ;
end;

procedure TChyron_Basico.Bot_Carregar_Menssage_CompostaClick(Sender: TObject);
Var Script : String ;
begin
Script := '' ;
{
READ_UPDATE_PLAY ( SP_Mensagem_Direta.Value ,
                   ED_Campo_Direto_1.Text, ED_Valor_Direto_1.Text,
                   ED_Campo_Direto_2.Text, ED_Valor_Direto_2.Text,
                   ED_Campo_Direto_3.Text, ED_Valor_Direto_3.Text,
                   ED_Campo_Direto_4.Text, ED_Valor_Direto_4.Text,
                   ED_Campo_Direto_5.Text, ED_Valor_Direto_5.Text,
                   1, Script,
                   Nome_CB_Jornal ) ;
}
end;

procedure TChyron_Basico.Bot_Carregar_MessageClick(Sender: TObject);
begin
EXECUTE_PLAY_CHYRON_OUT_GC ( -2, 'EXEC_READ', SP_Message.Value,
                             '', '', '', '', '', 'BOT_CARREGAR_MESSAGE' ) ;
end;

Procedure CHYRON_BASICO_CARREGAR_CONFIGURACAO ;
Var Ini : TMemIniFile ;
Begin
Ini := TMemIniFile.Create ( GET_FN_CONFIGURACAO ) ;
Chyron_Basico.CK_Conexao_LAN.Checked := TRUE ; // Ini.ReadBool ( 'GERAL', 'CK_CONEXAO_LAN', TRUE ) ;
Chyron_Basico.CK_Conexao_WAN.Checked := FALSE ; // Ini.ReadBool ( 'GERAL', 'CK_CONEXAO_WAN', TRUE ) ;
CHYRON_VAR_CK_Conexao_WAN := FALSE ; // Chyron_Basico.CK_Conexao_WAN.Checked ;
Chyron_Basico.SP_Testar_Link_LAN.Value := Ini.ReadInteger ( 'LINKS', 'SP_TESTAR_LINK_LAN', 60 ) ;
CHYRON_VAR_SP_Testar_Link_LAN := Chyron_Basico.SP_Testar_Link_LAN.Value ;
Chyron_Basico.SP_Testar_Link_WAN.Value := Ini.ReadInteger ( 'LINKS', 'SP_TESTAR_LINK_WAN', 60 ) ;
CHYRON_VAR_SP_Testar_Link_WAN := Chyron_Basico.SP_Testar_Link_WAN.Value ;
Ini.Free ;
CHYRON_BASICO_SALVAR_CONFIGURACAO ;
End ;

procedure CHYRON_BASICO_SALVAR_CONFIGURACAO ;
Var Ini : TMemIniFile ;
Begin
Ini := TMemIniFile.Create ( GET_FN_CONFIGURACAO ) ;
//
Ini.WriteString ( 'SYSTEM', 'NOW', DateTimeToStr(Now) ) ;
Ini.WriteString ( 'SYSTEM', 'TICK', IntToStr(GetTickCount) ) ;
//
Ini.WriteBool ( 'GERAL', 'CK_CONEXAO_LAN', Chyron_Basico.CK_Conexao_LAN.Checked ) ;
Ini.WriteBool ( 'GERAL', 'CK_CONEXAO_WAN', Chyron_Basico.CK_Conexao_WAN.Checked ) ;
CHYRON_VAR_CK_Conexao_WAN := Chyron_Basico.CK_Conexao_WAN.Checked ;
Ini.WriteInteger ( 'LINKS', 'SP_TESTAR_LINK_LAN', Chyron_Basico.SP_Testar_Link_LAN.Value ) ;
CHYRON_VAR_SP_Testar_Link_LAN := Chyron_Basico.SP_Testar_Link_LAN.Value ;
Ini.WriteInteger ( 'LINKS', 'SP_TESTAR_LINK_WAN', Chyron_Basico.SP_Testar_Link_WAN.Value ) ;
CHYRON_VAR_SP_Testar_Link_WAN := Chyron_Basico.SP_Testar_Link_WAN.Value ;
Ini.UpdateFile ;
Ini.Free ;
REFRESH_ARQUIVO ( GET_FN_CONFIGURACAO ) ;
End ;

procedure TChyron_Basico.CK_Conexao_LANClick(Sender: TObject);
begin
If NOT BOOT_OK Then
   Exit ;
CHYRON_BASICO_SALVAR_CONFIGURACAO ;
CHYRON_BASICO_TRATAR_CONEXAO_LAN_CHYRON ( CK_Conexao_LAN.Checked ) ;
end;

procedure TChyron_Basico.CK_Conexao_WANClick(Sender: TObject);
begin
If NOT BOOT_OK Then Begin
   Exit ;
End ;
CHYRON_BASICO_SALVAR_CONFIGURACAO ;
If CK_Conexao_WAN.Checked Then Begin
   CHYRON_VAR_Tick_Ping := GetTickCount + 1000 ;
End ;
End ;

procedure TChyron_Basico.CK_Limpar_Frame_BufferClick(Sender: TObject);
begin
CHYRON_VAR_LIMPAR_FB_ANTES := CK_Limpar_Frame_Buffer.Checked  ;
end;

procedure TChyron_Basico.CK_Responder_XClick(Sender: TObject);
begin
CHYRON_VAR_CK_Responder_X := CK_Responder_X.Checked ;
end;

procedure TChyron_Basico.ED_ComandoDblClick(Sender: TObject);
begin
//CHYRON_BASICO_COMANDO_DIRETO ( 'ED_Comando_DblClick', ED_Comando.Text ) ;
end;

procedure TChyron_Basico.FormCreate(Sender: TObject);
begin
Try
  //Server_TCP.Active := TRUE ;
Except
   On E : Exception Do Begin
      ShowMessage ( 'Ocorreu um erro durante a abertura da porta TCP ' + IntToStr(Server_TCP.Port) + '.' + LFLF +
                    'Verifique se esta porta está sendo utilizada por outro programa em execução.' + LFLF +
                    'Este erro não impedirá a execução deste software, mas acessos remotos (WAN) poderão ser afetados.' + LFLF +
                    E.Message ) ;
   End ;
End ;
ME_Scripts_Enviados2.Lines.Clear ;
ED_Campo_1.Text := 'Ricardo Ll' ;
ED_Campo_2.Text := 'Regis L2' ;
ED_Campo_3.Text := 'Teixeira L3' ;
ED_Campo_4.Clear ;
ED_Campo_5.Clear ;
ED_Campo_6.Clear ;
ED_Campo_7.Clear ;
ED_Campo_8.Clear ;
ED_Campo_9.Clear ;
ED_Campo_10.Clear ;
ED_Campo_Direto_1.Clear ;
ED_Campo_Direto_2.Clear ;
ED_Campo_Direto_3.Clear ;
ED_Campo_Direto_4.Clear ;
ED_Campo_Direto_5.Clear ;
ED_Valor_Direto_1.Clear ;
ED_Valor_Direto_2.Clear ;
ED_Valor_Direto_3.Clear ;
ED_Valor_Direto_4.Clear ;
ED_Valor_Direto_5.Clear ;
ED_Drive.Text := 'I:' ;
ED_Diretorio.Text := 'FUTEBOL CEARENSE\Messages' ;
ME_Informacoes.Align := alClient ;
ME_Informacoes.Lines.Clear ;
SP_Template_Existente.Value := DEF_TEMPLATE_ESCALACAO_MIN ;
end;

procedure TChyron_Basico.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
If Key = VK_F9 Then Begin
   If PC_VB_Script_Intelligent_Interface.ActivePage = TS_VB_Script Then Begin
      Bot_Enviar_Script_VB.Click
   End Else If PC_VB_Script_Intelligent_Interface.ActivePage = TS_II Then Begin
      Bot_Enviar_Script_II.Click ;
   End ;
   Key := 0 ;
End ;
end;

procedure TChyron_Basico.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
Timer_Inatividade := Now ;
end;

Function GET_FN_VB : String ;
Begin
Result := Diretorio + 'Config\Scripts\Script_Chyron.TXT' ;
End ;

Function GET_FN_II : String ;
Begin
Result := Diretorio + 'Config\Scripts\Intelligent Interface.TXT' ;
End ;

Procedure CARREGAR_ME_VB ;
Begin
Try
   CHECAR_DIRETORIO_FILENAME ( Chyron_Basico.PN_FileName_VB.Caption ) ;
   If NOT RR_FileExists ( 'CARREGAR_ME_VB', GET_FN_VB ) Then Begin
      WRITE_FILE_CORE ( 'CARREGAR_ME_VB', GET_FN_VB, Chyron_Basico.ME_VB.Text, DELAYED_FALSE ) ;
      Exit ;
   End ;
   Chyron_Basico.ME_VB.Lines.Text :=
         GET_CONTEUDO_M ( 'CARREGAR_ME_VB', Chyron_Basico.PN_FileName_VB.Caption ) ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception CARREGAR_SCRIPT_ME_CHYRON [' + Chyron_Basico.PN_FileName_VB.Caption + ']' +
                '[' + E.Message + ']' ) ;
   End ;
End ;
End ;

Procedure CARREGAR_ME_II ;
Begin
Try
   CHECAR_DIRETORIO_FILENAME ( Chyron_Basico.PN_FileName_II.Caption ) ;
   If NOT RR_FileExists ( 'CARREGAR ME_II', GET_FN_II ) Then Begin
      WRITE_FILE_CORE ( 'CARREGAR ME_II',
                        GET_FN_II, Chyron_Basico.ME_II.Text, DELAYED_FALSE ) ;
      Exit ;
   End ;
   Chyron_Basico.ME_II.Lines.Text :=
        GET_CONTEUDO_M ( 'CARREGAR ME_II', Chyron_Basico.PN_FileName_II.Caption ) ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception CARREGAR ME_II [' + Chyron_Basico.PN_FileName_II.Caption + ']' +
                '[' + E.Message + ']' ) ;
   End ;
End ;
End ;

procedure TChyron_Basico.FormShow(Sender: TObject);
begin
Caption := Title_RNews + ' - Chyron Básico' ;
PN_FileName_VB.Caption := GET_FN_VB ;
PN_FileName_II.Caption := GET_FN_II ;
CARREGAR_ME_VB ;
CARREGAR_ME_II ;
end;

procedure TChyron_Basico.LB_MessagesClick(Sender: TObject);
Var Aux  : String ;
    AuxL : LongInt ;
    FN   : String ;
    Reg  : T_GC ;
Begin
If LB_Messages.ItemIndex = -1 Then Begin
   Exit ;
End ;
Aux := LB_Messages.Items[LB_Messages.ItemIndex] ;
While Pos ( ' ', Aux ) > 0 Do Begin
   Delete ( Aux, Length ( Aux ) , 1 ) ;
End ;
AuxL := StrToIntDef ( Aux, 0 ) ;
SP_Message.Value := AuxL ;
SP_Template_Existente.Value := AuxL ;
SP_Mensagem_Direta.Value := AuxL ;
FN := Dir_J [1] + 'messages\' + StrZero ( AuxL, 4 ) + '.dat' ;
CHECAR_DIRETORIO_FILENAME ( FN ) ;
If NOT RR_FileExists ( 'TChyron_Basico.LB_MessagesClick', FN ) Then Begin
   WRITE_FILE_CORE ( 'TChyron_Basico.LB_MessagesClick',
                     FN, #13#10, DELAYED_FALSE ) ;
End ;
Try
   LB_Transicoes.Items.Text :=  GET_CONTEUDO_M ( 'TChyron_Basico.LB_MessagesClick', FN ) ;
Except
End ;
PUT_LOG ( 'DIR_JORNAL [' + FN + ']' ) ;
Reg := TIPOS_GC_SELECIONAR_REGISTRO_DE_MENSAGEM_DIRETA ( AuxL ) ;
PUT_LOG ( 'REG Msg[' + IntToStr(Reg.Msg) + '] ' +
          'C1[' + Reg.Campo[1] + '] ' +
          'C2[' + Reg.Campo[2] + '] ' +
          'C3[' + Reg.Campo[3] + '] ' +
          'C4[' + Reg.Campo[4] + '] ' +
          'C5[' + Reg.Campo[5] + ']' ) ;
If Reg.Msg > 0 Then Begin
   ED_Campo_Direto_1.Text := Reg.Campo[1] ;
   ED_Campo_Direto_2.Text := Reg.Campo[2] ;
   ED_Campo_Direto_3.Text := Reg.Campo[3] ;
   ED_Campo_Direto_4.Text := Reg.Campo[4] ;
   ED_Campo_Direto_5.Text := Reg.Campo[5] ;
   ED_Valor_Direto_1.Text := Reg.Valor[1] ;
   ED_Valor_Direto_2.Text := Reg.Valor[2] ;
   ED_Valor_Direto_3.Text := Reg.Valor[3] ;
   ED_Valor_Direto_4.Text := Reg.Valor[4] ;
   ED_Valor_Direto_5.Text := Reg.Valor[5] ;
End ;
End ;

Procedure TChyron_Basico.LB_Scripts_VBClick(Sender: TObject) ;
//Var Aux    : String ;
//    Script : String ;
Begin
(*
If LB_Scripts_VB.ItemIndex = -1 Then Begin
   Exit ;
End ;
Aux := LB_Scripts_VB.Items[LB_Scripts_VB.ItemIndex] ;
If Aux = 'FECHAR_NAO_PERSISTENTES' Then Begin
   VB_FECHAR_NAO_PERSISTENTES ( 1, TRUE, Script ) ;
   VB_FECHAR_NAO_PERSISTENTES ( 2, TRUE, Script ) ;
End Else If Aux = 'FECHAR_ATE_PERSISTENTES' Then Begin
   VB_FECHAR_ATE_PERSISTENTES ( 1, TRUE, Script ) ;
   VB_FECHAR_ATE_PERSISTENTES ( 2, TRUE, Script ) ;
End Else If Aux = 'GC' Then Begin
   VB_OUT ( 'GC', RD.RD_VAR_JORNAL ) ;
End Else If Aux = 'TARJA_1' Then Begin
   VB_OUT ( 'TARJA_1', RD.RD_VAR_JORNAL ) ;
End Else If Aux = 'TARJA_2' Then Begin
   VB_OUT ( 'TARJA_2', RD.RD_VAR_JORNAL )
End Else If Aux = 'FIXA' Then Begin
   VB_OUT ( 'FIXA', RD.RD_VAR_JORNAL ) ;
End ;
*)
End ;

procedure TChyron_Basico.LB_TransicoesClick(Sender: TObject);
//Var Scene      : String ;
//    Transition : String ;
begin
(*
If LB_Messages.ItemIndex = -1 Then Begin
   Exit ;
End ;
If LB_Transicoes.ItemIndex = -1 Then Begin
   Exit ;
End ;
Transition := LB_Transicoes.Items[LB_Transicoes.ItemIndex] ;
Scene := 'C' + IntToStr(SP_Message.Value) ;
Transition := Trim ( Transition ) ;
CHYRON_BASICO_EXEC_TRANSICAO ( Scene, Transition, RD.RD_VAR_JORNAL ) ;
*)
end;

procedure TChyron_Basico.ME_IIExit(Sender: TObject);
begin
SALVAR_ME_II ;
end;

procedure TChyron_Basico.ME_VBExit(Sender: TObject);
begin
SALVAR_ME_VB ;
end;

procedure TChyron_Basico.ME_VBKeyPress(Sender: TObject; var Key: Char);
begin
Timer_Inatividade := Now ;
end;

procedure TChyron_Basico.PC_TecnicaChange(Sender: TObject);
begin
Timer_Inatividade := Now ;
end;

procedure TChyron_Basico.PC_TecnicaMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
Timer_Inatividade := Now ;
end;

procedure TChyron_Basico.PN_FB_1Click(Sender: TObject);
begin
EXECUTE_PLAY_CHYRON_OUT_GC ( -2, 'SELECT_FB1', 0, '', '', '', '', '', 'PN_FB_1' ) ;
end;

procedure TChyron_Basico.PN_FB_2Click(Sender: TObject);
begin
EXECUTE_PLAY_CHYRON_OUT_GC ( -2, 'SELECT_FB2', 0, '', '', '', '', '', 'PN_FB_2' ) ;
end;

procedure TChyron_Basico.PN_FB_VGAClick(Sender: TObject);
begin
CHYRON_BASICO_SELECIONAR_FRAME_BUFFER ( 0, PN_FB_VGA, PN_FB_1, PN_FB_2 ) ;
CHYRON_BASICO_DEFINIR_FRAME_BUFFER ( 'PN_FB_VGAClick' ) ;
end;

procedure TChyron_Basico.PortaPortClose(Sender: TObject);
begin
_Debug ( 'TChyron_Basico.PortaPortClose ' +
         'COM[' + IntToStr ( Porta.ComNumber ) + '] ' +
         'Baud[' + IntToStr(Porta.Baud) + ']' ) ;
end;

procedure TChyron_Basico.PortaPortOpen(Sender: TObject);
begin
_Debug ( 'TChyron_Basico.PortaPortOpen ' +
         'COM[' + IntToStr ( Porta.ComNumber ) + '] ' +
         'Baud[' + IntToStr(Porta.Baud) + ']' ) ;
end;

Procedure TChyron_Basico.PortaTriggerAvail(CP: TObject; Count: Word) ;
Var Aux      : String ;
    Contador : LongInt ;
Begin
Aux := '' ;
Contador := 0 ;
While Porta.CharReady Do Begin
   Aux := Aux + Porta.GetChar ;
   Inc ( Contador ) ;
End ;
PUT_LOG ( 'IN Serial ' +
          'Cnt[' + IntToStr(Count) + '] ' +
          'Contador[' + IntToStr(Contador) + '] ' +
          'RX[' + Aux + ']' ) ;
TRATAR_RX_CHYRON ( 'Porta.TriggerAvail', Aux ) ;
End ;

procedure TChyron_Basico.PortaTriggerLineError(CP: TObject; Error: Word;
  LineBreak: Boolean);
begin
_Debug ( 'TChyron_Basico.PortaTriggerLineError ' +
         'Error[' + IntToStr ( Error ) + '] ' +
         'LineBreak[' + IFSN ( LineBreak ) + '] ' +
         'COM[' + IntToStr ( Porta.ComNumber ) + '] ' +
         'Baud[' + IntToStr(Porta.Baud) + ']' ) ;
end;

procedure TChyron_Basico.Server_TCPAccept(Sender: TObject; Socket: TCustomWinSocket) ;
Begin
PUT_LOG ( 'TChyron_Basico.Server_TCPAccept' ) ;
CHYRON_BASICO_REFRESH_TESTE_LINK_LAN ( 0 ) ;
CHYRON_BASICO_REFRESH_TESTE_LINK_WAN ( 0 ) ;
End ;

procedure TChyron_Basico.Server_TCPClientConnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
_Debug ( 'TChyron_Basico.Server_TCPClientConnect' ) ;
PUT_LOG ( 'Server/Cliente Conectado' ) ;
end;

procedure TChyron_Basico.Server_TCPClientDisconnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
PUT_LOG ( 'TChyron_Basico.Server_TCPClientDisconnect' ) ;
end;

procedure TChyron_Basico.Server_TCPClientError(Sender: TObject;
  Socket: TCustomWinSocket; ErrorEvent: TErrorEvent; var ErrorCode: Integer);
begin
PUT_LOG ( 'TChyron_Basico.Server_TCPClientError Error[' + IntToStr(ErrorCode) + ']' ) ;
ErrorCode := 0 ;
end;

Procedure TRATAR_COMANDO_RECEBIDO ( Origem, Aux : String ) ;
Var Matriz     : TArray ;
    Local      : LongInt ;
    Qtde       : LongInt ;
    Tick_Local : Cardinal ;
Begin
_Debug ( 'TRATAR_COMANDO_RECEBIDO Or[' + Origem + '][' + Aux + ']' ) ;
Tick_Local := GetTickCount ;
Matriz := Explode2 ( '@@@' , Aux , 0 ) ;
Qtde := Length ( Matriz ) ;
If Qtde > 0 Then Begin
   For Local := 0 To Qtde - 1 Do Begin
      //PUT_LOG ( Origem + '/' + IntToStr(Local+1) + ' [' + Matriz[Local] + ']' ) ;
   End ;
End ;
//TRATAR_RETORNO_CHYRON ( TRUE, Aux ) ;
Tick_Local := GetTickCount - Tick_Local ;
if Tick_Local > DEF_TIMEOUT_PROC Then Begin
   PUT_LOG ( 'PROC/TRATAR_COMANDO_RECEBIDO [' + IntToStr(Tick_Local) ) ;
End ;
End ;

procedure TChyron_Basico.Server_TCPClientRead(Sender: TObject; Socket: TCustomWinSocket);
Var Aux    : String ;
Begin
Aux := Socket.ReceiveText ;
PUT_LOG ( 'SRx[' + Aux + ']' ) ;
If Socket.RemoteHost <> 'ricardo-pc' Then Begin
   //TRATAR_COMANDO_RECEBIDO ( 'Server/RX [Remoto ' + Socket.RemoteHost + ']', Aux ) ;
   TRATAR_COMANDO_RECEBIDO ( 'Server/RX', Aux ) ;
End ;
If CHYRON_VAR_CK_Responder_X Then Begin
   //RRCT FUTEBOL TRATAR_RETORNO_CHYRON ( FALSE, Aux ) ;
End ;
end;

procedure TChyron_Basico.Server_TCPClientWrite(Sender: TObject;
  Socket: TCustomWinSocket);
begin
PUT_LOG ( 'Server/Write [Porta ' + IntToStr(Server_TCP.Port) + ']' ) ;
End ;

procedure TChyron_Basico.Server_TCPGetSocket ( Sender: TObject; Socket: NativeInt;
                                               var ClientSocket: TServerClientWinSocket);
begin
PUT_LOG ( 'Server/GetSocket [Porta ' + IntToStr(Server_TCP.Port) + ']' ) ;
end;

procedure TChyron_Basico.Server_TCPListen ( Sender: TObject;
                                            Socket: TCustomWinSocket);
begin
PUT_LOG ( 'Server/Listen [Porta ' + IntToStr(Server_TCP.Port) + ']' ) ;
end;

procedure TChyron_Basico.SP_Novo_TemplateChange(Sender: TObject);
begin
CHYRON_VAR_SP_Novo_Template := SP_Novo_Template.Value ;
end;

Procedure TChyron_Basico.SP_Novo_TemplateClick(Sender: TObject) ;
Begin
CHYRON_VAR_SP_Novo_Template := SP_Novo_Template.Value ;
End ;

Procedure TChyron_Basico.SP_Template_ExistenteChange(Sender: TObject) ;
Begin
CHYRON_VAR_SP_Template_Existente := SP_Template_Existente.Value ;
End ;

procedure TChyron_Basico.SP_Template_ExistenteClick(Sender: TObject);
begin
CHYRON_VAR_SP_Template_Existente := SP_Template_Existente.Value ;
end;

procedure TChyron_Basico.SP_Testar_Link_LANClick(Sender: TObject);
begin
If NOT BOOT_OK Then Begin
   Exit ;
End ;
CHYRON_BASICO_SALVAR_CONFIGURACAO ;
End;

procedure TChyron_Basico.SP_Testar_Link_WANClick(Sender: TObject);
begin
If NOT BOOT_OK Then Begin
   Exit ;
End ;
CHYRON_BASICO_SALVAR_CONFIGURACAO ;
End ;

procedure TChyron_Basico.Telnet_ChyronConnect(Sender: TObject; Socket: TCustomWinSocket);
Var Aux : String ;
Begin
Aux := 'Conectado ao Chyron em ' + Socket.RemoteHost + ':' + IntToStr ( Socket.RemotePort ) ;
PUT_LOG ( Aux ) ;
End ;

procedure TChyron_Basico.Telnet_ChyronConnecting(Sender: TObject; Socket: TCustomWinSocket);
Var Aux : String ;
Begin
Aux := 'Telnet/Connecting ' + Telnet_Chyron.Host + ':' + IntToStr ( Telnet_Chyron.Port ) ;
PUT_LOG_CHYRON ( Aux ) ;
PUT_LOG ( Aux ) ;
End ;

procedure TChyron_Basico.Telnet_ChyronDisconnect(Sender: TObject;
  Socket: TCustomWinSocket);
Var Aux : String ;
Begin
Aux := 'Telnet/Disconnecting ' + Telnet_Chyron.Host + ':' + IntToStr ( Telnet_Chyron.Port ) ;
PUT_LOG_CHYRON ( Aux ) ;
PUT_LOG ( Aux ) ;
End ;

procedure TChyron_Basico.Telnet_ChyronError(Sender: TObject; Socket: TCustomWinSocket;
  ErrorEvent: TErrorEvent; var ErrorCode: Integer);
Var Aux : String ;
Begin
Aux := 'Erro ' + IntToStr ( ErrorCode ) + ' conectando ao servidor Chyron em ' +
       Telnet_Chyron.Host + ':' + IntToStr ( Telnet_Chyron.Port ) ;
//If ErrorCode = 10060 Then
//   Flag_Reconectar := TRUE ;
//ShowMessage ( ErrorEvent ) ;
PUT_LOG_CHYRON ( Aux ) ;
PUT_LOG ( Aux ) ;
ErrorCode := 0 ;
End ;

procedure TChyron_Basico.Telnet_ChyronLookup(Sender: TObject;
  Socket: TCustomWinSocket);
Var Aux : String ;
Begin
Aux := 'Telnet/OnLookup ' + Telnet_Chyron.Host + ':' + IntToStr ( Telnet_Chyron.Port ) ;
PUT_LOG_CHYRON ( Aux ) ;
PUT_LOG ( Aux ) ;
End ;

Procedure TChyron_Basico.TRATAR_RX_CHYRON ( Origem : String ; Aux : String ) ;
Var Matriz : TArray ;
    Qtde   : LongInt ;
    Local  : LongInt ;
Begin
//PUT_LOG ( 'TELNET_RX(' + IntToStr(Length(Aux)) + ')[' + Aux + ']' ) ;
_Debug ( 'INI TRATAR_RX_CHYRON Or[' + Origem + '][' + Aux + ']' ) ;
If Pos ( '000041d6', Aux ) > 0 Then Begin
   Flag_Chyron_Erro_de_Macro := TRUE ;
End Else Begin
   Flag_Chyron_Erro_de_Macro := FALSE ;
End ;
Try
   Matriz := Explode2 ( '@@@' , Aux , 0 ) ;
   Qtde := Length ( Matriz ) ;
   If Qtde > 0 Then Begin
      For Local := 0 To Qtde - 1 Do Begin
         Inc ( Cnt_Telnet_Log ) ;
         If Assigned ( SL_Log_Telnet ) Then Begin
            SL_Log_Telnet.Add ( 'TRx/' + IntToStr ( Cnt_Telnet_Log ) +
                                '[' + IntToStr ( Local+1 ) + '/' + IntToStr(Qtde) + ']' +
                                Matriz[Local] ) ;
            End ;
      End ;
   End ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception TRATAR_RX_CHYRON [' + E.Message + ']' ) ;
   End ;
End ;
//TRATAR_COMANDO_RECEBIDO ( 'Telnet/RX [' + Socket.RemoteHost + ']' , Aux ) ;
End ;

procedure TChyron_Basico.Telnet_ChyronRead(Sender: TObject; Socket: TCustomWinSocket);
Var Aux : String ;
Begin
Aux := Socket.ReceiveText ;
TRATAR_RX_CHYRON ( 'TELNET_Chyron.Read', Aux ) ;
PUT_LOG_EVENTO ( Log.LB_Aplicacao_1, Log.CK_Rolagem.Checked,
                 TimeToStr ( Now ) + ' ' +
                 'RX CHYRON TELNET ' + IntToStr ( Cnt_Log_Aplicacao_1 ) + ' ' +
                 '{' + Aux + '}' ) ;
_Debug ( 'Telnet_Chyron.Read [' + Aux + ']' ) ;
//If Socket.RemoteHost <> 'ricardo-pc' Then Begin
//End ;
End ;

procedure TChyron_Basico.Telnet_ChyronWrite(Sender: TObject; Socket: TCustomWinSocket);
Var Aux : String ;
Begin
Aux := 'Telnet_Chyron.Write ' + Telnet_Chyron.Host + ':' + IntToStr ( Telnet_Chyron.Port ) ;
PUT_LOG ( Aux ) ;
End ;

Function CHYRON_BASICO_PORTA_ATIVA : Boolean ;
Begin
Result := Chyron_Basico.Telnet_Chyron.Active ;
End ;

Procedure CHYRON_BASICO_PORTA_WRITE_STRING_SIMPLES ( _String : String ; Origem : String ) ;
Begin
_Debug ( 'INI CHYRON BASICO_PORTA_WRITE_STRING_SIMPLES Or[' + Origem + '][' + _String + ']' ) ;
If VAR_SERIAL_ATIVA = 1 Then Begin
   If Chyron_Basico.Porta.Open Then Begin
      Chyron_Basico.Porta.PutString ( _String ) ;
      PUT_LOG_EVENTO ( Log.LB_Aplicacao_1, Log.CK_Rolagem.Checked,
                       TimeToStr ( Now ) + ' ' +
                       'TX CHYRON SIMPLES SERIAL ' + IntToStr ( Cnt_Log_Aplicacao_1 ) + ' ' +
                       '{' + _String + '}' ) ;
      Exit ;
   End ;
End ;
If VAR_TELNET_ATIVO = 1 Then Begin
   _Debug ( '1 CHYRON BASICO_PORTA_WRITE_STRING_SIMPLES' ) ;
   If NOT Chyron_Basico.Telnet_Chyron.Active Then Begin
      _Debug ( 'Exit/2 !Telnet.Active CHYRON BASICO_PORTA_WRITE_STRING_SIMPLES' ) ;
      Exit ;
   End ;
   _Debug ( '2 CHYRON BASICO_PORTA_WRITE_STRING_SIMPLES' ) ;
   If Application.Terminated Then Begin
      Exit ;
   End ;
   Try
      _Debug ( '4 SendText [' + _String + ']' ) ;
      Chyron_Basico.Telnet_Chyron.Socket.SendText ( _String ) ;
      PUT_LOG_EVENTO ( Log.LB_Aplicacao_1, Log.CK_Rolagem.Checked,
                       TimeToStr ( Now ) + ' ' +
                       'TX CHYRON SIMPLES TELNET ' + IntToStr ( Cnt_Log_Aplicacao_1 ) + ' ' +
                       '{' + _String + '}' ) ;
      _Debug ( '5 CHYRON BASICO_PORTA_WRITE_STRING_SIMPLES' ) ;
   Except
      On E : Exception Do Begin
         //PUT_LOG ( 'Exception SEND_LAN [' + E.Message + ']' ) ;
      End ;
   End ;
   Exit ;
End ;
_Debug ( 'FIM CHYRON BASICO_PORTA_WRITE_STRING_SIMPLES' ) ;
End ;

Procedure CHYRON_BASICO_CONEXAO_TELNET_SE_CLOSED ;
Begin
If Chyron_Basico.Porta.Open Then Begin
   Exit ;
End ;
If VAR_TELNET_ATIVO <> 1 Then Begin
   Exit ;
End ;
Try
   If NOT Chyron_Basico.Telnet_Chyron.Active Then Begin
      PUT_LOG ( 'CHYRON_BASICO_CONEXAO_TELNET_SE_CLOSED' ) ;
      CHYRON_BASICO_CONEXAO_TELNET ;
   End ;
Except
End ;
End ;

Procedure CHYRON_BASICO_CONEXAO_TELNET ;
Begin
{$IFDEF USAR_CHYRON}
If NOT Main.CK_Chyron.Checked Then Begin
   PUT_LOG ( 'Exit !CK_Chyron CHYRON_BASICO_CONEXAO_TELNET' ) ;
   Exit ;
End ;
{$ENDIF}
{$IFDEF NW}
If NOT Flag_Modo_GC2 Then Begin
   PUT_LOG ( 'ERRO - R-News não está em modo de videografismo' ) ;
   Exit ;
End ;
{$ENDIF}
_Debug ( 'INI CHYRON BASICO_CONEXAO_TELNET' ) ;
If VAR_TELNET_ATIVO <> 1 Then Begin
   _Debug ( 'Exit/1 CHYRON BASICO_CONEXAO_TELNET' ) ;
   PUT_LOG ( 'Exit !VAR_TELNET_ATIVO CHYRON_BASICO_CONEXAO_TELNET' ) ;
   Exit ;
End ;
If Chyron_Basico.Porta.Open Then Begin
//   Exit ;
End ;
If Pos ( '192.168.', Chyron_Basico.Telnet_Chyron.Host ) <> 1 Then Begin
//   Exit ;
End ;
If Chyron_Basico.Telnet_Chyron.Port = 0 Then Begin
   PUT_LOG ( 'Exit !Port CHYRON_BASICO_CONEXAO_TELNET' ) ;
   Exit ;
End ;
PUSH_TICK ( 'CHYRON_BASICO_CONEXAO_TELNET' ) ;
Try
   If Chyron_Basico.Telnet_Chyron.Active Then Begin
      PUT_LOG ( 'Fechando conexao Telnet aberta para reconexão' ) ;
      Chyron_Basico.Telnet_Chyron.Close ;
   End ;
Except
End ;
Try
   PUT_LOG ( 'Antes/Tentando conexao telnet://' +
             Chyron_Basico.Telnet_Chyron.Host + ':' +
             IntToStr(Chyron_Basico.Telnet_Chyron.Port) + ' ' +
             'Act[' + IFSN (Chyron_Basico.Telnet_Chyron.Active) + ']' ) ;
   Chyron_Basico.Telnet_Chyron.Open ;
   Chyron_Basico.Telnet_Chyron.Socket.SendText ( #13#10 ) ;
   Chyron_Basico.Telnet_Chyron.Socket.SendText ( CONVERT_MACRO ( 'SELECT_FB1' ) ) ;
   PUT_LOG_EVENTO ( Log.LB_Aplicacao_1, Log.CK_Rolagem.Checked,
                    TimeToStr ( Now ) + ' ' +
                    'TX CHYRON INICIALIZACAO TELNET ' + IntToStr ( Cnt_Log_Aplicacao_1 ) + ' ' +
                    '{' + 'SELECT_FB1' + '}' ) ;
   PUT_LOG ( 'Depois/Tentando conexao telnet://' +
             Chyron_Basico.Telnet_Chyron.Host + ':' +
             IntToStr(Chyron_Basico.Telnet_Chyron.Port) + ' ' +
             'Act[' + IFSN (Chyron_Basico.Telnet_Chyron.Active) + ']' ) ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'EXCEPTION CHYRON_BASICO_CONEXAO_TELNET telnet://' +
                Chyron_Basico.Telnet_Chyron.Host + ':' +
                IntToStr(Chyron_Basico.Telnet_Chyron.Port) ) ;
   End ;
End ;
POP_TICK ( 'CHYRON BASICO_CONEXAO_TELNET' ) ;
_Debug ( 'FIM CHYRON BASICO_CONEXAO_TELNET' ) ;
End ;

Procedure CHYRON_BASICO_SLEEP_FLAG_COMUNICACAO ( _Delay : LongInt ) ;
Begin
_Debug ( 'INI CHYRON BASICO_SLEEP_FLAG_COMUNICACAO' ) ;
PUSH_TICK ( 'CHYRON_BASICO_SLEEP_FLAG_COMUNICACAO' ) ;
While _Delay > 0 Do Begin
   If CHYRON_VAR_FLAG_COMUNICACAO_LAN OR CHYRON_VAR_FLAG_COMUNICACAO_WAN Then Begin
      //PUT_LOG ( 'BREAK por FLAG_COMUNICACAO_OK' ) ;
      Break ;
   End Else Begin
      //PUT_LOG ( 'NOT FLAG_COMUNICACAO_OK' ) ;
   End ;
   Sleep ( 50 ) ;
   Dec ( _Delay, 50 ) ;
   Application.ProcessMessages ;
End ;
POP_TICK ( 'CHYRON BASICO_SLEEP_FLAG_COMUNICACAO' ) ;
_Debug ( 'FIM CHYRON BASICO_SLEEP_FLAG_COMUNICACAO' ) ;
End ;

Function CHYRON_BASICO_AGUARDAR_RETORNO_DE_COMANDO ( TimeOut : LongInt ) : Boolean ;
Begin
CHYRON_BASICO_SLEEP_FLAG_COMUNICACAO ( TimeOut ) ;
Result := FALSE ;
If CHYRON_VAR_FLAG_COMUNICACAO_LAN Then Begin
   If CHYRON_VAR_PN_Link_LAN <> Nil Then Begin
      CHYRON_VAR_PN_Link_LAN.Color := clLime ;
      CHYRON_VAR_PN_Link_LAN.Font.Color := clBlack ;
   End ;
   Result := TRUE ;
End Else Begin
   If CHYRON_VAR_PN_Link_LAN <> Nil Then Begin
      CHYRON_VAR_PN_Link_LAN.Color := clRed ;
      CHYRON_VAR_PN_Link_LAN.Font.Color := clWhite ;
   End ;
End ;
If CHYRON_VAR_FLAG_COMUNICACAO_WAN Then Begin
   If CHYRON_VAR_PN_Link_WAN <> Nil Then Begin
      CHYRON_VAR_PN_Link_WAN.Color := clLime ;
      CHYRON_VAR_PN_Link_WAN.Font.Color := clBlack ;
   End ;
   Result := TRUE ;
End Else Begin
   If CHYRON_VAR_PN_Link_WAN <> Nil Then Begin
      CHYRON_VAR_PN_Link_WAN.Color := clRed ;
      CHYRON_VAR_PN_Link_WAN.Font.Color := clWhite ;
   End ;
End ;
End ;

Function CHYRON_BASICO_GET_VB_HOTKEY ( HotKey : String ) : String ;
Begin
Result := 'E\' +
          'set WshShell = CreateObject ("WScript.Shell")~' +
          'WshShell.SendKeys("' + HotKey + '")' ;
End ;

Procedure CHYRON_BASICO_ENVIAR_SCRIPT ( Origem, Script, Descricao : String ) ;
Begin
If CHYRON_FLAG_PLAY_IMMEDIATE Then Begin
   Script := Script + 'ActiveCanvas.Scene.Play PlayOutput, PlayImmediate' + #13#10 ;
   CHYRON_FLAG_PLAY_IMMEDIATE := FALSE ;
End ;
{$IFDEF USAR_CHYRON}
Script := Script +
          'Lyric.IITransmit("Final_Script[' + Origem + ']")' ;
//CHYRON_SCRIPT_CORE_NEW ( 'CHYROB_BASICO_ENVIAR_SCRIPT/' + Origem , Script, MACRO_TRUE ) ;
Acao_Script_Str := Script ;
EXECUTE_ACAO ( ACAO_SCRIPT, EXECUTAR_TRUE, 0, Array_Strings, Descricao ) ;
PUT_LOG ( 'SEND_SCRIPT [' + Script + ']' ) ;
{$ENDIF}
End ;

Function CONVERT_MACRO ( Macro : String ) : String ;
Begin
Result := 'E\' + TEXT_TO_VB ( Trim ( Macro ) ) + '\\' + #13#10 ;
End ;

Procedure TASK_CHYRON_SCRIPT_CORE ;
Var Aux : String ;
Begin
If Task_Chyron_Core_Header Then Begin
   Task_Chyron_Core_Script := CONVERT_MACRO ( Task_Chyron_Core_Script ) ;
End Else Begin
   Task_Chyron_Core_Script := Task_Chyron_Core_Script + '\\' + #13#10 ;
End ;
Task_Chyron_Core_Retorno := 'TX_Retorno ' +
                            '[' + Task_Chyron_Core_Descricao + ']' +
                            '[' + Task_Chyron_Core_Script + ']' ;
PUT_STATUS ( 'CHYRON_TX [' + Task_Chyron_Core_Descricao +  ']' ) ;
If Assigned ( Log ) AND ( NOT Application.Terminated ) Then Begin
   Try
      Inc ( Cnt_Log_Aplicacao_1 ) ;
      Aux := Task_Chyron_Core_Script ;
      Aux := StringReplace ( Aux, #13#10, '<:CRLF:>', [rfReplaceAll] ) ;
      Aux := StringReplace ( Aux, #13, '<:CR:>', [rfReplaceAll] ) ;
      Aux := StringReplace ( Aux, #10, '<:LF:>', [rfReplaceAll] ) ;
   Except
   End ;
End ;
CHYRON_BASICO_PORTA_WRITE_STRING_SIMPLES ( Task_Chyron_Core_Script, 'ENVIAR_COMANDO_TEMPLATE' ) ;
End ;

Function CHYRON_SCRIPT_CORE_NEW2 ( Descricao, Script : String ; IsMacro : Boolean ) : Boolean ;
Begin
Result := FALSE ;
If VAR_TELNET_ATIVO = 1 Then Begin
   If NOT Chyron_Basico.Porta.Open Then Begin
      CHYRON_BASICO_CONEXAO_TELNET_SE_CLOSED ;
      If NOT Chyron_Basico.Telnet_Chyron.Active Then Begin
         PUT_STATUS ( 'CHYRON_TX !CONNECTED [' + Descricao +  ']' ) ;
         PUT_LOG ( 'CHYRON SCRIPT_CORE_NEW2/-1 Exit por !Connected [' + Task_Chyron_Core_Descricao + ']' +
                   '[' + Task_Chyron_Core_Script + '][' + Script + ']' ) ;
         Flag_Conectar_Chyron := TRUE ;
         Exit ;
      End ;
   End ;
End ;
If Task_Chyron <> Nil Then Begin
   If Task_Chyron.Status = TTaskStatus.Running Then Begin
      Task_Chyron.Cancel ;
   End ;
End ;
If GetTickCount < Tick_Core Then Begin
   PUT_LOG ( 'CHYRON_SCRIPT_CORE/0 Exit por Tick [' + Task_Chyron_Core_Descricao + '][' + Task_Chyron_Core_Script + ']' ) ;
   Exit ;
End ;
Tick_Core := GetTickCount + 200 ;
Task_Chyron_Core_Descricao := Descricao ;
Task_Chyron_Core_Script := Script ;
Task_Chyron_Core_Header := IsMacro ;
Task_Chyron_Core_Retorno := '' ;
If Task_Chyron_Core_Descricao <> '' Then Begin
   PUT_LOG ( 'CHYRON_SCRIPT_CORE/1 [' + Task_Chyron_Core_Descricao + '][' + Task_Chyron_Core_Script + ']' ) ;
End ;
//Task_Chyron := TTask.Create ( TASK_CHYRON_SCRIPT_CORE ) ;
//Task_Chyron.Start ;
TASK_CHYRON_SCRIPT_CORE ;
End ;

Function CHYRON_BASICO_GET_GERADOR : String ;
Begin
Result := '' ;
End ;

{
0001 Task timed out.
0002 Unimplemented system service.
0003 Illegal service.
0004 Illegal node.
0005 Object has been deleted.
0006 Invalid object ID.
0007 Incorrect object ID.
0008 Incorrect object type.
0009 Object not found.
0014 Cannot create message - No task control blocks.
0015 Cannot create message - No stack space available.
0016 Cannot create the message -The stack space is too small.
0017 Cannot create the message -Priority out of range.
0018 Cannot start the process - Already active.
0019 Cannot restart the process - The process was never started.
0020 Cannot suspend process - Process is already suspended.
0021 Cannot resume process - It was never suspended.
0022 Cannot change priority - Out of range.
0023 Illegal task register number.
0024 Cannot delete - File is open.
0051 Cannot create - No more queue control blocks.
0052 Cannot create or send - No message buffers.
0053 Cannot send - The message queue is full.
0054 Cannot receive - The queue has been deleted.
0055 Cannot receive - There are no pending messages.
0056 Informative - There were tasks waiting when the queue was deleted.
0057 Informative - There were messages waiting when the queue was deleted.
0065 Cannot create - No more SCBs.
0066 Cannot acquire - Semaphore not available.
0067 Cannot acquire - Semaphore deleted while waiting.
0068 Informative - There were tasks waiting when the Semaphore was deleted.
2001 An invalid function number was called.
2002 pHILE failure was encountered.
2003 An inconsistent structure was found on the volume.
2004 No more TCB extensions.
2005 Init volume parameter error.
2006 No more volume table entries.
2007 Alien volume.
2008 Volume already mounted.
2009 Cannot unmount - there are files open.
200A Device not mounted.
200B File not found.
200C Illegal filename.
200D No Default Directory found.
200E Directory file expected.
200F Illegal annex size to create.
2010 Null filename.
2011 File already exists.
2012 F list full.
2013 File open.
2014 Directory is not empty.
2015 System or directory file.
2016 Different devices (MOVE_F).
2017 MOVE_F would result in non tree structure.
2018 No more open file entries.
2019 No more FCBs.
201A Invalid FID, too large.
201B Invalid FID, file closed.
201C Indirect block full.
201D Volume full.
201E Bad position to lseek.
201F Seek past end of file.
2021 Illegal device (exceeded maximum).
2022 Data is locked.
2023 Bad fn in OPEN_VOL.
2024 Illegal flush mode to MOUNT_VOL.
2025 Illegal device name.
Intelligent Interface
2026 Bad MS/DOS call.
2027 Illegal MS disk type.
2028 More than one type of MS disk type.
2040 Used Tab page
2F01 Insufficient data area.
2F0E Check sum in pHILE.
2F0F Check sum in pVERIFY+.
400B Checksum does not match computed checksum.
40B2 Requested message directory does not exist.
40B3 Requested message file does not exist.
412C Requested description file is not a Tab Description file.
412D Requested data file is not a Tab Data file.
412E Requested field is not a valid field.
412F Requested attribute (Color or Font) is not valid.
4130 Field contains too much data (limit 64 characters).
4131 Incorrect number of fields, R command does not match X command.
415E Description message was created with old Tabs (Templates).
415F Number of Tabs (Templates) exceeds limit (99).
4190 Desired operation is not terminated with "\\".
4191 The command format is incorrect.
4192 An invalid operation has been requested.
4193 An invalid Machine ID has been used.
4194 An invalid Effects ID has been used.
41C2 An invalid User ID has been used (either 1 or 2).
41C3 An invalid Keyboard ID has been used (either 1 or 2).
41C4 The command to set the active message compose frame buffer failed.
41C5 An invalid Frame Buffer ID was used (1, 2, or 3).
41C6 Error building into a non-displaying buffer; a bad message type was used or no Read Next command was issued.
41C7 Command to set Palette failed.
41C8 Color Key out of range; must be 1 - 8.
41C9 Palette Index out of range; must be 1 - 31.
41CA Color Index out of range; must be 0 - 255.
41CB Key out of range; must be 0 - 1.
41CC Attempted to perform a Dual-User operation in Single-User mode.
41CD Timed out waiting for response.
41CE Error building Message Compose Palette.
41CF Error erasing displayed Frame Buffer.
41D0 Display/Non-Display flag out of range, i.e., 0 - 1.
41D1 No Intelligent Interface option.
41D2 Bitmap not created.
41D3 Bitmap file not found.
41D4 Invalid Field Number.
41D5 Missing Macro.
41D6 Macro Error.
41D7 Duplicate Macro.
41D8 Another Macro currently executing.
41D9 Another Macro currently recording.
41DA Item referenced in Macro was not found.
41DB File referenced in Macro was not found.
5000 New Playlist created.
5001 Invalid Playlist Number.
5002 No Playlist loaded.
5003 File not Playlist.
5004 Old version of Playlist.
5005 Playlist already exists.
5006 Playlist finished executing.
5010 Invalid Playlist Entry Number.
5011 Error allocating Playlist Entry.
5012 Error adding Playlist Entry.
5020 Invalid Channel allocated.
5021 No Channel allocated.
5022 No Frame Buffer allocated.
5030 Invalid Still Message Number.
5031 Still File not found.
5050 Invalid IMAGESTOR! command.
5051 Invalid Effect.
5052 Invalid Pattern.
5053 Invalid Speed.
5054 Invalid Ease parameter.
5055 Invalid Reverse parameter.
5056 Invalid Keyboard Lock Status.
7000 No memory to create outline.
7004 No Frame Buffer available for graph.
7008 No memory for the Fill Line Buffer.
7100 Line segment not between 0 and MAX_LINE_SEG.
7108 Invalid Pulse parameter specified, i.e., not _PULSE(0) or _NON_PULSE(1).
710C Invalid display buffer specified, i.e., not _DBUF(0) or _NBUF(1).
7110 Invalid Trigger type specified, i.e., not _REGULAR_LINE(0), _PULSE_LINE(1) or _BOTH(2)
7114 Invalid Mode specified, i.e., not _ENTIRE_LINE(0) or _LAST_SEGMENT(1).
7118 Specified Pacing value outside of range, i.e., not between -30 and 30.
7200 Brush not successfully created.
7204 Invalid Edge specified, i.e., not _HARD(0), _SOFT(1), _SOFT_EDGE(2) or _CLEAR(3).
7208 Invalid Transparency, i.e., not between 0 and 100.
720C Brush diameter out of range.
7210 Invalid RGBA file name, i.e., RGBA value has more than 8 digits.
7300 Point not added to outline.
7304 No outline exists for this line segment.
8001 Wrong Read Effect task.
8002 Bad Read Effect command.
8003 Wrong Read Effect command.
8004 Bad Read Effect Mode.
8005 Bad Read Effect Ease.
8006 Bad Read Effect Speed.
8007 Bad Read Effect Type.
8008 Bad Read Effect Reverse.
8009 Bad Read Effect Row Direction.
800A Bad Mix Effect Percent.
800B Bad Mix Effect Soft Edge.
800C Rows cannot be wiped left and right on old frame buffer.
800D Must specify one row Up or Down.
800E Invalid Effect type.
800F No memory available for row type.
8010 Frame buffer error occurred.
8011 Frame buffer in use by another task, e.g., Clock, Flash.
805001 Bad Transform syntax.
805002 Bad Transform script.
805003 Bad Transform directory.
805004 Bad Transform message.
805005 Bad Transform value.
805006 Ignored.
805007 Bad Transform command.
805008 Transform not available.
}

Procedure CHYRON_BASICO_PUT_ERRO_CHYRON ( Key, Valor : String ) ;
Var Qtde : LongInt ;
    Temp : T_Point_Str ;
Begin
While Length ( Key ) < 8 Do Begin
   Key := '0' + Key ;
End ;
Qtde := Length ( Array_Erros_Chyron )  ;
SetLength ( Array_Erros_Chyron, Qtde + 1 ) ;
Temp.Key := UpperCase ( Key ) ;
Temp.Valor := Valor ;
//PUT_LOG ( 'ADD Array_Erros_Chyron [' + Temp.Key + '][' + Temp.Valor + '][Qtde:' + IntToStr(Qtde) + ']' ) ;
Array_Erros_Chyron [ Qtde ] := Temp ;
End ;

Procedure CHYRON_BASICO_CARREGAR_ERROS_CHYRON ;
Begin
//If NOT Assigned ( SL_Erros_Chyron ) Then
//   Exit ;
SetLength ( Array_Erros_Chyron, 0 ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '000001', 'Task timed out.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '000002', 'Unimplemented system service.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '000003', 'Illegal service.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '000004', 'Illegal node.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '000005', 'Object has been deleted.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '000006', 'Invalid object ID.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '000007', 'Incorrect object ID.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '000008', 'Incorrect object type.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '000009', 'Object not found.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '000014', 'Cannot create message - No task control blocks.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '000015', 'Cannot create message - No stack space available.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '000016', 'Cannot create the message -The stack space is too small.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '000017', 'Cannot create the message -Priority out of range.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '000018', 'Cannot start the process - Already active.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '000019', 'Cannot restart the process - The process was never started.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '000020', 'Cannot suspend process - Process is already suspended.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '000021', 'Cannot resume process - It was never suspended.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '000022', 'Cannot change priority - Out of range.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '000023', 'Illegal task register number.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '000024', 'Cannot delete - File is open.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '000051', 'Cannot create - No more queue control blocks.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '000052', 'Cannot create or send - No message buffers.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '000053', 'Cannot send - The message queue is full.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '000054', 'Cannot receive - The queue has been deleted.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '000055', 'Cannot receive - There are no pending messages.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '000056', 'Informative - There were tasks waiting when the queue was deleted.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '000057', 'Informative - There were messages waiting when the queue was deleted.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '000065', 'Cannot create - No more SCBs.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '000066', 'Cannot acquire - Semaphore not available.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '000067', 'Cannot acquire - Semaphore deleted while waiting.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '000068', 'Informative - There were tasks waiting when the Semaphore was deleted.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '002001', 'An invalid function number was called.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '002002', 'pHILE failure was encountered.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '002003', 'An inconsistent structure was found on the volume.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '002004', 'No more TCB extensions.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '002005', 'Init volume parameter error.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '002006', 'No more volume table entries.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '002007', 'Alien volume.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '002008', 'Volume already mounted.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '002009', 'Cannot unmount - there are files open.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '00200A', 'Device not mounted.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '00200B', 'File not found.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '00200C', 'Illegal filename.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '00200D', 'No Default Directory found.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '00200E', 'Directory file expected.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '00200F', 'Illegal annex size to create.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '002010', 'Null filename.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '002011', 'File already exists.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '002012', 'F list full.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '002013', 'File open.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '002014', 'Directory is not empty.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '002015', 'System or directory file.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '002016', 'Different devices (MOVE_F).' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '002017', 'MOVE_F would result in non tree structure.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '002018', 'No more open file entries.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '002019', 'No more FCBs.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '00201A', 'Invalid FID, too large.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '00201B', 'Invalid FID, file closed.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '00201C', 'Indirect block full.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '00201D', 'Volume full.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '00201E', 'Bad position to lseek.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '00201F', 'Seek past end of file.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '002021', 'Illegal device (exceeded maximum).' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '002022', 'Data is locked.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '002023', 'Bad fn in OPEN_VOL.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '002024', 'Illegal flush mode to MOUNT_VOL.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '002025', 'Illegal device name.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '002026', 'Bad MS/DOS call.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '002027', 'Illegal MS disk type.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '002028', 'More than one type of MS disk type.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '002040', 'Used Tab page' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '002F01', 'Insufficient data area.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '002F0E', 'Check sum in pHILE.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '002F0F', 'Check sum in pVERIFY+.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '00400B', 'Checksum does not match computed checksum.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '0040B2', 'Requested message directory does not exist.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '0040B3', 'Requested message file does not exist.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '00412C', 'Requested description file is not a Tab Description file.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '00412D', 'Requested data file is not a Tab Data file.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '00412E', 'Requested field is not a valid field.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '00412F', 'Requested attribute (Color or Font) is not valid.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '004130', 'Field contains too much data (limit 64 characters).' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '004131', 'Incorrect number of fields, R command does not match X command.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '00415E', 'Description message was created with old Tabs (Templates).' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '00415F', 'Number of Tabs (Templates) exceeds limit (99).' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '004190', 'Desired operation is not terminated with "\\".' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '004191', 'The command format is incorrect.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '004192', 'An invalid operation has been requested.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '004193', 'An invalid Machine ID has been used.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '004194', 'An invalid Effects ID has been used.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '0041C2', 'An invalid User ID has been used (either 1 or 2).' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '0041C3', 'An invalid Keyboard ID has been used (either 1 or 2).' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '0041C4', 'The command to set the active message compose frame buffer failed.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '0041C5', 'An invalid Frame Buffer ID was used (1, 2, or 3).' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '0041C6', 'Error building into a non-displaying buffer) ; a bad message type was used or no Read Next command was issued.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '0041C7', 'Command to set Palette failed.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '0041C8', 'Color Key out of range) ; must be 1 - 8.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '0041C9', 'Palette Index out of range) ; must be 1 - 31.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '0041CA', 'Color Index out of range) ; must be 0 - 255.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '0041CB', 'Key out of range) ; must be 0 - 1.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '0041CC', 'Attempted to perform a Dual-User operation in Single-User mode.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '0041CD', 'Timed out waiting for response.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '0041CE', 'Error building Message Compose Palette.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '0041CF', 'Error erasing displayed Frame Buffer.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '0041D0', 'Display/Non-Display flag out of range, i.e., 0 - 1.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '0041D1', 'No Intelligent Interface option.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '0041D2', 'Bitmap not created.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '0041D3', 'Bitmap file not found.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '0041D4', 'Invalid Field Number.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '0041D5', 'Missing Macro.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '0041D6', 'Macro Error.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '0041D7', 'Duplicate Macro.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '0041D8', 'Another Macro currently executing.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '0041D9', 'Another Macro currently recording.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '0041DA', 'Item referenced in Macro was not found.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '0041DB', 'File referenced in Macro was not found.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '005000', 'New Playlist created.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '005001', 'Invalid Playlist Number.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '005002', 'No Playlist loaded.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '005003', 'File not Playlist.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '005004', 'Old version of Playlist.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '005005', 'Playlist already exists.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '005006', 'Playlist finished executing.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '005010', 'Invalid Playlist Entry Number.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '005011', 'Error allocating Playlist Entry.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '005012', 'Error adding Playlist Entry.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '005020', 'Invalid Channel allocated.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '005021', 'No Channel allocated.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '005022', 'No Frame Buffer allocated.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '005030', 'Invalid Still Message Number.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '005031', 'Still File not found.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '005050', 'Invalid IMAGESTOR! command.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '005051', 'Invalid Effect.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '005052', 'Invalid Pattern.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '005053', 'Invalid Speed.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '005054', 'Invalid Ease parameter.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '005055', 'Invalid Reverse parameter.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '005056', 'Invalid Keyboard Lock Status.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '007000', 'No memory to create outline.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '007004', 'No Frame Buffer available for graph.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '007008', 'No memory for the Fill Line Buffer.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '007100', 'Line segment not between 0 and MAX_LINE_SEG.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '007108', 'Invalid Pulse parameter specified, i.e., not _PULSE(0) or _NON_PULSE(1).' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '00710C', 'Invalid display buffer specified, i.e., not _DBUF(0) or _NBUF(1).' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '007110', 'Invalid Trigger type specified, i.e., not _REGULAR_LINE(0), _PULSE_LINE(1) or _BOTH(2)' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '007114', 'Invalid Mode specified, i.e., not _ENTIRE_LINE(0) or _LAST_SEGMENT(1).' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '007118', 'Specified Pacing value outside of range, i.e., not between -30 and 30.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '007200', 'Brush not successfully created.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '007204', 'Invalid Edge specified, i.e., not _HARD(0), _SOFT(1), _SOFT_EDGE(2) or _CLEAR(3).' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '007208', 'Invalid Transparency, i.e., not between 0 and 100.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '00720C', 'Brush diameter out of range.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '007210', 'Invalid RGBA file name, i.e., RGBA value has more than 8 digits.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '007300', 'Point not added to outline.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '007304', 'No outline exists for this line segment.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '008001', 'Wrong Read Effect task.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '008002', 'Bad Read Effect command.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '008003', 'Wrong Read Effect command.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '008004', 'Bad Read Effect Mode.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '008005', 'Bad Read Effect Ease.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '008006', 'Bad Read Effect Speed.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '008007', 'Bad Read Effect Type.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '008008', 'Bad Read Effect Reverse.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '008009', 'Bad Read Effect Row Direction.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '00800A', 'Bad Mix Effect Percent.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '00800B', 'Bad Mix Effect Soft Edge.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '00800C', 'Rows cannot be wiped left and right on old frame buffer.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '00800D', 'Must specify one row Up or Down.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '00800E', 'Invalid Effect type.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '00800F', 'No memory available for row type.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '008010', 'Frame buffer error occurred.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '008011', 'Frame buffer in use by another task, e.g., Clock, Flash.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '805001', 'Bad Transform syntax.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '805002', 'Bad Transform script.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '805003', 'Bad Transform directory.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '805004', 'Bad Transform message.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '805005', 'Bad Transform value.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '805006', 'Ignored.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '805007', 'Bad Transform command.' ) ;
CHYRON_BASICO_PUT_ERRO_CHYRON ( '805008', 'Transform not available.' ) ;
//SL_Erros_Chyron.Clear ;
Qtde_SL_Erros_Chyron := Length ( Array_Erros_Chyron ) ;
End ;

Procedure CHYRON_BASICO_CARREGAR_CONFIGURACAO_TELNET_CHYRON ;
Var Ini   : TMemIniFile ;
    Passo : LongInt ;
Begin
Passo := 0 ;
PUT_LOG ( 'INI CHYRON BASICO_CARREGAR_CONFIGURACAO_TELNET_CHYRON [' + GET_FN_CONFIGURACAO + ']' ) ;
Try
   Passo := 1 ;
   Ini := TMemIniFile.Create ( GET_FN_CONFIGURACAO ) ;
   //ShowMessage ( GET_FN_CONFIGURACAO ) ;
   //
   Passo := 2 ;
   //Ini.WriteString ( 'SYSTEM', 'NOW', DateTimeToStr(Now) ) ;
   Passo := 3 ;
   //Ini.WriteString ( 'SYSTEM', 'TICK', IntToStr(GetTickCount) ) ;
   //
   Passo := 4 ;
   If Chyron_Basico.Telnet_Chyron.Active Then Begin
      Chyron_Basico.Telnet_Chyron.Close ;
   End ;
   Passo := 5 ;
   Chyron_Basico.Telnet_Chyron.Host := Ini.ReadString ( 'TELNET_GC', 'HOST', '' ) ;
   Passo := 6 ;
   Chyron_Basico.Telnet_Chyron.Port := Ini.ReadInteger ( 'TELNET_GC', 'PORT', 0 ) ;
   Passo := 12 ;
   If ( Chyron_Basico.Telnet_Chyron.Host = '' ) OR
      ( Chyron_Basico.Telnet_Chyron.Port <= 0 ) Then Begin
      //Chyron_Basico.Telnet_Chyron.Host := '192.168.233.124' ;
      Chyron_Basico.Telnet_Chyron.Host := '127.0.0.1' ;
      Chyron_Basico.Telnet_Chyron.Port := 0 ;
      Ini.WriteString ( 'TELNET_GC', 'HOST', Chyron_Basico.Telnet_Chyron.Host ) ;
      Ini.WriteInteger ( 'TELNET_GC', 'PORT', Chyron_Basico.Telnet_Chyron.Port ) ;
      Ini.UpdateFile ;
   End ;
   Ini.Free ;
   Passo := 13 ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exceção CHYRON BASICO_CARREGAR_CONFIGURACAO_TELNET_CHYRON Passo ' + IntToStr(Passo) + ' / ' +
                    E.Message ) ;
      ShowMessage ( 'Exceção CHYRON BASICO_CARREGAR_CONFIGURACAO_TELNET_CHYRON Passo ' + IntToStr(Passo) + LFLF +
                    E.Message ) ;
   End ;
End ;
PUT_LOG ( 'FIM CHYRON BASICO_CARREGAR_CONFIGURACAO_TELNET_CHYRON [' + GET_FN_CONFIGURACAO + ']' ) ;
End ;

Procedure CHYRON_BASICO_TRATAR_CONEXAO_LAN_CHYRON ( _Checked : Boolean ) ;
Begin
If Chyron_Basico.Porta.Open Then Begin
   Exit ;
End ;
If _Checked Then Begin
   CHYRON_VAR_Tick_Ping := GetTickCount + 1000 ;
End Else Begin
   Try
      If Chyron_Basico.Telnet_Chyron.Active Then Begin
         Chyron_Basico.Telnet_Chyron.Close ;
      End ;
   Except
   End ;
End ;
End ;

Procedure CHYRON_BASICO_ATIVAR_SERVIDOR_TELNET_CHYRON ;
Begin
Try
If NOT Chyron_Basico.Server_TCP.Active Then Begin
   Chyron_Basico.Server_TCP.Active := TRUE ;
End ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception ativar servidor Telnet [' + E.Message + ']' ) ;
   End ;
End ;
End ;

(*
Procedure CHYRON_BASICO_VERIFICAR_CONEXOES_LAN_WAN_CHYRON ( CK_Conexao_LAN, CK_Conexao_WAN : TCheckBox ;
                                              SP_Testar_Link_LAN, SP_Testar_Link_WAN : TSpinEdit ;
                                              PN_Link_WAN, PN_Link_LAN,
                                              PN_Ping : TPanel ) ;
Var _Bytes       : LongInt ;
    Retorno_Ping : LongInt ;
    Erro         : String ;
Begin
If ( CK_Conexao_LAN.Checked ) AND
   ( SP_Testar_Link_LAN.Value > 0 ) AND
   ( GetTickCount > CHYRON_VAR_Tick_Next_Teste_Link_LAN ) Then
   Begin
   CHYRON_BASICO_REFRESH_TESTE_LINK_LAN ( SP_Testar_Link_LAN.Value ) ;
   CHYRON_BASICO_TESTE_DE_COMUNICACAO_LAN ( FALSE, CK_Conexao_LAN, PN_Link_LAN ) ;
   End ;
If ( CK_Conexao_WAN.Checked ) AND
   ( SP_Testar_Link_WAN.Value > SP_Testar_Link_WAN.Value ) AND
   ( GetTickCount > CHYRON_VAR_Tick_Next_Teste_Link_WAN ) Then
   Begin
   CHYRON_BASICO_REFRESH_TESTE_LINK_WAN ( 0 ) ;
   CHYRON_BASICO_TESTE_DE_COMUNICACAO_WAN ( FALSE, CK_Conexao_WAN, PN_Link_WAN ) ;
   End ;
If CK_Conexao_WAN.Checked Then
   Begin
   End
   Else
   Begin
   PN_Link_WAN.Color := clSilver ;
   PN_Link_WAN.Font.Color := clGray ;
   End ;
If CK_Conexao_LAN.Checked Then
   Begin
   If ( GetTickCount > CHYRON_VAR_Tick_Next_Conexao_Telnet_LAN ) Then
      Begin
      If NOT Chyron_Basico.Telnet.Active Then
         Begin
         CHYRON_VAR_Tick_Next_Conexao_Telnet_LAN := GetTickCount + 5000 ;
         CHYRON_BASICO_CONEXAO_TELNET ;
         End ;
      End ;
   If ( CHYRON_VAR_Tick_Ping > 0 ) AND
      ( GetTickCount > CHYRON_VAR_Tick_Ping ) Then
      Begin
      Host_Ping := Chyron_Basico.Telnet.Host ;
      PN_Ping.Hint := 'LAN ' + Chyron_Basico.Telnet.Host + ':' + IntToStr ( Chyron_Basico.Telnet.Port ) ;
      //Host_Ping := '192.168.1.1' ;
      //Host_Ping := '65.254.33.2' ; // 26967
      If Ping ( Host_Ping, Retorno_Ping, _Bytes, Erro ) Then
         Begin
         Inc ( Cnt_Ping_Ok ) ;
         PN_Ping.Caption := 'P:' + IntToStr ( Cnt_Ping_Ok ) ;
         PN_Ping.Color := clLime ;
         PN_Ping.Font.Color := clBlack ;
         Cnt_Ping_NOk := 0 ;
         //PUT_LOG ( 'PING OK ' + Host_Ping + ' ' +
         //          '(' + IntToStr(Retorno_Ping) + 'ms' + ')' +
         //          '(' + IntToStr(_Bytes) + ' bytes)' )
         End
         Else
         Begin
         Inc ( Cnt_Ping_NOk ) ;
         Cnt_Ping_Ok := 0 ;
         PN_Ping.Caption := 'P:' + IntToStr ( Cnt_Ping_NOk ) ;
         If Cnt_Ping_Nok > 0 Then
            Begin
            If Odd ( Cnt_Ping_Nok ) Then
               Begin
               PN_Ping.Color := clRed ;
               PN_Ping.Font.Color := clWhite ;
               End
               Else
               Begin
               PN_Ping.Color := clYellow ;
               PN_Ping.Font.Color := clBlack ;
               End ;
            End ;
         PUT_LOG ( 'PING NÃO OK ' + Host_Ping ) ;
         End ;
      CHYRON_VAR_Tick_Ping := GetTickCount + 10000 ;
      End ;
   End
   Else
   Begin
   PN_Ping.Color := clSilver ;
   PN_Ping.Font.Color := clGray ;
   PN_Link_LAN.Color := clSilver ;
   PN_Link_LAN.Font.Color := clGray ;
   End ;
End ;
*)

Procedure CHYRON_BASICO_TESTE_DE_COMUNICACAO_LAN ( Debug : Boolean ;
                                     CK_Conexao_LAN : TCheckBox ;
                                     PN_Link_LAN : TPanel ) ;
Begin
(*
CHYRON_VAR_FLAG_COMUNICACAO_LAN := FALSE  ;
If CK_Conexao_LAN.Checked Then
   Begin
   PN_Link_LAN.Color := clYellow ;
   PN_Link_LAN.Font.Color := clBlack ;
   End ;
CHYRON_VAR_FLAG_LOGAR_LINK := FALSE ;
If CHYRON_BASICO_TEMPLATE_SIMPLES ( '', 'E\''~' ) Then
   Begin
   If CK_Conexao_LAN.Checked Then
      Begin
      If CHYRON_VAR_FLAG_COMUNICACAO_LAN Then
         Begin
         If Debug Then
            PUT_LOG ( 'OK para teste de comunicação LAN' ) ;
         End ;
      End ;
   End
   Else
   Begin
   PUT_LOG ( 'NÃO OK para teste de comunicação' ) ;
   End ;
CHYRON_VAR_FLAG_LOGAR_LINK := TRUE ;
*)
End ;

Procedure CHYRON_BASICO_TESTE_DE_COMUNICACAO_WAN ( Debug : Boolean ;
                                     CK_Conexao_WAN : TCheckBox ;
                                     PN_Link_WAN : TPanel ) ;
Begin
(*
CHYRON_VAR_FLAG_COMUNICACAO_WAN := FALSE  ;
PN_Link_WAN.Color := clYellow ;
CHYRON_VAR_FLAG_LOGAR_LINK := FALSE ;
//If ENVIAR_COMANDO_TEMPLATE ( '', 'E\Macro4RRCT' ) Then
If CHYRON_BASICO_TEMPLATE_SIMPLES ( '', 'E\''~' ) Then
   Begin
   If CK_Conexao_WAN.Checked Then
      Begin
      If CHYRON_VAR_FLAG_COMUNICACAO_WAN Then
         Begin
         If Debug Then
            PUT_LOG ( 'OK para teste de comunicação WAN' ) ;
         End ;
      End ;
   End
   Else
   Begin
   PUT_LOG ( 'NÃO OK para teste de comunicação' ) ;
   End ;
CHYRON_VAR_FLAG_LOGAR_LINK := TRUE ;
*)
End ;

Procedure CHYRON_BASICO_CLEAR_FB1 ( Origem : String ) ;
Begin
{$IFDEF USAR_CHYRON}
EXECUTE_ACAO ( ACAO_CLEAR_FB1, EXECUTAR_TRUE, 0, Array_Strings, 'CHYRON_BASICO_CLEAR_FB1' ) ;
{$ENDIF}
End ;

Procedure CHYRON_BASICO_CLEAR_FB2 ( Origem : String ) ;
Begin
{$IFDEF USAR_CHYRON}
EXECUTE_ACAO ( ACAO_CLEAR_FB2, EXECUTAR_TRUE, 0, Array_Strings, 'CHYRON_BASICO_CLEAR_FB2' ) ;
{$ENDIF}
End ;

Procedure CHYRON_BASICO_CLEAR_FB ( Origem : String ) ;
begin
If CHYRON_VAR_FRAME_BUFFER = 1 Then Begin
   CHYRON_BASICO_CLEAR_FB1 ( 'CHYRON_BASICO_CLEAR_FB/1/' + Origem )
End Else If CHYRON_VAR_FRAME_BUFFER = 2 Then Begin
   CHYRON_BASICO_CLEAR_FB2 ( 'CHYRON_BASICO_CLEAR_FB/2/' + Origem )
End ;
End ;

Function CHYRON_BASICO_GET_FB_PLAY ( Indice : LongInt ) : String ;
Begin
If Indice = 1 Then Begin
   Result := CHYRON_BASICO_DEF1_CMD_PLAY_FB1
End Else Begin
   Result := CHYRON_BASICO_DEF1_CMD_PLAY_FB2 ;
End ;
End ;

Function CHYRON_BASICO_GET_FB_CLEAR ( Indice : LongInt ) : String ;
Begin
If Indice = 1 Then Begin
   Result := CHYRON_BASICO_DEF1_CMD_CLEAR_FB1
End Else Begin
   Result := CHYRON_BASICO_DEF1_CMD_CLEAR_FB2 ;
End ;
End ;

Procedure CHYRON_BASICO_PROC_SLEEP ( _Delay : LongInt ) ;
Begin
While _Delay > 0 Do Begin
   Sleep ( 10 ) ;
   Dec ( _Delay, 10 ) ;
   Application.ProcessMessages ;
End ;
End ;

(*
Procedure CHYRON_BASICO_PLAY_FB ( Origem : String ) ;
//Var VB : String ;
Begin
If CHYRON_VAR_LIMPAR_FB_ANTES Then
   Begin
   CHYRON_BASICO_CLEAR_FB ( Origem ) ;
   CHYRON_BASICO_PROC_SLEEP ( 100 ) ;
   End ;
//VB := 'E\' + 'ActiveCanvas.Scene.Play PlayOutput, PlayImmediate' ;
//ENVIAR_COMANDO_TEMPLATE ( 'PROC_PLAY_FB', VB ) ;
If CHYRON_VAR_FRAME_BUFFER = 1 Then
   CHYRON_BASICO_PLAY_FB1 ( Origem )
Else If CHYRON_VAR_FRAME_BUFFER = 2 Then
   CHYRON_BASICO_PLAY_FB2 ( Origem ) ;
End ;
*)

Procedure CHYRON_BASICO_SELECT_FB ( Origem : String ; _FB : LongInt ) ;
Begin
{$IFDEF USAR_CHYRON}
If _FB = 1 Then Begin
   EXECUTE_ACAO ( ACAO_SELECT_FB1, EXECUTAR_TRUE, 0, Array_Strings,
                  'CHYRON_BASICO_CLEAR_FB-1' ) ;
End Else If CHYRON_VAR_FRAME_BUFFER = 2 Then Begin
   EXECUTE_ACAO ( ACAO_SELECT_FB2, EXECUTAR_TRUE, 0, Array_Strings,
                  'CHYRON_BASICO_CLEAR_FB-2' ) ;
End ;
{$ENDIF}
End ;

Procedure CHYRON_BASICO_DEFINIR_FRAME_BUFFER ( Origem : String ) ;
Begin
//Cmd := 'Y\<D5><F7>' + IntTostr ( CHYRON_VAR_FRAME_BUFFER ) ;
//CHYRON_BASICO_TEMPLATE_SIMPLES ( 'DEFINIR_FRAME_BUFFER/' + IntToStr(CHYRON_VAR_FRAME_BUFFER), Cmd ) ;
If CHYRON_VAR_FRAME_BUFFER = 1 Then Begin
   CHYRON_BASICO_SELECT_FB ( 'CHYRON_BASICO_DEFINIR_FRAME_BUFFER/1/' + Origem, 1 )
End Else If CHYRON_VAR_FRAME_BUFFER = 2 Then Begin
   CHYRON_BASICO_SELECT_FB ( 'CHYRON_BASICO_DEFINIR_FRAME_BUFFER/2/' + Origem, 2 ) ;
End ;
End ;

Procedure CHYRON_BASICO_EXEC_TRANSICAO ( Cena, Transicao : String ; Jornal : String ) ;
Var Script : String ;
Begin
Script := GET_VB_EXEC_TRANSICAO ( 'CHYRON_BASICO_EXEC_TRANSICAO', Cena, Transicao, Jornal ) ;
CHYRON_BASICO_ENVIAR_SCRIPT ( 'CHYRON_BASICO_EXEC_TRANSICAO/' + Cena + '/' + Transicao ,
                              Script, 'CHYRON_BASICO_EXEC_TRANSICAO' ) ;
End ;

(*
Procedure CHYRON_BASICO_PREPARAR_CHYRON_MESSAGE_READ ( FB : LongInt ; Mensagem : String ) ;
Var Cmd : String ;
Begin
CHYRON_VAR_LAST_MESSAGE := Mensagem ;
CHYRON_VAR_LAST_PARAM := '' ;
//Cmd := 'V\5\3\1\' + IntToStr(FB)+'\'+Mensagem + '\' + '0' ;
//CHYRON_BASICO_TEMPLATE_SIMPLES ( 'PREPARAR_CHYRON_MESSAGE_READ/'+Mensagem, Cmd ) ;
CHYRON_BASICO_SELECT_FB ( 'CHYRON_BASICO_PREPARAR_CHYRON_MESSAGE_READ/', FB ) ;
CHYRON_SCRIPT_CORE ( 'CHYRON_BASICO_DEFINIR_FRAME_BUFFER/2/' + Origem, 'SELECT_FB2' ) ;
End ;
*)

Procedure CHYRON_BASICO_SELECIONAR_FRAME_BUFFER ( FB : Integer ;
                                                  PN_FB_VGA, PN_FB_1, PN_FB_2 : TPanel ) ;
Begin
CHYRON_VAR_FRAME_BUFFER := FB ;
If Assigned ( PN_FB_VGA ) AND Assigned ( PN_FB_1 ) AND Assigned ( PN_FB_2 ) Then Begin
   If CHYRON_VAR_FRAME_BUFFER = 0 Then Begin
      PN_FB_VGA.Color := clYellow ;
      PN_FB_1.Color := clBtnFace ;
      PN_FB_2.Color := clBtnFace ;
   End Else If CHYRON_VAR_FRAME_BUFFER = 1 Then Begin
      PN_FB_VGA.Color := clBtnFace ;
      PN_FB_1.Color := clYellow ;
      PN_FB_2.Color := clBtnFace ;
   End Else If CHYRON_VAR_FRAME_BUFFER = 2 Then Begin
      PN_FB_VGA.Color := clBtnFace ;
      PN_FB_1.Color := clBtnFace ;
      PN_FB_2.Color := clYellow ;
   End Else Begin
      PN_FB_VGA.Color := clBtnFace ;
      PN_FB_1.Color := clBtnFace ;
      PN_FB_2.Color := clBtnFace ;
   End ;
End ;
End ;

Procedure VB_ALTERAR_IMAGEM ( Msg : LongInt ; Campo, FN : String ;
                              Var Script : String ; Jornal : String ) ;
Var FB     : LongInt ;
Begin
FB := TIPOS_GC_GET_FB_POR_MSG ( Msg ) ;
PUT_LOG ( 'VB_ALTERAR_IMAGEM FB[' + IntToStr(FB) + '] Msg[' + IntToStr(Msg) + '] FN[' + FN + ']' ) ;
Script := Script + GET_VB_ALTERAR_MENSAGEM ( 'VB_ALTERAR_IMAGEM', FB, Msg, Campo, FN, Jornal ) ;
If CHYRON_FLAG_ENVIAR_SCRIPT Then Begin
   CHYRON_BASICO_ENVIAR_SCRIPT ( 'READ_UPDATE_PLAY', Script,
                                 'VB_ALTERAR_IMAGEM' ) ;
   Script := '' ;
End ;
End ;

Procedure VB_FECHAR_NAO_PERSISTENTES ( FB : LongInt ; Efeito : Boolean ;
                                       Var Script : String ) ;
Begin
Script := Script + GET_VB_FECHAR_NAO_PERSISTENTES ( 'VB_FECHAR_NAO_PERSISTENTES', FB, Efeito ) ;
If CHYRON_FLAG_ENVIAR_SCRIPT Then Begin
   CHYRON_BASICO_ENVIAR_SCRIPT ( 'READ_UPDATE_PLAY/FB-' + IntToStr(FB), Script,
                                 'VB_FECHAR_NAO_PERSISTENTES' ) ;
   Script := '' ;
End ;
End ;

Procedure VB_FECHAR_ATE_PERSISTENTES ( FB : LongInt ; Efeito : Boolean ;
                                       Var Script : String ) ;
Begin
If ( FB < 1 ) OR ( FB > 2 ) Then Begin
   Exit ;
End ;
Script := Script + GET_VB_FECHAR_ATE_PERSISTENTES ( 'VB_FECHAR_ATE_PERSISTENTES', FB, Efeito ) ;
If CHYRON_FLAG_ENVIAR_SCRIPT Then Begin
   CHYRON_BASICO_ENVIAR_SCRIPT ( 'READ_UPDATE_PLAY/FB-' + IntToStr(FB), Script,
                                 'VB_FECHAR_ATE_PERSISTENTES' ) ;
   Script := '' ;
End ;
End ;

Procedure VB_OUT ( Tag : String ; Jornal : String ) ;
Var Msg : LongInt ;
    FB  : LongInt ;
    Script : String ;
Begin
Script := '' ;
Msg := TIPOS_GC_GET_MSG_POR_TAG ( Tag ) ;
If Msg = 0 Then Begin
   PUT_LOG ( 'Msg nula por tag não reconhecida [' + Tag + ']' ) ;
   Exit ;
End ;
//If CHYRON_VAR_EFFECT_OUT Then
FB := TIPOS_GC_GET_FB_POR_MSG ( Msg ) ;
CHYRON_FLAG_ENVIAR_SCRIPT := FALSE ;
VB_FECHAR_NAO_PERSISTENTES ( FB, CHYRON_VAR_EFFECT_OUT, Script ) ;
CHYRON_FLAG_ENVIAR_SCRIPT := TRUE ;
{
READ_UPDATE_PLAY ( Msg ,
                   'LINHA1', 'L1 ' + TimeToStr(Now),
                   'LINHA2', 'L2 ' + TimeToStr(Now),
                   'LINHA3', 'L3 ' + TimeToStr(Now),
                   'LINHA4', 'L4 ' + TimeToStr(Now),
                   'LINHA5', 'L5 ' + TimeToStr(Now),
                   FB,
                   Script,
                   Jornal ) ;
}
End ;

Procedure CHYRON_CARREGAR_GLOBAIS ( Var Script : String ) ;
Var Lista : TStringList ;
    Local : LongInt ;
Begin
Lista := TStringList.Create ;
If CHYRON_REG.Mens > 0 Then Begin
   Lista.Add ( 'msg=' + IntToStr(CHYRON_REG.Mens) ) ;
End ;
//Lista.Add ( 'Last_Msg
If CHYRON_REG.Frame > 0 Then Begin
   Lista.Add ( 'frame=' + IntToStr(CHYRON_REG.Frame) ) ;
End ;
If CHYRON_REG.Jornal <> '' Then Begin
   Lista.Add ( 'jornal=' + ASPAS_CHYRON(CHYRON_REG.Jornal) ) ;
End ;
If CHYRON_REG.Cena <> '' Then Begin
   Lista.Add ( 'cena = ' + ASPAS_CHYRON(CHYRON_REG.Cena) ) ;
End ;
//Lista.Add ( 'Last_Transicao = ' + ASPAS(CHYRON_REG.Msg) ) ;
For Local := 1 To 5 Do Begin
   Lista.Add ( 'campo' + IntToStr(Local) + '=' + ASPAS_CHYRON(CHYRON_REG.Campos_Txt[Local]) ) ;
   Lista.Add ( 'valor' + IntToStr(Local) + '=' + ASPAS_CHYRON(CHYRON_REG.Valores_Txt[Local]) ) ;
   Lista.Add ( 'campo' + IntToStr(Local) + '_img=' + ASPAS_CHYRON(CHYRON_REG.Campos_Txt[Local]) ) ;
   Lista.Add ( 'valor' + IntToStr(Local) + '_img=' + ASPAS_CHYRON(CHYRON_REG.Valores_Txt[Local]) ) ;
End ;
Lista.Add ( 'GLOBAIS_PRINT' ) ;
Script := Script + Lista.Text ;
Lista.Free ;
End ;

Procedure ADD_Script ( Var Script :  String ; Cmd : String  ) ;
Begin
Script := Script + Cmd + sLineBreak ;
End ;

Procedure CHYRON_MACRO_ATIVAR_ARTE ( Origem : String ) ;
Var Script : String ;
Begin
Script := '' ;
ADD_Script ( Script, 'ATIVAR_RELOGIO_SEREIA' ) ;
End ;

Procedure CLEAR_CHYRON_REG ( Var Reg : T_Automacao_Chyron ) ;
Var Local : LongInt ;
Begin
Reg.Mens := 0 ;
Reg.Last_Msg := 0 ;
Reg.Frame := 0 ;
Reg.Jornal := '' ;
Reg.Cena := '' ;
Reg.Script := '' ;
Reg.Descricao := '' ;
Reg.Identificacao := '' ;
Reg.Transicao := '' ;
Reg.Last_Transicao := '' ;
Reg.Tipo := '' ;
Reg.Tag := 0 ;
Reg.Wait_Int := 0 ;
Reg.Exige_Relogio2 := FALSE ;
For Local := 1 To 5 Do Begin
   Reg.Campos_Txt[Local] := '' ;
   Reg.Valores_Txt[Local] := '' ;
   Reg.Campos_Img[Local] := '' ;
   Reg.Valores_Img[Local] := '' ;
End ;
End ;

Procedure START_CRONOMETRO_GC ;
Begin
//OUT_GC_Tick_Cronometro := GetTickCount ;
End ;

Procedure EXECUTE_PLAY_CHYRON_OUT_GC ( _Tag : LongInt ;
                                       _Macro : String ;
                                       _Msg : LongInt ;
                                       _L1, _L2, _L3 : String ;
                                       _Jornal : String ;
                                       Script : String ;
                                       Descricao : String ) ;
{$IFDEF USAR_CHYRON}
Var Reg       : T_Automacao_Chyron ;
//    Comando   : String ;
    Tick_Local  : Cardinal ;
{$ENDIF}
Begin
{$IFDEF USAR_CHYRON}
If Descricao = '' Then Begin
   Descricao := _Macro ;
End ;
Descricao := Descricao + '/' + IntToStr ( _Msg ) ;
If Assigned ( Log ) AND ( NOT Application.Terminated ) Then Begin
   Try
      Inc ( Cnt_Log_Aplicacao_1 ) ;
      PUT_LOG_EVENTO ( Log.LB_Aplicacao_1, Log.CK_Rolagem.Checked,
                       TimeToStr ( Now ) + ' ' +
                       'TX CHYRON ' + IntToStr ( Cnt_Log_Aplicacao_1 ) + ' ' +
                       Descricao ) ;
   Except
   End ;
End ;
{$IFDEF NW}
If NOT Flag_Modo_GC2 Then Begin
   PUT_LOG ( 'ERRO - R-News não está em modo de videografismo' ) ;
   Exit ;
End ;
{$ENDIF}
_Debug ( 'INI EXECUTE PLAY_CHYRON_OUT_GC' ) ;
PUSH_TICK ( 'EXECUTE_PLAY_CHYRON_OUT_GC' ) ;
Tick_Local := GetTickCount ;
CLEAR_CHYRON_REG ( Reg ) ;
Reg.Script := Script ;
Reg.Jornal := _Jornal ;
Reg.Transicao := 'Effect In' ;
Reg.Tag := _Tag ;
PUT_LOG ( 'INI EXECUTE_PLAY_CHYRON_OUT_GC' ) ;
START_CRONOMETRO_GC ;
CHYRON_FLAG_ENVIAR_SCRIPT := FALSE ;
If _Msg > 0 Then Begin
   PUT_LOG ( '1 EXECUTE_PLAY_CHYRON_OUT_GC' ) ;
   Reg.Mens := _Msg ;
   Reg.Exige_Relogio2 := TIPOS_GC_GET_EXIBIR_RELOGIO_POR_MSG ( Reg.Mens ) ;
   Reg.Frame := TIPOS_GC_GET_FB_POR_MSG ( Reg.Mens ) ;
   Reg.Identificacao := TIPOS_GC_GET_IDENTIFICACAO_POR_MSG ( Reg.Mens ) ;
   Reg.Descricao := TIPOS_GC_GET_DESCRICAO_POR_MSG ( Reg.Mens ) ;
   Reg.Tipo := '' ;
   Reg.Valores_TXT[1]:= _L1 ;
   Reg.Valores_TXT[2] := _L2 ;
   Reg.Valores_TXT[3] := _L3 ;
   TIPOS_GC_GET_CAMPOS_POR_MSG ( Reg ) ;
   Reg.Script := CALC_CONTEXTO_CHYRON ( Reg, RD.RD_VAR_ESPELHO_ATUAL ) +
                 _Macro + sLineBreak ;
End Else If Reg.Tag >= 0 Then Begin // GC, Tarjas, Imagens, etc.
   PUT_LOG ( '2 EXECUTE_PLAY_CHYRON_OUT_GC' ) ;
   //RRCT Reg.Mens := StrToIntDef ( Out_GC_ED_MSG[Reg.Tag].Text, 0 ) ;
   Reg.Frame := TIPOS_GC_GET_FB_POR_MSG ( Reg.Mens ) ;
   Reg.Identificacao := TIPOS_GC_GET_IDENTIFICACAO_POR_MSG ( Reg.Mens ) ;
   Reg.Descricao := TIPOS_GC_GET_DESCRICAO_POR_MSG ( Reg.Mens ) ;
   Reg.Exige_Relogio2 := TIPOS_GC_GET_EXIBIR_RELOGIO_POR_MSG ( Reg.Mens ) ;
   //RRCT Reg.Tipo := Out_GC_CB[Reg.Tag].Text ;
   //RRCT Reg.Valores_TXT[1] := OUT_GC_ED[Reg.Tag,1].Text ;
   //RRCT Reg.Valores_TXT[2] := OUT_GC_ED[Reg.Tag,2].Text ;
   Reg.Valores_TXT[3] := '' ; // OUT_GC_ED[Tag,3].Text ;
   TIPOS_GC_GET_CAMPOS_POR_MSG ( Reg ) ;
   Reg.Script := CALC_CONTEXTO_CHYRON ( Reg, RD.RD_VAR_ESPELHO_ATUAL ) +
                 _Macro + sLineBreak ;
End Else If _Macro <> '' Then Begin // Macros diretas
   Reg.Frame := TIPOS_GC_GET_FB_POR_TAG ( _Macro ) ;
   Reg.Exige_Relogio2 := TIPOS_GC_GET_EXIBIR_RELOGIO_POR_MSG ( Reg.Mens ) ;
   PUT_LOG ( '3a EXECUTE_PLAY_CHYRON_OUT_GC' ) ;
   Reg.Script := {$IFDEF NW}
                 CALC_CONTEXTO_CHYRON ( Reg, RD.RD_VAR_ESPELHO_ATUAL ) +
                 {$ENDIF}
                 _Macro + sLineBreak ;
End ;
Acao_Script_Str := Trim ( Reg.Script ) ;
EXECUTE_ACAO ( ACAO_SCRIPT, EXECUTAR_TRUE, 0, Array_Strings,
               'EXECUTE_PLAY_CHYRON_OUT_GC' ) ;
PUT_LOG ( 'FIM EXECUTE_PLAY_CHYRON_OUT_GC [' + IntToStr(Reg.Mens) + ']' +
          '[' + Reg.Tipo + ']' +
          '[' + Reg.Valores_TXT[1] + ']' +
          '[' + Reg.Valores_TXT[2] + ']' +
          '[' + Reg.Valores_TXT[3] + ']' ) ;
Tick_Local := GetTickCount - Tick_Local ;
If Tick_Local > DEF_TIMEOUT_PROC Then Begin
   PUT_LOG ( 'PROC/EXECUTE_PLAY_CHYRON_OUT_GC [' + IntToStr(Tick_Local) ) ;
End ;
POP_TICK ( 'EXECUTE PLAY_CHYRON_OUT_GC' ) ;
_Debug ( 'FIM EXECUTE PLAY_CHYRON_OUT_GC' ) ;
{$ENDIF}
End ;

Procedure EXEC_DIRETO_APAGAR_VOLATEIS ;
Begin
EXECUTE_PLAY_CHYRON_OUT_GC ( -2, 'RR_REMOVER_VOLATEIS_EFFECT_OUT', 0,
                             '', '', '', '', '', '' ) ;
End ;

Procedure EXEC_DIRETO_SELO_MOV_ESPORTE ;
Begin
EXECUTE_PLAY_CHYRON_OUT_GC ( -2, 'EXEC_SELO_MOV_ESPORTE', 0, '', '', '', '', '', '' ) ;
End ;

Procedure EXEC_DIRETO_SEREIA_ARQUIVO ;
Begin
EXECUTE_PLAY_CHYRON_OUT_GC ( -2, 'SEREIA_ARQUIVO', 0, '', '', '', '', '', '' ) ;
AJUSTAR_FLAGS_DE_EXIBICAO ( -1, 'SEREIA_ARQUIVO' ) ;
End ;

Procedure EXEC_DIRETO_SEREIA_EXCLUSIVO ;
Begin
EXECUTE_PLAY_CHYRON_OUT_GC ( -2, 'SEREIA_EXCLUSIVO', 0, '', '', '', '', '', '' ) ;
AJUSTAR_FLAGS_DE_EXIBICAO ( -1, 'SEREIA_EXCLUSIVO' ) ;
End ;

Procedure EXEC_DIRETO_SELO_NEUTRO ( Selo : LongInt ) ;
Begin
{$IFDEF NW}
If Preferencias_GC.Usar_Selos_Animados Then Begin
   EXECUTE_PLAY_CHYRON_OUT_GC ( -2,
                                'indice=' + IntToStr(Selo) + '~' +
                                'EXEC_SELO_NEUTRO_MOV',
                                0, '', '', '',
                                RD.RD_VAR_ESPELHO_ATUAL.Jornal, '', '' ) ;
End Else Begin
   EXECUTE_PLAY_CHYRON_OUT_GC ( -2,
                                'indice=' + IntToStr(Selo) + '~' +
                                'EXEC_SELO_NEUTRO_PNG',
                                0, '', '', '',
                                RD.RD_VAR_ESPELHO_ATUAL.Jornal, '', '' ) ;
End ;
{$ENDIF}
End ;

Procedure EXEC_DIRETO_G1 ;
Begin
{$IFDEF USAR_CHYRON}
EXECUTE_PLAY_CHYRON_OUT_GC ( 0, 'RR_ARTE', 110, 'g1.com.br/ce',
                             '', '',
                             RD.RD_VAR_ESPELHO_ATUAL.Jornal, '', '110/G1' ) ;
{$ENDIF}
End ;

Procedure EXEC_DIRETO_A_SEGUIR ;
Begin
{$IFDEF USAR_CHYRON}
EXECUTE_PLAY_CHYRON_OUT_GC ( 0, 'RR_ARTE', DEF_MSG_CHYRON_A_SEGUIR ,
                             '', '', '',
                             RD.RD_VAR_ESPELHO_ATUAL.Jornal, '', 'A SEGUIR' ) ;
{$ENDIF}
End ;

Procedure EXEC_DIRETO_REM_VOLATEIS ;
Begin
EXECUTE_PLAY_CHYRON_OUT_GC ( -2, 'REM_VOLATEIS', 0, '', '', '', '', '', '' ) ;
End ;

Procedure EXEC_DIRETO_REM_VOLATEIS_REM_RELOGIO ;
Begin
EXECUTE_PLAY_CHYRON_OUT_GC ( -2, 'REM_VOLATEIS_REM_RELOGIO', 0, '', '', '',
                             '', '', '' ) ;
End ;

Procedure EXEC_DIRETO_REM_TUDO_LIGHT_REM_SEREIA ;
Begin
EXECUTE_PLAY_CHYRON_OUT_GC ( -2, 'REM_TUDO_LIGHT_REM_SEREIA', 0, '', '', '', '', '', '' ) ;
AJUSTAR_FLAGS_DE_EXIBICAO ( -1, 'SEREIA_ESCONDE' ) ;
End ;

Procedure EXEC_DIRETO_REM_TUDO_LIGHT ;
Begin
EXECUTE_PLAY_CHYRON_OUT_GC ( -2, 'REM_TUDO_LIGHT', 0, '', '', '', '', '', '' ) ;
AJUSTAR_FLAGS_DE_EXIBICAO ( -1, 'SEREIA_ESCONDE' ) ;
End ;

Procedure EXEC_DIRETO_REM_VOLATEIS_REM_RELOGIO_REM_SEREIA ;
Begin
EXECUTE_PLAY_CHYRON_OUT_GC ( -2, 'REM_VOLATEIS_REM_RELOGIO_REM_SEREIA', 0,
                             '', '', '', '', '', '' ) ;
AJUSTAR_FLAGS_DE_EXIBICAO ( -1, 'SEREIA_ESCONDE' ) ;
End ;

Procedure EXEC_DIRETO_REM_VOLATEIS_LOGO_MARCA ;
Begin
EXECUTE_PLAY_CHYRON_OUT_GC ( -2, 'REM_VOLATEIS_LOGO_MARCA', 0,
                             '', '', '', '', '', '' ) ;
AJUSTAR_FLAGS_DE_EXIBICAO ( -1, 'SEREIA_MARCA' ) ;
End ;

Procedure EXEC_DIRETO_REM_VOLATEIS_SEM_LOGO ;
Begin
EXECUTE_PLAY_CHYRON_OUT_GC ( -2, 'REM_VOLATEIS_SEM_LOGO', 0,
                             '', '', '', '', '', '' ) ;
AJUSTAR_FLAGS_DE_EXIBICAO ( -1, 'SEREIA_ESCONDE' ) ;
End ;

Procedure EXEC_DIRETO_REM_VOLATEIS_E_SEREIA ;
Begin
EXECUTE_PLAY_CHYRON_OUT_GC ( -2, 'REM_VOLATEIS_E_SEREIA', 0,
                             '', '', '', '', '', '' ) ;
AJUSTAR_FLAGS_DE_EXIBICAO ( -1, 'SEREIA_ESCONDE' ) ;
End ;

Procedure EXEC_DIRETO_WHATSAPP ;
Begin
{$IFDEF USAR_CHYRON}
EXECUTE_PLAY_CHYRON_OUT_GC ( 0, 'RR_ARTE', 240, '(85)9 8887 5065',
                             '', '', RD.RD_VAR_ESPELHO_ATUAL.Jornal, '', '240/WA' ) ;
{$ENDIF}
End ;

Procedure EXEC_DIRETO_REMOVER_RELOGIO ;
Begin
{$IFDEF USAR_CHYRON}
EXECUTE_PLAY_CHYRON_OUT_GC ( -2, 'RELOGIO_ESCONDE', 0,
                             '', '', '', RD.RD_VAR_ESPELHO_ATUAL.Jornal, '', '' ) ;
{$ENDIF}
End ;

Procedure EXEC_DIRETO_SOMENTE_RELOGIO ;
Begin
{$IFDEF USAR_CHYRON}
EXECUTE_PLAY_CHYRON_OUT_GC ( -2, 'EXEC_ATIVAR_RELOGIO', 0,
                             '', '', '', RD.RD_VAR_ESPELHO_ATUAL.Jornal, '', '' ) ;
{$ENDIF}
End ;

Procedure EXEC_DIRETO_APAGAR_VOLATEIS_ADD_RELOGIO ;
Begin
EXECUTE_PLAY_CHYRON_OUT_GC ( -2, 'REM_VOLATEIS_ADD_RELOGIO', 0,
                             '', '', '', '', '', ''  ) ;
End ;

Procedure EXEC_DIRETO_REM_VOLATEIS_ADD_RELOGIO ;
Begin
{$IFDEF USAR_CHYRON}
EXECUTE_PLAY_CHYRON_OUT_GC ( -2, 'REM_VOLATEIS_ADD_RELOGIO', 0,
                             '', '', '', RD.RD_VAR_ESPELHO_ATUAL.Jornal, '', '' ) ;
{$ENDIF}
End ;

Procedure EXEC_DIRETO_ALTERNAR_RELOGIO ;
Begin
{$IFDEF USAR_CHYRON}
EXECUTE_PLAY_CHYRON_OUT_GC ( -2, 'ALTERNAR_RELOGIO', 0,
                             '', '', '', RD.RD_VAR_ESPELHO_ATUAL.Jornal, '', '' ) ;
{$ENDIF}
End ;

Procedure EXEC_DIRETO_ATIVAR_RELOGIO_REAL ;
Begin
{$IFDEF USAR_CHYRON}
EXECUTE_PLAY_CHYRON_OUT_GC ( -2, 'RELOGIO_MODO_REAL', 0,
                             '', '', '', RD.RD_VAR_ESPELHO_ATUAL.Jornal, '', '' ) ;
{$ENDIF}
End ;

Procedure EXEC_DIRETO_ATIVAR_RELOGIO_FAKE ( Horario : String ) ;
Begin
//PUT_LOG (  'SETAR RELOGIO FAKE [' + Horario + ']' ) ;
{$IFDEF USAR_CHYRON}
EXECUTE_PLAY_CHYRON_OUT_GC ( -2, 'timer_fake=' + ASPAS_CHYRON ( Horario ) + sLineBreak +
                                 'RELOGIO_MODO_FAKE', 0,
                             '', '', '', RD.RD_VAR_ESPELHO_ATUAL.Jornal, '', '' ) ;
{$ENDIF}
End ;

Procedure EXEC_DIRETO_ATIVAR_E_EXIBIR_RELOGIO_FAKE ( Horario : String ) ;
Begin
{$IFDEF USAR_CHYRON}
//PUT_LOG (  'SETAR RELOGIO FAKE [' + Horario + ']' ) ;
EXECUTE_PLAY_CHYRON_OUT_GC ( -2, 'timer_fake=' + ASPAS_CHYRON ( Horario ) + sLineBreak +
                                 'RELOGIO_MODO_FAKE_E_EXIBIR', 0,
                             '', '', '', RD.RD_VAR_ESPELHO_ATUAL.Jornal, '', '' ) ;
{$ENDIF}
End ;

Procedure EXEC_DIRETO_RELOGIO_ON ;
Begin
{$IFDEF USAR_CHYRON}
EXECUTE_PLAY_CHYRON_OUT_GC ( -2, 'RELOGIO_ON', 0,
                             '', '', '', RD.RD_VAR_ESPELHO_ATUAL.Jornal, '', '' ) ;
{$ENDIF}
End ;

Procedure EXEC_DIRETO_RELOGIO_OFF ;
Begin
{$IFDEF USAR_CHYRON}
EXECUTE_PLAY_CHYRON_OUT_GC ( -2, 'RELOGIO_OFF', 0,
                             '', '', '', RD.RD_VAR_ESPELHO_ATUAL.Jornal, '', '' ) ;
{$ENDIF}
End ;

Procedure EXEC_INICIALIZAR_CHAMADA_MARCA ;
Begin
{$IFDEF USAR_CHYRON}
EXECUTE_PLAY_CHYRON_OUT_GC ( -2, 'INICIALIZAR_CHAMADA_MARCA', 0,
                             '', '', '', RD.RD_VAR_ESPELHO_ATUAL.Jornal, '', '' ) ;
{$ENDIF}
End ;

Procedure EXEC_INICIALIZAR_CHAMADA_VIVO ;
Begin
{$IFDEF USAR_CHYRON}
EXECUTE_PLAY_CHYRON_OUT_GC ( -2, 'INICIALIZAR_CHAMADA_VIVO', 0,
                             '', '', '', RD.RD_VAR_ESPELHO_ATUAL.Jornal, '', '' ) ;
{$ENDIF}
End ;

Procedure EXEC_DIRETO_VEM_VEM ;
Begin
{$IFDEF USAR_CHYRON}
EXECUTE_PLAY_CHYRON_OUT_GC ( -2, 'EXEC_VEM_CHEGANDO', 0,
                             '', '', '', RD.RD_VAR_ESPELHO_ATUAL.Jornal, '', '' ) ;
{$ENDIF}
End ;

Procedure EXEC_DIRETO_JORNAL_INICIALIZACAO ;
Begin
{$IFDEF USAR_CHYRON}
EXECUTE_PLAY_CHYRON_OUT_GC ( -2, 'EXEC_JORNAL_INICIALIZAR', 0,
                             '', '', '', RD.RD_VAR_ESPELHO_ATUAL.Jornal, '', '' ) ;
AJUSTAR_FLAGS_DE_EXIBICAO ( -1, 'SEREIA_EXCLUSIVO' ) ;
//RD.RD_VAR_STATUS_LOGO := DEF_LOGO_VIVO ;
{$ENDIF}
End ;

Procedure EXEC_DIRETO_RELOGIO_SEREIA ;
Begin
{$IFDEF USAR_CHYRON}
EXECUTE_PLAY_CHYRON_OUT_GC ( -2, 'EXEC_ATIVAR_RELOGIO_SEREIA', 0,
                             '', '', '', RD.RD_VAR_ESPELHO_ATUAL.Jornal, '', '' ) ;
AJUSTAR_FLAGS_DE_EXIBICAO ( -1, 'SEREIA_MARCA' ) ;
{$ENDIF}
End ;

Procedure EXEC_DIRETO_RELOGIO_SEM_SEREIA ;
Begin
{$IFDEF USAR_CHYRON}
EXECUTE_PLAY_CHYRON_OUT_GC ( -2, 'EXEC_ATIVAR_RELOGIO_SEM_SEREIA', 0,
                             '', '', '', RD.RD_VAR_ESPELHO_ATUAL.Jornal, '', '' ) ;
AJUSTAR_FLAGS_DE_EXIBICAO ( -1, 'SEREIA_ESCONDE' ) ;
{$ENDIF}
End ;

Procedure EXEC_DIRETO_SEREIA_MARCA ;
Begin
{$IFDEF USAR_CHYRON}
EXECUTE_PLAY_CHYRON_OUT_GC ( -2, 'SEREIA_MARCA', 0, '', '', '', '', '', '' ) ;
AJUSTAR_FLAGS_DE_EXIBICAO ( -1, 'SEREIA_MARCA' ) ;
{$ENDIF}
End ;

Procedure EXEC_DIRETO_SEREIA_ESCONDE ;
Begin
{$IFDEF USAR_CHYRON}
EXECUTE_PLAY_CHYRON_OUT_GC ( -2, 'SEREIA_ESCONDE', 0, '', '', '', '', '', '' ) ;
AJUSTAR_FLAGS_DE_EXIBICAO ( -1, 'SEREIA_ESCONDE' ) ;
{$ENDIF}
End ;

Procedure EXEC_DIRETO_ULTIMA_TARJA_FIXA ;
Begin
{$IFDEF USAR_CHYRON}
EXECUTE_PLAY_CHYRON_OUT_GC ( -2, 'RR_ATALHO_ULTIMA_FIXA', 0,
                             '', '', '', RD.RD_VAR_ESPELHO_ATUAL.Jornal, '', '' ) ;
{$ENDIF}
End ;

Procedure EXEC_DIRETO_SEREIA_VIVO ;
Begin
{$IFDEF USAR_CHYRON}
EXECUTE_PLAY_CHYRON_OUT_GC ( -2, 'SEREIA_VIVO', 0, '', '', '', '', '', '' ) ;
AJUSTAR_FLAGS_DE_EXIBICAO ( -1, 'SEREIA_VIVO' ) ;
{$ENDIF}
End ;

Procedure EXEC_DIRETO_FICHA_CURTA ;
Begin
{$IFDEF USAR_CHYRON}
EXECUTE_PLAY_CHYRON_OUT_GC ( -2, 'RR_FICHA_CURTA', 0, '', '', '',
                             RD.RD_VAR_ESPELHO_ATUAL.Jornal, '',
                             'RR_FICHA_CURTA' ) ;
{$ENDIF}
End ;

Procedure EXEC_DIRETO_FICHA_LONGA ;
Begin
{$IFDEF USAR_CHYRON}
EXECUTE_PLAY_CHYRON_OUT_GC ( -2, 'RR_FICHA_LONGA', 0, '', '', '',
                             RD.RD_VAR_ESPELHO_ATUAL.Jornal, '',
                             'RR_FICHA_LONGA' ) ;
{$ENDIF}
End ;

Procedure EXEC2_DIRETO_SEREIA_ALTERNAR_VIVO ;
Begin
{$IFDEF USAR_CHYRON}
If RD_VAR_STATUS_LOGO = DEF_LOGO_SEM Then Begin
   EXEC_DIRETO_SEREIA_MARCA ;
End Else If RD_VAR_STATUS_LOGO = DEF_LOGO_VIVO Then Begin
   EXEC_DIRETO_SEREIA_MARCA ;
End Else Begin
   EXEC_DIRETO_SEREIA_VIVO ;
End ;
{$ENDIF}
End ;

Procedure EXEC_DIRETO_SEREIA_ALTERNAR_VIVO ;
Begin
{$IFDEF USAR_CHYRON}
{$IFDEF NW}
If Preferencias_GC.Fixar_Marca_Dagua Then Begin
   EXEC2_DIRETO_SEREIA_ALTERNAR_VIVO ;
End Else Begin
   If RD_VAR_STATUS_LOGO = DEF_LOGO_VIVO Then Begin
      EXEC_DIRETO_SEREIA_ESCONDE ;
   End Else Begin
      EXEC_DIRETO_SEREIA_VIVO ;
   End ;
End ;
{$ELSE}
   EXEC2_DIRETO_SEREIA_ALTERNAR_VIVO ;
{$ENDIF}
{$ENDIF}
End ;

Procedure EXEC2_DIRETO_SEREIA_ALTERNAR_VIVO_INICIAR_VIVO ;
Begin
If RD_VAR_STATUS_LOGO = DEF_LOGO_SEM Then Begin
   EXEC_DIRETO_SEREIA_VIVO ;
End Else If RD_VAR_STATUS_LOGO = DEF_LOGO_VIVO Then Begin
   EXEC_DIRETO_SEREIA_MARCA ;
End Else Begin
   EXEC_DIRETO_SEREIA_VIVO ;
End ;
End ;

Procedure EXEC_DIRETO_SEREIA_ALTERNAR_VIVO_INICIAR_VIVO ;
Begin
{$IFDEF NW}
If Preferencias_GC.Fixar_Marca_Dagua Then Begin
   EXEC2_DIRETO_SEREIA_ALTERNAR_VIVO_INICIAR_VIVO ;
End Else Begin
   If RD_VAR_STATUS_LOGO = DEF_LOGO_VIVO Then Begin
      EXEC_DIRETO_SEREIA_ESCONDE ;
   End Else Begin
      EXEC_DIRETO_SEREIA_VIVO ;
   End ;
End ;
{$ELSE}
   EXEC2_DIRETO_SEREIA_ALTERNAR_VIVO_INICIAR_VIVO ;
{$ENDIF}
End ;

Procedure EXEC2_DIRETO_SEREIA_ALTERNAR_EXCLUSIVO ;
Begin
If RD_VAR_STATUS_LOGO = DEF_LOGO_SEM Then Begin
   EXEC_DIRETO_SEREIA_EXCLUSIVO ;
End Else If RD_VAR_STATUS_LOGO = DEF_LOGO_EXCLUSIVO Then Begin
   EXEC_DIRETO_SEREIA_MARCA ;
End Else Begin
   EXEC_DIRETO_SEREIA_EXCLUSIVO ;
End ;
End ;

Procedure EXEC_DIRETO_SEREIA_ALTERNAR_EXCLUSIVO ;
Begin
{$IFDEF NW}
If Preferencias_GC.Fixar_Marca_Dagua Then Begin
   EXEC2_DIRETO_SEREIA_ALTERNAR_EXCLUSIVO ;
End Else Begin
   If RD_VAR_STATUS_LOGO = DEF_LOGO_EXCLUSIVO Then Begin
      EXEC_DIRETO_SEREIA_ESCONDE ;
   End Else Begin
      EXEC_DIRETO_SEREIA_EXCLUSIVO ;
   End ;
End ;
{$ELSE}
   EXEC2_DIRETO_SEREIA_ALTERNAR_EXCLUSIVO ;
{$ENDIF}
End ;

Procedure EXEC2_DIRETO_SEREIA_ALTERNAR_ARQUIVO ;
Begin
If RD_VAR_STATUS_LOGO = DEF_LOGO_SEM Then Begin
   EXEC_DIRETO_SEREIA_ARQUIVO ;
End Else If RD_VAR_STATUS_LOGO = DEF_LOGO_ARQUIVO Then Begin
   EXEC_DIRETO_SEREIA_MARCA ;
End Else Begin
   EXEC_DIRETO_SEREIA_ARQUIVO ;
End ;
End ;

Procedure EXEC_DIRETO_SEREIA_ALTERNAR_ARQUIVO ;
Begin
{$IFDEF NW}
If Preferencias_GC.Fixar_Marca_Dagua Then Begin
   EXEC2_DIRETO_SEREIA_ALTERNAR_ARQUIVO ;
End Else Begin
   If RD_VAR_STATUS_LOGO = DEF_LOGO_ARQUIVO Then Begin
      EXEC_DIRETO_SEREIA_ESCONDE ;
   End Else Begin
      EXEC_DIRETO_SEREIA_ARQUIVO ;
   End ;
End ;
{$ELSE}
   EXEC2_DIRETO_SEREIA_ALTERNAR_ARQUIVO ;
{$ENDIF}
End ;

Procedure EXEC_DIRETO_SEREIA_ALTERNAR_MARCA ;
Begin
If RD_VAR_STATUS_LOGO <> DEF_LOGO_MARCA Then Begin
   EXEC_DIRETO_SEREIA_MARCA ;
End Else Begin
   EXEC_DIRETO_SEREIA_ESCONDE ;
End ;
End ;

Procedure EXEC_DIRETO_APAGAR_TUDO ;
Begin
EXECUTE_PLAY_CHYRON_OUT_GC ( -2, 'RR_REMOVER_TUDO', 0, '', '', '', '', '', '' ) ;
AJUSTAR_FLAGS_DE_EXIBICAO ( -1, 'SEREIA_ESCONDE' ) ;
End ;

Procedure EXEC_DIRETO_TELEFONE ( Telefone : String ) ;
Begin
{$IFDEF USAR_CHYRON}
EXECUTE_PLAY_CHYRON_OUT_GC ( 0, 'RR_ARTE', 242, Telefone,
                             '', '', RD.RD_VAR_ESPELHO_ATUAL.Jornal, '', '242/TEL' ) ;
{$ENDIF}
End ;

Procedure EXEC_DIRETO_INFORMACAO ( Informacao1, Informacao2 : String ) ;
Begin
{$IFDEF USAR_CHYRON}
EXECUTE_PLAY_CHYRON_OUT_GC ( 0, 'RR_ARTE', 5086,
                             Informacao1, Informacao2, '',
                             RD.RD_VAR_ESPELHO_ATUAL.Jornal, '', '5086/INFO' ) ;
{$ENDIF}
End ;

End.

