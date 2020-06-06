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

    ap.add_argument(
        '--modo-auto',
        type=bool,
        required=False,
        default=False,
        help='Habilita o modo de sorteio automático.'
    )

    return ap.parse_args()

def montar_codigos_jogadores(n):
    return [str(i).rjust(2, '0') for i in range(n)]

def preparar_dados(r, codigos_jogadores):
    print('Preparando dados...')

    gerar_conjunto_numeros_sorteaveis(r)

    for codigo_jogador in codigos_jogadores:
        gerar_dados_jogador(r, codigo_jogador)

def gerar_conjunto_numeros_sorteaveis(r):
    r.delete('numeros')
    for i in range(1, 100):
        r.sadd('numeros', i)

def gerar_dados_jogador(r, codigo_jogador):
    chave_jogador = 'jogador:' + codigo_jogador
    chave_cartela = 'cartela:' + codigo_jogador
    chave_pontuacao = 'pontuacao:' + codigo_jogador

    r.delete(chave_jogador)
    r.delete(chave_cartela)
    r.delete(chave_pontuacao)

    nome = 'jogador' + codigo_jogador
    r.hmset(chave_jogador, {'nome': nome, 'bcartela': chave_cartela, 'bpontuacao': chave_pontuacao})

    popular_cartela(r, chave_cartela)
    popular_pontuacao(r, chave_pontuacao)

def popular_cartela(r, chave_cartela):
    quantidade_numeros = len(r.smembers(chave_cartela))
    while quantidade_numeros < 15:
        numero_aleatorio = r.srandmember('numeros')
        if r.sismember(chave_cartela, numero_aleatorio):
            numero_aleatorio = r.srandmember('numeros')
        else:
            r.sadd(chave_cartela, numero_aleatorio)
            quantidade_numeros = len(r.smembers(chave_cartela))

def popular_pontuacao(r, chave_pontuacao):
    r.set(chave_pontuacao, 0)

def sortear_numero(r, modo_auto) :
    if(modo_auto):
        return int(r.srandmember('numeros'))
    else:
        return int(input('Informe um número entre 1 e 99 ou 0 para sair: '))

def main(args):
    print('----------------------------------------------------')
    print('Bem vindo ao Redinsgo, o bingo que mais te da sorte!')
    print('----------------------------------------------------')
    r = redis.Redis(host='localhost', port=6379, db=0)

    codigos_jogadores = montar_codigos_jogadores(args.n_jogadores)
    
    preparar_dados(r, codigos_jogadores)
    print('Iniciando o Jogo no modo de sorteio {}.'.format('Automático' if args.modo_auto else 'Manual'))

    gritou_bingo = False
    codigo_vencedor = None

    numeros_sorteados = set()

    while not gritou_bingo:
        numero = sortear_numero(r, args.modo_auto)

        if(numero == 0):   
            break

        if(numero < 1 or numero > 99):
            print('Número inválido!')
            continue

        if(numero in numeros_sorteados):
            if(not args.modo_auto):
                print('Número {} já foi sorteado! Escolha outro...'.format(numero))
            continue

        numeros_sorteados.add(numero)

        for codigo_jogador in codigos_jogadores:
            if(r.sismember('cartela:' + codigo_jogador, numero)):
                r.incr('pontuacao:' + codigo_jogador, 1)
                if(int(r.get('pontuacao:' + codigo_jogador)) == 15):
                    gritou_bingo = True
                    codigo_vencedor = codigo_jogador
    
    if gritou_bingo:
        nome_vencedor = r.hget('jogador:' + codigo_vencedor, 'nome').decode()
        cartela_vencedor = sorted(list(map(int, r.smembers('cartela:' + codigo_vencedor))))
        print('Bingo! o "{}" venceu!'.format(nome_vencedor))
        print('Cartela do Vencedor = {}'.format(cartela_vencedor))
        print('Número Sorteados = {}'.format(sorted(list(map(int, numeros_sorteados)))))
            
    print('Saindo do Redinsgo...')

if __name__ == '__main__':
    main(parse_args())