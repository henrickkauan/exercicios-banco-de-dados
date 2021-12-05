USE bdEscola

/* 1 - Crie uma função que informada uma data da matrícula , retorne o dia da semana.*/
CREATE function fcDiaSemana(@Data date)
	returns VARCHAR(40) AS
BEGIN
	Declare @DiaSemana VARCHAR(40)
	Declare @Dia int

	set @Dia = DATEPART(dw, @Data)
	if @Dia = 1
		begin
			set @DiaSemana = 'Domingo'
		end
	if @Dia = 2
		begin
			set @DiaSemana = 'Segunda-Feira'
		end
	if @Dia = 3
		begin
			set @DiaSemana = 'Terça-Feira'
	end
	if @Dia = 4
		begin
			set @DiaSemana = 'Quarta-Feira'
	end
	if @Dia = 5
		begin
			set @DiaSemana = 'Quinta-Feira'
	end
	if @Dia = 6
		begin
			set @DiaSemana = 'Sexta-Feira'
	end
	if @Dia = 7
		begin
		set @DiaSemana = 'Sabado'
	end
	return @DiaSemana
END


SELECT * FROM tbMatricula

SELECT DataMatricula=dbo.fcDiaSemana('24/02/2004')


/*
SELECT codAluno, dataMatricula,
DiaDaSemana=dbo.fcDiaSemana(dataMatricula) FROM tbMatricula
*/


/* 2 - Crie uma função que de acordo com a carga horária do curso exiba curso rápido ou curso extenso. (Rápido menos de 1000 horas).*/
SELECT * FROM tbCurso
	CREATE function fcCargaHoraria(@CargaH INT)
returns VARCHAR(40) AS
BEGIN
	Declare @R_E VARCHAR(30)

	if @CargaH < 1000
		begin
			set @R_E = 'Curso Rapido'
	end
	else
	if @CargaH >= 1000
		begin
			set @R_E = 'Curso Extenso'
	end
return @R_E
END

SELECT DataMatricula=dbo.fcCargaHoraria(100)

/* 3 - Crie uma função que de acordo com o valor do curso exiba  curso caro ou curso barato. (Curso caro acima de 400).*/
SELECT * FROM tbCurso

CREATE function fcValorCurso(@ValorC INT)
	returns VARCHAR(40) AS
BEGIN
	Declare @C_B VARCHAR(30)
if @ValorC < 400
	begin
		set @C_B = 'Curso Barato'
	end
	else
		if @ValorC >= 400
	begin
		set @C_B = 'Curso Caro'
	end
return @C_B
END

SELECT DataMatricula=dbo.fcValorCurso(450)

/*4 - Criar uma função que informada a data da matrícula converta-a no formato dd/mm/aaaa.​*/
/*OBS: COLOCAMOS OUTRO FORMATO DE DATA PORQUE O SQL JÁ VINHA COM O PADRÃO BRASILEIRO*/
alter FUNCTION fcConvertData(@data date)
 returns VARCHAR(40) AS
begin
	Declare @datas Varchar(40)

	SET @datas = CONVERT(VARCHAR, @data, 106)

	return @datas
end

SELECT DataConvertida=dbo.fcConvertData('24/02/2004')