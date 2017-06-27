program FontSet;

uses
  Forms,
  main in 'main.pas' {MainForm};

{$R *.res}
//{$R ico.res}
//{$R FontSet.res}
//{$R FontSet.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
