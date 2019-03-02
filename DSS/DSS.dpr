program DSS;

uses
  Vcl.Forms,
  Web.WebReq,
  IdHTTPWebBrokerBridge,
  SMain in 'SMain.pas' {ServerForm},
  SMethods in 'SMethods.pas' {ServerMethods1: TDSServerModule},
  SContainer in 'SContainer.pas' {ServerContainer1: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TServerForm, ServerForm);
  Application.CreateForm(TServerContainer1, ServerContainer1);
  Application.Run;
end.

