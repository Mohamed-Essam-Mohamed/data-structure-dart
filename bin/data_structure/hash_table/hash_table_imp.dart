class HashNode<K, V> {
  K key;
  V value;
  HashNode<K, V>? next;

  HashNode(this.key, this.value);
}

class HashTable<K, V> {
  final int _capacity;
  late List<HashNode<K, V>?> _buckets;

  HashTable({int capacity = 10}) : _capacity = capacity {
    _buckets = List<HashNode<K, V>?>.filled(capacity, null);
  }

  int _hash(K key) {
    return key.hashCode % _capacity;
  }

  /// insert or update
  void put(K key, V value) {
    int index = _hash(key);
    HashNode<K, V>? head = _buckets[index];

    // update if exists
    while (head != null) {
      if (head.key == key) {
        head.value = value;
        return;
      }
      head = head.next;
    }

    // insert new node at head
    HashNode<K, V> newNode = HashNode(key, value);
    newNode.next = _buckets[index];
    _buckets[index] = newNode;
  }

  /// get value by key
  V? get(K key) {
    int index = _hash(key);
    HashNode<K, V>? head = _buckets[index];

    while (head != null) {
      if (head.key == key) {
        return head.value;
      }
      head = head.next;
    }
    return null; // not found
  }

  /// remove by key
  V? remove(K key) {
    int index = _hash(key);
    HashNode<K, V>? head = _buckets[index];
    HashNode<K, V>? prev;

    while (head != null) {
      if (head.key == key) {
        if (prev != null) {
          prev.next = head.next;
        } else {
          _buckets[index] = head.next;
        }
        return head.value;
      }
      prev = head;
      head = head.next;
    }
    return null; // not found
  }

  /// print for debug
  void display() {
    for (int i = 0; i < _capacity; i++) {
      HashNode<K, V>? head = _buckets[i];
      if (head != null) {
        String chain = '';
        while (head != null) {
          chain += "(${head.key}: ${head.value}) -> ";
          head = head.next;
        }
        print("Bucket $i: $chain");
      }
    }
  }
}
