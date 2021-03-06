Unit WMI_U ;

Interface

Uses Misc_Def_U, Misc_Const_U, Misc_Type_U,
     //Supervisao_U,
     IniFiles, ShellAPI, FolderMon, T_Supervisor_Pasta_U, USock_U,
     System.Variants, System.Win.StdVCL, Vcl.OleServer, Winapi.ActiveX,
     System.Win.ComObj, System.Threading,
     Winapi.Windows, Winapi.Messages,
     AdPort, OoMisc,
     //uSMBIOS,
     Misc_U,
     System.SysUtils, System.Classes, System.Win.ScktComp, System.IOUtils,
     Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls,
     Vcl.Menus, Vcl.AppEvnts, Vcl.ComCtrls, Vcl.StdCtrls,
     //RxSpin
     //ALBasicAudioOut, ALAudioOut, Mitov.Types, ALAudioIn,
     Vcl.Mask;

Procedure GET_WINDOWS_INFO ;
Procedure GET_CPU_INFO_2 ;
Procedure GET_WINDOWS_ADD_INFO ;
Function GET_RESUMO_MONITORES ( _Form : TForm ) : String  ;
Function GetWin32_VideoControllerInfo : String ;
Procedure GET_WIN32_NETWORK_ADAPTER ; // ( Var Qtde : LongInt ) : TStringList ;
Procedure GET_WIN32_NETWORK_CONFIGURATION ;
Function GET_VIDEO_PIXELS ( _Form : TForm ) : LongInt ;
Function GET_TIME_SYSTEM_INFO : String ;
Function GET_VIDEO_MODES : String ;
Function CHECAR_INTERFACES_DE_REDE ( PN : TPanel ; LB : TListBox ; Var Qtde : LongInt ) : TStringList ;
//Procedure TASK_CHECAR_DRIVES ;
//Procedure CHECAR_DRIVES ;
//Procedure CHECAR_DRIVES_LOGICOS ;
//Procedure CHECAR_DRIVES_LOGICOS_SUP ;
//Procedure GET_WINDOWS_LOGICAL_DISK ;
Procedure CHECAR_LOGICAL_DISKS ;
//Procedure GET_WINDOWS_LOGICAL_DISK ( Var _Log : String ) ;
//Procedure GET_WINDOWS_DISK_DRIVE ( Var _Log : String ) ;
Procedure GET_WINDOWS_VOLUME ( Var _Log : String ) ;
Procedure GET_WINDOWS_PROCESS ;
//Procedure TASK_CHECAR_DRIVES_LOGICOS_SUP ;
Procedure CHECAR_ALTERACOES_DE_VOLUME_DE_DISCO ;

implementation

Procedure GetWin32_OperatingSystemInfo;
Const WbemUser            = '' ;
      WbemPassword        = '' ;
      WbemComputer        = 'localhost' ;
      wbemFlagForwardOnly = $00000020 ;
Var FSWbemLocator  : OLEVariant ;
    FWMIService    : OLEVariant ;
    FWbemObjectSet : OLEVariant ;
    FWbemObject    : OLEVariant ;
    oEnum          : IEnumvariant ;
    iValue         : LongWord ;
Begin
FSWbemLocator  := CreateOleObject ( 'WbemScripting.SWbemLocator' ) ;
FWMIService := FSWbemLocator.ConnectServer ( WbemComputer, 'root\CIMV2', WbemUser, WbemPassword ) ;
FWbemObjectSet := FWMIService.ExecQuery ( 'SELECT * FROM Win32_OperatingSystem',
                                          'WQL', wbemFlagForwardOnly ) ;
oEnum := IUnknown(FWbemObjectSet._NewEnum) AS IEnumVariant ;
SetLength ( Sup.Info_Windows.Win32_OS, 0 ) ;
If oEnum.Next ( 1, FWbemObject, iValue ) = 0 Then Begin
   SetLength ( Sup.Info_Windows.Win32_OS, Length ( Sup.Info_Windows.Win32_OS ) + 1 ) ;
   With Sup.Info_Windows.Win32_OS[Length(Sup.Info_Windows.Win32_OS)-1] Do Begin
      If NOT VarIsNull ( FWbemObject.BootDevice ) Then
         BootDevice := String ( FWbemObject.BootDevice ) ;
      If NOT VarIsNull ( FWbemObject.BuildNumber ) Then
         BuildNumber := String ( FWbemObject.BuildNumber ) ;
      If NOT VarIsNull ( FWbemObject.BuildType ) Then
         BuildType := String ( FWbemObject.BuildType ) ;
      If NOT VarIsNull ( FWbemObject.Caption ) Then
         Caption := String ( FWbemObject.Caption ) ;
      If NOT VarIsNull ( FWbemObject.CountryCode ) Then
         CountryCode := String ( FWbemObject.CountryCode ) ;
      If NOT VarIsNull ( FWbemObject.CreationClassName ) Then
         CreationClassName := String ( FWbemObject.CreationClassName) ;
      If NOT VarIsNull ( FWbemObject.CSCreationClassName ) Then
         CSCreationClassName := String ( FWbemObject.CSCreationClassName ) ;
      If NOT VarIsNull ( FWbemObject.CSDVersion ) Then
         CSDVersion := String ( FWbemObject.CSDVersion ) ;
      If NOT VarIsNull ( FWbemObject.CSName ) Then
         CSName := String ( FWbemObject.CSName ) ;
      If NOT VarIsNull ( FWbemObject.CurrentTimeZone ) Then
         CurrentTimeZone := String ( FWbemObject.CurrentTimeZone ) ;
      If NOT VarIsNull ( FWbemObject.DataExecutionPrevention_32BitApplications ) Then
         DataExecutionPrevention_32BitApplications := String ( FWbemObject.DataExecutionPrevention_32BitApplications ) ;
      If NOT VarIsNull ( FWbemObject.DataExecutionPrevention_Available ) Then
         DataExecutionPrevention_Available := String ( FWbemObject.DataExecutionPrevention_Available ) ;
      If NOT VarIsNull ( FWbemObject.DataExecutionPrevention_Drivers ) Then
         DataExecutionPrevention_Drivers := String ( FWbemObject.DataExecutionPrevention_Drivers ) ;
      If NOT VarIsNull ( FWbemObject.DataExecutionPrevention_SupportPolicy ) Then
         DataExecutionPrevention_SupportPolicy := String ( FWbemObject.DataExecutionPrevention_SupportPolicy ) ;
{
      If NOT VarIsNull ( FWbemObject.Debug ) Then
         Debug := String ( FWbemObject.FWbemObject.Debug ) ;
}
      If NOT VarIsNull ( FWbemObject.Description ) Then
         Description := String ( FWbemObject.Description ) ;
      If NOT VarIsNull ( FWbemObject.Distributed ) Then
         Distributed := String ( FWbemObject.Distributed ) ;
      If NOT VarIsNull ( FWbemObject.EncryptionLevel ) Then
         EncryptionLevel := String ( FWbemObject.EncryptionLevel ) ;
      If NOT VarIsNull ( FWbemObject.ForegroundApplicationBoost ) Then
         ForegroundApplicationBoost := String ( FWbemObject.ForegroundApplicationBoost ) ;
      If NOT VarIsNull ( FWbemObject.FreePhysicalMemory ) Then
         FreePhysicalMemory := String ( FWbemObject.FreePhysicalMemory ) ;
      If NOT VarIsNull ( FWbemObject.FreeSpaceInPagingFiles ) Then
         FreeSpaceInPagingFiles := String ( FWbemObject.FreeSpaceInPagingFiles ) ;
      If NOT VarIsNull ( FWbemObject.FreeVirtualMemory ) Then
         FreeVirtualMemory := String ( FWbemObject.FreeVirtualMemory ) ;
      If NOT VarIsNull ( FWbemObject.InstallDate ) Then
         InstallDate := String ( FWbemObject.InstallDate ) ;
      If NOT VarIsNull ( FWbemObject.LargeSystemCache ) Then
         LargeSystemCache := String ( FWbemObject.LargeSystemCache ) ;
      If NOT VarIsNull ( FWbemObject.LastBootUpTime ) Then
         LastBootUpTime := String ( FWbemObject.LastBootUpTime ) ;
      If NOT VarIsNull ( FWbemObject.LocalDateTime ) Then
         LocalDateTime := String ( FWbemObject.LocalDateTime ) ;
      If NOT VarIsNull ( FWbemObject.Locale ) Then
         Locale := String ( FWbemObject.Locale ) ;
      If NOT VarIsNull ( FWbemObject.Manufacturer ) Then
         Manufacturer := String ( FWbemObject.Manufacturer ) ;
      If NOT VarIsNull ( FWbemObject.MaxNumberOfProcesses ) Then
         MaxNumberOfProcesses := String ( FWbemObject.MaxNumberOfProcesses ) ;
      If NOT VarIsNull ( FWbemObject.MaxProcessMemorySize ) Then
         MaxProcessMemorySize := String ( FWbemObject.MaxProcessMemorySize ) ;
      Try
      If NOT VarIsNull ( FWbemObject.MUILanguages ) Then
         MUILanguages := OLE_ARRAY_TO_STRING ( FWbemObject.MUILanguages ) ;
      Except
      End ;
      If NOT VarIsNull ( FWbemObject.Name ) Then
         Name := String ( FWbemObject.Name ) ;
      If NOT VarIsNull ( FWbemObject.NumberOfLicensedUsers ) Then
         NumberOfLicensedUsers := String ( FWbemObject.NumberOfLicensedUsers ) ;
      If NOT VarIsNull ( FWbemObject.NumberOfProcesses ) Then
         NumberOfProcesses := String ( FWbemObject.NumberOfProcesses ) ;
      If NOT VarIsNull ( FWbemObject.NumberOfUsers ) Then
         NumberOfUsers := String ( FWbemObject.NumberOfUsers ) ;
      Try
        If NOT VarIsNull ( FWbemObject.OperatingSystemSKU ) Then
           OperatingSystemSKU := String ( FWbemObject.OperatingSystemSKU ) ;
      Except
      End ;
      If NOT VarIsNull ( FWbemObject.Organization ) Then
         Organization := String ( FWbemObject.Organization ) ;
      Try
      If NOT VarIsNull ( FWbemObject.OSArchitecture ) Then
         OSArchitecture := String ( FWbemObject.OSArchitecture ) ;
      Except
      End ;
      If NOT VarIsNull ( FWbemObject.OSLanguage ) Then
         OSLanguage := String ( FWbemObject.OSLanguage ) ;
      If NOT VarIsNull ( FWbemObject.OSProductSuite ) Then
         OSProductSuite := String ( FWbemObject.OSProductSuite ) ;
      If NOT VarIsNull ( FWbemObject.OSType ) Then
         OSType := String ( FWbemObject.OSType ) ;
      If NOT VarIsNull ( FWbemObject.OtherTypeDescription ) Then
         OtherTypeDescription := String ( FWbemObject.OtherTypeDescription ) ;
      Try
      If NOT VarIsNull ( FWbemObject.PAEEnabled ) Then
         PAEEnabled := String ( FWbemObject.PAEEnabled ) ;
      Except
      End ;
      If NOT VarIsNull ( FWbemObject.PlusProductID ) Then
         PlusProductID := String ( FWbemObject.PlusProductID ) ;
      If NOT VarIsNull ( FWbemObject.PlusVersionNumber ) Then
         PlusVersionNumber := String ( FWbemObject.PlusVersionNumber ) ;
      Try
      If NOT VarIsNull ( FWbemObject.PortableOperatingSystem ) Then
         PortableOperatingSystem := String ( FWbemObject.PortableOperatingSystem ) ;
      Except
      End ;
      If NOT VarIsNull ( FWbemObject.Primary ) Then
         Primary := String ( FWbemObject.Primary ) ;
      If NOT VarIsNull ( FWbemObject.ProductType ) Then
         ProductType := String ( FWbemObject.ProductType ) ;
      If NOT VarIsNull ( FWbemObject.RegisteredUser ) Then
         RegisteredUser := String ( FWbemObject.RegisteredUser ) ;
      If NOT VarIsNull ( FWbemObject.SerialNumber ) Then
         SerialNumber := String ( FWbemObject.SerialNumber );
      If NOT VarIsNull ( FWbemObject.ServicePackMajorVersion ) Then
         ServicePackMajorVersion := String ( FWbemObject.ServicePackMajorVersion ) ;
      If NOT VarIsNull ( FWbemObject.ServicePackMinorVersion ) Then
         ServicePackMinorVersion := String ( FWbemObject.ServicePackMinorVersion ) ;
      If NOT VarIsNull ( FWbemObject.SizeStoredInPagingFiles ) Then
         SizeStoredInPagingFiles := String ( FWbemObject.SizeStoredInPagingFiles ) ;
      If NOT VarIsNull ( FWbemObject.Status ) Then
         Status := String ( FWbemObject.Status ) ;
      If NOT VarIsNull ( FWbemObject.SuiteMask ) Then
         SuiteMask := String ( FWbemObject.SuiteMask ) ;
      If NOT VarIsNull ( FWbemObject.SystemDevice ) Then
         SystemDevice := String ( FWbemObject.SystemDevice ) ;
      If NOT VarIsNull ( FWbemObject.SystemDirectory ) Then
         SystemDirectory := String ( FWbemObject.SystemDirectory ) ;
      If NOT VarIsNull ( FWbemObject.SystemDrive ) Then
         SystemDrive := String ( FWbemObject.SystemDrive ) ;
      If NOT VarIsNull ( FWbemObject.TotalSwapSpaceSize ) Then
         TotalSwapSpaceSize := String ( FWbemObject.TotalSwapSpaceSize ) ;
      If NOT VarIsNull ( FWbemObject.TotalVirtualMemorySize ) Then
         TotalVirtualMemorySize := String ( FWbemObject.TotalVirtualMemorySize ) ;
      If NOT VarIsNull ( FWbemObject.TotalVisibleMemorySize ) Then
         TotalVisibleMemorySize := String ( FWbemObject.TotalVisibleMemorySize ) ;
      If NOT VarIsNull ( FWbemObject.Version ) Then
         Version := String ( FWbemObject.Version )  ;
      If NOT VarIsNull ( FWbemObject.WindowsDirectory ) Then
         WindowsDirectory := String ( FWbemObject.WindowsDirectory ) ;
   End ;
   With Sup.Info_Windows Do Begin
      If NOT VarIsNull ( FWbemObject.LastBootUpTime ) Then
         DT_Boot := UtcToDateTime(FWbemObject.LastBootUpTime) ;
      If NOT VarIsNull ( FWbemObject.Caption ) Then
         Caption := String ( FWbemObject.Caption ) ;
      If NOT VarIsNull ( FWbemObject.Version ) Then
         Version := String ( FWbemObject.Version ) ;
      If NOT VarIsNull ( FWbemObject.BuildNumber ) Then
         BuildNumber := String ( FWbemObject.BuildNumber ) ;
      If NOT VarIsNull ( FWbemObject.BuildType ) Then
         BuildType := String ( FWbemObject.BuildType ) ;
      If NOT VarIsNull ( FWbemObject.CodeSet ) Then
         CodeSet := String ( FWbemObject.CodeSet ) ;
      If NOT VarIsNull ( FWbemObject.CountryCode ) Then
         CountryCode := String ( FWbemObject.CountryCode ) ;
      If NOT VarIsNull ( FWbemObject.BootDevice ) Then
         BootDevice := String ( FWbemObject.BootDevice ) ;
   End ;
End ;
End ;

Procedure GET_WINDOWS_INFO ;
Begin
Sup.Info_Windows.DT_Boot := 0 ;
Try
   CoInitialize(Nil) ;
   Try
      GetWin32_OperatingSystemInfo ;
   Finally
      CoUninitialize ;
   End ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception GET_WINDOWS_INFO ' + E.Classname + ':' + E.Message) ;
   End ;
End ;
End ;

Procedure info ( s1, s2: String ) ;
Begin
//LB_CPU_Info.Items.Add ( s1 + s2 + ' {' + IntToStr(Length(s2)) + '}' ) ;
//PUT_LOG ( s1 + ' ' + s2 ) ;
{
  if s1 <> '' then
  begin
    img_info.Canvas.Brush.Color := clblue;
    img_info.Canvas.Font.Color := clyellow;
    img_info.Canvas.TextOut(gn_text_x, gn_text_y, s1);
  end;
  if s2 <> '' then
  begin
    img_info.Canvas.Brush.Color := clblue;
    img_info.Canvas.Font.Color := clWhite;
    img_info.Canvas.TextOut(gn_text_x + img_info.Canvas.TextWidth(s1),
      gn_text_y, s2);
  end;
  Inc(gn_text_y, 13);
}
End ;

Procedure GET_CPU_INFO_2 ;
Var _eax  ,
    _ebx  ,
    _ecx  ,
    _edx  : Longword ;
    i     : Integer ;
    b     : Byte ;
    s     ,
    s1    ,
    s2    ,
    s3    ,
    s_all : String ;
Begin
// Set the startup colour of the image
//LB_CPU_Info.Items.Clear ;
//gn_text_y := 5 ; // position of the 1st text
Asm                // asm call to the CPUID inst.
  mov eax,0         // sub. func call
  db $0F,$A2         // db $0F,$A2 = CPUID instruction
  mov _ebx,ebx
  mov _ecx,ecx
  mov _edx,edx
End ;
For i := 0 To 3 Do Begin // extract vendor id
   b := lo(_ebx);
   s := s + chr(b);
   b := lo(_ecx);
   s1 := s1 + chr(b);
   b := lo(_edx);
   s2 := s2 + chr(b);
   _ebx := _ebx SHR 8;
   _ecx := _ecx SHR 8;
   _edx := _edx SHR 8;
End ;
info('CPU', '');
Sup.CPU_2.Vendor_ID := Trim(s) + Trim(s2) + Trim(s1) ;
info('   - ' + 'Vendor ID: ', Sup.CPU_2.Vendor_ID ) ;
Asm
   mov eax,1
   db $0F,$A2
   mov _eax,eax
   mov _ebx,ebx
   mov _ecx,ecx
   mov _edx,edx
End ;
// 06B1
// |0000| |0000 0000| |0000| |00| |00| |0110| |1011| |0001|
b := lo(_eax) AND 15;
Sup.CPU_2.Stepping_ID := IntToStr(b) ;
info('   - ' + 'Stepping ID: ', Sup.CPU_2.Stepping_ID ) ;
b := lo(_eax) SHR 4;
Sup.CPU_2.Model_Number := IntToHex(b, 1) ;
info('   - ' + 'Model Number: ', Sup.CPU_2.Model_Number ) ;
b := hi(_eax) AND 15;
Sup.CPU_2.Family_Code := IntToStr(b) ;
info('   - ' + 'Family Code: ', Sup.CPU_2.Family_Code ) ;
b := hi(_eax) SHR 4;
Sup.CPU_2.Processor_Type := IntToStr(b) ;
info('   - ' + 'Processor Type: ', Sup.CPU_2.Processor_Type ) ;
// 31.   28. 27.   24. 23.   20. 19.   16.
// 0 0 0 0   0 0 0 0   0 0 0 0   0 0 0 0
b := lo((_eax SHR 16)) AND 15;
Sup.CPU_2.Extended_Model := IntToStr(b) ;
info('   - ' + 'Extended Model: ', Sup.CPU_2.Extended_Model ) ;
b := lo((_eax SHR 20));
Sup.CPU_2.Extended_Family := IntToStr(b) ;
info('   - ' + 'Extended Family: ', Sup.CPU_2.Extended_Family ) ;
b := lo(_ebx);
Sup.CPU_2.Brand_ID := IntToStr(b) ;
info('   - ' + 'Brand ID: ', Sup.CPU_2.Brand_ID ) ;
b := hi(_ebx);
Sup.CPU_2.Chunks := IntToStr(b) ;
info('   - ' + 'Chunks: ', Sup.CPU_2.Chunks ) ;
b := lo(_ebx SHR 16);
Sup.CPU_2._Count := IntToStr(b) ;
info('   - ' + 'Count: ', Sup.CPU_2._Count ) ;
b := hi(_ebx SHR 16);
Sup.CPU_2.APIC_ID := IntToStr(b) ;
info('   - ' + 'APIC ID: ', Sup.CPU_2.APIC_ID ) ;
// Bit 18 =? 1     //is serial number enabled?
If (_edx AND $40000) = $40000 Then Begin
   info('   - ' + 'Serial Number ', 'Enabled') ;
   Sup.CPU_2.SN_Enabled := TRUE ;
End Else Begin
   info('   - ' + 'Serial Number ', 'Disabled');
   Sup.CPU_2.SN_Enabled := FALSE ;
End ;
s := IntToHex(_eax, 8);
Asm                  // determine the serial number
   mov eax,3
   db $0F,$A2
   mov _ecx,ecx
   mov _edx,edx
End ;
s1 := IntToHex(_edx, 8);
s2 := IntToHex(_ecx, 8);
Insert('-', s, 5);
Insert('-', s1, 5);
Insert('-', s2, 5);
Sup.CPU_2.SN_2 := Trim(s) + ', ' + Trim(s1) + ', ' + Trim(s2) ;
info('   - ' + 'Serial Number: ', Sup.CPU_2.SN_2 ) ;
Asm
   mov eax,1
   db $0F,$A2
   mov _edx,edx
End ;
info('', '');
// Bit 23 =? 1
If (_edx AND $800000) = $800000 Then Begin
   info('MMX ', 'Supported') ;
   Sup.CPU_2.MMX_Suportado := TRUE ;
End Else Begin
   info('MMX ', 'Not Supported');
   Sup.CPU_2.MMX_Suportado := FALSE ;
End ;
// Bit 24 =? 1
If (_edx AND $01000000) = $01000000 Then Begin
   info('FXSAVE & FXRSTOR Instructions ', 'Supported') ;
   Sup.CPU_2.FX_Instructions := TRUE ;
End else Begin
   info('FXSAVE & FXRSTOR Instructions Not ', 'Supported');
   Sup.CPU_2.FX_Instructions := FALSE ;
End ;
// Bit 25 =? 1
If (_edx AND $02000000) = $02000000 Then Begin
   info('SSE ', 'Supported') ;
   Sup.CPU_2.SSE := TRUE ;
End Else Begin
   info('SSE ', 'Not Supported');
   Sup.CPU_2.SSE := FALSE ;
End ;
// Bit 26 =? 1
If (_edx AND $04000000) = $04000000 Then Begin
   info('SSE2 ', 'Supported') ;
   Sup.CPU_2.SSE2 := TRUE ;
End Else Begin
   info('SSE2 ', 'Not Supported');
   Sup.CPU_2.SSE2 := FALSE ;
End ;
info('', '');
Asm     // execute the extended CPUID inst.
   mov eax,$80000000   // sub. func call
   db $0F,$A2
   mov _eax,eax
End ;
If _eax > $80000000 Then Begin // any other sub. funct avail. ?
   Sup.CPU_2.Extended_CPUID := TRUE ;
   info('Extended CPUID: ', 'Supported');
   Sup.CPU_2.Largest_Function := IntToStr(_eax - $80000000) ;
   info('   - Largest Function Supported: ', Sup.CPU_2.Largest_Function ) ;
   Asm     // get brand ID
      mov eax,$80000002
      db $0F
      db $A2
      mov _eax,eax
      mov _ebx,ebx
      mov _ecx,ecx
      mov _edx,edx
   End ;
   s := '';
   s1 := '';
   s2 := '';
   s3 := '';
   For i := 0 To 3 Do Begin
      b := lo(_eax);
      s3 := s3 + chr(b);
      b := lo(_ebx);
      s := s + chr(b);
      b := lo(_ecx);
      s1 := s1 + chr(b);
      b := lo(_edx);
      s2 := s2 + chr(b);
      _eax := _eax shr 8;
      _ebx := _ebx shr 8;
      _ecx := _ecx shr 8;
      _edx := _edx shr 8;
   End ;
   s_all := s3 + s + s1 + s2;
   Asm
      mov eax,$80000003
      db $0F
      db $A2
      mov _eax,eax
      mov _ebx,ebx
      mov _ecx,ecx
      mov _edx,edx
   End ;
   s := '';
   s1 := '';
   s2 := '';
   s3 := '';
   For i := 0 To 3 Do Begin
      b := lo(_eax);
      s3 := s3 + chr(b);
      b := lo(_ebx);
      s := s + chr(b);
      b := lo(_ecx);
      s1 := s1 + chr(b);
      b := lo(_edx);
      s2 := s2 + chr(b);
      _eax := _eax shr 8;
      _ebx := _ebx shr 8;
      _ecx := _ecx shr 8;
      _edx := _edx shr 8;
   End ;
   s_all := s_all + s3 + s + s1 + s2;
   Asm
      mov eax,$80000004
      db $0F
      db $A2
      mov _eax,eax
      mov _ebx,ebx
      mov _ecx,ecx
      mov _edx,edx
   End ;
   s := '';
   s1 := '';
   s2 := '';
   s3 := '';
   For i := 0 To 3 Do Begin
      b := lo(_eax);
      s3 := s3 + chr(b);
      b := lo(_ebx);
      s := s + chr(b);
      b := lo(_ecx);
      s1 := s1 + chr(b);
      b := lo(_edx);
      s2 := s2 + chr(b);
      _eax := _eax shr 8;
      _ebx := _ebx shr 8;
      _ecx := _ecx shr 8;
      _edx := _edx shr 8;
   End ;
   info('Brand String: ', '');
   If s2[Length(s2)] = #0 then Begin
      setlength(s2, Length(s2) - 1);
   End ;
   Sup.CPU_2.Brand_String := Trim(s_all) + Trim(s3) + Trim(s) + Trim(s1) + Trim(s2) ;
   info('', '   - ' + '[' + Sup.CPU_2.Brand_String + ']' );
End Else Begin
   info('   - Extended CPUID ', 'Not Supported.');
   Sup.CPU_2.Extended_CPUID := FALSE ;
   Sup.CPU_2.Largest_Function := '' ;
End ;
Sup.CPU_2.CPUType := CPUType ;
End ;

Procedure GetAntiVirusProductInfo ( Tipo : LongInt ; Var Reg : T_Anti_Virus ) ;
Const WbemUser            = '' ;
      WbemPassword        = '' ;
      WbemComputer        = 'localhost' ;
      wbemFlagForwardOnly = $00000020 ;
var FSWbemLocator : OLEVariant ;
    FWMIService   : OLEVariant ;
    FWbemObjectSet: OLEVariant ;
    FWbemObject   : OLEVariant ;
    oEnum         : IEnumvariant ;
    iValue        : LongWord ;
    _Tag          : String ;
Begin
Case Tipo Of
   1 : _Tag := 'root\SecurityCenter' ;
   2 : _Tag := 'root\SecurityCenter2' ;
   Else
      Exit ;
End ;
FSWbemLocator := CreateOleObject ( 'WbemScripting.SWbemLocator' ) ;
FWMIService := FSWbemLocator.ConnectServer ( WbemComputer, _Tag ,
                                             WbemUser, WbemPassword ) ;
FWbemObjectSet:= FWMIService.ExecQuery ( 'SELECT * FROM AntiVirusProduct',
                                         'WQL', wbemFlagForwardOnly ) ;
oEnum := IUnknown(FWbemObjectSet._NewEnum) AS IEnumVariant ;
Reg.displayName := 'INDEF' ;
Reg.instanceGuid := 'INDEF' ;
Reg.pathToSignedProductExe := 'INDEF' ;
Reg.productState := 'INDEF' ;
Reg.companyName := 'INDEF' ;
Reg.enableOnAccessUIMd5Hash := 'INDEF' ;
Reg.enableOnAccessUIParameters := 'INDEF' ;
Reg.onAccessScanningEnabled := 'INDEF' ;
Reg.pathToEnableOnAccessUI := 'INDEF' ;
Reg.pathToUpdateUI := 'INDEF' ;
Reg.productUptoDate := 'INDEF' ;
Reg.updateUIMd5Hash := 'INDEF' ;
Reg.updateUIParameters := 'INDEF' ;
Reg.versionNumber := 'INDEF' ;
While oEnum.Next(1, FWbemObject, iValue) = 0 Do Begin
   If NOT VarIsNull ( FWbemObject.displayName ) Then
      Reg.displayName := String(FWbemObject.displayName) ;
   If NOT VarIsNull ( FWbemObject.instanceGuid ) Then
      Reg.instanceGuid := String(FWbemObject.instanceGuid) ;
   If NOT VarIsNull ( FWbemObject.pathToSignedProductExe ) Then
      Reg.pathToSignedProductExe := String(FWbemObject.pathToSignedProductExe) ;
   If NOT VarIsNull ( FWbemObject.productState ) Then
      Reg.productState := Format ( '%d', [Integer(FWbemObject.productState)] ) ;
   If NOT VarIsNull ( FWbemObject.companyName ) Then
      Reg.companyName := String(FWbemObject.companyName) ;
   If NOT VarIsNull ( FWbemObject.enableOnAccessUIMd5Hash ) Then
      Reg.enableOnAccessUIMd5Hash := String(FWbemObject.enableOnAccessUIMd5Hash) ;
   If NOT VarIsNull ( FWbemObject.enableOnAccessUIParameters ) Then
      Reg.enableOnAccessUIParameters := String(FWbemObject.enableOnAccessUIParameters) ;
   If NOT VarIsNull ( FWbemObject.onAccessScanningEnabled ) Then
      Reg.onAccessScanningEnabled := String(FWbemObject.onAccessScanningEnabled) ;
   If NOT VarIsNull ( FWbemObject.pathToEnableOnAccessUI ) Then
      Reg.pathToEnableOnAccessUI := String(FWbemObject.pathToEnableOnAccessUI) ;
   If NOT VarIsNull ( FWbemObject.pathToUpdateUI ) Then
      Reg.pathToUpdateUI := String(FWbemObject.pathToUpdateUI) ;
   If NOT VarIsNull ( FWbemObject.productUptoDate ) Then
      Reg.productUptoDate := String(FWbemObject.productUptoDate) ;
   If NOT VarIsNull ( FWbemObject.updateUIMd5Hash ) Then
      Reg.updateUIMd5Hash := String(FWbemObject.updateUIMd5Hash) ;
   If NOT VarIsNull ( FWbemObject.updateUIParameters ) Then
      Reg.updateUIParameters := String(FWbemObject.updateUIParameters) ;
   If NOT VarIsNull ( FWbemObject.versionNumber ) Then
      Reg.versionNumber := String(FWbemObject.versionNumber) ;
   {
   xWriteln ( Format ( 'displayName                     %s',
                       [String(FWbemObject.displayName)] ) ) ; // String
   xWriteln ( Format ( 'instanceGuid                    %s',
                       [String(FWbemObject.instanceGuid)] ) ) ; // String
   xWriteln ( Format ( 'pathToSignedProductExe          %s',
                       [String(FWbemObject.pathToSignedProductExe)] ) ) ; // String
   xWriteln ( Format ( 'productState                    %d',
                       [Integer(FWbemObject.productState)] ) ) ; // Uint8
   xWriteln ('') ;
   }
   FWbemObject := Unassigned ;
End ;
End ;

Type TSecurityCenterProduct = ( AntiVirusProduct, AntiSpywareProduct, FirewallProduct ) ;
Const WmiRoot='root';
      WmiClassSCProduct     : Array [TSecurityCenterProduct] Of string =
                              ('AntiVirusProduct', 'AntiSpywareProduct', 'FirewallProduct') ;
      WmiNamespaceSCProduct : Array [Boolean] Of string =
                              ('SecurityCenter', 'SecurityCenter2') ;

Function VerSetConditionMask ( dwlConditionMask: int64;dwTypeBitMask: DWORD;
                               dwConditionMask: Byte) : int64; Stdcall; External kernel32 ;

{$IFDEF UNICODE}
Function VerifyVersionInfo ( var LPOSVERSIONINFOEX : OSVERSIONINFOEX;dwTypeMask: DWORD;
                             dwlConditionMask: int64): BOOL; Stdcall; External kernel32 name 'VerifyVersionInfoW';
{$ELSE}
Function VerifyVersionInfo ( var LPOSVERSIONINFOEX : OSVERSIONINFOEX;dwTypeMask: DWORD;
                             dwlConditionMask: int64): BOOL; Stdcall; External kernel32 name 'VerifyVersionInfoA';
{$ENDIF}

Procedure GetSCProductInfo ( SCProduct : TSecurityCenterProduct ) ;
Var FSWbemLocator  : OLEVariant ;
    FWMIService    : OLEVariant ;
    FWbemObjectSet : OLEVariant ;
    FWbemObject    : OLEVariant ;
    oEnum          : IEnumvariant ;
    iValue         : LongWord ;
    osVerInfo      : TOSVersionInfo ;
Begin
osVerInfo.dwOSVersionInfoSize := SizeOf ( TOSVersionInfo ) ;
GetVersionEx(osVerInfo) ;
If (SCProduct = AntiSpywareProduct) AND
   (osVerInfo.dwMajorVersion<6) Then Begin
   Exit ;
End ;
FSWbemLocator := CreateOleObject ( 'WbemScripting.SWbemLocator' ) ;
FWMIService := FSWbemLocator.ConnectServer( 'localhost',
               Format('%s\%s',[WmiRoot,WmiNamespaceSCProduct[osVerInfo.dwMajorVersion>=6]]),
               '', '') ;
FWbemObjectSet := FWMIService.ExecQuery ( Format( 'SELECT * FROM %s',
                                          [WmiClassSCProduct[SCProduct]]),'WQL',0 ) ;
oEnum := IUnknown(FWbemObjectSet._NewEnum) AS IEnumVariant ;
Case SCProduct Of
   AntiVirusProduct : Begin
      Sup.Anti_Virus.displayName := 'INDEF' ;
      Sup.Anti_Virus.instanceGuid := 'INDEF' ;
      Sup.Anti_Virus.pathToSignedProductExe := 'INDEF' ;
      Sup.Anti_Virus.pathToSignedReportingExe := 'INDEF' ;
      Sup.Anti_Virus.productState := 'INDEF' ;
      Sup.Anti_Virus.companyName := 'INDEF' ;
      Sup.Anti_Virus.enableOnAccessUIMd5Hash := 'INDEF' ;
      Sup.Anti_Virus.enableOnAccessUIParameters := 'INDEF' ;
      Sup.Anti_Virus.onAccessScanningEnabled := 'INDEF' ;
      Sup.Anti_Virus.pathToEnableOnAccessUI := 'INDEF' ;
      Sup.Anti_Virus.pathToUpdateUI := 'INDEF' ;
      Sup.Anti_Virus.productUptoDate := 'INDEF' ;
      Sup.Anti_Virus.updateUIMd5Hash := 'INDEF' ;
      Sup.Anti_Virus.updateUIParameters := 'INDEF' ;
      Sup.Anti_Virus.versionNumber := 'INDEF' ;
      End ;
   FirewallProduct : Begin
      Sup.FireWall.displayName := 'INDEF' ;
      Sup.FireWall.instanceGuid := 'INDEF' ;
      Sup.FireWall.pathToSignedProductExe := 'INDEF' ;
      Sup.FireWall.pathToSignedReportingExe := 'INDEF' ;
      Sup.FireWall.productState := 'INDEF' ;
      Sup.FireWall.companyName := 'INDEF' ;
      Sup.FireWall.enableOnAccessUIMd5Hash := 'INDEF' ;
      Sup.FireWall.enableOnAccessUIParameters := 'INDEF' ;
      Sup.FireWall.onAccessScanningEnabled := 'INDEF' ;
      Sup.FireWall.pathToEnableOnAccessUI := 'INDEF' ;
      Sup.FireWall.pathToUpdateUI := 'INDEF' ;
      Sup.FireWall.productUptoDate := 'INDEF' ;
      Sup.FireWall.updateUIMd5Hash := 'INDEF' ;
      Sup.FireWall.updateUIParameters := 'INDEF' ;
      Sup.FireWall.versionNumber := 'INDEF' ;
      End ;
   AntiSpywareProduct : Begin
      Sup.Spyware.displayName := 'INDEF' ;
      Sup.Spyware.instanceGuid := 'INDEF' ;
      Sup.Spyware.pathToSignedProductExe := 'INDEF' ;
      Sup.Spyware.pathToSignedReportingExe := 'INDEF' ;
      Sup.Spyware.productState := 'INDEF' ;
      Sup.Spyware.companyName := 'INDEF' ;
      Sup.Spyware.enableOnAccessUIMd5Hash := 'INDEF' ;
      Sup.Spyware.enableOnAccessUIParameters := 'INDEF' ;
      Sup.Spyware.onAccessScanningEnabled := 'INDEF' ;
      Sup.Spyware.pathToEnableOnAccessUI := 'INDEF' ;
      Sup.Spyware.pathToUpdateUI := 'INDEF' ;
      Sup.Spyware.productUptoDate := 'INDEF' ;
      Sup.Spyware.updateUIMd5Hash := 'INDEF' ;
      Sup.Spyware.updateUIParameters := 'INDEF' ;
      Sup.Spyware.versionNumber := 'INDEF' ;
      End ;
End ;

While oEnum.Next(1, FWbemObject, iValue) = 0 Do Begin
   If osVerInfo.dwMajorVersion >= 6 Then Begin //windows vista or newer
      Case SCProduct Of
         AntiVirusProduct : Begin
            If NOT VarIsNull ( FWbemObject.displayName ) Then
               Sup.Anti_Virus.displayName := String(FWbemObject.displayName) ;
            If NOT VarIsNull ( FWbemObject.instanceGuid ) Then
               Sup.Anti_Virus.instanceGuid := String(FWbemObject.instanceGuid) ;
            If NOT VarIsNull ( FWbemObject.pathToSignedProductExe ) Then
               Sup.Anti_Virus.pathToSignedProductExe := String(FWbemObject.pathToSignedProductExe) ;
            If NOT VarIsNull ( FWbemObject.pathToSignedReportingExe ) Then
               Sup.Anti_Virus.pathToSignedReportingExe := String(FWbemObject.pathToSignedReportingExe) ;
            If NOT VarIsNull ( FWbemObject.productState ) Then
               Sup.Anti_Virus.productState := Format ( '%d', [Integer(FWbemObject.productState)] ) ;
            End ;
         FirewallProduct : Begin
            If NOT VarIsNull ( FWbemObject.displayName ) Then
               Sup.Firewall.displayName := String(FWbemObject.displayName) ;
            If NOT VarIsNull ( FWbemObject.instanceGuid ) Then
               Sup.Firewall.instanceGuid := String(FWbemObject.instanceGuid) ;
            If NOT VarIsNull ( FWbemObject.pathToSignedProductExe ) Then
               Sup.Firewall.pathToSignedProductExe := String(FWbemObject.pathToSignedProductExe) ;
            If NOT VarIsNull ( FWbemObject.pathToSignedReportingExe ) Then
               Sup.Firewall.pathToSignedReportingExe := String(FWbemObject.pathToSignedReportingExe) ;
            If NOT VarIsNull ( FWbemObject.productState ) Then
               Sup.Firewall.productState := Format ( '%d', [Integer(FWbemObject.productState)] ) ;
            End ;
         AntiSpywareProduct : Begin
            If NOT VarIsNull ( FWbemObject.displayName ) Then
               Sup.SpyWare.displayName := String(FWbemObject.displayName) ;
            If NOT VarIsNull ( FWbemObject.instanceGuid ) Then
               Sup.SpyWare.instanceGuid := String(FWbemObject.instanceGuid) ;
            If NOT VarIsNull ( FWbemObject.pathToSignedProductExe ) Then
               Sup.SpyWare.pathToSignedProductExe := String(FWbemObject.pathToSignedProductExe) ;
            If NOT VarIsNull ( FWbemObject.pathToSignedReportingExe ) Then
               Sup.SpyWare.pathToSignedReportingExe := String(FWbemObject.pathToSignedReportingExe) ;
            If NOT VarIsNull ( FWbemObject.productState ) Then
               Sup.SpyWare.productState := Format ( '%d', [Integer(FWbemObject.productState)] ) ;
            End ;
      End ;
      //xxWriteln(Format('displayName                    %s',[FWbemObject.displayName]));// String
      //xxWriteln(Format('instanceGuid                   %s',[FWbemObject.instanceGuid]));// String
      //xxWriteln(Format('pathToSignedProductExe         %s',[FWbemObject.pathToSignedProductExe]));// String
      //xxWriteln(Format('pathToSignedReportingExe       %s',[FWbemObject.pathToSignedReportingExe]));// String
      //xxWriteln(Format('productState                   %s',[FWbemObject.productState]));// Uint32
   End Else Begin
      Case SCProduct Of
         AntiVirusProduct : Begin
            If NOT VarIsNull ( FWbemObject.displayName ) Then
               Sup.Anti_Virus.displayName := String(FWbemObject.displayName) ;
            If NOT VarIsNull ( FWbemObject.instanceGuid ) Then
               Sup.Anti_Virus.instanceGuid := String(FWbemObject.instanceGuid) ;
            If NOT VarIsNull ( FWbemObject.pathToSignedProductExe ) Then
               Sup.Anti_Virus.pathToSignedProductExe := String(FWbemObject.pathToSignedProductExe) ;
            If NOT VarIsNull ( FWbemObject.pathToSignedReportingExe ) Then
               Sup.Anti_Virus.pathToSignedReportingExe := String(FWbemObject.pathToSignedReportingExe) ;
            If NOT VarIsNull ( FWbemObject.productState ) Then
               Sup.Anti_Virus.productState := Format ( '%d', [Integer(FWbemObject.productState)] ) ;
            If NOT VarIsNull ( FWbemObject.companyName ) Then
               Sup.Anti_Virus.companyName := String(FWbemObject.companyName) ;
            If NOT VarIsNull ( FWbemObject.enableOnAccessUIMd5Hash )  Then
               Sup.Anti_Virus.enableOnAccessUIMd5Hash := String(FWbemObject.enableOnAccessUIMd5Hash) ;
            If NOT VarIsNull ( FWbemObject.enableOnAccessUIParameters ) Then
               Sup.Anti_Virus.enableOnAccessUIParameters := String(FWbemObject.enableOnAccessUIParameters) ;
            If NOT VarIsNull ( FWbemObject.onAccessScanningEnabled ) Then
               Sup.Anti_Virus.onAccessScanningEnabled := String(FWbemObject.onAccessScanningEnabled) ;
            If NOT VarIsNull ( FWbemObject.pathToEnableOnAccessUI ) Then
               Sup.Anti_Virus.pathToEnableOnAccessUI := String(FWbemObject.pathToEnableOnAccessUI) ;
            If NOT VarIsNull ( FWbemObject.pathToUpdateUI ) Then
               Sup.Anti_Virus.pathToUpdateUI := String(FWbemObject.pathToUpdateUI) ;
            If NOT VarIsNull ( FWbemObject.productUptoDate ) Then
               Sup.Anti_Virus.productUptoDate := String(FWbemObject.productUptoDate) ;
            If NOT VarIsNull ( FWbemObject.updateUIMd5Hash ) Then
               Sup.Anti_Virus.updateUIMd5Hash := String(FWbemObject.updateUIMd5Hash) ;
            If NOT VarIsNull ( FWbemObject.updateUIParameters ) Then
               Sup.Anti_Virus.updateUIParameters := String(FWbemObject.updateUIParameters) ;
            If NOT VarIsNull ( FWbemObject.versionNumber ) Then
               Sup.Anti_Virus.versionNumber := String(FWbemObject.versionNumber) ;
            {
            xxWriteln(Format('companyName                    %s',[FWbemObject.companyName]));// String
            xxWriteln(Format('displayName                    %s',[FWbemObject.displayName]));// String
            xxWriteln(Format('enableOnAccessUIMd5Hash        %s',[FWbemObject.enableOnAccessUIMd5Hash]));// Uint8
            xxWriteln(Format('enableOnAccessUIParameters     %s',[FWbemObject.enableOnAccessUIParameters]));// String
            xxWriteln(Format('instanceGuid                   %s',[FWbemObject.instanceGuid]));// String
            xxWriteln(Format('onAccessScanningEnabled        %s',[FWbemObject.onAccessScanningEnabled]));// Boolean
            xxWriteln(Format('pathToEnableOnAccessUI         %s',[FWbemObject.pathToEnableOnAccessUI]));// String
            xxWriteln(Format('pathToUpdateUI                 %s',[FWbemObject.pathToUpdateUI]));// String
            xxWriteln(Format('productUptoDate                %s',[FWbemObject.productUptoDate]));// Boolean
            xxWriteln(Format('updateUIMd5Hash                %s',[FWbemObject.updateUIMd5Hash]));// Uint8
            xxWriteln(Format('updateUIParameters             %s',[FWbemObject.updateUIParameters]));// String
            xxWriteln(Format('versionNumber                  %s',[FWbemObject.versionNumber]));// String
            }
            End ;
         FirewallProduct : Begin
            If NOT VarIsNull ( FWbemObject.displayName ) Then
               Sup.Firewall.displayName := String(FWbemObject.displayName) ;
            If NOT VarIsNull ( FWbemObject.instanceGuid ) Then
               Sup.Firewall.instanceGuid := String(FWbemObject.instanceGuid) ;
            If NOT VarIsNull ( FWbemObject.pathToSignedProductExe ) Then
               Sup.Firewall.pathToSignedProductExe := String(FWbemObject.pathToSignedProductExe) ;
            If NOT VarIsNull ( FWbemObject.productState ) Then
               Sup.Firewall.productState := Format ( '%d', [Integer(FWbemObject.productState)] ) ;
            If NOT VarIsNull ( FWbemObject.companyName ) Then
               Sup.Firewall.companyName := String(FWbemObject.companyName) ;
            If NOT VarIsNull ( FWbemObject.enableOnAccessUIMd5Hash ) Then
               Sup.Firewall.enableOnAccessUIMd5Hash := String(FWbemObject.enableOnAccessUIMd5Hash) ;
            If NOT VarIsNull ( FWbemObject.enableOnAccessUIParameters ) Then
               Sup.Firewall.enableOnAccessUIParameters := String(FWbemObject.enableOnAccessUIParameters) ;
            If NOT VarIsNull ( FWbemObject.onAccessScanningEnabled ) Then
               Sup.Firewall.onAccessScanningEnabled := String(FWbemObject.onAccessScanningEnabled) ;
            If NOT VarIsNull ( FWbemObject.pathToEnableOnAccessUI ) Then
               Sup.Firewall.pathToEnableOnAccessUI := String(FWbemObject.pathToEnableOnAccessUI) ;
            If NOT VarIsNull ( FWbemObject.pathToUpdateUI ) Then
               Sup.Firewall.pathToUpdateUI := String(FWbemObject.pathToUpdateUI) ;
            If NOT VarIsNull ( FWbemObject.productUptoDate ) Then
               Sup.Firewall.productUptoDate := String(FWbemObject.productUptoDate) ;
            If NOT VarIsNull ( FWbemObject.updateUIMd5Hash ) Then
               Sup.Firewall.updateUIMd5Hash := String(FWbemObject.updateUIMd5Hash) ;
            If NOT VarIsNull ( FWbemObject.updateUIParameters ) Then
               Sup.Firewall.updateUIParameters := String(FWbemObject.updateUIParameters) ;
            If NOT VarIsNull ( FWbemObject.versionNumber ) Then
               Sup.Firewall.versionNumber := String(FWbemObject.versionNumber) ;
            {
            xxWriteln(Format('companyName                    %s',[FWbemObject.companyName]));// String
            xxWriteln(Format('displayName                    %s',[FWbemObject.displayName]));// String
            xxWriteln(Format('enabled                        %s',[FWbemObject.enabled]));// Boolean
            xxWriteln(Format('enableUIMd5Hash                %s',[FWbemObject.enableUIMd5Hash]));// Uint8
            xxWriteln(Format('enableUIParameters             %s',[FWbemObject.enableUIParameters]));// String
            xxWriteln(Format('instanceGuid                   %s',[FWbemObject.instanceGuid]));// String
            xxWriteln(Format('pathToEnableUI                 %s',[FWbemObject.pathToEnableUI]));// String
            xxWriteln(Format('versionNumber                  %s',[FWbemObject.versionNumber]));// String
            }
            End ;
         AntiSpywareProduct : Begin
            If NOT VarIsNull ( FWbemObject.displayName ) Then
               Sup.Spyware.displayName := String(FWbemObject.displayName) ;
            If NOT VarIsNull ( FWbemObject.instanceGuid ) Then
               Sup.Spyware.instanceGuid := String(FWbemObject.instanceGuid) ;
            If NOT VarIsNull ( FWbemObject.pathToSignedProductExe ) Then
               Sup.Spyware.pathToSignedProductExe := String(FWbemObject.pathToSignedProductExe) ;
            If NOT VarIsNull ( FWbemObject.productState ) Then
               Sup.Spyware.productState := Format ( '%d', [Integer(FWbemObject.productState)] ) ;
            If NOT VarIsNull ( FWbemObject.companyName ) Then
               Sup.Spyware.companyName := String(FWbemObject.companyName) ;
            If NOT VarIsNull ( FWbemObject.enableOnAccessUIMd5Hash ) Then
               Sup.Spyware.enableOnAccessUIMd5Hash := String(FWbemObject.enableOnAccessUIMd5Hash) ;
            If NOT VarIsNull ( FWbemObject.enableOnAccessUIParameters ) Then
               Sup.Spyware.enableOnAccessUIParameters := String(FWbemObject.enableOnAccessUIParameters) ;
            If NOT VarIsNull ( FWbemObject.onAccessScanningEnabled ) Then
               Sup.Spyware.onAccessScanningEnabled := String(FWbemObject.onAccessScanningEnabled) ;
            If NOT VarIsNull ( FWbemObject.pathToEnableOnAccessUI ) Then
               Sup.Spyware.pathToEnableOnAccessUI := String(FWbemObject.pathToEnableOnAccessUI) ;
            If NOT VarIsNull ( FWbemObject.pathToUpdateUI ) Then
               Sup.Spyware.pathToUpdateUI := String(FWbemObject.pathToUpdateUI) ;
            If NOT VarIsNull ( FWbemObject.productUptoDate ) Then
               Sup.Spyware.productUptoDate := String(FWbemObject.productUptoDate) ;
            If NOT VarIsNull ( FWbemObject.updateUIMd5Hash ) Then
               Sup.Spyware.updateUIMd5Hash := String(FWbemObject.updateUIMd5Hash) ;
            If NOT VarIsNull ( FWbemObject.updateUIParameters ) Then
               Sup.Spyware.updateUIParameters := String(FWbemObject.updateUIParameters) ;
            If NOT VarIsNull ( FWbemObject.versionNumber ) Then
               Sup.Spyware.versionNumber := String(FWbemObject.versionNumber) ;
            {
            xxWriteln(Format('companyName                    %s',[FWbemObject.companyName]));// String
            xxWriteln(Format('displayName                    %s',[FWbemObject.displayName]));// String
            xxWriteln(Format('enabled                        %s',[FWbemObject.enabled]));// Boolean
            xxWriteln(Format('enableUIMd5Hash                %s',[FWbemObject.enableUIMd5Hash]));// Uint8
            xxWriteln(Format('enableUIParameters             %s',[FWbemObject.enableUIParameters]));// String
            xxWriteln(Format('instanceGuid                   %s',[FWbemObject.instanceGuid]));// String
            xxWriteln(Format('pathToEnableUI                 %s',[FWbemObject.pathToEnableUI]));// String
            xxWriteln(Format('versionNumber                  %s',[FWbemObject.versionNumber]));// String
            }
            End ;
      End ;
   End ;
   //xxWriteln ('') ;
   FWbemObject := Unassigned ;
End ;
End ;

Procedure GET_WINDOWS_INSTALL_DATE ;
Const wbemFlagForwardOnly = $00000020 ;
Var FSWbemLocator  : OLEVariant ;
    FWMIService    : OLEVariant ;
    FWbemObjectSet : OLEVariant ;
    FWbemObject    : OLEVariant ;
    oEnum          : IEnumvariant ;
    iValue         : LongWord ;
    FWbemDateObj   : OleVariant ;
    DT             : TDateTime ;
Begin
FWbemDateObj := CreateOleObject('WbemScripting.SWbemDateTime') ;
FSWbemLocator := CreateOleObject('WbemScripting.SWbemLocator') ;
FWMIService := FSWbemLocator.ConnectServer('localhost', 'root\CIMV2', '', '') ;
FWbemObjectSet := FWMIService.ExecQuery ( 'SELECT InstallDate FROM Win32_OperatingSystem',
                                          'WQL', wbemFlagForwardOnly ) ;
oEnum := IUnknown(FWbemObjectSet._NewEnum) AS IEnumVariant ;
Sup.Info_Windows.DT_Install := 'INDEF' ;
If oEnum.Next(1, FWbemObject, iValue) = 0 Then Begin
   If NOT VarIsNull ( FWbemObject.InstallDate ) Then Begin
      FWbemDateObj.Value := FWbemObject.InstallDate ;
      DT := FWbemDateObj.GetVarDate ;
      Sup.Info_Windows.DT_Install := DateTimeToStr ( DT ) ;
      //Writeln ( Format ( 'InstallDate %s', [FormatDateTime('dd mmm yyyy', DT)] ) ) ;
   End ;
   FWbemObject := Unassigned ;
End ;
End ;

Procedure GET_WINDOWS_PASSWORD_SCREENSAVER_ENABLED ;
Const wbemFlagForwardOnly = $00000020 ;
Var FSWbemLocator  : OLEVariant ;
    FWMIService    : OLEVariant ;
    FWbemObjectSet : OLEVariant ;
    FWbemObject    : OLEVariant ;
    oEnum          : IEnumvariant ;
    iValue         : LongWord ;
Begin
FSWbemLocator := CreateOleObject ( 'WbemScripting.SWbemLocator' ) ;
FWMIService := FSWbemLocator.ConnectServer('localhost', 'root\CIMV2', '', '' ) ;
FWbemObjectSet := FWMIService.ExecQuery ( 'SELECT ScreenSaverSecure FROM Win32_Desktop',
                                          'WQL',wbemFlagForwardOnly ) ;
oEnum := IUnknown(FWbemObjectSet._NewEnum) AS IEnumVariant ;
Sup.Info_Windows.PassScreenSaverEnabled := 'INDEF/1' ;
If oEnum.Next(1, FWbemObject, iValue) = 0 Then Begin
   If NOT VarIsNull(FWbemObject.ScreenSaverSecure) Then Begin
      Sup.Info_Windows.PassScreenSaverEnabled := String(FWbemObject.ScreenSaverSecure) ;
      //xxWriteln ( Format ( 'ScreenSaverSecure  %s', [String(FWbemObject.ScreenSaverSecure)]) ) ;// Boolean
   End Else Begin
      Sup.Info_Windows.PassScreenSaverEnabled := 'INDEF/2' ;
   End ;
   FWbemObject := Unassigned ;
End ;
End ;

Procedure GET_WINDOWS_APPS_AUTOEXEC ;
const
  wbemFlagForwardOnly = $00000020;
var
  FSWbemLocator : OLEVariant;
  FWMIService   : OLEVariant;
  FWbemObjectSet: OLEVariant;
  FWbemObject   : OLEVariant;
  oEnum         : IEnumvariant;
  iValue        : LongWord;
begin;
  FSWbemLocator := CreateOleObject('WbemScripting.SWbemLocator');
  FWMIService   := FSWbemLocator.ConnectServer('localhost', 'root\CIMV2', '', '');
  FWbemObjectSet:= FWMIService.ExecQuery('SELECT * FROM Win32_StartupCommand','WQL',wbemFlagForwardOnly);
  oEnum         := IUnknown(FWbemObjectSet._NewEnum) as IEnumVariant;
SetLength ( Sup.Info_Windows.Autoexec, 0 ) ;
While oEnum.Next(1, FWbemObject, iValue) = 0 do
  begin
    SetLength ( Sup.Info_Windows.Autoexec, Length ( Sup.Info_Windows.Autoexec ) + 1 ) ;
    With Sup.Info_Windows.Autoexec [ Length ( Sup.Info_Windows.Autoexec ) - 1 ] Do Begin
       If NOT VarIsNull ( FWbemObject.Command ) Then
          Command := String(FWbemObject.Command) ;
       If NOT VarIsNull ( FWbemObject.Description ) Then
          Description := String(FWbemObject.Description) ;
       If NOT VarIsNull ( FWbemObject.Location ) Then
          Location := String(FWbemObject.Location) ;
       If NOT VarIsNull ( FWbemObject.Name ) Then
          Name := String(FWbemObject.Name) ;
       If NOT VarIsNull ( FWbemObject.User ) Then
          User := String(FWbemObject.User) ;
       //Writeln(Format('Command     %s',[String(FWbemObject.Command)]));
       //Writeln(Format('Description %s',[String(FWbemObject.Description)]));
       //Writeln(Format('Location    %s',[String(FWbemObject.Location)]));
       //Writeln(Format('Name        %s',[String(FWbemObject.Name)]));
       //Writeln(Format('User        %s',[String(FWbemObject.User)]));
       If NOT VarIsNull(FWbemObject.SettingID) Then Begin
          SettingID := String(FWbemObject.SettingID) ;
          //Writeln(Format('SettingID   %s',[String(FWbemObject.SettingID)]));
       End Else Begin
          SettingID := 'INDEF' ;
       End ;
    End ;
    FWbemObject:=Unassigned;
  end;
end;

Procedure GET_WINDOWS_SERVICE_PACK ;
Const wbemFlagForwardOnly = $00000020 ;
Var FSWbemLocator  : OLEVariant ;
    FWMIService    : OLEVariant ;
    FWbemObjectSet : OLEVariant ;
    FWbemObject    : OLEVariant ;
    oEnum          : IEnumvariant ;
    iValue         : LongWord ;
Begin
FSWbemLocator := CreateOleObject ( 'WbemScripting.SWbemLocator' ) ;
FWMIService := FSWbemLocator.ConnectServer('localhost', 'root\CIMV2', '', '' ) ;
FWbemObjectSet:= FWMIService.ExecQuery (
                 'SELECT ServicePackMajorVersion,ServicePackMinorVersion FROM Win32_OperatingSystem',
                 'WQL',wbemFlagForwardOnly ) ;
oEnum := IUnknown(FWbemObjectSet._NewEnum) AS IEnumVariant ;
Sup.Info_Windows.Service_Pack := 'INDEF' ;
If oEnum.Next(1, FWbemObject, iValue) = 0 Then begin
   If NOT VarIsNull ( FWbemObject.ServicePackMajorVersion ) AND
      NOT VarIsNull ( FWbemObject.ServicePackMinorVersion ) Then
      Sup.Info_Windows.Service_Pack := Format ( '%d.%d',
                         [Integer(FWbemObject.ServicePackMajorVersion),
                         Integer(FWbemObject.ServicePackMinorVersion)] ) ;
   //xxWriteln ( Format ( 'ServicePack  %d.%d',
   //                     [Integer(FWbemObject.ServicePackMajorVersion),
   //                     Integer(FWbemObject.ServicePackMinorVersion)] ) ) ;
   FWbemObject := Unassigned ;
End ;
End ;

procedure GET_WINDOWS_FOLDER ;
Const wbemFlagForwardOnly = $00000020;
var FSWbemLocator : OLEVariant;
    FWMIService   : OLEVariant;
    FWbemObjectSet: OLEVariant;
    FWbemObject   : OLEVariant;
    oEnum         : IEnumvariant;
    iValue        : LongWord;
Begin
FSWbemLocator := CreateOleObject('WbemScripting.SWbemLocator');
FWMIService := FSWbemLocator.ConnectServer('localhost', 'root\CIMV2', '', '');
FWbemObjectSet:= FWMIService.ExecQuery('SELECT WindowsDirectory  FROM Win32_OperatingSystem','WQL',wbemFlagForwardOnly);
oEnum := IUnknown(FWbemObjectSet._NewEnum) as IEnumVariant;
Sup.Info_Windows.Folder := 'INDEF' ;
If oEnum.Next(1, FWbemObject, iValue) = 0 Then Begin
   Sup.Info_Windows.Folder := String(FWbemObject.WindowsDirectory) ;
   //xxWriteln ( Format ( 'Windows Path %s',[String(FWbemObject.WindowsDirectory)]));
   FWbemObject := Unassigned ;
End ;
End ;

Procedure GET_WINDOWS_SOUND_DEVICES ;
Const wbemFlagForwardOnly = $00000020 ;
Var FSWbemLocator  : OLEVariant ;
    FWMIService    : OLEVariant ;
    FWbemObjectSet : OLEVariant ;
    FWbemObject    : OLEVariant ;
    oEnum          : IEnumvariant ;
    iValue         : LongWord ;
Begin
FSWbemLocator := CreateOleObject ( 'WbemScripting.SWbemLocator' ) ;
FWMIService   := FSWbemLocator.ConnectServer('localhost', 'root\CIMV2', '', '' ) ;
FWbemObjectSet:= FWMIService.ExecQuery ( 'SELECT *  FROM Win32_SoundDevice',
                                         'WQL', wbemFlagForwardOnly ) ;
oEnum := IUnknown(FWbemObjectSet._NewEnum) AS IEnumVariant ;
SetLength ( Sup.Info_Windows.Win32_SoundDevice, 0 ) ;
While oEnum.Next(1, FWbemObject, iValue) = 0 Do Begin
   SetLength ( Sup.Info_Windows.Win32_SoundDevice, Length ( Sup.Info_Windows.Win32_SoundDevice ) + 1 ) ;
   With Sup.Info_Windows.Win32_SoundDevice [ Length ( Sup.Info_Windows.Win32_SoundDevice ) - 1 ] Do Begin
      If NOT VarIsNull ( FWbemObject.Availability ) Then
         Availability := String(FWbemObject.Availability) ;
      If NOT VarIsNull ( FWbemObject.Caption ) Then
         Caption := String(FWbemObject.Caption) ;
      If NOT VarIsNull ( FWbemObject.ConfigManagerErrorCode ) Then
         ConfigManagerErrorCode := String(FWbemObject.ConfigManagerErrorCode) ;
      If NOT VarIsNull ( FWbemObject.ConfigManagerUserConfig ) Then
         ConfigManagerUserConfig := String(FWbemObject.ConfigManagerUserConfig) ;
      If NOT VarIsNull ( FWbemObject.CreationClassName ) Then
         CreationClassName := String(FWbemObject.CreationClassName) ;
      If NOT VarIsNull ( FWbemObject.Description ) Then
         Description := String(FWbemObject.Description) ;
      If NOT VarIsNull ( FWbemObject.DeviceID ) Then
         DeviceID := String(FWbemObject.DeviceID) ;
      If NOT VarIsNull ( FWbemObject.DMABufferSize ) Then
         DMABufferSize := String(FWbemObject.DMABufferSize) ;
      If NOT VarIsNull ( FWbemObject.ErrorCleared ) Then
         ErrorCleared := String(FWbemObject.ErrorCleared) ;
      If NOT VarIsNull ( FWbemObject.ErrorDescription ) Then
         ErrorDescription := String(FWbemObject.ErrorDescription) ;
      If NOT VarIsNull ( FWbemObject.InstallDate ) Then
         InstallDate := String(FWbemObject.InstallDate) ;
      If NOT VarIsNull ( FWbemObject.LastErrorCode ) Then
         LastErrorCode := String(FWbemObject.LastErrorCode) ;
      If NOT VarIsNull ( FWbemObject.Manufacturer ) Then
         Manufacturer := String(FWbemObject.Manufacturer) ;
      If NOT VarIsNull ( FWbemObject.MPU401Address ) Then
         MPU401Address := String(FWbemObject.MPU401Address) ;
      If NOT VarIsNull ( FWbemObject.Name ) Then
         Name := String(FWbemObject.Name) ;
      If NOT VarIsNull ( FWbemObject.PNPDeviceID ) Then
         PNPDeviceID := String(FWbemObject.PNPDeviceID) ;
      If NOT VarIsNull ( FWbemObject.PowerManagementCapabilities ) Then
         PowerManagementCapabilitiesMT := OLE_ARRAY_TO_STRING ( FWbemObject.PowerManagementCapabilities ) ;
      If NOT VarIsNull ( FWbemObject.PowerManagementSupported ) Then
         PowerManagementSupported := String(FWbemObject.PowerManagementSupported) ;
      If NOT VarIsNull ( FWbemObject.ProductName ) Then
         ProductName := String(FWbemObject.ProductName) ;
      If NOT VarIsNull ( FWbemObject.Status ) Then
         Status := String(FWbemObject.Status) ;
      If NOT VarIsNull ( FWbemObject.StatusInfo ) Then
         StatusInfo := String(FWbemObject.StatusInfo) ;
      If NOT VarIsNull ( FWbemObject.SystemCreationClassName ) Then
         SystemCreationClassName := String(FWbemObject.SystemCreationClassName) ;
      If NOT VarIsNull ( FWbemObject.SystemName ) Then
         SystemName := String(FWbemObject.SystemName) ;
   End ;
   FWbemObject := Unassigned ;
End ;
End ;

Procedure GET_WINDOWS_COM_PORTS ;
Const wbemFlagForwardOnly = $00000020 ;
Var FSWbemLocator  : OLEVariant ;
    FWMIService    : OLEVariant ;
    FWbemObjectSet : OLEVariant ;
    FWbemObject    : OLEVariant ;
    oEnum          : IEnumvariant ;
    iValue         : LongWord ;
Begin
FSWbemLocator := CreateOleObject ( 'WbemScripting.SWbemLocator' ) ;
FWMIService   := FSWbemLocator.ConnectServer('localhost', 'root\CIMV2', '', '' ) ;
FWbemObjectSet:= FWMIService.ExecQuery ( 'SELECT *  FROM Win32_SerialPort',
                                         'WQL', wbemFlagForwardOnly ) ;
oEnum := IUnknown(FWbemObjectSet._NewEnum) AS IEnumVariant ;
SetLength ( Sup.Info_Windows.Win32_SerialPort, 0 ) ;
While oEnum.Next(1, FWbemObject, iValue) = 0 Do Begin
   SetLength ( Sup.Info_Windows.Win32_SerialPort, Length ( Sup.Info_Windows.Win32_SerialPort ) + 1 ) ;
   With Sup.Info_Windows.Win32_SerialPort [ Length ( Sup.Info_Windows.Win32_SerialPort ) - 1 ] Do Begin
      If NOT VarIsNull ( FWbemObject.Availability ) Then
         Availability := String(FWbemObject.Availability) ;
      If NOT VarIsNull ( FWbemObject.CapabilitiesMT ) Then
         CapabilitiesMT := OLE_ARRAY_TO_STRING ( FWbemObject.CapabilitiesMT ) ;
      If NOT VarIsNull ( FWbemObject.CapabilityDescriptionsMT ) Then
         CapabilityDescriptionsMT := OLE_ARRAY_TO_STRING ( FWbemObject.CapabilityDescriptionsMT ) ;
      If NOT VarIsNull ( FWbemObject.Caption ) Then
         Caption := String(FWbemObject.Caption) ;
      If NOT VarIsNull ( FWbemObject.ConfigManagerErrorCode ) Then
         ConfigManagerErrorCode := String(FWbemObject.ConfigManagerErrorCode) ;
      If NOT VarIsNull ( FWbemObject.ConfigManagerUserConfig ) Then
         ConfigManagerUserConfig := String(FWbemObject.ConfigManagerUserConfig) ;
      If NOT VarIsNull ( FWbemObject.CreationClassName ) Then
         CreationClassName := String(FWbemObject.CreationClassName) ;
      If NOT VarIsNull ( FWbemObject.Description ) Then
         Description := String(FWbemObject.Description) ;
      If NOT VarIsNull ( FWbemObject.DeviceID ) Then
         DeviceID := String(FWbemObject.DeviceID) ;
      If NOT VarIsNull ( FWbemObject.ErrorCleared ) Then
         ErrorCleared := String(FWbemObject.ErrorCleared) ;
      If NOT VarIsNull ( FWbemObject.ErrorDescription ) Then
         ErrorDescription := String(FWbemObject.ErrorDescription) ;
      If NOT VarIsNull ( FWbemObject.LastErrorCode ) Then
         LastErrorCode := String(FWbemObject.LastErrorCode) ;
      If NOT VarIsNull ( FWbemObject.MaxBaudRate ) Then
         MaxBaudRate := String(FWbemObject.MaxBaudRate) ;
      If NOT VarIsNull ( FWbemObject.MaximumInputBufferSize ) Then
         MaximumInputBufferSize := String(FWbemObject.MaximumInputBufferSize) ;
      If NOT VarIsNull ( FWbemObject.MaximumOutputBufferSize ) Then
         MaximumOutputBufferSize := String(FWbemObject.MaximumOutputBufferSize) ;
      If NOT VarIsNull ( FWbemObject.MaxNumberControlled ) Then
         MaxNumberControlled := String(FWbemObject.MaxNumberControlled) ;
      If NOT VarIsNull ( FWbemObject.Name ) Then
         Name := String(FWbemObject.Name) ;
      If NOT VarIsNull ( FWbemObject.OSAutoDiscovered ) Then
         OSAutoDiscovered := String(FWbemObject.OSAutoDiscovered) ;
      If NOT VarIsNull ( FWbemObject.PNPDeviceID ) Then
         PNPDeviceID := String(FWbemObject.PNPDeviceID) ;
      If NOT VarIsNull ( FWbemObject.PowerManagementCapabilitiesMT ) Then
         PowerManagementCapabilitiesMT := OLE_ARRAY_TO_STRING ( FWbemObject.PowerManagementCapabilitiesMT) ;
      If NOT VarIsNull ( FWbemObject.PowerManagementSupported ) Then
         PowerManagementSupported := String(FWbemObject.PowerManagementSupported) ;
      If NOT VarIsNull ( FWbemObject.ProtocolSupported ) Then
         ProtocolSupported := String(FWbemObject.ProtocolSupported) ;
      If NOT VarIsNull ( FWbemObject.ProviderType ) Then
         ProviderType := String(FWbemObject.ProviderType) ;
      If NOT VarIsNull ( FWbemObject.SettableBaudRate ) Then
         SettableBaudRate := String(FWbemObject.SettableBaudRate) ;
      If NOT VarIsNull ( FWbemObject.SettableDataBits ) Then
         SettableDataBits := String(FWbemObject.SettableDataBits) ;
      If NOT VarIsNull ( FWbemObject.SettableFlowControl ) Then
         SettableFlowControl := String(FWbemObject.SettableFlowControl) ;
      If NOT VarIsNull ( FWbemObject.SettableParity ) Then
         SettableParity := String(FWbemObject.SettableParity) ;
      If NOT VarIsNull ( FWbemObject.SettableParityCheck ) Then
         SettableParityCheck := String(FWbemObject.SettableParityCheck) ;
      If NOT VarIsNull ( FWbemObject.SettableRLSD ) Then
         SettableRLSD := String(FWbemObject.SettableRLSD) ;
      If NOT VarIsNull ( FWbemObject.SettableStopBits ) Then
         SettableStopBits := String(FWbemObject.SettableStopBits) ;
      If NOT VarIsNull ( FWbemObject.Status ) Then
         Status := String(FWbemObject.Status) ;
      If NOT VarIsNull ( FWbemObject.StatusInfo ) Then
         StatusInfo := String(FWbemObject.StatusInfo) ;
      If NOT VarIsNull ( FWbemObject.Supports16BitMode ) Then
         Supports16BitMode := String(FWbemObject.Supports16BitMode) ;
      If NOT VarIsNull ( FWbemObject.SupportsDTRDSR ) Then
         SupportsDTRDSR := String(FWbemObject.SupportsDTRDSR) ;
      If NOT VarIsNull ( FWbemObject.SupportsElapsedTimeouts ) Then
         SupportsElapsedTimeouts := String(FWbemObject.SupportsElapsedTimeouts) ;
      If NOT VarIsNull ( FWbemObject.SupportsIntTimeouts ) Then
         SupportsIntTimeouts := String(FWbemObject.SupportsIntTimeouts) ;
      If NOT VarIsNull ( FWbemObject.SupportsParityCheck ) Then
         SupportsParityCheck := String(FWbemObject.SupportsParityCheck) ;
      If NOT VarIsNull ( FWbemObject.SupportsRLSD ) Then
         SupportsRLSD := String(FWbemObject.SupportsRLSD) ;
      If NOT VarIsNull ( FWbemObject.SupportsRTSCTS ) Then
         SupportsRTSCTS := String(FWbemObject.SupportsRTSCTS) ;
      If NOT VarIsNull ( FWbemObject.SupportsSpecialCharacters ) Then
         SupportsSpecialCharacters := String(FWbemObject.SupportsSpecialCharacters) ;
      If NOT VarIsNull ( FWbemObject.SupportsXOnXOff ) Then
         SupportsXOnXOff := String(FWbemObject.SupportsXOnXOff) ;
      If NOT VarIsNull ( FWbemObject.SupportsXOnXOffSet ) Then
         SupportsXOnXOffSet := String(FWbemObject.SupportsXOnXOffSet) ;
      If NOT VarIsNull ( FWbemObject.SystemCreationClassName ) Then
         SystemCreationClassName := String(FWbemObject.SystemCreationClassName) ;
      If NOT VarIsNull ( FWbemObject.SystemName ) Then
         SystemName := String(FWbemObject.SystemName) ;
      If NOT VarIsNull ( FWbemObject.TimeOfLastReset ) Then
         TimeOfLastReset := String(FWbemObject.TimeOfLastReset) ;
   End ;
   FWbemObject := Unassigned ;
End ;
End ;

Procedure GET_WINDOWS_HOTFIXES ;
Const wbemFlagForwardOnly = $00000020 ;
Var FSWbemLocator  : OLEVariant ;
    FWMIService    : OLEVariant ;
    FWbemObjectSet : OLEVariant ;
    FWbemObject    : OLEVariant ;
    oEnum          : IEnumvariant ;
    iValue         : LongWord ;
Begin
FSWbemLocator := CreateOleObject ( 'WbemScripting.SWbemLocator' ) ;
FWMIService   := FSWbemLocator.ConnectServer('localhost', 'root\CIMV2', '', '' ) ;
FWbemObjectSet:= FWMIService.ExecQuery ( 'SELECT Description,HotFixID  FROM Win32_QuickFixEngineering',
                                         'WQL', wbemFlagForwardOnly ) ;
oEnum := IUnknown(FWbemObjectSet._NewEnum) AS IEnumVariant ;
SetLength ( Sup.Info_Windows.HotFix, 0 ) ;
While oEnum.Next(1, FWbemObject, iValue) = 0 Do Begin
   SetLength ( Sup.Info_Windows.HotFix, Length ( Sup.Info_Windows.HotFix ) + 1 ) ;
   With Sup.Info_Windows.HotFix [ Length ( Sup.Info_Windows.HotFix ) - 1 ] Do Begin
      If NOT VarIsNull ( FWbemObject.HotFixID ) Then
         ID := String(FWbemObject.HotFixID) ;
      If NOT VarIsNull ( FWbemObject.Description ) Then
         Description := String(FWbemObject.Description) ;
   End ;
   //Writeln ( Format ( 'HotFix %s', [String(FWbemObject.HotFixID)]) ) ;
   //Writeln ( Format ( 'Description %s', [String(FWbemObject.Description)] ) ) ;
   FWbemObject := Unassigned ;
End ;
End ;

Procedure GET_WINDOWS_DEVICES_NOT_WORK_EXCLAMACAO ;
Const wbemFlagForwardOnly = $00000020 ;
Var FSWbemLocator  : OLEVariant ;
    FWMIService    : OLEVariant ;
    FWbemObjectSet : OLEVariant ;
    FWbemObject    : OLEVariant ;
    oEnum          : IEnumvariant ;
    iValue         : LongWord ;
Begin
FSWbemLocator := CreateOleObject ( 'WbemScripting.SWbemLocator' ) ;
FWMIService := FSWbemLocator.ConnectServer('localhost', 'root\cimv2', '', '' ) ;
FWbemObjectSet := FWMIService.ExecQuery ( 'SELECT * FROM  Win32_PnPEntity WHERE ConfigManagerErrorCode <> 0',
                                          'WQL',wbemFlagForwardOnly ) ;
oEnum := IUnknown(FWbemObjectSet._NewEnum) AS IEnumVariant ;
SetLength ( Sup.Info_Windows.Devices_NOK, 0 ) ;
While oEnum.Next(1, FWbemObject, iValue) = 0 Do Begin
   SetLength ( Sup.Info_Windows.Devices_NOK, Length ( Sup.Info_Windows.Devices_NOK ) + 1 ) ;
   With Sup.Info_Windows.Devices_NOK [ Length ( Sup.Info_Windows.Devices_NOK ) - 1 ] Do Begin
      If NOT VarIsNull ( FWbemObject.ClassGUID ) Then
         ClassGUID := String(FWbemObject.ClassGUID) ;
      If NOT VarIsNull ( FWbemObject.Description ) Then
         Description := String(FWbemObject.Description) ;
      If NOT VarIsNull ( FWbemObject.DeviceID ) Then
         DeviceID := String(FWbemObject.DeviceID) ;
      If NOT VarIsNull ( FWbemObject.Manufacturer ) Then
         Manufacturer := String(FWbemObject.Manufacturer) ;
      If NOT VarIsNull ( FWbemObject.Name ) Then
         Name := String(FWbemObject.Name) ;
      If NOT VarIsNull ( FWbemObject.PNPDeviceID ) Then
         PNPDeviceID := String(FWbemObject.PNPDeviceID) ;
      //xxWriteln ( Format ( 'Class GUID %s', [String(FWbemObject.ClassGUID)] ) ) ;
      //xxWriteln ( Format ( 'Description %s', [String(FWbemObject.Description)] ) ) ;
      //xxWriteln ( Format ( 'Device ID %s', [String(FWbemObject.DeviceID)] ) ) ;
      //xxWriteln ( Format ( 'Manufacturer %s', [String(FWbemObject.Manufacturer)] ) ) ;
      //xxWriteln ( Format ( 'Name %s', [String(FWbemObject.Name)] ) ) ;
      //xxWriteln ( Format ( 'PNP Device ID %s', [String(FWbemObject.PNPDeviceID)] ) );
      //xxWriteln ( '') ;
      FWbemObject := Unassigned ;
   End ;
End ;
End ;

Procedure GET_WINDOWS_POINT_DEVICES ;
Const wbemFlagForwardOnly = $00000020 ;
Var FSWbemLocator  : OLEVariant ;
    FWMIService    : OLEVariant ;
    FWbemObjectSet : OLEVariant ;
    FWbemObject    : OLEVariant ;
    oEnum          : IEnumvariant ;
    iValue         : LongWord ;
Begin
FSWbemLocator := CreateOleObject ( 'WbemScripting.SWbemLocator' ) ;
FWMIService   := FSWbemLocator.ConnectServer('localhost', 'root\CIMV2', '', '' ) ;
FWbemObjectSet:= FWMIService.ExecQuery ( 'SELECT *  FROM Win32_PointingDevice',
                                         'WQL', wbemFlagForwardOnly ) ;
oEnum := IUnknown(FWbemObjectSet._NewEnum) AS IEnumVariant ;
SetLength ( Sup.Info_Windows.Pointing, 0 ) ;
While oEnum.Next(1, FWbemObject, iValue) = 0 Do Begin
   SetLength ( Sup.Info_Windows.Pointing, Length ( Sup.Info_Windows.Pointing ) + 1 ) ;
   With Sup.Info_Windows.Pointing [ Length ( Sup.Info_Windows.Pointing ) - 1 ] Do Begin
      If NOT VarIsNull ( FWbemObject.Description) Then
         Description := String(FWbemObject.Description ) ;
      If NOT VarIsNull ( FWbemObject.DeviceID ) Then
         DeviceID := String(FWbemObject.DeviceID ) ;
      If NOT VarIsNull ( FWbemObject.DeviceInterface ) Then
         DeviceInterface := String(FWbemObject.DeviceInterface ) ;
      If NOT VarIsNull ( FWbemObject.DoubleSpeedThreshold ) Then
         DoubleSpeedThreshold := String(FWbemObject.DoubleSpeedThreshold ) ;
      If NOT VarIsNull ( FWbemObject.Handedness ) Then
         Handedness := String(FWbemObject.Handedness ) ;
      If NOT VarIsNull ( FWbemObject.HardwareType ) Then
         HardwareType := String(FWbemObject.HardwareType ) ;
      //If NOT VarIsNull ( FWbemObject.IniFileName ) Then
      //   InfFileName := String(FWbemObject.IniFileName ) ;
      If NOT VarIsNull ( FWbemObject.InfSection ) Then
         InfSection := String(FWbemObject.InfSection ) ;
      If NOT VarIsNull ( FWbemObject.Manufacturer ) Then
         Manufacturer := String(FWbemObject.Manufacturer ) ;
      If NOT VarIsNull ( FWbemObject.Name ) Then
         Name := String(FWbemObject.Name ) ;
      If NOT VarIsNull ( FWbemObject.NumberOfButtons ) Then
         NumberOfButtons := String(FWbemObject.NumberOfButtons ) ;
      If NOT VarIsNull ( FWbemObject.PNPDeviceID ) Then
         PNPDeviceID := String(FWbemObject.PNPDeviceID ) ;
      If NOT VarIsNull ( FWbemObject.PointingType ) Then
         PointingType := String(FWbemObject.PointingType ) ;
      If NOT VarIsNull ( FWbemObject.QuadSpeedThreshold ) Then
         QuadSpeedThreshold := String(FWbemObject.QuadSpeedThreshold ) ;
      If NOT VarIsNull ( FWbemObject.Resolution ) Then
         Resolution := String(FWbemObject.Resolution ) ;
      If NOT VarIsNull ( FWbemObject.SampleRate ) Then
         SampleRate := String(FWbemObject.SampleRate ) ;
      If NOT VarIsNull ( FWbemObject.Synch ) Then
         Synch := String(FWbemObject.Synch ) ;
   FWbemObject := Unassigned ;
   End ;
End ;
End ;

(*
Procedure GET_WINDOWS_LOGICAL_DISK ( Var _Log : String ) ;
Const wbemFlagForwardOnly = $00000020 ;
Var FSWbemLocator  : OLEVariant ;
    FWMIService    : OLEVariant ;
    FWbemObjectSet : OLEVariant ;
    FWbemObject    : OLEVariant ;
    oEnum          : IEnumvariant ;
    iValue         : LongWord ;
    Drive          : String ;
    Qtde           : LongInt ;
    Indice         : LongInt ;
    Local          : LongInt ;
Begin
//PUT_LOG ( 'INI/a GET WINDOWS_LOGICAL_DISK' ) ;
Qtde := 0 ;
_Log := _Log + '============================' + sLineBreak ;
_Log := _Log + '  GET_WINDOWS_LOGICAL_DISK' + sLineBreak ;
_Log := _Log + '============================' + sLineBreak ;
FSWbemLocator := CreateOleObject ( 'WbemScripting.SWbemLocator' ) ;
FWMIService   := FSWbemLocator.ConnectServer('localhost', 'root\CIMV2', '', '' ) ;
FWbemObjectSet:= FWMIService.ExecQuery ( 'SELECT * FROM Win32_logicaldisk',
                                         'WQL', wbemFlagForwardOnly ) ;
oEnum := IUnknown(FWbemObjectSet._NewEnum) AS IEnumVariant ;
For Local := 1 To 26 Do Begin
   With Sup.Win32_LogicalDisk [ Local ] Do Begin
      Ativo_Old := Ativo_Atual ;
      Ativo_Atual := FALSE ;
   End ;
End ;
While oEnum.Next(1, FWbemObject, iValue) = 0 Do Begin
   If NOT VarIsNull ( FWbemObject.DeviceID ) Then Begin
      Drive := UpperCase ( String(FWbemObject.DeviceID ) ) ;
   End Else Begin
      _Log := _Log + 'CONT 1 ' + TimeToStr ( Now ) + sLineBreak ;
      Continue ;
   End ;
   If Drive = '' Then Begin
      _Log := _Log + 'CONT 2 ' + TimeToStr ( Now ) + sLineBreak ;
      Continue ;
   End ;
   Inc ( Qtde ) ;
   //PUT_LOG ( 'DRIVE [' + Drive + ']' ) ;
   Indice := Ord ( Drive[1] ) - 64 ;
   With Sup.Win32_LogicalDisk [ Indice ] Do Begin
      Ativo_Atual := TRUE ;
      If NOT VarIsNull ( FWbemObject.Access) Then
         Access := String(FWbemObject.Access ) ;
      If NOT VarIsNull ( FWbemObject.Availability ) Then
         Availability := String(FWbemObject.Availability ) ;
      If NOT VarIsNull ( FWbemObject.BlockSize ) Then
         BlockSize := String(FWbemObject.BlockSize ) ;
      If NOT VarIsNull ( FWbemObject.Caption ) Then
         Caption := String(FWbemObject.Caption ) ;
      If NOT VarIsNull ( FWbemObject.Compressed ) Then
         Compressed := String(FWbemObject.Compressed ) ;
      If NOT VarIsNull ( FWbemObject.ConfigManagerErrorCode ) Then
         ConfigManagerErrorCode := String(FWbemObject.ConfigManagerErrorCode ) ;
      If NOT VarIsNull ( FWbemObject.ConfigManagerUserConfig ) Then
         ConfigManagerUserConfig := String(FWbemObject.ConfigManagerUserConfig ) ;
      If NOT VarIsNull ( FWbemObject.CreationClassName ) Then
         CreationClassName := String(FWbemObject.CreationClassName ) ;
      If NOT VarIsNull ( FWbemObject.Description ) Then
         Description := String(FWbemObject.Description ) ;
      If NOT VarIsNull ( FWbemObject.DeviceID ) Then
         DeviceID := String(FWbemObject.DeviceID ) ;
      If NOT VarIsNull ( FWbemObject.DriveType ) Then
         DriveType := Integer(FWbemObject.DriveType ) ;
      If NOT VarIsNull ( FWbemObject.ErrorCleared ) Then
         ErrorCleared := String(FWbemObject.ErrorCleared ) ;
      If NOT VarIsNull ( FWbemObject.ErrorDescription ) Then
         ErrorDescription := String(FWbemObject.ErrorDescription ) ;
      If NOT VarIsNull ( FWbemObject.ErrorMethodology ) Then
         ErrorMethodology := String(FWbemObject.ErrorMethodology ) ;
      If NOT VarIsNull ( FWbemObject.FileSystem ) Then
         FileSystem := String(FWbemObject.FileSystem ) ;
      If NOT VarIsNull ( FWbemObject.FreeSpace ) Then
         FreeSpace := Int64(FWbemObject.FreeSpace ) ;
      If NOT VarIsNull ( FWbemObject.InstallDate ) Then
         InstallDate := String(FWbemObject.InstallDate ) ;
      If NOT VarIsNull ( FWbemObject.LastErrorCode ) Then
         LastErrorCode := String(FWbemObject.LastErrorCode ) ;
      If NOT VarIsNull ( FWbemObject.MaximumComponentLength ) Then
         MaximumComponentLength := String(FWbemObject.MaximumComponentLength ) ;
      If NOT VarIsNull ( FWbemObject.MediaType ) Then
         MediaType := String(FWbemObject.MediaType ) ;
      If NOT VarIsNull ( FWbemObject.Name ) Then
         Name := String(FWbemObject.Name ) ;
      If NOT VarIsNull ( FWbemObject.NumberOfBlocks ) Then
         NumberOfBlocks := String(FWbemObject.NumberOfBlocks ) ;
      If NOT VarIsNull ( FWbemObject.PNPDeviceID ) Then
         PNPDeviceID := String(FWbemObject.PNPDeviceID ) ;
      If NOT VarIsNull ( FWbemObject.PowerManagementCapabilities ) Then
         PowerManagementCapabilities := OLE_ARRAY_TO_STRING ( FWbemObject.PowerManagementCapabilities ) ;
      If NOT VarIsNull ( FWbemObject.PowerManagementSupported ) Then
         PowerManagementSupported := String(FWbemObject.PowerManagementSupported ) ;
      If NOT VarIsNull ( FWbemObject.ProviderName ) Then
         ProviderName := String(FWbemObject.ProviderName ) ;
      If NOT VarIsNull ( FWbemObject.Purpose ) Then
         Purpose := String(FWbemObject.Purpose ) ;
      If NOT VarIsNull ( FWbemObject.QuotasDisabled ) Then
         QuotasDisabled := String(FWbemObject.QuotasDisabled ) ;
      If NOT VarIsNull ( FWbemObject.QuotasIncomplete ) Then
         QuotasIncomplete := String(FWbemObject.QuotasIncomplete ) ;
      If NOT VarIsNull ( FWbemObject.QuotasRebuilding ) Then
         QuotasRebuilding := String(FWbemObject.QuotasRebuilding ) ;
      If NOT VarIsNull ( FWbemObject.Size ) Then
         Size := Int64(FWbemObject.Size ) ;
      If NOT VarIsNull ( FWbemObject.Status ) Then
         Status := String(FWbemObject.Status ) ;
      If NOT VarIsNull ( FWbemObject.StatusInfo ) Then
         StatusInfo := String(FWbemObject.StatusInfo ) ;
      If NOT VarIsNull ( FWbemObject.SupportsDiskQuotas ) Then
         SupportsDiskQuotas := String(FWbemObject.SupportsDiskQuotas ) ;
      If NOT VarIsNull ( FWbemObject.SupportsFileBasedCompression ) Then
         SupportsFileBasedCompression := String(FWbemObject.SupportsFileBasedCompression ) ;
      If NOT VarIsNull ( FWbemObject.SystemCreationClassName ) Then
         SystemCreationClassName := String(FWbemObject.SystemCreationClassName ) ;
      If NOT VarIsNull ( FWbemObject.SystemName ) Then
         SystemName := String(FWbemObject.SystemName ) ;
      If NOT VarIsNull ( FWbemObject.VolumeDirty ) Then
         VolumeDirty := String(FWbemObject.VolumeDirty ) ;
      If NOT VarIsNull ( FWbemObject.VolumeName ) Then
         VolumeName := String(FWbemObject.VolumeName ) ;
      If NOT VarIsNull ( FWbemObject.VolumeSerialNumber ) Then
         VolumeSerialNumber := String(FWbemObject.VolumeSerialNumber ) ;
      FWbemObject := Unassigned ;
      _Log := _Log + TimeToStr ( Now ) + ' LOGICAL ' + DeviceId + ' ' +
              IntToStr(Size DIV 1024 DIV 1024 ) + ' ' +
              FileSystem + sLineBreak ;
   End ;
End ;
For Local := 1 To 26 Do Begin
   With Sup.Win32_LogicalDisk [ Local ] Do Begin
      If NOT Ativo_Atual Then Begin
         Size := 0 ;
         FreeSpace := 0 ;
      End ;
   End ;
End ;
//PUT_LOG ( 'FIM GET WINDOWS_LOGICAL_DISK (Qtde=' + IntToStr(Qtde) + ']' ) ;
End ;
*)

Procedure GET_WINDOWS_VOLUME ( Var _Log : String ) ;
Const wbemFlagForwardOnly = $00000020 ;
Var FSWbemLocator  : OLEVariant ;
    FWMIService    : OLEVariant ;
    FWbemObjectSet : OLEVariant ;
    FWbemObject    : OLEVariant ;
    oEnum          : IEnumvariant ;
    iValue         : LongWord ;
    Drive          : String ;
    //Qtde           : LongInt ;
    Indice         : LongInt ;
    Local          : LongInt ;
Begin
//PUT_LOG ( 'INI/a GET WINDOWS_LOGICAL_DISK' ) ;
//Qtde := 0 ;
_Log := _Log + '============================' + sLineBreak ;
_Log := _Log + '     GET WINDOWS VOLUME' + sLineBreak ;
_Log := _Log + '============================' + sLineBreak ;
FSWbemLocator := CreateOleObject ( 'WbemScripting.SWbemLocator' ) ;
FWMIService := FSWbemLocator.ConnectServer('localhost', 'root\CIMV2', '', '' ) ;
FWbemObjectSet:= FWMIService.ExecQuery ( 'SELECT * FROM Win32_Volume',
                                         'WQL', wbemFlagForwardOnly ) ;
oEnum := IUnknown(FWbemObjectSet._NewEnum) AS IEnumVariant ;
For Local := 1 To 26 Do Begin
   With Sup.Win32_Volume [ Local ] Do Begin
      Ativo_Old := Ativo_Atual ;
      Ativo_Atual := FALSE ;
   End ;
End ;
While oEnum.Next(1, FWbemObject, iValue) = 0 Do Begin
   If NOT VarIsNull ( FWbemObject.DriveLetter ) Then Begin
      Drive := UpperCase ( String(FWbemObject.DriveLetter ) ) ;
      _Log := _Log + 'OK 1 DRIVE ' + Drive + ' ' + TimeToStr ( Now ) + sLineBreak ;
   End Else Begin
      _Log := _Log + 'CONT 1 ' + TimeToStr ( Now ) + sLineBreak ;
      Continue ;
   End ;
   If Drive = '' Then Begin
      _Log := _Log + 'CONT 2 ' + TimeToStr ( Now ) + sLineBreak ;
      Continue ;
   End ;
   //Inc ( Qtde ) ;
   //PUT_LOG ( 'DRIVE [' + Drive + ']' ) ;
   Indice := Ord ( Drive[1] ) - 64 ;
   With Sup.Win32_Volume [ Indice ] Do Begin
      Ativo_Atual := TRUE ;
      Inc ( Cnt_WMI ) ;
      If NOT VarIsNull ( FWbemObject.Access) Then
         Access := String(FWbemObject.Access ) ;
      If NOT VarIsNull ( FWbemObject.Automount) Then
         Automount := String(FWbemObject.Automount ) ;
      If NOT VarIsNull ( FWbemObject.Availability) Then
         Availability := String(FWbemObject.Availability ) ;
      If NOT VarIsNull ( FWbemObject.BlockSize) Then Begin
         BlockSize := String(FWbemObject.BlockSize ) ;
      End Else Begin
         BlockSize := '' ;
      End ;
      If NOT VarIsNull ( FWbemObject.Capacity) Then Begin
         Capacity := Int64(FWbemObject.Capacity ) ;
      End Else Begin
         Capacity := 0 ;
      End ;
      If NOT VarIsNull ( FWbemObject.Caption) Then Begin
         Caption := String(FWbemObject.Caption ) ;
      End Else Begin
         Caption := '-' ;
      End ;
      If NOT VarIsNull ( FWbemObject.Compressed) Then
         Compressed := Boolean(FWbemObject.Compressed ) ;
      If NOT VarIsNull ( FWbemObject.ConfigManagerErrorCode) Then
         ConfigManagerErrorCode := String(FWbemObject.ConfigManagerErrorCode ) ;
      If NOT VarIsNull ( FWbemObject.ConfigManagerUserConfig) Then
         ConfigManagerUserConfig := String(FWbemObject.ConfigManagerUserConfig ) ;
      If NOT VarIsNull ( FWbemObject.CreationClassName) Then
         CreationClassName := String(FWbemObject.CreationClassName ) ;
      If NOT VarIsNull ( FWbemObject.Description) Then
         Description := String(FWbemObject.Description ) ;
      If NOT VarIsNull ( FWbemObject.DeviceID) Then Begin
         DeviceID := String(FWbemObject.DeviceID ) ;
      End Else Begin
         DeviceID := '' ;
      End ;
      If NOT VarIsNull ( FWbemObject.DirtyBitSet) Then
         DirtyBitSet := Boolean ( FWbemObject.DirtyBitSet ) ;
      If NOT VarIsNull ( FWbemObject.DriveLetter) Then Begin
         DriveLetter := String(FWbemObject.DriveLetter ) ;
      End Else Begin
         DriveLetter := '' ;
      End ;
      If NOT VarIsNull ( FWbemObject.DriveType) Then
         DriveType := LongInt(FWbemObject.DriveType ) ;
      If NOT VarIsNull ( FWbemObject.ErrorCleared) Then
         ErrorCleared := String(FWbemObject.ErrorCleared ) ;
      If NOT VarIsNull ( FWbemObject.ErrorDescription) Then
         ErrorDescription := String(FWbemObject.ErrorDescription ) ;
      If NOT VarIsNull ( FWbemObject.ErrorMethodology) Then
         ErrorMethodology := String(FWbemObject.ErrorMethodology ) ;
      If NOT VarIsNull ( FWbemObject.FileSystem) Then Begin
         FileSystem := String(FWbemObject.FileSystem ) ;
      End Else Begin
         FileSystem := '-' ;
      End ;
      If NOT VarIsNull ( FWbemObject.FreeSpace) Then Begin
         FreeSpace := Int64(FWbemObject.FreeSpace ) ;
      End Else Begin
         FreeSpace := 0 ;
      End ;
      If NOT VarIsNull ( FWbemObject.IndexingEnabled) Then
         IndexingEnabled := Boolean(FWbemObject.IndexingEnabled ) ;
      If NOT VarIsNull ( FWbemObject.InstallDate) Then Begin
         InstallDate := TDateTime(FWbemObject.InstallDate ) ;
      End Else Begin
         InstallDate := StrToDateTime ( '01/06/1972' ) ;
      End ;
      If NOT VarIsNull ( FWbemObject.Label) Then Begin
         _Label := String(FWbemObject.Label ) ;
      End Else Begin
         _Label := '' ;
      End ;
      If NOT VarIsNull ( FWbemObject.LastErrorCode) Then
         LastErrorCode := String(FWbemObject.LastErrorCode ) ;
      If NOT VarIsNull ( FWbemObject.MaximumFileNameLength) Then
         MaximumFileNameLength := String(FWbemObject.MaximumFileNameLength ) ;
      If NOT VarIsNull ( FWbemObject.Name) Then
         Name := String(FWbemObject.Name ) ;
      If NOT VarIsNull ( FWbemObject.NumberOfBlocks) Then
         NumberOfBlocks := String(FWbemObject.NumberOfBlocks ) ;
      If NOT VarIsNull ( FWbemObject.PNPDeviceID) Then
         PNPDeviceID := String(FWbemObject.PNPDeviceID ) ;
      //If NOT VarIsNull ( FWbemObject.PowerManagementCapabilities_AR) Then
      //   PowerManagementCapabilities_AR := OLE_ARRAY_TO_STRING(FWbemObject.PowerManagementCapabilities_AR ) ;
      If NOT VarIsNull ( FWbemObject.PowerManagementSupported) Then
         PowerManagementSupported := String(FWbemObject.PowerManagementSupported ) ;
      If NOT VarIsNull ( FWbemObject.Purpose) Then
         Purpose := String(FWbemObject.Purpose ) ;
      If NOT VarIsNull ( FWbemObject.QuotasEnabled) Then
         QuotasEnabled := String(FWbemObject.QuotasEnabled ) ;
      If NOT VarIsNull ( FWbemObject.QuotasIncomplete) Then
         QuotasIncomplete := String(FWbemObject.QuotasIncomplete ) ;
      If NOT VarIsNull ( FWbemObject.QuotasRebuilding) Then
         QuotasRebuilding := String(FWbemObject.QuotasRebuilding ) ;
      If NOT VarIsNull ( FWbemObject.Status) Then
         Status := String(FWbemObject.Status ) ;
      If NOT VarIsNull ( FWbemObject.StatusInfo) Then
         StatusInfo := String(FWbemObject.StatusInfo ) ;
      If NOT VarIsNull ( FWbemObject.SystemCreationClassName) Then
         SystemCreationClassName := String(FWbemObject.SystemCreationClassName ) ;
      If NOT VarIsNull ( FWbemObject.SystemName) Then
         SystemName := String(FWbemObject.SystemName ) ;
      If NOT VarIsNull ( FWbemObject.SerialNumber) Then Begin
         SerialNumberDisk := Cardinal(FWbemObject.SerialNumber ) ;
      End Else Begin
         SerialNumberDisk := 0 ;
      End ;
      Tipo_Drive := GET_DRIVE_TYPE ( DriveLetter, DriveType ) ;
      If NOT VarIsNull ( FWbemObject.SupportsDiskQuotas) Then
         SupportsDiskQuotas := String(FWbemObject.SupportsDiskQuotas ) ;
      If NOT VarIsNull ( FWbemObject.SupportsFileBasedCompression) Then
         SupportsFileBasedCompression := String(FWbemObject.SupportsFileBasedCompression ) ;
      FWbemObject := Unassigned ;
      _Log := _Log + TimeToStr ( Now ) + ' VOLUME ' +
              _Label + ' '  + ' ' +
              FileSystem + ' ' +
              IntToStr(Capacity DIV 1024 DIV 1024 ) + ' ' +
              FileSystem + sLineBreak ;
   End ;
End ;
For Local := 1 To 26 Do Begin
   With Sup.Win32_Volume [ Local ] Do Begin
      If Ativo_Atual Then Begin
         If ( Capacity = 0 ) AND ( Capacity_Old > 0 ) Then Begin
            Flag_Midia_Removida := TRUE ;
         End ;
         If ( Tipo_Drive = 'P2' ) AND ( Tipo_Drive_Old <> 'P2' ) Then Begin
            Flag_Midia_Inserida := DriveLetter ;
            PUT_LOG ( 'SETANDO FLAG Midia_Inserida / ' + DriveLetter + ' / Indice ' + IntToStr ( Indice ) ) ;
         End ;
         Capacity_Old := Capacity ;
         Tipo_Drive_Old := Tipo_Drive ;
      End Else Begin
         If Drive_Selecionado = DriveLetter Then Begin
            Flag_Midia_Removida := TRUE ;
         End ;
         Capacity := 0 ;
         Capacity_Old := 0 ;
         FreeSpace := 0 ;
         Tipo_Drive := '' ;
         Tipo_Drive_Old := '' ;
      End ;
   End ;
End ;
//PUT_LOG ( 'FIM GET WINDOWS_LOGICAL_DISK (Qtde=' + IntToStr(Qtde) + ']' ) ;
End ;

Procedure TASK_GET_WINDOWS_PROCESS ;
Const wbemFlagForwardOnly = $00000020 ;
Var FSWbemLocator2   : OLEVariant ;
    FWMIService2     : OLEVariant ;
    FWbemObjectSet2  : OLEVariant ;
    FWbemObject2     : OLEVariant ;
    oEnum2           : IEnumvariant ;
    iValue2          : LongWord ;
    LOOP_WMI_STR     : String ;
    LOOP_WMI_TXT     : String ;
    P2_SERVER_STR_1  : String ;
    P2_SERVER_TXT_1  : String ;
    P2_SERVER_STR_2  : String ;
    P2_SERVER_TXT_2  : String ;
    Query            : String ;
    _Str             : String ;
    Log_Ok           : Boolean ;
    _Caption         : String ;
    _CommandLine     : String ;
Begin
If FLAG_GET_WINDOWS_PROCESS Then Begin
   PUT_LOG ( 'EXIT CONFLITO FLAG TASK/GET/WINDOWS_PROCESS' ) ;
   Exit ;
End ;
FLAG_GET_WINDOWS_PROCESS := TRUE ;
_Debug ( 'INI TASK_GET WINDOWS_PROCESS/1' ) ;
//PUT_LOG ( 'INIT TASK_GET WINDOWS_PROCESS' ) ;
P2_SERVER_TXT_1 := 'P2SERVER.EXE' ;
P2_SERVER_TXT_2 := 'P2SERVER.EXE' ;
LOOP_WMI_TXT := 'LOOP_WMI.BAT' ;
SL_WindowsProcess.Clear ;
_Debug ( '1 TASK_GET WINDOWS_PROCESS/1' ) ;
Try
   Try
      _Debug ( '2 TASK_GET WINDOWS_PROCESS/1' ) ;
      CoInitialize(Nil) ;
      _Debug ( '2a1 TASK_GET WINDOWS_PROCESS/1' ) ;
      FSWbemLocator2 := CreateOleObject ( 'WbemScripting.SWbemLocator' ) ;
      _Debug ( '2a2 TASK_GET WINDOWS_PROCESS/1' ) ;
      FWMIService2 := FSWbemLocator2.ConnectServer( 'localhost', 'root\CIMV2', '', '' ) ;
      _Debug ( '2a3 TASK_GET WINDOWS_PROCESS/1' ) ;
      Query := 'SELECT Caption,CommandLine FROM Win32_Process' ;
      _Debug ( '2a4 TASK_GET WINDOWS_PROCESS/1' ) ;
      FWbemObjectSet2 := FWMIService2.ExecQuery ( Query, 'WQL', wbemFlagForwardOnly ) ;
      _Debug ( '2b TASK_GET WINDOWS_PROCESS/1' ) ;
      oEnum2 := IUnknown(FWbemObjectSet2._NewEnum) AS IEnumVariant ;
      _Debug ( '2c TASK_GET WINDOWS_PROCESS/1' ) ;
      //SetLength ( Sup.Info_Windows.Win32_Process, 0 ) ;
      LOOP_WMI_RUNNING := FALSE ;
      LOOP_WMI_STR := '' ;
      _Debug ( '2d TASK_GET WINDOWS_PROCESS/1' ) ;
      P2_SERVER_RUNNING_1 := FALSE ;
      P2_SERVER_RUNNING_2 := FALSE ;
      P2_SERVER_STR_1 := '' ;
      P2_SERVER_STR_2 := '' ;
      _Debug ( '3 TASK_GET WINDOWS_PROCESS/1' ) ;
      While oEnum2.Next(1, FWbemObject2, iValue2) = 0 Do Begin
         //SetLength ( Sup.Info_Windows.Win32_Process, Length ( Sup.Info_Windows.Win32_Process ) + 1 ) ;
         //With Sup.Info_Windows.Win32_Process [ Length ( Sup.Info_Windows.Win32_Process ) - 1 ] Do Begin
            _Str := '' ;
            If NOT VarIsNull ( FWbemObject2.Caption) Then Begin
               _Caption := String(FWbemObject2.Caption ) ;
            End Else Begin
               _Caption := '' ;
            End ;
            If NOT VarIsNull ( FWbemObject2.CommandLine) Then Begin
               _CommandLine := String(FWbemObject2.CommandLine ) ;
            End Else Begin
               _CommandLine := '' ;
            End ;
            _Str := _Str + '[' + _Caption + '][' + _CommandLine + ']' ;
            Log_Ok := TRUE ;
            If ( _Caption = 'svchost.exe' ) AND ( _CommandLine = '' ) Then Begin
               Log_Ok := FALSE  ;
            End ;
            If Log_Ok Then Begin
               SL_WindowsProcess.Add ( _Str ) ;
            End ;
            If ( Pos ( P2_SERVER_TXT_1, UpperCase(_Caption) ) > 0 ) OR
               ( Pos ( P2_SERVER_TXT_1, UpperCase(_CommandLine) ) > 0 ) Then Begin
               //Cnt_NOK_APP_P2_SERVER := 0 ;
               P2_SERVER_RUNNING_1 := TRUE ;
               P2_SERVER_STR_1 := P2_SERVER_STR_1 + '[' + _Caption + '][' + _CommandLine + ']' + sLineBreak ;
               //PUT_LOG ( 'WIN32_PROCESS OK [' + _Caption + '][' + _CommandLine + ']' ) ;
            End ;
            If ( Pos ( P2_SERVER_TXT_2, UpperCase(_Caption) ) > 0 ) OR
               ( Pos ( P2_SERVER_TXT_2, UpperCase(_CommandLine) ) > 0 ) Then Begin
               //Cnt_NOK_APP_P2_SERVER := 0 ;
               P2_SERVER_RUNNING_2 := TRUE ;
               P2_SERVER_STR_2 := P2_SERVER_STR_2 + '[' + _Caption + '][' + _CommandLine + ']' + sLineBreak ;
               //PUT_LOG ( 'WIN32_PROCESS OK [' + Caption + '][' + CommandLine + ']' ) ;
            End ;
            If ( Pos ( LOOP_WMI_TXT, UpperCase(_Caption) ) > 0 ) OR
               ( Pos ( LOOP_WMI_TXT, UpperCase(_CommandLine) ) > 0 ) Then Begin
               //Cnt_NOK_APP_LOOP_WMI := 0 ;
               LOOP_WMI_RUNNING := TRUE ;
               LOOP_WMI_STR := LOOP_WMI_STR + '[' + _Caption + '][' + _CommandLine + ']' + sLineBreak ;
               //PUT_LOG ( 'WIN32_PROCESS OK [' + Caption + '][' + CommandLine + ']' ) ;
            End ;
            FWbemObject2 := Unassigned ;
         //End ;
      End ;
   Finally
      CoUninitialize ;
   End ;
Except
   On E : Exception Do Begin
      CoUninitialize ;
      PUT_LOG ( 'Exception TASK_GET WINDOWS_PROCESS/1 ' + E.Classname + ':' + E.Message) ;
   End ;
End ;
_Debug ( '4 TASK_GET WINDOWS_PROCESS/1' ) ;
{
PUT_LOG ( 'WIN32_PROCESS ' +
          'LOOP_WMI[' + IFSN(LOOP_WMI_RUNNING) + '] ' +
          'P2a[' + IFSN(P2_SERVER_RUNNING_1) + '] ' +
          'P2b[' + IFSN(P2_SERVER_RUNNING_2) + '] ' +
          'STR[' + LOOP_WMI_STR + ']' ) ;
}
FLAG_GET_WINDOWS_PROCESS := FALSE ;
_Debug ( 'FIM TASK_GET WINDOWS_PROCESS' ) ;
End ;

Procedure GET_WINDOWS_PROCESS ;
Begin
_Debug ( 'INI GET WINDOWS_PROCESS' ) ;
If Assigned ( Sup.Task_Process ) Then Begin
   _Debug ( '1 GET WINDOWS_PROCESS' ) ;
   If Sup.Task_Process.Status = TTaskStatus.Running Then Begin
      _Debug ( '2 GET WINDOWS_PROCESS' ) ;
      PUT_LOG ( 'Task Process em execu??o' ) ;
      Exit ;
   End ;
End ;
_Debug ( '3 GET WINDOWS_PROCESS' ) ;
//Sup.Task_Process := TTask.Create ( TASK_GET_WINDOWS_PROCESS ) ;
//Sup.Task_Process.Start ;
TASK_GET_WINDOWS_PROCESS ;
_Debug ( 'FIM GET WINDOWS_PROCESS' ) ;
End ;

(*
Procedure GET_WINDOWS_DISK_DRIVE ( Var _Log : String ) ;
Const wbemFlagForwardOnly = $00000020 ;
Var FSWbemLocator  : OLEVariant ;
    FWMIService    : OLEVariant ;
    FWbemObjectSet : OLEVariant ;
    FWbemObject    : OLEVariant ;
    oEnum          : IEnumvariant ;
    iValue         : LongWord ;
    Drive          : String ;
    Qtde           : LongInt ;
    Indice         : LongInt ;
    Local          : LongInt ;
Begin
//PUT_LOG ( 'INI/a GET WINDOWS_LOGICAL_DISK' ) ;
Qtde := 0 ;
_Log := _Log + '============================' + sLineBreak ;
_Log := _Log + '   GET_WINDOWS_DISK_DRIVE' + sLineBreak ;
_Log := _Log + '============================' + sLineBreak ;
FSWbemLocator := CreateOleObject ( 'WbemScripting.SWbemLocator' ) ;
FWMIService   := FSWbemLocator.ConnectServer('localhost', 'root\CIMV2', '', '' ) ;
FWbemObjectSet:= FWMIService.ExecQuery ( 'SELECT * FROM Win32_DiskDrive',
                                         'WQL', wbemFlagForwardOnly ) ;
oEnum := IUnknown(FWbemObjectSet._NewEnum) AS IEnumVariant ;
For Local := 1 To 26 Do Begin
   With Sup.Win32_DiskDrive [ Local ] Do Begin
      Ativo_Old := Ativo_Atual ;
      Ativo_Atual := FALSE ;
   End ;
End ;
Indice := 0 ;
While oEnum.Next(1, FWbemObject, iValue) = 0 Do Begin
   Inc ( Indice ) ;
{
   If NOT VarIsNull ( FWbemObject.DeviceID ) Then Begin
      Drive := UpperCase ( String(FWbemObject.DeviceID ) ) ;
   End Else Begin
      _Log := _Log + 'CONT 1 ' + TimeToStr ( Now ) + sLineBreak ;
      Continue ;
   End ;
   If Drive = '' Then Begin
      _Log := _Log + 'CONT 2 ' + TimeToStr ( Now ) + sLineBreak ;
      Continue ;
   End ;
   Inc ( Qtde ) ;
   //PUT_LOG ( 'DRIVE [' + Drive + ']' ) ;
   Indice := Ord ( Drive[1] ) - 64 ;
}
   With Sup.Win32_DiskDrive [ Indice ] Do Begin
      Ativo_Atual := TRUE ;
      If NOT VarIsNull ( FWbemObject.Availability) Then
         Availability := String(FWbemObject.Availability ) ;
      If NOT VarIsNull ( FWbemObject.BytesPerSector) Then
         BytesPerSector := String(FWbemObject.BytesPerSector ) ;
      //If NOT VarIsNull ( FWbemObject.Capabilities_AR) Then
      //   Capabilities_AR := OLE_ARRAY_TO_STRING(FWbemObject.Capabilities_AR ) ;
      //If NOT VarIsNull ( FWbemObject.CapabilityDescriptions_AR) Then
      //   CapabilityDescriptions_AR := OLE_ARRAY_TO_STRING(FWbemObject.CapabilityDescriptions_AR ) ;
      If NOT VarIsNull ( FWbemObject.Caption) Then
         Caption := String(FWbemObject.Caption ) ;
      If NOT VarIsNull ( FWbemObject.CompressionMethod) Then
         CompressionMethod := String(FWbemObject.CompressionMethod ) ;
      If NOT VarIsNull ( FWbemObject.ConfigManagerErrorCode) Then
         ConfigManagerErrorCode := String(FWbemObject.ConfigManagerErrorCode ) ;
      If NOT VarIsNull ( FWbemObject.ConfigManagerUserConfig) Then
         ConfigManagerUserConfig := String(FWbemObject.ConfigManagerUserConfig ) ;
      If NOT VarIsNull ( FWbemObject.CreationClassName) Then
         CreationClassName := String(FWbemObject.CreationClassName ) ;
      If NOT VarIsNull ( FWbemObject.DefaultBlockSize) Then
         DefaultBlockSize := String(FWbemObject.DefaultBlockSize ) ;
      If NOT VarIsNull ( FWbemObject.Description) Then
         Description := String(FWbemObject.Description ) ;
      If NOT VarIsNull ( FWbemObject.DeviceID) Then
         DeviceID := String(FWbemObject.DeviceID ) ;
      If NOT VarIsNull ( FWbemObject.ErrorCleared) Then
         ErrorCleared := String(FWbemObject.ErrorCleared ) ;
      If NOT VarIsNull ( FWbemObject.ErrorDescription) Then
         ErrorDescription := String(FWbemObject.ErrorDescription ) ;
      If NOT VarIsNull ( FWbemObject.ErrorMethodology) Then
         ErrorMethodology := String(FWbemObject.ErrorMethodology ) ;
      If NOT VarIsNull ( FWbemObject.FirmwareRevision) Then
         FirmwareRevision := String(FWbemObject.FirmwareRevision ) ;
      If NOT VarIsNull ( FWbemObject.Index) Then
         Index := String(FWbemObject.Index ) ;
      If NOT VarIsNull ( FWbemObject.InstallDate) Then
         InstallDate := TDateTime(FWbemObject.InstallDate ) ;
      If NOT VarIsNull ( FWbemObject.InterfaceType) Then
         InterfaceType := String(FWbemObject.InterfaceType ) ;
      If NOT VarIsNull ( FWbemObject.LastErrorCode) Then
         LastErrorCode := String(FWbemObject.LastErrorCode ) ;
      If NOT VarIsNull ( FWbemObject.Manufacturer) Then
         Manufacturer := String(FWbemObject.Manufacturer ) ;
      If NOT VarIsNull ( FWbemObject.MaxBlockSize) Then
         MaxBlockSize := String(FWbemObject.MaxBlockSize ) ;
      If NOT VarIsNull ( FWbemObject.MaxMediaSize) Then
         MaxMediaSize := Int64(FWbemObject.MaxMediaSize ) ;
      If NOT VarIsNull ( FWbemObject.MediaLoaded) Then
         MediaLoaded := Boolean(FWbemObject.MediaLoaded ) ;
      If NOT VarIsNull ( FWbemObject.MediaType) Then
         MediaType := String(FWbemObject.MediaType ) ;
      If NOT VarIsNull ( FWbemObject.MinBlockSize) Then
         MinBlockSize := Int64(FWbemObject.MinBlockSize ) ;
      If NOT VarIsNull ( FWbemObject.Model) Then
         Model := String ( FWbemObject.Model ) ;
      If NOT VarIsNull ( FWbemObject.Name) Then
         Name := String(FWbemObject.Name ) ;
      If NOT VarIsNull ( FWbemObject.NeedsCleaning) Then
         NeedsCleaning := String ( FWbemObject.NeedsCleaning ) ;
      If NOT VarIsNull ( FWbemObject.NumberOfMediaSupported) Then
         NumberOfMediaSupported := String ( FWbemObject.NumberOfMediaSupported ) ;
      If NOT VarIsNull ( FWbemObject.Partitions) Then
         Partitions := String ( FWbemObject.Partitions ) ;
      If NOT VarIsNull ( FWbemObject.PNPDeviceID) Then
         PNPDeviceID := String ( FWbemObject.PNPDeviceID ) ;
      //If NOT VarIsNull ( FWbemObject.PowerManagementCapabilities_AR) Then
      //   PowerManagementCapabilities_AR := OLE_ARRAY_TO_STRING(FWbemObject.PowerManagementCapabilities_AR ) ;
      If NOT VarIsNull ( FWbemObject.PowerManagementSupported) Then
         PowerManagementSupported := String ( FWbemObject.PowerManagementSupported ) ;
      If NOT VarIsNull ( FWbemObject.SCSIBus) Then
         SCSIBus := String ( FWbemObject.SCSIBus ) ;
      If NOT VarIsNull ( FWbemObject.SCSILogicalUnit) Then
         SCSILogicalUnit := String ( FWbemObject.SCSILogicalUnit ) ;
      If NOT VarIsNull ( FWbemObject.SCSIPort) Then
         SCSIPort := String ( FWbemObject.SCSIPort ) ;
      If NOT VarIsNull ( FWbemObject.SCSITargetId) Then
         SCSITargetId := String ( FWbemObject.SCSITargetId ) ;
      If NOT VarIsNull ( FWbemObject.SectorsPerTrack) Then
         SectorsPerTrack := String ( FWbemObject.SectorsPerTrack ) ;
      If NOT VarIsNull ( FWbemObject.SerialNumber) Then
         SerialNumber := String ( FWbemObject.SerialNumber ) ;
      If NOT VarIsNull ( FWbemObject.Signature) Then
         Signature := String ( FWbemObject.Signature ) ;
      If NOT VarIsNull ( FWbemObject.Size) Then
         Size := Int64(FWbemObject.Size ) ;
      If NOT VarIsNull ( FWbemObject.Status) Then
         Status := String(FWbemObject.Status ) ;
      If NOT VarIsNull ( FWbemObject.StatusInfo) Then
         StatusInfo := String(FWbemObject.StatusInfo ) ;
      If NOT VarIsNull ( FWbemObject.SystemCreationClassName) Then
         SystemCreationClassName := String(FWbemObject.SystemCreationClassName ) ;
      If NOT VarIsNull ( FWbemObject.SystemName) Then
         SystemName := String(FWbemObject.SystemName ) ;
      If NOT VarIsNull ( FWbemObject.TotalCylinders) Then
         TotalCylinders := String(FWbemObject.TotalCylinders ) ;
      If NOT VarIsNull ( FWbemObject.TotalHeads) Then
         TotalHeads := String(FWbemObject.TotalHeads ) ;
      If NOT VarIsNull ( FWbemObject.TotalSectors) Then
         TotalSectors := String(FWbemObject.TotalSectors ) ;
      If NOT VarIsNull ( FWbemObject.TotalTracks) Then
         TotalTracks := String(FWbemObject.TotalTracks ) ;
      If NOT VarIsNull ( FWbemObject.TracksPerCylinder) Then
         TracksPerCylinder := String(FWbemObject.TracksPerCylinder ) ;
      FWbemObject := Unassigned ;
      _Log := _Log + TimeToStr ( Now ) + ' DISKDRIVE ' + DeviceId + ' ' +
              IntToStr(Size DIV 1024 DIV 1024) + ' ' +
              Caption + sLineBreak ;
   End ;
End ;
For Local := 1 To 26 Do Begin
   With Sup.Win32_DiskDrive [ Local ] Do Begin
      If NOT Ativo_Atual Then Begin
         Size := 0 ;
      End ;
   End ;
End ;
//PUT_LOG ( 'FIM GET WINDOWS_LOGICAL_DISK (Qtde=' + IntToStr(Qtde) + ']' ) ;
End ;
*)

Procedure GET_WINDOWS_SERVICES_2 ;
Const wbemFlagForwardOnly = $00000020 ;
Var FSWbemLocator  : OLEVariant ;
    FWMIService    : OLEVariant ;
    FWbemObjectSet : OLEVariant ;
    FWbemObject    : OLEVariant ;
    oEnum          : IEnumvariant ;
    iValue         : LongWord ;
Begin
//PUT_LOG ( 'INI GET_WINDOWS_SERVICES Qtde[' + IntToStr ( Length ( Sup.Info_Windows.Services ) ) + ']' ) ;
FSWbemLocator := CreateOleObject ( 'WbemScripting.SWbemLocator' ) ;
FWMIService   := FSWbemLocator.ConnectServer('localhost', 'root\CIMV2', '', '' ) ;
FWbemObjectSet:= FWMIService.ExecQuery ( 'SELECT *  FROM Win32_Service',
                                         'WQL', wbemFlagForwardOnly ) ;
oEnum := IUnknown(FWbemObjectSet._NewEnum) AS IEnumVariant ;
SetLength ( Sup.Info_Windows.Services, 0 ) ;
While oEnum.Next(1, FWbemObject, iValue) = 0 Do Begin
   SetLength ( Sup.Info_Windows.Services, Length ( Sup.Info_Windows.Services ) + 1 ) ;
   With Sup.Info_Windows.Services [ Length ( Sup.Info_Windows.Services ) - 1 ] Do Begin
      If NOT VarIsNull ( FWbemObject.Name ) Then
         Name := String(FWbemObject.Name ) ;
      If NOT VarIsNull ( FWbemObject.State ) Then
         State := String(FWbemObject.State ) ;
   FWbemObject := Unassigned ;
   End ;
End ;
//PUT_LOG ( 'FIM GET_WINDOWS_SERVICES Qtde[' + IntToStr ( Length ( Sup.Info_Windows.Services ) ) + ']' ) ;
End ;

Procedure GET_WINDOWS_USB_DEVICE_TYPE ;
Const wbemFlagForwardOnly = $00000020 ;
Var FSWbemLocator  : OLEVariant ;
    FWMIService    : OLEVariant ;
    FWbemObjectSet : OLEVariant ;
    FWbemObject    : OLEVariant ;
    oEnum          : IEnumvariant ;
    iValue         : LongWord ;
Begin
FSWbemLocator := CreateOleObject ( 'WbemScripting.SWbemLocator' ) ;
FWMIService := FSWbemLocator.ConnectServer ( 'localhost', 'root\cimv2', '', '' ) ;
FWbemObjectSet := FWMIService.ExecQuery ( 'SELECT * FROM  Win32_USBHub', 'WQL',
                                          wbemFlagForwardOnly ) ;
oEnum := IUnknown ( FWbemObjectSet._NewEnum ) AS IEnumVariant ;
SetLength ( Sup.Info_Windows.Win32_USB_Device_Type, 0 ) ;
While oEnum.Next ( 1, FWbemObject, iValue ) = 0 Do Begin
   SetLength ( Sup.Info_Windows.Win32_USB_Device_Type, Length ( Sup.Info_Windows.Win32_USB_Device_Type ) + 1 ) ;
   With Sup.Info_Windows.Win32_USB_Device_Type [ Length ( Sup.Info_Windows.Win32_USB_Device_Type ) - 1 ] Do Begin
      If NOT VarIsNull ( FWbemObject.Availability ) Then
         Availability := String(FWbemObject.Availability) ;
      If NOT VarIsNull ( FWbemObject.Caption ) Then
         Caption := String(FWbemObject.Caption) ;
      If NOT VarIsNull ( FWbemObject.ClassCode ) Then
         ClassCode := String(FWbemObject.ClassCode) ;
      If NOT VarIsNull ( FWbemObject.ConfigManagerErrorCode ) Then
         ConfigManagerErrorCode := String(FWbemObject.ConfigManagerErrorCode) ;
      If NOT VarIsNull ( FWbemObject.ConfigManagerUserConfig ) Then
         ConfigManagerUserConfig := String(FWbemObject.ConfigManagerUserConfig) ;
      If NOT VarIsNull ( FWbemObject.CreationClassName ) Then
         CreationClassName := String(FWbemObject.CreationClassName) ;
      Try
      If NOT VarIsNull ( FWbemObject.CurrentAlternateSettingsMT ) Then
         CurrentAlternateSettingsMT := OLE_ARRAY_TO_STRING ( FWbemObject.CurrentAlternateSettingsMT) ;
      Except
      End ;
      If NOT VarIsNull ( FWbemObject.CurrentConfigValue ) Then
         CurrentConfigValue := String(FWbemObject.CurrentConfigValue) ;
      If NOT VarIsNull ( FWbemObject.Description ) Then
         Description := String(FWbemObject.Description) ;
      If NOT VarIsNull ( FWbemObject.DeviceID ) Then
         DeviceID := String(FWbemObject.DeviceID) ;
      If NOT VarIsNull ( FWbemObject.ErrorCleared ) Then
         ErrorCleared := String(FWbemObject.ErrorCleared) ;
      If NOT VarIsNull ( FWbemObject.ErrorDescription ) Then
         ErrorDescription := String(FWbemObject.ErrorDescription) ;
      If NOT VarIsNull ( FWbemObject.GangSwitched ) Then
         GangSwitched := String(FWbemObject.GangSwitched) ;
      If NOT VarIsNull ( FWbemObject.InstallDate ) Then
         InstallDate := String(FWbemObject.InstallDate) ;
      If NOT VarIsNull ( FWbemObject.LastErrorCode ) Then
         LastErrorCode := String(FWbemObject.LastErrorCode) ;
      If NOT VarIsNull ( FWbemObject.NumberOfConfigs ) Then
         NumberOfConfigs := String(FWbemObject.NumberOfConfigs) ;
      If NOT VarIsNull ( FWbemObject.NumberOfPorts ) Then
         NumberOfPorts := String(FWbemObject.NumberOfPorts) ;
      If NOT VarIsNull ( FWbemObject.PNPDeviceID ) Then
         PNPDeviceID := String(FWbemObject.PNPDeviceID) ;
      Try
      If NOT VarIsNull ( FWbemObject.PowerManagementCapabilitiesMT ) Then
         PowerManagementCapabilitiesMT := OLE_ARRAY_TO_STRING (FWbemObject.PowerManagementCapabilitiesMT) ;
      Except
      End ;
      If NOT VarIsNull ( FWbemObject.PowerManagementSupported ) Then
         PowerManagementSupported := String(FWbemObject.PowerManagementSupported) ;
      If NOT VarIsNull ( FWbemObject.ProtocolCode ) Then
         ProtocolCode := String(FWbemObject.ProtocolCode) ;
      If NOT VarIsNull ( FWbemObject.Status ) Then
         Status := String(FWbemObject.Status) ;
      If NOT VarIsNull ( FWbemObject.StatusInfo ) Then
         StatusInfo := String(FWbemObject.StatusInfo) ;
      If NOT VarIsNull ( FWbemObject.SubclassCode ) Then
         SubclassCode := String(FWbemObject.SubclassCode) ;
      If NOT VarIsNull ( FWbemObject.SystemCreationClassName ) Then
         SystemCreationClassName := String(FWbemObject.SystemCreationClassName) ;
      If NOT VarIsNull ( FWbemObject.SystemName ) then
         SystemName := String(FWbemObject.SystemName) ;
      If NOT VarIsNull ( FWbemObject.USBVersion ) then
         USBVersion := String(FWbemObject.USBVersion) ;
   End ;
   FWbemObject := Unassigned ;
End ;
End ;

Procedure GET_WINDOWS_ADD_INFO ;
Var Passo : LongInt ;
//    _Log  : String ;
Begin
Passo := 0 ;
Try
   Passo := 1 ;
   If Is_Win_Server Then Begin
      Passo := 2 ;
      //xxWriteln('Sorry this app only can run in desktop operating systems.');
      Exit ;
   End ;
   Passo := 3 ;
   CoInitialize(Nil) ;
   Passo := 4 ;
   Try
      Try
         Passo := 5 ;
         GetSCProductInfo ( AntiVirusProduct ) ;
         Passo := 6 ;
         GetSCProductInfo ( AntiSpywareProduct ) ;
         Passo := 7 ;
         GetSCProductInfo ( FirewallProduct ) ;
         Passo := 8 ;
         GET_WINDOWS_INSTALL_DATE ;
         Passo := 9 ;
         GET_WINDOWS_SERVICE_PACK ;
         Passo := 10 ;
         GET_WINDOWS_FOLDER ;
         Passo := 11 ;
         GET_WINDOWS_HOTFIXES ;
         Passo := 12 ;
         GET_WINDOWS_PASSWORD_SCREENSAVER_ENABLED ;
         Passo := 13 ;
         GET_WINDOWS_APPS_AUTOEXEC ;
         Passo := 14 ;
         GET_WINDOWS_POINT_DEVICES ;
         Passo := 15 ;
         GET_WINDOWS_SERVICES_2 ;
         Passo := 16 ;
         GET_WINDOWS_DEVICES_NOT_WORK_EXCLAMACAO ;
         Passo := 17 ;
         GetWin32_VideoControllerInfo ;
         Passo := 18 ;
         GET_WIN32_NETWORK_ADAPTER ;
         Passo := 19 ;
         GET_WIN32_NETWORK_CONFIGURATION ;
         Passo := 20 ;
         GET_WINDOWS_SOUND_DEVICES ;
         Passo := 21 ;
         GET_WINDOWS_COM_PORTS ;
         Passo := 22 ;
         GET_WINDOWS_USB_DEVICE_TYPE ;
         Passo := 23 ;
         //GET_WINDOWS_LOGICAL_DISK ( _Log ) ;
         Passo := 24 ;
      Except
         On E : Exception Do Begin
            PUT_LOG ( 'Exception GET_WINDOWS_ADD_INFO Passo ' +
                      IntTostr ( Passo ) + ' [' + E.Message + ']' ) ;
         End ;
      End ;
   Finally
      CoUninitialize ;
   End;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception GET_WINDOWS_ADD_INFO ' + E.Classname + ':' + E.Message);
   End ;
End ;
End ;

Function GET_SERIAL_MOTHERBOARD : String ;
Function GetMotherBoardSerial:String;
Var objWMIService : OLEVariant ;
    colItems      : OLEVariant ;
    colItem       : OLEVariant ;
    oEnum         : IEnumvariant ;
    iValue        : LongWord ;

  Function GetWMIObject ( Const objectName: String ) : IDispatch ;
  Var chEaten : Integer ;
      BindCtx : IBindCtx ;
      Moniker : IMoniker ;
  Begin
  OleCheck(CreateBindCtx(0, bindCtx)) ;
  OleCheck(MkParseDisplayName(BindCtx, StringToOleStr(objectName), chEaten, Moniker)) ;
  OleCheck(Moniker.BindToObject(BindCtx, nil, IDispatch, Result)) ;
  End ;

Begin
Result := '' ;
objWMIService := GetWMIObject('winmgmts:\\localhost\root\cimv2') ;
colItems      := objWMIService.ExecQuery('SELECT SerialNumber FROM Win32_BaseBoard','WQL',0) ;
oEnum         := IUnknown(colItems._NewEnum) As IEnumVariant ;
If oEnum.Next(1, colItem, iValue) = 0 Then
   Result := VarToStr(colItem.SerialNumber) ;
End ;
Begin
Result := '' ;
Try
   CoInitialize(nil);
   Try
      Result := GetMotherBoardSerial ;
    Finally
    CoUninitialize ;
    end;
   Except
   On E:Exception do
      Begin
      Result := '' ;
      //Writeln(E.Classname, ': ', E.Message);
      End;
   End;
End ;

Function GET_RESUMO_MONITORES ( _Form : TForm ) : String  ;
Var Local : LongInt ;
    Qtde  : LongInt ;
Begin
Qtde := Screen.MonitorCount ;
Result := 'Quantidade de devices de v?deo ativos encontrados: ' +
          IntToStr(Qtde) + sLineBreak +
          sLineBreak ;
Result := Result + 'Pixels para formul?rio: ' +
          IntToStr(GET_VIDEO_PIXELS(_Form)) +
          sLineBreak +
          'Nome do computador: [' + COMPUTADOR + ']' + sLineBreak +
          'Serial da motherboard: [' + GET_SERIAL_MOTHERBOARD + ']' + sLineBreak +
          'Usu?rio: [' + NOME_USUARIO + ']' + sLineBreak +
          sLineBreak ;
Result := Result + GET_TIME_SYSTEM_INFO +
          sLineBreak ;
For Local := 0 To Qtde - 1 Do
   Begin
   Result := Result +
             'Device de v?deo ' + IntToStr(Local+1) + sLineBreak +
             'Largura: ' + IntToStr ( Screen.Monitors[Local].Width ) + ' pixels' + sLineBreak +
             'Altura: ' + IntToStr ( Screen.Monitors[Local].Height ) + ' pixels' + sLineBreak +
             'Densidade: ' + IntToStr ( Screen.PixelsPerInch ) + ' DPI' + sLineBreak +
             '?ndice: ' + IntToStr ( Screen.Monitors[Local].MonitorNum ) + sLineBreak +
             'Prim?rio: ' + IFSN ( Screen.Monitors[Local].Primary ) + sLineBreak +
             sLineBreak ;
   End ;
Result := Result + GetWin32_VideoControllerInfo +
          sLineBreak ;
Result := Result + GET_VIDEO_MODES +
          sLineBreak ;
End ;

Function GetWin32_VideoControllerInfo : String ;
const
  WbemUser            ='';
  WbemPassword        ='';
  WbemComputer        ='localhost';
  wbemFlagForwardOnly = $00000020;
var
  FSWbemLocator : OLEVariant;
  FWMIService   : OLEVariant;
  FWbemObjectSet: OLEVariant;
  FWbemObject   : OLEVariant;
  oEnum         : IEnumvariant;
  iValue        : LongWord;
  Contador      : LongInt ;
begin;
Try
   Result :='' ;
   FSWbemLocator := CreateOleObject('WbemScripting.SWbemLocator');
   FWMIService   := FSWbemLocator.ConnectServer(WbemComputer, 'root\CIMV2', WbemUser, WbemPassword);
   FWbemObjectSet:= FWMIService.ExecQuery('SELECT * FROM Win32_VideoController','WQL',wbemFlagForwardOnly);
   oEnum         := IUnknown(FWbemObjectSet._NewEnum) AS IEnumVariant;
   Contador := 0 ;
   SetLength ( Sup.Info_Windows.Win32_Video, 0 ) ;
   While oEnum.Next(1, FWbemObject, iValue) = 0 Do Begin
      Inc ( Contador ) ;
      SetLength ( Sup.Info_Windows.Win32_Video, Length ( Sup.Info_Windows.Win32_Video ) + 1 ) ;
      With Sup.Info_Windows.Win32_Video[Length(Sup.Info_Windows.Win32_Video)-1] Do Begin
         If NOT VarIsNull ( FWbemObject.AcceleratorCapabilities ) Then
            AcceleratorCapabilities := OLE_ARRAY_TO_STRING ( FWbemObject.AcceleratorCapabilities ) ;
         If NOT VarIsNull ( FWbemObject.AdapterCompatibility ) Then
            AdapterCompatibility := String ( FWbemObject.AdapterCompatibility ) ;
         If NOT VarIsNull ( FWbemObject.AdapterDACType ) Then
            AdapterDACType := String ( FWbemObject.AdapterDACType ) ;
         If NOT VarIsNull ( FWbemObject.AdapterRAM ) Then
            AdapterRAM := String ( FWbemObject.AdapterRAM ) ;
         If NOT VarIsNull ( FWbemObject.Availability ) Then
            Availability := String ( FWbemObject.Availability ) ;
         If NOT VarIsNull ( FWbemObject.CapabilityDescriptions ) Then
            CapabilityDescriptions := OLE_ARRAY_TO_STRING ( FWbemObject.CapabilityDescriptions ) ;
         If NOT VarIsNull ( FWbemObject.Caption ) Then
            Caption := String ( FWbemObject.Caption ) ;
         If NOT VarIsNull ( FWbemObject.ColorTableEntries ) Then
            ColorTableEntries := String ( FWbemObject.ColorTableEntries ) ;
         If NOT VarIsNull ( FWbemObject.ConfigManagerErrorCode ) Then
            ConfigManagerErrorCode := String ( FWbemObject.ConfigManagerErrorCode ) ;
         If NOT VarIsNull ( FWbemObject.ConfigManagerUserConfig ) Then
            ConfigManagerUserConfig := String ( FWbemObject.ConfigManagerUserConfig ) ;
         If NOT VarIsNull ( FWbemObject.CreationClassName ) Then
            CreationClassName := String ( FWbemObject.CreationClassName ) ;
         If NOT VarIsNull ( FWbemObject.CurrentBitsPerPixel ) Then
            CurrentBitsPerPixel := String ( FWbemObject.CurrentBitsPerPixel ) ;
         If NOT VarIsNull ( FWbemObject.CurrentHorizontalResolution ) Then
            CurrentHorizontalResolution := String ( FWbemObject.CurrentHorizontalResolution ) ;
         If NOT VarIsNull ( FWbemObject.CurrentNumberOfColors ) Then
            CurrentNumberOfColors := String ( FWbemObject.CurrentNumberOfColors ) ;
         If NOT VarIsNull ( FWbemObject.CurrentNumberOfColumns ) Then
            CurrentNumberOfColumns := String ( FWbemObject.CurrentNumberOfColumns ) ;
         If NOT VarIsNull ( FWbemObject.CurrentNumberOfRows ) Then
            CurrentNumberOfRows := String ( FWbemObject.CurrentNumberOfRows ) ;
         If NOT VarIsNull ( FWbemObject.CurrentRefreshRate ) Then
            CurrentRefreshRate := String ( FWbemObject.CurrentRefreshRate ) ;
         If NOT VarIsNull ( FWbemObject.CurrentScanMode ) Then
            CurrentScanMode := String ( FWbemObject.CurrentScanMode ) ;
         If NOT VarIsNull ( FWbemObject.CurrentVerticalResolution ) Then
            CurrentVerticalResolution := String ( FWbemObject.CurrentVerticalResolution ) ;
         If NOT VarIsNull ( FWbemObject.Description ) Then
            Description := String ( FWbemObject.Description ) ;
         If NOT VarIsNull ( FWbemObject.DeviceID ) Then
            DeviceID := String ( FWbemObject.DeviceID ) ;
         If NOT VarIsNull ( FWbemObject.DeviceSpecificPens ) Then
            DeviceSpecificPens := String ( FWbemObject.DeviceSpecificPens ) ;
         If NOT VarIsNull ( FWbemObject.DitherType ) Then
            DitherType := String ( FWbemObject.DitherType ) ;
         If NOT VarIsNull ( FWbemObject.DriverDate ) Then
            DriverDate := String ( FWbemObject.DriverDate ) ;
         If NOT VarIsNull ( FWbemObject.DriverVersion ) Then
            DriverVersion := String ( FWbemObject.DriverVersion ) ;
         If NOT VarIsNull ( FWbemObject.ErrorCleared ) Then
            ErrorCleared := String ( FWbemObject.ErrorCleared ) ;
         If NOT VarIsNull ( FWbemObject.ErrorDescription ) Then
            ErrorDescription := String ( FWbemObject.ErrorDescription ) ;
         If NOT VarIsNull ( FWbemObject.ICMIntent ) Then
            ICMIntent := String ( FWbemObject.ICMIntent ) ;
         If NOT VarIsNull ( FWbemObject.ICMMethod ) Then
            ICMMethod := String ( FWbemObject.ICMMethod ) ;
         If NOT VarIsNull ( FWbemObject.InfFilename ) Then
            InfFilename := String ( FWbemObject.InfFilename ) ;
         If NOT VarIsNull ( FWbemObject.InfSection ) Then
            InfSection := String ( FWbemObject.InfSection ) ;
         If NOT VarIsNull ( FWbemObject.InstallDate ) Then
            InstallDate := String ( FWbemObject.InstallDate ) ;
         If NOT VarIsNull ( FWbemObject.InstalledDisplayDrivers ) Then
            InstalledDisplayDrivers := String ( FWbemObject.InstalledDisplayDrivers ) ;
         If NOT VarIsNull ( FWbemObject.LastErrorCode ) Then
            LastErrorCode := String ( FWbemObject.LastErrorCode ) ;
         If NOT VarIsNull ( FWbemObject.MaxMemorySupported ) Then
            MaxMemorySupported := String ( FWbemObject.MaxMemorySupported ) ;
         If NOT VarIsNull ( FWbemObject.MaxNumberControlled ) Then
            MaxNumberControlled := String ( FWbemObject.MaxNumberControlled ) ;
         If NOT VarIsNull ( FWbemObject.MaxRefreshRate ) Then
            MaxRefreshRate := String ( FWbemObject.MaxRefreshRate ) ;
         If NOT VarIsNull ( FWbemObject.MinRefreshRate ) Then
            MinRefreshRate := String ( FWbemObject.MinRefreshRate ) ;
         If NOT VarIsNull ( FWbemObject.Monochrome ) Then
            Monochrome := String ( FWbemObject.Monochrome ) ;
         If NOT VarIsNull ( FWbemObject.Name ) Then
            Name := String ( FWbemObject.Name ) ;
         If NOT VarIsNull ( FWbemObject.NumberOfColorPlanes ) Then
            NumberOfColorPlanes := String ( FWbemObject.NumberOfColorPlanes ) ;
         If NOT VarIsNull ( FWbemObject.NumberOfVideoPages ) Then
            NumberOfVideoPages := String ( FWbemObject.NumberOfVideoPages ) ;
         If NOT VarIsNull ( FWbemObject.PNPDeviceID ) Then
            PNPDeviceID := String ( FWbemObject.PNPDeviceID ) ;
         If NOT VarIsNull ( FWbemObject.PowerManagementCapabilities ) Then
            PowerManagementCapabilities := OLE_ARRAY_TO_STRING ( FWbemObject.PowerManagementCapabilities ) ;
         If NOT VarIsNull ( FWbemObject.PowerManagementSupported ) Then
            PowerManagementSupported := String ( FWbemObject.PowerManagementSupported ) ;
         If NOT VarIsNull ( FWbemObject.ProtocolSupported ) Then
            ProtocolSupported := String ( FWbemObject.ProtocolSupported ) ;
         If NOT VarIsNull ( FWbemObject.ReservedSystemPaletteEntries ) Then
            ReservedSystemPaletteEntries := String ( FWbemObject.ReservedSystemPaletteEntries ) ;
         If NOT VarIsNull ( FWbemObject.SpecificationVersion ) Then
            SpecificationVersion := String ( FWbemObject.SpecificationVersion ) ;
         If NOT VarIsNull ( FWbemObject.Status ) Then
            Status := String ( FWbemObject.Status ) ;
         If NOT VarIsNull ( FWbemObject.StatusInfo ) Then
            StatusInfo := String ( FWbemObject.StatusInfo ) ;
         If NOT VarIsNull ( FWbemObject.SystemCreationClassName ) Then
            SystemCreationClassName := String ( FWbemObject.SystemCreationClassName ) ;
         If NOT VarIsNull ( FWbemObject.SystemName ) Then
            SystemName := String ( FWbemObject.SystemName ) ;
         If NOT VarIsNull ( FWbemObject.SystemPaletteEntries ) Then
            SystemPaletteEntries := String ( FWbemObject.SystemPaletteEntries ) ;
         If NOT VarIsNull ( FWbemObject.TimeOfLastReset ) Then
            TimeOfLastReset := String ( FWbemObject.TimeOfLastReset ) ;
         If NOT VarIsNull ( FWbemObject.VideoArchitecture ) Then
            VideoArchitecture := String ( FWbemObject.VideoArchitecture ) ;
         If NOT VarIsNull ( FWbemObject.VideoMemoryType ) Then
            VideoMemoryType := String ( FWbemObject.VideoMemoryType ) ;
         If NOT VarIsNull ( FWbemObject.VideoMode ) Then
            VideoMode := String ( FWbemObject.VideoMode ) ;
         If NOT VarIsNull ( FWbemObject.VideoModeDescription ) Then
            VideoModeDescription := String ( FWbemObject.VideoModeDescription ) ;
         If NOT VarIsNull ( FWbemObject.VideoProcessor ) Then
            VideoProcessor := String ( FWbemObject.VideoProcessor ) ;
      End ;

      Result := Result + 'Informa??es sobre o adaptador de v?deo ' + IntToStr(Contador) + sLineBreak ;
      If NOT VarIsNull ( FWbemObject.Name ) Then
         Result := Result + Format('Name           %s',[String(FWbemObject.Name)]) + sLineBreak ;// String
      If NOT VarIsNull ( FWbemObject.PNPDeviceID ) Then
         Result := Result + Format('PNPDeviceID    %s',[String(FWbemObject.PNPDeviceID)]) + sLineBreak  ;// String
      Result := Result + sLineBreak ;
      FWbemObject:=Unassigned;
   End;
Except
   On E : Exception Do Begin
      Result := 'Sem informa??es v?lidas de GetWin32_VideoControllerInfo' + sLineBreak  ;
      Result := 'Exce??o: [' + E.Message + ']' + sLineBreak  ;
      PUT_LOG ( 'Exception GetWin32_VideoControllerInfo [' + E.Message + ']' ) ;
   End ;
End ;
End ;

Procedure GET_WIN32_NETWORK_ADAPTER ; // ( Var Qtde : LongInt ) : TStringList ;
Const wbemFlagForwardOnly = $00000020 ;
Var FSWbemLocator : OLEVariant ;
    FWMIService   : OLEVariant ;
    FWbemObjectSet: OLEVariant ;
    FWbemObject   : OLEVariant ;
    oEnum         : IEnumvariant ;
    iValue        : LongWord ;
Begin
Sup.Qtde_Interfaces := 0 ;
Sup.Cnt_Interfaces_de_Rede := 0 ;
//Result := TStringList.Create ;
//Result.Clear ;
//Qtde := 0 ;
FSWbemLocator := CreateOleObject ( 'WbemScripting.SWbemLocator' ) ;
FWMIService := FSWbemLocator.ConnectServer ( 'localhost', 'root\CIMV2', '', '' ) ;
FWbemObjectSet := FWMIService.ExecQuery ( 'SELECT * FROM Win32_NetworkAdapter', 'WQL', wbemFlagForwardOnly ) ;
oEnum := IUnknown(FWbemObjectSet._NewEnum) As IEnumVariant ;
//_DHCP := '' ;
//_IP := '' ;
SetLength ( Sup.Interfaces_de_Rede, 0 ) ;
If Assigned ( MISC_PN_Checar_Rede ) Then Begin
   MISC_PN_Checar_Rede.Caption := 'Interfaces de Rede - ' + TimeToStr ( Now ) ;
End ;
SetLength ( Sup.Info_Windows.Win32_Net_Adapter, 0 ) ;
While oEnum.Next ( 1, FWbemObject, iValue ) = 0 Do Begin
   SetLength ( Sup.Info_Windows.Win32_Net_Adapter,
               Length ( Sup.Info_Windows.Win32_Net_Adapter ) + 1 ) ;
   With Sup.Info_Windows.Win32_Net_Adapter[Length(Sup.Info_Windows.Win32_Net_Adapter)-1] Do Begin
      Try
      If NOT VarIsNull ( FWbemObject.AdapterType ) Then
         AdapterType := String ( FWbemObject.AdapterType ) ;
      Except
      End ;
      Try
      If NOT VarIsNull ( FWbemObject.AdapterTypeId ) Then
         AdapterTypeId := String ( FWbemObject.AdapterTypeId ) ;
      Except
      End ;
      Try
      If NOT VarIsNull ( FWbemObject.AutoSense ) Then
         AutoSense := String ( FWbemObject.AutoSense ) ;
      Except
      End ;
      Try
      If NOT VarIsNull ( FWbemObject.Availability ) Then
         Availability := String ( FWbemObject.Availability ) ;
      Except
      End ;
      If NOT VarIsNull ( FWbemObject.Caption ) Then
         Caption := String ( FWbemObject.Caption ) ;
      If NOT VarIsNull ( FWbemObject.ConfigManagerErrorCode ) Then
         ConfigManagerErrorCode := String ( FWbemObject.ConfigManagerErrorCode ) ;
      If NOT VarIsNull ( FWbemObject.ConfigManagerUserConfig ) Then
         ConfigManagerUserConfig := String ( FWbemObject.ConfigManagerUserConfig ) ;
      If NOT VarIsNull ( FWbemObject.CreationClassName ) Then
         CreationClassName := String ( FWbemObject.CreationClassName ) ;
      If NOT VarIsNull ( FWbemObject.Description ) Then
         Description := String ( FWbemObject.Description ) ;
      If NOT VarIsNull ( FWbemObject.ErrorCleared ) Then
         ErrorCleared := String ( FWbemObject.ErrorCleared ) ;
      If NOT VarIsNull ( FWbemObject.ErrorDescription ) Then
         ErrorDescription := String ( FWbemObject.ErrorDescription ) ;
      Try
      If NOT VarIsNull ( FWbemObject.GUID ) Then
         GUID := String ( FWbemObject.GUID ) ;
      Except
      End ;
      If NOT VarIsNull ( FWbemObject.Index ) Then
         Index := String ( FWbemObject.Index ) ;
      If NOT VarIsNull ( FWbemObject.InstallDate ) Then
         InstallDate := String ( FWbemObject.InstallDate ) ;
      If NOT VarIsNull ( FWbemObject.Installed ) Then
         Installed := String ( FWbemObject.Installed ) ;
      Try
      If NOT VarIsNull ( FWbemObject.InterfaceIndex ) Then
         InterfaceIndex := String ( FWbemObject.InterfaceIndex ) ;
      Except
      End ;
      If NOT VarIsNull ( FWbemObject.LastErrorCode ) Then
         LastErrorCode := String ( FWbemObject.LastErrorCode ) ;
      If NOT VarIsNull ( FWbemObject.MACAddress ) Then
         MACAddress := String ( FWbemObject.MACAddress ) ;
      If NOT VarIsNull ( FWbemObject.Manufacturer ) Then
         Manufacturer := String ( FWbemObject.Manufacturer ) ;
      If NOT VarIsNull ( FWbemObject.MaxNumberControlled ) Then
         MaxNumberControlled := String ( FWbemObject.MaxNumberControlled ) ;
      If NOT VarIsNull ( FWbemObject.MaxSpeed ) Then
         MaxSpeed := String ( FWbemObject.MaxSpeed ) ;
      If NOT VarIsNull ( FWbemObject.Name ) Then
         Name := String ( FWbemObject.Name ) ;
      If NOT VarIsNull ( FWbemObject.NetConnectionID ) Then
         NetConnectionID := String ( FWbemObject.NetConnectionID ) ;
      If NOT VarIsNull ( FWbemObject.NetConnectionStatus ) Then
         NetConnectionStatus := String ( FWbemObject.NetConnectionStatus ) ;
      Try
      If NOT VarIsNull ( FWbemObject.NetEnabled ) Then
         NetEnabled := String ( FWbemObject.NetEnabled ) ;
      Except
      End ;
      If NOT VarIsNull ( FWbemObject.NetworkAddresses ) Then
         NetworkAddresses := String ( FWbemObject.NetworkAddresses ) ;
      If NOT VarIsNull ( FWbemObject.PermanentAddress ) Then
         PermanentAddress := String ( FWbemObject.PermanentAddress ) ;
      Try
      If NOT VarIsNull ( FWbemObject.PhysicalAdapter ) Then
         PhysicalAdapter := String ( FWbemObject.PhysicalAdapter ) ;
      Except
      End ;
      If NOT VarIsNull ( FWbemObject.PNPDeviceID ) Then
         PNPDeviceID := String ( FWbemObject.PNPDeviceID ) ;
      If NOT VarIsNull ( FWbemObject.PowerManagementCapabilities ) Then
         PowerManagementCapabilities := String ( FWbemObject.PowerManagementCapabilities ) ;
      If NOT VarIsNull ( FWbemObject.PowerManagementSupported ) Then
         PowerManagementSupported := String ( FWbemObject.PowerManagementSupported ) ;
      If NOT VarIsNull ( FWbemObject.ProductName ) Then
         ProductName := String ( FWbemObject.ProductName ) ;
      If NOT VarIsNull ( FWbemObject.ServiceName ) Then
         ServiceName := String ( FWbemObject.ServiceName ) ;
      If NOT VarIsNull ( FWbemObject.Speed ) Then
         Speed := String ( FWbemObject.Speed ) ;
      If NOT VarIsNull ( FWbemObject.Status ) Then
         Status := String ( FWbemObject.Status ) ;
      If NOT VarIsNull ( FWbemObject.StatusInfo ) Then
         StatusInfo := String ( FWbemObject.StatusInfo ) ;
      If NOT VarIsNull ( FWbemObject.SystemCreationClassName ) Then
         SystemCreationClassName := String ( FWbemObject.SystemCreationClassName ) ;
      If NOT VarIsNull ( FWbemObject.SystemName ) Then
         SystemName := String ( FWbemObject.SystemName ) ;
      If NOT VarIsNull ( FWbemObject.TimeOfLastReset ) Then
         TimeOfLastReset := String ( FWbemObject.TimeOfLastReset ) ;
   End ;
   (*
   Try
      If NOT VarIsClear(FWbemObject.IPAddress) AND
         NOT VarIsNull(FWbemObject.IPAddress) Then Begin
         For i := VarArrayLowBound ( FWbemObject.IPAddress, 1 )
             To VarArrayHighBound ( FWbemObject.IPAddress, 1 ) Do Begin
            If NOT VarIsNull ( FWbemObject.IPAddress ) Then Begin
               If Length ( String ( FWbemObject.IpAddress[i] ) ) > 15 Then Begin
                  Continue ;
               End ;
            End Else Begin
               Continue ;
            End ;
            Inc ( Sup.Cnt_Interfaces_de_Rede ) ;
            SetLength ( Sup.Interfaces_de_Rede, Sup.Cnt_Interfaces_de_Rede ) ;
            If NOT VarIsNull ( FWbemObject.IPAddress ) Then Begin
               Sup.Interfaces_de_Rede[Sup.Cnt_Interfaces_de_Rede-1].IPAddress := String ( FWbemObject.IpAddress[i] ) ;
            End Else Begin
               Sup.Interfaces_de_Rede[Sup.Cnt_Interfaces_de_Rede-1].IPAddress := '?' ;
            End ;
            If NOT VarIsNull ( FWbemObject.DHCPServer ) Then Begin
               Sup.Interfaces_de_Rede[Sup.Cnt_Interfaces_de_Rede-1].DHCPServer := String ( FWbemObject.DHCPServer[i] ) ;
            End Else Begin
               Sup.Interfaces_de_Rede[Sup.Cnt_Interfaces_de_Rede-1].DHCPServer := '?' ;
            End ;
            If NOT VarIsNull ( FWbemObject.DHCPEnabled ) Then Begin
               Sup.Interfaces_de_Rede[Sup.Cnt_Interfaces_de_Rede-1].DHCPEnabled := FWbemObject.DHCPEnabled ;
            End Else Begin
               Sup.Interfaces_de_Rede[Sup.Cnt_Interfaces_de_Rede-1].DHCPEnabled := FALSE ;
            End ;
            {
            If NOT VarIsNull ( FWbemObject.DHCPLeaseObtained ) Then Begin
               Sup.Interfaces_de_Rede[Sup.Cnt_Interfaces_de_Rede-1].DHCPLeaseObtained := FileDateToDateTime ( FWbemObject.DHCPLeaseObtained ) ;
            End Else Begin
               Sup.Interfaces_de_Rede[Sup.Cnt_Interfaces_de_Rede-1].DHCPLeaseObtained := 0 ;
            End ;
            }
            If NOT VarIsNull ( FWbemObject.Caption ) Then Begin
               Sup.Interfaces_de_Rede[Sup.Cnt_Interfaces_de_Rede-1].Caption := String ( FWbemObject.Caption ) ;
            End Else Begin
               Sup.Interfaces_de_Rede[Sup.Cnt_Interfaces_de_Rede-1].Caption := '?' ;
            End ;
            If NOT VarIsNull ( FWbemObject.DNSDomain ) Then Begin
               Sup.Interfaces_de_Rede[Sup.Cnt_Interfaces_de_Rede-1].DNSDomain := String ( FWbemObject.DNSDomain ) ;
            End Else Begin
               Sup.Interfaces_de_Rede[Sup.Cnt_Interfaces_de_Rede-1].DNSDomain := '?' ;
            End ;
            If NOT VarIsNull ( FWbemObject.DNSHostName ) Then Begin
               Sup.Interfaces_de_Rede[Sup.Cnt_Interfaces_de_Rede-1].DNSHostName := String ( FWbemObject.DNSHostName ) ;
            End Else Begin
               Sup.Interfaces_de_Rede[Sup.Cnt_Interfaces_de_Rede-1].DNSHostName := '?' ;
            End ;
            If NOT VarIsNull ( FWbemObject.MacAddress ) Then Begin
               Sup.Interfaces_de_Rede[Sup.Cnt_Interfaces_de_Rede-1].MacAddress := String ( FWbemObject.MacAddress ) ;
            End Else Begin
               Sup.Interfaces_de_Rede[Sup.Cnt_Interfaces_de_Rede-1].MacAddress := '?' ;
            End ;
            If NOT VarIsNull ( FWbemObject.ServiceName ) Then Begin
               Sup.Interfaces_de_Rede[Sup.Cnt_Interfaces_de_Rede-1].ServiceName := String ( FWbemObject.ServiceName ) ;
            End Else Begin
               Sup.Interfaces_de_Rede[Sup.Cnt_Interfaces_de_Rede-1].ServiceName := '?' ;
            End ;
            If NOT VarIsNull ( FWbemObject.NumForwardPackets ) Then Begin
               Sup.Interfaces_de_Rede[Sup.Cnt_Interfaces_de_Rede-1].Pacotes := FWbemObject.NumForwardPackets ;
            End Else Begin
               Sup.Interfaces_de_Rede[Sup.Cnt_Interfaces_de_Rede-1].Pacotes := 0 ;
            End ;
            If NOT VarIsNull ( FWbemObject.IGMPLevel ) Then Begin
               Sup.Interfaces_de_Rede[Sup.Cnt_Interfaces_de_Rede-1].IGMP := String ( FWbemObject.IGMPLevel ) ;
            End Else Begin
               Sup.Interfaces_de_Rede[Sup.Cnt_Interfaces_de_Rede-1].IGMP := '?' ;
            End ;
            Inc ( Qtde ) ;
            If Assigned ( MISC_LB_Checar_Rede ) Then Begin
               If MISC_LB_Checar_Rede.Items.Count < Qtde Then Begin
                  MISC_LB_Checar_Rede.Items.Add ( '' ) ;
               End ;
               Aux := '[' + IntToStr(Qtde-1) + '] ' +
                      '[IP ' + Sup.Interfaces_de_Rede[Sup.Cnt_Interfaces_de_Rede-1].IPAddress + '] ' +
                      IIF ( Sup.Interfaces_de_Rede[Sup.Cnt_Interfaces_de_Rede-1].DHCPEnabled ,
                            '[DHCP ' + Sup.Interfaces_de_Rede[Sup.Cnt_Interfaces_de_Rede-1].DHCPServer +
      //                      ', ' + DateTimeToStr ( Sup.Interfaces_de_Rede[Sup.Cnt_Interfaces_de_Rede-1].DHCPLeaseObtained ) +
                            '] ' ,
                            '' ) +
                      '[DNS ' + Sup.Interfaces_de_Rede[Sup.Cnt_Interfaces_de_Rede-1].DNSDomain + '@' +
                                Sup.Interfaces_de_Rede[Sup.Cnt_Interfaces_de_Rede-1].DNSHostName + '] ' +
                      '[CAP ' + Sup.Interfaces_de_Rede[Sup.Cnt_Interfaces_de_Rede-1].Caption + '] ' +
                      '[MAC ' + Sup.Interfaces_de_Rede[Sup.Cnt_Interfaces_de_Rede-1].MACAddress + '] ' +
                      '[Pct ' + InttoStr ( Sup.Interfaces_de_Rede[Sup.Cnt_Interfaces_de_Rede-1].Pacotes) + '] ' +
                      '[Svc ' + Sup.Interfaces_de_Rede[Sup.Cnt_Interfaces_de_Rede-1].ServiceName + '] ' +
                      '[IGMP ' + Sup.Interfaces_de_Rede[Sup.Cnt_Interfaces_de_Rede-1].IGMP + '] ' +
      //                        String(FWbemObject.DefaulIPGateway[i]) + ' '
                      '' ;
               MISC_LB_Checar_Rede.Items[Qtde-1] := Aux ;
               Result.Add ( Sup.Interfaces_de_Rede[Sup.Cnt_Interfaces_de_Rede-1].IPAddress ) ;
            End ;
         End ;
      End ;
      FWbemObject := UnAssigned ;
   Except
      On E : Exception Do Begin
         PUT_LOG ( 'Exception GET_IP [' + E.Message + ']' ) ;
      End ;
   End ;
   *)
End ;
Sup.Qtde_Interfaces := Sup.Cnt_Interfaces_de_Rede ;
(*
If Assigned ( MISC_LB_Checar_Rede ) Then Begin
   While MISC_LB_Checar_Rede.Items.Count > Qtde Do Begin
      MISC_LB_Checar_Rede.Items.Delete ( MISC_LB_Checar_Rede.Items.Count - 1 ) ;
   End ;
End ;
*)
End ;

Function CHECAR_INTERFACES_DE_REDE ( PN : TPanel ; LB : TListBox ; Var Qtde : LongInt ) : TStringList ;
Begin
MISC_LB_Checar_Rede := LB ;
MISC_PN_Checar_Rede := PN ;
Result := TStringList.Create ;
//Result := TASK_CHECAR_INTERFACES_DE_REDE ( Qtde ) ;
//GET_WIN32_NETWORK_ADAPTER ;
{
SetLength ( Tasks, Length(Tasks)+1 ) ;
Tasks[Length(Tasks)-1] := TTask.Create ( TASK_CHECAR_INTERFACES_DE_REDE ) ;
Tasks[Length(Tasks)-1].Start ;
}
End ;

Procedure GET_WIN32_NETWORK_CONFIGURATION ;
Const wbemFlagForwardOnly = $00000020 ;
Var FSWbemLocator : OLEVariant ;
    FWMIService   : OLEVariant ;
    FWbemObjectSet: OLEVariant ;
    FWbemObject   : OLEVariant ;
    oEnum         : IEnumvariant ;
    iValue        : LongWord ;
Begin
Sup.Qtde_Interfaces := 0 ;
Sup.Cnt_Interfaces_de_Rede := 0 ;
//Result := TStringList.Create ;
//Result.Clear ;
//Qtde := 0 ;
FSWbemLocator := CreateOleObject ( 'WbemScripting.SWbemLocator' ) ;
FWMIService := FSWbemLocator.ConnectServer ( 'localhost', 'root\CIMV2', '', '' ) ;
FWbemObjectSet := FWMIService.ExecQuery ( 'SELECT * FROM Win32_NetworkAdapterConfiguration', 'WQL', wbemFlagForwardOnly ) ;
oEnum := IUnknown(FWbemObjectSet._NewEnum) As IEnumVariant ;
//_DHCP := '' ;
//_IP := '' ;
SetLength ( Sup.Interfaces_de_Rede, 0 ) ;
If Assigned ( MISC_PN_Checar_Rede ) Then Begin
   MISC_PN_Checar_Rede.Caption := 'Interfaces de Rede - ' + TimeToStr ( Now ) ;
End ;
SetLength ( Sup.Info_Windows.Win32_Net_Config, 0 ) ;
While oEnum.Next ( 1, FWbemObject, iValue ) = 0 Do Begin
   SetLength ( Sup.Info_Windows.Win32_Net_Config,
               Length ( Sup.Info_Windows.Win32_Net_Config ) + 1 ) ;
   With Sup.Info_Windows.Win32_Net_Config[Length(Sup.Info_Windows.Win32_Net_Config)-1] Do Begin
      If NOT VarIsNull ( FWbemObject.ArpAlwaysSourceRoute ) Then
         ArpAlwaysSourceRoute := String ( FWbemObject.ArpAlwaysSourceRoute ) ;
      If NOT VarIsNull ( FWbemObject.ArpUseEtherSNAP ) Then
         ArpUseEtherSNAP := String ( FWbemObject.ArpUseEtherSNAP ) ;
      If NOT VarIsNull ( FWbemObject.Caption ) Then
         Caption := String ( FWbemObject.Caption ) ;
      If NOT VarIsNull ( FWbemObject.DatabasePath ) Then
         DatabasePath := String ( FWbemObject.DatabasePath ) ;
      If NOT VarIsNull ( FWbemObject.DeadGWDetectEnabled ) Then
         DeadGWDetectEnabled := String ( FWbemObject.DeadGWDetectEnabled ) ;
      If NOT VarIsNull ( FWbemObject.DefaultIPGateway ) Then
         DefaultIPGateway := OLE_ARRAY_TO_STRING ( FWbemObject.DefaultIPGateway ) ;
      If NOT VarIsNull ( FWbemObject.DefaultTOS ) Then
         DefaultTOS := String ( FWbemObject.DefaultTOS ) ;
      If NOT VarIsNull ( FWbemObject.DefaultTTL ) Then
         DefaultTTL := String ( FWbemObject.DefaultTTL ) ;
      If NOT VarIsNull ( FWbemObject.Description ) Then
         Description := String ( FWbemObject.Description ) ;
      Try
      If NOT VarIsNull ( FWbemObject.HCPEnabled ) Then
         HCPEnabled := String ( FWbemObject.HCPEnabled ) ;
      Except
      End ;
      If NOT VarIsNull ( FWbemObject.DHCPLeaseExpires ) Then
         DHCPLeaseExpires := String ( FWbemObject.DHCPLeaseExpires ) ;
      If NOT VarIsNull ( FWbemObject.DHCPLeaseObtained ) Then
         DHCPLeaseObtained := String ( FWbemObject.DHCPLeaseObtained ) ;
      If NOT VarIsNull ( FWbemObject.DHCPServer ) Then
         DHCPServer := String ( FWbemObject.DHCPServer ) ;
      If NOT VarIsNull ( FWbemObject.DNSDomain ) Then
         DNSDomain := String ( FWbemObject.DNSDomain ) ;
      If NOT VarIsNull ( FWbemObject.DNSDomainSuffixSearchOrder ) Then
         DNSDomainSuffixSearchOrder := OLE_ARRAY_TO_STRING ( FWbemObject.DNSDomainSuffixSearchOrder ) ;
      If NOT VarIsNull ( FWbemObject.DNSEnabledForWINSResolution ) Then
         DNSEnabledForWINSResolution := String ( FWbemObject.DNSEnabledForWINSResolution ) ;
      If NOT VarIsNull ( FWbemObject.DNSHostName ) Then
         DNSHostName := String ( FWbemObject.DNSHostName ) ;
      If NOT VarIsNull ( FWbemObject.DNSServerSearchOrder ) Then
         DNSServerSearchOrder := OLE_ARRAY_TO_STRING ( FWbemObject.DNSServerSearchOrder ) ;
      If NOT VarIsNull ( FWbemObject.DomainDNSRegistrationEnabled ) Then
         DomainDNSRegistrationEnabled := String ( FWbemObject.DomainDNSRegistrationEnabled ) ;
      If NOT VarIsNull ( FWbemObject.ForwardBufferMemory ) Then
         ForwardBufferMemory := String ( FWbemObject.ForwardBufferMemory ) ;
      If NOT VarIsNull ( FWbemObject.FullDNSRegistrationEnabled ) Then
         FullDNSRegistrationEnabled := String ( FWbemObject.FullDNSRegistrationEnabled ) ;
      If NOT VarIsNull ( FWbemObject.GatewayCostMetric ) Then
         GatewayCostMetric := OLE_ARRAY_TO_STRING ( FWbemObject.GatewayCostMetric ) ;
      If NOT VarIsNull ( FWbemObject.IGMPLevel ) Then
         IGMPLevel := String ( FWbemObject.IGMPLevel ) ;
      If NOT VarIsNull ( FWbemObject.Index ) Then
         Index := String ( FWbemObject.Index ) ;
      Try
      If NOT VarIsNull ( FWbemObject.InterfaceIndex ) Then
         InterfaceIndex := String ( FWbemObject.InterfaceIndex ) ;
      Except
      End ;
      If NOT VarIsNull ( FWbemObject.IPAddress ) Then
         IPAddress := OLE_ARRAY_TO_STRING ( FWbemObject.IPAddress ) ;
      If NOT VarIsNull ( FWbemObject.IPConnectionMetric ) Then
         IPConnectionMetric := String ( FWbemObject.IPConnectionMetric ) ;
      If NOT VarIsNull ( FWbemObject.IPEnabled ) Then
         IPEnabled := String ( FWbemObject.IPEnabled ) ;
      If NOT VarIsNull ( FWbemObject.IPFilterSecurityEnabled ) Then
         IPFilterSecurityEnabled := String ( FWbemObject.IPFilterSecurityEnabled ) ;
      If NOT VarIsNull ( FWbemObject.IPPortSecurityEnabled ) Then
         IPPortSecurityEnabled := String ( FWbemObject.IPPortSecurityEnabled ) ;
      If NOT VarIsNull ( FWbemObject.IPSecPermitIPProtocols ) Then
         IPSecPermitIPProtocols := OLE_ARRAY_TO_STRING ( FWbemObject.IPSecPermitIPProtocols ) ;
      If NOT VarIsNull ( FWbemObject.IPSecPermitTCPPorts ) Then
         IPSecPermitTCPPorts := OLE_ARRAY_TO_STRING ( FWbemObject.IPSecPermitTCPPorts ) ;
      If NOT VarIsNull ( FWbemObject.IPSecPermitUDPPorts ) Then
         IPSecPermitUDPPorts := OLE_ARRAY_TO_STRING ( FWbemObject.IPSecPermitUDPPorts ) ;
      If NOT VarIsNull ( FWbemObject.IPSubnet ) Then
         IPSubnet := OLE_ARRAY_TO_STRING ( FWbemObject.IPSubnet ) ;
      If NOT VarIsNull ( FWbemObject.IPUseZeroBroadcast ) Then
         IPUseZeroBroadcast := String ( FWbemObject.IPUseZeroBroadcast ) ;
      If NOT VarIsNull ( FWbemObject.IPXAddress ) Then
         IPXAddress := String ( FWbemObject.IPXAddress ) ;
      If NOT VarIsNull ( FWbemObject.IPXEnabled ) Then
         IPXEnabled := String ( FWbemObject.IPXEnabled ) ;
      If NOT VarIsNull ( FWbemObject.IPXFrameType ) Then
         IPXFrameType := OLE_ARRAY_TO_STRING ( FWbemObject.IPXFrameType ) ;
      If NOT VarIsNull ( FWbemObject.IPXMediaType ) Then
         IPXMediaType := String ( FWbemObject.IPXMediaType ) ;
      If NOT VarIsNull ( FWbemObject.IPXNetworkNumber ) Then
         IPXNetworkNumber := OLE_ARRAY_TO_STRING ( FWbemObject.IPXNetworkNumber ) ;
      If NOT VarIsNull ( FWbemObject.IPXVirtualNetNumber ) Then
         IPXVirtualNetNumber := String ( FWbemObject.IPXVirtualNetNumber ) ;
      If NOT VarIsNull ( FWbemObject.KeepAliveInterval ) Then
         KeepAliveInterval := String ( FWbemObject.KeepAliveInterval ) ;
      If NOT VarIsNull ( FWbemObject.KeepAliveTime ) Then
         KeepAliveTime := String ( FWbemObject.KeepAliveTime ) ;
      If NOT VarIsNull ( FWbemObject.MACAddress ) Then
         MACAddress := String ( FWbemObject.MACAddress ) ;
      If NOT VarIsNull ( FWbemObject.MTU ) Then
         MTU := String ( FWbemObject.MTU ) ;
      If NOT VarIsNull ( FWbemObject.NumForwardPackets ) Then
         NumForwardPackets := String ( FWbemObject.NumForwardPackets ) ;
      If NOT VarIsNull ( FWbemObject.PMTUBHDetectEnabled ) Then
         PMTUBHDetectEnabled := String ( FWbemObject.PMTUBHDetectEnabled ) ;
      If NOT VarIsNull ( FWbemObject.PMTUDiscoveryEnabled ) Then
         PMTUDiscoveryEnabled := String ( FWbemObject.PMTUDiscoveryEnabled ) ;
      If NOT VarIsNull ( FWbemObject.ServiceName ) Then
         ServiceName := String ( FWbemObject.ServiceName ) ;
      If NOT VarIsNull ( FWbemObject.SettingID ) Then
         SettingID := String ( FWbemObject.SettingID ) ;
      If NOT VarIsNull ( FWbemObject.TcpipNetbiosOptions ) Then
         TcpipNetbiosOptions := String ( FWbemObject.TcpipNetbiosOptions ) ;
      If NOT VarIsNull ( FWbemObject.TcpMaxConnectRetransmissions ) Then
         TcpMaxConnectRetransmissions := String ( FWbemObject.TcpMaxConnectRetransmissions ) ;
      If NOT VarIsNull ( FWbemObject.TcpMaxDataRetransmissions ) Then
         TcpMaxDataRetransmissions := String ( FWbemObject.TcpMaxDataRetransmissions ) ;
      If NOT VarIsNull ( FWbemObject.TcpNumConnections ) Then
         TcpNumConnections := String ( FWbemObject.TcpNumConnections ) ;
      If NOT VarIsNull ( FWbemObject.TcpUseRFC1122UrgentPointer ) Then
         TcpUseRFC1122UrgentPointer := String ( FWbemObject.TcpUseRFC1122UrgentPointer ) ;
      If NOT VarIsNull ( FWbemObject.TcpWindowSize ) Then
         TcpWindowSize := String ( FWbemObject.TcpWindowSize ) ;
      If NOT VarIsNull ( FWbemObject.WINSEnableLMHostsLookup ) Then
         WINSEnableLMHostsLookup := String ( FWbemObject.WINSEnableLMHostsLookup ) ;
      If NOT VarIsNull ( FWbemObject.WINSHostLookupFile ) Then
         WINSHostLookupFile := String ( FWbemObject.WINSHostLookupFile ) ;
      If NOT VarIsNull ( FWbemObject.WINSPrimaryServer ) Then
         WINSPrimaryServer := String ( FWbemObject.WINSPrimaryServer ) ;
      If NOT VarIsNull ( FWbemObject.WINSScopeID ) Then
         WINSScopeID := String ( FWbemObject.WINSScopeID ) ;
      If NOT VarIsNull ( FWbemObject.WINSSecondaryServer ) Then
         WINSSecondaryServer := String ( FWbemObject.WINSSecondaryServer ) ;
   End ;
   (*
   Try
      If NOT VarIsClear(FWbemObject.IPAddress) AND
         NOT VarIsNull(FWbemObject.IPAddress) Then Begin
         For i := VarArrayLowBound ( FWbemObject.IPAddress, 1 )
             To VarArrayHighBound ( FWbemObject.IPAddress, 1 ) Do Begin
            If NOT VarIsNull ( FWbemObject.IPAddress ) Then Begin
               If Length ( String ( FWbemObject.IpAddress[i] ) ) > 15 Then Begin
                  Continue ;
               End ;
            End Else Begin
               Continue ;
            End ;
            Inc ( Sup.Cnt_Interfaces_de_Rede ) ;
            SetLength ( Sup.Interfaces_de_Rede, Sup.Cnt_Interfaces_de_Rede ) ;
            If NOT VarIsNull ( FWbemObject.IPAddress ) Then Begin
               Sup.Interfaces_de_Rede[Sup.Cnt_Interfaces_de_Rede-1].IPAddress := String ( FWbemObject.IpAddress[i] ) ;
            End Else Begin
               Sup.Interfaces_de_Rede[Sup.Cnt_Interfaces_de_Rede-1].IPAddress := '?' ;
            End ;
            If NOT VarIsNull ( FWbemObject.DHCPServer ) Then Begin
               Sup.Interfaces_de_Rede[Sup.Cnt_Interfaces_de_Rede-1].DHCPServer := String ( FWbemObject.DHCPServer[i] ) ;
            End Else Begin
               Sup.Interfaces_de_Rede[Sup.Cnt_Interfaces_de_Rede-1].DHCPServer := '?' ;
            End ;
            If NOT VarIsNull ( FWbemObject.DHCPEnabled ) Then Begin
               Sup.Interfaces_de_Rede[Sup.Cnt_Interfaces_de_Rede-1].DHCPEnabled := FWbemObject.DHCPEnabled ;
            End Else Begin
               Sup.Interfaces_de_Rede[Sup.Cnt_Interfaces_de_Rede-1].DHCPEnabled := FALSE ;
            End ;
            {
            If NOT VarIsNull ( FWbemObject.DHCPLeaseObtained ) Then Begin
               Sup.Interfaces_de_Rede[Sup.Cnt_Interfaces_de_Rede-1].DHCPLeaseObtained := FileDateToDateTime ( FWbemObject.DHCPLeaseObtained ) ;
            End Else Begin
               Sup.Interfaces_de_Rede[Sup.Cnt_Interfaces_de_Rede-1].DHCPLeaseObtained := 0 ;
            End ;
            }
            If NOT VarIsNull ( FWbemObject.Caption ) Then Begin
               Sup.Interfaces_de_Rede[Sup.Cnt_Interfaces_de_Rede-1].Caption := String ( FWbemObject.Caption ) ;
            End Else Begin
               Sup.Interfaces_de_Rede[Sup.Cnt_Interfaces_de_Rede-1].Caption := '?' ;
            End ;
            If NOT VarIsNull ( FWbemObject.DNSDomain ) Then Begin
               Sup.Interfaces_de_Rede[Sup.Cnt_Interfaces_de_Rede-1].DNSDomain := String ( FWbemObject.DNSDomain ) ;
            End Else Begin
               Sup.Interfaces_de_Rede[Sup.Cnt_Interfaces_de_Rede-1].DNSDomain := '?' ;
            End ;
            If NOT VarIsNull ( FWbemObject.DNSHostName ) Then Begin
               Sup.Interfaces_de_Rede[Sup.Cnt_Interfaces_de_Rede-1].DNSHostName := String ( FWbemObject.DNSHostName ) ;
            End Else Begin
               Sup.Interfaces_de_Rede[Sup.Cnt_Interfaces_de_Rede-1].DNSHostName := '?' ;
            End ;
            If NOT VarIsNull ( FWbemObject.MacAddress ) Then Begin
               Sup.Interfaces_de_Rede[Sup.Cnt_Interfaces_de_Rede-1].MacAddress := String ( FWbemObject.MacAddress ) ;
            End Else Begin
               Sup.Interfaces_de_Rede[Sup.Cnt_Interfaces_de_Rede-1].MacAddress := '?' ;
            End ;
            If NOT VarIsNull ( FWbemObject.ServiceName ) Then Begin
               Sup.Interfaces_de_Rede[Sup.Cnt_Interfaces_de_Rede-1].ServiceName := String ( FWbemObject.ServiceName ) ;
            End Else Begin
               Sup.Interfaces_de_Rede[Sup.Cnt_Interfaces_de_Rede-1].ServiceName := '?' ;
            End ;
            If NOT VarIsNull ( FWbemObject.NumForwardPackets ) Then Begin
               Sup.Interfaces_de_Rede[Sup.Cnt_Interfaces_de_Rede-1].Pacotes := FWbemObject.NumForwardPackets ;
            End Else Begin
               Sup.Interfaces_de_Rede[Sup.Cnt_Interfaces_de_Rede-1].Pacotes := 0 ;
            End ;
            If NOT VarIsNull ( FWbemObject.IGMPLevel ) Then Begin
               Sup.Interfaces_de_Rede[Sup.Cnt_Interfaces_de_Rede-1].IGMP := String ( FWbemObject.IGMPLevel ) ;
            End Else Begin
               Sup.Interfaces_de_Rede[Sup.Cnt_Interfaces_de_Rede-1].IGMP := '?' ;
            End ;
            //Inc ( Qtde ) ;
            If Assigned ( MISC_LB_Checar_Rede ) Then Begin
               If MISC_LB_Checar_Rede.Items.Count < Qtde Then Begin
                  MISC_LB_Checar_Rede.Items.Add ( '' ) ;
               End ;
               Aux := '[' + IntToStr(Qtde-1) + '] ' +
                      '[IP ' + Sup.Interfaces_de_Rede[Sup.Cnt_Interfaces_de_Rede-1].IPAddress + '] ' +
                      IIF ( Sup.Interfaces_de_Rede[Sup.Cnt_Interfaces_de_Rede-1].DHCPEnabled ,
                            '[DHCP ' + Sup.Interfaces_de_Rede[Sup.Cnt_Interfaces_de_Rede-1].DHCPServer +
      //                      ', ' + DateTimeToStr ( Sup.Interfaces_de_Rede[Sup.Cnt_Interfaces_de_Rede-1].DHCPLeaseObtained ) +
                            '] ' ,
                            '' ) +
                      '[DNS ' + Sup.Interfaces_de_Rede[Sup.Cnt_Interfaces_de_Rede-1].DNSDomain + '@' +
                                Sup.Interfaces_de_Rede[Sup.Cnt_Interfaces_de_Rede-1].DNSHostName + '] ' +
                      '[CAP ' + Sup.Interfaces_de_Rede[Sup.Cnt_Interfaces_de_Rede-1].Caption + '] ' +
                      '[MAC ' + Sup.Interfaces_de_Rede[Sup.Cnt_Interfaces_de_Rede-1].MACAddress + '] ' +
                      '[Pct ' + InttoStr ( Sup.Interfaces_de_Rede[Sup.Cnt_Interfaces_de_Rede-1].Pacotes) + '] ' +
                      '[Svc ' + Sup.Interfaces_de_Rede[Sup.Cnt_Interfaces_de_Rede-1].ServiceName + '] ' +
                      '[IGMP ' + Sup.Interfaces_de_Rede[Sup.Cnt_Interfaces_de_Rede-1].IGMP + '] ' +
      //                        String(FWbemObject.DefaulIPGateway[i]) + ' '
                      '' ;
               MISC_LB_Checar_Rede.Items[Qtde-1] := Aux ;
               Result.Add ( Sup.Interfaces_de_Rede[Sup.Cnt_Interfaces_de_Rede-1].IPAddress ) ;
            End ;
         End ;
      End ;
      FWbemObject := UnAssigned ;
   Except
      On E : Exception Do Begin
         PUT_LOG ( 'Exception GET_IP [' + E.Message + ']' ) ;
      End ;
   End ;
   *)
End ;
Sup.Qtde_Interfaces := Sup.Cnt_Interfaces_de_Rede ;
(*
If Assigned ( MISC_LB_Checar_Rede ) Then Begin
   While MISC_LB_Checar_Rede.Items.Count > Qtde Do Begin
      MISC_LB_Checar_Rede.Items.Delete ( MISC_LB_Checar_Rede.Items.Count - 1 ) ;
   End ;
End ;
*)
End ;

Function GET_VIDEO_PIXELS ( _Form : TForm ) : LongInt ;
Var DC: hDC;
Begin
DC := GetDC (_Form.Handle ) ;
Result := GetDeviceCaps ( DC, LOGPIXELSX) ;
ReleaseDC ( _Form.Handle, DC ) ;
End ;

Function GET_TIME_SYSTEM_INFO : String ;
Var ZoneInfo: TTimeZoneInformation;
Begin
GetTimeZoneInformation(ZoneInfo);
Result := '' ;
Result := Result + 'Bias: '+ IntToStr(ZoneInfo.Bias) + sLineBreak ;
Result := Result + 'StandardName: '+ZoneInfo.StandardName + sLineBreak ;
Result := Result + 'StandardBias: '+IntToStr(ZoneInfo.StandardBias) + sLineBreak ;
Result := Result + 'DaylightName: '+ZoneInfo.DaylightName+ sLineBreak ;
Result := Result + 'DaylightBias: '+IntToStr(ZoneInfo.DaylightBias) + sLineBreak ;
End ;

Function GET_VIDEO_MODES : String ;
Var ModeNumber  : LongInt ;
    //j           : LongInt ;
    //MyMode      : TDeviceModeA ;
    MyMode      : TDeviceMode ;
    Check       : Boolean ;
    //Need        : Boolean ;
    //Str         : String ;
Begin
Result := '' ;
ModeNumber := 0 ;
Check := TRUE ;
While(Check) Do
   Begin
   Check := EnumDisplaySettings(Nil, ModeNumber, MyMode) ;
   Result := Result +
             'Configura??o de v?deo ' + IntToStr(ModeNumber) + ': ' +
             IntToStr(MyMode.dmPelsWidth) + ' x ' + IntToStr(MyMode.dmPelsHeight) +
             sLineBreak ;
   {
   Need := FALSE ;
   For j:=0 to Memo1.Lines.Count-1 Do
      If Memo1.Lines[j]=Str Then
         Need := TRUE ;
   If Need=False Then
      Memo1.Lines.Add(Str) ;
   }
   Inc(ModeNumber);
   End ;
End ;

(*
Procedure TASK_CHECAR_DRIVES_LOGICOS ;
Var Local     : LongInt ;
    _Free     : Int64 ;
    Tick      : Cardinal ;
    Tick_Size : Cardinal ;
    Indice    : LongInt ;
    Drive2    : Char ;
    Drive     : String ;
    PathStr   : Array[0..MAX_PATH] Of Char ;
    LPathStr  : DWord ;
    FreeAvailable ,
    TotalSpace    : Int64 ;
Begin
Tick := GetTickCount ;
//PUT_LOG ( 'INI TASK_CHECAR_DRIVES' ) ;
If NOT Assigned ( Sup.Sup_ME_Drives ) Then Begin
   PUT_LOG ( 'ABORT TASK_CHECAR_DRIVES_LOGICOS / !Assigned Sup_ME_Drives' ) ;
   Exit ;
End ;
Sup.Sup_ME_Drives.Lines.Clear ;
Sup.Sup_ME_Drives.Lines.Add ( DateTimeToStr ( Now ) ) ;
//
For Local := 1 To 26 Do Begin
   Sup.Discos[Local].Ativo := FALSE ;
   //Sup.Discos[Local].Total := 0 ;
   //Sup.Discos[Local].Livre := 0 ;
   //Sup.Discos[Local].IsRede := FALSE ;
   Sup.Discos[Local].Erro := FALSE ;
   Sup.Discos[Local].Resposta := 0 ;
   //Sup.Discos[Local].Perc_Livre := 0 ;
End ;
{
//
Sup.Sup_ME_Drives.Lines.Add ( 'Unidades mapeadas a partir da rede:' ) ;
LPathStr := MAX_PATH ;
Sup.Sup_Drives_de_Rede.Clear ;
For Local := 1 To 26 Do Begin
   Sup.PN_Drives[Local].OK := FALSE ;
End ;
For Local := 1 To 26 Do Begin
   Drive2 := Chr ( Local + 64 ) ;
   If WNetGetConnection( PChar ('' + Drive2 + ':' ), PathStr, LPathStr) = NO_ERROR Then Begin
      Sup.Discos[Local].IsRede := TRUE ;
      Sup.Sup_Drives_de_Rede.Add ( Drive2 + ':' ) ;
      Sup.Sup_ME_Drives.Lines.Add ( 'Drive de rede encontrado: ' + Drive2 + ':' ) ;
   End ;
End ;
Sup.Sup_ME_Drives.Lines.Add ( '' ) ;
}
//
Sup.Sup_Drives := System.IOUtils.TDirectory.GetLogicalDrives ;
Sup.Sup_ME_Drives.Lines.Add ( 'Drives l?gicos (Qtde=' + IntToStr(Length(Sup.Sup_Drives)) + '):' ) ;
For Local := 1 To Length(Sup.Sup_Drives) Do Begin
   Indice := Ord ( UpperCase(Sup.Sup_Drives[Local-1])[1] ) - 64 ;
   Sup.PN_Drives[Indice].OK := TRUE ;
   If NOT Sup.PN_Drives[Indice].Disponivel Then Begin
      Sup.PN_Drives[Indice].Last_OK := Now ;
      PUT_LOG ( 'ATRIBUINDO NOVA_MIDIA INDICE ' + IntToStr ( Indice ) ) ;
      Sup.PN_Drives[Indice].Nova_Midia := TRUE ;
   End ;
   Sup.PN_Drives[Indice].Disponivel := TRUE ;
   Sup.Discos[Indice].Ativo := TRUE ;
   If Sup.Discos[Indice].IsRede Then Begin
      Sup.Sup_ME_Drives.Lines.Add ( Sup.Sup_Drives[Local-1] + ' (DRIVE DE REDE)' ) ;
      Continue ;
   End ;
   If ( Length(Sup.Sup_Drives[Local-1]) = 3 ) Then Begin
      Tick_Size := GetTickCount ;
      Try
         //Sup.Discos[Indice].Total := DiskSize ( Indice ) DIV _1MB ;
         Drive := Chr ( Indice + 64 ) + ':\' ;
         If Indice = 5 Then Begin
            PUT_LOG ( 'DRIVE 5 P1' ) ;
         End ;
         If System.SysUtils.GetDiskFreeSpaceEx(PChar(Drive), FreeAvailable, TotalSpace, nil) Then Begin
            If Indice = 5 Then Begin
               PUT_LOG ( 'DRIVE 5 P2' ) ;
            End ;
            Sup.Discos[Indice].Total := TotalSpace DIV _1MB ;
//            Writeln(TotalSpace div (1024*1024*1024), 'GB total');
//            Writeln(FreeAvailable div (1024*1024*1024), 'GB free');
         End Else Begin
            If Indice = 5 Then Begin
               PUT_LOG ( 'DRIVE 5 P3' ) ;
            End ;
            Sup.Discos[Indice].Total := -1 ;
         End ;
      Except
         On E: Exception Do Begin
            If Indice = 5 Then Begin
               PUT_LOG ( 'DRIVE 5 P4' ) ;
            End ;
            Sup.Discos[Indice].Total := -1 ;
         End ;
      End ;
      Sup.Discos[Indice].Resposta := GetTickCount - Tick_Size ;
      Sup.Discos[Indice].Erro := ( Sup.Discos[Indice].Resposta > 5000 ) OR
                                 ( Sup.Discos[Indice].Total <= 0 ) ;
      If ( NOT Sup.Discos[Indice].Erro ) AND
         ( Sup.Discos[Indice].Total > 0 ) Then Begin
         Try
            //Sup.Discos[Indice].Livre := DiskFree ( Indice ) DIV _1MB ;
            Sup.Discos[Indice].Livre := FreeAvailable DIV _1MB ;
         Except
            Sup.Discos[Indice].Livre := -1 ;
         End ;
         Sup.Discos[Indice].Perc_Livre := Sup.Discos[Indice].Livre / Sup.Discos[Indice].Total * 100 ;
         Sup.Sup_ME_Drives.Lines.Add ( Sup.Sup_Drives[Local-1] +
                                       NUMERO ( Sup.Discos[Indice].Total, 8 ) + ' MB total ' + ' ' +
                                       '(' + NUMERO ( Sup.Discos[Indice].Livre, 8 ) + ' MB livres, ' +
                                       CASA1_PONTO(Sup.Discos[Indice].Perc_Livre) + '%)' ) ;
      End Else Begin
         Sup.Sup_ME_Drives.Lines.Add ( Sup.Sup_Drives[Local-1] + ' *******' ) ;
      End ;
   End Else Begin
      Sup.Sup_ME_Drives.Lines.Add ( Sup.Sup_Drives[Local-1] + ' *******' ) ;
   End ;
End ;
For Local := 1 To 26 Do Begin
   If NOT Sup.PN_Drives[Local].OK Then Begin
      If Sup.PN_Drives[Local].Disponivel Then Begin
         Sup.PN_Drives[Local].Last_NOK := Now ;
      End ;
      Sup.PN_Drives[Local].Nova_Midia := FALSE ;
      Sup.PN_Drives[Local].Disponivel := FALSE ;
   End ;
End ;
For Local := 3 To 26 Do Begin
   If Assigned ( Sup.PN_Drives[Local].PN ) Then Begin
      If Sup.PN_Drives[Local].Disponivel Then Begin
         If Sup.Discos[Local].Total <= 0 Then Begin
            Sup.PN_Drives[Local].PN.Color := clAmareloBebe ;
            Sup.PN_Drives[Local].PN.Font.Color := clBlack ;
         End Else If Sup.PN_Drives[Local].Last_OK > ( Now - 5/SecsPerDay) Then Begin
            Sup.PN_Drives[Local].PN.Color := clLime ;
            Sup.PN_Drives[Local].PN.Font.Color := clBlack ;
         End Else Begin
            Sup.PN_Drives[Local].PN.Color := clGreen ;
            Sup.PN_Drives[Local].PN.Font.Color := clWhite ;
         End ;
      End Else Begin
         If Sup.PN_Drives[Local].Last_NOK > ( Now - 5/SecsPerDay) Then Begin
            Sup.PN_Drives[Local].PN.Color := clMaroon ;
            Sup.PN_Drives[Local].PN.Font.Color := clWhite ;
         End Else Begin
            Sup.PN_Drives[Local].PN.Color := clSilver ;
            Sup.PN_Drives[Local].PN.Font.Color := clBlack ;
         End ;
      End ;
   End ;
End ;
Sup.Sup_ME_Drives.Lines.Add ( '' ) ;
Sup.Sup_ME_Drives.Lines.Add ( 'Tick {' + IntTostr(GetTickCount-Tick) + ' ms}' ) ;
Sup.Pendente_Checar_Drives := FALSE ;
Sup.FLAG_CHECAR_NOVA_MIDIA := TRUE ;
//PUT_LOG ( 'FIM TASK_CHECAR_DRIVES' ) ;
End ;
*)

Function GET_SIZE_NORMALIZADO ( _Size : Int64 ) : String ;
Var _Original : Int64 ;
Begin
_Original := _Size ;
_Size := _Size DIV 1024 DIV 1024 DIV 1024 ;
If _Size > 12500 Then Begin
   Result := IntToStr ( _Size DIV 1024 ) + ' TB' ;
End Else If _Size > 11000 Then Begin
   Result := '12 TB' ;
End Else If _Size > 9000 Then Begin
   Result := '10 TB' ;
End Else If _Size > 7000 Then Begin
   Result := '8 TB' ;
End Else If _Size > 5000 Then Begin
   Result := '6 TB' ;
End Else If _Size > 3000 Then Begin
   Result := '4 TB' ;
End Else If _Size > 1700 Then Begin
   Result := '2 TB' ;
End Else If _Size > 1300 Then Begin
   Result := '1.5 TB' ;
End Else If _Size > 900 Then Begin
   Result := '1 TB' ;
End Else If _Size > 400 Then Begin
   Result := '500 GB' ;
End Else If _Size > 200 Then Begin
   Result := '250 GB' ;
End Else If _Size > 100 Then Begin
   Result := '128 GB' ;
End Else If _Size > 50 Then Begin
   Result := '64 GB' ;
End Else If _Size > 25 Then Begin
   Result := '32 GB' ;
End Else If _Size > 12 Then Begin
   Result := '16 GB' ;
End Else If _Size > 6 Then Begin
   Result := '8 GB' ;
End Else If _Size < 100 Then Begin
   Result := IntToStr ( _Original DIV 1024 DIV 104 ) + ' MB' ;
End Else If _Size > 3 Then Begin
   Result := '4 GB' ;
End Else Begin
   Result := IntToStr ( _Size ) + ' GB' ;
End ;
End ;

(*
Procedure TASK_CHECAR_DRIVES ;
Var Local     : LongInt ;
    _Free     : Int64 ;
    Tick      : Cardinal ;
    Tick_Size : Cardinal ;
    Indice    : LongInt ;
    Drive2    : Char ;
    PathStr   : Array[0..MAX_PATH] Of Char ;
    LPathStr  : DWord ;
Begin
Tick := GetTickCount ;
//PUT_LOG ( 'INI TASK_CHECAR_DRIVES' ) ;
If NOT Assigned ( Sup.Sup_ME_Drives ) Then Begin
   PUT_LOG ( 'ABORT TASK_CHECAR_DRIVES / !Assigned Sup_ME_Drives' ) ;
   Exit ;
End ;
Sup.Sup_ME_Drives.Lines.Clear ;
Sup.Sup_ME_Drives.Lines.Add ( DateTimeToStr ( Now ) ) ;
//
{
For Local := 1 To 26 Do Begin
   Sup.Discos[Local].Ativo := FALSE ;
   Sup.Discos[Local].Total := 0 ;
   Sup.Discos[Local].Livre := 0 ;
   Sup.Discos[Local].IsRede := FALSE ;
   Sup.Discos[Local].Erro := FALSE ;
   Sup.Discos[Local].Resposta := 0 ;
   Sup.Discos[Local].Perc_Livre := 0 ;
End ;
}
//
Sup.Sup_ME_Drives.Lines.Add ( 'Unidades mapeadas a partir da rede:' ) ;
LPathStr := MAX_PATH ;
Sup.Sup_Drives_de_Rede.Clear ;
For Local := 1 To 26 Do Begin
   Sup.PN_Drives[Local].OK := FALSE ;
End ;
For Local := 1 To 26 Do Begin
   Drive2 := Chr ( Local + 64 ) ;
   If WNetGetConnection( PChar ('' + Drive2 + ':' ), PathStr, LPathStr) = NO_ERROR Then Begin
      Sup.Discos[Local].IsRede := TRUE ;
      Sup.Sup_Drives_de_Rede.Add ( Drive2 + ':' ) ;
      Sup.Sup_ME_Drives.Lines.Add ( 'Drive de rede encontrado: ' + Drive2 + ':' ) ;
   End ;
End ;
Sup.Sup_ME_Drives.Lines.Add ( '' ) ;
//
Sup.Sup_Drives := System.IOUtils.TDirectory.GetLogicalDrives ;
Sup.Sup_ME_Drives.Lines.Add ( 'Drives l?gicos (Qtde=' + IntToStr(Length(Sup.Sup_Drives)) + '):' ) ;
For Local := 1 To Length(Sup.Sup_Drives) Do Begin
   Indice := Ord ( UpperCase(Sup.Sup_Drives[Local-1])[1] ) - 64 ;
   Sup.PN_Drives[Indice].OK := TRUE ;
   If NOT Sup.PN_Drives[Indice].Disponivel Then Begin
      Sup.PN_Drives[Indice].Last_OK := Now ;
      PUT_LOG ( 'ATRIBUINDO NOVA_MIDIA INDICE ' + IntToStr ( Indice ) ) ;
      Sup.PN_Drives[Indice].Nova_Midia := TRUE ;
   End ;
   Sup.PN_Drives[Indice].Disponivel := TRUE ;
   Sup.Discos[Indice].Ativo := TRUE ;
   If Sup.Discos[Indice].IsRede Then Begin
      Sup.Sup_ME_Drives.Lines.Add ( Sup.Sup_Drives[Local-1] + ' (DRIVE DE REDE)' ) ;
      Continue ;
   End ;
   If ( Length(Sup.Sup_Drives[Local-1]) = 3 ) Then Begin
      Tick_Size := GetTickCount ;
      Try
         Sup.Discos[Indice].Total := DiskSize ( Indice ) DIV _1MB ;
      Except
         Sup.Discos[Indice].Total := -1 ;
      End ;
      Sup.Discos[Indice].Resposta := GetTickCount - Tick_Size ;
      Sup.Discos[Indice].Erro := ( Sup.Discos[Indice].Resposta > 5000 ) OR
                                 ( Sup.Discos[Indice].Total <= 0 ) ;
      If ( NOT Sup.Discos[Indice].Erro ) AND
         ( Sup.Discos[Indice].Total > 0 ) Then Begin
         Try
            Sup.Discos[Indice].Livre := DiskFree ( Indice ) DIV _1MB ;
         Except
            Sup.Discos[Indice].Livre := -1 ;
         End ;
         Sup.Discos[Indice].Perc_Livre := Sup.Discos[Indice].Livre / Sup.Discos[Indice].Total * 100 ;
         Sup.Sup_ME_Drives.Lines.Add ( Sup.Sup_Drives[Local-1] +
                                       NUMERO ( Sup.Discos[Indice].Total, 8 ) + ' MB total ' + ' ' +
                                       '(' + NUMERO ( Sup.Discos[Indice].Livre, 8 ) + ' MB livres, ' +
                                       CASA1_PONTO(Sup.Discos[Indice].Perc_Livre) + '%)' ) ;
      End Else Begin
         Sup.Sup_ME_Drives.Lines.Add ( Sup.Sup_Drives[Local-1] + ' *******' ) ;
      End ;
   End Else Begin
      Sup.Sup_ME_Drives.Lines.Add ( Sup.Sup_Drives[Local-1] + ' *******' ) ;
   End ;
End ;
For Local := 1 To 26 Do Begin
   If NOT Sup.PN_Drives[Local].OK Then Begin
      If Sup.PN_Drives[Local].Disponivel Then Begin
         Sup.PN_Drives[Local].Last_NOK := Now ;
      End ;
      Sup.PN_Drives[Local].Nova_Midia := FALSE ;
      Sup.PN_Drives[Local].Disponivel := FALSE ;
   End ;
End ;
For Local := 1 To 26 Do Begin
   If Assigned ( Sup.PN_Drives[Local].PN ) Then Begin
      If Sup.PN_Drives[Local].Disponivel Then Begin
         If Sup.PN_Drives[Local].Last_OK > ( Now - 5/SecsPerDay) Then Begin
            Sup.PN_Drives[Local].PN.Color := clLime ;
            Sup.PN_Drives[Local].PN.Font.Color := clBlack ;
         End Else Begin
            Sup.PN_Drives[Local].PN.Color := clGreen ;
            Sup.PN_Drives[Local].PN.Font.Color := clWhite ;
         End ;
      End Else Begin
         If Sup.PN_Drives[Local].Last_NOK > ( Now - 5/SecsPerDay) Then Begin
            Sup.PN_Drives[Local].PN.Color := clMaroon ;
            Sup.PN_Drives[Local].PN.Font.Color := clWhite ;
         End Else Begin
            Sup.PN_Drives[Local].PN.Color := clSilver ;
            Sup.PN_Drives[Local].PN.Font.Color := clBlack ;
         End ;
      End ;
   End ;
End ;
Sup.Sup_ME_Drives.Lines.Add ( '' ) ;
Sup.Sup_ME_Drives.Lines.Add ( 'Tick {' + IntTostr(GetTickCount-Tick) + ' ms}' ) ;
Sup.Pendente_Checar_Drives := FALSE ;
Sup.FLAG_CHECAR_NOVA_MIDIA := TRUE ;
//PUT_LOG ( 'FIM TASK_CHECAR_DRIVES' ) ;
End ;
*)

(*
Procedure CHECAR_DRIVES ;
Begin
If Assigned ( Sup.Task_Drives ) Then Begin
   If Sup.Task_Drives.Status = TTaskStatus.Running Then Begin
      PUT_LOG ( 'Task Drives em execu??o' ) ;
      Exit ;
   End ;
End ;
Sup.Task_Drives := TTask.Create ( TASK_CHECAR_DRIVES ) ;
Sup.Task_Drives.Start ;
End ;
*)

(*
Procedure CHECAR_DRIVES_LOGICOS ;
Begin
If Assigned ( Sup.Task_Drives ) Then Begin
   If Sup.Task_Drives.Status = TTaskStatus.Running Then Begin
      PUT_LOG ( 'Task Drives em execu??o' ) ;
      Exit ;
   End ;
End ;
Sup.Task_Drives := TTask.Create ( TASK_CHECAR_DRIVES_LOGICOS ) ;
Sup.Task_Drives.Start ;
End ;
*)

(*
Procedure CHECAR_DRIVES_LOGICOS_SUP ;
Begin
If Assigned ( Sup.Task_Drives ) Then Begin
   If Sup.Task_Drives.Status = TTaskStatus.Running Then Begin
      PUT_LOG ( 'Task Drives em execu??o' ) ;
      Exit ;
   End ;
End ;
Sup.Task_Drives := TTask.Create ( TASK_CHECAR_DRIVES_LOGICOS_SUP ) ;
Sup.Task_Drives.Start ;
End ;
*)

Procedure CHECAR_LOGICAL_DISKS ;
Begin
If Assigned ( Sup.Task_Drives ) Then Begin
   If Sup.Task_Drives.Status = TTaskStatus.Running Then Begin
      PUT_LOG ( 'Task Drives em execu??o' ) ;
      Exit ;
   End ;
End ;
//Sup.Task_Drives := TTask.Create ( GET_WINDOWS_LOGICAL_DISK ) ;
//Sup.Task_Drives.Start ;
End ;

Function EventTypeStr(EventType:Integer) : String ;
Begin
Case EventType Of
   1 : Result:='Configuration Changed' ;
   2 : Result:='Device Arrival' ;
   3 : Result:='Device Removal' ;
   4 : Result:='Docking' ;
End ;
End ;

Procedure TASK_CHECAR_ALTERACOES_DE_VOLUME_DE_DISCO ;
Var FSWbemLocator  : OLEVariant ;
    FWMIService    : OLEVariant ;
    FWbemObjectSet : OLEVariant ;
    FWbemObject    : OLEVariant ;
//    Tick           : Cardinal ;
Begin
FSWbemLocator := CreateOleObject('WbemScripting.SWbemLocator') ;
FWMIService := FSWbemLocator.ConnectServer('localhost', 'root\CIMV2', '', '') ;
FWbemObjectSet := FWMIService.ExecNotificationQuery('SELECT * FROM Win32_VolumeChangeEvent') ;
//Tick := GetTickCount + 60000 ;
While TRUE Do Begin // GetTickCount < Tick Do Begin
//   Application.ProcessMessages ;
   FWbemObject := FWbemObjectSet.NextEvent ;
   If NOT VarIsClear(FWbemObject) Then Begin
      PUT_LOG ( Format('Drive Name   %s',[String(FWbemObject.DriveName)]) ) ;
      PUT_LOG ( Format('Event Type   %s',[EventTypeStr(FWbemObject.EventType)]) ) ;
   End ;
   FWbemObject := Unassigned ;
End ;
PUT_LOG ( 'Exit Task Volume' ) ;
End ;

Procedure CHECAR_ALTERACOES_DE_VOLUME_DE_DISCO ;
Begin
If Assigned ( Sup.Task_Alter_Volume ) Then Begin
   If Sup.Task_Alter_Volume.Status = TTaskStatus.Running Then Begin
      PUT_LOG ( 'Task Volume em execu??o' ) ;
      Exit ;
   End ;
End ;
PUT_LOG ( 'EXEC Task Volume' ) ;
//Sup.Task_Alter_Volume := TTask.Create ( TASK_CHECAR_ALTERACOES_DE_VOLUME_DE_DISCO ) ;
//Sup.Task_Alter_Volume.Start ;
TASK_CHECAR_ALTERACOES_DE_VOLUME_DE_DISCO ;
End ;

Procedure GET_WIN32_DISKLOGICAL ;
Begin
If VAR_REG_TASK_CMD.Executando Then Begin
   Exit ;
End ;
INICIALIZAR_REG_TASK_CMD ( VAR_REG_TASK_CMD ) ;
//VAR_REG_TASK_CMD.Cmd := 'WMIC LOGICALDISK GET FreeSpace,Name,Size' ;
VAR_REG_TASK_CMD.FN := Diretorio + 'Config\GET_CMD_PROMPT_PIPE_FILE.DAT' ;
VAR_REG_TASK_CMD.Timeout := 5000 ;
//GET_CMD_PROMPT_PIPE_FILE ;
End ;

End.
