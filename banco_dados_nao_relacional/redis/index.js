const { promisify } = require('util');
const redis = require('redis');
const client = redis.createClient();

console.log('Estabelecendo conexão com Redis...');
client.on('error', function(error) {
    console.error(error);
    console.log('Ocorreu erro ao estabelecer conexão com o Redis, encerrando o client...');
    client.end(true);
});

client.on('end', function(error) {
    console.log('Client encerrado com sucesso!')
});

client.on('connect', function() {
    console.log('Conexão com Redis estabelecida com sucesso!');

    let codigos = montarCodigosJogadores();

    limparDados(codigos);

    popularConjuntoDeNumeros();

    popularJogadores(codigos);

    popularCartelas(codigos);
});

function limparDados(codigos) {
    console.log('Limpandos Dados...');
    client.del('numeros');

    for(let i = 0; i < codigos.length; i++) {
        let codigo = codigos[i];
        client.del('user:' + codigo);
        client.del('cartela:' + codigo);
        client.del('score:' + codigo);
    }
}

function montarCodigosJogadores() {
    let jogadores = [];
    for(var i = 1; i <= 50; i++) {
        jogadores.push(i.toString().padStart(2, '0'));
    }
    return jogadores;
}

function popularConjuntoDeNumeros() {
    console.log('Populando Números...');
    for(let i = 1; i <= 99; i++) {
        client.sadd('numeros', i);
    }
}

function popularJogadores(codigos) {
    console.log('Populando Jogadores...');
    for(let i = 0; i < codigos.length; i++) {
        let codigo = codigos[i];
        let jogadorKey = 'user:' + codigo;
        let nome = 'user' + codigo;
        let cartelaKey = 'cartela:' + codigo;
        let scoreKey = 'score:' + codigo;
        client.hmset(jogadorKey, 'name', nome, 'bcartela', cartelaKey, 'bscore', scoreKey);
    }
}

function popularCartelas(codigos) {
    console.log('Populando Cartelas...');
    for(let i = 0; i < codigos.length; i++) {
        let codigo = codigos[i];
        let cartelaKey = 'cartela:' + codigo;
        client.srandmember('numeros', 90, function(err, reply) {
            for(let i = 0; i < 15; i++) {
                client.sadd(cartelaKey, reply[i]);
            }
        });
    }
}

function geraNumerosAleatorios(qtd) {
    return promisify(client.srandmember('numeros', qtd)).bind(client);
}
