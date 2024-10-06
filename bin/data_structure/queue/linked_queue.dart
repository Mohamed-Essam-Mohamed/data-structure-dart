class Node<T> {
  T element;
  Node<T>? next;
  Node(this.element);
}

class LinkedQueue<T> {
  Node<T>? front, rear;
  late int size;
  LinkedQueue() {
    front = null;
    rear = null;
    size = 0;
  }
  bool isEmpty() => size == 0;
  void enQueue(T element) {
    Node<T> newNode = Node(element);
    if (isEmpty()) {
      front = rear = newNode;
    } else {
      rear!.next = newNode;
      rear = newNode;
    }
  }

  T deQueue() {
    if (isEmpty()) {
      throw StateError('Queue is empty.');
    }
    final dequeued = front!.element;
    front = front!.next;
    if (front == null) {
      rear = null;
    }
    return dequeued;
  }

  void printAll() {
    var current = front;
    while (current != null) {
      print(current.element);
      current = current.next;
    }
  }
}
