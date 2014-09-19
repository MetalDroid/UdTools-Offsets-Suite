unit About;

interface

uses
  WinApi.Windows, System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Forms, Vcl.Controls,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Winapi.ShellApi, Vcl.Imaging.jpeg;

type
  TAboutBox = class(TForm)
    Panel1: TPanel;
    ProgramIcon: TImage;
    ProductName: TLabel;
    Version: TLabel;
    Copyright: TLabel;
    Comments: TLabel;
    OKButton: TButton;
    Web: TLabel;
    GitHub: TLabel;
    procedure WebClick(Sender: TObject);
    procedure GitHubClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AboutBox: TAboutBox;

implementation

{$R *.dfm}

procedure TAboutBox.GitHubClick(Sender: TObject);
begin
  ShellExecute(0, 'OPEN', 'https://github.com/MetalUDT/UdTools-Offsets-Suite', nil, nil, SW_SHOW);
end;

procedure TAboutBox.WebClick(Sender: TObject);
begin
  ShellExecute(0, 'OPEN', 'http://udtools.net', nil, nil, SW_SHOW);
end;

end.
 
