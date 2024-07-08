SHOW datestyle;
SET datestyle = 'ISO, DMY';

/*creando banco de dados*/
CREATE DATABASE escola;

CREATE TABLE tb_curso(
	id SERIAl NOT NULL, 
	nome VARCHAR(32) NOT NULL, 
	carga_horaria INTEGER, 
	valor NUMERIC(10, 2), 
	nota_prevista NUMERIC(10, 2) NOT NULL, 
	nota_minima NUMERIC(10, 2)
);

ALTER TABLE tb_curso ADD PRIMARY KEY(id);

CREATE TABLE tb_turma(
	id SERIAl NOT NULL, 
	numero INTEGER NOT NULL, 
	inicio DATE NOT NULL, 
	vagas INTEGER NOT NULL, 
	curso_id INTEGER NOT NULL
);

ALTER TABLE tb_turma ADD PRIMARY KEY(id);
ALTER TABLE tb_turma ADD FOREIGN KEY(curso_id) REFERENCES tb_curso(id);

CREATE TABLE tb_aluno(
	cpf VARCHAR(32) NOT NULL, 
	nome VARCHAR(32) NOT NULL, 
	nascimento DATE NOT NULL
);

ALTER TABLE tb_aluno ADD PRIMARY KEY(cpf);

CREATE TABLE tb_matricula(
	turma_id INTEGER NOT NULL, 
	aluno_id VARCHAR(32) NOT NULL, 
	data DATE NOT NULL, 
	prestacoes INTEGER NOT NULL
);

ALTER TABLE tb_matricula ADD PRIMARY KEY(turma_id, aluno_id);
ALTER TABLE tb_matricula ADD FOREIGN KEY(turma_id) REFERENCES tb_turma(id);
ALTER TABLE tb_matricula ADD FOREIGN KEY(aluno_id) REFERENCES tb_aluno(cpf);

CREATE TABLE tb_avaliacao(
	id SERIAl NOT NULL, 
	nota NUMERIC(10, 2) NOT NULL, 
	data DATE NOT NULL, 
	turma_id INTEGER NOT NULL
);

ALTER TABLE tb_avaliacao ADD PRIMARY KEY(id);
ALTER TABLE tb_avaliacao ADD FOREIGN KEY(turma_id) REFERENCES tb_turma(id);

CREATE TABLE tb_resultado(
	aluno_id VARCHAR(32) NOT NULL, 
	avaliacao_id INTEGER NOT NULL, 
	nota_obtida NUMERIC(10, 2) NOT NULL
);

ALTER TABLE tb_resultado ADD PRIMARY KEY(aluno_id, avaliacao_id);
ALTER TABLE tb_resultado ADD FOREIGN KEY(aluno_id) REFERENCES tb_aluno(cpf);
ALTER TABLE tb_resultado ADD FOREIGN KEY(avaliacao_id) REFERENCES tb_avaliacao(id);

INSERT INTO tb_curso(nome, carga_horaria, valor, nota_prevista, nota_minima) VALUES('HTML Básico', 10, 80.0, 100.0, 70.0);

INSERT INTO tb_aluno(cpf, nome, nascimento) VALUES('736376983-19', 'Carlos Silva', '1990-07-21');
INSERT INTO tb_aluno(cpf, nome, nascimento) VALUES('353847901-22 ', 'Maria Clara', '1991-09-03');

INSERT INTO tb_turma(numero, inicio, vagas, curso_id) VALUES(1, '2017-09-10', 30, 1);

INSERT INTO tb_matricula(turma_id, aluno_id, data, prestacoes) VALUES(1, '736376983-19', '2017-09-05', 6);
INSERT INTO tb_matricula(turma_id, aluno_id, data, prestacoes) VALUES(1, '353847901-22', '2017-09-06', 12);

INSERT INTO tb_avaliacao(nota, data, turma_id) VALUES(40.0, '2017-10-20', 1);
INSERT INTO tb_avaliacao(nota, data, turma_id) VALUES(60.0, '2017-11-30', 1);

INSERT INTO tb_resultado(aluno_id, avalicao_id, nota_obtida) VALUES('736376983-19', 1, 35.0);
INSERT INTO tb_resultado(aluno_id, avalicao_id, nota_obtida) VALUES('353847901-22', 1, 36.5);
INSERT INTO tb_resultado(aluno_id, avalicao_id, nota_obtida) VALUES('736376983-19', 2, 47.0);
INSERT INTO tb_resultado(aluno_id, avalicao_id, nota_obtida) VALUES('353847901-22', 2, 52.4);