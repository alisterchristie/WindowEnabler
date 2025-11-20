object frmWindowEnabler: TfrmWindowEnabler
  Left = 0
  Top = 0
  Caption = 'Window Enabler'
  ClientHeight = 545
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  DesignSize = (
    624
    545)
  TextHeight = 15
  object btnGetHandle: TButton
    Left = 8
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Get Handle'
    TabOrder = 0
    OnClick = btnGetHandleClick
  end
  object TreeView1: TTreeView
    Left = 8
    Top = 111
    Width = 608
    Height = 395
    Anchors = [akLeft, akTop, akRight, akBottom]
    Indent = 19
    TabOrder = 1
    OnCreateNodeClass = TreeView1CreateNodeClass
  end
  object btnEnumerateWindows: TButton
    Left = 8
    Top = 80
    Width = 177
    Height = 25
    Caption = 'Enumerate Windows'
    TabOrder = 2
    OnClick = btnEnumerateWindowsClick
  end
  object edtWindowName: TEdit
    Left = 89
    Top = 8
    Width = 121
    Height = 23
    TabOrder = 3
    TextHint = 'Window Name Text'
  end
  object edtWindowHandle: TEdit
    Left = 89
    Top = 37
    Width = 121
    Height = 23
    TabOrder = 4
    Text = 'edtWindowHandle'
  end
  object btnEnableWindow: TButton
    Left = 8
    Top = 512
    Width = 137
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Enable Window'
    TabOrder = 5
    OnClick = btnEnableWindowClick
    ExplicitTop = 504
  end
  object btnShowWindow: TButton
    Left = 151
    Top = 512
    Width = 137
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Show Window'
    TabOrder = 6
    OnClick = btnEnableWindowClick
  end
end
