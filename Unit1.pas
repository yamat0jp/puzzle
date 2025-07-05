unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, PythonEngine,
  Vcl.PythonGUIInputOutput;

type
  TForm1 = class(TForm)
    PythonEngine1: TPythonEngine;
    Button1: TButton;
    Memo1: TMemo;
    PythonDelphiVar1: TPythonDelphiVar;
    procedure Button1Click(Sender: TObject);
  private
    { Private êÈåæ }
    function addnum(const code: string = ''; count: integer = 1): integer;
  public
    { Public êÈåæ }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

function TForm1.addnum(const code: string = ''; count: integer = 1): integer;
var
  s: string;
begin
  if count = 9 then
  begin
    s := code + count.ToString;
    PythonEngine1.ExecString('varname1.Value = ' + s);
    if Abs(PythonDelphiVar1.Value - 100) < 1.0E-6 then
    begin
      Memo1.Lines.Add(s + '=100');
      result := 1;
    end
    else
      result := 0;
    Exit;
  end;
  for var op in ['+', '-', '*', '/', ''] do
    inc(result, addnum(code + count.ToString + op, count + 1));
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Memo1.Lines.Clear;
  Memo1.Lines.Add(addnum.ToString);
end;

end.
