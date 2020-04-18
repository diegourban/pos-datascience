from argparse import ArgumentParser
import redis

def parse_args():
    ap = ArgumentParser()

    ap.add_argument(
        '--n-jogadores',
        type=int,
        required=False,
        default=50,
        help='Quantidade de jogadores do Redinsgo.'
    )

    return ap.parse_args()

def montar_codigos_jogadores(n):
    return [str(i).rjust(2, '0') for i in range(n)]

def preparar_dados(r, codigos_jogadores):
    print('Preparando dados...')
    limpar_dados(r, codigos_jogadores)
    popular_conjunto_numeros(r)
    popular_jogadores(r, codigos_jogadores)
    popular_cartelas(r, codigos_jogadores)
    popular_scores(r, codigos_jogadores)

def limpar_dados(r, codigos_jogadores):
    r.delete('numeros')
    for codigo in codigos_jogadores:
        r.delete('user:' + codigo)
        r.delete('cartela:' + codigo)
        r.delete('score:' + codigo)

def popular_conjunto_numeros(r):
    for i in range(1, 100):
        r.sadd('numeros', i)

def popular_jogadores(r, codigos_jogadores):
    for codigo_jogador in codigos_jogadores:
        chave_jogador = 'user:' + codigo_jogador
        nome = 'user' + codigo_jogador
        chave_cartela = 'cartela:' + codigo_jogador
        chave_score = 'score:' + codigo_jogador
        r.hmset(chave_jogador, {'name': nome, 'bcartela': chave_cartela, 'bscore': chave_score})

def popular_cartelas(r, codigos_jogadores):
    for codigo_jogador in codigos_jogadores:
        chave_cartela = 'cartela:' + codigo_jogador
        quantidade_numeros = len(r.smembers(chave_cartela))
        while quantidade_numeros < 15:
            numero_aleatorio = r.srandmember('numeros')
            if r.sismember(chave_cartela, numero_aleatorio):
                numero_aleatorio = r.srandmember('numeros')
            else:
                r.sadd(chave_cartela, numero_aleatorio)
                quantidade_numeros = len(r.smembers(chave_cartela))

def popular_scores(r, codigos_jogadores):
    for codigo_jogador in codigos_jogadores:
        r.set('score:' + codigo_jogador, 0)

def main(args):
    print('Bem vindo ao Redinsgo, o bingo que mais te da sorte!')
    r = redis.Redis(host='localhost', port=6379, db=0)

    codigos_jogadores = montar_codigos_jogadores(args.n_jogadores)
    
    preparar_dados(r, codigos_jogadores)

    ha_vencedor = False
    codigo_vencedor = None
    
    numeros_sorteados = set()

    while not ha_vencedor:
        numero = int(input('Informe um número entre 1 e 99 ou 0 para sair:'))
        if(numero == 0):    
            break

        if(numero in numeros_sorteados):
            print('Número {} já foi sorteado! Escolha outro...'.format(numero))
            continue

        numeros_sorteados.add(numero)

        for codigo_jogador in codigos_jogadores:
            if(r.sismember('cartela:' + codigo_jogador, numero)):
                r.incr('score:' + codigo_jogador, 1)
                if(int(r.get('score:' + codigo_jogador)) == 15):
                    ha_vencedor = True
                    codigo_vencedor = codigo_jogador
    
    if ha_vencedor:
        nome_vencedor = str(r.hget('user:' + codigo_vencedor, 'name'))
        cartela_vencedor = r.smembers('cartela:' + codigo_vencedor)
        print('Usuário "{}" venceu essa partida!'.format(nome_vencedor))
        print('Cartela do Vencedor = {}'.format(cartela_vencedor))
        print('Número Sorteados = {}'.format(numeros_sorteados))
            
    print('Saindo do Redinsgo...')

if __name__ == '__main__':
    main(parse_args())