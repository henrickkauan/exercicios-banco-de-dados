go
use bdEscola

insert into tbCurso (nomeCurso, cargaHorariaCurso, valorCurso)
values
('Inglês', 2000, 356) --1
,('Alemão', 3000, 478) --2
,('Espanhol', 4000, 500) --3

select * from tbCurso

insert into tbTurma (nomeTurma, codCurso, horarioTurma)
values
('1IA', 1,  '12:00:00') --1
,('1IC', 3, '18:00:00') --2
,('1IB', 1, '18:00:00') --3
,('1AA', 2, '19:00:00') --4

select * from tbTurma

insert into tbAluno (nomeAluno, dataNascimentoAluno, rgAluno, naturalidadeAluno)
values
('Paulo Santos', '03/10/2000', '82.292.122-0', 'SP') --1
,('Maria da Gloria', '10/03/1999', '45.223.123-0', 'SP') --2
,('Pedro Nogueira Silva', '04/04/1998', '23.533.211-9', 'SP') --3
,('Gilson Barros Silva', '09/09/1995', '34.221.111-x', 'PE') --4
,('Mariana Barbosa Santos', '10/10/2001', '54.222.122-9', 'RJ') --5
,('Alessandro Pereira', '11/10/2003', '24.402.454-9', 'ES') --6
,('Aline Melo', '08/10/2001', '88.365.012-3', 'RJ') --7

select * from tbAluno

insert into tbMatricula (dataMatricula, codAluno, codTurma)
values
('10/03/2015', 1, 1) --1
,('05/04/2014', 2, 1) --2 
,('05/04/2014', 2, 4) --3
,('05/03/2012', 3, 2) --4
,('03/03/2016', 1, 3) --5
,('05/07/2015', 4, 2) --6
,('07/05/2015', 4, 3) --7

select * from tbMatricula
