object Form2: TForm2
  Left = 0
  Top = 0
  Caption = #1053#1086#1074#1099#1081' '#1079#1072#1082#1072#1079
  ClientHeight = 279
  ClientWidth = 670
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormCreate
  OnCreate = FormCreate
  DesignSize = (
    670
    279)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 10
    Width = 31
    Height = 13
    Caption = #1040#1076#1088#1077#1089
  end
  object label2: TLabel
    Left = 24
    Top = 56
    Width = 151
    Height = 13
    Caption = #1044#1086#1087#1086#1083#1085#1080#1090#1077#1083#1100#1085#1099#1077' '#1090#1088#1077#1073#1086#1074#1072#1085#1080#1103
  end
  object AddressEdit: TEdit
    Left = 24
    Top = 29
    Width = 625
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 0
  end
  object RequirementMemo: TMemo
    Left = 24
    Top = 75
    Width = 625
    Height = 158
    Anchors = [akLeft, akTop, akRight, akBottom]
    Lines.Strings = (
      #1053#1077#1090)
    TabOrder = 1
  end
  object OkButton: TButton
    Left = 472
    Top = 246
    Width = 75
    Height = 25
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 2
  end
  object CancelButton: TButton
    Left = 574
    Top = 246
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 3
  end
end
