
CREATE DATABASE CadastroImpacta
GO

USE CadastroImpacta
GO

CREATE TABLE Disciplina
(
	carga_horaria TINYINT  
	,teoria		  DECIMAL(3)
	,pratica	  DECIMAL(3)
	,ementa				 VARCHAR(5000)
	,competencias		 VARCHAR(2000)
	,habilidades		 VARCHAR(1000)
	,conteudo			 VARCHAR(300) 
	,bibliografia_basica VARCHAR(1000)
	,bibliografia_complementar VARCHAR(1000)
	,nome VARCHAR (240) NOT NULL
	,CONSTRAINT PKDisciplina PRIMARY KEY (nome) 
);
select * from Disciplina

CREATE TABLE Curso--OK
(
	Sigla VARCHAR(5) NOT NULL
	,Nome VARCHAR(50) NOT NULL
	,CONSTRAINT pkCurso PRIMARY KEY (Sigla)
	,CONSTRAINT uqNome UNIQUE (Nome)
);

CREATE TABLE GradeCurricular--OK
(	
	Sigla_curso VARCHAR(5)
	,Ano SMALLINT NOT NULL
	,Semestre CHAR(1) NOT NULL
    ,CONSTRAINT pkGradeCurricular  PRIMARY KEY(Ano,Semestre,sigla_curso) 
	,CONSTRAINT fkGradeCurricularCurso   FOREIGN KEY(Sigla_curso) REFERENCES Curso(Sigla)
);

CREATE TABLE Periodo--OK
(	
    Sigla_curso  VARCHAR(5)
	,Ano_grade SMALLINT
	,Semestre_grade CHAR(1) 
	,numero TINYINT NOT  NULL
	,CONSTRAINT pkPeriodo        PRIMARY KEY (numero,sigla_curso,ano_grade,semestre_grade)
	,CONSTRAINT fkPeriodoGrade   FOREIGN KEY (Ano_grade, Semestre_grade,sigla_curso) REFERENCES GradeCurricular(Ano, Semestre,sigla_curso)
);

CREATE TABLE PeriodoDisciplina -- OK
(
	Sigla_curso  VARCHAR(5)
	,Ano_grade SMALLINT
	,Semestre_grade CHAR(1)
	,numero_periodo TINYINT
	,Nome_disciplina VARCHAR(240)
	,CONSTRAINT pkPeriodoDisciplina  PRIMARY KEY (numero_periodo,Nome_disciplina,sigla_curso,ano_grade,semestre_grade)
	,CONSTRAINT fkPeriodoDisciplinaPeriodo      FOREIGN KEY (numero_periodo,sigla_curso,ano_grade,semestre_grade)  REFERENCES Periodo(numero,sigla_curso,ano_grade,semestre_grade)
	,CONSTRAINT fkPeriodoDisciplinaDisciplina   FOREIGN KEY (Nome_disciplina ) REFERENCES Disciplina(Nome)
);

CREATE  TABLE DisciplinaOfertada--OK
(
	nome_disciplina VARCHAR(240)
	,ano SMALLINT NOT NULL
	,semestre CHAR(1) NOT NULL
	,CONSTRAINT pkDisciplinaOfertada PRIMARY KEY (ano,semestre,nome_disciplina)
	, CONSTRAINT fkDisciplinaOfertadaDisciplina FOREIGN KEY (nome_disciplina) REFERENCES Disciplina (nome)
);
select * from DisciplinaOfertada
CREATE TABLE  Professor-- OK
(
	ra  INT IDENTITY(1,1) NOT NULL
	,nome VARCHAR (120) NOT NULL
	,Email VARCHAR (80) NOT NULL
	,celular CHAR(11) NULL
	,apelido VARCHAR NOT NULL
	,CONSTRAINT PKProfessor PRIMARY KEY (ra)
	,CONSTRAINT UQapelido UNIQUE (apelido)
);

CREATE TABLE Turma--OK
(
	ra_professor INT 
	,nome_disciplina VARCHAR(240)
	,ano_ofertado SMALLINT 
	,semestre_ofertado CHAR(1) 
	,id CHAR(1) NOT NULL
	,turno VARCHAR (15) NOT NULL
	,CONSTRAINT PKTurma PRIMARY KEY (id,nome_disciplina,ano_ofertado,semestre_ofertado)
	,CONSTRAINT fkTurmaProfessor FOREIGN KEY(ra_professor) REFERENCES professor(ra)
	,CONSTRAINT fkTurmaDisciplinaOfertada FOREIGN KEY(ano_ofertado,semestre_ofertado,nome_disciplina) REFERENCES DisciplinaOfertada (ano, semestre,nome_disciplina)
);

CREATE TABLE CursoTurma--OK
(
	sigla_curso VARCHAR(5)
	,nome_disciplina VARCHAR(240)
	,ano_ofertado SMALLINT
	,semestre_ofertado CHAR(1)
	,id_turma CHAR(1)
	,CONSTRAINt pkCursoTurma PRIMARY KEY (id_turma, sigla_curso,nome_disciplina,ano_ofertado,semestre_ofertado)
	,CONSTRAINT fkCursoTurmaCurso FOREIGN KEY(sigla_curso) REFERENCES Curso(sigla)
	,CONSTRAINT fkCursoTurmaTurma FOREIGN KEY(id_turma,nome_disciplina,ano_ofertado,semestre_ofertado) REFERENCES Turma(id,nome_disciplina,ano_ofertado,semestre_ofertado)
);

CREATE TABLE Aluno--OK
(
	ra  INT IDENTITY(1,1) NOT NULL
	,nome	 VARCHAR(120) NOT NULL
	,Email  VARCHAR(80) NOT NULL
	,celular     CHAR(11) NULL
	,sigla_Curso VARCHAR(5)
	,CONSTRAINT pkAluno PRIMARY KEY (ra)
	,CONSTRAINT fkAlunoCurso FOREIGN KEY(sigla_curso) REFERENCES curso(sigla)
);

CREATE TABLE Matricula--OK
(
	ra_aluno INT 
	,nome_disciplina VARCHAR(240)
	,ano_ofertado SMALLINT
	,semestre_ofertado CHAR(1)
	,id_Turma CHAR(1)
	,CONSTRAINT pkMatricula PRIMARY KEY (ra_aluno, id_turma,nome_disciplina,ano_ofertado,semestre_ofertado)
	,CONSTRAINT fkMatriculaTurma FOREIGN KEY(id_turma,nome_disciplina,ano_ofertado,semestre_ofertado) REFERENCES Turma(id,nome_disciplina,ano_ofertado,semestre_ofertado)
	,CONSTRAINT fkMatriculaAluno FOREIGN KEY(ra_aluno) REFERENCES Aluno(ra)
);

CREATE TABLE Questao--OK
(
	nome_Disciplina VARCHAR(240)
	,ano_ofertado SMALLINT
	,semestre_ofertado CHAR(1)
	,id_turma          CHAR(1)
	,numero INT	NOT NULL
	,data_limite_entrega DATE NOT NULL
	,descricao VARCHAR(500) NULL
	,data1 DATE  NOT NULL
	,CONSTRAINT pkQuestao PRIMARY KEY (numero,id_turma,nome_disciplina,ano_ofertado,semestre_ofertado)
	,CONSTRAINT fkQuestaoTurma FOREIGN KEY(id_turma,nome_disciplina,ano_ofertado,semestre_ofertado)  REFERENCES Turma(id,nome_disciplina,ano_ofertado,semestre_ofertado)
);

CREATE TABLE ArquivosQuestao--OK
	(
	nome_disciplina VARCHAR (240)
	,ano_ofertado SMALLINT
	,semestre_ofertado CHAR
	,id_turma CHAR
	,numero_questao INT
	,arquivo VARCHAR(500) NOT NULL
	,CONSTRAINT pkArquivosQuestao PRIMARY KEY (arquivo,numero_questao,id_turma,nome_disciplina,ano_ofertado,semestre_ofertado)
	,CONSTRAINT fkArquivoQuestaoQuestao FOREIGN KEY (numero_questao,id_turma,nome_disciplina,ano_ofertado,semestre_ofertado)  REFERENCES Questao (numero,id_turma,nome_disciplina,ano_ofertado,semestre_ofertado)
);

CREATE TABLE Resposta
(	
	nome_disciplina VARCHAR(240)
	,ano_ofertado SMALLINT
	,semestre_ofertado CHAR(1)
	,id_turma CHAR(1)
	,numero_questao INT
	,ra_aluno INT
	,data_avaliacao DATE NOT NULL
	,nota DECIMAL (4,2) NOT NULL
	,avaliacao VARCHAR(100) NOT NULL
	,descricao VARCHAR(100) NULL
	,data_de_envio DATE NOT NULL
	,CONSTRAINT pkResposta PRIMARY KEY (ra_aluno,numero_questao,id_turma,nome_disciplina,ano_ofertado,semestre_ofertado)
	,CONSTRAINT fkRespostaQuestao      FOREIGN KEY (numero_questao,id_turma,nome_disciplina,ano_ofertado,semestre_ofertado)    REFERENCES Questao (numero,id_turma,nome_disciplina,ano_ofertado,semestre_ofertado)
	,CONSTRAINT fkRespostaAluno FOREIGN KEY(ra_aluno) REFERENCES Aluno(ra)
);
CREATE TABLE ArquivosResposta--OK
(
	nome_disciplina VARCHAR(240)
	,ano_ofertado SMALLINT
	,semestre_ofertado CHAR(1)
	,id_turma CHAR(1)
	,numero_questao INT
	,ra_aluno INT
	,arquivo VARCHAR(500) NOT NULL
	,CONSTRAINT pkArquivosResposta PRIMARY KEY (arquivo,ra_aluno,numero_questao,id_turma,nome_disciplina,ano_ofertado,semestre_ofertado)
	,CONSTRAINT fkArquivoRespostaResposta  FOREIGN KEY (ra_aluno,numero_questao,id_turma,nome_disciplina,ano_ofertado,semestre_ofertado)   REFERENCES Resposta (ra_aluno,numero_questao,id_turma,nome_disciplina,ano_ofertado,semestre_ofertado)
);
