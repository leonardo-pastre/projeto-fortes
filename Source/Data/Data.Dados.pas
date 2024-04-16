unit Data.Dados;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Comp.UI, Model.Bomba,
  Model.Combustivel, Model.Abastecimento;

type
  TDados = class(TDataModule)
    FDConnection: TFDConnection;
    FDPhysSQLiteDriverLink: TFDPhysSQLiteDriverLink;
    FDGUIxWaitCursor: TFDGUIxWaitCursor;
    FDQuery: TFDQuery;
    dsRelatorioAbastecimentos: TDataSource;
    qryRelatorioAbastecimentos: TFDQuery;
  private

  public
    function GetBomba(const AId: Integer): TBomba;
    function GetCombustivel(const AId: Integer): TCombustivel;
    function GravarAbastecimento(const AAbastecimento: TAbastecimento): Boolean;
    procedure FiltrarRelatorioAbastecimentos(const ADataInicial, ADataFinal: TDateTime);
  end;

var
  Dados: TDados;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDados }

procedure TDados.FiltrarRelatorioAbastecimentos(const ADataInicial,
  ADataFinal: TDateTime);
begin
  qryRelatorioAbastecimentos.Close;
  qryRelatorioAbastecimentos.SQL.Clear;
  qryRelatorioAbastecimentos.SQL.Add('SELECT');
  qryRelatorioAbastecimentos.SQL.Add('  DATE(A.DATA) AS DATA,');
  qryRelatorioAbastecimentos.SQL.Add('  DATETIME(A.DATA) AS DATA_HORA,');
  qryRelatorioAbastecimentos.SQL.Add('  T.TANQUE_ID,');
  qryRelatorioAbastecimentos.SQL.Add('  T.DESCRICAO AS TANQUE,');
  qryRelatorioAbastecimentos.SQL.Add('  B.DESCRICAO AS BOMBA,');
  qryRelatorioAbastecimentos.SQL.Add('  B.BOMBA_ID,');
  qryRelatorioAbastecimentos.SQL.Add('  A.VALOR_PAGO');
  qryRelatorioAbastecimentos.SQL.Add('FROM');
  qryRelatorioAbastecimentos.SQL.Add('  ABASTECIMENTO A');
  qryRelatorioAbastecimentos.SQL.Add('  INNER JOIN BOMBA B');
  qryRelatorioAbastecimentos.SQL.Add('    ON B.BOMBA_ID = A.BOMBA_ID');
  qryRelatorioAbastecimentos.SQL.Add('  INNER JOIN TANQUE T');
  qryRelatorioAbastecimentos.SQL.Add('    ON T.TANQUE_ID = B.TANQUE_ID');
  qryRelatorioAbastecimentos.SQL.Add('WHERE');
  qryRelatorioAbastecimentos.SQL.Add('  DATE(A.DATA) BETWEEN :DATA_INICIAL AND :DATA_FINAL');
  qryRelatorioAbastecimentos.SQL.Add('GROUP BY');
  qryRelatorioAbastecimentos.SQL.Add('  A.DATA, T.TANQUE_ID, B.BOMBA_ID');
  qryRelatorioAbastecimentos.SQL.Add('ORDER BY');
  qryRelatorioAbastecimentos.SQL.Add('  DATE(A.DATA), T.TANQUE_ID, B.BOMBA_ID');
  qryRelatorioAbastecimentos.Params.ParamByName('DATA_INICIAL').AsDate := ADataInicial;
  qryRelatorioAbastecimentos.Params.ParamByName('DATA_FINAL').AsDate := ADataFinal;
  qryRelatorioAbastecimentos.Open;
end;

function TDados.GetBomba(const AId: Integer): TBomba;
var
  LId: Integer;
  LIdTanque: Integer;
  LDescricao: string;
  LCombustivel: TCombustivel;
begin
  Result := nil;

  FDQuery.Close;
  FDQuery.SQL.Clear;
  FDQuery.SQL.Add('SELECT');
  FDQuery.SQL.Add('  BOMBA_ID,');
  FDQuery.SQL.Add('  TANQUE_ID,');
  FDQuery.SQL.Add('  COMBUSTIVEL_ID,');
  FDQuery.SQL.Add('  DESCRICAO');
  FDQuery.SQL.Add('FROM BOMBA');
  FDQuery.SQL.Add('WHERE BOMBA_ID = :BOMBA_ID');
  FDQuery.Params.ParamByName('BOMBA_ID').AsInteger := AId;
  FDQuery.Open;

  if not FDQuery.IsEmpty then
  begin
    LId := FDQuery.FieldByName('BOMBA_ID').AsInteger;
    LIdTanque := FDQuery.FieldByName('TANQUE_ID').AsInteger;
    LDescricao := FDQuery.FieldByName('DESCRICAO').AsString;
    LCombustivel := GetCombustivel(FDQuery.FieldByName('COMBUSTIVEL_ID').AsInteger);

    Result := TBomba.Create(LId, LIdTanque, LDescricao, LCombustivel);
  end;
end;

function TDados.GetCombustivel(const AId: Integer): TCombustivel;
var
  LId: Integer;
  LNome: string;
  LValor: Double;
begin
  Result := nil;

  FDQuery.Close;
  FDQuery.SQL.Clear;
  FDQuery.SQL.Add('SELECT');
  FDQuery.SQL.Add('  COMBUSTIVEL_ID,');
  FDQuery.SQL.Add('  NOME,');
  FDQuery.SQL.Add('  VALOR');
  FDQuery.SQL.Add('FROM COMBUSTIVEL');
  FDQuery.SQL.Add('WHERE COMBUSTIVEL_ID = :COMBUSTIVEL_ID');
  FDQuery.Params.ParamByName('COMBUSTIVEL_ID').AsInteger := AId;
  FDQuery.Open;

  if not FDQuery.IsEmpty then
  begin
    LId := FDQuery.FieldByName('COMBUSTIVEL_ID').AsInteger;
    LNome := FDQuery.FieldByName('NOME').AsString;
    LValor := FDQuery.FieldByName('VALOR').AsFloat;

    Result := TCombustivel.Create(LId, LNome, LValor);
  end;
end;

function TDados.GravarAbastecimento(const AAbastecimento: TAbastecimento): Boolean;
begin
  FDQuery.Close;
  FDQuery.SQL.Clear;
  FDQuery.SQL.Add('INSERT INTO ABASTECIMENTO (');
  FDQuery.SQL.Add('  BOMBA_ID,');
  FDQuery.SQL.Add('  DATA,');
  FDQuery.SQL.Add('  QUANTIDADE_COMBUSTIVEL,');
  FDQuery.SQL.Add('  VALOR_PAGO,');
  FDQuery.SQL.Add('  PERCENTUAL_IMPOSTO,');
  FDQuery.SQL.Add('  VALOR_IMPOSTO');
  FDQuery.SQL.Add(') VALUES (');
  FDQuery.SQL.Add('  :BOMBA_ID,');
  FDQuery.SQL.Add('  :DATA,');
  FDQuery.SQL.Add('  :QUANTIDADE_COMBUSTIVEL,');
  FDQuery.SQL.Add('  :VALOR_PAGO,');
  FDQuery.SQL.Add('  :PERCENTUAL_IMPOSTO,');
  FDQuery.SQL.Add('  :VALOR_IMPOSTO');
  FDQuery.SQL.Add(')');
  FDQuery.Params.ParamByName('BOMBA_ID').AsInteger := AAbastecimento.IdBomba;
  FDQuery.Params.ParamByName('DATA').AsDateTime := AAbastecimento.Data;
  FDQuery.Params.ParamByName('QUANTIDADE_COMBUSTIVEL').AsFloat := AAbastecimento.QuantidadeCombustivel;
  FDQuery.Params.ParamByName('VALOR_PAGO').AsFloat := AAbastecimento.ValorAbastecido;
  FDQuery.Params.ParamByName('PERCENTUAL_IMPOSTO').AsFloat := AAbastecimento.PercentualImposto;
  FDQuery.Params.ParamByName('VALOR_IMPOSTO').AsFloat := AAbastecimento.ValorImposto;
  FDQuery.ExecSQL;
  Result := FDQuery.RowsAffected > 0;
end;

end.
