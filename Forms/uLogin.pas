unit uLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls,db, Mask, DBCtrls, Grids, DBGrids,
  Menus, ComCtrls;

type
  TfrmLogin = class(TForm)
    P_PRODUTO: TPanel;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DBE_SENHA: TDBEdit;
    ME_SENHA: TMaskEdit;
    DBRadioGroup1: TDBRadioGroup;
    BB_NOVO: TBitBtn;
    BB_ALTERAR: TBitBtn;
    BB_GRAVAR: TBitBtn;
    BB_CANCELAR: TBitBtn;
    BB_EXCLUIR: TBitBtn;
    bb_localizar: TBitBtn;
    BB_FECHAR: TBitBtn;
    DBNavigator2: TDBNavigator;
    Panel1: TPanel;
    DBText1: TDBText;
    Label7: TLabel;
    Label22: TLabel;
    DBGrid1: TDBGrid;
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BB_ALTERARClick(Sender: TObject);
    procedure BB_NOVOClick(Sender: TObject);
    procedure BB_GRAVARClick(Sender: TObject);
    procedure BB_EXCLUIRClick(Sender: TObject);
    procedure BB_FECHARClick(Sender: TObject);
    procedure BB_CANCELARClick(Sender: TObject);
  private
    { Private declarations }
    procedure GerenciaBotoes;
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;
  InsertEdit : string;

implementation

uses uDm, U_LIB;


{$R *.dfm}

{ TfrmCadProdutos }

procedure TfrmLogin.GerenciaBotoes;
begin
  BB_NOVO.Enabled := not (DM.cdsUsuario.State in dsEditModes);
  BB_GRAVAR.Enabled := NOT BB_NOVO.Enabled;
  BB_EXCLUIR.Enabled := BB_NOVO.Enabled and not (DM.cdsUsuario.IsEmpty);
  BB_CANCELAR.Enabled := BB_GRAVAR.Enabled;
  BB_ALTERAR.Enabled := BB_EXCLUIR.Enabled;
  BB_FECHAR.Enabled := BB_NOVO.Enabled;
  bb_localizar.Enabled:= BB_NOVO.Enabled;
  P_PRODUTO.Enabled := not BB_NOVO.Enabled;
end;

procedure TfrmLogin.FormShow(Sender: TObject);
begin
  DM.cdsUsuario.Close;
  DM.cdsUsuario.Open;
  GerenciaBotoes;
end;

procedure TfrmLogin.BB_FECHARClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmLogin.BB_NOVOClick(Sender: TObject);
begin
  InsertEdit := 'Insert';
  DM.cdsUsuario.Insert;
  DM.cdsUsuario.Open;
  DM.cdsUsuarioNIVEL.Value :=0;
  GerenciaBotoes;
  DBEdit3.SetFocus;
end;

procedure TfrmLogin.BB_GRAVARClick(Sender: TObject);
begin
  if InsertEdit ='Insert' then
  begin
    DM.cdsDinamica.Close;
    DM.cdsDinamica.IndexFieldNames:='';
    DM.cdsDinamica.CommandText:='SELECT MAX(ID_USUARIO) FROM TB_USUARIO';
    DM.cdsDinamica.Open;

    DM.cdsUsuarioID_USUARIO.AsInteger := DM.cdsDinamica.Fields[0].AsInteger + 1;
    with DM do
    begin
      if cdsUsuarioLOGIN.Value <> '' then
      begin
        if ME_SENHA.Text = DBE_SENHA.Text then
        begin
          cdsUsuarioSENHA.Value :=
            EncryptMsg(cdsUsuarioSENHA.Value,10);

          {if cdsUsuarioNIVEL.AsInteger = 4 then
            cdsUsuarioCAIXA.AsString := 'S'
          else
            cdsUsuarioCAIXA.AsString := 'N';
          cdsUsuario.ApplyUpdates(0);}
          cdsUsuario.ApplyUpdates(0);
        end
        else
          ShowMessage('Senha n�o confere.');
          ME_SENHA.SetFocus;
      end
      else
        cdsUsuario.CancelUpdates;
    end;
  end;
  if InsertEdit ='Edit' then
  begin
    with DM do
    begin
      if cdsUsuarioLOGIN.Value <> '' then
      begin
        if ME_SENHA.Text = DBE_SENHA.Text then
        begin
          cdsUsuarioSENHA.Value :=
            EncryptMsg(cdsUsuarioSENHA.Value,10);

          {if cdsUsuarioNIVEL.AsInteger = 4 then
            cdsUsuarioCAIXA.AsString := 'S'
          else
            cdsUsuarioCAIXA.AsString := 'N';
          cdsUsuario.ApplyUpdates(0);}
          cdsUsuario.ApplyUpdates(0);
        end
        else
          ShowMessage('Senha n�o confere.');
          ME_SENHA.SetFocus;
      end
      else
        cdsUsuario.CancelUpdates;
    end;
  end;
  GerenciaBotoes;

end;

procedure TfrmLogin.BB_CANCELARClick(Sender: TObject);
begin
  DM.cdsUsuario.Cancel;
  GerenciaBotoes;
end;

procedure TfrmLogin.BB_EXCLUIRClick(Sender: TObject);
begin
  if Application.MessageBox('Deseja Realmente Excluir Este Registro','Confirma��o',MB_ICONQUESTION+MB_YESNO)=idyes then
  Begin
    DM.cdsUsuario.Delete;
    DM.cdsUsuario.ApplyUpdates(0);
  End
  Else
  Begin
  ShowMessage('Registro n�o Confirmado');
  End;
  GerenciaBotoes;

end;

procedure TfrmLogin.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmLogin.BB_ALTERARClick(Sender: TObject);
begin
  InsertEdit := 'Edit';
  DM.cdsUsuario.Edit;
  GerenciaBotoes;
  DBEdit3.SetFocus;
end;

procedure TfrmLogin.DBGrid1TitleClick(Column: TColumn);
begin
  DM.cdsUsuario.IndexFieldNames := Column.FieldName;
end;

procedure TfrmLogin.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
(*DBGrid zebrado*)
  if not odd(DM.cdsUsuario.RecNo) then // se for �mpar
    if not (gdSelected in State) then // se a c�lula n�o est� selecionada
    begin
      DBGrid1.Canvas.Brush.Color:=clScrollBar;//clMoneyGreen;//$00FFEFDF; // define uma cor de fundo
      DBGrid1.Canvas.FillRect(Rect); // pinta a c�lula
      DBGrid1.DefaultDrawDataCell(rect,Column.Field,State); // pinta o texto padr�o
    end;
end;

procedure TfrmLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if DM.cdsUsuario.State in [dsEdit,dsInsert] then
  begin
    ShowMessage('Favor Salve ou Cancele o Registro Para Sair');
    Abort;
  end
  else
  begin
    Action := caFree;
    frmLogin := nil;
    DM.cdsUsuario.Close;
  end;
end;

end.
