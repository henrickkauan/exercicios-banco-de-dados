USE bdLivrariaBrasileira

--a)A quantidade de livros agrupado pelo nome do gênero
SELECT COUNT(idLivro) AS 'Quantidade de livro', nomeGenero FROM tbLivro
	INNER JOIN tbGenero
	ON tbLivro.idGenero = tbGenero.idGenero
	GROUP BY nomeGenero

--b)A soma das páginas agrupada pelo nome do autor
SELECT SUM(numPaginas) AS 'Soma das paginas', nomeAutor FROM tbLivro
	INNER JOIN tbAutor
	ON tbLivro.idAutor = tbAutor.idAutor
	GROUP BY nomeAutor

--c)A média de páginas agrupada pelo nome do autorem ordem alfabética (de A a Z)
SELECT AVG(numPaginas) AS 'Média de páginas', nomeAutor FROM tbLivro
	INNER JOIN tbAutor
	ON tbLivro.idAutor = tbAutor.idAutor
	GROUP BY nomeAutor

--d)A quantidade de livros agrupada pelo nome da editora em ordem alfabética inversa (de Z a A)
SELECT COUNT(idLivro) AS 'Quantidade Livro', nomeEditora FROM tbLivro
	INNER JOIN tbEditora
	ON tbLivro.idLivro = tbEditora.idEditora
	GROUP BY nomeEditora
	ORDER BY nomeEditora DESC

--e)A soma de páginas dos livros agrupados pelo nome do autor que sejam de autores cujo nome comece com a letra “C”
SELECT SUM(numPaginas) AS 'Soma de Páginas', nomeAutor FROM tbLivro
	INNER JOIN tbAutor
	ON tbLivro.idAutor = tbAutor.idAutor
	WHERE nomeAutor LIKE 'C%'
	GROUP BY nomeAutor

--f)A  quantidade  de  livros  agrupados  pelo  nome  do  autor,  cujo  nome  do  autor  seja “Machado de Assis” ou “Cora Coralina”ou “Graciliano Ramos” ou “Clarice Lispector”
SELECT COUNT(idLivro) AS 'Quantidade de Livros', nomeAutor FROM tbLivro
	INNER JOIN tbAutor
	ON tbLivro.idAutor = tbAutor.idAutor
	WHERE nomeAutor IN('Machado de Assis','Cora Coralina', 'Graciliano Ramos','Clarice Lispector')
	GROUP BY nomeAutor

--g)A soma das páginas dos livros agrupadas pelo nome da editora cujo número de páginas esteja entre 200 e 500 (inclusive)
SELECT SUM(numPaginas) AS 'Soma de páginas', nomeEditora FROM tbLivro
	INNER JOIN tbEditora
	ON tbLivro.idEditora = tbEditora.idEditora
	WHERE numPaginas BETWEEN 200 AND 500
	GROUP BY nomeEditora

--h)O nome dos livros ao lado do nome das editoras e do nome dos autores
SELECT nomeLivro, nomeEditora, nomeAutor FROM tbLivro
	INNER JOIN tbEditora
	ON tbLivro.idEditora = tbEditora.idEditora
	INNER JOIN tbAutor
	ON tbLivro.idAutor = tbAutor.idAutor

--i)O nome dos livros ao lado do nome do autor somente daqueles cujo nome da editora for “Companhia das Letras”
SELECT nomeLivro, nomeAutor FROM tbLivro
	INNER JOIN tbEditora
	ON tbLivro.idEditora = tbEditora.idEditora
	INNER JOIN tbAutor
	ON tbLivro.idAutor = tbAutor.idAutor
	WHERE nomeEditora LIKE 'Companhia das Letras'

--j)O nome dos livros ao lado dos nomes dos autores, somente dos livros que não forem do autor “Érico Veríssimo”
SELECT nomeLivro, nomeAutor FROM tbLivro
	INNER JOIN tbAutor
	ON tbLivro.idAutor = tbAutor.idAutor
	WHERE nomeLivro NOT LIKE 'Érico Veríssimo'

--k)Os  nomes  dos  autores  ao  lado  dos  nomes  dos  livros,  inclusive  daqueles  que  não  tem livros cadastrados
SELECT nomeAutor, nomeLivro FROM tbLivro
	RIGHT JOIN tbAutor
	ON tbAutor.idAutor = tbLivro.idAutor

--l)Os  nomes  dos  autores  ao  lado  dos  nomes  dos  livros,  inclusive  daqueles  que  não tem autores cadastrados
SELECT nomeAutor, nomeLivro FROM tbLivro
	LEFT JOIN tbAutor
	ON tbAutor.idAutor = tbLivro.idAutor

--m)O nome dos autores ao lado dos nomes dos livros, indiferente do autor ter ou não livro publicado, e indiferente do livro pertencer a algum autor
SELECT nomeAutor, nomeLivro FROM tbLivro
	FULL JOIN tbAutor
	ON tbAutor.idAutor = tbLivro.idAutor

--n)A editora Ática irá publicar todos os títulos dessa livraria. Criar um select que associe os nomes de todos os livros ao lado do nome da editora Ática.
SELECT nomeLivro, nomeEditora FROM tbLivro
	CROSS JOIN tbEditora
	WHERE nomeEditora LIKE 'Ática'

--o)Somente os nomes dos autores que não tem livros cadastrados
SELECT nomeAutor FROM tbAutor
	LEFT JOIN tbLivro
	ON tbAutor.idAutor = tbLivro.idAutor
	WHERE tbLivro.idAutor IS NULL

--p)Os nomes dos gêneros que não possuem nenhum livro cadastrado
SELECT nomeGenero FROM tbGenero
	LEFT JOIN tbLivro
	ON tbGenero.idGenero = tbLivro.idGenero
	WHERE tbLivro.idGenero IS NULL
