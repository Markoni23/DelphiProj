program ControlPanelServer;

uses
  Vcl.Forms,
  Web.WebReq,
  IdHTTPWebBrokerBridge,
  Server in 'Server.pas' {Form1},
  ServerContainerUnit in 'ServerContainerUnit.pas' {ServerContainer1: TDataModule},
  ServerMethodsUnit in 'ServerMethodsUnit.pas' {DSServerModule1: TDSServerModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TServerContainer1, ServerContainer1);
  Application.Run;
end.

