unit T_TImage;

interface

uses Vcl.ExtCtrls, SysUtils;

 type
   TImage = class(Vcl.ExtCtrls.TImage)
   private
     //FLabelCount: TLabel;
   public
     FClickCount: integer;
     FN_Full : String ;
     FN_Short : String ;
     FN_Ext : String ;
     FN_DT : TDateTime ;
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
     //property LabelCount: TLabel read FLabelCount write FLabelCount;
     property ClickCount: integer read FClickCount;
     procedure Click; override;
   end;

 implementation


Procedure TImage.Click ;
Begin
Inc(FClickCount);
//if assigned(FLabelCount) then
//   FLabelCount.Caption := FClickCount.ToString ;
Inherited ;
End ;

End.

