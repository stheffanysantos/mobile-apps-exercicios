// Feito por: Alessandro Samir Borges dos Santos Lelis

String montarSequencia(int numSequencia) {
  int primeiroNumeroSequencia = 1;
  int segundoNumeroSequencia = 5;
  int terceiroNumeroSequencia = 100;

  String sequencia = "";

  for (int i = 0; i < numSequencia; i++) {
    if (i % 3 == 0) {
      sequencia += "$primeiroNumeroSequencia ";
      primeiroNumeroSequencia *= 2;
    } else if (i % 3 == 1) {
      sequencia += "$segundoNumeroSequencia ";
      segundoNumeroSequencia += 5;
    } else {
      sequencia += "$terceiroNumeroSequencia ";
      terceiroNumeroSequencia -= 10;
    }
  }

  return sequencia;
}

void main() {
  String resultado = montarSequencia(25);
  print(resultado);
}
