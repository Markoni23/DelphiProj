unit MobileMain;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, Data.DB,
  Data.SqlExpr, Data.DBXDataSnap, Data.DBXCommon, IPPeerClient,
  Datasnap.DBClient, Datasnap.DSConnect, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView,
  FMX.Layouts, FMX.ListBox, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Edit;

type
  TForm1 = class(TForm)
    ServerConnection: TSQLConnection;
    DSPConnection: TDSProviderConnection;
    Label1: TLabel;
    eLogin: TEdit;
    ePassword: TEdit;
    Label2: TLabel;
    bLogin: TButton;
    procedure FormCreate(Sender: TObject);
    procedure bLoginClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses ClientModuleUnit2, ClientClassesUnit2,MobileIn;

{$R *.fmx}
{$R *.SmXhdpiPh.fmx ANDROID}

procedure TForm1.bLoginClick(Sender: TObject);
var this_driver_id:integer;
begin
if (eLogin.Text.IsEmpty) or (ePassword.Text.IsEmpty) then
    ShowMessage('Все поля должны быть заполнены')
else
  begin
    this_driver_id := ClientModule2.ServerMethods2Client.AuthDriver(eLogin.Text,
                                                                      ePassword.Text);
    Form2.this_driver_id := this_driver_id;
    //ShowMessage(IntToStr(this_driver_id));
    Form2.ShowModal();


  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
var I:integer;
begin

    
end;





end.
