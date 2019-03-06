//
// Created by the DataSnap proxy generator.
// 06.03.2019 19:37:34
//

unit ClientClassesUnit2;

interface

uses System.JSON, Data.DBXCommon, Data.DBXClient, Data.DBXDataSnap, Data.DBXJSON, Datasnap.DSProxy, System.Classes, System.SysUtils, Data.DB, Data.SqlExpr, Data.DBXDBReaders, Data.DBXCDSReaders, Data.DBXJSONReflect;

type
  TServerMethods2Client = class(TDSAdminClient)
  private
    FEchoStringCommand: TDBXCommand;
    FReverseStringCommand: TDBXCommand;
    FCreateNewDriverCommand: TDBXCommand;
    FDeleteDriverCommand: TDBXCommand;
    FEditDriverCommand: TDBXCommand;
    FNewOrderCommand: TDBXCommand;
    FDeleteOrderCommand: TDBXCommand;
    FEditOrderCommand: TDBXCommand;
    FChangeOrdeerStatCommand: TDBXCommand;
    FDriverToOrderCommand: TDBXCommand;
    FAuthDriverCommand: TDBXCommand;
    FDeAuthDriverCommand: TDBXCommand;
  public
    constructor Create(ADBXConnection: TDBXConnection); overload;
    constructor Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean); overload;
    destructor Destroy; override;
    function EchoString(Value: string): string;
    function ReverseString(Value: string): string;
    procedure CreateNewDriver(Login: string; Password: string; First_Name: string; Second_Name: string; Third_name: string; Car: string; Phone: string; Car_Sign: string);
    procedure DeleteDriver(Id: Integer);
    procedure EditDriver(in_id: Integer; in_login: string; in_password: string; in_first_name: string; in_second_name: string; in_third_name: string; in_car: string; in_phone: string; in_car_sign: string; in_driver_status: Integer);
    procedure NewOrder(in_addres_from: string; in_addres_to: string; in_additional: string; in_data_start: TDateTime);
    procedure DeleteOrder(in_id: Integer);
    procedure EditOrder(in_id: Integer; in_driver_id: Integer; in_order_status: Integer; in_addres_from: string; in_addres_to: string; in_additional: string; in_order_start: TDateTime; in_order_finish: TDateTime);
    procedure ChangeOrdeerStat(in_new_stat: Integer; in_id_order: Integer);
    procedure DriverToOrder(in_driver_id: Integer; in_order_id: Integer);
    function AuthDriver(in_login: string; in_password: string): Integer;
    procedure DeAuthDriver(in_id: Integer);
  end;

implementation

function TServerMethods2Client.EchoString(Value: string): string;
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

function TServerMethods2Client.ReverseString(Value: string): string;
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

procedure TServerMethods2Client.CreateNewDriver(Login: string; Password: string; First_Name: string; Second_Name: string; Third_name: string; Car: string; Phone: string; Car_Sign: string);
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

procedure TServerMethods2Client.DeleteDriver(Id: Integer);
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

procedure TServerMethods2Client.EditDriver(in_id: Integer; in_login: string; in_password: string; in_first_name: string; in_second_name: string; in_third_name: string; in_car: string; in_phone: string; in_car_sign: string; in_driver_status: Integer);
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

procedure TServerMethods2Client.NewOrder(in_addres_from: string; in_addres_to: string; in_additional: string; in_data_start: TDateTime);
begin
  if FNewOrderCommand = nil then
  begin
    FNewOrderCommand := FDBXConnection.CreateCommand;
    FNewOrderCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FNewOrderCommand.Text := 'TServerMethods2.NewOrder';
    FNewOrderCommand.Prepare;
  end;
  FNewOrderCommand.Parameters[0].Value.SetWideString(in_addres_from);
  FNewOrderCommand.Parameters[1].Value.SetWideString(in_addres_to);
  FNewOrderCommand.Parameters[2].Value.SetWideString(in_additional);
  FNewOrderCommand.Parameters[3].Value.AsDateTime := in_data_start;
  FNewOrderCommand.ExecuteUpdate;
end;

procedure TServerMethods2Client.DeleteOrder(in_id: Integer);
begin
  if FDeleteOrderCommand = nil then
  begin
    FDeleteOrderCommand := FDBXConnection.CreateCommand;
    FDeleteOrderCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FDeleteOrderCommand.Text := 'TServerMethods2.DeleteOrder';
    FDeleteOrderCommand.Prepare;
  end;
  FDeleteOrderCommand.Parameters[0].Value.SetInt32(in_id);
  FDeleteOrderCommand.ExecuteUpdate;
end;

procedure TServerMethods2Client.EditOrder(in_id: Integer; in_driver_id: Integer; in_order_status: Integer; in_addres_from: string; in_addres_to: string; in_additional: string; in_order_start: TDateTime; in_order_finish: TDateTime);
begin
  if FEditOrderCommand = nil then
  begin
    FEditOrderCommand := FDBXConnection.CreateCommand;
    FEditOrderCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FEditOrderCommand.Text := 'TServerMethods2.EditOrder';
    FEditOrderCommand.Prepare;
  end;
  FEditOrderCommand.Parameters[0].Value.SetInt32(in_id);
  FEditOrderCommand.Parameters[1].Value.SetInt32(in_driver_id);
  FEditOrderCommand.Parameters[2].Value.SetInt32(in_order_status);
  FEditOrderCommand.Parameters[3].Value.SetWideString(in_addres_from);
  FEditOrderCommand.Parameters[4].Value.SetWideString(in_addres_to);
  FEditOrderCommand.Parameters[5].Value.SetWideString(in_additional);
  FEditOrderCommand.Parameters[6].Value.AsDateTime := in_order_start;
  FEditOrderCommand.Parameters[7].Value.AsDateTime := in_order_finish;
  FEditOrderCommand.ExecuteUpdate;
end;

procedure TServerMethods2Client.ChangeOrdeerStat(in_new_stat: Integer; in_id_order: Integer);
begin
  if FChangeOrdeerStatCommand = nil then
  begin
    FChangeOrdeerStatCommand := FDBXConnection.CreateCommand;
    FChangeOrdeerStatCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FChangeOrdeerStatCommand.Text := 'TServerMethods2.ChangeOrdeerStat';
    FChangeOrdeerStatCommand.Prepare;
  end;
  FChangeOrdeerStatCommand.Parameters[0].Value.SetInt32(in_new_stat);
  FChangeOrdeerStatCommand.Parameters[1].Value.SetInt32(in_id_order);
  FChangeOrdeerStatCommand.ExecuteUpdate;
end;

procedure TServerMethods2Client.DriverToOrder(in_driver_id: Integer; in_order_id: Integer);
begin
  if FDriverToOrderCommand = nil then
  begin
    FDriverToOrderCommand := FDBXConnection.CreateCommand;
    FDriverToOrderCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FDriverToOrderCommand.Text := 'TServerMethods2.DriverToOrder';
    FDriverToOrderCommand.Prepare;
  end;
  FDriverToOrderCommand.Parameters[0].Value.SetInt32(in_driver_id);
  FDriverToOrderCommand.Parameters[1].Value.SetInt32(in_order_id);
  FDriverToOrderCommand.ExecuteUpdate;
end;

function TServerMethods2Client.AuthDriver(in_login: string; in_password: string): Integer;
begin
  if FAuthDriverCommand = nil then
  begin
    FAuthDriverCommand := FDBXConnection.CreateCommand;
    FAuthDriverCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FAuthDriverCommand.Text := 'TServerMethods2.AuthDriver';
    FAuthDriverCommand.Prepare;
  end;
  FAuthDriverCommand.Parameters[0].Value.SetWideString(in_login);
  FAuthDriverCommand.Parameters[1].Value.SetWideString(in_password);
  FAuthDriverCommand.ExecuteUpdate;
  Result := FAuthDriverCommand.Parameters[2].Value.GetInt32;
end;

procedure TServerMethods2Client.DeAuthDriver(in_id: Integer);
begin
  if FDeAuthDriverCommand = nil then
  begin
    FDeAuthDriverCommand := FDBXConnection.CreateCommand;
    FDeAuthDriverCommand.CommandType := TDBXCommandTypes.DSServerMethod;
    FDeAuthDriverCommand.Text := 'TServerMethods2.DeAuthDriver';
    FDeAuthDriverCommand.Prepare;
  end;
  FDeAuthDriverCommand.Parameters[0].Value.SetInt32(in_id);
  FDeAuthDriverCommand.ExecuteUpdate;
end;

constructor TServerMethods2Client.Create(ADBXConnection: TDBXConnection);
begin
  inherited Create(ADBXConnection);
end;

constructor TServerMethods2Client.Create(ADBXConnection: TDBXConnection; AInstanceOwner: Boolean);
begin
  inherited Create(ADBXConnection, AInstanceOwner);
end;

destructor TServerMethods2Client.Destroy;
begin
  FEchoStringCommand.DisposeOf;
  FReverseStringCommand.DisposeOf;
  FCreateNewDriverCommand.DisposeOf;
  FDeleteDriverCommand.DisposeOf;
  FEditDriverCommand.DisposeOf;
  FNewOrderCommand.DisposeOf;
  FDeleteOrderCommand.DisposeOf;
  FEditOrderCommand.DisposeOf;
  FChangeOrdeerStatCommand.DisposeOf;
  FDriverToOrderCommand.DisposeOf;
  FAuthDriverCommand.DisposeOf;
  FDeAuthDriverCommand.DisposeOf;
  inherited;
end;

end.

