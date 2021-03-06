Unit Tipos_GC_U ;

Interface

Uses Misc_Def_U, Misc_Const_U, Misc_Type_U,
     //Misc_1,
     Lauda_Info_U,
     Transparentes_U,
     {$IFDEF NW}
     CCH_U,
     {$ENDIF}
     Carregando_Form_U,
     //RxCtrls,
     MyRichEdit_U,
     Math, IniFiles, ClipBrd,
     Misc_U, Log_U, View_ME_U,
     Winapi.Windows, pngImage,
     System.SysUtils, System.Variants, System.Classes, System.UITypes,
     Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Samples.Spin, Vcl.Forms, Vcl.Menus,
     Vcl.Controls, Vcl.Grids, Vcl.Dialogs, Vcl.Graphics, Vcl.ExtCtrls, Vcl.Mask ;

Procedure TIPOS_GC_CARREGAR_TIPOS_GC_OUT_GC ;
Function  TIPOS_GC_SIZE : LongInt ;
Function  TIPOS_GC_SELECIONAR_REGISTRO_DE_MENSAGEM_DIRETA ( Msg : LongInt ) : T_GC ;
Function  TIPOS_GC_GET_MSG_POR_TAG ( Tag : String ) : LongInt ;
Function  TIPOS_GC_GET_FB_POR_TAG ( Tag : String ) : LongInt ;
Function  TIPOS_GC_GET_FB_POR_MSG ( Msg : LongInt ) : LongInt ;
Function  TIPOS_GC_GET_RELOGIO_POR_TAG ( Tag : String ) : Boolean ;
Function  TIPOS_GC_GET_RELOGIO_POR_MSG ( Msg : LongInt ) : Boolean ;
Procedure TIPOS_GC_GET_CAMPOS_POR_MSG ( Var Reg : T_Automacao_Chyron ) ;
Function  TIPOS_GC_GET_IS_IMAGEM_POR_MSG ( Msg : LongInt ) : Boolean ;
Function  TIPOS_GC_GET_EXIBIR_RELOGIO_POR_MSG ( _Msg : LongInt ) : Boolean ;
Function  TIPOS_GC_GET_DESCRICAO_POR_MSG ( Msg : LongInt ) : String ;
Function  TIPOS_GC_GET_IDENTIFICACAO_POR_MSG ( Msg : LongInt ) : String ;
Function  TIPOS_GC_GET_REG_GC ( Cmd : String ) : T_GC ;
Function  TIPOS_GC_LIMPAR_CMD_GC ( Cmd : String ) : String ;
Function  TIPOS_GC_GET_TIPO_CAIXA ( Tag : String ; Idx : LongInt ) : String ;

Var Out_GC_Tipo_GC : Array Of T_GC ;

Implementation

Uses View_Perfis_GC_U,
     Misc_1,
     Main,
     Chyron_Basico_U ;

Function TIPOS_GC_SIZE : LongInt ;
Begin
Result := Length ( Out_GC_Tipo_GC ) ;
End ;

Function TIPOS_GC_SELECIONAR_REGISTRO_DE_MENSAGEM_DIRETA ( Msg : LongInt ) : T_GC ;
Var Local : LongInt ;
    Qtde  : LongInt  ;
Begin
Qtde := TIPOS_GC_SIZE ;
If Qtde = 0 Then
   Exit ;
For Local := 0 To Qtde - 1 Do
   Begin
   If Out_GC_Tipo_GC[Local].Msg = Msg Then
      Begin
      Result := Out_GC_Tipo_GC[Local] ;
      Exit ;
      End ;
   End ;
Result.Msg := 0 ;
End ;

Function TIPOS_GC_GET_MSG_POR_TAG ( Tag : String ) : LongInt ;
Var Qtde  : LongInt ;
    Local : LongInt ;
Begin
Result := 0 ;
Qtde := TIPOS_GC_SIZE ;
If Qtde <= 0 Then Begin
   Exit ;
End  ;
For Local := 0 To Qtde - 1 Do Begin
   If Out_GC_Tipo_GC[Local].Tag = Tag Then Begin
      Result := Out_GC_Tipo_GC[Local].Msg ;
      Exit ;
   End ;
End ;
End ;

Function TIPOS_GC_GET_FB_POR_TAG ( Tag : String ) : LongInt ;
Var Qtde  : LongInt ;
    Local : LongInt ;
Begin
Result := 0 ;
Qtde := Length ( Out_GC_Tipo_GC ) ;
If Qtde <= 0 Then Begin
   Exit ;
End  ;
For Local := 0 To Qtde - 1 Do Begin
   If Out_GC_Tipo_GC[Local].Tag = Tag Then Begin
      Result := Out_GC_Tipo_GC[Local].Canal ;
      Exit ;
   End ;
End ;
End ;

Function TIPOS_GC_GET_RELOGIO_POR_TAG ( Tag : String ) : Boolean ;
Var Qtde  : LongInt ;
    Local : LongInt ;
Begin
Result := FALSE ;
Qtde := Length ( Out_GC_Tipo_GC ) ;
If Qtde <= 0 Then Begin
   Exit ;
End  ;
For Local := 0 To Qtde - 1 Do Begin
   If Out_GC_Tipo_GC[Local].Tag = Tag Then Begin
      Result := Out_GC_Tipo_GC[Local].Relogio ;
      Exit ;
   End ;
End ;
End ;

Function TIPOS_GC_GET_FB_POR_MSG ( Msg : LongInt ) : LongInt ;
Var Qtde  : LongInt ;
    Local : LongInt ;
Begin
{
Case Msg Of
DEF_MSG_CHYRON_MOV2 ,
DEF_MSG_CHYRON_SELO2 : Begin
                       Result := 2 ;
                       End ;
DEF_MSG_CHYRON_MOV3 ,
DEF_MSG_CHYRON_SELO3 : Begin
                       Result := 3 ;
                       End ;
Else
   Result := 1 ;
End ;
}
Result := 0 ;
If Msg = 0 Then Begin
   Exit ;
End ;
Qtde := Length ( Out_GC_Tipo_GC ) ;
If Qtde <= 0 Then Begin
   Exit ;
End ;
For Local := 0 To Qtde - 1 Do Begin
   If Out_GC_Tipo_GC[Local].Msg = Msg Then Begin
      Result := Out_GC_Tipo_GC[Local].Canal ;
      Exit ;
   End ;
End ;
End ;

Function TIPOS_GC_GET_RELOGIO_POR_MSG ( Msg : LongInt ) : Boolean ;
Var Qtde  : LongInt ;
    Local : LongInt ;
Begin
Result := FALSE ;
If Msg = 0 Then Begin
   Exit ;
End ;
Qtde := Length ( Out_GC_Tipo_GC ) ;
If Qtde <= 0 Then Begin
   Exit ;
End ;
For Local := 0 To Qtde - 1 Do Begin
   If Out_GC_Tipo_GC[Local].Msg = Msg Then Begin
      Result := Out_GC_Tipo_GC[Local].Relogio ;
      Exit ;
   End ;
End ;
End ;

Procedure TIPOS_GC_GET_CAMPOS_POR_MSG ( Var Reg : T_Automacao_Chyron ) ;
Var Qtde   : LongInt ;
    Local  : LongInt ;
    Local2 : LongInt ;
Begin
PUT_LOG ( 'GET_CAMPOS_POR_MSG Msg[' + IntToStr(Reg.Mens) + ']' ) ;
If Reg.Mens = 0 Then Begin
   PUT_LOG ( 'Exit 0 GET_CAMPOS_POR_MSG Msg[' + IntToStr(Reg.Mens) + ']' ) ;
   Exit ;
End ;
Qtde := Length ( Out_GC_Tipo_GC ) ;
If Qtde <= 0 Then Begin
   PUT_LOG ( 'Exit Qtde 0 GET_CAMPOS_POR_MSG Msg[' + IntToStr(Reg.Mens) + ']' ) ;
   Exit ;
End ;
For Local := 0 To Qtde - 1 Do Begin
   If Out_GC_Tipo_GC[Local].Msg = Reg.Mens Then Begin
      For Local2 := 1 To MAX_CAMPOS_POR_TAG Do Begin
         Reg.Campos_Txt[Local2] := Out_GC_Tipo_GC[Local].Campo[Local2] ;
      End ;
      For Local2 := 1 To 5 Do Begin
         If Reg.Campos_Txt[Local2] <> '' Then Begin
            PUT_LOG ( 'GET_CAMPOS_POR_MSG OK Msg[' + IntToStr(Reg.Mens) + '] ' +
                      IntToStr(Local2) + ':[' + Reg.Campos_Txt[Local2] + ']' ) ;
         End ;
      End ;
      Exit ;
   End ;
End ;
PUT_LOG ( 'Result VAZIO GET_CAMPOS_POR_MSG Msg[' + IntToStr(Reg.Mens) + ']' ) ;
End ;

Function TIPOS_GC_GET_IS_IMAGEM_POR_MSG ( Msg : LongInt ) : Boolean ;
Var Qtde  : LongInt ;
    Local : LongInt ;
Begin
Result := FALSE ;
Qtde := Length ( Out_GC_Tipo_GC ) ;
If Qtde <= 0 Then Begin
   Exit ;
End  ;
For Local := 0 To Qtde - 1 Do Begin
   If Out_GC_Tipo_GC[Local].Msg = Msg Then Begin
      Result := Out_GC_Tipo_GC[Local].Imagem ;
      Exit ;
   End ;
End ;
End ;

Function TIPOS_GC_GET_EXIBIR_RELOGIO_POR_MSG ( _Msg : LongInt ) : Boolean ;
Var Qtde  : LongInt ;
    Local : LongInt ;
Begin
PUT_LOG ( 'GET_EXIBIR_RELOGIO_POR_MSG Msg[' + IntToStr(_Msg) + ']' ) ;
//If ( _Msg = 5 ) OR ( _Msg = 6 ) OR ( _Msg = 7 ) Then Begin
//   Result := TRUE ;
//   Exit ;
//End ;
Result := FALSE ;
Qtde := Length ( Out_GC_Tipo_GC ) ;
If Qtde <= 0 Then Begin
   Exit ;
End  ;
For Local := 0 To Qtde - 1 Do Begin
   If Out_GC_Tipo_GC[Local].Msg = _Msg Then Begin
      Result := Out_GC_Tipo_GC[Local].Relogio ;
      Exit ;
   End ;
End ;
End ;

Function TIPOS_GC_GET_DESCRICAO_POR_MSG ( Msg : LongInt ) : String ;
Var Qtde  : LongInt ;
    Local : LongInt ;
Begin
Result := '' ;
Qtde := Length ( Out_GC_Tipo_GC ) ;
If Qtde <= 0 Then Begin
   Exit ;
End  ;
For Local := 0 To Qtde - 1 Do Begin
   If Out_GC_Tipo_GC[Local].Msg = Msg Then Begin
      Result := Out_GC_Tipo_GC[Local].Descricao ;
      Exit ;
   End ;
End ;
End ;

Function TIPOS_GC_GET_IDENTIFICACAO_POR_MSG ( Msg : LongInt ) : String ;
Var Qtde  : LongInt ;
    Local : LongInt ;
Begin
Result := '' ;
Qtde := Length ( Out_GC_Tipo_GC ) ;
If Qtde <= 0 Then Begin
   Exit ;
End  ;
For Local := 0 To Qtde - 1 Do Begin
   If Out_GC_Tipo_GC[Local].Msg = Msg Then Begin
      Result := Out_GC_Tipo_GC[Local].Identificacao ;
      Exit ;
   End ;
End ;
End ;

Function TIPOS_GC_GET_REG_GC ( Cmd : String ) : T_GC ;
{$IFDEF USAR_CHYRON}
Var Qtde  : LongInt ;
    Local : LongInt ;
{$ENDIF}
Begin
{$IFDEF USAR_CHYRON}
Result.Tag := '' ;
Result.Msg := 0 ;
Cmd := TIPOS_GC_LIMPAR_CMD_GC ( Cmd ) ;
Qtde := TIPOS_GC_SIZE ;
If Qtde = 0 Then Begin
   Exit ;
End ;
For Local := 0 To Qtde - 1 Do Begin
   If UpperCase ( Out_GC_Tipo_GC[Local].Tag ) <> Cmd Then Begin
      Continue ;
   End ;
   Result := Out_GC_Tipo_GC[Local] ;
   Result.FN := RD.RD_GC_GET_FN_IMAGEM_TARJA_GC ( Result.Msg ) ;
   Result.FN_Relogio := RD.RD_GC_GET_FN_IMAGEM_RELOGIO_GC ( Result.Msg ) ;
   Result.FN_Exists := RR_FileExists ( 'TIPOS GC_GET_REG_GC', Result.FN ) ;
   Exit ;
End ;
{$ENDIF}
End ;

Function TIPOS_GC_LIMPAR_CMD_GC ( Cmd : String ) : String ;
Begin
Cmd := StringReplace ( Cmd, '#', '', [rfReplaceAll] ) ;
Cmd := StringReplace ( Cmd, '=', '', [rfReplaceAll] ) ;
Cmd := StringReplace ( Cmd, ':', '', [rfReplaceAll] ) ;
Cmd := StringReplace ( Cmd, '/', '', [rfReplaceAll] ) ;
Cmd := StringReplace ( Cmd, '\', '', [rfReplaceAll] ) ;
While Pos ( '{', Cmd ) > 0 Do Begin
   Delete ( Cmd, Length ( Cmd ) , 1 ) ;
End ;
Cmd := UpperCase ( Trim ( Cmd ) ) ;
Result := Cmd ;
End ;

Function TIPOS_GC_GET_TIPO_CAIXA ( Tag : String ; Idx : LongInt ) : String ;
Var Local2    : LongInt ;
    Qtde_Regs : LongInt ;
Begin
Result := '' ;
Qtde_Regs := TIPOS_GC_SIZE ;
If Qtde_Regs = 0 Then
   Exit ;
For Local2 := 0 To Qtde_Regs - 1 Do
   Begin
   If Out_GC_Tipo_GC[Local2].Tag = Tag Then
      Begin
      Result := Trim ( Out_GC_Tipo_GC[Local2].Caixa[Idx] ) ;
      Break ;
      {
      Case Idx Of
         1 : Begin
             Result := Trim ( Out_GC_Tipo_GC[Local2].Caixa_1 ) ;
             Break ;
             End ;
         2 : Begin
             Result := Trim ( Out_GC_Tipo_GC[Local2].Caixa_2 ) ;
             Break ;
             End ;
         3 : Begin
             Result := Trim ( Out_GC_Tipo_GC[Local2].Caixa_3 ) ;
             Break ;
             End ;
         4 : Begin
             Result := Trim ( Out_GC_Tipo_GC[Local2].Caixa_4 ) ;
             Break ;
             End ;
         5 : Begin
             Result := Trim ( Out_GC_Tipo_GC[Local2].Caixa_5 ) ;
             Break ;
             End ;
         End ;
      }
      End ;
   End ;
End ;

Procedure TIPOS_GC_CARREGAR_TIPOS_GC_OUT_GC ;
{$IFDEF USAR_CHYRON}
Var FN        : String ;
//    FN_Log    : String ;
    Lista     : TStringList ;
    Lista2    : TStringList ;
    Local     : LongInt ;
    Ini       : TMemIniFile ;
    Qtde      : LongInt ;
    Reg       : T_GC ;
    Chave     : String ;
    _Size     : LongInt ;
    Local2    : LongInt ;
    Lista_Log : TStringList ;
{$ENDIF}
Begin
{$IFDEF USAR_CHYRON}
_Debug ( 'INI CARREGAR TIPOS_GC_OUT_GC' ) ;
FN := RD.RD_GET_FN_TIPOS_GC ;
CHECAR_DIRETORIO_FILENAME ( FN ) ;
If NOT RR_FileExists ( 'TIPOS GC_CARREGAR TIPOS_GC_OUT_GC', FN ) Then Begin
   ShowMessage ( 'Arquivo de tipos GC n?o encontrado' + sLineBreak + sLineBreak +
                 FN ) ;
   Exit ;
End ;
Lista := TStringList.Create ;
Lista2 := TStringList.Create ;
Lista2.Clear ;
Lista_Log := TStringList.Create ;
Lista_Log.Clear ;
(*
PUT_LOG ( 'CARREGAR TIPOS_GC_OUT_GC [' + FN + ']' ) ;
_Debug ( '1 CARREGAR TIPOS_GC_OUT_GC' ) ;
If NOT RR_FileExists ( FN ) Then Begin
   Lista.Add ( '[GC]' ) ;
   Lista.Add ( '[TARJA]' ) ;
   Lista.Add ( '[FX2]' ) ;
   Lista.Add ( '[FIXA]' ) ;
   Try
      Lista.SaveToFile ( FN ) ;
   Except
   End ;
End ;
Try
   PUT_LOG ( 'CARREGAR TIPOS_GC_OUT_GC [' + FN + ']' ) ;
   {$i-}
   Lista2.Text := RD.RD_KERNEL_GET_CONTEUDO ( 'TIPOS GC_CARREGAR TIPOS_GC_OUT_GC/1', FN ) ;
   {$i+}
   If IoResult <> 0 Then Begin
      PUT_LOG ( 'Exception I/O TIPOS GC_CARREGAR TIPOS_GC_OUT_GC ' +
                '[' + FN + ']' ) ;
      Lista2.Free ;
      Exit ;
   End ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception TIPOS GC_CARREGAR TIPOS_GC_OUT_GC ' +
                '[' + E.Message + ']' +
                '[' + FN + ']' ) ;
   End ;
End ;
Qtde := Lista2.Count ;
Lista.Clear ;
If Qtde > 0 Then Begin
   For Local := 0 To Qtde - 1 Do Begin
      Aux := Trim ( Lista2[Local] ) ;
      If Aux = '' Then Begin
         Continue ;
      End ;
      If Aux[1] = '[' Then Begin
         Aux := StringReplace ( Aux, '[', '', [rfReplaceAll] ) ;
         Aux := StringReplace ( Aux, ']', '', [rfReplaceAll] ) ;
         Lista.Add ( Aux ) ;
      End ;
   End ;
End ;
Lista.Text := Trim ( Lista.Text ) ;
SL_Comandos_Validos.Clear ;
SL_Comandos_Validos.AddStrings ( Lista ) ;
*)
(*
Try
   SL_Comandos_Validos.SaveToFile ( Diretorio + 'Config\SL_Comandos_Validos.DAT' ) ;
Except
End ;
*)
//WRITE_FILE_REAL_WIN ( Diretorio + 'log\Proc_Tags.txt', Lista.Text ) ;
//_Debug ( '2 CARREGAR TIPOS_GC_OUT_GC' ) ;
//ShowMessage ( Lista.Text ) ;
(*
If Lista.Count = 0 Then Begin
   Lista.Add ( '?' ) ;
End ;
*)
{
Out_GC_CB[0].Items.Clear ;
Out_GC_CB[0].Items.AddStrings ( Lista ) ;
Out_GC_CB[0].ItemIndex := 0 ;
For Local := 1 To MAX_OUT_GC Do Begin
   OUT_GC_CB[Local].Items.Clear ;
   OUT_GC_CB[Local].Items.AddStrings ( Lista ) ;
   OUT_GC_CB[Local].ItemIndex := 0 ;
End ;
}
Lista.Clear ;
Ini := TMemIniFile.Create ( FN ) ;
Ini.ReadSections ( Lista ) ;
SL_Comandos_Validos.Clear ;
SL_Comandos_Validos.AddStrings ( Lista ) ;
Qtde := Lista.Count ;
Lista_Log.Add ( 'FN [' +  FN + ']' ) ;
_Size := 0 ;
PUT_LOG ( 'CARREGAR_TIPOS GC_OUT_GC QTDE[' + IntToStr(Qtde) + ']' ) ;
View_Perfis_GC.LB_Tags.Items.Clear ;
_Debug ( '3 CARREGAR TIPOS GC_OUT_GC' ) ;
Ini.ReadSections ( View_Perfis_GC.LB_Tags.Items ) ;
_Debug ( '4 CARREGAR TIPOS_GC_OUT_GC' ) ;
Reg_Clock._Name := Ini.ReadString ( 'CLOCK', 'NAME', 'Futura Md BT' ) ;
_Debug ( '4a CARREGAR TIPOS_GC_OUT_GC' ) ;
Reg_Clock._Size := Ini.ReadInteger ( 'CLOCK', 'IZE', 28 ) ;
_Debug ( '4b CARREGAR TIPOS_GC_OUT_GC' ) ;
Reg_Clock._Color := GET_COLOR_STR ( Ini.ReadString ( 'CLOCK', 'COLOR', 'RGB(0,0,0)' ) ) ;
_Debug ( '4c CARREGAR TIPOS_GC_OUT_GC' ) ;
Reg_Clock.Bold := Ini.ReadBool ( 'CLOCK', 'BOLD', FALSE ) ;
_Debug ( '5 CARREGAR TIPOS_GC_OUT_GC' ) ;
Reg_Clock.Italic := Ini.ReadBool ( 'CLOCK', 'ITALIC', FALSE ) ;
Reg_Clock.X := Ini.ReadInteger ( 'CLOCK', 'X', 0 ) ;
Reg_Clock.Y := Ini.ReadInteger ( 'CLOCK', 'Y', -40 ) ;
Reg_Clock.W := Ini.ReadInteger ( 'CLOCK', 'X', 200 ) ;
_Debug ( '6 CARREGAR TIPOS_GC_OUT_GC' ) ;
For Local := 0 To Qtde - 1 Do Begin
   _Debug ( '7 CARREGAR TIPOS_GC_OUT_GC [' + IntToStr(Local) + ']' ) ;
   Chave := Trim ( Lista[Local] ) ;
   If Length ( Chave ) < 2 Then Begin
      PUT_LOG ( 'CARREGAR_TIPOS GC_OUT_GC <2[' + Chave + ']' ) ;
      Lista_Log.Add ( 'CARREGAR_TIPOS GC_OUT_GC <2[' + Chave + ']' ) ;
      Continue ;
   End ;
   Reg.Tag := Ini.ReadString ( Chave, 'TAG', '' ) ;
   If Reg.Tag = '' Then Begin
      PUT_LOG ( 'CARREGAR_TIPOS GC_OUT_GC TAG VAZIA' ) ;
      Lista_Log.Add ( 'CARREGAR_TIPOS GC_OUT_GC TAG VAZIA' ) ;
      Continue ;
   End ;
   If Reg.Tag = Chave Then Begin
      //PUT_LOG ( 'CARREGAR_TIPOS GC_OUT_GC LOAD CHAVE[' + Chave + '][' + Reg.Tag + ']' ) ;
      Reg.Relogio := Ini.ReadBool ( Chave, 'RELOGIO', FALSE ) ;
      Reg.Full := Ini.ReadBool ( Chave, 'FULL', FALSE ) ;
      Reg.Identificacao := Ini.ReadString ( Chave, 'IDENTIFICACAO', '' ) ;
      Reg.Canal := Ini.ReadInteger ( Chave, 'CANAL', 1 ) ;
      Reg.Imagem := Ini.ReadBool ( Chave, 'IMAGEM', FALSE ) ;
      Reg.Fixa := Ini.ReadBool ( Chave, 'FIXA', FALSE ) ;
      Reg.Temperatura := Ini.ReadBool ( Chave, 'TEMPERATURA', FALSE ) ;
      Reg.Loop := Ini.ReadBool ( Chave, 'LOOP', FALSE ) ;
      Reg.Logo := Ini.ReadBool ( Chave, 'LOGO', FALSE ) ;
      Reg.Msg := StrToIntDef ( Ini.ReadString ( Chave, 'MSG', '' ), 0 ) ;
      Reg.Descricao := Ini.ReadString ( Chave, 'DESCRICAO', '' ) ;
      Reg.Titulo := Ini.ReadString ( Chave, 'TITULO', '' ) ;
      Reg.Icone := Ini.ReadString ( Chave, 'ICONE', '' ) ;
      Reg.LAUDA_CB := Ini.ReadBool ( Chave, 'LAUDA_CB', FALSE ) ;
      Reg.Borda := Ini.ReadInteger ( Chave, 'BORDA', 0 ) ;
      For Local2 := 1 To MAX_CAMPOS_POR_TAG Do Begin
         Reg.Ativo[Local2] := Ini.ReadBool ( Chave, 'ATIVO_' + IntToStr(Local2), FALSE ) ;
         Reg.Texto[Local2] := Ini.ReadString ( Chave, 'TEXTO_' + IntToStr(Local2), '' ) ;
         Reg.Default[Local2] := Ini.ReadString ( Chave, 'DEFAULT_' + IntToStr(Local2), '' ) ;
         Reg.Campo[Local2] := Ini.ReadString ( Chave, 'CAMPO_' + IntToStr(Local2), '' ) ;
         Reg.Valor[Local2] := Ini.ReadString ( Chave, 'VALOR_' + IntToStr(Local2), '' ) ;
         Reg.Caixa[Local2] := UpperCase ( Ini.ReadString ( Chave, 'CAIXA_' + IntToStr(Local2), '' ) ) ;
         Reg.Alinhamento2[Local2] := UpperCase ( Ini.ReadString ( Chave, 'ALINHAMENTO_' + IntToStr(Local2), 'E' ) ) ;
         Reg.Exemplo[Local2] := Ini.ReadString ( Chave, 'EXEMPLO_' + IntToStr(Local2), '' ) ;
         Reg.LAUDA_ED[Local2] := Ini.ReadBool ( Chave, 'LAUDA_ED' + IntToStr(Local2), FALSE ) ;
         Reg.LAUDA_X[Local2] := Ini.ReadInteger ( Chave, 'LAUDA_X' + IntToStr(Local2), 0 ) ;
         Reg.LAUDA_Y[Local2] := Ini.ReadInteger ( Chave, 'LAUDA_Y' + IntToStr(Local2), 0 ) ;
         Reg.LAUDA_FONT_NAME[Local2] := Ini.ReadString ( Chave, 'LAUDA_FONT_NAME' + IntToStr(Local2), '' ) ;
         Reg.LAUDA_FONT_SIZE[Local2] := Ini.ReadInteger ( Chave, 'LAUDA_FONT_SIZE' + IntToStr(Local2), 42 ) ;
         Reg.LAUDA_FONT_BOLD[Local2] := Ini.ReadBool ( Chave, 'LAUDA_FONT_BOLD' + IntToStr(Local2), FALSE ) ;
         Reg.LAUDA_FONT_COLOR[Local2] := GET_COLOR_STR ( Ini.ReadString ( Chave, 'LAUDA_FONT_COLOR' + IntToStr(Local2), '0' ) ) ;
         Reg.LAUDA_FONT_COLOR_EXCESSO[Local2] := GET_COLOR_STR ( Ini.ReadString ( Chave, 'LAUDA_FONT_COLOR_EXCESSO' + IntToStr(Local2), '0' ) ) ;
         Reg.LAUDA_WIDTH[Local2] := Ini.ReadInteger ( Chave, 'LAUDA_WIDTH' + IntToStr(Local2), 1300 ) ;
      End ;
      Inc ( _Size ) ;
      SetLength ( Out_GC_Tipo_GC, _Size ) ;
      Out_GC_Tipo_GC[_Size-1] := Reg ;
      Lista_Log.Add ( 'Chave[' + Chave + ']' ) ;
      Lista_Log.Add ( 'Reg[' + IntToStr(_Size-1) + '],{IDENTIFICACAO},{' + Reg.Identificacao + '}' ) ;
      Lista_Log.Add ( 'Reg[' + IntToStr(_Size-1) + '],{CANAL},{' + IntToStr(Reg.Canal) + '}' ) ;
      Lista_Log.Add ( 'Reg[' + IntToStr(_Size-1) + '],{MSG},{' + IntToStr(Reg.Msg) + '}' ) ;
      Lista_Log.Add ( 'Reg[' + IntToStr(_Size-1) + '],{DESCRICAO},{' + Reg.Descricao + '}' ) ;
      Lista_Log.Add ( 'Reg[' + IntToStr(_Size-1) + '],{TITULO},{' + Reg.Titulo + '}' ) ;
      Lista_Log.Add ( 'Reg[' + IntToStr(_Size-1) + '],{ICONE},{' + Reg.Icone + '}' ) ;
      Lista_Log.Add ( 'Reg[' + IntToStr(_Size-1) + '],{IMAGEM},{' + IF01(Reg.Imagem) + '}' ) ;
      Lista_Log.Add ( 'Reg[' + IntToStr(_Size-1) + '],{FIXA},{' + IF01(Reg.Fixa) + '}' ) ;
      Lista_Log.Add ( 'Reg[' + IntToStr(_Size-1) + '],{RELOGIO},{' + IF01(Reg.Relogio) + '}' ) ;
      Lista_Log.Add ( 'Reg[' + IntToStr(_Size-1) + '],{TEMPERATURA},{' + IF01(Reg.Temperatura) + '}' ) ;
      Lista_Log.Add ( 'Reg[' + IntToStr(_Size-1) + '],{LOOP},{' + IF01(Reg.Loop) + '}' ) ;
      Lista_Log.Add ( 'Reg[' + IntToStr(_Size-1) + '],{LOGO},{' + IF01(Reg.Logo) + '}' ) ;
      For Local2 := 1 To MAX_CAMPOS_POR_TAG Do Begin
         Lista_Log.Add ( 'Reg[' + IntToStr(_Size-1) + '],' +
                         '{TEXTO_' + IntToStr(Local2) + '},' +
                         '{' + Reg.Texto[Local2] + '}' ) ;
         Lista_Log.Add ( 'Reg[' + IntToStr(_Size-1) + '],' +
                         '{CAMPO_' + IntToStr(Local2) + '},' +
                         '{' + Reg.Campo[Local2] + '}' ) ;
         Lista_Log.Add ( 'Reg[' + IntToStr(_Size-1) + '],' +
                         '{ALINHAMENTO_' + IntToStr(Local2) + '},' +
                         '{' + Reg.Alinhamento2[Local2] + '}' ) ;
         Lista_Log.Add ( 'Reg[' + IntToStr(_Size-1) + '],' +
                         '{VALOR_' + IntToStr(Local2) + '},' +
                         '{' + Reg.Valor[Local2] + '}' ) ;
         Lista_Log.Add ( 'Reg[' + IntToStr(_Size-1) + '],' +
                         '{CAIXA_' + IntToStr(Local2) + '},' +
                         '{' + Reg.Caixa[Local2] + '}' ) ;
         Lista_Log.Add ( 'Reg[' + IntToStr(_Size-1) + '],' +
                         '{LAUDA_ED' + IntToStr(Local2) + '},' +
                         '{' + IF01(Reg.LAUDA_ED[Local2]) + '}' ) ;
         Lista_Log.Add ( 'Reg[' + IntToStr(_Size-1) + '],' +
                         '{LAUDA_X' + IntToStr(Local2) + '},' +
                         '{' + IntToStr(Reg.LAUDA_X[Local2]) + '}' ) ;
         Lista_Log.Add ( 'Reg[' + IntToStr(_Size-1) + '],' +
                         '{LAUDA_Y' + IntToStr(Local2) + '},' +
                         '{' + IntToStr(Reg.LAUDA_Y[Local2]) + '}' ) ;
         Lista_Log.Add ( 'Reg[' + IntToStr(_Size-1) + '],' +
                         '{LAUDA_FONT_NAME' + IntToStr(Local2) + '},' +
                         '{' + Reg.LAUDA_FONT_NAME[Local2] + '}' ) ;
         Lista_Log.Add ( 'Reg[' + IntToStr(_Size-1) + '],' +
                         '{LAUDA_FONT_SIZE' + IntToStr(Local2) + '},' +
                         '{' + IntToStr(Reg.LAUDA_FONT_SIZE[Local2]) + '}' ) ;
         Lista_Log.Add ( 'Reg[' + IntToStr(_Size-1) + '],' +
                         '{LAUDA_FONT_BOLD' + IntToStr(Local2) + '},' +
                         '{' + IFSN(Reg.LAUDA_FONT_BOLD[Local2]) + '}' ) ;
         Lista_Log.Add ( 'Reg[' + IntToStr(_Size-1) + '],' +
                         '{LAUDA_FONT_COLOR' + IntToStr(Local2) + '},' +
                         '{' + IntToStr(Reg.LAUDA_FONT_COLOR[Local2]) + '}' ) ;
         Lista_Log.Add ( 'Reg[' + IntToStr(_Size-1) + '],' +
                         '{LAUDA_FONT_COLOR_EXCESSO' + IntToStr(Local2) + '},' +
                         '{' + IntToStr(Reg.LAUDA_FONT_COLOR_EXCESSO[Local2]) + '}' ) ;
      End ;
      Lista_Log.Add ( '' ) ;
      //PUT_LOG ( 'ADD GC[' + Reg.Tag + '] DESC[' + Reg.Descricao + ']' ) ;
   End ;
End ;
_Debug ( '8 CARREGAR TIPOS_GC_OUT_GC' ) ;
{
Try
   FN_Log := Diretorio + 'log/PROC_CARREGAR_TIPOS_GC_OUT_GC.txt' ;
   CHECAR_DIRETORIO_FILENAME ( FN_Log ) ;
   Lista_Log.SaveToFile ( FN_Log ) ;
Except
End ;
}
_Debug ( '9 CARREGAR TIPOS_GC_OUT_GC' ) ;
Ini.Free ;
Lista.Free ;
Lista2.Free ;
Lista_Log.Free ;
Chyron_Basico.LB_Messages.Items.Clear ;
_Debug ( '10 CARREGAR TIPOS_GC_OUT_GC' ) ;
If _Size > 0 Then Begin
   For Local := 0 To _Size - 1 Do Begin
      Chyron_Basico.LB_Messages.Items.Add ( StrZero (Out_GC_Tipo_GC[Local].Msg, 4 ) + ' ' +
                                            Out_GC_Tipo_GC[Local].Identificacao ) ;
   End ;
End  ;
PUT_LOG ( 'CARREGAR_TIPOS GC_OUT_GC LEN[' + IntToStr(Length(Out_GC_Tipo_GC)) + ']' ) ;
_Debug ( 'FIM CARREGAR TIPOS_GC_OUT_GC' ) ;
{$ENDIF}
End ;

End.
