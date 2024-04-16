program SisPetro;

uses
  Vcl.Forms,
  View.Principal in 'View\View.Principal.pas' {Principal},
  View.Filtro.Relatorio.Abastecimentos in 'View\Relatorio\View.Filtro.Relatorio.Abastecimentos.pas' {FiltroRelatorioAbastecimentos},
  View.Mensagem.AbastecimentoRealizado in 'View\Mensagem\View.Mensagem.AbastecimentoRealizado.pas' {MensagemAbastecimentoRealizado},
  View.Relatorio.Abastecimentos in 'View\Relatorio\View.Relatorio.Abastecimentos.pas' {FormRelatorioAbastecimentos},
  Data.Dados in 'Data\Data.Dados.pas' {Dados: TDataModule},
  Model.Abastecimento in 'Model\Model.Abastecimento.pas',
  Model.Bomba in 'Model\Model.Bomba.pas',
  Model.Combustivel in 'Model\Model.Combustivel.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDados, Dados);
  Application.CreateForm(TPrincipal, Principal);
  Application.Run;
end.
