program Mobile;

uses
  System.StartUpCopy,
  FMX.Forms,
  MobileMain in 'MobileMain.pas' {Form1},
  ClientClassesUnit2 in 'ClientClassesUnit2.pas',
  ClientModuleUnit2 in 'ClientModuleUnit2.pas' {ClientModule2: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TClientModule2, ClientModule2);
  Application.Run;
end.
