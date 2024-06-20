unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.VCLUI.Wait,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, uConn, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.DBCtrls, Vcl.Imaging.pngimage, Vcl.ExtDlgs,
  IOUtils;

type
  TForm1 = class(TForm)
    Paginas: TPageControl;
    Main: TTabSheet;
    AdicionarMain: TTabSheet;
    PanelMain: TPanel;
    Adicionar: TBitBtn;
    VoltarMain: TBitBtn;
    NomeInput: TEdit;
    SobrenomeInput: TEdit;
    SalvarMainBtn: TBitBtn;
    DBGrid1: TDBGrid;
    Image1: TImage;
    OpenTextFileDialog1: TOpenTextFileDialog;
    Image2: TImage;
    BitBtn1: TBitBtn;
    AtualizarMain: TTabSheet;
    Edit1: TEdit;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Image3: TImage;
    BitBtn4: TBitBtn;
    Edit2: TEdit;
    OpenTextFileDialog2: TOpenTextFileDialog;
    DBNavigator1: TDBNavigator;
    procedure AdicionarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure VoltarMainClick(Sender: TObject);
    procedure SalvarMainBtnClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure BitBtn3Click(Sender: TObject);

  private
    { Private declarations }
    fotoInserir: String;
    fotoAtualizar: String;
    celulaClicadaMain: Integer;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormShow(Sender: TObject);
var
  pindex: Integer;
begin
  uConn.DataModule1.EstudodelphiConnection.Connected := true;

  with uConn.DataModule1.PessoasTable do
  begin
    Active := true;
  end;

  for pindex := 0 to Paginas.PageCount - 1 do
  begin
    Paginas.Pages[pindex].TabVisible := false;
    Paginas.ActivePage := Main;
  end;
end;

procedure TForm1.AdicionarClick(Sender: TObject);
begin
  Paginas.ActivePage := AdicionarMain;
  Form1.Caption := 'Adicionar';
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  with OpenTextFileDialog1 do
  begin
    Filter := '*.png,*.bmp';
    if Execute then
    begin
      Self.fotoInserir := FileName;
      Image2.Picture.LoadFromFile(FileName);
    end;
  end;
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
begin
  with OpenTextFileDialog2 do
  begin
    Filter := '*.png,*.bmp';
    if Execute then
    begin
      Self.fotoAtualizar := FileName;
      Image3.Picture.LoadFromFile(FileName);
    end;
  end;
end;

procedure TForm1.DBGrid1CellClick(Column: TColumn);
var
  CaminhoFoto: string;
begin
  Self.celulaClicadaMain := DBGrid1.Fields[0].AsInteger;

  with uConn.DataModule1.FDQuery1 do
  begin
    SQL.Clear;
    SQL.Add('SELECT foto FROM pessoas WHERE id = :id');
    Params.ParamByName('id').AsInteger := Self.celulaClicadaMain;
    Open;
    if not Eof then
    begin
      CaminhoFoto := FieldByName('foto').AsString;
      if FileExists(CaminhoFoto) then
      begin
        Image1.Picture.LoadFromFile(CaminhoFoto);
      end
      else
      begin
        Image1.Picture := nil;
      end;
    end;
    Close;
  end;
end;

procedure TForm1.DBGrid1KeyPress(Sender: TObject; var Key: Char);
var
  CaminhoFoto: string;
begin
  Paginas.ActivePage := AtualizarMain;

  with uConn.DataModule1.FDQuery1 do
  begin
    SQL.Clear;
    SQL.Add('SELECT * FROM pessoas WHERE id = :id');
    Params.ParamByName('id').AsInteger := Self.celulaClicadaMain;
    Open;
    Edit2.Text := FieldByName('nome').AsString;
    Edit1.Text := FieldByName('sobrenome').AsString;
    if not Eof then
    begin
      CaminhoFoto := FieldByName('foto').AsString;
      if FileExists(CaminhoFoto) then
      begin
        Image3.Picture.LoadFromFile(CaminhoFoto);
      end
      else
      begin
        Image3.Picture := nil;
      end;
    end;
    Close;
  end;
end;

procedure TForm1.SalvarMainBtnClick(Sender: TObject);
var
  idMaximo: LongInt;
  ProjectDir: string;
  DestinationPath: string;
begin
  with uConn.DataModule1.FDQuery1 do
  begin
    SQL.Text := 'SELECT MAX(id) as idmaximo FROM pessoas';

    Open;

    if FieldByName('idmaximo').AsString = '' then
    begin
      idMaximo := 0;
    end
    else
    begin
      idMaximo := FieldByName('idmaximo').AsInteger;
    end;

    SQL.Clear;

    SQL.Add('INSERT INTO pessoas (id, nome, sobrenome, foto) VALUES (:id, :nome, :sobrenome, :foto)');
    Params.ParamByName('id').AsInteger := idMaximo + 1;
    Params.ParamByName('nome').AsString := NomeInput.Text;
    Params.ParamByName('sobrenome').AsString := SobrenomeInput.Text;
    Params.ParamByName('foto').AsString := './uploads/' +
      ExtractFileName(Self.fotoInserir);
    ExecSQL;

    uConn.DataModule1.PessoasTable.Refresh;

    ProjectDir := ExtractFilePath(ParamStr(0));

    DestinationPath := TPath.Combine(ProjectDir, 'uploads');

    if not DirectoryExists(DestinationPath) then
    begin
      ForceDirectories(DestinationPath);
    end;

    if FileExists(Self.fotoInserir) then
    begin
      if not CopyFile(PChar(Self.fotoInserir),
        PChar(TPath.Combine(DestinationPath, ExtractFileName(Self.fotoInserir))
        ), true) then
      begin
        ShowMessage('Erro ao mover o arquivo.');
      end;
    end
    else
    begin
      ShowMessage('Arquivo de origem não existe.');
    end;
  end;
end;

procedure TForm1.VoltarMainClick(Sender: TObject);
begin
  Paginas.ActivePage := Main;
  Form1.Caption := 'Principal';
end;

end.
