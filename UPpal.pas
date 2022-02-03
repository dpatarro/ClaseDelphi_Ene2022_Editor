unit UPpal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Memo.Types,
  FMX.Controls.Presentation, FMX.ScrollBox, FMX.Memo, FMX.StdCtrls, FMX.Menus,
  FMX.Edit, FMX.EditBox, FMX.SpinBox, UAcerca, FMX.DialogService;

type
  TFrmPpal = class(TForm)
    MmEditor: TMemo;
    PnlBotones: TPanel;
    BtnNuevo: TButton;
    SBLimpiar: TSpeedButton;
    MmPpal: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MnAcerca: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    MnAbrir: TMenuItem;
    ODAbrir: TOpenDialog;
    MnGuardarComo: TMenuItem;
    SDGuardar: TSaveDialog;
    Button1: TButton;
    Button2: TButton;
    MnGuardar: TMenuItem;
    Timer1: TTimer;
    CheckBox1: TCheckBox;
    Splitter1: TSplitter;
    BtnTruncar: TButton;
    StatusBar1: TStatusBar;
    LblSalida: TLabel;
    SpinBox1: TSpinBox;
    BtnAcerca: TButton;
    procedure BtnNuevoClick(Sender: TObject);
    procedure SBLimpiarClick(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
    procedure MnAbrirClick(Sender: TObject);
    procedure MnGuardarComoClick(Sender: TObject);
    procedure MnGuardarClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure CheckBox1Change(Sender: TObject);
    procedure BtnTruncarClick(Sender: TObject);
    procedure MmEditorChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpinBox1Change(Sender: TObject);
    procedure MnAcercaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    haCambiado: Boolean;
  end;

  MiTipoArreglo= Array[1..10] of integer;

  MiTipoRecord = Record
    Nombre: String;
    NumeroID: Integer;
    Telefono: Integer;
    Estatura: Real;
  End;

var
  FrmPpal: TFrmPpal;
  MiVariable: Integer;
  MiVariableReal: Real;
  miVariableString: String;
  miArreglo: MiTipoArreglo;
  miRecord: MiTipoRecord;

implementation

{$R *.fmx}
{$R *.LgXhdpiPh.fmx ANDROID}
{$R *.Windows.fmx MSWINDOWS}
{$R *.LgXhdpiTb.fmx ANDROID}
{$R *.Surface.fmx MSWINDOWS}

procedure IncrementaHasta10;
var
  I: Integer;
begin
  miVariableString := '';
{
  miVariableString := '1';
  miVariableString := miVariableString + '2';
  miVariableString := miVariableString + '3';
  miVariableString := miVariableString + '4';
  miVariableString := miVariableString + '5';
  miVariableString := miVariableString + '6';
  miVariableString := miVariableString + '7';
  miVariableString := miVariableString + '8';
  miVariableString := miVariableString + '9';
  miVariableString := miVariableString + '10';
}
  for I := 1 to 10 do
  begin
    miVariableString := miVariableString + IntToStr(I) ;
  end;

end;


procedure IncrementaHasta(Limite:Integer);
var
  I: Integer;
begin
  miVariableString := '';
  for I := 1 to Limite do
  begin
    miVariableString := miVariableString + IntToStr(I) ;
  end;

end;

procedure dividir(dividendo,divisor:integer; var salida:real);
begin
  if divisor <> 0  then
  begin
    salida := dividendo / divisor;
  end
  else
  begin
    salida := -99999999;
  end;

end;

procedure dividirconresto(dividendo,divisor:integer; var diventero: integer; resto:integer);
begin
  if divisor <> 0  then
  begin
    diventero := dividendo div divisor;
    resto := dividendo mod divisor;
  end
  else
  begin
    diventero := -99999999;
    resto := 0;
  end;

end;


function fun_dividir(dividendo,divisor:integer):integer;
begin
   Result := dividendo div divisor;
end;

procedure TFrmPpal.BtnNuevoClick(Sender: TObject);
// var MiotraVariable: integer;
begin

  if not haCambiado then
  begin
    MmEditor.Lines.Clear;
    haCambiado:=False;
    MiVariable := 0;
    miVariableString := 'Ejemplo de aplicacion';
  end
  else
  begin
//    MessageDlg('Desea limpiar el contenido?',TMsgDlgType.mtConfirmation,[TMsgDlgBtn.mbYes,TMsgDlgBtn.mbNo],0);

    TDialogService.MessageDialog('Desea limpiar?', TMsgDlgType.mtConfirmation, mbYesNo,
                                TMsgDlgBtn.mbNo, 0,
                                procedure (const AResult: TModalResult)
                                begin
                                  if AResult = mrYes then
                                  begin
                                        MmEditor.Lines.Clear;
                                        haCambiado:=False;

                                  end;
                                end);

  end;
//  MmEditor.Lines.Add(IntToStr( MiVariable));
// otro comentario  mientras este en la misma linea
{
comentario1
comentario2
}
end;

procedure TFrmPpal.MnGuardarClick(Sender: TObject);
begin
  if SDGuardar.FileName = '' then
  begin
    MnGuardarComoClick(Sender);
  end
  else
  begin
    MmEditor.Lines.SaveToFile(SDGuardar.FileName);
  end;

end;

procedure TFrmPpal.MnGuardarComoClick(Sender: TObject);
begin
  if SDGuardar.Execute then
  begin
    MmEditor.Lines.SaveToFile(SDGuardar.FileName);
  end;
end;

procedure TFrmPpal.BtnTruncarClick(Sender: TObject);
var data: string;
begin
  if MmEditor.Lines.Count > 0 then
    MmEditor.Lines.Delete(0);

  if MmEditor.Lines.Count > 4 then
    MmEditor.Lines[4]:='Reemplazado';
  if MmEditor.Lines.Count > 4 then
  begin
    data:= MmEditor.Lines[4] ;
    data[2]:='X';
    MmEditor.Lines[4] := data;
  end;
  MmEditorChange(Sender);
end;

procedure TFrmPpal.CheckBox1Change(Sender: TObject);
begin
  Timer1.Enabled := CheckBox1.IsChecked;
end;

procedure TFrmPpal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if haCambiado then
  begin
    if MessageDlg('Desea perder los cambios?',TMsgDlgType.mtConfirmation,[TMsgDlgBtn.mbYes,TMsgDlgBtn.mbNo],0) = mrNo
    then
      Action:=TCloseAction.caNone
    else
      Action:=TCloseAction.caFree;
  end
  else
  begin
    Action:=TCloseAction.caFree;
  end;
end;

procedure TFrmPpal.FormCreate(Sender: TObject);
var i:integer;
begin
  for I := 1 to 10 do
  begin
    miArreglo[i] := (i-1)*2+1;
  end;

  miRecord.Nombre := 'David';
  miRecord.NumeroID := 79520000;
  miRecord.Telefono := 7033434;
  miRecord.Estatura := 1.78;
  SpinBox1Change(sender);
  haCambiado:=False;
end;

procedure TFrmPpal.MenuItem5Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmPpal.MmEditorChange(Sender: TObject);
begin
  LblSalida.Text :=  IntToStr( MmEditor.Lines.Count );
  haCambiado:=True;
end;

procedure TFrmPpal.MnAbrirClick(Sender: TObject);
begin
  if ODAbrir.Execute then
  begin
    MmEditor.Lines.LoadFromFile(ODAbrir.FileName);
    SDGuardar.FileName :=ODAbrir.FileName;
  end;
end;

procedure TFrmPpal.MnAcercaClick(Sender: TObject);
begin
  FrmAcerca := TFrmAcerca.Create(self);
  FrmAcerca.ShowModal;
  FrmAcerca.Free;

end;

procedure TFrmPpal.SBLimpiarClick(Sender: TObject);
begin
  MiVariable := MiVariable + 1;
//  IncrementaHasta(MiVariable);
  try
//    MiVariable := 42354346543768659*43;
  except
    MiVariable := 1;

  end;

//  MiVariable := MiVariable*43756756;
//  raise EOutOfMemory.Create('Se acabó la memoria');
{
  dividir(MiVariable, 0, MiVariableReal);
  MmEditor.Lines.Add(FloatToStr( MiVariableReal));
  MmEditor.Lines.Add(IntToStr( fun_dividir(MiVariable,4) ));
}
  MmEditor.Lines.Add(intToStr( MiVariable));
  MmEditorChange(Sender);
  //  MmEditor.Lines.Add(miVariableString );
end;

procedure TFrmPpal.SpinBox1Change(Sender: TObject);
var j :integer;
begin
  j := trunc(SpinBox1.Value);
  MmEditor.Lines.Add( IntToStr( miArreglo[j]) );
  MmEditor.Lines.Add( miRecord.Nombre + ' ; '+ IntToStr(miRecord.NumeroID) );
end;

procedure TFrmPpal.Timer1Timer(Sender: TObject);
begin
  SBLimpiarClick(Sender);
{
  if MiVariable >10 then
  begin
    Timer1.Enabled := False;
  end;
}
end;

end.
