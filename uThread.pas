unit uThread;

interface

uses
  System.Classes, uFunciones, System.SysUtils;

type
  HPrincipal = class(TThread)
  private
    procedure AvFuck;
    procedure Split;
    { Private declarations }
  protected
    procedure Execute; override;
  end;

implementation

uses
  uUOS;

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
