object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 333
  ClientWidth = 405
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object pnlPrincipal: TPanel
    Left = 0
    Top = 41
    Width = 405
    Height = 239
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitLeft = 32
    ExplicitTop = 96
    ExplicitWidth = 365
    ExplicitHeight = 145
    object Panel1: TPanel
      Left = 0
      Top = 0
      Width = 405
      Height = 27
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      ExplicitTop = -1
      object Edit1: TEdit
        Left = 4
        Top = 2
        Width = 316
        Height = 25
        TabOrder = 0
        Text = 'Edit1'
      end
      object btnPesquisa: TButton
        Left = 322
        Top = 2
        Width = 75
        Height = 25
        Caption = 'Pesquisar'
        TabOrder = 1
      end
    end
    object lbTarefas: TListBox
      Left = 0
      Top = 27
      Width = 405
      Height = 212
      Align = alClient
      ItemHeight = 13
      TabOrder = 1
      ExplicitTop = 32
      ExplicitHeight = 207
    end
  end
  object pnlBotoes: TPanel
    Left = 0
    Top = 280
    Width = 405
    Height = 53
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitTop = 248
    ExplicitWidth = 380
    object btnNovo: TButton
      Left = 8
      Top = 6
      Width = 75
      Height = 43
      Caption = 'Novo'
      TabOrder = 0
    end
    object btnEditar: TButton
      Left = 89
      Top = 6
      Width = 75
      Height = 43
      Caption = 'Editar'
      TabOrder = 1
    end
    object btnCancelar: TButton
      Left = 322
      Top = 6
      Width = 75
      Height = 43
      Caption = 'Cancelar'
      TabOrder = 2
    end
  end
  object pnlTitulo: TPanel
    Left = 0
    Top = 0
    Width = 405
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    ExplicitWidth = 380
    object lblTitulo: TLabel
      Left = 142
      Top = 14
      Width = 104
      Height = 16
      Caption = 'Lista de Tarefas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
end
