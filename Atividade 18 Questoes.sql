#1
SELECT Nome_produto as "Produto",
 Preco_unit as "Preço",
 ID_Categoria as "IDCategoria"
FROM produtos;


#2
SELECT Nome, Sobrenome
FROM clientes
ORDER BY Nome, Sobrenome ASC;


#3 
SELECT loja, endereco, Num_Funcionarios  
FROM lojas
ORDER BY Num_Funcionarios DESC
LIMIT 3;

#4
SELECT Nome_Produto, Preco_Unit
FROM produtos
ORDER BY Preco_Unit ASC
LIMIT 5;


#5
SELECT Nome, 
Sobrenome,
Qtd_Filhos AS "Número de filhos"
FROM clientes;


#6
SELECT Nome_Produto, Preco_Unit
FROM produtos
WHERE Preco_Unit >= 1800;


#7
SELECT Nome_Produto, Marca_Produto, Preco_Unit
FROM produtos
WHERE Preco_Unit = 3100;


#8 
SELECT Nome_Produto, Marca_Produto, Preco_Unit
FROM produtos
WHERE Marca_Produto = "DELL";


#9
SELECT Nome_Produto, Preco_Unit
FROM produtos
WHERE Preco_Unit <= 800;


#10
SELECT Nome, Sobrenome, Renda_Anual
FROM clientes
WHERE Renda_Anual >= 80000
ORDER BY Renda_Anual DESC;


#11
SELECT loja, Gerente, Num_Funcionarios
FROM lojas
WHERE Num_Funcionarios < 20;


#12
SELECT Nome_Produto, Marca_Produto, Preco_Unit
FROM produtos
WHERE Preco_Unit <> 3100;


#13
SELECT Nome, Sobrenome, Qtd_Filhos
FROM clientes
WHERE Qtd_Filhos = 0;


#14
SELECT loja, Num_Funcionarios
FROM lojas
WHERE Num_Funcionarios >= 20
ORDER BY Num_Funcionarios ASC;


#15
SELECT Nome_Produto, Marca_Produto
FROM produtos
WHERE Marca_Produto IN ("DELL", "SAMSUNG", "SONY");


#16
SELECT Nome, Sobrenome, Renda_Anual
FROM clientes
WHERE Renda_Anual BETWEEN 60000 AND 100000;


#17
SELECT Nome_Produto, Marca_Produto, Preco_Unit
FROM produtos
WHERE Preco_Unit BETWEEN 600 AND 1800
ORDER BY Preco_Unit DESC;


#18
SELECT Nome_Produto, Marca_Produto, Preco_Unit
FROM produtos
WHERE Marca_Produto IN ("DELL", "SAMSUNG")
ORDER BY Nome_Produto ASC;


#19
SELECT Nome, Sobrenome, Qtd_Filhos
FROM clientes 
WHERE Qtd_Filhos BETWEEN 1 AND 3;

#20
SELECT *
FROM pedidos
WHERE Data_Venda BETWEEN "2019-01-22" AND "2019-08-30";


#21
SELECT Nome_Produto, Marca_Produto, Preco_Unit
FROM produtos
WHERE Nome_produto LIKE '%Notebook%';


#22
SELECT Nome_Produto, Marca_Produto, Preco_Unit
FROM produtos
WHERE Nome_produto LIKE "Microfone%";


#23
SELECT Nome, Sobrenome
FROM clientes
WHERE Nome LIKE "A%";


#24
SELECT Nome, Sobrenome
FROM clientes
WHERE Sobrenome LIKE "%a";


#25
SELECT Nome, Sobrenome, Email
FROM clientes
WHERE Email LIKE "%Gmail%";


#26
SELECT Nome, Sobrenome, Telefone
FROM clientes
WHERE Telefone LIKE "%(11)%";


#27
SELECT Loja, Endereco
FROM lojas
WHERE Endereco LIKE "Av%";


#28
SELECT Nome_Produto, Num_Serie
FROM produtos
WHERE Num_Serie LIKE "Mic%11";


#29
SELECT Nome_Produto, Marca_Produto, Preco_Unit
FROM produtos
WHERE Nome_produto LIKE "%i5%";


#30
SELECT ID_Pedido, Data_Venda
FROM pedidos
WHERE Data_Venda LIKE "%2019-05%";


#31
SELECT ID_Pedido, Data_Venda
FROM pedidos
WHERE Data_Venda LIKE "2019-__-16";


#32
SELECT Nome_Produto AS "Produto",
 Marca_Produto,
 Preco_Unit AS "Preço"
FROM produtos
WHERE Marca_Produto LIKE "DELL" AND Preco_Unit >= 1000
ORDER BY Preco_Unit DESC
LIMIT 3;


#DESAFIO 1
SELECT Nome_Produto, Marca_Produto, Preco_Unit
FROM produtos
WHERE Nome_Produto LIKE "%Monitor%" AND Preco_Unit  BETWEEN 400 AND 3000 
ORDER BY Preco_Unit ASC;


