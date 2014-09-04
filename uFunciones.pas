unit uFunciones;

interface

uses
  Winapi.Windows, System.SysUtils, Vcl.Forms;

Function AvFucker(Fichero, RutaOffsets: string;
  Inicio, Fin, Bytes: Integer; RellenarCon: string): boolean;

implementation

uses
  uUOS;

type
tArrBytes = array of byte;

Function AvFucker(Fichero, RutaOffsets: string;
  Inicio, Fin, Bytes: Integer; RellenarCon: string): boolean;
var
  o, Rell, Tam: Integer;
  Aux, Aux2, OffIni, sBytes: string;
  dwRet: DWORD;
  hFile: THandle;
  iSize: Integer;
  bWrite: tArrBytes;
begin
  Result:= False;
  Aux2 := Fichero;
  hFile := CreateFile(PChar(Fichero), GENERIC_READ, FILE_SHARE_READ, nil,
    OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0);
  if hFile = INVALID_HANDLE_VALUE then
    Exit;

  iSize := GetFileSize(hFile, nil);
  SetFilePointer(hFile, 0, nil, FILE_BEGIN);
  SetLength(Fichero, iSize);
  ReadFile(hFile, Fichero[1], iSize, dwRet, nil);
  CloseHandle(hFile);

  Rell:= strtoint( '$' + RellenarCon);
  Tam := Length(Fichero) - 1;

  If Fin > Tam then
    Exit;

  Repeat
    Aux := Fichero;
    if Inicio + Bytes <= Tam then
      for o := Inicio to Inicio + Bytes - 1 do
        Aux[o + 1] := chr(Rell)
    else
      for o := Inicio to (Inicio + (Tam - Inicio)) do
        Aux[o + 1] := chr(Rell);

    OffIni:= inttostr(Inicio);
    sBytes:= inttostr(Bytes);

    SetLength(bWrite, Length(Fichero));
    copymemory(@bWrite[0], @Fichero[1], Length(Fichero));

    iSize := Length(bWrite);
    hFile := CreateFile(PChar(RutaOffsets + '\' + OffIni + '_' + sBytes +
      ExtractFileExt(Aux2)), GENERIC_WRITE, FILE_SHARE_READ, nil,
      OPEN_ALWAYS, FILE_ATTRIBUTE_NORMAL, 0);

    Form1.Estado.SimpleText:= 'Procesando fichero: ' + OffIni + '_' + sBytes +
      ExtractFileExt(Aux2);
    Application.ProcessMessages;

    if (WriteFile(hFile, bWrite[0], iSize, dwRet, nil) = True) then
      Result:= True;

    CloseHandle(hFile);

    inc(Inicio, Bytes);
  until Inicio > Fin;
  form1.estado.simpletext:= 'Proceso terminado.'
end;

end.
