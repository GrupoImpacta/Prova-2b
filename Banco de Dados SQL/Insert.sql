-- INSERTS NAS TABDELAS

INSERT INTO Disciplina(nome,carga_horaria,teoria,pratica,ementa,competencias,habilidades,conteudo, bibliografia_basica, bibliografia_complementar) -- ALTERAR OBS: NÃO É O CURSO, É A MATÉRIA! == OK
VALUES ('Engenharia de Software',80,20,60,'Introdução a algoritmos. Conceitos de programação estruturada. Tipos, variáveis, 
expressões. Estruturas de controle de fluxo. Vetores e matrizes. Funções','Entender os Requisitos Mínimos','Habilidade no efeitp cascata','Conteúdo diário'
,'MANZANO, J. A.; OLIVEIRA, J.F.; Algoritmos – Lógica para Desenvolvimento de Programação de Computadores. 22ª. Edição. São Paulo: Érica, 2009.'
,'VILARIM, GILVAN, Algoritmos – Programação para Iniciantes. Ciência Moderna, Rio de Janeiro, 2004')
		,('TecWeb',70,30,40,'aContainers, Servlets e Java Server Pages (JSP). 
		   Frameworks de aplicação MVC. Acesso a banco de dados com JDBC. Frameworks de persistência objeto-relacional.'
		   ,'Este profissional irá valer-se de conceitos e técnicas de informática, bem como das teorias de sistemas com foco em contribuir na solução de problemas de  tratamento  de  informações  nas  organizações'
		   ,' conceitos e técnicas de informática, bem como das teorias de sistemas com vistas a contribuir na solução de problemas de tratamento de informações nas organizações, através do planejamento, desenvolvimento, implementação e manutenção de modelos '
		   ,'Prático','GONÇALVES, E. Desenvolvendo Aplicações Web com JSP, 
SERVELTS, JAVASERVER FACES, HIBERNATE, EJB 3 PERSISTANCE E AJAX; Rio de Janeiro: Ciência Moderna, 2007.'
,'2BIBLI == HALL, M., Core Servlets and JSP. 2a. edição. Prentice Hall, 2003.')
		,('DevOps',70,30,40,'Comportamento grupal, trabalho em equipe, motivação nas organizações, liderança, poder e influência. 
Mudanças tecnológicas na contemporaneidade e seus efeitos nas relações interpessoais.'
		,'Comprove sua capacidade para cumprir as metas de desempenho, 
	      treinar pessoas e colocar em uso seu conhecimento sobre o produto.'
		  ,'Coloque seu conhecimento sobre o produto à prova sendo aprovado nos exames e avaliações.'
		  ,'conseguirá optimizar a equipa de desenvolvimento da sua empresa e rapidamente ver o retorno do investiment'
		  ,'ROBBINS, S. P. , Comportamento Organizacional, 11ed. São Paulo: Pearson Prentice Hall, 2005.'
,'O´BRIEN, James. Sistemas de informação e as decisões gerenciais na era da Internet. São Paulo: Saraiva, 2003.')
		,('Linguagem da Programação II',60,30,40,'Estudo de uma linguagem de programação voltada para a
internet; Conceitos básicos de programação cliente/servidor;
Noções gerais de programação orientada a objetos; Noções gerais
de Sistemas Gerenciadores de Bancos de Dados; Implementações
em laboratório.','– PROGRAMAÇÃO PARA WEB1.1. Noções básicas de programação para web;1.2. programação client side versus server side;1.3. noções básicas de HTML;
1.4. Introdução a programação em PHP:1.4.1. Extensão de arquivos;1.4.2. Comandos de saída;1.4.3. Variáveis;1.4.4. Tipos de dados;1.4.5. Constantes;'
		,'2.1. Classe Objeto Construtores e destrutores Herança; Polimorfismo; Abstração. Encapsulamento; Membros de classe;'
		,'Prática'
		,'1. DALL’OGLIO, Pablo. PHP – PROGRAMANDO COM
ORIENTAÇÃO A OBJETOS. NOVATEC. 2ª Ed.
2. SILVA, Maurício Samy. CRIANDO SITES COM HTML.
NOVATEC. '
		,'SINTES, Anthony. APRENDA PROGRAMAÇÃO ORIENTADA
A OBJETOS EM 21 DIAS. Editora MAKRON.')
		,('SQL',70,30,40,'Conceitos Básicos. Componentes de Sistemas Gerenciadores de Bancos de Dados. Modelagem Conceitual de Dados. Modelo Relacional. Restrições de Integridade, 
Dependência Funcional. Noções de Álgebra e Cálculo Relacional. Formas Normais. Linguagem SQL Básica. Visões e Índices.'
		,'Alguns dos principais comandos SQL para manipulação de dados são: INSERT (inserção), SELECT (consulta), UPDATE (atualização), DELETE (exclusão). SQL possibilita ainda a criação de relações entre tabelas e o controle do acesso aos dados'
		,'A linguagem SQL surgiu em 1974 e foi desenvolvida nos laboratórios da IBM como interface para o Sistema Gerenciador de Banco de Dados Relacional (SGBDR) denominado SYSTEM R. Esse sistema foi criado com base em um artigo de 1970 escrito por Edgar F. Codd.'
		,'Prático','HEUSER, C.A.; Projeto de Banco de Dados. 6a edição. Série Livros Didáticos – Instituto de Informática da UFRGS, número 4. Editora Bookman, 2009.'
		,'KORTH, H. F.; SUDARSHAN, S; SILBERCHATZ, A. Sistema de Banco de Dados. 5a edição. Editora Campus, 2006');

select * from disciplina

INSERT INTO Curso(Sigla,Nome)-- OK
VALUES ('SI','Sistema de Informação')
	  ,('ADS' ,'Análise e Desenvolvimento de Sistemas')
	  ,('BD' ,'Banco de Dados')
	  ,('SGI' ,'Segurança da Informação');
select * from curso

INSERT INTO GradeCurricular(Sigla_curso,Semestre,Ano)-- OK 
VALUES ('SI',2,2015)
	  ,('ADS',1,2018)
	  ,('BD',3,2011)
	  ,('SGI',2,2009);
select * from GradeCurricular

INSERT INTO Periodo(Sigla_curso,Ano_grade,Semestre_grade,numero) --OK NÃO ALTERAR
VALUES('SI',2015,2,8)
	 ,('ADS',2018,1,7)
	 ,('BD',2011,3,3)
	 ,('SGI',2009,2,5);
select * from Periodo

INSERT INTO PeriodoDisciplina(Sigla_curso,Ano_grade,Semestre_grade,numero_periodo,Nome_disciplina) -- OK 
VALUES 
	  ('SI'  ,2015,'2',8,'TecWeb')
	  ,('SI'  ,2015,'2',8,'DevOps')
	  ,('SI'  ,2015,'2',8,'Linguagem da Programação II')
	  ,('SI'  ,2015,'2',8,'SQL')
	  ,('ADS'  ,2018,'1',7,'Engenharia de Software')
	  ,('ADS'  ,2018,'1',7,'TecWeb')
	  ,('ADS'  ,2018,'1',7,'DevOps')
	  ,('ADS'  ,2018,'1',7,'Linguagem da Programação II')
	  ,('ADS'  ,2018,'1',7,'SQL')
	  ,('BD'  ,2011,'3',3,'Engenharia de Software')
	  ,('BD'  ,2011,'3',3,'TecWeb')
	  ,('BD'  ,2011,'3',3,'DevOps')
	  ,('BD'  ,2011,'3',3,'Linguagem da Programação II')
	  ,('BD'  ,2011,'3',3,'SQL')
	  ,('SGI'  ,2009,'2',5,'Engenharia de Software')
	  ,('SGI'  ,2009,'2',5,'TecWeb')
	  ,('SGI'  ,2009,'2',5,'DevOps')
	  ,('SGI'  ,2009,'2',5,'Linguagem da Programação II')
	  ,('SGI'  ,2009,'2',5,'SQL');
select * from PeriodoDisciplina

INSERT INTO DisciplinaOfertada(nome_disciplina,ano,semestre)
VALUES ('Engenharia De Software',2011,1)
		,('TecWeb',2012,2)
		,('DevOps',2013,3)
		,('Linguagem da Programação II',2014,4)
		,('SQL',2015,5);
select * from DisciplinaOfertada

INSERT INTO Professor(nome,Email,celular,apelido) -- OK
VALUES('Sand Onofre','sand.onofre@gmail.com',11965545567,'S') --Apelido poderia ser Sand Jurnior
	,('Vanderson Gomes Bossi','Vanderson.Bossi@impacta.edu.br',11924567789,'V') --Poderia ser Van de Som (-_-) ou Tio Vands ou VanOps
	,('Osvaldo Kotaro Takai','osvaldo.takai@impacta.edu.br	',11978112245,'T')--Apelido ProHard
	,('Fernando Sequeira Sousa','Fernando.Sousa@impacta.edu.br',11966542311,'F')--Apelido Fehzinho Fe Fernandinho Tio Fe
	,('Leonardo Massayuki Takuno','Leonardo.Takuno@impacta.edu.br',11934974962,'L')
	,('Edson Tiharu Tsukimoto','Edson.Tsukimoto@impacta.edu.br',11931112993,'E')-- OBS
	,('Ivair Lima','Ivair.Lima@impacta.edu.br',11924433576,'I');
select * from Professor

INSERT INTO Turma(ra_professor,nome_disciplina,ano_ofertado,semestre_ofertado,id,turno)
VALUES (3,'Engenharia de Software',2011,1,1,'NOTURNO')
	  ,(2,'TecWeb',2012,2,2,'DIURNO')
	  ,(4,'DevOps',2013,3,3,'DIURNO')
	  ,(5,'Linguagem da Programação II',2014,4,4,'DIURNO')
	  ,(1,'SQL',2015,5,5,'DIURNO');
select * from Turma

INSERT INTO CursoTurma(sigla_curso,nome_disciplina,ano_ofertado,semestre_ofertado,id_turma) 
VALUES ('SI','Engenharia de Software',2011,'1',1)
	  ,('SI','TecWeb',2012,'2',2)
	  ,('SI','DevOps',2013,'3',3)
	  ,('SI','Linguagem da Programação II',2014,'4',4)
	  ,('SI','SQL',2015,'5',5)--Finish
	  ,('ADS','Engenharia de Software',2011,'1',1)
	  ,('ADS','TecWeb',2012,'2',2)
	  ,('ADS','DevOps',2013,'3',3)
	  ,('ADS','Linguagem da Programação II',2014,'4',4)
	  ,('ADS','SQL',2015,'5',5)--Finish
	  ,('BD','Engenharia de Software',2011,'1',1)
	  ,('BD','TecWeb',2012,'2',2)
	  ,('BD','DevOps',2013,'3',3)
	  ,('BD','Linguagem da Programação II',2014,'4',4)
	  ,('BD','SQL',2015,'5',5)--Finish
	  ,('SGI','Engenharia de Software',2011,'1',1)
	  ,('SGI','TecWeb',2012,'2',2)
	  ,('SGI','DevOps',2013,'3',3)
	  ,('SGI','Linguagem da Programação II',2014,'4',4)
	  ,('SGI','SQL',2015,'5',5);--Finish
select * from CursoTurma

INSERT INTO Aluno(nome,email,celular,sigla_Curso)
VALUES ('Alan Merhy Faraj','alanfaraj@outlook.com',11912343256,'ADS')
	  ,('Evelyn Helena Soares dos Santos','Evelyn.helena@icloud.com',11957643978,'ADS')
	  ,('Gabriel Coelho Pereira dos Santos','bielcoelho57@gmail.com',11976495067,'SI')
	  ,('Paola Barcellos Charra','paah.oosaki@gmail.com',11934956574,'ADS')
	  ,('Mayara Silva dos Santos','maykaulitz94@gmail.com',11927364532,'ADS')
	  ,('Rodolfo Rodrigues Libona','rodolfolibona@hotmail.com',11921446688,'ADS')
	  ,('Reginaldo Rodrigues Barbosa','regis.rbarbosa@yahoo.com.br',11912320987,'SI')
	  ,('Itamar Souza Messias do Nascimento','Itamar.souza100@hotmail.com',11945366372,'SI')
	  ,('Luciana Lopes Lima','fllimaalu@gmail.com',11984756854,'SI')
	  ,('Millena Estanislau Domingues Silva','millenadomingues4@gmail.com',11954363223,'SI')
	  ,('Diego constantino','dsconsta@gmail.comr',11956890356,'SI')
	  ,('Henrique Estevão','henriqueestevao@outlook.com ',11912328756,'ADS')
	  ,('Leonardo Negreiros','leonardo.negreiros@gmail.com ',11937659735,'SI')
	  ,('Gabriel Silva Brito ','Gabriel.silva.sti@gmail.com  ',11922446587,'SI')-- inserir 3 alunos de cada curso BD,SGI
	  ,('Gustavo Negreiros','gustavo.negreiros@gmail.com ',11937659735,'BD')
	  ,('Josué godofredo da silva','Josuénavibe@gmail.com ',11937876735,'BD')
	  ,('Enrrique Juvi','Enriquejuvs@gmail.com ',11937659735,'BD')
	  ,('bruno Tutovs','brunotutovs@gmail.com ',11923457698,'SGI')
	  ,('Carlos Novi','Carlitos@gmail.com ',11912428467,'SGI')
	  ,('Estevao','Estrutis@gmail.com ',11937653731,'SGI');
select * from Aluno

INSERT INTO Matricula(ra_aluno,nome_disciplina,ano_ofertado,semestre_ofertado,id_turma) 
VALUES (1,'Engenharia de Software',2011,1,1)
	,(2,'Engenharia de Software',2011,1,1)
	,(3,'Engenharia de Software',2011,1,1)
	,(4,'Engenharia de Software',2011,1,1)
	,(5,'Engenharia de Software',2011,1,1)
	,(6,'Engenharia de Software',2011,1,1)
	,(7,'Engenharia de Software',2011,1,1)
	,(8,'Engenharia de Software',2011,1,1)
	,(9,'Engenharia de Software',2011,1,1)
	,(10,'Engenharia de Software',2011,1,1)
	,(11,'Engenharia de Software',2011,1,1)
	,(12,'Engenharia de Software',2011,1,1)
	,(13,'Engenharia de Software',2011,1,1)
	,(14,'Engenharia de Software',2011,1,1)
	,(1,'TecWeb',2012,2,2)
	,(2,'TecWeb',2012,2,2)
	,(3,'TecWeb',2012,2,2)
	,(4,'TecWeb',2012,2,2)
	,(5,'TecWeb',2012,2,2)
	,(6,'TecWeb',2012,2,2)
	,(7,'TecWeb',2012,2,2)
	,(8,'TecWeb',2012,2,2)
	,(9,'TecWeb',2012,2,2)
	,(10,'TecWeb',2012,2,2)
	,(11,'TecWeb',2012,2,2)
	,(12,'TecWeb',2012,2,2)
	,(13,'TecWeb',2012,2,2)
	,(14,'TecWeb',2012,2,2)
	,(1,'Devops',2013,3,3)
	,(2,'Devops',2013,3,3)
	,(3,'Devops',2013,3,3)
	,(4,'Devops',2013,3,3)
	,(5,'Devops',2013,3,3)
	,(6,'Devops',2013,3,3)
	,(7,'Devops',2013,3,3)
	,(8,'Devops',2013,3,3)
	,(9,'Devops',2013,3,3)
	,(10,'Devops',2013,3,3)
	,(11,'Devops',2013,3,3)
	,(12,'Devops',2013,3,3)
	,(13,'Devops',2013,3,3)
	,(14,'Devops',2013,3,3)
	,(1,'Linguagem da Programação II',2014,4,4)
	,(2,'Linguagem da Programação II',2014,4,4)
	,(3,'Linguagem da Programação II',2014,4,4)
	,(4,'Linguagem da Programação II',2014,4,4)
	,(5,'Linguagem da Programação II',2014,4,4)
	,(6,'Linguagem da Programação II',2014,4,4)
	,(7,'Linguagem da Programação II',2014,4,4)
	,(8,'Linguagem da Programação II',2014,4,4)
	,(9,'Linguagem da Programação II',2014,4,4)
	,(10,'Linguagem da Programação II',2014,4,4)
	,(11,'Linguagem da Programação II',2014,4,4)
	,(12,'Linguagem da Programação II',2014,4,4)
	,(13,'Linguagem da Programação II',2014,4,4)
	,(14,'Linguagem da Programação II',2014,4,4)
	,(1,'SQL',2015,5,5)
	,(2,'SQL',2015,5,5)
	,(3,'SQL',2015,5,5)
	,(4,'SQL',2015,5,5)
	,(5,'SQL',2015,5,5)
	,(6,'SQL',2015,5,5)
	,(7,'SQL',2015,5,5)
	,(8,'SQL',2015,5,5)
	,(9,'SQL',2015,5,5)
	,(10,'SQL',2015,5,5)
	,(11,'SQL',2015,5,5)
	,(12,'SQL',2015,5,5)
	,(13,'SQL',2015,5,5)
	,(14,'SQL',2015,5,5);
select * from Matricula 

INSERT INTO Questao(nome_disciplina,ano_ofertado,semestre_ofertado,id_turma,numero,data_limite_entrega,descricao,data1) 
VALUES ('Engenharia de Software',2011,1,1,2,'2016-11-28','Projeto de Banco de Dados - Professor: Sand','2016-12-11')
	   ,('TecWeb',2012,2,2,3,'2015-10-25','Projeto Programação - Professor: Leonardo Takuno','2015-12-10')
	   ,('DevOps',2013,3,3,4,'2014-9-12','Trabalhando Com Area Restrita - Professor: Vanderon','2014-12-10')
	   ,('Linguagem da Programação II',2014,4,4,5,'2017-10-22','Projeto Activia - Professor: Vanderson','2017-11-2')
	   ,('SQL',2015,5,5,6,'2016-10-22','Projeto Activia - Professor: Vanderson','2016-11-2');
select * from Questao

INSERT INTO ArquivosQuestao(arquivo,numero_questao,id_turma,nome_disciplina,ano_ofertado,semestre_ofertado) 
VALUES ('Arquivo encontra-se no Maverick ou na SmartClass',2,1,'Engenharia de Software',2011,1)
      ,('Arquivo encontra-se no Maverick ou na SmartClass',3,2,'TecWeb',2012,2)
	  ,('Arquivo encontra-se no Maverick ou na SmartClass',4,3,'DevOps',2013,3)
	  ,('Arquivo encontra-se no Maverick ou na SmartClass',5,4,'Linguagem da Programação II',2014,4)
	  ,('Arquivo encontra-se no Maverick ou na SmartClass',6,5,'SQL',2015,5);
select * from ArquivosQuestao

INSERT INTO Resposta(ra_aluno,numero_questao,id_turma,nome_disciplina,ano_ofertado,semestre_ofertado,data_avaliacao,nota,avaliacao,descricao,data_de_envio) --ALTERAR NOME_DISCIPLINA == Disciplina Alterada
VALUES (1,2,1,'Engenharia de Software',2011,1,'2017-11-29',9.5,'Bom Aluno','Prova prática de BD utilizando o SSMS','2017-12-02')
	,(2,3,2,'TecWeb',2012,2,'2007-11-29',9.5,'Bom Aluno','Prova prática de SI utilizando o C#','2017-12-02')
	,(3,4,3,'DevOps',2013,3,'2017-11-29',8.5,'Rasoável Aluno','Prova prática de ADS utilizando o Linux com C++','2017-12-02')
	,(4,5,4,'Linguagem da Programação II',2014,4,'2017-11-29',7.5,'Bom Aluno','Prova prática de Hardware utilizando Ferramentas','2017-12-02')
	,(5,6,5,'SQl',2015,5,'2017-11-29',7.5,'Bom Aluno','Prova prática de Hardware utilizando Ferramentas','2017-12-02');
select * from Resposta

INSERT INTO ArquivosResposta(arquivo,ra_aluno,numero_questao,id_turma,nome_disciplina,ano_ofertado,semestre_ofertado) 
VALUES ('Arquivo Avaliado',1,2,1,'Engenharia de Software',2011,1)
	,('Arquivo Avaliado',2,3,2,'TecWeb',2012,2)
	,('Arquivo Avaliado',3,4,3,'DevOps',2013,3)
	,('Arquivo Avaliado',4,5,4,'Linguagem da Programação II',2014,4)
	,('Arquivo Avaliado',5,6,5,'SQL',2015,5);
select * from ArquivosResposta
	

