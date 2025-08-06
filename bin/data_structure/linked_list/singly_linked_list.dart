class Node<T> {
  T data;
  Node<T>? next;

  Node(this.data, this.next);
}

class SinglyLinkedList<T> {
  Node<T>? head;
  Node<T>? tail;
  late int length;

  SinglyLinkedList() {
    head = null;
    tail = null;
    length = 0;
  }
  bool isEmpty() => head == null && tail == null;
  bool isNotEmpty() => !isEmpty();
  void add(T element) {
    Node<T> newElement = Node(element, null);
    if (isEmpty()) {
      head = newElement;
    } else {
      Node<T> current = head!;
      while (current.next != null) {
        current = current.next!;
      }
      current.next = newElement;
    }
  }

  void remove(T data) {
    if (head == null) {
      return;
    }

    if (head?.data == data) {
      head = head?.next;
      return;
    }

    Node<T>? current = head;
    while (current?.next != null) {
      if (current?.next?.data == data) {
        current?.next = current.next?.next;
        return;
      }
      current = current?.next;
    }
  }

  void printLinkedList() {
    if (isEmpty()) {
      print("the Linked List is Empty");
    } else {
      Node<T>? current = head!;
      while (current != null) {
        print(current.data);
        current = current.next;
      }
    }
  }
}
