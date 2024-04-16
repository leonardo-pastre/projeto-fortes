unit Model.Combustivel;

interface

type
  TCombustivel = class
  private
    FValor: Double;
    FId: Integer;
    FNome: string;
  public
    constructor Create(const ANome: string; const AValor: Double); overload;
    constructor Create(const AId: Integer; const ANome: string; const AValor: Double); overload;
    property Id: Integer read FId;
    property Nome: string read FNome;
    property Valor: Double read FValor;
  end;

implementation

uses
  System.SysUtils;

{ TCombustivel }

constructor TCombustivel.Create(const ANome: string; const AValor: Double);
begin
  Create(-1, ANome, AValor);
end;

constructor TCombustivel.Create(const AId: Integer; const ANome: string;
  const AValor: Double);
begin
  if Trim(ANome) = EmptyStr then
    raise Exception.Create('Nome do combustível não informado');

  if AValor <= 0 then
    raise Exception.Create('Valor do combustível invalido');

  FId := AId;
  FNome := ANome;
  FValor := AValor;
end;

end.
