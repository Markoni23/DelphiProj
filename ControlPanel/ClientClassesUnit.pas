//
// Created by the DataSnap proxy generator.
// 26.12.2018 10:35:05
//

unit ClientClassesUnit;

interface

uses System.JSON, Data.DBXCommon, Data.DBXClient, Data.DBXDataSnap, Data.DBXJSON, Datasnap.DSProxy, System.Classes, System.SysUtils, Data.DB, Data.SqlExpr, Data.DBXDBReaders, Data.DBXCDSReaders, Data.DBXJSONReflect;

type
  TDSServerModule1Client = class(TDSAdminClient)
  private
    FMoveRideToArchiveCommand: TDBXCommand;
    FUpdateRideCommand: TDBXCommand;
    FCreateNewRideCommand: TDBXCommand;
    FChangeRideStatusCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    procedure MoveRideToArchive(RideId: Integer);
    procedure UpdateRide(RideId: Integer; DriverId: Integer; StatusId: Integer; Requirement: string; Address: string);
    procedure CreateNewRide(Address: string; Requirement: string);
    procedure ChangeRideStatus(RideId: Integer; StatusId: Integer);
  end;

implementation

procedure TDSServerModule1Client.MoveRideToArchive(RideId: Integer);
begin
  if FMoveRideToArchiveCommand = nil then
  begin
    FMoveRideToArchiveCommand := FDBXConnection.CreateCommand;
    FMoveRideToArchiveCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FMoveRideToArchiveCommand.Text := 'TDSServerModule1.MoveRideToArchive';
    FMoveRideToArchiveCommand.Prepare;
  end;
  FMoveRideToArchiveCommand.Parameters[0].Value.SetInt32(RideId);
  FMoveRideToArchiveCommand.ExecuteUpdate;
end;

procedure TDSServerModule1Client.UpdateRide(RideId: Integer; DriverId: Integer; StatusId: Integer; Requirement: string; Address: string);
begin
  if FUpdateRideCommand = nil then
  begin
    FUpdateRideCommand := FDBXConnection.CreateCommand;
    FUpdateRideCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FUpdateRideCommand.Text := 'TDSServerModule1.UpdateRide';
    FUpdateRideCommand.Prepare;
  end;
  FUpdateRideCommand.Parameters[0].Value.SetInt32(RideId);

  if DriverId <> -1 then
    FUpdateRideCommand.Parameters[1].Value.SetInt32(DriverId)
  else
    FUpdateRideCommand.Parameters[1].Value.SetNull;

  if StatusId <> -1 then
    FUpdateRideCommand.Parameters[2].Value.SetInt32(StatusId)
  else
    FUpdateRideCommand.Parameters[2].Value.SetNull;

  FUpdateRideCommand.Parameters[3].Value.SetWideString(Requirement);
  FUpdateRideCommand.Parameters[4].Value.SetWideString(Address);
  FUpdateRideCommand.ExecuteUpdate;
end;

procedure TDSServerModule1Client.CreateNewRide(Address: string; Requirement: string);
begin
  if FCreateNewRideCommand = nil then
  begin
    FCreateNewRideCommand := FDBXConnection.CreateCommand;
    FCreateNewRideCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FCreateNewRideCommand.Text := 'TDSServerModule1.CreateNewRide';
    FCreateNewRideCommand.Prepare;
  end;
  FCreateNewRideCommand.Parameters[0].Value.SetWideString(Address);
  FCreateNewRideCommand.Parameters[1].Value.SetWideString(Requirement);
  FCreateNewRideCommand.ExecuteUpdate;
end;

procedure TDSServerModule1Client.ChangeRideStatus(RideId: Integer; StatusId: Integer);
begin
  if FChangeRideStatusCommand = nil then
  begin
    FChangeRideStatusCommand := FDBXConnection.CreateCommand;
    FChangeRideStatusCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FChangeRideStatusCommand.Text := 'TDSServerModule1.ChangeRideStatus';
    FChangeRideStatusCommand.Prepare;
  end;
  FChangeRideStatusCommand.Parameters[0].Value.SetInt32(RideId);
  FChangeRideStatusCommand.Parameters[1].Value.SetInt32(StatusId);
  FChangeRideStatusCommand.ExecuteUpdate;
end;

constructor TDSServerModule1Client.Create(ADBXConnection: TDBXConnection);
begin
  inherited Create(ADBXConnection);
end;

constructor TDSServerModule1Client.Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ADBXConnection, AInstanceOwner);
end;

destructor TDSServerModule1Client.Destroy;
begin
  FMoveRideToArchiveCommand.DisposeOf;
  FUpdateRideCommand.DisposeOf;
  FCreateNewRideCommand.DisposeOf;
  FChangeRideStatusCommand.DisposeOf;
  inherited;
end;

end.

