unit DataModule;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Phys.PGDef, FireDAC.Stan.Intf,
  FireDAC.Phys, FireDAC.Phys.PG, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet;

type
  TDataModule1 = class(TDataModule)
    FDPhysPgDriverLink1: TFDPhysPgDriverLink;
    PgConnection1: TFDConnection;
    FDQuery1: TFDQuery;
    procedure ConnectionDataBase;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDataModule1.ConnectionDataBase;
var
  PgConnection1: TFDConnection;
begin
  PgConnection1 := TFDConnection.Create(nil);
  try
    // adds connection parameters;
    PgConnection1.ConnectionDefName := 'PostgreSQL_Connect';
    PgConnection1.Connected := true;
    PgConnection1.Open;
  finally
    PgConnection1.Free;
  end;
end;


end.
