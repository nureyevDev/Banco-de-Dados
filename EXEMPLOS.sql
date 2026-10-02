SELECT P.ID_Pedido, PR.Nome_Produto
FROM pedidos P
LEFT JOIN produtos PR ON P.ID_Produto = PR.ID_Produto;