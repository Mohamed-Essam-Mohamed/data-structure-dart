// ignore_for_file: public_member_api_docs, sort_constructors_first
class ListNode extends Iterable {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);

  @override
  String toString() => 'ListNode(val: $val)';

  @override
  Iterator get iterator => ListNode(val, next).iterator;
}

class Solution {
  Solution()
      : p1 = null,
        p2 = null;
  ListNode? p1;
  ListNode? p2;
  ListNode? swapPairs(ListNode? head) {
    /// dummyHead = [0]-> [1]-> [2]-> [3]-> [4]
    ///                    p1    p2
    ///                    d
    ListNode dummyHead = ListNode(0, head);
    ListNode? dummy = dummyHead;

    while (dummy?.next != null && dummy?.next?.next != null) {
      p1 = dummy?.next;
      p2 = dummy?.next?.next;

      p1?.next = p2?.next;
      p2?.next = p1;

      dummy = p2;
    }
    return dummyHead.next;
  }
}

void main() {
  Solution solution = Solution();
  final l1 = ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5)))));

  print(solution.swapPairs(l1));
  ListNode? res = solution.swapPairs(l1);
}
