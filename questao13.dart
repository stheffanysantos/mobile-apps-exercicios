import 'dart:io';

void main() {
  print('Digite uma sequência de números:');

  final number = stdin.readLineSync()!;

  final list = number.split('').map(int.parse).toList();

  final counted = [];

  for (int i = 0; i < list.length; i++ ){
    int currentNumber = list[i];

    if (counted.contains(currentNumber)) {
      continue;
    }

    int counter = 0;

    for (int j = 0; j < list.length; j++){
      if (list[j] == currentNumber){
        counter++;
      }
    }

    print('$currentNumber - $counter');
    counted.add(currentNumber);

  }
}