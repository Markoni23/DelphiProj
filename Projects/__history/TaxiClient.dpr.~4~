program TaxiClient;

uses
  Vcl.Forms,
  ClientMain in 'ClientMain.pas' {Form3},
  ClientModuleUnit1 in 'ClientModuleUnit1.pas' {ClientModule1: TDataModule},
  EditDriver in 'EditDriver.pas' {Form5},
  ClientClassesUnit1 in 'ClientClassesUnit1.pas',
  EditOrder in 'EditOrder.pas' {EditOrderForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TClientModule1, ClientModule1);
  Application.CreateForm(TForm5, Form5);
  Application.CreateForm(TEditOrderForm, EditOrderForm);
  Application.Run;
end.
