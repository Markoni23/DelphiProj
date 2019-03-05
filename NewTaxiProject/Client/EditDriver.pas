unit EditDriver;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm5 = class(TForm)
    lFirstName: TLabel;
    lSecondName: TLabel;
    lThirdName: TLabel;
    lLogin: TLabel;
    lPassword: TLabel;
    lCar: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    eFirstName: TEdit;
    eSecondName: TEdit;
    eThirdName: TEdit;
    ePassword: TEdit;
    eLogin: TEdit;
    eCar: TEdit;
    eCarSign: TEdit;
    ePhone: TEdit;
    Button1: TButton;
  private
    { Private declarations }
    EditMode : boolean;
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

{$R *.dfm}

end.
