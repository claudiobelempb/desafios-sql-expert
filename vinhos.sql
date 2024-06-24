CREATE DATABASE vinhos;

CREATE TABLE IF NOT EXISTS tb_regiao (
	id SERIAL NOT NULL, 
	nome VARCHAR(32) NOT NULL, 
	localidade_s NUMERIC(10, 2) NOT NULL, 
	localidade_w NUMERIC(10, 2) NOT NULL, 
	descricao TEXT NOT NULL
);

ALTER TABLE tb_regiao ADD PRIMARY KEY(id);

CREATE TABLE IF NOT EXISTS tb_vinicola (
	id SERIAL NOT NULL, 
	nome VARCHAR(32) NOT NULL, 
	descricao TEXT, 
	fone VARCHAR(12), 
	email VARCHAR(32) UNIQUE NOT NULL, 
	regiao_id INT NOT NULL
);

ALTER TABLE tb_vinicola ADD PRIMARY KEY(id);
ALTER TABLE tb_vinicola ADD FOREIGN KEY(regiao_id) REFERENCES tb_regiao(id);

CREATE TABLE IF NOT EXISTS tb_tipo_vinho (
	id SERIAL NOT NULL, 
	nome  VARCHAR(32) NOT NULL
);

ALTER TABLE tb_tipo_vinho ADD PRIMARY KEY(id);

CREATE TABLE IF NOT EXISTS tb_vinho (
	id SERIAL NOT NULL, 
	nome VARCHAR(32) NOT NULL, 
	preco NUMERIC(10, 2) NOT NULL,
	tipo_id INT NOT NULL, 
	vinicola_id INT NOT NULL
);

ALTER TABLE tb_vinho ADD PRIMARY KEY(id);
ALTER TABLE tb_vinho ADD FOREIGN KEY(tipo_id) REFERENCES tb_tipo_vinho(id);
ALTER TABLE tb_vinho ADD FOREIGN KEY(vinicola_id) REFERENCES tb_vinicola(id);

INSERT INTO tb_regiao (nome, localidade_s, localidade_w, descricao) VALUES('Vale Central', 33.8088, 70.7644, 'Chile');
INSERT INTO tb_regiao (nome, localidade_s, localidade_w, descricao) VALUES('Serra Gaúcha', 29.3746, 50.8764, 'Sul do Brasil');

INSERT INTO tb_vinicola (nome, descricao, fone, email, regiao_id) VALUES('Santa Rita', 'localizada no valle delmaipo e tem mais de 100anos de história', NULL, 'santa@gmail.com', 1);
INSERT INTO tb_vinicola (nome, descricao, fone, email, regiao_id) VALUES('Santa Carolina', NULL, '3395-4422', 'carolina@gmail.com', 1);
INSERT INTO tb_vinicola (nome, descricao, fone, email, regiao_id) VALUES('Garibaldi', 'Vinícola situada na serragaúcha', '9822-3344', 'garibaldi@gmail.com', 2);

INSERT INTO tb_tipo_vinho (nome) values('Tinto');
INSERT INTO tb_tipo_vinho (nome) values('Branco');
INSERT INTO tb_tipo_vinho (nome) values('Rose');
INSERT INTO tb_tipo_vinho (nome) values('Bordeaux');

INSERT INTO tb_vinho (nome, tipo_id, preco, vinicola_id) VALUES('Amanda', 1, 100.0, 1);
INSERT INTO tb_vinho (nome, tipo_id, preco, vinicola_id) VALUES('Belinha', 2, 200.0, 1);
INSERT INTO tb_vinho (nome, tipo_id, preco, vinicola_id) VALUES('Camila', 4, 65.0, 2);
INSERT INTO tb_vinho (nome, tipo_id, preco, vinicola_id) VALUES('Daniela', 3, 89.0, 2);
INSERT INTO tb_vinho (nome, tipo_id, preco, vinicola_id) VALUES('Eduarda', 1, 55.0, 3);
INSERT INTO tb_vinho (nome, tipo_id, preco, vinicola_id) VALUES('Fernanda', 2, 70.0, 3);