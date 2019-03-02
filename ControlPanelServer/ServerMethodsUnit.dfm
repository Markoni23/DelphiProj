object DSServerModule1: TDSServerModule1
  OldCreateOrder = False
  Height = 654
  Width = 657
  object PgtaxiConnection: TFDConnection
    Params.Strings = (
      'ConnectionDef=PGTaxi')
    Connected = True
    LoginPrompt = False
    Left = 162
    Top = 247
  end
  object DriverTable: TFDQuery
    Active = True
    Connection = PgtaxiConnection
    SQL.Strings = (
      'SELECT * FROM "tDriver"')
    Left = 258
    Top = 127
  end
  object RideTable: TFDQuery
    Active = True
    Connection = PgtaxiConnection
    SQL.Strings = (
      'SELECT * FROM "tRide"')
    Left = 258
    Top = 186
  end
  object RideArchiveTable: TFDQuery
    Active = True
    Connection = PgtaxiConnection
    SQL.Strings = (
      'SELECT * FROM "tRideArchive"')
    Left = 256
    Top = 242
  end
  object DriverDSP: TDataSetProvider
    DataSet = DriverTable
    Left = 352
    Top = 128
  end
  object RideDSP: TDataSetProvider
    DataSet = RideTable
    Left = 352
    Top = 184
  end
  object RideArchiveDSP: TDataSetProvider
    DataSet = RideArchiveTable
    Left = 352
    Top = 240
  end
  object RideStatusTable: TFDQuery
    Active = True
    Connection = PgtaxiConnection
    SQL.Strings = (
      'SELECT * FROM "tRideStatus"')
    Left = 258
    Top = 306
  end
  object DriverStatusTable: TFDQuery
    Active = True
    Connection = PgtaxiConnection
    SQL.Strings = (
      'SELECT * FROM "tDriverStatus"')
    Left = 258
    Top = 367
  end
  object RideStatusDSP: TDataSetProvider
    DataSet = RideStatusTable
    Left = 352
    Top = 304
  end
  object DriverStatusDSP: TDataSetProvider
    DataSet = DriverStatusTable
    Left = 352
    Top = 368
  end
end
