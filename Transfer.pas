unit Transfer;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Phys.PGDef, FireDAC.UI.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.PG, FireDAC.VCLUI.Wait, DataModule;

type
  TForm2 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    MaskEdit1: TMaskEdit;
    Edit1: TEdit;
    Label3: TLabel;
    MaskEdit2: TMaskEdit;
    Label4: TLabel;
    Label5: TLabel;
    procedure transfer;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
  private
  public
  end;

var
  Form2: TForm2;
  MaskEdit1: TMaskEdit;
  MaskEdit2: TMaskEdit;

implementation
uses Bank_accounts;
{$R *.dfm}



procedure TForm2.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', #8])then Key:=#0;
end;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  // Обновляем данные на From1
  Form1.getQuery;
end;
// Процедура перевода
procedure TForm2.transfer;
var
   transfer_from, transfer_in: real;
   numAccountFrom, numAccountIn, transfer_from_str, transfer_in_str: string;
   moneyFrom, moneyIn, sum_transfer: string;

begin
    numAccountFrom := MaskEdit2.Text;
    numAccountIn := MaskEdit1.Text;
    sum_transfer := Edit1.Text;
    if (sum_transfer = '') then
        ShowMessage('Не введена сумма оплаты')
    else
      begin
          //Делаем два запросы к базе на получение состояния счета
         DataModule1.FDQuery1.Open(Format('select state_account from bank_accounts where uuid_key = ''%s''',[numAccountFrom]));

         moneyFrom := DataModule1.FDQuery1.Table.Rows[0].GetData(0);

         DataModule1.FDQuery1.Open(Format('select state_account from bank_accounts where uuid_key = ''%s''',[numAccountIn]));

         moneyIn := DataModule1.FDQuery1.Table.Rows[0].GetData(0);
         //Проводи поерацию над денежными средствами
         // Проверяем что средств на счету достаточно для перевода
         if StrToFloat(sum_transfer) <= StrToFloat(moneyFrom) then
          begin
              // с одного счета снимаем средства
              transfer_from := StrToFloat(moneyFrom) - StrToFloat(sum_transfer);
              // другой пополняем
              transfer_in := StrToFloat(moneyIn) + StrToFloat(sum_transfer);

              transfer_from_str := FloatToStr(transfer_from);
              transfer_in_str := FloatToStr(transfer_in);
              // Загружаем одновленые данные в базу
              DataModule1.FDQuery1.ExecSQL(Format('update bank_accounts SET state_account=''%s'' where uuid_key = ''%s''',[transfer_from_str, numAccountFrom]));
              DataModule1.FDQuery1.ExecSQL(Format('update bank_accounts SET state_account=''%s'' where uuid_key = ''%s''',[transfer_in_str, numAccountIn]));
              ShowMessage('Перевод прошел');
          end
         else
             ShowMessage('На счету недостаточно средств')
      end;



end;

procedure TForm2.Button1Click(Sender: TObject);
begin
  //Вызов процедуры перевода
 transfer;
end;

end.
