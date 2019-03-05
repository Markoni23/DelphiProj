object Form3: TForm3
  Left = 0
  Top = 0
  Caption = 'Form3'
  ClientHeight = 651
  ClientWidth = 771
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl: TPageControl
    Left = 0
    Top = 0
    Width = 771
    Height = 651
    ActivePage = MainPage
    Align = alClient
    TabOrder = 0
    object MainPage: TTabSheet
      Caption = #1040#1082#1090#1080#1074#1085#1099#1077' '#1079#1072#1082#1072#1079#1099
    end
    object ArchivePage: TTabSheet
      Caption = #1040#1088#1093#1080#1074
      ImageIndex = 1
    end
    object DriverPage: TTabSheet
      Caption = #1042#1086#1076#1080#1090#1077#1083#1080
      ImageIndex = 2
      object DriverGrid: TDBGrid
        Left = 0
        Top = 0
        Width = 763
        Height = 473
        Align = alTop
        DataSource = DataSource1
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
      object AddDriverButton: TButton
        Left = 0
        Top = 479
        Width = 273
        Height = 41
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1085#1086#1074#1086#1075#1086' '#1074#1086#1076#1080#1090#1077#1083#1103
        Style = bsCommandLink
        TabOrder = 1
        OnClick = AddDriverButtonClick
      end
    end
  end
  object bDelDriver: TButton
    Left = 560
    Top = 550
    Width = 193
    Height = 41
    Caption = #1059#1076#1072#1083#1080#1090#1100' '#1074#1086#1076#1080#1090#1077#1083#1103
    Style = bsCommandLink
    TabOrder = 1
    OnClick = bDelDriverClick
  end
  object bEditDriver: TButton
    Left = 408
    Top = 503
    Width = 345
    Height = 41
    Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1102' '#1086' '#1074#1086#1076#1080#1090#1077#1083#1077
    Style = bsCommandLink
    TabOrder = 2
    OnClick = bEditDriverClick
  end
  object DriverCDS: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'DriverDSP'
    RemoteServer = DSProviderConnection1
    Left = 224
    Top = 408
  end
  object DataSource1: TDataSource
    DataSet = DriverCDS
    Left = 232
    Top = 280
  end
  object BindSourceDB1: TBindSourceDB
    DataSet = DriverCDS
    ScopeMappings = <>
    Left = 152
    Top = 320
  end
  object DSProviderConnection1: TDSProviderConnection
    ServerClassName = 'TServerMethods2'
    Connected = True
    SQLConnection = SQLConnection1
    Left = 88
    Top = 360
  end
  object SQLConnection1: TSQLConnection
    ConnectionName = 'DataSnapCONNECTION'
    DriverName = 'DataSnap'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=DataSnap'
      'HostName=localhost'
      'port=211'
      'Filters={}')
    Connected = True
    Left = 24
    Top = 352
    UniqueId = '{880E32C2-F102-48E5-A90C-ECD671970A40}'
  end
end
