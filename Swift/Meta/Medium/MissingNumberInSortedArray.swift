class Solution {
    func findMissingElement(_ arr: [Int], _ k: Int) -> Int {
        let n = arr.count
        var left = 0
        var right = n - 1

        // Perform binary search
        while left < right {
            let mid = right - (right - left) / 2
            if arr[mid] - arr[0] - mid < k {
                left = mid
            } else {
                right = mid - 1
            }
        }

        return arr[0] + k + left
    }
}

let solution = Solution()
print(solution.findMissingElement([2, 3, 4, 7, 11], 4)) // 9
