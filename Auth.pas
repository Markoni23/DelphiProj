unit Auth;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Edit;

type
  TAuth = class(TForm)
    WelcomeToTaxiAppText: TLabel;
    EnterLoginTextView: TLabel;
    EnterPassText: TLabel;
    EnterLoginEditText: TEdit;
    EnterPassEditText: TEdit;
  end;
var
  NewAuth : TAuth;

implementation

begin

end.
