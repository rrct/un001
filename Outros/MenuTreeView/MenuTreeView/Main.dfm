object MainForm: TMainForm
  Left = 0
  Top = 0
  ClientHeight = 491
  ClientWidth = 774
  Caption = ''
  Color = 10044217
  OldCreateOrder = False
  MonitoredKeys.Keys = <>
  PixelsPerInch = 96
  TextHeight = 13
  object UniStatusBar1: TUniStatusBar
    Left = 0
    Top = 469
    Width = 774
    Hint = ''
    Panels = <>
    SizeGrip = False
    Align = alBottom
    ParentColor = False
    Color = clWindow
  end
  object PnlLeft: TUniContainerPanel
    Left = 0
    Top = 0
    Width = 201
    Height = 469
    Hint = ''
    ParentColor = False
    Color = 10044217
    Align = alLeft
    TabOrder = 1
    object TreeMenu: TUniTreeMenu
      Left = 0
      Top = 128
      Width = 198
      Height = 341
      Hint = ''
      BodyRTL = False
      Items.FontData = {0100000000}
      SourceMenu = Menu
      Color = 10044217
    end
    object PnlLogo: TUniPanel
      Left = 0
      Top = 0
      Width = 201
      Height = 128
      Hint = ''
      Align = alTop
      TabOrder = 2
      BorderStyle = ubsNone
      Caption = ''
      Color = 10044217
      object LblDrawer: TUniLabel
        Left = 16
        Top = 15
        Width = 255
        Height = 13
        Hint = ''
        TextConversion = txtHTML
        Caption = '<i class="fa fa-bars fa-2x" aria-hidden="true" ></i>'
        ParentFont = False
        Font.Color = clWhite
        ParentColor = False
        Color = 16744448
        TabOrder = 1
        OnClick = LblLogoClick
      end
      object LblLogo: TUniLabel
        Left = 71
        Top = 56
        Width = 278
        Height = 13
        Hint = ''
        TextConversion = txtHTML
        Caption = '<i class="fa fa-whatsapp fa-5x" aria-hidden="true"></i>'
        Align = alCustom
        ParentFont = False
        Font.Color = clWhite
        ParentColor = False
        Color = 16744448
        TabOrder = 2
        OnClick = LblLogoClick
      end
    end
  end
  object PnlConteudo: TUniContainerPanel
    Left = 201
    Top = 0
    Width = 573
    Height = 469
    Hint = ''
    ParentColor = False
    Align = alClient
    TabOrder = 2
    ExplicitLeft = 239
    ExplicitTop = 34
    ExplicitWidth = 581
    object PagePrincipal: TUniPageControl
      Left = 0
      Top = 43
      Width = 573
      Height = 426
      Hint = ''
      ActivePage = TabHome
      Align = alClient
      TabOrder = 1
      ExplicitLeft = 88
      ExplicitTop = 83
      ExplicitWidth = 581
      object TabHome: TUniTabSheet
        Hint = ''
        Caption = 'Home'
        ExplicitWidth = 573
        object UniURLFrame1: TUniURLFrame
          Left = 0
          Top = 0
          Width = 565
          Height = 398
          Hint = ''
          Align = alClient
          TabOrder = 0
          ParentColor = False
          Color = clSilver
          ExplicitLeft = 32
          ExplicitTop = 9
          ExplicitWidth = 573
        end
      end
    end
    object PnlTop: TUniContainerPanel
      Left = 0
      Top = 0
      Width = 573
      Height = 43
      Hint = ''
      BodyRTL = False
      ParentColor = False
      Color = 10044217
      Align = alTop
      TabOrder = 2
      ExplicitLeft = 62
      ExplicitTop = 18
      ExplicitWidth = 581
      object LblNotificacao: TUniLabel
        Left = 511
        Top = 15
        Width = 247
        Height = 13
        Hint = ''
        TextConversion = txtHTML
        Caption = '<i class="fa fa-bell fa-1x" aria-hidden="true"></i>'
        Align = alCustom
        Anchors = [akTop, akRight]
        ParentFont = False
        Font.Color = clWhite
        ParentColor = False
        Color = 16744448
        TabOrder = 1
        OnClick = LblLogoClick
        ExplicitLeft = 519
      end
      object LblSistema: TUniLabel
        Left = 9
        Top = 12
        Width = 180
        Height = 24
        Hint = ''
        TextConversion = txtHTML
        Caption = 'Delivery Community'
        ParentFont = False
        Font.Color = clWhite
        Font.Height = -20
        ParentColor = False
        Color = 16744448
        TabOrder = 2
        OnClick = LblLogoClick
      end
    end
  end
  object UniNativeImageList1: TUniNativeImageList
    Left = 272
    Top = 168
    Images = {
      1600000000000000060B0000006E617669636F6E3B66613B00000000060B0000
      006465736B746F703B66613B00000000060C000000656E76656C6F70653B6661
      3B000000000608000000757365723B66613B00000000060E0000006C696E652D
      63686172743B66613B00000000061000000077696E646F772D636C6F73653B66
      613B000000000608000000736176653B66613B00000000060800000065646974
      3B66613B0000000006070000006375743B66613B00000000060D000000626172
      2D63686172743B66613B00000000060D0000007069652D63686172743B66613B
      00000000060C000000626F6F6B6D61726B3B66613B00000000060C0000006361
      6C656E6461723B66613B000000000608000000666565643B66613B0000000006
      1200000066612066612D77686174736170703B66613B00000000060900000069
      6D6167653B66613B000000000609000000696E626F783B66613B000000000614
      00000066612066612D6D6F746F726379636C653B66613B000000000614000000
      66612066612D6D61702D6D61726B65723B66613B00000000060F000000666120
      66612D75736572733B66613B00000000061100000066612066612D6375746C65
      72793B66613B00000000061600000066612066612D616464726573732D626F6F
      6B3B66613B}
  end
  object Menu: TUniMenuItems
    Images = UniNativeImageList1
    MenuAnimation = [maLeftToRight]
    Left = 264
    Top = 232
    object PedidosWhats1: TUniMenuItem
      Caption = 'Pedidos WhatsApp | Mobile'
      ImageIndex = 14
    end
    object Entregas1: TUniMenuItem
      Caption = 'Minhas Entregas'
      ImageIndex = 18
    end
    object mnuMovimentacao: TUniMenuItem
      Caption = 'Clientes'
      ImageIndex = 21
      OnClick = mnuMovimentacaoClick
    end
    object mnuCadastros: TUniMenuItem
      Caption = 'Card'#225'pios'
      ImageIndex = 20
    end
    object Entregadores1: TUniMenuItem
      Caption = 'Entregadores | Aut'#244'nomos'
      ImageIndex = 17
    end
    object mnuRelatorios: TUniMenuItem
      Caption = 'Relat'#243'rio'
      ImageIndex = 12
      object mnuRelatorioFechamentoCaixa: TUniMenuItem
        Caption = 'Lista Pre'#231'os'
        Hint = 'Fechamento do Caixa'
      end
      object mnuRelatorioExtratoContas: TUniMenuItem
        Caption = 'Lista Invent'#225'rio'
        Hint = 'Resumo Receitas e Despesas'
      end
      object ListadeVendas1: TUniMenuItem
        Caption = 'Lista de Vendas         '
      end
      object ListaPedidos1: TUniMenuItem
        Caption = 'Lista Pedidos'
      end
    end
    object mnuGraficos: TUniMenuItem
      Caption = 'Dashboard'
      ImageIndex = 9
    end
    object mnuSuporte: TUniMenuItem
      Caption = 'Suporte'
    end
  end
end
