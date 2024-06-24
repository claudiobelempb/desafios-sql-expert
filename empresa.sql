SHOW datestyle;
SET datestyle = 'ISO, DMY';

/*creando banco de dados*/
CREATE DATABASE empresa;

CREATE TABLE tb_cargo(
	id SERIAL NOT NULL,
	nome VARCHAR(32),
	nivel VARCHAR(16),
	salario NUMERIC(10, 2)
);

ALTER TABLE tb_cargo ADD PRIMARY KEY(id);

CREATE TABLE tb_departamento(
	id SERIAL NOT NULL,
	nome VARCHAR(32),
	sigla CHAR(2)
);

ALTER TABLE tb_departamento ADD PRIMARY KEY(id);
ALTER TABLE tb_departamento ALTER sigla TYPE VARCHAR(10);

CREATE TABLE tb_funcionario(
	id SERIAL NOT NULL,
	nome VARCHAR(32),
	data_adm DATE,
	sexo CHAR(1),
	cod_cargo INTEGER NOT NULL,
	cod_depto INTEGER NOT NULL
);

ALTER TABLE tb_funcionario ADD PRIMARY KEY(id);
ALTER TABLE tb_funcionario ADD FOREIGN KEY(cod_cargo) REFERENCES tb_cargo(id);
ALTER TABLE tb_funcionario ADD FOREIGN KEY(cod_depto) REFERENCES tb_departamento(id);

INSERT INTO tb_cargo(nome, nivel, salario) VALUES('Analista de Sistema', 'JR', 3000);
INSERT INTO tb_cargo(nome, nivel, salario) VALUES('Desenvolverdor', 'JR', 2500);
INSERT INTO tb_cargo(nome, nivel, salario) VALUES('Desenvolvedor', 'Pleno', 5200);
INSERT INTO tb_cargo(nome, nivel, salario) VALUES('Atendente', null, 1212);
INSERT INTO tb_cargo(nome, nivel, salario) VALUES('Contador', null, 5000);

INSERT INTO tb_departamento(nome, sigla) VALUES('Informática', 'INF');
INSERT INTO tb_departamento(nome, sigla) VALUES('Financeiro', 'FIN');
INSERT INTO tb_departamento(nome, sigla) VALUES('Recursus Humanos', 'RH');

INSERT into tb_funcionario(nome, data_adm, sexo, cod_cargo, cod_depto) VALUES('Pedro Nogueira', '12/03/2021', 'M', 1, 1);
INSERT into tb_funcionario(nome, data_adm, sexo, cod_cargo, cod_depto) VALUES('Maria Silva', '22/04/2021', 'F', 2, 1);
INSERT into tb_funcionario(nome, data_adm, sexo, cod_cargo, cod_depto) VALUES('Rafaela Silva', '05/07/2020', 'F', 2, 1);
INSERT into tb_funcionario(nome, data_adm, sexo, cod_cargo, cod_depto) VALUES('Ricardo Oliveira', '06/04/2019', 'M', 5, 2);
INSERT into tb_funcionario(nome, data_adm, sexo, cod_cargo, cod_depto) VALUES('Tamara Juqueira', '01/11/2015', 'F', 3, 1);
INSERT into tb_funcionario(nome, data_adm, sexo, cod_cargo, cod_depto) VALUES('Jane Rosa', '01/10/2021', 'F', 4, 3);
INSERT into tb_funcionario(nome, data_adm, sexo, cod_cargo, cod_depto) VALUES('Fernando Silva', '02/04/2022', 'M', 3, 1);
INSERT into tb_funcionario(nome, data_adm, sexo, cod_cargo, cod_depto) VALUES('Rosana Vieira', '07/08/2018', 'F', 2, 1);
INSERT into tb_funcionario(nome, data_adm, sexo, cod_cargo, cod_depto) VALUES('Leonardo Chaves', '15/03/2021', 'M', 5, 2);
INSERT into tb_funcionario(nome, data_adm, sexo, cod_cargo, cod_depto) VALUES('João Marques', '15/04/2021', 'M', 3, 1);