import 'package:test/test.dart';

import '../../../bin/problem_solving/swap_nodes_by_k.dart';

void main() {
  group('test problem swap nodes by k', () {
    late Solution solution;
    setUpAll(() {
      solution = Solution();
    });
    test("Test separate have data in head", () {
      // arrange
      final head = ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5)))));
      int k = 2;

      // act
      // final act
      // assert
    });
  });
}
