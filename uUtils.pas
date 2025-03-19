unit uUtils;

interface

uses
  Vcl.Forms, System.SysUtils, System.Classes, Math,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, uDM,
  Vcl.Controls, Vcl.Dialogs, DAO_Usuario, uUsuario;

  procedure abrirMenu(form: TForm; formClass: TFormClass); overload;
  procedure PassarParametro(DataSet: TFDQuery; Valores: array of variant; AbrirCDS: Boolean = True);
  procedure controleErroFireDac(e: EFDDBEngineException);
  function ifElse(condicao : boolean; retorno1, retorno2: Variant) : Variant; overload;
  function Erro(Mensagem: String): TModalResult;
  function ValidaUsuario(lEmail, lSenha: string) : TUsuario;

implementation

procedure abrirMenu(form: TForm; formClass: TFormClass);
begin
  TThread.CreateAnonymousThread(
    procedure
    begin
      TThread.Synchronize(
        nil,
        procedure
        begin
          if Assigned(form) then
          FreeAndNil(form);

          Application.CreateForm(formClass, form);

          form.Show;
        end

      );
    end
   ).Start;
end;

procedure PassarParametro(DataSet: TFDQuery; Valores: array of variant; AbrirCDS: Boolean = True);
var
  i : integer;
begin
  try

    try
      if not DM.FDConexao.Connected then
        DM.FDConexao.Open;

      if DataSet.Active then
        DataSet.Close;

        DataSet.Filtered := False;
        DataSet.Filter   := '';
        DataSet.DisableControls;

      for i := 0 to Pred(Length(Valores))do
        DataSet.Params[i].Value := Valores[i];

      if AbrirCDS then
      begin
        DataSet.Prepare;
        DataSet.Open;
      end;

    except
      on e: EFDDBEngineException do
        controleErroFireDac(e);
      on e: Exception do
        Erro(e.Message);
    end;

  finally
    DataSet.EnableControls;
  end;
end;

procedure controleErroFireDac(e: EFDDBEngineException);
var
  i:Integer;
begin
  for I := 0 to e.ErrorCount do
  begin
    if e.Errors[i].Kind = ekUKViolated then
      Erro('Erro ao gravar os dados: Registro duplicado.'+ e.Errors[i].Message)
    else
      Erro('Erro ao gravar os dados: Erro não catalogado.'+ e.Errors[i].Message);
  end;
end;

function Erro(Mensagem: String): TModalResult;
begin
  ShowMessage(Mensagem);
  result := MrOk;
  Abort;
end;

function ValidaUsuario(lEmail, lSenha: string) : TUsuario;
var
  FDAOUsuario : TDAOUsuario;
  FUsuario : TUsuario;
begin
  FDAOUsuario := TDAOUsuario.Create;
  FUsuario := FDAOUsuario.Login(lEmail, lSenha);

  if not(FUsuario.Id.ToString.IsEmpty) then
    Result := FUsuario;

//  Result := ifElse(not(FUsuario.Id.ToString.IsEmpty), True, False);
end;

function ifElse(condicao : boolean; retorno1, retorno2: Variant) : Variant;
begin
  if condicao then
    Result := retorno1
  else
    Result := retorno2;

end;

end.
