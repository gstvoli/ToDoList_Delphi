unit uTarefas;

interface

type
  TTarefas = class
  private
    FTitulo: String;
    FDescricao: String;
    FDataCriacao: TDateTime;
    FIdUsuario: Integer;
    FCodigo: Integer;
    FDataModificacao: TDateTime;
    FCodUsuario: Integer;
  public
    property Codigo: Integer read FCodigo write FCodigo;
    property IdUsuario: Integer read FIdUsuario write FIdUsuario;
    property Titulo: String read FTitulo write FTitulo;
    property Descricao: String read FDescricao write FDescricao;
    property DataCriacao: TDateTime read FDataCriacao write FDataCriacao;
    property DataModificacao: TDateTime read FDataModificacao write FDataModificacao;
    property CodUsuario: Integer read FCodUsuario write FCodUsuario;

end;

implementation

end.
