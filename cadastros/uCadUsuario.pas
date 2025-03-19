unit uCadUsuario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, uUsuario,
  DAO_Usuario;

type
  TfrmCadUsuario = class(TForm)
    pnlPrincipal: TPanel;
    Panel1: TPanel;
    btnSalvar: TButton;
    edtNome: TEdit;
    edtEmail: TEdit;
    edtSenha: TEdit;
    lblNome: TLabel;
    lblEmail: TLabel;
    lblSenha: TLabel;
    procedure btnSalvarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
      FDAO : TDAOUsuario;
      procedure Salvar;
  public
    { Public declarations }

  end;

var
  frmCadUsuario: TfrmCadUsuario;

implementation

{$R *.dfm}

procedure TfrmCadUsuario.btnSalvarClick(Sender: TObject);
begin
  Salvar;
end;

procedure TfrmCadUsuario.FormCreate(Sender: TObject);
begin
  FDAO := TDAOUsuario.Create;
end;

procedure TfrmCadUsuario.FormDestroy(Sender: TObject);
begin
  FDAO.Free;
end;

procedure TfrmCadUsuario.Salvar;
var
  lUsuario : TUsuario;
begin
  lUsuario := TUsuario.Create;
  try
    lUsuario.Nome  := edtNome.Text;
    lUsuario.Email := edtEmail.Text;
    lusuario.Senha := edtSenha.Text;
    FDAO.Inserir(lUsuario);

    edtNome.Clear;
    edtEmail.Clear;
    edtSenha.Clear;
  finally
    lUsuario.Free;
  end;
end;

end.
