unit Misc_Type_U;

interface

Uses Misc_Const_U ,
     Transparentes_U,
     Vcl.Buttons,
     Vcl.Graphics,
     Vcl.StdCtrls,
     Vcl.ComCtrls,
     Vcl.ExtCtrls,
     System.Types,
     //uShellWindowObserver,
     System.Threading,
     System.UITypes,
     System.Classes,
     RichEdit,
     Vcl.Forms ;

Type TSessao = Record
               ID_Session : String ;
               Cnt_Request : LongInt ;
               Cnt_Login : LongInt ;
               Cnt_Menu : LongInt ;
               Cnt_Usuarios : LongInt ;
               Cnt_Produtos : LongInt ;
               Cnt_Fornecedores : LongInt ;
               Cnt_Gastos : LongInt ;
               End ;

Type TSetup = Record
              Put_Log : Boolean ;
              Largura_Menu_Left : LongInt ;
              End ;

Type
    DWORDLONG = UInt64;

    TRGB = packed record B, G, R: byte end;
    TRGBA = packed record B, G, R, A: byte end;
    TRGBAArray = array[0..0] of TRGBA;

    T_PN_Escudo_Animado = Record
        PN_Base    : TPanel ;
        PN_Preview : TPanel ;
        IM         : TImage ;
        PN_Rodape  : TPanel ;
        End ;

    T_Reg_Fila_Conversao = Record
            FN_In : String ;
            FN_Out : String ;
            Frames_TT : LongInt ;
            Frames : LongInt ;
            Percentual : Single ;
            Size_In : Int64 ;
            Size_Out : Int64 ;
            Cmd : String ;
            End ;

    T_Limites_RGB = Record
            R_MIN : Byte ;
            R_MAX : Byte ;
            G_MIN : Byte ;
            G_MAX : Byte ;
            B_MIN : Byte ;
            B_MAX : Byte ;
            A_MIN : Byte ;
            A_MAX : Byte ;
            End ;

    T_Formato_Conversao_ffmpeg = Record
            Formato : String ;
            Parametros : String ;
            End ;

    PMemoryStatusEx = ^TMemoryStatusEx;
    TMemoryStatusEx = packed record
         dwLength: DWORD;
         dwMemoryLoad: DWORD;
         ullTotalPhys: DWORDLONG;
         ullAvailPhys: DWORDLONG;
         ullTotalPageFile: DWORDLONG;
         ullAvailPageFile: DWORDLONG;
         ullTotalVirtual: DWORDLONG;
         ullAvailVirtual: DWORDLONG;
         ullAvailExtendedVirtual: DWORDLONG;
         End;

Type   T_Pacote_FCFD = Record
                    Dados : String ;
                    CRC_Calculado : LongInt ;
                    RDID : LongInt ;
                    Flash_Pagina : LongInt ;
                    Flash_Posicao : LongInt ;
                    Evento : LongInt ;
                    Descricao_Evento : String ;
                    Descricao_Evento_Simples : String ;
                    Parametro : LongInt ;
                    Evento2 : String ;
                    Classe : LongInt ;
                    IButtom : String ;
                    Latitude : Single ;
                    Longitude : Single ;
                    Direcao : Longint ;
                    Flags :   LongInt ;
                    Bateria : Single ;
                    ADC : Single ;
                    P1 , P2 , P3 , P4 : Byte ;
                    Velocidade : LongInt ;
                    CRC : LongInt ;
                    Velocidade_Maxima : LongInt ;
                    Operadora_Celular : LongInt ;
                    DT_GPS : TDateTime ;
                    HDOP : Single ;
                    Satelites : LongInt ;
                    Sinal_Celular : LongInt ;
                    Tick : Cardinal ;
                    DT_Real : TDateTime ;
                    End ;
{:binary form of IPv6 adress (for string conversion routines)}
  TIp6Bytes = array [0..15] of Byte;
{:binary form of IPv6 adress (for string conversion routines)}
  TIp6Words = array [0..7] of Word;

       T_Supervisao_Interface_de_Rede = Record
                    Ativo : Boolean ;
                    Carregado : Boolean ;
                    IP : String ;
                    Alias : String ;
                    Acao : LongInt ;
                    Lista : TStringList ;
                    Lista_Old : TStringList ;
                    PN : TPanel ;
                    End ;

       T_Supervisao_Diretorio = Record
                    Ativo : Boolean ;
                    Carregado : Boolean ;
                    Dir : String ;
                    Alias : String ;
                    Subdir : Boolean ;
                    Acao : LongInt ;
                    PN : TPanel ;
                    End ;

       T_Supervisao_Ping = Record
                    Ativo : Boolean ;
                    Carregado : Boolean ;
                    IP : String ;
                    Alias : String ;
                    Acao : LongInt ;
                    PN : TPanel ;
                    Max_Falhas : LongInt ;
                    Cnt_Falhas : LongInt ;
                    End ;

       T_Supervisao_App = Record
                    Ativo : Boolean ;
                    Carregado : Boolean ;
                    ExeName : String ;
                    Dir : String ;
                    Acao : LongInt ;
                    Recarga : LongInt ;
                    PN : TPanel ;
                    End ;

       T_Supervisao_Geral = Record
                    Shutdown : Boolean ;
                    Boot : Boolean ;
                    Supervisao_Load : Boolean ;
                    Supervisao_Close : Boolean ;
                    Unidades_Logicas : Boolean ;
                    Login_Logout : Boolean ;
                    End ;

       T_Supervisao_Database = Record
                    Ativo : Boolean ;
                    Carregado : Boolean ;
                    Usuario : String ;
                    Senha : String ;
                    Host : String ;
                    Porta : LongInt ;
                    Database : String ;
                    Acao : LongInt ;
                    PN : TPanel ;
                    End ;

       T_Supervisao_Audio_In = Record
                    Ativo : Boolean ;
                    Carregado : Boolean ;
                    Device : String ;
                    Acao : LongInt ;
                    PN : TPanel ;
                    End ;

       T_Supervisao_Audio_Out = Record
                    Ativo : Boolean ;
                    Carregado : Boolean ;
                    Device : String ;
                    Acao : LongInt ;
                    PN : TPanel ;
                    End ;

       T_Supervisao_Drives = Record
                    Ativo : Boolean ;
                    Carregado : Boolean ;
                    Drive : String ;
                    Aviso : LongInt ;
                    Alarme : LongInt ;
                    Acao : LongInt ;
                    PN : TPanel ;
                    End ;

       T_Drive = Record
                 Ativo : Boolean ;
                 //Total : Int64 ;
                 //Livre : Int64 ;
                 //IsRede : Boolean ;
                 Erro   : Boolean ;
                 Resposta : Cardinal ;
                 //Perc_Livre : Single ;
                 End ;

       (*
       T_Registro_ShellWindow = Record
                _Handle : THandle ;
                _Url    : String ;
                _DT     : TDateTime ;
                _IP     : String ;
                _Preset : LongInt ;
                _Valido : Boolean ;
                _Shell  : TShellWindow ;
                End ;
       *)
       T_Cache_Gravacao = Record
                          Origem : String ;
                          Tick : Cardinal ;
                          FN : String ;
                          Conteudo : String ;
                          End ;
       T_Camera_Posicoes = Record
                           IP : String ;
                           Nome_Atalho : String ;
                           L1 : Array [ 0 .. MAX_CAMERAS_QTDE_POSICOES - 1 ] Of String ;
                           L2 : Array [ 0 .. MAX_CAMERAS_QTDE_POSICOES - 1 ] Of String ;
                           OLD : Array [ 0 .. MAX_CAMERAS_QTDE_POSICOES - 1 ] Of String ;
                           End ;

       T_Interface_de_Rede = Record
                             Ordem : LongInt ;
                             Caption : String ;
                             IPAddress : String ;
                             DHCPServer : String ;
                             DHCPEnabled : Boolean ;
                             DHCPLeaseObtained : TDateTime ;
                             DNSDomain : String ;
                             DNSHostName : String ;
                             MACAddress : String ;
                             Pacotes : Cardinal ;
                             ServiceName : String ;
                             Tipo : String ;
                             IGMP : String ;
                             End ;

       T_App_Em_Execucao = Record
                    Nome     : String ;
                    ID       : DWORD ;
                    CntUsage : DWORD ;
                    End ;

       T_BIOS = Record
                Vendor        : String ; // Dell Inc.
                Version       : String ; // 1.1.9
                Start_Segment : String ; // F000
                ReleaseDate   : String ; // 04/25/2016
                Bios_Rom_Size : String ; // 16384 k
                Major_Release : String ; // 1
                Minor_Release : String ; // 1
                EmbeddedControllerFirmwareMajorRelease : String ;
                EmbeddedControllerFirmwareMinorRelease : String ;
                SL_OEM_Strings :  TStringList ;
                End ;

       T_System_Info = Record
                ManufacturerStr : String ;
                ProductNameStr : String ;
                VersionStr : String ;
                SerialNumberStr : String ;
                UUID : Array [0 .. 31] of AnsiChar;
                SKUNumberStr : String ;
                FamilyStr : String ;
                End ;

       T_Board_Info = Record
                Fabricante          : String ; // Dell Inc.
                Product             : String ; // 0WT51R
                Version             : String ; // A00
                Serial_Number       : String ; // /7HKRVG2/BR108196AE0004/
                Asset_Tag           : String ; //
                Location_Chassis    : String ; //
                Feature_Flags       : String ; // 00001001
                Chassis_Handle      : String ; // 0003
                Board_Type          : String ; // 0A Motherboard (includes processor, memory, and I/O)
                Object_Handles      : String ; // 0
                End ;

       T_Involucro = Record
                Manufacter          : String ; // Dell Inc.
                Version             : String ; //
                Serial_Number       : String ; // 7HKRVG2
                Asset_Tag_Number    : String ; //
                _Type               : String ; // LapTop | Docking Station
                Power_Supply_State  : String ; //Safe
                BootUp_State        : String ; //Safe
                End ;

       T_CPU = Record
               Vendor_ID                 : String ;
               Stepping_ID               : String ;
               Model_Number              : String ;
               Family_Code               : String ;
               Processor_Type            : String ;
               Extended_Model            : String ;
               Extended_Family           : String ;
               Brand_ID                  : String ;
               Chunks                    : String ;
               _Count                    : String ;
               APIC_ID                   : String ;
               SN_Enabled                : Boolean ;
               SN_2                      : String ;
               MMX_Suportado             : Boolean ;
               FX_Instructions           : Boolean ;
               SSE                       : Boolean ;
               SSE2                      : Boolean ;
               Extended_CPUID            : Boolean ;
               Largest_Function          : String ;
               Brand_String              : String ;
               CPUType                   : String ;
               Manufacturer              : String ; // Intel(R) Corporation
               Socket_Designation        : String ; // U3E1
               _Type                     : String ; // Central Processor
               Family                    : String ; // Intel® Core i7 processor
               Version                   : String ; // Intel(R) Core(TM) i7-6500U CPU @ 2.50GHz
               Processor_ID              : String ; // BFEBFBFF000406E3
               Voltage                   : String ; // 1,10
               External_Clock            : String ; // 100  Mhz
               Maximum_processor_speed   : String ; // 2500  Mhz
               Current_processor_speed   : String ; // 2500  Mhz
               Processor_Upgrade         : String ; // Other
               //External_Clock            : String ; // 100  Mhz
               Serial_Number             : String ; // To Be Filled By O.E.M.
               Asset_Tag                 : String ; // To Be Filled By O.E.M.
               Part_Number               : String ; // To Be Filled By O.E.M.
               Core_Count                : String ; // 2
               Cores_Enabled             : String ; // 0
               Threads_Count             : String ; // 4
               Processor_Characteristics : String ; // 0000
               End ;

       T_Onboard = Record
               Device_Type               : String ; // 131
               Description               : String ; // "Intel HD Graphics"
               Enabled                   : String ; // True
               Device_Type_Descr         : String ; // Video
               End ;

       T_Memoria = Record
               Location                  : String ; // System board or motherboard
               Use                       : String ; // System memory
               Error_Correction          : String ; // None
               Maximum_Capacity          : String ; // 16777216 Kb
               Memory_devices            : String ; // 2
               End ;

       T_DIMM = Record
                Total_Width              : String ; // 64 bits
                Data_Width               : String ; // 64 bits
                Size                     : String ; // 8192 Mbytes
                Form_Factor              : String ; // SODIMM
                Device_Locator           : String ; // DIMM A
                Bank_Locator             : String ; // BANK 0
                Memory_Type              : String ; // DDR3
                Speed                    : String ; // 1600 MHz
                Manufacturer             : String ; // 0114
                Serial_Number            : String ; // 12151215
                Asset_Tag                : String ; // 9876543210
                Part_Number              : String ; // SF5641G8CJ8NWMNSEG
                End ;

       T_PointDevice = Record
                _Type                    : String ; // Touch Pad
                _Interface               : String ; // Bus mouse
                _Buttons                 : String ; // 2
                End ;

       T_Bateria = Record
                Location                 : String ; // Sys. Battery Bay
                Manufacturer             : String ; // LG
                Manufacturer_Date        : String ; // 09/26/2016
                Serial_Number            : String ; // D52C
                Device_Name              : String ; // DELL 9JF9369
                Device_Chemistry         : String ; // Unknown
                Design_Capacity          : String ; // 43840 mWatt/hours
                Design_Voltage           : String ; // 11100 mVolts
                SBDS_Version_Number      : String ; // 1.0
                Maximum_Error            : String ; // 2%
                SBDS_Serial_Number       : String ; // D52C
                SBDS_Manufacture_Date    : String ; // 26-09-2016
                SBDS_Device_Chemistry    : String ; // LION
                OEM_Specific             : String ; // 00000801
                End ;

       T_FAN = Record
                Temperature_Probe_Handle : String ; // 1C00
                Device_Type_And_Status   : String ; // 01100101
                _Type                    : String ; // Chip Fan
                Status                   : String ; // OK
                Cooling_Unit_Group       : String ; // 0
                OEM_Specific             : String ; // 0000DD00
                Nominal_Speed            : String ; // 6000 rpm
                Description              : String ; // CPU Fan
                End ;

       T_Temp_Probe = Record
                Description              : String ; //
                GetLocation              : String ; //
                GetStatus                : String ; //
                Maximum_Value            : String ; // 127 C°
                Minimum_Value            : String ; // 6426 C°
                Resolution               : String ; // 1 C°
                Tolerance                : String ; // Unknown
                OEM_Specific             : String ; // 0000DC00
                Nominal_Value            : String ; // 10 C°
                End ;

       T_Electric = Record
                Description              : String ;
                LocationandStatus        : String ;
                GetLocation              : String ;
                GetStatus                : String ;
                Maximum_Value            : String ;
                Minimum_Value            : String ;
                Resolution               : String ;
                Tolerance                : String ;
                OEM_Specific             : String ;
                Nominal_Value            : String ;
                End ;

       T_Hotfix = Record
                ID : String ;
                Description : String ;
                End ;

       T_Autoexec = Record
                Command                  : String ;
                Description              : String ;
                Location                 : String ;
                Name                     : String ;
                User                     : String ;
                SettingID                : String ;
                End ;

       T_Services = Record
                Name                     : String ;
                State                    : String ;
                End ;

       T_Pointing = Record
                Description              : String ;
                DeviceID                 : String ;
                DeviceInterface          : String ;
                DoubleSpeedThreshold     : String ;
                Handedness               : String ;
                HardwareType             : String ;
                InfFileName              : String ;
                InfSection               : String ;
                Manufacturer             : String ;
                Name                     : String ;
                NumberOfButtons          : String ;
                PNPDeviceID              : String ;
                PointingType             : String ;
                QuadSpeedThreshold       : String ;
                Resolution               : String ;
                SampleRate               : String ;
                Synch                    : String ;
                End ;

       T_Devices_NOK = Record
                ClassGUID                : String ;
                Description              : String ;
                DeviceID                 : String ;
                Manufacturer             : String ;
                Name                     : String ;
                PNPDeviceID              : String ;
                End ;

       T_Win32_USB_Device_Type = Record
                Availability                  : String ;
                Caption                       : String ;
                ClassCode                     : String ;
                ConfigManagerErrorCode        : String ;
                ConfigManagerUserConfig       : String ;
                CreationClassName             : String ;
                CurrentAlternateSettingsMT    : String ;
                CurrentConfigValue            : String ;
                Description                   : String ;
                DeviceID                      : String ;
                ErrorCleared                  : String ;
                ErrorDescription              : String ;
                GangSwitched                  : String ;
                InstallDate                   : String ;
                LastErrorCode                 : String ;
                Name                          : String ;
                NumberOfConfigs               : String ;
                NumberOfPorts                 : String ;
                PNPDeviceID                   : String ;
                PowerManagementCapabilitiesMT : String ;
                PowerManagementSupported      : String ;
                ProtocolCode                  : String ;
                Status                        : String ;
                StatusInfo                    : String ;
                SubclassCode                  : String ;
                SystemCreationClassName       : String ;
                SystemName                    : String ;
                USBVersion                    : String ;
                End ;

       T_Win32_VideoController = Record
                AcceleratorCapabilities        : String ;
                AdapterCompatibility           : String ;
                AdapterDACType                 : String ;
                AdapterRAM                     : String ;
                Availability                   : String ;
                CapabilityDescriptions         : String ;
                Caption                        : String ;
                ColorTableEntries              : String ;
                ConfigManagerErrorCode         : String ;
                ConfigManagerUserConfig        : String ;
                CreationClassName              : String ;
                CurrentBitsPerPixel            : String ;
                CurrentHorizontalResolution    : String ;
                CurrentNumberOfColors          : String ;
                CurrentNumberOfColumns         : String ;
                CurrentNumberOfRows            : String ;
                CurrentRefreshRate             : String ;
                CurrentScanMode                : String ;
                CurrentVerticalResolution      : String ;
                Description                    : String ;
                DeviceID                       : String ;
                DeviceSpecificPens             : String ;
                DitherType                     : String ;
                DriverDate                     : String ;
                DriverVersion                  : String ;
                ErrorCleared                   : String ;
                ErrorDescription               : String ;
                ICMIntent                      : String ;
                ICMMethod                      : String ;
                InfFilename                    : String ;
                InfSection                     : String ;
                InstallDate                    : String ;
                InstalledDisplayDrivers        : String ;
                LastErrorCode                  : String ;
                MaxMemorySupported             : String ;
                MaxNumberControlled            : String ;
                MaxRefreshRate                 : String ;
                MinRefreshRate                 : String ;
                Monochrome                     : String ;
                Name                           : String ;
                NumberOfColorPlanes            : String ;
                NumberOfVideoPages             : String ;
                PNPDeviceID                    : String ;
                PowerManagementCapabilities    : String ;
                PowerManagementSupported       : String ;
                ProtocolSupported              : String ;
                ReservedSystemPaletteEntries   : String ;
                SpecificationVersion           : String ;
                Status                         : String ;
                StatusInfo                     : String ;
                SystemCreationClassName        : String ;
                SystemName                     : String ;
                SystemPaletteEntries           : String ;
                TimeOfLastReset                : String ;
                VideoArchitecture              : String ;
                VideoMemoryType                : String ;
                VideoMode                      : String ;
                VideoModeDescription           : String ;
                VideoProcessor                 : String ;
                End ;

       T_Win32_Net_Configuration = Record
                ArpAlwaysSourceRoute           : String ;
                ArpUseEtherSNAP                : String ;
                Caption                        : String ;
                DatabasePath                   : String ;
                DeadGWDetectEnabled            : String ;
                DefaultIPGateway               : String ;
                DefaultTOS                     : String ;
                DefaultTTL                     : String ;
                Description                    : String ;
                HCPEnabled                     : String ;
                DHCPLeaseExpires               : String ;
                DHCPLeaseObtained              : String ;
                DHCPServer                     : String ;
                DNSDomain                      : String ;
                DNSDomainSuffixSearchOrder     : String ;
                DNSEnabledForWINSResolution    : String ;
                DNSHostName                    : String ;
                DNSServerSearchOrder           : String ;
                DomainDNSRegistrationEnabled   : String ;
                ForwardBufferMemory            : String ;
                FullDNSRegistrationEnabled     : String ;
                GatewayCostMetric              : String ;
                IGMPLevel                      : String ;
                Index                          : String ;
                InterfaceIndex                 : String ;
                IPAddress                      : String ;
                IPConnectionMetric             : String ;
                IPEnabled                      : String ;
                IPFilterSecurityEnabled        : String ;
                IPPortSecurityEnabled          : String ;
                IPSecPermitIPProtocols         : String ;
                IPSecPermitTCPPorts            : String ;
                IPSecPermitUDPPorts            : String ;
                IPSubnet                       : String ;
                IPUseZeroBroadcast             : String ;
                IPXAddress                     : String ;
                IPXEnabled                     : String ;
                IPXFrameType                   : String ;
                IPXMediaType                   : String ;
                IPXNetworkNumber               : String ;
                IPXVirtualNetNumber            : String ;
                KeepAliveInterval              : String ;
                KeepAliveTime                  : String ;
                MACAddress                     : String ;
                MTU                            : String ;
                NumForwardPackets              : String ;
                PMTUBHDetectEnabled            : String ;
                PMTUDiscoveryEnabled           : String ;
                ServiceName                    : String ;
                SettingID                      : String ;
                TcpipNetbiosOptions            : String ;
                TcpMaxConnectRetransmissions   : String ;
                TcpMaxDataRetransmissions      : String ;
                TcpNumConnections              : String ;
                TcpUseRFC1122UrgentPointer     : String ;
                TcpWindowSize                  : String ;
                WINSEnableLMHostsLookup        : String ;
                WINSHostLookupFile             : String ;
                WINSPrimaryServer              : String ;
                WINSScopeID                    : String ;
                WINSSecondaryServer            : String ;
                End ;

       T_Win32_SerialPort = Record
                Availability                   : String ;
                Binary                         : String ;
                CapabilitiesMT                 : String ;
                CapabilityDescriptionsMT       : String ;
                Caption                        : String ;
                ConfigManagerErrorCode         : String ;
                ConfigManagerUserConfig        : String ;
                CreationClassName              : String ;
                Description                    : String ;
                DeviceID                       : String ;
                ErrorCleared                   : String ;
                ErrorDescription               : String ;
                InstallDate                    : String ;
                LastErrorCode                  : String ;
                MaxBaudRate                    : String ;
                MaximumInputBufferSize         : String ;
                MaximumOutputBufferSize        : String ;
                MaxNumberControlled            : String ;
                Name                           : String ;
                OSAutoDiscovered               : String ;
                PNPDeviceID                    : String ;
                PowerManagementCapabilitiesMT  : String ;
                PowerManagementSupported       : String ;
                ProtocolSupported              : String ;
                ProviderType                   : String ;
                SettableBaudRate               : String ;
                SettableDataBits               : String ;
                SettableFlowControl            : String ;
                SettableParity                 : String ;
                SettableParityCheck            : String ;
                SettableRLSD                   : String ;
                SettableStopBits               : String ;
                Status                         : String ;
                StatusInfo                     : String ;
                Supports16BitMode              : String ;
                SupportsDTRDSR                 : String ;
                SupportsElapsedTimeouts        : String ;
                SupportsIntTimeouts            : String ;
                SupportsParityCheck            : String ;
                SupportsRLSD                   : String ;
                SupportsRTSCTS                 : String ;
                SupportsSpecialCharacters      : String ;
                SupportsXOnXOff                : String ;
                SupportsXOnXOffSet             : String ;
                SystemCreationClassName        : String ;
                SystemName                     : String ;
                TimeOfLastReset                : String ;
                End ;

       T_Win32_Net_Adapter = Record
                AdapterType                    : String ;
                AdapterTypeId                  : String ;
                AutoSense                      : String ;
                Availability                   : String ;
                Caption                        : String ;
                ConfigManagerErrorCode         : String ;
                ConfigManagerUserConfig        : String ;
                CreationClassName              : String ;
                Description                    : String ;
                DeviceID                       : String ;
                ErrorCleared                   : String ;
                ErrorDescription               : String ;
                GUID                           : String ;
                Index                          : String ;
                InstallDate                    : String ;
                Installed                      : String ;
                InterfaceIndex                 : String ;
                LastErrorCode                  : String ;
                MACAddress                     : String ;
                Manufacturer                   : String ;
                MaxNumberControlled            : String ;
                MaxSpeed                       : String ;
                Name                           : String ;
                NetConnectionID                : String ;
                NetConnectionStatus            : String ;
                NetEnabled                     : String ;
                NetworkAddresses               : String ;
                PermanentAddress               : String ;
                PhysicalAdapter                : String ;
                PNPDeviceID                    : String ;
                PowerManagementCapabilities    : String ;
                PowerManagementSupported       : String ;
                ProductName                    : String ;
                ServiceName                    : String ;
                Speed                          : String ;
                Status                         : String ;
                StatusInfo                     : String ;
                SystemCreationClassName        : String ;
                SystemName                     : String ;
                TimeOfLastReset                : String ;
                End ;

       T_Win32_OperatingSystem = Record
                BootDevice                 : String ;
                BuildNumber                : String ;
                BuildType                  : String ;
                Caption                    : String ;
                CodeSet                    : String ;
                CountryCode                : String ;
                CreationClassName          : String ;
                CSCreationClassName        : String ;
                CSDVersion                 : String ;
                CSName                     : String ;
                CurrentTimeZone            : String ;
                DataExecutionPrevention_32BitApplications : String ;
                DataExecutionPrevention_Available         : String ;
                DataExecutionPrevention_Drivers           : String ;
                DataExecutionPrevention_SupportPolicy     : String ;
                Debug                      : String ;
                Description                : String ;
                Distributed                : String ;
                EncryptionLevel            : String ;
                ForegroundApplicationBoost : String ;
                FreePhysicalMemory         : String ;
                FreeSpaceInPagingFiles     : String ;
                FreeVirtualMemory          : String ;
                InstallDate                : String ;
                LargeSystemCache           : String ;
                LastBootUpTime             : String ;
                LocalDateTime              : String ;
                Locale                     : String ;
                Manufacturer               : String ;
                MaxNumberOfProcesses       : String ;
                MaxProcessMemorySize       : String ;
                MUILanguages               : String ;
                Name                       : String ;
                NumberOfLicensedUsers      : String ;
                NumberOfProcesses          : String ;
                NumberOfUsers              : String ;
                OperatingSystemSKU         : String ;
                Organization               : String ;
                OSArchitecture             : String ;
                OSLanguage                 : String ;
                OSProductSuite             : String ;
                OSType                     : String ;
                OtherTypeDescription       : String ;
                PAEEnabled                 : String ;
                PlusProductID              : String ;
                PlusVersionNumber          : String ;
                PortableOperatingSystem    : String ;
                Primary                    : String ;
                ProductType                : String ;
                RegisteredUser             : String ;
                SerialNumber               : String ;
                ServicePackMajorVersion    : String ;
                ServicePackMinorVersion    : String ;
                SizeStoredInPagingFiles    : String ;
                Status                     : String ;
                SuiteMask                  : String ;
                SystemDevice               : String ;
                SystemDirectory            : String ;
                SystemDrive                : String ;
                TotalSwapSpaceSize         : String ;
                TotalVirtualMemorySize     : String ;
                TotalVisibleMemorySize     : String ;
                Version                    : String ;
                WindowsDirectory           : String ;
                End ;

       T_Win32_SoundDevice = Record
                Availability                  : String ;
                Caption                       : String ;
                ConfigManagerErrorCode        : String ;
                ConfigManagerUserConfig       : String ;
                CreationClassName             : String ;
                Description                   : String ;
                DeviceID                      : String ;
                DMABufferSize                 : String ;
                ErrorCleared                  : String ;
                ErrorDescription              : String ;
                InstallDate                   : String ;
                LastErrorCode                 : String ;
                Manufacturer                  : String ;
                MPU401Address                 : String ;
                Name                          : String ;
                PNPDeviceID                   : String ;
                PowerManagementCapabilitiesMT : String ;
                PowerManagementSupported      : String ;
                ProductName                   : String ;
                Status                        : String ;
                StatusInfo                    : String ;
                SystemCreationClassName       : String ;
                SystemName                    : String ;
                End ;
           {
  uint16   Access;
  uint16   Availability;
  uint64   BlockSize;
  string   Caption;
  boolean  Compressed;
  uint32   ConfigManagerErrorCode;
  boolean  ConfigManagerUserConfig;
  string   CreationClassName;
  string   Description;
  string   DeviceID;
  uint32   DriveType;
  boolean  ErrorCleared;
  string   ErrorDescription;
  string   ErrorMethodology;
  string   FileSystem;
  uint64   FreeSpace;
  datetime InstallDate;
  uint32   LastErrorCode;
  uint32   MaximumComponentLength;
  uint32   MediaType;
  string   Name;
  uint64   NumberOfBlocks;
  string   PNPDeviceID;
  uint16   PowerManagementCapabilities[];
  boolean  PowerManagementSupported;
  string   ProviderName;
  string   Purpose;
  boolean  QuotasDisabled;
  boolean  QuotasIncomplete;
  boolean  QuotasRebuilding;
  uint64   Size;
  string   Status;
  uint16   StatusInfo;
  boolean  SupportsDiskQuotas;
  boolean  SupportsFileBasedCompression;
  string   SystemCreationClassName;
  string   SystemName;
  boolean  VolumeDirty;
  string   VolumeName;
  string   VolumeSerialNumber;
}

       T_Win32_logicaldisk = Record
                Indice                       : LongInt ;
                PN_Visivel                   : Boolean ;
                Last_OK                      : TDateTime ;
                Last_NOK                     : TDateTime ;
                Nova_Midia                   : Boolean ;
                Ativo_Atual                  : Boolean ;
                Ativo_Old                    : Boolean ;
                Access                       : String ;
                Availability                 : String ;
                BlockSize                    : String ;
                Caption                      : String ;
                Compressed                   : String ;
                ConfigManagerErrorCode       : String ;
                ConfigManagerUserConfig      : String ;
                CreationClassName            : String ;
                Description                  : String ;
                Resposta                     : Cardinal ;
                Erro                         : Boolean ;
                DeviceID                     : String ;
                DriveType                    : LongInt ;
                IsRede                       : Boolean ;
                ErrorCleared                 : String ;
                ErrorDescription             : String ;
                ErrorMethodology             : String ;
                FileSystem                   : String ;
                FreeSpace                    : Int64 ;
                InstallDate                  : String ;
                LastErrorCode                : String ;
                MaximumComponentLength       : String ;
                MediaType                    : String ;
                Name                         : String ;
                NumberOfBlocks               : String ;
                PNPDeviceID                  : String ;
                PowerManagementCapabilities  : String ; // Array
                PowerManagementSupported     : String ;
                ProviderName                 : String ;
                Purpose                      : String ;
                QuotasDisabled               : String ;
                QuotasIncomplete             : String ;
                QuotasRebuilding             : String ;
                Size                         : Int64 ;
                Perc_Livre                   : Real ;
                Status                       : String ;
                StatusInfo                   : String ;
                SupportsDiskQuotas           : String ;
                SupportsFileBasedCompression : String ;
                SystemCreationClassName      : String ;
                SystemName                   : String ;
                VolumeDirty                  : String ;
                VolumeName                   : String ;
                VolumeSerialNumber           : String ;
                End ;

       T_Win32_DiskDrive = Record
                Ativo_Old : Boolean ;
                Ativo_Atual : Boolean ;
                Availability : String ;
                BytesPerSector : String ;
                Capabilities_AR : String ;
                CapabilityDescriptions_AR : String ;
                Caption : String ;
                CompressionMethod : String ;
                ConfigManagerErrorCode : String ;
                ConfigManagerUserConfig : String ;
                CreationClassName : String ;
                DefaultBlockSize : String ;
                Description : String ;
                DeviceID : String ;
                ErrorCleared : String ;
                ErrorDescription : String ;
                ErrorMethodology : String ;
                FirmwareRevision : String ;
                Index : String ;
                InstallDate : TDateTime ;
                InterfaceType : String ;
                LastErrorCode : String ;
                Manufacturer : String ;
                MaxBlockSize : String ;
                MaxMediaSize : Int64 ;
                MediaLoaded : Boolean ;
                MediaType : String ;
                MinBlockSize : Int64 ;
                Model : String ;
                Name : String ;
                NeedsCleaning : String ;
                NumberOfMediaSupported : String ;
                Partitions : String ;
                PNPDeviceID : String ;
                PowerManagementCapabilities_AR : String ;
                PowerManagementSupported : String ;
                SCSIBus : String ;
                SCSILogicalUnit : String ;
                SCSIPort : String ;
                SCSITargetId : String ;
                SectorsPerTrack : String ;
                SerialNumber : String ;
                Signature  : String ;
                Size : Int64 ;
                Status : String ;
                StatusInfo : String ;
                SystemCreationClassName : String ;
                SystemName : String ;
                TotalCylinders : String ;
                TotalHeads : String ;
                TotalSectors : String ;
                TotalTracks : String ;
                TracksPerCylinder : String ;
                End ;

       T_GetDosOutput = Record
                        Idx : LongInt ;
                        Tipo : LongInt ; // 1-ffmpeg 2-ffprobe
                        Cmd : String ;
                        Dir : String ;
                        LB_Progresso_Parcial : TLabel ;
                        LB_Progresso_Fila : TLabel ;
                        LB_Total_Frames : TLabel ;
                        LB_Progresso_Frames : TLabel ;
                        LB_Time : TLabel ;
                        ME : TMemo ;
                        LB : TListBox ;
                        LB_Status : TListBox ;
                        SB : TStatusBar ;
                        Sel_TT_Frames : LongInt ;
                        IN_DAR : String ;
                        IN_SAR : String ;
                        IN_FN : String ;
                        IN_FPS2 : Single ;
                        IN_Resolucao : TPoint ;
                        IN_Segundos : Single ;
                        IN_Seg_Str : String ;
                        IN_Frames : LongInt ;
                        IN_Bitrate_kbps : LongInt ;
                        OUT_FN : String ;
                        OUT_FPS : Single ;
                        OUT_Resolucao : TPoint ;
                        Frame : LongInt ;
                        Speed : Single ;
                        _Speed : String ;
                        _Time : String ;
                        _Size_kb : LongInt ;
                        Parse_Input : Boolean ;
                        Parse_Output : Boolean ;
                        End ;

       R_Contagem_Caracteres = Record
                               _Total : LongInt ;
                               Digitos : LongInt ;
                               Letras : LongInt ;
                               X : LongInt ;
                               Espacos : LongInt ;
                               Especiais : LongInt  ;
                               Virgulas : LongInt ;
                               Pontos : LongInt ;
                               _CR : LongInt ;
                               _LF : LongInt ;
                               _Tab : LongInt ;
                               Nulos : LongInt ;
                               Backspace : LongInt ;
                               _Delete : LongInt ;
                               Superiores : LongInt ;
                               Outros : LongInt ;
                               End ;

       T_Reg_Task_Cmd = Record
                //Cmd :  String ;
                FN : String ;
                Timeout : Cardinal ;
                Executando : Boolean ;
                Tick_Start : Cardinal ;
                Tick_End : Cardinal ;
                Retorno : String ;
                Sucesso : Boolean ;
                Concluido : Boolean ;
                Flag_Tratar : Boolean ;
                End ;

       T_CallBack_Task_Cmd = procedure ( Reg : T_Reg_Task_Cmd ) ;

       T_Win32_Process = Record
                Caption     : String ;
                CommandLine : String ;
                End ;

       T_Win32_Volume = Record
                Ativo_Atual : Boolean ;
                Ativo_Old : Boolean ;
                Indice                       : LongInt ;
                PN_Visivel                   : Boolean ;
                Last_OK                      : TDateTime ;
                Last_NOK                     : TDateTime ;
                Nova_Midia                   : Boolean ;
                Flag_Midia_Removida          : Boolean ;
                Flag_Midia_Inserida          : String ;
                Resposta                     : Cardinal ;
                Erro                         : Boolean ;
                Perc_Livre                   : Single ;
                Cnt_WMI                      : LongInt ;
                Tipo_Drive                   : String ;
                Tipo_Drive_Old               : String ;
                Access : String ;
                Automount : String  ;
                Availability : String  ;
                BlockSize : String  ;
                Capacity : Int64 ;
                Capacity_Old : Int64 ;
                Caption : String  ;
                Compressed : Boolean ;
                ConfigManagerErrorCode : String  ;
                ConfigManagerUserConfig : String  ;
                CreationClassName : String  ;
                Description : String  ;
                DeviceID : String ;
                DirtyBitSet : Boolean ;
                DriveLetter : String  ;
                DriveType : LongInt ;
                ErrorCleared : String  ;
                ErrorDescription : String  ;
                ErrorMethodology : String  ;
                FileSystem : String  ;
                FreeSpace : Int64 ;
                IndexingEnabled : Boolean ;
                InstallDate : TDateTime ;
                _Label : String  ;
                LastErrorCode : String  ;
                MaximumFileNameLength : String  ;
                Name : String  ;
                NumberOfBlocks : String ;
                PNPDeviceID : String  ;
                PowerManagementCapabilities_AR : String  ;
                PowerManagementSupported : String  ;
                Purpose : String  ;
                QuotasEnabled : String  ;
                QuotasIncomplete : String  ;
                QuotasRebuilding : String  ;
                Status : String  ;
                StatusInfo : String  ;
                SystemCreationClassName : String  ;
                SystemName : String  ;
                SerialNumberDisk : Cardinal ;
                SupportsDiskQuotas : String  ;
                SupportsFileBasedCompression : String  ;
                End ;

       T_Info_Windows = Record
                DT_Boot                  : TDateTime ;
                Caption                  : String ;
                Version                  : String ;
                BuildNumber              : String ;
                BuildType                : String ;
                CodeSet                  : String ;
                CountryCode              : String ;
                BootDevice               : String ;
                Is_32_bits               : Boolean ;
                Is_64_bits               : Boolean ;
                Is_Server                : Boolean ;
                Versao_Registry          : String ;
                DT_Install               : String ;
                Service_Pack             : String ;
                Folder                   : String ;
                PassScreenSaverEnabled   : String ;
                HotFix                   : Array Of T_HotFix ;
                AutoExec                 : Array Of T_Autoexec ;
                Pointing                 : Array Of T_Pointing ;
                Services                 : Array Of T_Services ;
                Devices_NOK              : Array Of T_Devices_Nok ;
                Win32_OS                 : Array Of T_Win32_OperatingSystem ;
                Win32_Video              : Array Of T_Win32_VideoController ;
                Win32_Net_Adapter        : Array Of T_Win32_Net_Adapter ;
                Win32_Net_Config         : Array Of T_Win32_Net_Configuration ;
                Win32_SerialPort         : Array Of T_Win32_SerialPort ;
                Win32_SoundDevice        : Array Of T_Win32_SoundDevice ;
                Win32_USB_Device_Type    : Array Of T_Win32_USB_Device_Type ;
                //Win32_Process            : Array Of T_Win32_Process ;
                End ;

       T_Anti_Virus = Record
                displayName              : String ;
                instanceGuid             : String ;
                pathToSignedProductExe   : String ;
                pathToSignedReportingExe : String ;
                productState             : String ;
                companyName              : String ;
                enableOnAccessUIMd5Hash  : String ;
                enableOnAccessUIParameters : String ;
                onAccessScanningEnabled  : String ;
                pathToEnableOnAccessUI   : String ;
                pathToUpdateUI           : String ;
                productUptoDate          : String ;
                updateUIMd5Hash          : String ;
                updateUIParameters       : String ;
                versionNumber            : String ;
                End ;

       T_Spyware = Record
                displayName              : String ;
                instanceGuid             : String ;
                pathToSignedProductExe   : String ;
                pathToSignedReportingExe : String ;
                productState             : String ;
                companyName              : String ;
                enableOnAccessUIMd5Hash  : String ;
                enableOnAccessUIParameters : String ;
                onAccessScanningEnabled  : String ;
                pathToEnableOnAccessUI   : String ;
                pathToUpdateUI           : String ;
                productUptoDate          : String ;
                updateUIMd5Hash          : String ;
                updateUIParameters       : String ;
                versionNumber            : String ;
                End ;

       T_Firewall = Record
                displayName              : String ;
                instanceGuid             : String ;
                pathToSignedProductExe   : String ;
                pathToSignedReportingExe : String ;
                productState             : String ;
                companyName              : String ;
                enableOnAccessUIMd5Hash  : String ;
                enableOnAccessUIParameters : String ;
                onAccessScanningEnabled  : String ;
                pathToEnableOnAccessUI   : String ;
                pathToUpdateUI           : String ;
                productUptoDate          : String ;
                updateUIMd5Hash          : String ;
                updateUIParameters       : String ;
                versionNumber            : String ;
                End ;

       T_PN_Drives = Record
                     //Ok : Boolean ;
                     PN : TPanel ;
                     LB_Type : TLabel ;
                     LB_Drive : TLabel ;
                     LB_Size : TLabel ;
                     LB_Ocupado : TLabel ;
                     Texto : String ;
                     BackColor : TColor ;
                     FontColor : TColor ;
                     //Disponivel : Boolean ;
                     //Size : Int64 ;
                     //FreeSpace : Int64 ;
                     //Last_OK : TDateTime ;
                     //Last_NOK : TDateTime ;
                     //Nova_Midia : Boolean ;
                     End ;

       T_RD_GC_OK  = Record
                     Indice          : LongInt ;
                     Descricao       : String ;
                     Form            : TForm ;
                     PN_Base         : TPanel ;
                     PN_Tarja        : TPanel ;
                     PN_Relogio      : TPanel ;
                     PN_Logo         : TPanel ;
                     PN_Selo         : TPanel ;
                     Divisor         : LongInt ;
                     Exibe_Selo      : Boolean ;
                     ED_GC           : Array [ 0 .. RD_MAX_EDITS - 1 ] Of TTransEdit ;
                     ED_Cor_Excesso  : Array [ 0 .. RD_MAX_EDITS - 1 ] Of TColor ;
                     IM_SELO         : TImage ;
                     IM_GC           : TImage ;
                     IM_RELOGIO      : TImage ;
                     IM_LOGO         : TImage ;
                     IM_GC_Loaded    : Boolean ;
                     GC_CLOCK        : TTransEdit ; // TRxClock ;
//                     COD_GC          : LongInt ;
                     End ;

       T_Supervisao = Record
                    Geral : T_Supervisao_Geral ;
                    //Win32_LogicalDisk : Array [1..26] Of T_Win32_LogicalDisk ;
                    //Win32_DiskDrive : Array [1..26] Of T_Win32_DiskDrive ;
                    Win32_Volume : Array [1..26] Of T_Win32_Volume ;
                    Mon : Array Of T_Supervisao_Diretorio ;
                    Registro_Ping : Array Of T_Supervisao_Ping ;
                    Rede : Array Of T_Supervisao_Interface_de_Rede ;
                    Database : Array Of T_Supervisao_Database ;
                    Audio_In : Array Of T_Supervisao_Audio_In ;
                    Audio_Out : Array Of T_Supervisao_Audio_Out ;
                    Drives : Array Of T_Supervisao_Drives ;
                    PN_Drives : Array [ 1 .. 26 ] Of T_PN_Drives ;
                    App : Array Of T_Supervisao_App ;
                    FLAG_CHECAR_NOVA_MIDIA         : Boolean ;
                    Sup_Form                       : TForm ;
                    RAM_Percentual_Uso             : LongInt ;
                    RAM_Total_MB                   : LongInt ;
                    Lista_Interfaces_Old           : TStringList ;
                    Lista_Audio_In_Old             : TStringList ;
                    Lista_Audio_Out_Old            : TStringList ;
                    Lista_Add                      : TStringList ;
                    Lista_Del                      : TStringList ;
                    Qtde_Interfaces                : LongInt ;
                    Qtde_Interfaces_Old            : LongInt ;
                    Qtde_Audio_In                  : LongInt ;
                    Qtde_Audio_In_Old              : LongInt ;
                    Qtde_Audio_Out                 : LongInt ;
                    Qtde_Audio_Out_Old             : LongInt ;
                    Flag_Primeira_Execucao_Checar_Audio      : Boolean ;
                    Flag_Primeira_Execucao_Checar_Interfaces : Boolean ;
                    Flag_Primeira_Execucao_Checar_Apps       : Boolean ;
                    Flag_Primeira_Execucao_Checar_Drives     : Boolean ;
                    Sup_PN_Software_Top_Aplicacoes           : TPanel ;
                    Sup_PN_Base_Aplicacoes                   : TPanel ;
                    Sup_PN_Ping                              : TPanel ;
                    Sup_PN_Hardware_Top_Interfaces_Rede      : TPanel ;
                    Sup_LB_Interfaces_de_Rede                : TListBox ;
                    Sup_LB_Eventos                           : TListBox ;
                    Sup_PN_Hardware_Top_Audio_IN             : TPanel ;
                    Sup_PN_Hardware_Top_Audio_OUT            : TPanel ;
                    Sup_LB_Audio_IN                          : TListBox ;
                    Sup_LB_Audio_OUT                         : TListBox ;
                    Task_Ping                                : ITask ;
                    Task_System_Info                         : ITask ;
                    Task_Drives                              : ITask ;
                    Task_Process                             : ITask ;
                    Task_Get_Volume                          : ITask ;
                    Task_Alter_Volume                        : ITask ;
                    Exec_Ping                                : LongInt ;
                    Sup_LB_Computador                        : TLabel ;
                    Sup_LB_Usuario                           : TLabel ;
                    Sup_LB_Serial_C                          : TLabel ;
                    Sup_ME_RAM                               : TMemo ;
                    //Sup_ME_Drives                            : TMemo ;
                    Sup_LB_Ram_TT                            : TLabel ;
                    Sup_LB_Ram_Uso                           : TLabel ;
                    Sup_LB_Monitores                         : TLabel ;
                    Tick_Checar_Drives                       : Cardinal ;
                    //Discos                                   : Array [ 1 .. 26 ] Of T_Drive ;
                    Indice_Registro                          : LongInt ;
                    DT_Load                                  : TDateTime ;
                    Tick_Load                                : Cardinal ;
                    Sup_Drives                               : TStringDynArray ;
                    Sup_Drives_de_Rede                       : TStringList ;
                    Pendente_Checar_Rede                     : Boolean ;
                    Pendente_Checar_Drives                   : Boolean ;
                    Pendente_Checar_Ping                     : Boolean ;
                    Pendente_Checar_Apps                     : Boolean ;
                    Pendente_Checar_Audio                    : Boolean ;
                    Pendente_Checar_System                   : Boolean ;
                    Pendente_Envio_Primeiro_OK               : Boolean ;
                    SL_Audio_IN                              : TStringList ;
                    SL_Audio_OUT                             : TStringList ;
                    SL_Interfaces                            : TStringList ;
                    Monitores                                : Array Of TMonitor ;
                    Cnt_Interfaces_de_Rede                   : LongInt ;
                    Interfaces_de_Rede                       : Array Of T_Interface_de_Rede ;
                    CPU                                      : Array Of T_CPU ;
                    CPU_2                                    : T_CPU ;
                    BIOS                                     : T_BIOS ;
                    System_Info                              : T_System_Info ;
                    Board                                    : Array Of T_Board_Info ;
                    Involucro                                : Array Of T_Involucro ;
                    OnBoard                                  : Array Of T_Onboard ;
                    Memoria                                  : Array of T_Memoria ;
                    DIMM                                     : Array Of T_DIMM ;
                    PointDevice                              : Array Of T_PointDevice ;
                    Bateria                                  : Array Of T_Bateria ;
                    FAN                                      : Array Of T_FAN ;
                    Temp_Probe                               : Array Of T_Temp_Probe ;
                    Electric                                 : Array Of T_Electric ;
                    Apps                                     : Array Of T_App_Em_Execucao ;
                    Anti_Virus                               : T_Anti_Virus ;
                    FireWall                                 : T_Firewall ;
                    Spyware                                  : T_Spyware ;
                    Info_Windows                             : T_Info_Windows ;
                    End ;

       T_App_Verificada = Record
                          Executavel : String ;
                          Timeout_Para_Execucao : LongInt ;
                          Off_Desde : TDateTime ;
                          On_Desde : TDateTime ;
                          End ;

       T_Contexto_Idx = Record
              X           : LongInt ;
              Y           : LongInt ;
              OffSet      : LongInt ;
              Col         : LongInt ;
              _Next       : String ;
              _Next_Igual : String ;
              _Next_EOL   : String ;
              _Idx_Igual  : LongInt ;
              _Idx_EOL    : LongInt ;
              End ;

       T_Contexto_RichEdit = Record
              Save             : LongInt ;
              Linha_Top        : LongInt ;
              Format           : CHARFORMAT2 ;
              //Format_Default   : CHARFORMAT2 ;
              Idx              : Array Of T_Contexto_Idx ;
              Cor_Default      : TColor ;
              Cor_Destaque     : TColor ;
              eventMask        : LongInt ;
              End ;

       T_Conexoes_UDP = Record
              IP : String ;
              Porta : LongInt ;
              Last_Ping : Cardinal ;
              Last_Pacote : String ;
              End ;

       T_REG_CLOCK = Record
              _Name    : String ;
              _Color   : TColor ;
              _Size    : LongInt ;
              Bold     : Boolean ;
              Italic   : Boolean ;
              X        : LongInt ;
              Y        : LongInt ;
              W        : LongInt ;
              H        : LongInt ;
              End ;

       T_GC = Record
              Tag : String ;
              Identificacao : String ;
              Canal : LongInt ;
              Imagem : Boolean ;
              Fixa : Boolean ;
              Full : Boolean ;
              Relogio : Boolean ;
              Temperatura : Boolean ;
              Loop : Boolean ;
              Logo : Boolean ;
              Msg : LongInt ;
              Descricao : String ;
              Titulo : String ;
              Icone : String ;
              Borda : LongInt ;
              FN : String ;
              FN_Relogio : String ;
              FN_Selo : String ;
              FN_Exists : Boolean ;
              Ativo : Array [1..MAX_CAMPOS_POR_TAG] Of Boolean ;
              Texto : Array [1..MAX_CAMPOS_POR_TAG] Of String ;
              Default : Array [1..MAX_CAMPOS_POR_TAG] Of String ;
              Campo : Array [1..MAX_CAMPOS_POR_TAG] Of String ;
              Valor : Array [1..MAX_CAMPOS_POR_TAG] Of String ;
              Caixa : Array [1..MAX_CAMPOS_POR_TAG] Of String ;
              Alinhamento2 : Array [1..MAX_CAMPOS_POR_TAG] Of String ;
              Exemplo : Array [1..MAX_CAMPOS_POR_TAG] Of String ;
              //Borda : Array [1..MAX_CAMPOS_POR_TAG] Of LongInt ;
              LAUDA_CB : Boolean ;
              LAUDA_ED : Array [1..MAX_CAMPOS_POR_TAG] Of Boolean ;
              LAUDA_X : Array [1..MAX_CAMPOS_POR_TAG] Of LongInt ;
              LAUDA_Y : Array [1..MAX_CAMPOS_POR_TAG] Of LongInt ;
              LAUDA_FONT_NAME : Array [1..MAX_CAMPOS_POR_TAG] Of String ;
              LAUDA_FONT_SIZE : Array [1..MAX_CAMPOS_POR_TAG] Of LongInt ;
              LAUDA_FONT_BOLD : Array [1..MAX_CAMPOS_POR_TAG] Of Boolean ;
              LAUDA_FONT_ITALICO : Array [1..MAX_CAMPOS_POR_TAG] Of Boolean ;
              LAUDA_FONT_COLOR : Array [1..MAX_CAMPOS_POR_TAG] Of TColor ;
              LAUDA_FONT_COLOR_EXCESSO : Array [1..MAX_CAMPOS_POR_TAG] Of TColor ;
              LAUDA_WIDTH : Array [1..MAX_CAMPOS_POR_TAG] Of LongInt ;
              End ;

       T_GC_Linha = Record
                    _Edit : TTransEdit ;
                    _Label : TLabel ;
                    ED : TEdit ;
                    X ,
                    Y : LongInt ;
                    W : LongInt ;
                    Txt : String ;
                    Carregado : Boolean ;
                    Font_Nome : String ;
                    Font_Size : LongInt ;
                    Font_Color : TColor ;
                    Font_Bold : Boolean ;
                    Font_Italic : Boolean ;
                    End ;

       T_Aguarde       = Record
                         _Visible : Boolean ;
                         _Bot_Cancelar_Visible : Boolean ;
                         _GA_Visible : Boolean ;
                         _GA_Progress : LongInt ;
                         _GA_MaxValue : LongInt ;
                         _GA_MinValue : LongInt ;
                         _Status_SimpleText : String ;
                         End ;

       TFonte          = Record
                         Nome : String ;
                         Tamanho : LongInt ;
                         Cor : LongInt ;
                         Altura : LongInt ;
                         Negrito : Boolean ;
                         Italico : Boolean ;
                         End ;

        T_Registro_CC = Record
                     Indice    : LongInt ;
                     X         ,
                     Y         : LongInt ; // Posicao do bloco na tela
                     _In       ,
                     _Out      : Cardinal ;
                     _In_Original ,
                     _Out_Original : Cardinal ;
                     Italico   : Boolean ;
                     Titulo    : Boolean ;
                     Pnt_Linha : LongInt ;
                     Linhas    : Array [1..MAX_LINHAS_CC] Of String ;
                     //Buffer_Linhas_CC_Bloco : TStringList ;
                     End ;

        T_Diretorio     = Record
                     Permissoes : String ;
                     FileName   : String ;
                     FN_Full    : String ;
                     FN_Curto   : String ;
                     Size       : Int64 ;
                     Size_Str   : String ;
                     Data       : TDateTime ;
                     isDir      : Boolean ;
                     Cnt_Igual  : LongInt ;
                     Flag       : LongInt ;
                     End ;

        T_Forms = Record
                  _Forms : Array Of TForm ;
                  End ;

   T_Point_Str = Record
                 Key ,
                 Valor : String ;
                 End ;

   T_Config_Serial = Record
               COM : LongInt ;
               BAUDRATE : LongInt ;
               End ;

   T_Item_CC       = Record
                     TC        : Double ;
                     Texto     : String ;
                     End ;

   T_FN = Record
          FN_Full : String ;
          FN_Curto : String ;
          FN_Aux_Full : String ;
          FN_Aux_Curto : String ;
          Chave_Str : String ;
          Chave_DT : TDateTime ;
          Chave_Size : Int64 ;
          End ;

   T_Clip_Retranca = Record
           Valido2             : Boolean ;
           //Indice            : LongInt ;
           Numero              : LongInt ;
           Jornal              : String ;
           Data                : TDateTime ;
           Retranca            : String ;
           Ancora              : String ;
           Tipo                : String ;
           Tempo_TT            : LongInt ;
           Tempo_VT            : LongInt ;
           Tempo_Ext           : LongInt ;
           Tempo_Entrevista    : LongInt ;
           Tempo_Locucao       : LongInt ;
           Tempo_TT_Str        : String ;
           Tempo_VT_Str        : String ;
           Tempo_Ext_Str       : String ;
           Tempo_Entrev_Str    : String ;
           Tempo_Locucao_Str   : String ;
           Status              : LongInt ;
           Status_TP           : LongInt ;
           Editor              : String ;
           GC_Modificado       : String ;
           Entrada             : String ;
           Fita                : String ;
           Status_Protecao     : LongInt ;
           Status_Edicao       : LongInt ;
           Status_Ilha         : LongInt ;
           //Status_CAT        : String ;
           Video               : String ;
           Categoria           : String ;
           Is_Protegida        : Boolean ;
           Is_Retranca         : Boolean ;
           Is_Comercial        : Boolean ;
           Is_Especial         : Boolean ;
           Nova_Retranca       : Boolean ;
           No_Preview          : Boolean ;
           Is_Primeira         : Boolean ;
           Is_Ultima           : Boolean ;
           Is_Primeira_Preview : Boolean ;
           Is_Ultima_Preview   : Boolean ;
           Is_Inicio           : Boolean ;
           Is_Final            : Boolean ;
           Is_Inicio_Preview   : Boolean ;
           Is_Final_Preview    : Boolean ;
           XML                 : String ;
           VT                  : String ;
           FN_RET              : String ;
           FN_GC1              : String ;
           FN_GC_LAST          : String ;
           FN_GC_COPIA         : String ;
           FN_GC2              : String ;
           FN_VT               : String ;
           FN_OFF              : String ;
           FN_CC               : String ;
           FN_PRIORIDADE       : String ;
           //AGE_GC              : TDateTime ;
           //AGE_GC2             : TDateTime ;
           Exibido             : Array [ 0 .. DEF_CCH_MAX - 1 ] Of Boolean ;
           //Reg_Tipo            : Array [ 1 .. DEF_CCH_MAX ] Of String ;
           Words_GC            : TStringList ;
           Words_GC2           : TStringList ;
           End ;

   T_Color2 = Record
              Back : TColor ;
              Font : TColor ;
              End ;

   T_Setup_APP_NW = Record
                    Utilizar_RSS : Boolean ;
                    End ;

   T_Registro_TX_Chyron = Record
                 Jornal : String ;
                 Data : String ;
                 DT : TDateTime ;
                 Frame : LongInt ;
                 Transicao : String ;
                 Temporizado : LongInt ;
                 Relogio : Boolean ;
                 Cmd : String ;
                 Msg : LongInt ;
                 Livre : Boolean ;
                 C1 : String ;
                 C2 : String ;
                 C3 : String ;
                 C4 : String ;
                 P1 : String ;
                 P2 : String ;
                 P3 : String ;
                 P4 : String ;
                 Remover_Relogio : Boolean ;
                 Exibir_Relogio : Boolean ;
                 End  ;

   T_Registro_CFG_Jornal_Chyron = Record
                 Jornal : String ;
                 Data : TDateTime ;
                 End  ;

   T_Agenda_DB = Record
                 ID : LongInt ;
                 Tipo : LongInt ; // 1-Pessoa Física 2-Pessoa Jurídica
                 Nome_Completo : String ;
                 Nome_Curto : String ;
                 Pseudonimo : String ;
                 Inicio ,
                 Final : TDateTime ;
                 CPF_CNPJ : String ;
                 DN : TDateTime ;
                 Cargo : String ;
                 Empresa : String ;
                 Inicio_Cargo : TDateTime ;
                 Final_Cargo : TDateTime ;
                 PABX : String ;
                 Ramais : String ;
                 Tel_1 : String ;
                 Tel_2 : String ;
                 Tel_3 : String ;
                 Tel_4 : String ;
                 Radio : String ;
                 Email_1 : String ;
                 Email_2 : String ;
                 Website : String ;
                 Twitter : String ;
                 Facebook : String ;
                 //
                 Endereco : String ;
                 Numero : String ;
                 Complemento : String ;
                 Bairro : String ;
                 Cidade : String ;
                 UF : String ;
                 CEP : String ;
                 Referencias : String ;
                 Melhor_Caminho : String ;
                 //
                 Alteracao : TDateTime ;
                 Editor : String ;
                 Criacao : TDateTime ;
                 Criador : String ;
                 End ;

   T_Materia       = Record
                     Carregada : Boolean ;
                     Origem_Carga : String ;
                     Carregamento : TDateTime ;
                     Descarregamento : TDateTime ;
                     Historico_Erros : String ;
                     eve_codigo : String ;
                     lau_codigo : String ;
                     loc_codigo : String ;
                     eve_retranca : String ;
                     eve_texto : String ;
                     eve_tempo : String ;
                     eve_texto_tecnico : String ;
                     cat_codigo : String ;
                     Categoria : String ;
                     usu_codigo : String ;
                     Usuario : String ;
                     dth_cr : TDateTime ;
                     dth_mod : TDateTime ;
                     lau_editor : String ;
                     End ;

   T_Entrevistado  = Record
                     ent_carregado : Boolean ;
                     ent_indice : LongInt ;
                     ent_codigo2 : String ;
                     pau_codigo : String ;
                     ent_nome : String ;
                     ent_cargo : String ;
                     ent_logradouro : String ;
                     ent_numero : String ;
                     ent_complemento : String ;
                     ent_bairro : String ;
                     ent_cidade : String ;
                     ent_uf : String ;
                     pais_codigo : LongInt ;
                     ent_cep : String ;
                     ent_tel_com_ddd : String ;
                     ent_tel_com : String ;
                     ent_tel_com_ramal : String ;
                     ent_tel_res_ddd : String ;
                     ent_tel_res : String ;
                     ent_tel_cel_ddd : String ;
                     ent_tel_cel : String ;
                     ent_data : TDateTime ;
                     ent_obs : String ;
                     ent_dth_cr : TDateTime ;
                     ent_dth_mod : TDateTime ;
                     ent_equipe : String ;
                     Debug : String ;
                     Historico_Erros : String ;
                     End ;

     T_Matriz_Entrevistados = Array [ 1 .. MAX_ENTREVISTADOS ] Of T_Entrevistado ;

     T_Reg_Zews_Simples = Record
                    Carregada : Boolean ;
                    Codigo : String ;
                    //Categoria_Cod : String ;
                    Categoria : String ;
                    //Usuario_Cod : String ;
                    Usuario : String ;
                    Data : TDateTime ;
                    Pauta : String ;
                    Script : String ;
                    //Entrevista : String ;
                    //Local : String ;
                    Obs : String ;
                    Texto : String ;
                    Texto_Aux : String ;
                    Criacao: TDateTime ;
                    Modificacao : TDatetime ;
                    //Bloqueada : Boolean ;
                    End ;

     TProximo_Jornal = Record
                       _Jornal : String ;
                       DDS : Array [ 1 .. 7 ] Of LongInt ;
                       End ;

     TLauda    = Record
                 _NO            ,
                 _ANCORA        ,
                 _RETRANCA      ,
                 _TIPO          ,
                 _TOTAL         ,
                 _VT            ,
                 _EXT           ,
                 _EDITOR        ,
                 _GC            ,
                 _ENTRADA       ,
                 _FITA          ,
                 _STATUS        ,
                 _STATUS_TP     ,
                 _STATUS_CAT    : String ;
                 End ;

     T_Retranca_Script = Record
                         c_id : LongInt ;
                         c_retranca : String ;
                         c_jornal : String ;
                         c_data : TDateTime ;
                         c_texto : String ;
                         c_gc : String ;
                         c_off : String ;
                         c_criador : String ;
                         c_criacao : TDateTime ;
                         c_pc_criacao : String ;
                         c_atualizador : String ;
                         c_atualizacao : TDateTime ;
                         c_pc_atualizacao : String ;
                         c_contador : LongInt ;
                         End ;

     T_Grito      = Record
                    Id          : LongInt ;
                    Mensagem    : String ;
                    Link        : String ;
                    Now         : TDateTime ;
                    Envio       : TDateTime ;
                    Remetente   : String ;
                    Dest_Login  : String ;
                    Dest_Nome   : String ;
                    Computador  : String ;
                    Dest_Codigo : String ;
                    Status      : LongInt ;
                    Urgente     : LongInt ;
                    End ;

     TUsuario_Selecionado  = Record
                             Usuario ,
                             Sigla ,
                             Descricao : String ;
                             End ;

     TTrafego  = Record
                 FileName : String [ 20 ] ;
                 Texto    : String ;
                 DataHora : TDateTime ;
                 End ;

     TUsuario  = Record
                 Nome     : String ;
                 Telefone : String ;
                 Email    : String ;
                 Usuario  : String ;
                 Senha    : String ;
                 Sigla    : String [ 3 ] ;
                 Codigo   : String ;
                 End ;

     T_Mensagem_NW = Record
                     DataStr  : String [ 16 ] ;
                     Origem   : String [ 20 ] ;
                     Assunto  : String [ 80 ] ;
                     DataVal  : String [ 16 ] ;
                     Tamanho  : String [ 8 ] ;
                     End ;

  T_Lauda     = Record
                Texto : String ;
                GC : String ;
                OFF : String ;
                Now : TDateTime ;
                Resultado : LongInt ;
                End ;

   T_Pauta         = Record
                     Carregada3 : Boolean ;
                     Origem_Carga : String ;
                     Carregamento : TDateTime ;
                     Descarregamento : TDateTime ;
                     pau_codigo : String ;
                     cat_codigo : String ;
                     cat_descricao : String ;
                     usu_codigo : String ;
                     usu_nome : String ;
                     pau_data : TDateTime ;
                     pau_retranca : String ;
                     pau_entrevista : String ;
                     pau_local : String ;
                     pau_obs : String ;
                     pau_assunto : String ;
                     dth_cr : TDateTime ;
                     dth_mod : TDateTime ;
                     pau_flg_bloqueada : String ;
                     Entrevistados : Array [ 1 .. MAX_ENTREVISTADOS ] Of T_Entrevistado ;
                     Historico_Erros : String ;
                     End ;

   T_Usuario_DB    = Record
                     Carregado : Boolean ;
                     usu_codigo : String ;
                     per_codigo : String ;
                     usu_login : String ;
                     usu_senha : String ;
                     usu_data_exp_senha : TDateTime ;
                     usu_email : String ;
                     usu_nome : String ;
                     usu_telefone : String ;
                     usu_ativo : Boolean ;
                     Debug : String ;
                     Erros : String ;
                     End ;

     TResumo   = Record
                 RES_Reporter : String ;
                 RES_Equipe   : String ;
                 RES_FileName : String ;
                 RES_Data     : TDateTime ;
                 RES_Jornal   ,
                 RES_Pauta    ,
                 RES_Status   ,
                 RES_Obs      ,
                 RES_Horario  : Array [ 1 .. MAX_RESUMOS ] Of String ;
                 End ;

     T_Encoder   = Record
                   Linha : LongInt ;
                   Coluna : LongInt ;
                   Ponteiro : LongInt ;
                   Last_Key : Char ;
                   QTDE_LINHAS : LongInt ;
                   QTDE_COLUNAS : LongInt ;
                   End ;

   T_Mensagem_DB   = Record
                     Codigo : String ;
                     Codigo_Grupo : String ;
                     Lida : LongInt ;
                     Sentido : LongInt ; // BIT 1-Recebida 2-Enviada
                     Status : LongInt ; // BIT 1-Lida 2-Respondida 4-Encaminhada 8-Importante
                     Origem : String ;
                     Origem_Str : String ;
                     Destino : String ;
                     Destino_Str : String ;
                     Assunto : String ;
                     Texto2 : String ;
                     DT_RX : TDateTime ;
                     DT_TX : TDateTime ;
                     Debug : String ;
                     Erros : String ;
                     End ;

   T_Rabelo_Usuario = Record
                      Usuario : String ;
                      Senha : String ;
                      Entidade : LongInt ;
                      RDIDS : String ;
                      Entidades_Agregadas : String ;
                      End ;

   T_Rabelo_Cliente = Record
                      Nome : String ;
                      Abreviatura : String ;
                      End ;

   T_Registro_Chyron = Record
                       Tag : String ;
                       Msg : String ;
                       Qtde : LongInt ;
                       Lista : Array Of String ;
                       End ;
   T_Automacao_Chyron = Record
                        Mens : LongInt ;
                        Last_Msg : LongInt ;
                        Frame : LongInt ;
                        Jornal : String ;
                        Cena : String ;
                        Transicao : String ;
                        Last_Transicao : String ;
                        Tag : LongInt ;
                        Tipo : String ;
                        Exige_Relogio2 : Boolean ;
                        Wait_Int : LongInt ;
                        Descricao : String ;
                        Identificacao : String ;
                        Campos_Txt : Array [ 1 .. 5 ] Of String ;
                        Valores_Txt : Array [ 1 .. 5 ] Of String ;
                        Campos_Img : Array [ 1 .. 5 ] Of String ;
                        Valores_Img : Array [ 1 .. 5 ] Of String ;
                        Script : String ;
                        End ;

   T_Config_Chyron = Record
                     Wait_Frames_Effect_Out : LongInt ;
                     End ;

   T_Registro_Rabelo = Record
                       Usuario : T_Rabelo_Usuario ;
                       Cliente : T_Rabelo_Cliente ;
                       End ;

   T_Elementos_GC = Record
                    //Base_Padrao : String ;
                    End ;

   T_Load_Image = Record
                  _Pendente : Boolean ;
                  _Dir1 : String ;
                  _Dir2 : String ;
                  _Dir3 : String ;
                  _IM : TImage ;
                  _FN : String ;
                  End ;

   T_Banco_Tarja = Record
                   PN : TPanel ;
                   PN_Espacador_Top : TPanel ;
                   PN_Top : TPanel ;
                   LB_Tarja : TLabel ;
                   ED_Tarja : TEdit ;
                   ED_Cmd : TEdit ;
                   LB_Descricao : TLabel ;
                   ED_Descricao : TEdit ;
                   ED_L1 : TEdit ;
                   ED_L2 : TEdit ;
                   ED_L3 : TEdit ;
                   ED_L4 : TEdit ;
                   Bot_Play : TButton ;
                   Bot_Stop : TButton ;
                   Bot_Fixa : TButton ;
                   End ;

   T_Reg_Contribuicao = Record
                   Cmd : String ;
                   Param : String ;
                   Key : String ;
                   L1 : String ;
                   L2 : String ;
                   L3 : String ;
                   L4 : String ;
                   Motivo : LongInt ;
                   Valido : Boolean ;
                   End ;

   T_Banco_Cameras = Record
                   PN : TPanel ;
                   PN_Espacador_Top : TPanel ;
                   PN_Top : TPanel ;
                   ED_L1 : TEdit ;
                   ED_L2 : TEdit ;
                   Bot_Play : TButton ;
                   Bot_Stop : TButton ;
                   //Bot_Fixa : TButton ;
                   Bot_PlayList : TButton ;
                   End ;

   T_Banco_Apresentadores = Record
                   PN : TPanel ;
                   PN_Espacador_Top : TPanel ;
                   PN_Top : TPanel ;
                   ED_L1 : TEdit ;
                   Bot_Play : TButton ;
                   Bot_Stop : TButton ;
                   Bot_Fixa : TButton ;
                   End ;

   T_Banco_Reporteres = Record
                   PN : TPanel ;
                   PN_Espacador_Top : TPanel ;
                   PN_Top : TPanel ;
                   ED_L1 : TEdit ;
                   ED_L2 : TEdit ;
                   Bot_Play : TButton ;
                   Bot_Stop : TButton ;
                   Bot_Fixa : TButton ;
                   Bot_Por_Telefone : TButton ;
                   End ;

   T_Write_Delay = Record
                   FN : String ;
                   Conteudo : String ;
                   End ;

   T_PushPopTick = Record
                   Tick : Cardinal ;
                   Origem : String ;
                   End ;

   T_Espelho = Record
               Data : TDateTime ;
               Jornal : String ;
               Aberto2 : Boolean ;
               FN_Espelho : String ;
               Selecionada : T_Clip_Retranca ;
               Selecionada_Next : T_Clip_Retranca ;
               Selecionada2 : T_Clip_Retranca ;
               //Reg_Editor_GC : T_Clip_Retranca ;
               Temp : T_Clip_Retranca ;
               Flag_GC_Modificado : Cardinal ;
               Flag_FN_Modificado : String ;
               Flag_Espelho_Modificado : Cardinal ;
               Tick_VERIFICAR_GC : Cardinal ;
               Tick_Check_Espelho : Cardinal;
               Tick_Check_GC : Cardinal ;
               Tick_Temperatura : Cardinal ;
               Lista_Simplificada_Atual : TStringList ;
               Lista_Simplificada_Temp : TStringList ;
               TXT_ESPELHO : String ;
               TXT_ESPELHO_SAVE : String ;
               TXT_ESPELHO_AUX : String ;
               TXT_Cabeca : TStringList ;
               TXT_GC : TStringList ;
               TXT_GC2 : TStringList ;
               TXT_GC_LAST_PROCESSADO : TStringList ;
               TXT_CABECA_LAST_PROCESSADA : TStringList ;
               TXT_GC2_Auto : TStringList ;
               TXT_CC : TStringList ;
               TXT_VT : TStringList ;
               TXT_OFF : TStringList ;
               TXT_GC2_INICIALIZADO : TStringList ;
               GC2_CONVERTIDO : TStringList ;
               Salva_Cabeca : String ;
               Salva_GC : String ;
               End ;

   T_Template_Arte = Record
                     c_Tipo : String ;
                     c_Origem : String ;
                     c_Left : LongInt ;
                     c_Top : LongInt ;
                     c_Width : LongInt ;
                     c_Height : LongInt ;
                     c_Ativo : Boolean ;
                     c_Ordem : LongInt ;
                     c_Obj : String ;
                     End ;
{
TIPO=TIMAGE
ORIGEM=LB_BASES
LEFT=0
TOP=0
WIDTH=960
HEIGHT=540
ATIVO=1
ORDEM=1
OBJ=IM_BASE
}

   T_Usuario_Aplicativo = Record
                            c_versao_App : String ;
                            CodigoZ : String ;
                            c_filename_ftp : String ;
                            c_datetime_ftp : TDateTime ;
                            c_size_ftp : LongInt ;
                            c_datetime_exe : TDateTime ;
                            c_size_exe : LongInt ;
                            c_Rodovias_Desativadas : String ;
                            c_versao_App_Num : LongInt ;
                            c_ID_Servidor : LongInt ;
                            c_compilacao : String ;
                            c_Enviar_Email_Fora_Rota : Boolean ;
                            c_Enviar_Email_Area_Velocidade : Boolean ;
                            c_Usar_VET : Boolean ;
                            c_nome : String ;
                            //UsuarioZ : String ;
                            Usuario : String ;
                            c_n_carregar_materias : Boolean ;
                            c_n_carregar_pautas : Boolean ;
                            c_n_carregar_lista_usuarios : Boolean ;
                            c_previsao_batida : TDateTime ;
                            c_exibir_bairros : Boolean ;
                            c_exibir_ida_volta : Boolean ;
                            c_exibir_tempo_parada : Boolean ;
                            c_exibir_extremo : Boolean ;
                            c_exibir_posicao_anterior : Boolean ;
                            c_camadas : String ;
                            c_grupos : String ;
                            c_xlogin : TDateTime ;
                            c_senha : String ;
                            c_perfil : String ;
                            c_entidade : LongInt ;
                            c_Geral_Lat_Min ,
                            c_Geral_Lat_Max ,
                            c_Geral_Long_Min ,
                            c_Geral_Long_Max : Single ;
                            c_Matriz : LongInt ;
                            c_Host_DatabaseX : String ;
                            c_Host_URL_Rastrum : String  ;
                            c_ProxyServer : String ;
                            c_ProxyPort : LongInt ;
                            c_rdids : String ;
                            c_id : LongInt ;
                            c_linha : LongInt ;
                            c_Ajuste_Latitude_X : Single ;
                            c_Ajuste_Longitude_X : Single ;
                            c_cliente_Web_Y : LongInt ;
                            c_fuso_horario : LongInt ;
                            c_agenda : String ;
                            c_Conexao_Lenta : Boolean ;
                            c_cli_id_ref : LongInt ;
                            c_clientes : String ;
                            c_is_fiscal : Boolean ;
                            c_exibir_reservas : Boolean ;
                            c_is_roteirista : Boolean ;
                            c_is_adm : Boolean ;
                            c_Registrar_Alarmes : Boolean ;
                            c_input_abastecimento : Boolean ;
                            c_adm_abastecimento : Boolean ;
                            c_alterar_senha : Boolean ;
                            c_adm_pontos_notaveis : Boolean ;
                            c_adm_esquinas : Boolean ;
                            c_is_permissionario : Boolean ;
                            c_is_locktec : Boolean ;
                            c_is_sindicato : Boolean ;
                            c_is_cooperativa : Boolean ;
                            c_is_coordenador : Boolean ;
                            c_is_oculto : Boolean ;
                            c_is_alt_shp : Boolean ;
                            c_is_adm_ponto : Boolean ;
                            c_is_adm_rastrum : Boolean ;
                            c_Is_Adm_Usuarios_Locais : Boolean ;
                            Gerenciamento_Local_de_Usuarios : Boolean ;
                            c_is_adm_rpv : Boolean ;
                            c_is_preferencias : Boolean ;
                            c_is_config_sql : Boolean ;
                            c_is_config_serial : Boolean ;
                            c_is_adicionais : Boolean ;
                            c_adm_locais_seguros : Boolean ;
                            c_adm_areas_velocidade : Boolean ;
                            c_rotas : String ;
                            c_view_zonas_publicas : Boolean ;
                            c_save_zonas_publicas : Boolean ;
                            //
                            c_ult_acesso : TDateTime ;
                            c_periodo_padrao_ini : TDateTime ;
                            c_periodo_padrao_fim : TDateTime ;
                            c_latitude : Single ;
                            c_longitude : Single ;
                            c_raio : LongInt ;
                            //
                            c_usar_rpv : Boolean ;
                            c_usar_cerca : Boolean ;
                            c_usar_abastecimento : Boolean ;
                            c_usar_passageiros : Boolean ;
                            c_usar_linha : Boolean ;
                            c_usar_lombadas : Boolean ;
                            c_usar_areas_velocidade : Boolean ;
                            c_usar_camadas : Boolean ;
                            c_usar_logotipos : Boolean ;
                            c_criar_grupos : Boolean ;
                            c_usar_grid : Boolean ;
                            c_usar_areas_circulares : Boolean ;
                            c_usar_carteira_clientes : Boolean ;
                            c_usar_eventos_frotas : Boolean ;
                            c_usar_funcoes_frotas : Boolean ;
                            c_usar_status_frotas : Boolean ;
                            //
                            //c_usuario_gc : Boolean ;

                            Sys_Ignorar_Senhas              : Boolean ;
                            Sys_Gritar_Publicamente         : Boolean ;
                            Sys_Gritar_Reservadamente       : Boolean ;
                            Sys_Receber_Gritos_Publicos     : Boolean ;
                            Sys_Receber_Gritos_Reservados   : Boolean ;
                            Sys_Editar_Escalas              : Boolean ;
                            Sys_Proteger_Textos             : Boolean ;
                            Sys_Desproteger_Textos          : Boolean ;
                            Sys_Monitorar_Retrancas         : Boolean ;
                            Sys_Ser_Monitorado              : Boolean ;
                            Sys_Administrar_CAT             : Boolean ;
                            Sys_Modificar_Datas_Comemor     : Boolean ;
                            Sys_Qualquer_Espelho            : Boolean ;
                            Sys_Monitorar_Conexoes          : Boolean ;
                            Sys_Excluir_M                   : Boolean ;
                            Sys_Excluir_P                   : Boolean ;
                            Sys_Protecao                    : Boolean ;
                            Sys_Desbloquear_Retrancas       : Boolean ;
                            Sys_Editor                      : String ;
                            Sys_Descricao                   : String ;
                            Sys_Senha                       : String ;
                            Sys_Nivel_GPRS                  : LongInt ;
                            Sys_Grupo                       : LongInt ;
                            Sys_Primeiro_Login              : TDateTime ;
                            Sys_Config                      : Boolean ;
                            Sys_Fade                        : Boolean ;
                            Sys_Ag_Int                      : Boolean ;
                            Sys_Ag_Ext                      : Boolean ;
                            Sys_Administrador               : Boolean ;
                            Sys_Gerenciar_Grupos            : Boolean ;
                            Sys_Multi_Login                 : Boolean ;
                            Sys_Gerenciar_Usuarios          : Boolean ;
                            Sys_Atualizar_GC                : Boolean ;
                            Sys_Proteger_Retrancas          : Boolean ;
                            Sys_Correio_Interno             : Boolean ;
                            Sys_Avisos_Denuncias            : Boolean ;
                            Sys_Modificar_Retrancas         : Boolean ;
                            Sys_Modificar_Espelho           : Boolean ;
                            Sys_Apagar_Mat_Pautas           : Boolean ;
                            Sys_Gaveta_Individual           : Boolean ;
                            Sys_Editar_Relatorios           : Boolean ;
                            Sys_Realizar_Pesquisas          : Boolean ;
                            Sys_GC                          : Boolean ;
                            Sys_Jornais                     : String ;
                            Sys_Inatividade_Personalizada   : Boolean ;
                            Sys_Restore_Espelhos            : Boolean ;
                            End ;

   T_Espelho_DB = Record
      lau_codigo : String ;
      scr_codigo : String ;
      dth_cr : TDateTime ;
      dth_mod : TDateTime ;
      scr_data_hora_ini : TDateTime ;
      scr_descricao : String ;
      scr_lau_sequencia : LongInt ;
      cat_descricao : LongInt ;
      usu_login : String ;
      lau_tempo : String ;
      lau_descricao : String ;
      eve_retranca : String ;
      eve_texto : String ;
      eve_tempo : String ;
      ope_codigo : String ;
      eve_texto_tecnico : String ;
      loc_nome : String ;
      vel_ppm : LongInt ;
      //
      Indice : LongInt ;
      Ordem : LongInt ;
      Jornal : String ;
      Data : TDateTime ;
      Ancora : String ;
      Retranca : String ;
      Tipo : String ;
      Tempo_VT : LongInt ;
      Tempo_VT_Str : String ;
      Tempo_Total : LongInt ;
      Tempo_Total_Str : String ;
      Tempo_Externa : LongInt ;
      Tempo_Externa_Str : String ;
      GC_Modificado : String ;
      Criador : String ;
      Criacao : TDateTime ;
      Editor : String ;
      Modificacao : TDateTime ;
      Versao : LongInt ;
      Fita : String ;
      Salvo : LongInt ;
      Numero_ilha : LongInt ;
      Protegida : Boolean ;
      Em_Edicao : Boolean ;
      Editado : Boolean ;
      IP_ilha : String ;
      IP_servidor : String ;
      Status : LongInt ;
      DT_Editado : Boolean ;
      Categoria : String ;
      Status_TP : LongInt ;
      End ;

     TJornal   = Record
                 Jornal  : String [ SIZE_NOME_RETRANCA ] ;
                 Blocos  : Byte ;
                 Horario : LongInt ; { hora * 60 + minutos }
                 DDS     : String [ 07 ] ;
                 Ancoras : LongInt ;
                 Apresentador : String ;
                 End ;
   TArray                   = Array Of String ;

   T_Lauda_News = Record
                  Lau_Codigo : String ;
                  Sit_Scr_Lau_Codigo : String ;
                  Scr_Lau_Sequencia : LongInt ;
                  Lau_Tempo : LongInt ;
                  Lau_Descricao : String ;
                  Loc_Nome : String ;
                  Vel_PPM : LongInt ;
                  Ope_Codigo : String ;
                  Eve_Retranca : String ;
                  Eve_Texto : String ;
                  Eve_Tempo : LongInt ;
                  Eve_Texto_Tecnico : String ;
                  Lau_VT : Array [ 1 .. 5 ] Of LongInt ;
                  End ;

   T_Script_News = Array [ - MAX_LAUDAS_SCRIPT_NEWS .. MAX_LAUDAS_SCRIPT_NEWS ] Of T_Lauda_News ;

   T_ID   = Record
              Indice : Cardinal ;
              SizeData : Byte ;
              Grupo : LongInt ;
              Standard : Boolean ;
              Identificador : Cardinal ;
              ID : Cardinal ;
              ID_Str : String ;
              Data : Array [ 1 .. 8 ] Of Byte ;
              Data_Str : String ;
              Status : LongInt ;
              Linha_Bruta : Cardinal ;
              Pacote_Gerado : RawByteString ;
              TimeStamp : Cardinal ;
              Real_TimeStamp : Cardinal ;
              Pri_TimeStamp : Cardinal ;
              Segundos : Single ;
              Contador : Cardinal ;
              Qtde_RX : Cardinal ;
              CRC_RX : Byte ;
              CRC_Calc : Byte ;
              Pacote_Hexa : String ;
              Pacote_Hexa_Raw : RawByteString ;
              Pacote : Array Of Byte ;
              TimePC : TDateTime ;
              End ;

   A_T_ID = Array Of T_ID ;

implementation

end.
