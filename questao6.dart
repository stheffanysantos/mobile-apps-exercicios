import 'dart:io';
import 'dart:math';

void main() {
  final random = Random();

  int numeroSecreto = random.nextInt(100) + 1;

  int min = 0;
  int max = 100;
  int tentativa = 0;
  bool acertou = false;

  print("=== Jogo de Adivinhação ===");

  while (!acertou) {
    print("\nDigite um número entre $min e $max:");
    String? input = stdin.readLineSync();

    // Validação básica
    if (input == null || input.isEmpty) {
      print("Entrada inválida. Tente novamente.");
      continue;
    }

    int palpite = int.tryParse(input) ?? -1;

    if (palpite < min || palpite > max) {
      print("Número fora do intervalo! Tente novamente.");
      continue;
    }

    tentativa++;

    if (palpite == numeroSecreto) {
      acertou = true;
      print("\n🎉 Parabéns! Você acertou em $tentativa tentativas.");
      print("O número era: $numeroSecreto");
    } else if (palpite > numeroSecreto) {
      max = palpite;
      print("O número está entre $min e $max");
    } else {
      min = palpite;
      print("O número está entre $min e $max");
    }
  }
}