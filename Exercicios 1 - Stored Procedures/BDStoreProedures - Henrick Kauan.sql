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



USE bdStoreProcedure

/*
a)Criar uma Stored Procedure para inserir as categorias de produto conforme abaixo:
*/
CREATE PROCEDURE spInsereCategoria
	@nomeCategoria VARCHAR(60)
AS
	begin
		IF EXISTS(SELECT nomeCategoriaProduto FROM tbCategoriaProduto WHERE nomeCategoriaProduto LIKE @nomeCategoria)
			begin
				print('ERRO: Categoria ' + @nomeCategoria + ' j� cadastrada!')
			end
			else
			begin 
				INSERT INTO tbCategoriaProduto(nomeCategoriaProduto)
				VALUES(@nomeCategoria)
				print('Categoria ' + @nomeCategoria + ' cadastrada com sucesso!')
			end
	end

EXEC spInsereCategoria 'Bolo Festa'
EXEC spInsereCategoria 'Bolo Simples'
EXEC spInsereCategoria 'Torta'
EXEC spInsereCategoria 'Salgado'

/*
b)Criar uma Stored Procedure para inserir os produtos abaixo, sendo que,  
a procedure dever� antes de inserir verificar se o nome do produto j� existe, 
evitando assim que um produto seja duplicado:
*/
CREATE PROCEDURE spInsereProduto
	@nomeProduto VARCHAR(60), @precoKiloProduto SMALLMONEY, @codCategoriaProduto INT
AS
	begin
		IF EXISTS(SELECT nomeProduto FROM tbProduto WHERE nomeProduto LIKE @nomeProduto)
			begin
				print('ERRO: Produto ' + @nomeProduto + ' j� cadastrado!')
			end
			else
			begin
				INSERT INTO tbProduto(nomeProduto, precoKiloProduto, codCategoriaProduto)
				VALUES(@nomeProduto, @precoKiloProduto, @codCategoriaProduto)
				print('Produto' + @nomeProduto + ' foi cadastrado com sucesso!')
			end
	end

	EXEC spInsereProduto 'Bolo Floresta Negra', 42.00, 1
	EXEC spInsereProduto 'Bolo Prest�gio', 43.00 , 1
	EXEC spInsereProduto 'Bolo Nutella', 44.00, 1
	EXEC spInsereProduto 'Bolo Formigueiro', 17.00, 2
	EXEC spInsereProduto 'Bolo de cenoura', 19.00, 2
	EXEC spInsereProduto 'Torta de palmito', 45.00, 3
	EXEC spInsereProduto 'Torta de frango e catupiry', 47.00, 3
	EXEC spInsereProduto 'Torta de escarola', 44.00, 3
	EXEC spInsereProduto 'Coxinha de frango', 25.00, 4
	EXEC spInsereProduto 'Esfiha carne', 27.00, 4
	EXEC spInsereProduto 'Folha de queijo', 31.00, 4
	EXEC spInsereProduto 'Risoles Misto', 29.00, 4

/*
c)Criar uma stored procedure para cadastrar os clientes abaixo relacionados, 
sendo que dever�o ser feitas duas valida��es:

-Verificar pelo CPF se o cliente j� existe. Caso j� existaemitir a mensagem: 
�Cliente cpfXXXXX j� cadastrado�(Acrescentar a coluna CPF)

-Verificar  se  o  cliente  �  morador  de  Itaquera  ou  Guaianases,  pois  a 
confeitaria  n�o  realiza entregas para clientes que residam fora desses bairros. 
Caso o cliente n�o seja morador desses bairros enviar a mensagem �N�o foi poss�vel 
cadastraro cliente XXXX pois o bairro XXXX n�o � atendido pela confeitaria�
*/
CREATE PROCEDURE spInsireClient
	@nomeCliente VARCHAR(60), @dataNascimentoCliente SMALLDATETIME, @ruaCliente VARCHAR(150)
	, @numCasaCliente VARCHAR(4), @cepCliente VARCHAR(10), @bairroCliente VARCHAR(120), @cidadeCliente VARCHAR(60)
	, @estadoCliente VARCHAR(60), @cpfCliente VARCHAR(11), @sexoCliente VARCHAR(1)
AS
	begin
		IF NOT EXISTS(SELECT cpfCliente FROM tbCliente WHERE cpfCliente LIKE @cpfCliente)
			begin
				IF(@cidadeCliente LIKE 'S�o Paulo')
				begin
					IF(@bairroCliente IN ('Guaianases', 'Itaquera'))
					begin
							INSERT INTO tbCliente(nomeCliente, dataNascimentoCliente, ruaCliente, numCasaCliente, cepCliente
							, bairroCliente, cidadeCliente, estadoCliente, cpfCliente, sexoCliente)
							VALUES(@nomeCliente, @dataNascimentoCliente, @ruaCliente, @numCasaCliente, @cepCliente, @bairroCliente
							, @cidadeCliente, @estadoCliente, @cpfCliente, @sexoCliente)
							print('Cliente ' + @nomeCliente + ' cadastrado(a) com sucesso!')
					end
					else
					begin
						print('N�o foi possivel cadastrar o cliente ' + @nomeCliente + ' pois o bairro ' + @bairroCliente + ' n�o � atendido pela confeitaria.')
					end
				end
				else
				begin
					print('N�o foi possivel cadastrar o cliente ' + @nomeCliente + ' pois a cidade ' + @cidadeCliente + ' n�o � atendido pela confeitaria.')
				end
			end
			else
			begin
				print('Cliente CPF ' + @cpfCliente + ' j� cadastrado!')
			end
	end 

	SELECT * FROM tbCliente

	EXEC spInsireClient 'Samira Fatah', '05/05/1990', 'Rua Aguape�', '1000', '08.090-000', 'Guaianases', 'S�o Paulo', 'S�o Paulo', '11111111111', 'F'
	EXEC spInsireClient 'Celia Nogueira', '06/06/1992', 'Rua Andes', '234', '08.456-090', 'Guaianases', 'S�o Paulo', 'S�o Paulo', '21111111111', 'F'
	EXEC spInsireClient 'Paulo Cesar Siqueira', '04/04/1984', 'Rua Castelo do Piau�', '232', '08.109-000', 'Itaquera', 'S�o Paulo', 'S�o Paulo', '31111111111', 'M'
	EXEC spInsireClient 'Rodrigo Favaroni', '09/04/1991', 'Rua Sans�o Castelo Branco', '10', '08.413-090', 'Guaianases', 'S�o Paulo', 'S�o Paulo', '41111111111', 'M'
	EXEC spInsireClient 'Fl�via Regina Brito', '22/04/1992', 'Rua Mariano Moro', '300', '08.200-123', 'Itaquera', 'S�o Paulo', 'S�o Paulo', '51111111111', 'F'
	
/*
Criar via stored procedureas encomendas abaixo relacionadas, fazendo as verifica��es abaixo:

-No  momento  da  encomenda  o  cliente  ir�  fornecer  o  seu  cpf.  Caso  ele  n�o  tenha  
sido cadastrado enviar a mensagem �n�o foi poss�vel efetivar a encomenda pois o cliente xxxx n�o est� cadastrado�

-Caso tudo esteja correto, efetuar a encomenda e emitir a mensagem: �Encomenda XXX para  o cliente YYY efetuada com sucesso�
sendo que no lugar de XXX dever� aparecer o n�mero da encomenda e no YYY dever� aparecer o nome do cliente;
*/
CREATE PROCEDURE spEncomenda
@cpf CHAR(11), @valor SMALLMONEY, @data DATE
AS
	IF NOT EXISTS (SELECT cpfCliente FROM tbCliente WHERE cpfCliente LIKE @cpf)
		BEGIN
	PRINT ('n�o foi poss�vel efetivar a encomenda pois o cliente com o CPF: '+@cpf+' n�o est� cadastrado')
		END
	ELSE
		BEGIN
			DECLARE @codCliente INT, @nomeCliente VARCHAR(50)
			SELECT @codCliente=codCliente, @nomeCliente=nomeCliente FROM tbCliente WHERE cpfCliente LIKE @cpf

			INSERT INTO tbencomenda (dataEncomenda, codCliente, valorTotalEncomenda, dataEntregaEncomenda) 
			VALUES (GETDATE(), @codCliente, @valor, @data)

			DECLARE @codEncomenda INT
			SELECT @codEncomenda = MAX(codEncomenda) FROM tbEncomenda 
			PRINT('Encomenda '+ CONVERT(VARCHAR(6), @codEncomenda) +' para o cliente '+ @nomeCliente +' efetuada com sucesso')
		END

EXEC spEncomenda '11111111111', 450, '24/02/2004'
EXEC spEncomenda '21111111111', 200, '25/02/2004'
EXEC spEncomenda '31111111111', 1500, '26/02/2004'
EXEC spEncomenda '41111111111', 250, '27/02/2004'
EXEC spEncomenda '51111111111', 150, '28/02/2004'
