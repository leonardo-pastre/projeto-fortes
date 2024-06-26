unit Test.Model.Abastecimento;

interface
uses
  DUnitX.TestFramework,
  Model.Abastecimento,
  System.SysUtils;

type
  [TestFixture]
  TTestModelAbastecimento = class(TObject)
  private
    FAbastecimento: TAbastecimento;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;
    [Test]
    procedure ValidarCalculoImposto;
    [Test]
    procedure ValidarCalculoDaQuantidadeDeCombustivel;
  end;

implementation

procedure TTestModelAbastecimento.Setup;
var
  LDados: TDadosAbastecimento;
begin
  LDados.Data := Now;
  LDados.IdBomba := 1;
  LDados.ValorAbastecido := 50;
  LDados.ValorCombustivel := 4;
  LDados.PercentualImposto := 3;

  FAbastecimento := TAbastecimento.Create(LDados);
end;

procedure TTestModelAbastecimento.TearDown;
begin
  FreeAndNil(FAbastecimento);
end;

procedure TTestModelAbastecimento.ValidarCalculoDaQuantidadeDeCombustivel;
begin
  Assert.AreEqual<Double>(FAbastecimento.QuantidadeCombustivel, 12.5,
    'Erro no c�lculo da quantidade de combust�vel');
end;

procedure TTestModelAbastecimento.ValidarCalculoImposto;
begin
  FAbastecimento.CalcularImposto;
  Assert.AreEqual<Double>(FAbastecimento.ValorImposto, 1.5,
    'Erro no c�lculo de imposto');
end;

initialization
  TDUnitX.RegisterTestFixture(TTestModelAbastecimento);
end.
