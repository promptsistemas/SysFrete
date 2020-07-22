unit uConsultaCPF;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ACBrBase, ACBrSocket, ACBrConsultaCNPJ,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask, Vcl.Buttons, ACBrConsultaCPF;


{$IFDEF CONDITIONALEXPRESSIONS}
   {$IF CompilerVersion >= 20.0}
     {$DEFINE DELPHI2009_UP}
   {$IFEND}
{$ENDIF}


type
  TfrmConsultaCPF = class(TForm)
    Timer1: TTimer;
    Panel1: TPanel;
    Label1: TLabel;
    Label14: TLabel;
    Label2: TLabel;
    EditCaptcha: TEdit;
    EditCNPJ: TEdit;
    Panel3: TPanel;
    Image1: TImage;
    LabAtualizarCaptcha: TLabel;
    btnConsultar: TButton;
    ACBrConsultaCPF1: TACBrConsultaCPF;
    EditDtNasc: TMaskEdit;
    procedure FormShow(Sender: TObject);
    procedure LabAtualizarCaptchaClick(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    Var
     ClienteVendedor : string;
  end;

var
  frmConsultaCPF: TfrmConsultaCPF;

implementation

uses
  JPEG
{$IFDEF DELPHI2009_UP}
  , pngimage
{$ENDIF}
  , uCadCliente
  , U_LIB, UD_PESQUISA, uDM, uCadVendendor;

{$R *.dfm}



procedure TfrmConsultaCPF.btnConsultarClick(Sender: TObject);
begin
  if EditCaptcha.Text <> '' then
  begin
    if ACBrConsultaCPF1.Consulta(EditCNPJ.Text, EditDtNasc.Text, EditCaptcha.Text) then
    begin
      if ClienteVendedor = 'Cliente' then
      begin

        DM.cdsClienteR_SOCIAL.AsString := ACBrConsultaCPF1.Nome;
        DM.cdsClienteDT_NASCIMENTO.AsString := ACBrConsultaCPF1.DataNascimento;
       { EditRazaoSocial.Text      := ACBrConsultaCPF1.Nome;
        EditSituacao.Text         := ACBrConsultaCPF1.Situacao;
        EdtEmissao.Text           := ACBrConsultaCPF1.Emissao;
        EdtCodCtrlControle.Text   := ACBrConsultaCPF1.CodCtrlControle;
        EdtDigitoVerificador.Text := ACBrConsultaCPF1.DigitoVerificador;
        EdtIncricao.Text          := ACBrConsultaCPF1.DataInscricao;}
        frmCadCliente.DBEdit3.SetFocus;
        Close;
      end
      else
      begin
        DM.cdsVendedorNOME.AsString  := ACBrConsultaCPF1.Nome;
        DM.cdsVendedorDT_NASCIMENTO.AsString :=ACBrConsultaCPF1.DataNascimento;
        frmCadVendedor.DBEdit3.SetFocus;
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

procedure TfrmConsultaCPF.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  EditCaptcha.Clear;
end;

procedure TfrmConsultaCPF.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;

end;

procedure TfrmConsultaCPF.FormShow(Sender: TObject);
begin
  Timer1.Enabled:= True;
  EditDtNasc.Clear;
  if ClienteVendedor = 'Cliente' then
  begin
    EditCNPJ.Text := frmCadCliente.DBEdit1.Text;
    EditDtNasc.SetFocus;
  end;

  if ClienteVendedor = 'Vendedor' then
  begin
    EditCNPJ.Text := frmCadVendedor.DBEdit1.Text;
    EditDtNasc.SetFocus;
  end;

end;

procedure TfrmConsultaCPF.LabAtualizarCaptchaClick(Sender: TObject);
var
  Stream: TMemoryStream;
  ImgArq: String;
begin
  Stream := TMemoryStream.Create;
  try
    ACBrConsultaCPF1.Captcha(Stream);
    ImgArq := ExtractFilePath(ParamStr(0))+PathDelim+'captch.png';
    Stream.SaveToFile( ImgArq );
    Image1.Picture.LoadFromFile( ImgArq );

    EditCaptcha.Clear;
    EditCaptcha.SetFocus;
  finally
    Stream.Free;
  end;
end;

procedure TfrmConsultaCPF.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  LabAtualizarCaptchaClick(LabAtualizarCaptcha);
  EditDtNasc.SetFocus;
end;

end.
