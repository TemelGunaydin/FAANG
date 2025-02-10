class Graph {
    private var vertices: Int
    private var adjList: [[Int]]

    init(_ vertices: Int) {
        self.vertices = vertices
        adjList = Array(repeating: [], count: vertices)
    }

    func addEdge(source: Int, destination: Int) {
        adjList[source].append(destination)
        adjList[destination].append(source)
    }

    func bfs(_ startVertex: Int) {
        var visited = [Bool](repeating: false, count: vertices)
        var queue = [Int]()

        queue.append(startVertex)
        visited[startVertex] = true

        while !queue.isEmpty {
            let currentVertex = queue.removeFirst()
            print(currentVertex, terminator: " ")

            for neighbor in adjList[currentVertex] where !visited[neighbor] {
                queue.append(neighbor)
                visited[neighbor] = true
            }
        }
    }
}

let graph = Graph(6)
graph.addEdge(source: 0, destination: 1)
graph.addEdge(source: 0, destination: 2)
graph.addEdge(source: 1, destination: 3)
graph.addEdge(source: 2, destination: 3)
graph.addEdge(source: 3, destination: 4)
graph.addEdge(source: 4, destination: 5)
graph.bfs(0)
