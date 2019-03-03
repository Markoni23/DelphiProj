unit ServerMethodsUnit;

interface

uses System.SysUtils, System.Classes, Datasnap.DSServer, Datasnap.DSAuth,
    System.Json, DataSnap.DSProviderDataModuleAdapter;

type

  {Модель данных : начало}
  TDriver = class
    public
    var name : string;
  end;

  TDriverArray = array of TDriver;
  {Модель данных : конец}



{$METHODINFO ON}
  TServerMethods = class(TDSServerModule)
  private
    { Private declarations }
  public
    { Public declarations }
    function GetAllDrivers(): TDriverArray;
  end;
{$METHODINFO OFF}



implementation


uses System.StrUtils;

function TServerMethods.GetAllDrivers;
var rslt : TDriverArray;
d1 : TDriver;
d2 : TDriver;
d3 : TDriver;

begin

  d1.name := 'Adam';
  d2.name := 'Eva';
  d3.name := 'Kain';

  rslt[1] := d1;
  rslt[2] := d2;
  rslt[3] := d3;

  Result := rslt;
end;


end.

