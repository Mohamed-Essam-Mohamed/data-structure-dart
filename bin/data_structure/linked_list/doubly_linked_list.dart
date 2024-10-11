import 'dart:collection';

class Node<T> {
  T data;
  Node<T>? next;
  Node<T>? prev;

  Node({required this.data, this.next, this.prev});
}

class DoublyLinkedList<T> extends Iterable<T> {
  @override
  Iterator<T> get iterator => _LinkedListIterator(this);

  Node<T>? head;
  Node<T>? tail;
  late int length;

  DoublyLinkedList() {
    head = null;
    tail = null;
    length = 0;
  }

  void insertFirst(T data) {
    Node<T> newNode = Node(data: data, next: null, prev: null);
    if (length == 0) {
      head = newNode;
      tail = newNode;
    } else {
      newNode.next = head;
      head?.prev = newNode;
      head = newNode;
    }
    length++;
  }

  void insertLast(T data) {
    Node<T> newNode = Node(data: data, next: null, prev: null);
    if (length == 0) {
      head = newNode;
      tail = newNode;
    } else {
      tail?.next = newNode;
      newNode.prev = tail;
      tail = newNode;
    }
    length++;
  }

  void insertAt(int index, T data) {
    if (index < 0 || index > length) return;
    if (index == 0) {
      insertFirst(data);
    } else if (index == length) {
      insertLast(data);
    } else {
      Node<T> newNode = Node(data: data, next: null, prev: null);
      Node<T> current = head!;
      for (var i = 1; i < index; i++) {
        current = current.next!;
      }
      newNode.next = current.next;
      current.next?.prev = newNode;
      current.next = newNode;
      newNode.prev = current;
    }
    length++;
  }

  void removeFirst() {
    if (length == 0) return;
    if (length == 1) {
      head = tail = null;
    } else {
      head = head?.next;
      head?.prev = null;
    }
    length--;
  }

  void removeLast() {
    if (length == 0) return;
    if (length == 1) {
      head = tail = null;
    } else {
      tail = tail?.prev;
      tail?.next = null;
    }
    length--;
  }

  void removeAt(int index) {
    if (index < 0 || index >= length) return;
    if (index == 0) {
      removeFirst();
    } else if (index == length - 1) {
      removeLast();
    } else {
      Node<T> current = head!;
      for (var i = 1; i < index; i++) {
        current = current.next!;
      }
      current.next = current.next?.next;
      current.next?.prev = current;
    }
    length--;
  }

  @override
  void forEach(void Function(T element) action) {
    // TODO: implement forEach
    super.forEach(action);
  }
}

class _LinkedListIterator<T> implements Iterator<T> {
  _LinkedListIterator(DoublyLinkedList<T> list) : _list = list;
  final DoublyLinkedList<T> _list;

  Node<T>? _currentNode;

  @override
  T get current => _currentNode!.data;

  bool _firstPass = true;

  @override
  bool moveNext() {
    if (_list.isEmpty) return false;

    if (_firstPass) {
      _currentNode = _list.head;
      _firstPass = false;
    } else {
      _currentNode = _currentNode?.next;
    }

    return _currentNode != null;
  }
}
