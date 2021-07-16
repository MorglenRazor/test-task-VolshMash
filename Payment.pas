unit Payment;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, DataModule;

type
  TForm4 = class(TForm)
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    MaskEdit2: TMaskEdit;
    Button1: TButton;
    Edit1: TEdit;
    procedure Payment;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation
  uses Bank_accounts;
{$R *.dfm}
// Процедура оплаты
procedure TForm4.Payment;
var
  numAccount, sumPayment, money: string;
  payment: real;
begin
    sumPayment := Edit1.text;
    numAccount := MaskEdit2.Text;
    // Проверяем что поля ввода не пустые
    if (sumPayment = '') then
        ShowMessage('Не введена сумма оплаты')
    else
      begin
        if (numAccount = '') then
          ShowMessage('Не введен счет')
        else
         begin
            //Делаем запрос к базе
            DataModule1.FDQuery1.Open(Format('select state_account from bank_accounts where uuid_key = ''%s''',[numAccount]));
            //Получаем данные
            money:= DataModule1.FDQuery1.Table.Rows[0].GetData(0);
            // Проверяем что хватает денег на оплату
            if StrToFloat(sumPayment) <= StrToFloat(money) then
              begin
                payment:= StrToFloat(money) - StrToFloat(sumPayment);
                money:= FloatToStr(payment);
                // Обновляем данные в базе
                DataModule1.FDQuery1.ExecSQL(Format('update bank_accounts SET state_account=''%s'' where uuid_key = ''%s''',[money, numAccount]));
                ShowMessage('Оплата прошла успешно')
              end
            else
              ShowMessage('Недостаточно средств для оплаты');
         end;
      end;




end;

procedure TForm4.Button1Click(Sender: TObject);
begin
    //Вызов процедуры Оплаты
   Payment;
end;

procedure TForm4.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  //Не лаем ввести в EditText буквы
  if not (Key in ['0'..'9', #8])then Key:=#0;
end;

procedure TForm4.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    //одновляем данные на From1
    Form1.getQuery;
end;

end.
