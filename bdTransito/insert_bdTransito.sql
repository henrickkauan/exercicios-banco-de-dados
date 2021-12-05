USE bdTransito

INSERT INTO tbMotorista (nomeMotorista,dataNascimentoMotorista,cpfMotorista,cnhMotorista,pontuacaoAcumulada)
VALUES ('Lorena Brenda Laís Rezende', '21/12/1988', '32657757120', '08210949290', 18)
	,('Olivia Laís Yasmin Nunes', '06/07/1968', '35052739109', '09102691547', 20)
	,('Theo Rafael Diogo da Paz', '02/12/1990', '50301071004', '17938762506', 8)

SELECT * FROM tbMotorista

INSERT INTO tbVeiculo (modeloVeiculo,placa,renavam,anoVeiculo,idMotorista)
VALUES ('Volkswagen Gol', 'HKZ7278', '98683558790', 2010, 1)
	,('Fiat Palio', 'MZD5582', '74911353732', 2005, 1)
	,('Fiat Uno', 'LVH7162', '35615027817', 2015, 1)
	,('Chevrolet Celta', 'MWH7228', '16915805401', 2013, 2)
	,('Fiat Strada', 'FXS3421', '86090528171', 2014, 2)
	,('Chevrolet Onix', 'KHH9239', '90760359917', 2009, 2)
	,('Volkswagen Fox', 'JML7117', '34188621207', 2017, 3)
	,('Toyota Corolla', 'HOY3535', '21535793254', 2020, 3)
	,('Chevrolet Corsa', 'MPT0765', '60343445038', 2019, 3)

SELECT * FROM tbVeiculo

INSERT INTO tbMultas (dataMulta,horaMulta,pontosMulta,idVeiculo)
VALUES ('24/02/2020', '12:43', 5, 1) 
	,('12/03/2020', '20:28', 5, 1)
	,('28/03/2021', '17:23', 1, 2)
	,('29/03/2021', '20:01', 2, 2)
	,('10/04/2021', '17:12', 4, 3)
	,('17/04/2021', '21:23', 1, 3)
	
	,('20/04/2021', '9:00', 2, 4)
	,('22/04/2021', '14:00', 4, 4)
	,('26/04/2021', '12:30', 3, 5)
	,('29/04/2021', '16:22', 2, 5)
	,('02/05/2021', '19:56', 4, 6)
	,('10/05/2021', '12:10', 5, 6)

	,('10/05/2021', '13:12', 2, 7)
	,('20/05/2021', '19:22', 2, 7)
	,('22/05/2021', '15:00', 1, 8)
	,('28/05/2021', '22:10', 1, 8)
	,('29/05/2021', '11:58', 1, 9)
	,('05/06/2021', '8:15', 1, 9)
SELECT * FROM tbMultas

