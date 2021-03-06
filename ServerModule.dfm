object UniServerModule: TUniServerModule
  OnCreate = UniGUIServerModuleCreate
  OnDestroy = UniGUIServerModuleDestroy
  TempFolder = 'temp\'
  Title = 'New Application'
  SuppressErrors = []
  Bindings = <>
  MainFormDisplayMode = mfPage
  CustomMeta.Strings = (
    'VIDE CODIGO')
  ServerMessages.UnavailableErrMsg = 'Erro de comunica'#231#227'o'
  ServerMessages.LoadingMessage = 'Carregando...'
  ServerMessages.ExceptionTemplate.Strings = (
    '<html>'
    '<body bgcolor="#dfe8f6">'
    
      '<p style="text-align:center;color:#A05050">Ocorreu um erro na ap' +
      'lica'#231#227'o:</p>'
    '<p style="text-align:center;color:#0000A0">[###message###]</p>'
    
      '<p style="text-align:center;color:#A05050"><a href="[###url###]"' +
      '>Reiniciando janela do sistema</a></p>'
    '</body>'
    '</html>')
  SSL.SSLOptions.RootCertFile = 'root.pem'
  SSL.SSLOptions.CertFile = 'cert.pem'
  SSL.SSLOptions.KeyFile = 'key.pem'
  SSL.SSLOptions.Method = sslvTLSv1_1
  SSL.SSLOptions.SSLVersions = [sslvTLSv1_1]
  SSL.SSLOptions.Mode = sslmUnassigned
  SSL.SSLOptions.VerifyMode = []
  SSL.SSLOptions.VerifyDepth = 0
  ConnectionFailureRecovery.ErrorMessage = 'Connection Error'
  ConnectionFailureRecovery.RetryMessage = 'Retrying...'
  OnException = UniGUIServerModuleException
  OnControlPanelLogin = UniGUIServerModuleControlPanelLogin
  OnHTTPCommand = UniGUIServerModuleHTTPCommand
  OnHTTPDocument = UniGUIServerModuleHTTPDocument
  OnServerStartup = UniGUIServerModuleServerStartup
  Height = 451
  Width = 750
  PixelsPerInch = 96
  object fd: TFDConnection
    Params.Strings = (
      'Database=sistema'
      'User_Name=root'
      'Server=localhost'
      'Password=rr2908BB'
      'DriverID=MySQL')
    Connected = True
    LoginPrompt = False
    Left = 24
    Top = 36
  end
  object query_login: TFDQuery
    Connection = fd
    SQL.Strings = (
      'select * from usuarios')
    Left = 108
    Top = 32
    object query_loginid: TFDAutoIncField
      DisplayLabel = 'Id'
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object query_loginnome: TStringField
      DisplayWidth = 20
      FieldName = 'nome'
      Origin = 'nome'
      Required = True
      Size = 25
    end
    object query_loginusuario: TStringField
      FieldName = 'usuario'
      Origin = 'usuario'
      Required = True
    end
    object query_loginsenha: TStringField
      DisplayWidth = 10
      FieldName = 'senha'
      Origin = 'senha'
      Required = True
    end
    object query_loginnivel: TStringField
      DisplayWidth = 15
      FieldName = 'nivel'
      Origin = 'nivel'
      Required = True
    end
  end
  object query_forn: TFDQuery
    Connection = fd
    SQL.Strings = (
      'select * from fornecedores')
    Left = 196
    Top = 32
    object query_fornid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object query_fornnome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Required = True
      Size = 25
    end
    object query_fornprodutos: TStringField
      FieldName = 'produtos'
      Origin = 'produtos'
      Required = True
      Size = 30
    end
    object query_forntelefone: TStringField
      FieldName = 'telefone'
      Origin = 'telefone'
      Required = True
      Size = 15
    end
    object query_fornendereco: TStringField
      FieldName = 'endereco'
      Origin = 'endereco'
      Required = True
      Size = 30
    end
  end
  object query_produtos: TFDQuery
    Connection = fd
    SQL.Strings = (
      
        'SELECT p.id, p.nome, p.descricao, p.valor, p.estoque, p.id_forne' +
        'cedor, p.imagem, f.nome as nome_forn FROM produtos as p INNER JO' +
        'IN fornecedores as f on p.id_fornecedor = f.id order by p.nome a' +
        'sc')
    Left = 288
    Top = 32
    object query_produtosid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object query_produtosnome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Required = True
    end
    object query_produtosdescricao: TStringField
      FieldName = 'descricao'
      Origin = 'descricao'
      Required = True
      Size = 35
    end
    object query_produtosvalor: TBCDField
      FieldName = 'valor'
      Origin = 'valor'
      Required = True
      Precision = 10
      Size = 2
    end
    object query_produtosestoque: TIntegerField
      FieldName = 'estoque'
      Origin = 'estoque'
      Required = True
    end
    object query_produtosid_fornecedor: TIntegerField
      FieldName = 'id_fornecedor'
      Origin = 'id_fornecedor'
      Required = True
    end
    object query_produtosimagem: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'imagem'
      Origin = 'imagem'
      Size = 100
    end
    object query_produtosnome_forn: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nome_forn'
      Origin = 'nome'
      ProviderFlags = []
      ReadOnly = True
      Size = 25
    end
  end
  object query_gastos: TFDQuery
    Connection = fd
    SQL.Strings = (
      'select * from gastos')
    Left = 112
    Top = 128
    object query_gastosid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object query_gastosmotivo: TStringField
      FieldName = 'motivo'
      Origin = 'motivo'
      Required = True
      Size = 30
    end
    object query_gastosvalor: TBCDField
      FieldName = 'valor'
      Origin = 'valor'
      Required = True
      Precision = 10
      Size = 2
    end
    object query_gastosfuncionario: TStringField
      FieldName = 'funcionario'
      Origin = 'funcionario'
      Required = True
    end
    object query_gastosdata: TDateField
      FieldName = 'data'
      Origin = 'data'
      Required = True
    end
  end
  object query_coringa: TFDQuery
    Connection = fd
    Left = 196
    Top = 128
  end
  object DS_Login: TDataSource
    DataSet = query_login
    Left = 288
    Top = 132
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 80
    Top = 272
  end
end
