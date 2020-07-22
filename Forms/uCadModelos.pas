unit uCadModelos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Mask, Buttons, ExtCtrls, Grids, DBGrids,Db,
  FMTBcd, SqlExpr, DBClient, Provider,ComCtrls ;

type
  TfrmCadModelos = class(TForm)
    PCUPOM: TPanel;
    DBEdit1: TDBEdit;
    Label1: TLabel;
    DBEdit2: TDBEdit;
    Label2: TLabel;
    DBGrid2: TDBGrid;
    BB_NOVO: TBitBtn;
    BB_EDITAR: TBitBtn;
    BB_GRAVAR: TBitBtn;
    BB_EXCLUIR: TBitBtn;
    BB_PESQUISAR: TBitBtn;
    BB_SAIR: TBitBtn;
    DBNavigator1: TDBNavigator;
    BB_CANCELAR: TBitBtn;
    Panel1: TPanel;
    Label5: TLabel;
    SpeedButton3: TSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BB_NOVOClick(Sender: TObject);
    procedure BB_EDITARClick(Sender: TObject);
    procedure BB_CANCELARClick(Sender: TObject);
    procedure BB_GRAVARClick(Sender: TObject);
    procedure BB_EXCLUIRClick(Sender: TObject);
    procedure BB_SAIRClick(Sender: TObject);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure SpeedButton3Click(Sender: TObject);
    procedure BB_PESQUISARClick(Sender: TObject);
  private
    { Private declarations }
    Procedure GerenciaBotoes;
  public
    { Public declarations }
  end;

var
  frmCadModelos: TfrmCadModelos;
  Tipo : String;

implementation

uses U_LIB, UD_PESQUISA, uDm, uPesquisaPadrao, uCadMarcas;

{$R *.dfm}

{ TfrmCadRota }

procedure TfrmCadModelos.GerenciaBotoes;
begin
  BB_NOVO.Enabled := not (DM.cdsModelos.State in dsEditModes);
  BB_GRAVAR.Enabled := NOT BB_NOVO.Enabled;
  BB_EXCLUIR.Enabled := BB_NOVO.Enabled and not (DM.cdsModelos.IsEmpty);
  BB_CANCELAR.Enabled := BB_GRAVAR.Enabled;
  BB_EDITAR.Enabled := BB_EXCLUIR.Enabled;
  BB_SAIR.Enabled := BB_NOVO.Enabled;
  BB_PESQUISAR.Enabled:= BB_NOVO.Enabled;
  //BB_EXPORTAR.Enabled:= BB_NOVO.Enabled;
  PCUPOM.Enabled := not BB_NOVO.Enabled;
end;

procedure TfrmCadModelos.SpeedButton3Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadModelos.FormShow(Sender: TObject);
begin
  DM.cdsModelos.Open;
  GerenciaBotoes;
end;

procedure TfrmCadModelos.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmCadModelos.DBGrid1TitleClick(Column: TColumn);
begin
  (*recupera a cor original da coluna*)
  if DM.cdsModelos.IndexFieldNames <> '' then
    DBGrid2.Columns[DM.cdsModelos.FieldByName
    (DM.cdsModelos.IndexFieldNames).Index].Title.Color :=
      DBGrid2.FixedColor;


  (*se campo não for blob ou memo e se for do tipo data*)
  if not (Column.Field.DataType in [ftBlob,ftMemo]) then
    if Column.Field.FieldKind = fkData then
    begin
      DM.cdsModelos.IndexFieldNames := Column.FieldName; // indexa
//      Column.Font.Style := [fsBold]; // Tipo da Fonte
    end;
end;

procedure TfrmCadModelos.DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  TDbGrid(Sender).Canvas.font.Color:= clBlack; //aqui é definida a cor da fonte
  if gdSelected in State then
  with (Sender as TDBGrid).Canvas do
  begin
    Brush.Color:=$00F0DAC7; //aqui é definida a cor do fundo
    Font.Style := [fsBold];
    FillRect(Rect);
  end;

  TDbGrid(Sender).DefaultDrawDataCell(Rect, TDbGrid(Sender).columns[datacol].field, State);
end;

procedure TfrmCadModelos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if DM.cdsModelos.State in [dsEdit,dsInsert] then
  begin
    ShowMessage('Favor Salve ou Cancele o Registro Para Sair');
    Abort;
  end
  else
  begin
    Action := caFree;
    frmCadModelos := nil;
  end;

end;

procedure TfrmCadModelos.BB_NOVOClick(Sender: TObject);
begin
  Tipo := 'Insert';
  DM.cdsModelos.Insert;

  GerenciaBotoes;
  DBEdit2.SetFocus;

end;

procedure TfrmCadModelos.BB_PESQUISARClick(Sender: TObject);
begin
  frmPesquisaPadrao := TfrmPesquisaPadrao.Create(self);
  frmPesquisaPadrao.TB_PESQUISA := 'Modelos';
  frmPesquisaPadrao.CDS := DM.cdsModelos;
  frmPesquisaPadrao.Tabela := 'TB_MODELO M';
  frmPesquisaPadrao.CampoBusca  := 'M.DESCRICAO';
  frmPesquisaPadrao.CampoBusca2 := 'M.ID_MODELO';
  frmPesquisaPadrao.CampoBusca3 := 'M.ID_MODELO';
  frmPesquisaPadrao.CampoChave  := 'M.DESCRICAO';
  frmPesquisaPadrao.LegendaGrouBox := 'Consulta de Marcas';
  frmPesquisaPadrao.Sql            := ' SELECT M.ID_MODELO, M.DESCRICAO ';

  frmPesquisaPadrao.dbgPesquisa.Columns[0].Title.Caption := 'Modelo';
  frmPesquisaPadrao.dbgPesquisa.Columns[0].FieldName:= 'DESCRICAO';
  frmPesquisaPadrao.dbgPesquisa.Columns[0].Width:= 300;

  frmPesquisaPadrao.dbgPesquisa.Columns[1].Title.Caption := 'Código';
  frmPesquisaPadrao.dbgPesquisa.Columns[1].FieldName:= 'ID_MODELO';
  frmPesquisaPadrao.dbgPesquisa.Columns[1].Width:= 100;

{  frmPesquisaPadrao.dbgPesquisa.Columns[2].Title.Caption := 'CNPJ';
  frmPesquisaPadrao.dbgPesquisa.Columns[2].FieldName:= 'CNPJ_CPF';
  frmPesquisaPadrao.dbgPesquisa.Columns[2].Width:= 150;}

  frmPesquisaPadrao.ShowModal;
  FreeAndNil(frmPesquisaPadrao);

end;

procedure TfrmCadModelos.BB_EDITARClick(Sender: TObject);
begin
  Tipo := 'Edit';
  DM.cdsModelos.Edit;
  GerenciaBotoes;
  DBEdit2.SetFocus;
end;

procedure TfrmCadModelos.BB_CANCELARClick(Sender: TObject);
begin
  DM.cdsModelos.Cancel;
  GerenciaBotoes;
end;

procedure TfrmCadModelos.BB_EXCLUIRClick(Sender: TObject);
begin
  if Application.MessageBox('Deseja Excluir Este Grupo ?','Confirmação',MB_ICONQUESTION+MB_YESNO ) = idyes then
  begin
    DM.cdsModelos.Delete;
    DM.cdsModelos.ApplyUpdates(0);
    GerenciaBotoes;
  end
  else
  begin
    ShowMessage('Grupo Não Excluído');
  end;
    GerenciaBotoes;
end;

procedure TfrmCadModelos.BB_SAIRClick(Sender: TObject);
begin
  Close;
//  DM.cdsDinamica.Close;
//  DM.cdsDinamica.IndexFieldNames:='';
//  DM.cdsDinamica.CommandText := ' SELECT EXPORTADO FROM TB_GRUPO_PRODUTO WHERE EXPORTADO = ''N''';
//  DM.cdsDinamica.Open;
//
//  if DM.cdsDinamica.IsEmpty then
//  begin
//    DM.cdsModelos.Close;
//    Close;
//  end
//  else
//  begin
//    if Application.MessageBox('Existe(m) Grupo(s) de Produto(s) sem importar, Deseja Importar Grupo(s) de Produto(s) Agora?','Atenção',MB_OK+MB_YESNO)= idyes then
//    begin
//      BB_EXPORTARClick(Self);
//    end
//    else
//    begin
//      DM.cdsModelos.Close;
//      Close;
//    end;
//  end;

end;

procedure TfrmCadModelos.BB_GRAVARClick(Sender: TObject);
begin
  if Tipo = 'Insert' then
  begin
    DM.cdsDinamica.Close;
    DM.cdsDinamica.IndexFieldNames:='';
    DM.cdsDinamica.CommandText := ' SELECT MAX(ID_MODELO) FROM TB_MODELO ';
    DM.cdsDinamica.Open;

    DM.cdsModelosID_MODELO.AsInteger := DM.cdsDinamica.Fields[0].AsInteger + 1;
    if DM.cdsModelos.ApplyUpdates(0) <> 0 then
    begin
      ShowMessage('O Sistema não conseguiu gravar este Registro. Tente novamente ou contate o Suporte.');
      BB_GRAVAR.SetFocus;
    end
    else
    begin
      DM.cdsModelos.ApplyUpdates(0);
      DM.cdsModelos.Refresh;
      GerenCiaBotoes;
    end;
  end;

  if Tipo = 'Edit' then
  begin
    if DM.cdsModelos.ApplyUpdates(0) <> 0 then
    begin
      ShowMessage('O Sistema não conseguiu gravar este Registro. Tente novamente ou contate o Suporte.');
      BB_GRAVAR.SetFocus;
    end
    else
    begin
      DM.cdsModelos.ApplyUpdates(0);
      DM.cdsModelos.Refresh;
      GerenCiaBotoes;
    end;
  end;



end;

end.
