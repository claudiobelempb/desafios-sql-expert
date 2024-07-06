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
SELECT products.id, products.name FROM products
INNER JOIN categories
ON products.id_categories = categories.id
WHERE UPPER(categories.name) LIKE UPPER('super%')
