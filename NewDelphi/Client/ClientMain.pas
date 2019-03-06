unit ClientMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Datasnap.DBClient,
  Datasnap.DSConnect, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls,
  Data.Bind.Components, Data.Bind.DBScope, Data.DBXDataSnap, Data.DBXCommon,
  IPPeerClient, Data.SqlExpr, Vcl.ExtCtrls;

type
  TForm3 = class(TForm)
    DriverCDS: TClientDataSet;
    PageControl: TPageControl;
    MainPage: TTabSheet;
    ArchivePage: TTabSheet;
    DriverPage: TTabSheet;
    DriverGrid: TDBGrid;
    DriverDS: TDataSource;
    AddDriverButton: TButton;
    BindSourceDB1: TBindSourceDB;
    DSProviderConnection1: TDSProviderConnection;
    SQLConnection1: TSQLConnection;
    bDelDriver: TButton;
    bEditDriver: TButton;
    ArchiveGrid: TDBGrid;
    ArchiveCDS: TClientDataSet;
    ArchiveDS: TDataSource;
    BindSourceDB2: TBindSourceDB;
    ActiveGrid: TDBGrid;
    ActiveOrdersCDS: TClientDataSet;
    ActiveOrderDS: TDataSource;
    BindSourceDB3: TBindSourceDB;
    bAddNewOrder: TButton;
    bDelOrder: TButton;
    ActiveDriverGrid: TDBGrid;
    ActiveDriverCDS: TClientDataSet;
    ActiveDriverDS: TDataSource;
    BindSourceDB4: TBindSourceDB;
    bDriverToOrder: TButton;
    FreeDriverCDS: TClientDataSet;
    FreeDriverDS: TDataSource;
    Refreshing: TTimer;
    procedure AddDriverButtonClick(Sender: TObject);
    procedure bDelDriverClick(Sender: TObject);
    procedure bEditDriverClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bAddNewOrderClick(Sender: TObject);
    procedure bDelOrderClick(Sender: TObject);
    procedure bDriverToOrderClick(Sender: TObject);
    procedure RefreshingTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

uses ClientModuleUnit1, ClientClassesUnit1, EditDriver, EditOrder;

{$R *.dfm}

procedure TForm3.AddDriverButtonClick(Sender: TObject);
var login,password,first_name,second_name,third_name,car,phone,car_sign : string;
begin
     Form5.Caption := 'Создать нового ' + Form5.Caption;


     if EditDriver.Form5.ShowModal = mrOk then
     begin
      with Form5 do
      begin
        login := eLogin.Text;
        password := ePassword.Text;
        first_name := eFirstName.Text;
        second_name := eSecondName.Text;
        third_name := eThirdName.Text;
        car := eCar.Text;
        phone := ePhone.Text;
        car_sign := eCarSign.Text;
      end;
      ClientModule1.ServerMethods1Client.CreateNewDriver(login,password,first_name,second_name,
                                              third_name,car,phone,car_sign);
      DriverCDS.Refresh;
     end;
end;

procedure TForm3.bAddNewOrderClick(Sender: TObject);
begin
  if EditOrderForm.ShowModal = mrOk then
  begin
  with EditOrderForm do
  begin
    Caption := 'Создать новый ' + Caption;
    ClientModule1.ServerMethods1Client.NewOrder(eAddresStart.Text,eAddresTo.Text,eAdditional.Text,
                                                DateTimePicker1.DateTime);
  end;
   ActiveOrdersCDS.Refresh;
  end;
end;

procedure TForm3.bDelDriverClick(Sender: TObject);
 var id:integer;
begin
  id := DriverCDS.FieldByName('id').Value;
  ClientModule1.ServerMethods1Client.DeleteDriver(id);
  DriverCds.Refresh;
end;

procedure TForm3.bDelOrderClick(Sender: TObject);
begin
  ClientModule1.ServerMethods1Client.DeleteOrder(ActiveOrdersCDS.FieldByName('id').Value);
  ActiveOrdersCDS.Refresh;
end;

procedure TForm3.bDriverToOrderClick(Sender: TObject);
var id_driver, id_order : integer;
begin
  id_order := ActiveOrdersCDS.FieldByName('id').Value;
  id_driver := FreeDriverCDS.FieldByName('id').Value;
  ClientModule1.ServerMethods1Client.DriverToOrder(id_driver,id_order);
  ActiveDriverCDS.Refresh;
  ActiveOrdersCDS.Refresh;
end;

procedure TForm3.bEditDriverClick(Sender: TObject);
var login,password,first_name,second_name,third_name,car,phone,car_sign : string;
    id,driver_status : integer;
begin
  with Form5 do
  begin
    Caption := 'Изменить данные ';
    eLogin.Text :=  DriverCDS.FieldByName('login').Value;
    eFirstName.Text :=  DriverCDS.FieldByName('First_Name').Value;
    eSecondName.Text :=  DriverCDS.FieldByName('Second_Name').Value;
    eThirdName.Text :=  DriverCDS.FieldByName('Third_Name').Value;
    ePassword.Text :=  DriverCDS.FieldByName('Password').Value;
    ePhone.Text :=  DriverCDS.FieldByName('Phone').Value;
    eCar.Text :=  DriverCDS.FieldByName('Car').Value;
    eCarSign.Text :=  DriverCDS.FieldByName('Car_Sign').Value;
    id := DriverCDS.FieldByName('id').Value;
    driver_status := DriverCDS.FieldByName('driver_status').Value;
    if EditDriver.Form5.ShowModal = mrOk then
      begin
        login := eLogin.Text;
        password := ePassword.Text;
        first_name := eFirstName.Text;
        second_name := eSecondName.Text;
        third_name := eThirdName.Text;
        car := eCar.Text;
        phone := ePhone.Text;
        car_sign := eCarSign.Text;

      ClientModule1.ServerMethods1Client.EditDriver(id,login,password,first_name,second_name,
                                              third_name,car,phone,car_sign,driver_status);
      DriverCDS.Refresh;
      end;
  end;

end;

procedure TForm3.FormCreate(Sender: TObject);
begin
    DriverCDS.Active:=True;
    ArchiveCDS.Active:=True;
    ActiveOrdersCDS.Active:=True;
    FreeDriverCDS.Active := True;

    DriverGrid.Columns.Items[0].Width:=50;
    DriverGrid.Columns.Items[1].Width:=100;
    DriverGrid.Columns.Items[2].Width:=100;
    DriverGrid.Columns.Items[3].Width:=100;
    DriverGrid.Columns.Items[4].Width:=100;
    DriverGrid.Columns.Items[5].Width:=100;
    DriverGrid.Columns.Items[6].Width:=100;
    DriverGrid.Columns.Items[7].Width:=100;

    DriverGrid.Columns.Items[1].Title.Caption:='Логин';
    DriverGrid.Columns.Items[2].Title.Caption:='Фамилия';
    DriverGrid.Columns.Items[3].Title.Caption:='Имя';
    DriverGrid.Columns.Items[4].Title.Caption:='Отчество';
    DriverGrid.Columns.Items[5].Title.Caption:='Автомобиль';
    DriverGrid.Columns.Items[6].Title.Caption:='Гос.Номер';
    DriverGrid.Columns.Items[7].Title.Caption:='Тел.Номер';


    ActiveDriverGrid.Columns.Items[0].Width:=50;
    ActiveDriverGrid.Columns.Items[1].Width:=100;
    ActiveDriverGrid.Columns.Items[2].Width:=100;
    ActiveDriverGrid.Columns.Items[3].Width:=100;
    ActiveDriverGrid.Columns.Items[4].Width:=100;
    ActiveDriverGrid.Columns.Items[5].Width:=100;
    ActiveDriverGrid.Columns.Items[6].Width:=100;
    ActiveDriverGrid.Columns.Items[7].Width:=100;

    ActiveDriverGrid.Columns.Items[1].Title.Caption:='Логин';
    ActiveDriverGrid.Columns.Items[2].Title.Caption:='Фамилия';
    ActiveDriverGrid.Columns.Items[3].Title.Caption:='Имя';
    ActiveDriverGrid.Columns.Items[4].Title.Caption:='Отчество';
    ActiveDriverGrid.Columns.Items[5].Title.Caption:='Автомобиль';
    ActiveDriverGrid.Columns.Items[6].Title.Caption:='Гос.Номер';
    ActiveDriverGrid.Columns.Items[7].Title.Caption:='Тел.Номер';

    ArchiveGrid.Columns.Items[0].Width :=50;
    ArchiveGrid.Columns.Items[1].Width :=100;
    ArchiveGrid.Columns.Items[2].Width :=100;
    ArchiveGrid.Columns.Items[3].Width :=100;
    ArchiveGrid.Columns.Items[4].Width :=200;
    ArchiveGrid.Columns.Items[5].Width :=100;

    ArchiveGrid.Columns.Items[1].Title.Caption:='Откуда';
    ArchiveGrid.Columns.Items[2].Title.Caption:='Куда';
    ArchiveGrid.Columns.Items[3].Title.Caption:='Дата';
    ArchiveGrid.Columns.Items[4].Title.Caption:='Доп.информация';
    ArchiveGrid.Columns.Items[5].Title.Caption:='Логин водителя';


    ActiveGrid.Columns.Items[0].Width :=50;
    ActiveGrid.Columns.Items[1].Width :=100;
    ActiveGrid.Columns.Items[2].Width :=100;
    ActiveGrid.Columns.Items[3].Width :=100;
    ActiveGrid.Columns.Items[4].Width :=200;
    ActiveGrid.Columns.Items[5].Width :=150;
    ActiveGrid.Columns.Items[6].Width :=100;

    ActiveGrid.Columns.Items[1].Title.Caption:='Откуда';
    ActiveGrid.Columns.Items[2].Title.Caption:='Куда';
    ActiveGrid.Columns.Items[3].Title.Caption:='Дата';
    ActiveGrid.Columns.Items[4].Title.Caption:='Доп.информация';
    ActiveGrid.Columns.Items[5].Title.Caption:='Статус заказа';
    ActiveGrid.Columns.Items[6].Title.Caption:='Логин водителя';



end;

procedure TForm3.RefreshingTimer(Sender: TObject);
begin
  ActiveOrdersCDS.Refresh();
  ArchiveCDS.Refresh();
  DriverCDS.Refresh();
  FreeDriverCDS.Refresh();
end;

end.
