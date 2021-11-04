Unit T_Kml;

Interface

Uses Misc_Def_U, Misc_Const_U, Misc_Type_U,
     Math, IniFiles, ClipBrd, Misc_U, Definicoes_XE8_U,
     System.Classes,
     Vcl.ExtCtrls, Vcl.StdCtrls, SysUtils, System.UITypes;

Type T_Placemark = Record
        Name : String ;
        Coords : String ;
        Latitude : Double ;
        Longitude : Double ;
        End ;

Type
   TKml = class(Vcl.StdCtrls.TLabel)
   private
     //FLabelCount: TLabel;
     FClickCount: integer;
     //FN_Full : String ;
     //FN_Short : String ;
     //FN_Ext : String ;
     //FN_DT : TDateTime ;
   public
     Tag1 ,
     Tag2 ,
     Tag3 : LongInt ;
     TagS1 ,
     TagS2 ,
     TagS3 : String ;
     TagB1 ,
     TagB2 ,
     TagB3 : Boolean ;
     TagF1 ,
     TagF2 ,
     TagF3 : Real ;
     Original : LongInt ;
     Valor : LongInt ;
     Cor_Original : TColor ;
     Posicao_Metros : LongInt ;
     FN : String ;
     Lista : TStringList ;
     Placemarks : Array Of T_Placemark ;
     Constructor Create ( Dono : TComponent ) ;
     property ClickCount: integer read FClickCount;
     Function DEF_FN ( _FN : String ) : Boolean ;
     Procedure LIMPAR_LISTA_KML ;
     Procedure PARSE_KML ;
     Procedure FORMATAR_KML ;
     Function CARREGAR_KML : Boolean ;
     procedure Click; override;
   end;

Implementation

Constructor TKml.Create ( Dono : TComponent ) ;
Begin
Inherited Create ( Dono ) ;
Lista := TStringList.Create ;
End ;

Function TKml.DEF_FN ( _FN : String ) : Boolean ;
Begin
FN := _FN ;
CHECAR_DIRETORIO_FILENAME ( FN ) ;
Result := RR_FileExists ( FN ) ;
End ;

Procedure TKml.LIMPAR_LISTA_KML ;
Var Qtde  : LongInt ;
    Local : LongInt ;
Begin
Qtde := Lista.Count ;
If Qtde > 0 Then
   Begin
   For Local := Qtde - 1 DownTo 0 Do
      Begin
      If Trim ( Lista[Local] ) = '' Then
         Begin
         Lista.Delete(Local) ;
         Continue ;
         End ;
      Lista[Local] := UpperCase ( Trim ( Lista[Local] ) ) ;
      End ;
   End ;
End ;

Procedure TKml.FORMATAR_KML ;
Var Aux   : String ;
Begin
Aux := Lista.Text ;
Aux := SysUtils.StringReplace ( Aux, '<', #13#10 + '<', [rfReplaceAll] ) ;
Aux := SysUtils.StringReplace ( Aux, '>', '>' + #13#10, [rfReplaceAll] ) ;
Lista.Text := Aux ;
End ;

Procedure TKml.PARSE_KML ;
Var Flag_Placemark : Boolean ;
    Flag_Point     : Boolean ;
    Next_Name      : Boolean ;
    Next_Coords    : Boolean ;
    Local          : LongInt ;
    Qtde           : LongInt ;
    Indice         : LongInt ;
    Aux            : String ;
    Str            : String ;
    Reg            : T_Placemark ;
    Posicao        : LongInt ;
Begin
Qtde := Lista.Count ;
If Qtde < 10 Then
   Exit ;
Flag_Placemark := FALSE ;
Flag_Point     := FALSE ;
Next_Name      := FALSE ;
Next_Coords    := FALSE ;
SetLength ( Placemarks, 0 ) ;
Str := '' ;
Indice := 0 ;
For Local := 0 To Qtde - 1 Do
   Begin
   Aux := Trim ( Lista[Local] ) ;
   If Aux = '<PLACEMARK>' Then
      Begin
      Flag_PlaceMark := TRUE ;
      Str := Str + 'PLACE-TRUE' + LF ;
      End
   Else If Aux = '</PLACEMARK>' Then
      Begin
      Flag_PlaceMark := FALSE ;
      Str := Str + '/PLACE' + LF ;
      End
   Else If ( Aux = '<COORDINATES>' ) AND ( Flag_Point ) Then
      Begin
      Next_Coords := TRUE ;
      Str := Str + 'COORDS' + LF ;
      Continue ;
      End
   Else If Aux = '</COORDINATES>' Then
      Begin
      Next_Coords := FALSE ;
      Str := Str + '/COORDS' + LF ;
      End
   Else If ( Aux = '<NAME>' ) AND ( Flag_Placemark ) Then
      Begin
      Next_Name := TRUE ;
      Str := Str + 'NEXT-NAME' + LF ;
      Continue ;
      End
   Else If Aux = '</NAME>' Then
      Begin
      Next_Name := FALSE ;
      Str := Str + '/NAME' + LF ;
      End
   Else If Aux = '<POINT>' Then
      Begin
      Flag_Point := TRUE ;
      End
   Else If Aux = '</POINT>' Then
      Begin
      Flag_Point := FALSE ;
      Str := Str + '/POINT' + LF ;
      End ;
   //
   If Next_Name Then
      Begin
      Reg.Name := Aux ;
      Next_Name := FALSE ;
      Str := Str + '[NAME]' + Aux + LF ;
      End
   Else If Next_Coords Then
      Begin
      Reg.Coords := Aux ;
      Next_Coords := FALSE ;
      Str := Str + '[COORDS]' + Aux + LF ;
      Inc ( Indice ) ;
      SetLength ( Placemarks, Indice ) ;
      Placemarks [ Indice - 1 ] := Reg ;
      End
   End ;
Str := '' ;
If Indice > 0 Then
   Begin
   For Local := 0 To Indice - 1 Do
      Begin
      Posicao := StrToIntDef ( Placemarks[Local].Name, -1 ) ;
      If Posicao >= 0 Then
         Str := Str +
                StrZero ( Posicao, 6 ) +
                ',' + Placemarks[Local].Coords + LF ;
      End ;
   End ;
WRITE_FILE_REAL_WIN ( FN + '.dat', Str ) ;
End ;

Function TKml.CARREGAR_KML : Boolean ;
Begin
Try
   Lista.Text := GET_CONTEUDO_M ( 'CARREGAR_KML', FN ) ;
   FORMATAR_KML ;
   LIMPAR_LISTA_KML ;
   Lista.SaveToFile ( FN + '.txt' ) ;
   PARSE_KML ;
   Result := TRUE ;
   Except
   Result := FALSE ;
   End ;
End ;

Procedure TKml.Click ;
Begin
Inc(FClickCount);
Inherited ;
End ;

End.

