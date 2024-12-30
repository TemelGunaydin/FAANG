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
    func BFS(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [] }

        var result = [Int]()
        var queue: [TreeNode] = [root]

        while !queue.isEmpty {
            let node = queue.removeFirst()
            result.append(node.val)

            if let left = node.left {
                queue.append(left)
            }
            if let right = node.right {
                queue.append(right)
            }
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
let result = traversal.BFS(root)
print(result) // Expected output = [1, 2, 3, 3, 4, 6]
