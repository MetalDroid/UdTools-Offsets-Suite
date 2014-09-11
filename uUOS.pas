unit uUOS;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls,
  uThreadLocator, Vcl.FileCtrl, System.IOUtils, Vcl.ExtCtrls, System.IniFiles,
  Winapi.ShellApi;

type
  TForm1 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    EdFichero: TEdit;
    EdDir: TEdit;
    Button1: TButton;
    Button2: TButton;
    RadAvFucker: TRadioButton;
    RadDSplit: TRadioButton;
    EdInicio: TEdit;
    EdFin: TEdit;
    EdBytes: TEdit;
    EdValor: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    GroupBox1: TGroupBox;
    CheckVaciar: TCheckBox;
    CheckGen: TCheckBox;
    ChkRecordar: TCheckBox;
    TabSheet2: TTabSheet;
    ListView1: TListView;
    TabSheet3: TTabSheet;
    BtnIniciar: TButton;
    Button5: TButton;
    CheckAll: TCheckBox;
    BtnAVFLista: TButton;
    Estado: TStatusBar;
    OpenDialog1: TOpenDialog;
    BDetener: TButton;
    RadComb: TRadioButton;
    GroupBox2: TGroupBox;
    RadProgresivo: TRadioButton;
    RadSelectivo: TRadioButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    Edit3: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    procedure BtnIniciarClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure BDetenerClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure EdValorKeyPress(Sender: TObject; var Key: Char);
    procedure RadDSplitClick(Sender: TObject);
    procedure RadAvFuckerClick(Sender: TObject);
    procedure EdInicioDblClick(Sender: TObject);
    procedure EdFinDblClick(Sender: TObject);
    procedure EdBytesDblClick(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure CheckAllClick(Sender: TObject);
    procedure ListView1DblClick(Sender: TObject);
    procedure BtnAVFListaClick(Sender: TObject);
    procedure RadCombClick(Sender: TObject);
    procedure RadProgresivoClick(Sender: TObject);
    procedure RadSelectivoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    TIniciar: HPrincipal;
    procedure DragAndDrop(var Msg: TWMDropFiles); message WM_DROPFILES;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  // Variable para que no se vuelva loco el thread con el botón del avfuck al listado (saber si el avfuck es lanzado con ese botón)
  BtnListado: Boolean;

implementation

{$R *.dfm}

procedure TForm1.BDetenerClick(Sender: TObject);
begin
  if TIniciar <> nil then
    TIniciar.Terminate;
  Estado.SimpleText := 'Proceso detenido.';
  BDetener.Visible := False;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  FichTam: String;
begin
  if OpenDialog1.Execute then
    if FileExists(OpenDialog1.FileName) then
    begin
      EdFichero.Text := OpenDialog1.FileName;
      FichTam :=
        IntToStr(Integer(GetCompressedFileSize(PChar(OpenDialog1.FileName), nil)
        ) - 1); // Tamaño del fichero (offset final)
      EdFin.Text := FichTam;
      Label8.Caption := 'Máx: ' + FichTam;
      Label9.Caption := 'Máx: ' + FichTam;
      Label10.Caption := 'Máx: ' + FichTam;
      Form1.Estado.SimpleText := 'Fichero cargado.';
    end;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  Dir: string;
begin
  if SelectDirectory('Selecciona la carpeta de trabajo.', '', Dir) then
  begin
    EdDir.Text := Dir;
    Form1.Estado.SimpleText := 'Directorio cargado.';
  end;
end;

// Comprobar si una cadena es numérica
Function IsNumber(Str: String): Boolean;
var
  i: Integer;
const
  Numeros = '0123456789';
begin
  Result := True;
  for i := 1 to Length(Str) - 1 do
    if Pos(Str[i], Numeros) = 0 then
    begin
      Result := False;
      Break;
    end;
end;

// Función para comprobar los nombres de los ficheros (xxxx_xxxx.xxx)
Function IsValidOffsetFileName(FName: String; var NumI, NumD: String): Boolean;
begin
  Result := True;
  FName := TPath.GetFileNameWithoutExtension(FName);
  NumI := Copy(FName, 1, Pos('_', FName) - 1);
  NumD := Copy(FName, Pos('_', FName) + 1, Length(FName) - Pos('_', FName));
  if not(IsNumber(NumI)) or not(IsNumber(NumD)) then
    Result := False;
end;

// Función para añadir offsets al listado teniendo en cuenta ficheros consecutivos (Es un poco chapuza por ahora, pero funcional)
Procedure AddToList;
var
  SearchResult: TSearchRec;
  Dir, Inicio, Fin, sBytes, IniAux, FinAux: String;
  Acumulados, i, Ficheros, Res, TamFich: Integer;
begin
  Form1.ListView1.clear;
  Acumulados := 0;
  Dir := Form1.EdDir.Text + '\';
  Inicio := Form1.EdInicio.Text;
  Fin := Form1.EdFin.Text;
  sBytes := Form1.EdBytes.Text;
  TamFich := GetCompressedFileSize(PChar(Form1.EdFichero.Text), nil) - 1;
  Ficheros := StrToInt(Fin) - StrToInt(Inicio);

  if Ficheros <= 0 then
    Ficheros := 1
  else
    Ficheros := (StrToInt(Fin) - StrToInt(Inicio)) div StrToInt(sBytes);

  for i := 0 to Ficheros + 2 do
  begin // Podríamos buscar por "_1000, _2000", etc (sBytes), pero no funcionaría debido al RESTO (último fichero);
    Res := FindFirst(Dir + Inicio + '_*', faAnyFile, SearchResult);
    if Res = 0 then
    begin
      Acumulados := Acumulados + StrToInt(sBytes);
    end
    else
    begin // Tenemos en cuenta el último fichero válido encontrado para añadir con éxito "Fin"
      if FindFirst(Dir + IntToStr(StrToInt(Inicio) - StrToInt(sBytes)) + '_*',
        faAnyFile, SearchResult) = 0 then
        if IsValidOffsetFileName(SearchResult.Name, IniAux, FinAux) then
        begin
          with Form1.ListView1.Items.Add do
          begin
            if Form1.RadAvFucker.Checked then
            begin
              Caption := IntToStr(StrToInt(Inicio) - Acumulados);
              SubItems.Add(IntToStr((StrToInt(IniAux) + StrToInt(FinAux)) - 1));
            end
            else
            begin
              Caption := IntToStr(StrToInt(Inicio) - StrToInt(sBytes));
              if ((StrToInt(IniAux) + StrToInt(FinAux)) - 1 > TamFich) then
                SubItems.Add(IntToStr((StrToInt(Inicio) - StrToInt(sBytes)) +
                  StrToInt(sBytes) - ((StrToInt(Inicio) - StrToInt(sBytes)) +
                  ((StrToInt(FinAux) - 1) - TamFich)) - 1))
              else
                SubItems.Add
                  (IntToStr((StrToInt(IniAux) + StrToInt(FinAux)) - 1));
            end;
          end;
          Application.ProcessMessages;
        end;
      Acumulados := 0;
    end;
    FindClose(SearchResult);
    Inicio := IntToStr(StrToInt(Inicio) + StrToInt(sBytes));
  end;
  if (Form1.CheckAll.Checked) and (Form1.ListView1.Items.Count > 0) then
    for i := 0 to Form1.ListView1.Items.Count - 1 do
      Form1.ListView1.Items.Item[i].Checked := True;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  AddToList;
end;

procedure TForm1.BtnAVFListaClick(Sender: TObject);
var
  i: Integer;
  Vaciar: Boolean;
  IniRestore, FinRestore: String;
begin
  BtnListado := True;
  Vaciar := CheckVaciar.Checked;
  BDetener.Visible := True;
  TIniciar := HPrincipal.Create(False);
  TIniciar.WaitFor;
  ListView1.clear;
  BDetener.Visible := False;
  CheckVaciar.Checked := Vaciar;
  BtnListado := False;
end;

procedure TForm1.CheckAllClick(Sender: TObject);
var
  i: Integer;
begin
  if (CheckAll.Checked) and (Form1.ListView1.Items.Count > 0) then
    for i := 0 to Form1.ListView1.Items.Count - 1 do
      Form1.ListView1.Items.Item[i].Checked := True
  else if not(CheckAll.Checked) and (Form1.ListView1.Items.Count > 0) then
    for i := 0 to Form1.ListView1.Items.Count - 1 do
      Form1.ListView1.Items.Item[i].Checked := False;
end;

procedure TForm1.BtnIniciarClick(Sender: TObject);
var
  Vaciar: Boolean;
begin
  if not FileExists(EdFichero.Text) or not DirectoryExists(EdDir.Text) then
  begin
    Form1.Estado.SimpleText := 'Fichero o Ruta inexistente.';
    Exit;
  end;
  ListView1.clear;
  BDetener.Visible := True;
  if RadComb.Checked then
    Vaciar := CheckVaciar.Checked;
  TIniciar := HPrincipal.Create(False);
  TIniciar.WaitFor;
  BDetener.Visible := False;
  if (CheckGen.Checked) and NOT(RadComb.Checked) then
    AddToList;
  if RadComb.Checked then
    CheckVaciar.Checked := Vaciar;
end;

procedure TForm1.EdBytesDblClick(Sender: TObject);
begin
  EdBytes.Text := '1000';
end;

procedure TForm1.EdFinDblClick(Sender: TObject);
begin
  if FileExists(EdFichero.Text) then
    EdFin.Text := IntToStr(Integer(GetCompressedFileSize(PChar(EdFichero.Text),
      nil)) - 1);
end;

procedure TForm1.EdInicioDblClick(Sender: TObject);
begin
  EdInicio.Text := '1000';
end;

procedure TForm1.EdValorKeyPress(Sender: TObject; var Key: Char);
begin
  if not(Key in ['0' .. '9', 'A' .. 'F', 'a' .. 'f', #8]) then
    Key := #0;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
var
  Opt: TIniFile;
begin
  Opt:= TIniFile.Create('UOS.ini');
  Try
    Opt.WriteString('Locator', 'Dir', EdDir.Text);
    Opt.WriteBool('Locator', 'Recordar', ChkRecordar.Checked);
  Finally
    Opt.Free;
  End;
end;

//Procedimiento para arrastrar y soltar
procedure TForm1.DragAndDrop(var Msg: TWMDropFiles);
var
  sName : array [0..MAX_PATH] of Char;
begin
if WindowFromPoint(Mouse.CursorPos) = EdFichero.Handle  then
  begin
    DragQueryFile(Msg.Drop, 0, sName, MAX_PATH );
    if FileExists(sName) then
      begin
        EdFichero.Text:= sName;
        EdFin.Text:= IntToStr(GetCompressedFileSize(PChar(EdFichero.Text), 0)-1);
      end;
  end else
if WindowFromPoint(Mouse.CursorPos) = EdDir.Handle  then
  begin
    DragQueryFile(Msg.Drop, 0, sName, MAX_PATH );
    if DirectoryExists(sName) then
      EdDir.Text:= sName;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
   Opt: TIniFile;
   Dir: string;
   Recordar: Boolean;
begin
  Opt:= TIniFile.Create('UOS.ini');
  Try
    Dir:= Opt.ReadString('Locator', 'Dir', 'Directorio de trabajo');
    Recordar:= Opt.ReadBool('Locator', 'Recordar', False);
    if Recordar then
      begin
        EdDir.Text:= Dir;
        ChkRecordar.Checked:= True;
      end;
  Finally
    Opt.Free;
  End;
  // Cambia proporcionalmente el tamaño del form y controles según resolución en base al alto (800 px)
  ScaleBy(Screen.Height, 800);
  DragAcceptFiles(Handle, True);
end;

procedure TForm1.ListView1DblClick(Sender: TObject);
begin
  if ListView1.SelCount > 0 then
  begin
    EdInicio.Text := ListView1.Selected.Caption;
    EdFin.Text := ListView1.Selected.SubItems[0];
    if Length(EdBytes.Text) > 1 then
      EdBytes.Text := Copy(EdBytes.Text, 1, Length(EdBytes.Text) - 1);
  end;
end;

procedure TForm1.RadAvFuckerClick(Sender: TObject);
begin
  if RadAvFucker.Checked then
  begin
    EdValor.Enabled := True;
    CheckAll.Enabled := True;
    BtnAVFLista.Enabled := True;
    Label1.Visible := True;
    Label2.Visible := True;
    Label3.Visible := True;
    Label4.Visible := True;
    Button5.Enabled := True;
    GroupBox2.Visible := False;
  end;
end;

procedure TForm1.RadCombClick(Sender: TObject);
begin
  if RadComb.Checked then
  begin
    Label1.Visible := False;
    Label2.Visible := False;
    Label3.Visible := False;
    Label4.Visible := False;
    Button5.Enabled := False;
    CheckAll.Enabled := False;
    BtnAVFLista.Enabled := False;
    GroupBox2.Visible := True;
  end;
end;

procedure TForm1.RadDSplitClick(Sender: TObject);
begin
  if RadDSplit.Checked then
  begin
    EdValor.Enabled := False;
    CheckAll.Enabled := False;
    BtnAVFLista.Enabled := False;
    Label1.Visible := True;
    Label2.Visible := True;
    Label3.Visible := True;
    Label4.Visible := True;
    Button5.Enabled := True;
    GroupBox2.Visible := False;
  end;
end;

procedure TForm1.RadProgresivoClick(Sender: TObject);
begin
  if RadProgresivo.Checked then
  begin
    Label5.Visible := True;
    Label6.Visible := True;
    Edit1.Visible := True;
    Edit2.Visible := True;
    Edit3.Visible := False;
    Label7.Visible := False;
    Label8.Visible := True;
    Label9.Visible := True;
    Label10.Visible := False;
  end;
end;

procedure TForm1.RadSelectivoClick(Sender: TObject);
begin
  if RadSelectivo.Checked then
  begin
    Label5.Visible := False;
    Label6.Visible := False;
    Edit1.Visible := False;
    Edit2.Visible := False;
    Edit3.Visible := True;
    Label7.Visible := True;
    Label8.Visible := False;
    Label9.Visible := False;
    Label10.Visible := True;
  end;
end;

end.
