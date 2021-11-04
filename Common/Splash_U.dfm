object Splash: TSplash
  Left = 0
  Top = 0
  Caption = 'Rabelo Sistemas -Selos'
  ClientHeight = 253
  ClientWidth = 492
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object LB: TListBox
    Left = 0
    Top = 89
    Width = 492
    Height = 97
    Align = alTop
    ItemHeight = 13
    TabOrder = 0
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 186
    Width = 492
    Height = 19
    ParentCustomHint = False
    Align = alTop
    BiDiMode = bdLeftToRight
    DoubleBuffered = False
    Panels = <>
    ParentBiDiMode = False
    ParentDoubleBuffered = False
    ParentShowHint = False
    ShowHint = False
    SimplePanel = True
    SizeGrip = False
    ExplicitLeft = 36
    ExplicitTop = 144
    ExplicitWidth = 0
  end
  object PN_Top: TPanel
    Left = 0
    Top = 0
    Width = 492
    Height = 89
    Align = alTop
    TabOrder = 2
    object Image1: TImage
      Left = 8
      Top = 8
      Width = 433
      Height = 69
    end
  end
  object Timer_Splash: TTimer
    Enabled = False
    Interval = 100
    OnTimer = Timer_SplashTimer
    Left = 184
    Top = 124
  end
end
