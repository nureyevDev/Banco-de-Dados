#1ª
SELECT
	ID_Produto as "Identificador dos Produtos",
    Preco_Unit as "Preço unitário",
    ID_Categoria as "Categoria dos Produtos"
FROM produtos;


#2ª
SELECT Nome 
FROM clientes  
ORDER BY Nome asc
LIMIT 5;

#3ª
SELECT Loja, Endereco
FROM lojas
ORDER BY Num_Funcionarios 
LIMIT 3;


#4ª
SELECT nome_produto, preco_unit
FROM produtos
ORDER BY Nome_produto, Preco_Unit desc
LIMIT 5;


#5ª
SELECT Nome, 
	Sobrenome, 
	Qtd_Filhos as "Quantidade de Filhos"
FROM clientes;


#6ª
SELECT Nome_Produto, Preco_Unit
FROM produtos
WHERE Preco_Unit >= 1800;


#7ª
SELECT Nome_Produto, Preco_Unit
FROM produtos
WHERE Preco_Unit = 3100;


#8ª
SELECT Nome_Produto, Marca_Produto
FROM produtos
WHERE Marca_Produto = "DELL";