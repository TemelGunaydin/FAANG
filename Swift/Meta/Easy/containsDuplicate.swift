class Solution {
    func containsDuplicate(nums: [Int]) -> Bool {
        var uniqueSet = Set<Int>()

        for num in nums {
            if uniqueSet.contains(num) {
                return true
            }
            uniqueSet.insert(num)
        }

        return false
    }

    // Below creates an array of unique elements. Above function return true if it contains a duplicate element

    /*
     How It Works:
     	•	filter iterates through each element of the array (numbers).
     	•	For each element (number), it checks if the index of its first occurrence is equal to the index of its last occurrence.
     	•	If an element appears only once in the array, then the firstIndex and lastIndex of that element will be the same.
     	•	If an element appears multiple times, these indices will be different.
     */

    func filterSolution() {
        let numbers = [1, 2, 3, 1]
        let uniqueNumbers = numbers.filter { number in
            numbers.firstIndex(of: number) == numbers.lastIndex(of: number)
        }
    }
}
