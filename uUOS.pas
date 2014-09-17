unit uUOS;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls,
  uThreadLocator, Vcl.FileCtrl, System.IOUtils, Vcl.ExtCtrls, System.IniFiles,
  Winapi.ShellApi, uThreadReplacer, Vcl.Menus, Vcl.Themes, Vcl.Styles,
  Winapi.TlHelp32, uFuncCompartidas, uThreadChecker;

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
    BtnMostrarLista: TButton;
    CheckAll: TCheckBox;
    BtnAVFLista: TButton;
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
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    CheckVaciarR: TCheckBox;
    EdOriginal: TEdit;
    EdReemplazar: TEdit;
    EdInicioR: TEdit;
    EdFinR: TEdit;
    RadCompleto: TRadioButton;
    RadRango: TRadioButton;
    BtnIniciarR: TButton;
    BtnDetenerR: TButton;
    Label15: TLabel;
    Label16: TLabel;
    MainMenu1: TMainMenu;
    Skin1: TMenuItem;
    N11: TMenuItem;
    N21: TMenuItem;
    N31: TMenuItem;
    N41: TMenuItem;
    ListView2: TListView;
    Label17: TLabel;
    EdEspera: TEdit;
    Label18: TLabel;
    BIniciarCh: TButton;
    BDetenerCh: TButton;
    Label19: TLabel;
    EdFuncionales: TEdit;
    Button5: TButton;
    Estado: TPanel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Edit4: TEdit;
    CheckBox1: TCheckBox;
    Edit5: TEdit;
    CheckBox2: TCheckBox;
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
    procedure BtnMostrarListaClick(Sender: TObject);
    procedure CheckAllClick(Sender: TObject);
    procedure BtnAVFListaClick(Sender: TObject);
    procedure RadCombClick(Sender: TObject);
    procedure RadProgresivoClick(Sender: TObject);
    procedure RadSelectivoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TabSheet2Show(Sender: TObject);
    procedure TabSheet1Show(Sender: TObject);
    procedure BtnIniciarRClick(Sender: TObject);
    procedure BtnDetenerRClick(Sender: TObject);
    procedure EdOriginalKeyPress(Sender: TObject; var Key: Char);
    procedure EdReemplazarKeyPress(Sender: TObject; var Key: Char);
    procedure RadCompletoClick(Sender: TObject);
    procedure RadRangoClick(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N21Click(Sender: TObject);
    procedure N31Click(Sender: TObject);
    procedure N41Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure TabSheet3Show(Sender: TObject);
    procedure BIniciarChClick(Sender: TObject);
    procedure BDetenerChClick(Sender: TObject);
    procedure ListView2AdvancedCustomDrawSubItem(Sender: TCustomListView;
      Item: TListItem; SubItem: Integer; State: TCustomDrawState;
      Stage: TCustomDrawStage; var DefaultDraw: Boolean);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure Edit4Change(Sender: TObject);
    procedure ListView1DblClick(Sender: TObject);
    procedure ListView1Change(Sender: TObject; Item: TListItem;
      Change: TItemChange);
  private
    TIniciar: HPrincipal;
    TIniciarR: HReplacer;
    TChecker: HChecker;
    procedure DragAndDrop(var Msg: TWMDropFiles); message WM_DROPFILES;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  BtnListado: Boolean;
  HexChars: TSysCharSet;

implementation

{$R *.dfm}

procedure TForm1.BDetenerChClick(Sender: TObject);
begin
  if TChecker <> nil then
    TChecker.Terminate;
  Estado.Caption := 'Proceso detenido.';
  BDetenerCh.Visible := False;
end;

procedure TForm1.BDetenerClick(Sender: TObject);
begin
  if TIniciar <> nil then
    TIniciar.Terminate;
  Estado.Caption := 'Proceso detenido.';
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
      Label15.Caption := 'Máx: ' + FichTam;
      Label16.Caption := 'Máx: ' + FichTam;
      Form1.Estado.Caption := 'Fichero cargado.';
      Label18.Caption := 'Sólo se comprobarán ficheros con extensión: ' +
        ExtractFileExt(OpenDialog1.FileName);
      if System.SysUtils.DirectoryExists(EdDir.Text) then
        ListarFicheros;
    end;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  Dir: string;
begin
  if SelectDirectory('Selecciona la carpeta de trabajo.', '', Dir) then
  begin
    EdDir.Text := Dir;
    Form1.Estado.Caption := 'Directorio cargado.';
    ListarFicheros;
  end;
end;

procedure TForm1.BIniciarChClick(Sender: TObject);
begin
  ListarFicheros;
  BDetenerCh.Visible := True;
  TChecker := HChecker.Create(False);
  TChecker.WaitFor;
  BDetenerCh.Visible := False;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  Application.MessageBox
    ('Especifica el nombre del fichero que se genera al ejecutar tu fichero o anotador.'
    + #13#10 + 'Ejemplo: funcionales.txt' + #13#10#13#10 +
    'Este fichero sirve de referencia para detectar los ficheros funcionales.',
    'Información Offsets Checker', MB_OK or MB_ICONINFORMATION);
end;

procedure TForm1.BtnIniciarRClick(Sender: TObject);
begin
  if not FileExists(EdFichero.Text) or not System.SysUtils.DirectoryExists
    (EdDir.Text) then
  begin
    Form1.Estado.Caption := 'Fichero o Ruta inexistente.';
    Exit;
  end;
  BtnDetenerR.Visible := True;
  TIniciarR := HReplacer.Create(False);
  TIniciarR.WaitFor;
  BtnDetenerR.Visible := False;
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

procedure TForm1.BtnMostrarListaClick(Sender: TObject);
begin
  AddToList;
end;

procedure TForm1.BtnAVFListaClick(Sender: TObject);
var
  Vaciar: Boolean;
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

procedure TForm1.BtnDetenerRClick(Sender: TObject);
begin
  if TIniciarR <> nil then
    TIniciarR.Terminate;
  Estado.Caption := 'Proceso detenido.';
  BtnDetenerR.Visible := False;
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
  if not FileExists(EdFichero.Text) or not System.SysUtils.DirectoryExists
    (EdDir.Text) then
  begin
    Form1.Estado.Caption := 'Fichero o Ruta inexistente.';
    Exit;
  end;
  ListView1.clear;
  BDetener.Visible := True;
  Vaciar := False;
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

procedure TForm1.Edit4Change(Sender: TObject);
begin
  ListarFicheros;
end;

procedure TForm1.EdOriginalKeyPress(Sender: TObject; var Key: Char);
begin
  HexChars := ['0' .. '9', 'A' .. 'F', 'a' .. 'f', #8];
  if not(CharInSet(Key, HexChars)) then
    Key := #0;
end;

procedure TForm1.EdReemplazarKeyPress(Sender: TObject; var Key: Char);
begin
  HexChars := ['0' .. '9', 'A' .. 'F', 'a' .. 'f', #8];
  if not(CharInSet(Key, HexChars)) then
    Key := #0;
end;

procedure TForm1.EdValorKeyPress(Sender: TObject; var Key: Char);
begin
  HexChars := ['0' .. '9', 'A' .. 'F', 'a' .. 'f', #8];
  if not(CharInSet(Key, HexChars)) then
    Key := #0;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
var
  Opt: TIniFile;
begin
  Opt := TIniFile.Create(ExtractFilePath(ParamStr(0)) + '\UOS.ini');
  Try
    Opt.WriteString('Locator', 'Dir', EdDir.Text);
    Opt.WriteBool('Locator', 'Recordar', ChkRecordar.Checked);
  Finally
    Opt.Free;
  End;
end;

// Procedimiento para arrastrar y soltar
procedure TForm1.DragAndDrop(var Msg: TWMDropFiles);
var
  sName: array [0 .. MAX_PATH] of Char;
  FichTam: String;
begin
  if WindowFromPoint(Mouse.CursorPos) = EdFichero.Handle then
  begin
    DragQueryFile(Msg.Drop, 0, sName, MAX_PATH);
    if FileExists(sName) then
    begin
      FichTam := IntToStr(GetCompressedFileSize(sName, nil) - 1);
      EdFichero.Text := sName;
      EdFin.Text := FichTam;
      Label8.Caption := 'Máx: ' + FichTam;
      Label9.Caption := 'Máx: ' + FichTam;
      Label10.Caption := 'Máx: ' + FichTam;
      Label15.Caption := 'Máx: ' + FichTam;
      Label16.Caption := 'Máx: ' + FichTam;
      Label18.Caption := 'Sólo se comprobarán ficheros con extensión: ' +
        ExtractFileExt(OpenDialog1.FileName);
      Estado.Caption := 'Fichero cargado.';
      if System.SysUtils.DirectoryExists(EdDir.Text) then
        ListarFicheros;
    end;
  end
  else if WindowFromPoint(Mouse.CursorPos) = EdDir.Handle then
  begin
    DragQueryFile(Msg.Drop, 0, sName, MAX_PATH);
    if System.SysUtils.DirectoryExists(sName) then
    begin
      EdDir.Text := sName;
      ListarFicheros;
      Estado.Caption := 'Directorio cargado.';
    end;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  Opt: TIniFile;
  Dir: string;
  Recordar: Boolean;
begin
  Opt := TIniFile.Create(ExtractFilePath(ParamStr(0)) + '\UOS.ini');
  Try
    Dir := Opt.ReadString('Locator', 'Dir', 'Directorio de trabajo');
    Recordar := Opt.ReadBool('Locator', 'Recordar', False);
    if Recordar then
    begin
      EdDir.Text := Dir;
      ChkRecordar.Checked := True;
    end;
  Finally
    Opt.Free;
  End;
  // Cambia proporcionalmente el tamaño del form y controles según resolución en base al alto (800 px)
  ScaleBy(Screen.Height, 800);
  DragAcceptFiles(Handle, True);
end;

procedure TForm1.ListView1Change(Sender: TObject; Item: TListItem;
  Change: TItemChange);
var
  i, Checks: integer;
begin
  Checks:= 0;
  for i:= 0 to ListView1.Items.Count -1 do
    if ListView1.Items.Item[i].Checked then
      Inc(Checks);
  if Checks > 0 then
    form1.BtnAVFLista.Enabled:= True
  else
    BtnAVFLista.Enabled:= False;
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

procedure TForm1.ListView2AdvancedCustomDrawSubItem(Sender: TCustomListView;
  Item: TListItem; SubItem: Integer; State: TCustomDrawState;
  Stage: TCustomDrawStage; var DefaultDraw: Boolean);
begin
  if Item.SubItems[0] = 'Sí' then
    Sender.Canvas.Font.Color := clGreen
  else
    Sender.Canvas.Font.Color := clRed;
end;

procedure TForm1.N11Click(Sender: TObject);
begin
  N11.Checked := True;
  TStyleManager.TrySetStyle('Smokey Quartz Kamri');
end;

procedure TForm1.N21Click(Sender: TObject);
begin
  N21.Checked := True;
  TStyleManager.TrySetStyle('Amethyst Kamri');
end;

procedure TForm1.N31Click(Sender: TObject);
begin
  N31.Checked := True;
  TStyleManager.TrySetStyle('Carbon');
end;

procedure TForm1.N41Click(Sender: TObject);
begin
  N41.Checked := True;
  TStyleManager.TrySetStyle('Metropolis UI Black');
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
    BtnMostrarLista.Enabled := True;
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
    BtnMostrarLista.Enabled := False;
    CheckAll.Enabled := False;
    BtnAVFLista.Enabled := False;
    GroupBox2.Visible := True;
  end;
end;

procedure TForm1.RadCompletoClick(Sender: TObject);
begin
  if RadCompleto.Checked then
  begin
    Label13.Enabled := False;
    Label14.Enabled := False;
    Label15.Enabled := False;
    Label16.Enabled := False;
    EdInicioR.Enabled := False;
    EdFinR.Enabled := False;
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
    BtnMostrarLista.Enabled := True;
    GroupBox2.Visible := False;
  end;
end;

procedure TForm1.RadioButton1Click(Sender: TObject);
begin
  if Radiobutton1.Checked then
    begin
      Edit4.Enabled:= False;
      ListarFicheros;
    end;
end;

procedure TForm1.RadioButton2Click(Sender: TObject);
begin
  if Radiobutton2.Checked then
    begin
      Edit4.Enabled:= True;
      ListarFicheros;
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

procedure TForm1.RadRangoClick(Sender: TObject);
begin
  if RadRango.Checked then
  begin
    Label13.Enabled := True;
    Label14.Enabled := True;
    Label15.Enabled := True;
    Label16.Enabled := True;
    EdInicioR.Enabled := True;
    EdFinR.Enabled := True;
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

procedure TForm1.TabSheet1Show(Sender: TObject);
var
  Escala: Real;
begin
  Escala:= (Screen.Height * 100) / 800;
  Form1.ClientHeight := Round((490 * Escala) / 100);
end;

procedure TForm1.TabSheet2Show(Sender: TObject);
var
  Escala: Real;
begin
  Escala:= (Screen.Height * 100) / 800;
  Form1.ClientHeight := Round((225 * Escala) / 100);
end;

procedure TForm1.TabSheet3Show(Sender: TObject);
var
  Escala: Real;
begin
  Escala:= (Screen.Height * 100) / 800;
  Form1.ClientHeight := Round((490 * Escala) / 100);
  ListarFicheros;
end;

end.
