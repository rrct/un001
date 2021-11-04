Unit RSS_U ;

Interface

Uses Misc_Def_U, Misc_Const_U, Misc_Type_U,
     Misc_U,
     Log_U, View_ME_U,
     XMLDoc ,
     ActiveX, MSHTML,
     Vcl.Grids,
     Vcl.StdCtrls,
     System.SysUtils,
     XMLIntf,
     Transparentes_U,
     SHDocVw ,
     //RxCtrls,
     MyRichEdit_U,
     Math, IniFiles, ClipBrd,
     Winapi.Windows, pngImage,
     System.Variants,
     System.Classes, Vcl.Controls,
     Vcl.ComCtrls, Vcl.Samples.Spin, Vcl.Forms, Vcl.Menus,
     Vcl.Dialogs, Vcl.Graphics, Vcl.ExtCtrls, Vcl.Mask ;

Const RSS_SG_ITEM  = 0 ;
      RSS_SG_DT    = 1 ;
      RSS_SG_DT2   = 2 ;
      RSS_SG_FONTE = 3 ;
      RSS_SG_TITLE = 4 ;
      RSS_SG_IMG   = 5 ;
      RSS_SG_CORPO = 6 ;
      RSS_SG_LINK  = 7 ;

      MIN_RSS      = -1 ;
      MAX_RSS      = 20 ;
      RSS_DEF_TIMEOUT = 10000 ;

Type T_CELULA_RSS = Record
         TS       : TTabSheet ;
         SG       : TStringGrid ;
         Url      : String ;
         Alias    : String ;
         Lista    : TStringList ;
     End ;

     T_FILTRO_RSS = Record
         SL       : TStringList ;
         Qtde     : LongInt ;
         Age      : TDateTime ;
     End ;

     T_FEED_RSS   = Record
         Titulo   : String ;
         Corpo    : String ;
         Link     : String ;
         DT       : TDateTime ;
         DT_Unix  : String ;
         Imagem   : String ;
     End ;

Type
   TRSS = class(Vcl.StdCtrls.TLabel)
   Private
   Public
     REG_RSS                      : Array [ MIN_RSS .. MAX_RSS ] Of T_CELULA_RSS ;
     SL_URL                       : TStringList ;
     RSS_SERVIDOR                 : String ;
     RSS_LAST_REFRESH             : Cardinal ;
     RSS_WB                       : TWebBrowser ;
     RSS_LIMITE_LISTA_INDIVIDUAL  : LongInt ;
     RSS_LIMITE_LISTA_TODOS       : LongInt ;
     RSS_FILTRO                   : T_FILTRO_RSS ;
     RSS_FEED                     : T_FEED_RSS ;
     Constructor Create ( Dono : TComponent ; Servidor : String ;
                          PC : TPageControl ; WB : TWebBrowser ) ;
     Function RSS_ADD_URL ( Indice : LongInt ; Alias, Url : String ) : LongInt ;
     Procedure RSS_LIMPAR_SG ( SG : TStringGrid ) ;
     Procedure RSS_INICIALIZAR_SG ( Origem : String ; SG : TStringGrid ) ;
     Function RSS_READ_FEED_XML_CHANNEL ( Node : IXMLNode ) : Boolean ;
     Function RSS_EXTRAIR_SRC_IMG ( Html : String ) : String ;
     Function RSS_EXTRAIR_IMG ( Var Corpo : String ) : String ;
     Function RSS_READ_FEED_XML_NOTICIA ( Var Reg : T_FEED_RSS ; Node : IXMLNode ) : Boolean ;
     Function RSS_READ_XML ( Indice : LongInt ) : LongInt ;
     Procedure RSS_PREPARAR_URL ( SG : TStringGrid ) ;
     procedure RSS_SG_Click(Sender: TObject);
     procedure RSS_SG_DblClick(Sender: TObject);
     Function RSS_FN_LINKS : String ;
     Procedure RSS_CARREGAR_LINKS_RSS ;
     Procedure RSS_LOAD_FULL_URL ;
     Procedure RSS_PRINT_LINKS ;
     Procedure RSS_LIMPAR_LINKS ;
     procedure RSS_ATUALIZAR ;
     Procedure RSS_PLOTAR_SG ( Indice : LongInt ; Lista : TStringList ) ;
     Function RSS_FILTRO_ATENDIDO ( Str : String ) : Boolean ;
     Procedure RSS_LOAD_FILTRO ;
     Procedure RSS_PRINT_FILTRO ;
     Function RSS_FN_FILTRO : String ;
     Function RSS_VERIFICAR_ALTERACAO_FILTRO : Boolean ;
   End ;

Implementation

Constructor TRSS.Create ( Dono : TComponent ; Servidor : String ;
                          PC : TPageControl ; WB : TWebBrowser ) ;
Var Local   : LongInt ;
Begin
PUT_LOG ( 'RSS Create (Min:' + IntToStr(MIN_RSS) + ', Máx:' + IntToStr(MAX_RSS) + ')' ) ;
SL_URL := TStringList.Create ;
RSS_FILTRO.SL := TStringList.Create ;
RSS_FILTRO.Age := 0 ;
RSS_SERVIDOR := Servidor ;
RSS_LAST_REFRESH := 0 ;
RSS_WB := WB ;
RSS_LIMITE_LISTA_INDIVIDUAL := 100 ;
RSS_LIMITE_LISTA_TODOS := 500 ;
For Local := MIN_RSS To MAX_RSS Do Begin
  Reg_RSS[Local].Url := '' ;
  Reg_RSS[Local].Alias := '' ;
  Reg_RSS[Local].Lista := TStringList.Create ;
  Reg_RSS[Local].Lista.Clear ;
  Reg_RSS[Local].TS := TTabSheet.Create(PC) ;
  //Reg_RSS[Local].TS.Name := 'TS_' + StrZero(Local,4 ) ;
  Reg_RSS[Local].TS.Caption := '-' ; // StrZero ( Local, 4 ) ;
  Reg_RSS[Local].TS.TabVisible := FALSE ;
  Reg_RSS[Local].TS.PageControl := PC ;
  Reg_RSS[Local].TS.Tag := Local ;
  Reg_RSS[Local].SG := TStringGrid.Create ( Dono  ) ;
  Reg_RSS[Local].SG.Parent := Reg_RSS[Local].TS ;
  Reg_RSS[Local].SG.Align := alClient ;
  Reg_RSS[Local].SG.Options := Reg_RSS[Local].SG.Options + [goEditing,goColSizing] ;
  Reg_RSS[Local].SG.Tag := Local ;
  //Reg_RSS[Local].SG.Name := 'SG_' + StrZero(Local,4 ) ;
  Reg_RSS[Local].SG.Visible := TRUE ;
  Reg_RSS[Local].SG.OnClick := RSS_SG_Click ;
  Reg_RSS[Local].SG.OnDblClick := RSS_SG_DblClick ;
  RSS_INICIALIZAR_SG ( 'Create', Reg_RSS[Local].SG ) ;
End ;
RSS_LOAD_FULL_URL ;
RSS_LOAD_FILTRO ;
End ;

Procedure TRSS.RSS_PRINT_FILTRO ;
Var Local : LongInt ;
Begin
If RSS_FILTRO.Qtde = 0 Then Begin
   PUT_LOG ( 'RSS_PRINT_FILTRO [Nenhum registro]' ) ;
   Exit ;
End ;
For Local := 0 To RSS_FILTRO.Qtde - 1 Do Begin
   PUT_LOG ( 'RSS_PRINT_FILTRO ' + IntToStr(Local+1) + ' [' + RSS_FILTRO.SL[Local] + ']' ) ;
End ;
End ;

Function TRSS.RSS_FN_FILTRO : String ;
Begin
Result := RSS_SERVIDOR + 'Database\Config\rss_filtro.dat' ;
End ;

Function TRSS.RSS_VERIFICAR_ALTERACAO_FILTRO : Boolean ;
Var Age : TDateTime ;
Begin
Result := FALSE ;
If NOT RR_FileExists ( 'RSS VERIFICAR_ALTERACAO_FILTRO', RSS_FN_FILTRO ) Then Begin
   Result := TRUE ;
   RSS_LOAD_FILTRO ;
   Exit ;
End ;
RR_FILE_AGE ( 'RSS_VERIFICAR_ALTERACAO_FILTRO', RSS_FN_FILTRO, Age ) ;
If RSS_FILTRO.Age <> Age Then Begin
   Result := TRUE ;
   RSS_LOAD_FILTRO ;
End ;
End ;

Procedure TRSS.RSS_LOAD_FILTRO ;
Var Local : LongInt ;
Begin
RSS_FILTRO.SL.Clear ;
If NOT RR_FileExists ( 'RSS LOAD_FILTRO/1', RSS_FN_FILTRO ) Then Begin
   RSS_FILTRO.SL.Add ( 'FORTALEZA' ) ;
   RSS_FILTRO.SL.Add ( 'CEARÁ' ) ;
   RSS_FILTRO.SL.Add ( 'ACIDENTE' ) ;
   RSS_FILTRO.SL.Add ( 'EMBRAER' ) ;
   RSS_FILTRO.SL.Add ( 'CAMPEONATO' ) ;
   RSS_FILTRO.SL.Add ( 'PADRE' ) ;
   RSS_FILTRO.SL.Add ( 'MÉDIUM' ) ;
   RSS_FILTRO.SL.Add ( 'CAMILO SANTANA' ) ;
   RSS_FILTRO.SL.Add ( 'ROBERTO CLAUDIO' ) ;
   RSS_FILTRO.SL.Add ( 'CEARENSE' ) ;
   RSS_FILTRO.SL.Add ( 'FORTALEZENSE' ) ;
   Try
      RSS_FILTRO.SL.SaveToFile ( RSS_FN_FILTRO ) ;
   Except
      On E : Exception Do Begin
         PUT_LOG ( 'Exception RSS_LOAD_FILTRO/Create [' + RSS_FN_FILTRO + '][' + E.Message + ']' ) ;
      End ;
   End ;
End ;
If RR_FileExists ( 'RSS LOAD_FILTRO/2', RSS_FN_FILTRO ) Then Begin
   Try
      RSS_FILTRO.SL.Text := GET_CONTEUDO_M ( 'RSS_LOAD_FILTRO', RSS_FN_FILTRO ) ;
      RR_FILE_AGE ( 'RSS LOAD_FILTRO', RSS_FN_FILTRO, RSS_FILTRO.Age ) ;
   Except
      On E : Exception Do Begin
         PUT_LOG ( 'Exception RSS_LOAD_FILTRO/Load [' + RSS_FN_FILTRO + '][' + E.Message + ']' ) ;
      End ;
   End ;
End ;
RSS_FILTRO.Qtde := RSS_FILTRO.SL.Count ;
If RSS_FILTRO.Qtde > 0 Then Begin
   For Local := 0 To RSS_FILTRO.Qtde - 1 Do Begin
      RSS_FILTRO.SL[Local] := UpperCase ( STRING_ASCII_PADRAO ( RSS_FILTRO.SL[Local] ) ) ;
   End ;
End ;
RSS_PRINT_FILTRO ;
End ;

Function TRSS.RSS_FN_LINKS : String ;
Begin
Result := RSS_SERVIDOR + 'Database\Config\rss.dat' ;
End ;

Procedure TRSS.RSS_CARREGAR_LINKS_RSS ;
Var Aux   : String ;
    FN    : String ;
    Secao : String ;
    Local : LongInt  ;
    Ini   : TMemIniFile ;
    Url   : String ;
    Alias : String ;
Begin
FN := RSS_FN_LINKS ;
PUT_LOG ( 'RSS_CARREGAR_LINKS_RSS' ) ;
If NOT RR_FileExists ( 'RSS_CARREGAR_LINKS_RSS/1', FN ) Then Begin
   Aux := '' ;
   PUT_LOG ( 'RSS_CARREGAR_LINKS_RSS Criando [' + FN + ']' ) ;
   For Local := 1 To MAX_RSS Do Begin
      Secao := StrZero(Local, 4) ;
      If Local = 0 Then Begin
         Aux := Aux +
                '[' + Secao + ']' + sLineBreak +
                'URL=' + 'http://pox.globo.com/rss/g1/' + sLineBreak +
                'ALIAS=' + 'G1' + sLineBreak +
                sLineBreak ;
      End Else Begin
         Aux := Aux +
                '[' + Secao + ']' + sLineBreak +
                'URL=' + '' + sLineBreak +
                'ALIAS=' + '' + sLineBreak +
                sLineBreak ;
      End ;
   End ;
   WRITE_FILE_CORE ( 'RSS_CARREGAR_LINKS_RSS', FN, Aux, DELAYED_FALSE ) ;
End ;
If NOT RR_FileExists ( 'RSS_CARREGAR_LINKS_RSS/2', FN ) Then Begin
   PUT_LOG ( 'RSS_CARREGAR_LINKS_RSS Exit por !FileExists [' + FN + ']' ) ;
   Exit ;
End ;
Ini := TMemIniFile.Create ( FN ) ;
For Local := 1 To MAX_RSS Do Begin
   Secao := StrZero(Local, 4) ;
   Url := Ini.ReadString ( Secao, 'URL', '' ) ;
   Alias := Ini.ReadString ( Secao, 'ALIAS', '' ) ;
   If ( Url <> '' ) AND ( Alias <> '' ) Then Begin
      RSS_ADD_URL ( -2, Alias, Url ) ;
   End ;
End ;
Ini.Free ;
RSS_ADD_URL ( 0, 'TODOS', '' ) ;
RSS_ADD_URL ( -1, 'FILTRO', '' ) ;
End ;

Procedure TRSS.RSS_LOAD_FULL_URL ;
Var Local : LongInt ;
Begin
If GetTickCount < RSS_LAST_REFRESH Then Begin
   PUT_LOG ( 'Exit Timeout RSS_LOAD_FULL_URL' ) ;
   Exit ;
End ;
If RSS_VERIFICAR_ALTERACAO_FILTRO Then Begin
   PUT_LOG ( 'TRUE RSS_VERIFICAR_ALTERACAO_FILTRO' ) ;
   Reg_RSS[0].Lista.Clear ;
   Reg_RSS[-1].Lista.Clear ;
End ;
RSS_LIMPAR_LINKS ;
RSS_CARREGAR_LINKS_RSS ;
RSS_LOAD_FILTRO ;
RSS_LAST_REFRESH := GetTickCount + RSS_DEF_TIMEOUT ;
PUT_LOG ( 'RSS_LOAD_FULL_URL' ) ;
RSS_LIMITE_LISTA_INDIVIDUAL := 100 ;
RSS_LIMITE_LISTA_TODOS := 1000 ;
For Local := 1 To MAX_RSS Do Begin
   RSS_READ_XML ( Local ) ;
End ;
//RSS_PRINT_LINKS ;
End ;

Procedure TRSS.RSS_LIMPAR_LINKS ;
Var Local : LongInt ;
Begin
PUT_LOG ( 'RSS_LIMPAR_LINKS' ) ;
For Local := 1 To MAX_RSS Do Begin
   Reg_RSS[Local].Url := '' ;
   Reg_RSS[Local].Alias := '' ;
End ;
End ;

Procedure TRSS.RSS_PRINT_LINKS ;
Var Local : LongInt ;
Begin
PUT_LOG ( 'RSS_PRINT_LINKS' ) ;
For Local := 1 To MAX_RSS Do Begin
   If Reg_RSS[Local].Url <> '' Then
      PUT_LOG ( 'RSS_PRINT_LINKS [' + IntToStr(Local)+ ']' +
                '[' + Reg_RSS[Local].Url + ']' +
                '[' + Reg_RSS[Local].Alias + ']' ) ;
End ;
End ;

Function TRSS.RSS_ADD_URL ( Indice : LongInt ; Alias, Url : String ) : LongInt ;
Var Local : LongInt ;
Begin
Result := -1 ;
If ( Indice < -2 ) OR ( Indice > MAX_RSS ) Then Begin
   PUT_LOG ( 'Exit RSS_ADD_URL (' + Alias + ')(' + Url + ')' ) ;
   Exit ;
End ;
If Indice >= -1 Then Begin
   Reg_RSS[Indice].Url := Url ;
   Reg_RSS[Indice].Alias := Alias ;
   //Reg_RSS[Indice].TS.Caption := Alias ;
   Reg_RSS[Indice].TS.TabVisible := TRUE ;
   Result := Indice ;
   PUT_LOG ( 'OK/1 RSS_ADD_URL (' + Alias + ')(' + Url + ')(' + IntToStr(Result) + ')' ) ;
   Exit ;
End ;
For Local := 1 To MAX_RSS Do Begin
  If Reg_RSS[Local].Url = '' Then Begin
     Reg_RSS[Local].Url := Url ;
     Reg_RSS[Local].Alias := Alias ;
     //Reg_RSS[Local].TS.Caption := Alias ;
     Reg_RSS[Local].TS.TabVisible := TRUE ;
     Result := Local ;
     PUT_LOG ( 'OK/2 RSS_ADD_URL (' + Alias + ')(' + Url + ')(' + IntToStr(Result) + ')' ) ;
     Exit ;
  End ;
End ;
PUT_LOG ( 'NOK RSS_ADD_URL (' + Alias + ')(' + Url + ')(' + IntToStr(Indice) + ')' ) ;
End ;

Procedure TRSS.RSS_LIMPAR_SG ( SG : TStringGrid ) ;
Begin
SG.RowCount := 2 ;
SG.Cells[RSS_SG_ITEM,0] := 'It' + IntToStr ( SG.Tag ) ;
SG.Cells[RSS_SG_DT,0] := 'Publicação' ;
SG.Cells[RSS_SG_DT,0] := 'Auxiliar' ;
SG.Cells[RSS_SG_FONTE,0] := 'Fonte' ;
SG.Cells[RSS_SG_TITLE,0] := 'Resumo' ;
SG.Cells[RSS_SG_IMG,0] := 'Imagem' ;
SG.Cells[RSS_SG_CORPO,0] := 'Corpo' ;
SG.Cells[RSS_SG_LINK,0] := 'Link' ;
SG.Cells[RSS_SG_ITEM,1] := '' ;
SG.Cells[RSS_SG_DT,1] := '' ;
SG.Cells[RSS_SG_DT2,1] := '' ;
SG.Cells[RSS_SG_FONTE,1] := '' ;
SG.Cells[RSS_SG_TITLE,1] := '' ;
SG.Cells[RSS_SG_IMG,1] := '' ;
SG.Cells[RSS_SG_CORPO,1] := '' ;
SG.Cells[RSS_SG_LINK,1] := '' ;
End ;

Procedure TRSS.RSS_INICIALIZAR_SG ( Origem : String ; SG : TStringGrid ) ;
Begin
PUT_LOG ( 'RSS_INICIALIZAR_SG [' + Origem + ']' ) ;
SG.ColCount := RSS_SG_LINK + 1 ;
SG.RowCount := 2 ;
SG.FixedRows := 1 ;
SG.FixedCols := 1 ;
SG.ColWidths[RSS_SG_ITEM] := 40 ;
SG.ColWidths[RSS_SG_DT] := 150 ;
SG.ColWidths[RSS_SG_DT2] := -1 ; // 250 ;
SG.ColWidths[RSS_SG_FONTE] := 100 ;
SG.ColWidths[RSS_SG_TITLE] := 700 ;
SG.ColWidths[RSS_SG_IMG] := -1 ; // 40 ;
SG.ColWidths[RSS_SG_CORPO] := -1 ; // 200 ;
SG.ColWidths[RSS_SG_LINK] := -1 ;
RSS_LIMPAR_SG ( SG ) ;
End ;

Function TRSS.RSS_READ_FEED_XML_CHANNEL ( Node : IXMLNode ) : Boolean ;
Begin
Result := FALSE ;
If Node.ChildNodes.Count = 0 Then Begin
   PUT_LOG ( 'Exit/1 RSS_READ_FEED_XML_CHANNEL Node Count 0' ) ;
   Exit ;
End ;
PUT_LOG ( 'RSS_READ_FEED_XML/1 [' + IntToStr(Node.ChildNodes.Count) + ']' ) ;
If Node.LocalName <> 'channel' Then Begin
   PUT_LOG ( 'Exit/2 RSS_READ_FEED_XML_CHANNEL <> channel [' + Node.LocalName + ']' ) ;
   Exit ;
End ;
Result := TRUE ;
End ;

Function TRSS.RSS_EXTRAIR_SRC_IMG ( Html : String ) : String ;
Var doc : OleVariant ;
    el  : OleVariant ;
    i   : Integer ;
Begin
Result := '' ;
Doc := coHTMLDocument.Create As IHTMLDocument2 ;
Doc.Write(HTML) ;
Doc.Close ;
//ShowMessage ( Doc.body.innerHTML ) ;
For i := 0 To Doc.Body.All.Length - 1 Do Begin
   el := Doc.Body.All.Item(i) ;
   //ShowMessage ( IntToStr(i) + sLineBreak +
   //              el.tagName ) ;
   If ( UpperCase ( el.tagName ) = 'IMG' ) Then Begin // AND (el.className = 'tvLabel') Then Begin
      Result := el.GetAttribute('src') ;
   End ;
End ;
End ;

Function TRSS.RSS_EXTRAIR_IMG ( Var Corpo : String ) : String ;
Var Inicio ,
    Fim    : LongInt ;
    Local  : LongInt ;
Begin
Result := '' ;
Corpo := System.SysUtils.StringReplace ( Corpo, '<br>', '', [rfReplaceAll] ) ;
Corpo := System.SysUtils.StringReplace ( Corpo, '<br />', '', [rfReplaceAll] ) ;
Corpo := System.SysUtils.StringReplace ( Corpo, '<br/>', '', [rfReplaceAll] ) ;
Inicio := Pos ( '<IMG', UpperCase ( Corpo ) ) ;
Fim := 0 ;
If Inicio > 0 Then Begin
   For Local := Inicio To Length ( Corpo ) Do Begin
      If Corpo[Local]='>' Then Begin
         Fim := Local ;
         Break ;
      End ;
   End ;
End ;
If ( Inicio > 0 ) AND ( Fim > Inicio ) Then Begin
   Result := RSS_EXTRAIR_SRC_IMG ( Copy ( Corpo, Inicio, Fim-Inicio+1 ) ) ;
   Delete ( Corpo, Inicio, Fim-Inicio+1 ) ;
End ;
End ;

Function TRSS.RSS_READ_FEED_XML_NOTICIA ( Var Reg : T_FEED_RSS ; Node : IXMLNode ) : Boolean ;
Var Node2 : IXMLNode ;
    Qtde  : LongInt ;
    Qtde2 : LongInt ;
    Aux   : String ;
    Local : LongInt ;
    Campo : String ;
Begin
Reg.Titulo := Trim ( Node.ChildNodes['title'].Text ) ;
Reg.DT_Unix := Node.ChildNodes['pubDate'].Text ;
Reg.DT := G1ToDateTime ( Reg.DT_Unix ) ;
Reg.Link := Node.ChildNodes['link'].Text ;
Aux := '' ;
Node2 := Nil ;
Campo := 'description' ;
Qtde := 0 ;
{
Try
   Qtde := Node.ChildNodes.Count ;
   If Qtde > 0 Then Begin
      For Local := 0 To Qtde - 1 Do Begin
         Aux := Aux + '[' + IntToStr(Local) + ':' + Node.ChildNodes.Get(Local).NodeName + ']' ;
         If Node.ChildNodes.Get(Local).NodeName = 'media:content' Then Begin
            Node2 := Node.ChildNodes.Get(Local) ;
            Campo := Node.ChildNodes.Get(Local).NodeName ;
         End ;
      End ;
   End Else Begin
      Aux := '[INDEF/1]' ;
   End ;
Except
   Qtde := -2 ;
   Aux := '[INDEF/2]' ;
End ;
}
If NOT Assigned ( Node2 ) Then Begin
   Try
      Qtde := Node.ChildNodes.Count ;
      If Qtde > 0 Then Begin
         For Local := 0 To Qtde - 1 Do Begin
            Aux := Aux + '[' + IntToStr(Local) + ':' + Node.ChildNodes.Get(Local).NodeName + ']' ;
            If Node.ChildNodes.Get(Local).NodeName = 'description' Then Begin
               Node2 := Node.ChildNodes.Get(Local) ;
               Campo := Node.ChildNodes.Get(Local).NodeName ;
            End ;
         End ;
      End Else Begin
         Aux := '[INDEF/1]' ;
      End ;
   Except
      Qtde := -2 ;
      Aux := '[INDEF/2]' ;
   End ;
End ;
Try
   If Assigned ( Node2 ) Then Begin
      Qtde2 := Node2.ChildNodes.Count ;
   End Else Begin
      Qtde2 := -3 ;
   End ;
Except
   Qtde2 := -2 ;
End ;
If Qtde2 = 1 Then Begin
   Reg.Corpo := //'{' + Aux + '}' +
                //'[' + IntToStr(Qtde) + ':' + IntToStr(Qtde2) + '] ' +
                Node.ChildNodes[Campo].Text ;
End Else If Qtde2 = 2 Then Begin
   Reg.Corpo := //'{' + Aux + '}' +
                //'[' + IntToStr(Qtde) + ':' + IntToStr(Qtde2) + '] ' +
                Node2.ChildNodes.Get(0).Text + ' ' + Node2.ChildNodes.Get(1).Text ;
End Else Begin
   Reg.Corpo := '{' + Aux + '}' +
                '[' + IntToStr(Qtde) + ':' + IntToStr(Qtde2) + '] ' +
                '{INDEF/3}' ;
End ;
Reg.Imagem := RSS_EXTRAIR_IMG ( Reg.Corpo ) ;
(*
Try
   Reg.Corpo := '{' + Aux + '}' +
                '[' + IntToStr(Qtde) + ':' + IntToStr(Qtde2) + '] ' +
                Node.ChildNodes['description'].Text ;
Except
   On E : Exception Do Begin
      Reg.Corpo := '{' + Aux + '}' +
                   '[' + IntToStr(Qtde) + ':' + IntToStr(Qtde2) + '] INDEF' ;
   End ;
End ;
*)
Result := TRUE ;
End ;

Function TRSS.RSS_READ_XML ( Indice : LongInt ) : LongInt ;
Var Doc         : IXMLDocument ;
    Data        : IXMLNode ;
    Node2       : IXMLNode ;
    Node3       : IXMLNode ;
    I           : Integer ;
    J           : Integer ;
    Local       : LongInt ;
    //Contador    : LongInt ;
    //SG          : TStringGrid ;
    Chave       : String ;
    Excesso     : LongInt ;
    //Qtde        : LongInt ;
    CRC         : LongInt ;
    Adicionados : LongInt ;
    Reg         : T_FEED_RSS ;
    Qtde_Nodes  : LongInt ;
Begin
Result := 0 ;
If ( Indice < 0 ) OR ( Indice > MAX_RSS ) Then Begin
   PUT_LOG ( 'RSS Abort READ_XML Indice [' + IntToStr(Indice) + ']' ) ;
   Exit ;
End ;
//SG := Reg_RSS[Indice].SG ;
If Reg_RSS[Indice].Url = '' Then Begin
   Exit ;
End ;
Try
   Doc := LoadXMLDocument ( Reg_RSS[Indice].Url ) ;
   PUT_LOG ( 'RSS Download XML [' + Reg_RSS[Indice].Url + ']' ) ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception RSS READ_XML [' + E.Message + '][' + Reg_RSS[Indice].Url + ']' ) ;
      Exit ;
   End ;
End ;
Data := Doc.DocumentElement ;
PUT_LOG ( 'RSS READ_XML [' + Reg_RSS[Indice].Url + '] ' +
          'Count[' + IntToStr ( Data.ChildNodes.Count ) + ']' ) ;
If Data.ChildNodes.Count = 0 Then Begin
   Exit ;
End ;
CRC := 0 ;
Adicionados := 0 ;
For I := 0 To Data.ChildNodes.Count-1 Do Begin
   Node2 := Data.ChildNodes[I];
   If NOT RSS_READ_FEED_XML_CHANNEL ( Node2 ) Then Begin
      Continue ;
   End ;
   Qtde_Nodes := Node2.ChildNodes.Count ;
   For J := 0 To Qtde_Nodes - 1 Do Begin
      Node3 := Node2.ChildNodes[J] ;
      If NOT RSS_READ_FEED_XML_NOTICIA ( Reg, Node3 ) Then Begin
         Continue ;
      End ;
      If Reg.Titulo = '' Then Begin
         //PUT_LOG ( 'Continue/2 title vazio' ) ;
         Continue ;
      End ;
      If Reg.DT < ( Now - 30 ) Then Begin
         //PUT_LOG ( 'Continue/3 data invalida [' + DateTimeToStr(DT) + ']' ) ;
         Continue ;
      End ;
      Chave := DATAHORA_INVERSA ( Reg.DT ) + '^' +
               DateTimeToStr ( Reg.DT ) + '^' +
               Reg.Titulo + '^' +
               Reg.DT_Unix + '^' +
               Reg.Link + '^' +
               Reg_RSS[Indice].Alias + '^' +
               Reg.Imagem + '^' +
               Reg.Corpo + '^' ;
      For Local := 1 To Length ( Chave ) Do
         CRC := CRC + Ord(Chave[Local]) ;
      If Reg_RSS[Indice].Lista.IndexOf ( Chave ) = -1 Then Begin
         Reg_RSS[Indice].Lista.Add ( Chave ) ;
         Inc ( Adicionados ) ;
         //PUT_LOG ( 'ADD ' + Chave ) ;
      End ;
      If Reg_RSS[0].Lista.IndexOf ( Chave ) = -1 Then Begin
         Reg_RSS[0].Lista.Add ( Chave ) ;
         If Reg_RSS[-1].Lista.IndexOf ( Chave ) = -1 Then Begin
            If RSS_FILTRO_ATENDIDO ( Reg.Titulo ) Then Begin
               Reg_RSS[-1].Lista.Add ( Chave ) ;
            End ;
         End ;
         //PUT_LOG ( 'ADD ' + Chave ) ;
      End ;
      {
      PUT_LOG ( 'ITEM/2 ' + IntToStr(J) + ' ' +
                '[' + Node2.ChildNodes['pubDate'].Text + ']' +
                '[' + Node2.ChildNodes['title'].Text + ']' +
                '[' + Node2.ChildNodes['link'].Text + ']' ) ;
      }
   End ;
End ;
Reg_RSS[Indice].Lista.Sort ; // Cada agência
Excesso := Reg_RSS[Indice].Lista.Count - RSS_LIMITE_LISTA_INDIVIDUAL ;
If Excesso > 0 Then Begin
   For Local := 1 To Excesso Do Begin
       Reg_RSS[Indice].Lista.Delete(0) ;
   End ;
End ;
Reg_RSS[0].Lista.Sort ; // Todas as agências
Excesso := Reg_RSS[0].Lista.Count - RSS_LIMITE_LISTA_TODOS ;
If Excesso > 0 Then Begin
   For Local := 1 To Excesso Do Begin
       Reg_RSS[0].Lista.Delete(0) ;
   End ;
End ;
Reg_RSS[-1].Lista.Sort ; // Filtros
Excesso := Reg_RSS[-1].Lista.Count - RSS_LIMITE_LISTA_TODOS ;
If Excesso > 0 Then Begin
   For Local := 1 To Excesso Do Begin
       Reg_RSS[-1].Lista.Delete(0) ;
   End ;
End ;
//
RSS_PLOTAR_SG ( Indice, Reg_RSS[Indice].Lista ) ;
RSS_PLOTAR_SG ( 0, Reg_RSS[0].Lista ) ;
RSS_PLOTAR_SG ( -1, Reg_RSS[-1].Lista ) ;
PUT_LOG ( 'END RSS_READ_XML ' +
          'Add[' + IntToStr(Adicionados) + '] ' +
          'Alias[' + Reg_RSS[Indice].Alias + '] ' +
          'CRC[' + IntToStr(CRC) + ']' ) ;
End ;

Function TRSS.RSS_FILTRO_ATENDIDO ( Str : String ) : Boolean ;
Var Local : LongInt ;
Begin
Result := FALSE ;
If RSS_FILTRO.Qtde = 0 Then Begin
   Exit ;
End ;
Str := Super_UpperCase ( STRING_ASCII_PADRAO ( Str ) ) ;
For Local := 0 To RSS_FILTRO.Qtde - 1 Do
  If Pos ( RSS_FILTRO.SL[Local], Str ) > 0 Then Begin
     Result := TRUE ;
     Exit ;
  End ;
End ;

Procedure TRSS.RSS_PLOTAR_SG ( Indice : LongInt ; Lista : TStringList ) ;
Var Qtde     : LongInt ;
    Contador : LongInt ;
    Local    : LongInt ;
    SL       : TStringList ;
    SG       : TStringGrid ;
Begin
Qtde := Reg_RSS[Indice].Lista.Count ;
If Qtde = 0 Then Begin
   Exit ;
End ;
SG := Reg_RSS[Indice].SG ;
SL := TStringList.Create ;
//Contador := 0 ;
SG.RowCount := Qtde + 1 ;
(*
For Local := 1 To SG.RowCount - 1 Do Begin
   If SG.Cells[RSS_SG_ITEM, Local] = '' Then Begin
      //Contador := Local - 1 ;
      Break ;
   End ;
End ;
*)
Contador := 0 ;
For Local := Qtde - 1 DownTo 0 Do Begin
   Inc ( Contador ) ;
   If Contador >= SG.RowCount Then Begin
   //   SG.RowCount := SG.RowCount + 1 ;
   End ;
   EXPLODE_RR ( '^', Reg_RSS[Indice].Lista[Local], SL ) ;
   If SG.Cells[RSS_SG_ITEM,Contador] <> IntToStr ( Contador ) Then Begin
      SG.Cells[RSS_SG_ITEM,Contador] := IntToStr ( Contador ) ;
   End ;
   If SG.Cells[RSS_SG_DT,Contador] <> SL[1] Then Begin
      SG.Cells[RSS_SG_DT,Contador] := SL[1] ;
   End ;
   If SG.Cells[RSS_SG_DT2,Contador] <> SL[3] Then Begin
      SG.Cells[RSS_SG_DT2,Contador] := SL[3] ;
   End ;
   If SG.Cells[RSS_SG_FONTE,Contador] <> SL[5] Then Begin
      SG.Cells[RSS_SG_FONTE,Contador] := SL[5] ;
   End ;
   If SG.Cells[RSS_SG_TITLE,Contador] <> SL[2] Then Begin
      SG.Cells[RSS_SG_TITLE,Contador] := SL[2] ;
   End ;
   If SG.Cells[RSS_SG_LINK,Contador] <> SL[4] Then Begin
      SG.Cells[RSS_SG_LINK,Contador] := SL[4] ;
   End ;
   If SG.Cells[RSS_SG_IMG,Contador] <> SL[6] Then Begin
      SG.Cells[RSS_SG_IMG,Contador] := SL[6] ;
   End ;
   If SG.Cells[RSS_SG_CORPO,Contador] <> SL[7] Then Begin
      SG.Cells[RSS_SG_CORPO,Contador] := SL[7] ;
   End ;
End ;
Reg_RSS[Indice].TS.Caption := Reg_RSS[Indice].Alias + ' [' + IntToStr ( Qtde ) + ']' ;
SL.Free ;
End ;

Procedure TRSS.RSS_PREPARAR_URL ( SG : TStringGrid ) ;
Var _Link    : String ;
    _Titulo  : String ;
    _Corpo   : String ;
    _Fonte   : String ;
    _Imagem  : String ;
    _HTML    : String ;
    _DT      : String ;
    FN       : String ;
Begin
If SG.Row < 1 Then Begin
   Exit ;
End ;
_Link   := '<a href="' + SG.Cells[RSS_SG_LINK, SG.Row] + '">' + SG.Cells[RSS_SG_TITLE, SG.Row] + '</a>' ;
_DT     := SG.Cells[RSS_SG_DT, SG.Row] ;
_Titulo := SG.Cells[RSS_SG_TITLE, SG.Row] ;
_Corpo  := SG.Cells[RSS_SG_CORPO, SG.Row] ;
_Fonte  := SG.Cells[RSS_SG_FONTE, SG.Row] ;
_Imagem := SG.Cells[RSS_SG_IMG, SG.Row] ;
_HTML := '<html>' +  sLineBreak +
         '<head></head>' + sLineBreak +
         '<body>' + sLineBreak +
         '<span style="font-size:16pt; color:blue; font-weight:bold; font-family:Coiny,Tahoma,Verdana,Arial;">' +
         _Titulo + '<br>' +
         '<span style="font-size:9pt; color:green; font-weight:normal; font-family:Coiny,Tahoma,Verdana,Arial;">' +
         _Fonte + ', ' + _DT +
         '</span>' + sLineBreak +
         '</span><br>' + sLineBreak +
         '<table style="width:100%; table-layout:fixed;">' + sLineBreak +
         '<tr>' + sLineBreak +
         '<td style="width:50%; vertical-align:top;">' + sLineBreak +
         '<span style="font-size:12pt; color:navy; font-weight:normal; font-family:Coiny,Tahoma,Verdana,Arial;">' +
         '<br>' +
         _Corpo +
         '</span>' + sLineBreak +
         '</td>' + sLineBreak +
         '<td style="width:50%; vertical-align:top;">' + sLineBreak +
         '<img src="' + _Imagem + '" style="width:100%;">' + sLineBreak +
         '</td>' + sLineBreak +
         '</tr>' + sLineBreak +
         '</table>' + sLineBreak +
         '</body>' + sLineBreak +
         '</html>' ;
FN := RSS_SERVIDOR + 'Database\Config\Temp\' + Sys_Usuario_Aplicativo.Usuario + '.html' ;
CHECAR_DIRETORIO_FILENAME ( FN ) ;
WRITE_FILE_CORE ( 'RSS_PREPARAR_URL', FN, _HTML, DELAYED_FALSE ) ;
PUT_LOG ( 'WB Navigate [' + FN + ']' ) ;
RSS_WB.Navigate ( 'file://' + FN ) ;
End ;

procedure TRSS.RSS_SG_Click(Sender: TObject);
Var SG : TStringGrid ;
begin
SG := (Sender AS TStringGrid) ;
RSS_PREPARAR_URL ( SG ) ;
end;

procedure TRSS.RSS_SG_DblClick(Sender: TObject);
Var SG : TStringGrid ;
begin
SG := (Sender AS TStringGrid) ;
OPEN_URL ( SG.Cells[RSS_SG_LINK, SG.Row] ) ;
end;

procedure TRSS.RSS_ATUALIZAR ;
Begin
PUT_LOG ( 'RSS_ATUALIZAR' ) ;
RSS_LOAD_FULL_URL ;
End ;

End.

