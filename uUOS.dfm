object Form1: TForm1
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'UdTools Offset Suite'
  ClientHeight = 490
  ClientWidth = 358
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
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
    Width = 358
    Height = 472
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Offset Locator'
      OnShow = TabSheet1Show
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
      object RadAvFucker: TRadioButton
        Left = 17
        Top = 57
        Width = 113
        Height = 17
        Caption = 'AvFucker'
        Checked = True
        TabOrder = 0
        TabStop = True
        OnClick = RadAvFuckerClick
      end
      object RadDSplit: TRadioButton
        Left = 144
        Top = 57
        Width = 54
        Height = 17
        Caption = 'DSplit'
        TabOrder = 1
        OnClick = RadDSplitClick
      end
      object EdInicio: TEdit
        Left = 44
        Top = 88
        Width = 83
        Height = 21
        NumbersOnly = True
        TabOrder = 2
        Text = '1000'
        OnDblClick = EdInicioDblClick
      end
      object EdFin: TEdit
        Left = 44
        Top = 115
        Width = 83
        Height = 21
        NumbersOnly = True
        TabOrder = 3
        Text = '0'
        OnDblClick = EdFinDblClick
      end
      object EdBytes: TEdit
        Left = 44
        Top = 142
        Width = 83
        Height = 21
        NumbersOnly = True
        TabOrder = 4
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
        TabOrder = 5
        Text = '90'
        OnKeyPress = EdValorKeyPress
      end
      object GroupBox1: TGroupBox
        Left = 144
        Top = 80
        Width = 193
        Height = 110
        Caption = 'Opciones'
        TabOrder = 6
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
          Checked = True
          State = cbChecked
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
        TabOrder = 7
        ViewStyle = vsReport
        OnChange = ListView1Change
        OnDblClick = ListView1DblClick
      end
      object BtnIniciar: TButton
        Left = 3
        Top = 197
        Width = 150
        Height = 25
        Caption = 'Iniciar'
        TabOrder = 8
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
        TabOrder = 9
        OnClick = CheckAllClick
      end
      object BtnAVFLista: TButton
        Left = 168
        Top = 401
        Width = 169
        Height = 32
        Caption = 'AvFuck al listado'
        Enabled = False
        TabOrder = 10
        OnClick = BtnAVFListaClick
      end
      object BtnMostrarLista: TButton
        Left = 187
        Top = 197
        Width = 150
        Height = 25
        Caption = 'Mostrar lista'
        TabOrder = 11
        OnClick = BtnMostrarListaClick
      end
      object BDetener: TButton
        Left = 3
        Top = 197
        Width = 150
        Height = 25
        Caption = 'Detener'
        TabOrder = 12
        Visible = False
        OnClick = BDetenerClick
      end
      object RadComb: TRadioButton
        Left = 250
        Top = 57
        Width = 84
        Height = 17
        Caption = '256 Combin.'
        TabOrder = 13
        OnClick = RadCombClick
      end
      object GroupBox2: TGroupBox
        Left = 3
        Top = 80
        Width = 334
        Height = 110
        Caption = 'Opciones'
        TabOrder = 14
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
          NumbersOnly = True
          TabOrder = 2
          Text = '0'
        end
        object Edit2: TEdit
          Left = 199
          Top = 69
          Width = 82
          Height = 21
          NumbersOnly = True
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
          OnKeyPress = Edit3KeyPress
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Offsets Replacer'
      ImageIndex = 1
      OnShow = TabSheet2Show
      object Label11: TLabel
        Left = 4
        Top = 65
        Width = 60
        Height = 13
        Caption = 'Hex original:'
      end
      object Label12: TLabel
        Left = 112
        Top = 65
        Width = 79
        Height = 13
        Caption = 'Reemplazar por:'
      end
      object Label13: TLabel
        Left = 3
        Top = 101
        Width = 29
        Height = 13
        Caption = 'Inicio:'
        Enabled = False
      end
      object Label14: TLabel
        Left = 128
        Top = 101
        Width = 18
        Height = 13
        Caption = 'Fin:'
        Enabled = False
      end
      object Label15: TLabel
        Left = 38
        Top = 120
        Width = 20
        Height = 11
        Caption = 'Max:'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label16: TLabel
        Left = 152
        Top = 120
        Width = 20
        Height = 11
        Caption = 'Max:'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object BtnIniciarR: TButton
        Left = 128
        Top = 137
        Width = 209
        Height = 36
        Caption = 'Iniciar'
        TabOrder = 7
        OnClick = BtnIniciarRClick
      end
      object BtnDetenerR: TButton
        Left = 128
        Top = 136
        Width = 209
        Height = 38
        Caption = 'Detener'
        TabOrder = 8
        Visible = False
        OnClick = BtnDetenerRClick
      end
      object CheckVaciarR: TCheckBox
        Left = 3
        Top = 146
        Width = 97
        Height = 17
        Caption = 'Vaciar directorio.'
        Checked = True
        State = cbChecked
        TabOrder = 0
      end
      object EdOriginal: TEdit
        Left = 70
        Top = 63
        Width = 19
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 2
        TabOrder = 1
        Text = '00'
        OnKeyPress = EdOriginalKeyPress
      end
      object EdReemplazar: TEdit
        Left = 198
        Top = 63
        Width = 19
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 2
        TabOrder = 2
        Text = '90'
        OnKeyPress = EdReemplazarKeyPress
      end
      object EdInicioR: TEdit
        Left = 38
        Top = 98
        Width = 62
        Height = 21
        Enabled = False
        NumbersOnly = True
        TabOrder = 3
        Text = '0'
      end
      object EdFinR: TEdit
        Left = 152
        Top = 98
        Width = 65
        Height = 21
        Enabled = False
        NumbersOnly = True
        TabOrder = 4
        Text = '0'
      end
      object RadCompleto: TRadioButton
        Left = 235
        Top = 64
        Width = 102
        Height = 17
        Caption = 'Fichero completo'
        Checked = True
        TabOrder = 5
        TabStop = True
        OnClick = RadCompletoClick
      end
      object RadRango: TRadioButton
        Left = 235
        Top = 100
        Width = 113
        Height = 17
        Caption = 'Rango'
        TabOrder = 6
        OnClick = RadRangoClick
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Offsets Checker'
      ImageIndex = 2
      OnShow = TabSheet3Show
      object Label17: TLabel
        Left = 3
        Top = 98
        Width = 150
        Height = 13
        Caption = 'Tiempo entre ejecuciones (Ms):'
      end
      object Label18: TLabel
        Left = 3
        Top = 78
        Width = 224
        Height = 11
        Caption = 'S'#243'lo se comprobar'#225'n ficheros con extensi'#243'n: '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = [fsBold, fsItalic, fsUnderline]
        ParentFont = False
      end
      object Label19: TLabel
        Left = 4
        Top = 122
        Width = 157
        Height = 13
        Caption = 'Fichero para revisar funcionales:'
      end
      object ListView2: TListView
        Left = 4
        Top = 144
        Width = 334
        Height = 259
        Columns = <
          item
            Caption = 'Fichero'
            Width = 250
          end
          item
            Caption = 'Funcional'
            Width = 60
          end>
        GridLines = True
        ReadOnly = True
        RowSelect = True
        TabOrder = 0
        ViewStyle = vsReport
        OnAdvancedCustomDrawSubItem = ListView2AdvancedCustomDrawSubItem
      end
      object EdEspera: TEdit
        Left = 167
        Top = 95
        Width = 41
        Height = 21
        NumbersOnly = True
        TabOrder = 1
        Text = '750'
      end
      object EdFuncionales: TEdit
        Left = 167
        Top = 117
        Width = 140
        Height = 21
        TabOrder = 2
        Text = 'funcionales.txt'
      end
      object Button5: TButton
        Left = 313
        Top = 117
        Width = 25
        Height = 21
        Caption = '?'
        TabOrder = 3
        OnClick = Button5Click
      end
      object BIniciarCh: TButton
        Left = 193
        Top = 409
        Width = 145
        Height = 32
        Caption = 'Iniciar'
        TabOrder = 4
        OnClick = BIniciarChClick
      end
      object BDetenerCh: TButton
        Left = 193
        Top = 409
        Width = 145
        Height = 32
        Caption = 'Detener'
        TabOrder = 5
        Visible = False
        OnClick = BDetenerChClick
      end
      object RadioButton1: TRadioButton
        Left = 3
        Top = 57
        Width = 157
        Height = 17
        Caption = 'Usar extensi'#243'n del fichero'
        Checked = True
        TabOrder = 6
        TabStop = True
        OnClick = RadioButton1Click
      end
      object RadioButton2: TRadioButton
        Left = 191
        Top = 57
        Width = 94
        Height = 17
        Caption = 'Otra extensi'#243'n:'
        TabOrder = 7
        OnClick = RadioButton2Click
      end
      object Edit4: TEdit
        Left = 291
        Top = 55
        Width = 47
        Height = 21
        Enabled = False
        TabOrder = 8
        Text = '.exe'
        OnChange = Edit4Change
      end
      object CheckBox1: TCheckBox
        Left = 3
        Top = 409
        Width = 142
        Height = 17
        Caption = 'Detener si funcionales = '
        TabOrder = 9
      end
      object Edit5: TEdit
        Left = 144
        Top = 409
        Width = 25
        Height = 21
        TabOrder = 10
        Text = '5'
      end
      object CheckBox2: TCheckBox
        Left = 3
        Top = 425
        Width = 118
        Height = 17
        Caption = 'Scroll autom'#225'tico.'
        Checked = True
        State = cbChecked
        TabOrder = 11
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'Offsets Patcher'
      ImageIndex = 3
      OnShow = TabSheet4Show
      object Label20: TLabel
        Left = 3
        Top = 33
        Width = 219
        Height = 13
        Caption = 'Separa las offsets a parchear con ESPACIOS:'
      end
      object Label21: TLabel
        Left = 286
        Top = 33
        Width = 52
        Height = 13
        Caption = 'Tapar con:'
      end
      object Label22: TLabel
        Left = 3
        Top = 86
        Width = 170
        Height = 11
        Caption = 'Al pulsar aparecer'#225' un cuadro de di'#225'logo.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Tahoma'
        Font.Style = [fsItalic]
        ParentFont = False
      end
      object Edit6: TEdit
        Left = 3
        Top = 52
        Width = 270
        Height = 21
        TabOrder = 0
        OnKeyPress = Edit6KeyPress
      end
      object Button3: TButton
        Left = 201
        Top = 79
        Width = 137
        Height = 25
        Caption = 'Guardar como..'
        Enabled = False
        TabOrder = 1
        OnClick = Button3Click
      end
      object Edit7: TEdit
        Left = 286
        Top = 52
        Width = 20
        Height = 21
        TabOrder = 2
        Text = '90'
        OnKeyPress = Edit7KeyPress
      end
    end
  end
  object EdFichero: TEdit
    Left = 8
    Top = 27
    Width = 305
    Height = 21
    ReadOnly = True
    TabOrder = 1
    Text = 'Ruta del fichero'
    OnChange = EdFicheroChange
  end
  object EdDir: TEdit
    Left = 8
    Top = 54
    Width = 305
    Height = 21
    ReadOnly = True
    TabOrder = 2
    Text = 'Directorio de trabajo'
  end
  object Button2: TButton
    Left = 319
    Top = 54
    Width = 23
    Height = 21
    Caption = '...'
    TabOrder = 3
    OnClick = Button2Click
  end
  object Button1: TButton
    Left = 319
    Top = 27
    Width = 23
    Height = 21
    Caption = '...'
    TabOrder = 4
    OnClick = Button1Click
  end
  object Estado: TPanel
    Left = 0
    Top = 472
    Width = 358
    Height = 18
    Align = alBottom
    Alignment = taLeftJustify
    BevelInner = bvLowered
    BevelOuter = bvNone
    TabOrder = 5
  end
  object OpenDialog1: TOpenDialog
    Left = 320
    Top = 16
  end
  object MainMenu1: TMainMenu
    Left = 296
    Top = 144
    object Skin1: TMenuItem
      Caption = 'Skin'
      object N11: TMenuItem
        AutoCheck = True
        Caption = 'Smokey Quartz Kamri'
        Checked = True
        RadioItem = True
        OnClick = N11Click
      end
      object N21: TMenuItem
        AutoCheck = True
        Caption = 'Amethyst Kamri'
        RadioItem = True
        OnClick = N21Click
      end
      object N31: TMenuItem
        AutoCheck = True
        Caption = 'Carbon'
        RadioItem = True
        OnClick = N31Click
      end
      object N41: TMenuItem
        AutoCheck = True
        Caption = 'Metropolis UI Black'
        RadioItem = True
        OnClick = N41Click
      end
    end
  end
  object SaveDialog1: TSaveDialog
    Left = 320
    Top = 96
  end
end
