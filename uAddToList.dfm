object Form2: TForm2
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'A'#241'adir Offsets'
  ClientHeight = 273
  ClientWidth = 248
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PrintScale = poNone
  Scaled = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 39
    Width = 29
    Height = 13
    Caption = 'Inicio:'
  end
  object Label2: TLabel
    Left = 136
    Top = 37
    Width = 18
    Height = 13
    Caption = 'Fin:'
  end
  object RadProgresivo: TRadioButton
    Left = 16
    Top = 16
    Width = 113
    Height = 17
    Caption = 'Progresivo'
    Checked = True
    TabOrder = 0
    TabStop = True
    OnClick = RadProgresivoClick
  end
  object RadSelectivo: TRadioButton
    Left = 16
    Top = 96
    Width = 177
    Height = 17
    Caption = 'Selectivo (separa con espacios)'
    TabOrder = 1
    OnClick = RadSelectivoClick
  end
  object RichEdSelectivo: TRichEdit
    Left = 24
    Top = 119
    Width = 193
    Height = 89
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    Zoom = 100
    OnKeyPress = RichEdSelectivoKeyPress
  end
  object EdInicio: TEdit
    Left = 24
    Top = 56
    Width = 81
    Height = 21
    NumbersOnly = True
    TabOrder = 3
    Text = '0'
  end
  object EdFin: TEdit
    Left = 136
    Top = 56
    Width = 81
    Height = 21
    NumbersOnly = True
    TabOrder = 4
    Text = '0'
  end
  object Button1: TButton
    Left = 72
    Top = 225
    Width = 97
    Height = 25
    Caption = 'A'#241'adir al Listado'
    TabOrder = 5
    OnClick = Button1Click
  end
  object Panel1: TPanel
    Left = 0
    Top = 256
    Width = 248
    Height = 17
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 6
  end
end
