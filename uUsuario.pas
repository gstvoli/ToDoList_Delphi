unit uUsuario;

interface

type
  TUsuario = class
    private
    FEmail: String;
    FNome: String;
    FSenha: String;
    FId: Integer;
    FTarefas: TObjectList<TTarefas>;
    public
      property Id: Integer read FId write FId;
      property Nome: String read FNome write FNome;
      property Email: String read FEmail write FEmail;
      property Senha: String read FSenha write FSenha;
      property Tarefas: TObjectList<TTarefas> read FTarefas write FTarefas;
  end;

implementation

end.
