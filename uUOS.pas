unit uUOS;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls,
  uThreadLocator, Vcl.FileCtrl, System.IOUtils, Vcl.ExtCtrls, System.IniFiles,
  Winapi.ShellApi, uThreadReplacer, Vcl.Menus, Vcl.Themes, Vcl.Styles,
  Winapi.TlHelp32, uFuncCompartidas, uThreadChecker, uAddToList, About,
  uListaGuardada, uIdiomas;

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
    BtnAyuda: TButton;
    Estado: TPanel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Edit4: TEdit;
    CheckBox1: TCheckBox;
    Edit5: TEdit;
    CheckBox2: TCheckBox;
    TabSheet4: TTabSheet;
    Label20: TLabel;
    Edit6: TEdit;
    Button3: TButton;
    Label21: TLabel;
    Edit7: TEdit;
    Label22: TLabel;
    PopupMenu1: TPopupMenu;
    Aadir1: TMenuItem;
    Eliminarseleccionados1: TMenuItem;
    Limpiar1: TMenuItem;
    ChkAv1Byte: TCheckBox;
    ChkRevFinal: TCheckBox;
    ChkElimNoF: TCheckBox;
    Ajustes1: TMenuItem;
    Acercade1: TMenuItem;
    Eliminartodoslosajustesyresetearaplicacin1: TMenuItem;
    Visitarenlacedelproyecto1: TMenuItem;
    Acercade2: TMenuItem;
    GuardarSeleccionadosenListaaparte1: TMenuItem;
    MostrarListaAlmacenada1: TMenuItem;
    GuardarTodasenListaAparte1: TMenuItem;
    ChkRestar: TCheckBox;
    BtnDetenerLista: TButton;
    N1: TMenuItem;
    ChkAleatorio: TCheckBox;
    Button4: TButton;
    I1: TMenuItem;
    C1: TMenuItem;
    E1: TMenuItem;
    OpenDialog2: TOpenDialog;
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
    procedure BtnAyudaClick(Sender: TObject);
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
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure TabSheet4Show(Sender: TObject);
    procedure Edit6KeyPress(Sender: TObject; var Key: Char);
    procedure Button3Click(Sender: TObject);
    procedure Edit7KeyPress(Sender: TObject; var Key: Char);
    procedure Aadir1Click(Sender: TObject);
    procedure Limpiar1Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure Eliminarseleccionados1Click(Sender: TObject);
    procedure Eliminartodoslosajustesyresetearaplicacin1Click(Sender: TObject);
    procedure Acercade2Click(Sender: TObject);
    procedure Visitarenlacedelproyecto1Click(Sender: TObject);
    procedure MostrarListaAlmacenada1Click(Sender: TObject);
    procedure GuardarSeleccionadosenListaaparte1Click(Sender: TObject);
    procedure GuardarTodasenListaAparte1Click(Sender: TObject);
    procedure BtnDetenerListaClick(Sender: TObject);
    procedure ChkRevFinalClick(Sender: TObject);
    procedure EdEsperaDblClick(Sender: TObject);
    procedure EdValorDblClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure C1Click(Sender: TObject);
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
  Skin: String = '';
  RutaIdioma: String = '';

implementation

{$R *.dfm}

procedure EscribeIni;
var
  Opt: TIniFile;
begin
  if Skin = '' then
    Skin := 'Smokey Quartz Kamri';
  Opt := TIniFile.Create(ExtractFilePath(ParamStr(0)) + '\UOS.ini');
  Try
    Opt.WriteString('Locator', 'Dir', Form1.EdDir.Text);
    Opt.WriteBool('Locator', 'Recordar', Form1.ChkRecordar.Checked);
    Opt.WriteString('UOS', 'Skin', Skin);
    Opt.WriteString('UOS', 'RutaIdioma', RutaIdioma);
  Finally
    Opt.Free;
  End;
end;

procedure TForm1.Aadir1Click(Sender: TObject);
begin
  Form2.ShowModal;
end;

procedure TForm1.Acercade2Click(Sender: TObject);
begin
  AboutBox.ShowModal;
end;

procedure TForm1.BDetenerChClick(Sender: TObject);
begin
  if TChecker <> nil then
    TChecker.Terminate;
  Estado.Caption := Var18;
  BDetenerCh.Visible := False;
end;

procedure TForm1.BDetenerClick(Sender: TObject);
begin
  if TIniciar <> nil then
    TIniciar.Terminate;
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
      FichTam := (GetCompressedFileSize(PChar(OpenDialog1.FileName), nil) -
        1).ToString;
      EdInicio.Text := '1000';
      EdFin.Text := FichTam;
      Label8.Caption := Var51 + ' ' + FichTam;
      Label9.Caption := Var51 + ' ' + FichTam;
      Label10.Caption := Var51 + ' ' + FichTam;
      Label15.Caption := Var51 + ' ' + FichTam;
      Label16.Caption := Var51 + ' ' + FichTam;
      Form1.Estado.Caption := Var30;
      Label18.Caption := Var31 + ' ' +
        ExtractFileExt(OpenDialog1.FileName);
      Button3.Enabled := True;
      BtnIniciar.Enabled := True;
      ListView1.Clear;
      Label22.Caption := Var32 + ' Patched' + ExtractFileExt(EdFichero.Text);
      if System.SysUtils.DirectoryExists(EdDir.Text) then
        ListarFicheros;
    end;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  Dir: string;
begin
  if SelectDirectory(Var33, '', Dir) then
  begin
    EdDir.Text := Dir;
    Form1.Estado.Caption := Var34;
    ListarFicheros;
  end;
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  OffsetsEspacios: String;
  OffAct: String;
  Fichero: AnsiString;
  OffActAux: Integer;
  TamFich: Integer;
  Valor: Byte;
begin
  OffsetsEspacios := Edit6.Text;
  if Edit7.Text = '' then
  begin
    Estado.Caption := Var35;
    Exit;
  end;
  Valor := StrToInt('$' + Edit7.Text);
  Fichero := AnsiString(FileToStr(EdFichero.Text));
  TamFich := Length(Fichero);
  repeat
    OffsetsEspacios := Trim(OffsetsEspacios);
    OffsetsEspacios := OffsetsEspacios + ' ';
    OffAct := Copy(OffsetsEspacios, 1, pos(' ', OffsetsEspacios) - 1);
    if OffAct <> '' then
    begin
      OffActAux := StrToInt(OffAct);
      if NOT(OffActAux > TamFich) or (OffActAux < 0) then
        Fichero[OffActAux + 1] := AnsiChar(Valor);
    end;
    Delete(OffsetsEspacios, 1, pos(' ', OffsetsEspacios));
  until Length(OffAct) = 0;
  if StrToFile(WideString(Fichero),
    IncludeTrailingPathDelimiter(ExtractFilePath(EdFichero.Text)) + 'Patched' +
    ExtractFileExt(EdFichero.Text)) then
    Estado.Caption := Var36
  else
    Estado.Caption := Var37;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  Application.MessageBox(PChar(Var38 + #13#10 + #13#10 + Var39 + #13#10 + Var40), PChar(Var41),
    MB_OK or MB_ICONINFORMATION);
end;

procedure TForm1.BIniciarChClick(Sender: TObject);
begin
  ListarFicheros;
  BDetenerCh.Visible := True;
  TChecker := HChecker.Create(False);
  TChecker.WaitFor;
  BDetenerCh.Visible := False;
end;

procedure TForm1.BtnAyudaClick(Sender: TObject);
begin
  Application.MessageBox(PChar(Var42 + #13#10 + Var43 + #13#10#13#10 + Var44 + #13#10#13#10 +
    Var45 + #13#10#13#10 + Var46), PChar(Var41), MB_OK or MB_ICONINFORMATION);
end;

procedure TForm1.BtnIniciarRClick(Sender: TObject);
begin
  if not FileExists(EdFichero.Text) or not System.SysUtils.DirectoryExists
    (EdDir.Text) then
  begin
    Form1.Estado.Caption := Var48;
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
  Result := False;
  for i := 1 to Length(Str) - 1 do
    if pos(Str[i], Numeros) <> 0 then
    begin
      Result := True;
      Break;
    end;
end;

// Función para comprobar los nombres de los ficheros (xxxx_xxxx.xxx)
Function IsValidOffsetFileName(FName: String; var NumI, NumD: String): Boolean;
begin
  Result := False;
  FName := TPath.GetFileNameWithoutExtension(FName);
  NumI := Copy(FName, 1, pos('_', FName) - 1);
  if Form1.ChkAleatorio.Checked then
  begin
    Delete(FName, 1, pos('_', FName));
    NumD := Copy(FName, 1, pos('_', FName) - 1);
  end
  else
  begin
    NumD := Copy(FName, pos('_', FName) + 1, Length(FName) - pos('_', FName));
  end;
  if (IsNumber(NumI)) and (IsNumber(NumD)) then
    Result := True;
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
  Ficheros := Fin.ToInteger - Inicio.ToInteger;

  if Form1.RadDSplit.Checked then
    if Inicio.ToInteger < sBytes.ToInteger then
      Inicio := sBytes;

  if Ficheros <= 0 then
    Ficheros := 1
  else
    Ficheros := (Fin.ToInteger - Inicio.ToInteger) div sBytes.ToInteger;

  for i := 0 to Ficheros + 2 do
  begin // Podríamos buscar por "_1000, _2000", etc (sBytes), pero no funcionaría debido al RESTO (último fichero);
    Res := FindFirst(Dir + Inicio + '_*', faAnyFile, SearchResult);
    if Res = 0 then
    begin
      Acumulados := Acumulados + StrToInt(sBytes);
    end
    else
    begin // Tenemos en cuenta el último fichero válido encontrado para añadir con éxito "Fin"
      if FindFirst(Dir + (Inicio.ToInteger - sBytes.ToInteger).ToString + '_*',
        faAnyFile, SearchResult) = 0 then
        if IsValidOffsetFileName(SearchResult.Name, IniAux, FinAux) then
        begin
          with Form1.ListView1.Items.Add do
          begin
            if Form1.RadAvFucker.Checked then
            begin
              Caption := (Inicio.ToInteger - Acumulados).ToString;
              SubItems.Add(((IniAux.ToInteger + FinAux.ToInteger) - 1)
                .ToString);
            end
            else if Form1.RadDSplit.Checked then
            begin
              Caption := (Inicio.ToInteger - sBytes.ToInteger).ToString;
              if ((IniAux.ToInteger + FinAux.ToInteger) - 1 > TamFich) then
                SubItems.Add(((Inicio.ToInteger - sBytes.ToInteger) +
                  sBytes.ToInteger - ((Inicio.ToInteger - sBytes.ToInteger) +
                  ((FinAux.ToInteger - 1) - TamFich)) - 1).ToString)
              else
                SubItems.Add(((IniAux.ToInteger + FinAux.ToInteger) - 1)
                  .ToString);
            end;
          end;
          Application.ProcessMessages;
        end;
      Acumulados := 0;
    end;
    FindClose(SearchResult);
    Inicio := (Inicio.ToInteger + sBytes.ToInteger).ToString;
  end;
  if (Form1.CheckAll.Checked) and (Form1.ListView1.Items.Count > 0) then
    for i := 0 to Form1.ListView1.Items.Count - 1 do
      Form1.ListView1.Items.Item[i].Checked := True;
end;

procedure TForm1.BtnMostrarListaClick(Sender: TObject);
begin
  if (FileExists(EdFichero.Text)) and (System.SysUtils.DirectoryExists(EdDir.Text)) then
    AddToList;
end;

procedure TForm1.BtnAVFListaClick(Sender: TObject);
var
  Vaciar: Boolean;
begin
  if not(FileExists(EdFichero.Text)) or not(System.SysUtils.DirectoryExists(EdDir.Text)) then
    Exit;
  BtnListado := True;
  Vaciar := CheckVaciar.Checked;
  BDetener.Visible := True;
  BtnDetenerLista.Visible := True;
  TIniciar := HPrincipal.Create(False);
  TIniciar.WaitFor;
  ListView1.clear;
  BDetener.Visible := False;
  CheckVaciar.Checked := Vaciar;
  BtnListado := False;
  BtnDetenerLista.Visible := False;
end;

procedure TForm1.BtnDetenerListaClick(Sender: TObject);
begin
  if TIniciar <> nil then
    TIniciar.Terminate;
  Estado.Caption := Var18;
  BtnDetenerLista.Visible := False;
end;

procedure TForm1.BtnDetenerRClick(Sender: TObject);
begin
  if TIniciarR <> nil then
    TIniciarR.Terminate;
  Estado.Caption := Var18;
  BtnDetenerR.Visible := False;
end;

procedure TForm1.C1Click(Sender: TObject);
begin
  if OpenDialog2.Execute then
    Try
      Traduce(OpenDialog2.FileName);
      RutaIdioma:= OpenDialog2.FileName;
    Except
    End;
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

procedure TForm1.ChkRevFinalClick(Sender: TObject);
begin
  if ChkRevFinal.Checked then
  begin
    CheckBox1.Enabled := False;
    CheckBox1.Checked := False;
    Edit5.Enabled := False;
  end
  else
  begin
    CheckBox1.Enabled := True;
    Edit5.Enabled := True;
  end;
end;

procedure TForm1.BtnIniciarClick(Sender: TObject);
var
  Vaciar: Boolean;
begin
  if not FileExists(EdFichero.Text) or not System.SysUtils.DirectoryExists
    (EdDir.Text) then
  begin
    Form1.Estado.Caption := Var48;
    Exit;
  end;
  ListView1.clear;
  BDetener.Visible := True;
  BtnMostrarLista.Enabled:= False;
  Vaciar := False;
  if RadComb.Checked then
    Vaciar := CheckVaciar.Checked;
  TIniciar := HPrincipal.Create(False);
  TIniciar.WaitFor;
  BDetener.Visible := False;
  BtnMostrarLista.Enabled:= True;
  if (CheckGen.Checked) and NOT(RadComb.Checked) then
    AddToList;
  if RadComb.Checked then
    CheckVaciar.Checked := Vaciar;
end;

procedure TForm1.EdBytesDblClick(Sender: TObject);
begin
  EdBytes.Text := '1000';
end;

procedure TForm1.EdEsperaDblClick(Sender: TObject);
begin
  EdEspera.Text := '750';
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

procedure TForm1.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
  HexChars := ['0' .. '9', ' ', #8];
  if not(CharInSet(Key, HexChars)) then
    Key := #0;
end;

procedure TForm1.Edit4Change(Sender: TObject);
begin
  Label18.Caption := Var31 + ' ' +
    ExtractFileExt(Edit4.Text);
  ListarFicheros;
end;

procedure TForm1.Edit6KeyPress(Sender: TObject; var Key: Char);
begin
  HexChars := ['0' .. '9', ' ', #8];
  if not(CharInSet(Key, HexChars)) then
    Key := #0;
end;

procedure TForm1.Edit7KeyPress(Sender: TObject; var Key: Char);
begin
  HexChars := ['0' .. '9', 'A' .. 'F', 'a' .. 'f', #8];
  if not(CharInSet(Key, HexChars)) then
    Key := #0;
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

procedure TForm1.EdValorDblClick(Sender: TObject);
begin
  EdValor.Text := '90';
end;

procedure TForm1.EdValorKeyPress(Sender: TObject; var Key: Char);
begin
  HexChars := ['0' .. '9', 'A' .. 'F', 'a' .. 'f', #8];
  if not(CharInSet(Key, HexChars)) then
    Key := #0;
end;

procedure TForm1.Eliminarseleccionados1Click(Sender: TObject);
begin
  if ListView1.SelCount > 0 then
    ListView1.DeleteSelected;
end;

procedure TForm1.Eliminartodoslosajustesyresetearaplicacin1Click
  (Sender: TObject);
var
  ResAnotador: TResourceStream;
begin
  try
    ResAnotador := TResourceStream.Create(HInstance, 'ANOTADOR', RT_RCDATA);
    try
      ResAnotador.SaveToFile('Anotador.exe');
    finally
      Estado.Caption := Var49;
      ResAnotador.Free;
    end;
  except
    Estado.Caption := Var50;
  end;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  EscribeIni;
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
      EdInicio.Text := '1000';
      EdFin.Text := FichTam;
      Label8.Caption := Var51 + ' ' + FichTam;
      Label9.Caption := Var51 + ' ' + FichTam;
      Label10.Caption := Var51 + ' ' + FichTam;
      Label15.Caption := Var51 + ' ' + FichTam;
      Label16.Caption := Var51 + ' ' + FichTam;
      Label18.Caption := Var31 + ' ' +
        ExtractFileExt(OpenDialog1.FileName);
      Estado.Caption := Var30;
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
      Estado.Caption := Var34;
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
    Dir := Opt.ReadString('Locator', 'Dir', Var52);
    Recordar := Opt.ReadBool('Locator', 'Recordar', False);
    RutaIdioma:= Opt.ReadString('UOS', 'RutaIdioma', RutaIdioma);
    // Skin := Opt.ReadString('UOS', 'Skin', 'Smokey Quartz Kamri');
    if Skin = 'Smokey Quartz Kamri' then
      N11.Checked := True;
    if Skin = 'Amethyst Kamri' then
      N21.Checked := True;
    if Skin = 'Carbon' then
      N31.Checked := True;
    if Skin = 'Metropolis UI Black' then
      N41.Checked := True;
    if Skin = 'Windows' then
      N1.Checked := True;

    if Recordar then
    begin
      EdDir.Text := Dir;
      ChkRecordar.Checked := True;
    end;
  Finally
    Opt.Free;
  End;

  Try
    Traduce(RutaIdioma);
  Except
  End;

  // Cambia proporcionalmente el tamaño del form y controles según resolución en base al alto (800 px)  ScaleBy(Screen.Height, 800);
  ScaleBy(Screen.Height, 800);
  DragAcceptFiles(Handle, True);
end;

procedure TForm1.GuardarSeleccionadosenListaaparte1Click(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to ListView1.Items.Count - 1 do
    if ListView1.Items.Item[i].Selected then
      with Form3.ListView1.Items.Add do
      begin
        Caption := ListView1.Items.Item[i].Caption;
        SubItems.Add(ListView1.Items.Item[i].SubItems[0]);
        SubItems.Add(EdBytes.Text);
      end;
  Estado.Caption := Var53;
end;

procedure TForm1.GuardarTodasenListaAparte1Click(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to ListView1.Items.Count - 1 do
    with Form3.ListView1.Items.Add do
    begin
      Caption := ListView1.Items.Item[i].Caption;
      SubItems.Add(ListView1.Items.Item[i].SubItems[0]);
      SubItems.Add(EdBytes.Text);
    end;
  Estado.Caption := Var53;
end;

procedure TForm1.Limpiar1Click(Sender: TObject);
begin
  ListView1.clear;
end;

procedure TForm1.ListView1Change(Sender: TObject; Item: TListItem;
  Change: TItemChange);
var
  i, Checks: Integer;
begin
  Checks := 0;
  for i := 0 to ListView1.Items.Count - 1 do
    if ListView1.Items.Item[i].Checked then
      Inc(Checks);

  if Checks > 0 then
  begin
    ChkRestar.Enabled := True;
    ChkAv1Byte.Enabled := True;
    if RadAvFucker.Checked then
    begin
      BtnAVFLista.Enabled := True;
      BtnDetenerLista.Enabled := True;
      ChkAv1Byte.Enabled := True;
    end
    else
    begin
      BtnAVFLista.Enabled := False;
      BtnDetenerLista.Enabled := False;
      ChkAv1Byte.Enabled := False;
    end;
  end
  else
  begin
    ChkRestar.Enabled := False;
    ChkAv1Byte.Enabled := False;
    if RadAvFucker.Checked then
    begin
      BtnAVFLista.Enabled := True;
      BtnDetenerLista.Enabled := True;
      ChkAv1Byte.Enabled := True;
    end
    else
    begin
      BtnAVFLista.Enabled := False;
      BtnDetenerLista.Enabled := False;
      ChkAv1Byte.Enabled := False;
    end;
  end;
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
  if Item.SubItems[0] = Var7 then
    Sender.Canvas.Font.Color := clGreen
  else
    Sender.Canvas.Font.Color := clRed;
end;

procedure TForm1.MostrarListaAlmacenada1Click(Sender: TObject);
begin
  Form3.ShowModal;
end;

procedure TForm1.N11Click(Sender: TObject);
begin
  if Application.MessageBox(PChar(Var54),
    '', MB_YESNO + MB_ICONWARNING) = ID_YES then
  begin
    N11.Checked := True;
    Skin := 'Smokey Quartz Kamri';
    EscribeIni;
    ShellExecute(0, nil, PChar(ParamStr(0)), nil, nil, SW_NORMAL);
    Application.Terminate;
  end;
end;

procedure TForm1.N1Click(Sender: TObject);
begin
  if Application.MessageBox(PChar(Var54),
    '', MB_YESNO + MB_ICONWARNING) = ID_YES then
  begin
    N1.Checked := True;
    Skin := 'Windows';
    EscribeIni;
    ShellExecute(0, nil, PChar(ParamStr(0)), nil, nil, SW_NORMAL);
    Application.Terminate;
  end;
end;

procedure TForm1.N21Click(Sender: TObject);
begin
  if Application.MessageBox(PChar(Var54),
    '', MB_YESNO + MB_ICONWARNING) = ID_YES then
  begin
    N21.Checked := True;
    Skin := 'Amethyst Kamri';
    EscribeIni;
    ShellExecute(0, nil, PChar(ParamStr(0)), nil, nil, SW_NORMAL);
    Application.Terminate;
  end;
end;

procedure TForm1.N31Click(Sender: TObject);
begin
  if Application.MessageBox(PChar(Var54),
    '', MB_YESNO + MB_ICONWARNING) = ID_YES then
  begin
    N31.Checked := True;
    Skin := 'Carbon';
    EscribeIni;
    ShellExecute(0, nil, PChar(ParamStr(0)), nil, nil, SW_NORMAL);
    Application.Terminate;
  end;
end;

procedure TForm1.N41Click(Sender: TObject);
begin
  if Application.MessageBox(PChar(Var54),
    '', MB_YESNO + MB_ICONWARNING) = ID_YES then
  begin
    N41.Checked := True;
    Skin := 'Metropolis UI Black';
    EscribeIni;
    ShellExecute(0, nil, PChar(ParamStr(0)), nil, nil, SW_NORMAL);
    Application.Terminate;
  end;
end;

// Popupmenu Lotator-Lisview
procedure TForm1.PopupMenu1Popup(Sender: TObject);
begin
  if FileExists(EdFichero.Text) then
    PopupMenu1.Items.Items[0].Enabled := True
  else
    PopupMenu1.Items.Items[0].Enabled := False;

  if ListView1.SelCount > 0 then
  begin
    PopupMenu1.Items.Items[1].Enabled := True;
    PopupMenu1.Items.Items[3].Enabled := True;
  end
  else
  begin
    PopupMenu1.Items.Items[1].Enabled := False;
    PopupMenu1.Items.Items[3].Enabled := False;
  end;

  if ListView1.Items.Count = 0 then
  begin
    PopupMenu1.Items.Items[2].Enabled := False;
    PopupMenu1.Items.Items[4].Enabled := False;
  end
  else
  begin
    PopupMenu1.Items.Items[2].Enabled := True;
    PopupMenu1.Items.Items[4].Enabled := True;
  end;
end;

procedure TForm1.RadAvFuckerClick(Sender: TObject);
begin
  if RadAvFucker.Checked then
  begin
    ListView1.clear;
    EdValor.Enabled := True;
    CheckAll.Enabled := True;
    BtnAVFLista.Enabled := False;
    BtnDetenerLista.Enabled := False;
    ChkAv1Byte.Enabled := False;
    ChkRestar.Enabled := False;
    Label1.Visible := True;
    Label2.Visible := True;
    Label3.Visible := True;
    Label4.Visible := True;
    BtnMostrarLista.Enabled := True;
    GroupBox2.Visible := False;
    ChkAleatorio.Enabled := True;
    ChkAleatorio.Visible := True;
  end;
end;

procedure TForm1.RadCombClick(Sender: TObject);
begin
  if RadComb.Checked then
  begin
    ListView1.clear;
    Label1.Visible := False;
    Label2.Visible := False;
    Label3.Visible := False;
    Label4.Visible := False;
    BtnMostrarLista.Enabled := False;
    CheckAll.Enabled := False;
    ChkRestar.Enabled := False;
    BtnAVFLista.Enabled := False;
    GroupBox2.Visible := True;
    ChkAleatorio.Visible := False;
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
    ListView1.clear;
    EdValor.Enabled := False;
    CheckAll.Enabled := True;
    BtnAVFLista.Enabled := False;
    BtnDetenerLista.Enabled := False;
    ChkAv1Byte.Enabled := False;
    ChkRestar.Enabled := False;
    Label1.Visible := True;
    Label2.Visible := True;
    Label3.Visible := True;
    Label4.Visible := True;
    BtnMostrarLista.Enabled := True;
    GroupBox2.Visible := False;
    ChkAleatorio.Enabled := False;
    ChkAleatorio.Visible := True;
  end;
end;

procedure TForm1.RadioButton1Click(Sender: TObject);
begin
  if RadioButton1.Checked then
  begin
    Edit4.Enabled := False;
    Label18.Caption := Var31 + ' ' +
      ExtractFileExt(EdFichero.Text);
    ListarFicheros;
  end;
end;

procedure TForm1.RadioButton2Click(Sender: TObject);
begin
  if RadioButton2.Checked then
  begin
    Edit4.Enabled := True;
    Label18.Caption := Var31 + ' ' +
      ExtractFileExt(Edit4.Text);
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
  EdDir.Visible := True;
  Button2.Visible := True;
  Escala := (Screen.Height * 100) / 800;
  Form1.ClientHeight := Round((490 * Escala) / 100);
end;

procedure TForm1.TabSheet2Show(Sender: TObject);
var
  Escala: Real;
begin
  EdDir.Visible := True;
  Button2.Visible := True;
  Escala := (Screen.Height * 100) / 800;
  Form1.ClientHeight := Round((225 * Escala) / 100);
end;

procedure TForm1.TabSheet3Show(Sender: TObject);
var
  Escala: Real;
begin
  EdDir.Visible := True;
  Button2.Visible := True;
  Escala := (Screen.Height * 100) / 800;
  Form1.ClientHeight := Round((490 * Escala) / 100);
  ListarFicheros;
end;

procedure TForm1.TabSheet4Show(Sender: TObject);
var
  Escala: Real;
begin
  EdDir.Visible := False;
  Button2.Visible := False;
  Escala := (Screen.Height * 100) / 800;
  Form1.ClientHeight := Round((155 * Escala) / 100);
end;

procedure TForm1.Visitarenlacedelproyecto1Click(Sender: TObject);
begin
  ShellExecute(0, 'OPEN',
    'http://foro.udtools.net/forumdisplay.php?110-UdTools-Offset-Suite-(Object-Pascal)',
    nil, nil, SW_SHOW);
end;

end.
