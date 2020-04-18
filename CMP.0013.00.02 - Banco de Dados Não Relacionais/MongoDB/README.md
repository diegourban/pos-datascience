# MongoDB
FURB - Pós Data Science - Banco de Dados não Relacional - MongoDB

## Configurações

Subindo container do mongo: `docker run --name mongodb-furb --publish 27017:27017 -d mongo:4.2.5-bionic`.

Acessar o bash do container: `docker exec -it mongodb-furb bash`.

Conectar no mongo com `mongo`.

## Exercício 1 - Aquecendo com os pets

`use petshop` para criar o database.

Pré inserir os dados:
```
db.pets.insert({name:"Mike", species: "Hamster"})
db.pets.insert({name:"Dolly", species: "Peixe"})
db.pets.insert({name:"Kilha", species: "Gato"})
db.pets.insert({name:"Mike", species: "Cachorro"})
db.pets.insert({name:"Sally", species: "Cachorro"})
db.pets.insert({name:"Chuck", species: "Gato"})
```

### 1. Adicione outro Peixe e um Hamster com nome Frodo
`db.pets.insert([{name:"Frodo", species: "Peixe"}, {name:"Frodo", species: "Hamster"}])`

### 2. Faça uma contagem dos pets na coleção
`db.pets.find().count()`

### 3. Retorne apenas um elemento o método prático possível
`db.pets.findOne()`

### 4. Identifique o ID para o Gato Kilha.
`db.pets.find({"name": "Kilha", "species": "Gato"},{"_id": 1})`

### 5. Faça uma busca pelo ID e traga o Hamster Mike
`db.pets.find({"_id": ObjectId("5e9b40118cb2614fe0fa9443")})`

### 6. Use o find para trazer todos os Hamsters
`db.pets.find({"species": "Hamster"})`

### 7. Use o find para listar todos os pets com nome Mike
`db.pets.find({"name": "Mike"})`

### 8. Liste apenas o documento que é um Cachorro chamado Mike
`db.pets.find({"name": "Mike", "species": "Cachorro"})`

### Evidência
![Comandos Exercício 1](print_comandos_exercicio_1.png)

## Exercício 2

## Exercício 3