class Stack<T> {
  Stack([List<T>? initialData]) : _data = initialData ?? <T>[];
  final List<T> _data;
  // push
  void push(T element) => _data.add(element);
  // pop
  T pop() {
    if (_data.isEmpty) throw RangeError('Invalid value: Valid value range is empty: 0');
    return _data.removeLast();
  }

  // peek
  T peek() {
    if (_data.isEmpty) throw Exception('Empty Stack values');
    return _data.last;
  }

  // print as a value
  List<T> get values => List.unmodifiable(_data);

  int get length => _data.length;
  bool get isEmpty => _data.isEmpty;
  bool get isNotEmpty => _data.isNotEmpty;
}
