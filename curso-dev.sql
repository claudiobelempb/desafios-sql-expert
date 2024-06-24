SHOW datestyle;
SET datestyle = 'ISO, DMY';

CREATE TABLE tb_cargo(
	id INTEGER PRIMARY KEY,
	name VARCHAR(20) NOT NULL,
	nivel VARCHAR(10),
	salario FLOAT
);

CREATE TABLE tb_departamento(
	id INTEGER PRIMARY KEY,
	nome VARCHAR(20) NOT NULL,
	sigla VARCHAR(10)
);

CREATE TABLE tb_funcionario(
	id INTEGER,
	nome VARCHAR(30) NOT NULL,
	data_adm DATE,
	sexo CHAR(1),
	cod_cargo INTEGER NOT NULL,
	cod_depto INTEGER NOT NULL,
	PRIMARY KEY(id),
	FOREIGN KEY(cod_cargo) REFERENCES tb_cargo(id),
	FOREIGN KEY(cod_depto) REFERENCES tb_departamento(id)
);

/*incluindo e removendo columns em tabelas existentes*/
ALTER TABLE <nome_tabela> ADD COLUMNS <nova_coluna> <tipo_de_dado>;
ALTER TABLE tb_funcionario ADD data_nasc DATE;
ALTER TABLE tb_funcionario ADD contact_email VARCHAR(32) NOT NULL;

/*Comando DROP Apaga a estrutura de um banco de dados, tabela, visão, etc.*/
ALTER TABLE tb_funcionario DROP COLUMN <nova_coluna> ;
ALTER TABLE tb_funcionario DROP COLUMN contact_email;


/*Alterar o nome de uma coluna existente*/
ALTER TABLE table_name RENAME [COLUMN] column_name TO
new_column_name;
ALTER TABLE tb_funcionario RENAME data_nasc TO birth;
ALTER TABLE tb_cargo RENAME name TO nome;

/*Alterar o tipo de dado da coluna*/
ALTER TABLE table_name ALTER [COLUMN] column_name TYPE
new_datatype

/*Adicionar uma chave primária (PK*/
ALTER TABLE table_name ADD PRIMARY KEY(column_name);

/*Remover uma chave primária (PK)*/
ALTER TABLE table_name DROP CONSTRAINT primary_key_constraint;

/*Adicionar uma chave estrangeira (FK)*/
ALTER TABLE table_name ADD FOREIGN KEY(column_name) REFERENCES
source_table(source_column_name)

/*Remover uma chave estrangeira*/
ALTER TABLE table_name DROP CONSTRAINT foreign_key_constraint;


/*Comando INSERT*/
INSERT INTO table_name VALUES (V1, V2, …, VN);
INSERT INTO table_name(C1, C2, …, Cn) VALUES (V1, V2, …, Vn);

INSERT INTO tb_cargo(id, nome, nivel, salario) VALUES(1, 'Analista de Sistema', 'JR', 3000);
INSERT INTO tb_cargo(id, nome, nivel, salario) VALUES(2, 'Desenvolvedor', 'JR', 2500);

/*Altera dados específicos de uma tabela*/
UPDATE table_name SET column = new_value WHERE predicate;
UPDATE tb_funcionario SET nome = 'Ricardo Ferandes Oliveira'  WHERE id = 4;

/*Remove dados específicos de uma tabela*/
DELETE FROM table_name WHERE predicate;
DELETE FROM tb_cargo WHERE id = 10;

/*Utilizando as cláusulas RESTRICT e CASCADE*/
DELETE FROM table_name WHERE predicate;
