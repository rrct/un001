object MainForm: TMainForm
  Left = 0
  Top = 0
  Margins.Right = 10
  ClientHeight = 653
  ClientWidth = 858
  Caption = 'MainForm'
  Color = clWindow
  OnShow = UniFormShow
  OldCreateOrder = False
  Script.Strings = (
    'console.log ( '#39'globais_main'#39', globais.usuario ) ;')
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 15
  object PN_LEFT: TUniContainerPanel
    Left = 0
    Top = 73
    Width = 233
    Height = 580
    Hint = ''
    ParentColor = False
    Color = 16777088
    Align = alLeft
    TabOrder = 0
    object MENU_LEFT: TUniTreeMenu
      Left = 0
      Top = 0
      Width = 165
      Height = 580
      Hint = ''
      Items.FontData = {0100000000}
      SourceMenu = UniMenuItems1
      Color = clGreen
    end
  end
  object UniContainerPanel2: TUniContainerPanel
    Left = 233
    Top = 73
    Width = 625
    Height = 580
    Hint = ''
    ParentColor = False
    Align = alClient
    TabOrder = 1
    object UniPageControl1: TUniPageControl
      Left = 0
      Top = 0
      Width = 625
      Height = 580
      Hint = ''
      ActivePage = UniTabSheet1
      Align = alClient
      TabOrder = 1
      object UniTabSheet1: TUniTabSheet
        Hint = ''
        Caption = 'Home'
        object UniURLFrame1: TUniURLFrame
          Left = 0
          Top = 0
          Width = 617
          Height = 552
          Hint = ''
          Align = alClient
          TabOrder = 0
          ParentColor = False
          Color = 12615935
        end
      end
      object UniTabSheet2: TUniTabSheet
        Hint = ''
        Caption = 'Estrutura'
      end
      object UniTabSheet3: TUniTabSheet
        Hint = ''
        Caption = 'Manuten'#231#227'o'
      end
    end
  end
  object UniContainerPanel3: TUniContainerPanel
    Left = 0
    Top = 0
    Width = 858
    Height = 73
    Hint = ''
    ParentColor = False
    Color = 8454143
    Align = alTop
    TabOrder = 2
    object UniLabel3: TUniLabel
      Left = 9
      Top = 11
      Width = 173
      Height = 23
      Hint = ''
      Caption = 'ATS Tecnologia.'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Height = -19
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      TabOrder = 1
    end
    object UniLabel2: TUniLabel
      Left = 572
      Top = 54
      Width = 179
      Height = 13
      Hint = ''
      TextConversion = txtHTML
      Caption = '<i class="far fa-paper-plane"></i>'
      TabOrder = 2
    end
    object UniBitBtn1: TUniBitBtn
      Left = 3
      Top = 42
      Width = 29
      Height = 25
      Hint = ''
      Caption = ''
      TabOrder = 3
      Images = UniNativeImageList1
      ImageIndex = 5
      OnClick = UniBitBtn1Click
    end
  end
  object UniNativeImageList1: TUniNativeImageList
    Left = 316
    Top = 180
    Images = {
      060000000000000006100000006661722066612D757365723B66615F3B000000
      00060F0000006661722066612D6864643B66615F3B00000000061B0000006661
      722066612D68616E642D706F696E742D646F776E3B66615F3B00000000061000
      00006661722066612D656469743B66615F3B00000000060F0000006661722066
      612D73756E3B66615F3B00000000061D0000006661722066612D63617265742D
      7371756172652D646F776E3B66615F3B}
  end
  object UniMenuItems1: TUniMenuItems
    Images = UniNativeImageList1
    Left = 316
    Top = 272
    object Usuarios1: TUniMenuItem
      Caption = 'Usu'#225'rios'
      ImageIndex = 2
    end
    object Usurios2: TUniMenuItem
      Caption = 'Produtos'
      ImageIndex = 1
    end
    object Configuracao1: TUniMenuItem
      Caption = 'Configura'#231#227'o'
      ImageIndex = 4
      object Geral1: TUniMenuItem
        Caption = 'Geral'
      end
      object Preferencias1: TUniMenuItem
        Caption = 'Prefer'#234'ncias'
      end
      object Opcoes: TUniMenuItem
        Caption = 'Op'#231#245'es'
      end
    end
    object Fornecedores1: TUniMenuItem
      Caption = 'Fornecedores'
      ImageIndex = 2
    end
    object Outros1: TUniMenuItem
      Caption = 'Outros'
      object Opcao1: TUniMenuItem
        Caption = 'Op'#231#227'o 1'
      end
      object Opcao2: TUniMenuItem
        Caption = 'Op'#231#227'o 2'
      end
      object Opcao3: TUniMenuItem
        Caption = 'Op'#231#227'o 3'
      end
    end
    object Fornecedores2: TUniMenuItem
      Caption = 'Gastos'
      ImageIndex = 3
    end
  end
end
