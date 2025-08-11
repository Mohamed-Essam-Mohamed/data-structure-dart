class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

class Solution {
  Solution();

  ListNode? removeNthFromEnd(ListNode? head, int n) {
    int length = 0;
    var dummy = ListNode(0, head);
    var helper = dummy;

    while (helper.next != null) {
      length++;
      helper = helper.next!;
    }

    int numOfSteps = length - n;
    helper = dummy;
    for (var i = 1; i < numOfSteps; i++) {
      helper = helper.next!;
    }
    helper.next = helper.next?.next;
    return dummy.next;
  }
}

void main() {
  Solution solution = Solution();
  final l1 = ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5)))));

  print(solution.removeNthFromEnd(l1, 3));
}
