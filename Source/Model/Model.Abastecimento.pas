unit Model.Abastecimento;

interface

type
  TDadosAbastecimento = record
    Data: TDateTime;
    IdBomba: Integer;
    ValorCombustivel: Double;
    ValorAbastecido: Double;
    PercentualImposto: Double;
  end;

  TAbastecimento = class
  private
    FValorImposto: Double;
    FIdBomba: Integer;
    FQuantidadeCombustivel: Double;
    FValorAbastecido: Double;
    FData: TDateTime;
    FPercentualImposto: Double;
  public
    constructor Create(ADados: TDadosAbastecimento);
    procedure CalcularImposto;
    property Data: TDateTime read FData;
    property IdBomba: Integer read FIdBomba;
    property QuantidadeCombustivel: Double read FQuantidadeCombustivel;
    property ValorAbastecido: Double read FValorAbastecido;
    property PercentualImposto: Double read FPercentualImposto;
    property ValorImposto: Double read FValorImposto;
  end;

implementation

uses
  System.SysUtils;

{ TAbastecimento }

procedure TAbastecimento.CalcularImposto;
begin
  FValorImposto := FPercentualImposto / 100 * FValorAbastecido;
end;

constructor TAbastecimento.Create(ADados: TDadosAbastecimento);
begin
  if ADados.IdBomba <= 0 then
    raise Exception.Create('Identificador da bomba inválido no abastecimento');

  if ADados.ValorAbastecido <= 0 then
    raise Exception.Create('Valor abastecido inválido');

  if ADados.ValorCombustivel <= 0 then
    raise Exception.Create('Valor do combustível inválido');

  FData := ADados.Data;
  FIdBomba := ADados.IdBomba;
  FQuantidadeCombustivel := ADados.ValorAbastecido / ADados.ValorCombustivel;
  FValorAbastecido := ADados.ValorAbastecido;
  FPercentualImposto := ADados.PercentualImposto;
  FValorImposto := 0;
end;

end.
