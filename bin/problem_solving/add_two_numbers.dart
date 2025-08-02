// class Solution {
//   List<List<int>> permute(List<int> nums) {
//     if(nums.isEmpty) return [nums];
//     if(nums.length == 1) return [nums];

//   }
// }

// List<List<int>> permute(List<int> nums) {
//   List<List<int>> results = [];

//   void backtrack(int start) {
//     if (start == nums.length) {
//       results.add(List.from(nums)); // Add a copy of nums to results
//       return;
//     }
    
//     for (int i = start; i < nums.length; i++) {
//       // Swap the current element with the start
//       int temp = nums[start];
//       nums[start] = nums[i];
//       nums[i] = temp;

//       // Recurse on the rest of the array
//       backtrack(start + 1);

//       // Backtrack to restore the original array
//       temp = nums[start];
//       nums[start] = nums[i];
//       nums[i] = temp;
//     }
//   }

//   backtrack(0);
//   return results;
// }