import 'dart:io';

void main() {
  print('Quantos bois na fazenda?');
  int n = int.parse(stdin.readLineSync()!);

  List<int> numeros = [];
  List<double> pesos = [];

  for (int i = 0; i < n; i++) {
    print('Numero do boi ${i + 1}:');
    int num = int.parse(stdin.readLineSync()!);
    print('Peso do boi ${i + 1}:');
    double peso = double.parse(stdin.readLineSync()!);
    numeros.add(num);
    pesos.add(peso);
  }

  String continuar = 's';

  while (continuar == 's') {
    print('\nDigite o peso minimo do intervalo:');
    double pesoMin = double.parse(stdin.readLineSync()!);
    print('Digite o peso maximo do intervalo:');
    double pesoMax = double.parse(stdin.readLineSync()!);

    print('\nBois com peso entre $pesoMin e $pesoMax:');
    bool achou = false;

    for (int i = 0; i < n; i++) {
      if (pesos[i] >= pesoMin && pesos[i] <= pesoMax) {
        print('Boi ${numeros[i]} - Peso: ${pesos[i]}');
        achou = true;
      }
    }

    if (!achou) {
      print('Nenhum boi encontrado nesse intervalo.');
    }

    print('\nDeseja fazer outra pesquisa? (s/n)');
    continuar = stdin.readLineSync()!.toLowerCase();
  }
}
