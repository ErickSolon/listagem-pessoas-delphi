object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Estudo Delphi'
  ClientHeight = 364
  ClientWidth = 624
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
    Width = 618
    Height = 358
    ActivePage = Main
    Align = alClient
    TabOrder = 0
    object Main: TTabSheet
      Caption = 'Main'
      object PanelMain: TPanel
        Left = 0
        Top = 0
        Width = 610
        Height = 328
        Align = alClient
        TabOrder = 0
        DesignSize = (
          610
          328)
        object Image1: TImage
          AlignWithMargins = True
          Left = 428
          Top = 4
          Width = 174
          Height = 158
          Anchors = [akTop, akRight]
          Center = True
          Proportional = True
          ExplicitLeft = 432
        end
        object Adicionar: TBitBtn
          AlignWithMargins = True
          Left = 41
          Top = 74
          Width = 120
          Height = 25
          Hint = 
            'Para atualizar clique no usu'#225'rio na tabela e aperte qualquer bot' +
            #227'o.'
          Cancel = True
          Caption = 'Adicionar'
          TabOrder = 0
          OnClick = AdicionarClick
        end
        object DBGrid1: TDBGrid
          Left = 1
          Top = 168
          Width = 608
          Height = 159
          Hint = 
            'Para atualizar clique no usu'#225'rio na tabela e aperte qualquer bot' +
            #227'o.'
          Align = alBottom
          Anchors = [akLeft, akTop, akRight, akBottom]
          DataSource = DataModule1.DataSource1
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = 'Segoe UI'
          TitleFont.Style = []
          OnCellClick = DBGrid1CellClick
          OnKeyPress = DBGrid1KeyPress
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
        object DBNavigator1: TDBNavigator
          Left = 156
          Top = 74
          Width = 222
          Height = 25
          DataSource = DataModule1.DataSource1
          VisibleButtons = [nbDelete, nbRefresh]
          TabOrder = 2
        end
      end
    end
    object AdicionarMain: TTabSheet
      Caption = 'AdicionarMain'
      ImageIndex = 1
      DesignSize = (
        610
        328)
      object Image2: TImage
        AlignWithMargins = True
        Left = 377
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
        Top = 306
        Width = 75
        Height = 25
        Anchors = [akLeft, akBottom]
        Caption = 'Salvar'
        ParentShowHint = False
        ShowHint = False
        TabOrder = 3
        OnClick = SalvarMainBtnClick
      end
      object BitBtn1: TBitBtn
        Left = 456
        Top = 247
        Width = 75
        Height = 25
        Anchors = [akTop, akRight]
        Caption = 'Selecionar'
        TabOrder = 4
        OnClick = BitBtn1Click
      end
    end
    object AtualizarMain: TTabSheet
      Caption = 'AtualizarMain'
      ImageIndex = 2
      DesignSize = (
        610
        328)
      object Image3: TImage
        AlignWithMargins = True
        Left = 385
        Top = 24
        Width = 225
        Height = 225
        Anchors = [akTop, akRight]
        Center = True
      end
      object Edit1: TEdit
        Left = 138
        Top = 72
        Width = 121
        Height = 23
        TabOrder = 0
        TextHint = 'Sobrenome'
      end
      object BitBtn2: TBitBtn
        Left = 3
        Top = 303
        Width = 75
        Height = 25
        Anchors = [akLeft, akBottom]
        Caption = 'Atualizar'
        ParentShowHint = False
        ShowHint = False
        TabOrder = 1
      end
      object BitBtn3: TBitBtn
        Left = 464
        Top = 255
        Width = 75
        Height = 25
        Anchors = [akTop, akRight]
        Caption = 'Selecionar'
        TabOrder = 2
        OnClick = BitBtn3Click
      end
      object BitBtn4: TBitBtn
        Left = 11
        Top = 11
        Width = 75
        Height = 25
        Caption = 'Voltar'
        TabOrder = 3
        OnClick = VoltarMainClick
      end
      object Edit2: TEdit
        Left = 11
        Top = 72
        Width = 121
        Height = 23
        TabOrder = 4
        TextHint = 'Nome'
      end
    end
  end
  object OpenTextFileDialog1: TOpenTextFileDialog
    Left = 104
    Top = 168
  end
  object OpenTextFileDialog2: TOpenTextFileDialog
    Left = 104
    Top = 224
  end
end
