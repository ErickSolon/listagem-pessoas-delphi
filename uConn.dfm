object DataModule1: TDataModule1
  Height = 480
  Width = 640
  object EstudodelphiConnection: TFDConnection
    Params.Strings = (
      'ConnectionDef=EstudoDelphi')
    Connected = True
    LoginPrompt = False
    Left = 54
    Top = 19
  end
  object PessoasTable: TFDQuery
    Active = True
    Connection = EstudodelphiConnection
    SQL.Strings = (
      'SELECT * FROM pessoas')
    Left = 169
    Top = 16
  end
  object DataSource1: TDataSource
    DataSet = PessoasTable
    Left = 248
    Top = 16
  end
  object FDQuery1: TFDQuery
    Connection = EstudodelphiConnection
    SQL.Strings = (
      'CREATE TABLE Pessoas('
      '      id int,'
      '      nome varchar(50),'
      '      sobrenome varchar(50),'
      '      foto blob'
      ');')
    Left = 328
    Top = 16
  end
end
