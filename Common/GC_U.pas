Unit GC_U ;

Interface

Uses Misc_Def_U, Misc_Const_U, Misc_Type_U,
     Misc_1, Misc_U,
     Espelho_RD_Def_U,
     Lauda_Info_U,
     Transparentes_U,
     {$IFDEF NW}
     CCH_U,
     {$ENDIF}
     Carregando_Form_U,
     //RxCtrls,
     MyRichEdit_U,
     Math, IniFiles, ClipBrd,
     Log_U, View_ME_U,
     Winapi.Windows, pngImage,
     System.SysUtils, System.Variants, System.Classes, System.UITypes,
     Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Samples.Spin, Vcl.Forms, Vcl.Menus,
     Vcl.Controls, Vcl.Grids, Vcl.Dialogs, Vcl.Graphics, Vcl.ExtCtrls, Vcl.Mask ;

Var GC_PERFIS                        : T_RD_GC_OK ;
    GC_MAIN                          : T_RD_GC_OK ;
    GC_PREVIEW                       : T_RD_GC_OK ;
    GC_EDITOR                        : T_RD_GC_OK ;
    GC_VAR_PREVIEW_GC                : T_RD_Preview ;
    //GC_VAR_PERFIS_GC                 : T_PERFIS_GC ;
    GC_VAR_QTDE_BANCO_TARJAS         : LongInt ;
    GC_VAR_ARRAY_BANCO_TARJAS        : Array [0..SIZE_BANCO_TARJAS-1] Of T_Banco_Tarjas ;
    GC_VAR_SB_BANCO                  : Array [1..RD_DEF_QTDE_SB_BANCO] Of T_SB_BANCO ;

Procedure GC_CRIAR_AMBIENTE_PREVIEW ( Origem : String ; Form : TForm ;
                                      PN_Selo, PN_Base, PN_Relogio, PN_Tarja, PN_Logo : TPanel ;
                                      Exibe_Selo : Boolean ; Descricao : String ;
                                      Divisor, Indice : LongInt ; Var GC : T_RD_GC_OK ) ;
Procedure GC_CRIAR_IM_GC ( Var GC : T_RD_GC_OK ) ;
Procedure GC_CRIAR_IM_SELO ( Var GC : T_RD_GC_OK ) ;
Procedure GC_CRIAR_IM_RELOGIO ( Var GC : T_RD_GC_OK ) ;
//Procedure GC_CRIAR_GC_IM ( Var GC : T_RD_GC_OK ; Reg : T_GC ; FN : String ) ;
Procedure GC_CRIAR_GC_CLOCK ( Var GC : T_RD_GC_OK ) ;
Procedure GC_CRIAR_GC_ED ( Var GC : T_RD_GC_OK ) ;
//Procedure GC_CARREGAR_PARAMETROS_GC ( Var Perfil : T_PERFIS_GC ; Reg, _COD_GC : LongInt ) ;
//Function GC_CARREGAR_PERFIL_GC ( GC : LongInt ) : T_PERFIS_GC ;
//Procedure GC_ATRIBUIR_GC ( Perfil : T_PERFIS_GC ; Reg, _COD_GC : LongInt ;
//                           Var GC : T_RD_GC_OK ) ;
Procedure GC_REFRESH_FORM_SELETOR ( Origem : String ; GC : T_RD_GC_OK ) ;
//Procedure GC_REFRESH_FORM ( Origem : String ) ;
Procedure GC_LIMPAR_PREVIEW_GRAFICO ( GC : T_RD_GC_OK ) ;
//Procedure GC_PREPARAR_PREVIEW ( Origem : String ; Cod : LongInt ; GC : T_RD_GC_OK ) ;
//Function GC_GET_FN_IMAGEM_TARJA_GC ( _Msg : LongInt ) : String ;
//Function GC_GET_FN_IMAGEM_RELOGIO_GC ( _Msg : LongInt ) : String ;
Procedure GC_EXECUTE_PREVIEW_GC_REG ( Origem1, Origem2 : String ; GC : T_RD_GC_OK ;
                                      Reg : T_GC ; Preview_IMG : Boolean ) ;
Function GC_EXTRAIR_TAG_DE_FILENAME ( FN : String ) : LongInt ;
//Function GC_CARREGAR_IMAGEM_TARJA_GC ( Origem : String ; Reg, _COD_GC : LongInt ) : String ;
//Function GC_LOAD_BANCO_BMP ( FN : String ; Banco : LongInt ) : Boolean ;
Function GC_GET_BANCO_IMG ( Msg : LongInt ) : Byte ;
//Procedure GC_LOAD_ARRAY_IMAGENS_TARJAS ;
Procedure GC_REMOVER_IMG_GC ( Origem : String ; Reg : LongInt ) ;
Procedure GC_CLEAR_IMG ( Origem : String ; Reg : LongInt ) ;
Procedure GC_RELOAD_TARJAS_BANCO ( Origem : String ) ;
Procedure GC_INICIALIZAR ( _SB_Banco_Tarjas_01 : TScrollBox ;
                           _SB_Banco_Tarjas_02 : TScrollBox ;
                           _SB_Banco_Tarjas_03 : TScrollBox ;
                           _SB_Banco_Tarjas_04 : TScrollBox ;
                           _SB_Banco_Tarjas_05 : TScrollBox ;
                           _SB_Banco_Tarjas_06 : TScrollBox ;
                           _SB_Banco_Tarjas_07 : TScrollBox ;
                           _SB_Banco_Tarjas_08 : TScrollBox ;
                           _SB_Banco_Tarjas_09 : TScrollBox ;
                           _SB_Banco_Tarjas_10 : TScrollBox ;
                           _TS_01 : TTabSheet ;
                           _TS_02 : TTabSheet ;
                           _TS_03 : TTabSheet ;
                           _TS_04 : TTabSheet ;
                           _TS_05 : TTabSheet ;
                           _TS_06 : TTabSheet ;
                           _TS_07 : TTabSheet ;
                           _TS_08 : TTabSheet ;
                           _TS_09 : TTabSheet ;
                           _TS_10 : TTabSheet ) ;
Procedure GC_LIMPAR_PREVIEW ;
Procedure GC_PRINT_PERFIL_GC ( Perfil : T_PERFIS_GC ) ;
Procedure GC_CARREGAR_GC_PELO_PERFIL ( Origem : String ; GC : T_RD_GC_OK ; Reg : T_GC ) ;
Procedure GC_REPAINT_T_GC ( GC : T_RD_GC_OK ) ;
Procedure GC_CARREGAR_EXEMPLOS ( Var Reg : T_GC ) ;
Function IS_GC_ASSIGNED ( GC : T_RD_GC_OK ) : Boolean ;
Procedure GC_LOAD_IMAGE_GC ( GC : T_RD_GC_OK ; Reg : T_GC ) ;
//Function GET_REG_GC ( Cmd : String ) : T_GC ;
Function GET_INFO_CG ( Reg : T_GC ) : String ;
Procedure GC_AJUSTAR_MAIUSCULA_MINUSCULA ( MM : Boolean ;
                                           Var L1 : String ;
                                           Var L2 : String ;
                                           Var L3 : String ;
                                           Var HistDic : String ) ;
//Function GC_ANTIGO ( Indice : LongInt ; Retranca, Texto : String ;
//                     Debug : Boolean ) : String ;

Implementation

Uses Main ,
     View_Perfis_GC_U,
     Tipos_GC_U,
     Preview_GC_Aux_U,
     Chyron_Basico_U ;

Procedure GC_CRIAR_AMBIENTE_PREVIEW ( Origem : String ; Form : TForm ;
                                      PN_Selo, PN_Base, PN_Relogio, PN_Tarja, PN_Logo : TPanel ;
                                      Exibe_Selo : Boolean ; Descricao : String ;
                                      Divisor, Indice : LongInt ; Var GC : T_RD_GC_OK ) ;
Var Reg : T_GC ;
Begin
_Debug ( 'INI GC CRIAR_AMBIENTE_PREVIEW Orig[' + Origem + ']' ) ;
GC.Exibe_Selo := Exibe_Selo ;
GC.Form := Form ;
GC.PN_Tarja := PN_Tarja ;
GC.PN_Relogio := PN_Relogio ;
GC.PN_Selo := PN_Selo ;
GC.PN_Logo := PN_Logo ;
GC.PN_Base := PN_Base ;
GC.Descricao := Descricao ;
//PUT_LOG ( 'NAME TPANEL BASE [' + (PN_GC.Parent.Parent AS TPanel).Name + ']' ) ;
GC.Indice := Indice ;
GC.Divisor := MAX ( 1, Divisor ) ;
GC_CRIAR_IM_RELOGIO ( GC ) ;
GC_CRIAR_IM_GC ( GC ) ;
GC_CRIAR_IM_SELO ( GC ) ;
GC.IM_RELOGIO.BringToFront ;
GC_CRIAR_GC_ED ( GC ) ;
GC_CRIAR_GC_CLOCK ( GC ) ;
Reg := TIPOS_GC_GET_REG_GC ( 'GC' ) ;
GC_CARREGAR_EXEMPLOS ( Reg ) ;
GC_EXECUTE_PREVIEW_GC_REG ( 'CRIAR_AMBIENTE_PREVIEW', Origem , GC,
                            Reg, PREVIEW_IMG_TRUE ) ;
//ShowMessage ( GET_INFO_CG ( Reg ) ) ;
_Debug ( 'FIM GC CRIAR_AMBIENTE_PREVIEW Orig[' + Origem + ']' ) ;
End ;

Procedure GC_CRIAR_IM_GC ( Var GC : T_RD_GC_OK ) ;
Var Reg : T_GC ;
Begin
_Debug ( 'INI GC CRIAR_IM_GC' ) ;
If Assigned ( GC.IM_GC ) Then Begin
   _Debug ( '1 Exit ASSIGNED GC CRIAR_IM_GC' ) ;
   ShowMessage ( 'CG_IM Já criado' ) ;
   Exit ;
End ;
_Debug ( '1 GC CRIAR_IM_GC' ) ;
GC.IM_GC := TImage.Create ( GC.Form ) ;
GC.IM_GC.Parent := GC.PN_Tarja ;
_Debug ( '2 GC CRIAR_IM_GC' ) ;
Reg := TIPOS_GC_GET_REG_GC ( 'GC' ) ;
GC_CARREGAR_EXEMPLOS ( Reg ) ;
GC.IM_GC.Tag := GC.Indice ;
GC.IM_GC.Name := 'IM_CG_' + StrZero(GC.Indice,2);
GC.IM_GC.Hint := GC.IM_GC.Name ;
GC.IM_GC.ShowHint := NOT FALSE ; // RD_VAR_SHOWHINT ;
GC.IM_GC.Left := 0 ; // + 1000 ;
GC.IM_GC.AutoSize := FALSE ;
GC.IM_GC.Stretch := TRUE ;
GC.IM_GC.Transparent := FALSE ;
GC.IM_GC.AlignWithMargins := FALSE ;
GC.IM_GC.Margins.Top := 3 ;
GC.IM_GC.Margins.Bottom := 5 ;
GC.IM_GC.Margins.Left := 3 ;
GC.IM_GC.Margins.Right := 3 ;
GC.IM_GC.Visible := TRUE ;
IM_PADRAO ( GC.IM_GC ) ;
_Debug ( '3 GC CRIAR_IM_GC' ) ;
GC_LOAD_IMAGE_GC ( GC, Reg ) ;
_Debug ( '4 GC CRIAR_IM_GC' ) ;
_Debug ( '5 GC CRIAR_IM_GC' ) ;
GC.IM_GC_Loaded := TRUE ;
_Debug ( 'FIM GC CRIAR_IM_GC' ) ;
End ;

Procedure GC_CRIAR_IM_SELO ( Var GC : T_RD_GC_OK ) ;
//Var Reg : T_GC ;
Begin
_Debug ( 'INI GC CRIAR_IM_SELO' ) ;
If Assigned ( GC.IM_SELO ) Then Begin
   _Debug ( '1 Exit ASSIGNED GC CRIAR_IM_SELO' ) ;
   ShowMessage ( 'CG_IM SELO Já criado' ) ;
   Exit ;
End ;
_Debug ( '1 GC CRIAR_IM_SELO' ) ;
GC.IM_SELO := TImage.Create ( GC.Form ) ;
GC.IM_SELO.Parent := GC.PN_Selo ;
_Debug ( '2 GC CRIAR_IM_SELO' ) ;
//Reg := GET_REG_GC ( 'GC' ) ;
//GC_CARREGAR_EXEMPLOS ( Reg ) ;
GC.IM_SELO.Tag := GC.Indice ;
GC.IM_SELO.Name := 'IM_SELO_' + StrZero(GC.Indice,2);
GC.IM_SELO.Hint := GC.IM_SELO.Name ;
GC.IM_SELO.ShowHint := NOT FALSE ; // RD_VAR_SHOWHINT ;
GC.IM_SELO.Left := 0 ; // + 1000 ;
GC.IM_SELO.Align := alClient ;
GC.IM_SELO.AutoSize := TRUE ;
GC.IM_SELO.Stretch := FALSE ;
GC.IM_SELO.Transparent := FALSE ;
GC.IM_SELO.AlignWithMargins := FALSE ;
GC.IM_SELO.Margins.Top := 3 ;
GC.IM_SELO.Margins.Bottom := 5 ;
GC.IM_SELO.Margins.Left := 3 ;
GC.IM_SELO.Margins.Right := 3 ;
GC.IM_SELO.Visible := NOT TRUE ;
IM_PADRAO ( GC.IM_SELO ) ;
//_Debug ( '3 GC CRIAR_IM_SELO' ) ;
//GC_LOAD_IMAGE_GC ( GC, Reg ) ;
//_Debug ( '4 GC CRIAR_IM_SELO' ) ;
//GC.IM_SELO_Loaded := TRUE ;
_Debug ( 'FIM GC CRIAR_IM_SELO' ) ;
End ;

Procedure GC_CRIAR_IM_RELOGIO ( Var GC : T_RD_GC_OK ) ;
//Var Reg : T_GC ;
Begin
_Debug ( 'INI GC CRIAR_IM_GC' ) ;
If Assigned ( GC.IM_RELOGIO ) Then Begin
   _Debug ( '1 Exit ASSIGNED GC CRIAR_IM_RELOGIO' ) ;
   ShowMessage ( 'CG_IM Já criado' ) ;
   Exit ;
End ;
_Debug ( '1 GC CRIAR_IM_RELOGIO' ) ;
GC.IM_RELOGIO := TImage.Create ( GC.Form ) ;
GC.IM_RELOGIO.Parent := GC.PN_Relogio ;
_Debug ( '2 GC CRIAR_IM_RELOGIO' ) ;
//Reg := GET_REG_GC ( 'GC' ) ;
//GC_CARREGAR_EXEMPLOS ( Reg ) ;
GC.IM_RELOGIO.Tag := GC.Indice ;
GC.IM_RELOGIO.Name := 'IM_RELOGIO_' + StrZero(GC.Indice,2);
GC.IM_RELOGIO.Hint := GC.IM_RELOGIO.Name ;
GC.IM_RELOGIO.ShowHint := NOT FALSE ; // RD_VAR_SHOWHINT ;
_Debug ( '3 GC CRIAR_IM_RELOGIO' ) ;
//GC_LOAD_IMAGE_RELOGIO ( GC, Reg ) ;
_Debug ( '4 GC CRIAR_IM_RELOGIO' ) ;
GC.IM_RELOGIO.AutoSize := FALSE ;
GC.IM_RELOGIO.Stretch := TRUE ;
GC.IM_RELOGIO.Transparent := FALSE ;
GC.IM_RELOGIO.AlignWithMargins := FALSE ;
GC.IM_RELOGIO.Margins.Top := 3 ;
GC.IM_RELOGIO.Margins.Bottom := 5 ;
GC.IM_RELOGIO.Margins.Left := 3 ;
GC.IM_RELOGIO.Margins.Right := 3 ;
GC.IM_RELOGIO.Left := 0 ;
GC.IM_RELOGIO.Visible := TRUE ;
IM_PADRAO ( GC.IM_RELOGIO ) ;
_Debug ( '5 GC CRIAR_IM_RELOGIO' ) ;
//GC.IM_RELOGIO_Loaded := TRUE ;
_Debug ( 'FIM GC CRIAR_IM_RELOGIO' ) ;
End ;

Procedure GC_LOAD_TIMAGE ( IM : TImage ; FN : String ; GC : T_RD_GC_OK ) ;
Begin
_Debug ( 'INI GC LOAD_TIMAGE FN[' + FN + '] GC[' + GC.Descricao + ']' ) ;
If NOT Assigned ( IM ) Then Begin
   PUT_LOG ( 'ERROR GC LOAD_TIMAGE !ASSIGNED FN[' + FN + '] GC[' + GC.Descricao + ']' ) ;
   Exit ;
End ;
If RR_FileExists ( 'GC LOAD_TIMAGE', FN ) Then Begin
   Try
      //_Debug ( 'Antes GC LOAD_IMAGE FN[' + Reg.FN + ']' ) ;
      //PUT_LOG ( 'ANTES GC LOAD_TIMAGE FN[' + FN + '] GC[' + GC.Descricao + ']' ) ;
      //IM.Picture.LoadFromFile ( FN ) ;
      GET_PICTURE ( 'GC_LOAD_TIMAGE', IM, IM.Picture, FN ) ;
      IM.Width := IM.Picture.Bitmap.Width DIV GC.Divisor ;
      IM.Height := IM.Picture.Bitmap.Height DIV GC.Divisor ;
      IM.Top := GC.PN_Tarja.Height - IM.Height ;
      //GC.IM_GC.Top := 0 ;
      {
      PUT_LOG ( 'DEPOIS GC LOAD_IMAGE [' + Reg.FN + '] ' +
                'Vis[' + IFSN ( GC.IM_GC.Visible ) + '] ' +
                'PN_WH[' + IntToStr ( GC.PN.Width ) + ':' + IntToStr ( GC.PN.Height ) + '] ' +
                'TL[' + IntToStr ( GC.IM_GC.Top ) + ':' + IntToStr ( GC.IM_GC.Left ) + '] ' +
                'WH[' + IntToStr ( GC.IM_GC.Width ) + ':' + IntToStr ( GC.IM_GC.Height ) + '] ' +
                'PicWH[' + IntToStr ( GC.IM_GC.Picture.Width ) + ':' + IntToStr ( GC.IM_GC.Picture.Height ) + '] ' +
                'BmpWH[' + IntToStr ( GC.IM_GC.Picture.Bitmap.Width ) + ':' + IntToStr ( GC.IM_GC.Picture.Bitmap.Height ) + ']' ) ;
      }
      //_Debug ( 'Depois GC LOAD_IMAGE FN[' + Reg.FN + ']' ) ;
   Except
      On E : Exception Do Begin
         PUT_LOG ( 'Exception GC_LOAD_TIMAGE/1 GC LOAD_TIMAGE ' +
                   '[' + E.Message + '][' + FN + '] GC[' + GC.Descricao  + ']' ) ;
      End ;
   End ;
End Else Begin
   Try
      //_Debug ( 'Antes !FileExists GC LOAD_IMAGE' ) ;
      //PUT_LOG ( 'ANTES GC LOAD_TIMAGE Nil !FileExists [' + FN + '] GC[' + GC.Descricao + ']' ) ;
      IM.Picture := Nil ;
      //_Debug ( 'Depois !FileExists GC LOAD_IMAGE' ) ;
   Except
      On E : Exception Do Begin
         PUT_LOG ( 'Exception GC_LOAD_TIMAGE/2 VAZIO GC LOAD_TIMAGE ' +
                   '[' + E.Message + '] GC[' + GC.Descricao + ']' ) ;
      End ;
   End ;
End ;
_Debug ( 'FIM GC LOAD_TIMAGE FN[' + FN + '] GC[' + GC.Descricao + ']' ) ;
End ;

procedure GC_LOAD_IMAGE_GC ( GC : T_RD_GC_OK ; Reg : T_GC ) ;
Begin
{$IFDEF USAR_CHYRON}
_Debug ( 'INI GC LOAD_IMAGE FN[' + Reg.FN + ']' ) ;
If Reg.Full Then Begin
   If GC.PN_Base.Visible Then Begin
      GC.PN_Base.Hide ;
   End ;
   Reg.FN_Selo := RD.RD_GET_DIR_SELO + Reg.Texto[1] ;
   GC_LOAD_TIMAGE ( GC.IM_SELO, Reg.FN_Selo, GC ) ;
End Else If Reg.Relogio Then Begin
   If NOT GC.PN_Base.Visible Then Begin
      {$IFDEF NW}
      If ( Main.PC_Main.ActivePage = Main.TS_Main_Jornais ) AND
         ( Main.PC_Sequencia.ActivePage = Main.TS_Seq_Preview ) Then Begin
         GC.PN_Base.Show ;
      End ;
      {$ENDIF}
   End ;
   GC_LOAD_TIMAGE ( GC.IM_SELO, '', GC ) ;
   GC_LOAD_TIMAGE ( GC.IM_RELOGIO, Reg.FN_Relogio, GC ) ;
   If NOT GC.PN_Relogio.Visible Then Begin
      {$IFDEF NW}
      If ( Main.PC_Main.ActivePage = Main.TS_Main_Jornais ) AND
         ( Main.PC_Sequencia.ActivePage = Main.TS_Seq_Preview ) Then Begin
         GC.PN_Relogio.Show ;
      End ;
      {$ENDIF}
   End ;
   GC_LOAD_TIMAGE ( GC.IM_GC, Reg.FN, GC ) ;
End Else Begin
   If NOT GC.PN_Base.Visible Then Begin
      {$IFDEF NW}
      If ( Main.PC_Main.ActivePage = Main.TS_Main_Jornais ) AND
         ( Main.PC_Sequencia.ActivePage = Main.TS_Seq_Preview ) Then Begin
         GC.PN_Base.Show ;
      End ;
      {$ENDIF}
   End ;
   GC_LOAD_TIMAGE ( GC.IM_SELO, '', GC ) ;
   GC.PN_Relogio.Hide ;
   //GC.IM_GC.Left := 0 ;
   GC_LOAD_TIMAGE ( GC.IM_GC, Reg.FN, GC ) ;
//   GC_LOAD_TIMAGE ( GC.IM_RELOGIO, '', GC ) ;
End ;
_Debug ( 'FIM GC LOAD_IMAGE FN[' + Reg.FN + ']' ) ;
{$ENDIF}
End ;

(*
Procedure GC_CRIAR_GC_IM ( Var GC : T_RD_GC_OK ; Reg : T_GC ; FN : String ) ;
Var Local : LongInt ;
    _Key  : String ;
Begin
_Debug ( 'INI GC CRIAR_GC_IM' ) ;
PUT_LOG ( 'INI IMG GC CRIAR_GC_IM Reg[' + IntToStr(Reg.Msg) + ']' ) ;
_Debug ( '6a GC CRIAR_GC_IM' ) ;
//GC_CRIAR_GC_IM_SIMPLES ( GC ) ;
{
If Reg <= RD_MAX_SECOES Then Begin
   _Debug ( '6b GC CRIAR_GC_IM' ) ;
   //RRCT GC.IM_GC.OnDblClick := RD_BOT_IM_GC_DBLCLICK ;
   //RRCT GC.IM_GC.OnDragOver := RD_IM_DragOver ;
   //RRCT GC.IM_GC.OnDragDrop := RD_IM_DragDrop ;
End ;
}
_Debug ( '6c GC CRIAR_GC_IM' ) ;
//GC.IM_GC.Invalidate ;
_Debug ( '6d GC CRIAR_GC_IM' ) ;
//GC.IM_GC.Repaint ;
For Local := 0 To RD_MAX_EDITS - 1 Do Begin
   _Debug ( '6e GC CRIAR_GC_IM [' + IntToStr(Local) + ']' ) ;
   If GC.ED_GC[Local].Visible Then Begin
      _Debug ( '6e1 GC CRIAR_GC_IM' ) ;
      GC.ED_GC[Local].Hide ;
      GC.ED_GC[Local].Show ;
      _Debug ( '6e2 GC CRIAR_GC_IM' ) ;
      GC.ED_GC[Local].Invalidate ;
      GC.ED_GC[Local].Repaint ;
      _Debug ( '6e3 GC CRIAR_GC_IM' ) ;
      If GC.ED_GC[Local].BorderStyle = bsSingle Then Begin
         _Debug ( '6e4 GC CRIAR_GC_IM' ) ;
         GC.ED_GC[Local].BorderStyle := bsNone ;
         GC.ED_GC[Local].BorderStyle := bsSingle ;
      End Else Begin
          _Debug ( '6e5 GC CRIAR_GC_IM' ) ;
         GC.ED_GC[Local].BorderStyle := bsSingle ;
         GC.ED_GC[Local].BorderStyle := bsNone ;
      End ;
   _Debug ( '6e6 GC CRIAR_GC_IM' ) ;
   End ;
   _Debug ( '6e7 GC CRIAR_GC_IM' ) ;
End ;
PUT_LOG ( 'FIM GC CRIAR_GC_IM' ) ;
_Debug ( 'FIM GC CRIAR_GC_IM' ) ;
End ;
*)

Procedure GC_CRIAR_GC_CLOCK ( Var GC : T_RD_GC_OK ) ;
Begin
_Debug ( 'INI GC CRIAR_GC_CLOCK' ) ;
PUT_LOG ( '1 GC CRIAR_GC_CLOCK Indice[' + IntToStr(GC.Indice) + ']' ) ;
GC.GC_CLOCK := TTransEdit.Create ( GC.Form ) ;
GC.GC_CLOCK.Parent := GC.PN_Relogio ;
GC.GC_CLOCK.Visible := TRUE ;
GC.GC_CLOCK.Enabled := TRUE ;
GC.GC_CLOCK.Tag := GC.Indice ;
GC.GC_CLOCK.Name := 'GC_CLOCK_' + StrZero(GC.Indice,2) ;
GC.GC_CLOCK.Align := alNone ;
GC.GC_CLOCK.Font.Name := 'Futura LT BT' ;
GC.GC_CLOCK.Font.Size := 12 ;
GC.GC_CLOCK.Font.Style := [fsBold] ;
GC.GC_CLOCK.Color := clYellow ;
//GC.GC_CLOCK.OnDragOver := RD_RXCLOCK_DragOver ;
//GC.GC_CLOCK.OnDragDrop := RD_RXCLOCK_DragDrop ;
GC.GC_CLOCK.Height := 19 ;
GC.GC_CLOCK.Width := 59 ;
GC.GC_CLOCK.Transparent := TRUE ;
GC.GC_CLOCK.ShowHint := FALSE ;
GC.GC_CLOCK.Left := 20 ;
GC.GC_CLOCK.Top := (GC.GC_CLOCK.Parent As TPanel).Height - 30 ;
GC.GC_CLOCK.Text := Copy ( TimeToStr ( Now ), 1 , 5 ) ;
//LABEL_PADRAO ( GC.GC_CLOCK ) ;
_Debug ( 'FIM GC CRIAR_GC_CLOCK' ) ;
End ;

Procedure GC_CRIAR_GC_ED ( Var GC : T_RD_GC_OK ) ;
Var Local2 : LongInt ;
Begin
_Debug ( 'INI GC CRIAR_GC_ED' ) ;
For Local2 := 0 To RD_MAX_EDITS - 1 Do Begin
   _Debug ( '2 GC CRIAR_GC_ED [' + IntToStr(Local2) + ']' ) ;
   GC.ED_GC[Local2] := TTransEdit.Create ( GC.Form ) ;
   GC.ED_GC[Local2].Parent := GC.PN_Tarja ;
   GC.ED_GC[Local2].Tag := 1000 * Local2 + GC.Indice ;
   GC.ED_GC[Local2].Left := 30 ;
   GC.ED_GC[Local2].Visible := TRUE ;
   GC.ED_GC[Local2].Name := 'LB_' + IntToStr(GC.Indice) + '_' + IntToStr(Local2) ;
   GC.ED_GC[Local2].Width := GC.PN_Tarja.Width - GC.ED_GC[Local2].Left - Random (100) - 20 ;
   GC.ED_GC[Local2].ShowHint := FALSE ; // RD_VAR_SHOWHINT ;
   //GC.ED_GC[Local2].Color := clWhite ;
   GC.ED_GC[Local2].Font.Name := 'Futura Bt Md' ; // 20
   GC.ED_GC[Local2].Font.Size := 12 ; // 20
   GC.ED_GC[Local2].Font.Color := clWhite ;
   GC.ED_GC[Local2].Font.Style := [fsBold] ;
   GC.ED_GC[Local2].Top := 2 + Local2 * ( GC.ED_GC[Local2].Height + 2 );
   GC.ED_GC[Local2].Transparent := TRUE ;
   GC.ED_GC[Local2].BorderStyle := bsNone ;
   //GC.ED_GC[Local2].BorderStyle := bsSingle ;
   GC.ED_GC[Local2].DoubleBuffered := TRUE ;
   GC.ED_GC[Local2].Brush.Style := bsClear ;
   GC.ED_GC[Local2].StyleElements := [] ;
   GC.ED_GC[Local2].Text := GC.ED_GC[Local2].Name ;
   GC.ED_GC[Local2].Hint := 'Name ' + GC.ED_GC[Local2].Name ;
   GC.ED_GC[Local2].ShowHint := NOT FALSE ;
   //If GC.Indice < RD_MAX_SECOES Then Begin
      //GC.ED_GC[Local2].OnChange := RD_EDITOR_LAUDA_CHANGE ;
      //GC.ED_GC[Local2].OnEnter := RD_EDT_ENTER ;
      //GC.ED_GC[Local2].OnExit := RD_EDT_EXIT ;
      //GC.ED_GC[Local2].OnDragOver := RD_EDT_DragOver ;
      //GC.ED_GC[Local2].OnDragDrop := RD_EDT_DragDrop ;
   //End ;
   EDT_PADRAO ( GC.ED_GC[Local2] ) ;
End ;
_Debug ( 'FIM RD CRIAR_GC_ED' ) ;
End ;

(*
Procedure GC_CARREGAR_PARAMETROS_GC ( Var Perfil : T_PERFIS_GC ; Reg, _COD_GC : LongInt ) ;
Var Local  : LongInt ;
Begin
_Debug ( 'INI GC CARREGAR_PARAMETROS_CC Reg[' + IntToStr(Reg) + ' ' +
         'GC[' + IntToStr(_COD_GC) + ']' ) ;
If Reg < 0 Then Begin
   _Debug ( 'Exit Reg < 0 GC CARREGAR_PARAMETROS_CC' ) ;
   Exit ;
End ;
Perfil := GC_CARREGAR_PERFIL_GC ( _COD_GC ) ;
_Debug ( '1 GC CARREGAR_PARAMETROS_CC' ) ;
If ( Reg >= 0 ) AND ( Reg < RD_MAX_SECOES ) Then Begin
   _Debug ( '2 GC CARREGAR_PARAMETROS_CC' ) ;
   //RRCT RD_VAR_RNEWS.SECAO[Reg].COD_GC := _COD_GC ;
   //RRCT RD_VAR_RNEWS.SECAO[Reg].Qtde_Edits := Perfil.Qtde_Edits ;
   //RRCT RD_VAR_RNEWS.SECAO[Reg].GC_Descricao := Perfil.GC_Descricao ;
   _Debug ( '3 GC CARREGAR_PARAMETROS_CC' ) ;
End ;
//RD_PRINT_PERFIL_GC ( Perfil ) ;
_Debug ( '4 GC CARREGAR_PARAMETROS_CC' ) ;
If NOT Perfil.Carregado Then Begin
   PUT_LOG ( 'ABORT RD CARREGAR_PARAMETROS_GC POR !PERFIL.Carregado' ) ;
   _Debug ( 'Exit Not Perfil_Carregado GC CARREGAR_PARAMETROS_CC' ) ;
   Exit ;
End ;
_Debug ( '5 GC CARREGAR_PARAMETROS_CC' ) ;
If Reg = RD_MAX_SECOES Then Begin
   _Debug ( '6 GC CARREGAR_PARAMETROS_CC' ) ;
   //GC_ATRIBUIR_GC ( Perfil, Reg, _COD_GC, RD_GC_EDITOR ) ;
   _Debug ( 'Exit Reg = RD_MAX_SECOES GC CARREGAR_PARAMETROS_CC' ) ;
   Exit ;
End ;
_Debug ( '7 GC CARREGAR_PARAMETROS_CC' ) ;
With RD_VAR_SECAO Do Begin
   _Debug ( '7a GC CARREGAR_PARAMETROS_CC Reg[' + IntToStr(Reg) + ']' ) ;
   GC.GC_CLOCK.Visible := Perfil.Clock_Ativado ;
   _Debug ( '7b GC CARREGAR_PARAMETROS_CC' ) ;
   GC.GC_CLOCK.Color := Perfil.Clock_Cor ;
   GC.GC_CLOCK.Left := Perfil.Clock_X ;
   GC.GC_CLOCK.Top := (GC.GC_CLOCK.Parent As TPanel).Height + Perfil.Clock_Y ;
   GC.GC_CLOCK.Width := Perfil.Clock_W ;
   GC.GC_CLOCK.Height := Perfil.Clock_H ;
   GC.GC_CLOCK.Font.Name := Perfil.Clock_Font_Name ;
   GC.GC_CLOCK.Font.Size := Perfil.Clock_Font_Size ;
   GC.GC_CLOCK.Font.Style := [] ;
   If Perfil.Clock_Font_Bold Then Begin
      GC.GC_CLOCK.Font.Style := GC.GC_CLOCK.Font.Style + [fsBold] ;
   End ;
   _Debug ( '8 GC CARREGAR_PARAMETROS_CC' ) ;
   If Perfil.Clock_Font_Italic Then Begin
      GC.GC_CLOCK.Font.Style := GC.GC_CLOCK.Font.Style + [fsItalic] ;
   End ;
   For Local := 0 To RD_MAX_EDITS - 1 Do Begin
      _Debug ( '9 GC CARREGAR_PARAMETROS_CC' ) ;
      GC.ED_GC[Local].Visible := Perfil.ED[Local].Ativo ;
      GC.ED_GC[Local].Left := Perfil.ED[Local].X ;
      GC.ED_GC[Local].Top :=
          (GC.ED_GC[Local].Parent As TPanel).Height +
          Perfil.ED[Local].Y ;
      GC.ED_GC[Local].Width := Perfil.ED[Local].W ;
      GC.ED_GC[Local].Font.Name := Perfil.ED[Local].Fonte_Name ;
      GC.ED_GC[Local].Font.Size := Perfil.ED[Local].Fonte_Size ;
      GC.ED_GC[Local].Font.Style := [] ;
      If Perfil.ED[Local].Caixa = 'U' Then Begin
         GC.ED_GC[Local].CharCase := ecUpperCase ;
      End Else If Perfil.ED[Local].Caixa = 'L' Then Begin
         GC.ED_GC[Local].CharCase := ecLowerCase ;
      End Else Begin
         GC.ED_GC[Local].CharCase := ecNormal ;
      End ;
      _Debug ( '10 GC CARREGAR_PARAMETROS_CC' ) ;
      If ( Perfil.ED[Local].Alinhamento = 'E' ) OR
         ( Perfil.ED[Local].Alinhamento = 'L' ) Then Begin
         GC.ED_GC[Local].Alignment := taLeftJustify ;
      End Else If ( Perfil.ED[Local].Alinhamento = 'D' ) OR
                  ( Perfil.ED[Local].Alinhamento = 'R' ) Then Begin
         GC.ED_GC[Local].Alignment := taRightJustify ;
      End Else If Perfil.ED[Local].Alinhamento = 'C' Then Begin
         GC.ED_GC[Local].Alignment := taCenter ;
      End ;
      If Perfil.ED[Local].Borda = 1 Then Begin
         GC.ED_GC[Local].BorderStyle := bsSingle ;
      End Else Begin
         GC.ED_GC[Local].BorderStyle := bsNone ;
      End ;
      _Debug ( '11 GC CARREGAR_PARAMETROS_CC' ) ;
      If Perfil.ED[Local].Fonte_Bold Then Begin
         GC.ED_GC[Local].Font.Style := GC.ED_GC[Local].Font.Style + [fsBold] ;
      End ;
      If Perfil.ED[Local].Fonte_Italico Then Begin
         GC.ED_GC[Local].Font.Style := GC.ED_GC[Local].Font.Style + [fsItalic] ;
      End ;
      GC.ED_GC[Local].Font.Color := Perfil.ED[Local].Cor_Fonte ;
      GC.ED_Cor_Excesso[Local] := Perfil.ED[Local].Cor_Excesso ;
   End ;
End ;
_Debug ( 'FIM GC CARREGAR_PARAMETROS_CC' ) ;
End ;

Function GC_CARREGAR_PERFIL_GC ( GC : LongInt ) : T_PERFIS_GC ;
Var FN     : String ;
    Local  : LongInt ;
    Ini    : TMemIniFile ;
    Aux    : String ;
//    Secao  : String ;
Begin
_Debug ( 'INI GC CARREGAR_PERFIL_GC [' + IntToStr ( GC ) + ']' ) ;
Result.Carregado := FALSE ;
FN := RD_GET_DIR_DATABASE_CONFIG_TARJAS_PERFIS + StrZero(GC, 4) + '.dat' ;
If NOT RR_FileExists ( FN ) Then Begin
   PUT_LOG ( 'FN PERFIL GC NOT FOUND [' + FN + ']' ) ;
   _Debug ( 'Exit NOT RR_FileExists GC CARREGAR_PERFIL_GC [' + FN + ']' ) ;
   Exit ;
End ;
//PUT_LOG ( 'FN PERFIL GC OK [' + FN + ']' ) ;
Ini := TMemIniFile.Create ( FN ) ;
Result.QTDE_EDITS := Ini.ReadInteger ( 'GERAL', 'QTDE_EDITS', 2 ) ;
Result.GC_Descricao := Ini.ReadString ( 'GERAL', 'DESCRICAO', '' ) ;
Result.Clock_Ativado := Ini.ReadBool ( 'CLOCK', 'ATIVADO', FALSE ) ;
Result.Clock_Cor := RD_GET_COLOR_STR ( Ini.ReadString ( 'CLOCK', 'COR', '0' ) ) ;
Result.Clock_X := Ini.ReadInteger ( 'CLOCK', 'X', 0 ) ;
Result.Clock_Y := Ini.ReadInteger ( 'CLOCK', 'Y', 0 ) ;
Result.Clock_W := Ini.ReadInteger ( 'CLOCK', 'W', 0 ) ;
Result.Clock_H := Ini.ReadInteger ( 'CLOCK', 'H', 0 ) ;
Result.Clock_FONT_NAME := Ini.ReadString ( 'CLOCK', 'FONT_NAME', 'Futura Lt BT' ) ;
Result.Clock_FONT_SIZE := Ini.ReadInteger ( 'CLOCK', 'FONT_SIZE', 12 ) ;
Result.Clock_FONT_BOLD := Ini.ReadBool ( 'CLOCK', 'FONT_BOLD', FALSE ) ;
Result.Clock_FONT_ITALIC := Ini.ReadBool ( 'CLOCK', 'FONT_ITALIC', FALSE ) ;
For Local := 0 To RD_MAX_EDITS - 1 Do Begin
   Result.ED[Local].Ativo := Ini.ReadBool ( 'ATIVO', 'A' + StrZero(Local,4), FALSE ) ;
   Result.ED[Local].X := Ini.ReadInteger ( 'POSICAO', 'X' + StrZero(Local,4), -1 ) ;
   Result.ED[Local].Y := Ini.ReadInteger ( 'POSICAO', 'Y' + StrZero(Local,4), -1 ) ;
   Result.ED[Local].W := Ini.ReadInteger ( 'LARGURA', 'W' + StrZero(Local,4), -1 ) ;
   Result.ED[Local].Caixa := Ini.ReadString ( 'CAIXA', 'C' + StrZero(Local,4), '' ) ;
   Aux := Ini.ReadString ( 'ALINHAMENTO', 'A' + StrZero(Local,4), 'E' ) + 'E' ;
   Result.ED[Local].Alinhamento := Aux[1] ;
   Result.ED[Local].Fonte_Name := Ini.ReadString ( 'FONTE', 'N' + StrZero(Local,4), 'Arial' ) ;
   Result.ED[Local].Fonte_Size := Ini.ReadInteger ( 'FONTE', 'S' + StrZero(Local,4), 16 ) ;
   Result.ED[Local].Borda := Ini.ReadInteger ( 'BORDA', 'B' + StrZero(Local,4), 16 ) ;
   Result.ED[Local].Fonte_Bold := Ini.ReadBool ( 'FONTE', 'B' + StrZero(Local,4), TRUE ) ;
   Result.ED[Local].Fonte_Italico := Ini.ReadBool ( 'FONTE', 'I' + StrZero(Local,4), FALSE ) ;
   Result.ED[Local].Cor_Fonte := RD_GET_COLOR_STR ( Ini.ReadString ( 'CORES', 'F' + StrZero(Local,4), '$FFFFFF' ) ) ;
   Result.ED[Local].Cor_Excesso := RD_GET_COLOR_STR ( Ini.ReadString ( 'CORES', 'E' + StrZero(Local,4), '$FF00FF' ) ) ;
End ;
Result.Carregado := TRUE ;
Ini.Free ;
_Debug ( 'FIM GC CARREGAR_PERFIL_GC [' + IntToStr ( GC ) + ']' ) ;
End ;
*)

(*
Procedure GC_ATRIBUIR_GC ( Perfil : T_PERFIS_GC ; Reg, _COD_GC : LongInt ;
                           Var GC : T_RD_GC_OK ) ;
Var Local  : LongInt ;
Begin
_Debug ( 'INI GC ATRIBUIR_GC' ) ;
{
Reg_Clock.FONT_CLOCK.Name := Ini.ReadString ( 'CLOCK', 'FONT_NAME', 'Futura Md BT' ) ;
Reg_Clock.FONT_CLOCK.Size := Ini.ReadInteger ( 'CLOCK', 'FONT_SIZE', 28 ) ;
Reg_Clock.FONT_CLOCK.Color := GET_COLOR_STR ( Ini.ReadString ( 'CLOCK', 'FONT_COLOR', 'RGB(0,0,0)' ) ) ;
Reg_Clock.X := Ini.ReadInteger ( 'CLOCK', 'X', 0 ) ;
Reg_Clock.Y := Ini.ReadInteger ( 'CLOCK', 'Y', -40 ) ;
Reg_Clock.W := Ini.ReadInteger ( 'CLOCK', 'X', 200 ) ;
}
{
GC.GC_CLOCK.Visible := TRUE ; // Perfil.Clock_Ativado ;
GC.GC_CLOCK.Color := Reg_Clock._Color ;
GC.GC_CLOCK.Left := Reg_Clock.X ;
GC.GC_CLOCK.Top := Reg_Clock.Y ;
GC.GC_CLOCK.Width := Reg_Clock.W ;
GC.GC_CLOCK.Height := Reg_Clock.H ;
GC.GC_CLOCK.Font.Name := Reg_Clock._Name ;
GC.GC_CLOCK.Font.Size := Reg_Clock._Size ;
GC.GC_CLOCK.Font.Style := [] ;
If Reg_Clock.Bold Then Begin
   GC.GC_CLOCK.Font.Style := GC.GC_CLOCK.Font.Style + [fsBold] ;
End ;
If Reg_Clock.Italic Then Begin
   GC.GC_CLOCK.Font.Style := GC.GC_CLOCK.Font.Style + [fsItalic] ;
End ;
}
For Local := 0 To RD_MAX_EDITS - 1 Do Begin
   //Qtde_Edits := Perfil.Qtde_Edits ;
   GC.ED_GC[Local].Visible := Perfil.ED[Local].Ativo ;
   GC.ED_GC[Local].Left := Perfil.ED[Local].X ;
   GC.ED_GC[Local].Top :=
       (GC.ED_GC[Local].Parent As TPanel).Height +
       Perfil.ED[Local].Y ;
   GC.ED_GC[Local].Width := Perfil.ED[Local].W ;
   GC.ED_GC[Local].Font.Name := Perfil.ED[Local].Fonte_Name ;
   //PUT_LOG ( 'SET GC FONT IDX ' + IntToStr(Local) + ' [' + GC.ED_GC[Local].Font.Name + ']' ) ;
   GC.ED_GC[Local].Font.Size := Perfil.ED[Local].Fonte_Size ;
   GC.ED_GC[Local].Font.Style := [] ;
   If Perfil.ED[Local].Caixa = 'U' Then Begin
      GC.ED_GC[Local].CharCase := ecUpperCase ;
   End Else If Perfil.ED[Local].Caixa = 'L' Then Begin
      GC.ED_GC[Local].CharCase := ecLowerCase ;
   End Else Begin
      GC.ED_GC[Local].CharCase := ecNormal ;
   End ;
   If ( Perfil.ED[Local].Alinhamento = 'E' ) OR
      ( Perfil.ED[Local].Alinhamento = 'L' ) Then Begin
      GC.ED_GC[Local].Alignment := taLeftJustify ;
   End Else If ( Perfil.ED[Local].Alinhamento = 'D' ) OR
               ( Perfil.ED[Local].Alinhamento = 'R' ) Then Begin
      GC.ED_GC[Local].Alignment := taRightJustify ;
   End Else If Perfil.ED[Local].Alinhamento = 'C' Then Begin
      GC.ED_GC[Local].Alignment := taCenter ;
   End ;
   If Perfil.ED[Local].Borda = 1 Then Begin
      GC.ED_GC[Local].BorderStyle := bsSingle ;
   End Else Begin
      GC.ED_GC[Local].BorderStyle := bsNone ;
   End ;
   If Perfil.ED[Local].Fonte_Bold Then Begin
      GC.ED_GC[Local].Font.Style := GC.ED_GC[Local].Font.Style + [fsBold] ;
   End ;
   If Perfil.ED[Local].Fonte_Italico Then Begin
      GC.ED_GC[Local].Font.Style := GC.ED_GC[Local].Font.Style + [fsItalic] ;
   End ;
   GC.ED_GC[Local].Font.Color := Perfil.ED[Local].Cor_Fonte ;
   GC.ED_Cor_Excesso[Local] := Perfil.ED[Local].Cor_Excesso ;
End ;
_Debug ( 'FIM GC ATRIBUIR_GC' ) ;
End ;
*)

Procedure GC_REFRESH_FORM_SELETOR ( Origem : String ; GC : T_RD_GC_OK ) ;
Var Local2 : LongInt ;
Begin
_Debug ( 'INI GC REFRESH_FORM_SELETOR' ) ;
PUT_LOG ( 'GC REFRESH_FORM_SELETOR(1) [' + Origem + ']' ) ;
//RD_RECALC_RANGE_SB ( 'RD REFRESH_FORM_SELETOR' ) ;
//RD_VERIFICAR_ERROS ( 'RD REFRESH_FORM_SELETOR' ) ;
//RD_ATUALIZAR_PN_OBS ( 'RD REFRESH_FORM_SELETOR' ) ;
_Debug ( '1 GC REFRESH_FORM_SELETOR' ) ;
For Local2 := 0 To RD_MAX_EDITS - 1 Do Begin
   With GC Do Begin
      _Debug ( '2 GC REFRESH_FORM_SELETOR Local2[' + IntToStr(Local2) + ']' ) ;
      If Assigned ( IM_GC ) Then Begin
         IM_GC.Invalidate ;
         IM_GC.Repaint ;
      End ;
      _Debug ( '3 GC REFRESH_FORM_SELETOR Local2[' + IntToStr(Local2) + ']' ) ;
      //PN_Tipo.Caption := RD_GET_TIPO_STR ( Local ) ;
      If NOT Assigned ( ED_GC[Local2] ) Then Begin
         ShowMessage ( 'NOT Assigned RD_REFRESH_FORM_SELETOR' ) ;
         Continue ;
      End ;
      _Debug ( '4 GC REFRESH_FORM_SELETOR Local2[' + IntToStr(Local2) + ']' ) ;
      If ED_GC[Local2].Visible Then Begin
         ED_GC[Local2].Hide ;
         ED_GC[Local2].Show ;
         _Debug ( '5 GC REFRESH_FORM_SELETOR Local2[' + IntToStr(Local2) + ']' ) ;
         If ED_GC[Local2].BorderStyle = bsSingle Then Begin
            _Debug ( '6 GC REFRESH_FORM_SELETOR Local2[' + IntToStr(Local2) + ']' ) ;
            ED_GC[Local2].BorderStyle := bsNone ;
            ED_GC[Local2].BorderStyle := bsSingle ;
         End Else Begin
            _Debug ( '7 GC REFRESH_FORM_SELETOR Local2[' + IntToStr(Local2) + ']' ) ;
            ED_GC[Local2].BorderStyle := bsSingle ;
            ED_GC[Local2].BorderStyle := bsNone ;
         End ;
         ED_GC[Local2].Invalidate ;
         ED_GC[Local2].Repaint ;
      End ;
   End ;
   _Debug ( '8 GC REFRESH_FORM_SELETOR Local2[' + IntToStr(Local2) + ']' ) ;
End ;
_Debug ( '9 GC REFRESH_FORM_SELETOR' ) ;
PUT_LOG ( 'GC REFRESH_FORM_SELETOR(2) [' + Origem + ']' ) ;
_Debug ( 'FIM GC REFRESH_FORM_SELETOR' ) ;
End ;

(*
Procedure GC_REFRESH_FORM ( Origem : String ) ;
//Var Local  : LongInt ;
//    Local2 : LongInt ;
Begin
_Debug ( 'INI GC REFRESH_FORM' ) ;
PUT_LOG ( '1 GC REFRESH_FORM(1) [' + Origem + ']' ) ;
//RD_RECALC_RANGE_SB ( 'RD REFRESH_FORM' ) ;
//RD_VERIFICAR_ERROS ( 'RD REFRESH_FORM' ) ;
//RD_ATUALIZAR_PN_OBS ( 'RD REFRESH_FORM' ) ;
_Debug ( '2 GC REFRESH_FORM Origem[' + Origem + ']' ) ;
{
For Local := 0 To RD_MAX_SECOES - 1 Do Begin
   For Local2 := 0 To RD_MAX_EDITS - 1 Do Begin
      With RD_VAR_SECAO[Local] Do Begin
         If Assigned ( GC.IM_GC ) Then Begin
            GC.IM_GC.Invalidate ;
            GC.IM_GC.Repaint ;
         End ;
         //PN_Tipo.Caption := RD_GET_TIPO_STR ( Local ) ;
         If NOT Assigned ( GC.ED_GC[Local2] ) Then Begin
            ShowMessage ( 'NOT Assigned RF_REFRESH_FORM ED_GC' ) ;
            Continue ;
         End ;
         If GC.ED_GC[Local2].Visible Then Begin
            GC.ED_GC[Local2].Hide ;
            GC.ED_GC[Local2].Show ;
            If GC.ED_GC[Local2].BorderStyle = bsSingle Then Begin
               GC.ED_GC[Local2].BorderStyle := bsNone ;
               GC.ED_GC[Local2].BorderStyle := bsSingle ;
            End Else Begin
               GC.ED_GC[Local2].BorderStyle := bsSingle ;
               GC.ED_GC[Local2].BorderStyle := bsNone ;
            End ;
            GC.ED_GC[Local2].Invalidate ;
            GC.ED_GC[Local2].Repaint ;
         End ;
      End ;
   End ;
End ;
}
PUT_LOG ( 'GC REFRESH_FORM(2) [' + Origem + ']' ) ;
_Debug ( 'FIM GC REFRESH_FORM' ) ;
End ;
*)

Procedure GC_LIMPAR_PREVIEW_GRAFICO ( GC : T_RD_GC_OK ) ;
Begin
_Debug ( 'INI GC LIMPAR_PREVIEW_GRAFICO' ) ;
GC.ED_GC[0].Text := '' ;
GC.ED_GC[1].Text := '' ;
GC.ED_GC[2].Text := '' ;
GC.ED_GC[3].Text := '' ;
PUT_LOG ( '1 GC LIMPAR_PREVIEW_GRAFICO' ) ;
//RD_VAR_PREVIEW_GC.LAST_ID := '' ;
//RD_VAR_PREVIEW_GC.Last_Linha := -1 ;
If Assigned ( GC.IM_GC ) Then Begin
   Try
     //GC.IM_GC.Picture.LoadFromFile ( '' ) ;
     GET_PICTURE ( 'GC_LIMPAR_PREVIEW_GRAFICO/1', GC.IM_GC, GC.IM_GC.Picture, '' ) ;
     GC.PN_Tarja.Hide ;
   Except
     On E : Exception Do Begin
        PUT_LOG ( 'GC LIMPAR_PREVIEW_GRAFICO/1 Exception RD_LIMPAR_PREVIEW [' + E.Message + ']' ) ;
     End ;
   End ;
End Else Begin
   PUT_LOG ( 'Erro GC LIMPAR_PREVIEW_GRAFICO/1 NOT Assigned RD_VAR_GC_SELETOR.IM_GC' ) ;
End ;
If Assigned ( GC.IM_Relogio ) Then Begin
   Try
     //GC.IM_Relogio.Picture.LoadFromFile ( '' ) ;
     GET_PICTURE ( 'GC_LIMPAR_PREVIEW_GRAFICO/2', GC.IM_Relogio, GC.IM_Relogio.Picture, '' ) ;
     GC.PN_Relogio.Hide ;
   Except
     On E : Exception Do Begin
        PUT_LOG ( 'GC LIMPAR_PREVIEW_GRAFICO/2 Exception RD_LIMPAR_PREVIEW [' + E.Message + ']' ) ;
     End ;
   End ;
End Else Begin
   PUT_LOG ( 'Erro GC LIMPAR_PREVIEW_GRAFICO/2 NOT Assigned RD_VAR_GC_SELETOR.IM_Relogio' ) ;
End ;
_Debug ( 'FIM GC LIMPAR_PREVIEW_GRAFICO' ) ;
End ;

(*
Procedure GC_PREPARAR_PREVIEW ( Origem : String ; Cod : LongInt ; GC : T_RD_GC_OK ) ;
Var _Fonte : TFont ;
    ID     : String ;
Begin
ID := IntToStr(Cod) + RD_VAR_PREVIEW_GC.Cmd +
      RD_VAR_PREVIEW_GC.ED1 + RD_VAR_PREVIEW_GC.ED2 +
      RD_VAR_PREVIEW_GC.ED3 + RD_VAR_PREVIEW_GC.ED4 ;
If ID = RD_VAR_PREVIEW_GC.LAST_ID Then Begin
   PUT_LOG ( 'MONTAGEM DO PREVIEW GC ABORTADO POR MESMO ID (' + ID + ')' ) ;
   Exit ;
End Else Begin
   PUT_LOG ( 'MONTAGEM DO PREVIEW ACEITO ID (' + ID + ')' ) ;
End ;
RD_LIMPAR_PREVIEW_GRAFICO ;
RD_VAR_PREVIEW_GC.LAST_ID := ID ;
_Debug ( 'INI GC PREPARAR_PREVIEW' ) ;
PUT_LOG ( 'IMG RD PREPARAR_PREVIEW COD[' + IntToStr(Cod) + '] ' +
          'CMD[' + RD_VAR_PREVIEW_GC.Cmd + '] ' +
          'ED1[' + RD_VAR_PREVIEW_GC.ED1 + '] ' +
          'ED2[' + RD_VAR_PREVIEW_GC.ED2 + '] ' +
          'ED3[' + RD_VAR_PREVIEW_GC.ED3 + '] ' +
          'ED4[' + RD_VAR_PREVIEW_GC.ED4 + ']' ) ;
//RD_VAR_GC_SELETOR.IM_GC.Show ;
APLICAR_IMAGEM_GC ( 'RD PREPARAR_PREVIEW', RD_MAX_SECOES, Cod, FALSE ) ;
//
_Fonte := RD_VAR_FORM_LAUDAS.Canvas.Font ;
//
If Pos ( '*', RD_VAR_PREVIEW_GC.ED1 ) = 1 Then Begin
   RD_GC_EDITOR.ED_GC[0].CharCase := ecNormal ;
   Delete ( RD_VAR_PREVIEW_GC.ED1, 1, 1 ) ;
   PUT_LOG ( '*/1 para ecNormal [' + RD_VAR_PREVIEW_GC.ED1 + ']' ) ;
End ;
RD_GC_EDITOR.ED_GC[0].Text := RD_VAR_PREVIEW_GC.ED1 ;
RD_VAR_FORM_LAUDAS.Canvas.Font.Assign ( RD_GC_EDITOR.ED_GC[0].Font ) ;
If ( RD_VAR_FORM_LAUDAS.Canvas.TextWidth ( RD_GC_EDITOR.ED_GC[0].Text ) + 20 ) >
   RD_GC_EDITOR.ED_GC[0].Width Then Begin
   RD_GC_EDITOR.ED_GC[0].Font.Color := clRed ;
End ;
//
If Pos ( '*', RD_VAR_PREVIEW_GC.ED2 ) = 1 Then Begin
   RD_GC_EDITOR.ED_GC[1].CharCase := ecNormal ;
   Delete ( RD_VAR_PREVIEW_GC.ED2, 1, 1 ) ;
   PUT_LOG ( '*/2 para ecNormal [' + RD_VAR_PREVIEW_GC.ED2 + ']' ) ;
End ;
RD_GC_EDITOR.ED_GC[1].Text := RD_VAR_PREVIEW_GC.ED2 ;
RD_VAR_FORM_LAUDAS.Canvas.Font.Assign ( RD_GC_EDITOR.ED_GC[1].Font ) ;
If ( RD_VAR_FORM_LAUDAS.Canvas.TextWidth ( RD_GC_EDITOR.ED_GC[1].Text ) + 20 ) >
   RD_GC_EDITOR.ED_GC[1].Width Then Begin
   RD_GC_EDITOR.ED_GC[1].Font.Color := clRed ;
End ;
//
If Pos ( '*', RD_VAR_PREVIEW_GC.ED3 ) = 1 Then Begin
   RD_GC_EDITOR.ED_GC[2].CharCase := ecNormal ;
   Delete ( RD_VAR_PREVIEW_GC.ED3, 1, 1 ) ;
   PUT_LOG ( '*/3 para ecNormal [' + RD_VAR_PREVIEW_GC.ED3 + ']' ) ;
End ;
RD_GC_EDITOR.ED_GC[2].Text := RD_VAR_PREVIEW_GC.ED3 ;
RD_VAR_FORM_LAUDAS.Canvas.Font.Assign ( RD_GC_EDITOR.ED_GC[2].Font ) ;
If ( RD_VAR_FORM_LAUDAS.Canvas.TextWidth ( RD_GC_EDITOR.ED_GC[2].Text ) + 20 ) >
   RD_GC_EDITOR.ED_GC[2].Width Then Begin
   RD_GC_EDITOR.ED_GC[2].Font.Color := clRed ;
End ;
//
If Pos ( '*', RD_VAR_PREVIEW_GC.ED4 ) = 1 Then Begin
   RD_GC_EDITOR.ED_GC[3].CharCase := ecNormal ;
   Delete ( RD_VAR_PREVIEW_GC.ED4, 1, 1 ) ;
   PUT_LOG ( '*/4 para ecNormal [' + RD_VAR_PREVIEW_GC.ED4 + ']' ) ;
End ;
RD_GC_EDITOR.ED_GC[3].Text := RD_VAR_PREVIEW_GC.ED4 ;
RD_VAR_FORM_LAUDAS.Canvas.Font.Assign ( RD_GC_EDITOR.ED_GC[3].Font ) ;
If ( RD_VAR_FORM_LAUDAS.Canvas.TextWidth ( RD_GC_EDITOR.ED_GC[3].Text ) + 20 ) >
   RD_GC_EDITOR.ED_GC[3].Width Then Begin
   RD_GC_EDITOR.ED_GC[3].Font.Color := clRed ;
End ;
//
RD_VAR_FORM_LAUDAS.Canvas.Font := _Fonte ;
//
RD_VAR_GC_PN_SELETOR.Show ;
RD_VAR_GC_PN_SELETOR.Repaint ;
RD_GC_EDITOR.GC_CLOCK.BringToFront ;
_Debug ( 'FIM GC PREPARAR_PREVIEW' ) ;
End ;
*)

Function GC_EXTRAIR_TAG_DE_FILENAME ( FN : String ) : LongInt ;
Begin
_Debug ( 'INI GC EXTRAIR_TAG_DE_FILENAME' ) ;
FN := ExtractFileName ( FN ) ;
While Pos ( '.', FN ) > 0 Do Delete ( FN, Length(FN), 1 ) ;
Result := StrToIntDef ( FN, -1 ) ;
_Debug ( 'FIM GC EXTRAIR_TAG_DE_FILENAME' ) ;
End ;

Procedure GC_EXECUTE_PREVIEW_GC_REG ( Origem1, Origem2 : String ; GC : T_RD_GC_OK ;
                                      Reg : T_GC ; Preview_IMG : Boolean ) ;
Begin
_Debug ( 'INI GC EXECUTE PREVIEW_GC_REG' ) ;
Exit ;
PUT_LOG ( 'GC EXECUTE_PREVIEW_GC_REG [' + Origem1  + '][' + Origem2 + '][' + Reg.FN + ']' ) ;
If GC.Exibe_Selo Then Begin
   If Reg.Full Then Begin
      GC.PN_Base.Hide ;
   End Else Begin
      {$IFDEF NW}
      If ( Main.PC_Main.ActivePage = Main.TS_Main_Jornais ) AND
         ( Main.PC_Sequencia.ActivePage = Main.TS_Seq_Preview ) Then Begin
         GC.PN_Base.Show ;
      End ;
      {$ENDIF}
   End ;
End Else Begin
   {$IFDEF NW}
      If ( Main.PC_Main.ActivePage = Main.TS_Main_Jornais ) AND
         ( Main.PC_Sequencia.ActivePage = Main.TS_Seq_Preview ) Then Begin
      GC.PN_Base.Show ;
   End ;
   {$ENDIF}
End ;
If Origem2 = 'PREVIEW' Then Begin
   Preview_GC_Aux.PN_Preview_Relogio.Width := 10 ;
   Preview_GC_Aux.PN_Preview_Tarja.Width := 10 ;
End ;
GC_LOAD_IMAGE_GC ( GC, Reg ) ;
_Debug ( '1 GC EXECUTE PREVIEW_GC_REG' ) ;
GC_CARREGAR_GC_PELO_PERFIL ( 'EXECUTE_PREVIEW_GC_REG' + Origem1 + '/' + Origem2 , GC, Reg ) ;
_Debug ( '2 GC EXECUTE PREVIEW_GC_REG' ) ;
{$IFDEF NW}
If ( Main.PC_Main.ActivePage = Main.TS_Main_Jornais ) AND
   ( Main.PC_Sequencia.ActivePage = Main.TS_Seq_Preview ) Then Begin
   GC_REPAINT_T_GC ( GC ) ;
End ;
{$ENDIF}
_Debug ( 'FIM GC EXECUTE PREVIEW_GC_REG' ) ;
End ;

(*
Function GC_CARREGAR_IMAGEM_TARJA_GC ( Origem : String ; Reg, _COD_GC : LongInt ) : String ;
Var FN           : String ;
//    Local        : LongInt ;
    Banco        : Byte ;
    _Key         : String ;
    Perfil       : T_PERFIS_GC ;
Begin
_Debug ( 'INI GC CARREGAR_IMAGEM_TARJA_GC' ) ;
Banco := RD_GET_BANCO_IMG ( _COD_GC ) ;
PUT_LOG ( 'RD IMG CARREGAR_IMAGEM_TARJA_GC ' +
          'Orig[' + Origem + '] ' +
          'Reg[' + IntToStr(Reg) + '] ' +
          'Cod_GC[' + IntToStr ( _COD_GC ) + '] ' +
          'Banco[' + IntToStr(Banco) + ']' ) ;
//PUT_LOG ( 'INI RD CARREGAR_IMAGEM_TARJA_GC ' +
//          'Reg[' + IntToStr(Reg) + '] ' +
//          '_COD_GC[' + IntToStr(_COD_GC) + ']' ) ;
If Banco = RD_BANCO_INVALIDO Then Begin
   _Debug ( 'Exit IMG BANCO_INVALIDO GC CARREGAR_IMAGEM_TARJA_GC' ) ;
   PUT_LOG ( 'Exit IMG BANCO_INVALIDO GC CARREGAR_IMAGEM_TARJA_GC [' + Origem + '] Reg[' + IntToStr(Reg) + ']' ) ;
   Exit ;
End ;
FN := RD_GET_FN_IMAGEM_TARJA_GC ( _COD_GC ) ;
If NOT RR_FileExists ( FN ) Then Begin
   //PUT_LOG ( 'RD CARREGAR_IMAGEM_TARJA_GC NOT FOUND [' + FN + ']' ) ;
   //RD_VAR_SECAO[Reg].GC.IM_GC_Loaded := FALSE ;
   _Debug ( 'Exit NOT RR_FileExists GC CARREGAR_IMAGEM_TARJA_GC' ) ;
   Exit ;
End Else Begin
   //PUT_LOG ( 'RD CARREGAR_IMAGEM_TARJA_GC OK [' + FN + ']' ) ;
End ;
RD_CARREGAR_PARAMETROS_GC ( Perfil, Reg, _COD_GC ) ;
RD_VAR_RETORNO_SELETOR := '#' + RD_VAR_PREVIEW_GC.Cmd + '=' + StrZero(_Cod_GC,4) + ' ' +
                          Perfil.GC_Descricao ;
If Reg = RD_MAX_SECOES Then Begin
   //RD_CRIAR_GC_IM ( RD_VAR_FORM_SELECAO_VG, RD_VAR_GC_PN_SELETOR, GC_EDITOR, _COD_GC, Reg, FN ) ;
   _Debug ( 'Exit/1 Reg ' + IntToStr(Reg) + ' GC CARREGAR_IMAGEM_TARJA_GC' ) ;
   Exit ;
End ;
If Reg < 0 Then Begin
   _Debug ( 'Exit/2 Reg ' + IntToStr(Reg) + ' GC CARREGAR_IMAGEM_TARJA_GC' ) ;
   Exit ;
End ;
With RD_VAR_SECAO Do Begin
   //RD_CRIAR_GC_IM ( RD_VAR_FORM_LAUDAS, PN_TIPOS[RD_TIPO_GC], RD_VAR_SECAO[Reg].GC,
   //                 _COD_GC, Reg, _Key, FN ) ;
End ;
_Debug ( 'FIM GC CARREGAR_IMAGEM_TARJA_GC' ) ;
End ;
*)

(*
Function GC_LOAD_BANCO_BMP ( FN : String ; Banco : LongInt ) : Boolean ;
Var _Tag    : LongInt ;
    _Key    : String ;
    Local   : LongInt ;
    Idx     : LongInt ;
Begin
Exit ;
_Debug ( 'INI GC LOAD_BANCO_BMP [' + ExtractFileName(FN) + '][' + IntToStr(Banco) + ']' ) ;
//PUT_LOG ( 'INI GC LOAD_BANCO_BMP [' + ExtractFileName(FN) + '][' + IntToStr(Banco) + ']' ) ;
Result := FALSE ;
If NOT RR_FileExists ( FN ) Then Begin
   PUT_LOG ( 'Exit LOAD_BMP_BUFFER_OU_FILE NOT EXISTS BANCO_TARJA [' + FN + ']' ) ;
   _Debug ( 'Exit NOT RR_FileExists GC LOAD_BANCO_BMP' ) ;
   Exit ;
End ;
_Debug ( '1 GC LOAD_BANCO_BMP' ) ;
_Tag := GC_EXTRAIR_TAG_DE_FILENAME ( FN ) ;
_Debug ( '2 GC LOAD_BANCO_BMP' ) ;
If ( _Tag < 1 ) OR ( _Tag > 9999 ) Then Begin
   PUT_LOG ( 'Exit LOAD_BMP_BUFFER_OU_FILE TAG INVALIDO [' + IntToStr(_Tag) + ']' ) ;
   _Debug ( 'Exit Tag ' + IntToStr(_Tag) + ' GC LOAD_BANCO_BMP' ) ;
   Exit ;
End ;
Idx := -1 ;
_Debug ( '3 GC LOAD_BANCO_BMP' ) ;
For Local := 0 To SIZE_BANCO_TARJAS_POR_ABA - 1 Do Begin
   If GC_VAR_ARRAY_BANCO_TARJAS[(Banco-1) * SIZE_BANCO_TARJAS_POR_ABA + Local].IM_Banco.Tag = -1 Then Begin
      Idx := (Banco-1) * SIZE_BANCO_TARJAS_POR_ABA + Local ;
      Break ;
   End ;
End ;
_Debug ( '4 GC LOAD_BANCO_BMP' ) ;
If Idx = -1 Then Begin
   PUT_LOG ( 'Exit LOAD_BMP_BUFFER_OU_FILE Idx -1' ) ;
   Exit ;
End ;
_Debug ( '5 GC LOAD_BANCO_BMP' ) ;
Try
   With GC_VAR_ARRAY_BANCO_TARJAS[Idx] Do Begin
      _Key := RD.RD_VAR_JORNAL + '_' + StrZero ( _Tag , 4 ) ;
      RD.RD_LOAD_BMP_BUFFER_OU_FILE ( 'GC LOAD_BANCO_BMP', IM_BANCO.Picture.Bitmap, _Key, FN ) ;
      IM_BANCO.Tag := _Tag ;
      IM_BANCO.Hint := '[' + StrZero(_Tag, 4) + ']' ;
      IM_BANCO.ShowHint := TRUE ;
      IM_BANCO.Width := IM_BANCO.Picture.Bitmap.Width DIV GC.Divisor ;
      IM_BANCO.Height := IM_BANCO.Picture.Bitmap.Height DIV GC.Divisor ;
      //IM_BANCO.Top := RD_ALTURA_PN - IM_BANCO.Height ;
   End ;
   Result := TRUE ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception GC LOAD_BMP [' + FN + '][' + E.Message + ']' ) ;
   End ;
End ;
//PUT_LOG ( 'FIM LOAD_BMP_BUFFER_OU_FILE' ) ;
_Debug ( 'FIM GC LOAD_BANCO_BMP' ) ;
End ;
*)

Function GC_GET_BANCO_IMG ( Msg : LongInt ) : Byte ;
Begin
Result := 0 ;
{$IFDEF USAR_CHYRON}
_Debug ( 'INI GC GET_BANCO_IMG' ) ;
Result := RD_BANCO_INVALIDO ;
If ( Msg < 1 ) OR ( Msg > RD_MAX_MESSAGE ) Then Begin
   _Debug ( 'Exit Msg ' + IntToStr(Msg) + ' GC GET_BANCO_IMG' ) ;
   Exit ;
End ;
Result := RD.RD_VAR_INDICE_BANCO_MSG [ Msg ] ;
_Debug ( 'FIM GC GET_BANCO_IMG' ) ;
{$ENDIF}
End ;

(*
Procedure GC_LOAD_ARRAY_IMAGENS_TARJAS ;
Var RecDos    : TSearchRec ;
    Resultado : LongInt ;
    Dir       : String ;
    Lista     : TStringList ;
    Qtde      : LongInt ;
    Local     : LongInt ;
    Indice    : LongInt ;
    Banco     : LongInt ;
    _Msg      : LongInt ;
    FN        : String ;
//    Base      : String ;
Begin
_Debug ( 'INI GC LOAD_ARRAY_IMAGENS_TARJAS' ) ;
PUT_LOG ( 'INI GC LOAD_ARRAY_IMAGENS_TARJAS' ) ;
FN := RD.RD_GET_DIR_DATABASE_CONFIG + 'tarjas\tarjas.txt' ;
RD.SL_Tarjas_Bancos_Abas.Clear ;
PUT_LOG ( '1 GC LOAD_ARRAY_IMAGENS_TARJAS' ) ;
If RR_FileExists ( FN ) Then Begin
   Try
      PUT_LOG ( '2 GC LOAD_ARRAY_IMAGENS_TARJAS' ) ;
      RD.SL_Tarjas_Bancos_Abas.Text := RD.RD_KERNEL_GET_CONTEUDO (
                   'GC_LOAD_ARRAY_IMAGENS_TARJAS', FN ) ;
      PUT_LOG ( '3 GC LOAD_ARRAY_IMAGENS_TARJAS' ) ;
   Except
      On E : Exception Do Begin
         PUT_LOG ( '4 EXCEPTION GC LOAD_ARRAY_IMAGENS_TARJAS' ) ;
         PUT_LOG ( 'Exception GC LOAD_ARRAY_IMAGENS_TARJAS [' + E.Message + '][' + FN + ']' ) ;
      End ;
   End ;
End ;
PUT_LOG ( '5 GC LOAD_ARRAY_IMAGENS_TARJAS' ) ;
Lista := TStringList.Create ;
//For Banco := 0 To 0 Do Begin // MAX_BANCOS_TARJAS - 1 Do Begin
Dir := GC_GET_DIR_IMAGENS_TARJAS ; // ( Banco+1 ) ;
Lista.Clear ;
Qtde := 0 ;
PUT_LOG ( '6 GC LOAD_ARRAY_IMAGENS_TARJAS' ) ;
RD.RD_VAR_QTDE_IMAGENS_TARJAS := 0 ;
Resultado := FindFirst ( Dir + '????.bmp', 0, RecDos ) ;
//PUT_LOG ( 'Find Banco_' + IntToStr(Banco) + ' Dir:' + Dir ) ;
PUT_LOG ( '7 GC LOAD_ARRAY_IMAGENS_TARJAS' ) ;
While Resultado = 0 Do Begin
   _Msg := EXTRACT_FN_INTEGER ( RecDos.Name, -1 ) ;
   //PUT_LOG ( 'RecDos OK [' + RecDos.Name + '] Msg ['  + IntToStr(_Msg) + ']' ) ;
   If ( _Msg >= 1 ) AND ( _Msg <= RD_MAX_MESSAGE ) Then Begin
      Inc ( RD.RD_VAR_QTDE_IMAGENS_TARJAS ) ;
      Lista.Add ( Dir + RecDos.Name ) ;
      Inc ( Qtde ) ;
      //PUT_LOG ( 'RecDos OK Msg[' + IntToStr(_Msg) + '][' + RecDos.Name + ']' ) ;
   End Else Begin
      PUT_LOG ( 'RecDos NOK [' + RecDos.Name + ']' ) ;
   End ;
   If Qtde = GC_VAR_QTDE_BANCO_TARJAS Then
      Break ;
   Resultado := FindNext ( RecDos ) ;
End ;
PUT_LOG ( '8 GC LOAD_ARRAY_IMAGENS_TARJAS' ) ;
FindClose ( RecDos ) ;
Indice := 0 ;
If Qtde > 0 Then Begin
   For Local := 0 To Qtde - 1 Do Begin
      _Msg := EXTRACT_FN_INTEGER ( Lista[Local], 255 ) ;
      Banco := StrToIntDef ( RD.SL_Tarjas_Bancos_Abas.Values[StrZero(_Msg,4)], -1 ) ;
      If GC_LOAD_BANCO_BMP ( Lista[Local], Banco ) Then Begin
         //PUT_LOG ( 'MSG [' + StrZero(_Msg, 4) + '] ' +
         //          'BANCO [' + IntToStr ( Banco ) + ']' ) ;
         RD.RD_VAR_INDICE_BANCO_MSG [ _Msg ] := Banco ;
         Inc ( Indice ) ;
         //PUT_LOG ( 'OK RD_LOAD_BANCO_BMP [' + Lista[Local] + ']' ) ;
      End Else Begin
         //PUT_LOG ( 'NOK RD_LOAD_BANCO_BMP [' + Lista[Local] + ']' ) ;
      End ;
   End ;
End ;
PUT_LOG ( '9 GC LOAD_ARRAY_IMAGENS_TARJAS' ) ;
//End ;
For Local := 1 To RD_MAX_MESSAGE Do Begin
   If RD.RD_VAR_INDICE_BANCO_MSG[Local] <> RD_BANCO_INVALIDO Then Begin
      //PUT_LOG ( 'BANCO_MSG[' + IntToStr(Local) + ']=' + IntToStr(RD_VAR_INDICE_BANCO_MSG[Local]) ) ;
   End ;
End ;
PUT_LOG ( '10 GC LOAD_ARRAY_IMAGENS_TARJAS' ) ;
Lista.Clear ;
_Debug ( 'FIM GC LOAD_ARRAY_IMAGENS_TARJAS' ) ;
PUT_LOG ( 'FIM GC LOAD_ARRAY_IMAGENS_TARJAS' ) ;
End ;
*)

Procedure GC_REMOVER_IMG_GC ( Origem : String ; Reg : LongInt ) ;
{$IFDEF USAR_CHYRON}
Var Local : LongInt ;
{$ENDIF}
Begin
{$IFDEF USAR_CHYRON}
_Debug ( 'INI GC REMOVER_IMG_GC' ) ;
If NOT MyMessageDlg ( 'Confirma a exclusão do GC e dos textos relacionados ?' ,
                      mtInformation, [mbYes, mbNo],
                      ['Sim','Não'], 'Confirmação', Resposta_Dialog ) Then Begin
   _Debug ( 'Exit NOT Confirm GC REMOVER_IMG_GC' ) ;
   Exit ;
End ;
Try
  GC_CLEAR_IMG ( 'GC REMOVER_IMG_GC', Reg ) ;
  For Local := 0 To RD_MAX_EDITS - 1 Do Begin
     RD.RD_VAR_SECAO.GC.ED_GC[Local].Clear ;
  End ;
  //GC_REFRESH_FORM ( 'RD_REMOVER_IMG_CC/*' + Origem ) ;
Except
End ;
_Debug ( 'FIM GC REMOVER_IMG_GC' ) ;
{$ENDIF}
End ;

Procedure GC_CLEAR_IMG ( Origem : String ; Reg : LongInt ) ;
Begin
{$IFDEF USAR_CHYRON}
_Debug ( 'INI GC CLEAR_IMG' ) ;
PUT_LOG ( 'INI GC CLEAR_IMG [' + Origem + ']' ) ;
With RD.RD_VAR_SECAO Do Begin
   //RRCT Qtde_Edits := 0 ;
   If Assigned ( GC.IM_GC ) Then Begin
      //GC.IM_GC.Picture := Nil ;
      PUT_LOG ( 'GC CLEAR_IMG [' + '' + ']' ) ;
      //GC.IM_GC.Picture.LoadFromFile ( '' ) ;
      GET_PICTURE ( 'GC CLEAR_IMG', GC.IM_GC, GC.IM_GC.Picture, '' ) ;
   End Else Begin
      PUT_LOG ( 'ERRO NOT Assigned GC CLEAR_IMG [' + Origem + ']' ) ;
   End ;
   GC.IM_GC_Loaded := FALSE ;
End ;
With RD.RD_VAR_RNEWS.SECAO[Reg] Do Begin
   COD_GC := 0 ;
   Qtde_Edits := 0 ;
   GC_Descricao := '' ;
End ;
PUT_LOG ( 'FIM GC CLEAR_IMG [' + Origem + ']' ) ;
_Debug ( 'FIM GC CLEAR_IMG' ) ;
{$ENDIF}
End ;

Procedure GC_RELOAD_TARJAS_BANCO ( Origem : String ) ;
//Var //Local     : LongInt ;
    //Local2    : LongInt ;
    //SB        : TScrollBox ;
    //FN        : String ;
    //Lista     : TStringList ;
    //Qtde      : LongInt ;
//    Indice    : LongInt ;
//    Aba       : LongInt ;
//    Idx_Banco : LongInt ;
Begin
{$IFDEF USAR_CHYRON}
_Debug ( 'INI GC RELOAD_TARJAS_BANCO' ) ;
PUSH_TICK ( 'GC RELOAD_TARJAS_BANCO' ) ;
Try
   PUT_LOG ( 'INI GC RELOAD_TARJAS_BANCO [' + Origem + ']' ) ;
   Lista := TStringList.Create ;
   Lista.Clear ;
   FN := RD.RD_GET_DIR_DATABASE_CONFIG + 'tarjas\pastas_tarjas.txt' ;
   If RR_FileExists ( 'GC RELOAD_TARJAS_BANCO', FN ) Then Begin
      Try
         Lista.Text := RD.RD_KERNEL_GET_CONTEUDO ( 'GC_RELOAD_TARJAS_BANCO', FN ) ;
         Qtde := Lista.Count ;
         If Qtde > 0 Then Begin
            For Local2 := 0 To MIN ( Qtde, 10 ) - 1 Do Begin
               GC_VAR_SB_BANCO[Local2+1].TS.Caption := Lista[Local2] ;
            End ;
         End ;
      Except
      End ;
   End ;
   Lista.Free ;
   For Local2 := 0 To SIZE_BANCO_TARJAS - 1 Do Begin
      Idx_Banco := Local2 DIV SIZE_BANCO_TARJAS_POR_ABA + 1 ;
      //Indice_Ordem := Local2 MOD SIZE_BANCO_TARJAS_POR_ABA ;
      SB := GC_VAR_SB_BANCO[Idx_Banco].SB ;
      SB.VertScrollBar.Range := SIZE_BANCO_TARJAS_POR_ABA * RD_ALTURA_PN ;
      //For Local := 0 To SIZE_BANCO_TARJAS_POR_ABA - 1 Do Begin
         With GC_VAR_ARRAY_BANCO_TARJAS[Local2] Do Begin
            If Assigned ( IM_BANCO ) Then Begin
               IM_BANCO.Free ;
               IM_BANCO := Nil ;
            End ;
            If Assigned ( PN_BANCO ) Then Begin
               PN_BANCO.Free ;
               PN_BANCO := Nil ;
            End ;
            //
            PN_BANCO := TPanel.Create ( RD.RD_VAR_FORM_SELECAO_VG ) ;
            PN_BANCO.Visible := FALSE ;
            PN_BANCO.Parent := SB ;
            PN_BANCO.Tag := Local2 ;
            PN_BANCO.Name := 'PN_BANCO_TARJA_' + StrZero(Local2,2) ; // + '_' + StrZero(Local,2)  ;
            PN_BANCO.Hint := PN_BANCO.Name ;
            PN_BANCO.ShowHint := FALSE ; // RD_VAR_SHOWHINT ;
            PN_BANCO.Caption := '' ; // IntToStr(Local) ; // PN.Name ;
            PN_BANCO.Font.Color := clYellow ;
            PN_BANCO.Align := alTop ;
            PN_BANCO.Height := RD_ALTURA_PN ;
            PN_BANCO.Color := RD_COR_PN ;
            PN_BANCO.BevelKind := bkNone ;
            PN_BANCO.BevelInner := bvNone ;
            PN_BANCO.BevelOuter := bvNone ;
            PN_BANCO.Margins.Bottom := 8 ;
            PN_BANCO.AlignWithMargins := TRUE ;
            PN_PADRAO ( PN_BANCO ) ;
            //
            PN_HEADER := TPanel.Create ( RD.RD_VAR_FORM_SELECAO_VG ) ;
            PN_HEADER.Visible := TRUE ;
            PN_HEADER.Parent := PN_BANCO ;
            PN_HEADER.Tag := Local2 ;
            PN_HEADER.Name := 'PN_HEADER_TARJA_' + StrZero(Local2,2) ; // + '_' + StrZero(Local,2)  ;
            PN_HEADER.Hint := PN_HEADER.Name ;
            PN_HEADER.ShowHint := FALSE ; // RD_VAR_SHOWHINT ;
            PN_HEADER.Caption := '' ; // IntToStr(Local) ; // PN.Name ;
            PN_HEADER.Font.Color := clYellow ;
            PN_HEADER.Align := alTop ;
            PN_HEADER.Height := 15 ;
            PN_HEADER.Color := clYellow ;
            PN_HEADER.Font.Color := clBlack ;
            PN_HEADER.BevelKind := bkNone ;
            PN_HEADER.BevelInner := bvNone ;
            PN_HEADER.BevelOuter := bvNone ;
            PN_PADRAO ( PN_HEADER ) ;
            //
            IM_BANCO := TImage.Create ( RD.RD_VAR_FORM_SELECAO_VG ) ;
            IM_BANCO.Parent := PN_BANCO ;
            //IM_BANCO.Align := alTop ;
            IM_BANCO.Tag := -1 ; // Local2 ;
            IM_BANCO.Name := 'IM_BANCO_TARJA_' + StrZero(Local2,2) ; // + '_' + StrZero(Local,2)  ;
            IM_BANCO.Hint := IM_BANCO.Name ;
            IM_BANCO.ShowHint := FALSE ; // RD_VAR_SHOWHINT ;
            //IM_BANCO.OnClick := RD_CLICK_IM_SELECAO_TARJA_VIDEOGRAFISMO ;
            //IM_BANCO.OnDblClick := RD_DBLCLICK_IM_SELECAO_TARJA_VIDEOGRAFISMO ;
            //IM_BANCO.Picture.Bitmap.Assign ( png ) ;
            IM_BANCO.AutoSize := FALSE ;
            IM_BANCO.Stretch := TRUE ;
            //IM_BANCO.Top := RD_ALTURA_PN - IM_BANCO.Height ;
            IM_BANCO.Left := 0 ;
            IM_BANCO.Top := PN_HEADER.Height + 1 ;
            IM_PADRAO ( IM_BANCO ) ;
            IM_BANCO.Invalidate ;
            IM_BANCO.Repaint ;
         End ;
      //End ;
   End ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception GC_RELOAD_TARJAS_BANCO [' + E.Message + ']' ) ;
   End ;
End ;
POP_TICK ( 'GC RELOAD_TARJAS_BANCO' ) ;
_Debug ( 'FIM GC RELOAD_TARJAS_BANCO' ) ;
PUT_LOG ( 'FIM GC RELOAD_TARJAS_BANCO [' + Origem + ']' ) ;
{$ENDIF}
End ;

Procedure GC_INICIALIZAR ( _SB_Banco_Tarjas_01 : TScrollBox ;
                           _SB_Banco_Tarjas_02 : TScrollBox ;
                           _SB_Banco_Tarjas_03 : TScrollBox ;
                           _SB_Banco_Tarjas_04 : TScrollBox ;
                           _SB_Banco_Tarjas_05 : TScrollBox ;
                           _SB_Banco_Tarjas_06 : TScrollBox ;
                           _SB_Banco_Tarjas_07 : TScrollBox ;
                           _SB_Banco_Tarjas_08 : TScrollBox ;
                           _SB_Banco_Tarjas_09 : TScrollBox ;
                           _SB_Banco_Tarjas_10 : TScrollBox ;
                           _TS_01 : TTabSheet ;
                           _TS_02 : TTabSheet ;
                           _TS_03 : TTabSheet ;
                           _TS_04 : TTabSheet ;
                           _TS_05 : TTabSheet ;
                           _TS_06 : TTabSheet ;
                           _TS_07 : TTabSheet ;
                           _TS_08 : TTabSheet ;
                           _TS_09 : TTabSheet ;
                           _TS_10 : TTabSheet ) ;
Begin
_Debug ( 'INI GC_INICIALIZAR' ) ;
GC_VAR_SB_BANCO[1].SB := _SB_Banco_Tarjas_01 ;
GC_VAR_SB_BANCO[2].SB := _SB_Banco_Tarjas_02 ;
GC_VAR_SB_BANCO[3].SB := _SB_Banco_Tarjas_03 ;
GC_VAR_SB_BANCO[4].SB := _SB_Banco_Tarjas_04 ;
GC_VAR_SB_BANCO[5].SB := _SB_Banco_Tarjas_05 ;
GC_VAR_SB_BANCO[6].SB := _SB_Banco_Tarjas_06 ;
GC_VAR_SB_BANCO[7].SB := _SB_Banco_Tarjas_07 ;
GC_VAR_SB_BANCO[8].SB := _SB_Banco_Tarjas_08 ;
GC_VAR_SB_BANCO[9].SB := _SB_Banco_Tarjas_09 ;
GC_VAR_SB_BANCO[10].SB := _SB_Banco_Tarjas_10 ;
GC_VAR_SB_BANCO[1].TS := _TS_01 ;
GC_VAR_SB_BANCO[2].TS := _TS_02 ;
GC_VAR_SB_BANCO[3].TS := _TS_03 ;
GC_VAR_SB_BANCO[4].TS := _TS_04 ;
GC_VAR_SB_BANCO[5].TS := _TS_05 ;
GC_VAR_SB_BANCO[6].TS := _TS_06 ;
GC_VAR_SB_BANCO[7].TS := _TS_07 ;
GC_VAR_SB_BANCO[8].TS := _TS_08 ;
GC_VAR_SB_BANCO[9].TS := _TS_09 ;
GC_VAR_SB_BANCO[10].TS := _TS_10 ;
GC_VAR_PREVIEW_GC.Parametros := TStringList.Create ;
_Debug ( 'FIM GC_INICIALIZAR' ) ;
End ;

Procedure GC_LIMPAR_PREVIEW ;
Begin
_Debug ( 'INI GC LIMPAR_PREVIEW' ) ;
GC_VAR_PREVIEW_GC.Parametros.Clear ;
GC_VAR_PREVIEW_GC.ED1 := '' ;
GC_VAR_PREVIEW_GC.ED2 := '' ;
GC_VAR_PREVIEW_GC.ED3 := '' ;
GC_VAR_PREVIEW_GC.ED4 := '' ;
GC_VAR_PREVIEW_GC.Cmd := '' ;
GC_VAR_PREVIEW_GC.Cod := 0 ;
_Debug ( 'FIM GC LIMPAR_PREVIEW' ) ;
End ;

Procedure GC_PRINT_PERFIL_GC ( Perfil : T_PERFIS_GC ) ;
Var Local : LongInt ;
Begin
For Local := 0 To RD_MAX_EDITS - 1 Do Begin
   PUT_LOG ( 'IDX [' + IntToStr(Local) + '] ' +
             'Left:' + IntToStr(Perfil.ED[Local].X) + ', ' +
             'Top:' + IntToStr(Perfil.ED[Local].Y) + ', ' +
             'Width:' + IntToStr(Perfil.ED[Local].W) + ', ' +
             'Ativo:' + IFSN(Perfil.ED[Local].Ativo) ) ;
End ;
End ;

Procedure GC_CARREGAR_GC_PELO_PERFIL ( Origem : String ; GC : T_RD_GC_OK ; Reg : T_GC ) ;
Var Local : LongInt ;
Begin
{
GC.GC_CLOCK.Visible := Perfil.Clock_Ativado ;
GC.GC_CLOCK.Color := Perfil.Clock_Cor ;
GC.GC_CLOCK.Left := Perfil.Clock_X ;
GC.GC_CLOCK.Top := (GC.GC_CLOCK.Parent As TPanel).Height + Perfil.Clock_Y ;
GC.GC_CLOCK.Width := Perfil.Clock_W ;
GC.GC_CLOCK.Height := Perfil.Clock_H ;
GC.GC_CLOCK.Font.Name := Perfil.Clock_Font_Name ;
GC.GC_CLOCK.Font.Size := Perfil.Clock_Font_Size ;
GC.GC_CLOCK.Font.Style := [] ;
If Perfil.Clock_Font_Bold Then Begin
   GC.GC_CLOCK.Font.Style := GC.GC_CLOCK.Font.Style + [fsBold] ;
End ;
If Perfil.Clock_Font_Italic Then Begin
   GC.GC_CLOCK.Font.Style := GC.GC_CLOCK.Font.Style + [fsItalic] ;
End ;
}
If Reg.Relogio Then Begin
   {$IFDEF NW}
   If ( Main.PC_Main.ActivePage = Main.TS_Main_Jornais ) AND
      ( Main.PC_Sequencia.ActivePage = Main.TS_Seq_Preview ) Then Begin
      GC.GC_CLOCK.Visible := TRUE ; // Perfil.Clock_Ativado ;
   End ;
   {$ENDIF}
   GC.GC_CLOCK.Left := Reg_Clock.X ;
   GC.GC_CLOCK.Top := GC.PN_Relogio.Height + Reg_Clock.Y DIV GC.Divisor ;
   GC.GC_CLOCK.Width := Reg_Clock.W ;
   GC.GC_CLOCK.Height := Reg_Clock.H ;
   GC.GC_CLOCK.Font.Name := Reg_Clock._Name ;
   GC.GC_CLOCK.Font.Size := Reg_Clock._Size ;
   GC.GC_CLOCK.Font.Color := clRed ; // Reg_Clock._Color ;
   GC.GC_CLOCK.Text := Copy ( TimeToStr ( Now ), 1, 5 ) ;
   GC.GC_CLOCK.Font.Style := [] ;
   If Reg_Clock.Bold Then Begin
      GC.GC_CLOCK.Font.Style := GC.GC_CLOCK.Font.Style + [fsBold] ;
   End ;
   If Reg_Clock.Italic Then Begin
      GC.GC_CLOCK.Font.Style := GC.GC_CLOCK.Font.Style + [fsItalic] ;
   End ;
   {$IFDEF NW}
   If ( Main.PC_Main.ActivePage = Main.TS_Main_Jornais ) AND
      ( Main.PC_Sequencia.ActivePage = Main.TS_Seq_Preview ) Then Begin
      GC.GC_CLOCK.BringToFront ;
   End ;
   {$ENDIF}
End Else Begin
   GC.GC_CLOCK.Visible := FALSE ;
End ;
{
PUT_LOG ( 'CLOCK Orig[' + Origem + '] XYWH[' +
          IntToStr(GC.GC_CLOCK.Left) + ',' +
          IntToStr(GC.GC_CLOCK.Top) + ',' +
          IntToStr(GC.GC_CLOCK.Width) + ',' +
          IntToStr(GC.GC_CLOCK.Height) + '] ' +
          'Font[' + GC.GC_CLOCK.Font.Name + ',' +
          IntToStr(GC.GC_CLOCK.Font.Size) + ',' +
          '0x' + IntToHex(GC.GC_CLOCK.Font.Color,8) + '] ' +
          '[' + GC.GC_CLOCK.Text + ']' ) ;
}
For Local := 0 To RD_MAX_EDITS - 1 Do Begin
   //Qtde_Edits := Perfil.Qtde_Edits ;
   {$IFDEF NW}
   If ( Main.PC_Main.ActivePage = Main.TS_Main_Jornais ) AND
      ( Main.PC_Sequencia.ActivePage = Main.TS_Seq_Preview ) Then Begin
      GC.ED_GC[Local].Visible := Reg.Ativo[Local+1] ; // ED[Local].Ativo ;
   End ;
   {$ENDIF}
   GC.ED_GC[Local].Left := Reg.LAUDA_X[Local+1] DIV GC.Divisor ; // Perfil.ED[Local].X ;
   GC.ED_GC[Local].Top := (GC.ED_GC[Local].Parent As TPanel).Height +
                          Reg.LAUDA_Y[Local+1] DIV GC.Divisor ; // Perfil.ED[Local].Y ;
   GC.ED_GC[Local].Width := Reg.LAUDA_WIDTH[Local+1] DIV GC.Divisor ; // Perfil.ED[Local].W ;
   GC.ED_GC[Local].Font.Name := Reg.LAUDA_FONT_NAME[Local+1] ; // Perfil.ED[Local].Fonte_Name ;
   //PUT_LOG ( 'SET GC FONT IDX ' + IntToStr(Local) + ' [' + GC.ED_GC[Local].Font.Name + ']' ) ;
   GC.ED_GC[Local].Font.Size := Reg.LAUDA_FONT_SIZE[Local+1] DIV GC.Divisor ; // Perfil.ED[Local].Fonte_Size ;
   GC.ED_GC[Local].Font.Style := [] ;
   If Reg.Caixa[Local+1] = 'U' Then Begin // Perfil.ED[Local].Caixa = 'U' Then Begin
      GC.ED_GC[Local].CharCase := ecUpperCase ;
   End Else If Reg.Caixa[Local+1] = 'L' Then Begin
      GC.ED_GC[Local].CharCase := ecLowerCase ;
   End Else Begin
      GC.ED_GC[Local].CharCase := ecNormal ;
   End ;
   //Reg.Alinhamento2[Local+1] := 'E' ;
   If ( Reg.Alinhamento2[Local+1] = 'E' ) OR
      ( Reg.Alinhamento2[Local+1] = 'L' ) Then Begin
      GC.ED_GC[Local].Alignment := taLeftJustify ;
   End Else If ( Reg.Alinhamento2[Local+1] = 'D' ) OR
               ( Reg.Alinhamento2[Local+1] = 'R' ) Then Begin
      GC.ED_GC[Local].Alignment := taRightJustify ;
   End Else If Reg.Alinhamento2[Local+1] = 'C' Then Begin
      GC.ED_GC[Local].Alignment := taCenter ;
   End ;
   If Reg.Borda = 1 Then Begin
      GC.ED_GC[Local].BorderStyle := bsSingle ;
   End Else Begin
      GC.ED_GC[Local].BorderStyle := bsNone ;
   End ;
   If Reg.LAUDA_FONT_BOLD[Local+1] Then Begin
      GC.ED_GC[Local].Font.Style := GC.ED_GC[Local].Font.Style + [fsBold] ;
   End ;
   Reg.LAUDA_FONT_ITALICO[Local+1] := FALSE ;
   If Reg.LAUDA_FONT_ITALICO[Local+1] Then Begin
      GC.ED_GC[Local].Font.Style := GC.ED_GC[Local].Font.Style + [fsItalic] ;
   End ;
   GC.ED_GC[Local].Font.Color := Reg.LAUDA_FONT_COLOR[Local+1] ;
   GC.ED_Cor_Excesso[Local] := Reg.LAUDA_FONT_COLOR_EXCESSO[Local+1] ;
   //
   GC.ED_GC[Local].Text := Reg.Texto[Local+1] ;
End ;
End ;

Procedure GC_REPAINT_T_GC ( GC : T_RD_GC_OK ) ;
Var Local : LongInt ;
    Save_Relogio : Boolean ;
    Save_GC      : Boolean ;
    Save_Logo    : Boolean ;
Begin
_Debug ( 'INI GC REPAINT_T_GC' ) ;
{
If Assigned ( GC.IM_GC ) Then Begin
   _Debug ( 'INI GC REPAINT_T_GC {Assigned]' ) ;
   GC.IM_GC.Invalidate ;
   //_Debug ( '1 GC REPAINT_T_GC' ) ;
   GC.IM_GC.Repaint ;
End Else Begin
   _Debug ( 'INI/Exit GC REPAINT_T_GC [NOT Assigned]' ) ;
   Exit ;
End ;
}
Save_Relogio := GC.PN_Relogio.Visible ;
Save_GC := GC.PN_Tarja.Visible ;
Save_Logo := GC.PN_Logo.Visible ;
If Save_Relogio Then Begin
   GC.PN_Relogio.Hide ;
End ;
If Save_GC Then Begin
   GC.PN_Tarja.Hide ;
End ;
If Save_Logo Then Begin
   GC.PN_Logo.Hide ;
End ;
//
If Save_GC Then Begin
   GC.PN_Tarja.Show ;
End ;
If Save_Relogio Then Begin
   GC.PN_Relogio.Show ;
End ;
If Save_Logo Then Begin
   GC.PN_Logo.Show ;
End ;
GC.IM_GC.Invalidate ;
GC.IM_GC.Repaint ;
GC.IM_RELOGIO.Invalidate ;
GC.IM_RELOGIO.Repaint ;
//GC.IM_Logo.Invalidate ;
//GC.IM_Logo.Repaint ;
For Local := 0 To RD_MAX_EDITS - 1 Do Begin
   _Debug ( '2 GC REPAINT_T_GC [' + IntToStr(Local) + ']' ) ;
   If GC.ED_GC[Local].Visible Then Begin
      _Debug ( '3 GC REPAINT_T_GC' ) ;
      GC.ED_GC[Local].Hide ;
      GC.ED_GC[Local].Show ;
      //_Debug ( '4 GC REPAINT_T_GC' ) ;
      GC.ED_GC[Local].Invalidate ;
      GC.ED_GC[Local].Repaint ;
      //_Debug ( '5 GC REPAINT_T_GC' ) ;
      If GC.ED_GC[Local].BorderStyle = bsSingle Then Begin
         //_Debug ( '6 GC REPAINT_T_GC' ) ;
         GC.ED_GC[Local].BorderStyle := bsNone ;
         GC.ED_GC[Local].BorderStyle := bsSingle ;
      End Else Begin
         //_Debug ( '7 GC REPAINT_T_GC' ) ;
         GC.ED_GC[Local].BorderStyle := bsSingle ;
         GC.ED_GC[Local].BorderStyle := bsNone ;
      End ;
   //_Debug ( '8 GC REPAINT_T_GC' ) ;
   End ;
   //_Debug ( '9 GC REPAINT_T_GC' ) ;
End ;
_Debug ( 'FIM GC REPAINT_T_GC' ) ;
End ;

Procedure GC_CARREGAR_EXEMPLOS ( Var Reg : T_GC ) ;
Var Local : LongInt ;
Begin
//
For Local := 0 To RD_MAX_EDITS - 1 Do Begin
   Reg.Texto[Local+1] := Reg.Exemplo[Local+1] ;
End ;
End ;

Function IS_GC_ASSIGNED ( GC : T_RD_GC_OK ) : Boolean ;
Begin
Result := Assigned ( GC.IM_GC ) ;
End ;

Function GET_INFO_CG ( Reg : T_GC ) : String ;
Var Local : LongInt ;
Begin
Result := 'Tag [' + Reg.Tag + ']' + sLineBreak +
          'Identificacao [' + Reg.Identificacao + ']' + sLineBreak +
          'Canal [' + IntToStr ( Reg.Canal ) + ']' + sLineBreak +
          'Imagem [' + IFSN ( Reg.Imagem ) + ']' + sLineBreak +
          'Fixa [' + IFSN ( Reg.Fixa ) + ']' + sLineBreak +
          'Relógio [' + IFSN ( Reg.Relogio ) + ']' + sLineBreak +
          'Loop [' + IFSN ( Reg.Loop ) + ']' + sLineBreak +
          'Logo [' + IFSN ( Reg.Logo ) + ']' + sLineBreak +
          'Lauda_CB [' + IFSN ( Reg.Lauda_CB ) + ']' + sLineBreak +
          'Msg [' + IntToStr ( Reg.Msg ) + ']' + sLineBreak +
          'FN [' + Reg.FN + ']' + sLineBreak +
          'FN_Exists [' + IFSN ( Reg.FN_Exists ) + ']' + sLineBreak +
          'Descrição [' + Reg.Descricao + ']' + sLineBreak +
          'Título [' + Reg.Titulo + ']' + sLineBreak +
          'Ícone [' + Reg.Icone + ']' + sLineBreak ;
For Local := 1 To MAX_CAMPOS_POR_TAG Do Begin
   If Trim ( Reg.Texto[Local] ) <> '' Then Begin
      Result := Result + 'Texto(' + IntToStr(Local) + ') [' + Reg.Texto[Local] + ']' + sLineBreak ;
   End ;
End ;
For Local := 1 To MAX_CAMPOS_POR_TAG Do Begin
   If Trim ( Reg.Campo[Local] ) <> '' Then Begin
      Result := Result + 'Campo(' + IntToStr(Local) + ') [' + Reg.Campo[Local] + ']' + sLineBreak ;
   End ;
End ;
For Local := 1 To MAX_CAMPOS_POR_TAG Do Begin
   If Trim ( Reg.Valor[Local] ) <> '' Then Begin
      Result := Result + 'Valor(' + IntToStr(Local) + ') [' + Reg.Valor[Local] + ']' + sLineBreak ;
   End ;
End ;
For Local := 1 To MAX_CAMPOS_POR_TAG Do Begin
   If Trim ( Reg.Caixa[Local] ) <> '' Then Begin
      Result := Result + 'Caixa(' + IntToStr(Local) + ') [' + Reg.Caixa[Local] + ']' + sLineBreak ;
   End ;
End ;
For Local := 1 To MAX_CAMPOS_POR_TAG Do Begin
   If Trim ( Reg.Exemplo[Local] ) <> '' Then Begin
      Result := Result + 'Exemplo(' + IntToStr(Local) + ') [' + Reg.Exemplo[Local] + ']' + sLineBreak ;
   End ;
End ;
For Local := 1 To MAX_CAMPOS_POR_TAG Do Begin
   If Reg.LAUDA_ED[Local] Then Begin
      Result := Result + 'Lauda_ED(' + IntToStr(Local) + ') ' +
                'XYW[' + IntToStr(Reg.LAUDA_X[Local]) + ',' +
                         IntToStr(Reg.LAUDA_Y[Local]) + ',' +
                         IntToStr(Reg.LAUDA_WIDTH[Local]) + '] ' +
                'FONTE[' + Reg.LAUDA_FONT_NAME[Local] + ',' +
                      IntToStr(Reg.LAUDA_FONT_SIZE[Local]) + ',' +
                      IIF(Reg.LAUDA_FONT_BOLD[Local],'BOLD','~BOLD') + '] ' +
                'CORES[0x' + IntToHex(Reg.LAUDA_FONT_COLOR[Local],8) + ',0x' +
                              IntToHex(Reg.LAUDA_FONT_COLOR_EXCESSO[Local],8) + ']' + sLineBreak ;
   End ;
End ;
{
Tag : String ;
Identificacao : String ;
Canal : LongInt ;
Imagem : Boolean ;
Fixa : Boolean ;
Relogio : Boolean ;
Temperatura : Boolean ;
Loop : Boolean ;
Logo : Boolean ;
Msg : LongInt ;
Descricao : String ;
Titulo : String ;
Icone : String ;
Texto : Array [1..MAX_CAMPOS_POR_TAG] Of String ;
Campo : Array [1..MAX_CAMPOS_POR_TAG] Of String ;
Valor : Array [1..MAX_CAMPOS_POR_TAG] Of String ;
Caixa : Array [1..MAX_CAMPOS_POR_TAG] Of String ;
LAUDA_CB : Boolean ;
LAUDA_ED : Array [1..MAX_CAMPOS_POR_TAG] Of Boolean ;
LAUDA_X : Array [1..MAX_CAMPOS_POR_TAG] Of LongInt ;
LAUDA_Y : Array [1..MAX_CAMPOS_POR_TAG] Of LongInt ;
LAUDA_FONT_NAME : Array [1..MAX_CAMPOS_POR_TAG] Of String ;
LAUDA_FONT_SIZE : Array [1..MAX_CAMPOS_POR_TAG] Of LongInt ;
LAUDA_FONT_BOLD : Array [1..MAX_CAMPOS_POR_TAG] Of Boolean ;
LAUDA_FONT_COLOR : Array [1..MAX_CAMPOS_POR_TAG] Of TColor ;
LAUDA_FONT_COLOR_EXCESSO : Array [1..MAX_CAMPOS_POR_TAG] Of TColor ;
LAUDA_WIDTH : Array [1..MAX_CAMPOS_POR_TAG] Of LongInt ;
}
End ;

Procedure GC_AJUSTAR_MAIUSCULA_MINUSCULA ( MM : Boolean ;
                                           Var L1 : String ;
                                           Var L2 : String ;
                                           Var L3 : String ;
                                           Var HistDic : String ) ;
Var Reg : T_GC ;
Begin
//PUT_LOG ( 'INI L1 [' + L1 + ']' ) ;
//PUT_LOG ( 'INI L2 [' + L2 + ']' ) ;
//PUT_LOG ( 'INI L3 [' + L3 + ']' ) ;
If Trim ( L1 ) = '' Then Begin
   Exit ;
End ;
If L1[1] <> '#' Then Begin
   Exit ;
End ;
If Trim ( L2 ) = '' Then Begin
   Exit ;
End ;
If Trim ( L3 ) = '' Then Begin
   Exit ;
End ;
//Ignorar := FALSE ;
//RD.RD_CARREGAR_DICIONARIO ;
//Flag_Next_Upper := FALSE ;
//Aux := Trim ( L1 ) ;
Reg := TIPOS_GC_GET_REG_GC ( L1 ) ;
If Reg.Msg <= 0 Then Begin
   Exit ;
End ;
//
If Reg.Caixa[1] = 'MAI' Then Begin
   If MM Then Begin
      L2 := Super_UpperCase ( L2 ) ;
   End ;
   //L2 := PELO_DICIONARIO ( L2 ) ;
End Else If Reg.Caixa[1] = 'MIN' Then Begin
   If MM Then Begin
      L2 := Super_LowerCase ( L2 ) ;
   End ;
   //L2 := PELO_DICIONARIO ( L2 ) ;
End Else If Reg.Caixa[1] = '1MAI' Then Begin
   If MM Then Begin
      L2 := Super_LowerCase ( L2 ) ;
      If L2 <> '' Then Begin
         L2[1] := Upcase ( L2[1] ) ;
      End ;
   End ;
   //L2 := PELO_DICIONARIO ( L2 ) ;
End ;
//
If Reg.Caixa[2] = 'MAI' Then Begin
   If MM Then Begin
      L3 := Super_UpperCase ( L3 ) ;
   End ;
   L3 := PELO_DICIONARIO ( L3, HistDic ) ;
End Else If Reg.Caixa[2] = 'MIN' Then Begin
   If MM Then Begin
      L3 := Super_LowerCase ( L3 ) ;
   End ;
   L3 := PELO_DICIONARIO ( L3, HistDic ) ;
End Else If Reg.Caixa[2] = '1MAI' Then Begin
   If MM Then Begin
      L3 := Super_LowerCase ( L3 ) ;
      If L3 <> '' Then Begin
         L3[1] := Upcase ( L3[1] ) ;
      End ;
   End ;
   L3 := PELO_DICIONARIO ( L3, HistDic ) ;
End ;
//
//PUT_LOG ( 'FIM L1 [' + L1 + ']' ) ;
//PUT_LOG ( 'FIM L2 [' + L2 + ']' ) ;
//PUT_LOG ( 'FIM L3 [' + L3 + ']' ) ;
End ;

End.

