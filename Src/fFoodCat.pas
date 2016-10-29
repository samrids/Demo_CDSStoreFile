unit fFoodCat;

interface

uses
{$IFDEF VER150}Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms,
  Dialogs, DB, DBClient, StdCtrls, ExtCtrls, Grids, DBGrids, {$ENDIF}
{$IFDEF VER310}
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Data.DB, Datasnap.DBClient, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Grids,
  Vcl.DBGrids, {$ENDIF}
  FoodClasses, Vcl.ComCtrls;

type
  TForm3 = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    btn_OK: TButton;
    Button2: TButton;
    ClientDataSet1: TClientDataSet;
    DataSource1: TDataSource;
    Btn_Apply: TButton;
    StatusBar1: TStatusBar;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button2Click(Sender: TObject);
    procedure Btn_ApplyClick(Sender: TObject);
    procedure btn_OKClick(Sender: TObject);
    procedure DataSource1StateChange(Sender: TObject);
  private
    procedure SaveToDisk;
  public
    FoodCategorires: TFoodCategories;
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

procedure TForm3.FormCreate(Sender: TObject);
begin
  FoodCategorires := TFoodCategories.create(ClientDataSet1,
    ExtractFilePath(application.exename) + 'FoodCat.xml');

  StatusBar1.Panels[0].Text := format('data: %s', [FoodCategorires.FileName]);
end;

procedure TForm3.SaveToDisk;
begin
  FoodCategorires.Save;
end;

procedure TForm3.Btn_ApplyClick(Sender: TObject);
begin
  SaveToDisk;
end;

procedure TForm3.btn_OKClick(Sender: TObject);
begin
  SaveToDisk;
end;

procedure TForm3.Button2Click(Sender: TObject);
begin
  Self.Close;
end;

procedure TForm3.DataSource1StateChange(Sender: TObject);
begin
  Btn_Apply.Enabled := ((Sender as TDataSource).State in [dsInsert, dsEdit]);
end;

procedure TForm3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FoodCategorires.free;
end;

end.
