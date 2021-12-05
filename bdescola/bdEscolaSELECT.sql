USE bdEscola
--1)Apresentar os nomes dos alunos ao lado do nome dos cursos que eles fazem;
SELECT nomeAluno AS 'Nome dos alunos', nomeCurso AS 'Curso'
	FROM tbAluno
		INNER JOIN tbMatricula
		ON tbAluno.codAluno = tbMatricula.codAluno
		INNER JOIN tbTurma
		ON tbMatricula.codTurma = tbTurma.codTurma
		INNER JOIN tbCurso
		ON tbTurma.codCurso = tbCurso.codCurso
			
--2)Apresentar a quantidade de alunos matriculados por nome do curso;
SELECT COUNT(nomeAluno) AS 'Qtde. de Alunos' , nomeCurso AS 'Curso'
	FROM tbAluno
		INNER JOIN tbMatricula
		ON tbAluno.codAluno = tbMatricula.codAluno
		INNER JOIN tbTurma
		ON tbMatricula.codTurma = tbTurma.codTurma
		INNER JOIN tbCurso
		ON tbTurma.codCurso = tbCurso.codCurso
			GROUP BY nomeCurso

--3)Apresentar a quantidade de alunos matriculados por nome da turma;
SELECT COUNT(nomeAluno) AS 'Qtde. de aluno', nomeTurma AS 'Turma'
	FROM tbAluno
		INNER JOIN tbMatricula
		ON tbAluno.codAluno = tbMatricula.codAluno
		INNER JOIN tbTurma
		ON tbMatricula.codTurma = tbTurma.codTurma
			GROUP BY nomeTurma

--4)Apresentar a quantidade de alunos que fizeram matricula em maio de 2016;
SELECT COUNT(codAluno) AS 'Qtde. de aluno matriculados em maio de 2016'
	FROM tbMatricula
		WHERE DATEPART(MONTH, dataMatricula) = 5 AND DATEPART(YEAR, dataMatricula) = 2016
		 
--5)Apresentar o nome dos alunos em ordem alfabética ao lado do nome das turmas e os nomes dos cursos em que estão matriculados
SELECT nomeAluno AS 'Nome dos alunos', nomeTurma AS 'Turma', nomeCurso AS 'Curso' 
	FROM tbAluno
		INNER JOIN tbMatricula
		ON tbAluno.codAluno = tbMatricula.codAluno
		INNER JOIN tbTurma
		ON tbMatricula.codTurma = tbTurma.codTurma
		INNER JOIN tbCurso
		ON tbCurso.codCurso = tbCurso.codCurso
			ORDER BY nomeAluno
 
--6)Apresentar o nome dos cursos e os horários em que eles são oferecidos
SELECT nomeCurso AS 'Nome do curso', horarioTurma AS 'Horario do curso'
	FROM tbCurso
		INNER JOIN tbTurma
		ON tbCurso.codCurso = tbTurma.codCurso

--7)Apresentar a quantidade de alunos nascidos por estado que estejam matriculados no curso de ingles
SELECT COUNT(nomeAluno) AS 'Qtde. de alunos', naturalidadeAluno AS 'Naturalidade'
	FROM tbAluno
		INNER JOIN tbMatricula
		ON tbAluno.codAluno = tbMatricula.codAluno
		INNER JOIN tbTurma
		ON tbMatricula.codTurma = tbTurma.codTurma
		INNER JOIN tbCurso
		ON tbTurma.codCurso = tbCurso.codCurso
			WHERE tbCurso.codCurso = 1
				GROUP BY naturalidadeAluno
		
--8)Apresentar o nome dos alunos ao lado da data de matrícula no formato dd/mm/aaaa
SELECT nomeAluno AS 'Aluno', CONVERT(varchar, dataMatricula, 103) AS 'Data da Matrícula'
	FROM tbAluno
		INNER JOIN tbMatricula
		ON tbAluno.codAluno = tbMatricula.codAluno
		
--9)Apresentar os alunos cujo nome comece com A e que estejam matriculados no curso de inglês
SELECT nomeAluno AS 'Aluno', nomeCurso AS 'Curso'
	FROM tbAluno
		INNER JOIN tbMatricula
		ON tbAluno.codAluno = tbMatricula.codAluno
		INNER JOIN tbTurma
		ON tbMatricula.codTurma = tbTurma.codTurma
		INNER JOIN tbCurso
		ON tbTurma.codCurso = tbCurso.codCurso
		WHERE nomeAluno LIKE 'M%' AND tbCurso.codCurso = 1
			
			--*
			--OBS: Professora eu coloquei a letra M no operador LIKE, porque não tem nenhum Aluno cadastrado com a inicial 'A'
			--*

			
--10)Apresentar a quantidade de matriculas feitas no ano de 2016
SELECT COUNT(codMatricula) AS 'Qtde. de matriculas feitas em 2016'
	FROM tbMatricula
		WHERE DATEPART(YEAR, dataMatricula) = 2016

--11)Apresentar a quantidade de matriculas por nome do curso
SELECT COUNT(codMatricula) AS 'Qtde. de matriculas', nomeCurso AS 'Curso'
	FROM tbMatricula
		INNER JOIN tbTurma
		ON tbMatricula.codTurma = tbTurma.codTurma
		INNER JOIN tbCurso
		ON tbTurma.codCurso = tbCurso.codCurso
			GROUP BY nomeCurso

--12)Apresentar a quantidade de alunos que fazem os cursos que custam mais de R$300,00
SELECT COUNT(nomeAluno) AS 'Qtde de Alunos', valorCurso AS 'R$: Valor do curso'
	FROM tbAluno
		INNER JOIN tbMatricula
		ON tbAluno.codAluno = tbMatricula.codAluno
		INNER JOIN tbTurma
		ON tbMatricula.codTurma = tbTurma.codTurma
		INNER JOIN tbCurso
		ON tbTurma.codCurso = tbCurso.codCurso
			WHERE valorCurso > 300.00
				GROUP BY valorCurso

--13)Apresentar os nomes dos alunos que fazem o curso de alemão
SELECT nomeAluno AS 'Aluno', nomeCurso AS 'Curso'
	FROM tbAluno
		INNER JOIN tbMatricula
		ON tbAluno.codAluno = tbMatricula.codAluno
		INNER JOIN tbTurma
		ON tbMatricula.codTurma = tbTurma.codTurma
		INNER JOIN tbCurso
		ON tbTurma.codCurso = tbCurso.codCurso
			WHERE nomeCurso LIKE 'Alemão%'
				