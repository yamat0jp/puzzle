unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm3 = class(TForm)
    ListBox1: TListBox;
    Button1: TButton;
    ListBox2: TListBox;
    procedure Button1Click(Sender: TObject);
  private
    { Private êÈåæ }
  public
    { Public êÈåæ }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

uses Unit2;

procedure TForm3.Button1Click(Sender: TObject);
var
  make_ten: TPorland;
  str: string;
begin
  str := ListBox1.Items[ListBox1.ItemIndex];
  make_ten := TPorland.Create(str);
  try
    ListBox2.Items.Assign(make_ten.Strings);
  finally
    make_ten.Free;
  end;
end;

end.
