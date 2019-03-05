object ClientModule1: TClientModule1
  OldCreateOrder = False
  Height = 279
  Width = 414
  object SQLConnection1: TSQLConnection
    ConnectionName = 'DataSnapCONNECTION'
    DriverName = 'DataSnap'
    LoginPrompt = False
    Params.Strings = (
      'DriverUnit=Data.DBXDataSnap'
      'CommunicationProtocol=tcp/ip'
      'DatasnapContext=datasnap/'
      
        'DriverAssemblyLoader=Borland.Data.TDBXClientDriverLoader,Borland' +
        '.Data.DbxClientDriver,Version=24.0.0.0,Culture=neutral,PublicKey' +
        'Token=91d62ebb5b0d1b1b'
      'DriverName=DataSnap'
      'HostName=localhost'
      'port=211'
      'Filters={}'
      
        'ConnectionString=DriverUnit=Data.DBXDataSnap,CommunicationProtoc' +
        'ol=tcp/ip,DatasnapContext=datasnap/,DriverAssemblyLoader=Borland' +
        '.Data.TDBXClientDriverLoader,Borland.Data.DbxClientDriver,Versio' +
        'n=24.0.0.0,Culture=neutral,PublicKeyToken=91d62ebb5b0d1b1b,Drive' +
        'rName=DataSnap,HostName=localhost,port=211,Filters={}')
    Connected = True
    Left = 48
    Top = 40
    UniqueId = '{3821BF0D-D098-41FD-8852-B9EA97612C05}'
  end
end
