unit uThread;

interface

uses
  System.Classes, uFunciones, System.SysUtils;

type
  HPrincipal = class(TThread)
  private
    procedure AvFuck;
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

{ HPrincipal }

procedure HPrincipal.Execute;
begin
  synchronize(AvFuck);
  { Place thread code here }
end;

end.
