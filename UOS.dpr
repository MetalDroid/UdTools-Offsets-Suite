program UOS;

uses
  Vcl.Forms,
  uUOS in 'uUOS.pas' {Form1},
  Vcl.Themes,
  Vcl.Styles,
  uThreadLocator in 'uThreadLocator.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Smokey Quartz Kamri');
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
