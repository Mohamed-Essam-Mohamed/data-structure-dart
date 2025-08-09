class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);

  @override
  String toString() => '$val -> $next';
}

class Solution {
  Solution()
      : _tail = null,
        _head = null;
  ListNode? _head;
  ListNode? _tail;
  ListNode? addTwoNumbers(ListNode? l1, ListNode? l2) {
    if (l1 == null && l2 == null) return null;

    int curry = 0;
    while (l1 != null || l2 != null || curry != 0) {
      int valueNode = (l1?.val ?? 0) + (l2?.val ?? 0) + curry;
      curry = valueNode ~/ 10;
      valueNode %= 10;
      _add(valueNode);

      l1 = l1?.next;
      l2 = l2?.next;
    }
    return _head;
  }

  void _add(int value) {
    if (_head == null && _tail == null) {
      _head = _tail = ListNode(value);
    } else {
      final newNode = ListNode(value, null);
      _tail?.next = newNode;
      _tail = newNode;
    }
  }
}

void main() {
  Solution solution = Solution();
  final l1 = ListNode(2, ListNode(4, ListNode(3)));
  final l2 = ListNode(5, ListNode(6, ListNode(4)));

  print(solution.addTwoNumbers(l1, l2));
}
