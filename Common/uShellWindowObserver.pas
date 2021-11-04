Unit uShellWindowObserver ;

// requirements : The Internet Explorer Active X Component must have been installed

Interface
//remove the following line if you are using Delphi 3
{$DEFINE COOBJS}

Uses Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
     extctrls, SHDocVW,
     // replace this with SHDocVW_TLB if you installed it as an activeX component
     Comobj, comctrls ;

Type
   TShellMessage = (smClose,smMaximize,smMinimize,smRestore);
   EIdNotFound = Class(Exception);
   TShellWindow = Class
   Num : integer;
   handle : HWND;
   LocationURL : String ;
   LocationName : String ;
   {$IFDEF COOBJS}
      IEHandle : IWebBrowser2 ;
   {$ELSE }
      IEHandle : Variant ;
   {$ENDIF }
End ;

  TOnAddedEntry = Procedure (Sender : TObject; ShellWindow : TShellWindow; Str : String) Of Object ;
  TOnChangedNumber = Procedure (Sender : TObject; Number : Integer) Of Object ;

  TShellWindowObserver = Class(TComponent)
  Private
     FOnAddedEntry : TOnAddedEntry;
     FLoggingDirs : Boolean;
     FLoggedChanges : TStrings;
     FWindowList : TList;
     FOnChangedNUmber : TOnChangedNumber;
     FDelimiter : Char;
     FActive : Boolean;
     FShellMessage : TShellMessage;
     FNumMessage: WORD;
     procedure OnTimerObserver(Sender : TObject);
     procedure SetMessage(Value: TShellMessage);
  Protected
     FTimer : TTimer;
     function GetMaxId : integer;
     procedure RemoveZombies;
     procedure UpdateList;
     procedure AddEntry(SHW : TSHellWindow);
     procedure AddBrowserId(URL, Name : String; curriehandle : HWND);
     procedure UpdateWins;
  Public
     Count: Integer;
     function    SendMessageToWindowByNumber(Num: Integer): LRESULT;
     function    GetShellWindowOnNumber(Num : integer) : TShellWindow;
     constructor Create(AOwner : TComponent); override;
     destructor  Destroy; override;
     property    WindowList : TList read FWindowList write FWindowList;
     property    LoggedChanges : TStrings read FLoggedChanges;
  Published
     property LoggingDirs : boolean read FLoggingDirs write FLoggingDirs;
     property OnAddedEntry : TOnAddedEntry read FOnAddedEntry write FOnAddedEntry;
     property OnChangedNumber : TOnChangedNumber read FOnChangedNumber write FOnChangedNumber;
     property Delimiter : Char read FDelimiter write FDelimiter;
     property Active : boolean read FActive write FActive;
     property SendAMessage : TShellMessage read FShellMessage write SetMessage;
  End ;

Function ReplaceStr ( Str : String ; Old, New : String ) : String ;
Procedure Register ;

Implementation

{$R SHELLWINDOWOBSERVER.DCR}
Const TIMERINTERVAL = 275 ;

Var
{$IFDEF COOBJS}
   SH : IShellWindows ;
   IE2 : IWebBrowser2 ;
{$ELSE }
   SH : Variant ;
   IE2 : Variant ;
{$ENDIF}
   initializ : Boolean = False ;

Procedure Init ;
Begin
If NOT initializ then Begin
{$IFDEF COOBJS}
    SH := CoShellWindows.Create ;
{$ELSE }
    SH := CreateComObject(Class_ShellWindows) as IShellWindows ;
{$ENDIF }
End ;
initializ := True ;
End ;

//----------------------------------------------------------------------------//
//                                     max                                    //
//----------------------------------------------------------------------------//
Function Max ( a, b : Integer ) : integer ;
Begin
If a > b Then Begin
   Result := a ;
End else Begin
   Result := b ;
End ;
End ;

//----------------------------------------------------------------------------//
//                                 ReplaceStr                                 //
//----------------------------------------------------------------------------//
Function ReplaceStr ( str : String ; old, new : String ) : String ;
Var P     : integer ;
    S     : String ;
    first : String ;
    last  : String ;
Begin
P := Pos(Old,str);
If P > 0 Then Begin
   first:=Copy(str,1,P-1);
   last:=copy(str,P+Length(old),Length(str)-P-Length(Old)+1);
   S := first + new + Replacestr(last,old,new);
   result := S;
End Else Begin
   result := str;
End ;
End ;

//----------------------------------------------------------------------------//
//                                  SetMessage                                //
//----------------------------------------------------------------------------//
procedure TShellWindowObserver.SetMessage(Value: TShellMessage);
begin
If Value <> FShellMessage Then Begin
   Case Value of
      smClose       : FNumMessage := SC_CLOSE;
      smMaximize    : FNumMessage := SC_MAXIMIZE;
      smMinimize    : FNumMessage := SC_MINIMIZE;
      smRestore     : FNumMessage := SC_RESTORE;
   End ;
   FShellMessage := Value ;
End ;
End ;

//----------------------------------------------------------------------------//
//                          SendMessageToWindowByNumber                       //
//----------------------------------------------------------------------------//
Function TShellWindowObserver.SendMessageToWindowByNumber ( Num : Integer ) : LRESULT ;
Begin
Result := SendMessage ( TShellWindow(FWindowList.Items[Pred(Num)]).handle,
                        WM_SYSCOMMAND,FNumMessage , 0) ;
End ;

//----------------------------------------------------------------------------//
//                            GetShellWindowOnNumber                          //
//----------------------------------------------------------------------------//
Function TShellWindowObserver.GetShellWindowOnNumber(Num : Integer) : TShellWindow ;
Var i       : integer ;
    CurrWin : TShellWindow ;
Begin
Result := Nil ;
For i := 0 To Pred(FWindowList.Count) Do Begin
   CurrWin := TShellWindow(FWindowList.Items[i]);
   If CurrWin.Num = Num Then Begin
      Result := CurrWin ;
   End ;
End ;
End ;

//----------------------------------------------------------------------------//
//                                  GetMaxId                                  //
//----------------------------------------------------------------------------//
Function TShellWindowObserver.GetMaxId : Integer ;
Var i        : Integer ;
    maxfound : Integer ;
Begin
maxfound := 0 ;
For i := 0 To FWindowList.Count - 1 Do Begin
   maxfound := max(Maxfound, TShellWindow(FWIndowList.Items[i]).Num);
End ;
Result := maxfound + 1 ;
End ;

//----------------------------------------------------------------------------//
//                                  AddEntry                                  //
//----------------------------------------------------------------------------//
Procedure TShellWindowObserver.AddEntry(SHW : TShellWindow) ;
Var NewStr : String ;
Begin
NewStr := IntTostr(SHW.Num) + FDELIMITER + '-' + FDELIMITER +
          'Hwnd' + FDELIMITER + ':' + FDELIMITER +
          IntToHex(SHW.handle,8) + FDELIMITER +
          SHW.LocationURL + FDELIMITER +
          SHW.LocationName + FDELIMITER +
          DateTimeToStr(Now) ;
FLoggedChanges.Add(NewStr) ;
Count := FWindowList.Count ;
If Assigned(FOnAddedEntry) Then Begin
   FOnAddedEntry(Self, SHW, NewStr) ;
End ;
End ;

//----------------------------------------------------------------------------//
//                                AddBrowserId                                //
//----------------------------------------------------------------------------//
procedure TShellWindowObserver.AddBrowserId ( URL, Name : String ;
                                              curriehandle : HWND ) ;
Var NewId       : Integer ;
    ShellWindow : TShellWindow ;
Begin
NewId := GetMaxId ;
ShellWindow := TShellWindow.Create ;
With ShellWindow Do Begin
   handle := CurrIeHandle ;
   Num := NewId ;
   LocationURL := URL ;
   LocationName := Name ;
   IEHandle := IE2 ;
End ;
FWindowList.ADD(ShellWindow) ;
Count := FWindowList.Count ;
If Assigned(FOnChangedNumber) Then Begin
    FOnChangedNumber(Self, FWindowList.Count) ;
End ;
AddEntry(ShellWindow) ;
End ;

//----------------------------------------------------------------------------//
//                                 UpdateWins                                 //
//----------------------------------------------------------------------------//
Procedure TShellWindowObserver.UpdateWins ;

  Function IsValidUrl(URL : String) : boolean;
  Begin
    result := false;
    if Pos('http',URL) > 0 then result := true;
    if Pos('ftp',URL) > 0 then result := true;
    if Pos('gopher',URL) > 0 then result := true;
  End ;

Var i       : Integer ;
    IEURL   : String ;
    IEHWND  : HWND ;
    IETitle : String ;
    CurrWin : TShellWindow ;
    found   : Boolean ;
Begin
{$IFDEF COOBJS}
If IE2 = Nil Then Begin
   Exit ;
End ;
{$ENDIF}
Try
   IEURL := IE2.LocationURL;
   IEURL := ReplaceSTr(IEURL,'%20',' ');
   IETITLE := IE2.LocationName;
   If (FLoggingDirs) OR (IsValidURL(IEURL)) Then Begin
      IEHWND := IE2.HWND ;
      found := false ;
      for i := 0 To FWindowList.Count-1 Do Begin
         CurrWin := TShellWindow(FWindowList.Items[i]);
         If (CurrWin.handle = IEHWND) Then Begin
            found := true ;
            If (IEURL <> CurrWin.LocationURL) Then Begin
               CurrWin.LocationURL := {ReplaceSTr(IEURL,'%20',' ')}IEURL;
               CurrWin.LocationName := IETitle;
               AddEntry(CurrWin);
            End ;
         End ;
      End ;
      If NOT found Then Begin
         AddBrowserId(IEURL, IETITLE, IE2.HWND) ;
      End ;
   End ;
Except
   On EOleException Do Begin
   End ;
End ;
End ;

//----------------------------------------------------------------------------//
//                                RemoveZombies                               //
//----------------------------------------------------------------------------//
procedure TShellWindowObserver.RemoveZombies ;
Var i, j : integer;
    ih : HWND;
    found, changed  : boolean;
    Num: Integer;
Begin
i := 0;
changed := False;
Num := 1;
While i < FWindowList.Count Do Begin
   ih := TShellWindow(FWindowList.Items[i]).handle ;
   found := false ;
   Try
      For j := 0 To Pred(SH.Count) Do Begin
         IE2 := SH.Item(j) {$IFDEF COOBJS} As IWebBrowser2 {$ENDIF};
         if IE2 = nil then continue;
         if HWND(IE2.HWND) = ih Then Begin
            found := True ;
            Break ;
         End ;
      End ;
   Except On EOleSysError Do
     found := False ;
   End;
   If NOT found Then Begin
      changed := True ;
      FWindowList.Delete(i) ;
   End Else Begin
      // Correct a bug
      TShellWindow(FWindowList.Items[i]).Num := Num ;
      Inc(Num) ;
      inc(i) ;
   End ;
End ;
Count := FWindowList.Count ;
If (changed) AND (Assigned(FOnChangedNumber)) Then Begin
  FOnChangedNumber(Self, FWindowList.Count) ;
End ;
End ;

//----------------------------------------------------------------------------//
//                                 UpdateList                                 //
//----------------------------------------------------------------------------//
procedure TShellWindowObserver.UpdateList ;
Var i: integer ;
begin
Try
   For i := 0 to Pred(SH.Count) Do Begin
      IE2 := SH.Item(i) {$IFDEF COOBJS} As IWebBrowser2 {$ENDIF} ;
      UpdateWins ;
   End;
   RemoveZombies ;
Except
   On Exception Do Begin
   End ;
End ;
End ;

//----------------------------------------------------------------------------//
//                             OnTimerObserver                                //
//----------------------------------------------------------------------------//
procedure TShellWindowObserver.OnTimerObserver(Sender : TObject);
Begin
If FActive Then Begin
    UpdateList ;
End ;
End ;

//----------------------------------------------------------------------------//
//                                  Create                                    //
//----------------------------------------------------------------------------//
Constructor TShellWindowObserver.Create(AOwner : TComponent) ;
Begin
Init ;
Inherited ;
FLoggingDirs := False ;
FDelimiter := ',' ;
FNumMessage := SC_CLOSE ;
Count := 0 ;
FLoggedChanges := TStringList.Create ;
FWindowList := TList.Create ;
FTimer := TTimer.Create(Self) ;
With FTimer Do Begin
   Interval := TIMERINTERVAL ;
   Enabled := True ;
   OnTimer := OnTimerObserver ;
End ;
End ;

//----------------------------------------------------------------------------//
//                                 Destroy                                    //
//----------------------------------------------------------------------------//
Destructor TShellWindowObserver.Destroy ;
Var i: Integer ;
Begin
FLoggedChanges.Free ;
For i := 0 to Pred(FWindowList.Count) Do Begin
   TShellWindow(FWindowList.Items[i]).Free ;
End ;
FWindowList.Free ;
FTimer.Free ;
Inherited ;
End ;

//----------------------------------------------------------------------------//
//                                 Register                                   //
//----------------------------------------------------------------------------//
Procedure Register ;
Begin
RegisterComponents('VCL Internet', [TShellWindowObserver]) ;
End ;

End.

