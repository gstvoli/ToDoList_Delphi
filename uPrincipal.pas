unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, uLogin,
  uUsuario, Vcl.ComCtrls, uCadTarefa, System.Generics.Collections, uTarefas,
  uUtils, DAO_Usuario, uVar;

type
  TfrmPrincipal = class(TForm)
    pnlPrincipal: TPanel;
    pnlInferior: TPanel;
    pnlTitulo: TPanel;
    lblTitulo: TLabel;
    Panel1: TPanel;
    edtTarefa: TEdit;
    btnPesquisa: TButton;
    lvTarefas: TListView;
    Panel2: TPanel;
    Panel3: TPanel;
    btnNovo: TButton;
    btnEditar: TButton;
    btnCancelar: TButton;
    stbDados: TStatusBar;
    Timer1s: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure Timer1sTimer(Sender: TObject);
  private
//    FDAOUsuario : TDAOUsuario;
//    FUsuario : TUsuario;
//    function ValidaUsuario(lEmail, lSenha: string) : Boolean;
    procedure PreencherListView(lTarefas : TObjectList<TTarefas>);
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.btnCancelarClick(Sender: TObject);
begin
  Close;  
end;

procedure TfrmPrincipal.btnNovoClick(Sender: TObject);
var
  lCadastroTarefa: TfrmCadTarefa;
  lTarefas : TObjectList<TTarefas>;
begin
  lTarefas := TObjectList<TTarefas>.Create;
  lCadastroTarefa := TfrmCadTarefa.Create(Self, lTarefas);

  try
    lCadastroTarefa.ShowModal;
    PreencherListView(lTarefas);
  finally
    FreeAndNil(lTarefas);
    FreeAndNil(lCadastroTarefa);
  end;

end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
var
  lLogin : TFrmLogin;
begin
  lLogin := TfrmLogin.Create(nil);
  try
    lLogin.ShowModal;

    if (lLogin.usuarioValidado = False) then
      Application.Terminate
    else
    begin

      stbDados.Panels[0].Text := 'Usuário Logado: ' + Copy(FUsuarioLogado.Nome, Pos(' ',FUsuarioLogado.Nome));
      stbDados.Panels[1].Text := DateToStr(now);
    end;
  finally
    lLogin.Free;
  end;
end;

procedure TfrmPrincipal.PreencherListView(lTarefas: TObjectList<TTarefas>);
var
  lItem: TListItem;
  lTarefa: TTarefas;
begin
  if not Assigned(lTarefas) then 
    Exit;

  lvTarefas.Clear;
  for lTarefa in lTarefas do
  begin
    lItem := lvTarefas.Items.Add;
    lItem.Caption := lTarefa.Codigo.ToString;
    lItem.SubItems.Add(lTarefa.Titulo);
    lItem.SubItems.Add(FormatDateTime('dd/mm/yyyy hh:mm', lTarefa.DataCriacao));
    lItem.Data := lTarefa;
  end;
end;

procedure TfrmPrincipal.Timer1sTimer(Sender: TObject);
begin
  stbDados.Panels[2].Text := TimeToStr(Now);
end;

//function TfrmPrincipal.ValidaUsuario(lEmail, lSenha: string): Boolean;
//begin
//  FDAOUsuario := TDAOUsuario.Create;
//  FUsuario := FDAOUsuario.Login(lEmail, lSenha);
//
//  Result := not FUsuario.Id.ToString.IsEmpty;
//
//end;

end.
