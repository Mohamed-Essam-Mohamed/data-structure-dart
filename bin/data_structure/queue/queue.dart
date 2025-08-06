class MyCircularQueue {
  MyCircularQueue(int k) {
    _queue = List.filled(k, 0);
    _front = 0;
    _rear = k - 1;
    _length = 0;
  }

  late List<int> _queue;
  late int _front;
  late int _rear;
  late int _length;

  bool enQueue(int value) {
    if (isFull()) return false;
    _rear = (_rear + 1) % _queue.length;
    _queue[_rear] = value;
    _length++;
    return true;
  }

  bool deQueue() {
    if (isEmpty()) return false;
    _front = (_front + 1) % _queue.length;
    _length--;
    return true;
  }

  int front() => isEmpty() ? -1 : _queue[_front];

  int rear() => isEmpty() ? -1 : _queue[_rear];

  bool isEmpty() => _length == 0;

  bool isFull() => _length == _queue.length;
}
