--RETORNAR VARIOS VALORES USAR *IN* na subConsulta, se for apenas 1 pode usar os operadores logicos

USE bdEscola

--1. Crie uma visão “Preço_Baixo” que exiba o código, nome do curso, carga horária e o valor do curso de todos os cursos 
--que tenha preço inferior ao preço médio.

ALTER VIEW vwPrecoBaixo AS
	SELECT codCurso, nomeCurso, cargaHorariaCurso, valorCurso
		FROM tbCurso
			WHERE valorCurso < (SELECT AVG (valorCurso) FROM tbCurso)
			
SELECT * FROM vwPrecoBaixo

--2. Usando a visão “Preço_Baixo”, mostre todos os cursos ordenados por carga horária.​

SELECT * FROM vwPrecoBaixo
	ORDER BY cargaHorariaCurso 
	
--3.Crie uma visão “Alunos_Turma” que exiba o curso e a quantidade de alunos por turma.

ALTER VIEW vwAlunosTurma AS
	SELECT nomeCurso, COUNT(tbAluno.codAluno) AS 'Qtde. de alunos'
		FROM tbCurso 
			INNER JOIN tbTurma
				ON tbCurso.codCurso = tbTurma.codCurso 
			INNER JOIN tbMatricula
				ON tbturma.codTurma = tbMatricula.codTurma
			INNER JOIN tbAluno
				ON tbMatricula.codAluno = tbAluno.codAluno
				GROUP BY nomeCurso

SELECT * FROM vwAlunosTurma

--4. Usando a visão “Alunos_Turma” exiba a turma com maior número de alunos.​

SELECT * FROM vwAlunosTurma WHERE nomeCurso = (SELECT MAX(nomeCurso) FROM vwAlunosTurma)

--5. Crie uma visão “Alunos_Turma” que exiba o curso e a quantidade de turmas.

ALTER VIEW vwTurmaCurso AS
	SELECT nomeCurso AS 'Curso', COUNT(codTurma) AS 'Qtde. de turma'
		FROM tbCurso
			LEFT JOIN tbTurma
			ON tbCurso.codCurso = tbTurma.codCurso		
			GROUP BY nomeCurso
			
SELECT * FROM vwTurmaCurso

--6. Usando a visão “Turma_Curso exiba o curso com menor número de turmas.

SELECT * FROM vwTurmaCurso WHERE [Qtde. de turma] = (SELECT MIN([Qtde. de turma]) FROM vwTurmaCurso)
	