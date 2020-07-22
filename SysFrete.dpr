program SysFrete;

uses
  Vcl.Forms,
  uMenu in 'Forms\uMenu.pas' {frmMenu},
  uDM in 'Forms\uDM.pas' {DM: TDataModule},
  uLogin in 'Forms\uLogin.pas' {frmLogin},
  U_LIB in 'Forms\U_LIB.pas',
  UD_PESQUISA in 'Forms\UD_PESQUISA.pas' {FD_PESQUISA},
  uCadCliente in 'Forms\uCadCliente.pas' {frmCadCliente},
  uConsultaCNPJ in 'Forms\uConsultaCNPJ.pas' {frmConsultaCNPJ},
  uConsultaCPF in 'Forms\uConsultaCPF.pas' {frmConsultaCPF},
  uPesquisaPadrao in 'Forms\uPesquisaPadrao.pas' {frmPesquisaPadrao},
  uCadMotorista in 'Forms\uCadMotorista.pas' {frmCadMotorista},
  uCadMarcas in 'Forms\uCadMarcas.pas' {frmCadMarcas},
  uCadModelos in 'Forms\uCadModelos.pas' {frmCadModelos};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMenu, frmMenu);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFD_PESQUISA, FD_PESQUISA);
  Application.CreateForm(TfrmConsultaCNPJ, frmConsultaCNPJ);
  Application.CreateForm(TfrmConsultaCPF, frmConsultaCPF);
  Application.CreateForm(TfrmPesquisaPadrao, frmPesquisaPadrao);
  Application.Run;
end.
