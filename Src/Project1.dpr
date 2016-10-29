program Project1;

uses
  Forms,
  FoodClasses in 'FoodClasses.pas',
  fFoodCat in 'fFoodCat.pas' {Form3},
  fMain in 'fMain.pas' {Form1},
  uCaptionStr in 'uCaptionStr.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
