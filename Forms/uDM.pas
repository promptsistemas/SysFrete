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
    qUsuarioSENHA: TStringField;
    qUsuarioNIVEL: TSmallintField;
    dspUsuario: TDataSetProvider;
    cdsUsuario: TClientDataSet;
    cdsUsuarioID_USUARIO: TIntegerField;
    cdsUsuarioSENHA: TStringField;
    cdsUsuarioNIVEL: TSmallintField;
    dsUsuario: TDataSource;
    qDinamica: TSQLQuery;
    dspDinamica: TDataSetProvider;
    cdsDinamica: TClientDataSet;
    dsDinamica: TDataSource;
    DataSource2: TDataSource;
    ClientDataSet2: TClientDataSet;
    DataSetProvider2: TDataSetProvider;
    SQLQuery2: TSQLQuery;
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
      Application.MessageBox( 'N�o foi possivel conectar com o banco de dados.' + #13 +
                              'verifique se o arquivo de configura��o est� configurado, ' + #13 +
                              'Tente Novamente ou Entre em contato com suporte para esclarecer qualquer d�vida.',
                              'Error Interno',mb_ok + mb_IconError );
        Application.Terminate;
    end;
  end;

end;

end.