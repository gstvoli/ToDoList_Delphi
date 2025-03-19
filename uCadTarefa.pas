unit uCadTarefa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, System.Generics.Collections,
  uTarefas;

type
  TfrmCadTarefa = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnSalvar: TButton;
    mmDescTarefa: TMemo;
    lblDesc: TLabel;
    lblTitulo: TLabel;
    edtTitulo: TEdit;
    procedure btnSalvarClick(Sender: TObject);
    { Private declarations }
  public
    { Public declarations }
    FTarefas: TObjectList<TTarefas>;
    constructor Create(AOwner: TComponent; lTarefa: TObjectList<TTarefas>);
  end;

var
  frmCadTarefa: TfrmCadTarefa;

implementation

{$R *.dfm}

procedure TfrmCadTarefa.btnSalvarClick(Sender: TObject);
var
  lTarefa: TTarefas;
begin
  lTarefa := TTarefas.Create;
  lTarefa.Codigo := FTarefas.Count + 1;
  lTarefa.IdUsuario := 1;
  lTarefa.Titulo := edtTitulo.Text;
  lTarefa.Descricao := mmDescTarefa.Text;
  lTarefa.DataCriacao := Now;
  FTarefas.Add(lTarefa);
  edtTitulo.Clear;
  mmDescTarefa.Clear;
end;

constructor TfrmCadTarefa.Create(AOwner: TComponent;
  lTarefa: TObjectList<TTarefas>);
begin
  inherited Create(AOwner);
  FTarefas := lTarefa;
end;

end.
