unit Bank_accounts;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.PG,
  FireDAC.Phys.PGDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.DBCtrls, DataModule;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure getQuery;
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private

  public
  end;

var
  Form1: TForm1;
  Label1: TLabel;
  Label3: TLabel;
  Label2: TLabel;
  Label4: TLabel;

implementation
{$R *.dfm}

uses Transfer, Refill, Payment;

// Процедура получения данных
procedure TForm1.getQuery;
var
  money_1, money_2: string;
begin
    //Соединеение с БД
    DataModule1.ConnectionDataBase;
    //Запрос на получения данных id, state_account, currency
    DataModule1.FDQuery1.Open('select id, state_account, currency from bank_accounts order by id ASC');
    // Читае данные из таблицы
    money_1 := DataModule1.FDQuery1.Table.Rows[0].GetData(1);
    money_2 := DataModule1.FDQuery1.Table.Rows[1].GetData(1);

    Label1.Caption := money_1 + ' ' + DataModule1.FDQuery1.FieldByName('currency').AsString;

    Label3.Caption := 'На счету ' +IntToStr(DataModule1.FDQuery1.Table.Rows[0].GetData(0)) + ' :';

    Label2.Caption := 'На счету ' + IntToStr(DataModule1.FDQuery1.Table.Rows[1].GetData(0)) + ' :';

    Label4.Caption := money_2 + ' ' + DataModule1.FDQuery1.FieldByName('currency').AsString;
end;


procedure TForm1.Button1Click(Sender: TObject);
begin
  //Показ Form3
  Form3.Show;
end;


procedure TForm1.Button2Click(Sender: TObject);
begin
  //Показ Form2
  Form2.Show;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  //Показ Form4
  Form4.Show;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  //Вызов процедуры получения данных
  getQuery;
end;

end.

