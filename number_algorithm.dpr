program number_algorithm;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils,
  System.Classes,
  System.Generics.Collections,
  PythonEngine,
  Unit2 in 'Unit2.pas';

var
  make_ten: TPorland;
  str: string;

begin
  try
    { TODO -oUser -cConsole メイン : ここにコードを記述してください }
    Write('4けたの数字を入力:');
    Readln(str);
    make_ten := TPorland.Create(Copy(str, 1, 4));
    make_ten.Execute;
    for var s in make_ten.Strings do
      Writeln(s);
    Writeln(make_ten.Strings.Count);
    make_ten.Free;
    Readln;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;

end.
