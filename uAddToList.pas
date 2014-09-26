unit uAddToList;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.ExtCtrls;

type
  TForm2 = class(TForm)
    RadProgresivo: TRadioButton;
    RadSelectivo: TRadioButton;
    RichEdSelectivo: TRichEdit;
    EdInicio: TEdit;
    EdFin: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    Panel1: TPanel;
    procedure RichEdSelectivoKeyPress(Sender: TObject; var Key: Char);
    procedure RadProgresivoClick(Sender: TObject);
    procedure RadSelectivoClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  HexChars: TSysCharSet;

implementation

{$R *.dfm}

uses
  uUOS;

procedure TForm2.Button1Click(Sender: TObject);
var
  Fichero: string;
  OffIni: string;
  OffFin: string;
  OffsetsEspacios: string;
  OffAct: string;
  TamFich: DWORD;
  OffActAux: Integer;
begin
  Fichero := Form1.EdFichero.Text;
  TamFich := GetCompressedFileSize(PChar(Fichero), nil) - 1;

  if RadProgresivo.Checked then
  begin
    OffIni := Form2.EdInicio.Text;
    OffFin := Form2.EdFin.Text;
    if (OffIni = '') or (OffFin = '') then
      raise Exception.Create('Secuencia no permitida.');

    if (OffIni.ToInteger > TamFich) or (OffFin.ToInteger > TamFich) or
      (OffIni.ToInteger < 0) or (OffFin.ToInteger < 0) or
      (OffFin.ToInteger < OffIni.ToInteger) then
      raise Exception.Create('Secuencia no permitida.');

    With Form1.ListView1.Items.Add do
    begin
      Caption := OffIni;
      SubItems.Add(OffFin);
      if Form1.CheckAll.Checked then
        Checked := True;
    end;
  end;

  if RadSelectivo.Checked then
  begin
    OffsetsEspacios := RichEdSelectivo.Text;
    repeat
      OffsetsEspacios := Trim(OffsetsEspacios);
      OffsetsEspacios := OffsetsEspacios + ' ';
      OffAct := Copy(OffsetsEspacios, 1, pos(' ', OffsetsEspacios) - 1);
      if OffAct <> '' then
      begin
        OffActAux := OffAct.ToInteger;
        if NOT(OffActAux > TamFich) or (OffActAux < 0) then
          // Con NOT ignoramos las offsets no válidas
          With Form1.ListView1.Items.Add do
          begin
            Caption := OffAct;
            SubItems.Add(OffAct);
            if Form1.CheckAll.Checked then
              Checked := True;
          end;
      end;
      Delete(OffsetsEspacios, 1, pos(' ', OffsetsEspacios));
    until Length(OffAct) = 0;
  end;

  Form1.Estado.Caption := 'Se añadieron offsets a la lista.';
  Form2.Close;
end;

procedure TForm2.FormShow(Sender: TObject);
begin
  Panel1.Caption := 'Info: Offset máxima permitida:' + ' ' +
    IntToStr(Integer(GetCompressedFileSize(PChar(Form1.EdFichero.Text),
    nil)) - 1);
end;

procedure TForm2.RadProgresivoClick(Sender: TObject);
begin
  if RadProgresivo.Checked then
  begin
    EdInicio.Enabled := True;
    EdFin.Enabled := True;
    Label1.Enabled := True;
    Label2.Enabled := True;
    RichEdSelectivo.Enabled := False;
  end;
end;

procedure TForm2.RadSelectivoClick(Sender: TObject);
begin
  if RadSelectivo.Checked then
  begin
    EdInicio.Enabled := False;
    EdFin.Enabled := False;
    Label1.Enabled := False;
    Label2.Enabled := False;
    RichEdSelectivo.Enabled := True;
  end;
end;

procedure TForm2.RichEdSelectivoKeyPress(Sender: TObject; var Key: Char);
begin
  HexChars := ['0' .. '9', ' ', #8];
  if not(CharInSet(Key, HexChars)) then
    Key := #0;
end;

end.
