import 'dart:io';

void main() {
  for (int n = 1000; n <= 9999; n++) {
    // String nStr = n.toString();
    // String parte1Str = nStr.substring(0, 2);
    // String parte2Str = nStr.substring(2);
    // int parte1 = int.parse(parte1Str);
    // int parte2 = int.parse(parte2Str);

    int parte1 = n ~/ 100; // ~/ --> Divisão inteira
    int parte2 = n % 100; // % --> Operador de módulo

    int soma = parte1 + parte2;

    if (soma * soma == n) {
      print(n);
    }
  }
}