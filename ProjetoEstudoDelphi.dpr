program ProjetoEstudoDelphi;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {Form1},
  uConn in 'uConn.pas' {DataModule1: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.Run;
end.