// example :
// infix   = 5 / 5 + 2 - 1 * 9
// covert  infix to postfix = 5 5 / 2 + 9 1 * -
import 'stack.dart';
import 'dart:io';

void main() {
  StackI<String> stack = StackI();
  // 2 + ( ( 8 + 2 * 3 ) / 2) - 1 => 2 8 2 3 * + 2 / + 1 -
  print("Enter the number infix");
  String input = stdin.readLineSync()!;
  List<String> infix = input.split(' ');

  final finalResult = <String>[];
  for (int i = 0; i < infix.length; i++) {
    if (isOperand(infix[i])) {
      finalResult.add(infix[i]);
    } else if (isOperator(infix[i])) {
      while (!stack.isEmpty() &&
          getOperatorWeight(stack.peek()) >= getOperatorWeight(infix[i])) {
        finalResult.add(stack.pop());
      }
      stack.push(infix[i]);
    } else if (infix[i] == "(") {
      stack.push("(");
    } else if (infix[i] == ")") {
      while (!stack.isEmpty() && stack.peek() != "(") {
        finalResult.add(stack.pop());
      }
      stack.pop();
    }
    while (!stack.isEmpty()) {
      finalResult.add(stack.pop());
    }
  }
  print(finalResult);
}

int getOperatorWeight(String op) {
  int weight = -1;
  switch (op) {
    case '+':
    case '-':
      weight = 1;
    case '*':
    case '/':
      weight = 2;
  }
  return weight;
}

bool isOperator(String char) => '+/*-'.contains(char);

bool isOperand(String char) {
  return !isOperator(char) && char != "(" && char != ")";
}
/////////////////////////
