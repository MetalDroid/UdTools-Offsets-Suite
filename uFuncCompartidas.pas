unit uFuncCompartidas;

interface

uses
  System.SysUtils, Winapi.Windows, System.Classes;

Function FileToStr(mFile: String): String;
Function StrToFile(Str, Ruta: String): Boolean;
Procedure ErrorLog(Errores: TStringList; mFile: String);

implementation

uses
  uUOS;

// Guarda Log en caso de errores
procedure ErrorLog(Errores: TStringList; mFile: String);
begin
  Errores.SaveToFile(mFile);
end;

// Función para almacenar los bytes del fichero en una cadena
Function FileToStr(mFile: String): String;
var
  hFile: THandle;
  dwRet: DWORD;
  iSize: DWORD;
  Buff: AnsiString;
begin
  hFile:= CreateFile(PChar(mFile), GENERIC_READ, FILE_SHARE_READ, nil, OPEN_EXISTING,
    FILE_ATTRIBUTE_NORMAL, 0);
  if hFile = INVALID_HANDLE_VALUE then
    Exit;
  iSize:= GetFileSize(hFile, nil);
  SetFilePointer(hFile, 0, nil, FILE_BEGIN);
  SetLength(Buff, iSize);
  ReadFile(hFile, Buff[1], iSize, dwRet, nil);
  CloseHandle(hFile);
  Result:= WiDeString(Buff);
end;

// Función para crear ficheros a partir de una cadena
Function StrToFile(Str, Ruta: String): Boolean;
var
  hFile: THandle;
  iSize: DWORD;
  dwRet: DWORD;
  Buff: AnsiString;
begin
  Result:= False;
  Buff:= AnsiString(Str);
  iSize:= Length(Buff);
  hFile:= CreateFile(PChar(Ruta), GENERIC_WRITE, FILE_SHARE_READ, nil, OPEN_ALWAYS,
    FILE_ATTRIBUTE_NORMAL, 0);
  if (WriteFile(hFile, Buff[1], iSize, dwRet, nil) = True) then
    Result:= True;
  CloseHandle(hFile);
end;

end.
