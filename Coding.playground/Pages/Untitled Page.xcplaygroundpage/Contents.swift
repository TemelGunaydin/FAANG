

class Solution {
    func topoSort(V:Int, adj: [[Int]]) -> [Int]{
        var indegree = [Int](repeating:0, count:V)
        
        
        //Her bir node karsiliginda yer alan dizi elemanlarina gidip sayisini 1 arttiriyoruz. Kendilerine gelen node sayisini tespit ediyoruz
        for i in 0..<V {
            for val in adj[i] {
                indegree[val] += 1
            }
        }
        
        
        //indegree degeri 0 olan node lari  queue icine atiyoruz.
        var q: [Int] = []
        for j in 0..<V {
            if indegree[j] == 0 {
                q.append(j)
            }
        }
        
        //Simdi queue empty olana kadar..
        var topo: [Int] = []
        while !q.isEmpty {
            var node = q.removeFirst()
            topo.append(node)
            
            for val in adj[node] {
                indegree[val] -= 1
                if indegree[val] == 0 {
                    q.append(val)
                }
            }
        }
        
        return topo
        
    }
}

var sol = Solution()

//Alt taraf bize DAG(directed acyclic graph) implement ediyor
let adj: [[Int]] = [[],[],[3],[1],[0,1],[0,2]]
let V = 6
let result = sol.topoSort(V: V, adj: adj)
print(result)


class Solution2 {
    func alienDict(list:[String]) -> String {
        
        return ""
    }
}



//DFS using stack for graphs
//Iterative approach
class Graph {
    private var vertices: Int
    private var adjList: [[Int]]
    
    init(vertices:Int) {
        self.vertices = vertices
        self.adjList = Array(repeating:[],count:vertices)// [[]]
    }
    
    func addEdge(source:Int, destination:Int) {
        adjList[source].append(destination)
        adjList[destination].append(source)
    }
    
    func dfs(startVertex: Int) {
        var visited = [Bool](repeating:false, count:vertices)
        var stack = [Int]()
        
        stack.append(startVertex)
        
        while !stack.isEmpty {
            let current = stack.removeLast()
            if !visited[current] {
                visited[current] = true
                print(current, terminator: " ") //process the current node, meaning print to screen
            }
            for neighbor in adjList[current] {
                if !visited[neighbor] {
                    stack.append(neighbor)
                }
            }
        }
    }
    
}


let graph = Graph(vertices: 5)
graph.addEdge(source:0, destination: 1)
graph.addEdge(source:0, destination:2)
graph.addEdge(source:0, destination: 3)
graph.addEdge(source: 1, destination: 2)
graph.addEdge(source: 2, destination: 4)

print("DFS traversal of a unidirected graph from vertex 0: ", terminator:"")
graph.dfs(startVertex: 0)


let seperator = String(repeating:"*",count: 100)
print(seperator)

//DFS using stack for graphs
//Recursive approach
class Graph2 {
    private var vertices: Int
    private var adjList: [[Int]]
    
    init(vertices:Int) {
        self.vertices = vertices
        self.adjList = Array(repeating:[],count:vertices)// [[]]
    }
    
    func addEdge(source:Int, destination:Int) {
        adjList[source].append(destination)
        adjList[destination].append(source)
    }
    
    func dfsGraph(startVertex:Int) {
        var visited = [Bool](repeating:false,count:vertices) //Create the array for visited and initialize
        print("DFS Recursive Traversal")
        dfs(startVertex,&visited) //send the startVertex and the array
    }
    
    private func dfs(_ currentVertex: Int, _ visited: inout [Bool]) {
        visited[currentVertex] = true
        print(currentVertex,terminator: " ")
        
        for neighbor in adjList[currentVertex] {
            if !visited[neighbor] {
                dfs(neighbor,&visited)
            }
        }
    }
    
   
}


let graph2 = Graph2(vertices: 5)
graph2.addEdge(source:0, destination: 1)
graph2.addEdge(source:0, destination:2)
graph2.addEdge(source:0, destination: 3)
graph2.addEdge(source: 1, destination: 2)
graph2.addEdge(source: 2, destination: 4)

print("DFS traversal of a undirected graph from vertex 0: ", terminator:"")
graph2.dfsGraph(startVertex: 0)


