object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 509
  Width = 809
  object Conexao: TSQLConnection
    ConnectionName = 'FBConnection'
    DriverName = 'Firebird'
    LoginPrompt = False
    Params.Strings = (
      'DriverUnit=Data.DBXFirebird'
      
        'DriverPackageLoader=TDBXDynalinkDriverLoader,DbxCommonDriver260.' +
        'bpl'
      
        'DriverAssemblyLoader=Borland.Data.TDBXDynalinkDriverLoader,Borla' +
        'nd.Data.DbxCommonDriver,Version=24.0.0.0,Culture=neutral,PublicK' +
        'eyToken=91d62ebb5b0d1b1b'
      
        'MetaDataPackageLoader=TDBXFirebirdMetaDataCommandFactory,DbxFire' +
        'birdDriver260.bpl'
      
        'MetaDataAssemblyLoader=Borland.Data.TDBXFirebirdMetaDataCommandF' +
        'actory,Borland.Data.DbxFirebirdDriver,Version=24.0.0.0,Culture=n' +
        'eutral,PublicKeyToken=91d62ebb5b0d1b1b'
      'GetDriverFunc=getSQLDriverINTERBASE'
      'LibraryName=dbxfb.dll'
      'LibraryNameOsx=libsqlfb.dylib'
      'VendorLib=fbclient.dll'
      'VendorLibWin64=fbclient.dll'
      'VendorLibOsx=/Library/Frameworks/Firebird.framework/Firebird'
      'Role=RoleName'
      'MaxBlobSize=-1'
      'TrimChar=False'
      'DriverName=Firebird'
      'Database=C:\SysFrete\bdados\BDADOS.FDB'
      'RoleName=RoleName'
      'User_Name=sysdba'
      'Password=masterkey'
      'ServerCharSet='
      'SQLDialect=3'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'BlobSize=-1'
      'CommitRetain=False'
      'WaitOnLocks=True'
      'IsolationLevel=ReadCommitted'
      'Trim Char=False')
    Left = 48
    Top = 32
  end
  object qUsuario: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT'
      ' U.ID_USUARIO,'
      ' U.LOGIN,'
      ' U.SENHA,'
      ' U.NIVEL'
      'FROM TB_USUARIO U'
      '')
    SQLConnection = Conexao
    Left = 40
    Top = 80
    object qUsuarioID_USUARIO: TIntegerField
      FieldName = 'ID_USUARIO'
      Required = True
    end
    object qUsuarioNIVEL: TSmallintField
      FieldName = 'NIVEL'
    end
    object qUsuarioLOGIN: TStringField
      FieldName = 'LOGIN'
      Size = 50
    end
    object qUsuarioSENHA: TStringField
      FieldName = 'SENHA'
      Size = 10
    end
  end
  object dspUsuario: TDataSetProvider
    DataSet = qUsuario
    Options = [poIncFieldProps, poAllowMultiRecordUpdates, poAutoRefresh, poAllowCommandText, poUseQuoteChar]
    Left = 72
    Top = 80
  end
  object cdsUsuario: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspUsuario'
    Left = 104
    Top = 80
    object cdsUsuarioID_USUARIO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'ID_USUARIO'
      Required = True
    end
    object cdsUsuarioNIVEL: TSmallintField
      DisplayLabel = 'N'#237'vel'
      FieldName = 'NIVEL'
    end
    object cdsUsuarioLOGIN: TStringField
      FieldName = 'LOGIN'
      Size = 50
    end
    object cdsUsuarioSENHA: TStringField
      FieldName = 'SENHA'
      Size = 10
    end
  end
  object dsUsuario: TDataSource
    DataSet = cdsUsuario
    Left = 136
    Top = 80
  end
  object dsVeiculo: TDataSource
    DataSet = cdsVeiculo
    Left = 344
    Top = 79
  end
  object cdsVeiculo: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspVeiculo'
    Left = 312
    Top = 79
    object cdsVeiculoID_VEICULO: TIntegerField
      FieldName = 'ID_VEICULO'
      Required = True
    end
    object cdsVeiculoID_MARCA: TIntegerField
      FieldName = 'ID_MARCA'
      Required = True
    end
    object cdsVeiculoID_MODELO: TIntegerField
      FieldName = 'ID_MODELO'
      Required = True
    end
    object cdsVeiculoUF_PLACA: TStringField
      FieldName = 'UF_PLACA'
      FixedChar = True
      Size = 2
    end
    object cdsVeiculoCOR: TStringField
      FieldName = 'COR'
      FixedChar = True
      Size = 18
    end
    object cdsVeiculoCHASSI: TStringField
      FieldName = 'CHASSI'
      FixedChar = True
      Size = 30
    end
    object cdsVeiculoRNTC_ANTT: TStringField
      FieldName = 'RNTC_ANTT'
      FixedChar = True
      Size = 30
    end
    object cdsVeiculoPLACA_CARRETA: TStringField
      FieldName = 'PLACA_CARRETA'
      FixedChar = True
      Size = 18
    end
    object cdsVeiculoUF_PLACA_CARRETA: TStringField
      FieldName = 'UF_PLACA_CARRETA'
      FixedChar = True
      Size = 18
    end
    object cdsVeiculoPROPIETARIO: TStringField
      FieldName = 'PROPIETARIO'
      Size = 30
    end
    object cdsVeiculoCPF_CNPJ: TStringField
      FieldName = 'CPF_CNPJ'
      Size = 18
    end
    object cdsVeiculoENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 50
    end
    object cdsVeiculoNUMERO: TStringField
      FieldName = 'NUMERO'
      FixedChar = True
      Size = 18
    end
    object cdsVeiculoBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 40
    end
    object cdsVeiculoCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Size = 30
    end
    object cdsVeiculoTELEFONE: TStringField
      FieldName = 'TELEFONE'
      FixedChar = True
      Size = 14
    end
    object cdsVeiculoCEP: TStringField
      FieldName = 'CEP'
      FixedChar = True
      Size = 14
    end
    object cdsVeiculoDT_ULT_MANU: TDateField
      FieldName = 'DT_ULT_MANU'
    end
    object cdsVeiculoRENAVAM: TStringField
      FieldName = 'RENAVAM'
      FixedChar = True
      Size = 30
    end
    object cdsVeiculoMARCA: TStringField
      FieldName = 'MARCA'
      ProviderFlags = []
      Size = 50
    end
    object cdsVeiculoMODELO: TStringField
      FieldName = 'MODELO'
      Size = 50
    end
    object cdsVeiculoCOD_MUNIC: TStringField
      FieldName = 'COD_MUNIC'
      Size = 7
    end
    object cdsVeiculoCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 35
    end
    object cdsVeiculoUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
    object cdsVeiculoANO_MODELO: TStringField
      FieldName = 'ANO_MODELO'
      Size = 4
    end
    object cdsVeiculoANO_FABRICACAO: TStringField
      FieldName = 'ANO_FABRICACAO'
      Size = 4
    end
  end
  object dspVeiculo: TDataSetProvider
    DataSet = qVeiculo
    Options = [poIncFieldProps, poAllowMultiRecordUpdates, poAutoRefresh, poAllowCommandText, poUseQuoteChar]
    Left = 280
    Top = 79
  end
  object qVeiculo: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT'
      ' V.ID_VEICULO,'
      ' V.ID_MARCA,'
      ' V.ID_MODELO,'
      ' V.UF_PLACA,'
      ' V.ANO_MODELO,'
      ' V.ANO_FABRICACAO,'
      ' V.COR,'
      ' V.CHASSI,'
      ' V.RNTC_ANTT,'
      ' V.PLACA_CARRETA,'
      ' V.UF_PLACA_CARRETA,'
      ' V.PROPIETARIO,'
      ' V.CPF_CNPJ,'
      ' V.ENDERECO,'
      ' V.NUMERO,'
      ' V.BAIRRO,'
      ' V.COMPLEMENTO,'
      ' V.TELEFONE,'
      ' V.CEP,'
      ' V.DT_ULT_MANU,'
      ' V.RENAVAM,'
      ' V.COD_MUNIC,'
      ' M.NOME AS MARCA,'
      ' O.DESCRICAO AS MODELO,'
      ' C.NOME AS CIDADE,'
      ' C.UF AS UF'
      'FROM TB_VEICULO V'
      'JOIN TB_MARCA M ON (M.ID_MARCA = V.ID_MARCA)'
      'JOIN TB_MODELO O ON (O.ID_MODELO = V.ID_MODELO)'
      'JOIN TB_MUNICIPIOS C ON (C.CODIGO_MUNIC = V.COD_MUNIC)')
    SQLConnection = Conexao
    Left = 248
    Top = 79
    object qVeiculoID_VEICULO: TIntegerField
      FieldName = 'ID_VEICULO'
      Required = True
    end
    object qVeiculoID_MARCA: TIntegerField
      FieldName = 'ID_MARCA'
      Required = True
    end
    object qVeiculoID_MODELO: TIntegerField
      FieldName = 'ID_MODELO'
      Required = True
    end
    object qVeiculoUF_PLACA: TStringField
      FieldName = 'UF_PLACA'
      FixedChar = True
      Size = 2
    end
    object qVeiculoCOR: TStringField
      FieldName = 'COR'
      FixedChar = True
      Size = 18
    end
    object qVeiculoCHASSI: TStringField
      FieldName = 'CHASSI'
      FixedChar = True
      Size = 30
    end
    object qVeiculoRNTC_ANTT: TStringField
      FieldName = 'RNTC_ANTT'
      FixedChar = True
      Size = 30
    end
    object qVeiculoPLACA_CARRETA: TStringField
      FieldName = 'PLACA_CARRETA'
      FixedChar = True
      Size = 18
    end
    object qVeiculoUF_PLACA_CARRETA: TStringField
      FieldName = 'UF_PLACA_CARRETA'
      FixedChar = True
      Size = 18
    end
    object qVeiculoPROPIETARIO: TStringField
      FieldName = 'PROPIETARIO'
      Size = 30
    end
    object qVeiculoCPF_CNPJ: TStringField
      FieldName = 'CPF_CNPJ'
      Size = 18
    end
    object qVeiculoENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 50
    end
    object qVeiculoNUMERO: TStringField
      FieldName = 'NUMERO'
      FixedChar = True
      Size = 18
    end
    object qVeiculoBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 40
    end
    object qVeiculoCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Size = 30
    end
    object qVeiculoTELEFONE: TStringField
      FieldName = 'TELEFONE'
      FixedChar = True
      Size = 14
    end
    object qVeiculoCEP: TStringField
      FieldName = 'CEP'
      FixedChar = True
      Size = 14
    end
    object qVeiculoDT_ULT_MANU: TDateField
      FieldName = 'DT_ULT_MANU'
    end
    object qVeiculoRENAVAM: TStringField
      FieldName = 'RENAVAM'
      FixedChar = True
      Size = 30
    end
    object qVeiculoMARCA: TStringField
      FieldName = 'MARCA'
      ProviderFlags = []
      Size = 50
    end
    object qVeiculoMODELO: TStringField
      FieldName = 'MODELO'
      ProviderFlags = []
      Size = 50
    end
    object qVeiculoCOD_MUNIC: TStringField
      FieldName = 'COD_MUNIC'
      Size = 7
    end
    object qVeiculoCIDADE: TStringField
      FieldName = 'CIDADE'
      ProviderFlags = []
      Size = 35
    end
    object qVeiculoUF: TStringField
      FieldName = 'UF'
      ProviderFlags = []
      Size = 2
    end
    object qVeiculoANO_MODELO: TStringField
      FieldName = 'ANO_MODELO'
      Size = 4
    end
    object qVeiculoANO_FABRICACAO: TStringField
      FieldName = 'ANO_FABRICACAO'
      Size = 4
    end
  end
  object sds_Tabela: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Conexao
    Left = 393
    Top = 32
  end
  object dsp_Tabela: TDataSetProvider
    DataSet = sds_Tabela
    Options = [poIncFieldProps, poAllowMultiRecordUpdates, poAutoRefresh, poAllowCommandText]
    Left = 425
    Top = 32
  end
  object cds_Tabela: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp_Tabela'
    Left = 457
    Top = 32
  end
  object ds_Tabela: TDataSource
    DataSet = cds_Tabela
    Left = 489
    Top = 32
  end
  object dsCliente: TDataSource
    DataSet = cdsCliente
    Left = 134
    Top = 127
  end
  object cdsCliente: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCliente'
    Left = 102
    Top = 127
    object cdsClienteID_CLIENTE: TIntegerField
      DisplayLabel = 'C'#243'd.Cli'
      FieldName = 'ID_CLIENTE'
      Required = True
    end
    object cdsClienteCOD_MUNIC: TStringField
      FieldName = 'COD_MUNIC'
      Required = True
    end
    object cdsClienteNOME: TStringField
      DisplayLabel = 'Nome Cliente'
      FieldName = 'NOME'
      Size = 50
    end
    object cdsClienteCNPJ_CPF: TStringField
      DisplayLabel = 'CNPJ/CPF'
      FieldName = 'CNPJ_CPF'
      Size = 18
    end
    object cdsClienteINSC_RG: TStringField
      DisplayLabel = 'INSC/RG'
      FieldName = 'INSC_RG'
      Size = 14
    end
    object cdsClienteENDERECO: TStringField
      DisplayLabel = 'Endere'#231'o'
      FieldName = 'ENDERECO'
      Size = 50
    end
    object cdsClienteNUMERO: TStringField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'NUMERO'
      FixedChar = True
      Size = 18
    end
    object cdsClienteCOMPLEMENTO: TStringField
      DisplayLabel = 'Complemento'
      FieldName = 'COMPLEMENTO'
      Size = 50
    end
    object cdsClienteBAIRRO: TStringField
      DisplayLabel = 'Bairro'
      FieldName = 'BAIRRO'
      Size = 40
    end
    object cdsClienteTELEFONE: TStringField
      DisplayLabel = 'Telefone'
      FieldName = 'TELEFONE'
      Size = 14
    end
    object cdsClienteTP_PESSOA: TStringField
      DisplayLabel = 'Tipo Cli'
      FieldName = 'TP_PESSOA'
      Size = 10
    end
    object cdsClienteCEP: TStringField
      FieldName = 'CEP'
      Size = 10
    end
    object cdsClienteDT_CADASTRO: TDateField
      DisplayLabel = 'Data Cadastro'
      FieldName = 'DT_CADASTRO'
      EditMask = '##/##/####'
    end
    object cdsClienteEMAIL: TStringField
      DisplayLabel = 'e-mail'
      FieldName = 'EMAIL'
      Size = 100
    end
    object cdsClienteCONTATO: TStringField
      DisplayLabel = 'Contato'
      FieldName = 'CONTATO'
      Size = 50
    end
    object cdsClienteATIVO: TStringField
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
      FixedChar = True
      Size = 1
    end
    object cdsClienteOBS: TStringField
      DisplayLabel = 'Obs'
      FieldName = 'OBS'
      FixedChar = True
      Size = 100
    end
    object cdsClienteCIDADE: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'CIDADE'
      ProviderFlags = []
      Size = 35
    end
    object cdsClienteUF: TStringField
      FieldName = 'UF'
      ProviderFlags = []
      Size = 2
    end
    object cdsClienteDT_FUNDACAO: TDateField
      DisplayLabel = 'Data Funda'#231#227'o'
      FieldName = 'DT_FUNDACAO'
      EditMask = '##/##/####'
    end
    object cdsClienteTEL_COMERCIAL: TStringField
      DisplayLabel = 'Tel Comercial'
      FieldName = 'TEL_COMERCIAL'
      Size = 14
    end
    object cdsClienteWHATSAPP: TStringField
      DisplayLabel = 'WhatsApp'
      FieldName = 'WHATSAPP'
      Size = 14
    end
    object cdsClienteBLOQUEIO: TStringField
      DisplayLabel = 'Bloqueio'
      FieldName = 'BLOQUEIO'
      Size = 1
    end
  end
  object dspCliente: TDataSetProvider
    DataSet = qCliente
    Options = [poIncFieldProps, poAllowMultiRecordUpdates, poAutoRefresh, poAllowCommandText, poUseQuoteChar]
    Left = 70
    Top = 127
  end
  object qCliente: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT'
      ' C.ID_CLIENTE,'
      ' C.COD_MUNIC,'
      ' C.NOME,'
      ' C.CNPJ_CPF,'
      ' C.INSC_RG,'
      ' C.ENDERECO,'
      ' C.NUMERO,'
      ' C.COMPLEMENTO,'
      ' C.BAIRRO,'
      ' C.TELEFONE,'
      ' C.TP_PESSOA,'
      ' C.CEP,'
      ' C.DT_CADASTRO,'
      ' C.EMAIL,'
      ' C.CONTATO,'
      ' C.ATIVO,'
      ' C.OBS,'
      ' C.DT_FUNDACAO,'
      ' C.TEL_COMERCIAL,'
      ' C.WHATSAPP,'
      ' C.BLOQUEIO,'
      ' M.NOME AS CIDADE,'
      ' M.UF'
      'FROM TB_CLIENTE C'
      'JOIN TB_MUNICIPIOS M ON (M.CODIGO_MUNIC = C.COD_MUNIC)')
    SQLConnection = Conexao
    Left = 38
    Top = 127
    object qClienteID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
      Required = True
    end
    object qClienteCOD_MUNIC: TStringField
      FieldName = 'COD_MUNIC'
      Required = True
    end
    object qClienteNOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
    object qClienteCNPJ_CPF: TStringField
      FieldName = 'CNPJ_CPF'
      Size = 18
    end
    object qClienteINSC_RG: TStringField
      FieldName = 'INSC_RG'
      Size = 14
    end
    object qClienteENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 50
    end
    object qClienteNUMERO: TStringField
      FieldName = 'NUMERO'
      FixedChar = True
      Size = 18
    end
    object qClienteCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Size = 50
    end
    object qClienteBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 40
    end
    object qClienteTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Size = 14
    end
    object qClienteTP_PESSOA: TStringField
      FieldName = 'TP_PESSOA'
      Size = 10
    end
    object qClienteCEP: TStringField
      FieldName = 'CEP'
      Size = 10
    end
    object qClienteDT_CADASTRO: TDateField
      FieldName = 'DT_CADASTRO'
    end
    object qClienteEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 100
    end
    object qClienteCONTATO: TStringField
      FieldName = 'CONTATO'
      Size = 50
    end
    object qClienteATIVO: TStringField
      FieldName = 'ATIVO'
      FixedChar = True
      Size = 1
    end
    object qClienteOBS: TStringField
      FieldName = 'OBS'
      FixedChar = True
      Size = 100
    end
    object qClienteCIDADE: TStringField
      FieldName = 'CIDADE'
      ProviderFlags = []
      Size = 35
    end
    object qClienteUF: TStringField
      FieldName = 'UF'
      ProviderFlags = []
      Size = 2
    end
    object qClienteDT_FUNDACAO: TDateField
      FieldName = 'DT_FUNDACAO'
    end
    object qClienteTEL_COMERCIAL: TStringField
      FieldName = 'TEL_COMERCIAL'
      Size = 14
    end
    object qClienteWHATSAPP: TStringField
      FieldName = 'WHATSAPP'
      Size = 14
    end
    object qClienteBLOQUEIO: TStringField
      FieldName = 'BLOQUEIO'
      Size = 1
    end
  end
  object dsMotorista: TDataSource
    DataSet = cdsMotorista
    Left = 134
    Top = 173
  end
  object cdsMotorista: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspMotorista'
    Left = 102
    Top = 173
    object cdsMotoristaID_MOTORISTA: TIntegerField
      DisplayLabel = 'C'#243'd. Mot'
      FieldName = 'ID_MOTORISTA'
      Required = True
    end
    object cdsMotoristaCOD_MUNIC: TStringField
      FieldName = 'COD_MUNIC'
      Required = True
    end
    object cdsMotoristaNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Size = 50
    end
    object cdsMotoristaENDERECO: TStringField
      DisplayLabel = 'Endere'#231'o'
      FieldName = 'ENDERECO'
      Size = 50
    end
    object cdsMotoristaBAIRRO: TStringField
      DisplayLabel = 'Bairro'
      FieldName = 'BAIRRO'
      Size = 50
    end
    object cdsMotoristaNUMERO: TStringField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'NUMERO'
      FixedChar = True
      Size = 18
    end
    object cdsMotoristaCOMPLEMENTO: TStringField
      DisplayLabel = 'Complemento'
      FieldName = 'COMPLEMENTO'
      Size = 50
    end
    object cdsMotoristaCPF: TStringField
      FieldName = 'CPF'
      Size = 18
    end
    object cdsMotoristaRG: TStringField
      FieldName = 'RG'
      FixedChar = True
      Size = 14
    end
    object cdsMotoristaDT_CADASTRO: TDateField
      DisplayLabel = 'Data Cadastro'
      FieldName = 'DT_CADASTRO'
      EditMask = '##/##/####'
    end
    object cdsMotoristaTELEFONE: TStringField
      DisplayLabel = 'Telefone'
      FieldName = 'TELEFONE'
      Size = 14
    end
    object cdsMotoristaATIVO: TStringField
      DisplayLabel = 'Ativo'
      FieldName = 'ATIVO'
      FixedChar = True
      Size = 1
    end
    object cdsMotoristaOBS: TStringField
      DisplayLabel = 'Obs'
      FieldName = 'OBS'
      FixedChar = True
      Size = 100
    end
    object cdsMotoristaCIDADE: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'CIDADE'
      ProviderFlags = []
      Size = 35
    end
    object cdsMotoristaUF: TStringField
      FieldName = 'UF'
      ProviderFlags = []
      Size = 2
    end
  end
  object dspMotorista: TDataSetProvider
    DataSet = qMotorista
    Options = [poIncFieldProps, poAllowMultiRecordUpdates, poAutoRefresh, poAllowCommandText, poUseQuoteChar]
    Left = 70
    Top = 173
  end
  object qMotorista: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT'
      ' C.ID_MOTORISTA,'
      ' C.COD_MUNIC,'
      ' C.NOME,'
      ' C.ENDERECO,'
      ' C.BAIRRO,'
      ' C.NUMERO,'
      ' C.COMPLEMENTO,'
      ' C.CPF,'
      ' C.RG,'
      ' C.DT_CADASTRO,'
      ' C.TELEFONE,'
      ' C.ATIVO,'
      ' C.OBS,'
      ' M.NOME AS CIDADE,'
      ' M.UF'
      ''
      'FROM TB_MOTORISTA C'
      'JOIN TB_MUNICIPIOS M ON (M.CODIGO_MUNIC = C.COD_MUNIC)')
    SQLConnection = Conexao
    Left = 38
    Top = 173
    object qMotoristaID_MOTORISTA: TIntegerField
      FieldName = 'ID_MOTORISTA'
      Required = True
    end
    object qMotoristaCOD_MUNIC: TStringField
      FieldName = 'COD_MUNIC'
      Required = True
    end
    object qMotoristaNOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
    object qMotoristaENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 50
    end
    object qMotoristaBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 50
    end
    object qMotoristaNUMERO: TStringField
      FieldName = 'NUMERO'
      FixedChar = True
      Size = 18
    end
    object qMotoristaCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Size = 50
    end
    object qMotoristaCPF: TStringField
      FieldName = 'CPF'
      Size = 18
    end
    object qMotoristaRG: TStringField
      FieldName = 'RG'
      FixedChar = True
      Size = 14
    end
    object qMotoristaDT_CADASTRO: TDateField
      FieldName = 'DT_CADASTRO'
    end
    object qMotoristaTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Size = 14
    end
    object qMotoristaATIVO: TStringField
      FieldName = 'ATIVO'
      FixedChar = True
      Size = 1
    end
    object qMotoristaOBS: TStringField
      FieldName = 'OBS'
      FixedChar = True
      Size = 100
    end
    object qMotoristaCIDADE: TStringField
      FieldName = 'CIDADE'
      ProviderFlags = []
      Size = 35
    end
    object qMotoristaUF: TStringField
      FieldName = 'UF'
      ProviderFlags = []
      Size = 2
    end
  end
  object dsMarcas: TDataSource
    DataSet = cdsMarcas
    Left = 136
    Top = 224
  end
  object cdsMarcas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspMarcas'
    Left = 104
    Top = 224
    object cdsMarcasID_MARCA: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'ID_MARCA'
      Required = True
    end
    object cdsMarcasNOME: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'NOME'
      Size = 50
    end
  end
  object dspMarcas: TDataSetProvider
    DataSet = qMarcas
    Options = [poIncFieldProps, poAllowMultiRecordUpdates, poAutoRefresh, poAllowCommandText, poUseQuoteChar]
    Left = 72
    Top = 224
  end
  object qMarcas: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT'
      ' M.ID_MARCA,'
      ' M.NOME'
      'FROM TB_MARCA M')
    SQLConnection = Conexao
    Left = 40
    Top = 224
    object qMarcasID_MARCA: TIntegerField
      FieldName = 'ID_MARCA'
      Required = True
    end
    object qMarcasNOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
  end
  object dsModelos: TDataSource
    DataSet = cdsModelos
    Left = 136
    Top = 280
  end
  object cdsModelos: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspModelos'
    Left = 104
    Top = 280
    object cdsModelosID_MODELO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'ID_MODELO'
      Required = True
    end
    object cdsModelosDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o Modelo'
      FieldName = 'DESCRICAO'
      Size = 50
    end
  end
  object dspModelos: TDataSetProvider
    DataSet = qModelos
    Options = [poIncFieldProps, poAllowMultiRecordUpdates, poAutoRefresh, poAllowCommandText, poUseQuoteChar]
    Left = 72
    Top = 280
  end
  object qModelos: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT M.ID_MODELO, M.DESCRICAO FROM TB_MODELO M')
    SQLConnection = Conexao
    Left = 40
    Top = 280
    object qModelosID_MODELO: TIntegerField
      FieldName = 'ID_MODELO'
      Required = True
    end
    object qModelosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 50
    end
  end
  object dsFrete: TDataSource
    DataSet = cdsFrete
    Left = 343
    Top = 139
  end
  object cdsFrete: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFrete'
    Left = 311
    Top = 139
    object cdsFreteID_FRETE: TIntegerField
      DisplayLabel = 'N'#186' Frete'
      FieldName = 'ID_FRETE'
      Required = True
    end
    object cdsFreteCOD_MUNIC_ORIGEM: TStringField
      FieldName = 'COD_MUNIC_ORIGEM'
      Required = True
    end
    object cdsFreteCOD_MUNIC_DESTINO: TStringField
      FieldName = 'COD_MUNIC_DESTINO'
      Required = True
    end
    object cdsFreteID_MARCA: TIntegerField
      FieldName = 'ID_MARCA'
      Required = True
    end
    object cdsFreteID_MODELO: TIntegerField
      FieldName = 'ID_MODELO'
      Required = True
    end
    object cdsFreteID_MOTORISTA: TIntegerField
      DisplayLabel = 'C'#243'd.Motorista'
      FieldName = 'ID_MOTORISTA'
      Required = True
    end
    object cdsFreteID_CLIENTE: TIntegerField
      DisplayLabel = 'C'#243'd.Cliente'
      FieldName = 'ID_CLIENTE'
      Required = True
    end
    object cdsFreteDT_PARTIDA: TDateField
      DisplayLabel = 'Data Partida'
      FieldName = 'DT_PARTIDA'
      EditMask = '##/##/####'
    end
    object cdsFreteKM_INICIO: TIntegerField
      DisplayLabel = 'KM Ini'
      FieldName = 'KM_INICIO'
    end
    object cdsFreteKM_FIM: TIntegerField
      DisplayLabel = 'KM Fim'
      FieldName = 'KM_FIM'
    end
    object cdsFreteNR_NOTA: TStringField
      DisplayLabel = 'N'#186' Nota Fiscal'
      FieldName = 'NR_NOTA'
      FixedChar = True
    end
    object cdsFreteVL_FRETE: TFMTBCDField
      DisplayLabel = 'Vl Frete'
      FieldName = 'VL_FRETE'
      DisplayFormat = '###,###0.00'
      EditFormat = '###,###0.00'
      Precision = 18
      Size = 3
    end
    object cdsFretePESO_BRUTO: TFMTBCDField
      DisplayLabel = 'Peso Bruto'
      FieldName = 'PESO_BRUTO'
      DisplayFormat = '###,###0.00'
      EditFormat = '###,###0.000'
      Precision = 18
      Size = 3
    end
    object cdsFretePESO_LIQ: TFMTBCDField
      DisplayLabel = 'Peso Liq'
      FieldName = 'PESO_LIQ'
      DisplayFormat = '###,###0.000'
      EditFormat = '###,###0.000'
      Precision = 18
      Size = 3
    end
    object cdsFreteVL_CUSTO_FRETE: TFMTBCDField
      DisplayLabel = 'Vl Custo Frete'
      FieldName = 'VL_CUSTO_FRETE'
      DisplayFormat = '###,###0.00'
      EditFormat = '###,###0.00'
      Precision = 18
      Size = 3
    end
    object cdsFreteSTATUS: TStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      Size = 1
    end
    object cdsFreteUF_ORIGEM: TStringField
      DisplayLabel = 'UF Origem'
      FieldName = 'UF_ORIGEM'
      ProviderFlags = []
      Size = 2
    end
    object cdsFreteCIDADE_ORIGEM: TStringField
      DisplayLabel = 'Cidade Origem'
      FieldName = 'CIDADE_ORIGEM'
      ProviderFlags = []
      Size = 35
    end
    object cdsFreteUF_DESTINO: TStringField
      DisplayLabel = 'UF Destino'
      FieldName = 'UF_DESTINO'
      ProviderFlags = []
      Size = 2
    end
    object cdsFreteCIDADE_DESTINO: TStringField
      DisplayLabel = 'Cidade Destino'
      FieldName = 'CIDADE_DESTINO'
      ProviderFlags = []
      Size = 35
    end
    object cdsFreteUF_CLIENTE: TStringField
      DisplayLabel = 'UF Cliente'
      FieldName = 'UF_CLIENTE'
      ProviderFlags = []
      Size = 2
    end
    object cdsFreteCIDADE_CLIENTE: TStringField
      DisplayLabel = 'Cidade Cliente'
      FieldName = 'CIDADE_CLIENTE'
      ProviderFlags = []
      Size = 35
    end
    object cdsFreteCLIENTE: TStringField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
      ProviderFlags = []
      Size = 50
    end
    object cdsFreteCNPJ_CPF: TStringField
      FieldName = 'CNPJ_CPF'
      ProviderFlags = []
      Size = 18
    end
    object cdsFreteINSC_RG: TStringField
      FieldName = 'INSC_RG'
      ProviderFlags = []
      Size = 14
    end
    object cdsFreteENDERECO: TStringField
      DisplayLabel = 'Endere'#231'o'
      FieldName = 'ENDERECO'
      ProviderFlags = []
      Size = 50
    end
    object cdsFreteNUMERO: TStringField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'NUMERO'
      ProviderFlags = []
      FixedChar = True
      Size = 18
    end
    object cdsFreteCOMPLEMENTO: TStringField
      DisplayLabel = 'Complemento'
      FieldName = 'COMPLEMENTO'
      ProviderFlags = []
      Size = 50
    end
    object cdsFreteBAIRRO: TStringField
      DisplayLabel = 'Bairro'
      FieldName = 'BAIRRO'
      ProviderFlags = []
      Size = 40
    end
    object cdsFreteTELEFONE: TStringField
      DisplayLabel = 'Telefone'
      FieldName = 'TELEFONE'
      ProviderFlags = []
      Size = 14
    end
    object cdsFreteCEP: TStringField
      FieldName = 'CEP'
      ProviderFlags = []
      Size = 10
    end
    object cdsFreteTEL_COMERCIAL: TStringField
      DisplayLabel = 'Tel'
      FieldName = 'TEL_COMERCIAL'
      ProviderFlags = []
      Size = 14
    end
    object cdsFreteMARCA: TStringField
      DisplayLabel = 'Marca'
      FieldName = 'MARCA'
      ProviderFlags = []
      Size = 50
    end
    object cdsFreteMODELO: TStringField
      DisplayLabel = 'Modelo'
      FieldName = 'MODELO'
      ProviderFlags = []
      Size = 50
    end
    object cdsFreteMOTORISTA: TStringField
      DisplayLabel = 'Motorista'
      FieldName = 'MOTORISTA'
      ProviderFlags = []
      Size = 50
    end
    object cdsFreteTEL_MOT: TStringField
      DisplayLabel = 'Tel Motorista'
      FieldName = 'TEL_MOT'
      ProviderFlags = []
      Size = 14
    end
    object cdsFreteOBS: TStringField
      FieldName = 'OBS'
      Size = 255
    end
    object cdsFreteDT_RETORNO: TDateField
      DisplayLabel = 'Dt Retorno'
      FieldName = 'DT_RETORNO'
      EditMask = '##/##/####'
    end
    object cdsFreteID_VEICULO: TIntegerField
      FieldName = 'ID_VEICULO'
      Required = True
    end
    object cdsFreteUF_PLACA: TStringField
      DisplayLabel = 'UF Placa'
      FieldName = 'UF_PLACA'
      ProviderFlags = []
      FixedChar = True
      Size = 2
    end
    object cdsFretePLACA_CARRETA: TStringField
      DisplayLabel = 'Placa'
      FieldName = 'PLACA_CARRETA'
      ProviderFlags = []
      FixedChar = True
      Size = 18
    end
    object cdsFreteCHASSI: TStringField
      DisplayLabel = 'Chassi'
      FieldName = 'CHASSI'
      ProviderFlags = []
      FixedChar = True
      Size = 30
    end
    object cdsFreteANO_MODELO: TStringField
      DisplayLabel = 'Ano Modelo'
      FieldName = 'ANO_MODELO'
      ProviderFlags = []
      Size = 4
    end
    object cdsFreteANO_FABRICACAO: TStringField
      DisplayLabel = 'Ano fabrica'#231#227'o'
      FieldName = 'ANO_FABRICACAO'
      ProviderFlags = []
      Size = 4
    end
    object cdsFreteCOR: TStringField
      DisplayLabel = 'Cor'
      FieldName = 'COR'
      ProviderFlags = []
      FixedChar = True
      Size = 18
    end
    object cdsFreteVL_NOTA: TFMTBCDField
      DisplayLabel = 'Vl nota'
      FieldName = 'VL_NOTA'
      DisplayFormat = '###,###0.00'
      EditFormat = '###,###0.00'
      Precision = 18
      Size = 3
    end
  end
  object dspFrete: TDataSetProvider
    DataSet = qFrete
    Options = [poIncFieldProps, poAllowMultiRecordUpdates, poAutoRefresh, poAllowCommandText, poUseQuoteChar]
    Left = 279
    Top = 139
  end
  object qFrete: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT'
      ' F.ID_FRETE,'
      ' F.COD_MUNIC_ORIGEM,'
      ' F.COD_MUNIC_DESTINO,'
      ' F.ID_MARCA,'
      ' F.ID_VEICULO,'
      ' F.ID_MODELO,'
      ' F.ID_MOTORISTA,'
      ' F.ID_CLIENTE,'
      ' F.DT_PARTIDA,'
      ' F.DT_RETORNO,'
      ' F.KM_INICIO,'
      ' F.KM_FIM,'
      ' F.NR_NOTA,'
      ' F.VL_FRETE,'
      ' F.PESO_BRUTO,'
      ' F.PESO_LIQ,'
      ' F.VL_CUSTO_FRETE,'
      ' F.STATUS,'
      ' F.OBS,'
      ' F.VL_NOTA,'
      ' MO.UF AS UF_ORIGEM,'
      ' MO.NOME AS CIDADE_ORIGEM,'
      ' MD.UF AS UF_DESTINO,'
      ' MD.NOME AS CIDADE_DESTINO,'
      ' MC.UF AS UF_CLIENTE,'
      ' MC.NOME AS CIDADE_CLIENTE,'
      ' C.NOME AS CLIENTE,'
      ' C.CNPJ_CPF,'
      ' C.INSC_RG,'
      ' C.ENDERECO,'
      ' C.NUMERO,'
      ' C.COMPLEMENTO,'
      ' C.BAIRRO,'
      ' C.TELEFONE,'
      ' C.CEP,'
      ' C.TEL_COMERCIAL,'
      ' MA.NOME AS MARCA,'
      ' ML.DESCRICAO AS MODELO,'
      ' MT.NOME AS MOTORISTA,'
      ' MT.TELEFONE AS TEL_MOT,'
      ' V.UF_PLACA,'
      ' V.PLACA_CARRETA,'
      ' V.CHASSI,'
      ' V.ANO_MODELO,'
      ' V.ANO_FABRICACAO,'
      ' V.COR'
      'FROM TB_FRETE F'
      'JOIN TB_MUNICIPIOS MO ON (MO.CODIGO_MUNIC = F.COD_MUNIC_ORIGEM)'
      'JOIN TB_MUNICIPIOS MD ON (MD.CODIGO_MUNIC = F.COD_MUNIC_DESTINO)'
      'JOIN TB_VEICULO V ON (V.ID_VEICULO = F.ID_VEICULO)'
      'JOIN TB_MARCA MA ON (MA.ID_MARCA = V.ID_MARCA)'
      'JOIN TB_MODELO ML ON (ML.ID_MODELO = V.ID_MODELO)'
      'JOIN TB_MOTORISTA MT ON (MT.ID_MOTORISTA = F.ID_MOTORISTA)'
      'JOIN TB_CLIENTE C ON (C.ID_CLIENTE = F.ID_CLIENTE)'
      'JOIN TB_MUNICIPIOS MC ON (MC.CODIGO_MUNIC = C.COD_MUNIC)')
    SQLConnection = Conexao
    Left = 247
    Top = 139
    object qFreteID_FRETE: TIntegerField
      FieldName = 'ID_FRETE'
      Required = True
    end
    object qFreteCOD_MUNIC_ORIGEM: TStringField
      FieldName = 'COD_MUNIC_ORIGEM'
      Required = True
    end
    object qFreteCOD_MUNIC_DESTINO: TStringField
      FieldName = 'COD_MUNIC_DESTINO'
      Required = True
    end
    object qFreteID_MARCA: TIntegerField
      FieldName = 'ID_MARCA'
      Required = True
    end
    object qFreteID_MODELO: TIntegerField
      FieldName = 'ID_MODELO'
      Required = True
    end
    object qFreteID_MOTORISTA: TIntegerField
      FieldName = 'ID_MOTORISTA'
      Required = True
    end
    object qFreteID_CLIENTE: TIntegerField
      FieldName = 'ID_CLIENTE'
      Required = True
    end
    object qFreteDT_PARTIDA: TDateField
      FieldName = 'DT_PARTIDA'
    end
    object qFreteKM_INICIO: TIntegerField
      FieldName = 'KM_INICIO'
    end
    object qFreteKM_FIM: TIntegerField
      FieldName = 'KM_FIM'
    end
    object qFreteNR_NOTA: TStringField
      FieldName = 'NR_NOTA'
      FixedChar = True
    end
    object qFreteVL_FRETE: TFMTBCDField
      FieldName = 'VL_FRETE'
      Precision = 18
      Size = 3
    end
    object qFretePESO_BRUTO: TFMTBCDField
      FieldName = 'PESO_BRUTO'
      Precision = 18
      Size = 3
    end
    object qFretePESO_LIQ: TFMTBCDField
      FieldName = 'PESO_LIQ'
      Precision = 18
      Size = 3
    end
    object qFreteVL_CUSTO_FRETE: TFMTBCDField
      FieldName = 'VL_CUSTO_FRETE'
      Precision = 18
      Size = 3
    end
    object qFreteSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 1
    end
    object qFreteUF_ORIGEM: TStringField
      FieldName = 'UF_ORIGEM'
      ProviderFlags = []
      Size = 2
    end
    object qFreteCIDADE_ORIGEM: TStringField
      FieldName = 'CIDADE_ORIGEM'
      ProviderFlags = []
      Size = 35
    end
    object qFreteUF_DESTINO: TStringField
      FieldName = 'UF_DESTINO'
      ProviderFlags = []
      Size = 2
    end
    object qFreteCIDADE_DESTINO: TStringField
      FieldName = 'CIDADE_DESTINO'
      ProviderFlags = []
      Size = 35
    end
    object qFreteUF_CLIENTE: TStringField
      FieldName = 'UF_CLIENTE'
      ProviderFlags = []
      Size = 2
    end
    object qFreteCIDADE_CLIENTE: TStringField
      FieldName = 'CIDADE_CLIENTE'
      ProviderFlags = []
      Size = 35
    end
    object qFreteCLIENTE: TStringField
      FieldName = 'CLIENTE'
      ProviderFlags = []
      Size = 50
    end
    object qFreteCNPJ_CPF: TStringField
      FieldName = 'CNPJ_CPF'
      ProviderFlags = []
      Size = 18
    end
    object qFreteINSC_RG: TStringField
      FieldName = 'INSC_RG'
      ProviderFlags = []
      Size = 14
    end
    object qFreteENDERECO: TStringField
      FieldName = 'ENDERECO'
      ProviderFlags = []
      Size = 50
    end
    object qFreteNUMERO: TStringField
      FieldName = 'NUMERO'
      ProviderFlags = []
      FixedChar = True
      Size = 18
    end
    object qFreteCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      ProviderFlags = []
      Size = 50
    end
    object qFreteBAIRRO: TStringField
      FieldName = 'BAIRRO'
      ProviderFlags = []
      Size = 40
    end
    object qFreteTELEFONE: TStringField
      FieldName = 'TELEFONE'
      ProviderFlags = []
      Size = 14
    end
    object qFreteCEP: TStringField
      FieldName = 'CEP'
      ProviderFlags = []
      Size = 10
    end
    object qFreteTEL_COMERCIAL: TStringField
      FieldName = 'TEL_COMERCIAL'
      ProviderFlags = []
      Size = 14
    end
    object qFreteMARCA: TStringField
      FieldName = 'MARCA'
      ProviderFlags = []
      Size = 50
    end
    object qFreteMODELO: TStringField
      FieldName = 'MODELO'
      ProviderFlags = []
      Size = 50
    end
    object qFreteMOTORISTA: TStringField
      FieldName = 'MOTORISTA'
      ProviderFlags = []
      Size = 50
    end
    object qFreteTEL_MOT: TStringField
      FieldName = 'TEL_MOT'
      ProviderFlags = []
      Size = 14
    end
    object qFreteOBS: TStringField
      FieldName = 'OBS'
      Size = 255
    end
    object qFreteDT_RETORNO: TDateField
      FieldName = 'DT_RETORNO'
    end
    object qFreteID_VEICULO: TIntegerField
      FieldName = 'ID_VEICULO'
      Required = True
    end
    object qFreteUF_PLACA: TStringField
      FieldName = 'UF_PLACA'
      ProviderFlags = []
      FixedChar = True
      Size = 2
    end
    object qFretePLACA_CARRETA: TStringField
      FieldName = 'PLACA_CARRETA'
      ProviderFlags = []
      FixedChar = True
      Size = 18
    end
    object qFreteCHASSI: TStringField
      FieldName = 'CHASSI'
      ProviderFlags = []
      FixedChar = True
      Size = 30
    end
    object qFreteANO_MODELO: TStringField
      FieldName = 'ANO_MODELO'
      ProviderFlags = []
      Size = 4
    end
    object qFreteANO_FABRICACAO: TStringField
      FieldName = 'ANO_FABRICACAO'
      ProviderFlags = []
      Size = 4
    end
    object qFreteCOR: TStringField
      FieldName = 'COR'
      ProviderFlags = []
      FixedChar = True
      Size = 18
    end
    object qFreteVL_NOTA: TFMTBCDField
      FieldName = 'VL_NOTA'
      Precision = 18
      Size = 3
    end
  end
  object dsDinamica: TDataSource
    DataSet = cdsDinamica
    Left = 343
    Top = 27
  end
  object cdsDinamica: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDinamica'
    Left = 311
    Top = 27
  end
  object dspDinamica: TDataSetProvider
    DataSet = qDinamica
    Options = [poIncFieldProps, poAllowMultiRecordUpdates, poAutoRefresh, poAllowCommandText, poUseQuoteChar]
    Left = 279
    Top = 27
  end
  object qDinamica: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Conexao
    Left = 247
    Top = 27
  end
  object dsItemFrete: TDataSource
    DataSet = cdsItemFrete
    Left = 343
    Top = 193
  end
  object cdsItemFrete: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'ID_FRETE'
    MasterFields = 'ID_FRETE'
    MasterSource = dsFrete
    PacketRecords = 0
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_FRETE'
        ParamType = ptInput
      end>
    ProviderName = 'dspItemFrete'
    Left = 311
    Top = 193
    object cdsItemFreteID_ITEM_FRETE: TIntegerField
      FieldName = 'ID_ITEM_FRETE'
      Required = True
    end
    object cdsItemFreteID_SERVICO: TIntegerField
      DisplayLabel = 'C'#243'd.Servi'#231'o'
      FieldName = 'ID_SERVICO'
      Required = True
    end
    object cdsItemFreteQUANT: TIntegerField
      DisplayLabel = 'Quant'
      FieldName = 'QUANT'
    end
    object cdsItemFreteVL_UNIT: TFMTBCDField
      DisplayLabel = 'Vl Unit'
      FieldName = 'VL_UNIT'
      DisplayFormat = '###,###0.00'
      EditFormat = '###,###0.00'
      Precision = 18
      Size = 3
    end
    object cdsItemFreteTOTAL: TFMTBCDField
      DisplayLabel = 'Total'
      FieldName = 'TOTAL'
      DisplayFormat = '###,###0.00'
      EditFormat = '###,###0.00'
      Precision = 18
      Size = 3
    end
    object cdsItemFreteSERVICO: TStringField
      DisplayLabel = 'Servi'#231'o'
      FieldName = 'SERVICO'
      ProviderFlags = []
      Size = 50
    end
    object cdsItemFreteVL_SERVICO: TFMTBCDField
      FieldName = 'VL_SERVICO'
      ProviderFlags = []
      Precision = 18
      Size = 3
    end
    object cdsItemFreteID_FRETE: TIntegerField
      FieldName = 'ID_FRETE'
    end
  end
  object dspItemFrete: TDataSetProvider
    DataSet = qItemFrete
    Options = [poIncFieldProps, poAllowMultiRecordUpdates, poAutoRefresh, poAllowCommandText, poUseQuoteChar]
    Left = 279
    Top = 193
  end
  object qItemFrete: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_FRETE'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT'
      ' I.ID_ITEM_FRETE,'
      ' I.ID_SERVICO,'
      ' I.ID_FRETE,'
      ' I.QUANT,'
      ' I.VL_UNIT,'
      ' I.TOTAL,'
      ' S.DESCRICAO AS SERVICO,'
      ' S.VL_UNIT AS VL_SERVICO'
      'FROM TB_ITEM_FRETE I'
      'JOIN TB_SERVICOS S ON (S.ID_SERVICO = I.ID_SERVICO)'
      'JOIN TB_FRETE F ON (F.ID_FRETE = I.ID_FRETE)'
      'WHERE I.ID_FRETE = :ID_FRETE')
    SQLConnection = Conexao
    Left = 247
    Top = 193
    object qItemFreteID_ITEM_FRETE: TIntegerField
      FieldName = 'ID_ITEM_FRETE'
      Required = True
    end
    object qItemFreteID_SERVICO: TIntegerField
      FieldName = 'ID_SERVICO'
      Required = True
    end
    object qItemFreteQUANT: TIntegerField
      FieldName = 'QUANT'
    end
    object qItemFreteVL_UNIT: TFMTBCDField
      FieldName = 'VL_UNIT'
      Precision = 18
      Size = 3
    end
    object qItemFreteTOTAL: TFMTBCDField
      FieldName = 'TOTAL'
      Precision = 18
      Size = 3
    end
    object qItemFreteSERVICO: TStringField
      FieldName = 'SERVICO'
      ProviderFlags = []
      Size = 50
    end
    object qItemFreteVL_SERVICO: TFMTBCDField
      FieldName = 'VL_SERVICO'
      ProviderFlags = []
      Precision = 18
      Size = 3
    end
    object qItemFreteID_FRETE: TIntegerField
      FieldName = 'ID_FRETE'
    end
  end
  object dsServico: TDataSource
    DataSet = cdsServico
    Left = 341
    Top = 244
  end
  object cdsServico: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspServico'
    Left = 309
    Top = 244
    object cdsServicoID_SERVICO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'ID_SERVICO'
      Required = True
    end
    object cdsServicoDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object cdsServicoVL_UNIT: TFMTBCDField
      DisplayLabel = 'Vl Unit'
      FieldName = 'VL_UNIT'
      DisplayFormat = '###,###0.00'
      EditFormat = '###,###0.00'
      Precision = 18
      Size = 3
    end
  end
  object dspServico: TDataSetProvider
    DataSet = qServico
    Options = [poIncFieldProps, poAllowMultiRecordUpdates, poAutoRefresh, poAllowCommandText, poUseQuoteChar]
    Left = 277
    Top = 244
  end
  object qServico: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT'
      '  S.ID_SERVICO,'
      '  S.DESCRICAO,'
      '  S.VL_UNIT'
      'FROM TB_SERVICOS S')
    SQLConnection = Conexao
    Left = 245
    Top = 244
    object qServicoID_SERVICO: TIntegerField
      FieldName = 'ID_SERVICO'
      Required = True
    end
    object qServicoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object qServicoVL_UNIT: TFMTBCDField
      FieldName = 'VL_UNIT'
      Precision = 18
      Size = 3
    end
  end
  object DataSource2: TDataSource
    Left = 341
    Top = 293
  end
  object ClientDataSet2: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 309
    Top = 293
  end
  object DataSetProvider2: TDataSetProvider
    Options = [poIncFieldProps, poAllowMultiRecordUpdates, poAutoRefresh, poAllowCommandText, poUseQuoteChar]
    Left = 277
    Top = 293
  end
  object SQLQuery2: TSQLQuery
    Params = <>
    Left = 245
    Top = 293
  end
end
