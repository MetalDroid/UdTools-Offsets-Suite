unit uThreadChecker;

interface

uses
  System.Classes, Winapi.tlHelp32, Winapi.Windows, System.SysUtils, Winapi.Shellapi,
  Winapi.Messages, Vcl.Forms;

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
  ProcessEntry  : TProcessEntry32;
  hSnapshot     : THandle;
begin
  hSnapshot:= CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  ProcessEntry.dwSize:= SizeOf(ProcessEntry32);
  Process32First(hSnapshot, ProcessEntry);
  while Process32Next(hSnapshot, ProcessEntry) do
    if ProcessEntry.szExeFile = ProcessName then
      TerminateProcess(OpenProcess(PROCESS_TERMINATE, False, ProcessEntry.th32ProcessID), 0);
  CloseHandle(hSnapshot);
end;

// Procedimiento para ejecutar, matar procesos y errores
Procedure HChecker.CheckAndKill;
var
  i, o: integer;
  TotalFiles, Espera: Integer;
  FicheroActual, RutaCompleta, Dir: String;
  hFindW: HWND;
begin
  Dir:= Form1.EdDir.Text;
  if Form1.EdEspera.Text = '' then
    Espera:= 750
  else
    Espera:= StrToInt(Form1.EdEspera.Text);

  TotalFiles:= Form1.ListView2.Items.Count;
  if TotalFiles = 0 then
    begin
      Form1.Estado.SimpleText:= 'No hay ficheros para comprobar.';
      Exit;
    end;
  for i := 0 to TotalFiles -1 do
    begin
      if Terminated then
        Exit;
      FicheroActual:= ExtractFileName(Form1.ListView2.Items.Item[i].Caption);
      RutaCompleta:= Form1.ListView2.Items.Item[i].Caption;
      Form1.Estado.SimpleText:= 'Comprobando fichero: ' + FicheroActual;
      ShellExecute(0, 'open', PChar(RutaCompleta), nil, nil, SW_SHOW);
      Sleep(Espera);
      if FileExists(Dir + '\funcionales.txt') = true then  //Error en esta zona, se bloquea!!!!)
        begin
          while FileExists(Dir + '\funcionales.txt') do  //experimento
            DeleteFile(PChar(Dir + '\funcionales.txt'));
          Form1.ListView2.Items.Item[i].SubItems[0]:= 'Sí';
          application.ProcessMessages;
        end
        else
        begin
          Form1.ListView2.Items.Item[i].SubItems[0]:= 'No';
          Application.ProcessMessages;
        end;
      hFindW := FindWindow('#32770', nil);
      PostMessage(hFindW, WM_CLOSE, 0, 0);
      PostMessage(hFindW, WM_QUIT, 0, 0);
      KillProcessByName(FicheroActual);
    end;
  //Le damos unas pasadas por si algún cabrón no se cerró
  for o := 1 to 5 do
    for i := 0 to TotalFiles -1 do
      begin
        if Terminated then
          Exit;
        Form1.Estado.SimpleText:= 'Buscando procesos no cerrados...';
        Application.ProcessMessages;
        FicheroActual:= ExtractFileName(Form1.ListView2.Items.Item[i].Caption);
        hFindW := FindWindow('#32770', nil);
        PostMessage(hFindW, WM_CLOSE, 0, 0);
        PostMessage(hFindW, WM_QUIT, 0, 0);
        KillProcessByName(FicheroActual);
    end;
  Form1.Estado.SimpleText:= 'Proceso completado.';
end;
{ 
  Important: Methods and properties of objects in visual components can only be
  used in a method called using Synchronize, for example,

      Synchronize(UpdateCaption);  

  and UpdateCaption could look like,

    procedure HChecker.UpdateCaption;
    begin
      Form1.Caption := 'Updated in a thread';
    end; 
    
    or 
    
    Synchronize( 
      procedure 
      begin
        Form1.Caption := 'Updated in thread via an anonymous method' 
      end
      )
    );
    
  where an anonymous method is passed.
  
  Similarly, the developer can call the Queue method with similar parameters as 
  above, instead passing another TThread class as the first parameter, putting
  the calling thread in a queue with the other thread.
    
}

{ HChecker }

procedure HChecker.Execute;
begin
  Synchronize(CheckAndKill);
  { Place thread code here }
end;

end.
