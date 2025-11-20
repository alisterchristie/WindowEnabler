program WindowEnabler;

uses
  Vcl.Forms,
  WindowEnablerForm in 'WindowEnablerForm.pas' {frmWindowEnabler};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmWindowEnabler, frmWindowEnabler);
  Application.Run;
end.
