#1
SELECT 
	COUNT(*)ESCOLARIDADE
FROM clientes;


#2
SELECT 
	AVG(Renda_Anual),
    MIN(Renda_Anual),
    MAX(Renda_Anual)
FROM clientes;


#3
SELECT 
	AVG(Qtd_Filhos),
    MAX(Qtd_Filhos)
FROM clientes;


#4
SELECT 
	COUNT(*) AS "Qtd. Total",
    AVG(Preco_Unit)
FROM produtos;


#5
SELECT
	COUNT(*)ID_Pedido,
    COUNT(*)Qtd_vendida
FROM pedidos;


#6
SELECT 
	SUM(Receita_Venda),
    SUM(Custo_Venda),
	AVG(Receita_Venda),
	MIN(Receita_Venda),
    MAX(Receita_Venda)
 FROM pedidos;
 
 
 #7
SELECT 
Estado_Civil,
COUNT(*) AS "Qtd. Casados e Solteiros"
from clientes
group by  Estado_Civil;


#8
SELECT
	AVG(Renda_Anual),
    SUM(Renda_Anual) AS "Renda Anual Média"
FROM clientes
GROUP BY Escolaridade; 


#9
SELECT
	Estado_Civil,
    COUNT(Nome),
    AVG(Qtd_filhos)
FROM clientes
GROUP BY Estado_Civil; 


#10
SELECT
	COUNT(*)
FROM produtos
GROUP BY ID_Categoria;


#11
SELECT 
	COUNT(*),
	AVG(Preco_Unit),
    MIN(Preco_Unit),
    MAX(Preco_Unit)
FROM produtos
GROUP BY Preco_Unit;


#12
SELECT
	ID_Loja,
	COUNT(*) AS "Quantidade de Pedidos"
FROM pedidos
GROUP BY ID_Loja;


#13
SELECT
    ID_Loja,
    SUM(Receita_Venda) AS Faturamento_Total
FROM pedidos
GROUP BY ID_Loja
ORDER BY  Faturamento_Total ASC;

#14
SELECT 
	ID_Loja,
    SUM(Receita_Venda),
    SUM(custo_venda)
FROM pedidos
GROUP BY ID_Loja
ORDER BY ID_Loja;


#15
SELECT
    ID_Loja,
    AVG(Receita_Venda) AS Ticket_Medio
FROM pedidos
GROUP BY ID_Loja;


#16
SELECT
    ID_Loja,
    COUNT(DISTINCT ID_Cliente) AS Clientes_Atendidos
FROM pedidos
GROUP BY ID_Loja;


#17

