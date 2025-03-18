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
  public
    property Codigo: Integer read FCodigo write FCodigo;
    property IdUsuario: Integer read FIdUsuario write FIdUsuario;
    property Titulo: String read FTitulo write FTitulo;
    property Descricao: String read FDescricao write FDescricao;
    property DataCriacao: TDateTime read FDataCriacao write FDataCriacao;

end;

implementation

end.
