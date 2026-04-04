import 'dart:io';

void main() {
  String nome;
  int qtdHomens = 0;
  int qtdMulheres = 0;
  int somaIdadeHomensExp = 0;
  int qtdHomensExp = 0;
  int homensMais45 = 0;
  int mulheresMenos30Exp = 0;
  
  String? nomeMulherMaisNovaExp;
  int? idadeMulherMaisNovaExp;

  while (true) {
    print("Digite o nome do candidato (ou FIM para encerrar):");
    nome = stdin.readLineSync()!;

    if (nome.trim().isEmpty) {
      print("Nome não pode ser vazio.");
      continue;
    }

    if (nome.toUpperCase() == "FIM") {
      break;
    }

    String sexo;
    while (true) {
      print("Sexo (M/F):");
      sexo = stdin.readLineSync()!.toUpperCase();

      if (sexo == "M" || sexo == "F") {
        break;
      } else {
        print("Entrada inválida. Digite apenas M ou F.");
      }
    }

    int idade;
    while (true) {
      print("Idade:");
      String input = stdin.readLineSync()!;

      int? valor = int.tryParse(input);

      if (valor != null && valor > 0 && valor < 120) {
        idade = valor;
        break;
      } else {
        print("Idade inválida. Digite um número entre 1 e 119.");
      }
    }

    String experiencia;
    while (true) {
      print("Tem experiência? (S/N):");
      experiencia = stdin.readLineSync()!.toUpperCase();

      if (experiencia == "S" || experiencia == "N") {
        break;
      } else {
        print("Entrada inválida. Digite apenas S ou N.");
      }
    }

    if (sexo == "M") {
      qtdHomens++;

      if (experiencia == "S") {
        somaIdadeHomensExp += idade;
        qtdHomensExp++;
      }

      if (idade > 45) {
        homensMais45++;
      }
    } else {
      qtdMulheres++;

      if (idade < 30 && experiencia == "S") {
        mulheresMenos30Exp++;
      }

      if (experiencia == "S") {
        if (idadeMulherMaisNovaExp == null || idade < idadeMulherMaisNovaExp) {
          idadeMulherMaisNovaExp = idade;
          nomeMulherMaisNovaExp = nome;
        }
      }
    }
  }

  print("\n=== RESULTADOS ===");

  print("Número de Homens: $qtdHomens");
  print("Número de Mulheres: $qtdMulheres");

  if (qtdHomensExp > 0) {
    double media = somaIdadeHomensExp / qtdHomensExp;
    print("Idade média dos homens com experiência: ${media.toStringAsFixed(2)}");
  } else {
    print("Nenhum homem com experiência.");
  }

  if (qtdHomens > 0) {
    double perc = (homensMais45 / qtdHomens) * 100;
    print("Percentual de homens com mais de 45 anos: ${perc.toStringAsFixed(2)}%");
  } else {
    print("Nenhum homem cadastrado.");
  }

  print("Mulheres com menos de 30 anos e experiência: $mulheresMenos30Exp");

  if (nomeMulherMaisNovaExp != null) {
    print("Mulher mais nova com experiência: $nomeMulherMaisNovaExp");
  } else {
    print("Nenhuma mulher com experiência.");
  }
}
