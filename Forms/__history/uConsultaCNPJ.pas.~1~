unit uConsultaCNPJ;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ACBrBase, ACBrSocket, ACBrConsultaCNPJ,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask, Vcl.Buttons;


{$IFDEF CONDITIONALEXPRESSIONS}
   {$IF CompilerVersion >= 20.0}
     {$DEFINE DELPHI2009_UP}
   {$IFEND}
{$ENDIF}


type
  TfrmConsultaCNPJ = class(TForm)
    Panel1: TPanel;
    Label14: TLabel;
    ButBuscar: TBitBtn;
    EditCaptcha: TEdit;
    Panel3: TPanel;
    Image1: TImage;
    LabAtualizarCaptcha: TLabel;
    ACBrConsultaCNPJ1: TACBrConsultaCNPJ;
    Timer1: TTimer;
    procedure ButBuscarClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure LabAtualizarCaptchaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EditCaptchaKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
  var
    ClienteFornecedor : string;

    { Public declarations }
  end;

var
  frmConsultaCNPJ: TfrmConsultaCNPJ;
implementation

uses
  JPEG
{$IFDEF DELPHI2009_UP}
  , pngimage
{$ENDIF}
  , uCadCliente
  , U_LIB, UD_PESQUISA, uDM, uCadFor, uCadEmpresa, uCadTransportadora;

{$R *.dfm}



procedure TfrmConsultaCNPJ.ButBuscarClick(Sender: TObject);
var
  I: Integer;
  CNPJ : string;
begin
  if ClienteFornecedor = 'Cliente' then
  begin
    CNPJ := frmCadCliente.DBEdit1.Text;
  end;
  if ClienteFornecedor = 'Fornecedor' then
  begin
    CNPJ := frmCadfor.DBEdit13.Text;
  end;

  if ClienteFornecedor = 'Empresa' then
  begin
    CNPJ := frmCadEmpresa.DBEdit13.Text;
  end;

  if ClienteFornecedor = 'Transportadora' then
  begin
    CNPJ := frmCadTransportadora.DBEdit2.Text;
  end;

  if EditCaptcha.Text <> '' then
  begin
    if ACBrConsultaCNPJ1.Consulta(
      CNPJ,
      EditCaptcha.Text

    ) then
    begin
      if ClienteFornecedor = 'Cliente' then
      begin
        DM.cdsClienteR_SOCIAL.AsString        := ACBrConsultaCNPJ1.RazaoSocial;
        DM.cdsClienteFANTASIA.AsString        := ACBrConsultaCNPJ1.Fantasia;
        DM.cdsClienteENDERECO.AsString        := ACBrConsultaCNPJ1.Endereco;
        DM.cdsClienteNUMERO.AsString          := ACBrConsultaCNPJ1.Numero;
        DM.cdsClienteCOMPLEMENTO.AsString     := ACBrConsultaCNPJ1.Complemento;
        DM.cdsClienteBAIRRO.AsString          := ACBrConsultaCNPJ1.Bairro;
        DM.cdsClienteCIDADE.AsString          := ACBrConsultaCNPJ1.Cidade;

        //PESQUISAR CODIGO IBGE CIDADE

        DM.cdsDinamica.Close;
        DM.cdsDinamica.IndexFieldNames:='';
        DM.cdsDinamica.CommandText := ' SELECT M.CODIGO_MUNIC, M.NOME FROM TB_MUNICIPIOS M '+
                                      ' WHERE M.NOME = '+QuotedStr(DM.cdsClienteCIDADE.AsString);
        DM.cdsDinamica.Open;

        DM.cdsClienteCODIGO_MUNIC.AsString := DM.cdsDinamica.Fields[0].AsString;

        DM.cdsDinamica.Close;



        DM.cdsClienteUF.AsString              := ACBrConsultaCNPJ1.UF;
        DM.cdsClienteCEP.AsString             := ACBrConsultaCNPJ1.CEP;
        DM.cdsClienteEMAIL.AsString           := ACBrConsultaCNPJ1.EndEletronico;
        DM.cdsClienteTELEFONE.AsString        := ACBrConsultaCNPJ1.Telefone;
        DM.cdsClienteDT_NASCIMENTO.AsDateTime := ACBrConsultaCNPJ1.Abertura;
        DM.cdsClienteCOMPLEMENTO.AsString     := ACBrConsultaCNPJ1.Complemento;
        //      EditComplemento.Text := ACBrConsultaCNPJ1.Complemento;
        //      EditSituacao.Text    := ACBrConsultaCNPJ1.Situacao;
        //      EditCNAE1.Text       := ACBrConsultaCNPJ1.CNAE1;
        //      EditAbertura.Text    := DateToStr( ACBrConsultaCNPJ1.Abertura );
        //      ListCNAE2.Clear;
        frmCadCliente.DBMemo12.Clear;
        for I := 0 to ACBrConsultaCNPJ1.CNAE2.Count - 1 do
          frmCadCliente.DBMemo12.Lines.Add(ACBrConsultaCNPJ1.CNAE2[I]);
        frmCadCliente.DBEdit3.SetFocus;
        Close;
      end;
      if ClienteFornecedor = 'Fornecedor' then
      begin
        DM.cdsFornecedorNOME.AsString    := ACBrConsultaCNPJ1.RazaoSocial;
        DM.cdsFornecedorFANTASIA.AsString    := ACBrConsultaCNPJ1.Fantasia;
        DM.cdsFornecedorENDERECO.AsString    := ACBrConsultaCNPJ1.Endereco;
        DM.cdsFornecedorNUMERO.AsString      := ACBrConsultaCNPJ1.Numero;
        DM.cdsFornecedorCOMPLEMENTO.AsString := ACBrConsultaCNPJ1.Complemento;
        DM.cdsFornecedorBAIRRO.AsString      := ACBrConsultaCNPJ1.Bairro;
        DM.cdsFornecedorCIDADE.AsString      := ACBrConsultaCNPJ1.Cidade;
        DM.cdsFornecedorUF.AsString          := ACBrConsultaCNPJ1.UF;
        DM.cdsFornecedorCEP.AsString         := ACBrConsultaCNPJ1.CEP;
        DM.cdsFornecedorEMAIL.AsString       := ACBrConsultaCNPJ1.EndEletronico;
        DM.cdsFornecedorTELFONE.AsString    := ACBrConsultaCNPJ1.Telefone;
        DM.cdsFornecedorSITUACAO.AsString    := ACBrConsultaCNPJ1.Situacao;
        DM.cdsFornecedorCNAE_PRINCIPAL.AsString:= ACBrConsultaCNPJ1.CNAE1;
        DM.cdsFornecedorDT_ABERTURA.AsString := DateToStr( ACBrConsultaCNPJ1.Abertura );
        //PESQUISAR CODIGO IBGE CIDADE

        DM.cdsDinamica.Close;
        DM.cdsDinamica.IndexFieldNames:='';
        DM.cdsDinamica.CommandText := ' SELECT M.CODIGO_MUNIC, M.NOME FROM TB_MUNICIPIOS M '+
                                      ' WHERE M.NOME = '+QuotedStr(DM.cdsFornecedorCIDADE.AsString);
        DM.cdsDinamica.Open;

        DM.cdsFornecedorCODIGO_MUNIC.AsString := DM.cdsDinamica.Fields[0].AsString;



        frmCadfor.DBMemo1.Clear;
        //      ListCNAE2.Clear;
        for I := 0 to ACBrConsultaCNPJ1.CNAE2.Count - 1 do
          frmCadfor.DBMemo1.Lines.Add(ACBrConsultaCNPJ1.CNAE2[I]);
        frmCadfor.DBEdit3.SetFocus;
        Close;
      end;
      if ClienteFornecedor = 'Empresa' then
      begin
        DM.cdsEmpresaR_SOCIAL.AsString    := ACBrConsultaCNPJ1.RazaoSocial;
        DM.cdsEmpresaFANTASIA.AsString    := ACBrConsultaCNPJ1.Fantasia;
        DM.cdsEmpresaENDERECO.AsString    := ACBrConsultaCNPJ1.Endereco;
        DM.cdsEmpresaNUMERO.AsString      := ACBrConsultaCNPJ1.Numero;
        DM.cdsEmpresaCOMPLEMENTO.AsString := ACBrConsultaCNPJ1.Complemento;
        DM.cdsEmpresaBAIRRO.AsString      := ACBrConsultaCNPJ1.Bairro;
        DM.cdsEmpresaCIDADE.AsString      := ACBrConsultaCNPJ1.Cidade;
        DM.cdsEmpresaUF.AsString          := ACBrConsultaCNPJ1.UF;
        DM.cdsEmpresaCEP.AsString         := ACBrConsultaCNPJ1.CEP;
        DM.cdsEmpresaEMAIL.AsString       := ACBrConsultaCNPJ1.EndEletronico;
        DM.cdsEmpresaTELEFONE.AsString    := ACBrConsultaCNPJ1.Telefone;
        //      EditComplemento.Text := ACBrConsultaCNPJ1.Complemento;
        DM.cdsEmpresaSITUACAO.AsString    := ACBrConsultaCNPJ1.Situacao;
        DM.cdsEmpresaCNAE_PRINCIPAL.AsString:= ACBrConsultaCNPJ1.CNAE1;
        DM.cdsEmpresaDT_ABERTURA.AsString := DateToStr( ACBrConsultaCNPJ1.Abertura );

        //PESQUISAR CODIGO IBGE CIDADE

        DM.cdsDinamica.Close;
        DM.cdsDinamica.IndexFieldNames:='';
        DM.cdsDinamica.CommandText := ' SELECT M.CODIGO_MUNIC, M.NOME FROM TB_MUNICIPIOS M '+
                                      ' WHERE M.NOME = '+QuotedStr(DM.cdsEmpresaCIDADE.AsString);
        DM.cdsDinamica.Open;

        DM.cdsEmpresaCODIGO_MUNIC.AsString := DM.cdsDinamica.Fields[0].AsString;


        frmCadEmpresa.DBMemo1.Clear;
        //      ListCNAE2.Clear;
        for I := 0 to ACBrConsultaCNPJ1.CNAE2.Count - 1 do
          frmCadEmpresa.DBMemo1.Lines.Add(ACBrConsultaCNPJ1.CNAE2[I]);
        frmCadEmpresa.DBEdit14.SetFocus;
        Close;
      end;

      if ClienteFornecedor = 'Transportadora' then
      begin
        DM.cdsTransportadoraNOME_TRANSPORTADORA.AsString        := ACBrConsultaCNPJ1.RazaoSocial;
//        DM.cdsTransportadoraNOME_TRANSPORTADORA.AsString        := ACBrConsultaCNPJ1.Fantasia;
        DM.cdsTransportadoraENDERECO.AsString    := ACBrConsultaCNPJ1.Endereco;
        DM.cdsTransportadoraNUMERO.AsString      := ACBrConsultaCNPJ1.Numero;
//        DM.cdsTransportadoraCOMPLEMENTO.AsString := ACBrConsultaCNPJ1.Complemento;
        DM.cdsTransportadoraBAIRRO.AsString      := ACBrConsultaCNPJ1.Bairro;
        DM.cdsTransportadoraCIDADE_1.AsString      := ACBrConsultaCNPJ1.Cidade;
        DM.cdsTransportadoraUF_1.AsString          := ACBrConsultaCNPJ1.UF;
        DM.cdsTransportadoraCEP.AsString         := ACBrConsultaCNPJ1.CEP;
//        DM.cdsEmpresaEMAIL.AsString       := ACBrConsultaCNPJ1.EndEletronico;
        DM.cdsTransportadoraTELEFONE.AsString    := ACBrConsultaCNPJ1.Telefone;

        //PESQUISAR CODIGO IBGE CIDADE

        DM.cdsDinamica.Close;
        DM.cdsDinamica.IndexFieldNames:='';
        DM.cdsDinamica.CommandText := ' SELECT M.CODIGO_MUNIC, M.NOME FROM TB_MUNICIPIOS M '+
                                      ' WHERE M.NOME = '+QuotedStr(DM.cdsTransportadoraCIDADE.AsString);
        DM.cdsDinamica.Open;

        DM.cdsTransportadoraCODIGO_MUNIC.AsString := DM.cdsDinamica.Fields[0].AsString;



        //      EditComplemento.Text := ACBrConsultaCNPJ1.Complemento;
//        DM.cdsEmpresaSITUACAO.AsString    := ACBrConsultaCNPJ1.Situacao;
//        DM.cdsEmpresaCNAE_PRINCIPAL.AsString:= ACBrConsultaCNPJ1.CNAE1;
//        DM.cdsEmpresaDT_ABERTURA.AsString := DateToStr( ACBrConsultaCNPJ1.Abertura );
//        frmCadEmpresa.DBMemo1.Clear;
        //      ListCNAE2.Clear;
//        for I := 0 to ACBrConsultaCNPJ1.CNAE2.Count - 1 do
//          frmCadEmpresa.DBMemo1.Lines.Add(ACBrConsultaCNPJ1.CNAE2[I]);
//        frmCadEmpresa.DBEdit14.SetFocus;
        Close;
      end;

    end;
  end
  else
  begin
    ShowMessage('É necessário digitar o captcha.');
    EditCaptcha.SetFocus;
  end;
end;

procedure TfrmConsultaCNPJ.EditCaptchaKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #13 then
    ButBuscarClick(ButBuscar);
end;

procedure TfrmConsultaCNPJ.FormShow(Sender: TObject);
begin
  Timer1.Enabled:= True;
end;

procedure TfrmConsultaCNPJ.LabAtualizarCaptchaClick(Sender: TObject);
var
  Stream: TMemoryStream;
  Jpg: TJPEGImage;
{$IFDEF DELPHI2009_UP}
  png: TPngImage;
{$ENDIF}
begin
  Stream:= TMemoryStream.Create;
  try
    ACBrConsultaCNPJ1.Captcha(Stream);

  {$IFDEF DELPHI2009_UP}
    //Use esse código quando a imagem do site for do tipo PNG
    png:= TPngImage.Create;
    try
      png.LoadFromStream(Stream);
      Image1.Picture.Assign(png);

      EditCaptcha.Clear;
      EditCaptcha.SetFocus;
    finally
      png.Free;
    end;
  {$ELSE}
    ShowMessage('Atenção: Seu Delphi não dá suporte nativo a imagens PNG. Queira verificar o código fonte deste exemplo para saber como proceder.');
    // COMO PROCEDER:
    //
    // 1) Caso o site da receita esteja utilizando uma imagem do tipo JPG, você pode utilizar o código comentado abaixo.
    //    * Comente ou apague o código que trabalha com PNG, incluindo o IFDEF/ENDIF;
    //    * descomente a declaração da variável jpg
    //    * descomente o código abaixo;
    // 2) Caso o site da receita esteja utilizando uma imagem do tipo PNG, você terá que utilizar uma biblioteca de terceiros para
    //conseguir trabalhar com imagens PNG.
    //  Neste caso, recomendamos verificar o manual da biblioteca em como fazer a implementação. Algumas sugestões:
    //    * Procure no Fórum do ACBr sobre os erros que estiver recebendo. Uma das maneiras mais simples está no link abaixo:
    //      - http://www.projetoacbr.com.br/forum/topic/20087-imagem-png-delphi-7/
    //    * O exemplo acima utiliza a biblioteca GraphicEX. Mas existem outras bibliotecas, caso prefira:
    //      - http://synopse.info/forum/viewtopic.php?id=115
    //      - http://graphics32.org/wiki/
    //      - http://cc.embarcadero.com/Item/25631
    //      - Várias outras: http://torry.net/quicksearchd.php?String=png&Title=Yes
  {$ENDIF}

    //Use esse código quando a imagem do site for do tipo JPG
    //Jpg:= TJPEGImage.Create;
    //try
    //  Jpg.LoadFromStream(Stream);
    //  Image1.Picture.Assign(Jpg);
    //   //    EditCaptcha.Clear;
    //  EditCaptcha.SetFocus;
    //finally
    //  Jpg.Free;
    //end;

  finally
    Stream.Free;
  end;
end;

procedure TfrmConsultaCNPJ.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled:= False;
  LabAtualizarCaptchaClick(LabAtualizarCaptcha);
end;

end.









