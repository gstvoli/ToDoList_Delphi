unit DAO_Tarefa;

interface

uses uDM, uTarefas, System.SysUtils, Vcl.Dialogs;

type
  TDAOTarefa = class
    private
      FConn: TDM;
      function PreencheObjeto: TTarefas;
    public
    constructor Create;
    destructor Destroy; override;
    procedure Inserir(Value: TTarefas);
    procedure Apagar(Value : TTarefas);
    function Alterar(Value: TTarefas): TTarefas;
    function Pesquisar(codTarefa, codUsuario: integer): TTarefas;
  end;
implementation

{ TDAOUsuario }

function TDAOTarefa.Alterar(Value: TTarefas): TTarefas;
begin

  FConn.StartTransaction;
  try
    FConn.SQL('update gstv_tareafas set titulo = :titulo, descricao = :descricao');
    FConn.Params('titulo', Value.Titulo);
    FConn.Params('descricao', Value.Descricao);
    FConn.ExecSQL;
    FConn.Commit;
    ShowMessage('Tarefa atualizada.');
  except
    FConn.Rollback;
    raise Exception.Create('Erro ao atualizar tarefa.');
  end;

end;

procedure TDAOTarefa.Apagar(Value: TTarefas);
begin

  FConn.StartTransaction;
  try
    FConn.SQL('delete from gstv_tarefas where codigo = :codigo');
    FConn.Params('codigo', Value.Codigo);
    FConn.ExecSQL;
    FConn.Commit;
    ShowMessage('Tarefa apagada.');
  except
    FConn.Rollback;
    raise Exception.Create('Erro ao apagar tarefa.');
  end;

end;

constructor TDAOTarefa.Create;
begin
  FConn.Create(nil);
end;

destructor TDAOTarefa.Destroy;
begin
  FConn.Free;
  inherited;
end;

procedure TDAOTarefa.Inserir(Value: TTarefas);
begin

  FConn.StartTransaction;
  try
    FConn.SQL('insert into gstv_tarefas (codigo, titulo, descricao, datacriacao) values ' +
              '(:codigo, :titulo, :descricao, :dataCriacao, :codUsuario)');
    FConn.Params('codigo', Value.Codigo);
    FConn.Params('titulo', Value.Titulo);
    FConn.Params('descricao', Value.Descricao);
    FConn.Params('dataCriacao', Value.DataCriacao);
    FConn.Params('codUsuario', Value.CodUsuario);
    FConn.ExecSQL;
    FConn.Commit;
    ShowMessage('Tarefa cadastrada.');
  except
    FConn.Rollback;
    raise Exception.Create('Erro ao inserir tarefa.');
  end;

end;

function TDAOTarefa.Pesquisar(codTarefa, codUsuario: integer): TTarefas;
begin
  FConn.SQL('select id, codigo, titulo, descricao, dataCriacao, codUsuario' +
            'from gstv_tarefas ' +
            'where codigo = :codigo and codUsuario = :codUsuario');
  FConn.Params('codigo', codTarefa);
  FConn.Params('codUsuario', codUsuario);
  FConn.Open;

  if FConn.DataSet.IsEmpty then
    Exit;

  Result := PreencheObjeto;
end;

function TDAOTarefa.PreencheObjeto: TTarefas;
begin
  Result := TTarefas.Create;

  Result.Codigo      := FConn.DataSet.FieldByName('Codigo').AsInteger;
  Result.Titulo      := FConn.DataSet.FieldByName('Titulo').AsString;
  Result.Descricao   := FConn.DataSet.FieldByName('Descricao').AsString;
  Result.DataCriacao := FConn.DataSet.FieldByName('DataCriacao').AsDateTime;
  Result.CodUsuario  := FConn.DataSet.FieldByName('codUsuario').AsInteger;
end;

end.
