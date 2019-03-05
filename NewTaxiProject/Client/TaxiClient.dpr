program TaxiClient;

uses
  Vcl.Forms,
  ClientMain in '..\..\Projects\ClientMain.pas' {Form3},
  ClientModuleUnit1 in '..\..\Projects\ClientModuleUnit1.pas' {ClientModule1: TDataModule},
  EditDriver in '..\..\Projects\EditDriver.pas' {Form5},
  ClientClassesUnit1 in '..\..\Projects\ClientClassesUnit1.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TClientModule1, ClientModule1);
  Application.CreateForm(TForm5, Form5);
  Application.Run;
end.
