object Dados: TDados
  OldCreateOrder = False
  Height = 395
  Width = 538
  object FDConnection: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\DELL\Desktop\SisPetro\Source\Win32\Debug\sispe' +
        'tro.db'
      'DriverID=SQLite')
    LoginPrompt = False
    Left = 66
    Top = 24
  end
  object FDPhysSQLiteDriverLink: TFDPhysSQLiteDriverLink
    Left = 66
    Top = 80
  end
  object FDGUIxWaitCursor: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 66
    Top = 136
  end
  object FDQuery: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      '')
    Left = 66
    Top = 192
  end
  object dsRelatorioAbastecimentos: TDataSource
    DataSet = qryRelatorioAbastecimentos
    Left = 360
    Top = 120
  end
  object qryRelatorioAbastecimentos: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      'SELECT'
      #9'DATE(A.DATA) AS DATA,'
      #9'DATETIME(A.DATA) AS DATA_HORA,'
      #9'T.TANQUE_ID,'
      #9'T.DESCRICAO AS TANQUE,'
      #9'B.DESCRICAO AS BOMBA,'
      #9'B.BOMBA_ID,'
      #9'A.VALOR_PAGO'
      'FROM'
      #9'ABASTECIMENTO A'
      #9'INNER JOIN BOMBA B'
      #9#9'ON B.BOMBA_ID = A.BOMBA_ID'
      #9'INNER JOIN TANQUE T'
      #9#9'ON T.TANQUE_ID = B.TANQUE_ID'
      'GROUP BY'
      #9'A.DATA, T.TANQUE_ID, B.BOMBA_ID'
      'ORDER BY'
      #9'A.DATA, T.TANQUE_ID, B.BOMBA_ID')
    Left = 360
    Top = 56
  end
end
