import 'dart:io';

void main() {
  print('Digite o valor do primeiro vetor:');
  final vetor1 = stdin.readLineSync()!
    .split('')
    .map(int.parse)
    .toList();

  print('Digite o valor do segundo vetor:');
  final vetor2 = stdin.readLineSync()!
    .split('')
    .map(int.parse)
    .toList();

  final vetorAgrupado = [];
  vetorAgrupado.addAll(vetor1);
  vetorAgrupado.addAll(vetor2);

  vetor1.sort();
  vetor2.sort();
  vetorAgrupado.sort();

  print('Vetor 1: $vetor1 (tamanho: ${vetor1.length})');
  print('Vetor 2: $vetor2 (tamanho: ${vetor2.length})');
  print('Vetor agrupado: $vetorAgrupado (tamanho: ${vetorAgrupado.length})');

}