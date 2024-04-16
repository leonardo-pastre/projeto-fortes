object FiltroRelatorioAbastecimentos: TFiltroRelatorioAbastecimentos
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Relat'#243'rio de abastecimentos'
  ClientHeight = 90
  ClientWidth = 448
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 7
    Top = 8
    Width = 433
    Height = 73
    Caption = 'Per'#237'odo'
    TabOrder = 0
    object Label1: TLabel
      Left = 155
      Top = 45
      Width = 6
      Height = 13
      Caption = 'a'
    end
    object Label2: TLabel
      Left = 8
      Top = 22
      Width = 51
      Height = 13
      Caption = 'Data inicial'
    end
    object Label3: TLabel
      Left = 169
      Top = 22
      Width = 46
      Height = 13
      Caption = 'Data final'
    end
    object edtDataInicial: TDateTimePicker
      Left = 8
      Top = 37
      Width = 137
      Height = 21
      Date = 45396.996854907410000000
      Time = 45396.996854907410000000
      TabOrder = 0
    end
    object edtDataFinal: TDateTimePicker
      Left = 170
      Top = 37
      Width = 137
      Height = 21
      Date = 45396.996854907410000000
      Time = 45396.996854907410000000
      TabOrder = 1
    end
    object btnGerarRelatorio: TButton
      Left = 313
      Top = 34
      Width = 114
      Height = 25
      Caption = 'Gerar Relat'#243'rio'
      TabOrder = 2
      OnClick = btnGerarRelatorioClick
    end
  end
end
