CREATE TABLE tb_departamento (
    id int, 
    nome varchar(100), 
    PRIMARY KEY (id)
);

CREATE TABLE tb_empregado (
    id int8, 
    nome varchar(100), 
    dept_id int,
    PRIMARY KEY (id),
    FOREIGN KEY (dept_id) REFERENCES tb_departamento
);

INSERT INTO tb_departamento (id, nome) VALUES (1, 'Financeiro');
INSERT INTO tb_departamento (id, nome) VALUES (2, 'Recursos Humanos');
INSERT INTO tb_departamento (id, nome) VALUES (3, 'Comercial');

INSERT INTO tb_empregado (id, nome, dept_id) VALUES (1, 'Maria', 1);
INSERT INTO tb_empregado (id, nome, dept_id) VALUES (2, 'João', 2);
INSERT INTO tb_empregado (id, nome, dept_id) VALUES (3, 'Ana', 1);
INSERT INTO tb_empregado (id, nome, dept_id) VALUES (4, 'Carlos', 2);

/*
PROJEÇÃO
É uma operação que "filtra" as colunas da tabela.
"Projeção das colunas id e nome da tabela tb_empregado"
*/
SELECT id, nome FROM tb_empregado;

/*
RESTRIÇÃO (SELEÇÃO)
É uma operação que "filtra" as linhas da tabela conforme um predicado.
"Restrição na tb_empregado das linhas tal que: dept_id = 2"
*/
SELECT * FROM tb_empregado WHERE dept_id = 2;
/*Você pode combinar operações*/
SELECT id, nome FROM tb_empregado WHERE dept_id = 2;