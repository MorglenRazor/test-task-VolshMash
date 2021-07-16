program Project1;

uses
  Vcl.Forms,
  Bank_accounts in 'Bank_accounts.pas' {Form1},
  Transfer in 'Transfer.pas' {Form2},
  DataModule in 'DataModule.pas' {DataModule1: TDataModule},
  Refill in 'Refill.pas' {Form3},
  Payment in 'Payment.pas' {Form4};

{$R *.res}

begin

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm4, Form4);
  Application.Run;
end.
