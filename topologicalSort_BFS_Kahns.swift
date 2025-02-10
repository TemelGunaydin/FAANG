class Solution {
    func topoSort(_ V: Int, _ adj: [[Int]]) -> [Int] {
        var indegree = [Int](repeating: 0, count: V)
        for i in 0 ..< V {
            for neighbor in adj[i] {
                indegree[neighbor] += 1
            }
        }

        var result = [Int]()
        var queue = [Int]()

        for i in 0 ..< V {
            if indegree[i] == 0 {
                queue.append(i)
            }
        }

        while !queue.isEmpty {
            let node = queue.removeFirst()
            result.append(node)

            for neighbor in adj[node] {
                indegree[neighbor] -= 1

                if indegree[neighbor] == 0 {
                    queue.append(neighbor)
                }
            }
        }

        return result
    }
}

// Example usage
let adj: [[Int]] = [[], [], [3], [1], [0, 1], [0, 2]]
let V = 6
let solution = Solution()
let ans = solution.topoSort(V, adj)
print(ans)
