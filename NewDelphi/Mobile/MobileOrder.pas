unit MobileOrder;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.PG, FireDAC.Phys.PGDef, FireDAC.FMXUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  Data.Bind.EngExt, Fmx.Bind.DBEngExt, System.Rtti, System.Bindings.Outputs,
  Fmx.Bind.Editors, Data.Bind.Components, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Data.Bind.DBScope, FireDAC.Comp.UI, FMX.StdCtrls,
  FMX.Controls.Presentation;

type
  TForm6 = class(TForm)
    lFrom: TLabel;
    lTo: TLabel;
    Button1: TButton;
    FDConnectionPGTaxi: TFDConnection;
    FDPhysPgDriverLink1: TFDPhysPgDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    BindSourceDB1: TBindSourceDB;
    FDQuery1: TFDQuery;
    BindingsList1: TBindingsList;
    LinkPropertyToFieldText: TLinkPropertyToField;
    LinkPropertyToFieldText2: TLinkPropertyToField;
    lAdditional: TLabel;
    LinkPropertyToFieldText3: TLinkPropertyToField;
    lStartTime: TLabel;
    LinkPropertyToFieldText4: TLinkPropertyToField;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    this_order : integer;
    this_driver : integer;
  end;

var
  Form6: TForm6;

implementation

uses ClientClassesUnit2, CLientModuleUnit2;
{$R *.fmx}

procedure TForm6.Button1Click(Sender: TObject);
begin
  ClientModule2.ServerMethods2Client.DriverToOrder(this_driver,this_order);
  ShowMessage('Вы назначены на заказ');
  Close();
end;

procedure TForm6.FormShow(Sender: TObject);
begin
  FDQuery1.ParamByName('this_id').Value := this_order;
  FDQuery1.Open();
end;

end.
