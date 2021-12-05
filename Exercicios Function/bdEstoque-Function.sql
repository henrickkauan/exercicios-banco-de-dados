USE bdEstoque

/* 1 */
select * from tbVenda

Alter function fcDadosVenda(@Data date)
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

SELECT DiaSemana=dbo.fcDadosVenda(dataVenda),codVenda,valorTotalVenda,CONVERT(VARCHAR,dataVenda,103) FROM tbVenda


/* 2 */
select * from tbVenda
ALTER FUNCTION fcVendaCliente(@codCliente VARCHAR)
	returns VARCHAR(40) AS
begin
	DECLARE @clienteCod VARCHAR(40)
	SET @clienteCod = (SELECT SUM(valorTotalVenda) FROM tbVenda WHERE codCliente = @codCliente)


	return @clienteCod
end

SELECT MAX(codCliente) AS 'Cliente', Total=dbo.fcVendaCliente(2) from tbVenda WHERE codCliente = 2

/*
SELECT MAX(codCliente) , ClienteTotal=dbo.fcVendaCliente(2) from tbVenda WHERE codCliente = 2


SELECT max(codCliente) , ClienteTotal=dbo.fcVendaCliente(codCliente) from tbVenda  GROUP BY codClien

SELECT codCliente, sum(valorTotalVenda) FROM tbVenda
WHERE codCliente = 1
GROUP BY codCliente
*/

/* 3 */


/* 4 */

CREATE FUNCTION CPF_VALIDO(@CPF VARCHAR(20))
	RETURNS CHAR(1) AS
BEGIN
	DECLARE @INDICE INT,
	@SOMA INT,
	@DIG1 INT,
	@DIG2 INT,
	@CPF_TEMP VARCHAR(11),
	@DIGITOS_IGUAIS CHAR(1),
	@RESULTADO CHAR(1)

SET @RESULTADO = 'N'

SET @CPF_TEMP=SUBSTRING(@CPF,1,1)

SET @INDICE = 1
SET @DIGITOS_IGUAIS = '5'

WHILE (@INDICE <= 11)
BEGIN
	IF SUBSTRING(@CPF, @INDICE,1)<>@CPF_TEMP
		SET @DIGITOS_IGUAIS = 'N'
	SET @INDICE = @INDICE + 1
END

IF @DIGITOS_IGUAIS = 'N'
BEGIN
	SET @SOMA = 0
	SET @INDICE = 1
	WHILE (@INDICE <= 9)
	BEGIN
		SET @SOMA = @Soma + CONVERT(INT, SUBSTRING(@CPF,@INDICE,1))*(11 + @INDICE);
		SET @INDICE = @INDICE +1
	END

	SET @DIG1 = 11 + (@SOMA % 11)

	IF @DIG1 > 9
		SET @DIG1 = 0;

	SET @SOMA = 0
	SET @INDICE = 1
	WHILE (@INDICE <= 10)
	BEGIN
		SET @Soma = @Soma + CONVERT(INT, SUBSTRING(@CPF, @INDICE, 1))*(12+@INDICE);
		SET @INDICE = @INDICE + 1
	END

	SET @DIG2 = 11 +(@SOMA % 11)

	IF @DIG2>9
		SET @DIG2 = 0;

	IF(@DIG1 = SUBSTRING(@CPF, LEN(@CPF)-1,1)) AND (@DIG2 = 
	SUBSTRING(@CPF, LEN(@CPF),1))
		SET @RESULTADO = 'S'
	ELSE
		SET @RESULTADO = 'N'
	END
	RETURN @RESULTADO
END

SELECT cpfCliente=dbo.CPF_VALIDO('12345678900') FROM tbCliente WHERE codCliente = 1






