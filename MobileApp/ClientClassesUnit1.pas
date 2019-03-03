// 
// Created by the DataSnap proxy generator.
// 26.12.2018 14:13:22
// 

unit ClientClassesUnit1;

interface

uses System.JSON, Data.DBXCommon, Data.DBXClient, Data.DBXDataSnap, Data.DBXJSON, Datasnap.DSProxy, System.Classes, System.SysUtils, Data.DB, Data.SqlExpr, Data.DBXDBReaders, Data.DBXCDSReaders, Data.DBXJSONReflect;

type
  TServerMethods1Client = class(TDSAdminClient)
  private
    FGetDriverIdCommand: TDBXCommand;
    FGetActiveRideCommand: TDBXCommand;
    FGetRideStatusCommand: TDBXCommand;
    FGetRideAddressCommand: TDBXCommand;
    FGetRideRequirementCommand: TDBXCommand;
    FChangeRideStatusCommand: TDBXCommand;
    FMoveRideToArchiveCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function GetDriverId(DriverName: string): Integer;
    function GetActiveRide(DriverId: Integer): Integer;
    function GetRideStatus(RideId: Integer): string;
    function GetRideAddress(RideId: Integer): string;
    function GetRideRequirement(RideId: Integer): string;
    procedure ChangeRideStatus(RideId: Integer; StatusId: Integer);
    procedure MoveRideToArchive(RideId: Integer);
  end;

implementation

function TServerMethods1Client.GetDriverId(DriverName: string): Integer;
begin
  if FGetDriverIdCommand = nil then
  begin
    FGetDriverIdCommand := FDBXConnection.CreateCommand;
    FGetDriverIdCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FGetDriverIdCommand.Text := 'TServerMethods1.GetDriverId';
    FGetDriverIdCommand.Prepare;
  end;
  FGetDriverIdCommand.Parameters[0].Value.SetWideString(DriverName);
  FGetDriverIdCommand.ExecuteUpdate;
  Result := FGetDriverIdCommand.Parameters[1].Value.GetInt32;
end;

function TServerMethods1Client.GetActiveRide(DriverId: Integer): Integer;
begin
  if FGetActiveRideCommand = nil then
  begin
    FGetActiveRideCommand := FDBXConnection.CreateCommand;
    FGetActiveRideCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FGetActiveRideCommand.Text := 'TServerMethods1.GetActiveRide';
    FGetActiveRideCommand.Prepare;
  end;
  FGetActiveRideCommand.Parameters[0].Value.SetInt32(DriverId);
  FGetActiveRideCommand.ExecuteUpdate;
  Result := FGetActiveRideCommand.Parameters[1].Value.GetInt32;
end;

function TServerMethods1Client.GetRideStatus(RideId: Integer): string;
begin
  if FGetRideStatusCommand = nil then
  begin
    FGetRideStatusCommand := FDBXConnection.CreateCommand;
    FGetRideStatusCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FGetRideStatusCommand.Text := 'TServerMethods1.GetRideStatus';
    FGetRideStatusCommand.Prepare;
  end;
  FGetRideStatusCommand.Parameters[0].Value.SetInt32(RideId);
  FGetRideStatusCommand.ExecuteUpdate;
  Result := FGetRideStatusCommand.Parameters[1].Value.GetWideString;
end;

function TServerMethods1Client.GetRideAddress(RideId: Integer): string;
begin
  if FGetRideAddressCommand = nil then
  begin
    FGetRideAddressCommand := FDBXConnection.CreateCommand;
    FGetRideAddressCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FGetRideAddressCommand.Text := 'TServerMethods1.GetRideAddress';
    FGetRideAddressCommand.Prepare;
  end;
  FGetRideAddressCommand.Parameters[0].Value.SetInt32(RideId);
  FGetRideAddressCommand.ExecuteUpdate;
  Result := FGetRideAddressCommand.Parameters[1].Value.GetWideString;
end;

function TServerMethods1Client.GetRideRequirement(RideId: Integer): string;
begin
  if FGetRideRequirementCommand = nil then
  begin
    FGetRideRequirementCommand := FDBXConnection.CreateCommand;
    FGetRideRequirementCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FGetRideRequirementCommand.Text := 'TServerMethods1.GetRideRequirement';
    FGetRideRequirementCommand.Prepare;
  end;
  FGetRideRequirementCommand.Parameters[0].Value.SetInt32(RideId);
  FGetRideRequirementCommand.ExecuteUpdate;
  Result := FGetRideRequirementCommand.Parameters[1].Value.GetWideString;
end;

procedure TServerMethods1Client.ChangeRideStatus(RideId: Integer; StatusId: Integer);
begin
  if FChangeRideStatusCommand = nil then
  begin
    FChangeRideStatusCommand := FDBXConnection.CreateCommand;
    FChangeRideStatusCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FChangeRideStatusCommand.Text := 'TServerMethods1.ChangeRideStatus';
    FChangeRideStatusCommand.Prepare;
  end;
  FChangeRideStatusCommand.Parameters[0].Value.SetInt32(RideId);
  FChangeRideStatusCommand.Parameters[1].Value.SetInt32(StatusId);
  FChangeRideStatusCommand.ExecuteUpdate;
end;

procedure TServerMethods1Client.MoveRideToArchive(RideId: Integer);
begin
  if FMoveRideToArchiveCommand = nil then
  begin
    FMoveRideToArchiveCommand := FDBXConnection.CreateCommand;
    FMoveRideToArchiveCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FMoveRideToArchiveCommand.Text := 'TServerMethods1.MoveRideToArchive';
    FMoveRideToArchiveCommand.Prepare;
  end;
  FMoveRideToArchiveCommand.Parameters[0].Value.SetInt32(RideId);
  FMoveRideToArchiveCommand.ExecuteUpdate;
end;

constructor TServerMethods1Client.Create(ADBXConnection: TDBXConnection);
begin
  inherited Create(ADBXConnection);
end;

constructor TServerMethods1Client.Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ADBXConnection, AInstanceOwner);
end;

destructor TServerMethods1Client.Destroy;
begin
  FGetDriverIdCommand.DisposeOf;
  FGetActiveRideCommand.DisposeOf;
  FGetRideStatusCommand.DisposeOf;
  FGetRideAddressCommand.DisposeOf;
  FGetRideRequirementCommand.DisposeOf;
  FChangeRideStatusCommand.DisposeOf;
  FMoveRideToArchiveCommand.DisposeOf;
  inherited;
end;

end.
