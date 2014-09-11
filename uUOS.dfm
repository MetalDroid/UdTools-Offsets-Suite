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
  OnClose = FormClose
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
        Left = 17
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
        Left = 144
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
          Checked = True
          State = cbChecked
          TabOrder = 0
        end
        object CheckGen: TCheckBox
          Left = 16
          Top = 48
          Width = 145
          Height = 17
          Caption = 'Generar lista al terminar.'
          TabOrder = 1
        end
        object ChkRecordar: TCheckBox
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
        OnDblClick = ListView1DblClick
      end
      object BtnIniciar: TButton
        Left = 3
        Top = 197
        Width = 150
        Height = 25
        Caption = 'Iniciar'
        TabOrder = 12
        OnClick = BtnIniciarClick
      end
      object CheckAll: TCheckBox
        Left = 3
        Top = 401
        Width = 102
        Height = 17
        Caption = 'Seleccionar todos.'
        Checked = True
        State = cbChecked
        TabOrder = 13
        OnClick = CheckAllClick
      end
      object BtnAVFLista: TButton
        Left = 168
        Top = 401
        Width = 169
        Height = 25
        Caption = 'AvFuck al listado'
        TabOrder = 14
        OnClick = BtnAVFListaClick
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
        Left = 187
        Top = 197
        Width = 150
        Height = 25
        Caption = 'Mostrar lista'
        TabOrder = 16
        OnClick = Button5Click
      end
      object BDetener: TButton
        Left = 3
        Top = 197
        Width = 150
        Height = 25
        Caption = 'Detener'
        TabOrder = 17
        Visible = False
        OnClick = BDetenerClick
      end
      object RadComb: TRadioButton
        Left = 250
        Top = 57
        Width = 84
        Height = 17
        Caption = '256 Combin.'
        TabOrder = 18
        OnClick = RadCombClick
      end
      object GroupBox2: TGroupBox
        Left = 3
        Top = 80
        Width = 334
        Height = 110
        Caption = 'Opciones'
        TabOrder = 19
        Visible = False
        object Label5: TLabel
          Left = 37
          Top = 50
          Width = 29
          Height = 13
          Caption = 'Inicio:'
        end
        object Label6: TLabel
          Left = 199
          Top = 50
          Width = 18
          Height = 13
          Caption = 'Fin:'
        end
        object Label7: TLabel
          Left = 14
          Top = 53
          Width = 219
          Height = 13
          Caption = 'Escribe las Offsets separadas con ESPACIOS:'
          Visible = False
        end
        object Label8: TLabel
          Left = 37
          Top = 89
          Width = 23
          Height = 11
          Caption = 'M'#225'x: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label9: TLabel
          Left = 199
          Top = 89
          Width = 23
          Height = 11
          Caption = 'M'#225'x: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label10: TLabel
          Left = 14
          Top = 90
          Width = 23
          Height = 11
          Caption = 'M'#225'x: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Visible = False
        end
        object RadProgresivo: TRadioButton
          Left = 54
          Top = 25
          Width = 81
          Height = 17
          Caption = 'Progresivo'
          Checked = True
          TabOrder = 0
          TabStop = True
          OnClick = RadProgresivoClick
        end
        object RadSelectivo: TRadioButton
          Left = 199
          Top = 25
          Width = 72
          Height = 17
          Caption = 'Selectivo'
          TabOrder = 1
          OnClick = RadSelectivoClick
        end
        object Edit1: TEdit
          Left = 37
          Top = 69
          Width = 82
          Height = 21
          TabOrder = 2
          Text = '0'
        end
        object Edit2: TEdit
          Left = 199
          Top = 69
          Width = 82
          Height = 21
          TabOrder = 3
          Text = '0'
        end
        object Edit3: TEdit
          Left = 14
          Top = 70
          Width = 305
          Height = 21
          TabOrder = 4
          Text = '0'
          Visible = False
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Offsets Patcher'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
    end
    object TabSheet3: TTabSheet
      Caption = 'Offsets Replacer'
      ImageIndex = 2
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 280
    Top = 24
  end
end
