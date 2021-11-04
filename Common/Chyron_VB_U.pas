Unit Chyron_VB_U ;

Interface

Uses Misc_Def_U, Misc_Const_U, Misc_Type_U,
     Log_U, Misc_U, IniFiles,
     Winapi.Windows, Winapi.Messages,
     System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
     Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Win.ScktComp, Vcl.StdCtrls,
     Vcl.ExtCtrls, Vcl.Samples.Spin, Vcl.ComCtrls;

Function GET_VB_OPEN_BROWSER ( Origem : String ; DSNName : String ) : String ;
Function GET_VB_EXEC_TRANSICAO ( Origem : String ; Cena, Transicao : String ;
                                 Jornal : String ) : String ;
Function GET_VB_TRANSICAO ( Origem : String ; FB : LongInt ; Msg : LongInt ;
                            Cena, Transicao : String ;  Jornal : String ) : String ;
Function GET_VB_ATIVAR_MSG_SENAO ( Origem : String ; FB : LongInt ;
                                   Msg : LongInt ; Jornal : String ;
                                   Transicao : String ) : String ;
Function GET_VB_READ_UPDATE_PLAY ( Origem : String ; FB, Msg : Integer ;
                                   Campo1, Valor1, Campo2, Valor2,
                                   Campo3, Valor3, Campo4, Valor4,
                                   Campo5, Valor5 : String ;
                                   Jornal : String ) : String ;
Function GET_VB_ALTERAR_MENSAGEM ( Origem : String ; FB, Msg : LongInt ;
                                   Campo, FN, Jornal : String ) : String ;
Function GET_VB_FECHAR_NAO_PERSISTENTES ( Origem : String ; FB : LongInt ; Efeito : Boolean ) : String ;
Function GET_VB_FECHAR_ATE_PERSISTENTES ( Origem : String ; FB : LongInt ; Efeito : Boolean ) : String ;
//Function GET_VB_READ_FULL ( Origem : String ;
//                            FB : LongInt ; Msg : LongInt ;
//                            Transicao, Jornal : String ;
//                            Play : Boolean ) : String ;
Function CALC_CONTEXTO_CHYRON ( Var Reg : T_Automacao_Chyron ;
                                Espelho : T_Espelho ) : String ;

Implementation

Function GET_VB_OPEN_BROWSER ( Origem : String ; DSNName : String ) : String ;
Var Lista : TStringList ;
Begin
Lista := TStringList.Create ;
Lista.Add ( '''GET_VB_OPEN_BROWSER/ORIG[' + Origem + ']' ) ;
Lista.Add ( 'Lyric.OpenBrowser("' + DSNName + '")' ) ;
Result := Lista.Text ;
Lista.Free ;
End ;

Function GET_VB_EXEC_TRANSICAO ( Origem : String ; Cena, Transicao : String ;
                                 Jornal : String ) : String ;
Var Lista : TStringList ;
Begin
Lista := TStringList.Create ;
Lista.Add ( '''GET_VB_EXEC_TRANSICAO/ORIG[' + Origem + ']' ) ;
Lista.Add ( 'Lyric.ActivateFrame "Canvas"' ) ;
Lista.Add ( 'Lyric.FrameBuffer(1).SceneByName("' + Cena + '").Transition("' + Transicao + '").Activate' ) ;
//Lista.AddStrings ( GET_VB_CONFIGURAR_COR_JORNAL ( 'GET_VB_EXEC_TRANSICAO[' +Origem + ']', Jornal ) ) ;
Result := Lista.Text ;
Lista.Free ;
End ;

Function GET_VB_TRANSICAO ( Origem : String ; FB : LongInt ; Msg : LongInt ;
                            Cena, Transicao : String ; Jornal : String ) : String ;
Var Lista : TStringList ;
Begin
Lista := TStringList.Create ;
Lista.Add ( '''GET_VB_TRANSICAO/ORIG[' + Origem + ']' ) ;
Lista.Add ( 'cena_str = "' + cena + '"' ) ;
Lista.Add ( 'transicao_str = "' + transicao + '"' ) ;
Lista.Add ( 'cena_msg = "' + IntToStr(Msg) + '"' ) ;
Lista.Add ( 'frame_int = ' + IntToStr(FB) ) ;
Lista.Add ( 'Lyric.ActiveFrameBuffer(frame_int)' ) ;
Lista.Add ( 'cena_existe = false' ) ;
Lista.Add ( 'set fb = FrameBuffer(frame_int)' ) ;
Lista.Add ( 'for each cena in fb.Scenes(2)' ) ;
Lista.Add ( '   If cena.Name=cena_str Then' ) ;
Lista.Add ( '      cena_existe = true' ) ;
Lista.Add ( '   End If' ) ;
Lista.Add ( 'next' ) ;
Lista.Add ( 'If NOT cena_existe Then' ) ;
Lista.Add ( '   Lyric.ActivateFrame "Canvas"' ) ;
Lista.Add ( '   Lyric.Message cena_msg' ) ;
Lista.Add ( '   Lyric.Read' ) ;
Lista.Add ( '   ActiveCanvas.Scene.Play PlayOutput, WaitForCompletion' ) ;
Lista.Add ( 'End If' ) ;
Lista.Add ( 'Lyric.Wait(' + IntToStr(Config_Chyron.Wait_Frames_Effect_Out) + ')' ) ;
Lista.Add ( 'Lyric.FrameBuffer(frame_int).SceneByName(cena_str).Transition(transicao_str).Activate' ) ;
//Lista.AddStrings ( GET_VB_CONFIGURAR_COR_JORNAL ( 'GET_VB_TRANSICAO[' +Origem + ']', Jornal ) ) ;
Result := Lista.Text ;
Lista.Free ;
End ;

Function GET_FN_SCRIPT ( Script : String ) : String ;
Begin
Result := Diretorio + 'config\scripts\' + Script + '.txt' ;
End ;

(*
Function LOAD_SCRIPT_PC ( Script : String ;
                          FB, Msg : LongInt ;
                          Transicao, Jornal : String ) : String ;
Begin
Script := GET_FN_SCRIPT ( Script ) ;
If NOT RR_FileExists ( Script ) Then Begin
   Result := '' ;
   PUT_LOG ( 'ERRO SCRIPT NOT FOUND [' + Script + ']' ) ;
   Exit ;
End ;
Result := GET_CONTEUDO_M ( 'LOAD SCRIPT_PC', Script ) + #13#10 ;
Result := System.SysUtils.StringReplace ( Result, '[MSG]', IntToStr(Msg), [rfIgnoreCase, rfReplaceAll] ) ;
Result := System.SysUtils.StringReplace ( Result, '[FB]', IntToStr(FB), [rfIgnoreCase, rfReplaceAll] ) ;
Result := System.SysUtils.StringReplace ( Result, '[JORNAL]', Jornal, [rfIgnoreCase, rfReplaceAll] ) ;
Result := System.SysUtils.StringReplace ( Result, '[TRANSICAO]', Transicao, [rfIgnoreCase, rfReplaceAll] ) ;
End ;
*)

(*
Function GET_VB_READ_FULL ( Origem : String ;
                            FB : LongInt ; Msg : LongInt ;
                            Transicao, Jornal : String ;
                            Play : Boolean ) : String ;
Var Lista  : TStringList ;
Begin
Lista := TStringList.Create ;
Lista.Clear ;
Lista.Text := Lista.Text + LOAD_SCRIPT_PC ( 'PC_READ_FULL', FB, Msg, Transicao, Jornal ) ;
If Play Then
   Begin
   If Transicao <> '' Then
      Begin
//      Lista.Add ( 'ActiveCanvas.Scene.Play PlayOutput, WaitForCompletion' ) ;
      Lista.Add ( 'ActiveCanvas.Scene.Play PlayOutput, PlayImmediate' ) ;
//      Lista.Add ( 'Lyric.Wait(' + IntToStr(Config_Chyron.Wait_Frames_Effect_Out) + ')' ) ;
      Lista.Add ( 'Lyric.FrameBuffer(frame_int).SceneByName("' + 'C' + IntToStr(Msg) + '").Transition(transicao).Activate' ) ;
      End
      Else
      Begin
      Lista.Add ( 'ActiveCanvas.Scene.Play PlayOutput, PlayImmediate' ) ;
//      Lista.Add ( 'Lyric.Wait(' + IntToStr(Config_Chyron.Wait_Frames_Effect_Out) + ')' ) ;
      End ;
   End ;
//Lista.Add ( 'End If' ) ;
Lista.Add ( '' ) ;
Result := Lista.Text ;
Lista.Free ;
End ;
*)

Function GET_VB_ATIVAR_MSG_SENAO ( Origem : String ; FB : LongInt ;
                                   Msg : LongInt ; Jornal : String ;
                                   Transicao : String ) : String ;
Var Lista  : TStringList ;
Begin
Lista := TStringList.Create ;
Lista.Clear ;
Lista.Add ( '''GET_VB_ATIVAR_MSG_SENAO/ORIG[' + Origem + ']' ) ;
Lista.Add ( 'cena_str = "' + 'C' + IntToStr(Msg) + '"' ) ;
Lista.Add ( 'transicao_str = "' + Transicao + '"' ) ;
Lista.Add ( 'cena_msg = "' + IntToStr(Msg) + '"' ) ;
Lista.Add ( 'frame_int = ' + IntToStr(FB) ) ;
Lista.Add ( 'Lyric.ActiveFrameBuffer(frame_int)' ) ;
Lista.Add ( 'cena_existe = false' ) ;
Lista.Add ( 'set fb = FrameBuffer(frame_int)' ) ;
Lista.Add ( 'for each cena in fb.Scenes(2)' ) ;
Lista.Add ( '   If cena.Name=cena_str Then' ) ;
Lista.Add ( '      cena_existe = true' ) ;
Lista.Add ( '   End If' ) ;
Lista.Add ( 'next' ) ;
Lista.Add ( 'If NOT cena_existe Then' ) ;
Lista.Add ( '   Lyric.ActivateFrame "Canvas"' ) ;
Lista.Add ( '   Lyric.Message cena_msg' ) ;
Lista.Add ( '   Lyric.Read' ) ;
Lista.Add ( '   ActiveCanvas.Scene.Play PlayOutput, WaitForCompletion' ) ;
If Transicao <> '' Then
   Begin
   Lista.Add ( '   Lyric.Wait(' + IntToStr(Config_Chyron.Wait_Frames_Effect_Out) + ')' ) ;
   Lista.Add ( '   Lyric.FrameBuffer(frame_int).SceneByName(cena_str).Transition(transicao_str).Activate' ) ;
   End ;
Lista.Add ( 'End If' ) ;
//Lista.AddStrings ( GET_VB_CONFIGURAR_COR_JORNAL ( 'GET_VB_ATIVAR_MSG_SENAO[' +Origem + ']', Jornal ) ) ;
//Lista.Add ( 'Lyric.Wait(' + IntToStr(Config_Chyron.Wait_Frames_Effect_Out) + ')' ) ;
//Lista.Add ( 'Lyric.FrameBuffer(frame_int).SceneByName(cena_str).Transition(transicao_str).Activate' ) ;
Result := Lista.Text ;
Lista.Free ;
End ;

Function GET_VB_READ_UPDATE_PLAY ( Origem : String ; FB, Msg : Integer ;
                                   Campo1, Valor1, Campo2, Valor2,
                                   Campo3, Valor3, Campo4, Valor4,
                                   Campo5, Valor5 : String ;
                                   Jornal : String ) : String ;
Var Lista : TStringList ;
Begin
Lista := TStringList.Create ;
Lista.Add ( '''GET_VB_READ_UPDATE_PLAY/ORIG[' + Origem + ']' ) ;
Lista.Add ( 'frame_int = ' + IntToStr(FB) ) ;
Lista.Add ( 'Lyric.ActiveFrameBuffer(frame_int)' ) ;
Lista.Add ( 'Lyric.ActivateFrame "Canvas"' ) ;
Lista.Add ( 'Lyric.Message ' + IntToStr(Msg) ) ;
Lista.Add ( 'Lyric.Read' ) ;
Lista.Add ( 'set sc = Lyric.ActiveCanvas.Scene' ) ;
//
If Campo1 <> '' Then
   Begin
   Lista.Add ( 'set tp1 = sc.GetTemplate("' + Campo1 + '")' ) ;
   Lista.Add ( 'If NOT tp1 is nothing Then' ) ;
   Lista.Add ( '   tp1.Text()="' + Valor1 + '"' ) ;
   Lista.Add ( 'End If' ) ;
   End ;
If Campo2 <> '' Then
   Begin
   Lista.Add ( 'set tp2 = sc.GetTemplate("' + Campo2 + '")' ) ;
   Lista.Add ( 'If NOT tp2 is nothing Then' ) ;
   Lista.Add ( '   tp2.Text()="' + Valor2 + '"' ) ;
   Lista.Add ( 'End If' ) ;
   End ;
If Campo3 <> '' Then
   Begin
   Lista.Add ( 'set tp3 = sc.GetTemplate("' + Campo3 + '")' ) ;
   Lista.Add ( 'If NOT tp3 is nothing Then' ) ;
   Lista.Add ( '   tp3.Text()="' + Valor3 + '"' ) ;
   Lista.Add ( 'End If' ) ;
   End ;
If Campo4 <> '' Then
   Begin
   Lista.Add ( 'set tp4 = sc.GetTemplate("' + Campo4 + '")' ) ;
   Lista.Add ( 'If NOT tp4 is nothing Then' ) ;
   Lista.Add ( '   tp4.Text()="' + Valor4 + '"' ) ;
   Lista.Add ( 'End If' ) ;
   End ;
If Campo5 <> '' Then
   Begin
   Lista.Add ( 'set tp5 = sc.GetTemplate("' + Campo5 + '")' ) ;
   Lista.Add ( 'If NOT tp5 is nothing Then' ) ;
   Lista.Add ( '   tp5.Text()="' + Valor5 + '"' ) ;
   Lista.Add ( 'End If' ) ;
   End ;
//
//Lista.Add ( '   Lyric.AltRecord' ) ;
//
{
Lista.Add ( 'If NOT tp1 is nothing Then' ) ;
If FB = 1 Then
   Begin
   Lista.Add ( '   ActiveCanvas.Scene.Play PlayOutput, PlayImmediate' ) ;
   End
Else If FB = 2 Then
   Begin
   Lista.Add ( '   ActiveCanvas.Scene.Play PlayOutput, PlayImmediate' ) ;
   End ;
Lista.Add ( 'End If' ) ;
}
CHYRON_FLAG_PLAY_IMMEDIATE := TRUE ;
//Lista.AddStrings ( GET_VB_CONFIGURAR_COR_JORNAL ( 'GET_VB_READ_UPDATE_PLAY[' +Origem + ']', Jornal ) ) ;
Result := Lista.Text ;
Lista.Free ;
End  ;

Function GET_VB_ALTERAR_MENSAGEM ( Origem : String ; FB, Msg : LongInt ;
                                   Campo, FN, Jornal : String ) : String ;
Var Lista : TStringList ;
Begin
Lista := TStringList.Create ;
Lista.Add ( '''GET_VB_ALTERAR_MENSAGEM/ORIG[' + Origem + ']' ) ;
Lista.Add ( 'msg = ' + IntToStr(Msg) ) ; // 15, 16, 17
Lista.Add ( 'fn = "' + FN + '"') ; // 'I:\2018\BOMDIA\Images\t3.png'
Lista.Add ( 'campo = "' + Campo + '"') ; // IMAGEM
Lista.Add ( 'frame_int = ' + IntToStr(FB) ) ;
Lista.Add ( 'Lyric.ActiveFrameBuffer(frame_int)' ) ;
Lista.Add ( 'Lyric.Message msg') ;
Lista.Add ( 'Lyric.Read') ;
Lista.Add ( 'set sc = Lyric.ActiveCanvas.Scene') ;
Lista.Add ( 'set nodo2 = sc.Element(campo)') ;
Lista.Add ( 'surfs = nodo2.SurfaceNames') ;
Lista.Add ( 'namearray = Split(surfs, "?")') ;
Lista.Add ( 'for i = 0 to UBound(namearray) - 1') ;
Lista.Add ( '   set surf = nodo2.element(i)') ;
Lista.Add ( '   surf.Filename = fn') ;
Lista.Add ( 'next') ;
//Lista.AddStrings ( GET_VB_CONFIGURAR_COR_JORNAL ( 'GET_VB_ALTERAR_MENSAGEM[' +Origem + ']', Jornal ) ) ;
//Lista.Add ( 'Lyric.AltRecord') ;
//Lista.Add ( 'Lyric.Wait(30)' ) ;
CHYRON_FLAG_PLAY_IMMEDIATE := TRUE ;
//Lista.Add ( 'ActiveCanvas.Scene.Play PlayOutput, PlayImmediate' ) ;
Result := Lista.Text ;
Lista.Free ;
End ;

Function GET_VB_FECHAR_NAO_PERSISTENTES ( Origem : String ; FB : LongInt ; Efeito : Boolean ) : String ;
Var Lista : TStringList ;
Begin
Lista := TStringList.Create ;
Lista.Add ( '''GET_VB_FECHAR_NAO_PERSISTENTES/ORIG[' + Origem + ']' ) ;
Lista.Add ( 'removidos = 0' ) ;
If FB = 1 Then
   Lista.Add ( 'set fb = FrameBuffer(1)' )
Else If FB = 2 Then
   Lista.Add ( 'set fb = FrameBuffer(2)' )
Else
   Lista.Add ( 'set fb = FrameBuffer(ActiveFramebuffer)' ) ;
Lista.Add ( 'for each sc in fb.Scenes(2)' ) ;
Lista.Add ( 'If NOT sc.Persistent() Then' ) ;
//Lista.Add ( '   Lyric.IITransmit("<fechando_nao>" & sc.Name & "@@@")' ) ;
If (Efeito) Then
   Lista.Add ( '   sc.Transition("Effect Out").Activate' )
   Else
   Lista.Add ( '   fb.DeleteScene(sc)' ) ;
   Lista.Add ( '   removidos = removidos + 1' ) ;
//If (Efeito) Then
//   Lista.Add ( '   sc.Transition("Effect Out").Activate' )
//   Else
//   Lista.Add ( '   sc.Erase(2)' ) ;
Lista.Add ( 'Else' ) ;
//Lista.Add ( '   Lyric.IITransmit("<mantendo_nao>" & sc.Name & "@@@")' ) ;
Lista.Add ( 'End If' ) ;
Lista.Add ( 'next' ) ;
Lista.Add ( 'If removidos > 0 Then' ) ;
Lista.Add ( '   Lyric.Wait(' + IntToStr(Config_Chyron.Wait_Frames_Effect_Out) + ')' ) ;
Lista.Add ( 'End If' ) ;
Result := Lista.Text ;
Lista.Free ;
End ;

Function GET_VB_FECHAR_ATE_PERSISTENTES ( Origem : String ; FB : LongInt ; Efeito : Boolean ) : String ;
Var Lista : TStringList ;
Begin
Lista := TStringList.Create ;
Lista.Add ( '''GET_VB_FECHAR_ATE_PERSISTENTES/ORIG[' + Origem + ']' ) ;
Lista.Add ( 'removidos = 0' ) ;
If FB = 1 Then
   Lista.Add ( 'set fb = FrameBuffer(1)' )
Else If FB = 2 Then
   Lista.Add ( 'set fb = FrameBuffer(2)' )
Else
   Lista.Add ( 'set fb = FrameBuffer(ActiveFramebuffer)' ) ;
Lista.Add ( 'for each sc in fb.Scenes(2)' ) ;
//Lista.Add ( '   Lyric.IITransmit("<fechando_ate>" & sc.Name & "@@@")' ) ;
//   Lista.Add ( '   sc.Transition("Effect Out").Activate' ) ;
   Lista.Add ( '   fb.DeleteScene(sc)' ) ;
   Lista.Add ( '   removidos = removidos + 1' ) ;
//If (Efeito) Then
//   Lista.Add ( '   sc.Transition("Effect Out").Activate' )
//   Else
//   Lista.Add ( '   sc.Erase(2)' ) ;
Lista.Add ( 'next' ) ;
Lista.Add ( 'If removidos > 0 Then' ) ;
//Lista.Add ( '   Lyric.Wait(' + IntToStr(Config_Chyron.Wait_Frames_Effect_Out) + ')' ) ;
Lista.Add ( 'End If' ) ;
Result := Lista.Text ;
Lista.Free ;
End ;

(*
Procedure CHYRON_BASICO_PREPARAR_CHYRON_MESSAGE ( Mensagem, Parametros : String ) ;
Var Cmd : String ;
Begin
CHYRON_VAR_LAST_MESSAGE := Mensagem ;
CHYRON_VAR_LAST_PARAM := Parametros ;
If Parametros <> '' Then
   Parametros := Parametros +
                 'Lyric.AltRecord' + '~' ;
Cmd := 'E\' +
       'Lyric.Message ' + Mensagem + '~' +
       'Lyric.Read' + '~' +
       //'Wait(0)' + '~' +
       //'ActiveCanvas.Selection.Execute("Update Data Object Fields")' + '~' +
       //'ActiveCanvas.Scene.Select "Data Object A"' + '~' +
       //'ActiveCanvas.Selection.Execute("Delete Object(s)")' + '~' +
       Parametros +
       'Wait(0)' ;
//Cmd := 'V\5\3\1\' + IntToStr(VAR_FRAME_BUFFER)+'\'+Mensagem + '\' + '0' ;
CHYRON_BASICO_TEMPLATE_SIMPLES ( 'PREPARAR_CHYRON_MESSAGE/'+Mensagem, Cmd ) ;
End ;
*)

(*
Procedure CHYRON_BASICO_SHOW_CHYRON_MESSAGE ( Mensagem, Parametros : String ) ;
Var VB : String ;
Begin
CHYRON_BASICO_CLEAR_FB ( 'CHYRON_BASICO_SHOW_CHYRON_MESSAGE' ) ;
CHYRON_VAR_LAST_MESSAGE := Mensagem ;
CHYRON_VAR_LAST_PARAM := Parametros ;
If Parametros <> '' Then
   Parametros := Parametros +
                 'Lyric.AltRecord' + '~' ;
VB := 'E\' +
      'Lyric.Message ' + Mensagem + '~' +
      'Lyric.Read' + '~' +
      //'Wait(0)' + '~' +
      //'ActiveCanvas.Selection.Execute("Update Data Object Fields")' + '~' +
      //'ActiveCanvas.Scene.Select "Data Object A"' + '~' +
      //'ActiveCanvas.Selection.Execute("Delete Object(s)")' + '~' +
      'Wait(0)' + '~' +
      Parametros +
      'ActiveCanvas.Scene.Play PlayOutput, PlayImmediate' ;
CHYRON_BASICO_TEMPLATE_SIMPLES ( 'SHOW_CHYRON_MESSAGE/'+Mensagem, VB ) ;
End ;
*)

Function CALC_CONTEXTO_CHYRON ( Var Reg : T_Automacao_Chyron ;
                                Espelho : T_Espelho ) : String ;
Var Local : LongInt ;
Begin
Result := 'idx_proc=' + ASPAS_CHYRON('CALC_CONTEXTO_CHYRON') + sLineBreak +
          SE ( Reg.Mens > 0, 'msg=' + IntToStr ( Reg.Mens ) + sLineBreak ) +
          SE ( Reg.Frame > 0, 'frame=' + IntToStr ( Reg.Frame ) + sLineBreak ) +
          'jornal=' + ASPAS_CHYRON(Espelho.Jornal) + sLineBreak +
          'transicao=' + ASPAS_CHYRON(Reg.Transicao) + sLineBreak +
          'descricao=' + ASPAS_CHYRON(Reg.Descricao) + sLineBreak +
          'identificacao=' + ASPAS_CHYRON(Reg.Identificacao) + sLineBreak +
          'wait_temporizado=' + IntToStr(Reg.Wait_Int) + sLineBreak +
          'var_exige_relogio=' + IF01 ( Reg.Exige_Relogio2 ) + sLineBreak ;
For Local := 1 To 5 Do
   Begin
   Result := Result +
             'campo' + IntToStr(Local) + '=' + ASPAS_CHYRON(Reg.Campos_Txt[Local]) + sLineBreak +
             'p' + IntToStr(Local) + '=' + ASPAS_CHYRON(Reg.Valores_Txt[Local]) + sLineBreak ;
   End ;
End ;

end.

