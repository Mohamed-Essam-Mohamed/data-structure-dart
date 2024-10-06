const int sizeQueue = 10;

class QueueI {
  late int _front;
  late int _rear;
  late List<String> _storage;
  QueueI() {
    _storage = List.filled(sizeQueue, '0');
    _front = 0;
    _rear = sizeQueue - 1;
  }

  bool isFull() => _storage.length == sizeQueue;

  bool isEmpty() => _storage.isEmpty;

  void addQueue(String element) {
    if (isFull()) {
      print("the Queue is Full");
    } else {
      _rear = (_rear + 1) % sizeQueue;
      _storage[_rear] = element;
    }
  }

  void deleteQueue() {
    if (isEmpty()) {
      print("Queue is Empty");
    } else {
      _storage.removeAt(_front);
      _front = (_front + 1) % sizeQueue;
      // print("test");
      // print(_storage);
    }
  }

  void printQueue() {
    if (isEmpty()) {
      print("can't print queue is empty");
    } else {
      for (int i = _front; i != _rear; i = (i + 1) % sizeQueue) {
        print(_storage[_front]);
      }
    }
  }
}

void main() {
  QueueI queue = QueueI();
  queue.addQueue('a');
  queue.addQueue('b');
  queue.addQueue('c');
  queue.addQueue('d');
  queue.addQueue('e');
  queue.addQueue('i');
  queue.addQueue('f');
  queue.addQueue('g');
  queue.addQueue('k');
  queue.addQueue('l');
  queue.printQueue();
}
