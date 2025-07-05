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

begin
  try
    { TODO -oUser -cConsole メイン : ここにコードを記述してください }
    make_ten := TPorland.Create('1733');
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
