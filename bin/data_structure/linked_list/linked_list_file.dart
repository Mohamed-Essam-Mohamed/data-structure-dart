class Node<E> {
  E? value;
  Node<E>? next;

  Node([this.value, this.next]);
}

class LinkedList<T> {
  Node<T>? _head;
  Node<T>? _tail;
  late int _size;

  LinkedList() : _size = 0 {
    _head = _tail = null;
  }

  add() {}

  remove(T value) {}
}
