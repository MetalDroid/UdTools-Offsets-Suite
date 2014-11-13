program UOS;

uses
  Vcl.Forms,
  uUOS in 'uUOS.pas' {Form1} ,
  Vcl.Themes,
  Vcl.Styles,
  System.IniFiles,
  System.SysUtils,
  uThreadLocator in 'uThreadLocator.pas',
  uThreadReplacer in 'uThreadReplacer.pas',
  uFuncCompartidas in 'uFuncCompartidas.pas',
  uThreadChecker in 'uThreadChecker.pas',
  uAddToList in 'uAddToList.pas' {Form2} ,
  ABOUT in 'ABOUT.pas' {AboutBox} ,
  uListaGuardada in 'uListaGuardada.pas' {Form3} ,
  uIdiomas in 'uIdiomas.pas';

{$R *.res}
{$R Anotador.res}
{$R Idiomas.res}

var
  Opt: TIniFile;

begin
  Application.Initialize;
  Application.MainFormOnTaskbar:= True;
  Opt:= TIniFile.Create(GetEnvironmentVariable('TEMP') + '\UOS.ini');
  Try
    Skin:= Opt.ReadString('UOS', 'Skin', 'Smokey Quartz Kamri');
  Finally
    Opt.Free;
  End;
  TStyleManager.TrySetStyle(Skin);
  // TStyleManager.TrySetStyle('Smokey Quartz Kamri');
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TAboutBox, AboutBox);
  Application.Run;

end.
