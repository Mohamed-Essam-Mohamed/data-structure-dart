import 'dart:developer';

class Node<T> {
  T data;
  Node<T>? next;

  Node(this.data, this.next);
}

class LinkedListNew<T> {
  Node<T>? head;
  Node<T>? tail;
  late int size;
  LinkedListNew() {
    head = null;
    tail = null;
    size = 0;
  }
  void insertFirst(T data) {
    Node<T> newNode = Node(data, head);
    if (size == 0) {
      head = newNode;
      tail = newNode;
    } else {
      head = newNode;
    }
    size++;
  }

  void insertLast(T data) {
    Node<T> newNode = Node(data, null);
    if (size == 0) {
      head = newNode;
      tail = newNode;
    } else {
      tail!.next = newNode;
      tail = newNode;
    }
    size++;
  }

  void insertAt(int index, T data) {
    Node<T> newNode = Node(data, null);
    if (index == 0) {
      insertFirst(data);
    } else if (index == size) {
      insertLast(data);
    } else {
      Node<T> current = head!;
      for (int i = 1; i < index; i++) {
        current = current.next!;
      }
      newNode.next = current.next;
      current.next = newNode;
      size++;
    }
  }

  void removeFirst() {
    if (size == 0) return;
    head = head!.next;
    size--;
  }

  void removeLast() {
    if (size == 0) return;
    if (size == 1) {
      head = null;
      tail = null;
    } else {
      Node<T> current = head!;
      for (int i = 1; i < size - 1; i++) {
        current = current.next!;
      }
      current.next = null;
      tail = current;
    }
    size--;
  }

  void removeAt(int index) {
    if (index < 0 || index >= size) return;
    if (index == 0) {
      head = head!.next;
    } else {
      Node<T> current = head!;
      for (int i = 1; i < index - 1; i++) {
        current = current.next!;
      }
      current.next = current.next!.next;
    }
    size--;
  }

  void printList() {
    Node<T>? current = head;
    while (current != null) {
      print(current.data);
      current = current.next;
    }
  }
}

void main() {
  LinkedListNew<int> list = LinkedListNew();
  list.insertFirst(1);
  list.insertFirst(2);
  list.insertFirst(3);
  list.insertFirst(4);
  list.insertFirst(5);
  list.insertFirst(6);
  list.printList();

  list.removeLast();
  print(list);
  list.printList();
}
