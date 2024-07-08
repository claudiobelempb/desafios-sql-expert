/*tb_curso*/
INSERT INTO tb_curso(nome, carga_horaria, valor, nota_prevista, nota_minima) VALUES('HTML Básico', 10, 80.0, 100.0, 70.0);

/*tb_aluno*/
INSERT INTO tb_aluno(cpf, nome, nascimento) VALUES('736376983-19', 'Carlos Silva', '1990-07-21');
INSERT INTO tb_aluno(cpf, nome, nascimento) VALUES('353847901-22 ', 'Maria Clara', '1991-09-03');

/*tb_turma*/
INSERT INTO tb_turma(numero, inicio, vagas, curso_id) VALUES(1, '2017-09-10', 30, 1);

/*tb_matricula*/
INSERT INTO tb_matricula(turma_id, aluno_id, data, prestacoes) VALUES(1, '736376983-19', '2017-09-05', 6);
INSERT INTO tb_matricula(turma_id, aluno_id, data, prestacoes) VALUES(1, '353847901-22', '2017-09-06', 12);

/*tb_avaliacao*/
INSERT INTO tb_avaliacao(nota, data, turma_id) VALUES(40.0, '2017-10-20', 1);
INSERT INTO tb_avaliacao(nota, data, turma_id) VALUES(60.0, '2017-11-30', 1);

/*tb_resultado*/
INSERT INTO tb_resultado(aluno_id, avalicao_id, nota_obtida) VALUES('736376983-19', 1, 35.0);
INSERT INTO tb_resultado(aluno_id, avalicao_id, nota_obtida) VALUES('353847901-22', 1, 36.5);
INSERT INTO tb_resultado(aluno_id, avalicao_id, nota_obtida) VALUES('736376983-19', 2, 47.0);
INSERT INTO tb_resultado(aluno_id, avalicao_id, nota_obtida) VALUES('353847901-22', 2, 52.4);

/*QUESTÃO 1: nome do curso, número e data de início de cada turma de cada curso.*/
SELECT tb_curso.nome, tb_turma.numero, tb_turma.inicio 
FROM tb_curso
INNER JOIN tb_turma
ON tb_curso.id = tb_turma.curso_id;

/*QUESTÃO 2: nome do curso, número da turma, nome e CPF dos alunos de cada curso e
cada turma. Os nomes das colunas devem ser curso, turma, aluno e cpf, conforme exemplo.*/
SELECT tb_curso.nome AS turma, tb_turma.numero AS turma, tb_aluno.nome AS aluno, tb_aluno.cpf AS cpf
FROM tb_curso
INNER JOIN tb_turma
ON tb_curso.id = tb_turma.curso_id
INNER JOIN tb_matricula
ON tb_turma.id = tb_matricula.turma_id
INNER JOIN tb_aluno
ON tb_aluno.cpf = tb_matricula.aluno_id;

/*
QUESTÃO 3: listagem de data e nota de todas avaliações já ocorridas, juntamente com
nome, nota obtida por cada aluno em cada avaliação, e também qual a porcentagem de
nota obtida em relação à nota da avaliação. Os resultados devem estar ordenados da
avaliação mais recente para a mais antiga, e, para cada avaliação, os nomes dos alunos
devem estar ordenados em ordem crescente. A porcentagem deve ter duas casas decimais.
*/

SELECT data, nota, nome, nota_obtida, TRUNC((nota_obtida * 100) / nota, 2) AS porcentagem
FROM tb_resultado AS r
INNER JOIN tb_aluno AS a
ON r.aluno_id = a.cpf
INNER JOIN tb_avaliacao AS v
ON r.avaliacao_id = v.id
ORDER BY v.data DESC, a.nome;

/*
QUESTÃO 4 : nome e nota total dos alunos da turma 10 
(ATENÇÃO: você deve restringir a turma pelo número 10 dela, e não pelo id 2).
*/

SELECT nome, SUM(r.nota_obtida) AS total
FROM tb_resultado AS r
INNER JOIN tb_aluno AS a
ON r.aluno_id = a.cpf
INNER JOIN tb_avaliacao AS v
ON r.avaliacao_id = v.id
INNER JOIN tb_turma t 
ON v.turma_id = t.id
WHERE t.numero = 10
GROUP BY nome;