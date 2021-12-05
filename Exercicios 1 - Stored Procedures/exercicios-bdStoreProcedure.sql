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
				print('ERRO: Categoria ' + @nomeCategoria + ' já cadastrada!')
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
a procedure deverá antes de inserir verificar se o nome do produto já existe, 
evitando assim que um produto seja duplicado:
*/
CREATE PROCEDURE spInsereProduto
	@nomeProduto VARCHAR(60), @precoKiloProduto SMALLMONEY, @codCategoriaProduto INT
AS
	begin
		IF EXISTS(SELECT nomeProduto FROM tbProduto WHERE nomeProduto LIKE @nomeProduto)
			begin
				print('ERRO: Produto ' + @nomeProduto + ' já cadastrado!')
			end
			else
			begin
				INSERT INTO tbProduto(nomeProduto, precoKiloProduto, codCategoriaProduto)
				VALUES(@nomeProduto, @precoKiloProduto, @codCategoriaProduto)
				print('Produto' + @nomeProduto + ' foi cadastrado com sucesso!')
			end
	end

	EXEC spInsereProduto 'Bolo Floresta Negra', 42.00, 1
	EXEC spInsereProduto 'Bolo Prestígio', 43.00 , 1
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
sendo que deverão ser feitas duas validações:

-Verificar pelo CPF se o cliente já existe. Caso já existaemitir a mensagem: 
“Cliente cpfXXXXX já cadastrado”(Acrescentar a coluna CPF)

-Verificar  se  o  cliente  é  morador  de  Itaquera  ou  Guaianases,  pois  a 
confeitaria  não  realiza entregas para clientes que residam fora desses bairros. 
Caso o cliente não seja morador desses bairros enviar a mensagem “Não foi possível 
cadastraro cliente XXXX pois o bairro XXXX não é atendido pela confeitaria”
*/
CREATE PROCEDURE spInsireClient
	@nomeCliente VARCHAR(60), @dataNascimentoCliente SMALLDATETIME, @ruaCliente VARCHAR(150)
	, @numCasaCliente VARCHAR(4), @cepCliente VARCHAR(10), @bairroCliente VARCHAR(120), @cidadeCliente VARCHAR(60)
	, @estadoCliente VARCHAR(60), @cpfCliente VARCHAR(11), @sexoCliente VARCHAR(1)
AS
	begin
		DECLARE @validaBairro VARCHAR (120);

		SELECT @validaBairro = bairroCliente FROM tbCliente WHERE bairroCliente = @bairroCliente;

		IF @bairroCliente NOT IN ('Guaianases','Itaquera')
		begin
			print('ERRO: Não foi possivel cadastrar o cliente ' + @nomeCliente + ' pois o bairro ' + @bairroCliente + ' não é atendido pela confeitaria.')
		end
		else
		IF EXISTS(SELECT cpfCliente FROM tbCliente WHERE cpfCliente LIKE @cpfCliente)
		begin
			print('ERRO: Cliente com CPF ' + @cpfCliente + ' já cadastrado(a)')
		end
		else
		begin
			INSERT INTO tbCliente(nomeCliente, dataNascimentoCliente, ruaCliente, numCasaCliente, cepCliente
			, bairroCliente, cidadeCliente, estadoCliente, cpfCliente, sexoCliente)
			VALUES(@nomeCliente, @dataNascimentoCliente, @ruaCliente, @numCasaCliente, @cepCliente, @bairroCliente
			, @cidadeCliente, @estadoCliente, @cpfCliente, @sexoCliente)
			print('Cliente ' + @nomeCliente + ' cadastrado(a) com sucesso!')
		end
	end 

	SELECT * FROM tbCliente

	EXEC spInsireClient 'Samira Fatah', '05/05/1990', 'Rua Aguapeí', '1000', '08.090-000', 'Guaianases', 'São Paulo', 'São Paulo', '11111111111', 'F'
	EXEC spInsireClient 'Celia Nogueira', '06/06/1992', 'Rua Andes', '234', '08.456-090', 'Guaianases', 'São Paulo', 'São Paulo', '21111111111', 'F'
	EXEC spInsireClient 'Paulo Cesar Siqueira', '04/04/1984', 'Rua Castelo do Piauí', '232', '08.109-000', 'Itaquera', 'São Paulo', 'São Paulo', '31111111111', 'M'
	EXEC spInsireClient 'Rodrigo Favaroni', '09/04/1991', 'Rua Sansão Castelo Branco', '10', '08.413-090', 'Guaianases', 'São Paulo', 'São Paulo', '41111111111', 'M'
	EXEC spInsireClient 'Flávia Regina Brito', '22/04/1992', 'Rua Mariano Moro', '300', '08.200-123', 'Itaquera', 'São Paulo', 'São Paulo', '51111111111', 'F'
	
/*
Criar via stored procedureas encomendas abaixo relacionadas, fazendo as verificações abaixo:

-No  momento  da  encomenda  o  cliente  irá  fornecer  o  seu  cpf.  Caso  ele  não  tenha  
sido cadastrado enviar a mensagem “não foi possível efetivar a encomenda pois o cliente xxxx não está cadastrado”

-Caso tudo esteja correto, efetuar a encomenda e emitir a mensagem: “Encomenda XXX para  o cliente YYY efetuada com sucesso”
sendo que no lugar de XXX deverá aparecer o número da encomenda e no YYY deverá aparecer o nome do cliente;
*/

ALTER PROCEDURE spInsereEncomenda 
 @dataEncomenda SMALLDATETIME, @codCliente INT, @valorTotalEncomenda SMALLMONEY, @dataEntregaEncomenda SMALLDATETIME

 AS
	begin
		IF EXISTS(SELECT )

		INSERT INTO tbEncomenda(dataEncomenda,codCliente,valorTotalEncomenda,dataEntregaEncomenda)
		VALUES(@dataEncomenda,@codCliente,@valorTotalEncomenda,@dataEntregaEncomenda)
		DECLARE @idEncomenda int;
	    SET @idEncomenda = (SELECT MAX(codEncomenda) from tbEncomenda)

		print('Encomenda com codigo' + convert(varchar(6), @idEncomenda) + ' foi cadastrada com sucesso!')
	end

	SELECT * FROM tbEncomenda
	EXEC spInsereEncomenda '08/08/2015', 1, 450.00, '15/08/2015'
ALTER PROCEDURE spBuscarEncomenda
	@cpfCliente VARCHAR(11)
AS
	begin
		DECLARE @idEncomenda int;
		DECLARE @cliente VARCHAR(60);
	/*
		DECLARE @verificaCpf VARCHAR(11);
		SELECT @verificaCpf = cpfCliente FROM tbCliente WHERE cpfCliente = @cpfCliente;
	*/
		IF EXISTS(SELECT cpfCliente FROM tbCliente WHERE cpfCliente = @cpfCliente)
		begin
			SELECT @idEncomenda = codEncomenda FROM tbEncomenda WHERE codEncomenda = codCliente
			print('Encomenda')
		end




		else
		begin
			print(' NÃO CADASTRADO')

		end
	end

	EXEC spBuscarEncomenda '11111111111'

	select * from tbEncomenda
