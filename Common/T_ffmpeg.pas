Unit T_ffmpeg ;

Interface

Uses Vcl.ExtCtrls, Vcl.Dialogs,
     Winapi.Windows, SysUtils, System.Classes ;

Type

   T_Info_Media_FFMPEG = Record
        FN : String ;
        Duracao : LongInt ;
        End ;
   Tffmpeg = Class(Vcl.ExtCtrls.TPanel)
   Private
     //FLabelCount: TLabel;
     //FClickCount: integer;
     //FN_Full : String ;
     //FN_Short : String ;
     //FN_Ext : String ;
     //FN_DT : TDateTime ;
   Public
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
     FN_IN ,
     FN_OUT : String ;
     Log_FF : TStringList ;
     Diretorio_App : String ;
     Dir_Compartilhamento : String ;
     FN_Log_FFMPEG : String ;
     Info_FFMPEG : T_Info_Media_FFMPEG ;
     Timer_Atual ,
     Timer_Old   : String ;
     Timer_Cnt_Iguais : LongInt ;
     Tipo_Conclusao : LongInt ;
     Tick_Start_FFMPEG : TDateTime ;
     FFMPEG_EXE : String ;
     Retorno_Get_Duracao : String ;
     Retorno_Get_Andamento : String ;
     Last_Log_Lido : String ;
     Log_Diferente : Boolean ;
     Tick_Last_Mensagem_FF : Cardinal ;
     //property LabelCount: TLabel read FLabelCount write FLabelCount;
     Function IMPORTAR_VIDEO ( _IN, Path_Out, Formato : String ;
                               Largura : LongInt ) : Boolean ;
     Function GERAR_MXF_BAIXA ( _IN, Path_Out : String ) : Boolean ;
     Function GET_CONTEUDO_TAG ( Tag, Full : String ; Inicio, Tamanho : LongInt ;
                                 Var Resultado : String ; Aux1, Aux2 : String ) : Boolean ;
     Function xGET_DIR_AVI : String ;
     Function IS_LINHA_FINALIZACAO_FFMPEG ( Aux : String ) : Boolean ;
     Function GET_LOG_FFMPEG ( FN : String ) : String ;
     Function GET_DURACAO : LongInt ;
     Function GET_ANDAMENTO : LongInt ;
     Constructor Create ( Dono : TComponent ;  _Dir_App, _Dir_Compartilhamento : String ) ;
   End ;

Implementation

Uses Misc_U ;

Constructor Tffmpeg.Create ( Dono : TComponent ; _Dir_App, _Dir_Compartilhamento : String ) ;
Begin
Inherited Create ( Dono ) ;
Timer_Cnt_Iguais := 0 ;
Diretorio_App := _Dir_App ;
Dir_Compartilhamento := _Dir_Compartilhamento ;
Log_FF := TStringList.Create ;
Last_Log_Lido := '' ;
Log_FF.Clear ;
Tick_Last_Mensagem_FF := 0 ;
Tick_Start_FFMPEG := 0 ;
FFMPEG_EXE := Diretorio_App + 'ffmpeg\bin\ffmpeg.exe' ;
If NOT RR_FileExists ( 'Tffmpeg.Create ', FFMPEG_EXE ) Then
   Begin
   ShowMessage ( 'O arquivo ' + FFMPEG_EXE + ' não foi encontrado' + LFLF +
                 'Verifique a instalação do pacote FFMPEG' ) ;
   End ;
End ;

(*
ffmpeg version N-86330-gbd1179e Copyright (c) 2000-2017 the FFmpeg developers
  built with gcc 7.1.0 (GCC)
  configuration: --enable-gpl --enable-version3 --enable-cuda --enable-cuvid --enable-d3d11va --enable-dxva2 --enable-libmfx --enable-nvenc --enable-avisynth --enable-bzlib --enable-fontconfig --enable-frei0r --enable-gnutls --enable-iconv --enable-libass --enable-libbluray --enable-libbs2b --enable-libcaca --enable-libfreetype --enable-libgme --enable-libgsm --enable-libilbc --enable-libmodplug --enable-libmp3lame --enable-libopencore-amrnb --enable-libopencore-amrwb --enable-libopenh264 --enable-libopenjpeg --enable-libopus --enable-librtmp --enable-libsnappy --enable-libsoxr --enable-libspeex --enable-libtheora --enable-libtwolame --enable-libvidstab --enable-libvo-amrwbenc --enable-libvorbis --enable-libvpx --enable-libwavpack --enable-libwebp --enable-libx264 --enable-libx265 --enable-libxavs --enable-libxvid --enable-libzimg --enable-lzma --enable-zlib
  libavutil      55. 63.100 / 55. 63.100
  libavcodec     57. 96.101 / 57. 96.101
  libavformat    57. 72.101 / 57. 72.101
  libavdevice    57.  7.100 / 57.  7.100
  libavfilter     6. 90.100 /  6. 90.100
  libswscale      4.  7.101 /  4.  7.101
  libswresample   2.  8.100 /  2.  8.100
  libpostproc    54.  6.100 / 54.  6.100
Guessed Channel Layout for Input Stream #0.1 : mono
Guessed Channel Layout for Input Stream #0.2 : mono
Input #0, mxf, from 'C:\Users\Ricardo\Desktop\GDT\393970_1.mxf':
  Metadata:
    uid             : 893b11c3-0537-11e8-a9e5-847bebe54a17
    generation_uid  : 893b11c4-0537-11e8-a1dd-847bebe54a17
    company_name    : Adobe Systems Incorporated
    product_name    : Premiere Pro
    product_version : 9.0.0
    application_platform: win32
    product_uid     : 10ab07a9-e89e-7510-a923-ea9220524153
    modification_date: 2018-01-29T21:01:11.000000Z
    material_package_umid: 0x060A2B340101010501010D111300000035AB820447810583F841847BEBE54A17
    timecode        : 00:00:00;00
  Duration: 00:00:10.14, start: 0.000000, bitrate: 51761 kb/s
    Stream #0:0: Video: mpeg2video (4:2:2), yuv422p(tv, unknown/bt709/bt709, top first), 1920x1080 [SAR 1:1 DAR 16:9], 50000 kb/s, 29.97 fps, 29.97 tbr, 29.97 tbn, 59.94 tbc
    Metadata:
      file_package_umid: 0x060A2B340101010501010D12139C70F533AB820447810583E45F847BEBE54A17
      file_package_name: Source Package
      track_name      : Track 1
    Stream #0:1: Audio: pcm_s24le, 48000 Hz, mono, s32 (24 bit), 1152 kb/s
    Metadata:
      file_package_umid: 0x060A2B340101010501010D12139C70F533AB820447810583E45F847BEBE54A17
      file_package_name: Source Package
      track_name      : Track 2
    Stream #0:2: Audio: pcm_s24le, 48000 Hz, mono, s32 (24 bit), 1152 kb/s
    Metadata:
      file_package_umid: 0x060A2B340101010501010D12139C70F533AB820447810583E45F847BEBE54A17
      file_package_name: Source Package
      track_name      : Track 3
Stream mapping:
  Stream #0:0 -> #0:0 (mpeg2video (native) -> msmpeg4v3 (msmpeg4))
  Stream #0:1 -> #0:1 (pcm_s24le (native) -> wmav2 (native))
Press [q] to stop, [?] for help
Output #0, asf, to 'C:\Users\Ricardo\Desktop\GDT\393970_1_AJUSTADO_wmv.wmv':
  Metadata:
    uid             : 893b11c3-0537-11e8-a9e5-847bebe54a17
    generation_uid  : 893b11c4-0537-11e8-a1dd-847bebe54a17
    company_name    : Adobe Systems Incorporated
    product_name    : Premiere Pro
    product_version : 9.0.0
    application_platform: win32
    product_uid     : 10ab07a9-e89e-7510-a923-ea9220524153
    modification_date: 2018-01-29T21:01:11.000000Z
    material_package_umid: 0x060A2B340101010501010D111300000035AB820447810583F841847BEBE54A17
    timecode        : 00:00:00;00
    WM/EncodingSettings: Lavf57.72.101
    Stream #0:0: Video: msmpeg4v3 (msmpeg4) (MP43 / 0x3334504D), yuv420p, 480x270 [SAR 1:1 DAR 16:9], q=2-31, 200 kb/s, 29.97 fps, 1k tbn, 29.97 tbc
    Metadata:
      file_package_umid: 0x060A2B340101010501010D12139C70F533AB820447810583E45F847BEBE54A17
      file_package_name: Source Package
      track_name      : Track 1
      encoder         : Lavc57.96.101 msmpeg4
    Side data:
      cpb: bitrate max/min/avg: 0/0/200000 buffer size: 0 vbv_delay: -1
    Stream #0:1: Audio: wmav2 (a[1][0][0] / 0x0161), 48000 Hz, mono, fltp (24 bit), 128 kb/s
    Metadata:
      file_package_umid: 0x060A2B340101010501010D12139C70F533AB820447810583E45F847BEBE54A17
      file_package_name: Source Package
      track_name      : Track 2
      encoder         : Lavc57.96.101 wmav2
frame=   53 fps=0.0 q=28.2 size=     170kB time=00:00:01.75 bitrate= 797.7kbits/s speed=3.45x
frame=  107 fps=105 q=20.3 size=     267kB time=00:00:03.54 bitrate= 618.2kbits/s speed=3.49x
frame=  169 fps=111 q=22.5 size=     370kB time=00:00:05.60 bitrate= 541.2kbits/s speed=3.69x
frame=  223 fps=110 q=31.0 size=     449kB time=00:00:07.42 bitrate= 494.9kbits/s speed=3.66x
frame=  278 fps=110 q=23.6 size=     524kB time=00:00:09.25 bitrate= 463.3kbits/s speed=3.66x
frame=  304 fps=109 q=17.1 Lsize=     571kB time=00:00:10.11 bitrate= 462.2kbits/s speed=3.61x
video:377kB audio:159kB subtitle:0kB other streams:0kB global headers:0kB muxing overhead: 6.597104%
*)

Function Tffmpeg.GET_CONTEUDO_TAG ( Tag, Full : String ; Inicio, Tamanho : LongInt ;
                                    Var Resultado : String ; Aux1, Aux2 : String ) : Boolean ;
Var Posicao : LongInt ;
Begin
{
  Duration: 00:00:10.14, start: 0.000000, bitrate: 51761 kb/s
}
Result := FALSE ;
Try
   //Tag := Super_UpperCase ( Tag ) ;
   //Full := Super_UpperCase ( Full ) ;
   Posicao := Pos ( Tag, Full ) ;
   If Posicao = 0 Then
      Exit ;
   If Aux1 <> '' Then
      If Pos ( Aux1, Full ) = 0 Then
         Exit ;
   If Aux2 <> '' Then
      If Pos ( Aux2, Full ) = 0 Then
         Exit ;
   Resultado := Copy ( Full, Posicao + Length(Tag) + Inicio, Tamanho ) ;
   Result := TRUE ;
   Except
   On E : Exception Do
      Begin
      PUT_LOG ( 'Exception Tffmpeg.GET_CONTEUDO_TAG [' + E.Message + ']' ) ;
      End ;
   End ;
End ;

Function Tffmpeg.GET_DURACAO : LongInt ;
Var Qtde      : LongInt ;
    Local     : LongInt ;
    Aux       : String ;
    Resultado : String ;
Begin
// Duration: 00:00:10.14, start: 0.000000, bitrate: 51761 kb/s
Result := 0 ;
Try
   If Log_FF = Nil Then
      Exit ;
   Qtde := Log_FF.Count ;
   If Qtde < 5 Then
      Exit ;
   For Local := 0 To Qtde - 1 Do
      Begin
      Aux := Log_FF[Local] ;
      If NOT GET_CONTEUDO_TAG ( 'Duration: ', Aux, 0, 11, Resultado, 'start:', 'bitrate:' ) Then
         Continue ;
      //PUT_LOG ( 'FIND FFMPEG Duração Bruta [' + Resultado + ']' ) ;
      If Length(Resultado) <> 11 Then
         Continue ;
      Result := CONVERSAO_HHMMSS_SS_TO_MS ( Resultado, Retorno_Get_Andamento ) ;
      //PUT_LOG ( 'FIND FFMPEG duração inteira [' + IntToStr(Result) + ']' ) ;
      Break ;
      End ;
   Except
   On E : Exception Do
      Begin
      PUT_LOG ( 'Exception Tffmpeg.GET_DURACAO [' + E.Message + ']' ) ;
      End ;
   End ;
End ;

Function Tffmpeg.GET_ANDAMENTO : LongInt ;
Var Qtde      : LongInt ;
    Local     : LongInt ;
    Aux       : String ;
    Resultado : String ;
Begin
// frame=18108 fps=125 q=14.7 size=   26274kB time=00:10:04.17 bitrate= 356.2kbits/s speed=4.16x
Result := 0 ;
Try
   If Log_FF = Nil Then
      Exit ;
   Qtde := Log_FF.Count ;
   If Qtde < 5 Then
      Exit ;
   For Local := Qtde - 1 DownTo 0 Do
      Begin
      Aux := Log_FF[Local] ;
      If NOT GET_CONTEUDO_TAG ( 'time=', Aux, 0, 11, Resultado, 'bitrate=', 'speed=' ) Then
         Continue ;
      //PUT_LOG ( 'FIND FFMPEG andamento bruto [' + Resultado + ']' ) ;
      If Length(Resultado) <> 11 Then
         Continue ;
      Result := CONVERSAO_HHMMSS_SS_TO_MS ( Resultado, Retorno_Get_Duracao ) ;
      //PUT_LOG ( 'FIND FFMPEG andamento inteiro [' + IntToStr(Result) + ']' ) ;
      Break ;
      End ;
   Except
   On E : Exception Do
      Begin
      PUT_LOG ( 'Exception Tffmpeg.GET_ANDAMENTO [' + E.Message + ']' ) ;
      End ;
   End ;
End ;

Function Tffmpeg.xGET_DIR_AVI : String ;
Begin
Result := INSERE_BARRA ( Dir_Compartilhamento ) + 'avi\' ;
End ;

Function Tffmpeg.GET_LOG_FFMPEG ( FN : String ) : String ;
Var FN_Temp : String ;
    Qtde    : LongInt ;
    Indice  : LongInt ;
Begin
Result := '@@@' + 'INDEF' ;
Log_FF.Clear ;
Log_Diferente := FALSE ;
Try
   If RR_FileExists ( 'GET LOG_FFMPEG/1', FN ) Then
      Begin
      Indice := 0 ;
      Repeat
         Inc ( Indice ) ;
         FN_Temp := Diretorio_App + 'Config\Log_' + StrZero(Indice,6) + '.temp' ;
         Until NOT RR_FileExists ( 'GET LOG_FFMPEG/2', FN_Temp ) ;
      //PUT_LOG ( 'Carregando Log ['  + FN_Temp + ']' ) ;
      CopiaArquivo ( 'GET LOG_FFMPEG',
                     FN, FN_Temp, TRUE ) ;
      Log_FF.Text := GET_CONTEUDO_M ( 'GET_LOG_FFMPEG', FN_Temp ) ;
      If Last_Log_Lido <> Log_FF.Text Then
         Log_Diferente := TRUE ;
      Last_Log_Lido := Log_FF.Text ;
      //If RR_DeleteFile ( 'GET_LOG_FFMPEG', FN_Temp ) Then ;
      Qtde := Log_FF.Count ;
      If Qtde > 0 Then
         Begin
         Result := '###' + Log_FF[Qtde-1] ;
         End
         Else
         Begin
         Result := '@@@' + 'QTDE=0/' + FN ;
         End ;
      End
      Else
      Begin
      PUT_LOG ( 'Log Ausente['  + FN + ']' ) ;
      Result := '@@@' + 'FILE_NOT_FOUND/' + FN ;
      End ;
   Except
   On E : Exception Do
      Begin
      PUT_LOG ( 'Exception READ_LOG ['  + FN + '][' + E.Message + ']' ) ;
      Result := '@@@' + 'Exception/E.Message' ;
      End ;
   End ;
End ;

Function Tffmpeg.IMPORTAR_VIDEO ( _IN, Path_Out, Formato : String ;
                                  Largura : LongInt ) : Boolean ;
Var //FN_Temp  : String ;
    Comando  : String ;
    Dir      : String ;
Begin
Result := FALSE ;
Try
   If NOT RR_FileExists ( 'IMPORTAR VIDEO', _IN ) Then Begin
      Exit ;
   End ;
   FN_IN := _IN ;
   PUT_LOG ( 'OpenDialog/Import [' + FN_IN + ']' ) ;
   If Path_Out = '' Then Begin
      Dir := INSERE_BARRA ( ExtractFilePath(FN_IN) )
   End Else Begin
      Dir := INSERE_BARRA ( Path_Out ) ;
      CHECAR_DIRETORIO_DIRNAME ( Dir ) ;
   End ;
   FN_OUT := Copy ( ExtractFileName(FN_IN), 1, Length(ExtractFileName(FN_IN))-4 ) ;
   //FN_Temp := Dir + FN_OUT + '_temp_' + Formato + '.' + Formato ;
   If RR_DeleteFile ( 'IMPORTAR_VIDEO/1', Dir + FN_OUT + '_AJUSTADO_avi.avi' ) Then ;
   If RR_DeleteFile ( 'IMPORTAR_VIDEO/2', Dir + FN_OUT + '_AJUSTADO_wmv.wmv' ) Then ;
   If RR_DeleteFile ( 'IMPORTAR_VIDEO/3', Dir + FN_OUT + '_AJUSTADO_avi.avi' ) Then ;
   If RR_DeleteFile ( 'IMPORTAR_VIDEO/4', Dir + FN_OUT + '_AJUSTADO_m4v.m4v' ) Then ;
   If RR_DeleteFile ( 'IMPORTAR_VIDEO/5', Dir + FN_OUT + '_AJUSTADO_mp4.mp4' ) Then ;
   If RR_DeleteFile ( 'IMPORTAR_VIDEO/6', Dir + FN_OUT + '_IMPORTADO.avi' ) Then ;
   If RR_DeleteFile ( 'IMPORTAR_VIDEO/7', Dir + FN_OUT + '_IMPORTADO.wmv' ) Then ;
   If RR_DeleteFile ( 'IMPORTAR_VIDEO/8', Dir + FN_OUT + '_IMPORTADO.avi' ) Then ;
   If RR_DeleteFile ( 'IMPORTAR_VIDEO/9', Dir + FN_OUT + '_IMPORTADO.m4v' ) Then ;
   If RR_DeleteFile ( 'IMPORTAR_VIDEO/10', Dir + FN_OUT + '_IMPORTADOmp4' ) Then ;
   //FN_OUT := Dir_Compartilhamento + FN_OUT + '_AJUSTADO_' + Formato + '.' + Formato ;
   FN_OUT := SysUtils.StringReplace ( FN_OUT, '_IMPORTADO', '', [rfReplaceAll] ) ;
   FN_OUT := SysUtils.StringReplace ( FN_OUT, '_IMPORTADO', '', [rfReplaceAll] ) ;
   FN_OUT := SysUtils.StringReplace ( FN_OUT, '_IMPORTADO', '', [rfReplaceAll] ) ;
   FN_OUT := SysUtils.StringReplace ( FN_OUT, '_IMPORTADO', '', [rfReplaceAll] ) ;
   FN_OUT := SysUtils.StringReplace ( FN_OUT, '_IMPORTADO', '', [rfReplaceAll] ) ;
   FN_OUT := Dir + FN_OUT + '_IMPORTADO.' + Formato ;
   FN_Log_FFMPEG := Diretorio_App + 'Config\log_ffmpeg\' + DATAHORA_INVERSA(Now) + '_log_ffmpeg_importacao.txt' ;
   CHECAR_DIRETORIO_FILENAME ( FN_Log_FFMPEG ) ;
   Comando := FFMPEG_EXE + ' -y -i ' + '"' + FN_IN + '"' + ' ' +
              '-vf scale=' + IntToStr(Largura) + ':' + InttoStr(TRUNC(Largura/1.777777777+0.01)) + ' ' +
              '"' + FN_OUT + '"' + ' ' +
              '2> ' + '"' +  FN_Log_FFMPEG + '"' ;
   PUT_LOG ( 'LOG FFPMEG IMPORTACAO ['  + FN_Log_FFMPEG + ']' ) ;
   PUT_LOG ( Comando ) ;
   //ShowMessage ( Comando ) ;
   ExecuteAndWait ( Comando ) ;
   Result := TRUE ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception Tffmpeg.IMPORTAR_VIDEO [' + E.Message + ']' ) ;
   End ;
End ;
End ;

Function Tffmpeg.GERAR_MXF_BAIXA ( _IN, Path_Out : String ) : Boolean ;
Var //FN_Temp  : String ;
    Comando  : String ;
    Dir      : String ;
Begin
Result := FALSE ;
Try
   If NOT RR_FileExists ( 'GERAR MXF_BAIXA', _IN ) Then Begin
      Exit ;
   End ;
   FN_IN := _IN ;
   PUT_LOG ( 'OpenDialog/Gerar_MXF_Baixa [' + FN_IN + ']' ) ;
   If Path_Out = '' Then Begin
      Dir := INSERE_BARRA ( ExtractFilePath(FN_IN) )
   End Else Begin
      Dir := INSERE_BARRA ( Path_Out ) ;
      CHECAR_DIRETORIO_DIRNAME ( Dir ) ;
   End ;
   FN_OUT := Copy ( ExtractFileName(FN_IN), 1, Length(ExtractFileName(FN_IN))-4 ) ;
   //FN_Temp := Dir + FN_OUT + '_temp_MXF.MXF' ;
   FN_OUT := SysUtils.StringReplace ( FN_OUT, '_IMPORTADO', '', [rfReplaceAll] ) ;
   FN_OUT := Dir + FN_OUT + '_IMPORTADO.MXF' ;
   FN_Log_FFMPEG := Diretorio_App + 'Config\log_ffmpeg\' + DATAHORA_INVERSA(Now) + '_log_ffmpeg_mxf_baixa.txt' ;
   CHECAR_DIRETORIO_FILENAME ( FN_Log_FFMPEG ) ;
   Comando := FFMPEG_EXE + ' -y -i ' + '"' + FN_IN + '"' + ' ' +
              '-vcodec mpeg2video -acodec pcm_s16le -ar 48000 -ac 2' + ' ' +
              '"' + FN_OUT + '"' + ' ' +
              '2> ' + '"' + FN_Log_FFMPEG + '"' ;
   PUT_LOG ( 'LOG FFPMEG MXF_BAIXA ['  + FN_Log_FFMPEG + ']' ) ;
   PUT_LOG ( Comando ) ;
   ExecuteAndWait ( Comando ) ;
   Result := TRUE ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception Tffmpeg.GERAR_MXF_BAIXA [' + E.Message + ']' ) ;
   End ;
End ;
End ;

Function Tffmpeg.IS_LINHA_FINALIZACAO_FFMPEG ( Aux : String ) : Boolean ;
Begin
Result := FALSE ;
Try
   Aux := UpperCase ( Aux ) ;
   {
   [aac @ 0000000002e628c0] Qavg: 299.511
   }
   If ( Pos ( '[AAC @', Aux ) > 0 ) AND
      ( Pos ( 'QAVG:', Aux ) > 0 ) Then Begin
      Tipo_Conclusao := 1 ; // 1=Finalização OK
      Result := TRUE ;
      Exit ;
   End ;
   If ( Pos ( 'VIDEO:', Aux ) > 0 ) AND
      ( Pos ( 'AUDIO:', Aux ) > 0 ) AND
      ( Pos ( 'SUBTITLE:', Aux ) > 0 ) Then Begin
      Tipo_Conclusao := 1 ; // 1=Finalização OK
      Result := TRUE ;
      Exit ;
   End ;
   If ( Pos ( 'EXITING NORMALLY, RECEIVED SIGNAL 15.', Aux ) > 0 ) Then Begin
      If GetTickCount > Tick_Last_Mensagem_FF Then Begin
         Tick_Last_Mensagem_FF := GetTickCount + 5000 ;
         ShowMessage ( 'O processo foi cancelado.' ) ;
      End ;
      Tipo_Conclusao := 2 ; // 2=Interrompida/Abortada
      Result := TRUE ;
      Exit ;
   End ;
   If ( Pos ( UpperCase('Permission denied'), Aux ) > 0 ) Then Begin
      If GetTickCount > Tick_Last_Mensagem_FF Then Begin
         Tick_Last_Mensagem_FF := GetTickCount + 5000 ;
         ShowMessage ( 'O acesso ao arquivo foi negado.' + LFLF +
                       'Verifique se está sendo utilizado por outro programa.' ) ;
      End ;
      Tipo_Conclusao := 3 ; // 2=Permissão Negada
      Result := TRUE ;
      Exit ;
   End ;
   Tipo_Conclusao := 0 ;
   Result := FALSE ;
Except
   On E : Exception Do Begin
      PUT_LOG ( 'Exception Tffmpeg.IS_LINHA_FINALIZACAO_FFMPEG [' + E.Message + ']' ) ;
   End ;
End ;
End ;

End.

