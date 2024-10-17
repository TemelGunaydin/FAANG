class Solution {
  func arrayRankTransform(_ arr:[Int]) -> [Int] {
    
    let uniqueArray = Set(arr)
    let sortedArray = Array(uniqueArray).sorted()

    var rankDictionary = [Int:Int]()
    for (index,value) in sortedArray.enumerated() {
      rankDictionary[value] = index +  1
    }
    return arr.map { rankDictionary[$0]! }
  }
}
