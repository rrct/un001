object UniServerModule: TUniServerModule
  OldCreateOrder = False
  TempFolder = 'temp\'
  Title = 'New Application'
  SuppressErrors = []
  Bindings = <>
  MainFormDisplayMode = mfPage
  CustomCSS.Strings = (
    
      '.x-treelist-nav {                      /* Aqui ira determina a C' +
      'OR DE Fundo do menu */'
    '    background-color: #394399 !important;/* '
    '    background-position: 24px 0% !important;'
    '    padding: 0 0 0 0;'
    '    borde:none ;'
    '    overflow: auto !important;'
    
      '    scrollbar-width: thin;             /*estilo do scrool para o' +
      ' mozilla  */'
    
      '    scrollbar-color: #adb3b8 #516579;  /*estilo do scrool para o' +
      ' mozilla  */'
    '}'
    ''
    '.x-treelist-nav::-webkit-scrollbar {width: 7px; height:7px; '
    'background:#516579;}'
    
      '.x-treelist-nav::-webkit-scrollbar-track {background: rgba(0,0,0' +
      ',0.1);}'
    
      '.x-treelist-nav::-webkit-scrollbar-thumb {border-radius: 7px; he' +
      'ight:7px; '
    'background:#adb3b8;}'
    ''
    ' .x-treelist-nav .x-treelist-item-text {'
    '  /* menu lado Esquerdo */'
    '  color: #adb3b8;     /* cor da letra do menu */'
    
      '  margin-left: 27px;  /* 27 espa'#231'amento da esquerda para direita' +
      ' dos Itens do menu */'
    
      '  margin-right: 26px; /* espa'#231'amento da esquerda para direita do' +
      's Grupos do menu */'
    '  font-size: 12px;    /* tamanho das letras */'
    '  line-height: 34px;  /* altura da linha do menu */'
    '}'
    ''
    
      '.x-treelist-nav .x-treelist-item-icon:before, .x-treelist-nav .x' +
      '-treelist-item-tool:before, .x-treelist-nav .x-treelist-item-exp' +
      'ander {'
    '    line-height: 34px;   /* 44 '#233' o padrao */'
    ''
    '}')
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
  Height = 253
  Width = 311
end
