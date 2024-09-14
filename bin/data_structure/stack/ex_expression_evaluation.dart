// example :
// infix   = 5 / 5 + 2 - 1 * 9 = 18
// postfix = 5 5 / 2 + 9 1 * - = 18
import 'stack.dart';
import 'dart:io';

void main() {
  StackI<String> stack = StackI();
  print("Enter a Postfix Expression: ( e.g. 4 5 * )\n ");
  String input = stdin.readLineSync()!;
  List<String> postfix = input.split(' ');
  for (int i = 0; i < postfix.length; i++) {
    if (isOperator(postfix[i])) {
      int? op1 = int.parse(stack.pop());
      int? op2 = int.parse(stack.pop());
      int? result = performOperation(op1, op2, postfix[i]);
      stack.push(result.toString());
    } else {
      stack.push(postfix[i]);
    }
  }
  print("Result: ${stack.pop()}");
}

bool isOperator(String char) =>
    char == '/' || char == '*' || char == '-' || char == '+';

int? performOperation(int op1, int op2, String op) {
  int? result;
  switch (op) {
    case '+':
      result = op2 + op1;
      break;
    case '-':
      result = op2 - op1;
      break;
    case '*':
      result = op2 * op1;
      break;
    case '/':
      result = op2 ~/ op1;
      break;
  }
  return result;
}
