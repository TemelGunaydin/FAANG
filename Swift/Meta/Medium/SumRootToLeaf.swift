/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
//We are using Dfs here. Similar to pre order traversal
class Solution {
    func sumNumbers(_ root: TreeNode?) -> Int {
         return dfs(root,0);
        
    }

    func dfs(_ currentNode:TreeNode?, _ currentSum: Int) -> Int {
        guard let currentNode  else { return 0 }

        let newSum = currentSum * 10 + currentNode.val

        if currentNode.left == nil && currentNode.right == nil {
            return newSum
        }
        
        var left = dfs(currentNode.left,newSum)
        var right = dfs(currentNode.right,newSum)

        return left + right

    }
}
