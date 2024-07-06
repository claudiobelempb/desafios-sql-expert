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
URI 2602
Sua empresa está fazendo um levantamento de quantos clientes estão cadastrados nos estados, 
porém, faltou levantar os dados do estado do Rio Grande do Sul.
Então você deve Exibir o nome de todos os clientes cujo estado seja ‘RS’.
*/