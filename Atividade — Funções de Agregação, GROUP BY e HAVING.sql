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