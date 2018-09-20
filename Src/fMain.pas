unit fMain;

interface

uses

  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, ComCtrls, DBCtrls,FoodClasses,
  Dialogs, DB, DBClient, StdCtrls, ExtCtrls, Grids, DBGrids, Mask;


type
  TForm1 = class(TForm)
    Button1: TButton;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    Ds_Foods: TDataSource;
    ClientDataSet1: TClientDataSet;
    Cds_LookupFoodCat: TClientDataSet;
    Ds_LookupFoodCat: TDataSource;
    DBComboBox1: TDBLookupComboBox;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Panel1: TPanel;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    StatusBar1: TStatusBar;
    Panel2: TPanel;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    Foods: TFoods;
    LookupFoodCat: TFoodCategories;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses fFoodCat;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  Form3 := TForm3.create(Application);
  if Form3.ShowModal = mrOk then
  begin
    // Refresh when user click OK.
    Cds_LookupFoodCat.Close;
    Cds_LookupFoodCat.LoadFromFile(LookupFoodCat.FileName);
  end;
  if Assigned(Form3) then
    Form3 := nil;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Foods.Free;
  LookupFoodCat.Free;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  // Create food dataset.
  Foods := TFoods.create(ClientDataSet1, ExtractFilePath(Application.exename) +
    'Foods.xml'); // Foods := TFoods.create(ClientDataSet1, '');
  StatusBar1.Panels[0].Text := format('data: %s', [Foods.FileName]);

  // Create Categorie of food dataset.
  LookupFoodCat := TFoodCategories.create(Cds_LookupFoodCat,
    ExtractFilePath(Application.exename) + 'FoodCat.xml');

  // Caption Setting
  Label1.Caption := Foods.ProductCode_Label;
  Label2.Caption := Foods.ProductName_Label;
  Label3.Caption := Foods.Price_Label;
  Label4.Caption := Foods.CategorieCode_Label;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  Foods.Save;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Foods.Cancel;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  Foods.New;
  if DBEdit1.CanFocus then
    DBEdit1.SetFocus;
end;

end.
