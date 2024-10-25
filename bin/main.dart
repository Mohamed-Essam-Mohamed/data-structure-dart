// // List<int> numbers = [38, 27, 43, 3, 9, 82, 10];
// void mergeSort(List<int> list, int left, int right) {
//   if (left < right) {
//     int mid = (left + right) ~/ 2;
//     mergeSort(list, left, mid);
//     mergeSort(list, mid + 1, right);
//     merge(list, left, mid, right);
//   }
// }

// void merge(List<int> list, int left, int mid, int right) {
//   int n1 = mid - left + 1;
//   int n2 = right - mid;

//   List<int> leftArray = List.filled(n1, 0);
//   List<int> rightArray = List.filled(n2, 0);

//   for (int i = 0; i < n1; i++) {
//     leftArray[i] = list[left + i];
//   }
//   for (int i = 0; i < n2; i++) {
//     rightArray[i] = list[mid + 1 + i];
//   }

//   int i = 0, j = 0, k = left;

//   while (i < n1 && j < n2) {
//     if (leftArray[i] <= rightArray[j]) {
//       list[k] = leftArray[i];
//       i++;
//     } else {
//       list[k] = rightArray[j];
//       j++;
//     }
//     k++;
//   }

//   while (i < n1) {
//     list[k] = leftArray[i];
//     i++;
//     k++;
//   }

//   while (j < n2) {
//     list[k] = rightArray[j];
//     j++;
//     k++;
//   }
// }

// void main() {
//   // List<int> numbers = [38, 27, 43, 3, 9, 82, 10];
//   // mergeSort(numbers, 0, numbers.length - 1);
//   // print(numbers); // Output: [3, 9, 10, 27, 38, 43, 82]
//   print(function(4));
// }

// int function(int num) {
//   if (num < 2) {
//     return num;
//   }
//   return function(num - 1) + function(num - 2);
// }

// class Teacher {
//   String name;

//   Teacher(this.name);

//   void teach(Student student) {
//     print('$name is teaching ${student.name}');
//   }
// }

// class Student {
//   String name;

//   Student(this.name);
// }

// // void main() {
// //   Teacher teacher = Teacher('Mr. Ahmed');
// //   Student student = Student('Ali');

// //
// //   teacher.teach(student); // Mr. Ahmed is teaching Ali
// // }
// class Employee {
//   String name;
//   int hoursWorked;

//   Employee(this.name, this.hoursWorked);
//   int calculateSalary() {
//     return hoursWorked * 200;
//   }
// }

// class FullTimeEmployee extends Employee {
//   FullTimeEmployee(super.name, super.hoursWorked);
//   @override
//   int calculateSalary() {
//     return super.hoursWorked * 500;
//   }
// }

// class PartTimeEmployee extends Employee {
//   PartTimeEmployee(super.name, super.hoursWorked);
//   @override
//   int calculateSalary() {
//     return super.hoursWorked * 300;
//   }
// }
import 'dart:developer';

void main() {
  print(
      "Determining the \"best\" team formation requires considering multiple factors and weighing their importance.  Based solely on the provided data (win/loss record and score), the 3-4-1-2 formation (id_match 97) performed best, achieving a 4-0 victory with a high score.\n\nHowever, a deeper analysis reveals a more nuanced picture. While the 3-4-1-2 formation resulted in the highest score and win, it's important to note that we only have a single match using this formation.  To make a truly informed decision about the best formation, we need more data points for each formation.\n\nOther formations (4-2-3-1 and 4-3-3) also show strong performance with wins and positive goal differences, but more data is needed to confidently declare one as definitively \"best.\"  The data also doesn't include contextual information about the opponents faced in");
}
