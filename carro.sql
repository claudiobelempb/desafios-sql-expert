SHOW datestyle;
SET datestyle = 'ISO, DMY';

/*creando banco de dados*/
CREATE DATABASE carro;

CREATE TABLE IF NOT EXISTS tb_categoria(
	id SERIAL NOT NULL,
	descricao VARCHAR(32) NOT NULL,
	preco_diario NUMERIC(10, 2)
);



ALTER TABLE tb_categoria ADD PRIMARY KEY(id);

CREATE TABLE IF NOT EXISTS  tb_sede(
	codigo SERIAL NOT NULL,
	localidade_s FLOAT NOT NULL,
	localidade_w FLOAT NOT NULL
);

ALTER TABLE tb_sede ADD PRIMARY KEY(codigo);

CREATE TABLE IF NOT EXISTS  tb_carro(
	id SERIAL NOT NULL, 
	modelo VARCHAR(32) NOT NULL, 
	placa VARCHAR(32), 
	cor SMALLINT, 
	ano SMALLINT, 
	data_aquisicao DATE, 
	categoria_id INTEGER NOT NULL,
	sede_id INTEGER NOT NULL
);

ALTER TABLE tb_carro ADD PRIMARY KEY(id);
ALTER TABLE tb_carro ADD FOREIGN KEY(categoria_id) REFERENCES tb_categoria(id);
ALTER TABLE tb_carro ADD FOREIGN KEY(sede_id) REFERENCES tb_sede(codigo);

CREATE TABLE IF NOT EXISTS  tb_estado(
	id SERIAL NOT NULL,
	nome VARCHAR(32) NOT NULL
);

ALTER TABLE tb_estado ADD PRIMARY KEY(id);

CREATE TABLE IF NOT EXISTS  tb_cidade(
	id SERIAL NOT NULL,
	nome VARCHAR(32) NOT NULL,
	estado_id INTEGER NOT NULL
);

ALTER TABLE tb_cidade ADD PRIMARY KEY(id);
ALTER TABLE tb_cidade ADD FOREIGN KEY(estado_id) REFERENCES tb_estado(id);

CREATE TABLE IF NOT EXISTS  tb_endereco(
	id SERIAL NOT NULL,
	logradouro VARCHAR(60) NOT NULL, 
	numero SMALLINT, 
	complemento VARCHAR(32), 
	bairro VARCHAR(32), 
	cep VARCHAR(12), 
	cidade_id INTEGER NOT NULL
);

ALTER TABLE tb_endereco ADD PRIMARY KEY(id);
ALTER TABLE tb_endereco ADD FOREIGN KEY(cidade_id) REFERENCES tb_cidade(id);

CREATE TABLE IF NOT EXISTS  tb_cliente(
	cpf VARCHAR(32) NOT NULL,
	nome VARCHAR(32) NOT NULL,
	email VARCHAR(32) UNIQUE NOT NULL
);

ALTER TABLE tb_cliente ADD PRIMARY KEY(cpf);

CREATE TABLE IF NOT EXISTS  tb_telefone(
	cpf VARCHAR(32) NOT NULL,
	numero VARCHAR(32) NOT NULL
);

ALTER TABLE tb_telefone ADD PRIMARY KEY(cpf, numero);
ALTER TABLE tb_telefone ADD FOREIGN KEY(cpf) REFERENCES tb_cliente(cpf);

CREATE TABLE IF NOT EXISTS  tb_locacao(
	id SERIAL NOT NULL, 
	instante_locacao TIMESTAMP,
	instante_devolucao TIMESTAMP,
	cliente_id VARCHAR(32) NOT NULL,
	carro_id INTEGER NOT NULL,
	local_de_retirada_id INTEGER NOT NULL
);

ALTER TABLE tb_locacao ADD PRIMARY KEY(id);
ALTER TABLE tb_locacao ADD FOREIGN KEY(cliente_id) REFERENCES tb_cliente(cpf);
ALTER TABLE tb_locacao ADD FOREIGN KEY(carro_id) REFERENCES tb_carro(id);
ALTER TABLE tb_locacao ADD FOREIGN KEY(local_de_retirada_id) REFERENCES tb_sede(codigo);

CREATE TABLE IF NOT EXISTS  tb_locacao_diaria (
	id INTEGER NOT NULL, 
	dias_previstos INTEGER NOT NULL
);

ALTER TABLE tb_locacao_diaria ADD PRIMARY KEY(id);
ALTER TABLE tb_locacao_diaria ADD FOREIGN KEY(id) REFERENCES tb_locacao(id);

CREATE TABLE IF NOT EXISTS  tb_locacao_longo_periodo(
	id INTEGER NOT NULL, 
	porcentagem_descont NUMERIC(10, 2) NOT NULL
);

ALTER TABLE tb_locacao_longo_periodo ADD PRIMARY KEY(id);
ALTER TABLE tb_locacao_longo_periodo ADD FOREIGN KEY(id) REFERENCES tb_locacao(id);

INSERT INTO tb_categoria(descricao, preco_diario) VALUES('Básico', 60.0);
INSERT INTO tb_categoria(descricao, preco_diario) VALUES('Luxo', 150.0);

INSERT INTO tb_sede(localidade_s, localidade_w) VALUES(18.28272, 23.38474);

INSERT INTO tb_carro(modelo, placa, cor, ano, data_aquisicao, categoria_id, sede_id) VALUES('Polo', 'HDD9383', 0, 2015, '2015-07-21', 1, 1);
INSERT INTO tb_carro(modelo, placa, cor, ano, data_aquisicao, categoria_id, sede_id) VALUES('Fusca', 'PEH3837', 1, 2016, '2016-12-25', 2, 1);

INSERT INTO tb_estado(nome) VALUES('São Paulo');

INSERT INTO tb_cidade(nome, estado_id) VALUES('São Paulo', 1);

INSERT INTO tb_endereco(logradouro, numero, complemento, bairro, cep, cidade_id) VALUES('Rua Flores', 205, 'Bloco C', 'Jadim', '38400282', 1);

INSERT INTO tb_cliente(cpf, nome, email) VALUES('93838673610', 'Maria Silva', 'maria@gmail.com');
INSERT INTO tb_cliente(cpf, nome, email) VALUES('58236392715', 'Joaquim Jorge', 'joaquim@gmail.com');

INSERT INTO tb_telefone(cpf, numero) VALUES('58236392715', '37635393');
INSERT INTO tb_telefone(cpf, numero) VALUES('93838673610', '37636364');
INSERT INTO tb_telefone(cpf, numero) VALUES('58236392715', '89988464');

INSERT INTO tb_locacao(instante_locacao, instante_devolucao, cliente_id, carro_id, local_de_retirada_id) VALUES(TIMESTAMP WITH TIME ZONE '2017-10-30T11:13:00Z', TIMESTAMP WITH TIME ZONE '2017-10-04T14:10:00Z', '93838673610', 1, 1);
INSERT INTO tb_locacao(instante_locacao, instante_devolucao, cliente_id, carro_id, local_de_retirada_id) VALUES(TIMESTAMP WITH TIME ZONE '2017-11-15T10:03:00Z', TIMESTAMP WITH TIME ZONE '2017-10-04T14:10:00Z', '93838673610', 2, 1);
INSERT INTO tb_locacao(instante_locacao, instante_devolucao, cliente_id, carro_id, local_de_retirada_id) VALUES(TIMESTAMP WITH TIME ZONE '2017-12-25T00:03:00Z', TIMESTAMP WITH TIME ZONE '2018-07-31T03:00:00Z', '58236392715', 2, 1);

INSERT INTO tb_locacao_diaria(id, dias_previstos) VALUES(1, 4);
INSERT INTO tb_locacao_diaria(id, dias_previstos) VALUES(2, 4);

INSERT INTO tb_locacao_longo_periodo(id, porcentagem_descont) VALUES(3, 50.0);