USE bdEscoladeIdiomas

INSERT INTO tbCurso (nomeCurso) 
VALUES ('Espanhol') --1
	,('Inglês') --2
	,('Alemão') --3

SELECT * FROM tbCurso

INSERT INTO tbPeriodo (descPeriodo)
VALUES ('Manhã') --1
	,('Tarde') --2
	,('Noite') --3

SELECT * FROM tbPeriodo

INSERT INTO tbNivel (descNivel)
VALUES ('Iniciante') --1
	,('Intermediario') --2
	,('Fluente') --3

SELECT * FROM tbNivel

INSERT INTO tbDiaSemana (diaSemana)
VALUES ('Segunda-Feira') --1
	,('Terça-Feira') --2
	,('Quarta-Feira') --3
	,('Quinta-Feira') --4
	,('Sexta-Feira') --5
	,('Sabado') --6

SELECT * FROM tbDiaSemana

INSERT INTO tbAluno (nomeAluno, rgAluno, enderecoAluno, numEndAluno, compAluno, bairroAluno, cepAluno, cidadeAluno) 
VALUES ('Henrick Kauan', '12.345.678-x', 'Praça das Bandeiras', '915', 'Ap72 Bloco B', 'Setor Central', '75689-970', 'São Paulo') --1
	,('Pedro Silva', '34.582.473-8', 'Rua Anphilóphio Braga', '716', 'Ap10 Bloco C', 'Gilberto Machado', '29303-913', 'São Paulo') --2
	,('Juliana Maria', '33.098.572-3', 'Rua Irmã Catarina Levrine', '315', 'Ap12 Bloco D', 'Memorare', '64008-230', 'São Paulo') --3
	,('Gilberto Almeida', '10.444.946-9', 'Avenida Luiza Damasceno Soares', '766', 'Ap15 Bloco E', 'Jardim Marco Zero', '68903-365', 'São Paulo') --4
	,('Maria Souza', '40.333.697-1', 'Passagem Mangueirão', '436', 'Ap20 Bloco A', 'Caranazal', '68040-674', 'São Paulo') --5
	,('Vania Nascimento', '31.159.819-5', 'Avenida FAB', '651', 'Ap13 Bloco E', 'Central', '68906-907', 'São Paulo') --6

SELECT * FROM tbAluno

INSERT INTO tbFoneAluno (numFoneAluno, idAluno)
VALUES ('(11) 3991-4577', 1)
	,('(11) 99403-4422', 1)
	,('(11) 3645-8486', 2)
	,('(11) 98462-1360', 2)
	,('(11) 2552-7657', 3)
	,('(11) 99155-3232', 3)
	,('(11) 2643-4557', 4)
	,('(11) 99510-1188', 4)
	,('(11) 2935-0559', 5)
	,('(11) 98388-2990', 5)
	,('(11) 2562-9999', 6)
	,('(11) 98623-3103', 6)

SELECT * FROM tbFoneAluno

INSERT INTO tbTurma (horarioTurma, idCurso, idPeriodo, idNivel, idDiaSemana)
VALUES ('9:00', 1, 1, 1, 1) --1
	,('12:00', 1, 2, 2, 2) --2
	,('9:00', 2, 1, 2, 3) --3
	,('12:00', 2, 2, 3, 4) --4
	,('19:00', 3, 3, 1, 5) --5

SELECT * FROM tbTurma


INSERT INTO tbMatricula (dataMatricula, idAluno, idTurma)
VALUES ('08/01/2021', 1, 1) --1
	,('08/01/2021', 1, 2) --2
	,('15/01/2021', 2, 3) --3
	,('15/01/2021', 2, 4) --4
	,('20/01/2021', 3, 4) --5
	,('20/01/2021', 3, 5) --6
	,('28/01/2021', 4, 1) --7
	,('28/01/2021', 4, 2) --8
	,('05/02/2021', 5, 3) --9
	,('05/02/2021', 5, 4) --10
	,('25/02/2021', 6, 4) --11
	,('25/02/2021', 6, 5) --12

SELECT * FROM tbMatricula





