object MensagemAbastecimentoRealizado: TMensagemAbastecimentoRealizado
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'MensagemAbastecimentoRealizado'
  ClientHeight = 345
  ClientWidth = 336
  Color = clBtnShadow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel7: TPanel
    Left = 8
    Top = 8
    Width = 320
    Height = 329
    BevelInner = bvLowered
    BevelOuter = bvSpace
    Ctl3D = True
    Padding.Top = 20
    ParentBackground = False
    ParentCtl3D = False
    TabOrder = 0
    object Label5: TLabel
      AlignWithMargins = True
      Left = 5
      Top = 25
      Width = 310
      Height = 33
      Align = alTop
      Alignment = taCenter
      Caption = 'Abastecimento Realizado!'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ExplicitWidth = 304
    end
    object lblCombustivel: TLabel
      AlignWithMargins = True
      Left = 5
      Top = 100
      Width = 310
      Height = 48
      Margins.Top = 0
      Margins.Bottom = 0
      Align = alTop
      Alignment = taCenter
      Caption = 'GASOLINA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -40
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitWidth = 213
    end
    object lblBomba: TLabel
      AlignWithMargins = True
      Left = 5
      Top = 81
      Width = 310
      Height = 19
      Margins.Top = 20
      Margins.Bottom = 0
      Align = alTop
      Alignment = taCenter
      Caption = 'Bomba 1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ExplicitWidth = 63
    end
    object lblValor: TLabel
      AlignWithMargins = True
      Left = 5
      Top = 184
      Width = 310
      Height = 48
      Margins.Top = 20
      Align = alTop
      Alignment = taCenter
      Caption = 'R$ 50,00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -40
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ExplicitTop = 182
    end
    object lblLitros: TLabel
      AlignWithMargins = True
      Left = 5
      Top = 235
      Width = 310
      Height = 19
      Margins.Top = 0
      Margins.Bottom = 0
      Align = alTop
      Alignment = taCenter
      Caption = '10 Litros'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ExplicitTop = 186
      ExplicitWidth = 62
    end
    object lblImposto: TLabel
      AlignWithMargins = True
      Left = 5
      Top = 148
      Width = 310
      Height = 16
      Margins.Top = 0
      Margins.Bottom = 0
      Align = alTop
      Alignment = taCenter
      Caption = 'Imposto R$ 5,75'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ExplicitLeft = 10
      ExplicitTop = 135
    end
    object Panel8: TPanel
      Left = 72
      Top = 268
      Width = 185
      Height = 41
      Caption = 'Ok'
      Color = clGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
      OnClick = Panel8Click
      OnMouseEnter = Panel8MouseEnter
      OnMouseLeave = Panel8MouseLeave
    end
  end
end
