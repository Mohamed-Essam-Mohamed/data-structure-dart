// ignore_for_file: public_member_api_docs, sort_constructors_first
class Node<E> {
  E? value;
  Node<E>? next;
  Node([this.value, this.next]);
}

enum AddType { addLast, addFirst }

class LinkedList<T> {
  Node<T>? _head;
  Node<T>? _tail;
  late int _size;

  LinkedList() : _size = 0 {
    _head = _tail = null;
  }
  // general add

  // add
  void addLast(T value) {
    final newNode = Node<T>(value);
    if (isEmpty) {
      _head = _tail = newNode;
    } else {
      _tail!.next = newNode;
      _tail = newNode;
    }
    _size++;
  }

  // addFirst
  void addFirst(T value) {
    final newNode = Node<T>(value);
    if (isEmpty) {
      _head = _tail = newNode;
    } else {
      newNode.next = _head;
      _head = newNode;
    }
    _size++;
  }

  // addAll
  void addAll(List<T> values, [AddType type = AddType.addLast]) {
    switch (type) {
      case AddType.addLast:
        for (var value in values) {
          addLast(value);
        }
        break;
      case AddType.addFirst:
        for (var value in values) {
          addFirst(value);
        }
    }
  }

  // add at index
  void addAt(int index, T value) {
    if (index < 0 || index > _size) {
      throw RangeError('Invalid index');
    } else if (index == 0) {
      addFirst(value);
    } else if (index == _size) {
      addLast(value);
    } else {
      Node<T>? current = _head;
      for (int i = 0; i < index - 1; i++) {
        current = current?.next;
      }
      final newNode = Node(value, current?.next);
      current?.next = newNode;
      _size++;
    }
  }

  // remove first
  bool removeFirst() {
    if (isEmpty) return false;
    if (_head == _tail) {
      _head = _tail = null;
    } else {
      final nextNode = _head!.next;
      _head!.next = null;
      _head = nextNode;
    }
    _size--;
    return true;
  }

  // remove last
  bool removeLast() {
    if (isEmpty) return false;
    if (_head == _tail) {
      _head = _tail = null;
    } else {
      Node<T>? current = _head;
      for (var i = 0; i < _size - 2; i++) {
        current = current?.next;
      }
      current?.next = null;
      _tail = current;
    }
    _size--;
    return true;
  }
  // remove at

  bool removeAt(int index) {
    if (index < 0 || index >= _size) throw RangeError('Invalid index: $index');
    if (index == 0) {
      return removeFirst();
    } else if (index == _size - 1) {
      return removeLast();
    } else {
      // index = 2
      // [1:next]-> [2:next]-> [3:next]-> [4:next]-> null
      //    0           1         2          3
      //                ^
      Node<T>? current = _head;
      for (var i = 0; i < index - 1; i++) {
        current = current?.next;
      }
      final nodeRemove = current?.next;

      current?.next = nodeRemove?.next;
      nodeRemove?.next = null;
      _size--;
      return true;
    }
  }

  // contains

  // length
  int get length => _size;

  // first
  T? get first => isEmpty ? null : _head?.value;
  // last
  T? get last => isEmpty ? null : _tail?.value;
  // isEmpty
  bool get isEmpty => _size == 0;
  // isNotEmpty
  bool get isNotEmpty => !isEmpty;

  // clear
  void clear() {
    while (!isEmpty) {
      removeFirst();
    }
  }

  // toString
  @override
  String toString() {
    final buffer = StringBuffer();
    buffer.write('[');
    Node<T>? current = _head;
    while (current != null) {
      buffer.write(current.value);
      if (current.next != null) buffer.write(', ');
      current = current.next;
    }
    buffer.write(']');
    return buffer.toString();
  }
}

void main() {
  final list = LinkedList<int>();
  list.addAll([1, 2, 3, 4, 5]);
  print(list); // [1, 2, 3, 4, 5]

  list.removeAt(2); // Remove 3
  print(list); // [1, 2, 4, 5]

  list.addAt(1, 100);
  print(list); // [1, 100, 2, 4, 5]

  list.removeFirst();
  list.removeLast();
  print(list); // [100, 2, 4]

  list.clear();
  print(list); // []
}
