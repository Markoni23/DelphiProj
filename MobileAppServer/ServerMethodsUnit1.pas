unit ServerMethodsUnit1;

interface

uses System.SysUtils, System.Classes, System.Json,
    DataSnap.DSProviderDataModuleAdapter,
    Datasnap.DSServer, Datasnap.DSAuth, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.PG,
  FireDAC.Phys.PGDef, FireDAC.FMXUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, Datasnap.Provider;

type
  TServerMethods1 = class(TDSServerModule)
    PgtaxiConnection: TFDConnection;
    FncgetactiverideProc: TFDStoredProc;
    FncgetdriveridProc: TFDStoredProc;
    FncgetrideaddressProc: TFDStoredProc;
    FncgetriderequirementProc: TFDStoredProc;
    FncgetridestatusProc: TFDStoredProc;
    TridestatusTable: TFDQuery;
    TdriverstatusTable: TFDQuery;
    RideStatusDSP: TDataSetProvider;
    DriverStatusDSP: TDataSetProvider;
  private
    { Private declarations }
  public
    { Public declarations }

    function GetDriverId(DriverName : string) : integer;
    function GetActiveRide(DriverId : integer) : integer;
    function GetRideStatus(RideId : integer) : string;
    function GetRideAddress(RideId : integer) : string;
    function GetRideRequirement(RideId : integer) : string;
    procedure ChangeRideStatus(RideId : integer; StatusId : integer);
    procedure MoveRideToArchive(RideId : integer);
  end;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}


uses System.StrUtils;

  procedure TServerMethods1.MoveRideToArchive(RideId : integer);
  var query : TFDQuery;
  begin
    query := TFDQuery.Create(nil);
    query.Connection := PgtaxiConnection;

    query.SQL.Add('CALL public."prcMoveRideToArchive"(:ride_id);');
    query.Params[0].Value := RideId;
    query.ExecSQL;
  end;

  procedure TServerMethods1.ChangeRideStatus(RideId : integer; StatusId : integer);
  var query : TFDQuery;
  begin
    query := TFDQuery.Create(nil);
    query.Connection := PgtaxiConnection;

    query.SQL.Add('CALL public."prcChangeRideStatus"(:ride_id, :status_id);');
    query.Params[0].Value := RideId;
    query.Params[1].Value := StatusId;
    query.ExecSQL;
  end;

  function TServerMethods1.GetDriverId(DriverName : string) : integer;
  begin
    FncgetdriveridProc.Params[0].Value := DriverName;
    Result := FncgetdriveridProc.ExecFunc;
  end;


  function TServerMethods1.GetActiveRide(DriverId : integer) : integer;
  begin
    FncgetactiverideProc.Params[0].Value := DriverId;
    Result := FncgetactiverideProc.ExecFunc;
  end;

  function TServerMethods1.GetRideStatus(RideId : integer) : string;
  begin
    FncgetridestatusProc.Params[0].Value := RideId;
    Result := FncgetridestatusProc.ExecFunc;
  end;

    function TServerMethods1.GetRideAddress(RideId : integer) : string;
  begin
    FncgetrideaddressProc.Params[0].Value := RideId;
    Result := FncgetrideaddressProc.ExecFunc;
  end;

    function TServerMethods1.GetRideRequirement(RideId : integer) : string;
  begin
    FncgetriderequirementProc.Params[0].Value := RideId;
    Result := FncgetriderequirementProc.ExecFunc;
  end;

end.
