class Solution {
    func findDiameter(_ root: TreeNode?) -> Int {
        var diameter = 0

        func depth(_ currentNode: TreeNode?) -> Int {
            guard let currentNode = currentNode else {
                return 0
            }

            let leftDepth = depth(currentNode.left)
            let rightDepth = depth(currentNode.right)

            diameter = max(diameter, leftDepth + rightDepth)

            return max(leftDepth, rightDepth) + 1
        }

        let _ = depth(root)
        return diameter
    }
}
