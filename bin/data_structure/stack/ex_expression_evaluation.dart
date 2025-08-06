// example :
// infix   = 5 / 5 + 2 - 1 * 9 = -6
// postfix = 5 5 / 2 + 9 1 * - = -6
import 'builder_from_scrat/stack.dart';
import 'dart:io';

void main() {
  Stack<String> stack = Stack();
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

bool isOperator(String char) => char == '/' || char == '*' || char == '-' || char == '+';

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
