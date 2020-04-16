unit UJsonFormater;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.json, REST.Json, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    MemoOutput: TMemo;
    MemoInput: TMemo;
    Splitter2: TSplitter;
    procedure MemoInputChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.MemoInputChange(Sender: TObject);
var
  jo: TJSONValue;
begin
  jo := nil;
  try
    self.MemoOutput.Clear;
    jo := TJSONObject.ParseJSONValue(MemoInput.Text);
    MemoOutput.Text := TJson.Format(jo);
  except
    on ex:Exception do
    begin
      //ShowMessage(ex.Message);
    end;
  end;
  if jo <> nil then jo.Free;
end;

end.
