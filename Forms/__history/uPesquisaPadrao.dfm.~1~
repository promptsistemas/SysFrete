object frmPesquisaPadrao: TfrmPesquisaPadrao
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsNone
  Caption = 'Pesquisa'
  ClientHeight = 472
  ClientWidth = 634
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 33
    Width = 634
    Height = 65
    Align = alTop
    Caption = 'GroupBox1'
    Color = clWhite
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentBackground = False
    ParentColor = False
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 5
      Top = 18
      Width = 96
      Height = 15
      Caption = 'Digite a Pesquisa :'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtPesquisa: TEdit
      Left = 6
      Top = 36
      Width = 625
      Height = 23
      Align = alCustom
      CharCase = ecUpperCase
      Ctl3D = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
      OnChange = edtPesquisaChange
      OnExit = edtPesquisaExit
      OnKeyDown = edtPesquisaKeyDown
      OnKeyPress = FormKeyPress
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 98
    Width = 634
    Height = 374
    Align = alClient
    Caption = 'Resultado da Pesquisa'
    TabOrder = 1
    object dbgPesquisa: TDBGrid
      Left = 2
      Top = 15
      Width = 630
      Height = 357
      Align = alClient
      DataSource = dsPesquisa
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      Options = [dgTitles, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnKeyDown = dbgPesquisaKeyDown
      Columns = <
        item
          Color = clCream
          Expanded = False
          Width = 150
          Visible = True
        end
        item
          Color = clBtnFace
          Expanded = False
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          Visible = True
        end>
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 0
    Width = 634
    Height = 33
    Align = alTop
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -21
    Font.Name = 'Segoe UI Semibold'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 2
    object L_PESQUISA: TLabel
      Left = 6
      Top = 5
      Width = 73
      Height = 21
      Caption = 'Pesquisa :'
      Font.Charset = ANSI_CHARSET
      Font.Color = clYellow
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 564
      Top = 6
      Width = 67
      Height = 21
      Caption = 'Esc (Sair)'
      Font.Charset = ANSI_CHARSET
      Font.Color = clYellow
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
    end
  end
  object dsPesquisa: TDataSource
    Left = 345
    Top = 125
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 352
    Top = 176
  end
end
