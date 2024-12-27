class Solution {
    func findMaxLength(_ nums: [Int]) -> Int {
        guard !nums.isEmpty else { return 0 }
        var prefixSum = 0
        var prefixSumIndex: [Int: Int] = [0: -1]
        var maxLength = 0

        for (i, num) in nums.enumerated() {
            prefixSum += (num == 0 ? -1 : 1)
            if let prevIndex = prefixSumIndex[prefixSum] {
                maxLength = max(maxLength, i - prevIndex)
            } else {
                prefixSumIndex[prefixSum] = i
            }
        }

        return maxLength
    }
}
