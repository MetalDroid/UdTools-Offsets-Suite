program UOS;

uses
  Vcl.Forms,
  uUOS in 'uUOS.pas' {Form1},
  Vcl.Themes,
  Vcl.Styles,
  uThreadLocator in 'uThreadLocator.pas',
  uThreadReplacer in 'uThreadReplacer.pas',
  uFuncCompartidas in 'uFuncCompartidas.pas',
  uThreadChecker in 'uThreadChecker.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Smokey Quartz Kamri');
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
