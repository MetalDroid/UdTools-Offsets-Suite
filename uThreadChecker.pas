unit uThreadChecker;

interface

uses
  System.Classes, Winapi.tlHelp32, Winapi.Windows, System.SysUtils,
  Winapi.Shellapi,
  Winapi.Messages, Vcl.Forms, Vcl.Graphics, uIdiomas;

type
  HChecker = class(TThread)
  private
    procedure CheckAndKill;
    { Private declarations }
  protected
    procedure Execute; override;
  end;

implementation

uses
  uUOS;

// Simple mataprocesos por nombre
Procedure KillProcessByName(ProcessName: String);
var
  ProcessEntry: TProcessEntry32;
  hSnapshot: THandle;
begin
  hSnapshot := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  ProcessEntry.dwSize := SizeOf(ProcessEntry32);
  Process32First(hSnapshot, ProcessEntry);
  while Process32Next(hSnapshot, ProcessEntry) do
    if ProcessEntry.szExeFile = ProcessName then
      TerminateProcess(OpenProcess(PROCESS_TERMINATE, False,
        ProcessEntry.th32ProcessID), 0);
  CloseHandle(hSnapshot);
end;

// Procedimiento para ejecutar, matar procesos y errores
Procedure HChecker.CheckAndKill;
var
  TSFuncionales: TStringList;
  i, o: integer;
  TotalFiles, Espera: integer;
  OFuncionales, Max: integer;
  FicheroActual, RutaCompleta, Dir, Funcionales: String;
  hFindW: HWND;
begin
  OFuncionales := 0;

  if Length(Form1.Edit5.Text) = 0 then
    Max := 0
  else
    Max := StrToInt(Form1.Edit5.Text);

  Dir := Form1.EdDir.Text;
  Funcionales := Dir + '\' + Form1.EdFuncionales.Text;

  if Form1.EdEspera.Text = '' then
    Espera := 750
  else
    Espera := StrToInt(Form1.EdEspera.Text);

  if FileExists(Funcionales) then
    DeleteFile(Funcionales);

  TotalFiles := Form1.ListView2.Items.Count;
  if TotalFiles = 0 then
  begin
    Form1.Estado.Caption := Var5;
    Exit;
  end;
  for i := 0 to TotalFiles - 1 do
  begin
    if Terminated then
      Exit;
    if Form1.CheckBox1.Checked then
      if Max = OFuncionales then
        Break;
    FicheroActual := ExtractFileName(Form1.ListView2.Items.Item[i].Caption);
    RutaCompleta := Form1.ListView2.Items.Item[i].Caption;
    Form1.Estado.Caption := Var6 + ' ' + FicheroActual;
    ShellExecute(0, 'open', PChar(RutaCompleta), nil, nil, SW_SHOW);
    Sleep(Espera);

    if not Form1.ChkRevFinal.Checked then
    begin
      if FileExists(Funcionales) then
      begin
        while FileExists(Funcionales) do
          DeleteFile(Funcionales);
        Form1.ListView2.Items.Item[i].SubItems[0] := Var7;
        Application.ProcessMessages;
        inc(OFuncionales);
      end
      else
      begin
        Form1.ListView2.Items.Item[i].SubItems[0] := Var8;
        Application.ProcessMessages;
      end;
    end
    else
    begin
      Form1.ListView2.Items.Item[i].SubItems[0] := Var9;
      Application.ProcessMessages;
    end;

    if Form1.CheckBox2.Checked then // Scroll ListView2
    begin
      Form1.ListView2.Items.Item[i].Selected := True;
      Form1.ListView2.SetFocus;
      if i > 10 then
        Form1.ListView2.Scroll(0, Abs(Form1.ListView2.Font.Height));
      Application.ProcessMessages;
    end;

    hFindW := 0;
    hFindW := FindWindow('#32770', nil);
    if hFindW <> 0 then
    begin
      PostMessage(hFindW, WM_CLOSE, 0, 0);
      PostMessage(hFindW, WM_QUIT, 0, 0);
    end;
      KillProcessByName(FicheroActual);
  end;

  if Form1.ChkRevFinal.Checked then
    try
      TSFuncionales := TStringList.Create;
      try
        TSFuncionales.LoadFromFile(Funcionales);
        for i := 0 to Form1.ListView2.Items.Count - 1 do
          for o := 0 to TSFuncionales.Count - 1 do
          begin
            if pos(TSFuncionales.Strings[o], Form1.ListView2.Items.Item[i]
              .Caption) <> 0 then
            begin
              Form1.ListView2.Items.Item[i].SubItems[0] := Var7;
              inc(OFuncionales);
              Application.ProcessMessages;
              Break;
            end
            else
            begin
              Form1.ListView2.Items.Item[i].SubItems[0] := Var8;
              Application.ProcessMessages;
            end;
          end;
      except
        for i := 0 to Form1.ListView2.Items.Count - 1 do
          begin
            Form1.ListView2.Items.Item[i].SubItems[0] := Var8;
            Application.ProcessMessages;
          end;
      end;
    finally
      TSFuncionales.Free;
    end;

  // Le damos unas pasadas por si algún cabrón no se cerró
  for o := 1 to 5 do
    for i := 0 to TotalFiles - 1 do
    begin
      if Terminated then
        Exit;
      Form1.Estado.Caption := Var10;
      Application.ProcessMessages;
      if Form1.ListView2.Items.Item[i].SubItems[0] <> '' then
      begin
        FicheroActual := ExtractFileName(Form1.ListView2.Items.Item[i].Caption);
        hFindW := 0;
        hFindW := FindWindow('#32770', nil);
        if hFindW <> 0 then
        begin
          PostMessage(hFindW, WM_CLOSE, 0, 0);
          PostMessage(hFindW, WM_QUIT, 0, 0);
        end;
        KillProcessByName(FicheroActual);
      end;
    end;

  // Si está marcado, eliminamos las no funcionales
  if Form1.ChkElimNoF.Checked then
    for i := 0 to TotalFiles - 1 do
      if Form1.ListView2.Items.Item[i].SubItems[0] = Var8 then
      begin
        DeleteFile(Form1.ListView2.Items.Item[i].Caption);
        Form1.Estado.Caption := Var11;
        Application.ProcessMessages;
      end;

  if NOT Form1.CheckBox1.Checked then
    Form1.Estado.Caption := Var12 + ' ' +
      IntToStr(OFuncionales) + ' ' + Var13
  else if OFuncionales = Max then
    Form1.Estado.Caption := Var14 + ' ' +
      IntToStr(OFuncionales) + ' ' + Var13
  else
    Form1.Estado.Caption := Var12 + ' ' +
      IntToStr(OFuncionales) + ' ' + Var13;
end;

{ HChecker }

procedure HChecker.Execute;
begin
  Synchronize(CheckAndKill);
  { Place thread code here }
end;

end.
