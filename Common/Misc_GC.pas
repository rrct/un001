unit Misc_GC;

interface

Uses Misc_Const_U, Misc_Def_U, Misc_Type_U,
     //RXCtrls ,
     RSS_U,
     {$IFDEF NW}
     CCH_U,
     {$ENDIF}
     GC_U,
     Espelho_RD_U, Espelho_RD_Def_U,
     MyRichEdit_U, RichEdit, IniFiles,
     //RxRichEd,
     ShellAPI,
     Winapi.Windows, Winapi.Messages,
     System.Threading,
     SysUtils, Classes,
     Graphics, Controls, Forms, Dialogs,
     Grids, StdCtrls, Buttons, ComCtrls,
     Menus, Mask,
     //RXSpin,
     ExtCtrls, Spin, WinSock,
     Gauges,
     //RxCalc, RxGrdCpt,
     ImgList,
     //RxMenus,
     AppEvnts,
     //RXSlider,
     DB, DBGrids, ToolWin, Vcl.Imaging.pngimage,
     OleCtrls, SHDocVw, IdBaseComponent, IdCoder,
     ScktComp,
     //RxDualList,
     System.ImageList,
     //RxSpeedBar,
     FireDAC.Stan.Intf,
     FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
     FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
     FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys,
     FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef, FireDAC.Comp.Client,
     FireDAC.Comp.DataSet,
     //RxToolEdit,
     IdComponent, IdTCPConnection, IdTCPClient,
     IdCmdTCPClient, WMPLib_TLB, FireDAC.VCLUI.Wait, Vcl.ExtDlgs,
     Vcl.WinXCalendars ;

Implementation

Uses Misc_U,
     Misc_1,
     Printers ;

End.
