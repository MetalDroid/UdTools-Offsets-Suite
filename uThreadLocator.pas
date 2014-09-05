unit uThreadLocator;

interface

uses
  System.Classes, System.SysUtils, Winapi.Windows, Vcl.Forms;

type
  HPrincipal = class(TThread)
  private
    procedure AvFuck;
    procedure Split;
    Procedure AvFucker(Fichero, RutaOffsets: AnsiString; Inicio, Fin, Bytes: Integer; RellenarCon: AnsiString);
    Procedure DSplit(Fichero, RutaOffsets: AnsiString; Inicio, Fin, Bytes: Integer);
    { Private declarations }
  protected
    procedure Execute; override;
  end;

implementation

uses
  uUOS;

type
  tArrBytes = array of byte;

Function FileToStr(mFile: AnsiString): AnsiString;
var
  hFile: THandle;
  dwRet: DWORD;
  iSize: DWORD;
begin
  hFile := CreateFile(PChar(WideString(mFile)), GENERIC_READ, FILE_SHARE_READ,
    nil, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0);
  if hFile = INVALID_HANDLE_VALUE then
    Exit;
  iSize := GetFileSize(hFile, nil);
  SetFilePointer(hFile, 0, nil, FILE_BEGIN);
  SetLength(mFile, iSize);
  ReadFile(hFile, mFile[1], iSize, dwRet, nil);
  CloseHandle(hFile);
  Result := mFile;
end;

Function StrToFile(Str, Ruta: AnsiString): Boolean;
var
  hFile: THandle;
  iSize: Integer;
  bWrite: tArrBytes;
  dwRet: DWORD;
begin
  SetLength(bWrite, Length(Str));
  CopyMemory(@bWrite[0], @Str[1], Length(Str));
  iSize := Length(bWrite);
  hFile := CreateFile(PChar(WideString(Ruta)), GENERIC_WRITE, FILE_SHARE_READ,
    nil, OPEN_ALWAYS, FILE_ATTRIBUTE_NORMAL, 0);
  if (WriteFile(hFile, bWrite[0], iSize, dwRet, nil) = True) then
    Result := True;
  CloseHandle(hFile);
end;

Procedure HPrincipal.AvFucker(Fichero, RutaOffsets: AnsiString;
  Inicio, Fin, Bytes: Integer; RellenarCon: AnsiString);
var
  o, Rell, Tam: Integer;
  Aux, Aux2, OffIni, sBytes: AnsiString;
begin
  Aux2 := Fichero;
  Fichero := FileToStr(Fichero);
  Rell := StrToInt('$' + RellenarCon);
  Tam := Length(Fichero) - 1;
  If Fin > Tam then
    Fin:= Tam;
  if Inicio > Tam then
    Inicio:= Tam;
  Repeat
    if Terminated then
      Exit;
    Aux := Fichero;
    if Inicio + Bytes <= Tam then
      for o := Inicio to Inicio + Bytes - 1 do
        Aux[o + 1] := AnsiChar(Rell)
    else
      for o := Inicio to (Inicio + (Tam - Inicio)) do
        Aux[o + 1] := AnsiChar(Rell);

    OffIni := IntToStr(Inicio);
    sBytes := IntToStr(Bytes);

    Form1.Estado.SimpleText := 'Procesando fichero: ' + OffIni + '_' + sBytes +
      ExtractFileExt(Aux2);
    Application.ProcessMessages;

    StrToFile(Aux, RutaOffsets + '\' + OffIni + '_' + sBytes +
      ExtractFileExt(Aux2));

    Inc(Inicio, Bytes);
  until Inicio > Fin;
  Form1.Estado.SimpleText := 'Proceso terminado.';
end;

Procedure HPrincipal.DSplit(Fichero, RutaOffsets: AnsiString; Inicio, Fin, Bytes: Integer);
var
  FichAux: AnsiString;
  FichFinal: AnsiString;
  IniAux: Integer;
  TamFichero: Integer;
  Ultimo: Boolean;
begin
  FichAux := Fichero;
  Fichero := FileToStr(Fichero);
  TamFichero := Length(Fichero);

  If TamFichero = 0 then
    Exit;

  IniAux := Inicio + 1;

  if IniAux > TamFichero then
    IniAux:= TamFichero;

  if IniAux < Bytes then
    IniAux := Bytes;

  Ultimo := False;

  Repeat
    if Terminated then
      Exit;
    if IniAux = TamFichero then
      Ultimo := True;
    FichFinal := '';
    SetLength(FichFinal, IniAux);
    CopyMemory(@FichFinal[1], @Fichero[1], IniAux);
    Form1.Estado.SimpleText := 'Procesando fichero: ' + IntToStr(IniAux - 1) + '_' +
      IntToStr(Bytes) + ExtractFileExt(FichAux);
    Application.ProcessMessages;
    StrToFile(FichFinal, RutaOffsets + '\' + IntToStr(IniAux - 1) + '_' +
      IntToStr(Bytes) + ExtractFileExt(FichAux));

    If IniAux -1 = Fin then
      begin
        Form1.Estado.SimpleText := 'Proceso terminado.';
        Exit;
      end;

    Inc(IniAux, Bytes);
  until Ultimo = True;
  Form1.Estado.SimpleText := 'Proceso terminado.';
end;

Procedure HPrincipal.AvFuck;
begin
  AvFucker(Form1.EdFichero.Text, Form1.EdDir.Text, StrToInt(Form1.EdInicio.Text),
    StrToInt(Form1.EdFin.Text), StrToInt(Form1.EdBytes.Text), Form1.EdValor.Text);
end;

Procedure HPrincipal.Split;
begin
  DSplit(Form1.EdFichero.Text, Form1.EdDir.Text, StrToInt(Form1.EdInicio.Text),
    StrToInt(Form1.EdFin.Text), StrToInt(Form1.EdBytes.Text));
end;

{ HPrincipal }

procedure HPrincipal.Execute;
begin
  if Form1.RadioButton1.Checked then
    Synchronize(AvFuck);
  if Form1.RadioButton2.Checked then
    Synchronize(Split);
  { Place thread code here }
end;

end.
