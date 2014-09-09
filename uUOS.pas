unit uUOS;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, uThreadLocator, Vcl.FileCtrl, System.IOUtils;

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
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    TabSheet2: TTabSheet;
    ListView1: TListView;
    TabSheet3: TTabSheet;
    BtnIniciar: TButton;
    Button4: TButton;
    Button5: TButton;
    CheckBox4: TCheckBox;
    Button6: TButton;
    Estado: TStatusBar;
    OpenDialog1: TOpenDialog;
    BDetener: TButton;
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
    procedure CheckBox4Click(Sender: TObject);
  private
    TIniciar: HPrincipal;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.BDetenerClick(Sender: TObject);
begin
  if TIniciar <> nil then
    TIniciar.Terminate;
  Estado.SimpleText := 'Proceso detenido.';
  BDetener.Visible:= False;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
    if FileExists(OpenDialog1.FileName) then
      begin
        EdFichero.Text:= OpenDialog1.FileName;
        EdFin.Text:= IntToStr(Integer(GetCompressedFileSize(PChar(OpenDialog1.FileName), nil))-1); //Tamaño del fichero (offset final)
      end;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  Dir: string;
begin
  if SelectDirectory('Selecciona la carpeta de trabajo.', '', Dir) then
    EdDir.Text:= Dir;
end;

//Comprobar si una cadena es numérica
Function IsNumber(Str: String): Boolean;
var
  i: integer;
const
  Numeros = '0123456789';
begin
  Result:= True;
  for I := 1 to Length(Str) -1 do
    if Pos(Str[i], Numeros) = 0 then
      begin
        Result:= False;
        Break;
      end;
end;
//Función para comprobar los nombres de los ficheros (xxxx_xxxx.xxx)
Function IsValidOffsetFileName(FName: String; var NumI, NumD: String): Boolean;
begin
  Result:= True;
  FName:= TPath.GetFileNameWithoutExtension(FName);
  NumI:= Copy(FName, 1, Pos('_', FName)-1);
  NumD:= Copy(FName, Pos('_', FName)+1, Length(FName) - Pos('_', FName));
  if not(IsNumber(NumI)) or not (IsNumber(NumD)) then
    Result:= False;
end;

//Función para añadir offsets al listado teniendo en cuenta ficheros consecutivos
Procedure AddToList;
var
  SearchResult: TSearchRec;
  Dir, Inicio, Fin, sBytes, IniAux, FinAux: String;
  Acumulados, i, Ficheros, Res: Integer;
begin
  Form1.ListView1.clear;
  Acumulados:= 0;
  Dir:= Form1.EdDir.Text + '\';
  Inicio:= Form1.EdInicio.Text;
  Fin:= Form1.EdFin.Text;
  sBytes:= Form1.EdBytes.Text;
  Ficheros:= StrToInt(Fin) - StrToInt(Inicio);

  if Ficheros <= 0 then
    Ficheros:= 1
  else
    Ficheros:= (StrToInt(Fin) - StrToInt(Inicio)) div StrToInt(sBytes);

  for I := 0 to Ficheros + 1 do
    begin  //Podríamos buscar por "_1000, _2000", etc (sBytes), pero no funcionaría debido al RESTO (último fichero);
      Res:= FindFirst(Dir + Inicio + '_*' , faAnyFile, SearchResult);                                 
      if Res = 0 then
        begin
          Acumulados:= Acumulados + StrToInt(sBytes);
        end
        else 
        begin    //Tenemos en cuenta el último fichero válido encontrado para añadir con éxito "Fin"
          if FindFirst(Dir + IntToStr(StrToInt(Inicio) - StrToInt(sBytes)) + '_*' , faAnyFile, SearchResult) = 0 then  
            if IsValidOffsetFileName(SearchResult.Name, IniAux, FinAux) then
              begin  
                with Form1.ListView1.Items.Add do
                  begin  
                    Caption:= IntToStr(StrToInt(Inicio) - Acumulados);
                    SubItems.Add(IntToStr((StrToInt(iniaux) + StrToInt(FinAux))-1));
                  end;
                Application.ProcessMessages;  
              end;
            Acumulados:= 0;
        end;
      FindClose(SearchResult); 
      Inicio:= IntToStr(StrToInt(Inicio) + StrToInt(sBytes)); 
    end;
  if (Form1.CheckBox4.Checked) and (Form1.ListView1.Items.Count > 0) then
    for I := 0 to Form1.ListView1.Items.Count -1 do
      Form1.ListView1.Items.Item[i].Checked:= True;  
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  AddToList;
end;

procedure TForm1.CheckBox4Click(Sender: TObject);
var
  i: integer;
begin
  if (CheckBox4.Checked) and (Form1.ListView1.Items.Count > 0) then
    for I := 0 to Form1.ListView1.Items.Count -1 do
      Form1.ListView1.Items.Item[i].Checked:= True
  else
  if not(CheckBox4.Checked) and (Form1.ListView1.Items.Count > 0) then
    for I := 0 to Form1.ListView1.Items.Count -1 do
      Form1.ListView1.Items.Item[i].Checked:= False;    
end;

procedure TForm1.BtnIniciarClick(Sender: TObject);
begin
  BDetener.Visible:= True;
  TIniciar:= HPrincipal.Create(False);
  TIniciar.WaitFor;
  BDetener.Visible:= False;
end;

procedure TForm1.EdBytesDblClick(Sender: TObject);
begin
  EdBytes.Text:= '1000';
end;

procedure TForm1.EdFinDblClick(Sender: TObject);
begin
  if FileExists(EdFichero.Text) then
    EdFin.Text:= IntToStr(Integer(GetCompressedFileSize(PChar(EdFichero.Text), nil))-1);
end;

procedure TForm1.EdInicioDblClick(Sender: TObject);
begin
  EdInicio.Text:= '1000';
end;

procedure TForm1.EdValorKeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9', 'A'..'F', 'a'..'f', #8]) then
    key:= #0;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  ScaleBy(Screen.Height, 800); //Cambia proporcionalmente el tamaño del form y controles según resolución en base al alto (800 px)
end;

procedure TForm1.RadAvFuckerClick(Sender: TObject);
begin
  if RadAvFucker.Checked then
    EdValor.Enabled:= True;
end;

procedure TForm1.RadDSplitClick(Sender: TObject);
begin
  if RadDSplit.Checked then
    EdValor.Enabled:= False;
end;

end.
