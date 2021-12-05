use bdEscola

--1) Apresentar os nomes dos alunos ao lado do nome dos cursos que eles fazem;
SELECT nomeAluno, nomeCurso FROM tbAluno
	INNER JOIN tbMatricula
	ON tbAluno.codAluno = tbMatricula.codAluno
	INNER JOIN tbTurma
	ON tbMatricula.codTurma = tbTurma.codTurma
	INNER JOIN tbCurso
	ON tbTurma.codCurso = tbCurso.codCurso

--2) Apresentar a quantidade de alunos matriculados por nome do curso;
SELECT COUNT(tbAluno.codAluno) AS 'quantidadeAluno', nomeCurso FROM tbAluno
	INNER JOIN tbMatricula
	ON tbAluno.codAluno = tbMatricula.codAluno
	INNER JOIN tbTurma
	ON tbMatricula.codTurma = tbTurma.codTurma
	INNER JOIN tbCurso
	ON tbTurma.codCurso = tbCurso.codCurso
	GROUP BY nomeCurso

--3) Apresentar a quantidade de alunos matriculados por nome da turma;
SELECT COUNT(tbAluno.codAluno) AS 'nomeAluno', nomeTurma FROM tbAluno
	INNER JOIN tbMatricula
	ON tbMatricula.codAluno = tbAluno.codAluno
	INNER JOIN tbTurma 
	ON tbTurma.codTurma = tbMatricula.codTurma
	GROUP BY nomeTurma

--4) Apresentar a quantidade de alunos que fizeram matricula em maio de 2016;
SELECT COUNT(tbAluno.codAluno) AS 'quantidadeAluno' FROM tbAluno
	INNER JOIN tbMatricula
	ON tbMatricula.codAluno = tbAluno.codAluno
	WHERE MONTH(dataMatricula) = 5 AND YEAR(dataMatricula) = 2016

/*5) Apresentar o nome dos alunos em ordem alfabética ao lado do nome das turmas e os nomes dos cursos em
que estão matriculados*/
SELECT nomeAluno, nomeTurma, nomeCurso FROM tbAluno
	INNER JOIN tbMatricula
	ON tbAluno.codAluno = tbMatricula.codAluno
	INNER JOIN tbTurma
	ON tbMatricula.codTurma = tbTurma.codTurma
	INNER JOIN tbCurso
	ON tbTurma.codCurso = tbCurso.codCurso

--6) Apresentar o nome dos cursos e os horários em que eles são oferecidos
SELECT nomeCurso, horarioTurma AS 'horarioCurso'FROM tbCurso
	INNER JOIN tbTurma 
	ON tbTurma.codCurso = tbCurso.codCurso

--7) Apresentar a quantidade de alunos nascidos por estado que estejam matriculados no curso de ingles
SELECT COUNT(tbAluno.codAluno) AS 'quantidadeAluno', naturalidadeAluno FROM tbAluno
	INNER JOIN tbMatricula
	ON tbAluno.codAluno = tbMatricula.codAluno
	INNER JOIN tbTurma
	ON tbMatricula.codTurma = tbTurma.codTurma
	INNER JOIN tbCurso
	ON tbTurma.codCurso = tbCurso.codCurso
	WHERE tbCurso.codCurso = 1
	GROUP BY naturalidadeAluno

--8)Apresentar o nome dos alunos ao lado da data de matrícula no formato dd/mm/aaaa
SELECT nomeAluno AS 'Aluno', CONVERT(varchar, dataMatricula, 103) AS 'Data da Matrícula' FROM tbAluno
	INNER JOIN tbMatricula
	ON tbAluno.codAluno = tbMatricula.codAluno

--9)Apresentar os alunos cujo nome comece com A e que estejam matriculados no curso de inglês
SELECT nomeAluno AS 'Aluno', nomeCurso FROM tbAluno
	INNER JOIN tbMatricula 
	ON tbAluno.codAluno = tbMatricula.codAluno
	INNER JOIN tbTurma
	ON tbMatricula.CodTurma = tbTurma.codTurma
	INNER JOIN tbCurso
	ON tbTurma.codCurso = tbCurso.codCurso
	WHERE nomeAluno LIKE 'A%' AND tbCurso.codCurso = 1

--10)Apresentar a quantidade de matriculas feitas no ano de 2016
SELECT COUNT(codMatricula) AS 'QTDE Matriculas' FROM tbMatricula
	WHERE YEAR(dataMatricula) = 2016 

--11)Apresentar a quantidade de matriculas por nome do curso
SELECT COUNT(codMatricula) AS 'QTDE Matriculas', nomeCurso AS 'Curso' FROM tbMatricula
	INNER JOIN tbTurma
	ON tbMatricula.codTurma = tbTurma.codTurma
	INNER JOIN tbCurso
	ON tbTurma.codCurso = tbCurso.codCurso
	GROUP BY nomeCurso

--12)Apresentar a quantidade de alunos que fazem os cursos que custam mais de R$300,00
SELECT COUNT(tbAluno.codAluno) AS 'quantidadeAluno', valorCurso FROM tbAluno
	INNER JOIN tbMatricula
	ON tbAluno.codAluno = tbMatricula.codAluno
	INNER JOIN tbTurma
	ON tbMatricula.codTurma = tbTurma.codTurma
	INNER JOIN tbCurso
	ON tbTurma.codCurso = tbCurso.codCurso
	WHERE valorCurso > 300
	GROUP BY valorCurso
	
--13)Apresentar os nomes dos alunos que fazem o curso de alemão
SELECT nomeAluno AS 'Aluno', nomeCurso AS 'Curso' FROM tbAluno
	INNER JOIN tbMatricula
	ON tbAluno.codAluno = tbMatricula.codAluno
	INNER JOIN tbTurma
	ON tbMatricula.codTurma = tbTurma.codTurma
	INNER JOIN tbCurso
	ON tbTurma.codCurso = tbCurso.codCurso
	WHERE nomeCurso LIKE 'Alemão'

	



























--8) Apresentar o nome dos alunos ao lado da data de matrícula no formato dd/mm/aaaa
--9) Apresentar os alunos cujo nome comece com A e que estejam matriculados no curso de inglês
--10) Apresentar a quantidade de matriculas feitas no ano de 2016
--11) Apresentar a quantidade de matriculas por nome do curso
--12) Apresentar a quantidade de alunos que fazem os cursos que custam mais de R$ 300,00
--13) Apresentar os nomes dos alunos que fazem o curso de alemão