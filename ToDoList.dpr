program ToDoList;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  uLogin in 'uLogin.pas' {frmLogin},
  uCadTarefa in 'cadastros\uCadTarefa.pas' {frmCadTarefa},
  uCadUsuario in 'cadastros\uCadUsuario.pas' {frmCadUsuario},
  uDM in 'data-module\uDM.pas' {DM: TDataModule},
  uUtils in 'utils\uUtils.pas',
  uVar in 'utils\uVar.pas',
  DAO_Tarefa in 'DAO\DAO_Tarefa.pas',
  DAO_Usuario in 'DAO\DAO_Usuario.pas',
  uTarefas in 'models\uTarefas.pas',
  uUsuario in 'models\uUsuario.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmCadTarefa, frmCadTarefa);
  Application.CreateForm(TfrmCadUsuario, frmCadUsuario);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
