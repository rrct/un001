object Carregando_Sistema: TCarregando_Sistema
  Left = 252
  Top = 287
  BorderIcons = [biSystemMenu]
  Caption = 'R-News - Carregando Sistema...'
  ClientHeight = 398
  ClientWidth = 612
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  KeyPreview = True
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GA: TGauge
    Left = 0
    Top = 370
    Width = 612
    Height = 9
    Align = alBottom
    ForeColor = clRed
    Progress = 0
    ShowText = False
    ExplicitTop = 317
    ExplicitWidth = 622
  end
  object PN_Top2: TPanel
    Left = 0
    Top = 0
    Width = 612
    Height = 100
    ParentCustomHint = False
    Align = alTop
    BevelOuter = bvNone
    BiDiMode = bdLeftToRight
    Color = 8158332
    Ctl3D = True
    DoubleBuffered = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
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
    ExplicitWidth = 622
    DesignSize = (
      612
      100)
    object Label7: TLabel
      AlignWithMargins = True
      Left = 108
      Top = 11
      Width = 257
      Height = 23
      ParentCustomHint = False
      BiDiMode = bdLeftToRight
      Caption = 'Rabelo Sistemas [R-News]'
      Color = clAqua
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clAqua
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBiDiMode = False
      ParentColor = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      StyleElements = []
    end
    object LB_Carga_2: TLabel
      AlignWithMargins = True
      Left = 108
      Top = 38
      Width = 237
      Height = 18
      ParentCustomHint = False
      BiDiMode = bdLeftToRight
      Caption = 'Sistema de Edi'#231#227'o de Telejornalismo'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBiDiMode = False
      ParentColor = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      StyleElements = []
    end
    object IM_Logo: TImage
      Left = 381
      Top = 11
      Width = 223
      Height = 75
      Anchors = [akTop, akRight]
      AutoSize = True
      Picture.Data = {
        0954506E67496D61676589504E470D0A1A0A0000000D49484452000000DF0000
        004B0803000000C7D0A24B000000017352474200AECE1CE90000000467414D41
        0000B18F0BFC610500000300504C544500000001010102020203030304040405
        05050606060707070808080909090A0A0A0B0B0B0C0C0C0D0D0D0E0E0E0F0F0F
        1010101111111212121313131414141515151616161717171818181919191A1A
        1A1B1B1B1C1C1C1D1D1D1E1E1E1F1F1F20202021212122222223232324242425
        25252626262727272828282929292A2A2A2B2B2B2C2C2C2D2D2D2E2E2E2F2F2F
        3030303131313232323333333434343535353636363737373838383939393A3A
        3A3B3B3B3C3C3C3D3D3D3E3E3E3F3F3F40404041414142424243434344444445
        45454646464747474848484949494A4A4A4B4B4B4C4C4C4D4D4D4E4E4E4F4F4F
        5050505151515252525353535454545555555656565757575858585959595A5A
        5A5B5B5B5C5C5C5D5D5D5E5E5E5F5F5F60606061616162626263636364646465
        65656666666767676868686969696A6A6A6B6B6B6C6C6C6D6D6D6E6E6E6F6F6F
        7070707171717272727373737474747575757676767777777878787979797A7A
        7A7B7B7B7D7D7D7E7E7E7F7F7F80808081818182828283838384848485858586
        86868787878888888989898A8A8A8B8B8B8C8C8C8D8D8D8E8E8E8F8F8F909090
        9191919292929393939494949595959696969898989999999A9A9A9B9B9B9C9C
        9C9D9D9D9E9E9E9F9F9FA0A0A0A1A1A1A2A2A2A3A3A3A4A4A4A5A5A5A6A6A6A7
        A7A7A8A8A8A9A9A9AAAAAAABABABACACACADADADAEAEAEAFAFAFB0B0B0B1B1B1
        B2B2B2B3B3B3B4B4B4B5B5B5B6B6B6B7B7B7B8B8B8B9B9B9BABABABBBBBBBCBC
        BCBDBDBDBEBEBEBFBFBFC0C0C0C1C1C1C2C2C2C3C3C3C4C4C4C5C5C5C6C6C6C7
        C7C7C8C8C8C9C9C9CACACACBCBCBCCCCCCCDCDCDCECECECFCFCFD0D0D0D1D1D1
        D2D2D2D3D3D3D4D4D4D5D5D5D6D6D6D7D7D7D8D8D8D9D9D9DADADADBDBDBDCDC
        DCDDDDDDDEDEDEDFDFDFE0E0E0E1E1E1E2E2E2E3E3E3E4E4E4E5E5E5E6E6E6E7
        E7E7E8E8E8E9E9E9EAEAEAEBEBEBECECECEDEDEDEEEEEEEFEFEFF0F0F0F1F1F1
        F2F2F2F3F3F3F4F4F4F5F5F5F6F6F6F7F7F7F8F8F8F9F9F9FAFAFAFBFBFBFCFC
        FCFDFDFDFEFEFEFFFFFF00000000000064A53411000000097048597300000E4D
        00000E4D0146D568090000001874455874536F667477617265007061696E742E
        6E657420342E312E36FD4E09E800000E9F4944415478DAED9B095C4DD91FC07F
        EFB5EFEA955E298A4225A285444D9AB16429947DECC6883466EC32F665646B92
        652C191A22C4584A76322A6DA2D1226D48494A4AF5DEEBFDCFB9EFDEF76EF55E
        EF8D34317FE7D3E7DDDF59EFF9DEB3FDCEEF9C18F0DF768CD6AEC017BE2F7C32
        F031CD44617C06FEA32460A0DFDADCD6AE6833F934CA9A4CC64F0F3A5CD3DA75
        6D413EE45ECDBCD0DA956D513EE06F5D5ED7DAD56D493E00FF4DAD5DDD96E583
        DE09F5BCCACF3585F2454F5A84518EA4126EC61C7C460856294DBE69C01D0E25
        0EBB2C26DE66ED10897973F7EFACFD30BEBFFAD7F30E3F2B922BF438228F71AE
        E4326AD66FC48FBE779A7C93EB6D1E250E8D6A1C3D2C5CB1A9DCD11E14E03FE3
        836FAED37D07A6D13CD38EC8C60770F0FBBA66F2693E68DF743D97067C18DF95
        C1348F4AA621CD173E4E563E621C378B6FFE0E29F52C34E67F101F74CE16C943
        EA2D18B56D2B64E57BE790D13CBEA86FA4D5D331FEC3F8BEDF2F92372DAE17E5
        7D46563E089BD83CBE2A2569F55CB9F1C3F8A2860A45F97CFD7A51173C64E6AB
        34296D165FAD9CB47AAE5E27998FCFAB9F96C914C9C50642D136BE7EB2772CAE
        AC7CB0687B2BF28D3F593FADFED60942B9CAE01D25EEF46D50A65784CC7CE746
        89F8AA5E8A493031BEE5F8EC931A24661C1B23822DA102F30D1B243B34AB31DF
        AEA5F4147617D504C21B5D115FBF7B626BF82FF28151A670400BF9FADD6A98AA
        C4885AE2457C3343EA25F13C45BE906D2EE453E48138270BDFDDB90DF2F6DFC5
        FC103E48B16EC4B77149A35403AF49E383785BB222F031F8CC1AE9811B967E24
        3E46AA2519B2B3B7232985CC94CA7769D047E4E3CB378A59F8CB87F031B34CA8
        92D9E502C13C9D8A34753B404AAF0CEBA4F145BB7D8A7CA2A540B83EF8AF2185
        58273DE10468F3500A9FD963727C74D6FF84F8CC6FB229F126F9FDE19105292C
        DB0217A8BD4AE08F0DF9E6FC462FA8DD8D4E0281AB249A3F8D5FFCCB7C6E16F5
        F368F809F160D57AC1D3EA0195B3672AF80491F2932E0DF9AACAE925A96B9042
        5C5F115FC53B7A92A5A12DCEE7B0E52B90E47A3C123C9793F921DD0AC0309F2A
        866C7AA9EBFB9AB512F4175E87C216E7B32F4E6249A8D7BD7EA470BF17296C5F
        847E52AD48DFE615B2F159FF2D812FC55648DA727C495E6112ECBEB3C9A992FD
        9C0A211A54D89A8FBBC9C457C9AE92C0B750B8B36BD1F925709ED8B7179A550B
        8419D4B4914B4C181DB3A8148219546AFBCD382C81CFA4E05FE1D3BE650562DC
        90685288A19674C18CC948EC41FAD7AF92892F748A783E61FF6FE9F5C132458C
        0A1B3C9F14F40BA858D7DBC46309B99D8464BBFA7C7763E90558B89342BEA988
        EFF81960E0530054197EBEC840D7C2EB9FEFCE4679A3465256A97981A450D441
        A0527749230BE29A1580E4F59D79703229C989F874CA419C6BE9F5FD8C47FD9C
        9CED2B85AFBCFC3529FC360780A58A90F28CC890159B9BE0038D27BA02C189D9
        DAFA8BCE837AFBBB4B3F270B65B5B79484770CB3B511D2D6056448A2037C26FA
        F5D073B44582D3A148E419739C148A0DD1A8396F823617368954A45EE967C207
        9B17D132DE72E30BE5D3942D7E9F0F806E11361A3273A80E3AEB50137C4A45A4
        86D6A5ADCC7C3EFB24F1C1E43F1A4428C477979D8F71CF9E9695185884D32AA4
        76F323FF04987A10966C450BC332EA430C90CCC7D841D96C68F30BFB55D37C0D
        CD5DF0568FE27B7FBB4194BE0DC8CE07A6A9AAA2508E2B6527194FA9C055EC4A
        80EB2E0492630C1958CDAEA0F1C5D5E3739C420A29B622BEC87362E82E148A6F
        55824FFB63D95FC6D1DB3FDB89FCD027BCC890B08968AE79A90AD586E5B41974
        7EB0F4F5FDC06CD9ED832DC8074726D2F284919EF7D4D90DEEFE5E270448B08F
        324E440D95CEE77CF7D3E0534B34A765126C5685C70E152C5487A3D8361A390C
        C0FD3C954CA5561ADF132BEEA7C107BDEED33295F57B8C7E837C48EFB95100AA
        AF7163D676280685426D327C5CB8343E34C7368BEF6907697C938ECBC6073F6D
        A179629D79A05C4CDA6861EA51000FC1A1CAD8530087A8C9E3F824297CA93DFF
        C9F998183EE15890E4B806A532F2316F3AD17CDB16830B75C4C969F71A207C14
        21E3A61C1849BDDF40AF493E8EDDA366F2D9C549E1BB4AAA1132D8970CE2E97A
        DA888BFBA793225E15D40A058DF956BF16545EAA933123939BE22BF2C1C7DACD
        E2134DE112BEA013A54EC9603F1B1141F3E40FB9456AC8845E21D4D4BE3D469B
        414F2E96CC5777CC97D05E9BC7A7B3656A1337CB2A7DA8155A26FB60FD83A295
        D4316D701D6DFD38391EA02B75AAFA32721A4870DC93AF058241D32D70FA85AF
        C4B85AACB0590D90185F1659229465E1934BED4AF32DA49D7D335EB4A5DEA95B
        099FA293C9BEDB2D91A6A8737B8B6EAE0CB82214075D6D6D94A6F99E8BC29C1B
        5DBD994BBFB8F45034A16E1499A1F62D824FD1FDBFDCFFFCAFBA2F7C9FB76BC4
        A760505CDDDA956A013E256F57ED57B7CFBC67C4DAA55B35AB4471CEC905805F
        9576F77D6BF1695D264C2D7BE7CABDD4A968238C359A53B7F3F547784BE440E2
        91E795242E7672B7FBE11F8345CF8FF16B518330926FFD32FEC198F6E3EE4F87
        41FDEE5D12C6A23DAB4B8CEC2F90E8A2DD6A76336CFB439635474C6C42CF5B03
        FE7191629CF30D706F781796E44BEEFEB4331FE458C5A063FC1C696FAA7D592F
        E3AA595EBB61527C315238F5FA2867A7207D53DD2CB7CCC4AEE40E0F2CACF3E3
        B0C550C1A6033F8338F414E4A10AD6EDA3929D4C9914A3DDCA7580716E28DF32
        13806DD3A6348EB0C977EECE7D982DD7F1BC79E2044E1E74E16776B2BD570060
        D293919681E399DD3AC9E724A1D76A74CA29EF685B145307DD2C73EF13A5EA3A
        2A13E5AB99E7BD31EAFDEE563568BB1F8159B7706D551D75DF26BCA2F33DB4AC
        EE23B81B706540BC230C0AD50128EC729A50987F59AEB8DE0F296809637361DD
        F2B0829F9890346A13D2A7CF7B73C07715DEB5DFF12C03F710B4B128EA280094
        DFE0A780BE9A770E8D0FDF4DE99E6618EA8CDEF97EDE61503938168DCA1537FF
        C229F85AEA2F7833F62A1F99D6660FBE2C757EF25BF0DE8E776669C3F320E0C7
        C3657E0C88F3DE311AA9DE13B820BFFE07547ECAD827B07AE5A9CC2572903F28
        F3D4485C50F07CA6EF6A4DA446EE595223E2DBBA00DE07EDC23ADA759784DECA
        053A31674D47F708F0D48477B59BB7AD5B5E135C36CB38C1B16EC3528EC26BB9
        3650A9F65C5B15661D623C6B73EDA9D910F40D54F3B563224CC75A0AF6CD6B57
        D4EC2D996D94E4C017F119C4989498BC9F78E4C94DCE487665BB0ABFEDD53B2A
        0666EEBAAE2DC7ABA832D37E0EB58ABCD0E911234A83147C3542A740B4CB9D34
        F66806DA9A6C5DC0952F51D08277EACF582AD8F680CADF5DFA1DAED11A7FAE7C
        294F0FEDB083276842654DE07A9F20C84EE96E0E014B457CDAD1BD00AA83D754
        127CE6E9F8A44FB1166FFDD0F8D37CA6B66233B85EE5F74A454DF0FB1C8D746D
        D8B8CA3249EEF7E9E0118B46F43D879B6E661930FC12CE839DD633D59F3740FF
        9BE09048F2F152E5CC552A27FD09EC9E517C187C116DF0422627F6A903A51AD4
        79625C8823E1EA6951AAFA890C8F0B30F7578E5EC557F94F018E8FC937C59FFF
        80AF4EBA06ACDA6013CFDCE7A359A0EEBF099C6E835DF21A7F089B093136AF0D
        B95F5DC3D556C86527F4AF5589B1A9685B2B5A1F5416FAB2002E79D4613EF517
        6A2581875F00C9877609CB9E807A084C3D8AF894B87071708E391F728DFF443D
        82A1D35E7DAD73B29D5681DAEB9D21E4E50097EBE09F015ABF31671C26F9F06F
        B51B7118A8D85EB7CB21187D76F93AB81C788D8B4FEFF1FC82F8F059FEBC4098
        C0018BB5F8D330344D347CC696B1105FB5461DDC707ED403A09875723C2A7F79
        1668EE67CE0C59E35FA35F81C64D25BB0AF10DBE824F42B0B9D26F3BD8A6D0D7
        77759FD54AFCBEF1980FC6EF5383EAEDABEA869FC57C13A99BE35342119F1C36
        F06658A281D1F5BC27B806D8E02292ED6062B006D46C5B45DC60125AB8857C6F
        9D6C766BA4D9D780EA86295A3868F459CD5388FAD1E40790627DE36B82EFA79D
        343BBF43A2759023DE97A1AEBD75C17B753426DD1FA05EF6B443F838A1DD79FA
        EF884FAF12FCD754B12B057C432EC0888B00DE61C46578BAFEB2F017981942F0
        017BDE747DF8F6D8B073E07C171B2116A39E029CE85A8A0FEB0098AF5D864AE2
        D19205B6F8D8963D773A9BB0A9A1CA9F8425F8A23637BA86E42BD5C35F140104
        FC581BFCC06013E20386BBCF4066B6052FA9C7F56F847CAB57C2586C9AA8BCA2
        98D52E6B5FD17877317CA8FC453982F2119F6E159D0FF5B60927881B02F8BF35
        047C725E6738C42D08F7CB023E0056669B3DF3D0B7403D1AB53875ED7AC3527C
        2625E21B739C6F5A00112304C7D26D7234F7CEC542F76498B787F6E5A2DD4AF4
        41334F33DB929BD5F1C404E89184F9905BB1966B5C1C6F1BD757C8873A0B7921
        D43E16BF7CBB5F03BE9CF6E1E3AC5384E5D3F8D07847A51AE532426602E3C4E8
        2ABD6A8A4FAB342F3CDFFC3BA5FCAE3598CF6ACFCE87DD43159706D8C6C3DDC8
        8C888716AF5724AB3A388DAE6BC837301216868FDE229F6C67B52730CD224C7E
        3971FE26FFA06BF9926455FBBEDE7524DF2B36E04B19232EC6DA677A2BED7002
        AF887DA5E135EB3CDE1855478CE06C515FAC2BE0633D557FE2FF54DBC9E07B34
        CB056F710D5613C3279F62F1C63F41D5DE712C8FC6D7E56F480ECF0FBBD19FBB
        EDFE80398CDDBEC2F95331AD237E147BC611F3A7C5431C9CEEF8169503B063A1
        C305E2BE4F8921AF219F722CBE3899659E6CD7F51191A7AFE030BD67146165A3
        2E140AF8AC931997DDC7FCC10428051DAF08C23655F743301E2A884B59C007DE
        87957196BBCE706E187A667616C3073D23F5880A1B73697C4877C64792E6578C
        71DC758F2AD1FAA036BE2FEB4D7CE85B34741C52FF00574FA39AB8FD285EDFAF
        63E9AFE9C09AD643AD2CE34C16F4F62C430D34B45FD62180A95D62CF81E6FC9E
        95671367671F24F2C41EA4AC4CACA936284744A6C0E7D9270F7527864FFB6741
        E0F2AD4E66D0A04E0772DA4CEBA55E701CF7454F0FA5B840C5C52A61848A613A
        B9AB62C9A3F097A038D79177F5F4C2F200701A56B20DC0A3CF6334D37D677AF7
        02597EE6994C70F02CDBC603BB51E55B79C0F2EB5CB63B15D4A73BA8165D89E0
        D3F497FFACFBC2F779BB2F7C9FB7FB1F5AE88CA65B9104F80000000049454E44
        AE426082}
      Proportional = True
      Stretch = True
      Transparent = True
      ExplicitLeft = 391
    end
    object Image1: TImage
      Left = 0
      Top = 0
      Width = 100
      Height = 100
      Align = alLeft
      AutoSize = True
      Picture.Data = {
        0954506E67496D61676589504E470D0A1A0A0000000D49484452000000640000
        00640802000000FF800203000000017352474200AECE1CE90000000467414D41
        0000B18F0BFC6105000000097048597300000EC300000EC301C76FA864000000
        1874455874536F667477617265007061696E742E6E657420342E312E36FD4E09
        E800000AF14944415478DAED9D775C14D716C7CF2E4B6F8A82146982540169C2
        1A2509B627114B9E8AD8A20644AC1163211862D7883E8D05833E352ACAD3286A
        2C7CA2F8A2620175A9225D912E8822BD2D9B99A7017677F6EE0C10D97D3BBFBF
        76CE3DE7CCCCF7337BF796B97719779A78408B9C1802B0CA4AE0D17D686CE8ED
        EBEA212929437F1D301B0C5ADA202FDFDD6C7CB01E3F80EF5742437D6FDF624F
        8BC100350DB0B006B71130C2130C0CBB9AA71D168F07FE3E9093D1DB77F6374B
        4E0E5CD8E03B1F1C5C80C9A416DB01ABAE16BC4702B7B5B7EFE66369A82BAC0C
        0113330A211DB06ADEE1B078B254DD2B2882DF32983687EC2326D3B0DEEBD331
        10BC159495C57BD2B070D93BC1B6FDA0AE21C68D86F5410ECE1016018A8A281F
        1A5687467F0121DB50F5170D8B4F012B61E60291A5342C3EB158703012AC6C89
        4B695882B2B0814391C022EA1BD1B008B42A14264E23B0D3B00834400F22AFE0
        4D5601D1B088B56E0B8C9F2468A46111CBD21622A2F0E18ACEA261110BC3743C
        1A4CCDF98D342C519ABF18E605F25968582265EB00E1917C966EC11A6C0D5AFD
        7AFB9E90E272212713DEBDED4AACA2125CBDC7F79BD82D585B7E82919EBDCD43
        9C9A1A213A0A8E1E809666CAB147CF83B965C7E1FF3FACF78ABD0E5B83A1AD8D
        5AD40F61E0F98F8E435981855FED3AB8798D5A48E02A9831AFE3508660653E85
        005F6A2173FCC16F79C7A10CC16A6E06EF11D4A644BDA6C0DA4D1D8732040BBB
        B5A9A3E175398510D985555F071347424B0B8510D98595C281E5F3A885CCF607
        7FD9ACB37E5805B76F500B591484CF5DB74B5660619836AEA6DB59E284DD11D6
        BCDABD111A1B29C71E398B8F32B7AB5BB04678C240A3DE868114F62861555556
        7A5762B1BEE16F71A0A4D461A1471D44CAD2160EFF87CF42C312A9AF16C18225
        7C161A9648454481D5103E0B0D8B5846A670F2323D064F4E4BD7E0EF6D098886
        45200D4D888A013575413B0D8B400B57C02C3F023B0D4B507A03E1C445BC9125
        2C1A169F984CFC95361777E2521A169FFA6841D4755051252EA561096AD27408
        FA9EB888862528A61C849F026B3B82221A16815C87C3AE08023B0D8B4058C33D
        3C126CEC85EC342C428D9D0021DB058D342C62C92B40F42DD0E8C367A46189D4
        BACD307E329F858625521EA361F31E3E4B7761515DB2F7F1457592A25D5AFDE1
        422CDE926857B7605958C38E8382833E12258C547A0A44FE1BB29F518EC5EEEB
        D79BA03DA08760F9AF80D97E14FC7B4B4D4DB03D04FEF89D72E0CE43F84AE176
        750B16E1089964AAA91116CE80FC3C6A512BD7C3649F8E43598185E9BF31B071
        0DB590B901F0F5D28E431982555B03933CA095CA22F0C933F075D4EDFA18B014
        5FBE542C2D4138D4D9D8703534A9DEBC726EAEFCEB0A84035755B5CEAEA3CF82
        DDDA979EF0E6358553F4E45B34246159FB4ED38E3E8F7078356B6ED6B1135461
        0D1DC9D678148F70A898EA93719A6F9A74DA18282F9364583CDE300B53A58297
        281726332D26B6EAB3CFC99F9A595FCF36D091ABAF43F8E485ED295EFE8D34C1
        522C2CC06031C4350DEBAD6D12E3396D4A4A404EEA8F1F398E7043FB24DFBE57
        CDFE449A60F5BB72D976EA6432D9F2376C2E085E4FF2D406FBF698AD0E423870
        5554E30BCBB86A6AD204CBF4BBB586BB7792C9C65551497C9CDC603E988CB3D5
        DC593A67CF201C6A1C9D93E29F0818251D96C3280FCD7B712413BE1937FEE9A5
        ABE23B9C583D6865A694FF02E152B26849EE4F07A40916B3A9C9DD408755534D
        3623839171F24CC5F419682F85D25237334306978BF0C93C71BA7CC64C6982A5
        96C87162BB50C888F54BF40D384969AD7DFA227CB462AE0D993C019585C178FC
        344BF81B2DD1B0F40EFF3C785920D9747F89F01BD45926A121463F6E4338340F
        D04D7851C4939313B04B342C4BBFF9034EFD4215168FC54AB979BB7AF827A21C
        ECBCC6F6BD751391A1D26B42FAC52BC2760986C5E3B938D8A86465528585A9D6
        7E68D2FD049E82827011A3B595ADAFCD7A578508CFFF7E63C1FA506982C57AF3
        866DA8CB68A5B2A4A1939E6FDF5914B45AD8AE9A96EAECE2808E4D8DB959E539
        5A9A6069FD1E3364A257D74861E2AAAB3F494C6B323216B0EB1E3F6AB10835E4
        887D8B1F1696B512ADB1955C58C69B36186FDDD86558982A274C4C3F7F4960DC
        DA22C04FF797A388A83A1B5B4ED253C222C985853D56D8C3D51D5818A6F45F2F
        567AF3ED46E1EC64AF9A9E86082AFDDA3F27FCB034C162B4B4B89BE8CBBF468D
        1EF1984CB11DEC4623634E622AF7AF4DD3585555EC813A0CE4D2AE9C8311A57E
        0B85EDDC5698E8810F014A1C2CE59C6C573B2B74BAE225CB0D0EEE137B96C295
        DFBED811F6FE739F5BB1F65E63D0FE1C4E6ADD103BC222097DB2744E9FB25A30
        1711DBA6A494909DEFE4EEAC58528C3E4B9B8242725C7CED5047ECB361D80ED3
        F5C108E756CD3EF145656D0AC4DBD149282CF3A581FA477E46C4D65B593F4979
        A67BF488C5E285204ED5AE6E297FC4F1E4E56DA778F7BB7E15E15935F2D3D4D8
        DBA24A251496A3BBB37A522222B67CBA6FE6A933582BCC71B89B5A4A92D87365
        1E3B59E1E3EB6666A450568A702B581B92BF698B34C192ABA9661BE8309B9A10
        B1CFB78715057D8B7DD08CBB6B3FD693D1861A42C084F58A9F5EBAE66A6789BE
        C4F473D19593A648132CCDBB771CC67C868E4DBE7DBF9A3DFCFD67B14DA7F72A
        0958AC1F118E70C07E5E139E1735EBE94913AC817B760D5AB71A11D8A6ACFCB0
        B89CABFA61CC57BEFC95CBD021F2956266A9B0A6390339EDD76066FE383D1BF1
        F28524C2B2F1F967FF4BD188C0EA61EEC9710F3B5B48D6F468554C9D9E71FA2C
        C241F260F1786E834D140B0B1081C5CBBEC9DBC5F7EE1383CB75F0F4D0887FD0
        1D5879BBF6162F5B214DB0145FE60FB3324337CD334E4655F8088E1DAB25721C
        3DD80C4A1B2FF02B292EBE66186A7E4CE260F5BF70DE66E634541893F92823B7
        D1C454B864D0EAA081FBF6409784CF7D15BDE2AAAA227C240E9669F01AC37F85
        21A29AF5F413F20A84C77C31B1DEBE7576B213DBA62754B59B7BF2DD87681F89
        83E5F0F908CD07F71151AF277DF9ECDC0551A5DAE7CE5ACFF1C56A3EAAB08A97
        AEC8DBBD579A60311B1BD9FADA7275B588A8F6E628B1DADAECBCC7F78DA5B8B7
        075E0F9EC19AF8D2048BCCDC574AEC9D77233D100ECA5959CE6E8ECC062A9B37
        3118783D683A08EDE53B1E4A8A286415583AD0C3B0F4C30F98AF5C8608C19BA3
        58352CBCA4965FC61B438DB76D267F25A2E6BE046179414921851B1C3301D6FF
        7DB02CE7CD1910158908A975744A8CE788CDCCACAF77767150CECB257925AFBD
        273D3B7F49AC9B24C1E2F15CECAC5472B21121C5814BF3F6EE27931C9F769EE2
        4DF2825E6CDA5AB8F63B6982255F51E16EAC877E05814C35FC413C1EDE6DBA7C
        918C6F6A4C6C95E7286982257EEE0B7F0521BBC1DC5C5CE20F522C287076B667
        55BF43BBB52928E0DD72126FA54A102CE30DA1C6DB51B572B3AE6EC273F1D570
        6719EEFAD134641DDAA76E883D879342265BCFC1AAC6375BEC0E2CBB2FC6A1DB
        47F83CE085CB144E805D5F73B3E37057B5B454844FE902BF9C43473E2A2CACE7
        3B7534545650C8B5FB30FE27651F12B5B4B81BE9C9BFA944F8BFD8B4AD706D30
        99CC9DA579F78EFDB85188A1D4ACC3C75E7D359F4CAAE5F3F0EDB4C86BB61FBE
        E4860016A688BD7046FC80E507E919C0C9DFA0FDD50DD6DB37261B42D1212501
        81F536B662330BCB60FF5EE55C91CD88A215418D830691C973E134ECDB41F6A4
        4C261C3ACDB7D1111FAC9616381E0E776E00F2F9C0372BC3522C5E0D86C6205D
        6A6EC261DDB88A2FE5414B5D03DF0C7EEA6C3EA3E03F67C2FF5622A0FFB88FC1
        042A75B4C4A9A11EFF83508458F2F87F7E08BFEFF4277A2EE8030EDEE5110000
        000049454E44AE426082}
    end
    object LB_Versao: TLabel
      AlignWithMargins = True
      Left = 108
      Top = 63
      Width = 84
      Height = 18
      ParentCustomHint = False
      BiDiMode = bdLeftToRight
      Caption = 'Vers'#227'o 9.6.5'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBiDiMode = False
      ParentColor = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      StyleElements = []
    end
    object Bot_Configuracao: TBitBtn
      Left = 396
      Top = 86
      Width = 109
      Height = 24
      Caption = 'Configura'#231#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Visible = False
      OnClick = Bot_ConfiguracaoClick
    end
    object Bot_Cancelar2: TBitBtn
      Left = 528
      Top = 86
      Width = 86
      Height = 25
      Caption = 'Cancelar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
        3333333777333777FF3333993333339993333377FF3333377FF3399993333339
        993337777FF3333377F3393999333333993337F777FF333337FF993399933333
        399377F3777FF333377F993339993333399377F33777FF33377F993333999333
        399377F333777FF3377F993333399933399377F3333777FF377F993333339993
        399377FF3333777FF7733993333339993933373FF3333777F7F3399933333399
        99333773FF3333777733339993333339933333773FFFFFF77333333999999999
        3333333777333777333333333999993333333333377777333333}
      NumGlyphs = 2
      ParentFont = False
      TabOrder = 1
      Visible = False
      OnClick = Bot_Cancelar2Click
    end
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 379
    Width = 612
    Height = 19
    Panels = <>
    SimplePanel = True
    SizeGrip = False
    ExplicitTop = 389
    ExplicitWidth = 622
  end
  object Relogio_Carga: TTimer
    Enabled = False
    Interval = 950
    OnTimer = Relogio_CargaTimer
    Left = 32
    Top = 128
  end
end