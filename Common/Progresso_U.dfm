object Progresso: TProgresso
  Left = 0
  Top = 0
  Caption = 'Progresso'
  ClientHeight = 350
  ClientWidth = 505
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object SB: TStatusBar
    Left = 0
    Top = 331
    Width = 505
    Height = 19
    Panels = <>
    SimplePanel = True
    SizeGrip = False
  end
  object PN_Top: TPanel
    Left = 0
    Top = 0
    Width = 505
    Height = 29
    Align = alTop
    TabOrder = 1
    object CK_Rolagem: TCheckBox
      Left = 8
      Top = 8
      Width = 65
      Height = 13
      Caption = 'Rolagem'
      Checked = True
      State = cbChecked
      TabOrder = 0
    end
    object Bot_Limpar: TButton
      Left = 79
      Top = 2
      Width = 75
      Height = 25
      Caption = 'Limpar'
      TabOrder = 1
      OnClick = Bot_LimparClick
    end
  end
  object PB: TProgressBar
    Left = 0
    Top = 314
    Width = 505
    Height = 17
    Align = alBottom
    TabOrder = 2
  end
  object PC: TPageControl
    Left = 16
    Top = 35
    Width = 401
    Height = 266
    ActivePage = TS_Eventos
    TabOrder = 3
    OnChange = PCChange
    object TS_Eventos: TTabSheet
      Caption = 'Eventos'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 281
      ExplicitHeight = 165
      object LB: TListBox
        Left = 13
        Top = 32
        Width = 121
        Height = 97
        ItemHeight = 13
        TabOrder = 0
        OnDblClick = LBDblClick
      end
    end
    object TS_Filtro: TTabSheet
      Caption = 'Filtro'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 281
      ExplicitHeight = 165
      object LB_Filtro: TListBox
        Left = 40
        Top = 60
        Width = 121
        Height = 97
        ItemHeight = 13
        TabOrder = 0
      end
      object PN_Filtro: TPanel
        Left = 0
        Top = 0
        Width = 393
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
        ExplicitWidth = 281
        object Label1: TLabel
          Left = 8
          Top = 10
          Width = 28
          Height = 13
          Caption = 'Filtro:'
        end
        object LB_Resultado: TLabel
          Left = 247
          Top = 12
          Width = 48
          Height = 13
          Caption = 'Resultado'
        end
        object ED_Filtro: TEdit
          Left = 42
          Top = 7
          Width = 199
          Height = 21
          TabOrder = 0
          Text = 'ED_Filtro'
          OnChange = ED_FiltroChange
          OnDblClick = ED_FiltroDblClick
        end
      end
    end
  end
end
