unit UAcerca;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FMX.Controls.Presentation;

type
  TFrmAcerca = class(TForm)
    Label1: TLabel;
    Image1: TImage;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmAcerca: TFrmAcerca;

implementation

{$R *.fmx}

procedure TFrmAcerca.Button1Click(Sender: TObject);
begin
  Close;
end;

end.
