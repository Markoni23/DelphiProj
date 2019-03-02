unit MAIN;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Edit, FMX.Controls.Presentation, FMX.ListBox, FMX.ScrollBox, FMX.Memo,
  Data.DBXDataSnap, Data.DBXCommon, IPPeerClient, Data.DB, Datasnap.DBClient,
  Datasnap.DSConnect, Data.SqlExpr, System.Rtti, System.Bindings.Outputs,
  FMX.Bind.Editors, Data.Bind.EngExt, FMX.Bind.DBEngExt, Data.Bind.Components,
  Data.Bind.DBScope;

type
  TForm4 = class(TForm)
    Label1: TLabel;
    DriverNameEdit: TEdit;
    Button1: TButton;
    ComboBox1: TComboBox;
    Label2: TLabel;
    ComboBox2: TComboBox;
    Label3: TLabel;
    Edit2: TEdit;
    Label4: TLabel;
    Memo1: TMemo;
    Label5: TLabel;
    Label6: TLabel;
    DurationTimer: TTimer;
    Panel1: TPanel;
    UpdateInfoTimer: TTimer;
    ServerConnection: TSQLConnection;
    DSProviderConnection1: TDSProviderConnection;
    DriverStatusCDS: TClientDataSet;
    DriverStatusCDSid: TIntegerField;
    DriverStatusCDSname: TWideStringField;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkFillControlToField1: TLinkFillControlToField;
    RideStatusCDS: TClientDataSet;
    RideStatusCDSid: TIntegerField;
    RideStatusCDSname: TWideStringField;
    BindSourceDB2: TBindSourceDB;
    LinkFillControlToField2: TLinkFillControlToField;
    Button2: TButton;
    procedure FormCreate(Sender: TObject);
    procedure DurationTimerTimer(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure UpdateInfoTimerTimer(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    TimeSec: integer;
    DriverId: integer;
    RideId: integer;
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.fmx}

uses ClientModuleUnit2;

{$R *.NmXhdpiPh.fmx ANDROID}

procedure TForm4.Button1Click(Sender: TObject);
begin
  if DriverNameEdit.Text <> '' then
  begin
    Panel1.Visible := true;
    DriverId := ClientModule2.ServerMethods1Client.GetDriverId
      (DriverNameEdit.Text);
    UpdateInfoTimer.Enabled := true;
    ComboBox1.ItemIndex := 0;
  end;
end;

procedure TForm4.FormCreate(Sender: TObject);
begin
  Panel1.Visible := false;
  DurationTimer.Enabled := false;
  TimeSec := 0;
end;

procedure TForm4.UpdateInfoTimerTimer(Sender: TObject);
var
  ride_id: integer;
  status: string;
  I: integer;
begin
  ride_id := ClientModule2.ServerMethods1Client.GetActiveRide(DriverId);

  if ride_id <> -1 then
  begin
    RideId := ride_id;

    status := ClientModule2.ServerMethods1Client.GetRideStatus(RideId);
    for I := 0 to ComboBox2.Items.Count - 1 do
      if ComboBox2.Items[I] = status then
        ComboBox2.ItemIndex := I;

    Edit2.Text := ClientModule2.ServerMethods1Client.GetRideAddress(RideId);
    Memo1.Lines.Clear;
    Memo1.Lines.Add(ClientModule2.ServerMethods1Client.
      GetRideRequirement(RideId));
    DurationTimer.Enabled := true;
    ComboBox2.Enabled := true;
  end;
end;

procedure TForm4.Button2Click(Sender: TObject);
begin
  ClientModule2.ServerMethods1Client.MoveRideToArchive(RideId);
  RideId := -1;
  DurationTimer.Enabled := false;
  TimeSec := 0;
  Label6.Text := '00:00';
  Memo1.Lines.Clear;
  Edit2.Text := '';
  ComboBox2.ItemIndex := -1;
  ComboBox2.Enabled := false;
end;

procedure TForm4.DurationTimerTimer(Sender: TObject);
var
  mins, secs: string;
begin
  inc(TimeSec);

  if TimeSec mod 60 < 10 then
    secs := '0';
  secs := secs + IntToStr(TimeSec mod 60);

  mins := IntToStr(TimeSec div 60);

  Label6.Text := mins + ':' + secs;
end;

end.