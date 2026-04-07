// Feito por: Alessandro Samir Borges dos Santos Lelis

const Map<String, double> boloPrecos = {
  "ovos": 5.5,
  "chocolate": 7.5,
  "cenoura": 3.5,
};

double calculatePrice(List<String> ordem) {
  double total = 0;

  ordem.forEach((produto) {
    try {
      total += boloPrecos[produto]!;
    } catch (e) {
      print("O produto $produto não está no cardápio");
    }
  });

  return total;
}

void main() {
  const ordem = ["ovos", "chocolate"];
  final double total = calculatePrice(ordem);

  print("Preço total do bolo: $total");
}
