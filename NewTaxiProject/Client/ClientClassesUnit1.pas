//
// Created by the DataSnap proxy generator.
// 05.03.2019 17:16:39
// 

unit ClientClassesUnit1;

interface

uses System.JSON, Data.DBXCommon, Data.DBXClient, Data.DBXDataSnap, Data.DBXJSON, Datasnap.DSProxy, System.Classes, System.SysUtils, Data.DB, Data.SqlExpr, Data.DBXDBReaders, Data.DBXCDSReaders, Data.DBXJSONReflect;

type
  TServerMethods1Client = class(TDSAdminClient)
  private
    FEchoStringCommand: TDBXCommand;
    FReverseStringCommand: TDBXCommand;
    FCreateNewDriverCommand: TDBXCommand;
    FDeleteDriverCommand: TDBXCommand;
    FEditDriverCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function EchoString(Value: string): string;
    function ReverseString(Value: string): string;
    procedure CreateNewDriver(Login: string; Password: string; First_Name: string; Second_Name: string; Third_name: string; Car: string; Phone: string; Car_Sign: string);
    procedure DeleteDriver(Id: Integer);
    procedure EditDriver(in_id: Integer; in_login: string; in_password: string; in_first_name: string; in_second_name: string; in_third_name: string; in_car: string; in_phone: string; in_car_sign: string; in_driver_status: Integer);
  end;

implementation

function TServerMethods1Client.EchoString(Value: string): string;
begin
  if FEchoStringCommand = nil then
  begin
    FEchoStringCommand := FDBXConnection.CreateCommand;
    FEchoStringCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FEchoStringCommand.Text := 'TServerMethods2.EchoString';
    FEchoStringCommand.Prepare;
  end;
  FEchoStringCommand.Parameters[0].Value.SetWideString(Value);
  FEchoStringCommand.ExecuteUpdate;
  Result := FEchoStringCommand.Parameters[1].Value.GetWideString;
end;

function TServerMethods1Client.ReverseString(Value: string): string;
begin
  if FReverseStringCommand = nil then
  begin
    FReverseStringCommand := FDBXConnection.CreateCommand;
    FReverseStringCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FReverseStringCommand.Text := 'TServerMethods2.ReverseString';
    FReverseStringCommand.Prepare;
  end;
  FReverseStringCommand.Parameters[0].Value.SetWideString(Value);
  FReverseStringCommand.ExecuteUpdate;
  Result := FReverseStringCommand.Parameters[1].Value.GetWideString;
end;

procedure TServerMethods1Client.CreateNewDriver(Login: string; Password: string; First_Name: string; Second_Name: string; Third_name: string; Car: string; Phone: string; Car_Sign: string);
begin
  if FCreateNewDriverCommand = nil then
  begin
    FCreateNewDriverCommand := FDBXConnection.CreateCommand;
    FCreateNewDriverCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FCreateNewDriverCommand.Text := 'TServerMethods2.CreateNewDriver';
    FCreateNewDriverCommand.Prepare;
  end;
  FCreateNewDriverCommand.Parameters[0].Value.SetWideString(Login);
  FCreateNewDriverCommand.Parameters[1].Value.SetWideString(Password);
  FCreateNewDriverCommand.Parameters[2].Value.SetWideString(First_Name);
  FCreateNewDriverCommand.Parameters[3].Value.SetWideString(Second_Name);
  FCreateNewDriverCommand.Parameters[4].Value.SetWideString(Third_name);
  FCreateNewDriverCommand.Parameters[5].Value.SetWideString(Car);
  FCreateNewDriverCommand.Parameters[6].Value.SetWideString(Phone);
  FCreateNewDriverCommand.Parameters[7].Value.SetWideString(Car_Sign);
  FCreateNewDriverCommand.ExecuteUpdate;
end;

procedure TServerMethods1Client.DeleteDriver(Id: Integer);
begin
  if FDeleteDriverCommand = nil then
  begin
    FDeleteDriverCommand := FDBXConnection.CreateCommand;
    FDeleteDriverCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FDeleteDriverCommand.Text := 'TServerMethods2.DeleteDriver';
    FDeleteDriverCommand.Prepare;
  end;
  FDeleteDriverCommand.Parameters[0].Value.SetInt32(Id);
  FDeleteDriverCommand.ExecuteUpdate;
end;

procedure TServerMethods1Client.EditDriver(in_id: Integer; in_login: string; in_password: string; in_first_name: string; in_second_name: string; in_third_name: string; in_car: string; in_phone: string; in_car_sign: string; in_driver_status: Integer);
begin
  if FEditDriverCommand = nil then
  begin
    FEditDriverCommand := FDBXConnection.CreateCommand;
    FEditDriverCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FEditDriverCommand.Text := 'TServerMethods2.EditDriver';
    FEditDriverCommand.Prepare;
  end;
  FEditDriverCommand.Parameters[0].Value.SetInt32(in_id);
  FEditDriverCommand.Parameters[1].Value.SetWideString(in_login);
  FEditDriverCommand.Parameters[2].Value.SetWideString(in_password);
  FEditDriverCommand.Parameters[3].Value.SetWideString(in_first_name);
  FEditDriverCommand.Parameters[4].Value.SetWideString(in_second_name);
  FEditDriverCommand.Parameters[5].Value.SetWideString(in_third_name);
  FEditDriverCommand.Parameters[6].Value.SetWideString(in_car);
  FEditDriverCommand.Parameters[7].Value.SetWideString(in_phone);
  FEditDriverCommand.Parameters[8].Value.SetWideString(in_car_sign);
  FEditDriverCommand.Parameters[9].Value.SetInt32(in_driver_status);
  FEditDriverCommand.ExecuteUpdate;
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
  FEchoStringCommand.DisposeOf;
  FReverseStringCommand.DisposeOf;
  FCreateNewDriverCommand.DisposeOf;
  FDeleteDriverCommand.DisposeOf;
  FEditDriverCommand.DisposeOf;
  inherited;
end;

end.
