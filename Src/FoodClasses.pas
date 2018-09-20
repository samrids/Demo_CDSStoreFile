unit FoodClasses;

interface

{
  About class
  TFoodCategories: food categories data
  TFoods:  foods data
}
uses
  Forms, classes, SysUtils, DBClient, DB;

type

  TAwCustomDataset = class
  private
    FCds: TClientDataSet;
    FFileName: string;
  public
    constructor Create(CustomCds: TClientDataSet; const SaveToFileName: string);
    destructor Destroy; override;

    procedure New;
    procedure Save;
    procedure Cancel;
    property FileName: string read FFileName write FFileName;
    property Cds: TClientDataSet read FCds write FCds;
  end;

  TFoodCategories = class(TAwCustomDataset)
  private
  public
    constructor Create(CustomCds: TClientDataSet; const SaveToFileName: string);
    destructor Destroy; override;
  end;

  TFoods = class(TAwCustomDataset)
  private
    function GetCategorieCode_Label: string;
    function GetPrice_Lable: string;
    function GetProductCode_Label: string;
    function GetProductName_Label: string;
  public
    constructor Create(CustomCds: TClientDataSet; const SaveToFileName: string);
    destructor Destroy; override;

    property ProductCode_Label: string read GetProductCode_Label;
    property ProductName_Label: string read GetProductName_Label;
    property Price_Label: string read GetPrice_Lable;
    property CategorieCode_Label: string read GetCategorieCode_Label;
  end;

implementation

uses uCaptionStr;

{ TFoods }

constructor TFoods.Create(CustomCds: TClientDataSet;
  const SaveToFileName: string);
begin
  inherited;

  if not Cds.Active then
  begin
    with FCds do
    begin
      FieldDefs.Add('PRODUCT_CODE', ftString, 3, true);
      FieldDefs.Add('PRODUCT_NAME', ftString, 100, true);
      FieldDefs.Add('PRICE', ftFloat, 0, False);
      FieldDefs.Add('CATEGORIE_CODE', ftString, 3, False);

      CreateDataSet;
      FCds.IndexFieldNames := 'PRODUCT_CODE';

      Open;
    end;
  end
  else
  begin
    FCds.Close;
    FCds.Open;
    FCds.EmptyDataSet;
    FCds.IndexFieldNames := 'PRODUCT_CODE';
  end;

  if FileExists(FileName) then
    FCds.LoadFromFile(FileName)
  else
  begin
    if FileExists(ExtractFilePath(Application.exename) + Self.ClassName + '.xml')
    then
      FCds.LoadFromFile(ExtractFilePath(Application.exename) + Self.ClassName
        + '.xml');
  end;

  // Caption
  with FCds do
  begin
    Fields.Fields[0].DisplayLabel := PRODUCT_CODEStr;
    Fields.Fields[1].DisplayLabel := PRODUCT_NAMEStr;
    Fields.Fields[2].DisplayLabel := PRICE_Str;
    Fields.Fields[3].DisplayLabel := CATEGORIE_CODEStr;
  end;
end;

destructor TFoods.Destroy;
begin
  inherited;
end;

function TFoods.GetCategorieCode_Label: string;
begin
  Result := CATEGORIE_CODEStr;
end;

function TFoods.GetPrice_Lable: string;
begin
  Result := PRICE_Str;
end;

function TFoods.GetProductCode_Label: string;
begin
  Result := PRODUCT_CODEStr;
end;

function TFoods.GetProductName_Label: string;
begin
  Result := PRODUCT_NAMEStr;
end;

{ TFoodCategories }

constructor TFoodCategories.Create(CustomCds: TClientDataSet;
  const SaveToFileName: string);
begin
  inherited;

  if not FCds.Active then
  begin
    with FCds do
    begin
      FieldDefs.Add('CATEGORIE_CODE', ftString, 3, true);
      FieldDefs.Add('CATEGORIE_NAME', ftString, 50, true);

      CreateDataSet;
      FCds.IndexFieldNames := 'CATEGORIE_CODE';

      Open;
    end;
  end
  else
  begin
    FCds.Close;
    FCds.Open;
    FCds.EmptyDataSet;
    FCds.IndexFieldNames := 'PRODUCT_CODE';
  end;

  if FileExists(FileName) then
    FCds.LoadFromFile(FileName)
  else
  begin
    if FileExists(ExtractFilePath(Application.exename) + Self.ClassName + '.xml')
    then
      FCds.LoadFromFile(ExtractFilePath(Application.exename) + Self.ClassName
        + '.xml');
  end;

  // Caption
  with FCds do
  begin
    Fields.Fields[0].DisplayLabel := CATEGORIE_CODEStr;
    Fields.Fields[1].DisplayLabel := CATEGORIE_NAMEStr;
  end;
end;

destructor TFoodCategories.Destroy;
begin
  inherited;
end;

{ TAwCustomDataset }

procedure TAwCustomDataset.Cancel;
begin
  FCds.Cancel;
  FCds.CancelUpdates;
end;

constructor TAwCustomDataset.Create(CustomCds: TClientDataSet;
  const SaveToFileName: string);
begin
  if SaveToFileName = '' then
    FFileName := ExtractFilePath(Application.exename) + Self.ClassName + '.xml'
  else
    FFileName := SaveToFileName;

  FCds := CustomCds;
end;

destructor TAwCustomDataset.Destroy;
begin
  if Assigned(FCds) then
    FCds.free;
  inherited;
end;

procedure TAwCustomDataset.New;
begin
  FCds.Append;
end;

procedure TAwCustomDataset.Save;
begin
  FCds.CheckBrowseMode;
  if (FFileName <> '') then
    FCds.SaveToFile(FFileName)
  else
    FCds.SaveToFile(ExtractFilePath(Application.exename) + Self.ClassName
      + '.xml');
end;

end.
