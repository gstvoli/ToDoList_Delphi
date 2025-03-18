unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    pnlPrincipal: TPanel;
    pnlBotoes: TPanel;
    pnlTitulo: TPanel;
    lblTitulo: TLabel;
    btnNovo: TButton;
    btnEditar: TButton;
    btnCancelar: TButton;
    Panel1: TPanel;
    Edit1: TEdit;
    lbTarefas: TListBox;
    btnPesquisa: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

end.
