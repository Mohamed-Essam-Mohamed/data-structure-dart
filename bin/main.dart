import 'dart:developer';

// void main() {
//   List<int> array = [1, 2, 3, 4, 5];
//   array.forEach((element) => print('the number $element is hashed ${element.hashCode}'));
//   List<User> users = [User('mohamed', 'mohamed@gmail'), User('esam', 'esam@gmail')];
//   users.forEach(
//       (element) => print('the user ${element.name} is hashed ${element.hashCode}'));
// }

// class User {
//   final String name;
//   final String email;
//   User(this.name, this.email);
// }

///       0 , 1 , 1 , 2 , 3 , 5 , 8
/// index:0 , 1 , 2 , 3 , 4 , 5 , 6
/// input index 6
/// output 8
///
/// init current Index = 0
/// base case if input currentIndex == index return
/// else
/// return fun(currentIndex - 1) + fun(currentIndex - 2)
///
///
/// base case index = 1
/// if index <= 1
///     return index
/// return fun(index - 1) + fun(index - 2)

// int fib(int index) {
//   if (index <= 1) { // const 1
//     return index;// const 1
//   }
//   return fib(index - 1) + fib(index - 2); //  n - 1 + n - 2

// }
/// Time Complexity
///
Map<int, int> memo = {};

int fib(int n) {
  if (n <= 1) return n; // 1
  if (memo.containsKey(n)) return memo[n]!; // 1
  memo[n] = fib(n - 1) + fib(n - 2); //
  return memo[n]!;
}

int binarySearch(List<int> arr, int target) {
  int low = 0;
  int high = arr.length - 1;

  while (low <= high) {
    int mid = (low + high) ~/ 2; // complexity 1
    if (arr[mid] == target) {
      return mid; // base case O(1)
    } else if (arr[mid] < target) {
      low = mid + 1; // complexity 1 in while loop
    } else {
      high = mid - 1; // complexity 1
    }
  }

  return -1;
}

void main() {
  print(fib(6));
}
