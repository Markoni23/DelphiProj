program Project1;

uses
  System.StartUpCopy,
  FMX.Forms,
  Auth in 'Auth.pas' {Auth};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TAuth, NewAuth);
  Application.Run;
end.
