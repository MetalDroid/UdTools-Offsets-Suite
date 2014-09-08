object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'UdTools Offset Suite'
  ClientHeight = 480
  ClientWidth = 348
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PrintScale = poNone
  Scaled = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 348
    Height = 480
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Offset Locator'
      object Label1: TLabel
        Left = 3
        Top = 91
        Width = 29
        Height = 13
        Caption = 'Inicio:'
      end
      object Label2: TLabel
        Left = 3
        Top = 118
        Width = 18
        Height = 13
        Caption = 'Fin:'
      end
      object Label3: TLabel
        Left = 3
        Top = 145
        Width = 31
        Height = 13
        Caption = 'Bytes:'
      end
      object Label4: TLabel
        Left = 3
        Top = 172
        Width = 28
        Height = 13
        Caption = 'Valor:'
      end
      object EdFichero: TEdit
        Left = 3
        Top = 3
        Width = 305
        Height = 21
        TabOrder = 0
        Text = 'Ruta del fichero'
      end
      object EdDir: TEdit
        Left = 3
        Top = 30
        Width = 305
        Height = 21
        TabOrder = 1
        Text = 'Directorio de trabajo'
      end
      object Button1: TButton
        Left = 314
        Top = 3
        Width = 23
        Height = 21
        Caption = '...'
        TabOrder = 2
        OnClick = Button1Click
      end
      object Button2: TButton
        Left = 314
        Top = 30
        Width = 23
        Height = 21
        Caption = '...'
        TabOrder = 3
        OnClick = Button2Click
      end
      object RadAvFucker: TRadioButton
        Left = 44
        Top = 57
        Width = 113
        Height = 17
        Caption = 'AvFucker'
        Checked = True
        TabOrder = 4
        TabStop = True
        OnClick = RadAvFuckerClick
      end
      object RadDSplit: TRadioButton
        Left = 216
        Top = 57
        Width = 54
        Height = 17
        Caption = 'DSplit'
        TabOrder = 5
        OnClick = RadDSplitClick
      end
      object EdInicio: TEdit
        Left = 44
        Top = 88
        Width = 83
        Height = 21
        NumbersOnly = True
        TabOrder = 6
        Text = '1000'
        OnDblClick = EdInicioDblClick
      end
      object EdFin: TEdit
        Left = 44
        Top = 115
        Width = 83
        Height = 21
        NumbersOnly = True
        TabOrder = 7
        Text = '0'
        OnDblClick = EdFinDblClick
      end
      object EdBytes: TEdit
        Left = 44
        Top = 142
        Width = 83
        Height = 21
        NumbersOnly = True
        TabOrder = 8
        Text = '1000'
        OnDblClick = EdBytesDblClick
      end
      object EdValor: TEdit
        Left = 44
        Top = 169
        Width = 20
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 2
        TabOrder = 9
        Text = '90'
        OnKeyPress = EdValorKeyPress
      end
      object GroupBox1: TGroupBox
        Left = 144
        Top = 80
        Width = 193
        Height = 110
        Caption = 'Opciones'
        TabOrder = 10
        object CheckVaciar: TCheckBox
          Left = 16
          Top = 16
          Width = 161
          Height = 17
          Caption = 'Vaciar directorio de trabajo.'
          TabOrder = 0
        end
        object CheckBox2: TCheckBox
          Left = 16
          Top = 48
          Width = 145
          Height = 17
          Caption = 'Generar lista al terminar.'
          TabOrder = 1
        end
        object CheckBox3: TCheckBox
          Left = 16
          Top = 82
          Width = 174
          Height = 17
          Caption = 'Recordar directorio de trabajo.'
          TabOrder = 2
        end
      end
      object ListView1: TListView
        Left = 3
        Top = 228
        Width = 334
        Height = 165
        Checkboxes = True
        Columns = <
          item
            AutoSize = True
            Caption = 'Inicio'
          end
          item
            AutoSize = True
            Caption = 'Fin'
          end>
        GridLines = True
        ReadOnly = True
        RowSelect = True
        TabOrder = 11
        ViewStyle = vsReport
      end
      object BtnIniciar: TButton
        Left = 3
        Top = 197
        Width = 86
        Height = 25
        Caption = 'Iniciar'
        TabOrder = 12
        OnClick = BtnIniciarClick
      end
      object CheckBox4: TCheckBox
        Left = 3
        Top = 401
        Width = 102
        Height = 17
        Caption = 'Seleccionar todos.'
        Checked = True
        State = cbChecked
        TabOrder = 13
      end
      object Button6: TButton
        Left = 168
        Top = 401
        Width = 169
        Height = 25
        Caption = 'AvFuck al listado'
        TabOrder = 14
      end
      object Estado: TStatusBar
        Left = 0
        Top = 433
        Width = 340
        Height = 19
        Panels = <>
        SimplePanel = True
      end
      object Button5: TButton
        Left = 251
        Top = 197
        Width = 86
        Height = 25
        Caption = 'Mostrar lista'
        TabOrder = 16
      end
      object Button4: TButton
        Left = 123
        Top = 197
        Width = 94
        Height = 25
        Caption = '256 comb.'
        TabOrder = 17
      end
      object BDetener: TButton
        Left = 3
        Top = 197
        Width = 86
        Height = 25
        Caption = 'Detener'
        TabOrder = 18
        Visible = False
        OnClick = BDetenerClick
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Offsets Patcher'
      ImageIndex = 1
    end
    object TabSheet3: TTabSheet
      Caption = 'Offsets Replacer'
      ImageIndex = 2
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 280
    Top = 24
  end
end
