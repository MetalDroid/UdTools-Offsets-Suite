unit uThreadReplacer;

interface

uses
  System.Classes, System.SysUtils, uFuncCompartidas, Vcl.Forms, Winapi.Windows;

type
  HReplacer = class(TThread)
  private
    procedure VaciarCarpeta;
    procedure Generar;
    { Private declarations }
  protected
    procedure Execute; override;
  end;

implementation

uses
  uUOS;

// Función para eliminar todos los ficheros existentes en el Directorio de trabajo
Procedure HReplacer.VaciarCarpeta;
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

// Esta Función busca byte a byte el valor que digamos dentro de un fichero y genera fichero nuevo con la offset modificada (NO sobreescribe el fichero original)
procedure HReplacer.Generar;
var
  Inicio, Fin: integer;
  Original: byte;
  Reemplazo: byte;
  Fichero, FicheroF, RutaFichero, Directorio, Extension: String;
  i: integer;
  TamFich: DWORD;
  Coincidencias: integer;
begin
  Coincidencias := 0;
  Original := StrToInt('$' + Form1.EdOriginal.Text);
  Reemplazo := StrToInt('$' + Form1.EdReemplazar.Text);
  RutaFichero := Form1.EdFichero.Text;
  TamFich := GetCompressedFileSize(PChar(RutaFichero), nil) - 1;
  Extension := ExtractFileExt(RutaFichero);
  Fichero := FileToStr(RutaFichero);
  Directorio := Form1.EdDir.Text;
  Inicio := 1;
  Fin := Length(Fichero);
  if Form1.RadRango.Checked then
  begin
    Inicio := StrToInt(Form1.EdInicioR.Text);
    Fin := StrToInt(Form1.EdFinR.Text);
    if (Inicio > TamFich) or (Fin > TamFich) or (Inicio < 0) or (Fin < 0) or
      (Fin < Inicio) then
    begin
      Form1.Estado.SimpleText := 'Secuencia no válida.';
      Exit;
    end;
  end;
  for i := (Inicio + 1) to (Fin + 1) do
  begin
    FicheroF := Fichero;
    if Fichero[i] = Chr(Original) then
    begin
      if Terminated then
        Exit;
      inc(Coincidencias);
      FicheroF[i] := Chr(Reemplazo);
      StrToFile(FicheroF, Directorio + '\' + IntToStr(i - 1) + Extension);
      Form1.Estado.SimpleText := 'Procesando fichero ' + IntToStr(i - 1) +
        Extension;
      Application.ProcessMessages;
    end;
  end;
  Form1.Estado.SimpleText := 'Proceso completado. Encontradas ' +
    IntToStr(Coincidencias) + ' coincidencias.';
end;

{ HReplacer }

procedure HReplacer.Execute;
begin
  if Form1.CheckVaciarR.Checked then
    Synchronize(VaciarCarpeta);
  Synchronize(Generar);
  { Place thread code here }
end;

end.
