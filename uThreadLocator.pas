unit uThreadLocator;

interface

uses
  System.Classes, System.SysUtils, Winapi.Windows, Vcl.Forms, System.IOUtils,
  uFuncCompartidas;

type
  HPrincipal = class(TThread)
  private
    Procedure AvFuck;
    Procedure Split;
    Procedure VaciarCarpeta;
    Procedure AvFucker(Fichero, RutaOffsets: String;
      Inicio, Fin, Bytes: Integer; RellenarCon: String);
    Procedure DSplit(Fichero, RutaOffsets: String; Inicio, Fin, Bytes: Integer);
    Procedure Combinaciones;
    Procedure AvFuckListado;
    { Private declarations }
  protected
    procedure Execute; override;
  end;

implementation

uses
  uUOS;

// Función para eliminar todos los ficheros existentes en el Directorio de trabajo
Procedure HPrincipal.VaciarCarpeta;
var
  SearchResult: TSearchRec;
begin
  SetCurrentDir(Form1.EdDir.Text);
  Form1.Estado.SimpleText := 'Estado: Vaciando carpeta...';
  if FindFirst('*', faArchive, SearchResult) = 0 then
  begin
    repeat
      if (SearchResult.Attr and faArchive = faArchive) and
        (SearchResult.Attr and faDirectory <> faDirectory) then
        Deletefile(PChar(Form1.EdDir.Text + '\' + SearchResult.Name));
    until FindNext(SearchResult) <> 0;
    System.SysUtils.FindClose(SearchResult);
  end;
  Form1.Estado.SimpleText := 'Estado: Carpeta vaciada.';
end;

// Función para realizar AvFucker
Procedure HPrincipal.AvFucker(Fichero, RutaOffsets: String;
  Inicio, Fin, Bytes: Integer; RellenarCon: String);
var
  o, Rell, Tam: Integer;
  Aux: AnsiString; Aux2, OffIni, sBytes: String;
begin
  Aux2 := Fichero;
  Fichero := FileToStr(Fichero);
  Rell := StrToInt('$' + RellenarCon);
  Tam := Length(Fichero) - 1;
  If Fin > Tam then
    Fin := Tam;
  if Inicio > Tam then
    Inicio := Tam;
  Repeat
    if Terminated then
      Exit;
    Aux := AnsiString(Fichero);
    if Inicio + Bytes <= Tam then
    begin
      sBytes := IntToStr(Bytes);
      for o := Inicio to Inicio + Bytes - 1 do
        Aux[o + 1] := AnsiChar(Rell);
    end
    else
    begin
      sBytes := IntToStr((Tam - Inicio) + 1);
      // Si el resto del fichero es menor que Bytes, tapamos el resto
      for o := Inicio to (Inicio + (Tam - Inicio)) do
        Aux[o + 1] := AnsiChar(Rell);
    end;

    OffIni := IntToStr(Inicio);
    // sBytes := IntToStr(Bytes);

    Form1.Estado.SimpleText := 'Procesando fichero: ' + OffIni + '_' + sBytes +
      ExtractFileExt(Aux2);
    Application.ProcessMessages;

    StrToFile(WideString(Aux), RutaOffsets + '\' + OffIni + '_' + sBytes +
      ExtractFileExt(Aux2));

    Inc(Inicio, Bytes);
  until Inicio > Fin;
  Form1.Estado.SimpleText := 'Proceso terminado.';
end;

// Función para realizar DSplit
Procedure HPrincipal.DSplit(Fichero, RutaOffsets: String;
  Inicio, Fin, Bytes: Integer);
var
  FichAux: String;
  FichFinal: String;
  IniAux, IniAuxUlt: Integer;
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
    IniAux := TamFichero;

  if IniAux < Bytes then
    IniAux := Bytes;

  Ultimo := False;

  Repeat
    if Terminated then
      Exit;

    if IniAux > TamFichero then
    begin
      Ultimo := True;
      IniAuxUlt := Bytes - (IniAux - TamFichero);
      IniAux := IniAux - (IniAux - TamFichero);
    end;
    FichFinal := '';
    FichFinal := Copy(Fichero, 1, IniAux);
    Form1.Estado.SimpleText := 'Procesando fichero: ' + IntToStr(IniAux - 1) +
      '_' + IntToStr(Bytes) + ExtractFileExt(FichAux);
    Application.ProcessMessages;
    if not(Ultimo) then
      StrToFile(FichFinal, RutaOffsets + '\' + IntToStr(IniAux - 1) + '_' +
        IntToStr(Bytes) + ExtractFileExt(FichAux))
    else
      StrToFile(FichFinal, RutaOffsets + '\' + IntToStr(IniAux - 1) + '_' +
        IntToStr(IniAuxUlt) + ExtractFileExt(FichAux));

    If IniAux - 1 >= Fin then
    begin
      Form1.Estado.SimpleText := 'Proceso terminado.';
      Exit;
    end;

    Inc(IniAux, Bytes);
  until Ultimo = True;
  Form1.Estado.SimpleText := 'Proceso terminado.';
end;

Procedure HPrincipal.Combinaciones;
var
  Fichero, Extension: string;
  FichAux: AnsiString;
  Ruta: string;
  OffIni: string;
  OffFin: string;
  OffsetsEspacios: string;
  OffAct: string;
  i, j: Integer;
  TamFich: DWORD;
  IniAux, FinAux: Integer;
  OffActAux: Integer;
begin
  Fichero := Form1.EdFichero.Text;
  Extension := ExtractFileExt(Fichero);
  Ruta := Form1.EdDir.Text;
  TamFich := GetCompressedFileSize(PChar(Fichero), nil) - 1;
  Fichero := FileToStr(Fichero);

  if Form1.RadProgresivo.Checked then
  begin
    OffIni := Form1.Edit1.Text;
    OffFin := Form1.Edit2.Text;
    if (StrToInt(OffIni) > TamFich) or (StrToInt(OffFin) > TamFich) or
      (StrToInt(OffIni) < 0) or (StrToInt(OffFin) < 0) or
      (StrToInt(OffFin) < StrToInt(OffIni)) then
    begin
      Form1.Estado.SimpleText := 'Secuencia no válida.';
      Exit;
    end;
    IniAux := StrToInt(OffIni);
    FinAux := StrToInt(OffFin);
    for i := IniAux to FinAux do
      for j := 0 to 255 do
      begin
        if Terminated then
          Exit;
        FichAux := AnsiString(Fichero);
        FichAux[i + 1] := AnsiChar(j);
        Form1.Estado.SimpleText := 'Procesando fichero: ' + IntToStr(i) + '_' +
          IntToHex(j, 2) + Extension;
        Application.ProcessMessages;
        StrToFile(WideString(FichAux), Ruta + '\' + IntToStr(i) + '_' + IntToHex(j, 2) +
          Extension);
      end;
    Form1.Estado.SimpleText := 'Proceso terminado.';
  end;

  if Form1.RadSelectivo.Checked then
  begin
    OffsetsEspacios := Form1.Edit3.Text;
    repeat
      OffsetsEspacios := Trim(OffsetsEspacios);
      OffsetsEspacios := OffsetsEspacios + ' ';
      OffAct := Copy(OffsetsEspacios, 1, pos(' ', OffsetsEspacios) - 1);
      if OffAct <> '' then
      begin
        OffActAux := StrToInt(OffAct);
        if NOT(OffActAux > TamFich) or (OffActAux < 0) then
        // Con NOT ignoramos las offsets no válidas
        begin
          FichAux := AnsiString(Fichero);
          for i := 0 to 255 do
          begin
            FichAux[OffActAux + 1] := AnsiChar(i);
            Form1.Estado.SimpleText := 'Procesando fichero: ' +
              IntToStr(OffActAux) + '_' + IntToHex(i, 2) + Extension;
            Application.ProcessMessages;
            StrToFile(WideString(FichAux), Ruta + '\' + IntToStr(OffActAux) + '_' +
              IntToHex(i, 2) + Extension);
          end;
        end;
      end;
      Delete(OffsetsEspacios, 1, pos(' ', OffsetsEspacios));
    until Length(OffAct) = 0;
    Form1.Estado.SimpleText := 'Proceso terminado.';
  end;
end;

// Procedimiento para realizar AvFucker con parámetros incluídos
Procedure HPrincipal.AvFuck;
begin
  AvFucker(Form1.EdFichero.Text, Form1.EdDir.Text,
    StrToInt(Form1.EdInicio.Text), StrToInt(Form1.EdFin.Text),
    StrToInt(Form1.EdBytes.Text), Form1.EdValor.Text);
end;

// Procedimiento para realizar DSplit con parámetros incluídos
Procedure HPrincipal.Split;
begin
  DSplit(Form1.EdFichero.Text, Form1.EdDir.Text, StrToInt(Form1.EdInicio.Text),
    StrToInt(Form1.EdFin.Text), StrToInt(Form1.EdBytes.Text));
end;

// Procedimiento para realizar AvFucker al listado
Procedure HPrincipal.AvFuckListado;
var
  i: Integer;
begin
  if Form1.ListView1.Items.Count > 0 then
  begin // Esto resta bytes automáticamente, no me gusta usarlo en el listado.
    // if Length(Form1.EdBytes.Text) > 1 then
    // Form1.EdBytes.Text := Copy(Form1.EdBytes.Text, 1, Length(Form1.EdBytes.Text) - 1);
    for i := 0 to Form1.ListView1.Items.Count - 1 do
    begin
      if Terminated then
        Exit;
      if Form1.ListView1.Items.Item[i].Checked then
      begin
        AvFucker(Form1.EdFichero.Text, Form1.EdDir.Text,
          StrToInt(Form1.ListView1.Items.Item[i].Caption),
          StrToInt(Form1.ListView1.Items.Item[i].SubItems[0]),
          StrToInt(Form1.EdBytes.Text), Form1.EdValor.Text);
      end;
      Form1.CheckVaciar.Checked := False;
    end;
  end;
end;

{ HPrincipal }
// Ejecución del Thread según proceda sincronizado con el form principal para mostrar el proceso en tiempo real
procedure HPrincipal.Execute;
begin
  if Form1.CheckVaciar.Checked then
    Synchronize(VaciarCarpeta);
  if Form1.RadAvFucker.Checked then
    if BtnListado then
      Synchronize(AvFuckListado)
    else
      Synchronize(AvFuck);
  if Form1.RadDSplit.Checked then
    Synchronize(Split);
  if Form1.RadComb.Checked then
    Synchronize(Combinaciones);
  { Place thread code here }
end;

end.
