import 'dart:ffi';

class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

class Solution {
  ListNode? reverseKGroup(ListNode? head, int k) {
    /// k = 2
    /// dummyHead = [0 -> 1 -> 2 -> 3 -> 4 -> 5]
    /// step 1
    ///                   d
    ListNode? dummyHead = ListNode(0, head);
    ListNode? dummy = dummyHead.next;
  }

  ListNode? _reverse(ListNode? head) {
    ListNode? curr, prev;
    while (head != null) {
      curr = head;
      head = head.next;
      curr.next = prev;
      prev = curr;
    }
    return prev;
  }

  ListNode? _separate(ListNode? head, int k) {
    ListNode? dummyPointer = head;
    while (k > 1) {
      dummyPointer = dummyPointer?.next;
      --k;
    }
    dummyPointer?.next = null;
    return head;
  }
}

void main() {
  final head = ListNode(0, ListNode(33, ListNode(34, ListNode(4, ListNode(5)))));
  int k = 2;
  ListNode? res = Solution()._separate(head, k);

//   ListNode? reversed = Solution()._reverse(res);

  while (res != null) {
    print(res.val);
    res = res.next;
  }
}
