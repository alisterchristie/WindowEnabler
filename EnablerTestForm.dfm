object Form39: TForm39
  Left = 0
  Top = 0
  Caption = 'Form39'
  ClientHeight = 200
  ClientWidth = 524
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object btnBad: TButton
    Left = 8
    Top = 129
    Width = 177
    Height = 25
    Caption = 'Overload Core and Self Destruct!'
    TabOrder = 0
    OnClick = btnBadClick
  end
  object btnAddCustomer: TButton
    Left = 8
    Top = 9
    Width = 177
    Height = 25
    Caption = 'Add Customer'
    TabOrder = 1
    OnClick = btnBadClick
  end
  object btnDeleteCustomer: TButton
    Left = 8
    Top = 49
    Width = 177
    Height = 25
    Caption = 'Delete Customer'
    TabOrder = 2
    OnClick = btnBadClick
  end
  object btnDeleteAllCustomers: TButton
    Left = 8
    Top = 88
    Width = 177
    Height = 25
    Caption = 'Delete All Customers'
    TabOrder = 3
    OnClick = btnBadClick
  end
  object rgAccess: TRadioGroup
    Left = 216
    Top = 8
    Width = 185
    Height = 105
    Caption = 'Access'
    ItemIndex = 0
    Items.Strings = (
      'User'
      'Admin'
      'Super Admin')
    TabOrder = 4
    OnClick = rgAccessClick
  end
end
