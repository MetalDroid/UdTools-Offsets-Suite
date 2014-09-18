object Form2: TForm2
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'A'#241'adir Offsets'
  ClientHeight = 260
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
  object RadioButton1: TRadioButton
    Left = 16
    Top = 16
    Width = 113
    Height = 17
    Caption = 'Progresivo'
    Checked = True
    TabOrder = 0
    TabStop = True
  end
  object RadioButton2: TRadioButton
    Left = 16
    Top = 96
    Width = 177
    Height = 17
    Caption = 'Selectivo (separa con espacios)'
    TabOrder = 1
  end
  object RichEdit1: TRichEdit
    Left = 24
    Top = 119
    Width = 193
    Height = 89
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      'RichEdit1')
    ParentFont = False
    TabOrder = 2
    Zoom = 100
  end
  object Edit1: TEdit
    Left = 24
    Top = 56
    Width = 81
    Height = 21
    NumbersOnly = True
    TabOrder = 3
    Text = '0'
  end
  object Edit2: TEdit
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
    Top = 221
    Width = 97
    Height = 25
    Caption = 'A'#241'adir al Listado'
    TabOrder = 5
  end
end
