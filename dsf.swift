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

    func dfsGraph(_ startVertex: Int) {
        var visited = [Bool](repeating: false, count: vertices)
        dfs(startVertex, &visited)
    }

    private func dfs(_ currentVertex: Int, _ visited: inout [Bool]) {
        visited[currentVertex] = true
        print(currentVertex, terminator: " ")

        for neighbor in adjList[currentVertex] where !visited[neighbor] {
            dfs(neighbor, &visited)
        }
    }
}

let graph = Graph(5)
graph.addEdge(source: 0, destination: 1)
graph.addEdge(source: 0, destination: 2)
graph.addEdge(source: 0, destination: 3)
graph.addEdge(source: 1, destination: 2)
graph.addEdge(source: 2, destination: 4)

graph.dfsGraph(0)
