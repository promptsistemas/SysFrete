unit uPesquisaPadrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Buttons, Datasnap.DBClient, Vcl.Imaging.jpeg, Vcl.ExtCtrls,
  Datasnap.Provider;

type
  TfrmPesquisaPadrao = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    edtPesquisa: TEdit;
    dbgPesquisa: TDBGrid;
    dsPesquisa: TDataSource;
    ClientDataSet1: TClientDataSet;
    Label1: TLabel;
    Panel4: TPanel;
    L_PESQUISA: TLabel;
    Label2: TLabel;
    procedure FormShow(Sender: TObject);
    procedure edtPesquisaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgPesquisaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtPesquisaChange(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edtPesquisaExit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    ConsultaSQL,
    WhereIsNull,
    WhereNotExists,
    WhereParametro : string;
  public
    { Public declarations }
    CDS : TClientDataSet;
    Sql,
    Tabela,
    CampoBusca,
    CampoBusca2,
    CampoBusca3,
    CampoChave,
    LegendaGrouBox,TB_PESQUISA,sSqlJoin : string;
  end;

var
  frmPesquisaPadrao: TfrmPesquisaPadrao;

implementation

{$R *.dfm}

uses uDM, uCadCliente;

procedure TfrmPesquisaPadrao.dbgPesquisaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) and not (CDS.IsEmpty)then
  begin
    ModalResult := mrOk;
    Close;
  end;

  if key = VK_ESCAPE then
  begin
    close;
  end;


end;

procedure TfrmPesquisaPadrao.edtPesquisaChange(Sender: TObject);
begin
  if TB_PESQUISA = 'Cliente' then
  begin
    CDS.Close;
    CDS.CommandText := ConsultaSQL +sSqlJoin +WhereParametro;
    CDS.Params.ParamByName('P').Value := '%' + AnsiUpperCase(edtPesquisa.Text) + '%';
    CDS.Open;
  end;
  if TB_PESQUISA = 'Motorista' then
  begin
    CDS.Close;
    CDS.CommandText := ConsultaSQL +sSqlJoin +WhereParametro;
    CDS.Params.ParamByName('P').Value := '%' + AnsiUpperCase(edtPesquisa.Text) + '%';
    CDS.Open;
  end;
  if TB_PESQUISA = 'Marcas' then
  begin
    CDS.Close;
    CDS.CommandText := ConsultaSQL +sSqlJoin +WhereParametro;
    CDS.Params.ParamByName('P').Value := '%' + AnsiUpperCase(edtPesquisa.Text) + '%';
    CDS.Open;
  end;

  if TB_PESQUISA = 'Modelos' then
  begin
    CDS.Close;
    CDS.CommandText := ConsultaSQL +sSqlJoin +WhereParametro;
    CDS.Params.ParamByName('P').Value := '%' + AnsiUpperCase(edtPesquisa.Text) + '%';
    CDS.Open;
  end;

end;

procedure TfrmPesquisaPadrao.edtPesquisaExit(Sender: TObject);
begin
  dbgPesquisa.SetFocus;
end;

procedure TfrmPesquisaPadrao.edtPesquisaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key in [VK_UP, VK_DOWN]) and not(CDS.IsEmpty) then
      dbgPesquisa.SetFocus;

  if (Key = VK_RETURN) then
  // and (edtPesquisa.Text <> '') then
  begin
   { CDS.Close;
    CDS.CommandText := ConsultaSQL + WhereParametro;
    CDS.Params.ParamByName('P').Value := '%' + AnsiUpperCase(edtPesquisa.Text) + '%';
    CDS.Open;}
    edtPesquisaExit(Self);
    dbgPesquisa.SetFocus;
  end;
  if key = VK_ESCAPE then
  begin
    close;
  end;

end;

procedure TfrmPesquisaPadrao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_ESCAPE then
  begin
    close;
  end;
end;

procedure TfrmPesquisaPadrao.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;

end;

procedure TfrmPesquisaPadrao.FormShow(Sender: TObject);
Var
  gpEmpresa : string;
begin
  ConsultaSQL :=sql +Format(' FROM %S ', [Tabela]);
  WhereIsNull := Format(' WHERE %S IS NOT NULL', [CampoChave]);
  WhereParametro := Format(' WHERE UPPER(%S) LIKE :P ',[CampoBusca]);
  WhereParametro := WhereParametro+Format(' or  UPPER(%S) LIKE :P',[campobusca2]);

  if CampoBusca3 <> '' then
    WhereParametro := WhereParametro+Format(' or  UPPER(%S) LIKE :P',[campobusca3]);

  if TB_PESQUISA = 'Cliente' then
  begin
     sSqlJoin :=  ' JOIN tb_municipios M ON (M.codigo_munic = C.cod_munic)';

  end;

  if TB_PESQUISA = 'Motorista' then
  begin
     sSqlJoin :=  ' JOIN TB_MUNICIPIOS M ON (M.CODIGO_MUNIC = C.COD_MUNIC)';

  end;


  dsPesquisa.DataSet := CDS;
  if (LegendaGrouBox <> '') then
    GroupBox1.Caption := LegendaGrouBox
      else
        GroupBox1.Caption := 'Pesquisar Registros';
end;

end.