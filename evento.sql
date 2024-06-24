SHOW datestyle;
SET datestyle = 'ISO, DMY';

/*creando banco de dados*/
CREATE DATABASE eventos

CREATE TABLE tb_categoria (
	id SERIAL NOT NULL,
	descricao VARCHAR(32) NOT NULL
);

ALTER TABLE tb_categoria ADD PRIMARY KEY(id);

CREATE TABLE tb_atividade(
	id SERIAL NOT NULL,
	nome VARCHAR(32) NOT NULL,
	descricao TEXT NOT NULL,
	preco NUMERIC(10, 2),
	categoria_id INTEGER NOT NULL
);

ALTER TABLE tb_atividade ADD PRIMARY KEY(id);
ALTER TABLE tb_atividade ADD FOREIGN KEY(categoria_id) REFERENCES tb_categoria(id)

CREATE TABLE tb_bloco(
	id SERIAL NOT NULL,
	inicio TIMESTAMP,
	fim TIMESTAMP,
	atividade_id INTEGER NOT NULL
);

ALTER TABLE tb_bloco ALTER inicio TYPE TIMESTAMP
ALTER TABLE tb_bloco ALTER fim TYPE TIMESTAMP

ALTER TABLE tb_bloco ADD PRIMARY KEY(id);
ALTER TABLE tb_bloco ADD FOREIGN KEY(atividade_id) REFERENCES tb_atividade(id);

CREATE TABLE tb_participante(
	id SERIAL NOT NULL,
	nome VARCHAR(32) NOT NULL,
	email VARCHAR(32) UNIQUE NOT NULL
);

ALTER TABLE tb_participante ADD PRIMARY KEY(id);

CREATE TABLE tb_participacao(
	participante_id INTEGER NOT NULL,
	atividade_id INTEGER NOT NULL
);

ALTER TABLE tb_participacao ADD PRIMARY KEY(participante_id, atividade_id);
ALTER TABLE tb_participacao ADD FOREIGN KEY(participante_id) REFERENCES tb_participante(id);
ALTER TABLE tb_participacao ADD FOREIGN KEY(atividade_id) REFERENCES tb_atividade(id);

INSERT INTO tb_categoria(descricao) VALUES('Curso');
INSERT INTO tb_categoria(descricao) VALUES('Oficina');

INSERT INTO tb_atividade(nome, descricao, preco, categoria_id) VALUES('Curso de HTML', 'Aprenda HTML defroma prática', 80.0, 1);
INSERT INTO tb_atividade(nome, descricao, preco, categoria_id) VALUES('Oficina de Github', 'Ctrole verôes de seus projetos', 50.0, 2);

INSERT INTO tb_bloco(inicio, fim, atividade_id) VALUES(TIMESTAMP WITH TIME ZONE '25-09-2017T08:00:00Z', TIMESTAMP WITH TIME ZONE '25-09-2017T11:00:00Z', 1);
INSERT INTO tb_bloco(inicio, fim, atividade_id) VALUES(TIMESTAMP WITH TIME ZONE '25-09-2017T14:00:00Z', TIMESTAMP WITH TIME ZONE '25-09-2017T18:00:00Z', 2);
INSERT INTO tb_bloco(inicio, fim, atividade_id) VALUES(TIMESTAMP WITH TIME ZONE '25-09-2017T08:00:00Z', TIMESTAMP WITH TIME ZONE '25-09-2017T11:00:00Z', 2);

INSERT INTO tb_participante(nome, email) VALUES('José Silva', 'jose@gmail.com');
INSERT INTO tb_participante(nome, email) VALUES('Tiago Faria', 'tiago@gmail.com');
INSERT INTO tb_participante(nome, email) VALUES('Maria do Rosário', 'maria@gmail.com');
INSERT INTO tb_participante(nome, email) VALUES('Teresa Silva', 'teresa@gmail.com');

INSERT INTO tb_participacao(participante_id, atividade_id) VALUES(1, 1);
INSERT INTO tb_participacao(participante_id, atividade_id) VALUES(1, 2);
INSERT INTO tb_participacao(participante_id, atividade_id) VALUES(2, 1);
INSERT INTO tb_participacao(participante_id, atividade_id) VALUES(3, 1);
INSERT INTO tb_participacao(participante_id, atividade_id) VALUES(3, 2);
INSERT INTO tb_participacao(participante_id, atividade_id) VALUES(4, 1);
