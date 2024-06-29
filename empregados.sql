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

/*
PRODUTO CARTESIANO
É uma operação que faz o "cruzamento" de todos registros entre duas tabelas.
"Produto cartesiano entre as tabelas tb_empregado e tb_departamento"
*/
SELECT * FROM tb_empregado, tb_departamento;

/*
JUNÇÃO
Faz o "cruzamento" entre duas tabelas apenas dos registros correspondentes.
"Junção entre as tabelas tb_empregado e tb_departamento"
*/
SELECT * 
FROM tb_empregado 
INNER JOIN tb_departamento 
ON tb_empregado.dept_id = tb_departamento.id;
/*Alternativa: produto cartesiado + restrição*/
SELECT *
FROM tb_empregado, tb_departamento
WHERE tb_empregado.dept_id = tb_departamento.id;

/*
Tipos de junção
(INNER) JOIN: Retorna registros que possuem valores correspondentes em ambas as tabelas
LEFT (OUTER) JOIN: Retorna todos os registros da tabela esquerda e os registros correspondentes da tabela direita
RIGHT (OUTER) JOIN: Retorna todos os registros da tabela direita e os registros correspondentes da tabela esquerda
FULL (OUTER) JOIN: Retorna todos os registros quando há uma correspondência na tabela esquerda ou direita
*/
SELECT * 
FROM tb_empregado
INNER JOIN tb_departamento
ON tb_empregado.dept_id = tb_departamento.id;

SELECT *
FROM tb_empregado
LEFT JOIN tb_departamento
ON tb_empregado.dept_id = tb_departamento.id;

SELECT *
FROM tb_empregado
RIGHT JOIN tb_departamento
ON tb_empregado.dept_id = tb_departamento.id;

SELECT *
FROM tb_empregado
FULL JOIN tb_departamento
ON tb_empregado.dept_id = tb_departamento.id;

/*
Renomeação: AS
Usos comuns:
• Remover ambiguidades
• Dar nome a campos calculados
• Dar nome a tabelas resultantes de subconsultas
*/
SELECT *
FROM tb_empregado
INNER JOIN tb_departamento
ON tb_empregado.dept_id = tb_departamento.id;

SELECT e.id AS "empregado_id", e.nome AS "empregado", d.id AS "departamento_id", d.nome AS "departamento"
FROM tb_empregado AS e
INNER JOIN tb_departamento AS d
ON e.dept_id = d.id;

/*
Operadores LIKE, IN, BETWEEN
o operador IN pode ser usado tanto para valores como para tabelas.
*/

SELECT * FROM tb_seller;

SELECT * 
FROM tb_seller
WHERE name LIKE '%S%';

/*o operador IN pode ser usado tanto para valores como para tabelas.*/
SELECT *
FROM tb_seller
WHERE id IN (2, 4);

SELECT *
FROM tb_sale
WHERE date >= '2022-05-07' AND date <= '2022-05-23';

SELECT *
FROM tb_sale
WHERE date BETWEEN '2022-05-07' AND '2022-05-23';