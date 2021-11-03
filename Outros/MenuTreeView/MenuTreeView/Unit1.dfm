object UniForm1: TUniForm1
  Left = 0
  Top = 0
  ClientHeight = 515
  ClientWidth = 732
  Caption = 'UniForm1'
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object UniContainerPanel1: TUniContainerPanel
    Left = 0
    Top = 0
    Width = 233
    Height = 515
    Hint = ''
    ParentColor = False
    Color = 16744448
    Align = alLeft
    TabOrder = 0
    object UniPanel1: TUniPanel
      Left = 0
      Top = 0
      Width = 233
      Height = 128
      Hint = ''
      Align = alTop
      TabOrder = 1
      Caption = 'UniPanel1'
      Color = clGray
      ExplicitLeft = 40
      ExplicitTop = 48
      ExplicitWidth = 256
      object UniLabel1: TUniLabel
        Left = 16
        Top = 16
        Width = 267
        Height = 13
        Hint = ''
        TextConversion = txtHTML
        Caption = '<i class="fa fa-address-book" aria-hidden="true"></i>'
        ParentFont = False
        Font.Color = clWhite
        TabOrder = 1
      end
      object UniLabel2: TUniLabel
        Left = 88
        Top = 57
        Width = 46
        Height = 13
        Hint = ''
        Caption = 'UniLabel1'
        ParentFont = False
        Font.Color = clWhite
        TabOrder = 2
      end
    end
    object UniTreeMenu1: TUniTreeMenu
      Left = 0
      Top = 128
      Width = 227
      Height = 387
      Hint = ''
      Items.FontData = {0100000000}
      SourceMenu = UniMenuItems1
      Color = clSilver
    end
  end
  object UniContainerPanel2: TUniContainerPanel
    Left = 233
    Top = 0
    Width = 499
    Height = 515
    Hint = ''
    ParentColor = False
    Align = alClient
    TabOrder = 1
    ExplicitLeft = 432
    ExplicitTop = 88
    ExplicitWidth = 256
    ExplicitHeight = 128
    object UniContainerPanel3: TUniContainerPanel
      Left = 0
      Top = 0
      Width = 499
      Height = 57
      Hint = ''
      ParentColor = False
      Color = 16744448
      Align = alTop
      TabOrder = 1
      ExplicitLeft = -3
      ExplicitTop = -6
      object UniLabel3: TUniLabel
        Left = 24
        Top = 38
        Width = 36
        Height = 13
        Hint = ''
        Caption = 'sistema'
        ParentFont = False
        Font.Color = clWhite
        TabOrder = 1
      end
    end
    object UniPageControl1: TUniPageControl
      Left = 0
      Top = 57
      Width = 499
      Height = 458
      Hint = ''
      ActivePage = UniTabSheet1
      Align = alClient
      TabOrder = 2
      ExplicitLeft = 96
      ExplicitTop = 144
      ExplicitWidth = 289
      ExplicitHeight = 193
      object UniTabSheet1: TUniTabSheet
        Hint = ''
        Caption = 'Home'
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 289
        ExplicitHeight = 193
        object UniURLFrame1: TUniURLFrame
          Left = 0
          Top = 0
          Width = 491
          Height = 430
          Hint = ''
          Align = alClient
          TabOrder = 0
          ParentColor = False
          Color = clWhite
          ExplicitLeft = 80
          ExplicitTop = 64
          ExplicitWidth = 320
          ExplicitHeight = 240
        end
      end
    end
  end
  object UniNativeImageList1: TUniNativeImageList
    Left = 301
    Top = 129
    Images = {
      0100000000000000061600000066612066612D616464726573732D626F6F6B3B
      66613B}
  end
  object UniMenuItems1: TUniMenuItems
    Images = UniNativeImageList1
    Left = 301
    Top = 217
    object cadastros1: TUniMenuItem
      Caption = 'cadastros'
    end
    object produtos1: TUniMenuItem
      Caption = 'produtos'
      ImageIndex = 0
    end
  end
end
