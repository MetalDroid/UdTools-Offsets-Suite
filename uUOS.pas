unit uUOS;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, uThreadLocator, Vcl.FileCtrl;

type
  TForm1 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    EdFichero: TEdit;
    EdDir: TEdit;
    Button1: TButton;
    Button2: TButton;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    EdInicio: TEdit;
    EdFin: TEdit;
    EdBytes: TEdit;
    EdValor: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    TabSheet2: TTabSheet;
    ListView1: TListView;
    TabSheet3: TTabSheet;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    CheckBox4: TCheckBox;
    Button6: TButton;
    Estado: TStatusBar;
    OpenDialog1: TOpenDialog;
    BDetener: TButton;
    procedure Button3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure BDetenerClick(Sender: TObject);
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
    EdFichero.Text:= OpenDialog1.FileName;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  Dir: string;
begin
  if SelectDirectory('Selecciona la carpeta de trabajo.', '', Dir) then
    EdDir.Text:= Dir;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  BDetener.Visible:= True;
  TIniciar:= HPrincipal.Create(False);
  TIniciar.WaitFor;
  BDetener.Visible:= False;
end;

end.
