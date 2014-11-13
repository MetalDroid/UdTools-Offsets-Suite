unit uThreadReplacer;

interface

uses
  System.Classes, System.SysUtils, uFuncCompartidas, Vcl.Forms, Winapi.Windows, uIdiomas;

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

var
  Log: TStringList;

  // Función para eliminar todos los ficheros existentes en el Directorio de trabajo
Procedure HReplacer.VaciarCarpeta;
var
  SearchResult: TSearchRec;
begin
  SetCurrentDir(Form1.EdDir.Text);
  Form1.Estado.Caption:= Var15;
  if FindFirst('*', faArchive, SearchResult) = 0 then
    begin
      repeat
        Application.ProcessMessages;
        if (SearchResult.Attr and faArchive = faArchive) and
          (SearchResult.Attr and faDirectory <> faDirectory) then
          if not Deletefile(PChar(Form1.EdDir.Text + '\' + SearchResult.Name)) then
            Log.Add(Var16 + ' ' + Form1.EdDir.Text + '\' + SearchResult.Name);
      until FindNext(SearchResult) <> 0;
      System.SysUtils.FindClose(SearchResult);
    end;
  Form1.Estado.Caption:= Var17;
end;

// Esta Función busca byte a byte el valor que digamos dentro de un fichero y genera fichero nuevo con la offset modificada (NO sobreescribe el fichero original)
procedure HReplacer.Generar;
var
  Inicio, Fin: integer;
  Original: byte;
  Reemplazo: byte;
  Fichero, RutaFichero, Directorio, Extension: String;
  FicheroF: AnsiString;
  i: integer;
  TamFich: DWORD;
  Coincidencias: integer;
begin
  Coincidencias:= 0;
  Original:= StrToInt('$' + Form1.EdOriginal.Text);
  Reemplazo:= StrToInt('$' + Form1.EdReemplazar.Text);
  RutaFichero:= Form1.EdFichero.Text;
  TamFich:= GetCompressedFileSize(PChar(RutaFichero), nil) - 1;
  Extension:= ExtractFileExt(RutaFichero);
  Fichero:= FileToStr(RutaFichero);
  Directorio:= Form1.EdDir.Text;
  Inicio:= 1;
  Fin:= Length(Fichero);

  if Form1.F1.Checked then
    begin
      Form1.Estado.Caption:= Var55;
      Application.ProcessMessages;
    end;

  if Form1.RadRango.Checked then
    begin
      Inicio:= StrToInt(Form1.EdInicioR.Text);
      Fin:= StrToInt(Form1.EdFinR.Text);
      if (Inicio > TamFich) or (Fin > TamFich) or (Inicio < 0) or (Fin < 0) or (Fin < Inicio) then
        begin
          Form1.Estado.Caption:= Var2;
          Exit;
        end;
    end;
  for i:= (Inicio + 1) to (Fin + 1) do
    begin
      FicheroF:= AnsiString(Fichero);
      if FicheroF[i] = AnsiChar(Original) then
        begin
          if Terminated then
            Exit;
          inc(Coincidencias);
          FicheroF[i]:= AnsiChar(Reemplazo);
          if not StrToFile(WideString(FicheroF), Directorio + '\' + (i - 1).ToString + Extension)
          then
            Log.Add(Var26 + ' ' + Directorio + '\' + (i - 1).ToString + Extension);
          if not Form1.F1.Checked then
            Form1.Estado.Caption:= Var27 + ' ' + (i - 1).ToString + Extension;
          Application.ProcessMessages;
        end;
    end;
  Form1.Estado.Caption:= Var28 + ' ' + Coincidencias.ToString + ' ' + Var29;
end;

{ HReplacer }

procedure HReplacer.Execute;
begin
  Log:= nil;
  Log:= TStringList.Create;
  if Form1.CheckVaciarR.Checked then
    Synchronize(VaciarCarpeta);
  Synchronize(Generar);
  if Log.Count > 0 then
    try
      ErrorLog(Log, ExtractFilePath(ParamStr(0)) + '\LogErrores.txt');
    finally
      Form1.Estado.Caption:= Var24;
      Log.Free;
    end;
  { Place thread code here }
end;

end.
