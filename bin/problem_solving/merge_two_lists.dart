class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
  @override
  String toString() => "$val ->";
}

class Solution {
  Solution()
      : _tail = null,
        _head = null;
  ListNode? _head;
  ListNode? _tail;

  ListNode? mergeTwoLists(ListNode? list1, ListNode? list2) {
    if (list1 == null && list2 == null) return null;
    if (list1 != null && list2 == null) return list1;
    if (list2 != null && list1 == null) return list2;

    while (list1 != null && list2 != null) {
      // l1 [1, 2, 4]
      // l2 [1, 3, 4]
      // [1, 1, ]
      if (list1.val <= list2.val) {
        _link(list1);
        list1 = list1.next;
      } else {
        _link(list2);
        list2 = list2.next;
      }
    }
    if (list1 != null) _link(list1);
    if (list2 != null) _link(list2);
    return _head;
  }

  void _link(ListNode node) {
    if (_head == null && _tail == null) {
      _head = _tail = node;
    } else {
      _tail!.next = node;
      _tail = node;
    }
  }
}

void main() {
  Solution solution = Solution();
  final l1 = ListNode(1, ListNode(2, ListNode(4)));
  final l2 = ListNode(1, ListNode(3, ListNode(4)));

  print(solution.mergeTwoLists(l1, l2));
}
