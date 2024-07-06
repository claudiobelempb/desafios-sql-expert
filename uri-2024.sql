/*
URI 2602
Sua empresa está fazendo um levantamento de quantos clientes estão cadastrados nos estados, 
porém, faltou levantar os dados do estado do Rio Grande do Sul.
Então você deve Exibir o nome de todos os clientes cujo estado seja ‘RS’.
*/
SELECT name FROM customers
WHERE UPPER(STATE) = UPPER('RS');

/*
URI 2603
Endereço dos Clientes
A empresa fará um evento comemorando os 20 anos de mercado, e para isso faremos uma grande comemoração na cidade de Porto Alegre. 
Queremos também convidar todos os nossos clientes que estão cadastrados nessa cidade.
O seu trabalho é nos passar os nomes e os endereços dos clientes que moram em 'Porto Alegre', para entregar os convites pessoalmente.
*/

SELECT name, street FROM customers
WHERE city = 'Porto Alegre';

/*
URI 2604
Menores que 10 ou Maiores que 100
O setor financeiro da empresa precisa de um relatório que mostre o código e o nome dos produtos cujo preço são menores que 10 ou maiores que 100.
*/
SELECT id, name FROM products
WHERE price < 10 OR price > 100;

/*
URI 2605
Representantes Executivos
O setor financeiro precisa de um relatório sobre os fornecedores dos produtos que vendemos. 
Os relatórios contemplam todas as categorias, mas por algum motivo, os fornecedores dos produtos cuja categoria é a executiva, não estão no relatório.
Seu trabalho é retornar os nomes dos produtos e dos fornecedores cujo código da categoria é 6.
*/
SELECT products.name, providers.name FROM products
INNER JOIN providers
ON products.id_providers = providers.id
INNER JOIN categories 
ON products.id = categories.id
WHERE products.id_categories = 6;

/*
URI 2606
Categorias
Quando os dados foram migrados de Banco de Dados, houve um pequeno mal-entendido por parte do antigo DBA.
Seu chefe precisa que você exiba o código e o nome dos produtos, cuja categoria inicie com 'super'.
*/
SELECT products.id, products.name FROM products
INNER JOIN categories
ON products.id_categories = categories.id
WHERE UPPER(categories.name) LIKE UPPER('super%')

/*
URI 2607
Cidades em Ordem Alfabética
Todos os meses a empresa pede um relatório das cidades que os fornecedores estão cadastrados. 
Dessa vez não vai ser diferente, faça uma consulta no Banco de Dados que retorne todas as cidades dos fornecedores, 
mas em ordem alfabética.
OBS: Você não deve mostrar cidades repetidas.
*/
SELECT city FROM providers
ORDER BY city

/*
URI 2608
Maior e Menor Preço
O setor financeiro da nossa empresa, está querendo saber os menores e maiores valores dos produtos, que vendemos.
Para isso exiba somente o maior e o menor preço da tabela produtos.
*/
SELECT MAX(price) AS price, MIN(price) AS price
FROM products;

/*
URI 2609
Produtos por Categorias
Como de costume o setor de vendas está fazendo uma análise de quantos produtos temos em estoque, e você poderá ajudar eles.
Então seu trabalho será exibir o nome e a quantidade de produtos de cada uma categoria.
*/
SELECT categories.name, SUM(products.amount) FROM products
INNER JOIN categories
ON products.id_categories = categories.id
GROUP BY categories.name
ORDER BY categories.name;

/*
URI 2610
Valor Médio dos Produtos
Na empresa que você trabalha está sendo feito um levantamento sobre os valores dos produtos que são comercializados.
Para ajudar o setor que está fazendo esse levantamento você deve calcular e exibir o valor médio do preço dos produtos.
OBS: Mostrar o valor com dois números após o ponto.
*/
SELECT TRUNC(AVG(price), 2) FROM products;

/*
URI 2611
Filmes de Ação
Uma Vídeo locadora contratou seus serviços para catalogar os filmes dela. 
Eles precisam que você selecione o código e o nome dos filmes cuja descrição do gênero seja 'Action'.
*/
SELECT movies.id, movies.name FROM movies
INNER JOIN genres
ON movies.id_genres =  genres.id
WHERE UPPER(genres.description) = UPPER('Action');

/*
URI 2613
Filmes em Promoção
Antigamente a locadora fez um evento em que vários filmes estavam em promoção, queremos saber que filmes eram esses.
Seu trabalho para nós ajudar é selecionar o ID e o nome dos filmes cujo preço for menor que 2.00.
*/
SELECT movies.id, movies.name FROM movies
INNER JOIN prices
ON movies.id_prices = prices.id
WHERE prices.value < 2.00;

/*
URI 2617
Fornecedor Ajax SA
O setor financeiro encontrou alguns problemas na entrega de um dos nossos fornecedores, a entrega dos produtos não condiz com a nota fiscal.
Seu trabalho é exibir o nome dos produtos e o nome do fornecedor, para os produtos fornecidos pelo fornecedor ‘Ajax SA’.
*/
SELECT products.name, providers.name 
FROM products
INNER JOIN providers
ON products.id_providers = providers.id 
WHERE providers.name = 'Ajax SA'

/*
URI 2618
Produtos Importados
O setor de importação da nossa empresa precisa de um relatório sobre a importação de produtos do nosso fornecedor Sansul.
Sua tarefa é exibir o nome dos produtos, o nome do fornecedor e o nome da categoria, para os produtos fornecidos pelo fornecedor ‘Sansul SA’ e cujo nome da categoria seja 'Imported'.
*/
SELECT products.name, providers.name, categories.name  
FROM products
INNER JOIN categories
ON products.id_categories = categories.id
INNER JOIN providers
ON products.id_providers = providers.id
WHERE providers.name = 'Sansul SA' AND categories.name = 'Imported'

/*
URI 2619
Super Luxo
A nossa empresa está querendo fazer um novo contrato para o fornecimento de novos produtos superluxuosos, e para isso precisamos de alguns dados dos nossos produtos.
Seu trabalho é exibir o nome dos produtos, nome dos fornecedores e o preço, para os produtos cujo preço seja maior que 1000 e sua categoria seja ‘Super Luxury.
*/
SELECT products.name, providers.name, products.price  
FROM products
INNER JOIN categories
ON products.id_categories = categories.id
INNER JOIN providers
ON products.id_providers = providers.id
WHERE products.price > 1000 AND categories.name = 'Super Luxury';

/*
URI 2620
Pedidos no Primeiro Semestre
A auditoria financeira da empresa está pedindo para nós um relatório do primeiro semestre de 2016. 
Então exiba o nome dos clientes e o número do pedido para os clientes que fizeram pedidos no primeiro semestre de 2016.
*/
SELECT customers.name, orders.id 
FROM orders
INNER JOIN customers
ON orders.id_customers = customers.id
WHERE orders.orders_date BETWEEN '2016-01-01' AND '2016-06-30';
--WHERE orders.orders_date > '2016-01-01' AND orders.orders_date < '2016-06-30';