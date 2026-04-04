import 'dart:io';

void main() {
  const double valorHora = 12.30;

  double somaHomens = 0;
  double somaMulheres = 0;

  int qtdHomens = 0;
  int qtdMulheres = 0;

  while (true) {
    stdout.write("Código do professor (digite 9999 para encerrar): ");
    int codigo = int.parse(stdin.readLineSync()!);

    if (codigo == 9999) {
      break;
    }

    stdout.write("Nome: ");
    String nome = stdin.readLineSync()!;

    stdout.write("Sexo (M/F): ");
    String sexo = stdin.readLineSync()!.toUpperCase();

    stdout.write("Numero de horas aula no mês: ");
    int horas = int.parse(stdin.readLineSync()!);

    double salarioBruto = horas * valorHora;
    double desconto;
    double salarioLiquido;

    if (sexo == 'M') {
      desconto = salarioBruto * 0.10;
      salarioLiquido = salarioBruto - desconto;
      somaHomens += salarioLiquido;
      qtdHomens++;
    } else {
      desconto = salarioBruto * 0.05;
      salarioLiquido = salarioBruto - desconto;
      somaMulheres += salarioLiquido;
      qtdMulheres++;
    }

    print("\n Professor");
    print("Código do professor: $codigo");
    print("Nome: $nome");
    print("Salário Bruto: R\$ ${salarioBruto.toStringAsFixed(2)}");
    print("Salário Líquido: R\$ ${salarioLiquido.toStringAsFixed(2)}\n");
  }

  double mediaHomens = qtdHomens > 0 ? somaHomens / qtdHomens : 0;
  double mediaMulheres = qtdMulheres > 0 ? somaMulheres / qtdMulheres : 0;

  print("\n Médias");
  print(
    "Média salário líquido (Homens): R\$ ${mediaHomens.toStringAsFixed(2)}",
  );
  print(
    "Média salário líquido (Mulheres): R\$ ${mediaMulheres.toStringAsFixed(2)}",
  );
}
