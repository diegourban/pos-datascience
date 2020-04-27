# Neo4j
FURB - Pós Data Science - Banco de Dados não Relacional - Neo4j

## Configurações

Subindo container do Neo4j: `docker run --name neo4j-furb --publish=7474:7474 --publish=7687:7687 --volume=$HOME/neo4j/data:/data --env=NEO4J_AUTH=none neo4j:4.0`.

Acessar o Neo4j via browser: `http://localhost:7474`.

Na tela inicial do Neo4j, selecionar a opção "No authentication" e clicar em Connect.

No editor, executar o comando `:play movie-graph`, navegar para a seguinda página e executar o comando CREATE para criar o modelo de dados.

## Exercício 1 - Retrieving Nodes

### 1. Retrieve all nodes from the database.
`MATCH (n) RETURN n`

### 2. Examine the data model for the graph.
`CALL db.schema.visualization()`

### 3. Retrieve all Person nodes.
`MATCH (p:Person) RETURN p`

### 4. Retrieve all Movie nodes.
`MATCH (m:Movie) RETURN m`

### Evidência
![Comandos Exercício 1](print_comandos_exercicio_1.png)

## Exercício 2 - Filtering queries using property values

### 1. Retrieve all movies that were released in a specific year.
`MATCH (m:Movie {released: 2006}) RETURN m`

### 2. View the retrieved results as a table.
No painel de resultados, clicar no icone de tabela.

### 3. Query the database for all property keys.
`CALL db.propertyKeys`

### 4. Retrieve all Movies released in a specific year, returning their titles.
`MATCH (m:Movie {released: 2003}) RETURN m.title`

### 5. Display title, released, and tagline values for every Movie node in the graph.
`MATCH (m:Movie) RETURN m.title, m.released, m.tagline`

### 6. Display more user-friendly headers in the table.
```
MATCH (m:Movie) RETURN m.title AS `Title`, m.released AS `Released`, m.tagline AS `TagLine`
```

### Evidência
![Comandos Exercício 2](print_comandos_exercicio_2.png)