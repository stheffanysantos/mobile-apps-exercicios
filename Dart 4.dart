import 'dart:io';

void main() {
  double somaTurma = 0;
  int totalAlunos = 0;
  int aprovados = 0;

  double maiorMediaM = -1;
  String matMaiorM = '';
  double maiorMediaF = -1;
  String matMaiorF = '';

  double somaFeminino = 0;
  int qtdFeminino = 0;

  while (true) {
    print('Digite a matricula (00000 para sair):');
    String matricula = stdin.readLineSync()!;

    if (matricula == '00000') break;

    print('Nome:');
    stdin.readLineSync();

    print('Sexo (M/F):');
    String sexo = stdin.readLineSync()!.toUpperCase();

    print('Nota 1:');
    double n1 = double.parse(stdin.readLineSync()!);
    print('Nota 2:');
    double n2 = double.parse(stdin.readLineSync()!);
    print('Nota 3:');
    double n3 = double.parse(stdin.readLineSync()!);

    print('Numero de faltas:');
    int faltas = int.parse(stdin.readLineSync()!);

    double media = (n1 + n2 + n3) / 3;
    somaTurma += media;
    totalAlunos++;

    bool aprovado = media >= 7.0 && faltas <= 18;

    if (aprovado) {
      aprovados++;
    }

    if (sexo == 'M' && aprovado && media > maiorMediaM) {
      maiorMediaM = media;
      matMaiorM = matricula;
    }

    if (sexo == 'F') {
      somaFeminino += media;
      qtdFeminino++;

      if (aprovado && media > maiorMediaF) {
        maiorMediaF = media;
        matMaiorF = matricula;
      }
    }
  }

  if (totalAlunos == 0) {
    print('Nenhum aluno cadastrado.');
    return;
  }

  print('\n--- Resultados ---');
  print('a) Media da turma: ${(somaTurma / totalAlunos).toStringAsFixed(2)}');
  print('b) Percentual de aprovados: ${((aprovados / totalAlunos) * 100).toStringAsFixed(2)}%');

  if (matMaiorM != '') {
    print('c) Matricula do aluno masculino com maior media (aprovado): $matMaiorM');
  } else {
    print('c) Nenhum aluno masculino aprovado.');
  }

  if (matMaiorF != '') {
    print('   Matricula da aluna feminina com maior media (aprovada): $matMaiorF');
  } else {
    print('   Nenhuma aluna feminina aprovada.');
  }

  if (qtdFeminino > 0) {
    print('d) Media dos alunos do sexo feminino: ${(somaFeminino / qtdFeminino).toStringAsFixed(2)}');
  } else {
    print('d) Nenhuma aluna cadastrada.');
  }
}
