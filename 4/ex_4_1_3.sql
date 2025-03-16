DROP TABLE IF EXISTS StockManagement_Encomenda;
DROP TABLE IF EXISTS StockManagement_Fornecedor;
DROP TABLE IF EXISTS StockManagement_CondicoesFornecedor;
DROP TABLE IF EXISTS StockManagement_TipoFornecedor;
DROP TABLE IF EXISTS StockManagement_Produtos;
DROP TABLE IF EXISTS StockManagement_Armazem;

CREATE TABLE [StockManagement_Armazem](
	[quantidade] [int] NOT NULL PRIMARY KEY,
)
GO

CREATE TABLE [StockManagement_Produtos](
	[codigo] [int] NOT NULL PRIMARY KEY,
	[preco] [float] NOT NULL,
	[nome] [varchar] (512) NOT NULL,
	[taxaIVA] [float] NOT NULL,
	[quantidade] [int] REFERENCES [StockManagement_Armazem] ([quantidade]),
)
GO

CREATE TABLE [StockManagement_TipoFornecedor](
	[codigo] [int] NOT NULL PRIMARY KEY,
	[designacao] [varchar] (512) NOT NULL,
)
GO

CREATE TABLE [StockManagement_CondicoesFornecedor](
	[codigo] [int] NOT NULL PRIMARY KEY,
	[designacao] [varchar] (512) NOT NULL,
)
GO

CREATE TABLE [StockManagement_Fornecedor](
	[NIF] [int] NOT NULL PRIMARY KEY,
	[nome] [varchar] (512) NOT NULL,
	[email] [varchar] (512) NOT NULL,
	[TipoFornecedorCodigo] [int] REFERENCES [StockManagement_TipoFornecedor] ([codigo]),
	[CondicoesPagamentoCodigo] [int] REFERENCES [StockManagement_CondicoesFornecedor] ([codigo]),
)
GO

CREATE TABLE [StockManagement_Encomenda](
	[numero] [int] NOT NULL PRIMARY KEY,
	[data] [date] NOT NULL,
	[NIF] [int] REFERENCES [StockManagement_Fornecedor] ([NIF]),
)
GO