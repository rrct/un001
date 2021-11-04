unit T_TImagem;

interface

uses Vcl.ExtCtrls, SysUtils, Vcl.StdCtrls, System.UITypes;

 type
   TImagem = class(TImage)
   private
     //FLabelCount: TLabel;
     FClickCount: integer;
     //FN_Full : String ;
     //FN_Short : String ;
     //FN_Ext : String ;
     //FN_DT : TDateTime ;
   public
     ID ,
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
     property ClickCount: integer read FClickCount;
     procedure Click; override;
   end;

 implementation


Procedure TImagem.Click ;
Begin
Inc(FClickCount);
Inherited ;
End ;

End.

