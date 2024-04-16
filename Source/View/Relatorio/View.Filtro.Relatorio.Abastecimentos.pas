unit View.Filtro.Relatorio.Abastecimentos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls;

type
  TFiltroRelatorioAbastecimentos = class(TForm)
    GroupBox1: TGroupBox;
    edtDataInicial: TDateTimePicker;
    edtDataFinal: TDateTimePicker;
    btnGerarRelatorio: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure btnGerarRelatorioClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FiltroRelatorioAbastecimentos: TFiltroRelatorioAbastecimentos;

implementation

uses
  View.Relatorio.Abastecimentos, Data.Dados, Data.DB;

{$R *.dfm}

procedure TFiltroRelatorioAbastecimentos.btnGerarRelatorioClick(Sender: TObject);
var
  FormRelatorio: TFormRelatorioAbastecimentos;
begin
  if Trunc(edtDataInicial.DateTime) > Trunc(edtDataFinal.DateTime) then
  begin
    ShowMessage('A data inicial não pode ser maior que a data final');
    Abort;
  end;

  if Trunc(edtDataInicial.DateTime) > Trunc(Now) then
  begin
    ShowMessage('A data inicial não pode ser maior que a data atual');
    Abort;
  end;

  FormRelatorio := TFormRelatorioAbastecimentos.Create(Self);
  try
    Dados.FiltrarRelatorioAbastecimentos(edtDataInicial.DateTime, edtDataFinal.DateTime);

    if Dados.qryRelatorioAbastecimentos.IsEmpty then
    begin
      ShowMessage('Sem dados para exibir no relatório');
      Exit;
    end;

    FormRelatorio.RelatorioAbastecimentos.Preview();
  finally
    FreeAndNil(FormRelatorio);
  end;
end;

procedure TFiltroRelatorioAbastecimentos.FormShow(Sender: TObject);
begin
  edtDataInicial.DateTime := Now;
  edtDataFinal.DateTime := Now;
end;

end.
