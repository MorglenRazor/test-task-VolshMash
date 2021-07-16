unit Refill;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, DataModule;

type
  TForm3 = class(TForm)
    Label3: TLabel;
    MaskEdit2: TMaskEdit;
    Label2: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    procedure Refill;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation
  uses Bank_accounts;
{$R *.dfm}

procedure TForm3.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', #8])then Key:=#0;
end;

procedure TForm3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Form1.getQuery;
end;

procedure TForm3.Refill;
var
 numAccount, sumRefill, money: string;
 refill: real;
begin
  numAccount:= MaskEdit2.Text;
  sumRefill:= Edit1.Text;
  DataModule1.FDQuery1.Open(Format('select state_account from bank_accounts where uuid_key = ''%s''',[numAccount]));
  money := DataModule1.FDQuery1.Table.Rows[0].GetData(0);
  refill:= StrToFloat(money) + StrToFloat(sumRefill);
  money := FloatToStr(refill);
  DataModule1.FDQuery1.ExecSQL(Format('update bank_accounts SET state_account=''%s'' where uuid_key = ''%s''',[money, numAccount]));
  ShowMessage('Пополнение прошло успешно')


end;

procedure TForm3.Button1Click(Sender: TObject);
begin
   Refill;
end;

end.
