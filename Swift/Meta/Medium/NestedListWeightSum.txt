class Solution {
  class NestedList { 
    var integer: Int?
    var nestedList: [NestedList]?
    
    func isInteger() -> Bool {
      return integer != nil
    }

    func getInteger() -> Int? { 
      return integer
    }

    func getList() -> [NestedList]? {
      return nestedList
    }
  }

  func deptSum(_ nestedList: [NestedList],depth: Int = 1) -> Int { 
    var sum = 0

    for i in nestedList { 
      if i.isInteger() {
        if let value = i.getInteger() {
          sum += value * depth
        }
      } else if let list = i.getList() {
          sum += deptSum(list,depth: depth + 1)
        }
      }
      return sum
    }
    
}
