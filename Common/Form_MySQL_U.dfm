object Form_MySQL: TForm_MySQL
  Left = 0
  Top = 0
  Caption = 'Formul'#225'rio MySQL'
  ClientHeight = 476
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  PixelsPerInch = 96
  TextHeight = 13
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=futebol'
      'Password=rr2908BB'
      'Server=localhost'
      'User_Name=root'
      'DriverID=MySQL')
    ResourceOptions.AssignedValues = [rvAutoConnect, rvAutoReconnect, rvSilentMode]
    ResourceOptions.SilentMode = True
    ResourceOptions.AutoReconnect = True
    LoginPrompt = False
    Left = 149
    Top = 76
  end
end
