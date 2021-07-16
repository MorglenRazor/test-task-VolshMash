object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 353
  ClientWidth = 914
  Color = clBtnHighlight
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 160
    Width = 212
    Height = 42
    Caption = #1053#1086#1084#1077#1088' '#1089#1095#1077#1090#1072':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -35
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 92
    Top = 232
    Width = 112
    Height = 42
    Caption = #1057#1091#1084#1084#1072':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -35
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 8
    Top = 72
    Width = 212
    Height = 42
    Caption = #1053#1086#1084#1077#1088' '#1089#1095#1077#1090#1072':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -35
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 8
    Top = 43
    Width = 80
    Height = 23
    Caption = #1057' '#1082#1072#1082#1086#1075#1086':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 8
    Top = 131
    Width = 85
    Height = 23
    Caption = #1053#1072' '#1082#1072#1082#1086#1081':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Button1: TButton
    Left = 226
    Top = 299
    Width = 201
    Height = 46
    Caption = #1055#1077#1088#1077#1074#1077#1089#1090#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -35
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = Button1Click
  end
  object MaskEdit1: TMaskEdit
    Left = 226
    Top = 160
    Width = 671
    Height = 50
    EditMask = 'AAAAAAAA-AAAA-AAAA-AAAA-AAAAAAAAAAAA;1;_'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -35
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxLength = 36
    ParentFont = False
    TabOrder = 1
    Text = '        -    -    -    -            '
  end
  object Edit1: TEdit
    Left = 226
    Top = 229
    Width = 671
    Height = 50
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -35
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnKeyPress = Edit1KeyPress
  end
  object MaskEdit2: TMaskEdit
    Left = 226
    Top = 72
    Width = 671
    Height = 50
    EditMask = 'AAAAAAAA-AAAA-AAAA-AAAA-AAAAAAAAAAAA;1;_'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -35
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxLength = 36
    ParentFont = False
    TabOrder = 3
    Text = '        -    -    -    -            '
  end
end
