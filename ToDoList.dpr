program ToDoList;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  uUsuario in 'uUsuario.pas',
  uTarefas in 'uTarefas.pas',
  uCadUsuario in 'uCadUsuario.pas' {frmCadUsuario},
  uCadTarefa in 'uCadTarefa.pas' {frmCadTarefa},
  uUtils in 'uUtils.pas',
  uVar in 'uVar.pas',
  uLogin in 'uLogin.pas' {frmLogin},
  uDM in 'uDM.pas' {DM: TDataModule},
  DAO_Usuario in 'DAO_Usuario.pas',
  DAO_Tarefa in 'DAO_Tarefa.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
