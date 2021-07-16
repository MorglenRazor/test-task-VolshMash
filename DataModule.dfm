object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 388
  Width = 497
  object FDPhysPgDriverLink1: TFDPhysPgDriverLink
    VendorLib = 'E:\Programming\delphi_project\libpq.dll'
    Left = 48
    Top = 32
  end
  object PgConnection1: TFDConnection
    Params.Strings = (
      'ConnectionDef=PostgreSQL_Connect')
    LoginPrompt = False
    Left = 136
    Top = 32
  end
  object FDQuery1: TFDQuery
    Connection = PgConnection1
    Left = 208
    Top = 48
  end
end
