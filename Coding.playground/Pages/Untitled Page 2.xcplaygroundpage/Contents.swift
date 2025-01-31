import Foundation

class Graph {
    private var vertices: Int
    private var adjacencyList: [[Int]]

    init(vertices: Int) {
        self.vertices = vertices
        self.adjacencyList = Array(repeating: [], count: vertices)
    }

    // Method to add an edge to the graph
    func addEdge(source: Int, destination: Int) {
        adjacencyList[source].append(destination)
        adjacencyList[destination].append(source) // For an undirected graph
    }

    // Method to perform DFS using recursion
    func DFS(startVertex: Int) {
        var visited = [Bool](repeating: false, count: vertices)
        print("DFS Traversal: ", terminator: "")
        DFSRecursive(startVertex, &visited)
    }

    private func DFSRecursive(_ currentVertex: Int, _ visited: inout [Bool]) {
        visited[currentVertex] = true
        print(currentVertex, terminator: " ") // Process the current node

        // Recur for all unvisited neighbors
        for neighbor in adjacencyList[currentVertex] {
            if !visited[neighbor] {
                DFSRecursive(neighbor, &visited)
            }
        }
    }
}

let graph = Graph(vertices: 5)
graph.addEdge(source: 0, destination: 1)
graph.addEdge(source: 0, destination: 2)
graph.addEdge(source: 0, destination: 3)
graph.addEdge(source: 1, destination: 2)
graph.addEdge(source: 2, destination: 4)

print("DFS Traversal starting from vertex 0: ", terminator: "")
graph.DFS(startVertex: 0)
print() // To ensure a new line after the traversal output


