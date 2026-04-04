import 'dart:io';

void main() {
  print('Digite uma sequência de números:');
  final number = stdin.readLineSync()!;
  final list = [];

  for (int i = number.length - 1; i >= 0; i--) {
    list.add(number[i]);
  }

  print(list.join());
  
}