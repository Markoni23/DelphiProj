program Mobile;

uses
  System.StartUpCopy,
  FMX.Forms,
  MobileMain in 'MobileMain.pas' {Form1},
  ClientModuleUnit2 in 'ClientModuleUnit2.pas' {ClientModule2: TDataModule},
  ClientClassesUnit2 in 'ClientClassesUnit2.pas',
  MobileIn in 'MobileIn.pas' {Form2},
  MobileOrder in 'MobileOrder.pas' {Form6},
  MobileOrderStat in 'MobileOrderStat.pas' {Form7};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TClientModule2, ClientModule2);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm6, Form6);
  Application.CreateForm(TForm7, Form7);
  Application.Run;
end.
