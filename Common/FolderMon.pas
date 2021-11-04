Unit FolderMon ;

Interface

uses SysUtils, Classes, Windows ;

Type TFolderAction = ( faNew, faRemoved, faModified, faRenamedOld, faRenamedNew ) ;

Const
  moNovo = 'NOVO' ;
  moDeletado = 'DELETADO' ;
  moModificado = 'MODIFICADO' ;
  moANTIGO_NOME = 'ANTIGO_NOME' ;
  moNOVO_NOME = 'NOVO_NOME' ;
  FOLDER_ACTION_NAMES : Array [ TFolderAction ] Of String =
              ( moNovo, moDeletado, moModificado, moANTIGO_NOME, moNOVO_NOME ) ;

Type
  TFolderItemInfo = Record
                    Name   : String ;
                    Action : TFolderAction ;
                    End ;

  TChangeType = ( ctFileName, ctDirName, ctAttr, ctSize, ctLastWriteTime,
                  ctLastAccessTime, ctCreationTime, ctSecurityAttr ) ;

  TChangeTypes = Set Of TChangeType ;
  TFolderMon = Class ;
  TFolderChangeEvent = Procedure ( Sender: TFolderMon; AFolderItem: TFolderItemInfo) Of Object ;
  TFolderMon = Class
  Private
    FFolder : String ;
    FWorker : TThread ;
    FMonitoredChanges : TChangeTypes ;
    FMonitorSubFolders : Boolean ;
    FOnFOlderChange : TFolderChangeEvent ;
    FOnDeactivated : TNotifyEvent ;
    FOnActivated : TNotifyEvent ;
    Procedure SetFolder ( Const Value : String ) ;
    Function GetIsActive : Boolean ;
    Procedure SetIsActive ( Const Value : Boolean ) ;
    Procedure SetMonitoredChanges ( Const Value : TChangeTypes ) ;
    Procedure SetMonitorSubFolders ( Const Value : Boolean ) ;
  Public
    Destructor Destroy; Override ;
    Function GET_EVENT_NAME ( Acao : TFolderAction ) : String ;
    Procedure Activate ;
    Procedure Deactivate ;
    Property Folder : String Read FFolder Write SetFolder ;
    Property IsActive : Boolean Read GetIsActive Write SetIsActive ;
    Property MonitoredChanges : TChangeTypes Read FMonitoredChanges Write SetMonitoredChanges ;
    Property MonitorSubFolders : Boolean Read FMonitorSubFolders Write SetMonitorSubFolders ;
    Property OnFolderChange : TFolderChangeEvent Read FOnFOlderChange Write FOnFolderChange ;
    Property OnActivated : TNotifyEvent Read FOnActivated Write FOnActivated ;
    Property OnDeactivated : TNotifyEvent Read FOnDeactivated Write FOnDeactivated ;
  End ;

Implementation

Const NOTIFY_FILTERS: Array[TChangeType] Of DWORD =
      ( FILE_NOTIFY_CHANGE_FILE_NAME,     // ctFileName
        FILE_NOTIFY_CHANGE_DIR_NAME,    // ctDirName
        FILE_NOTIFY_CHANGE_ATTRIBUTES,  // ctAttr
        FILE_NOTIFY_CHANGE_SIZE,        // ctSize
        FILE_NOTIFY_CHANGE_LAST_WRITE,  // ctLastWriteTime
        FILE_NOTIFY_CHANGE_LAST_ACCESS, // ctLastAccessTime
        FILE_NOTIFY_CHANGE_CREATION,    // ctCreationTime
        FILE_NOTIFY_CHANGE_SECURITY    // ctSecurityAttr
       ) ;

Type
  TFolderMonWorker = Class(TThread)
  Private
    Owner : TFolderMon ;
    FFolder : THandle ;
    FMonFilter : DWord ;
    FFolderItemInfo : TFolderItemInfo ;
    Procedure SetUp ;
    Procedure TearDown ;
    Procedure DoFolderItemChange ;
  Protected
    Procedure Execute ; Override ;
  Public
    Constructor Create(AOwner: TFolderMon) ; Reintroduce ;
  End ;

{ TFolderMon }

Function TFolderMon.GET_EVENT_NAME ( Acao : TFolderAction ) : String ;
Begin
Result := FOLDER_ACTION_NAMES [ Acao ] ;
End ;

Procedure TFolderMon.Activate ;
Begin
If IsActive Then Begin
   Exit ;
End ;
If FMonitoredChanges=[] then Begin
   Exit ; // Raise Exception.Create ( 'Please specify event(s) to be monitored' ) ;
End ;
If NOT DirectoryExists(FFolder) then Begin
   Exit ; // Raise Exception.Create ( 'Please supply valid/existing folder' ) ;
End ;
FWorker := TFolderMonWorker.Create ( Self ) ;
If Assigned(FOnActivated) Then Begin
   FOnActivated ( Self ) ;
End ;
End ;

Procedure TFolderMon.Deactivate ;
Begin
If not IsActive Then Begin
   Exit ;
End ;
With TFolderMonWorker(FWorker) Do Begin
   Owner := Nil ;
   Terminate ;
End;
FWorker := Nil ;
If Assigned ( FOnDeactivated ) Then Begin
   FOnDeactivated ( Self ) ;
End ;
End ;

Destructor TFolderMon.Destroy ;
Begin
Deactivate ;
Inherited ;
End ;

Function TFolderMon.GetIsActive : Boolean ;
Begin
Result := FWorker <> Nil ;
End ;

Procedure TFolderMon.SetFolder ( Const Value : String ) ;
Begin
If LowerCase(FFolder)=LowerCase(Value) Then Begin
   Exit ;
End ;
If IsActive Then Begin
   Raise Exception.Create ( 'Currently still actively monitoring a folder. ' +
                            'Please deactivate before changing monitored folder.' ) ;
End ;
FFolder := Value ;
End ;

Procedure TFolderMon.SetIsActive ( Const Value : Boolean ) ;
Begin
If Value Then Begin
   Activate ;
End else Begin
   Deactivate ;
End ;
End ;

Procedure TFolderMon.SetMonitoredChanges ( Const Value : TChangeTypes ) ;
Begin
If FMonitoredChanges = Value Then Begin
   Exit ;
End ;
If IsActive Then Begin
   Raise Exception.Create ( 'The monitor must be deactivated before changing the monitored event(s)' ) ;
End ;
FMonitoredChanges := Value ;
End ;

Procedure TFolderMon.SetMonitorSubFolders ( Const Value : Boolean ) ;
Begin
If FMonitorSubFolders = Value Then Begin
   Exit ;
End ;
if IsActive Then Begin
   raise Exception.Create ( 'Please deactivate the monitor first' ) ;
End ;
FMonitorSubFolders := Value ;
End ;

{ TFolderMonWorker }

Constructor TFolderMonWorker.Create ( AOwner : TFolderMon ) ;
Begin
Owner := AOwner;
If Owner = Nil Then Begin
   Raise Exception.Create ( 'Reference to TFolderMon instance must be specified' ) ;
End ;
Inherited Create ( FALSE ) ;
FreeOnTerminate := TRUE ;
SetUp ;
End ;

Const FILE_LIST_DIRECTORY = $0001 ;

Type _FILE_NOTIFY_INFORMATION = Packed Record
                                NextEntryOffset : DWORD ;
                                Action : DWORD ;
                                FileNameLength : DWORD ;
                                FileName : WideChar ;
                                End ;
     FILE_NOTIFY_INFORMATION  = _FILE_NOTIFY_INFORMATION ;
     PFILE_NOTIFY_INFORMATION = ^FILE_NOTIFY_INFORMATION ;

Procedure TFolderMonWorker.DoFolderItemChange ;
Begin
If Assigned(Owner) AND Assigned(Owner.FOnFolderChange) Then Begin
   Owner.FOnFOlderChange ( Owner, FFolderItemInfo ) ;
End ;
End ;

Procedure TFolderMonWorker.Execute ;
Const cBufSize = 32 * 1024 ;  // 32k
Var B          : Pointer ;
    vCount     : DWord ;
    vOffset    : DWord ;
    vFileInfo  : PFILE_NOTIFY_INFORMATION ;
Begin
GetMem ( B, cBufSize ) ;
Try
   While not Terminated Do Begin
      If Owner = Nil Then Begin
         Exit ;
      End ;
      If ReadDirectoryChangesW ( FFolder,
                                 B,
                                 cBufSize,
                                 Owner.MonitorSubFolders,
                                 FMonFilter,
                                 @vCount,
                                 Nil,
                                 Nil
                                ) AND ( vCount > 0) Then Begin
         If Owner = Nil Then Begin
            Exit ;
         End ;
         vFileInfo := B ;
         Repeat
            vOffset := vFileInfo.NextEntryOffset ;
            FFolderItemInfo.Name := WideCharLenToString ( @vFileInfo^.FileName, vFileInfo^.FileNameLength ) ;
            SetLength ( FFolderItemInfo.Name, vFileInfo^.FileNameLength DIV 2 ) ;
            Case vFileInfo^.Action Of
            FILE_ACTION_ADDED           : FFolderItemInfo.Action := faNew ;
            FILE_ACTION_REMOVED         : FFolderItemInfo.Action := faRemoved ;
            FILE_ACTION_MODIFIED        : FFolderItemInfo.Action := faModified ;
            FILE_ACTION_RENAMED_OLD_NAME: FFolderItemInfo.Action := faRenamedOld ;
            FILE_ACTION_RENAMED_NEW_NAME: FFolderItemInfo.Action := faRenamedNew ;
            End ;
            Synchronize ( DoFolderItemChange ) ;
            PByte(vFileInfo) := PByte ( DWORD(vFileInfo) + vOffset ) ;
         Until vOffset = 0 ;
      End ;
   End ;
Finally
   TearDown ;
   FreeMem ( B, cBufSize ) ;
End ;
End ;

procedure TFolderMonWorker.SetUp ;
Var i : TChangeType ;
Begin
FFolder := CreateFile ( PChar(Owner.Folder),
                        FILE_LIST_DIRECTORY OR GENERIC_READ,
                        FILE_SHARE_READ OR FILE_SHARE_WRITE OR FILE_SHARE_DELETE,
                        Nil,
                        OPEN_EXISTING,
                        FILE_FLAG_BACKUP_SEMANTICS,
                        0 ) ;

FMonFilter := 0 ;
For i := Low(TChangeType) To High(TChangeType) Do Begin
   If i in Owner.MonitoredChanges Then Begin
      FMonFilter := FMonFilter OR NOTIFY_FILTERS[i] ;
   End ;
End ;
End ;

Procedure TFolderMonWorker.TearDown ;
Begin
CloseHandle ( FFolder ) ;
End ;

End .
