USE banco_v2_integridade;

SELECT COUNT(*) AS clientes
FROM clientes;

SELECT COUNT(*) AS produtos
FROM produtos;

SELECT COUNT(*) AS lojas
FROM lojas;

SELECT COUNT(*) AS pedidos
FROM pedidos;

SELECT
    MIN(ID_Pedido) AS primeiro_pedido,
    MAX(ID_Pedido) AS ultimo_pedido,
    SUM(Receita_Venda) AS receita_original
FROM pedidos;

# Verificação de IDs duplicados
# Categorias
SELECT ID_Categoria, COUNT(*) AS quantidade
FROM categorias
GROUP BY ID_Categoria
HAVING COUNT(*) > 1; 

# Clientes
SELECT ID_Cliente, COUNT(*) AS quantidade
FROM clientes
GROUP BY ID_Cliente
HAVING COUNT(*) > 1;

# Produtos
SELECT ID_Produto, COUNT(*) AS quantidade
FROM produtos
GROUP BY ID_Produto
HAVING COUNT(*) > 1;

# Lojas
SELECT ID_Loja, COUNT(*) AS quantidade
FROM lojas
GROUP BY ID_Loja
HAVING COUNT(*) > 1;

# Pedidos
SELECT ID_Pedido, COUNT(*) AS quantidade
FROM pedidos
GROUP BY ID_Pedido
HAVING COUNT(*) > 1;

# Vendedores
SELECT ID_Vendedor, COUNT(*) AS quantidade
FROM vendedores 
GROUP BY ID_Vendedor 
HAVING COUNT(*) > 1;


# 2. Existem pedidos apontando para cliente, produto ou loja inexistente?

# cliente
SELECT pedidos.ID_Pedido, pedidos.ID_Cliente
FROM pedidos
LEFT JOIN clientes
    ON clientes.ID_Cliente = pedidos.ID_Cliente
WHERE clientes.ID_Cliente IS NULL;

# produto

SELECT pedidos.ID_Pedido, pedidos.ID_Produto
FROM pedidos
LEFT JOIN produtos
    ON produtos.ID_Produto = pedidos.ID_Produto
WHERE produtos.ID_Produto IS NULL;

# loja

SELECT pedidos.ID_Pedido, pedidos.ID_Loja
FROM pedidos
LEFT JOIN lojas
    ON lojas.ID_Loja = pedidos.ID_Loja
WHERE lojas.ID_Loja IS NULL;


# 3. Existem produtos apontando para categoria inexistente?

SELECT produtos.ID_Produto, produtos.ID_Categoria
FROM produtos
LEFT JOIN categorias
    ON categorias.ID_Categoria = produtos.ID_Categoria
WHERE categorias.ID_Categoria IS NULL;

# 4. Há valores NULL em relações que deveriam ser obrigatórias?

SELECT *
FROM pedidos
WHERE ID_Cliente IS NULL
   OR ID_Produto IS NULL
   OR ID_Loja IS NULL;

# Produtos sem categoria:
SELECT *
FROM produtos
WHERE ID_Categoria IS NULL;

# Categorias sem nome:
SELECT *
FROM categorias
WHERE Categoria IS NULL;

# Campos principais de clientes:

SELECT *
FROM clientes
WHERE Nome IS NULL
   OR Sobrenome IS NULL;

# 5. As datas armazenadas como texto podem ser convertidas com segurança?

SELECT Data_Venda
FROM pedidos
WHERE Data_Venda IS NULL
   OR STR_TO_DATE(Data_Venda, '%Y-%m-%d') IS NULL;


# 6. Há valores negativos que seriam rejeitados pelas novas regras?
# Fiz a consulta ultilizando as colunas com valores inteiros, pois só eles haveriam possibilidade de ter valores negativos!

# produtos
SELECT *
FROM produtos
WHERE Preco_Unit < 0
   OR Custo_Unit < 0;

# pedidos
SELECT *
FROM pedidos
WHERE Qtd_Vendida < 0
   OR Receita_Venda < 0
   OR Custo_Venda < 0
   OR Custo_Unit < 0
   OR Preco_Unit < 0;

# clientes
SELECT *
FROM clientes
WHERE Renda_Anual < 0
   OR Qtd_Filhos < 0;

# lojas
SELECT *
FROM lojas
WHERE Num_Funcionarios < 0;


# lojas.Loja e locais.Cidade representam uma coincidência textual ou uma relação formal no esquema?
# R: Ainda não existe relacionamento formal!

SELECT
    lojas.ID_Loja,
    lojas.Loja,
    locais.Cidade,
    locais.Estado
FROM lojas
LEFT JOIN locais
    ON lojas.Loja = locais.Cidade;



# Corrigir tipos físicos e obrigatoriedade

USE banco_v2_integridade;

# categorias
ALTER TABLE categorias
    MODIFY ID_Categoria INT NOT NULL,
    MODIFY Categoria VARCHAR(80) NOT NULL;

# clientes
ALTER TABLE clientes
    MODIFY ID_Cliente INT NOT NULL,
    MODIFY Nome VARCHAR(80) NOT NULL,
    MODIFY Sobrenome VARCHAR(100) NOT NULL,
    MODIFY Data_Nascimento DATE,
    MODIFY Estado_Civil VARCHAR(30),
    MODIFY Sexo VARCHAR(20),
    MODIFY Email VARCHAR(150),
    MODIFY Telefone VARCHAR(20),
    MODIFY Renda_Anual DECIMAL(12,2),
    MODIFY Qtd_Filhos INT DEFAULT 0,
    MODIFY Escolaridade VARCHAR(80);

# locais
ALTER TABLE locais
    MODIFY Cidade VARCHAR(100) NOT NULL,
    MODIFY Estado CHAR(2) NOT NULL,
    MODIFY `Região` VARCHAR(30) NOT NULL;

# lojas
ALTER TABLE lojas
    MODIFY ID_Loja INT NOT NULL,
    MODIFY Loja VARCHAR(80) NOT NULL,
    MODIFY Gerente VARCHAR(100),
    MODIFY Endereco VARCHAR(200),
    MODIFY Num_Funcionarios INT,
    MODIFY Telefone VARCHAR(20);

# produtos
ALTER TABLE produtos
    MODIFY ID_Produto INT NOT NULL,
    MODIFY Nome_Produto VARCHAR(180) NOT NULL,
    MODIFY ID_Categoria INT NOT NULL,
    MODIFY Marca_Produto VARCHAR(80) NOT NULL,
    MODIFY Num_Serie VARCHAR(100),
    MODIFY Preco_Unit DECIMAL(10,2) NOT NULL,
    MODIFY Custo_Unit DECIMAL(10,2);

# pedidos
ALTER TABLE pedidos
    MODIFY ID_Pedido INT NOT NULL,
    MODIFY Data_Venda DATE NOT NULL,
    MODIFY ID_Loja INT NOT NULL,
    MODIFY ID_Produto INT NOT NULL,
    MODIFY ID_Cliente INT NOT NULL,
    MODIFY Qtd_Vendida INT NOT NULL,
    MODIFY Receita_Venda DECIMAL(12,2) NOT NULL,
    MODIFY Custo_Venda DECIMAL(12,2),
    MODIFY Custo_Unit DECIMAL(10,2),
    MODIFY Preco_Unit DECIMAL(10,2) NOT NULL;



# Criar PKs, constraints e integridade referencial

SHOW CREATE TABLE categorias;
SHOW CREATE TABLE clientes;
SHOW CREATE TABLE locais;
SHOW CREATE TABLE lojas;
SHOW CREATE TABLE produtos;
SHOW CREATE TABLE pedidos;
SHOW CREATE TABLE vendedores;
# Vendedores ja apareceu com uma PK criada!

# categorias
ALTER TABLE categorias
    ADD PRIMARY KEY (ID_Categoria),
    ADD CONSTRAINT uk_categorias_nome
        UNIQUE (Categoria);

# clientes
ALTER TABLE clientes
    ADD PRIMARY KEY (ID_Cliente),

    ADD CONSTRAINT uk_clientes_email
        UNIQUE (Email),

    ADD CONSTRAINT ck_clientes_qtd_filhos
        CHECK (
            Qtd_Filhos IS NULL
            OR Qtd_Filhos >= 0
        ),

    ADD CONSTRAINT ck_clientes_renda_anual
        CHECK (
            Renda_Anual IS NULL
            OR Renda_Anual >= 0
        );
    
# locais
ALTER TABLE locais
    ADD COLUMN ID_Local INT NOT NULL AUTO_INCREMENT PRIMARY KEY FIRST,

    ADD CONSTRAINT uk_locais_cidade_estado
        UNIQUE (Cidade, Estado);

# lojas
ALTER TABLE lojas
    ADD PRIMARY KEY (ID_Loja),

    ADD COLUMN ID_Local INT NULL,

    ADD CONSTRAINT ck_lojas_num_funcionarios
        CHECK (
            Num_Funcionarios IS NULL
            OR Num_Funcionarios >= 0
        );
    
UPDATE lojas
INNER JOIN locais
    ON lojas.Loja = locais.Cidade
SET lojas.ID_Local = locais.ID_Local
WHERE lojas.ID_Local IS NULL;

SELECT *
FROM lojas
WHERE ID_Local IS NULL;
# colunas nao mostram lojas que ficaram sem local

# tornei a coluna obrigatória e criei a FK:
ALTER TABLE lojas
    MODIFY ID_Local INT NOT NULL,

    ADD CONSTRAINT fk_lojas_locais
        FOREIGN KEY (ID_Local)
        REFERENCES locais(ID_Local);
 
# produtos
ALTER TABLE produtos
    ADD PRIMARY KEY (ID_Produto),

    ADD CONSTRAINT uk_produtos_num_serie
        UNIQUE (Num_Serie),

    ADD CONSTRAINT ck_produtos_preco_unit
        CHECK (Preco_Unit >= 0),

    ADD CONSTRAINT ck_produtos_custo_unit
        CHECK (
            Custo_Unit IS NULL
            OR Custo_Unit >= 0
        ),

    ADD CONSTRAINT fk_produtos_categorias
        FOREIGN KEY (ID_Categoria)
        REFERENCES categorias(ID_Categoria);
    
# pedidos
ALTER TABLE pedidos
    ADD PRIMARY KEY (ID_Pedido),

    ADD CONSTRAINT ck_pedidos_qtd_vendida
        CHECK (Qtd_Vendida > 0),

    ADD CONSTRAINT ck_pedidos_receita_venda
        CHECK (Receita_Venda >= 0),

    ADD CONSTRAINT ck_pedidos_custo_venda
        CHECK (
            Custo_Venda IS NULL
            OR Custo_Venda >= 0
        ),

    ADD CONSTRAINT ck_pedidos_custo_unit
        CHECK (
            Custo_Unit IS NULL
            OR Custo_Unit >= 0
        ),

    ADD CONSTRAINT ck_pedidos_preco_unit
        CHECK (Preco_Unit >= 0),

    ADD CONSTRAINT fk_pedidos_lojas
        FOREIGN KEY (ID_Loja)
        REFERENCES lojas(ID_Loja),

    ADD CONSTRAINT fk_pedidos_produtos
        FOREIGN KEY (ID_Produto)
        REFERENCES produtos(ID_Produto),

    ADD CONSTRAINT fk_pedidos_clientes
        FOREIGN KEY (ID_Cliente)
        REFERENCES clientes(ID_Cliente);
    
# vendedores
ALTER TABLE vendedores
    MODIFY ID_Vendedor INT NOT NULL AUTO_INCREMENT,

    ADD CONSTRAINT uk_vendedores_email
        UNIQUE (Email),

    ADD CONSTRAINT fk_vendedores_lojas
        FOREIGN KEY (ID_Loja)
        REFERENCES lojas(ID_Loja);
    
# Validar constraints e testar erros

SHOW CREATE TABLE categorias;
SHOW CREATE TABLE clientes;
SHOW CREATE TABLE locais;
SHOW CREATE TABLE lojas;
SHOW CREATE TABLE produtos;
SHOW CREATE TABLE pedidos;
SHOW CREATE TABLE vendedores;


# Testar violações de constraints

# vendedor associado a uma loja inexistente
INSERT INTO vendedores (
    Nome,
    Email,
    Data_Nascimento,
    ID_Loja
)
VALUES (
    'Teste FK',
    'teste.fk@lab.local',
    '2000-01-01',
    999999
);
# Falhou por conta da constrain fk_vendedores_lojas, o codigo 999999 nao existe


# preço negativo
SELECT ID_Produto, Nome_Produto, Preco_Unit
FROM produtos
LIMIT 1;

UPDATE produtos
SET Preco_Unit = -100
WHERE ID_Produto = 1;
# A constraint ck_produtos_preco_unit nao permitiu a alteração porque o preço de um produto nao pode ser negativo.


# A constraint ck_produtos_preco_unit rejeitou a alteração porque o preço de um produto não pode ser negativo.
UPDATE produtos
SET ID_Categoria = 999999
WHERE ID_Produto = 1;
# A chave estrangeira rejeitou a alteração porque a categoria 9999 nao existe na tabela categorias. 


# COMPARAR A V1 COM A V2
# Comparar a quantidade de clientes

SELECT
    (SELECT COUNT(*) FROM banco.clientes),
    (SELECT COUNT(*) FROM banco_v2_integridade.clientes);

# Comparar a quantidade de produtos
SELECT
    (SELECT COUNT(*) FROM banco.produtos),
    (SELECT COUNT(*) FROM banco_v2_integridade.produtos);

# Comparar a quantidade de lojas
SELECT
    (SELECT COUNT(*) FROM banco.lojas),
    (SELECT COUNT(*) FROM banco_v2_integridade.lojas);

# Comparar a quantidade de pedidos
SELECT
    (SELECT COUNT(*) FROM banco.pedidos),
    (SELECT COUNT(*) FROM banco_v2_integridade.pedidos);

# Comparar os pedidos inicial e final
SELECT
    MIN(ID_Pedido),
    MAX(ID_Pedido)
FROM banco.pedidos;

SELECT
    MIN(ID_Pedido),
    MAX(ID_Pedido)
FROM banco_v2_integridade.pedidos;

# Comparar a receita total
SELECT SUM(Receita_Venda)
FROM banco.pedidos;

SELECT SUM(Receita_Venda)
FROM banco_v2_integridade.pedidos;


# Repetir consultas da auditoria
# Verificar pedidos órfãos de cliente

SELECT pedidos.ID_Pedido, pedidos.ID_Cliente
FROM pedidos
LEFT JOIN clientes
    ON pedidos.ID_Cliente = clientes.ID_Cliente
WHERE clientes.ID_Cliente IS NULL;

# Verificar pedidos órfãos de produto
SELECT pedidos.ID_Pedido, pedidos.ID_Produto
FROM pedidos
LEFT JOIN produtos
    ON pedidos.ID_Produto = produtos.ID_Produto
WHERE produtos.ID_Produto IS NULL;

# Verificar pedidos órfãos de loja
SELECT pedidos.ID_Pedido, pedidos.ID_Loja
FROM pedidos
LEFT JOIN lojas
    ON pedidos.ID_Loja = lojas.ID_Loja
WHERE lojas.ID_Loja IS NULL;

# Verificar vendedores órfãos
SELECT
    vendedores.ID_Vendedor,
    vendedores.Nome,
    vendedores.ID_Loja
FROM vendedores
LEFT JOIN lojas
    ON vendedores.ID_Loja = lojas.ID_Loja
WHERE lojas.ID_Loja IS NULL;

# Verificar lojas sem local
SELECT
    lojas.ID_Loja,
    lojas.Loja,
    lojas.ID_Local
FROM lojas
LEFT JOIN locais
    ON lojas.ID_Local = locais.ID_Local
WHERE locais.ID_Local IS NULL;