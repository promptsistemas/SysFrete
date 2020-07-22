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
    object qUsuarioSENHA: TStringField
      FieldName = 'SENHA'
      Size = 10
    end
    object qUsuarioNIVEL: TSmallintField
      FieldName = 'NIVEL'
    end
    object qUsuarioLOGIN: TStringField
      FieldName = 'LOGIN'
      Size = 50
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
    object cdsUsuarioSENHA: TStringField
      DisplayLabel = 'Senha'
      FieldName = 'SENHA'
      Size = 10
    end
    object cdsUsuarioNIVEL: TSmallintField
      DisplayLabel = 'N'#237'vel'
      FieldName = 'NIVEL'
    end
    object cdsUsuarioLOGIN: TStringField
      FieldName = 'LOGIN'
      Size = 50
    end
  end
  object dsUsuario: TDataSource
    DataSet = cdsUsuario
    Left = 136
    Top = 80
  end
  object qDinamica: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = Conexao
    Left = 248
    Top = 32
  end
  object dspDinamica: TDataSetProvider
    DataSet = qDinamica
    Options = [poIncFieldProps, poAllowMultiRecordUpdates, poAutoRefresh, poAllowCommandText, poUseQuoteChar]
    Left = 280
    Top = 32
  end
  object cdsDinamica: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDinamica'
    Left = 312
    Top = 32
  end
  object dsDinamica: TDataSource
    DataSet = cdsDinamica
    Left = 344
    Top = 32
  end
  object DataSource2: TDataSource
    Left = 344
    Top = 88
  end
  object ClientDataSet2: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 312
    Top = 88
  end
  object DataSetProvider2: TDataSetProvider
    Left = 280
    Top = 88
  end
  object SQLQuery2: TSQLQuery
    Params = <>
    Left = 248
    Top = 88
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
end
