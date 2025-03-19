object frmCadTarefa: TfrmCadTarefa
  Left = 0
  Top = 0
  Caption = 'Cadastrar Tarefa'
  ClientHeight = 291
  ClientWidth = 375
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 375
    Height = 291
    Align = alClient
    TabOrder = 0
    object lblDesc: TLabel
      Left = 15
      Top = 65
      Width = 55
      Height = 16
      Caption = 'Descri'#231#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblTitulo: TLabel
      Left = 15
      Top = 18
      Width = 32
      Height = 16
      Caption = 'T'#237'tulo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Panel2: TPanel
      Left = 1
      Top = 240
      Width = 373
      Height = 50
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 0
      object btnSalvar: TButton
        Left = 14
        Top = 0
        Width = 75
        Height = 43
        Caption = 'Salvar'
        TabOrder = 0
        OnClick = btnSalvarClick
      end
    end
    object mmDescTarefa: TMemo
      Left = 15
      Top = 81
      Width = 345
      Height = 153
      TabOrder = 1
    end
    object edtTitulo: TEdit
      Left = 15
      Top = 38
      Width = 345
      Height = 21
      TabOrder = 2
    end
  end
end
