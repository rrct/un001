object Full_Screen: TFull_Screen
  Left = 0
  Top = 0
  Caption = 'Full Screen'
  ClientHeight = 343
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PN_FullScreen: TPanel
    Left = 0
    Top = 0
    Width = 635
    Height = 343
    Align = alClient
    TabOrder = 0
    OnDblClick = PN_FullScreenDblClick
    ExplicitLeft = 96
    ExplicitTop = 104
    ExplicitWidth = 185
    ExplicitHeight = 41
  end
end
