object Log: TLog
  Left = 700
  Top = 300
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Log de Eventos'
  ClientHeight = 529
  ClientWidth = 624
  Color = clBtnFace
  Constraints.MinHeight = 300
  Constraints.MinWidth = 620
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  KeyPreview = True
  Menu = MainMenu1
  Position = poDesigned
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnMouseMove = FormMouseMove
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PC: TPageControl
    Left = 0
    Top = 0
    Width = 624
    Height = 491
    ActivePage = TS_Log
    Align = alClient
    TabOrder = 0
    OnMouseMove = PCMouseMove
    object TS_Log: TTabSheet
      Caption = 'Log'
      object Splitter1: TSplitter
        Left = 0
        Top = 345
        Width = 616
        Height = 5
        Cursor = crVSplit
        ParentCustomHint = False
        Align = alBottom
        Color = 16744703
        ParentColor = False
        StyleElements = []
        ExplicitLeft = 20
        ExplicitTop = 306
        ExplicitWidth = 617
      end
      object Splitter2: TSplitter
        Left = 0
        Top = 216
        Width = 616
        Height = 5
        Cursor = crVSplit
        ParentCustomHint = False
        Align = alBottom
        Color = 16744703
        ParentColor = False
        StyleElements = []
        ExplicitTop = 167
        ExplicitWidth = 617
      end
      object PC_Log: TPageControl
        Left = 0
        Top = 0
        Width = 616
        Height = 216
        ActivePage = TS_Simples
        Align = alClient
        MultiLine = True
        TabOrder = 0
        OnChange = PC_LogChange
        OnMouseMove = PC_LogMouseMove
        object TS_Simples: TTabSheet
          Caption = 'Simples'
          object LB_Main: TListBox
            Left = 20
            Top = 24
            Width = 301
            Height = 132
            ParentCustomHint = False
            BiDiMode = bdLeftToRight
            Ctl3D = True
            DoubleBuffered = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Fixedsys'
            Font.Style = []
            ItemHeight = 15
            MultiSelect = True
            ParentBiDiMode = False
            ParentCtl3D = False
            ParentDoubleBuffered = False
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
            TabOrder = 0
            StyleElements = []
            OnClick = LB_MainClick
            OnMouseUp = LB_MainMouseUp
          end
        end
        object TS_Excecoes: TTabSheet
          Caption = 'Exce'#231#245'es'
          ImageIndex = 1
          object LB_Excecoes: TListBox
            Left = 30
            Top = 24
            Width = 301
            Height = 120
            ParentCustomHint = False
            BiDiMode = bdLeftToRight
            Ctl3D = True
            DoubleBuffered = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ItemHeight = 13
            MultiSelect = True
            ParentBiDiMode = False
            ParentCtl3D = False
            ParentDoubleBuffered = False
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
            TabOrder = 0
            StyleElements = []
            OnClick = LB_ExcecoesClick
            OnMouseUp = LB_ExcecoesMouseUp
          end
        end
        object TS_Atencao: TTabSheet
          Caption = 'Aten'#231#227'o'
          ImageIndex = 2
          object LB_Atencao: TListBox
            Left = 57
            Top = 24
            Width = 301
            Height = 120
            ParentCustomHint = False
            BiDiMode = bdLeftToRight
            Ctl3D = True
            DoubleBuffered = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ItemHeight = 13
            MultiSelect = True
            ParentBiDiMode = False
            ParentCtl3D = False
            ParentDoubleBuffered = False
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
            TabOrder = 0
            StyleElements = []
            OnClick = LB_AtencaoClick
            OnMouseUp = LB_AtencaoMouseUp
          end
        end
        object TS_Erros: TTabSheet
          Caption = 'Erros'
          ImageIndex = 3
          object LB_Erros: TListBox
            Left = 58
            Top = 8
            Width = 301
            Height = 120
            ParentCustomHint = False
            BiDiMode = bdLeftToRight
            Ctl3D = True
            DoubleBuffered = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ItemHeight = 13
            MultiSelect = True
            ParentBiDiMode = False
            ParentCtl3D = False
            ParentDoubleBuffered = False
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
            TabOrder = 0
            StyleElements = []
            OnClick = LB_ErrosClick
            OnMouseUp = LB_ErrosMouseUp
          end
        end
        object TS_Debug: TTabSheet
          Caption = 'Debug'
          ImageIndex = 4
          object LB_Debug: TListBox
            Left = 89
            Top = 31
            Width = 301
            Height = 120
            ParentCustomHint = False
            BiDiMode = bdLeftToRight
            Ctl3D = True
            DoubleBuffered = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Fixedsys'
            Font.Style = []
            ItemHeight = 15
            MultiSelect = True
            ParentBiDiMode = False
            ParentCtl3D = False
            ParentDoubleBuffered = False
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
            TabOrder = 0
            StyleElements = []
            OnClick = LB_DebugClick
            OnMouseUp = LB_ErrosMouseUp
          end
          object PN_Top_Debug: TPanel
            Left = 0
            Top = 0
            Width = 608
            Height = 25
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
            object Button1: TButton
              Left = 532
              Top = 1
              Width = 75
              Height = 23
              Align = alRight
              Caption = 'Atualizar'
              TabOrder = 0
              OnClick = Button1Click
            end
          end
        end
        object TS_PushPop: TTabSheet
          Caption = 'PushPop'
          ImageIndex = 5
          object LB_PushPop: TListBox
            Left = 44
            Top = 12
            Width = 301
            Height = 132
            ParentCustomHint = False
            BiDiMode = bdLeftToRight
            Ctl3D = True
            DoubleBuffered = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Fixedsys'
            Font.Style = []
            ItemHeight = 15
            MultiSelect = True
            ParentBiDiMode = False
            ParentCtl3D = False
            ParentDoubleBuffered = False
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
            TabOrder = 0
            StyleElements = []
            OnClick = LB_PushPopClick
            OnMouseUp = LB_MainMouseUp
          end
        end
        object TS_IMG: TTabSheet
          Caption = 'IMG'
          ImageIndex = 8
          object LB_IMG: TListBox
            Left = 68
            Top = 20
            Width = 301
            Height = 132
            ParentCustomHint = False
            BiDiMode = bdLeftToRight
            Ctl3D = True
            DoubleBuffered = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Fixedsys'
            Font.Style = []
            ItemHeight = 15
            MultiSelect = True
            ParentBiDiMode = False
            ParentCtl3D = False
            ParentDoubleBuffered = False
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
            TabOrder = 0
            StyleElements = []
            OnClick = LB_IMGClick
            OnMouseUp = LB_MainMouseUp
          end
        end
        object TS_Disco: TTabSheet
          Caption = 'Disco'
          ImageIndex = 14
          object PC_Disco: TPageControl
            Left = 0
            Top = 0
            Width = 608
            Height = 188
            ActivePage = TS_DeleteFile
            Align = alClient
            TabOrder = 0
            OnMouseMove = PC_DiscoMouseMove
            ExplicitHeight = 228
            object TS_Read2: TTabSheet
              Caption = 'Read'
              object LB_Read: TListBox
                Left = 52
                Top = 8
                Width = 301
                Height = 132
                ParentCustomHint = False
                BiDiMode = bdLeftToRight
                Ctl3D = True
                DoubleBuffered = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Fixedsys'
                Font.Style = []
                ItemHeight = 15
                MultiSelect = True
                ParentBiDiMode = False
                ParentCtl3D = False
                ParentDoubleBuffered = False
                ParentFont = False
                ParentShowHint = False
                ShowHint = False
                TabOrder = 0
                StyleElements = []
                OnClick = LB_ReadClick
                OnMouseUp = LB_MainMouseUp
              end
            end
            object TS_Write2: TTabSheet
              Caption = 'Write'
              ImageIndex = 1
              object LB_Write: TListBox
                Left = 56
                Top = 8
                Width = 301
                Height = 132
                ParentCustomHint = False
                BiDiMode = bdLeftToRight
                Ctl3D = True
                DoubleBuffered = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Fixedsys'
                Font.Style = []
                ItemHeight = 15
                MultiSelect = True
                ParentBiDiMode = False
                ParentCtl3D = False
                ParentDoubleBuffered = False
                ParentFont = False
                ParentShowHint = False
                ShowHint = False
                TabOrder = 0
                StyleElements = []
                OnClick = LB_WriteClick
                OnMouseUp = LB_MainMouseUp
              end
            end
            object TS_Append2: TTabSheet
              Caption = 'Append'
              ImageIndex = 2
              object LB_Append: TListBox
                Left = 60
                Top = 8
                Width = 301
                Height = 132
                ParentCustomHint = False
                BiDiMode = bdLeftToRight
                Ctl3D = True
                DoubleBuffered = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Fixedsys'
                Font.Style = []
                ItemHeight = 15
                MultiSelect = True
                ParentBiDiMode = False
                ParentCtl3D = False
                ParentDoubleBuffered = False
                ParentFont = False
                ParentShowHint = False
                ShowHint = False
                TabOrder = 0
                StyleElements = []
                OnClick = LB_AppendClick
                OnMouseUp = LB_MainMouseUp
              end
            end
            object TS_Copy2: TTabSheet
              Caption = 'Copy'
              ImageIndex = 3
              object LB_Copy: TListBox
                Left = 64
                Top = 8
                Width = 301
                Height = 132
                ParentCustomHint = False
                BiDiMode = bdLeftToRight
                Ctl3D = True
                DoubleBuffered = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Fixedsys'
                Font.Style = []
                ItemHeight = 15
                MultiSelect = True
                ParentBiDiMode = False
                ParentCtl3D = False
                ParentDoubleBuffered = False
                ParentFont = False
                ParentShowHint = False
                ShowHint = False
                TabOrder = 0
                StyleElements = []
                OnClick = LB_CopyClick
                OnMouseUp = LB_MainMouseUp
              end
            end
            object TS_Sync2: TTabSheet
              Caption = 'Sync'
              ImageIndex = 4
              object LB_Sync: TListBox
                Left = 68
                Top = 8
                Width = 301
                Height = 132
                ParentCustomHint = False
                BiDiMode = bdLeftToRight
                Ctl3D = True
                DoubleBuffered = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Fixedsys'
                Font.Style = []
                ItemHeight = 15
                MultiSelect = True
                ParentBiDiMode = False
                ParentCtl3D = False
                ParentDoubleBuffered = False
                ParentFont = False
                ParentShowHint = False
                ShowHint = False
                TabOrder = 0
                StyleElements = []
                OnClick = LB_SyncClick
                OnMouseUp = LB_MainMouseUp
              end
            end
            object TS_DirMon2: TTabSheet
              Caption = 'DirMon'
              ImageIndex = 5
              object LB_DirMon: TListBox
                Left = 72
                Top = 8
                Width = 301
                Height = 132
                ParentCustomHint = False
                BiDiMode = bdLeftToRight
                Ctl3D = True
                DoubleBuffered = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Fixedsys'
                Font.Style = []
                ItemHeight = 15
                MultiSelect = True
                ParentBiDiMode = False
                ParentCtl3D = False
                ParentDoubleBuffered = False
                ParentFont = False
                ParentShowHint = False
                ShowHint = False
                TabOrder = 0
                StyleElements = []
                OnClick = LB_DirMonClick
                OnMouseUp = LB_MainMouseUp
              end
            end
            object TS_FN2: TTabSheet
              Caption = 'FN'
              ImageIndex = 6
              object LB_FileExists: TListBox
                Left = 62
                Top = 8
                Width = 301
                Height = 132
                ParentCustomHint = False
                BiDiMode = bdLeftToRight
                Ctl3D = True
                DoubleBuffered = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Fixedsys'
                Font.Style = []
                ItemHeight = 15
                MultiSelect = True
                ParentBiDiMode = False
                ParentCtl3D = False
                ParentDoubleBuffered = False
                ParentFont = False
                ParentShowHint = False
                ShowHint = False
                TabOrder = 0
                StyleElements = []
                OnClick = LB_FileExistsClick
                OnMouseUp = LB_MainMouseUp
              end
            end
            object TS_FF: TTabSheet
              Caption = 'FF'
              ImageIndex = 7
              object LB_FindFirst: TListBox
                Left = 66
                Top = 8
                Width = 301
                Height = 132
                ParentCustomHint = False
                BiDiMode = bdLeftToRight
                Ctl3D = True
                DoubleBuffered = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Fixedsys'
                Font.Style = []
                ItemHeight = 15
                MultiSelect = True
                ParentBiDiMode = False
                ParentCtl3D = False
                ParentDoubleBuffered = False
                ParentFont = False
                ParentShowHint = False
                ShowHint = False
                TabOrder = 0
                StyleElements = []
                OnClick = LB_FindFirstClick
                OnMouseUp = LB_MainMouseUp
              end
            end
            object TS_FileAge: TTabSheet
              Caption = 'Age'
              ImageIndex = 8
              object LB_FileAge: TListBox
                Left = 70
                Top = 8
                Width = 301
                Height = 132
                ParentCustomHint = False
                BiDiMode = bdLeftToRight
                Ctl3D = True
                DoubleBuffered = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Fixedsys'
                Font.Style = []
                ItemHeight = 15
                MultiSelect = True
                ParentBiDiMode = False
                ParentCtl3D = False
                ParentDoubleBuffered = False
                ParentFont = False
                ParentShowHint = False
                ShowHint = False
                TabOrder = 0
                StyleElements = []
                OnClick = LB_FileAgeClick
                OnMouseUp = LB_MainMouseUp
              end
            end
            object TS_DeleteFile: TTabSheet
              Caption = 'Delete'
              ImageIndex = 9
              object LB_DeleteFile: TListBox
                Left = 74
                Top = 8
                Width = 301
                Height = 132
                ParentCustomHint = False
                BiDiMode = bdLeftToRight
                Ctl3D = True
                DoubleBuffered = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Fixedsys'
                Font.Style = []
                ItemHeight = 15
                MultiSelect = True
                ParentBiDiMode = False
                ParentCtl3D = False
                ParentDoubleBuffered = False
                ParentFont = False
                ParentShowHint = False
                ShowHint = False
                TabOrder = 0
                StyleElements = []
                OnClick = LB_DeleteFileClick
                OnMouseUp = LB_MainMouseUp
              end
            end
          end
        end
        object TabSheet1: TTabSheet
          Caption = 'Aplica'#231#227'o'
          ImageIndex = 8
          object PC_Aplicacao: TPageControl
            Left = 0
            Top = 0
            Width = 608
            Height = 188
            ActivePage = TS_Aplicacao_2
            Align = alClient
            TabOrder = 0
            object TS_Aplicacao_1: TTabSheet
              Caption = '1'
              object LB_Aplicacao_1: TListBox
                Left = 78
                Top = 12
                Width = 301
                Height = 132
                ParentCustomHint = False
                BiDiMode = bdLeftToRight
                Ctl3D = True
                DoubleBuffered = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Fixedsys'
                Font.Style = []
                ItemHeight = 15
                MultiSelect = True
                ParentBiDiMode = False
                ParentCtl3D = False
                ParentDoubleBuffered = False
                ParentFont = False
                ParentShowHint = False
                ShowHint = False
                TabOrder = 0
                StyleElements = []
                OnClick = LB_Aplicacao_1Click
                OnMouseUp = LB_MainMouseUp
              end
            end
            object TS_Aplicacao_2: TTabSheet
              Caption = '2'
              ImageIndex = 1
              object LB_Aplicacao_2: TListBox
                Left = 82
                Top = 16
                Width = 301
                Height = 132
                ParentCustomHint = False
                BiDiMode = bdLeftToRight
                Ctl3D = True
                DoubleBuffered = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Fixedsys'
                Font.Style = []
                ItemHeight = 15
                MultiSelect = True
                ParentBiDiMode = False
                ParentCtl3D = False
                ParentDoubleBuffered = False
                ParentFont = False
                ParentShowHint = False
                ShowHint = False
                TabOrder = 0
                StyleElements = []
                OnClick = LB_Aplicacao_2Click
                OnMouseUp = LB_MainMouseUp
              end
            end
            object TS_Aplicacao_3: TTabSheet
              Caption = '3'
              ImageIndex = 2
              object LB_Aplicacao_3: TListBox
                Left = 86
                Top = 20
                Width = 301
                Height = 132
                ParentCustomHint = False
                BiDiMode = bdLeftToRight
                Ctl3D = True
                DoubleBuffered = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Fixedsys'
                Font.Style = []
                ItemHeight = 15
                MultiSelect = True
                ParentBiDiMode = False
                ParentCtl3D = False
                ParentDoubleBuffered = False
                ParentFont = False
                ParentShowHint = False
                ShowHint = False
                TabOrder = 0
                StyleElements = []
                OnClick = LB_Aplicacao_3Click
                OnMouseUp = LB_MainMouseUp
              end
            end
            object TS_Aplicacao_4: TTabSheet
              Caption = '4'
              ImageIndex = 3
              object LB_Aplicacao_4: TListBox
                Left = 90
                Top = 24
                Width = 301
                Height = 132
                ParentCustomHint = False
                BiDiMode = bdLeftToRight
                Ctl3D = True
                DoubleBuffered = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Fixedsys'
                Font.Style = []
                ItemHeight = 15
                MultiSelect = True
                ParentBiDiMode = False
                ParentCtl3D = False
                ParentDoubleBuffered = False
                ParentFont = False
                ParentShowHint = False
                ShowHint = False
                TabOrder = 0
                StyleElements = []
                OnClick = LB_Aplicacao_4Click
                OnMouseUp = LB_MainMouseUp
              end
            end
            object TS_Aplicacao_5: TTabSheet
              Caption = '5'
              ImageIndex = 4
              object LB_Aplicacao_5: TListBox
                Left = 94
                Top = 28
                Width = 301
                Height = 132
                ParentCustomHint = False
                BiDiMode = bdLeftToRight
                Ctl3D = True
                DoubleBuffered = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Fixedsys'
                Font.Style = []
                ItemHeight = 15
                MultiSelect = True
                ParentBiDiMode = False
                ParentCtl3D = False
                ParentDoubleBuffered = False
                ParentFont = False
                ParentShowHint = False
                ShowHint = False
                TabOrder = 0
                StyleElements = []
                OnClick = LB_Aplicacao_5Click
                OnMouseUp = LB_MainMouseUp
              end
            end
          end
        end
      end
      object PN_Rodape: TPanel
        Left = 0
        Top = 350
        Width = 616
        Height = 113
        Align = alBottom
        TabOrder = 1
        object PN_Filtro_Log: TPanel
          Left = 1
          Top = 1
          Width = 614
          Height = 31
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
          TabOrder = 0
          StyleElements = []
          object Label1: TLabel
            AlignWithMargins = True
            Left = 4
            Top = 4
            Width = 28
            Height = 13
            ParentCustomHint = False
            Align = alLeft
            BiDiMode = bdLeftToRight
            Caption = 'Filtro:'
            Color = clBtnFace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentBiDiMode = False
            ParentColor = False
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
            Layout = tlCenter
            StyleElements = []
          end
          object ED_Filtro: TEdit
            AlignWithMargins = True
            Left = 38
            Top = 5
            Width = 107
            Height = 21
            Margins.Top = 4
            Margins.Bottom = 4
            Align = alLeft
            TabOrder = 0
            Text = 'ED_Filtro'
            OnChange = ED_FiltroChange
          end
          object Bot_Atualizar: TButton
            AlignWithMargins = True
            Left = 151
            Top = 4
            Width = 24
            Height = 23
            Align = alLeft
            ImageIndex = 0
            Images = ImageList1
            TabOrder = 1
            OnClick = Bot_AtualizarClick
          end
          object CK_Rolagem: TCheckBox
            Left = 524
            Top = 1
            Width = 63
            Height = 29
            ParentCustomHint = False
            Align = alLeft
            BiDiMode = bdLeftToRight
            Caption = '&Rolagem'
            Checked = True
            Color = clBtnFace
            Ctl3D = True
            DoubleBuffered = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
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
            TabOrder = 2
            StyleElements = []
          end
          object ED_Timeout: TEdit
            AlignWithMargins = True
            Left = 471
            Top = 6
            Width = 48
            Height = 19
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 5
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
            ParentCtl3D = False
            ParentDoubleBuffered = False
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
            TabOrder = 3
            Text = '100'
            StyleElements = []
            ExplicitHeight = 21
          end
          object Bot_Limpar: TButton
            AlignWithMargins = True
            Left = 181
            Top = 4
            Width = 54
            Height = 23
            Align = alLeft
            Caption = 'Limpar'
            TabOrder = 4
            OnClick = Bot_LimparClick
          end
          object PN_Excecoes: TPanel
            AlignWithMargins = True
            Left = 241
            Top = 4
            Width = 70
            Height = 23
            ParentCustomHint = False
            Align = alLeft
            BiDiMode = bdLeftToRight
            Caption = 'Exc: 999999'
            Ctl3D = True
            DoubleBuffered = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentBiDiMode = False
            ParentCtl3D = False
            ParentDoubleBuffered = False
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
            TabOrder = 5
            StyleElements = []
            OnClick = PN_ExcecoesClick
            OnDblClick = PN_ExcecoesDblClick
          end
          object PN_Atencao: TPanel
            AlignWithMargins = True
            Left = 393
            Top = 4
            Width = 70
            Height = 23
            ParentCustomHint = False
            Align = alLeft
            BiDiMode = bdLeftToRight
            Caption = 'Atc: 999999'
            Ctl3D = True
            DoubleBuffered = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentBiDiMode = False
            ParentCtl3D = False
            ParentDoubleBuffered = False
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
            TabOrder = 6
            StyleElements = []
            OnClick = PN_AtencaoClick
            OnDblClick = PN_ExcecoesDblClick
          end
          object PN_Erros: TPanel
            AlignWithMargins = True
            Left = 317
            Top = 4
            Width = 70
            Height = 23
            ParentCustomHint = False
            Align = alLeft
            BiDiMode = bdLeftToRight
            Caption = 'Err: 999999'
            Ctl3D = True
            DoubleBuffered = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentBiDiMode = False
            ParentCtl3D = False
            ParentDoubleBuffered = False
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
            TabOrder = 7
            StyleElements = []
            OnClick = PN_ErrosClick
            OnDblClick = PN_ExcecoesDblClick
          end
        end
        object LB_Filtro: TListBox
          Left = 1
          Top = 32
          Width = 614
          Height = 80
          Align = alClient
          ItemHeight = 13
          TabOrder = 1
          OnClick = LB_FiltroClick
        end
      end
      object PN_ME: TPanel
        Left = 0
        Top = 221
        Width = 616
        Height = 124
        Align = alBottom
        TabOrder = 2
        object ME: TMemo
          Left = 1
          Top = 1
          Width = 614
          Height = 122
          Align = alClient
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Fixedsys'
          Font.Style = []
          Lines.Strings = (
            'ME')
          ParentFont = False
          ScrollBars = ssVertical
          TabOrder = 0
        end
      end
    end
    object TS_Monitor: TTabSheet
      Caption = 'Monitor'
      ImageIndex = 1
      object PN_Header_: TPanel
        Left = 0
        Top = 0
        Width = 616
        Height = 33
        ParentCustomHint = False
        Align = alTop
        BevelOuter = bvLowered
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
        DesignSize = (
          616
          33)
        object PN_Monitoramento_Ignorados: TPanel
          Left = 1
          Top = 1
          Width = 143
          Height = 31
          ParentCustomHint = False
          Align = alLeft
          BevelOuter = bvLowered
          BiDiMode = bdLeftToRight
          Color = 14155775
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
        end
        object CK_Rolagem_DirMon: TCheckBox
          Left = 531
          Top = 7
          Width = 65
          Height = 17
          ParentCustomHint = False
          Anchors = [akTop, akRight]
          BiDiMode = bdLeftToRight
          Caption = 'Rolagem'
          Checked = True
          Color = clBtnFace
          Ctl3D = True
          DoubleBuffered = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
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
          TabOrder = 1
          StyleElements = []
        end
      end
      object LB_Monitor: TListBox
        Left = 200
        Top = 116
        Width = 121
        Height = 97
        ItemHeight = 13
        TabOrder = 1
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Socket'
      ImageIndex = 2
      object SB_Servidor: TStatusBar
        Left = 0
        Top = 214
        Width = 616
        Height = 19
        Align = alTop
        Panels = <>
        SimplePanel = True
        SizeGrip = False
      end
      object SB_Cliente: TStatusBar
        Left = 0
        Top = 444
        Width = 616
        Height = 19
        Panels = <>
        SimplePanel = True
        SizeGrip = False
      end
      object LB_Cliente: TListBox
        Left = 0
        Top = 233
        Width = 616
        Height = 199
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Fixedsys'
        Font.Style = []
        IntegralHeight = True
        ItemHeight = 15
        ParentFont = False
        TabOrder = 2
      end
      object LB_Servidor: TListBox
        Left = 0
        Top = 0
        Width = 616
        Height = 214
        Align = alTop
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Fixedsys'
        Font.Style = []
        IntegralHeight = True
        ItemHeight = 15
        ParentFont = False
        TabOrder = 3
      end
    end
  end
  object SB_Log1: TStatusBar
    Left = 0
    Top = 491
    Width = 624
    Height = 19
    Panels = <>
    SimplePanel = True
    SizeGrip = False
  end
  object SB_Log2: TStatusBar
    Left = 0
    Top = 510
    Width = 624
    Height = 19
    Panels = <>
    SimplePanel = True
    SizeGrip = False
  end
  object ImageList1: TImageList
    Left = 100
    Top = 244
    Bitmap = {
      494C010101000800040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFF0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF000000000000FFFFFF008080
      8000808080008080800080808000808080008080800080808000808080008080
      80008080800000000000FFFF0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008080800000000000FFFF0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008080800000000000FFFF0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008080800000000000FFFF0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008080800000000000FFFF0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008080800000000000FFFF0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008080800000000000FFFF0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008080800000000000FFFF0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008080800000000000FFFF0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008080800000000000FFFF0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000FFFF0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFF0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFF0000000000000001000000000000
      000100000000000000010000000000001FF10000000000001DF1000000000000
      1CF10000000000001C710000000000001C310000000000001C71000000000000
      1CF10000000000001DF10000000000001FF10000000000000001000000000000
      0001000000000000000100000000000000000000000000000000000000000000
      000000000000}
  end
  object MainMenu1: TMainMenu
    Left = 200
    Top = 84
    object Arquivo1: TMenuItem
      Caption = 'Arquivo'
      object Salvar1: TMenuItem
        Caption = 'Salvar'
        OnClick = Salvar1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Fechar1: TMenuItem
        Caption = 'Fechar'
        OnClick = Fechar1Click
      end
    end
    object Opes1: TMenuItem
      Caption = 'Op'#231#245'es'
      object CK_MonitorarTeclado: TMenuItem
        Caption = 'Monitorar Teclado'
        OnClick = CK_MonitorarTecladoClick
      end
    end
    object Limpar1: TMenuItem
      Caption = 'Limpar'
      OnClick = Limpar1Click
    end
  end
  object SaveTextFileDialog1: TSaveTextFileDialog
    Left = 68
    Top = 64
  end
end
