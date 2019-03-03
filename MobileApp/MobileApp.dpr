program MobileApp;

uses
  System.StartUpCopy,
  FMX.Forms,
  MAIN in 'MAIN.pas' {Form4},
  ClientClassesUnit1 in 'ClientClassesUnit1.pas',
  ClientModuleUnit2 in 'ClientModuleUnit2.pas' {ClientModule2: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TClientModule2, ClientModule2);
  Application.Run;
end.
