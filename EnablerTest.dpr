program EnablerTest;

uses
  Vcl.Forms,
  EnablerTestForm in 'EnablerTestForm.pas' {Form39},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm39, Form39);
  Application.Run;
end.
