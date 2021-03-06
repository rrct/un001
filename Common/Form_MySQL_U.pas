Unit Form_MySQL_U ;

Interface

Uses
  Misc_Def_U, Misc_Const_U, Misc_Type_U,
  Winapi.Windows, Winapi.Messages, System.SysUtils,
  System.Variants, System.Classes, Vcl.Graphics,
  Misc_U,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Phys.MySQLDef,
  FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys,
  FireDAC.Phys.MySQL, Data.DB, FireDAC.Comp.Client, FireDAC.Comp.DataSet,
  FireDAC.VCLUI.Wait ;

Type
  TForm_MySQL = class(TForm)
    FDConnection1: TFDConnection;
  Private
    { Private declarations }
  Public
    { Public declarations }
  End ;

Var Form_MySQL : TForm_MySQL ;

Procedure CONEXAO_MYSQL ( Host, Alias : String ) ;

Implementation

{$R *.dfm}

Procedure CARREGAR_LINHA_INTERPOLACAO ( Linha : String ) ;
Var //Resumo     : String ;
    //ID         : LongInt;
    //Query      : String ;
    FDQuery    : TFDQuery ;
    //Tick       : Cardinal ;
    //Indice     : LongInt ;
    //Local      : LongInt ;
    //Local2     : LongInt ;
    Qtde       : LongInt ;
    //Distancia  : Double ;
    //Percentual : Double ;
    Contador   : LongInt ;
Begin
PUT_LOG ( 'INI CARREGAR_LINHA_INTERPOLACAO' ) ;
FDQuery := TFDQuery.Create( Form_MySQL ) ;
FDQuery.Connection := Form_MySQL.FDConnection1 ;
//Indice := 0 ;
Contador := 0 ;
//PUT_LOG ( 'INI CARREGAR_AGENDAS DB [' + Origem + ']' ) ;
Try
   FDQuery.Close ;
   FDQuery.ResourceOptions.ParamCreate := FALSE ;
   FDQuery.SQL.Text := 'SELECT * ' +
                       'FROM vlt.t_linha_interpolada ' +
                       'WHERE c_linha=' + STR_SQL(Linha) + ' ' +
                       'ORDER BY c_linha ASC, c_indice ASC' ;
   PUT_LOG ( 'Query CARREGAR_LINHA_INTERPOLACAO [' + FDQuery.SQL.Text + ']' ) ;
   FDQuery.Open ;
   //ShowMessage ( IntToStr ( FDQuery.RecordCount ) ) ;
   Qtde := FDQuery.RecordCount ;
   If Qtde >  0 Then
      PUT_LOG ( 'Qtde: ' + IntToStr ( Qtde ) ) ;
   If Qtde = 0 Then
      Begin
      PUT_LOG ( 'CARREGAR_LINHA_INTERPOLACAO/Nenhum perfil de agenda encontrado no banco de dados' ) ;
      FDQuery.Close ;
      FDQuery.Free ;
      Exit ;
      End;
   FDQuery.First ;
   While NOT FDQuery.Eof Do
      Begin
      Inc ( Contador ) ;
      //TEMP.Y := FDQuery.FieldByName('c_latitude').AsFloat ;
      FDQuery.Next ;
      End ;
   PUT_LOG ( 'Contador de registros lidos: ' + IntToStr ( Contador ) ) ;
   FDQuery.Close ;
   //ShowMessage ( Aux ) ;
   Except
   On E : Exception Do
      Begin
      PUT_LOG ( 'Query Except CARREGAR_AGENDAS DB [' + E.Message + ']' ) ;
      End ;
   End ;
FDQuery.Free ;
PUT_LOG ( 'FIM CARREGAR_LINHA_INTERPOLACAO' ) ;
End ;

Function GET_CAMPO_TABELA ( Origem, Tabela, Campo, Condicao, Complemento : String ) : String ;
Var Query    : String ;
    FDQuery  : TFDQuery ;
Begin
Query := 'SELECT ' + Campo + ' ' +
         'FROM ' + tabela + ' ' +
         'WHERE ' + Condicao + ' ' +
         Complemento + ' ' +
         'LIMIT 1' ;
FDQuery := TFDQuery.Create( Form_MySQL ) ;
FDQuery.Connection := Form_MySQL.FDConnection1 ;
PUT_LOG ( 'INI GET_CAMPO_TABELA [' + Origem + ']' ) ;
Try
   FDQuery.Close ;
   FDQuery.ResourceOptions.ParamCreate := FALSE ;
   FDQuery.SQL.Text := Query ;
   PUT_LOG ( 'Query GET_CAMPO_TABELA [' + Query + ']' ) ;
   FDQuery.Open ;
   //ShowMessage ( IntToStr ( FDQuery.RecordCount ) ) ;
   If FDQuery.RecordCount = 0 Then
      Begin
      Result := '' ;
      PUT_LOG ( 'Nenhum perfil de agenda encontrado no banco de dados' ) ;
      FDQuery.Close ;
      FDQuery.Free ;
      Exit ;
      End;
   FDQuery.First ;
   If NOT FDQuery.Eof Then
      Begin
      Result := FDQuery.FieldByName(campo).AsString ;
      End ;
   FDQuery.Close ;
   Except
   On E : Exception Do
      Begin
      PUT_LOG ( 'Query Except GET_CAMPO_TABELA [' + E.Message + ']' ) ;
      End ;
   End ;
FDQuery.Free ;
End ;

Procedure CONEXAO_MYSQL ( Host, Alias : String ) ;
{
Var oDef    : IFDStanConnectionDef ;
    oParams : TFDPhysMSSQLConnectionDefParams ;
}
Begin
// Adding new persistent connection to fdconnectiondefs.ini
{
Try
   FDManager.ConnectionDefs.AddConnectionDef ;
   oDef := FDManager.ConnectionDefs.AddConnectionDef ;
   oDef.Name := cNameConnDef + '_' + Alias ;
   oParams := TFDPhysMSSQLConnectionDefParams(oDef.Params) ;
   oParams.DriverID := 'MySQL' ;
   oParams.Database := 'vlt' ;
   oParams.UserName := 'root' ;
   oParams.Password := 'rr2908BB' ;
   oParams.Server := Host ;
   oParams.OSAuthent := FALSE ;
   oParams.MARS := FALSE ;
   oDef.MarkPersistent ;
   oDef.Apply ;
   Except
   End ;
}
{
Main.FDConnection1.ConnectionString := 'DriverID=' + 'MySQL' + ';' +
                                       'Server=' + Host + ';' +
                                       'Database=' + 'vlt' + ';' +
                                       'Username=' + 'root' + ';' +
                                       'Password=' + 'rr2907BB' + ';' ;
}
Form_MySQL.FDConnection1.DriverName := 'MySQL';
With Form_MySQL.FDConnection1.Params As TFDPhysMySQLConnectionDefParams Do
   Begin
   //Protocol := ipTCPIP;
   Server := Host ;
   Database := 'vlt' ;
   UserName := 'root' ;
   Password := 'rr2908BB' ;
   //OSAuthent := FALSE ;
   //MARS := FALSE ;
   End ;
//Main.FDConnection1.ConnectionDefName := cNameConnDef + '_' + Alias ;
Form_MySQL.FDConnection1.Connected := TRUE ;
End ;

Procedure CONEXAO_MYSQL_OLD ( Host : String ) ;
Var oParams : TStrings ;
Begin
Try
   Form_MySQL.FDConnection1.ConnectionDefName := 'MYSQL_Connection' ;
   oParams := TStringList.Create ;
   oParams.Clear ;
   oParams.Add ( 'Server=' + Host ) ;
   oParams.Add ( 'Port=3306' ) ;
   oParams.Add ( 'DriverID=MySQL' ) ;
   oParams.Add ( 'UserName=root' ) ;
   oParams.Add ( 'Password=rr2908BB' ) ;
   oParams.Add ( 'Compress=TRUE' ) ;
   oParams.Add ( 'Database=vlt' ) ;
   FDManager.AddConnectionDef ( 'MYSQL_Connection', 'MySQL', oParams ) ;
   Form_MySQL.FDConnection1.Connected := TRUE ;
   Except
   End ;
End ;

Procedure EXEC_SQL ( Origem, Query : String ) ;
Var FDQuery  : TFDQuery ;
    FN       : String ;
Begin
FDQuery := TFDQuery.Create( Form_MySQL ) ;
FDQuery.Connection := Form_MySQL.FDConnection1 ;
//PUT_LOG ( 'INI EXECUTE_SQL [' + Origem + ']' , FALSE ) ;
Try
   FDQuery.Close ;
   FDQuery.ResourceOptions.ParamCreate := FALSE ;
   FDQuery.SQL.Text := Query ;
   //PUT_LOG ( '[' + Origem + '] EXEC_SQL [' + Query + ']' ) ;
   FDQuery.ExecSQL ;
   FN := Diretorio + 'Logs/SQL_' + DATA_INVERSA(Now) + '.log' ;
   //APPEND_TEXTO ( FN , DateTimeToStr(Now) + ' ' + Query + CRLF, 1 ) ;
   //ShowMessage ( IntToStr ( FDQuery.RecordCount ) ) ;
   If FDQuery.RowsAffected > 0 Then
      Begin
      //PUT_LOG ( 'Registros afetados /1: ' + IntToStr ( FDQuery.RowsAffected ) ) ;
      FDQuery.Close ;
      //PUT_LOG ( 'Registros afetados /2:' ) ;
      FDQuery.Free ;
      //PUT_LOG ( 'Registros afetados /3:' ) ;
      Exit ;
      End;
   FDQuery.Close ;
   //ShowMessage ( Aux ) ;
   Except
   On E : Exception Do
      Begin
      PUT_LOG ( 'Query Except EXECUTE_SQL [' + E.Message + ']' ) ;
      End ;
   End ;
FDQuery.Free ;
End ;

End.

