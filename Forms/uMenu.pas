unit uMenu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.Menus,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.StdCtrls,IniFiles;

type
  TfrmMenu = class(TForm)
    Panel4: TPanel;
    Label1: TLabel;
    Panel5: TPanel;
    Image1: TImage;
    Panel2: TPanel;
    Image2: TImage;
    Panel9: TPanel;
    Image4: TImage;
    Panel10: TPanel;
    Image5: TImage;
    Panel11: TPanel;
    Image6: TImage;
    Panel12: TPanel;
    Image7: TImage;
    Panel13: TPanel;
    Image8: TImage;
    Panel14: TPanel;
    Image9: TImage;
    MainMenu1: TMainMenu;
    Cadastro1: TMenuItem;
    Lanamentos1: TMenuItem;
    Clientes1: TMenuItem;
    Panel6: TPanel;
    Label2: TLabel;
    L_USUARIO: TLabel;
    Panel8: TPanel;
    Label5: TLabel;
    Image3: TImage;
    Panel3: TPanel;
    L_HORA_WIN10: TLabel;
    l_data_dia: TLabel;
    Timer1: TTimer;
    Memo1: TMemo;
    Usurios1: TMenuItem;
    N1: TMenuItem;
    Sair1: TMenuItem;
    Motoristas1: TMenuItem;
    N2: TMenuItem;
    Marcas1: TMenuItem;
    ModelosFabricante1: TMenuItem;
    N3: TMenuItem;
    Veculos1: TMenuItem;
    procedure Timer1Timer(Sender: TObject);
    function DiaSemana(Data:TDateTime): String;
    procedure Usurios1Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure Clientes1Click(Sender: TObject);
    procedure Motoristas1Click(Sender: TObject);
    procedure Marcas1Click(Sender: TObject);
    procedure ModelosFabricante1Click(Sender: TObject);

  private
    { Private declarations }
  public
       recInformacoes: record
      nm_Usuario: String;
      id_Usuario:Integer;
      Nivel: Integer;
      lojaCredenciada : String;
  end;
    Inicontrole : TIniFile;
    IniSistema: TIniFile;
    sNovo,sNovoAnt,sNome_Novo: String;
    bPesquisa,bSenha: Boolean;
    procedure NovoCadastro;
//    Procedure NovoAcesso;

  end;

var
  frmMenu: TfrmMenu;

implementation

{$R *.dfm}

uses uLogin, uCadCliente, uCadMotorista, uCadMarcas, uCadModelos;

procedure TfrmMenu.Clientes1Click(Sender: TObject);
begin
  if frmCadCliente = nil then
  begin
    frmCadCliente := TfrmCadCliente.Create(Application);
    frmCadCliente.ShowModal;
  end;
end;

function TfrmMenu.DiaSemana(Data: TDateTime): String;
var
  NoDia : Integer;
  DiaDaSemana : array [1..7] of String[13];
begin
{ Dias da Semana }
  DiaDasemana [1]:= 'Domingo';
  DiaDasemana [2]:= 'Segunda-feira';
  DiaDasemana [3]:= 'Ter�a-feira';
  DiaDasemana [4]:= 'Quarta-feira';
  DiaDasemana [5]:= 'Quinta-feira';
  DiaDasemana [6]:= 'Sexta-feira';
  DiaDasemana [7]:= 'S�bado';
  NoDia:=DayOfWeek(Data);
  DiaSemana:=DiaDasemana[NoDia];
end;


procedure TfrmMenu.Marcas1Click(Sender: TObject);
begin
  if frmCadMarcas = nil then
  begin
    frmCadMarcas := TfrmCadMarcas.Create(Application);
    frmCadMarcas.ShowModal;
  end;
end;

procedure TfrmMenu.ModelosFabricante1Click(Sender: TObject);
begin
  if frmCadModelos = nil then
  begin
    frmCadModelos := TfrmCadModelos.Create(Application);
    frmCadModelos.ShowModal;
  end;
end;

procedure TfrmMenu.Motoristas1Click(Sender: TObject);
begin
  if frmCadMotorista = nil then
  begin
    frmCadMotorista := TfrmCadMotorista.Create(Application);
    frmCadMotorista.ShowModal;
  end;
end;

procedure TfrmMenu.Timer1Timer(Sender: TObject);
begin
   L_HORA_WIN10.Caption := TimeToStr(Time);
   l_data_dia.Caption   := DiaSemana(date)+ ','+DateToStr(Date);
end;
procedure TfrmMenu.Usurios1Click(Sender: TObject);
begin
  if frmLogin = nil then
  begin
    frmLogin := TfrmLogin.Create(Application);
    frmLogin.ShowModal;
  end;
end;

procedure TfrmMenu.NovoCadastro;
begin
  {if sNovo = 'Artigo' then
  begin
   if frmCadArtigo = nil then
   begin
     frmCadArtigo := TfrmCadArtigo.Create(Application);
     frmCadArtigo.ShowModal;
   end;
  end;
  if sNovo = 'Fornecedor' then
  begin
   if frmCadfor = nil then
   begin
     frmCadfor := TfrmCadfor.Create(Application);
     frmCadfor.ShowModal;
   end;
  end;
  if sNovo = 'Cliente' then
  begin
   if frmCadCliente = nil then
   begin
     frmCadCliente := TfrmCadCliente.Create(Application);
     frmCadCliente.ShowModal;
   end;
  end;

  if sNovo = 'Mat�ria-Prima' then
  begin
   if frmCadMatPrima = nil then
   begin
     frmCadMatPrima := TfrmCadMatPrima.Create(Application);
     frmCadMatPrima.ShowModal;
   end;
  end;
  if sNovo = 'Cores' then
  begin
   if frmCadCores = nil then
   begin
     frmCadCores := TfrmCadCores.Create(Application);
     frmCadCores.ShowModal;
   end;
  end;}

end;


procedure TfrmMenu.Sair1Click(Sender: TObject);
begin
  Application.Terminate;
end;

end.