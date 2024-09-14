class Node<E> {
  E data;
  Node<E>? next;
  Node({required this.data, this.next});
}

class LinkedStack<T> {
  Node<T>? top;
  late int length;
  LinkedStack() {
    length = 0;
    top = null;
  }
  bool isEmpty() => length == 0;
  bool isNotEmpty() => !isEmpty();
  int lengthStack() => length;
  void push(T element) {
    top = Node<T>(data: element, next: top);
    length++;
  }

  T pop() {
    if (isEmpty()) {
      return throw ("Stack is Empty");
    } else {
      final popped = top!.data;
      top = top!.next;
      return popped;
    }
  }

  T peek() {
    if (isEmpty()) {
      throw Exception("Stack is empty.");
    }
    return top!.data;
  }

  void printLinkedStack() {
    var current = top;
    while (current != null) {
      print(current.data);
      current = current.next;
    }
  }
}
