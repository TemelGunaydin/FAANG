class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?

    init(_ val: Int, _ left: TreeNode? = nil, _ right: TreeNode? = nil) {
        self.val = val
        self.left = left
        self.right = right
    }
}

class Solution {
    func levelOrderTraversal(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else { return [] }

        var result = [[Int]]()
        var queue: [TreeNode] = [root]

        while !queue.isEmpty {
            var level: [Int] = []
            let count = queue.count

            for _ in 0 ..< count {
                let node = queue.removeFirst()
                level.append(node.val)
                if let left = node.left {
                    queue.append(left)
                }
                if let right = node.right {
                    queue.append(right)
                }
            }

            result.append(level)
        }
        return result
    }
}

//         1
//     2      3
//
// 3      4      6
let root = TreeNode(1) // root
root.left = TreeNode(2, TreeNode(3), TreeNode(4))
root.right = TreeNode(3, nil, TreeNode(6))

let traversal = Solution()
let result = traversal.levelOrderTraversal(root)
print(result)
