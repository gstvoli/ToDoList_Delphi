object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Lista de Tarefas'
  ClientHeight = 357
  ClientWidth = 405
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlPrincipal: TPanel
    Left = 0
    Top = 41
    Width = 405
    Height = 247
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitHeight = 239
    object Panel1: TPanel
      Left = 0
      Top = 0
      Width = 405
      Height = 27
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object edtTarefa: TEdit
        Left = 4
        Top = 2
        Width = 316
        Height = 21
        TabOrder = 0
      end
      object btnPesquisa: TButton
        Left = 326
        Top = 0
        Width = 75
        Height = 25
        Caption = 'Pesquisar'
        TabOrder = 1
      end
    end
    object lvTarefas: TListView
      Left = 0
      Top = 27
      Width = 405
      Height = 220
      Align = alClient
      Columns = <
        item
          Caption = 'ID'
        end
        item
          Caption = 'T'#237'tulo'
          Width = 250
        end
        item
          Caption = 'Data/Hora'
          Width = 115
        end>
      TabOrder = 1
      ViewStyle = vsReport
      ExplicitHeight = 212
    end
  end
  object pnlInferior: TPanel
    Left = 0
    Top = 288
    Width = 405
    Height = 69
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object Panel2: TPanel
      Left = 0
      Top = 48
      Width = 405
      Height = 21
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 0
      object stbDados: TStatusBar
        Left = 0
        Top = 0
        Width = 405
        Height = 21
        Align = alClient
        Panels = <
          item
            Width = 160
          end
          item
            Width = 80
          end
          item
            Width = 100
          end>
        ExplicitLeft = 80
        ExplicitTop = 16
        ExplicitWidth = 0
        ExplicitHeight = 19
      end
    end
    object Panel3: TPanel
      Left = 0
      Top = 0
      Width = 405
      Height = 48
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      ExplicitLeft = 64
      ExplicitWidth = 185
      ExplicitHeight = 41
      object btnNovo: TButton
        Left = 8
        Top = 2
        Width = 75
        Height = 43
        Caption = 'Novo'
        TabOrder = 0
        OnClick = btnNovoClick
      end
      object btnEditar: TButton
        Left = 89
        Top = 2
        Width = 75
        Height = 43
        Caption = 'Editar'
        TabOrder = 1
      end
      object btnCancelar: TButton
        Left = 322
        Top = 2
        Width = 75
        Height = 43
        Caption = 'Cancelar'
        TabOrder = 2
        OnClick = btnCancelarClick
      end
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
    object lblTitulo: TLabel
      AlignWithMargins = True
      Left = 136
      Top = 13
      Width = 137
      Height = 22
      Alignment = taCenter
      Caption = 'Lista de Tarefas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object Timer1s: TTimer
    OnTimer = Timer1sTimer
    Left = 24
    Top = 209
  end
end
