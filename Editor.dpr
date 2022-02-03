program Editor;

uses
  System.StartUpCopy,
  FMX.Forms,
  UPpal in 'UPpal.pas' {FrmPpal},
  UAcerca in 'UAcerca.pas' {FrmAcerca};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmPpal, FrmPpal);
  Application.Run;
end.
