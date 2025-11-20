unit EnablerTestForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TForm39 = class(TForm)
    btnBad: TButton;
    btnAddCustomer: TButton;
    btnDeleteCustomer: TButton;
    btnDeleteAllCustomers: TButton;
    rgAccess: TRadioGroup;
    procedure btnBadClick(Sender: TObject);
    procedure rgAccessClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form39: TForm39;

implementation

{$R *.dfm}

procedure TForm39.btnBadClick(Sender: TObject);
begin
  ShowMessage((Sender as TButton).Caption);
end;

procedure TForm39.FormCreate(Sender: TObject);
begin
  rgAccessClick(Sender);
end;

procedure TForm39.rgAccessClick(Sender: TObject);
begin
  btnDeleteCustomer.Enabled := rgAccess.ItemIndex > 0;
  btnDeleteAllCustomers.Enabled := rgAccess.ItemIndex > 0;
  btnBad.Enabled := rgAccess.ItemIndex = 2;
  btnBad.Visible := rgAccess.ItemIndex = 2;
end;

end.
