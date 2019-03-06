unit ClientModuleUnit2;

interface

uses
  System.SysUtils, System.Classes, ClientClassesUnit2, Data.DBXDataSnap,
  Data.DBXCommon, IPPeerClient, Data.DB, Data.SqlExpr;

type
  TClientModule2 = class(TDataModule)
    SQLConnection1: TSQLConnection;
  private
    FInstanceOwner: Boolean;
    FServerMethods2Client: TServerMethods2Client;
    function GetServerMethods2Client: TServerMethods2Client;
    { Private declarations }
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property InstanceOwner: Boolean read FInstanceOwner write FInstanceOwner;
    property ServerMethods2Client: TServerMethods2Client read GetServerMethods2Client write FServerMethods2Client;

end;

var
  ClientModule2: TClientModule2;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

constructor TClientModule2.Create(AOwner: TComponent);
begin
  inherited;
  FInstanceOwner := True;
end;

destructor TClientModule2.Destroy;
begin
  FServerMethods2Client.Free;
  inherited;
end;

function TClientModule2.GetServerMethods2Client: TServerMethods2Client;
begin
  if FServerMethods2Client = nil then
  begin
    SQLConnection1.Open;
    FServerMethods2Client:= TServerMethods2Client.Create(SQLConnection1.DBXConnection, FInstanceOwner);
  end;
  Result := FServerMethods2Client;
end;

end.
