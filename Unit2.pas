unit Unit2;

interface

uses System.Generics.Collections, System.Variants, System.Classes,
  System.SysUtils, System.Math;

type
  TPorland = class
  private
    FDoubles: array [0 .. 6] of Double;
    FStack: TStack<Double>;
    FList, FStrings: TStringList;
    procedure swap(var a, b: Char);
  protected
    procedure permutation(var dbl: string; left, right: integer);
  public
    constructor Create(str: string);
    destructor Destroy; override;
    procedure Execute;
    function decode(code: string): string;
    property Strings: TStringList read FStrings;
  end;

implementation

{ TPorland }

constructor TPorland.Create(str: string);
var
  tmp: Variant;
  cnt: integer;
begin
  inherited Create;
  FList := TStringList.Create;
  FStack := TStack<Double>.Create;
  FStrings := TStringList.Create;
  str := str + '###';
  permutation(str, 1, 7);
  for var s in FList do
  begin
    cnt := 0;
    for var data in s do
    begin
      if data = '#' then
        FDoubles[cnt] := Nan
      else
        FDoubles[cnt] := StrToFloat(data);
      inc(cnt);
    end;
    Execute;
  end;
end;

function TPorland.decode(code: string): string;
var
  strStack: TStack<string>;
  function main(id: integer): Boolean;
  var
    cnt: integer;
    first, second: Variant;
  begin
    if id > 3 then
      Exit(false);
    cnt := 1;
    second := strStack.Pop;
    while second = '' do
    begin
      main(id + cnt);
      second := strStack.Pop;
    end;
    cnt := 1;
    first := strStack.Pop;
    while first = '' do
    begin
      main(id + cnt);
      first := strStack.Pop;
    end;
    if (code[id] = '*') or (code[id] = '/') then
    begin
      if (Pos('+', first) > 0) or (Pos('-', first) > 0) then
        first := '(' + first + ')';
      if (Pos('+', second) > 0) or (Pos('-', second) > 0) then
        second := '(' + second + ')';
    end;
    case code[id] of
      '+':
        strStack.Push(first + '+' + second);
      '-':
        strStack.Push(first + '-' + second);
      '*':
        strStack.Push(first + 'Å~' + second);
      '/':
        strStack.Push(first + 'ÅÄ' + second);
    end;
    result := true;
  end;

begin
  strStack := TStack<string>.Create;
  try
    for var data in FDoubles do
      if IsNan(data) then
        strStack.Push('')
      else
        strStack.Push(FloatToStr(data));
    if (strStack.Pop = '') and main(1) then
      result := strStack.Pop;
  finally
    strStack.Free;
  end;
end;

destructor TPorland.Destroy;
begin
  FList.Clear;
  FList.Free;
  FStack.Free;
  FStrings.Free;
  inherited;
end;

procedure TPorland.Execute;
const
  chars = '+-*/';
var
  code, str: string;
  ans: Double;
  Count: integer;

  function main(id: integer): Boolean;
  var
    first, second: Double;
    cnt: integer;
  begin
    if id > 3 then
      Exit(false);
    cnt := 1;
    second := FStack.Pop;
    if IsNan(second) then
    begin
      while not main(id + cnt) do
        inc(cnt);
      second := FStack.Pop;
    end;
    cnt := 1;
    first := FStack.Pop;
    if IsNan(first) then
    begin
      while not main(id + cnt) do
        inc(cnt);
      first := FStack.Pop;
    end;
    case code[id] of
      '+':
        FStack.Push(first + second);
      '-':
        FStack.Push(first - second);
      '*':
        FStack.Push(first * second);
      '/':
        FStack.Push(first / second);
    end;
    result := true;
  end;

begin
  for var op1 in chars do
    for var op2 in chars do
      for var op3 in chars do
      begin
        code := op3 + op2 + op1;
        FStack.Clear;
        for var d in FDoubles do
          FStack.Push(d);
        if not IsNan(FStack.Pop) or not main(1) then
          continue;
        ans := FStack.Pop;
        if (FStack.Count = 0) and (Abs(ans - 10) < 1E-6) then
        begin
          str := decode(code) + ' = 10';
          if Strings.IndexOf(str) = -1 then
            Strings.Add(str)
        end;
      end;
end;

procedure TPorland.permutation(var dbl: string; left, right: integer);
begin
  if (left = right) and (FList.IndexOf(dbl) = -1) then
    FList.Add(dbl)
  else
  begin
    for var i := left to right do
    begin
      swap(dbl[left], dbl[i]);
      permutation(dbl, left + 1, right);
      swap(dbl[left], dbl[i]); // Backtrack
    end;
  end;
end;

procedure TPorland.swap(var a, b: Char);
var
  temp: Char;
begin
  temp := a;
  a := b;
  b := temp;
end;

end.
