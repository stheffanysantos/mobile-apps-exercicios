import 'dart:io';

void main() {
  List<List<int>> vetores = [];

  for (int i = 0; i < 4; i++) {
    print('Tamanho do vetor ${i + 1}:');
    int tam = int.parse(stdin.readLineSync()!);

    List<int> vetor = [];
    for (int j = 0; j < tam; j++) {
      print('Elemento ${j + 1} do vetor ${i + 1}:');
      int elem = int.parse(stdin.readLineSync()!);
      vetor.add(elem);
    }
    vetores.add(vetor);
  }

  // a) quinto vetor com todos os valores ordenados
  List<int> quintoVetor = [];
  for (var v in vetores) {
    quintoVetor.addAll(v);
  }
  quintoVetor.sort();
  print('\na) Quinto vetor ordenado: $quintoVetor');

  // b) intersecao dos 4 vetores
  Set<int> intersecao = vetores[0].toSet();
  for (int i = 1; i < 4; i++) {
    intersecao = intersecao.intersection(vetores[i].toSet());
  }

  List<int> vetorIntersecao = intersecao.toList();
  if (vetorIntersecao.isEmpty) {
    print('b) Nenhum elemento em comum entre os 4 vetores.');
  } else {
    print('b) Intersecao dos 4 vetores: $vetorIntersecao');
  }
}
