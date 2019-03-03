program MobileAppServer;

uses
  FMX.Forms,
  Web.WebReq,
  IdHTTPWebBrokerBridge,
  Server in 'Server.pas' {Form3},
  ServerMethodsUnit1 in 'ServerMethodsUnit1.pas' {ServerMethods1: TDSServerModule},
  ServerContainerUnit1 in 'ServerContainerUnit1.pas' {ServerContainer1: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TServerContainer1, ServerContainer1);
  Application.Run;
end.

