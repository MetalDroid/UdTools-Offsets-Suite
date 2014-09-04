program UOS;

uses
  Vcl.Forms,
  uUOS in 'uUOS.pas' {Form1},
  Vcl.Themes,
  Vcl.Styles,
  uFunciones in 'uFunciones.pas',
  uThread in 'uThread.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Smokey Quartz Kamri');
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
