object ServerMethods2: TServerMethods2
  OldCreateOrder = False
  Height = 356
  Width = 405
  object PGTaxiConnection: TFDConnection
    Params.Strings = (
      'ConnectionDef=PGTaxi')
    Connected = True
    LoginPrompt = False
    Left = 24
    Top = 168
  end
  object DriverTable: TFDQuery
    Active = True
    DetailFields = 
      'Car;Car_Sign;Driver_Status;First_Name;ID;Login;Password;Phone;Se' +
      'cond_Name;Third_Name'
    Connection = PGTaxiConnection
    SQL.Strings = (
      'select * from "Driver"')
    Left = 112
    Top = 120
  end
  object DriverDSP: TDataSetProvider
    DataSet = DriverTable
    ResolveToDataSet = True
    Left = 192
    Top = 160
  end
  object SPNewDriver: TFDStoredProc
    Connection = PGTaxiConnection
    StoredProcName = 'fnnewdriver'
    Left = 336
    Top = 24
    ParamData = <
      item
        Position = 1
        Name = 'login'
        DataType = ftWideString
        FDDataType = dtWideString
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'password'
        DataType = ftWideString
        FDDataType = dtWideString
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'first_name'
        DataType = ftWideString
        FDDataType = dtWideString
        ParamType = ptInput
      end
      item
        Position = 4
        Name = 'second_name'
        DataType = ftWideString
        FDDataType = dtWideString
        ParamType = ptInput
      end
      item
        Position = 5
        Name = 'third_name'
        DataType = ftWideString
        FDDataType = dtWideString
        ParamType = ptInput
      end
      item
        Position = 6
        Name = 'car'
        DataType = ftWideString
        FDDataType = dtWideString
        ParamType = ptInput
      end
      item
        Position = 7
        Name = 'phone'
        DataType = ftWideString
        FDDataType = dtWideString
        ParamType = ptInput
      end
      item
        Position = 8
        Name = 'car_sign'
        DataType = ftWideString
        FDDataType = dtWideString
        ParamType = ptInput
      end>
  end
  object FDTransaction1: TFDTransaction
    Connection = PGTaxiConnection
    Left = 32
    Top = 16
  end
  object SPDeleteDriver: TFDStoredProc
    Connection = PGTaxiConnection
    StoredProcName = 'fndeletedriver'
    Left = 208
    Top = 16
    ParamData = <
      item
        Position = 1
        Name = 'in_id'
        DataType = ftInteger
        FDDataType = dtInt32
        ParamType = ptInput
      end>
  end
  object SPEditDriver: TFDStoredProc
    Connection = PGTaxiConnection
    StoredProcName = '"fnEditDriver"'
    Left = 280
    Top = 8
    ParamData = <
      item
        Position = 1
        Name = 'in_id'
        DataType = ftInteger
        FDDataType = dtInt32
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'in_login'
        DataType = ftWideString
        FDDataType = dtWideString
        ParamType = ptInput
      end
      item
        Position = 3
        Name = 'in_password'
        DataType = ftWideString
        FDDataType = dtWideString
        ParamType = ptInput
      end
      item
        Position = 4
        Name = 'in_first_name'
        DataType = ftWideString
        FDDataType = dtWideString
        ParamType = ptInput
      end
      item
        Position = 5
        Name = 'in_second_name'
        DataType = ftWideString
        FDDataType = dtWideString
        ParamType = ptInput
      end
      item
        Position = 6
        Name = 'in_third_name'
        DataType = ftWideString
        FDDataType = dtWideString
        ParamType = ptInput
      end
      item
        Position = 7
        Name = 'in_car'
        DataType = ftWideString
        FDDataType = dtWideString
        ParamType = ptInput
      end
      item
        Position = 8
        Name = 'in_phone'
        DataType = ftWideString
        FDDataType = dtWideString
        ParamType = ptInput
      end
      item
        Position = 9
        Name = 'in_car_sign'
        DataType = ftWideString
        FDDataType = dtWideString
        ParamType = ptInput
      end
      item
        Position = 10
        Name = 'in_driver_status'
        DataType = ftInteger
        FDDataType = dtInt32
        ParamType = ptInput
      end>
  end
  object ActiveOrdersTable: TFDQuery
    Connection = PGTaxiConnection
    Left = 120
    Top = 16
  end
end
