object Form3: TForm3
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Lista guardada'
  ClientHeight = 272
  ClientWidth = 356
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 226
    Width = 266
    Height = 11
    Caption = 
      'Haz doble click a un elemento de la lista para a'#241'adirlo al Locat' +
      'or.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 193
    Width = 32
    Height = 13
    Caption = 'Inicio: '
  end
  object Label3: TLabel
    Left = 100
    Top = 193
    Width = 21
    Height = 13
    Caption = 'Fin: '
  end
  object Label4: TLabel
    Left = 184
    Top = 193
    Width = 31
    Height = 13
    Caption = 'Bytes:'
  end
  object ListView1: TListView
    Left = 8
    Top = 8
    Width = 330
    Height = 177
    Columns = <
      item
        AutoSize = True
        Caption = 'Inicio'
      end
      item
        AutoSize = True
        Caption = 'Fin'
      end
      item
        AutoSize = True
        Caption = 'Bytes'
      end>
    GridLines = True
    MultiSelect = True
    ReadOnly = True
    RowSelect = True
    PopupMenu = PopupMenu1
    TabOrder = 0
    ViewStyle = vsReport
    OnDblClick = ListView1DblClick
  end
  object CheckBox1: TCheckBox
    Left = 8
    Top = 243
    Width = 241
    Height = 17
    Caption = 'Eliminar de la lista una vez a'#241'adido al Locator.'
    Checked = True
    State = cbChecked
    TabOrder = 1
  end
  object Edit1: TEdit
    Left = 43
    Top = 191
    Width = 51
    Height = 21
    TabOrder = 2
    Text = '0'
  end
  object Edit2: TEdit
    Left = 127
    Top = 191
    Width = 51
    Height = 21
    TabOrder = 3
    Text = '0'
  end
  object Button1: TButton
    Left = 288
    Top = 191
    Width = 50
    Height = 21
    Caption = 'A'#241'adir'
    TabOrder = 4
    OnClick = Button1Click
  end
  object Edit3: TEdit
    Left = 221
    Top = 191
    Width = 51
    Height = 21
    TabOrder = 5
    Text = '1000'
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 168
    Top = 136
    object EliminarSeleccionados1: TMenuItem
      Caption = 'Eliminar Seleccionados'
      OnClick = EliminarSeleccionados1Click
    end
    object LimpiarLista1: TMenuItem
      Caption = 'Limpiar Lista'
      OnClick = LimpiarLista1Click
    end
  end
end
