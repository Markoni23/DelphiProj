program ControlPanel;

uses
  Forms,
  MAIN in 'MAIN.PAS' {SDIAppForm},
  ClientModuleUnit in 'ClientModuleUnit.pas' {ClientModule1: TDataModule},
  ClientClassesUnit in 'ClientClassesUnit.pas',
  CreateOrderForm in 'CreateOrderForm.pas' {Form2};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TSDIAppForm, SDIAppForm);
  Application.CreateForm(TClientModule1, ClientModule1);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
 
