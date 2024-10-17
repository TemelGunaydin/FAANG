//Swift has got no queue so we used array
class Solution {
  private var size : Int
  private var queue : [Int]
  private var sum : Int

  init(_ size: Int) {
    self.size = size
    self.queue = []
    self.sum = 0
  }

  func next(_ val: Int) -> Double {
    queue.append(val) //this is array operation
    sum += val

    if queue.count > size {
      var old = queue.removeFirst() // this is array operation
      sum = sum - old
    }

    return Double(sum) / Double(min(queue.count,size))

  }
}
