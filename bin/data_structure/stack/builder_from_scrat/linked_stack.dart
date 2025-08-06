class Node<E> {
  E data;
  Node<E>? next;
  Node({required this.data, this.next});
}

class LinkedStack<T> {
  LinkedStack()
      : _top = null,
        length = 0;
  Node<T>? _top;
  int length;
  factory LinkedStack.fromList(List<T> items) {
    final stack = LinkedStack<T>();
    for (final item in items) {
      stack.push(item);
    }
    return stack;
  }
  // push
  void push(T element) {
    _top = Node(data: element, next: _top);
    length++;
  }

  // pop
  T pop() {
    if (_top == null) return throw Exception('Stack is Empty');
    final popped = _top!.data;
    _top = _top!.next;
    length--;
    return popped;
  }

  // peek
  T peek() {
    if (_top == null) return throw Exception('Stack is Empty');
    return _top!.data;
  }

  // isEmpty
  bool get isEmpty => length == 0;
  // isNotEmpty
  bool get isNotEmpty => !isEmpty;
  // length
  int get lengthStack => this.length;
  // return values
  List<T> get values => _processValues();
  List<T> _processValues() {
    if (_top == null) return throw Exception('Stack is Empty');
    List<T> valuesStack = <T>[];
    Node<T>? currentTop = _top!;
    while (currentTop != null) {
      valuesStack.add(currentTop.data);
      currentTop = currentTop.next;
    }
    return valuesStack;
  }
}

void main() {
  LinkedStack stack = LinkedStack<int>.fromList([1, 2, 3, 4, 5]);

  stack.push(6);
  print(stack.length);
  print(stack.values);
  stack.pop();
  print(stack.values);
  stack.pop();
  print(stack.values);
  stack.pop();
  print(stack.values);
}
