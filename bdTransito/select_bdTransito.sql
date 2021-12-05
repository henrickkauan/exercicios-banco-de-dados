USE bdTransito

/*a) Quantos motoristas existem no banco de dados*/
SELECT COUNT(idMotorista) as 'Quantidade de motoristas' from tbMotorista

/*b) Quantos motoristas possuem Silva no sobrenome*/
SELECT COUNT(idMotorista) as 'Motoristas com Silva no sobrenome' from tbMotorista
	WHERE nomeMotorista LIKE '%Silva%'
		
/*c) Quantos motoristas nasceram no ano 2000*/
SELECT COUNT(idMotorista) as 'Motoristas que nasceram em 2000' from tbMotorista
	WHERE YEAR(dataNascimentoMotorista) = 2000
	
/*d) Quantos motoristas possuem mais de 10 pontos de pontuação acumulada*/
SELECT COUNT(idMotorista) as 'Motoristas com mais de 10 pontos acumalado' from tbMotorista
	WHERE pontuacaoAcumulada > 10

/*e) A somatória da pontuação de todos os motoristas*/
SELECT SUM(pontosMulta) as 'Total de pontuação dos Motorista' from tbMultas

/*f) A média de pontuação de todos os motoristas*/
SELECT AVG(pontuacaoAcumulada) as 'Media de pontuação dos Motorista' from tbMotorista

/*g) Quantos veículos o motorista de código 1 possui*/
SELECT COUNT(idVeiculo) as 'Veiculos do motorista de cod-1' from tbVeiculo
	WHERE idMotorista = 1

/*h) Quantos veículos a placa começa com A*/
SELECT COUNT(idVeiculo) as 'Quantidade de veiculos que começam com a letra A na placa' from tbVeiculo
	WHERE placa LIKE 'A%'

/*i) Quantos veículos foram fabricados antes de 2010*/
SELECT COUNT(idVeiculo) as 'Quantidade de veiculos fabricados antes de 2010' from tbVeiculo
	WHERE anoVeiculo < 2010

/*j) A média do ano de fabricação de todos os veículos*/
SELECT AVG(anoVeiculo) as 'Media do ano de fabricação dos veiculos' from tbVeiculo

/*k) A quantidade dos veículos que tenham a palavra Sedan em seu modelo*/
SELECT COUNT(idVeiculo) as 'Quantidade de veiculos com Sedan no nome' from tbVeiculo
	WHERE modeloVeiculo LIKE '%Sedan%'

/*l) A somatória dos pontosMulta do veículo de id 02*/
SELECT SUM(pontosMulta) as 'Total de pontos do veiculo de cod-2' from tbMultas
	WHERE idVeiculo = 2

/*m) A média de pontosMulta entre todas as multas aplicadas*/SELECT AVG(pontosMulta) as 'Media de ponto das multas aplicadas' from tbMultas

/*n) A quantidade de multas aplicadas no mês de abril de 2018*/
SELECT COUNT(idMulta) as 'Quantidade de multas em abril de 2018' from tbMultas
	WHERE YEAR(dataMulta) = 2018 AND  MONTH(dataMulta) = 4

/*o) A quantidade de veículos cuja placa termine com o número 1 ou 2*/
SELECT COUNT(idVeiculo) as 'Quantidade de veiculos com placa final 1 ou 2' from tbVeiculo
	WHERE placa LIKE '%1' OR placa LIKE '%2'

/*p) A quantiadade de veículos cuja placa termine com o número 3 ou 4*/
SELECT COUNT(idVeiculo) as 'Quantidade de veiculos com placa final 3 ou 4' from tbVeiculo
	WHERE placa LIKE '%3' OR placa LIKE '%4'

/*q) A quantidade de veículos cuja placa termine com o número 5 ou 6*/
SELECT COUNT(idVeiculo) as 'Quantidade de veiculos com placa final 5 ou 6' from tbVeiculo
	WHERE placa LIKE '%5' OR placa LIKE '%6'

/*r) A quantidade de veículos cuja placa termine com 7 ou 8*/
SELECT COUNT(idVeiculo) as 'Quantidade de veiculos com placa final 7 ou 8' from tbVeiculo
	WHERE placa LIKE '%7' OR placa LIKE '%8'

/*s) A quantidade de veículos cuja placa termine com 9 ou 0*/
SELECT COUNT(idVeiculo) as 'Quantidade de veiculos com placa final 9 ou 0' from tbVeiculo
	WHERE placa LIKE '%9' OR placa LIKE '%0'

/*t) A quantidade de veículos por ano de fabricação*/
SELECT COUNT(idVeiculo) as 'Quantidade de veiculos', anoVeiculo as 'Ano fabricação' from tbVeiculo
	GROUP BY anoVeiculo

/*u) A quantidade de motoristas por pontuação acumulada*/
SELECT COUNT(idMotorista) as 'Quantidade de motoristas', pontuacaoAcumulada as 'Pontuação acumulada' from tbMotorista
	GROUP BY pontuacaoAcumulada

/*v) A quantidade de motoristas que ultrapassaram os 20 pontos*/
SELECT COUNT(idMotorista) as 'Quantidade de motoristas que ultrapassaram 20 pontos' from tbMotorista	
	WHERE pontuacaoAcumulada > 20

/*w) A pontuação média dos motoristas nascidos no ano de 2000*/
SELECT AVG(pontuacaoAcumulada) as 'Pontuação média dos motoristas nascidos no ano de 2000' from tbMotorista	
	WHERE YEAR(dataNascimentoMotorista) = 2000

/*x) A média dos pontos das multas aplicadas em julho de 2017*/
SELECT AVG(pontosMulta) as 'Média dos pontos das multas aplicadas em julho de 2017' from tbMultas	
	WHERE YEAR(dataMulta) = 2017 AND  MONTH(dataMulta) = 7

/*y) Quantos veículos não podem circular na segunda-feira (placa final 1 ou 2)*/
SELECT COUNT(idVeiculo) as 'Quantos veículos não podem circular na segunda-feira' from tbVeiculo
	WHERE placa LIKE '%1' OR placa LIKE '%2'