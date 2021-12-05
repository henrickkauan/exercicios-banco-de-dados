USE bdEstoque

/*a) Listar as descrições dos produtos ao lado do nome dos fabricantes*/
SELECT descricaoProduto, nomeFabricante FROM tbProduto
	INNER JOIN tbFabricante
	ON tbFabricante.codFabricante = tbProduto.codFabricante

/*b) Listar as descrições dos produtos ao lado do nome dos fornecedores*/SELECT descricaoProduto, nomeFornecedor FROM tbProduto	INNER JOIN tbFornecedor	ON tbProduto.codFornecedor = tbFornecedor.codFornecedor/*c) Listar a soma das quantidades dos produtos agrupadas pelo nome do fabricante*/SELECT SUM(quantidadeProduto) AS 'QUANTIDADE DOS PRODUTOS', nomeFabricante FROM tbProduto	INNER JOIN tbFabricante	ON tbProduto.codFabricante = tbFabricante.codFabricante		GROUP BY nomeFabricante/*d) Listar o total das vendas ao lado do nome do cliente*/SELECT valorTotalVenda, nomeCliente FROM tbVenda	INNER JOIN tbCliente	ON tbVenda.codCliente = tbCliente.codCliente/*e) Listar a média dos preços dos produtos agrupados pelo nome do fornecedor*/SELECT AVG(valorProduto) AS 'MÉDIA PREÇOS', nomeFornecedor FROM tbProduto	INNER JOIN tbFornecedor	ON tbProduto.codFornecedor = tbFornecedor.codFornecedor	GROUP BY nomeFornecedor/*Listar todas a soma das vendas agrupadas pelo nome do cliente em ordem
alfabética*/
SELECT SUM(valorTotalVenda) AS 'SOMA DAS VENDAS', nomeCliente FROM tbVenda
	INNER JOIN tbCliente
	ON tbVenda.codCliente = tbCliente.codCliente
	GROUP BY nomeCliente

/*g) Listar a soma dos preços dos produtos agrupados pelo nome do fabricante*/SELECT SUM(valorProduto) AS 'SOMA DOS PREÇO', nomeFabricante FROM tbProduto
	INNER JOIN tbFabricante
	ON tbProduto.codFabricante = tbFabricante.codFabricante
	GROUP BY nomeFabricante

/*h) Listar a média dos preços dos produtos agrupados pelo nome do fornecedor*/
SELECT AVG(valorProduto) AS 'MÉDIA PREÇOS', nomeFornecedor FROM tbProduto	INNER JOIN tbFornecedor	ON tbProduto.codFornecedor = tbFornecedor.codFornecedor	GROUP BY nomeFornecedor

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
	