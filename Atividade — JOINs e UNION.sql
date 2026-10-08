#  INNER JOIN — 

# 1 Liste o nome dos clientes e as datas de seus pedidos
select clientes.nome, pedidos.Data_Venda 
FROM clientes 
INNER JOIN pedidos 
    ON clientes.id_cliente = pedidos.id_cliente;


# 2. Mostre o nome dos produtos e a categoria de cada um
SELECT produtos.Nome_Produto, categorias.Categoria 
FROM produtos
INNER JOIN categorias
    ON produtos.id_categoria = categorias.id_categoria;


# 3. Exiba cada pedido com o nome da loja onde foi realizado
SELECT pedidos.id_pedido, lojas.Loja 
FROM pedidos
INNER JOIN lojas
    ON pedidos.id_loja = lojas.id_loja;

# 4. Liste pedido, produto e quantidade vendida
SELECT pedidos.ID_Pedido, produtos.Nome_Produto, pedidos.Qtd_Vendida
FROM pedidos
INNER JOIN produtos
    ON pedidos.ID_Produto = produtos.ID_Produto;


# 5. Liste pedido, cliente e produto comprado
SELECT pedidos.ID_Pedido, clientes.Nome, produtos.Nome_Produto
FROM pedidos
INNER JOIN clientes
    ON pedidos.ID_Cliente = clientes.ID_Cliente
INNER JOIN produtos
    ON pedidos.ID_Produto = produtos.ID_Produto;


# 6. Exiba produto, categoria e marca
SELECT produtos.Nome_Produto, categorias.Categoria, produtos.Marca_Produto
FROM produtos
INNER JOIN categorias
    ON produtos.ID_Categoria = categorias.ID_Categoria;


# 7. Liste cliente, loja e receita de cada pedido
SELECT clientes.Nome, lojas.Loja, pedidos.Receita_Venda
FROM pedidos
INNER JOIN clientes
    ON pedidos.ID_Cliente = clientes.ID_Cliente
INNER JOIN lojas
    ON pedidos.ID_Loja = lojas.ID_Loja;


# 8. Exiba pedido, cliente, produto, loja e data da venda
SELECT
    pedidos.ID_Pedido,
    clientes.Nome,
    produtos.Nome_Produto,
    lojas.Loja,
    pedidos.Data_Venda
FROM pedidos
INNER JOIN clientes
    ON pedidos.ID_Cliente = clientes.ID_Cliente
INNER JOIN produtos
    ON pedidos.ID_Produto = produtos.ID_Produto
INNER JOIN lojas
    ON pedidos.ID_Loja = lojas.ID_Loja;


# 9. Mostre os produtos da marca DELL que aparecem em pedidos
SELECT DISTINCT produtos.Nome_Produto
FROM produtos
INNER JOIN pedidos
    ON produtos.ID_Produto = pedidos.ID_Produto
WHERE produtos.Marca_Produto = "DELL";


# 10. Liste as lojas que venderam produtos da categoria Notebook
SELECT DISTINCT lojas.Loja
FROM lojas
INNER JOIN pedidos
    ON lojas.ID_Loja = pedidos.ID_Loja
INNER JOIN produtos
    ON pedidos.ID_Produto = produtos.ID_Produto
INNER JOIN categorias
    ON produtos.ID_Categoria = categorias.ID_Categoria
WHERE categorias.Categoria = 'Notebook';


# 11. Exiba a receita total por loja mostrando o nome da loja
SELECT lojas.Loja, SUM(pedidos.Receita_Venda)
FROM lojas
INNER JOIN pedidos
    ON lojas.ID_Loja = pedidos.ID_Loja
GROUP BY lojas.ID_Loja, lojas.Loja;


# 12. Exiba a receita total por produto mostrando o nome do produto
SELECT produtos.Nome_Produto, SUM(pedidos.Receita_Venda)
FROM produtos
INNER JOIN pedidos
    ON produtos.ID_Produto = pedidos.ID_Produto
GROUP BY produtos.ID_Produto, produtos.Nome_Produto;


# 13. Liste os clientes que já compraram produtos da marca LOGITECH
SELECT DISTINCT clientes.Nome
FROM clientes
INNER JOIN pedidos
    ON clientes.ID_Cliente = pedidos.ID_Cliente
INNER JOIN produtos
    ON pedidos.ID_Produto = produtos.ID_Produto
WHERE produtos.Marca_Produto = 'LOGITECH';


# 14. Mostre a quantidade de clientes distintos atendidos por loja
SELECT lojas.Loja, COUNT(DISTINCT pedidos.ID_Cliente)
FROM lojas
INNER JOIN pedidos
    ON lojas.ID_Loja = pedidos.ID_Loja
GROUP BY lojas.ID_Loja, lojas.Loja;


# 15. Exiba categoria, produto e quantidade de pedidos em que o produto aparece
SELECT
    categorias.Categoria,
    produtos.Nome_Produto,
    COUNT(pedidos.ID_Pedido)
FROM categorias
INNER JOIN produtos
    ON categorias.ID_Categoria = produtos.ID_Categoria
INNER JOIN pedidos
    ON produtos.ID_Produto = pedidos.ID_Produto
GROUP BY
    categorias.ID_Categoria,
    categorias.Categoria,
    produtos.ID_Produto,
    produtos.Nome_Produto;


# LEFT JOIN — 

# 1. Liste todas as categorias e seus produtos, incluindo categorias sem produto
SELECT categorias.Categoria, produtos.Nome_Produto
FROM categorias
LEFT JOIN produtos
    ON categorias.ID_Categoria = produtos.ID_Categoria;

# 2. Mostre todas as lojas e seus pedidos, incluindo lojas sem pedidos
SELECT lojas.Loja, pedidos.ID_Pedido
FROM lojas
LEFT JOIN pedidos
    ON lojas.ID_Loja = pedidos.ID_Loja;


# 3. Liste todos os clientes e seus pedidos, incluindo clientes que nunca compraram
SELECT clientes.Nome, pedidos.ID_Pedido
FROM clientes
LEFT JOIN pedidos
    ON clientes.ID_Cliente = pedidos.ID_Cliente;


# 4. Exiba todos os produtos e pedidos associados, incluindo produtos nunca vendidos
SELECT produtos.Nome_Produto, pedidos.ID_Pedido
FROM produtos
LEFT JOIN pedidos
    ON produtos.ID_Produto = pedidos.ID_Produto;


# 5. Mostre a quantidade de pedidos por cliente, incluindo zero
SELECT clientes.Nome, COUNT(pedidos.ID_Pedido)
FROM clientes
LEFT JOIN pedidos
    ON clientes.ID_Cliente = pedidos.ID_Cliente
GROUP BY clientes.ID_Cliente, clientes.Nome;


# 6. Mostre a quantidade vendida por produto, incluindo produtos sem venda
SELECT
    produtos.Nome_Produto,
    SUM(pedidos.Qtd_Vendida)
FROM produtos
LEFT JOIN pedidos
    ON produtos.ID_Produto = pedidos.ID_Produto
GROUP BY produtos.ID_Produto, produtos.Nome_Produto;


# 7. Exiba o faturamento por loja, incluindo lojas sem venda
SELECT
    lojas.Loja,
    SUM(pedidos.Receita_Venda)
FROM lojas
LEFT JOIN pedidos
    ON lojas.ID_Loja = pedidos.ID_Loja
GROUP BY lojas.ID_Loja, lojas.Loja;


# 8. Mostre a quantidade de produtos por categoria, incluindo categorias vazias
SELECT
    categorias.Categoria,
    COUNT(produtos.ID_Produto)
FROM categorias
LEFT JOIN produtos
    ON categorias.ID_Categoria = produtos.ID_Categoria
GROUP BY categorias.ID_Categoria, categorias.Categoria;


# 9. Liste todos os produtos com sua categoria
SELECT produtos.Nome_Produto, categorias.Categoria
FROM produtos
LEFT JOIN categorias
    ON produtos.ID_Categoria = categorias.ID_Categoria;


# 10. Liste apenas os clientes que nunca fizeram pedidos
SELECT clientes.Nome
FROM clientes
LEFT JOIN pedidos
    ON clientes.ID_Cliente = pedidos.ID_Cliente
WHERE pedidos.ID_Pedido IS NULL;


# 11. Liste apenas os produtos que nunca foram vendidos
SELECT produtos.Nome_Produto
FROM produtos
LEFT JOIN pedidos
    ON produtos.ID_Produto = pedidos.ID_Produto
WHERE pedidos.ID_Pedido IS NULL;


# 12. Liste apenas as lojas que não possuem pedidos
SELECT lojas.Loja
FROM lojas
LEFT JOIN pedidos
    ON lojas.ID_Loja = pedidos.ID_Loja
WHERE pedidos.ID_Pedido IS NULL;


# 13. Liste apenas as categorias que não possuem produtos
SELECT categorias.Categoria
FROM categorias
LEFT JOIN produtos
    ON categorias.ID_Categoria = produtos.ID_Categoria
WHERE produtos.ID_Produto IS NULL;


# RIGHT JOIN — 

# 1. Liste todos os clientes e seus pedidos, preservando todos os clientes
SELECT clientes.Nome, pedidos.ID_Pedido
FROM pedidos
RIGHT JOIN clientes
    ON pedidos.ID_Cliente = clientes.ID_Cliente;


# 2. Exiba todos os produtos e pedidos, preservando todos os produtos
SELECT produtos.Nome_Produto, pedidos.ID_Pedido
FROM pedidos
RIGHT JOIN produtos
    ON pedidos.ID_Produto = produtos.ID_Produto;


# 3. Mostre todas as lojas e pedidos, preservando todas as lojas
SELECT lojas.Loja, pedidos.ID_Pedido
FROM pedidos
RIGHT JOIN lojas
    ON pedidos.ID_Loja = lojas.ID_Loja;


# 4. Liste todas as categorias e produtos, preservando todas as categorias
SELECT categorias.Categoria, produtos.Nome_Produto
FROM produtos
RIGHT JOIN categorias
    ON produtos.ID_Categoria = categorias.ID_Categoria;


# 5. Exiba pedidos e clientes associados, preservando todos os clientes
SELECT pedidos.ID_Pedido, clientes.Nome
FROM pedidos
RIGHT JOIN clientes
    ON pedidos.ID_Cliente = clientes.ID_Cliente;


# 6. Exiba pedidos e produtos associados, preservando todos os produtos
SELECT pedidos.ID_Pedido, produtos.Nome_Produto
FROM pedidos
RIGHT JOIN produtos
    ON pedidos.ID_Produto = produtos.ID_Produto;


# 7. Exiba pedidos e lojas associadas, preservando todas as lojas
SELECT pedidos.ID_Pedido, lojas.Loja
FROM pedidos
RIGHT JOIN lojas
    ON pedidos.ID_Loja = lojas.ID_Loja;


# 8. Liste produtos e categorias, preservando todas as categorias
SELECT produtos.Nome_Produto, categorias.Categoria
FROM produtos
RIGHT JOIN categorias
    ON produtos.ID_Categoria = categorias.ID_Categoria;


# 9. Mostre clientes e quantidade de pedidos, incluindo clientes sem compras
SELECT clientes.Nome, COUNT(pedidos.ID_Pedido)
FROM pedidos
RIGHT JOIN clientes
    ON pedidos.ID_Cliente = clientes.ID_Cliente
GROUP BY clientes.ID_Cliente, clientes.Nome;


# 10. Mostre produtos e quantidade vendida, incluindo produtos nunca vendidos
SELECT
    produtos.Nome_Produto,
    SUM(pedidos.Qtd_Vendida)
FROM pedidos
RIGHT JOIN produtos
    ON pedidos.ID_Produto = produtos.ID_Produto
GROUP BY produtos.ID_Produto, produtos.Nome_Produto;


# 11. Mostre lojas e faturamento, incluindo lojas sem venda
SELECT
    lojas.Loja,
    SUM(pedidos.Receita_Venda)
FROM pedidos
RIGHT JOIN lojas
    ON pedidos.ID_Loja = lojas.ID_Loja
GROUP BY lojas.ID_Loja, lojas.Loja;


# 12. Liste clientes que não possuem correspondência em pedidos
SELECT clientes.Nome
FROM pedidos
RIGHT JOIN clientes
    ON pedidos.ID_Cliente = clientes.ID_Cliente
WHERE pedidos.ID_Pedido IS NULL;


# 13. Liste produtos sem correspondência em pedidos
SELECT produtos.Nome_Produto
FROM pedidos
RIGHT JOIN produtos
    ON pedidos.ID_Produto = produtos.ID_Produto
WHERE pedidos.ID_Pedido IS NULL;


# 14. Liste categorias sem correspondência em produtos
SELECT categorias.Categoria
FROM produtos
RIGHT JOIN categorias
    ON produtos.ID_Categoria = categorias.ID_Categoria
WHERE produtos.ID_Produto IS NULL;


# CROSS JOIN — 

# 1. Gere todas as combinações entre lojas e categorias
SELECT
    lojas.ID_Loja,
    lojas.Loja,
    categorias.ID_Categoria,
    categorias.Categoria
FROM lojas
CROSS JOIN categorias;


# 2. Antes de executar a questão 1, calcule quantas linhas o resultado deve possuir usando COUNT(*) das duas tabelas.
SELECT COUNT(*)
FROM lojas;

SELECT COUNT(*)
FROM categorias;

SELECT
    (SELECT COUNT(*) FROM lojas)
    *
    (SELECT COUNT(*) FROM categorias);

SELECT COUNT(*)
FROM lojas
CROSS JOIN categorias;



# 3. Gere todas as combinações entre lojas e produtos, exibindo apenas IDs e nomes
SELECT
    lojas.ID_Loja,
    lojas.Loja,
    produtos.ID_Produto,
    produtos.Nome_Produto
FROM lojas
CROSS JOIN produtos;


# 4. Gere todas as combinações entre categorias e lojas e ordene por categoria e loja
SELECT
    categorias.Categoria,
    lojas.Loja
FROM categorias
CROSS JOIN lojas
ORDER BY categorias.Categoria, lojas.Loja;


# FULL OUTER JOIN — compatibilidade com MySQL

# 1. Liste todos os clientes e todos os pedidos, com ou sem correspondência.
SELECT clientes.ID_Cliente, clientes.Nome, pedidos.ID_Pedido
FROM clientes
LEFT JOIN pedidos
    ON clientes.ID_Cliente = pedidos.ID_Cliente

UNION ALL

SELECT clientes.ID_Cliente, clientes.Nome, pedidos.ID_Pedido
FROM clientes
RIGHT JOIN pedidos
    ON clientes.ID_Cliente = pedidos.ID_Cliente
WHERE clientes.ID_Cliente IS NULL;


# 2. Exiba todos os produtos e todos os pedidos, com ou sem correspondência
SELECT produtos.ID_Produto, produtos.Nome_Produto, pedidos.ID_Pedido
FROM produtos
LEFT JOIN pedidos
    ON produtos.ID_Produto = pedidos.ID_Produto

UNION ALL

SELECT produtos.ID_Produto, produtos.Nome_Produto, pedidos.ID_Pedido
FROM produtos
RIGHT JOIN pedidos
    ON produtos.ID_Produto = pedidos.ID_Produto
WHERE produtos.ID_Produto IS NULL;


# 3. Mostre todas as lojas e todos os pedidos
SELECT lojas.ID_Loja, lojas.Loja, pedidos.ID_Pedido
FROM lojas
LEFT JOIN pedidos
    ON lojas.ID_Loja = pedidos.ID_Loja

UNION ALL

SELECT lojas.ID_Loja, lojas.Loja, pedidos.ID_Pedido
FROM lojas
RIGHT JOIN pedidos
    ON lojas.ID_Loja = pedidos.ID_Loja
WHERE lojas.ID_Loja IS NULL;


# 4. Liste todas as categorias e todos os produtos
SELECT
    categorias.ID_Categoria,
    categorias.Categoria,
    produtos.ID_Produto,
    produtos.Nome_Produto
FROM categorias
LEFT JOIN produtos
    ON categorias.ID_Categoria = produtos.ID_Categoria

UNION ALL

SELECT
    categorias.ID_Categoria,
    categorias.Categoria,
    produtos.ID_Produto,
    produtos.Nome_Produto
FROM categorias
RIGHT JOIN produtos
    ON categorias.ID_Categoria = produtos.ID_Categoria
WHERE categorias.ID_Categoria IS NULL;


#  UNION e UNION ALL — 

# 1. Una nomes de clientes e nomes de produtos em uma coluna Descricao, acrescentando uma coluna Tipo para indicar a origem.
SELECT clientes.Nome AS Descricao, 'Cliente' AS Tipo
FROM clientes

UNION

SELECT produtos.Nome_Produto AS Descricao, 'Produto' AS Tipo
FROM produtos;


# 2. Una nomes de lojas e categorias com a origem
SELECT lojas.Loja AS Descricao, 'Loja' AS Tipo
FROM lojas

UNION

SELECT categorias.Categoria AS Descricao, 'Categoria' AS Tipo
FROM categorias;


# 3. Una marcas e estados civis, removendo duplicatas
SELECT produtos.Marca_Produto AS Descricao
FROM produtos

UNION

SELECT clientes.Estado_Civil AS Descricao
FROM clientes;


# 4. Repita a questão anterior com UNION ALL
SELECT produtos.Marca_Produto AS Descricao
FROM produtos

UNION ALL

SELECT clientes.Estado_Civil AS Descricao
FROM clientes;


# 5. Una produtos abaixo de R$ 500 e acima de R$ 2.000
SELECT
    produtos.Nome_Produto,
    produtos.Preco_Unit,
    'Abaixo de R$ 500' AS Faixa_Preco
FROM produtos
WHERE produtos.Preco_Unit < 500

UNION

SELECT
    produtos.Nome_Produto,
    produtos.Preco_Unit,
    'Acima de R$ 2.000' AS Faixa_Preco
FROM produtos
WHERE produtos.Preco_Unit > 2000;


# 6. Una pedidos da loja 1 e da loja 2
SELECT pedidos.ID_Pedido, pedidos.ID_Loja, pedidos.Receita_Venda
FROM pedidos
WHERE pedidos.ID_Loja = 1

UNION

SELECT pedidos.ID_Pedido, pedidos.ID_Loja, pedidos.Receita_Venda
FROM pedidos
WHERE pedidos.ID_Loja = 2;


# 7. Repita a questão 6 com UNION ALL
SELECT pedidos.ID_Pedido, pedidos.ID_Loja, pedidos.Receita_Venda
FROM pedidos
WHERE pedidos.ID_Loja = 1

UNION ALL

SELECT pedidos.ID_Pedido, pedidos.ID_Loja, pedidos.Receita_Venda
FROM pedidos
WHERE pedidos.ID_Loja = 2;


# 8. Una clientes com renda abaixo de R$ 50.000 e acima de R$ 80.000
SELECT
    clientes.ID_Cliente,
    clientes.Nome,
    clientes.Renda_Anual,
    'Abaixo de R$ 50.000' AS Faixa_Renda
FROM clientes
WHERE clientes.Renda_Anual < 50000

UNION

SELECT
    clientes.ID_Cliente,
    clientes.Nome,
    clientes.Renda_Anual,
    'Acima de R$ 80.000' AS Faixa_Renda
FROM clientes
WHERE clientes.Renda_Anual > 80000;