class Solution {
  func missingRanges(_ nums,lower,upper) -> [[Int] {
    var result : [[Int]] = []
    
    if nums.count == 0 {
      return [[lower,upper]]
    }

    //1 check for the start
    if lower > nums[0] {
      result.append([lower,nums[0] - 1])
    }

    //2 check for in between
    for i in 0..<nums.count - 1 {
      if nums[i+1] - nums[i] <=1 {
        continue
      } 

      result.append([nums[i] + 1,nums[i+1] - 1])

      if upper > nums[nums.count-1] {
        result.append([nums[nums.count],upper])
      }

    }
    return result
  } 
}

//Time Complexity: ( O(N) )

//The algorithm iterates through the given list of ( N ) elements once. Each iteration involves constant-time operations. Therefore, the overall time complexity is linear, ( O(N) ).

//Space Complexity: ( O(M) )

//The space complexity is determined by the number of missing ranges stored in the result list. In the worst case, this could be proportional to the difference between upper and lower bounds. If ( M ) represents the number of missing ranges, the space complexity is ( O(M) ).
