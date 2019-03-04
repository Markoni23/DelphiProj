unit ServerMethodsUnit;

interface

uses
  System.SysUtils, System.Classes, Datasnap.DSServer, 
  Datasnap.DSAuth, Datasnap.DSProviderDataModuleAdapter, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.PG, FireDAC.Phys.PGDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Datasnap.Provider, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TDSServerModule1 = class(TDSServerModule)
    PgtaxiConnection: TFDConnection;
    DriverTable: TFDQuery;
    RideTable: TFDQuery;
    RideArchiveTable: TFDQuery;
    DriverDSP: TDataSetProvider;
    RideDSP: TDataSetProvider;
    RideArchiveDSP: TDataSetProvider;
    RideStatusTable: TFDQuery;
    DriverStatusTable: TFDQuery;
    RideStatusDSP: TDataSetProvider;
    DriverStatusDSP: TDataSetProvider;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure MoveRideToArchive(RideId : integer);
    procedure UpdateRide(RideId : integer; DriverId : integer; StatusId : integer; Requirement : string; Address : string);
    procedure CreateNewRide(Address : string; Requirement : string);
    procedure ChangeRideStatus(RideId : integer; StatusId : integer);
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}


  procedure TDSServerModule1.MoveRideToArchive(RideId : integer);
  var query : TFDQuery;
  begin
    query := TFDQuery.Create(nil);
    query.Connection := PgtaxiConnection;

    query.SQL.Add('CALL public."prcMoveRideToArchive"(:ride_id);');
    query.Params[0].Value := RideId;
    query.ExecSQL;
  end;

  procedure TDSServerModule1.UpdateRide(RideId : integer; DriverId : integer; StatusId : integer; Requirement : string; Address : string);
  var query : TFDQuery;
  begin
    query := TFDQuery.Create(nil);
    query.Connection := PgtaxiConnection;

    query.SQL.Add('CALL public."prcUpdateRide"(:ride_id, :driver_id, :status_id, :requirement, :address);');
    query.Params[0].Value := RideId;
    query.Params[1].Value := DriverId;
    query.Params[2].Value := StatusId;
    query.Params[3].Value := Requirement;
    query.Params[4].Value := Address;

    query.ExecSQL;
  end;

  procedure TDSServerModule1.CreateNewRide(Address : string; Requirement : string);
  var query : TFDQuery;
  begin
    query := TFDQuery.Create(nil);
    query.Connection := PgtaxiConnection;

    query.SQL.Add('CALL public."prcCreateNewRide"(:address, :recuirement);');
    query.Params[0].Value := Address;
    query.Params[1].Value := Requirement;
    query.ExecSQL;
  end;

  procedure TDSServerModule1.ChangeRideStatus(RideId : integer; StatusId : integer);
  var query : TFDQuery;
  begin
    query := TFDQuery.Create(nil);
    query.Connection := PgtaxiConnection;

    query.SQL.Add('CALL public."prcChangeRideStatus"(:ride_id, :status_id);');
    query.Params[0].Value := RideId;
    query.Params[1].Value := StatusId;
    query.ExecSQL;
  end;
end.

