// Feito por: Alessandro Samir Borges dos Santos Lelis

BigInt fatorial(int n) {
  BigInt resultado = BigInt.one;
  for (int i = 2; i <= n; i++) {
    resultado *= BigInt.from(i);
  }
  return resultado;
}

BigInt potencia(BigInt base, BigInt expoente) {
  BigInt resultado = BigInt.one;
  BigInt contador = BigInt.zero;

  while (contador < expoente) {
    resultado *= base;
    contador += BigInt.one;
  }

  return resultado;
}

void calculaSerie(int numTermos) {
  int numerador = 3;
  int expoente = 4;
  int denominador = 5;

  int aumentaNumerador = 2;
  int aumentaExpoente = 4;
  int aumentaDenominador = 5;

  BigInt soma = BigInt.zero;

  for (int i = 0; i < numTermos; i++) {
    BigInt fat = fatorial(expoente);
    BigInt pot = potencia(BigInt.from(numerador), fat);
    BigInt termo = pot ~/ BigInt.from(denominador);

    // Define sinal
    if (i <= 2) {
      soma += termo;
    } else if (i % 2 != 0) {
      soma -= termo;
    } else {
      soma += termo;
    }

    numerador += aumentaNumerador;
    expoente += aumentaExpoente;
    denominador += aumentaDenominador;
  }

  print("\nSoma final: $soma");
}

void main() {
  calculaSerie(2);
}
