import 'dart:io';

void main() {
    var contador = 0;
    var desc_classificacao = "";

    double maior_peso_fem = -1;
    String? nome_maior_peso_fem = "";
    
    var baixo_peso = 0; 
    var normal = 0; 
    var alto_peso = 0;
    
    List<dynamic> lista_bebes = [];

    for (int i = 1; i <= 3; i++) {
      print("Digite seu nome:");
      String? nome = stdin.readLineSync();
      
      print("digite seu sexo (F/M):");
      String? sexo = stdin.readLineSync();
      
      print("Digite seu peso:");
      String? entrada = stdin.readLineSync();
      double peso = double.parse(entrada!); 
      
      if (peso >= 0 && peso <= 2) {
          baixo_peso++;
          desc_classificacao = "Baixo Peso";
      } else if (peso > 2 && peso <= 4) {
          normal++;
          desc_classificacao = "Normal";
      } else {
          alto_peso++;
          desc_classificacao = "Alto Peso";
      };
      
      var recem_nascido = {
          'nome': nome,
          'sexo': sexo,
          'peso': peso,
          'desc_classificacao': desc_classificacao
      };
      
      if (sexo == 'F' || sexo == 'f') {
          if (peso > maior_peso_fem) {
            maior_peso_fem = peso;
            nome_maior_peso_fem = nome;
          }
      }
      
      lista_bebes.add(recem_nascido);
      contador++;
    }
    
    double perc_baixo = (baixo_peso / contador) * 100;
    double perc_normal = (normal / contador) * 100;
    double perc_alto = (alto_peso / contador) * 100;
    
    print("Letra A");
    print(lista_bebes);
    print("-------------------------------");
    
    print("Letra B");
    if (nome_maior_peso_fem != null) {
      print("Bebê feminino com maior peso: $nome_maior_peso_fem =  ${maior_peso_fem}kg");
    } else {
      print("Nenhum bebê do sexo feminino.");
    }
    print("-------------------------------");
    
    print("Letra C");
    print("O percentual de recém-nascidos em cada classificação de peso.");
    print("Baixo peso: ${perc_baixo.toStringAsFixed(2)}%");
    print("Normal: ${perc_normal.toStringAsFixed(2)}%");
    print("Alto peso: ${perc_alto.toStringAsFixed(2)}%");
    print("-------------------------------");
}