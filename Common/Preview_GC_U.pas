Unit Preview_GC_U ;

Interface

Uses Misc_Const_U, Misc_Def_U, Misc_Type_U,
     Misc_U, Transparentes_U,
     IniFiles, Math,
     Winapi.Windows, Winapi.Messages,
     System.SysUtils, System.Variants, System.Classes,
     Vcl.Graphics, Vcl.Controls, Vcl.Forms,
     Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
     //RxCtrls,
     Vcl.ComCtrls, Vcl.StdCtrls;

Type
  TPreview_GC = class(TForm)
    PC: TPageControl;
    TS_View: TTabSheet;
    TS_Edit: TTabSheet;
    IM_View: TImage;
    PN_IM_Edit: TPanel;
    IM_Edit: TImage;
    PN_Top: TPanel;
    Label1: TLabel;
    CB_Tarjas: TComboBox;
    CB_Zoom: TComboBox;
    procedure Click_Edit(Sender: TObject);
    procedure CB_TarjasChange(Sender: TObject);
    procedure CB_ZoomChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

Var Preview_GC         : TPreview_GC ;
    BOOT_OK_Preview_GC : Boolean = FALSE ;

Procedure CRIAR_REGISTROS_GC_LABEL ;
Procedure CARREGAR_ESTILO ( Tag : String ) ;
Function GET_FN_ESTILO ( Tag : String ) : String ;
Procedure EXECUTAR_PREVIEW ;
Procedure AJUSTAR_ZOOM ;
Procedure SETAR_BORDAS ( Exibir : Boolean ) ;
Procedure LOAD_TARJA ( FN : String ) ;
Procedure CARREGAR_CB_TARJAS ;
Function GET_DIR_TARJAS : String ;

Implementation

{$R *.dfm}

Function GET_DIR_TARJAS : String ;
Begin
Result := INSERE_BARRA ( Diretorio + 'Tarjas' ) ;
CHECAR_DIRETORIO_DIRNAME ( Result ) ;
End ;

Function GET_FN_ESTILO ( Tag : String ) : String ;
Begin
Result := '' ;
//If GC.CB_Tarjas.ItemIndex = -1 Then
//   Exit ;
//Result := Diretorio + 'Estilos\' + FN + '.DAT' ;
Result := Diretorio + 'Tarjas\' + Tag + '.DAT' ;
CHECAR_DIRETORIO_FILENAME ( Result ) ;
End ;

Procedure CARREGAR_ESTILO ( Tag : String ) ;
Var Ini   : TMemIniFile ;
    FN    : String ;
    Local : LongInt ;
    Grupo : String ;
Begin
FN := GET_FN_ESTILO ( Tag ) ;
PUT_LOG ( 'CARREGAR_ESTILO [' + Tag + ']' ) ;
If NOT RR_FileExists ( 'CARREGAR_ESTILO/1', FN ) Then
   Begin
   PUT_LOG ( 'CARREGAR_ESTILO COPIAR PADRAO [' + GET_FN_ESTILO ( 'Padrao' ) + ']' ) ;
   If CopiaArquivo ( 'CARREGAR_ESTILO/1' ,GET_FN_ESTILO ( 'Padrao' ), FN, SOBREPOE ) Then ;
   ShowMessage ( 'Copiando arquivo padr?o' + LFLF +
                 GET_FN_ESTILO ( 'Padrao' ) + LFLF +
                 'para' + LFLF +
                 FN ) ;
   End ;
If NOT RR_FileExists ( 'CARREGAR_ESTILO/2', FN ) Then
   Begin
   PUT_LOG ( 'CARREGAR_ESTILO N?O ENCONTRADO [' + FN + ']' ) ;
   ShowMessage_Old ( 'Arquivo n?o encontrado' + LFLF +
                     '"' + FN + '"' ) ;
   Exit ;
   End ;
PUT_LOG ( 'Carregando Estilo [' + FN + ']' ) ;
Ini := TMemIniFile.Create ( FN ) ;
For Local := 1 To MAX_EDITS Do
   Begin
   Grupo := 'IDX_' + StrZero(Local,4) ;
   Reg_GC[Local].ED.Text := Ini.ReadString ( Grupo, 'TXT', '' ) ;
   Reg_GC[Local].Txt := Reg_GC[Local].ED.Text ;
   Reg_GC[Local].Font_Nome := Ini.ReadString ( Grupo, 'FONT_NAME', '' ) ;
   Reg_GC[Local].Font_Color := Ini.ReadInteger ( Grupo, 'FONT_COLOR', $FFFFFF ) ;
   Reg_GC[Local].Font_Size := Ini.ReadInteger ( Grupo, 'FONT_SIZE', 14 ) ;
   Reg_GC[Local].Font_Bold := Ini.ReadBool ( Grupo, 'FONT_BOLD', FALSE ) ;
   Reg_GC[Local].Font_Italic := Ini.ReadBool ( Grupo, 'FONT_ITAL', FALSE ) ;
   Reg_GC[Local].X := Ini.ReadInteger ( Grupo, 'X', 50 ) ;
   Reg_GC[Local].Y := Ini.ReadInteger ( Grupo, 'Y', 20 + (Local-1)*40 ) ;
   Reg_GC[Local].W := MAX ( 300, Ini.ReadInteger ( Grupo, 'W', 720 ) ) ;
   Reg_GC[Local].Carregado := TRUE ;
   End ;
Ini.Free ;
{
Try
   Estilo.ED_L1.SetFocus ;
   Except
   End ;
}
EXECUTAR_PREVIEW ;
//SELECIONAR_L ( 1 ) ;
End ;

procedure TPreview_GC.CB_TarjasChange(Sender: TObject);
Var FN : String ;
Begin
If ActiveControl = CB_Tarjas Then
   Begin
   FN := GET_DIR_TARJAS + CB_Tarjas.Text ;
   //ShowMessage ( FN ) ;
   If RR_FileExists ( 'TPreview_GC.CB_TarjasChange', FN ) Then
      Begin
      LOAD_TARJA ( FN ) ;
      End ;
   End ;
End;

procedure TPreview_GC.CB_ZoomChange(Sender: TObject);
begin
If ActiveControl <> CB_Zoom Then
   Exit ;
If CB_Zoom.ItemIndex = -1 Then
   Exit ;
ZOOM_GC := StrToIntDef ( CB_Zoom.Items[CB_Zoom.ItemIndex], 100 ) ;
AJUSTAR_ZOOM ;
end;

procedure TPreview_GC.Click_Edit(Sender: TObject);
begin
//SELECIONAR_L ( (Sender As TTransEdit).Tag ) ;
end ;

procedure TPreview_GC.FormShow(Sender: TObject);
//Var Local : LongInt ;
begin
If NOT BOOT_OK_Preview_GC Then
   Begin
   {
   CARREGAR_CB_TARJAS ;
   If CB_Tarjas.Items.Count > 0 Then
      Begin
      For Local := 0 To CB_Tarjas.Items.Count - 1 Do
         Begin
         If Pos ( 'PADRAO', UpperCase(STRING_ASCII_PADRAO(CB_Tarjas.Items[Local])) ) > 0 Then
            Begin
            CB_Tarjas.ItemIndex := Local ;
            LOAD_TARJA ( GET_DIR_TARJAS + CB_Tarjas.Text ) ;
            Break ;
            End ;
         End ;
      End ;
   }
   BOOT_OK_Preview_GC := TRUE ;
   End ;
end;

Procedure CARREGAR_CB_TARJAS ;
Var RecDos    : TSearchRec ;
    Resultado : LongInt ;
    Dir       : String ;
    Lista     : TStringList ;
    Qtde      : LongInt ;
    Local     : LongInt ;
Begin
Dir := GET_DIR_TARJAS ;
Lista := TStringList.Create ;
Resultado := RR_FindFirst ( 'CARREGAR_CB_TARJAS', Dir + '*.png', 0, RecDos ) ;
While Resultado =  0 Do
   Begin
   Lista.Add ( Dir + RecDos.Name ) ;
   Resultado := System.SysUtils.FindNext ( RecDos ) ;
   End ;
Lista.Sort ;
Qtde := Lista.Count ;
Preview_GC.CB_Tarjas.Items.Clear ;
If Qtde > 0 Then
   For Local := 0 To Qtde - 1 Do
      Begin
      Preview_GC.CB_Tarjas.Items.Add ( ExtractFileName ( Lista[Local] ) ) ;
      End ;
System.SysUtils.FindClose ( RecDos ) ;
Lista.Free ;
End ;

(*
Procedure CRIAR_REGISTROS_GC_EDIT ;
Var Local : LongInt ;
Begin
For Local := 1 To MAX_EDITS Do
   Begin
   With Reg_GC[Local] Do
      Begin
      _Edit := TTransEdit.Create ( Preview_GC ) ;
      _Edit.Parent := Preview_GC.PN_IM_Edit ;
      _Edit.Top := 20 + ( Local - 1 ) * 50 ;
      _Edit.Left := 100 ;
      _Edit.Visible := TRUE ;
      _Edit.Width := 400 ;
      _Edit.Font.Size := 20 ;
      _Edit.Font.Color := clYellow ;
      _Edit.Font.Style := [fsBold] ;
      _Edit.Transparent := TRUE ;
      _Edit.BorderStyle := bsNone ;
      _Edit.DoubleBuffered := TRUE ;
      _Edit.StyleElements := [] ;
      _Edit.ParentColor := FALSE ;
      _Edit.ParentFont := FALSE ;
      _Edit.Tag := Local ;
      _Edit.OnEnter := Preview_GC.Click_Edit ;
      _Edit.ParentShowHint := FALSE ;
      _Edit.Brush.Style := bsClear ;
      //_Edit.ParentWindow := FALSE ;
      _Edit.ParentCustomHint := FALSE ;
      _Edit.ParentDoubleBuffered := FALSE ;
      _Edit.ParentCtl3D := FALSE ;
      _Edit.ParentBiDiMode := FALSE ;
      _Edit.Text := 'ED_INICIALIZACAO-' + IntToStr(Local) ;
      //
      Carregado := FALSE ;
      {
      Case Local Of
         1 : Begin
             ED := Estilo.ED_L1 ;
             End ;
         2 : Begin
             ED := Estilo.ED_L2 ;
             End ;
         3 : Begin
             ED := Estilo.ED_L3 ;
             End ;
         4 : Begin
             ED := Estilo.ED_L4 ;
             End ;
         End ;
      }
      End ;
   End ;
End ;
*)

(*
Procedure CRIAR_REGISTROS_GC_LABEL ;
Var Local : LongInt ;
Begin
For Local := 1 To MAX_EDITS Do
   Begin
   With Reg_GC[Local] Do
      Begin
      //
      _Label := TRxLabel.Create ( Preview_GC ) ;
      _Label.Parent := Preview_GC ;
      _Label.Top := 20 + ( Local - 1 ) * 50 ;
      _Label.Left := 100 ;
      _Label.Visible := TRUE ;
      _Label.Width := 400 ;
      _Label.Font.Size := 20 ;
      _Label.Font.Color := clYellow ;
      _Label.Font.Style := [fsBold] ;
      _Label.Transparent := TRUE ;
      //_Label.BorderStyle := bsNone ;
      //_Label.DoubleBuffered := TRUE ;
      _Label.StyleElements := [] ;
      _Label.ParentColor := FALSE ;
      _Label.ParentFont := FALSE ;
      _Label.Tag := Local ;
      //_Label.OnEnter := Click_Edit ;
      _Label.ParentShowHint := FALSE ;
      //_Label.Brush.Style := bsClear ;
      //_Label.ParentWindow := FALSE ;
      _Label.ParentCustomHint := FALSE ;
      //_Label.ParentDoubleBuffered := FALSE ;
      //_Label.ParentCtl3D := FALSE ;
      _Label.ParentBiDiMode := FALSE ;
      _Label.ShadowPos := spRightBottom ;
      _Label.ShadowColor := clBlack ;
      _Label.Caption := 'LB_INICIALIZACAO-' + IntToStr(Local) ;
      //
      Carregado := FALSE ;
      End ;
   End ;
End ;

Procedure EXECUTAR_PREVIEW ;
Var Local : LongInt ;
    X     ,
    Y     ,
    W     : LongInt ;
    F     : LongInt ;
Begin
//EXIBIR_REGISTROS ;
//exit ;
For Local := 1 To MAX_EDITS Do
   Begin
   If ZOOM_GC = 100 Then
      Begin
      X := Reg_GC[Local].X ;
      Y := Reg_GC[Local].Y ;
      W := Reg_GC[Local].W ;
      F := Reg_GC[Local].Font_Size ;
      End
   Else
      Begin
      X := TRUNC ( Reg_GC[Local].X * ZOOM_GC / 100 ) ;
      Y := TRUNC ( Reg_GC[Local].Y * ZOOM_GC / 100 ) ;
      W := TRUNC ( Reg_GC[Local].W * ZOOM_GC / 100 ) ;
      F := TRUNC ( Reg_GC[Local].Font_Size * ZOOM_GC / 100 ) ;
      End ;
   //
   Reg_GC[Local]._Edit.Text := Reg_GC[Local].Txt ;
   //PUT_LOG ( 'Atualizando TEXTO PREVIEW/1 [' + Reg_GC[Local].Txt + ']' ) ;
   Reg_GC[Local]._Edit.Font.Size := F ;
   Reg_GC[Local]._Edit.Font.Name := Reg_GC[Local].Font_Nome ;
   Reg_GC[Local]._Edit.Font.Color := Reg_GC[Local].Font_Color ;
   Reg_GC[Local]._Edit.Font.Style := [] ;
   If Reg_GC[Local].Font_Bold Then
      Reg_GC[Local]._Edit.Font.Style := Reg_GC[Local]._Edit.Font.Style + [fsBold] ;
   If Reg_GC[Local].Font_Italic Then
      Reg_GC[Local]._Edit.Font.Style := Reg_GC[Local]._Edit.Font.Style + [fsItalic] ;
   Reg_GC[Local]._Edit.Width := W ;
   Reg_GC[Local]._Edit.Left := X ;
   Reg_GC[Local]._Edit.Top := Y ;
   Reg_GC[Local]._Edit.Visible := Trim ( Reg_GC[Local]._Edit.Text ) <> '' ;
   //
   Reg_GC[Local]._Label.Caption := Reg_GC[Local].Txt ;
   //PUT_LOG ( 'Atualizando TEXTO PREVIEW/2 [' + Reg_GC[Local].Txt + ']' ) ;
   Reg_GC[Local]._Label.Font.Size := F ;
   Reg_GC[Local]._Label.Font.Name := Reg_GC[Local].Font_Nome ;
   Reg_GC[Local]._Label.Font.Color := Reg_GC[Local].Font_Color ;
   Reg_GC[Local]._Label.Font.Style := [] ;
   If Reg_GC[Local].Font_Bold Then
      Reg_GC[Local]._Label.Font.Style := Reg_GC[Local]._Label.Font.Style + [fsBold] ;
   If Reg_GC[Local].Font_Italic Then
      Reg_GC[Local]._Label.Font.Style := Reg_GC[Local]._Label.Font.Style + [fsItalic] ;
   Reg_GC[Local]._Label.Width := W ;
   Reg_GC[Local]._Label.Left := X ;
   Reg_GC[Local]._Label.Top := Y ;
   Reg_GC[Local]._Label.Visible := Trim ( Reg_GC[Local]._Label.Caption ) <> '' ;
   End ;
End ;

Procedure AJUSTAR_ZOOM ;
Var //Largura : LongInt ;
    Altura  : LongInt ;
    Proporcao : Double ;
Begin
//Exit ;
Preview_GC.IM_View.AutoSize := TRUE ;
Proporcao := Preview_GC.IM_View.Width / Preview_GC.IM_View.Height ;
//Largura := GC.IM.Width ;
Altura := Preview_GC.IM_View.Height ;
If ZOOM_GC = 100 Then
   Begin
   Preview_GC.IM_View.Proportional := FALSE ;
   Preview_GC.IM_View.Stretch := FALSE ;
   Preview_GC.IM_Edit.Proportional := FALSE ;
   Preview_GC.IM_Edit.Stretch := FALSE ;
   End
Else
   Begin
   Preview_GC.IM_Edit.Proportional := TRUE ;
   Preview_GC.IM_Edit.AutoSize := FALSE ;
   Preview_GC.IM_Edit.Stretch := TRUE ;
   Preview_GC.IM_Edit.Height := TRUNC ( Altura * ( ZOOM_GC ) / 100 ) ;
   //
   Preview_GC.IM_View.Proportional := TRUE ;
   Preview_GC.IM_View.AutoSize := FALSE ;
   Preview_GC.IM_View.Stretch := TRUE ;
   Preview_GC.IM_View.Height := TRUNC ( Altura * ( ZOOM_GC ) / 100 ) ;
   End ;
Preview_GC.ClientHeight := TRUNC ( Altura * ZOOM_GC / 100 ) ;
Preview_GC.ClientWidth := TRUNC ( TRUNC ( Altura * ZOOM_GC / 100 ) * Proporcao ) ;
EXECUTAR_PREVIEW ;
SETAR_BORDAS ( TRUE ) ;
Preview_GC.Invalidate ;
Preview_GC.Repaint ;
Application.ProcessMessages ;
SETAR_BORDAS ( FALSE ) ;
End ;

Procedure INICIALIZAR_REGISTROS_CG ;
Begin
CRIAR_REGISTROS_GC_EDIT ;
CRIAR_REGISTROS_GC_LABEL ;
End ;

Procedure SETAR_BORDAS ( Exibir : Boolean ) ;
Var Local : LongInt ;
begin
For Local := 0 To Preview_GC.ComponentCount - 1 Do
   Begin
   If NOT (Preview_GC.Components[Local] Is TTransEdit) Then
      Continue ;
   If Exibir Then
      (Preview_GC.Components[Local] As TTransEdit).BorderStyle := bsSingle
      Else
      (Preview_GC.Components[Local] As TTransEdit).BorderStyle := bsNone ;
   End ;
End ;

Procedure LOAD_TARJA ( FN : String ) ;
Begin
If NOT RR_FileExists ( FN ) Then
   Begin
   ShowMessage ( 'Tarja n?o encontrada' + LFLF + FN ) ;
   Exit ;
   End ;
Try
   //Preview_GC.IM_View.Picture.LoadFromFile ( FN ) ;
   GET_PICTURE ( Preview_GC.IM_View.Picture, FN ) ;
   Except
   On E : Exception Do
      Begin
      PUT_LOG ( 'Exception LOAD_TARJA/1 [' + FN + '][' + E.Message + ']' ) ;
      End ;
   End ;
Try
   //Preview_GC.IM_Edit.Picture.LoadFromFile ( FN ) ;
   GET_PICTURE ( Preview_GC.IM_Edit.Picture, FN ) ;
   AJUSTAR_ZOOM ;
   Except
   On E : Exception Do
      Begin
      PUT_LOG ( 'Exception LOAD_TARJA/2 [' + FN + '][' + E.Message + ']' ) ;
      End ;
   End ;
Preview_GC.ClientWidth := Preview_GC.IM_Edit.Picture.Width ;
Preview_GC.ClientHeight := Preview_GC.PN_Top.Height + Preview_GC.IM_Edit.Picture.Height ;
{
Preview_GC.ClientWidth := Preview_GC.IM_Edit.Picture.Width ;
Preview_GC.ClientHeight := Preview_GC.PN_Top.Height + Preview_GC.IM_Edit.Picture.Height ;
}
CARREGAR_ESTILO ( ExtractFileName ( FN ) ) ;
End ;

end.
