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
Informações do modelo de dados:
- 171 Nodes;
- 253 Relationships;
- 2 Labels: Movie e Person;
- 6 Tipos de Relationships: ACTED_IN, DIRECTED, FOLLOWS, PRODUCED, REVIEWED e WROTE;
- 14 Properties: born, from, hobby, klout, learn, name, pet, rating, released, roles, since, summary, tagline e title.

### 3. Retrieve all Person nodes.
`MATCH (p:Person) RETURN p`

### 4. Retrieve all Movie nodes.
`MATCH (m:Movie) RETURN m`

### Evidência
![Comandos Exercício 1](print_comandos_exercicio_1.png)

## Exercício 2 - Filtering queries using property values