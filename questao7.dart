import 'dart:io';

int fatorial(int n) {
  int resultado = 1;
  for (int i = 2; i <= n; i++) {
    resultado *= i;
  }
  return resultado;
}

void main() {
  print("Digite o valor de X:");
  double x = double.parse(stdin.readLineSync()!);

  print("Digite o número de termos:");
  int n = int.parse(stdin.readLineSync()!);

  double soma = 0;

  int f = 1;
  bool crescendo = true;

  for (int i = 0; i < n; i++) {
    soma += x / fatorial(f);

    if (crescendo) {
      f++;
      if (f == 4) {
        crescendo = false;
      }
    } else {
      f--;
      if (f == 1) {
        crescendo = true;
      }
    }
  }

  print("\nValor da série S = $soma");
}