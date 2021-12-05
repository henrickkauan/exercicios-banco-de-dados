USE bdEscola

INSERT INTO tbAluno(nomeAluno, dataNascAluno, rgAluno, naturalidadeAluno)
VALUES ('Paulo Santos', '03/10/2000', '82.292.122-0', 'SP') --1
	, ('Maria da Gloria', '10/03/1999', '45.233.123-0', 'SP') --2
	, ('Perla Nogueira Silva', '04/04/1998', '23.533.211-9', 'SP') --3
	, ('Gilson Barros Silva', '09/09/1995', '34.221.111-x', 'PE') --4
	, ('Mariana Barbosa Santos', '10/10/2001', '54.222.122-9', 'RJ') --5
	, ('Alessandro Pereira', '11/10/2003', '24.402.454-9', 'ES') --6
	, ('Aline Melo', '08/10/2001', '88.365.012-3', 'RJ') --7

--SELECT * FROM tbAluno


INSERT INTO tbCurso(nomeCurso, cargaHorariaCurso, valorCurso)
VALUES ('Inglês', '2000', 356.00) --1
	, ('Alemão', '3000', 478.00) --2
	, ('Espanhol', '4000', 500.00) --3

--SELECT * FROM tbCurso


INSERT INTO tbTurma(nomeTurma, codCurso, horarioTurma)
VALUES ('1|A', 1, '01/01/2021 12:00') --1
	, ('1|C', 3, '01/01/2021 18:00') --2
	, ('1|B', 1, '01/01/2021 18:00') --3
	, ('1AA', 2, '01/01/2021 19:00') --4

--SELECT * FROM tbTurma


INSERT INTO tbMatricula(dataMatricula, codAluno, codTurma)
VALUES ('03/10/2015', 1, 1) --1
	, ('04/05/2014', 2, 1) --2
	, ('04/05/2012', 2, 4) --3
	, ('03/05/2016', 3, 2) --4
	, ('03/03/2015', 1, 3) --5
	, ('07/05/2015', 4, 2) --6
	, ('05/05/2015', 4, 3) --7

--SELECT * FROM tbMatricula