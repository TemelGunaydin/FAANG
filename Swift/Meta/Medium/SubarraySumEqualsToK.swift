class Solution {
    func subarraySum(_ nums: [Int], _ k: Int) -> Int {
      var sumFreq : [Int:Int] = [0:1]
      var cumSum = 0
      var count = 0 

      for num in nums { 
        cumSum += num

        if let frequency = sumFreq[cumSum - k] { 
          count += frequency
          
        }

        sumFreq[cumSum,default:0] += 1
      }
      return count
        
    }
}
