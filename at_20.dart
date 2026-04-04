import 'dart:io';

void main() {
  Labirinto jogo = Labirinto();
  jogo.iniciar();
}

class Labirinto {
  final List<List<String>> mapa = [
    ['#', '#', '#', '#', '#', '#', '#', '#', '#', '#'],
    ['#', 'E', ' ', ' ', '#', ' ', ' ', ' ', ' ', '#'],
    ['#', '#', '#', ' ', '#', ' ', '#', '#', ' ', '#'],
    ['#', ' ', ' ', ' ', ' ', ' ', '#', ' ', ' ', '#'],
    ['#', ' ', '#', '#', '#', ' ', '#', ' ', '#', '#'],
    ['#', ' ', '#', ' ', ' ', ' ', ' ', ' ', ' ', '#'],
    ['#', ' ', '#', ' ', '#', '#', '#', '#', ' ', '#'],
    ['#', ' ', ' ', ' ', '#', ' ', ' ', ' ', 'S', '#'],
    ['#', '#', '#', '#', '#', '#', '#', '#', '#', '#'],
  ];

  int jogadorLinha = 1;
  int jogadorColuna = 1;
  bool venceu = false;

  void iniciar() {
    while (!venceu) {
      desenharTela();
      String comando = lerComando();

      if (comando == 'Q') {
        print('\nJogo encerrado.');
        break;
      }

      mover(comando);

      if (mapa[jogadorLinha][jogadorColuna] == 'S') {
        desenharTela();
        print('\nVocê encontrou a saída e venceu o labirinto!');
        venceu = true;
      }
    }
  }

  void desenharTela() {
    stdout.write('\x1B[2J\x1B[0;0H');

    print('LABIRINTO');
    print('Use W A S D para mover e Q para sair\n');

    for (int i = 0; i < mapa.length; i++) {
      String linha = '';

      for (int j = 0; j < mapa[i].length; j++) {
        if (i == jogadorLinha && j == jogadorColuna) {
          linha += 'P ';
        } else {
          linha += '${mapa[i][j]} ';
        }
      }

      print(linha);
    }

    print('\nLegenda:');
    print('P = Jogador');
    print('E = Entrada');
    print('S = Saída');
    print('# = Parede');
  }

  String lerComando() {
    stdout.write('\nDigite um comando: ');
    String? entrada = stdin.readLineSync();

    if (entrada == null || entrada.trim().isEmpty) {
      return '';
    }

    return entrada.trim().toUpperCase();
  }

  void mover(String comando) {
    int novaLinha = jogadorLinha;
    int novaColuna = jogadorColuna;

    switch (comando) {
      case 'W':
        novaLinha--;
        break;
      case 'S':
        novaLinha++;
        break;
      case 'A':
        novaColuna--;
        break;
      case 'D':
        novaColuna++;
        break;
      default:
        print('\nComando inválido.');
        pausar();
        return;
    }

    if (ehMovimentoValido(novaLinha, novaColuna)) {
      jogadorLinha = novaLinha;
      jogadorColuna = novaColuna;
    } else {
      print('\nMovimento bloqueado.');
      pausar();
    }
  }

  bool ehMovimentoValido(int linha, int coluna) {
    if (linha < 0 || linha >= mapa.length) {
      return false;
    }

    if (coluna < 0 || coluna >= mapa[0].length) {
      return false;
    }

    if (mapa[linha][coluna] == '#') {
      return false;
    }

    return true;
  }

  void pausar() {
    stdout.write('Pressione ENTER para continuar...');
    stdin.readLineSync();
  }
}
