unit MobileOrderStat;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation;

type
  TForm7 = class(TForm)
    lCurrentStat: TLabel;
    bChangeStat: TButton;
    procedure bChangeStatClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    this_order,this_driver : integer;
  end;

var
  Form7: TForm7;

implementation
 uses ClientModuleUnit2,ClientClassesUnit2;
{$R *.fmx}



procedure TForm7.bChangeStatClick(Sender: TObject);
begin
  ClientModule2.ServerMethods2Client.ChangeOrdeerStat();
end;

end.
