object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Estudo Delphi'
  ClientHeight = 365
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnShow = FormShow
  TextHeight = 15
  object Paginas: TPageControl
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 622
    Height = 359
    ActivePage = Main
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 0
    ExplicitTop = 0
    ExplicitWidth = 624
    ExplicitHeight = 364
    object Main: TTabSheet
      Caption = 'Main'
      object PanelMain: TPanel
        Left = 0
        Top = 0
        Width = 614
        Height = 329
        Align = alClient
        TabOrder = 0
        ExplicitWidth = 616
        ExplicitHeight = 334
        DesignSize = (
          614
          329)
        object Image1: TImage
          AlignWithMargins = True
          Left = 485
          Top = 4
          Width = 121
          Height = 105
          Anchors = [akTop, akRight]
          Center = True
          Proportional = True
          ExplicitLeft = 488
        end
        object Adicionar: TBitBtn
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 61
          Height = 25
          Cancel = True
          Caption = 'Adicionar'
          TabOrder = 0
          OnClick = AdicionarClick
        end
        object DBGrid1: TDBGrid
          Left = 1
          Top = 115
          Width = 612
          Height = 213
          Align = alBottom
          Anchors = [akLeft, akTop, akRight, akBottom]
          DataSource = DataModule1.DataSource1
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = 'Segoe UI'
          TitleFont.Style = []
          OnCellClick = DBGrid1CellClick
          Columns = <
            item
              Expanded = False
              FieldName = 'id'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'nome'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'sobrenome'
              Visible = True
            end>
        end
      end
    end
    object AdicionarMain: TTabSheet
      Caption = 'AdicionarMain'
      ImageIndex = 1
      DesignSize = (
        614
        329)
      object Image2: TImage
        AlignWithMargins = True
        Left = 381
        Top = 16
        Width = 225
        Height = 225
        Anchors = [akTop, akRight]
        Center = True
        ExplicitLeft = 384
      end
      object VoltarMain: TBitBtn
        Left = 3
        Top = 3
        Width = 75
        Height = 25
        Caption = 'Voltar'
        TabOrder = 0
        OnClick = VoltarMainClick
      end
      object NomeInput: TEdit
        Left = 3
        Top = 64
        Width = 121
        Height = 23
        TabOrder = 1
        TextHint = 'Nome'
      end
      object SobrenomeInput: TEdit
        Left = 130
        Top = 64
        Width = 121
        Height = 23
        TabOrder = 2
        TextHint = 'Sobrenome'
      end
      object SalvarMainBtn: TBitBtn
        Left = 3
        Top = 307
        Width = 75
        Height = 25
        Caption = 'Salvar'
        ParentShowHint = False
        ShowHint = False
        TabOrder = 3
        OnClick = SalvarMainBtnClick
      end
      object BitBtn1: TBitBtn
        Left = 388
        Top = 256
        Width = 75
        Height = 25
        Caption = 'Selecionar'
        TabOrder = 4
        OnClick = BitBtn1Click
      end
    end
  end
  object OpenTextFileDialog1: TOpenTextFileDialog
    Left = 56
    Top = 256
  end
end