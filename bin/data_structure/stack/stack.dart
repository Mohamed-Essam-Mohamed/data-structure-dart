class StackI<T> {
  StackI() : _storage = <T>[];
  final List<T> _storage;
  @override
  String toString() {
    return '--- Top ---\n'
        '${_storage.reversed.join('\n')}'
        '\n-----------';
  }

  bool isEmpty() => _storage.isEmpty;
  void push(T element) => _storage.add(element);
  T pop() {
    if (isEmpty()) {
      return throw ("is Empty stack can't pop");
    } else {
      return _storage.removeLast();
    }
  }

  T peek() => _storage.last;
}
