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

/*
Funções comuns
UPPER, LOWER
CAST, ROUND
DAY, MONTH, YEAR, EXTRACT
CONCAT
CASE
REPLACE
CHAR_LENGTH
MD5
Atenção: as funções variam um pouco entre os SGBDs
*/

SELECT *
FROM tb_seller
WHERE LIKE name '%M';

/*Função UPPER, LOWER*/
SELECT *
FROM tb_seller
WHERE UPPER(name) LIKE UPPER('M%');

SELECT *
FROM tb_seller
WHERE LOWER(name) LIKE LOWER('M%');

/*Função CAST, ROUND*/
SELECT ROUND(10.456, 2);
SELECT id, date, ROUND(CAST(price AS NUMERIC), 2), quantity
FROM tb_sale;

/*Função DAY, MONTH, YEAR, EXTRACT*/
SELECT id, date, price, CAST(EXTRACT(DAY FROM date) AS INTEGER) AS dia
FROM tb_sale;
SELECT id, date, price, CAST(EXTRACT(YEAR FROM date) AS INTEGER) AS ano
FROM tb_sale;
SELECT id, date, price, CAST(EXTRACT(YEAR FROM date) AS INTEGER) AS ano
FROM tb_sale
WHERE EXTRACT(DAY FROM date) = 18;

/*Função CONCAT*/
SELECT CONCAT('Claudio', 'Cardoso');
SELECT CONCAT('Claudio',' ', 'Cardoso');
SELECT *, CONCAT(EXTRACT(MONTH FROM date), '/', EXTRACT(YEAR FROM date)) AS mes_ano
FROM tb_sale;

/*Função CASE*/
SELECT *, 
CASE
	WHEN EXTRACT(MONTH FROM date) >= 10 THEN CONCAT(EXTRACT(MONTH FROM date), '/', EXTRACT(YEAR FROM date))
	ELSE CONCAT('0', EXTRACT(MONTH FROM date), '/', EXTRACT(YEAR FROM date))
	 
END AS mes_ano
FROM tb_sale;

SELECT *,
CASE
	WHEN price < 500 THEN 'Barata'
	ELSE 'Cara'
END AS Classificacao
FROM tb_sale;

/*Função REPLACE*/
SELECT REPLACE('Claudio Cardoso', 'C', 'G');
SELECT id, name, REPLACE(name, 'Silva', '')
FROM tb_seller;

/*Função CHAR_LENGTH*/
SELECT id, name, CHAR_LENGTH(NAME) AS qtd
FROM tb_seller;

/*Função MD5*/
SELECT id, name, MD5(name)
FROM tb_seller;

/*Funções de agregação COUNT, SUM, AVG, MIN, MAX*/

/*Função COUNT*/
SELECT
COUNT(id)
FROM tb_sale
WHERE price > 500;

/*Função SUM*/
SELECT
SUM(price)
FROM tb_sale
WHERE price > 500;

/*Função AVG*/
SELECT
AVG(price)
FROM tb_sale
WHERE price > 500;

/*Função MIN*/
SELECT
MIN(price)
FROM tb_sale
WHERE price > 500;

/*Função MAX*/
SELECT
MAX(price)
FROM tb_sale
WHERE price > 500;

/*
DISTINCT
Exemplo: id e nome dos vendedores que venderam produtos mais
caros que 500.00
*/

SELECT DISTINCT se.id, se.name 
FROM tb_sale sa
INNER JOIN tb_seller se
ON se.id = sa.seller_id
WHERE sa.price > 500;

/*ORDER BY, TOP, LIMIT*/
SELECT DISTINCT se.id, se.name, sa.price
FROM tb_sale sa
INNER JOIN tb_seller se
ON se.id = sa.seller_id
WHERE sa.price > 500
ORDER BY se.id ASC, sa.price DESC
LIMIT 2;

/*
GROUP BY
Exemplo: quantidade de vendas por dia
Exemplo: total em dinheiro vendido por vendedor
*/
SELECT date, COUNT(date)
FROM tb_sale
GROUP BY date;

SELECT date, SUM(price), COUNT(date)
FROM tb_sale
GROUP BY date
ORDER BY date;

SELECT se.name, ROUND(CAST(SUM(sa.price* sa.quantity) AS NUMERIC), 2)
FROM tb_seller AS se
INNER JOIN tb_sale AS sa
ON se.id = sa.seller_id
GROUP BY se.name;

/*
Subconsultas
Usos comuns:
• Diferença / União
• Resolução de consultas complexas
O resultado de uma consulta é uma tabela. Este resultado pode naturalmente ser
usado como parâmetro de uma cláusula FROM ou qualquer outra cláusula que
receba uma tabela como argumento.
Exemplo: data da venda e nome do vendedor para vendas cujo preço unitário seja
menor que 500
*/
SELECT date, name, price
FROM (
	SELECT *
	FROM tb_seller AS se
	INNER JOIN tb_sale AS sa
	ON se.id = sa.seller_id
) AS juncao 
WHERE price < 500;

/*
UNIÃO
Exemplo: id e data das vendas cujo preço unitário é maior que 800.0,
ou que sejam do vendedor "Joaquim Silva Borges"
*/
SELECT * FROM (
	SELECT id, date
	FROM tb_sale
	WHERE price > 800

	UNION

	SELECT tb_sale.id, date
	FROM tb_sale
	INNER JOIN tb_seller
	ON tb_sale.seller_id = tb_seller.id
	WHERE name = 'Joaquim Silva Borges'
) AS uniao
ORDER BY id;

/*
DIFERENÇA
Exemplo: id, data, e quantidade de todas vendas que não sejam nos
mesmos dias em que o vendedor "Ivan Reis" vendeu.
*/

SELECT *
FROM tb_sale
INNER JOIN tb_seller ON tb_sale.seller_id = tb_seller.id
WHERE date NOT IN (
	SELECT date
	FROM tb_sale
	INNER JOIN tb_seller ON tb_sale.seller_id = tb_seller.id
	WHERE name = 'Ivan Reis'
);
