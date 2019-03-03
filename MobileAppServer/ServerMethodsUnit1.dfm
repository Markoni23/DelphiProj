object ServerMethods1: TServerMethods1
  OldCreateOrder = False
  Height = 628
  Width = 570
  object PgtaxiConnection: TFDConnection
    Params.Strings = (
      'ConnectionDef=PGTaxi')
    Connected = True
    LoginPrompt = False
    Left = 137
    Top = 238
  end
  object FncgetactiverideProc: TFDStoredProc
    Connection = PgtaxiConnection
    StoredProcName = '"fncGetActiveRide"'
    Left = 281
    Top = 155
    ParamData = <
      item
        Position = 1
        Name = 'arg_driver_id'
        DataType = ftInteger
        FDDataType = dtInt32
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'result'
        DataType = ftInteger
        FDDataType = dtInt32
        ParamType = ptResult
      end>
  end
  object FncgetdriveridProc: TFDStoredProc
    Connection = PgtaxiConnection
    StoredProcName = '"fncGetDriverId"'
    Left = 280
    Top = 239
    ParamData = <
      item
        Position = 1
        Name = 'arg_driver_name'
        DataType = ftWideString
        FDDataType = dtWideString
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'result'
        DataType = ftInteger
        FDDataType = dtInt32
        ParamType = ptResult
      end>
  end
  object FncgetrideaddressProc: TFDStoredProc
    Connection = PgtaxiConnection
    StoredProcName = '"fncGetRideAddress"'
    Left = 281
    Top = 314
    ParamData = <
      item
        Position = 1
        Name = 'arg_ride_id'
        DataType = ftInteger
        FDDataType = dtInt32
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'result'
        DataType = ftInteger
        FDDataType = dtInt32
        ParamType = ptResult
      end>
  end
  object FncgetriderequirementProc: TFDStoredProc
    Connection = PgtaxiConnection
    StoredProcName = '"fncGetRideRequirement"'
    Left = 276
    Top = 388
    ParamData = <
      item
        Position = 1
        Name = 'arg_ride_id'
        DataType = ftInteger
        FDDataType = dtInt32
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'result'
        DataType = ftInteger
        FDDataType = dtInt32
        ParamType = ptResult
      end>
  end
  object FncgetridestatusProc: TFDStoredProc
    Connection = PgtaxiConnection
    StoredProcName = '"fncGetRideStatus"'
    Left = 280
    Top = 75
    ParamData = <
      item
        Position = 1
        Name = 'arg_ride_id'
        DataType = ftInteger
        FDDataType = dtInt32
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'result'
        DataType = ftInteger
        FDDataType = dtInt32
        ParamType = ptResult
      end>
  end
  object TridestatusTable: TFDQuery
    Active = True
    Connection = PgtaxiConnection
    SQL.Strings = (
      'SELECT * FROM "tRideStatus"')
    Left = 275
    Top = 471
  end
  object TdriverstatusTable: TFDQuery
    Active = True
    Connection = PgtaxiConnection
    SQL.Strings = (
      'SELECT * FROM "tDriverStatus"')
    Left = 272
    Top = 547
  end
  object RideStatusDSP: TDataSetProvider
    DataSet = TridestatusTable
    Left = 400
    Top = 472
  end
  object DriverStatusDSP: TDataSetProvider
    DataSet = TdriverstatusTable
    Left = 400
    Top = 544
  end
end
