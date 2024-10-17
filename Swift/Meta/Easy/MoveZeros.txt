class Solution {
    func moveZeroes(_ nums: inout [Int]) {
      var lastZeroIndex = 0
      
      for i in 0..<nums.count { 
        if nums[i] != 0 {
          nums.swapAt(i,lastZeroIndex)
          lastZeroIndex += 1
        }
      }
        
    }
}
