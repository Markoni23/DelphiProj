unit ClientMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Datasnap.DBClient,
  Datasnap.DSConnect, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls,
  Data.Bind.Components, Data.Bind.DBScope, Data.DBXDataSnap, Data.DBXCommon,
  IPPeerClient, Data.SqlExpr;

type
  TForm3 = class(TForm)
    DriverCDS: TClientDataSet;
    PageControl: TPageControl;
    MainPage: TTabSheet;
    ArchivePage: TTabSheet;
    DriverPage: TTabSheet;
    DriverGrid: TDBGrid;
    DataSource1: TDataSource;
    AddDriverButton: TButton;
    BindSourceDB1: TBindSourceDB;
    DSProviderConnection1: TDSProviderConnection;
    SQLConnection1: TSQLConnection;
    bDelDriver: TButton;
    bEditDriver: TButton;
    procedure AddDriverButtonClick(Sender: TObject);
    procedure bDelDriverClick(Sender: TObject);
    procedure bEditDriverClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

uses ClientModuleUnit1, ClientClassesUnit1, EditDriver;

{$R *.dfm}

procedure TForm3.AddDriverButtonClick(Sender: TObject);
var login,password,first_name,second_name,third_name,car,phone,car_sign : string;
begin
     Form5.Caption := '������� ������ ' + Form5.Caption;


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

     DriverCDS.Refresh();
end;

procedure TForm3.bDelDriverClick(Sender: TObject);
 var id:integer;
begin
  id := DriverCDS.FieldByName('id').Value;
  ClientModule1.ServerMethods1Client.DeleteDriver(id);
  DriverCds.Refresh;
end;

procedure TForm3.bEditDriverClick(Sender: TObject);
var login,password,first_name,second_name,third_name,car,phone,car_sign : string;
    id,driver_status : integer;
begin
  with Form5 do
  begin
    Caption := '�������� ������ ';
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

 DriverCDS.Active := True;
 DriverGrid.Columns.Items[0].Width := 50;
 DriverGrid.Columns.Items[1].Title.Caption := '�����';
 DriverGrid.Columns.Items[1].Width := 100;
 DriverGrid.Columns.Items[2].Title.Caption := '������';
 DriverGrid.Columns.Items[2].Width := 100;
 DriverGrid.Columns.Items[3].Title.Caption := '�������';
 DriverGrid.Columns.Items[3].Width := 100;
 DriverGrid.Columns.Items[4].Title.Caption := '���';
 DriverGrid.Columns.Items[4].Width := 100;
 DriverGrid.Columns.Items[5].Title.Caption := '��������';
 DriverGrid.Columns.Items[5].Width := 100;
 DriverGrid.Columns.Items[6].Title.Caption := '����������';
 DriverGrid.Columns.Items[6].Width := 100;
 DriverGrid.Columns.Items[7].Title.Caption := '�������';
 DriverGrid.Columns.Items[7].Width := 100;
 DriverGrid.Columns.Items[8].Title.Caption := '���.�����';
 DriverGrid.Columns.Items[8].Width := 100;
 DriverGrid.Columns.Items[9].Visible := False;
end;

end.
