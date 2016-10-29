object Form3: TForm3
  Left = 176
  Top = 198
  BorderStyle = bsDialog
  Caption = 'Food categories.'
  ClientHeight = 331
  ClientWidth = 788
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 788
    Height = 271
    Align = alClient
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object Panel1: TPanel
    Left = 0
    Top = 271
    Width = 788
    Height = 41
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 280
    ExplicitWidth = 778
    object btn_OK: TButton
      Left = 528
      Top = 6
      Width = 75
      Height = 25
      Caption = '&OK'
      ModalResult = 1
      TabOrder = 0
      OnClick = btn_OKClick
    end
    object Button2: TButton
      Left = 702
      Top = 6
      Width = 75
      Height = 25
      Caption = '&Cancel'
      TabOrder = 1
      OnClick = Button2Click
    end
    object Btn_Apply: TButton
      Left = 609
      Top = 6
      Width = 75
      Height = 25
      Caption = '&Apply'
      Enabled = False
      TabOrder = 2
      OnClick = Btn_ApplyClick
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 312
    Width = 788
    Height = 19
    Panels = <
      item
        Width = 50
      end>
    ExplicitLeft = -284
    ExplicitWidth = 1072
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 384
    Top = 168
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    OnStateChange = DataSource1StateChange
    Left = 472
    Top = 176
  end
end
