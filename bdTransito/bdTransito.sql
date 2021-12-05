CREATE DATABASE bdTransito

USE bdTransito

CREATE TABLE tbMotorista (
	idMotorista INT PRIMARY KEY IDENTITY(1,1)
	, nomeMotorista VARCHAR(80) NOT NULL
	, dataNascimentoMotorista SMALLDATETIME NOT NULL
	, cpfMotorista VARCHAR(11) NOT NULL
	, cnhMotorista VARCHAR(11) NOT NULL
	, pontuacaoAcumulada INT
)

CREATE TABLE tbVeiculo (
	idVeiculo INT PRIMARY KEY IDENTITY(1,1)
	, modeloVeiculo VARCHAR(50) NOT NULL
	, placa VARCHAR(7) NOT NULL
	, renavam VARCHAR(11) NOT NULL
	, anoVeiculo INT NOT NULL
	, idMotorista INT FOREIGN KEY REFERENCES tbMotorista(idMotorista)
)

CREATE TABLE tbMultas (
	idMulta INT PRIMARY KEY IDENTITY(1,1)
	, dataMulta DATE NOT NULL
	, horaMulta TIME NOT NULL
	, pontosMulta INT NOT NULL
	, idVeiculo INT FOREIGN KEY REFERENCES tbVeiculo(idVeiculo)
)
