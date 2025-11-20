unit WindowEnablerForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls;

type
  EnumClass = class
  public
    Treeview: TTreeview;
    ParentNode: TTreeNode;
  end;

  TfrmWindowEnabler = class(TForm)
    btnGetHandle: TButton;
    TreeView1: TTreeView;
    btnEnumerateWindows: TButton;
    edtWindowName: TEdit;
    edtWindowHandle: TEdit;
    btnEnableWindow: TButton;
    btnShowWindow: TButton;
    procedure btnEnumerateWindowsClick(Sender: TObject);
    procedure TreeView1CreateNodeClass(Sender: TCustomTreeView;
      var NodeClass: TTreeNodeClass);
    procedure btnGetHandleClick(Sender: TObject);
    procedure btnEnableWindowClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  TMyTreeNode = class(TTreeNode)
  public
    TheHandle: HWND;
    TheCaption: string;
    TheClassName: string;
  end;

var
  frmWindowEnabler: TfrmWindowEnabler;

implementation

{$R *.dfm}


function MainEnumProc(Hwnd, lParam: Longint): Boolean; stdcall;
var
  EC: EnumClass;
  ECChild: EnumClass;
  NewNode: TMyTreeNode;
  Buffer: PChar;
  RtnLen: Longint;
  NodeCaption, Caption, ClassName: string;
begin
  {Get the EnumClass Passed in}
  EC := ENumClass(lParam);
  {Allocate a buffer length}
  {Allocate a string buffer (PChar)}
  Buffer := StrAlloc(501);
  try
    {First get the caption/Text of the window were currently looking at}
    RtnLen := GetWindowText(Hwnd, Buffer, 500);
    Caption := Copy(Buffer, 1, RtnLen);
    {Now get the class name of the window were currently looking at}
    RtnLen := GetClassName(Hwnd, Buffer, 500);
    ClassName := Copy(Buffer, 1, RtnLen);
    {Set the caption of the new node}
    NodeCaption := Format('HWND: %d | ClassName: "%s" | Caption: "%s"', [HWND, ClassName, Caption]);
    {Creat the new node}
    NewNode := EC.Treeview.Items.AddChild(EC.ParentNode, NodeCaption) as TMyTreeNode;
    NewNode.TheHandle := Hwnd;
    NewNode.TheCaption := Caption;
    NewNode.TheClassName := ClassName;
    {The following is for looking at children of this window
    this basically makes the function recursive}

    //Recursion doesn't seem to be required
    ECChild := EnumClass.Create;
    try
      ECChild.Treeview := EC.Treeview;
      ECChild.ParentNode := NewNode;
      EnumChildWindows(Hwnd, @MainEnumProc, Longint(ECChild));
    finally
      ECChild.Free;
    end;
  finally
    {Free the buffer we created at the beginning of
    the procedure}
    StrDispose(Buffer);
  end;
  {Return True this will tell windows to
  carry on passing us the information}
  Result := True;
end;

procedure TfrmWindowEnabler.btnEnableWindowClick(Sender: TObject);
var
  Handle: HWND;
begin
  if TreeView1.Selected = nil then
    Exit;

  Handle := (TreeView1.Selected as TMyTreeNode).TheHandle;
  if Sender = btnEnableWindow then
    EnableWindow(Handle, True)
  else
    ShowWindow(Handle, SW_SHOWDEFAULT);
end;

procedure TfrmWindowEnabler.btnEnumerateWindowsClick(Sender: TObject);
var
  EC: EnumClass;
  TN: TTreeNode;
  wnd: HWND;
begin
  { Get Window under cursor }
  Sleep(3000);
  wnd := StrToInt(edtWindowHandle.Text);

  {Stop the flockering}
  LockWindowUpdate(TreeView1.Handle);
  try
    {Clear all the items out of the treeview}
    TreeView1.Items.Clear;
    {Create a node which will be the parent}
    TN := TreeView1.Items.Add(nil, 'Window List');
    {Create our own EnumClass.  This will be used as the
    lParam of the EnumWindows Function and will contain
    a TreeView and Parent Node}
    EC := EnumClass.Create;
    try
      EC.Treeview := TreeView1;
      EC.ParentNode := TN;
      {Call the API with the ENumclass}
      if EnumChildWindows(wnd, @MainEnumProc, Longint(EC)) then
        TN.Expand(False);
    finally
      {Ensure we free the object when were done with it}
      EC.Free;
    end;
  finally
    LockWindowUpdate(0);
  end;
end;

var
  WindowList: TList;

function GetHandle (windowtitle: string): HWND;
var
  h, TopWindow: HWND;
  Dest: array[0..80] of char;
  i: integer;
  s: string;

  function getWindows(Handle: HWND; Info: Pointer): BOOL; stdcall;
    begin
      Result:= True;
      WindowList.Add(Pointer(Handle));
    end;

begin
  result:= 0;

  try
    WindowList:= TList.Create;
    TopWindow:= Application.Handle;
    EnumWindows(@getWindows, Longint(@TopWindow));
    for i := 0 to WindowList.Count-1 do
    begin
      GetWindowText(HWND(WindowList[i]), Dest, sizeof(Dest) - 1);
      s:= dest;
      if length(s) > 0 then
      begin
        if windowtitle.Contains(s) then
        begin
          h:= HWND(WindowList[i]);
          if IsWindow(h) then
            Exit(h);
         end
       end;
    end
  finally
    WindowList.Free;
  end;
end;


procedure TfrmWindowEnabler.btnGetHandleClick(Sender: TObject);
var
  Handle: HWND;
begin
  Handle := GetHandle(edtWindowName.Text);
  edtWindowHandle.Text := IntToStr(Handle);
end;

procedure TfrmWindowEnabler.TreeView1CreateNodeClass(Sender: TCustomTreeView;
  var NodeClass: TTreeNodeClass);
begin
  NodeClass := TMyTreeNode;
end;

end.
