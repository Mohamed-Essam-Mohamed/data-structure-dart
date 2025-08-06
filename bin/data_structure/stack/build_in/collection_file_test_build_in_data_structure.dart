import 'dart:collection';

void main() {
  // final stack = ListQueue<int>.from(<int>[1, 2, 3, 4]);
  final queue = DoubleLinkedQueue<int>();
  queue.addLast(1);
  queue.addLast(2);
  queue.addLast(3);
  queue.addLast(4);
  queue.addLast(5);
  queue.addLast(6);
  queue.addLast(7);

  queue.removeFirst();

  print(queue);
}
