unit MyRichEdit_U;

interface

uses
  Winapi.Messages, Vcl.ComCtrls;

type
  TMyRichEdit = class(TRichEdit)
  private
    procedure WMPaint(var Message: TMessage); message WM_PAINT;
  public
    procedure DoExit; override ;
    procedure DoEnter; override ;
    procedure Render;
  end;

var
  PaintMsg: TMessage;

implementation

procedure TMyRichEdit.DoEnter;
begin
  inherited;
  WMPaint(PaintMsg);
end;

procedure TMyRichEdit.DoExit;
begin
  inherited;
  WMPaint(PaintMsg);
end;

procedure TMyRichEdit.Render;
begin
  WMPaint(PaintMsg);
end;

procedure TMyRichEdit.WMPaint(var Message: TMessage);
begin
  // eliminated custom code to tweak the text content...
  inherited;
end;

Initialization
PaintMsg.Msg := WM_PAINT ;
PaintMsg.WParam := 0 ;
PaintMsg.LParam := 0 ;
PaintMsg.Result := 0 ;
End .
