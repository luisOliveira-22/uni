DROP TABLE IF EXISTS RentACar_Aluguer;
DROP TABLE IF EXISTS RentACar_Cliente;
DROP TABLE IF EXISTS RentACar_Balcao;
DROP TABLE IF EXISTS RentACar_Veiculo;
DROP TABLE IF EXISTS RentACar_Ligeiro;
DROP TABLE IF EXISTS RentACar_Pesado;
DROP TABLE IF EXISTS RentACar_TipoVeiculo;

CREATE TABLE [RentACar_TipoVeiculo](
	[codigo] [varchar](512) NOT NULL PRIMARY KEY,
	[designacao] [varchar](512) NOT NULL,
	[arcondicionado] [varchar](512) NOT NULL,
)
GO

CREATE TABLE [RentACar_Pesado](
	[tipoVeiculoCodigo] [varchar](512) NOT NULL PRIMARY KEY,
	[peso] [int] NOT NULL,
	[passageiros] [int] NOT NULL,
	FOREIGN KEY ([tipoVeiculoCodigo]) REFERENCES [RentACar_TipoVeiculo] ([codigo]),
)
GO

CREATE TABLE [RentACar_Ligeiro](
	[tipoVeiculoCodigo] [varchar](512) NOT NULL PRIMARY KEY,
	[portas] [int] NOT NULL,
	[combustivel] [varchar](512) NOT NULL,
	[numlugares] [int] NOT NULL,
	FOREIGN KEY ([tipoVeiculoCodigo]) REFERENCES [RentACar_TipoVeiculo] ([codigo]),
)
GO

CREATE TABLE [RentACar_Veiculo](
	[matricula] [varchar](512) NOT NULL PRIMARY KEY,
	[marca] [varchar](512) NOT NULL,
	[ano] [varchar](512) NOT NULL,
	[tipoVeiculoCodigo] [varchar](512) NOT NULL REFERENCES [RentACar_TipoVeiculo] ([codigo]),
)
GO

CREATE TABLE [RentACar_Balcao](
	[numero] [int] NOT NULL PRIMARY KEY,
	[nome] [varchar](512) NOT NULL,
	[endereco] [varchar](512) NOT NULL,
)
GO

CREATE TABLE [RentACar_Cliente](
	[NIF] [varchar](9) NOT NULL PRIMARY KEY,
	[Nome] [varchar](256) NOT NULL,
	[endereco] [varchar](512) NOT NULL,
	[numCarta] [varchar](16) NOT NULL,
)
GO

CREATE TABLE [RentACar_Aluguer](
	[numero] [int] NOT NULL PRIMARY KEY,
	[duracao] [time] NOT NULL,
	[data] [date] NOT NULL,
	[ClienteNIF] [varchar](9) NOT NULL REFERENCES [RentACar_Cliente] ([NIF]),
	[BalcaoNumero] [int] NOT NULL REFERENCES [RentACar_Balcao] ([numero]),
	[VeiculoMatricula] [varchar](512) NOT NULL REFERENCES [RentACar_Veiculo] ([matricula]),
)
GO