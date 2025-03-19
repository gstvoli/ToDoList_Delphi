object frmCadUsuario: TfrmCadUsuario
  Left = 0
  Top = 0
  Caption = 'Cadastro Usu'#225'rio'
  ClientHeight = 199
  ClientWidth = 330
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object pnlPrincipal: TPanel
    Left = 0
    Top = 0
    Width = 330
    Height = 199
    Align = alClient
    TabOrder = 0
    object lblNome: TLabel
      Left = 13
      Top = 9
      Width = 27
      Height = 13
      Caption = 'Nome'
    end
    object lblEmail: TLabel
      Left = 13
      Top = 53
      Width = 24
      Height = 13
      Caption = 'Email'
    end
    object lblSenha: TLabel
      Left = 13
      Top = 98
      Width = 30
      Height = 13
      Caption = 'Senha'
    end
    object Panel1: TPanel
      Left = 1
      Top = 147
      Width = 328
      Height = 51
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 0
      object btnSalvar: TButton
        Left = 12
        Top = -1
        Width = 75
        Height = 44
        Caption = 'Salvar'
        TabOrder = 0
        OnClick = btnSalvarClick
      end
    end
    object edtNome: TEdit
      Left = 13
      Top = 26
      Width = 305
      Height = 21
      TabOrder = 1
    end
    object edtEmail: TEdit
      Left = 13
      Top = 71
      Width = 305
      Height = 21
      TabOrder = 2
    end
    object edtSenha: TEdit
      Left = 13
      Top = 113
      Width = 305
      Height = 21
      PasswordChar = '*'
      TabOrder = 3
    end
  end
end
