CREATE DATABASE bdEscoladeIdiomas

USE bdEscoladeIdiomas

CREATE TABLE tbAluno (
	idAluno INT PRIMARY KEY IDENTITY(1,1)
	, nomeAluno VARCHAR(60) NOT NULL
	, rgAluno VARCHAR(15) NOT NULL
	, enderecoAluno VARCHAR(150) NOT NULL
	, numEndAluno VARCHAR(4) NOT NULL
	, compAluno VARCHAR(20) NOT NULL
	, bairroAluno VARCHAR(50) NOT NULL
	, cepAluno VARCHAR(10) NOT NULL
	, cidadeAluno VARCHAR(50) NOT NULL 
)

CREATE TABLE tbFoneAluno (
	idFoneAluno INT PRIMARY KEY IDENTITY(1,1)
	, numFoneAluno VARCHAR(15) NOT NULL
	, idAluno INT FOREIGN KEY REFERENCES tbAluno(idAluno)
)

CREATE TABLE tbCurso (
	idCurso INT PRIMARY KEY IDENTITY(1,1)
	, nomeCurso VARCHAR(30) NOT NULL
)

CREATE TABLE tbNivel (
	idNivel INT PRIMARY KEY IDENTITY(1,1)
	, descNivel VARCHAR(30) NOT NULL
)

CREATE TABLE tbPeriodo (
	idPeriodo INT PRIMARY KEY IDENTITY(1,1)
	, descPeriodo VARCHAR(30) NOT NULL
)

CREATE TABLE tbDiaSemana (
	idDiaSemana INT PRIMARY KEY IDENTITY(1,1)
	, diaSemana VARCHAR(30) NOT NULL
)

CREATE TABLE tbTurma (
	idTurma INT PRIMARY KEY IDENTITY(1,1)
	, horarioTurma VARCHAR(15) NOT NULL
	, idCurso INT FOREIGN KEY REFERENCES tbCurso(idCurso)
	, idPeriodo INT FOREIGN KEY REFERENCES tbPeriodo(idPeriodo)
	, idNivel INT FOREIGN KEY REFERENCES tbNivel(idNivel)
	, idDiaSemana INT FOREIGN KEY REFERENCES tbDiaSemana(idDiaSemana)
)

CREATE TABLE tbMatricula (
	idMatricula INT PRIMARY KEY IDENTITY(1,1)
	, dataMatricula SMALLDATETIME NOT NULL
	, idAluno INT FOREIGN KEY REFERENCES tbAluno(idAluno)
	, idTurma INT FOREIGN KEY REFERENCES tbTurma(idTurma)
)

















