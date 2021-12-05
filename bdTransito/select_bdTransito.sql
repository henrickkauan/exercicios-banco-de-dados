USE bdTransito

/*a) Quantos motoristas existem no banco de dados*/
SELECT COUNT(idMotorista) as 'Quantidade de motoristas' from tbMotorista

/*b) Quantos motoristas possuem Silva no sobrenome*/
SELECT COUNT(idMotorista) as 'Motoristas com Silva no sobrenome' from tbMotorista
	WHERE nomeMotorista LIKE '%Silva%'
		
/*c) Quantos motoristas nasceram no ano 2000*/
SELECT COUNT(idMotorista) as 'Motoristas que nasceram em 2000' from tbMotorista
	WHERE YEAR(dataNascimentoMotorista) = 2000
	
/*d) Quantos motoristas possuem mais de 10 pontos de pontua��o acumulada*/
SELECT COUNT(idMotorista) as 'Motoristas com mais de 10 pontos acumalado' from tbMotorista
	WHERE pontuacaoAcumulada > 10

/*e) A somat�ria da pontua��o de todos os motoristas*/
SELECT SUM(pontosMulta) as 'Total de pontua��o dos Motorista' from tbMultas

/*f) A m�dia de pontua��o de todos os motoristas*/
SELECT AVG(pontuacaoAcumulada) as 'Media de pontua��o dos Motorista' from tbMotorista

/*g) Quantos ve�culos o motorista de c�digo 1 possui*/
SELECT COUNT(idVeiculo) as 'Veiculos do motorista de cod-1' from tbVeiculo
	WHERE idMotorista = 1

/*h) Quantos ve�culos a placa come�a com A*/
SELECT COUNT(idVeiculo) as 'Quantidade de veiculos que come�am com a letra A na placa' from tbVeiculo
	WHERE placa LIKE 'A%'

/*i) Quantos ve�culos foram fabricados antes de 2010*/
SELECT COUNT(idVeiculo) as 'Quantidade de veiculos fabricados antes de 2010' from tbVeiculo
	WHERE anoVeiculo < 2010

/*j) A m�dia do ano de fabrica��o de todos os ve�culos*/
SELECT AVG(anoVeiculo) as 'Media do ano de fabrica��o dos veiculos' from tbVeiculo

/*k) A quantidade dos ve�culos que tenham a palavra Sedan em seu modelo*/
SELECT COUNT(idVeiculo) as 'Quantidade de veiculos com Sedan no nome' from tbVeiculo
	WHERE modeloVeiculo LIKE '%Sedan%'

/*l) A somat�ria dos pontosMulta do ve�culo de id 02*/
SELECT SUM(pontosMulta) as 'Total de pontos do veiculo de cod-2' from tbMultas
	WHERE idVeiculo = 2

/*m) A m�dia de pontosMulta entre todas as multas aplicadas*/SELECT AVG(pontosMulta) as 'Media de ponto das multas aplicadas' from tbMultas

/*n) A quantidade de multas aplicadas no m�s de abril de 2018*/
SELECT COUNT(idMulta) as 'Quantidade de multas em abril de 2018' from tbMultas
	WHERE YEAR(dataMulta) = 2018 AND  MONTH(dataMulta) = 4

/*o) A quantidade de ve�culos cuja placa termine com o n�mero 1 ou 2*/
SELECT COUNT(idVeiculo) as 'Quantidade de veiculos com placa final 1 ou 2' from tbVeiculo
	WHERE placa LIKE '%1' OR placa LIKE '%2'

/*p) A quantiadade de ve�culos cuja placa termine com o n�mero 3 ou 4*/
SELECT COUNT(idVeiculo) as 'Quantidade de veiculos com placa final 3 ou 4' from tbVeiculo
	WHERE placa LIKE '%3' OR placa LIKE '%4'

/*q) A quantidade de ve�culos cuja placa termine com o n�mero 5 ou 6*/
SELECT COUNT(idVeiculo) as 'Quantidade de veiculos com placa final 5 ou 6' from tbVeiculo
	WHERE placa LIKE '%5' OR placa LIKE '%6'

/*r) A quantidade de ve�culos cuja placa termine com 7 ou 8*/
SELECT COUNT(idVeiculo) as 'Quantidade de veiculos com placa final 7 ou 8' from tbVeiculo
	WHERE placa LIKE '%7' OR placa LIKE '%8'

/*s) A quantidade de ve�culos cuja placa termine com 9 ou 0*/
SELECT COUNT(idVeiculo) as 'Quantidade de veiculos com placa final 9 ou 0' from tbVeiculo
	WHERE placa LIKE '%9' OR placa LIKE '%0'

/*t) A quantidade de ve�culos por ano de fabrica��o*/
SELECT COUNT(idVeiculo) as 'Quantidade de veiculos', anoVeiculo as 'Ano fabrica��o' from tbVeiculo
	GROUP BY anoVeiculo

/*u) A quantidade de motoristas por pontua��o acumulada*/
SELECT COUNT(idMotorista) as 'Quantidade de motoristas', pontuacaoAcumulada as 'Pontua��o acumulada' from tbMotorista
	GROUP BY pontuacaoAcumulada

/*v) A quantidade de motoristas que ultrapassaram os 20 pontos*/
SELECT COUNT(idMotorista) as 'Quantidade de motoristas que ultrapassaram 20 pontos' from tbMotorista	
	WHERE pontuacaoAcumulada > 20

/*w) A pontua��o m�dia dos motoristas nascidos no ano de 2000*/
SELECT AVG(pontuacaoAcumulada) as 'Pontua��o m�dia dos motoristas nascidos no ano de 2000' from tbMotorista	
	WHERE YEAR(dataNascimentoMotorista) = 2000

/*x) A m�dia dos pontos das multas aplicadas em julho de 2017*/
SELECT AVG(pontosMulta) as 'M�dia dos pontos das multas aplicadas em julho de 2017' from tbMultas	
	WHERE YEAR(dataMulta) = 2017 AND  MONTH(dataMulta) = 7

/*y) Quantos ve�culos n�o podem circular na segunda-feira (placa final 1 ou 2)*/
SELECT COUNT(idVeiculo) as 'Quantos ve�culos n�o podem circular na segunda-feira' from tbVeiculo
	WHERE placa LIKE '%1' OR placa LIKE '%2'