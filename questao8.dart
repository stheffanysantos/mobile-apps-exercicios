import 'dart:io';

void main() {
  List<Candidato> candidatos = [];

  print("Quantos candidatos deseja cadastrar?");
  int n = int.parse(stdin.readLineSync()!);

  for (int i = 0; i < n; i++) {
    print("\nCandidato ${i + 1}:");
    var c = Candidato();
    c.lerDados();
    candidatos.add(c);
  }

  processarDados(candidatos);
}

class Candidato {
  late String codigo;
  late String curso;
  late String nome;
  late String sexo;
  late int pontuacao;

  void lerDados() {
    while (true) {
      print("Digite o código do candidato (4 dígitos):");
      String input = stdin.readLineSync()!;

      if (RegExp(r'^\d{4}$').hasMatch(input)) {
        codigo = "FLAG($input)";
        break;
      } else {
        print("Código inválido. Use exatamente 4 dígitos.");
      }
    }

    while (true) {
      print("Digite o curso (CC ou SI):");
      String input = stdin.readLineSync()!.toUpperCase();

      if (input == "CC") {
        curso = "Ciência da Computação";
        break;
      } else if (input == "SI") {
        curso = "Sistemas de Informação";
        break;
      } else {
        print("Curso inválido. Use CC ou SI.");
      }
    }

    print("Digite o nome do candidato:");
    nome = stdin.readLineSync()!;

    while (true) {
      print("Digite o sexo (M/F):");
      String input = stdin.readLineSync()!.toUpperCase();

      if (input == "M") {
        sexo = "Masculino";
        break;
      } else if (input == "F") {
        sexo = "Feminino";
        break;
      } else {
        print("Sexo inválido. Use M ou F.");
      }
    }

    while (true) {
      print("Digite a pontuação (0 a 5000):");
      String input = stdin.readLineSync()!;

      int? valor = int.tryParse(input);

      if (valor != null && valor >= 0 && valor <= 5000) {
        pontuacao = valor;
        break;
      } else {
        print("Pontuação inválida. Deve ser entre 0 e 5000.");
      }
    }
  }
}

void processarDados(List<Candidato> lista) {
  print("\n[a] Candidatos de CC com mais de 2500 pontos:");
  for (var c in lista) {
    if (c.curso == "Ciência da Computação" && c.pontuacao > 2500) {
      print("Código: ${c.codigo}, Nome: ${c.nome}, Pontuação: ${c.pontuacao}");
    }
  }

  Candidato? menorMasculino;
  for (var c in lista) {
    if (c.sexo == "Masculino") {
      if (menorMasculino == null || c.pontuacao < menorMasculino.pontuacao) {
        menorMasculino = c;
      }
    }
  }

  if (menorMasculino != null) {
    print("\n[b] Homem com menor pontuação: ${menorMasculino.nome}");
  }

  Candidato? maiorSI;
  for (var c in lista) {
    if (c.sexo == "Masculino" && c.curso == "Sistemas de Informação") {
      if (maiorSI == null || c.pontuacao > maiorSI.pontuacao) {
        maiorSI = c;
      }
    }
  }

  if (maiorSI != null) {
    print("\n[c] Código do homem com maior pontuação em SI: ${maiorSI.codigo}");
  }

  int total = lista.length;
  int masc = 0;
  int fem = 0;

  for (var c in lista) {
    if (c.sexo == "Masculino") {
      masc++;
    } else if (c.sexo == "Feminino") {
      fem++;
    }
  }

  double percMasc = (masc / total) * 100;
  double percFem = (fem / total) * 100;

  print("\n[d] Percentual:");
  print("Masculino: ${percMasc.toStringAsFixed(2)}%");
  print("Feminino: ${percFem.toStringAsFixed(2)}%");
}
