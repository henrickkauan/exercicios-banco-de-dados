CREATE DATABASE bdStoreProcedure

USE bdStoreProcedure

CREATE TABLE tbCliente (
	codCliente INT PRIMARY KEY IDENTITY(1,1)
	, nomeCliente VARCHAR(60) NOT NULL
	, dataNascimentoCliente SMALLDATETIME NOT NULL
	, ruaCliente VARCHAR(150) NOT NULL
	, numCasaCliente VARCHAR(4) NOT NULL
	, cepCliente VARCHAR(10) NOT NULL
	, bairroCliente VARCHAR(120) NOT NULL
	, cidadeCliente VARCHAR (60) NOT NULL
	, estadoCliente VARCHAR (60) NOT NULL
	, cpfCliente VARCHAR(11) NOT NULL
	, sexoCliente VARCHAR(1) NOT NULL
)

CREATE TABLE tbEncomenda (
	codEncomenda INT PRIMARY KEY IDENTITY(1,1)
	, dataEncomenda SMALLDATETIME NOT NULL
	, codCliente INT FOREIGN KEY REFERENCES tbCliente(codCliente)
	, valorTotalEncomenda SMALLMONEY NOT NULL
	, dataEntregaEncomenda SMALLDATETIME NOT NULL
)

CREATE TABLE tbCategoriaProduto (
	codCategoriaProduto INT PRIMARY KEY IDENTITY(1,1)
	, nomeCategoriaProduto VARCHAR(60) NOT NULL
)

CREATE TABLE tbProduto (
	codProduto INT PRIMARY KEY IDENTITY(1,1)
	, nomeProduto VARCHAR(60) NOT NULL
	, precoKiloProduto SMALLMONEY NOT NULL
	, codCategoriaProduto INT FOREIGN KEY REFERENCES tbCategoriaProduto(codCategoriaProduto)
)

CREATE TABLE tbItensEncomenda (
	CodItensEncomenda INT PRIMARY KEY IDENTITY(1,1)
	, codEncomenda INT FOREIGN KEY REFERENCES tbEncomenda(codEncomenda)
	, codProduto INT FOREIGN KEY REFERENCES tbProduto(codProduto)
	, quantidadeKilos INT NOT NULL
	, subTotal SMALLMONEY NOT NULL
)