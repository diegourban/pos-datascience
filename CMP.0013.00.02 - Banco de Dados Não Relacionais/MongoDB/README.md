# MongoDB
FURB - Pós Data Science - Banco de Dados não Relacional - MongoDB

## Configurações

Subindo container do mongo: `docker run --name mongodb-furb --publish 27017:27017 -d mongo:4-bionic`.

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

## Exercício 2 - Mama mia!

Copiando arquivo para dentro do container do mongo: `docker cp ./italian-people.js mongodb-furb:/`.

Acessar o container e importar o arquivo copiado `mongo italian-people.js`.

### 1. Liste/Conte todas as pessoas que tem exatamente 99 anos. Você pode usar um count para indicar a quantidade.
`db.italians.find( { "age": 99 } ).count()`

### 2. Identifique quantas pessoas são elegíveis atendimento prioritário (pessoas com mais de 65 anos).
`db.italians.find( { "age": { "$gt": 65 } } ).count()`

### 3. Identifique todos os jovens (pessoas entre 12 a 18 anos).
`db.italians.find( { "age": { "$gte": 12, "$lte": 18 } } ).count()`

### 4. Identifique quantas pessoas tem gatos, quantas tem cachorro e quantas não tem nenhum dos dois.
```
db.italians.find( { "cat": { $exists: true } } ).count()
db.italians.find( { "dog": { $exists: true } } ).count()
db.italians.find( { $and: [ { "dog": { $exists: false } }, { "cat": { $exists: false } } ] } ).count()
```

### 5. Liste/Conte todas as pessoas acima de 60 anos que tenham gato.
`db.italians.find( { $and: [ { "age": { $gt: 60 } }, { "cat": { $exists: true } } ] } ).count()`

### 6. Liste/Conte todos os jovens com cachorro.
`db.italians.find( { $and: [ { "age": { "$gte": 12, "$lte": 18 } }, { "dog": { $exists: true } } ] } ).count()`

### 7. Utilizando o $where, liste todas as pessoas que tem gato e cachorro.
```
db.italians.find( { $where: function() { 
    return this.cat != null && this.dog != null
} } );
```

### 8. Liste todas as pessoas mais novas que seus respectivos gatos.
```
db.italians.find( { $where: function() { 
    return this.cat != null && this.age < this.cat.age
} } );
```

### 9. Liste as pessoas que tem o mesmo nome que seu bichano (gatou ou cachorro).
```
db.italians.find( { $where: function() {
    return (this.cat != null && this.cat.name == this.name) || (this.dog != null && this.dog.name == this.name)
} } );
```

### 10. Projete apenas o nome e sobrenome das pessoas com tipo de sangue de fator RH negativo.
`db.italians.find( { "bloodType": /.*-/ }, { "surname": 1, "_id": 0 } )`

### 11. Projete apenas os animais dos italianos. Devem ser listados os animais com nome e idade. Não mostre o identificado do mongo (ObjectId).
`db.italians.find( { $or: [ { "dog": { $exists: true } }, { "cat": { $exists: true } } ] }, { "dog.name": 1, "dog.age": 1, "cat.name": 1, "cat.age": 1, "_id": 0 } )`

### 12. Quais são as 5 pessoas mais velhas com sobrenome Rossi?
`db.italians.find( { "surname": 'Rossi' }, { "username": 1, "firstname": 1, "age": 1, "_id": 0}).sort( { age: -1} ).limit(5)`

### 13. Crie um italiano que tenha um leão como animal de estimação. Associe um nome e idade ao bichano.
`db.italians.insert( { "firstname" : "Quasimodo", "surname" : "Benveniste", "username" : "user99999", "age" : 31, "email" : "Quasimodo.Benveniste@yahoo.com", "bloodType" : "B-", "id_num" : "584715943378", "registerDate" : ISODate("2012-03-25T03:13:49.779Z"), "lion" : { "name" : "Leone", "age" : 5 } } )`

### 14. Infelizmente o Leão comeu o italiano. Remova essa pessoa usando o Id.
`db.italians.remove( { "_id": ObjectId("5ea4a4140bc05dddbbe76b5c") }, true)`

### 15. Passou um ano. Atualize a idade de todos os italianos e dos bichanos em 1.
`db.italians.updateMany( { }, { $inc: { "age": 1 } } )`
`db.italians.updateMany( { "cat": { $exists: true } }, { $inc: { "cat.age": 1 } } )`
`db.italians.updateMany( { "dog": { $exists: true } }, { $inc: { "dog.age": 1 } } )`

### 16. O Corona Vírus chegou na Itália e misteriosamente atingiu pessoas somente com gatos e de 66 anos. Remova esses italianos.
`db.italians.remove( { $and: [ { "cat": { $exists: true } }, { "age": 66 } ] } )`

### 17. Utilizando o framework agregate, liste apenas as pessoas com nomes iguais a sua respectiva mãe e que tenha gato ou cachorro.
```
db.italians.aggregate([
    { $match: { "mother": { $exists: true } } },
    { $match: { $or: [ { "cat": { $exists: true } }, { "dog": { $exists: true } } ] } },
    { $project: {
        "firstname": 1,
        "mother": 1,
        "isEqual": { $cmp: [ "$firstname", "$mother.firstname" ] }
    }},
    { $match: { "isEqual": 0 } }
])
```

### 18. Utilizando aggregate framework, faça uma lista de nomes única de nomes. Faça isso usando apenas o primeiro nome.
```
db.italians.aggregate([
    { $group: { 
        "_id": "$firstname" 
    }}
])
```

### 19. Agora faça a mesma lista do item acima, considerando nome completo.
```
db.italians.aggregate([
    { $project: {
        "firstname": 1,
        "surname": 1,
        "fullname": { $concat: [ "$firstname", " ", "$surname" ] }
    }},
    { $group: { 
        "_id": "$fullname" 
    }}
])
```

### 20. Procure pessoas que gosta de Banana ou Maçã, tenham cachorro ou gato, mais de 20 e menos de 60 anos.
```
db.italians.aggregate([
    { $match: { $and: [ { "age": { $gt: 20 } }, { "age": { $lt: 60 } } ] } },
    { $match: { $or: [ { "cat": { $exists: true } }, { "dog": { $exists: true } } ] } },
    { $project: {
        "favFruits": 1,
        "likesBanana" : {
            $in: [ "Banana", "$favFruits" ]
        },
        "likesApple" : {
            $in: [ "Maçã", "$favFruits" ]
        }
    }},
    { $match: { $or: [ { "likesBanana": true }, { "likesApple": true } ] } }
])
```

### Evidência
![Comandos Exercício 2](print_comandos_exercicio_2.png)

## Exercício 3 - Stockbrokers

Copiando arquivo para dentro do container do mongo: `docker cp ./stocks.js mongodb-furb:/`.

Acessar o container e importar o arquivo copiado `mongoimport --db stocks --collection stocks --file stocks.json`.

### 1. Liste as ações com profit acima de 0.5 (limite a 10 o resultado).
`db.stocks.find( { "Profit Margin": { $gt: 0.5 } }, { "Ticker": 1, "Profit Margin": 1, "_id": 0} ).limit(10)`

### 2. Liste as ações com perdas (limite a 10 novamente).
`db.stocks.find( { "Profit Margin": { $lt: 0 } }, { "Ticker": 1, "Profit Margin": 1, "_id": 0} ).limit(10)`

### 3. Liste as 10 ações mais rentáveis.
`db.stocks.find( { }, { "Ticker": 1, "Profit Margin": 1, "_id": 0} ).sort( { "Profit Margin": -1} ).limit(10)`

### 4. Qual foi o setor mais rentável?
```
db.stocks.aggregate([
    { $group: { _id: "$Sector", "Sector Profit": { $sum: "$Profit Margin" } } },
    { $sort: { "Sector Profit": -1 } },
    { $limit: 1}
])
```

### 5. Ordene as ações pelo profit e usando um cursor, liste as ações.
```
var cursor = db.stocks.find( { "Profit Margin": { $exists: true}}).sort( { "Profit Margin": -1} )
cursor.forEach(function(x) {
    print(x.Ticker);
});
```

### 6. Renomeie o campo “Profit Margin” para apenas “profit”.
`db.stocks.update( { }, { $rename: { "Profit Margin": "profit" } }, { multi: true } )`

### 7. Agora liste apenas a empresa e seu respectivo resultado.
```
var cursor = db.stocks.find( { "profit": { $exists: true} } ).sort( { "Profit Margin": -1} )
cursor.forEach(function(x) {
    print(x.Company + " = " + x.profit);
});
```

### 8. Analise as ações. É uma bola de cristal na sua mão... Quais as três ações você investiria?
```
db.stocks.aggregate([
    { $match: { "Relative Strength Index (14)": { $lt: 30 } } },
    { $match: { "EPS growth past 5 years": { $gt: 0 } } },
    { $sort: { "Total Debt/Equity": 1, "Dividend Yield": -1, "EPS growth past 5 years": -1 } },
    { $limit: 3 },
    { $project: {
        "Ticker": 1,
        "Company": 1,
        "Relative Strength Index (14)": 1,
        "Total Debt/Equity": 1,
        "Dividend Yield": 1,
        "EPS growth past 5 years": 1
    }}
])
```

### 9. Liste as ações agrupadas por setor.
```
db.stocks.aggregate([
    { $group: { _id: "$Sector", "tickers": { $push: "$Ticker" } } },
    { $sort: { "Sector": -1 } }
])
```

### Evidência
![Comandos Exercício 3](print_comandos_exercicio_3.png)

## Exercício 4 - raude na Enron!