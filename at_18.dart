import 'dart:io';

void main() {
  String palavraSecreta = 'DART'.toUpperCase();
  List<String> letrasDescobertas = List.filled(palavraSecreta.length, '_');
  List<String> letrasTentadas = [];

  int erros = 0;
  const int maxErros = 6;

  print('=== JOGO DA FORCA ===');

  while (erros < maxErros && letrasDescobertas.contains('_')) {
    desenharForca(erros);
    print('\nPalavra: ${letrasDescobertas.join(' ')}');
    print('Letras tentadas: ${letrasTentadas.join(', ')}');

    stdout.write('Digite uma letra: ');
    String? entrada = stdin.readLineSync();

    if (entrada == null || entrada.trim().isEmpty) {
      print('Entrada inválida. Digite uma letra.');
      continue;
    }

    String letra = entrada.trim().toUpperCase();

    if (letra.length != 1 || !RegExp(r'^[A-Z]$').hasMatch(letra)) {
      print('Digite apenas uma letra válida.');
      continue;
    }

    if (letrasTentadas.contains(letra)) {
      print('Você já tentou essa letra.');
      continue;
    }

    letrasTentadas.add(letra);

    if (palavraSecreta.contains(letra)) {
      for (int i = 0; i < palavraSecreta.length; i++) {
        if (palavraSecreta[i] == letra) {
          letrasDescobertas[i] = letra;
        }
      }
      print('Letra correta!');
    } else {
      erros++;
      print('Letra errada!');
    }
  }

  desenharForca(erros);

  if (!letrasDescobertas.contains('_')) {
    print('\nParabéns! Você descobriu a palavra: $palavraSecreta');
  } else {
    print('\nFim de jogo! A palavra era: $palavraSecreta');
  }
}

void desenharForca(int erros) {
  List<String> estagios = [
    '''
 +---+
 |   |
     |
     |
     |
     |
=========
''',
    '''
 +---+
 |   |
 O   |
     |
     |
     |
=========
''',
    '''
 +---+
 |   |
 O   |
 |   |
     |
     |
=========
''',
    '''
 +---+
 |   |
 O   |
/|   |
     |
     |
=========
''',
    '''
 +---+
 |   |
 O   |
/|\\  |
     |
     |
=========
''',
    '''
 +---+
 |   |
 O   |
/|\\  |
/    |
     |
=========
''',
    '''
 +---+
 |   |
 O   |
/|\\  |
/ \\  |
     |
=========
''',
  ];

  print(estagios[erros]);
}
