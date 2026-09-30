# Banco de Dados

Repositório criado para armazenar atividades, exercícios e consultas desenvolvidas durante os estudos de **Banco de Dados**, **SQL** e **MySQL**.

## Sobre o projeto

Este repositório reúne exercícios práticos de manipulação e consulta de dados. O objetivo é registrar a evolução dos estudos e praticar comandos essenciais da linguagem SQL.

Entre os assuntos praticados estão:

- Criação e seleção de bancos de dados;
- Consultas com `SELECT`;
- Filtros com `WHERE`;
- Pesquisa de padrões com `LIKE`;
- Operadores como `BETWEEN`, `AND`, `OR` e `NOT`;
- Ordenação de resultados com `ORDER BY`;
- Funções de data, como `DAY()` e `YEAR()`;
- Inserção, atualização e exclusão de registros;
- Organização e resolução de atividades SQL.

## Tecnologias utilizadas

- SQL
- MySQL
- MySQL Workbench
- Git
- GitHub

## Estrutura do repositório

```text
Banco-de-Dados/
├── Atividade 18 Questoes.sql
├── Atividades SQL.sql
└── README.md
```

### Arquivos

- **Atividade 18 Questoes.sql:** resolução de uma atividade composta por questões práticas de SQL.
- **Atividades SQL.sql:** conjunto de consultas e exercícios realizados durante os estudos.

## Exemplos de consultas

### Consultar registros usando `LIKE`

```sql
SELECT *
FROM produtos
WHERE nome_produto LIKE '%Monitor%';
```

### Consultar pedidos realizados no dia 16 durante o ano de 2019

```sql
SELECT *
FROM pedidos
WHERE DAY(data_pedido) = 16
  AND YEAR(data_pedido) = 2019;
```

### Filtrar e ordenar produtos por preço

```sql
SELECT nome_produto, marca_produto, preco_unit
FROM produtos
WHERE nome_produto LIKE '%Monitor%'
  AND preco_unit BETWEEN 400 AND 3000
ORDER BY preco_unit ASC;
```

> Os nomes das tabelas e colunas podem variar de acordo com a base de dados utilizada em cada atividade.

## Como utilizar

1. Clone este repositório:

```bash
git clone https://github.com/nureyevDev/Banco-de-Dados.git
```

2. Acesse a pasta do projeto:

```bash
cd Banco-de-Dados
```

3. Abra os arquivos `.sql` no MySQL Workbench ou em outro gerenciador compatível.

4. Selecione a consulta desejada e execute-a na base de dados correspondente.

## Objetivo

Praticar os fundamentos de bancos de dados relacionais e desenvolver segurança na criação de consultas SQL para seleção, filtragem, organização e manipulação de dados.

## Próximas melhorias

- [ ] Adicionar novos exercícios de SQL;
- [ ] Organizar as atividades por assunto;
- [ ] Incluir exemplos de `JOIN`;
- [ ] Adicionar consultas com funções de agregação;
- [ ] Praticar subconsultas, views e procedures;
- [ ] Documentar a estrutura das bases utilizadas.

## Autor

**Nureyev Santos**

- GitHub: [@nureyevDev](https://github.com/nureyevDev)
- Portfólio: [nureyevdev.github.io](https://nureyevdev.github.io/)

---

Se este repositório for útil para seus estudos, fique à vontade para deixar uma estrela.
