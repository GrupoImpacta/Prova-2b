
-- SELECTS --


SELECT 	D.nome AS 'Disciplina'
	,D.carga_horaria AS 'Carga Horaria'
	,PD.Sigla_curso AS 'Sigla'
	,PD.Ano_grade AS 'Ano'
	,pd.Semestre_grade AS 'Semestre'			
FROM Disciplina AS D JOIN PeriodoDisciplina AS PD ON D.nome = PD.Nome_disciplina

SELECT A.ra AS 'RA'
	,A.nome AS 'Aluno'
	,A.email AS 'E-mail'
	,A.celular AS 'Celular'
	,A.sigla_curso AS 'Sigla'
	,M.nome_disciplina AS 'Matéria'
	,M.ano_ofertado AS 'Ano'
	,M.semestre_ofertado AS 'Semestre'
FROM Curso AS C Join Aluno AS A ON C.sigla = A.sigla_curso
				Join Matricula AS M ON A.ra = M.ra_aluno
WHERE M.nome_disciplina = 'Devops'

SELECT Q.nome_disciplina AS 'Nome da disciplina'
	,Q.ano_ofertado AS 'Ano' 
	,Q.semestre_ofertado  AS'Semestre'
	,Q.id_turma     AS    'Turma'
	,Q.numero 	AS    'Número da questão'
	,Q.data_limite_entrega AS 'Data Limite de entrega'
	,T.ra_professor AS 'RA Professor'
	,T.turno AS 'Turno'
FROM Turma AS T JOIN Questao AS Q ON T.id = Q.id_turma

SELECT P.ra AS 'RA do professor'
	,P.apelido AS 'apelido'
	,P.nome AS 'nome'
	,P.email AS 'email'
	,P.celular AS 'Celular'
	,T.nome_disciplina AS 'Nome da disciplina'
	,T.ano_ofertado AS 'Ano'
	,T.semestre_ofertado AS 'semestre'
	,T.turno AS 'Turno'
FROM Professor AS P JOIN Turma AS T ON P.ra = T.ra_professor
	

SELECT C.sigla AS 'sigla do curso'
	,C.nome AS 'Nome'
	,Per.Ano_grade AS 'Ano'
	,Per.Semestre_grade AS 'Semestre'
FROM Curso AS C JOIN Periodo AS Per ON C.sigla = Per.Sigla_curso
WHERE C.Nome = 'Análise e Desenvolvimento de Sistemas'
