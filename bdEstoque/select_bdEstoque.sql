USE bdEstoque

/*a) Listar as descri��es dos produtos ao lado do nome dos fabricantes*/
SELECT descricaoProduto, nomeFabricante FROM tbProduto
	INNER JOIN tbFabricante
	ON tbFabricante.codFabricante = tbProduto.codFabricante

/*b) Listar as descri��es dos produtos ao lado do nome dos fornecedores*/
alfab�tica*/
SELECT SUM(valorTotalVenda) AS 'SOMA DAS VENDAS', nomeCliente FROM tbVenda
	INNER JOIN tbCliente
	ON tbVenda.codCliente = tbCliente.codCliente
	GROUP BY nomeCliente

/*g) Listar a soma dos pre�os dos produtos agrupados pelo nome do fabricante*/
	INNER JOIN tbFabricante
	ON tbProduto.codFabricante = tbFabricante.codFabricante
	GROUP BY nomeFabricante

/*h) Listar a m�dia dos pre�os dos produtos agrupados pelo nome do fornecedor*/
SELECT AVG(valorProduto) AS 'M�DIA PRE�OS', nomeFornecedor FROM tbProduto

/*i) Listar a soma das vendas agrupadas pelo nome do produto*/
SELECT SUM(valorTotalVenda) AS 'SOMA DAS VENDAS', descricaoProduto FROM tbVenda
	INNER JOIN tbItensVenda	
	ON tbItensVenda.codVenda = tbVenda.codVenda
	INNER JOIN tbProduto	
	ON tbItensVenda.codProduto = tbProduto.codProduto
	GROUP BY descricaoProduto

/*Listar a soma das vendas pelo nome do cliente somente das vendas realizadas em
fevereiro de 2014*/
SELECT SUM(valorTotalVenda) AS 'SOMA DAS VENDAS', nomeCliente FROM tbVenda
	INNER JOIN tbCliente	
	ON tbVenda.codCliente = tbCliente.codCliente
	WHERE MONTH(dataVenda) = 2
	GROUP BY nomeCliente
	