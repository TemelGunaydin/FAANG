class Solution {
    func nextPermutation(_ nums: inout [Int]) {
        let n = nums.count
        var pivot = -1
        
        // Step 1: Find the pivot
        for i in stride(from: n - 2, through: 0, by: -1) {
            if nums[i] < nums[i + 1] {
                pivot = i
                break
            }
        }
        
        if pivot != -1 {
            // Step 2: Find the successor
            for j in stride(from: n - 1, through: pivot + 1, by: -1) {
                if nums[j] > nums[pivot] {
                    // Step 3: Swap pivot and successor
                    nums.swapAt(pivot, j)
                    break
                }
            }
        }
        
        // Step 4: Reverse the sequence after pivot position
        var left = pivot + 1
        var right = n - 1
        while left < right {
            nums.swapAt(left, right)
            left += 1
            right -= 1
        }
    }
}
