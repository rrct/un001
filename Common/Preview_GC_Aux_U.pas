Unit Preview_GC_Aux_U ;

Interface

Uses Misc_Const_U, Misc_Def_U, Misc_Type_U,
     Misc_1, Misc_GC,
     // Misc_Zews_U, Misc_Print_U, Misc_Log_U, Misc_User, Misc_TCP,
     Misc_U,
     Math,
     Winapi.Windows, Winapi.Messages,
     System.SysUtils, System.Variants, System.Classes,
     Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls ;

Type
  TPreview_GC_Aux = class(TForm)
    PN_Geral_Preview: TPanel;
    PN_Rodape: TPanel;
    PN_Preview_Relogio: TPanel;
    PN_Preview_Logo: TPanel;
    PN_Preview_Tarja: TPanel;
    PN_Full: TPanel;
    Relogio_Preview_GC: TTimer;
    Procedure FormCreate(Sender: TObject) ;
    Procedure FormResize(Sender: TObject) ;
    Procedure Relogio_Preview_GCTimer(Sender: TObject) ;
    Procedure FormShow(Sender: TObject) ;
    procedure FormActivate(Sender: TObject);
  Private
    { Private declarations }
  Public
    { Public declarations }
  End ;

Var Preview_GC_Aux : TPreview_GC_Aux ;

Implementation

Uses Main ;

{$R *.dfm}

procedure TPreview_GC_Aux.FormActivate(Sender: TObject);
begin
If IS_RICARDO Then Begin
//   ATIVAR_HINT_COMPONENTES ( 'Preview_GC_Aux', Preview_GC_Aux,
//                             Main.MN_Tecnica_Hint_Habilitar.Checked,
//                             Main.MN_Tecnica_Hint_Salvar.Checked ) ;
   PUT_LOG ( 'Activate Preview_GC_Aux' ) ;
End ;
end;

Procedure TPreview_GC_Aux.FormCreate(Sender: TObject) ;
Begin
Preview_GC_Aux.Color := clBlack ;
PN_Full.Color := clBlack ;
PN_Geral_Preview.Color := clBlack ;
PN_Preview_Relogio.Color := clBlack ;
PN_Preview_Logo.Color := clBlack ;
PN_Preview_Tarja.Color := clBlack ;
PN_Rodape.Color := clBlack ;
End ;

Procedure TRATAR_RESIZE ;
Begin
With Preview_GC_Aux Do Begin
   PN_Preview_Tarja.Width := PN_Geral_Preview.Width -
                             PN_Preview_Relogio.Width -
                             PN_Preview_Logo.Width ;
   PN_Preview_Relogio.Tag := PN_Preview_Relogio.Width ;
   PN_Preview_Tarja.Tag := PN_Preview_Tarja.Width ;
   PN_Preview_Logo.Tag := PN_Preview_Logo.Width ;
   PUT_LOG ( 'PN_Preview_Relogio.Tag [' + IntToStr ( PN_Preview_Relogio.Tag ) + '] ' +
             'PN_Preview_Logo.Tag [' + IntToStr ( PN_Preview_Logo.Tag  ) + ']' ) ;
End ;
End ;

Procedure TPreview_GC_Aux.FormResize(Sender: TObject) ;
Begin
TRATAR_RESIZE ;
End ;

Procedure TPreview_GC_Aux.FormShow(Sender: TObject) ;
Begin
Caption := Title_RNews + ' - Preview GC Auxiliar' ;
PN_PADRAO ( PN_Full ) ;
PN_PADRAO ( PN_Geral_Preview ) ;
PN_PADRAO ( PN_Rodape ) ;
PN_PADRAO ( PN_Preview_Logo ) ;
PN_PADRAO ( PN_Preview_Relogio ) ;
PN_PADRAO ( PN_Preview_Tarja ) ;
TRATAR_RESIZE ;
End ;

Procedure TPreview_GC_Aux.Relogio_Preview_GCTimer(Sender: TObject) ;
Begin
If PN_Preview_Relogio.Width < 230 Then Begin
   PN_Preview_Relogio.Width := MIN ( PN_Preview_Relogio.Width + Screen.Width DIV 30, 230 ) ;
End ;
If PN_Preview_Logo.Width < 230 Then Begin
   PN_Preview_Logo.Width := MIN ( PN_Preview_Logo.Width + Screen.Width DIV 30, 230 ) ;
End ;
If PN_Preview_Tarja.Width < ( 1920 - 230 - 230 ) Then Begin
   PN_Preview_Tarja.Width := MIN ( PN_Preview_Tarja.Width + Screen.Width DIV 20, 1920 - 230 - 230 ) ;
End ;
End ;

End.
