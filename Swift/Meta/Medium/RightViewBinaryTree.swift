class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { val = 0; left = nil; right = nil }
    public init(_ val: Int) { self.val = val; left = nil; right = nil }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

class Solution {
    func rightSideView(_ root: TreeNode?) -> [Int] {
        var result: [Int] = []
        guard let root = root else { return result }
        var queue: [TreeNode] = []
        queue.append(root)

        while !queue.isEmpty {
            let levelSize = queue.count
            var currentNode: TreeNode?

            for _ in 0 ..< levelSize {
                currentNode = queue.removeFirst()
                if let left = currentNode?.left {
                    queue.append(left)
                }
                if let right = currentNode?.right {
                    queue.append(right)
                }
            }

            if let currentNode = currentNode {
                result.append(currentNode.val)
            }
        }

        return result
    }
}
