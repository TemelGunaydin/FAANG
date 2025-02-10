class Solution {
    func canJump(_ nums: [Int]) -> Bool {
        var maxIndex = 0
        for i in 0 ..< nums.count {
            if i > maxIndex {
                return false
            }

            maxIndex = max(maxIndex, i + nums[i])
            if maxIndex >= nums.count - 1 {
                return true
            }
        }
        return false
    }
}
