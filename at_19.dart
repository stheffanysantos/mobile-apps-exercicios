import 'dart:io';

void main() {
  List<List<String>> tabuleiro = List.generate(3, (_) => List.filled(3, ' '));

  String jogadorAtual = 'X';
  int jogadas = 0;
  bool jogoEncerrado = false;

  while (!jogoEncerrado) {
    exibirTabuleiro(tabuleiro);

    print('Jogador $jogadorAtual informe a linha e a coluna (de 1 a 3).');

    int? linha = lerPosicao('Linha: ');
    int? coluna = lerPosicao('Coluna: ');

    if (linha == null || coluna == null) {
      print('Entrada inválida. Insira uma entrada valida.\n');
      continue;
    }

    linha -= 1;
    coluna -= 1;

    if (tabuleiro[linha][coluna] != ' ') {
      print('Essa posição ja está ocupada. Escolha outra.\n');
      continue;
    }

    tabuleiro[linha][coluna] = jogadorAtual;
    jogadas++;

    if (verificarVitoria(tabuleiro, jogadorAtual)) {
      exibirTabuleiro(tabuleiro);
      print('Jogador $jogadorAtual venceu!!!');
      jogoEncerrado = true;
    } else if (jogadas == 9) {
      exibirTabuleiro(tabuleiro);
      print('VELHA! O tabuleiro foi preenchido sem nenhum vencedor.');
      jogoEncerrado = true;
    } else {
      jogadorAtual = jogadorAtual == 'X' ? 'O' : 'X';
    }
  }
}

int? lerPosicao(String mensagem) {
  stdout.write(mensagem);
  String? entrada = stdin.readLineSync();

  if (entrada == null) return null;

  int? valor = int.tryParse(entrada);

  if (valor == null || valor < 1 || valor > 3) {
    return null;
  }

  return valor;
}

void exibirTabuleiro(List<List<String>> tabuleiro) {
  print('\n   1   2   3');
  for (int i = 0; i < 3; i++) {
    print(
      '${i + 1}  ${tabuleiro[i][0]} | ${tabuleiro[i][1]} | ${tabuleiro[i][2]}',
    );
    if (i < 2) {
      print('  ---+---+---');
    }
  }
  print('');
}

bool verificarVitoria(List<List<String>> tabuleiro, String jogador) {
  for (int i = 0; i < 3; i++) {
    if (tabuleiro[i][0] == jogador &&
        tabuleiro[i][1] == jogador &&
        tabuleiro[i][2] == jogador) {
      return true;
    }
  }

  for (int j = 0; j < 3; j++) {
    if (tabuleiro[0][j] == jogador &&
        tabuleiro[1][j] == jogador &&
        tabuleiro[2][j] == jogador) {
      return true;
    }
  }

  if (tabuleiro[0][0] == jogador &&
      tabuleiro[1][1] == jogador &&
      tabuleiro[2][2] == jogador) {
    return true;
  }

  if (tabuleiro[0][2] == jogador &&
      tabuleiro[1][1] == jogador &&
      tabuleiro[2][0] == jogador) {
    return true;
  }

  return false;
}
