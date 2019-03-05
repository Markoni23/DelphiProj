unit ServerMethodsUnit1;

interface

uses System.SysUtils, System.Classes, System.Json,
    DataSnap.DSProviderDataModuleAdapter,
    Datasnap.DSServer, Datasnap.DSAuth, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.PG,
  FireDAC.Phys.PGDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Datasnap.Provider, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TServerMethods2 = class(TDSServerModule)
    PGTaxiConnection: TFDConnection;
    DriverTable: TFDQuery;
    DriverDSP: TDataSetProvider;
    SPNewDriver: TFDStoredProc;
    FDTransaction1: TFDTransaction;
    SPDeleteDriver: TFDStoredProc;
    SPEditDriver: TFDStoredProc;
    ArchiveTable: TFDQuery;
    ArchiveDSP: TDataSetProvider;
    ActiveOrderTable: TFDQuery;
    ActiveOrderDSP: TDataSetProvider;
    SPNewOrder: TFDStoredProc;
    SPDeleteOrder: TFDStoredProc;
    SPEditOrder: TFDStoredProc;
    SPChangeOrderStat: TFDStoredProc;
  private
    { Private declarations }
  public
    { Public declarations }
    function EchoString(Value: string): string;
    function ReverseString(Value: string): string;
    procedure CreateNewDriver(Login,Password, First_Name,Second_Name,Third_name,
           Car, Phone, Car_Sign: string);
    procedure DeleteDriver(Id: integer);
    procedure EditDriver(in_id : integer; in_login,in_password, in_first_name,in_second_name,
            in_third_name, in_car, in_phone, in_car_sign: string;in_driver_status:integer);
  end;

implementation


{$R *.dfm}


uses System.StrUtils;

function TServerMethods2.EchoString(Value: string): string;
begin
  Result := Value;
end;


function TServerMethods2.ReverseString(Value: string): string;
begin
  Result := System.StrUtils.ReverseString(Value);
end;

procedure TServerMethods2.CreateNewDriver(Login: string; Password: string; First_Name: string; Second_Name: string; Third_name: string; Car: string; Phone: string; Car_Sign: string);
begin
  with SPNewDriver do
  begin
  ParamByName('Login').Value := Login;
  ParamByName('Password').Value := Password;
  ParamByName('First_Name').Value := First_Name;
  ParamByName('Second_Name').Value := Second_Name;
  ParamByName('Third_name').Value := Third_name;
  ParamByName('Car').Value := Car;
  ParamByName('Phone').Value := Phone;
  ParamByName('Car_Sign').Value := Car_Sign;
  ExecProc;
  end;
end;

procedure TServerMethods2.DeleteDriver(Id: Integer);
begin
  with SPDeleteDriver do
  begin
    ParamByName('in_id').Value := Id;
    ExecProc;
  end;
end;

procedure TServerMethods2.EditDriver(in_id: Integer; in_login: string; in_password: string; in_first_name: string; in_second_name: string; in_third_name: string; in_car: string; in_phone: string; in_car_sign: string; in_driver_status: Integer);
begin
  with SPEditDriver do
  begin
    ParamByName('in_id').Value := in_id;
    ParamByName('in_login').Value := in_login;
    ParamByName('in_password').Value := in_password;
    ParamByName('in_first_name').Value := in_first_name;
    ParamByName('in_second_Name').Value := in_second_Name;
    ParamByName('in_third_name').Value := in_third_name;
    ParamByName('in_car').Value := in_car;
    ParamByName('in_phone').Value := in_phone;
    ParamByName('in_car_sign').Value := in_car_sign;
    ParamByName('in_driver_status').Value := in_driver_status;
    ExecProc;
  end;
end;


end.

