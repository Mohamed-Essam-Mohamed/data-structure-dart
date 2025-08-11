import 'dart:collection';

final class User extends LinkedListEntry<User> {
  final int id;
  final String name;
  User(this.id, this.name);

  @override
  String toString() => '$id : $name';
}

// void main() {
//   final linkedList = LinkedList<User>();
// //   linkedList.addAll([User(1, 'A'), User(2, 'B'), User(3, 'C')]);
// //   print(linkedList.first); // 1 : A
// //   print(linkedList.last); // 3 : C

// //   // Add new item after first item.
// //   linkedList.first.insertAfter(User(15, 'E'));
// //   // Add new item before last item.
// //   linkedList.last.insertBefore(User(10, 'D'));
// //   // Iterate items.
// //   for (var entry in linkedList) {
// //     print(entry);
// //     // 1 : A
// //     // 15 : E
// //     // 2 : B
// //     // 10 : D
// //     // 3 : C
// //   }

// //   // Remove item using index from list.
// //   linkedList.elementAt(2).unlink();
// //   print(linkedList); // (1 : A, 15 : E, 10 : D, 3 : C)
// //   // Remove first item.
// //   linkedList.first.unlink();
// //   print(linkedList); // (15 : E, 10 : D, 3 : C)
// //   // Remove last item from list.
// //   linkedList.remove(linkedList.last);
// //   print(linkedList); // (15 : E, 10 : D)
// //   // Remove all items.
// //   linkedList.clear();
// //   print(linkedList.length); // 0
// //   print(linkedList.isEmpty); // true
//   User mohamed = User(1, 'Mohamed');
//   print(mohamed);
// }

void main() {
  int num = 12;
  print(num.bitLength);
}
