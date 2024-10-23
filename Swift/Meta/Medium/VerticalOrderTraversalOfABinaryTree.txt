class Solution {
  func verticalOrderBinaryTree(_ root: TreeNode?) ->[[Int]]{
    guard let root  else { return }

    var columnTable : [Int:[Int]] = [:]
    var queue : [(node: TreeNode,column: Int)] = [(root,0)]

    var minColumn = 0 
    var maxColumn = 0

    while !queue.isEmpty {
      var (node,column) = queue.removeFirst()

      if columnTable[column] == nil {
        columnTable[column] = []
      }

      columnTable[column]?.append(node.val)
      minColumn = min(minColumn,column)
      maxColumn = max(maxColumn,column)

      if let leftNode = node.left {
        queue.append((leftNode,column - 1))
      }

      if let rightNode = node.right {
        queue.append((rightNode,column + 1))
      }

    }

    var result : [[Int]] = []
    
    for column in minColumn...maxColumns { 
      if let nodes = columnTable[column] {
        result.append(result)
      }
    }

    return result
  }
}
