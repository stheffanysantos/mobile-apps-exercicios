import 'dart:io';

List<int> lerVetor(String nome) {
  print('Quantos elementos no $nome?');
  int n = int.parse(stdin.readLineSync()!);

  List<int> vetor = [];
  for (int i = 0; i < n; i++) {
    print('Elemento ${i + 1} do $nome:');
    int val = int.parse(stdin.readLineSync()!);
    vetor.add(val);
  }
  return vetor;
}

List<int> somarVetores(List<int> v1, List<int> v2) {
  int tamanho = v1.length < v2.length ? v1.length : v2.length;
  List<int> resultado = [];

  for (int i = 0; i < tamanho; i++) {
    resultado.add(v1[i] + v2[i]);
  }
  return resultado;
}

int somaTotal(List<int> vetor) {
  int soma = 0;
  for (int val in vetor) {
    soma += val;
  }
  return soma;
}

void imprimirVetor(String titulo, List<int> vetor) {
  print('$titulo: $vetor');
}

void main() {
  List<int> vetor1 = lerVetor('vetor 1');
  List<int> vetor2 = lerVetor('vetor 2');

  List<int> vetor3 = somarVetores(vetor1, vetor2);

  print('');
  imprimirVetor('Vetor 1', vetor1);
  imprimirVetor('Vetor 2', vetor2);
  imprimirVetor('Vetor 3 (soma)', vetor3);
  print('Soma dos elementos do vetor 3: ${somaTotal(vetor3)}');
}
