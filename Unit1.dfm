object Form1: TForm1
  Left = 0
  Top = 0
  Caption = #23567#30010#31639
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Button1: TButton
    Left = 344
    Top = 192
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 0
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 0
    Top = 0
    Width = 274
    Height = 441
    Align = alLeft
    Lines.Strings = (
      'Memo1')
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 1
  end
  object PythonEngine1: TPythonEngine
    Left = 176
    Top = 96
  end
  object PythonDelphiVar1: TPythonDelphiVar
    Engine = PythonEngine1
    Module = '__main__'
    VarName = 'varname1'
    Left = 304
    Top = 96
  end
end
