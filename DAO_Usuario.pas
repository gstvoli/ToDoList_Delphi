unit DAO_Usuario;

interface

uses uUsuario, uDM, System.SysUtils, Vcl.Dialogs;
  type
    TDAOUsuario = class
      private
        FConn: TDM;
        function PreencheObjeto: TUsuario;
      public
      constructor Create;
      destructor Destroy; override;
      procedure Inserir(Value: TUsuario);
      procedure Apagar(Value : TUsuario);
      function Alterar(Value: TUsuario): TUsuario;
      function Login(lEmail, lSenha: string): TUsuario;
    end;
implementation

{ TDAOUsuario }

function TDAOUsuario.Alterar(Value: TUsuario): TUsuario;
begin
  FConn.StartTransaction;
  try
    FConn.SQL('update gstv_usuario SET nome = :nome, email = :email, senha = :senha WHERE id = :id');
    FConn.Params('nome', Value.Nome);
    FConn.Params('email', Value.Email);    
    FConn.Params('senha', Value.Senha);
    FConn.Params('id', Value.Id);
    FConn.ExecSQL;
    FConn.Commit;
    ShowMessage('Usuário atualizado.');
  except
    FConn.Rollback;
    raise Exception.Create('Erro ao tentar alterar o usuário.');
  end;
end;

procedure TDAOUsuario.Apagar(Value: TUsuario);
begin
  FConn.StartTransaction;
  try
    FConn.SQL('delete from gstv_usuario where id = :id');
    FConn.Params('id', Value.id);
    FConn.ExecSQL;
    FConn.Commit;
    ShowMessage('Usuário apagado.');
    
  except
    FConn.Rollback;
    raise Exception.Create('Erro ao tentar apagar o usuário.');
  end;
end;

constructor TDAOUsuario.Create;
begin
  FConn := TDM.Create(nil);
end;

destructor TDAOUsuario.Destroy;
begin
  FConn.Free;
  inherited;
end;

procedure TDAOUsuario.Inserir(Value: TUsuario);
begin
  FConn.StartTransaction;
  try
    FConn.SQL('insert into gstv_usuario (nome, email, senha) values (:nome, :email, :senha)');
    FConn.Params('nome', Value.Nome);
    FConn.Params('email', Value.Email);
    FConn.Params('senha', Value.Senha);
    showmessage(FConn.FDQuery1.SQL.Text);
    FConn.ExecSQL;
    FConn.Commit;
    ShowMessage('Usuário cadastrado.');
  except
    FConn.Rollback;
    raise Exception.Create('Erro ao tentar cadastrar o usuário.');
  end;
end;

function TDAOUsuario.Login(lEmail, lSenha: string): TUsuario;
begin
  FConn.SQL('select * from gstv_usuario where email = :email and senha = :senha');
  FConn.Params('email', lEmail);
  FConn.Params('senha', lSenha);
  FConn.Open;

  if FConn.DataSet.IsEmpty then
    Exit;

  Result := PreencheObjeto;
end;

function TDAOUsuario.PreencheObjeto: TUsuario;
begin
  Result := TUsuario.Create;

  Result.Id      := FConn.DataSet.FieldByName('id_usuario').AsInteger;
  Result.Nome    := FConn.DataSet.FieldByName('Nome').AsString;
  Result.Email   := FConn.DataSet.FieldByName('Email').AsString;
  Result.Senha   := FConn.DataSet.FieldByName('Senha').AsString;

end;

end.

