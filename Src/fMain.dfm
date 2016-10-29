object Form1: TForm1
  Left = 384
  Top = 241
  Caption = 
    'THAI FOODS. (DEMO use Clientdataset to store data [Support: Delp' +
    'hi 7.1, Berlin])'
  ClientHeight = 412
  ClientWidth = 1214
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    1214
    412)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 56
    Width = 31
    Height = 13
    Caption = 'Label1'
  end
  object Label2: TLabel
    Left = 16
    Top = 104
    Width = 32
    Height = 13
    Caption = 'Label2'
  end
  object Label3: TLabel
    Left = 16
    Top = 160
    Width = 32
    Height = 13
    Caption = 'Label3'
  end
  object Label4: TLabel
    Left = 17
    Top = 212
    Width = 32
    Height = 13
    Caption = 'Label4'
  end
  object Button1: TButton
    Left = 242
    Top = 227
    Width = 38
    Height = 25
    Caption = '...'
    TabOrder = 0
    OnClick = Button1Click
  end
  object DBEdit1: TDBEdit
    Left = 16
    Top = 72
    Width = 137
    Height = 21
    DataField = 'PRODUCT_CODE'
    DataSource = Ds_Foods
    TabOrder = 1
  end
  object DBEdit2: TDBEdit
    Left = 16
    Top = 126
    Width = 266
    Height = 21
    DataField = 'PRODUCT_NAME'
    DataSource = Ds_Foods
    TabOrder = 2
  end
  object DBEdit3: TDBEdit
    Left = 16
    Top = 182
    Width = 137
    Height = 21
    DataField = 'PRICE'
    DataSource = Ds_Foods
    TabOrder = 3
  end
  object DBComboBox1: TDBLookupComboBox
    Left = 17
    Top = 231
    Width = 219
    Height = 21
    DataField = 'CATEGORIE_CODE'
    DataSource = Ds_Foods
    KeyField = 'CATEGORIE_CODE'
    ListField = 'CATEGORIE_NAME'
    ListSource = Ds_LookupFoodCat
    TabOrder = 4
  end
  object DBGrid1: TDBGrid
    Left = 312
    Top = 56
    Width = 894
    Height = 281
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = Ds_Foods
    ReadOnly = True
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object Panel1: TPanel
    Left = 0
    Top = 352
    Width = 1214
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 6
    object Button2: TButton
      Left = 184
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Cancel'
      TabOrder = 0
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 103
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Save'
      TabOrder = 1
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 16
      Top = 8
      Width = 75
      Height = 25
      Caption = '&New'
      TabOrder = 2
      OnClick = Button4Click
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 393
    Width = 1214
    Height = 19
    Panels = <
      item
        Width = 50
      end>
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 1214
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    Caption = 'Thai foods.'
    Color = clSkyBlue
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 8
  end
  object Ds_Foods: TDataSource
    DataSet = ClientDataSet1
    Left = 672
    Top = 152
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 776
    Top = 152
  end
  object Cds_LookupFoodCat: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 112
    Top = 208
  end
  object Ds_LookupFoodCat: TDataSource
    DataSet = Cds_LookupFoodCat
    Left = 144
    Top = 208
  end
end
