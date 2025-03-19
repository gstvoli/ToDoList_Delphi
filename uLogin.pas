unit uLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, uCadUsuario,
  uUtils, uVar;

type
  TfrmLogin = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label2: TLabel;
    edtSenha: TEdit;
    Label1: TLabel;
    edtEmail: TEdit;
    Panel3: TPanel;
    btnCadastrar: TButton;
    btnEntrar: TButton;
    procedure btnCadastrarClick(Sender: TObject);
    procedure btnEntrarClick(Sender: TObject);
  private
    { Private declarations }
  public
    usuarioValidado : Boolean;
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.dfm}

procedure TfrmLogin.btnCadastrarClick(Sender: TObject);
var
  lCadastroUsuario : TFrmCadUsuario;
begin

  lCadastroUsuario := TfrmCAdUsuario.Create(nil);
  try
    lCadastroUsuario.ShowModal;

  finally
    lCadastroUsuario.Free;
  end;

end;

procedure TfrmLogin.btnEntrarClick(Sender: TObject);
begin

  FUsuarioLogado := ValidaUsuario(edtEmail.Text, edtSenha.Text);
  usuarioValidado := (FUsuarioLogado <> nil);

  if (usuarioValidado = False) then
  begin
    ShowMessage('Usuario e senha inválido.');
    edtEmail.SetFocus;
    Exit;
  end;

  Close;
end;

end.
