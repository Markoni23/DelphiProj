unit MobileIn;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  Data.DB, FMX.ListView, Datasnap.DBClient, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.PG, FireDAC.Phys.PGDef, FireDAC.FMXUI.Wait, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.Bind.Controls,
  System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Data.Bind.Grid, Data.Bind.Components, FMX.Layouts,
  Fmx.Bind.Navigator, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Data.Bind.DBScope, FireDAC.Comp.UI, FMX.Controls.Presentation, FMX.StdCtrls;

type
  TForm2 = class(TForm)
    ListView1: TListView;
    FDConnectionPGTaxi: TFDConnection;
    FDPhysPgDriverLink1: TFDPhysPgDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    BindSourceDB1: TBindSourceDB;
    FDQuery1: TFDQuery;
    NavigatorBindSourceDB1: TBindNavigator;
    BindingsList1: TBindingsList;
    Label1: TLabel;
    Label2: TLabel;
    BindSourceDB2: TBindSourceDB;
    FDQuery2: TFDQuery;
    LinkPropertyToFieldText: TLinkPropertyToField;
    LinkPropertyToFieldText2: TLinkPropertyToField;
    Label3: TLabel;
    LinkFillControlToPropertyText: TLinkFillControlToProperty;
    procedure FormShow(Sender: TObject);
    procedure ListView1ItemClick(const Sender: TObject;
      const AItem: TListViewItem);
//    procedure FDGUIxWaitCursor1Hide(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    this_driver_id : integer;
  end;

var
  Form2: TForm2;

implementation

uses MobileMain,ClientClassesUnit2,ClientModuleUnit2,MobileOrder,MobileOrderStat;

{$R *.fmx}

procedure TForm2.FormShow(Sender: TObject);
begin
  FDQuery2.ParamByName('this_id').Value := this_driver_id;
  FDQuery2.Open();
end;

procedure TForm2.ListView1ItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
  Form6.this_driver := this_driver_id;
  Form6.this_order := StrToInt(Label3.Text);
  Form6.ShowModal();
  Close();
  Form7.this_order := StrToInt(Label3.Text);
  Form7.this_driver := this_driver_id;
  Form7.ShowModal();
end;

end.
