unit uCadVeiculo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls,DB, Vcl.Mask, ACBrBase, ACBrSocket, ACBrCEP, Vcl.XPMan,
  Vcl.ActnMan, Vcl.ActnColorMaps, ACBrConsultaCPF, ACBrConsultaCNPJ,
  ACBrValidador;

type
  TfrmCadVeiculo = class(TForm)
    Panel1: TPanel;
    RadioGroup1: TRadioGroup;
    RadioGroup2: TRadioGroup;
    RadioGroup3: TRadioGroup;
    BB_NOVO: TBitBtn;
    BB_EDITAR: TBitBtn;
    BB_GRAVAR: TBitBtn;
    BB_CANCELAR: TBitBtn;
    BB_EXCLUIR: TBitBtn;
    BB_PESQUISAR: TBitBtn;
    BB_SAIR: TBitBtn;
    DBNavigator1: TDBNavigator;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    L_CPF_CNPJ: TLabel;
    DBEdit2: TDBEdit;
    L_NOME: TLabel;
    DBEdit3: TDBEdit;
    L_RG: TLabel;
    DBEdit5: TDBEdit;
    Label3: TLabel;
    Label5: TLabel;
    DBEdit7: TDBEdit;
    ACBrCEP1: TACBrCEP;
    Label6: TLabel;
    DBComboBox2: TDBComboBox;
    Label7: TLabel;
    DBEdit8: TDBEdit;
    Label8: TLabel;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    Label9: TLabel;
    DBEdit11: TDBEdit;
    Label10: TLabel;
    DBEdit12: TDBEdit;
    Label11: TLabel;
    DBEdit13: TDBEdit;
    Label12: TLabel;
    DBEdit15: TDBEdit;
    Label14: TLabel;
    DBText1: TDBText;
    Label17: TLabel;
    Label18: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton3: TSpeedButton;
    ACBrValidador1: TACBrValidador;
    DBComboBox1: TComboBox;
    DBLookupComboBox1: TDBLookupComboBox;
    Label2: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label13: TLabel;
    DBEdit6: TDBEdit;
    Label19: TLabel;
    DBEdit14: TDBEdit;
    Label23: TLabel;
    DBEdit19: TDBEdit;
    Label28: TLabel;
    DBEdit21: TDBEdit;
    DBEdit18: TDBEdit;
    Label20: TLabel;
    Label21: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BB_SAIRClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BB_NOVOClick(Sender: TObject);
    procedure DBEdit7Exit(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure BB_CANCELARClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit7Enter(Sender: TObject);
    procedure DBComboBox2Exit(Sender: TObject);
    procedure DBEdit1Exit(Sender: TObject);
    procedure BB_GRAVARClick(Sender: TObject);
    procedure BB_PESQUISARClick(Sender: TObject);
    procedure BB_EDITARClick(Sender: TObject);
    procedure BB_EXCLUIRClick(Sender: TObject);
    procedure DBEdit1Enter(Sender: TObject);
    procedure DBComboBox1Exit(Sender: TObject);
    procedure BB_CANCELARMouseActivate(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y, HitTest: Integer;
      var MouseActivate: TMouseActivate);
    procedure DBEdit6Exit(Sender: TObject);
    procedure DBMemo1Exit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
    procedure bb_enviaDJClick(Sender: TObject);
    function TiraPontoeVirgula(sTexto:String):String;
    function  ColocaTextoDir(Texto: string; Qtd: integer; Ch: Char): string;
    procedure BB_TODOSClick(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure DBEdit15Enter(Sender: TObject);
  private
    { Private declarations }
    Procedure GerenCiaBotoes;
    function cpf(num: string): boolean;
    function cgc(num: string): boolean;
    procedure ConsultaCNPJ;
    procedure ConsultaCPF;
    Procedure verificaClienteExiste;


  public
    { Public declarations }
  end;

var
  frmCadVeiculo: TfrmCadVeiculo;
  Tipo :  string;

implementation

{$R *.dfm}

uses U_LIB, UD_PESQUISA, uDM, uConsultaCNPJ, uConsultaCPF, uMenu,
  uPesquisaPadrao, uCadCliente;

function AjustaStr ( str: String; tam: Integer ): String;
begin
while Length ( str ) < tam do
str := str + ' ';
if Length ( str ) > tam then
str := Copy ( str, 1, tam );
Result := str;
end;


Function RemoveAcentos(Str:String): String;
{Remove caracteres acentuados de uma string}
Const ComAcento = '‡‚ÍÙ˚„ı·ÈÌÛ˙Á¸¿¬ ‘€√’¡…Õ”⁄«‹';
  SemAcento = 'aaeouaoaeioucuAAEOUAOAEIOUCU';
Var
x : Integer;
Begin
For x := 1 to Length(Str) do
  Begin
  if Pos(Str[x],ComAcento)<>0 Then
  begin
  Str[x] := SemAcento[Pos(Str[x],ComAcento)];
  end;
  end;
Result := Str;
end;


procedure TfrmCadVeiculo.BB_CANCELARClick(Sender: TObject);
begin
  DBComboBox1.Text := 'Fisica';
  DM.cdsveiculo.Cancel;
  GerenCiaBotoes;
end;

procedure TfrmCadVeiculo.BB_CANCELARMouseActivate(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y, HitTest: Integer;
  var MouseActivate: TMouseActivate);
begin
  Tipo := 'Cancelar';
end;

procedure TfrmCadVeiculo.BB_EDITARClick(Sender: TObject);
begin
  Tipo := 'Edit';
  DM.cdsveiculo.Edit;
  GerenCiaBotoes;
  DBComboBox1.SetFocus;
end;

procedure TfrmCadVeiculo.bb_enviaDJClick(Sender: TObject);
var arq: TextFile;
linha, aliquota,vlVenda,F_J,dtCadastro,dtNascimento,vlLimite: String;
begin
end;

procedure TfrmCadVeiculo.BB_EXCLUIRClick(Sender: TObject);
begin
  if Application.MessageBox('Deseja Excluir Este Cliente ?','ConfirmaÁ„o',MB_ICONQUESTION+MB_YESNO ) = idyes then
  begin
    DM.cdsveiculo.Delete;
    if DM.cdsveiculo.ApplyUpdates(0) <> 0 then
    begin
      ShowMessage('O Sistema n„o conseguiu excluir este Registro. Tente novamente ou contate o Suporte.');
      BB_GRAVAR.SetFocus;
    end
    else
    begin
      DM.cdsveiculo.ApplyUpdates(0);
      GerenciaBotoes;
    end;
  end
  else
  begin
    ShowMessage('Cliente N„o ExcluÌdo');
  end;
    GerenciaBotoes;

end;

procedure TfrmCadVeiculo.BB_GRAVARClick(Sender: TObject);
begin
  if DBEdit8.Text = '' then
  begin
    ShowMessage('Favor Informar CÛdigo Municipio.');
    DBComboBox2Exit(Self);
    Exit;
  end;

  if Tipo = 'Insert' then
  begin
    DM.cdsDinamica.Close;
    DM.cdsDinamica.IndexFieldNames:='';
    DM.cdsDinamica.CommandText := 'SELECT MAX(ID_VEICULO) FROM TB_VEICULO';
    DM.cdsDinamica.Open;

    DM.cdsVeiculoID_VEICULO.AsInteger := DM.cdsDinamica.Fields[0].AsInteger+1;

    if DM.cdsveiculo.ApplyUpdates(0) <> 0 then
    begin
      ShowMessage('O Sistema n„o conseguiu gravar este Registro. Tente novamente ou contate o Suporte.');
      BB_GRAVAR.SetFocus;
    end
    else
    begin
      bb_enviaDJClick(Self);
      DM.cdsveiculo.ApplyUpdates(0);
      GerenCiaBotoes;
    end;
  end
  else
  begin
    if DM.cdsveiculo.ApplyUpdates(0) <> 0 then
    begin
      ShowMessage('O Sistema n„o conseguiu Alterar este Registro. Tente novamente ou contate o Suporte.');
      BB_GRAVAR.SetFocus;
    end
    else
    begin
      bb_enviaDJClick(Self);
      DM.cdsveiculo.ApplyUpdates(0);
      GerenCiaBotoes;
    end;

  end;

end;

procedure TfrmCadVeiculo.BB_NOVOClick(Sender: TObject);
begin
  Tipo := 'Insert';
  DM.cdsveiculo.Open;
  DM.cdsveiculo.Insert;
  GerenCiaBotoes;
  DBComboBox1.SetFocus;
end;

procedure TfrmCadVeiculo.BB_PESQUISARClick(Sender: TObject);
begin
//  Pesquisa(DM.cdsveiculo,['R_SOCIAL','CNPJ_CPF','ID_CLIENTE'],['Raz„o Social','CPF/CNPJ','CÛdigo'],
//    [35,18,4],'','','','','Clientes','Cliente');
  frmPesquisaPadrao := TfrmPesquisaPadrao.Create(self);
  frmPesquisaPadrao.TB_PESQUISA := 'Veiculo';
  frmPesquisaPadrao.CDS := DM.cdsveiculo;
  frmPesquisaPadrao.Tabela := 'TB_VEICULO V';
  frmPesquisaPadrao.CampoBusca  := 'M.NOME';
  frmPesquisaPadrao.CampoBusca2 := 'O.DESCRICAO';
  frmPesquisaPadrao.CampoBusca3 := 'V.PLACA_CARRETA';
  frmPesquisaPadrao.CampoBusca4 := 'V.PROPIETARIO';
  frmPesquisaPadrao.CampoChave  := 'M.NOME';
  frmPesquisaPadrao.LegendaGrouBox := 'Consulta de VeÌculos';
  frmPesquisaPadrao.Sql            := ' SELECT V.ID_VEICULO, V.ID_MARCA, V.ID_MODELO, V.UF_PLACA, V.ANO_MODELO, V.ANO_FABRICACAO, '+
                                      ' V.COR, V.CHASSI, V.RNTC_ANTT, V.PLACA_CARRETA, V.UF_PLACA_CARRETA, V.PROPIETARIO, '+
                                      ' V.CPF_CNPJ, V.ENDERECO, V.NUMERO, V.BAIRRO, V.COMPLEMENTO, V.TELEFONE, V.CEP, V.DT_ULT_MANU,'+
                                      ' V.RENAVAM, V.COD_MUNIC, M.NOME AS MARCA, O.DESCRICAO AS MODELO, C.NOME AS CIDADE, C.UF AS UF ';

  frmPesquisaPadrao.dbgPesquisa.Columns[0].Title.Caption := 'Proprietario';
  frmPesquisaPadrao.dbgPesquisa.Columns[0].FieldName:= 'PROPIETARIO';
  frmPesquisaPadrao.dbgPesquisa.Columns[0].Width:= 150;


  frmPesquisaPadrao.dbgPesquisa.Columns[1].Title.Caption := 'Marca';
  frmPesquisaPadrao.dbgPesquisa.Columns[1].FieldName:= 'MARCA';
  frmPesquisaPadrao.dbgPesquisa.Columns[1].Width:= 150;

  frmPesquisaPadrao.dbgPesquisa.Columns[2].Title.Caption := 'Modelo';
  frmPesquisaPadrao.dbgPesquisa.Columns[2].FieldName:= 'MODELO';
  frmPesquisaPadrao.dbgPesquisa.Columns[2].Width:= 150;

  frmPesquisaPadrao.dbgPesquisa.Columns[3].Title.Caption := 'Placa';
  frmPesquisaPadrao.dbgPesquisa.Columns[3].FieldName:= 'PLACA_CARRETA';
  frmPesquisaPadrao.dbgPesquisa.Columns[3].Width:= 80;

  frmPesquisaPadrao.ShowModal;
  FreeAndNil(frmPesquisaPadrao);


  if DBComboBox1.Text = 'Juridica' then
  begin
    L_CPF_CNPJ.Caption := 'CNPJ';
    L_NOME.Caption := 'Raz„o Social';
////    L_RG.Caption   := 'Insc.Estadual';
    DBComboBox1.Text := 'Juridica';
  end
  else
  begin
    L_CPF_CNPJ.Caption := 'C.P.F';
    L_NOME.Caption := 'Nome Completo';
//    L_RG.Caption   := 'RG';
    DBComboBox1.Text := 'Fisica';
  end;
end;

procedure TfrmCadVeiculo.BB_SAIRClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadVeiculo.BB_TODOSClick(Sender: TObject);
var arq: TextFile;
linha, aliquota,vlVenda,F_J,dtCadastro,dtNascimento,vlLimite: String;
begin
end;

procedure TfrmCadVeiculo.Button1Click(Sender: TObject);
var i : integer;
begin
  for I := 0 to ACBrCEP1.Enderecos.Count -1 do
  begiN
    DM.cdsveiculoCEP.AsString := ACBrCEP1.Enderecos[i].CEP;
//    if DM.cdsveiculoENDERECO.IsNull then
      DM.cdsveiculoENDERECO.AsString :=RemoveAcentos(ACBrCEP1.Enderecos[i].Tipo_Logradouro+' '+ ACBrCEP1.Enderecos[i].Logradouro);
//    if DM.cdsveiculoCOMPLEMENTO.IsNull then
      DM.cdsveiculoCOMPLEMENTO.AsString := ACBrCEP1.Enderecos[i].Complemento;
//    if DM.cdsveiculoCODIGO_MUNIC.IsNull then
      DM.cdsveiculoCOD_MUNIC.AsString := ACBrCEP1.Enderecos[i].IBGE_UF;
//    if DM.cdsveiculoCIDADE.IsNull then
      DM.cdsveiculoCIDADE.AsString := RemoveAcentos(ACBrCEP1.Enderecos[i].Municipio);
//    if DM.cdsveiculoUF.IsNull then
      DM.cdsveiculoUF.AsString := ACBrCEP1.Enderecos[i].UF;
//    if DM.cdsveiculoBAIRRO.IsNull then
    DM.cdsveiculoBAIRRO.AsString := RemoveAcentos(ACBrCEP1.Enderecos[i].Bairro);
    if DM.cdsveiculoUF.Value <> '' then
    begin
      DM.cdsDinamica.Close;
      DM.cdsDinamica.IndexFieldNames:='';
      DM.cdsDinamica.CommandText := ' SELECT M.codigo_munic,M.nome,M.UF,M.DDD FROM TB_MUNICIPIOS M WHERE M.UF ='+RemoveAcentos(QuotedStr(DM.cdsveiculoUF.AsString))+
                                    ' AND upper(M.nome) ='+RemoveAcentos(QuotedStr(DBEdit9.Text));
      DM.cdsDinamica.Open;
      //Pesquisa(DM.cdsDinamica,['NOME','UF'],['Municipios','Estado'],[50,2],'','','','','Municipios','Municipios');
      DM.cdsveiculoCOD_MUNIC.AsString := DM.cdsDinamica.Fields[0].AsString;
      DBComboBox2.Enabled := False;
      DBEdit11.SetFocus;
    end
    else
    begin
      DBComboBox2.Enabled := True;
      DBComboBox2.SetFocus;
    end;
  end;
end;

function TfrmCadVeiculo.cgc(num: string): boolean;
var
 n1,n2,n3,n4,n5,n6,n7,n8,n9,n10,n11,n12: integer;
 d1,d2: integer;
 digitado, calculado: string;
begin
 n1:=StrToInt(num[1]);
 n2:=StrToInt(num[2]);
 n3:=StrToInt(num[3]);
 n4:=StrToInt(num[4]);  // Retira cada numero do Edit, e joda p/ variavel
 n5:=StrToInt(num[5]);
 n6:=StrToInt(num[6]);
 n7:=StrToInt(num[7]);
 n8:=StrToInt(num[8]);
 n9:=StrToInt(num[9]);
 n10:=StrToInt(num[10]);
 n11:=StrToInt(num[11]);
 n12:=StrToInt(num[12]);
 d1:=n12*2+n11*3+n10*4+n9*5+n8*6+n7*7+n6*8+n5*9+n4*2+n3*3+n2*4+n1*5;
 d1:=11-(d1 mod 11);
 if d1>=10 then d1:=0;
 d2:=d1*2+n12*3+n11*4+n10*5+n9*6+n8*7+n7*8+n6*9+n5*2+n4*3+n3*4+n2*5+n1*6;
 d2:=11-(d2 mod 11);
 if d2>=10 then d2:=0;
 calculado:=inttostr(d1)+inttostr(d2);
 digitado:=num[13]+num[14];
 if calculado=digitado then
   cgc:=true
  else
   cgc:=false;

end;

function TfrmCadVeiculo.ColocaTextoDir(Texto: string; Qtd: integer;
  Ch: Char): string;
var
  x: integer;
  str: string;
begin
  if  Length(Texto) > Qtd then
      Result := Copy( Texto, (Length(Texto)-Qtd) + 1, Length(Texto) )
  else
    begin
      str := '';
      for x := Length(Texto) to Qtd - 1 do
      begin
        str := str + Ch;
      end;
      Result := str + Texto;
    end
  {endif};

end;

procedure TfrmCadVeiculo.ConsultaCNPJ;
begin
  frmConsultaCNPJ.ClienteFornecedor := 'veiculo';
  frmConsultaCNPJ.ShowModal;
end;

procedure TfrmCadVeiculo.ConsultaCPF;
begin
  frmConsultaCPF.ClienteVendedor := 'veiculo';
  frmConsultaCPF.ShowModal;
end;

function TfrmCadVeiculo.cpf(num: string): boolean;
var
 n1,n2,n3,n4,n5,n6,n7,n8,n9: integer;
 d1,d2: integer;
 digitado, calculado: string;
begin
 n1:=StrToInt(num[1]);
 n2:=StrToInt(num[2]);
 n3:=StrToInt(num[3]);
 n4:=StrToInt(num[4]);
 n5:=StrToInt(num[5]);
 n6:=StrToInt(num[6]);
 n7:=StrToInt(num[7]);
 n8:=StrToInt(num[8]);
 n9:=StrToInt(num[9]);
 d1:=n9*2+n8*3+n7*4+n6*5+n5*6+n4*7+n3*8+n2*9+n1*10;
 d1:=11-(d1 mod 11);
 if d1>=10 then d1:=0;
 d2:=d1*2+n9*3+n8*4+n7*5+n6*6+n5*7+n4*8+n3*9+n2*10+n1*11;
 d2:=11-(d2 mod 11);
 if d2>=10 then d2:=0;
 calculado:=inttostr(d1)+inttostr(d2);
 digitado:=num[10]+num[11];
 if calculado=digitado then
   cpf:=true
  else
   cpf:=false;
end;

procedure TfrmCadVeiculo.DBComboBox1Exit(Sender: TObject);
begin

  if Tipo = 'Cancelar' then
  begin
    DM.cdsveiculo.Cancel;
    GerenCiaBotoes;
    Exit;
  end;

  if DBComboBox1.Text = '' then
  begin
    ShowMessage('Favor Informar Tipo de Pessoa.');
    DBComboBox1.SetFocus;
    Exit;
  end;
end;

procedure TfrmCadVeiculo.DBComboBox2Exit(Sender: TObject);
begin
  if DBComboBox2.Text = '' then
  begin
    ShowMessage('Informe o Estado');
    DBComboBox2.SetFocus;
  end
  else
  begin
    DM.cdsDinamica.Close;
    DM.cdsDinamica.IndexFieldNames:='';
    DM.cdsDinamica.CommandText := 'SELECT M.COD_MUNIC,M.nome,M.UF FROM TB_MUNICIPIOS M WHERE M.UF ='+QuotedStr(DM.cdsveiculoUF.AsString);
    DM.cdsDinamica.Open;
    Pesquisa(DM.cdsDinamica,['NOME','UF'],['Municipios','Estado'],[50,2],'','','','','Municipios','Municipios');
    DM.cdsveiculoCOD_MUNIC.AsString := DM.cdsDinamica.Fields[0].AsString;
    DM.cdsveiculoCIDADE.AsString := DM.cdsDinamica.Fields[1].AsString;
    dbedit10.SetFocus;
  end;

end;

procedure TfrmCadVeiculo.DBEdit15Enter(Sender: TObject);
begin
  DM.cdsveiculoTELEFONE.EditMask:= '(##)#####-####';
end;

procedure TfrmCadVeiculo.DBEdit1Enter(Sender: TObject);
begin
  if DBComboBox1.Text = 'Juridica' then
  begin
    L_CPF_CNPJ.Caption := 'CNPJ';
    L_NOME.Caption := 'Raz„o Social';
//    L_RG.Caption   := 'Insc.Estadual';
    DM.cdsVeiculoCPF_CNPJ.EditMask := '##.###.###/####-##';
    DBComboBox1.Text := 'Juridica';
  end
  else
  begin
    L_CPF_CNPJ.Caption := 'C.P.F';
    L_NOME.Caption := 'Nome Completo';
//    L_RG.Caption   := 'RG';
    DM.cdsVeiculoCPF_CNPJ.EditMask := '###.###.###-##';
    DBComboBox1.Text := 'Fisica';
  end;
end;

procedure TfrmCadVeiculo.DBEdit1Exit(Sender: TObject);
//var
//i,j : integer;
//texto,textofinal,result:string;

begin
  if DBEdit1.Text='' then
  begin
    dbedit1.Text := ACBrValidador1.Formatar ;
    DBEdit2.SetFocus;
  end;

  if DBEdit1.Text <> '000.000.000-00' then
  begin
    ACBrValidador1.Documento   := DBEdit1.Text ;
    //ACBrValidador1.Complemento := edComple.Text ;
    //ACBrValidador1.IgnorarChar := edIgnorar.Text ;

    if ACBrValidador1.Validar then
    begin
       //mMsgErro.Text := 'Documento OK'
    end
    else
    begin
       ShowMessage(ACBrValidador1.MsgErro);
       DBEdit1.SetFocus;
    end;
  end;




{texto := dbedit1.text;
textofinal := '';
for i:=1 to length(texto) do
begin
 if not((copy(texto,i,1) = '-')or(copy(texto,i,1) = '.')or(copy(texto,i,1) = '/')) then
begin
 textofinal := textofinal+copy(texto,i,1);
end;
end;
 result := textofinal;

if ( DM.cdsVeiculoCPF_CNPJ.EditMask = '##.###.###/####-##') or (DM.cdsVeiculoCPF_CNPJ.EditMask = '###.###.###-##') then
 begin
   DM.cdsVeiculoCPF_CNPJ.EditMask := '';
   DBEdit2.SetFocus;
   Exit;
 end;

  DM.cdsVeiculoCPF_CNPJ.EditMask := '';
  if Tipo = 'Cancelar' then
  begin
    DM.cdsveiculo.Cancel;
    GerenCiaBotoes;
    Exit;
  end;
  verificaClienteExiste;

  if (DBEdit1.Text <> ' .  .   /    -  ') and (DBEdit1.Text <> '   .   .   -  ') then
  begin
   if DBComboBox1.Text= 'Juridica' then
   begin
      If not cgc(result) then  //Se a funÁao CGC retornar Falso, Nao libera o Focus
      Begin
        ShowMessage('CNPJ Inv·lido !!');
        DBEdit1.SetFocus;
        Exit;
      END;
   end;

   if DBComboBox1.Text = 'Fisica' then
   begin

      If not cpf(result) then  //Se a funÁao CGC retornar Falso, Nao libera o Focus
      Begin
        ShowMessage('CPF Inv·lido !!');
        DBEdit1.SetFocus;
        Exit;
      END;
   end;
  end
  else
  begin
    ShowMessage('Nenhum N˙mero Informado. Caso Seja Nulo Preencher com Zeros.');
    DBEdit1.SetFocus;
  end;}

end;

procedure TfrmCadVeiculo.DBEdit6Exit(Sender: TObject);
begin
  DBEdit7.SetFocus;
end;

procedure TfrmCadVeiculo.DBEdit7Enter(Sender: TObject);
begin
//  DM.cdsveiculoCEP.EditMask := '#####-###';
end;

procedure TfrmCadVeiculo.DBEdit7Exit(Sender: TObject);
begin
  ACBrCEP1.BuscarPorCEP(DM.cdsveiculoCEP.AsString);
end;

procedure TfrmCadVeiculo.DBMemo1Exit(Sender: TObject);
begin
  BB_GRAVAR.SetFocus;
end;

procedure TfrmCadVeiculo.DBNavigator1Click(Sender: TObject;
  Button: TNavigateBtn);
begin
  if DBComboBox1.Text = 'Juridica' then
  begin
    L_CPF_CNPJ.Caption := 'CNPJ';
    L_NOME.Caption := 'Raz„o Social';
//    L_RG.Caption   := 'Insc.Estadual';
    DBComboBox1.Text := 'Juridica';
  end
  else
  begin
    L_CPF_CNPJ.Caption := 'C.P.F';
    L_NOME.Caption := 'Nome Completo';
//    L_RG.Caption   := 'RG';
    DBComboBox1.Text := 'Fisica';
  end;
end;

procedure TfrmCadVeiculo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if DM.cdsveiculo.State in [dsEdit,dsInsert] then
  begin
    ShowMessage('Favor Salve ou Cancele o Registro Para Sair');
    Abort;
  end
  else
  begin
    Action := caFree;
    frmCadVeiculo := nil;
    DM.cdsveiculo.Close;
  end;
end;

procedure TfrmCadVeiculo.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmCadVeiculo.FormShow(Sender: TObject);
begin
  DM.cdsveiculo.Open;
  GerenCiaBotoes;
  DM.cdsMarcas.Open;
  DM.cdsModelos.Open;
  if DM.cdsveiculo.RecordCount > 0 then
  begin
    if DBComboBox1.Text = 'Juridica' then
    begin
      L_CPF_CNPJ.Caption := 'CNPJ';
      L_NOME.Caption := 'Raz„o Social';
//      L_RG.Caption   := 'Insc.Estadual';
      DBComboBox1.Text := 'Juridica';
    end
    else
    begin
      L_CPF_CNPJ.Caption := 'C.P.F';
      L_NOME.Caption := 'Nome Completo';
//      L_RG.Caption   := 'RG';
      DBComboBox1.Text := 'Fisica';
    end;
  end;
end;

procedure TfrmCadVeiculo.GerenCiaBotoes;
begin
  BB_NOVO.Enabled := not (DM.cdsveiculo.State in dsEditModes);
  BB_GRAVAR.Enabled := NOT BB_NOVO.Enabled;
  BB_EXCLUIR.Enabled := BB_NOVO.Enabled and not (DM.cdsveiculo.IsEmpty);
  BB_CANCELAR.Enabled := BB_GRAVAR.Enabled;
  BB_EDITAR.Enabled := BB_EXCLUIR.Enabled;
  BB_SAIR.Enabled := BB_NOVO.Enabled;
  BB_PESQUISAR.Enabled:= BB_NOVO.Enabled;
  Panel2.Enabled := not BB_NOVO.Enabled;
  Panel3.Enabled := not BB_NOVO.Enabled;
  Panel4.Enabled := not BB_NOVO.Enabled;
end;

procedure TfrmCadVeiculo.SpeedButton1Click(Sender: TObject);
begin
{  if DBComboBox1.Text = 'Juridica' then
    ConsultaCNPJ
  else
    ConsultaCPF;
}
end;

procedure TfrmCadVeiculo.SpeedButton3Click(Sender: TObject);
begin
  Close;
end;

function TfrmCadVeiculo.TiraPontoeVirgula(sTexto: String): String;
var
 Temp_01 : string;
 Temp_03, conta: Integer;
begin
 Conta := 0;
 Temp_03 := length(sTexto);
while conta < temp_03 do
  begin
   Conta := Conta + 1;
    Temp_01 := Copy(Stexto,conta,1);
  if Temp_01 = '.' then
 begin
  sTexto := Copy(sTexto,1,(Conta - 1))+ Copy(sTexto,(Conta + 1),(Temp_03 - Conta));
end;
if Temp_01 = ',' then
 begin
  sTexto := Copy(sTexto,1,(Conta - 1))+ Copy(sTexto,(Conta + 1),(Temp_03 - Conta));
end;
if Temp_01 = '/' then
 begin
  sTexto := Copy(sTexto,1,(Conta - 1))+ Copy(sTexto,(Conta + 1),(Temp_03 - Conta));
end;
if Temp_01 = '-' then
 begin
  sTexto := Copy(sTexto,1,(Conta - 1))+ Copy(sTexto,(Conta + 1),(Temp_03 - Conta));
end;

end;
Result := sTexto;
end;

procedure TfrmCadVeiculo.verificaClienteExiste;
var
Codigo, Nome : string;
begin
  if Tipo = 'Insert' then
  begin
    DM.cdsDinamica.Close;
    DM.cdsDinamica.IndexFieldNames:='';
    DM.cdsDinamica.CommandText:='SELECT C.ID_CLIENTE,C.NOME FROM TB_CLIENTE C WHERE C.CNPJ_CPF ='+QuotedStr(DBEdit1.Text);
    DM.cdsDinamica.Open;

    codigo:= DM.cdsDinamica.Fields[0].AsString;
    Nome  := DM.cdsDinamica.Fields[1].AsString;
    if DM.cdsDinamica.IsEmpty then
    begin

    end
    else
    begin
      ShowMessage('       Cliente J· Cadastrado :   '+#13+
                  '                                      '+#13+
                  'CÛdigo '+Codigo+' Nome : '+Nome);
      DBEdit1.SetFocus;
    end;
  end;
end;

end.
