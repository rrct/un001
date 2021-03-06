object Chyron_Basico: TChyron_Basico
  Left = 0
  Top = 0
  Caption = 'Console Chyron'
  ClientHeight = 649
  ClientWidth = 939
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  KeyPreview = True
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnMouseMove = FormMouseMove
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PC_Tecnica: TPageControl
    Left = 0
    Top = 28
    Width = 939
    Height = 621
    ParentCustomHint = False
    ActivePage = TS_Tecnica_Configuracao
    Align = alClient
    BiDiMode = bdLeftToRight
    DoubleBuffered = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBiDiMode = False
    ParentDoubleBuffered = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 0
    StyleElements = []
    OnChange = PC_TecnicaChange
    OnMouseMove = PC_TecnicaMouseMove
    object TS_Tecnica_Configuracao: TTabSheet
      ParentCustomHint = False
      Caption = 'Configura'#231#227'o'
      DoubleBuffered = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentDoubleBuffered = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      object Label24: TLabel
        Left = 12
        Top = 10
        Width = 100
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Drive:'
      end
      object Label25: TLabel
        Left = 12
        Top = 38
        Width = 100
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Diret'#243'rio:'
      end
      object Label82: TLabel
        Left = 120
        Top = 149
        Width = 270
        Height = 14
        Caption = 'Testar periodicamente o link LAN a cada '
      end
      object Label84: TLabel
        Left = 120
        Top = 172
        Width = 276
        Height = 14
        Caption = 'Testar periodicamente o link WAN a cada '
      end
      object Label83: TLabel
        Left = 456
        Top = 149
        Width = 62
        Height = 14
        Caption = 'segundos'
      end
      object Label85: TLabel
        Left = 463
        Top = 172
        Width = 62
        Height = 14
        Caption = 'segundos'
      end
      object ED_Drive: TEdit
        Left = 118
        Top = 7
        Width = 71
        Height = 22
        TabOrder = 0
        Text = 'ED_Drive'
      end
      object ED_Diretorio: TEdit
        Left = 118
        Top = 35
        Width = 367
        Height = 22
        TabOrder = 1
        Text = 'ED_Diretorio'
      end
      object Bot_Selecionar_Diretorio: TButton
        Left = 118
        Top = 62
        Width = 151
        Height = 25
        Caption = 'Selecionar diret'#243'rio'
        TabOrder = 2
        OnClick = Bot_Selecionar_DiretorioClick
      end
      object CK_Conexao_LAN: TCheckBox
        Left = 118
        Top = 93
        Width = 183
        Height = 17
        Caption = 'Conex'#227'o Telnet LAN'
        Checked = True
        State = cbChecked
        TabOrder = 3
        OnClick = CK_Conexao_LANClick
      end
      object CK_Conexao_WAN: TCheckBox
        Left = 118
        Top = 116
        Width = 183
        Height = 17
        Caption = 'Conex'#227'o Telnet WAN'
        Checked = True
        State = cbChecked
        TabOrder = 4
        OnClick = CK_Conexao_WANClick
      end
      object SP_Testar_Link_LAN: TSpinEdit
        Left = 389
        Top = 143
        Width = 62
        Height = 22
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxValue = 3600
        MinValue = 0
        ParentFont = False
        TabOrder = 5
        Value = 60
        OnClick = SP_Testar_Link_LANClick
      end
      object SP_Testar_Link_WAN: TSpinEdit
        Left = 397
        Top = 169
        Width = 62
        Height = 22
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxValue = 3600
        MinValue = 0
        ParentFont = False
        TabOrder = 6
        Value = 60
        OnClick = SP_Testar_Link_WANClick
      end
      object CK_Limpar_Frame_Buffer: TCheckBox
        Left = 120
        Top = 271
        Width = 249
        Height = 17
        Hint = 'Limpar Frame Buffer antes de cada exibi'#231#227'o.'
        Caption = 'Limpar FB antes de eixbir uma arte'
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        State = cbChecked
        TabOrder = 7
        OnClick = CK_Limpar_Frame_BufferClick
      end
    end
    object TS_Tecnica_Template: TTabSheet
      Caption = 'Template'
      ImageIndex = 5
      object PN_Template: TPanel
        Left = 0
        Top = 0
        Width = 931
        Height = 437
        ParentCustomHint = False
        Align = alTop
        BiDiMode = bdLeftToRight
        Color = 3290417
        Ctl3D = True
        DoubleBuffered = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBiDiMode = False
        ParentBackground = False
        ParentCtl3D = False
        ParentDoubleBuffered = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 0
        object Label11: TLabel
          Left = 12
          Top = 11
          Width = 100
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Template existente:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label12: TLabel
          Left = 12
          Top = 39
          Width = 100
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Novo template:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label13: TLabel
          Left = 12
          Top = 67
          Width = 100
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Campo-1:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label14: TLabel
          Left = 12
          Top = 94
          Width = 100
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Campo-2:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label15: TLabel
          Left = 12
          Top = 121
          Width = 100
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Campo-3:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label16: TLabel
          Left = 12
          Top = 148
          Width = 100
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Campo-4:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label17: TLabel
          Left = 12
          Top = 175
          Width = 100
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Campo-5:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label18: TLabel
          Left = 12
          Top = 202
          Width = 100
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Campo-6:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label19: TLabel
          Left = 12
          Top = 229
          Width = 100
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Campo-7:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label20: TLabel
          Left = 12
          Top = 256
          Width = 100
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Campo-8:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label21: TLabel
          Left = 12
          Top = 283
          Width = 100
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Campo-9:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label22: TLabel
          Left = 12
          Top = 310
          Width = 100
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Campo-10:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label23: TLabel
          Left = 12
          Top = 383
          Width = 100
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Comando direto:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label50: TLabel
          Left = 497
          Top = 351
          Width = 53
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Hotkey:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object ED_Campo_1: TEdit
          Left = 118
          Top = 64
          Width = 207
          Height = 21
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          Text = 'ED_Campo_1'
        end
        object SP_Template_Existente: TSpinEdit
          Tag = 10
          Left = 118
          Top = 8
          Width = 81
          Height = 22
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxValue = 100000
          MinValue = 0
          ParentFont = False
          TabOrder = 0
          Value = 10
          OnChange = SP_Template_ExistenteChange
          OnClick = SP_Template_ExistenteClick
        end
        object SP_Novo_Template: TSpinEdit
          Left = 118
          Top = 36
          Width = 81
          Height = 22
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxValue = 100000
          MinValue = 0
          ParentFont = False
          TabOrder = 1
          Value = 2500
          OnChange = SP_Novo_TemplateChange
          OnClick = SP_Novo_TemplateClick
        end
        object ED_Campo_2: TEdit
          Left = 118
          Top = 91
          Width = 207
          Height = 21
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          Text = 'ED_Campo_2'
        end
        object ED_Campo_3: TEdit
          Left = 118
          Top = 118
          Width = 207
          Height = 21
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          Text = 'ED_Campo_3'
        end
        object ED_Campo_4: TEdit
          Left = 118
          Top = 145
          Width = 207
          Height = 21
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          Text = 'ED_Campo_4'
        end
        object ED_Campo_5: TEdit
          Left = 118
          Top = 172
          Width = 207
          Height = 21
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
          Text = 'ED_Campo_5'
        end
        object ED_Campo_6: TEdit
          Left = 118
          Top = 199
          Width = 207
          Height = 21
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 7
          Text = 'ED_Campo_6'
        end
        object ED_Campo_7: TEdit
          Left = 118
          Top = 226
          Width = 207
          Height = 21
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 8
          Text = 'ED_Campo_7'
        end
        object ED_Campo_8: TEdit
          Left = 118
          Top = 253
          Width = 207
          Height = 21
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 9
          Text = 'ED_Campo_8'
        end
        object ED_Campo_9: TEdit
          Left = 118
          Top = 280
          Width = 207
          Height = 21
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 10
          Text = 'ED_Campo_9'
        end
        object ED_Campo_10: TEdit
          Left = 118
          Top = 307
          Width = 207
          Height = 21
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 11
          Text = 'ED_Campo_10'
        end
        object Bot_Enviar: TButton
          Left = 118
          Top = 334
          Width = 207
          Height = 25
          Caption = 'Atualizar campos do template'
          TabOrder = 12
        end
        object Bot_Conectar: TButton
          Left = 497
          Top = 288
          Width = 140
          Height = 25
          Caption = 'Conectar'
          ImageIndex = 32
          ImageMargins.Left = 10
          TabOrder = 13
          OnClick = Bot_ConectarClick
        end
        object ED_Comando: TEdit
          Left = 118
          Top = 380
          Width = 207
          Height = 21
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 14
          Text = 'U\2001\1\Ricardo'
          OnDblClick = ED_ComandoDblClick
        end
        object Bot_Comando_Direto: TButton
          Left = 118
          Top = 407
          Width = 103
          Height = 25
          Caption = 'Comando direto'
          TabOrder = 15
          OnClick = Bot_Comando_DiretoClick
        end
        object Bot_Clear_Canvas: TButton
          Left = 341
          Top = 274
          Width = 118
          Height = 25
          Hint = 'Y\<CD>'
          Caption = 'Clear Canvas'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 16
          OnClick = Bot_Clear_CanvasClick
        end
        object Bot_Continuar: TButton
          Left = 341
          Top = 301
          Width = 118
          Height = 25
          Hint = 'V\5\15'
          Caption = 'Continuar'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 17
          OnClick = Bot_ContinuarClick
        end
        object Bot_Play: TButton
          Left = 341
          Top = 328
          Width = 118
          Height = 25
          Hint = 'V\6'
          Caption = 'Play'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 18
          OnClick = Bot_PlayClick
        end
        object Bot_Read_Message_Update: TButton
          Left = 341
          Top = 221
          Width = 118
          Height = 25
          Hint = 'V\5\13\1<FRAMEBUFFER><TEMPLATE><DISPLAYMODE><DATA>'
          Caption = 'Read + Update'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 19
        end
        object PN_Template_Efeito_IN: TPanel
          Left = 497
          Top = 11
          Width = 64
          Height = 233
          BevelInner = bvLowered
          BevelOuter = bvNone
          TabOrder = 20
          object RB_Efeito_IN_01: TRadioButton
            Left = 8
            Top = 26
            Width = 45
            Height = 17
            Caption = '01'
            Checked = True
            TabOrder = 0
            TabStop = True
          end
          object RB_Efeito_IN_02: TRadioButton
            Left = 8
            Top = 46
            Width = 45
            Height = 17
            Caption = '02'
            TabOrder = 1
          end
          object PN_Header_Efeito_IN: TPanel
            Left = 1
            Top = 1
            Width = 62
            Height = 21
            ParentCustomHint = False
            Align = alTop
            BevelOuter = bvNone
            BiDiMode = bdLeftToRight
            Caption = 'Efeito IN'
            Color = 3290417
            Ctl3D = True
            DoubleBuffered = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentBiDiMode = False
            ParentBackground = False
            ParentCtl3D = False
            ParentDoubleBuffered = False
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
            TabOrder = 2
          end
          object RB_Efeito_IN_03: TRadioButton
            Left = 8
            Top = 67
            Width = 45
            Height = 17
            Caption = '03'
            TabOrder = 3
          end
          object RB_Efeito_IN_04: TRadioButton
            Left = 8
            Top = 88
            Width = 45
            Height = 17
            Caption = '04'
            TabOrder = 4
          end
          object RB_Efeito_IN_05: TRadioButton
            Left = 8
            Top = 108
            Width = 45
            Height = 17
            Caption = '05'
            TabOrder = 5
          end
          object RB_Efeito_IN_06: TRadioButton
            Left = 8
            Top = 129
            Width = 45
            Height = 17
            Caption = '06'
            TabOrder = 6
          end
          object RB_Efeito_IN_07: TRadioButton
            Left = 8
            Top = 149
            Width = 45
            Height = 17
            Caption = '07'
            TabOrder = 7
          end
          object RB_Efeito_IN_08: TRadioButton
            Left = 8
            Top = 169
            Width = 45
            Height = 17
            Caption = '08'
            TabOrder = 8
          end
          object RB_Efeito_IN_09: TRadioButton
            Left = 8
            Top = 190
            Width = 45
            Height = 17
            Caption = '09'
            TabOrder = 9
          end
          object RB_Efeito_IN_10: TRadioButton
            Left = 8
            Top = 210
            Width = 45
            Height = 17
            Caption = '10'
            TabOrder = 10
          end
        end
        object PN_Template_Efeito_OUT: TPanel
          Left = 573
          Top = 10
          Width = 64
          Height = 233
          BevelInner = bvLowered
          BevelOuter = bvNone
          TabOrder = 21
          object RB_Efeito_OUT_01: TRadioButton
            Left = 8
            Top = 28
            Width = 45
            Height = 17
            Caption = '01'
            Checked = True
            TabOrder = 0
            TabStop = True
          end
          object RB_Efeito_OUT_02: TRadioButton
            Left = 8
            Top = 46
            Width = 45
            Height = 17
            Caption = '02'
            TabOrder = 1
          end
          object PN_Header_Efeito_OUT: TPanel
            Left = 1
            Top = 1
            Width = 62
            Height = 21
            ParentCustomHint = False
            Align = alTop
            BevelOuter = bvNone
            BiDiMode = bdLeftToRight
            Caption = 'Efeito OUT'
            Color = 3290417
            Ctl3D = True
            DoubleBuffered = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentBiDiMode = False
            ParentBackground = False
            ParentCtl3D = False
            ParentDoubleBuffered = False
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
            TabOrder = 2
          end
          object RB_Efeito_OUT_03: TRadioButton
            Left = 8
            Top = 67
            Width = 45
            Height = 17
            Caption = '03'
            TabOrder = 3
          end
          object RB_Efeito_OUT_04: TRadioButton
            Left = 8
            Top = 88
            Width = 45
            Height = 17
            Caption = '04'
            TabOrder = 4
          end
          object RB_Efeito_OUT_05: TRadioButton
            Left = 8
            Top = 108
            Width = 45
            Height = 17
            Caption = '05'
            TabOrder = 5
          end
          object RB_Efeito_OUT_06: TRadioButton
            Left = 8
            Top = 129
            Width = 45
            Height = 17
            Caption = '06'
            TabOrder = 6
          end
          object RB_Efeito_OUT_07: TRadioButton
            Left = 8
            Top = 149
            Width = 45
            Height = 17
            Caption = '07'
            TabOrder = 7
          end
          object RB_Efeito_OUT_08: TRadioButton
            Left = 8
            Top = 169
            Width = 45
            Height = 17
            Caption = '08'
            TabOrder = 8
          end
          object RB_Efeito_OUT_09: TRadioButton
            Left = 8
            Top = 190
            Width = 45
            Height = 17
            Caption = '09'
            TabOrder = 9
          end
          object RB_Efeito_OUT_10: TRadioButton
            Left = 8
            Top = 210
            Width = 45
            Height = 17
            Caption = '10'
            TabOrder = 10
          end
        end
        object Bot_Efeito_IN: TButton
          Left = 497
          Top = 250
          Width = 64
          Height = 25
          Hint = 'V\6<IN>'
          Caption = 'Efeito IN'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 22
        end
        object Bot_Efeito_OUT: TButton
          Left = 573
          Top = 249
          Width = 64
          Height = 25
          Hint = 'V\6<OUT>'
          Caption = 'Efeito OUT'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 23
        end
        object Bot_Read_Message: TButton
          Left = 341
          Top = 194
          Width = 118
          Height = 25
          Hint = 'V\5\3\1<FRAMEBUFFER><TEMPLATE><DISPLAYMODE>'
          Caption = 'Read'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 24
          OnClick = Bot_Read_MessageClick
        end
        object Bot_Read_Update_FB1: TButton
          Left = 341
          Top = 247
          Width = 117
          Height = 25
          Caption = 'Read/Update/FB1'
          TabOrder = 25
          OnClick = Bot_Read_Update_FB1Click
        end
        object Bot_Abortar: TButton
          Left = 342
          Top = 355
          Width = 118
          Height = 25
          Hint = 'V\<1B>'
          Caption = 'Abortar'
          ImageIndex = 83
          ImageMargins.Left = 10
          ParentShowHint = False
          ShowHint = True
          TabOrder = 26
          OnClick = Bot_AbortarClick
        end
        object CK_Responder_X: TCheckBox
          Left = 497
          Top = 328
          Width = 97
          Height = 17
          ParentCustomHint = False
          BiDiMode = bdLeftToRight
          Caption = 'Responder X'
          Checked = True
          Color = 3290417
          Ctl3D = True
          DoubleBuffered = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBiDiMode = False
          ParentColor = False
          ParentCtl3D = False
          ParentDoubleBuffered = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          State = cbChecked
          TabOrder = 27
          OnClick = CK_Responder_XClick
        end
        object Bot_Hotkey: TButton
          Left = 556
          Top = 378
          Width = 80
          Height = 25
          Caption = 'Hotkey'
          TabOrder = 28
        end
        object SP_Hotkey: TSpinEdit
          Left = 556
          Top = 348
          Width = 81
          Height = 22
          Color = clBlack
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          MaxValue = 200
          MinValue = 0
          ParentFont = False
          TabOrder = 29
          Value = 3
        end
        object Bot_Teste_Comunicacao_Chyron: TButton
          Left = 342
          Top = 382
          Width = 117
          Height = 25
          Caption = 'Teste Chyron'
          TabOrder = 30
          OnClick = Bot_Teste_Comunicacao_ChyronClick
        end
      end
      object PN_Rodape_Efeitos: TPanel
        Left = 0
        Top = 437
        Width = 931
        Height = 36
        ParentCustomHint = False
        Align = alTop
        BiDiMode = bdLeftToRight
        Color = 3290417
        Ctl3D = True
        DoubleBuffered = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBiDiMode = False
        ParentBackground = False
        ParentCtl3D = False
        ParentDoubleBuffered = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 1
        object Bot_Read_Update_FB2: TButton
          Left = 511
          Top = 5
          Width = 117
          Height = 25
          Caption = 'Read/Update/FB2'
          TabOrder = 0
          Visible = False
          OnClick = Bot_Read_Update_FB2Click
        end
      end
    end
    object TS_Informacoes: TTabSheet
      Caption = 'Informa'#231#245'es'
      ImageIndex = 2
      object ME_Informacoes: TMemo
        Left = 12
        Top = 60
        Width = 185
        Height = 89
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Fixedsys'
        Font.Style = []
        Lines.Strings = (
          'ME_Informacoes')
        ParentFont = False
        TabOrder = 0
      end
      object PN_Top_TS_Informacoes: TPanel
        Left = 0
        Top = 0
        Width = 931
        Height = 41
        ParentCustomHint = False
        Align = alTop
        BiDiMode = bdLeftToRight
        Ctl3D = True
        DoubleBuffered = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBiDiMode = False
        ParentBackground = False
        ParentCtl3D = False
        ParentDoubleBuffered = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 1
        StyleElements = []
        object Bot_Atualizar_Informacoes: TButton
          Left = 12
          Top = 8
          Width = 93
          Height = 25
          Caption = 'Informa'#231#245'es'
          TabOrder = 0
          OnClick = Bot_Atualizar_InformacoesClick
        end
      end
    end
    object TS_Transicoes: TTabSheet
      Caption = 'Transi'#231#245'es'
      ImageIndex = 3
      object PN_Scenes: TPanel
        Left = 0
        Top = 0
        Width = 281
        Height = 592
        ParentCustomHint = False
        Align = alLeft
        BiDiMode = bdLeftToRight
        Ctl3D = True
        DoubleBuffered = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBiDiMode = False
        ParentBackground = False
        ParentCtl3D = False
        ParentDoubleBuffered = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 0
        StyleElements = []
        object LB_Messages: TListBox
          Left = 1
          Top = 1
          Width = 279
          Height = 397
          Align = alTop
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Items.Strings = (
            '0005 SEREIA'
            '0008 LOGO JORNAL FULL'
            '0010 RELOGIO'
            '0020 APRESENTADOR'
            '0025 GC'
            '0030 Escalada'
            '0040 01 Linha'
            '0050 01 Linha e Titulo'
            '0060 02 Linhas'
            '0070 A seguir'
            '0080 Equipe 1 Nome'
            '0090 Equipe 2 Nomes'
            '0100 Equipe 3 Nomes'
            '0110 Tarja G1'
            '0111 ge.com'
            '0120 GloboPlay'
            '0130 HashTag'
            '0140 Info 1 Linha'
            '0150 Info 1 Linha com Fonte'
            '0160 Info 1 Linha e Titulo'
            '0170 Info 2 Linhas'
            '0180 Tarja Localidade'
            '0190 Tarja Manchete'
            '0200 Tarja Placar'
            '0210 Reporter e Entrevistado'#9
            '0220 Tarja Telespectador HastTag'
            '0230 Tempo no Local'
            '0240 WhatsApp'
            '0250 Encerramento'#9
            '0260 Selo G1'
            '0849 Manchete'
            '1070 Motolink Relogio')
          ParentFont = False
          Sorted = True
          TabOrder = 0
          OnClick = LB_MessagesClick
        end
        object PN_Message_Scene: TPanel
          Left = 1
          Top = 398
          Width = 279
          Height = 33
          ParentCustomHint = False
          Align = alTop
          BiDiMode = bdLeftToRight
          Ctl3D = True
          DoubleBuffered = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBiDiMode = False
          ParentBackground = False
          ParentCtl3D = False
          ParentDoubleBuffered = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 1
          StyleElements = []
          object SP_Message: TSpinEdit
            Left = 7
            Top = 6
            Width = 81
            Height = 22
            Color = clBlack
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            MaxValue = 100000
            MinValue = 0
            ParentFont = False
            TabOrder = 0
            Value = 170
          end
          object Bot_Carregar_Message: TButton
            Left = 94
            Top = 3
            Width = 117
            Height = 25
            Caption = 'Carregar Message'
            TabOrder = 1
            OnClick = Bot_Carregar_MessageClick
          end
        end
        object LB_Transicoes: TListBox
          Left = 1
          Top = 431
          Width = 279
          Height = 160
          Align = alClient
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Items.Strings = (
            'APARECE'
            'ESCONDE'
            'Effect IN sem DO'
            'LOCAL E TEMPO1'
            'LOCAL E TEMPO2'
            'LOOP'
            'ON_RELOGIO'
            'OFF_RELOGIO'
            'ON_APRESENTADOR'
            'OFF_APRESENTADOR'
            'TEMPO OUT'
            'TEMPO OUT2'
            'TERMINA_A'
            'TERMINA_B'
            'TERM_CONDITIONAL'
            'VOLTA LINK')
          ParentFont = False
          TabOrder = 2
          OnClick = LB_TransicoesClick
        end
      end
    end
    object TabSheet1: TTabSheet
      Caption = 'Comandos diretos'
      ImageIndex = 4
      object Bot_Selecionar_Browser: TButton
        Left = 173
        Top = 7
        Width = 132
        Height = 21
        Caption = 'Selecionar Browser'
        TabOrder = 0
        OnClick = Bot_Selecionar_BrowserClick
      end
      object CB_Jornal: TComboBox
        Left = 8
        Top = 7
        Width = 159
        Height = 21
        ParentCustomHint = False
        Style = csDropDownList
        BiDiMode = bdLeftToRight
        Ctl3D = True
        DoubleBuffered = False
        DropDownCount = 30
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBiDiMode = False
        ParentCtl3D = False
        ParentDoubleBuffered = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
      end
    end
    object TS_Editor: TTabSheet
      Caption = 'Editor'
      ImageIndex = 5
      object PC_VB_Script_Intelligent_Interface: TPageControl
        Left = 0
        Top = 0
        Width = 931
        Height = 592
        ActivePage = TS_II
        Align = alClient
        TabOrder = 0
        object TS_VB_Script: TTabSheet
          Caption = 'VB-Script'
          object PN_FileName_VB: TPanel
            Left = 0
            Top = 0
            Width = 923
            Height = 24
            ParentCustomHint = False
            Align = alTop
            BevelOuter = bvNone
            BiDiMode = bdLeftToRight
            Color = 8454143
            Ctl3D = True
            DoubleBuffered = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentBiDiMode = False
            ParentBackground = False
            ParentCtl3D = False
            ParentDoubleBuffered = False
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
            TabOrder = 0
            StyleElements = []
          end
          object PN_VB_Script: TPanel
            Left = 0
            Top = 24
            Width = 923
            Height = 539
            ParentCustomHint = False
            Align = alClient
            BiDiMode = bdLeftToRight
            Ctl3D = True
            DoubleBuffered = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentBiDiMode = False
            ParentBackground = False
            ParentCtl3D = False
            ParentDoubleBuffered = False
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
            TabOrder = 1
            StyleElements = []
            object ME_VB: TMemo
              Left = 1
              Top = 1
              Width = 921
              Height = 504
              Align = alClient
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Fixedsys'
              Font.Style = []
              Lines.Strings = (
                'Lyric.ActivateFrame "Canvas"'
                
                  'Lyric.FrameBuffer(1).SceneByName("RELOGIO").Transition("APARECE"' +
                  ').Activate')
              ParentFont = False
              ScrollBars = ssBoth
              TabOrder = 0
              WordWrap = False
              OnExit = ME_VBExit
              OnKeyPress = ME_VBKeyPress
            end
            object PN_Rodape_VB_Script: TPanel
              Left = 1
              Top = 505
              Width = 921
              Height = 33
              ParentCustomHint = False
              Align = alBottom
              BevelOuter = bvNone
              BiDiMode = bdLeftToRight
              Ctl3D = True
              DoubleBuffered = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentBiDiMode = False
              ParentBackground = False
              ParentCtl3D = False
              ParentDoubleBuffered = False
              ParentFont = False
              ParentShowHint = False
              ShowHint = False
              TabOrder = 1
              StyleElements = []
              DesignSize = (
                921
                33)
              object Bot_Salvar_Como_Script_VB: TButton
                Left = 5
                Top = 4
                Width = 103
                Height = 25
                Caption = 'Salvar como...'
                TabOrder = 0
                OnClick = Bot_Salvar_Como_Script_VBClick
              end
              object Bot_Abrir_Script_VB: TButton
                Left = 114
                Top = 4
                Width = 103
                Height = 25
                Caption = 'Abrir'
                TabOrder = 1
                OnClick = Bot_Abrir_Script_VBClick
              end
              object Bot_Enviar_Script_VB: TButton
                Left = 784
                Top = 4
                Width = 131
                Height = 25
                Anchors = [akTop, akRight]
                Caption = 'Enviar Script'
                TabOrder = 2
                OnClick = Bot_Enviar_Script_VBClick
              end
            end
          end
        end
        object TS_II: TTabSheet
          Caption = 'Intelligent Interface'
          ImageIndex = 1
          object ME_II: TMemo
            Left = 0
            Top = 24
            Width = 923
            Height = 506
            Align = alClient
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Fixedsys'
            Font.Style = []
            Lines.Strings = (
              'V\5\3\1<FRAMEBUFFER>\20<DISPLAYMODE>')
            ParentFont = False
            ScrollBars = ssBoth
            TabOrder = 0
            WordWrap = False
            OnExit = ME_IIExit
          end
          object PN_Rodape_II: TPanel
            Left = 0
            Top = 530
            Width = 923
            Height = 33
            ParentCustomHint = False
            Align = alBottom
            BevelOuter = bvNone
            BiDiMode = bdLeftToRight
            Ctl3D = True
            DoubleBuffered = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentBiDiMode = False
            ParentBackground = False
            ParentCtl3D = False
            ParentDoubleBuffered = False
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
            TabOrder = 1
            StyleElements = []
            DesignSize = (
              923
              33)
            object Bot_Salvar_II_Como: TButton
              Left = 5
              Top = 4
              Width = 103
              Height = 25
              Caption = 'Salvar como...'
              TabOrder = 0
              OnClick = Bot_Salvar_II_ComoClick
            end
            object Bot_Abrir_II: TButton
              Left = 114
              Top = 4
              Width = 103
              Height = 25
              Caption = 'Abrir'
              TabOrder = 1
              OnClick = Bot_Abrir_IIClick
            end
            object Bot_Enviar_Script_II: TButton
              Left = 504
              Top = 6
              Width = 131
              Height = 25
              Anchors = [akTop, akRight]
              Caption = 'Enviar Comando'
              TabOrder = 2
              OnClick = Bot_Enviar_Script_IIClick
            end
          end
          object PN_FileName_II: TPanel
            Left = 0
            Top = 0
            Width = 923
            Height = 24
            ParentCustomHint = False
            Align = alTop
            BevelOuter = bvNone
            BiDiMode = bdLeftToRight
            Color = 8454143
            Ctl3D = True
            DoubleBuffered = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentBiDiMode = False
            ParentBackground = False
            ParentCtl3D = False
            ParentDoubleBuffered = False
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
            TabOrder = 2
            StyleElements = []
          end
        end
        object TabSheet2: TTabSheet
          Caption = 'Mensagem Direta'
          ImageIndex = 2
          object Label1: TLabel
            Left = 413
            Top = 4
            Width = 82
            Height = 13
            ParentCustomHint = False
            Alignment = taCenter
            AutoSize = False
            BiDiMode = bdLeftToRight
            Caption = 'Mensagem'
            Color = clBtnFace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clYellow
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentBiDiMode = False
            ParentColor = False
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
            StyleElements = []
          end
          object Label2: TLabel
            Left = 3
            Top = 5
            Width = 199
            Height = 13
            ParentCustomHint = False
            Alignment = taCenter
            AutoSize = False
            BiDiMode = bdLeftToRight
            Caption = 'Campo'
            Color = clBtnFace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clYellow
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentBiDiMode = False
            ParentColor = False
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
            StyleElements = []
          end
          object Label3: TLabel
            Left = 208
            Top = 5
            Width = 198
            Height = 13
            ParentCustomHint = False
            Alignment = taCenter
            AutoSize = False
            BiDiMode = bdLeftToRight
            Caption = 'Valor'
            Color = clBtnFace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clYellow
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentBiDiMode = False
            ParentColor = False
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
            StyleElements = []
          end
          object ED_Campo_Direto_1: TEdit
            Left = 3
            Top = 20
            Width = 199
            Height = 22
            TabOrder = 0
            Text = 'ED_Campo_Direto_1'
          end
          object ED_Valor_Direto_1: TEdit
            Left = 208
            Top = 20
            Width = 199
            Height = 22
            TabOrder = 1
            Text = 'ED_Valor_Direto_1'
          end
          object ED_Valor_Direto_2: TEdit
            Left = 208
            Top = 47
            Width = 199
            Height = 22
            TabOrder = 2
            Text = 'ED_Valor_Direto_2'
          end
          object ED_Campo_Direto_2: TEdit
            Left = 3
            Top = 47
            Width = 199
            Height = 22
            TabOrder = 3
            Text = 'ED_Campo_Direto_2'
          end
          object ED_Valor_Direto_3: TEdit
            Left = 208
            Top = 74
            Width = 199
            Height = 22
            TabOrder = 4
            Text = 'ED_Valor_Direto_3'
          end
          object ED_Campo_Direto_3: TEdit
            Left = 3
            Top = 74
            Width = 199
            Height = 22
            TabOrder = 5
            Text = 'ED_Campo_Direto_3'
          end
          object ED_Valor_Direto_4: TEdit
            Left = 208
            Top = 101
            Width = 199
            Height = 22
            TabOrder = 6
            Text = 'ED_Valor_Direto_4'
          end
          object ED_Campo_Direto_4: TEdit
            Left = 3
            Top = 101
            Width = 199
            Height = 22
            TabOrder = 7
            Text = 'ED_Campo_Direto_4'
          end
          object ED_Valor_Direto_5: TEdit
            Left = 208
            Top = 128
            Width = 199
            Height = 22
            TabOrder = 8
            Text = 'ED_Valor_Direto_5'
          end
          object ED_Campo_Direto_5: TEdit
            Left = 3
            Top = 128
            Width = 199
            Height = 22
            TabOrder = 9
            Text = 'ED_Campo_Direto_5'
          end
          object SP_Mensagem_Direta: TSpinEdit
            Left = 413
            Top = 20
            Width = 82
            Height = 23
            MaxValue = 0
            MinValue = 0
            TabOrder = 10
            Value = 0
          end
          object Bot_Carregar_Menssage_Composta: TButton
            Left = 419
            Top = 128
            Width = 117
            Height = 21
            Caption = 'Carregar Message'
            TabOrder = 11
            OnClick = Bot_Carregar_Menssage_CompostaClick
          end
          object LB_Scripts_VB: TListBox
            Left = 3
            Top = 164
            Width = 387
            Height = 405
            ItemHeight = 14
            Items.Strings = (
              'FECHAR_NAO_PERSISTENTES'
              'FECHAR_ATE_PERSISTENTES'
              'GC'
              'TARJA_1'
              'TARJA_2'
              'FIXA')
            TabOrder = 12
            OnClick = LB_Scripts_VBClick
          end
        end
      end
    end
    object TS_Scripts_Enviados: TTabSheet
      Caption = 'Scripts Enviados'
      ImageIndex = 6
      object ME_Scripts_Enviados2: TMemo
        Left = 0
        Top = 37
        Width = 931
        Height = 555
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Fixedsys'
        Font.Style = []
        Lines.Strings = (
          'Lyric.ActivateFrame "Canvas"'
          
            'Lyric.FrameBuffer(1).SceneByName("RELOGIO").Transition("APARECE"' +
            ').Activate')
        ParentFont = False
        ScrollBars = ssBoth
        TabOrder = 0
        WordWrap = False
        OnExit = ME_VBExit
      end
      object PN_Header_Scripts_Enviados: TPanel
        Left = 0
        Top = 0
        Width = 931
        Height = 37
        ParentCustomHint = False
        Align = alTop
        BevelOuter = bvNone
        BiDiMode = bdLeftToRight
        Ctl3D = True
        DoubleBuffered = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBiDiMode = False
        ParentBackground = False
        ParentCtl3D = False
        ParentDoubleBuffered = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 1
        StyleElements = []
        object Bot_Limpar: TButton
          Left = 8
          Top = 6
          Width = 75
          Height = 25
          ParentCustomHint = False
          BiDiMode = bdLeftToRight
          Caption = 'Limpar'
          DoubleBuffered = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBiDiMode = False
          ParentDoubleBuffered = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 0
          StyleElements = []
          OnClick = Bot_LimparClick
        end
      end
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 939
    Height = 28
    ParentCustomHint = False
    Align = alTop
    BevelOuter = bvNone
    BiDiMode = bdLeftToRight
    Color = 16777181
    Ctl3D = True
    DoubleBuffered = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBiDiMode = False
    ParentBackground = False
    ParentCtl3D = False
    ParentDoubleBuffered = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 1
    StyleElements = []
    DesignSize = (
      939
      28)
    object PN_Ping: TPanel
      Left = 600
      Top = 3
      Width = 72
      Height = 22
      Anchors = [akTop, akRight]
      BevelOuter = bvLowered
      Caption = 'Ping'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      StyleElements = []
    end
    object PN_FB_1: TPanel
      Left = 727
      Top = 3
      Width = 51
      Height = 22
      Anchors = [akTop, akRight]
      BevelOuter = bvLowered
      Caption = 'FB-1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 1
      StyleElements = []
      OnClick = PN_FB_1Click
    end
    object PN_Link_LAN: TPanel
      Left = 833
      Top = 3
      Width = 50
      Height = 22
      Anchors = [akTop, akRight]
      BevelOuter = bvLowered
      Caption = 'LAN'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 2
      StyleElements = []
    end
    object PN_FB_2: TPanel
      Left = 779
      Top = 3
      Width = 51
      Height = 22
      Anchors = [akTop, akRight]
      BevelOuter = bvLowered
      Caption = 'FB-2'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      StyleElements = []
      OnClick = PN_FB_2Click
    end
    object PN_Link_WAN: TPanel
      Left = 885
      Top = 3
      Width = 50
      Height = 22
      Anchors = [akTop, akRight]
      BevelOuter = bvLowered
      Caption = 'WAN'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 4
      StyleElements = []
    end
    object PN_FB_VGA: TPanel
      Left = 674
      Top = 3
      Width = 51
      Height = 22
      Anchors = [akTop, akRight]
      BevelOuter = bvLowered
      Caption = 'VGA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 5
      StyleElements = []
      OnClick = PN_FB_VGAClick
    end
    object Bot_Play_FB1: TButton
      Left = 7
      Top = 3
      Width = 80
      Height = 20
      Hint = 'Y\<D5><F3>1'
      Caption = 'Play FB-1'
      ImageIndex = 153
      ImageMargins.Left = 10
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      OnClick = Bot_Play_FB1Click
    end
    object Bot_Clear_FB1: TButton
      Left = 92
      Top = 3
      Width = 100
      Height = 20
      Hint = 'Y\<D5><FE>1'
      Caption = 'Limpar FB-1'
      ImageIndex = 29
      ImageMargins.Left = 10
      TabOrder = 7
      OnClick = Bot_Clear_FB1Click
    end
    object Bot_Play_FB2: TButton
      Left = 237
      Top = 3
      Width = 80
      Height = 20
      Hint = 'Y\<D5><F3>2'
      Caption = 'Play FB-2'
      ImageIndex = 153
      ImageMargins.Left = 10
      ParentShowHint = False
      ShowHint = True
      TabOrder = 8
      OnClick = Bot_Play_FB2Click
    end
    object Bot_Limpar_FB2: TButton
      Left = 323
      Top = 2
      Width = 100
      Height = 20
      Hint = 'Y\<D5><FE>2'
      Caption = 'Limpar FB-2'
      ImageIndex = 29
      ImageMargins.Left = 10
      TabOrder = 9
      OnClick = Bot_Limpar_FB2Click
    end
  end
  object SaveDialog_Script: TSaveDialog
    DefaultExt = 'txt'
    Filter = 'Arquivo Texto|*.txt|Todos os arquivos|*.*'
    Title = 'Salvar Script'
    Left = 448
    Top = 224
  end
  object OpenDialog_Script: TOpenDialog
    DefaultExt = 'txt'
    Filter = 'Arquivo Texto|*.txt|Todos os arquivos|*.*'
    Title = 'Abrir Script'
    Left = 392
    Top = 152
  end
  object Porta: TApdComPort
    ComNumber = 1
    Baud = 115200
    TraceName = 'APRO.TRC'
    LogName = 'APRO.LOG'
    OnPortClose = PortaPortClose
    OnPortOpen = PortaPortOpen
    OnTriggerAvail = PortaTriggerAvail
    OnTriggerLineError = PortaTriggerLineError
    Left = 308
    Top = 253
  end
end
