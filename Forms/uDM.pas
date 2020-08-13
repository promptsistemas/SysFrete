unit uDM;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.SqlExpr, Data.DBXFirebird,IniFiles,
  Windows,Menus,Controls,Forms, Data.FMTBcd, Datasnap.DBClient,
  Datasnap.Provider;

type
  TDM = class(TDataModule)
    Conexao: TSQLConnection;
    qUsuario: TSQLQuery;
    qUsuarioID_USUARIO: TIntegerField;
    qUsuarioNIVEL: TSmallintField;
    dspUsuario: TDataSetProvider;
    cdsUsuario: TClientDataSet;
    cdsUsuarioID_USUARIO: TIntegerField;
    cdsUsuarioNIVEL: TSmallintField;
    dsUsuario: TDataSource;
    dsVeiculo: TDataSource;
    cdsVeiculo: TClientDataSet;
    dspVeiculo: TDataSetProvider;
    qVeiculo: TSQLQuery;
    sds_Tabela: TSQLDataSet;
    dsp_Tabela: TDataSetProvider;
    cds_Tabela: TClientDataSet;
    ds_Tabela: TDataSource;
    qUsuarioLOGIN: TStringField;
    cdsUsuarioLOGIN: TStringField;
    dsCliente: TDataSource;
    cdsCliente: TClientDataSet;
    dspCliente: TDataSetProvider;
    qCliente: TSQLQuery;
    qClienteID_CLIENTE: TIntegerField;
    qClienteCOD_MUNIC: TStringField;
    qClienteNOME: TStringField;
    qClienteCNPJ_CPF: TStringField;
    qClienteINSC_RG: TStringField;
    qClienteENDERECO: TStringField;
    qClienteNUMERO: TStringField;
    qClienteCOMPLEMENTO: TStringField;
    qClienteBAIRRO: TStringField;
    qClienteTELEFONE: TStringField;
    qClienteTP_PESSOA: TStringField;
    qClienteCEP: TStringField;
    qClienteDT_CADASTRO: TDateField;
    qClienteEMAIL: TStringField;
    qClienteCONTATO: TStringField;
    qClienteATIVO: TStringField;
    qClienteOBS: TStringField;
    qClienteCIDADE: TStringField;
    qClienteUF: TStringField;
    cdsClienteID_CLIENTE: TIntegerField;
    cdsClienteCOD_MUNIC: TStringField;
    cdsClienteNOME: TStringField;
    cdsClienteCNPJ_CPF: TStringField;
    cdsClienteINSC_RG: TStringField;
    cdsClienteENDERECO: TStringField;
    cdsClienteNUMERO: TStringField;
    cdsClienteCOMPLEMENTO: TStringField;
    cdsClienteBAIRRO: TStringField;
    cdsClienteTELEFONE: TStringField;
    cdsClienteTP_PESSOA: TStringField;
    cdsClienteCEP: TStringField;
    cdsClienteDT_CADASTRO: TDateField;
    cdsClienteEMAIL: TStringField;
    cdsClienteCONTATO: TStringField;
    cdsClienteATIVO: TStringField;
    cdsClienteOBS: TStringField;
    cdsClienteCIDADE: TStringField;
    cdsClienteUF: TStringField;
    qClienteDT_FUNDACAO: TDateField;
    qClienteTEL_COMERCIAL: TStringField;
    qClienteWHATSAPP: TStringField;
    qClienteBLOQUEIO: TStringField;
    cdsClienteDT_FUNDACAO: TDateField;
    cdsClienteTEL_COMERCIAL: TStringField;
    cdsClienteWHATSAPP: TStringField;
    cdsClienteBLOQUEIO: TStringField;
    dsMotorista: TDataSource;
    cdsMotorista: TClientDataSet;
    dspMotorista: TDataSetProvider;
    qMotorista: TSQLQuery;
    qMotoristaID_MOTORISTA: TIntegerField;
    qMotoristaCOD_MUNIC: TStringField;
    qMotoristaNOME: TStringField;
    qMotoristaENDERECO: TStringField;
    qMotoristaBAIRRO: TStringField;
    qMotoristaNUMERO: TStringField;
    qMotoristaCOMPLEMENTO: TStringField;
    qMotoristaCPF: TStringField;
    qMotoristaRG: TStringField;
    qMotoristaDT_CADASTRO: TDateField;
    qMotoristaTELEFONE: TStringField;
    qMotoristaATIVO: TStringField;
    qMotoristaOBS: TStringField;
    qMotoristaCIDADE: TStringField;
    qMotoristaUF: TStringField;
    cdsMotoristaID_MOTORISTA: TIntegerField;
    cdsMotoristaCOD_MUNIC: TStringField;
    cdsMotoristaNOME: TStringField;
    cdsMotoristaENDERECO: TStringField;
    cdsMotoristaBAIRRO: TStringField;
    cdsMotoristaNUMERO: TStringField;
    cdsMotoristaCOMPLEMENTO: TStringField;
    cdsMotoristaCPF: TStringField;
    cdsMotoristaRG: TStringField;
    cdsMotoristaDT_CADASTRO: TDateField;
    cdsMotoristaTELEFONE: TStringField;
    cdsMotoristaATIVO: TStringField;
    cdsMotoristaOBS: TStringField;
    cdsMotoristaCIDADE: TStringField;
    cdsMotoristaUF: TStringField;
    dsMarcas: TDataSource;
    cdsMarcas: TClientDataSet;
    dspMarcas: TDataSetProvider;
    qMarcas: TSQLQuery;
    qMarcasID_MARCA: TIntegerField;
    qMarcasNOME: TStringField;
    cdsMarcasID_MARCA: TIntegerField;
    cdsMarcasNOME: TStringField;
    dsModelos: TDataSource;
    cdsModelos: TClientDataSet;
    dspModelos: TDataSetProvider;
    qModelos: TSQLQuery;
    qModelosID_MODELO: TIntegerField;
    qModelosDESCRICAO: TStringField;
    cdsModelosID_MODELO: TIntegerField;
    cdsModelosDESCRICAO: TStringField;
    dsFrete: TDataSource;
    cdsFrete: TClientDataSet;
    dspFrete: TDataSetProvider;
    qFrete: TSQLQuery;
    qVeiculoID_VEICULO: TIntegerField;
    qVeiculoID_MARCA: TIntegerField;
    qVeiculoID_MODELO: TIntegerField;
    qVeiculoUF_PLACA: TStringField;
    qVeiculoCOR: TStringField;
    qVeiculoCHASSI: TStringField;
    qVeiculoRNTC_ANTT: TStringField;
    qVeiculoPLACA_CARRETA: TStringField;
    qVeiculoUF_PLACA_CARRETA: TStringField;
    qVeiculoPROPIETARIO: TStringField;
    qVeiculoCPF_CNPJ: TStringField;
    qVeiculoENDERECO: TStringField;
    qVeiculoNUMERO: TStringField;
    qVeiculoBAIRRO: TStringField;
    qVeiculoCOMPLEMENTO: TStringField;
    qVeiculoTELEFONE: TStringField;
    qVeiculoCEP: TStringField;
    qVeiculoDT_ULT_MANU: TDateField;
    qVeiculoRENAVAM: TStringField;
    qVeiculoMARCA: TStringField;
    qVeiculoMODELO: TStringField;
    cdsVeiculoID_VEICULO: TIntegerField;
    cdsVeiculoID_MARCA: TIntegerField;
    cdsVeiculoID_MODELO: TIntegerField;
    cdsVeiculoUF_PLACA: TStringField;
    cdsVeiculoCOR: TStringField;
    cdsVeiculoCHASSI: TStringField;
    cdsVeiculoRNTC_ANTT: TStringField;
    cdsVeiculoPLACA_CARRETA: TStringField;
    cdsVeiculoUF_PLACA_CARRETA: TStringField;
    cdsVeiculoPROPIETARIO: TStringField;
    cdsVeiculoCPF_CNPJ: TStringField;
    cdsVeiculoENDERECO: TStringField;
    cdsVeiculoNUMERO: TStringField;
    cdsVeiculoBAIRRO: TStringField;
    cdsVeiculoCOMPLEMENTO: TStringField;
    cdsVeiculoTELEFONE: TStringField;
    cdsVeiculoCEP: TStringField;
    cdsVeiculoDT_ULT_MANU: TDateField;
    cdsVeiculoRENAVAM: TStringField;
    cdsVeiculoMARCA: TStringField;
    cdsVeiculoMODELO: TStringField;
    qVeiculoCOD_MUNIC: TStringField;
    qVeiculoCIDADE: TStringField;
    qVeiculoUF: TStringField;
    cdsVeiculoCOD_MUNIC: TStringField;
    cdsVeiculoCIDADE: TStringField;
    cdsVeiculoUF: TStringField;
    qVeiculoANO_MODELO: TStringField;
    qVeiculoANO_FABRICACAO: TStringField;
    cdsVeiculoANO_MODELO: TStringField;
    cdsVeiculoANO_FABRICACAO: TStringField;
    dsDinamica: TDataSource;
    cdsDinamica: TClientDataSet;
    dspDinamica: TDataSetProvider;
    qDinamica: TSQLQuery;
    qUsuarioSENHA: TStringField;
    cdsUsuarioSENHA: TStringField;
    dsItemFrete: TDataSource;
    cdsItemFrete: TClientDataSet;
    dspItemFrete: TDataSetProvider;
    qItemFrete: TSQLQuery;
    qFreteCOD_MUNIC_ORIGEM: TStringField;
    qFreteCOD_MUNIC_DESTINO: TStringField;
    qFreteID_MARCA: TIntegerField;
    qFreteID_MODELO: TIntegerField;
    qFreteID_MOTORISTA: TIntegerField;
    qFreteID_CLIENTE: TIntegerField;
    qFreteDT_PARTIDA: TDateField;
    qFreteKM_INICIO: TIntegerField;
    qFreteKM_FIM: TIntegerField;
    qFreteNR_NOTA: TStringField;
    qFreteVL_FRETE: TFMTBCDField;
    qFretePESO_BRUTO: TFMTBCDField;
    qFretePESO_LIQ: TFMTBCDField;
    qFreteVL_CUSTO_FRETE: TFMTBCDField;
    qFreteSTATUS: TStringField;
    qFreteUF_ORIGEM: TStringField;
    qFreteCIDADE_ORIGEM: TStringField;
    qFreteUF_DESTINO: TStringField;
    qFreteCIDADE_DESTINO: TStringField;
    qFreteUF_CLIENTE: TStringField;
    qFreteCIDADE_CLIENTE: TStringField;
    qFreteCLIENTE: TStringField;
    qFreteCNPJ_CPF: TStringField;
    qFreteINSC_RG: TStringField;
    qFreteENDERECO: TStringField;
    qFreteNUMERO: TStringField;
    qFreteCOMPLEMENTO: TStringField;
    qFreteBAIRRO: TStringField;
    qFreteTELEFONE: TStringField;
    qFreteCEP: TStringField;
    qFreteTEL_COMERCIAL: TStringField;
    qFreteMARCA: TStringField;
    qFreteMODELO: TStringField;
    qFreteMOTORISTA: TStringField;
    qFreteTEL_MOT: TStringField;
    cdsFreteCOD_MUNIC_ORIGEM: TStringField;
    cdsFreteCOD_MUNIC_DESTINO: TStringField;
    cdsFreteID_MARCA: TIntegerField;
    cdsFreteID_MODELO: TIntegerField;
    cdsFreteID_MOTORISTA: TIntegerField;
    cdsFreteID_CLIENTE: TIntegerField;
    cdsFreteDT_PARTIDA: TDateField;
    cdsFreteKM_INICIO: TIntegerField;
    cdsFreteKM_FIM: TIntegerField;
    cdsFreteNR_NOTA: TStringField;
    cdsFreteVL_FRETE: TFMTBCDField;
    cdsFretePESO_BRUTO: TFMTBCDField;
    cdsFretePESO_LIQ: TFMTBCDField;
    cdsFreteVL_CUSTO_FRETE: TFMTBCDField;
    cdsFreteSTATUS: TStringField;
    cdsFreteUF_ORIGEM: TStringField;
    cdsFreteCIDADE_ORIGEM: TStringField;
    cdsFreteUF_DESTINO: TStringField;
    cdsFreteCIDADE_DESTINO: TStringField;
    cdsFreteUF_CLIENTE: TStringField;
    cdsFreteCIDADE_CLIENTE: TStringField;
    cdsFreteCLIENTE: TStringField;
    cdsFreteCNPJ_CPF: TStringField;
    cdsFreteINSC_RG: TStringField;
    cdsFreteENDERECO: TStringField;
    cdsFreteNUMERO: TStringField;
    cdsFreteCOMPLEMENTO: TStringField;
    cdsFreteBAIRRO: TStringField;
    cdsFreteTELEFONE: TStringField;
    cdsFreteCEP: TStringField;
    cdsFreteTEL_COMERCIAL: TStringField;
    cdsFreteMARCA: TStringField;
    cdsFreteMODELO: TStringField;
    cdsFreteMOTORISTA: TStringField;
    cdsFreteTEL_MOT: TStringField;
    qFreteID_FRETE: TIntegerField;
    cdsFreteID_FRETE: TIntegerField;
    dsServico: TDataSource;
    cdsServico: TClientDataSet;
    dspServico: TDataSetProvider;
    qServico: TSQLQuery;
    qItemFreteID_ITEM_FRETE: TIntegerField;
    qItemFreteID_SERVICO: TIntegerField;
    qItemFreteQUANT: TIntegerField;
    qItemFreteVL_UNIT: TFMTBCDField;
    qItemFreteTOTAL: TFMTBCDField;
    qItemFreteSERVICO: TStringField;
    qItemFreteVL_SERVICO: TFMTBCDField;
    cdsItemFreteID_ITEM_FRETE: TIntegerField;
    cdsItemFreteID_SERVICO: TIntegerField;
    cdsItemFreteQUANT: TIntegerField;
    cdsItemFreteVL_UNIT: TFMTBCDField;
    cdsItemFreteTOTAL: TFMTBCDField;
    cdsItemFreteSERVICO: TStringField;
    cdsItemFreteVL_SERVICO: TFMTBCDField;
    qItemFreteID_FRETE: TIntegerField;
    cdsItemFreteID_FRETE: TIntegerField;
    qFreteOBS: TStringField;
    cdsFreteOBS: TStringField;
    qFreteDT_RETORNO: TDateField;
    cdsFreteDT_RETORNO: TDateField;
    qFreteID_VEICULO: TIntegerField;
    qFreteUF_PLACA: TStringField;
    qFretePLACA_CARRETA: TStringField;
    qFreteCHASSI: TStringField;
    qFreteANO_MODELO: TStringField;
    qFreteANO_FABRICACAO: TStringField;
    qFreteCOR: TStringField;
    cdsFreteID_VEICULO: TIntegerField;
    cdsFreteUF_PLACA: TStringField;
    cdsFretePLACA_CARRETA: TStringField;
    cdsFreteCHASSI: TStringField;
    cdsFreteANO_MODELO: TStringField;
    cdsFreteANO_FABRICACAO: TStringField;
    cdsFreteCOR: TStringField;
    DataSource2: TDataSource;
    ClientDataSet2: TClientDataSet;
    DataSetProvider2: TDataSetProvider;
    SQLQuery2: TSQLQuery;
    qServicoID_SERVICO: TIntegerField;
    qServicoDESCRICAO: TStringField;
    qServicoVL_UNIT: TFMTBCDField;
    cdsServicoID_SERVICO: TIntegerField;
    cdsServicoDESCRICAO: TStringField;
    cdsServicoVL_UNIT: TFMTBCDField;
    qFreteVL_NOTA: TFMTBCDField;
    cdsFreteVL_NOTA: TFMTBCDField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    IniControle : TIniFile;
    CAIXA,LOJA,IMPRESSORA,LOGO,EXPORTA,CONFIGURADO,TABELA_PRECO, VENDEDOR,BALANCA : string;

  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDM.DataModuleCreate(Sender: TObject);
begin
  if Conexao.Connected = True then
     Conexao.Connected := False;
  if (not Conexao.Connected ) then
  begin
    try
      IniControle := TIniFile.Create(ExtractFilePath(Application.ExeName)+'CONFIG.INI');
      if Trim(IniControle.ReadString('SERVIDOR', 'DADOS', '')) <> '' then
      begin
        Conexao.Params.Clear;
        Conexao.Params.Values['DATABASE'] := Inicontrole.ReadString('SERVIDOR','DADOS','');
        Conexao.Params.Values['User_Name'] := Inicontrole.ReadString('SERVIDOR','User_Name','');
        Conexao.Params.Values['PASSWORD'] := Inicontrole.ReadString('SERVIDOR','PASSWORD','masterkey');
        Conexao.Params.Values['SQLDialect'] := Trim(Inicontrole.ReadString('SERVIDOR','SQLDialect','3'));
        Conexao.connected:= true;
        Inicontrole.Free;
      end;
    except
      Application.MessageBox( 'Não foi possivel conectar com o banco de dados.' + #13 +
                              'verifique se o arquivo de configuração está configurado, ' + #13 +
                              'Tente Novamente ou Entre em contato com suporte para esclarecer qualquer dúvida.',
                              'Error Interno',mb_ok + mb_IconError );
        Application.Terminate;
    end;
  end;

end;

end.
