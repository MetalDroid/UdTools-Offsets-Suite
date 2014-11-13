unit uListaGuardada;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Menus, uIdiomas;

type
  TForm3 = class(TForm)
    ListView1: TListView;
    Label1: TLabel;
    CheckBox1: TCheckBox;
    Label2: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    Label4: TLabel;
    Edit3: TEdit;
    PopupMenu1: TPopupMenu;
    EliminarSeleccionados1: TMenuItem;
    LimpiarLista1: TMenuItem;
    ChkRestar: TCheckBox;
    procedure LimpiarLista1Click(Sender: TObject);
    procedure EliminarSeleccionados1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure ListView1DblClick(Sender: TObject);
    private
      { Private declarations }
    public
      { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

uses
  uUOS;

procedure TForm3.Button1Click(Sender: TObject);
begin
  if (Edit1.Text = '') or (Edit1.Text = '') or (Edit1.Text = '') then
    Exit;
  with ListView1.Items.Add do
    begin
      Caption:= Edit1.Text;
      SubItems.Add(Edit2.Text);
      SubItems.Add(Edit3.Text);
    end;
end;

procedure TForm3.EliminarSeleccionados1Click(Sender: TObject);
begin
  ListView1.DeleteSelected;
end;

procedure TForm3.LimpiarLista1Click(Sender: TObject);
begin
  ListView1.Clear;
end;

procedure TForm3.ListView1DblClick(Sender: TObject);
begin
  if ListView1.SelCount > 0 then
    begin
      Form1.EdInicio.Text:= ListView1.Selected.Caption;
      Form1.EdFin.Text:= ListView1.Selected.SubItems[0];
      if not ChkRestar.Checked then
        Form1.EdBytes.Text:= ListView1.Selected.SubItems[1]
      else if Length(ListView1.Selected.SubItems[1]) > 1 then
        Form1.EdBytes.Text:= Copy(ListView1.Selected.SubItems[1], 1,
          Length(ListView1.Selected.SubItems[1]) - 1)
      else
        Form1.EdBytes.Text:= ListView1.Selected.SubItems[1];
      if CheckBox1.Checked then
        ListView1.DeleteSelected;
    end;
  Form1.Estado.Caption:= Var1;
  Form3.Close;
end;

procedure TForm3.PopupMenu1Popup(Sender: TObject);
begin
  if ListView1.SelCount = 0 then
    PopupMenu1.Items.Items[0].Enabled:= False
  else
    PopupMenu1.Items.Items[0].Enabled:= True;

  if ListView1.Items.Count = 0 then
    PopupMenu1.Items.Items[1].Enabled:= False
  else
    PopupMenu1.Items.Items[1].Enabled:= True;
end;

end.
