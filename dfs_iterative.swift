import Foundation

class Graph {
    private var vertices: Int
    private var adjacencyList: [[Int]]

    init(vertices: Int) {
        self.vertices = vertices
        adjacencyList = Array(repeating: [], count: vertices) // Initialize adjacency list
    }

    // Method to add an edge to the graph
    func addEdge(source: Int, destination: Int) {
        adjacencyList[source].append(destination)
        adjacencyList[destination].append(source) // For an undirected graph
    }

    // Method to perform DFS using a stack
    func DFS(startVertex: Int) {
        var visited = [Bool](repeating: false, count: vertices) // Track visited nodes
        var stack = [Int]() // Stack for traversal

        stack.append(startVertex) // Start with the given vertex
        visited[startVertex] = true

        while !stack.isEmpty {
            let current = stack.removeLast() // Pop a vertex from the stack
            print(current, terminator: " ") // Process the current node

            // Push all unvisited neighbors onto the stack
            for neighbor in adjacencyList[current] where !visited[neighbor] {
                stack.append(neighbor)
                visited[neighbor] = true // Mark it as visited
            }
        }
    }
}

// Testing the Graph and DFS implementation
let graph = Graph(vertices: 5)

graph.addEdge(source: 0, destination: 1)
graph.addEdge(source: 0, destination: 2)
graph.addEdge(source: 0, destination: 3)
graph.addEdge(source: 1, destination: 2)
graph.addEdge(source: 2, destination: 4)

print("DFS Traversal starting from vertex 0: ", terminator: "")
graph.DFS(startVertex: 0)
