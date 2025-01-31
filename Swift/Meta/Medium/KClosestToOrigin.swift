class Solution {
    func kClosest(_ points: [[Int]], _ k: Int) -> [[Int]] {
          // Create a min heap to store points based on their distance from origin
        var minHeap = Heap<(Int, [Int])>(sort: { $0.0 < $1.0 })
        
        // Calculate distance and add points to heap
        for point in points {
            let distance = point[0] * point[0] + point[1] * point[1]  // Using distance formula without sqrt
            minHeap.insert((distance, point))
        }
        
        // Extract k closest points
        var result: [[Int]] = []
        for _ in 0..<k {
            if let closest = minHeap.remove() {
                result.append(closest.1)
            }
        }
        
        return result
    }
}



// Heap implementation
struct Heap<T> {
    var nodes = [T]()
    let sort: (T, T) -> Bool
    
    init(sort: @escaping (T, T) -> Bool) {
        self.sort = sort
    }
    
    mutating func insert(_ element: T) {
        nodes.append(element)
        siftUp(from: nodes.count - 1)
    }
    
    mutating func remove() -> T? {
        guard !nodes.isEmpty else { return nil }
        
        if nodes.count == 1 {
            return nodes.removeLast()
        }
        
        let result = nodes[0]
        nodes[0] = nodes.removeLast()
        siftDown(from: 0)
        
        return result
    }
    
    private mutating func siftUp(from index: Int) {
        var child = index
        var parent = parentIndex(of: child)
        
        while child > 0 && sort(nodes[child], nodes[parent]) {
            nodes.swapAt(child, parent)
            child = parent
            parent = parentIndex(of: child)
        }
    }
    
    private mutating func siftDown(from index: Int) {
        var parent = index
        
        while true {
            let leftChild = leftChildIndex(of: parent)
            let rightChild = rightChildIndex(of: parent)
            var candidate = parent
            
            if leftChild < nodes.count && sort(nodes[leftChild], nodes[candidate]) {
                candidate = leftChild
            }
            
            if rightChild < nodes.count && sort(nodes[rightChild], nodes[candidate]) {
                candidate = rightChild
            }
            
            if candidate == parent {
                return
            }
            
            nodes.swapAt(parent, candidate)
            parent = candidate
        }
    }
    
    private func parentIndex(of index: Int) -> Int {
        return (index - 1) / 2
    }
    
    private func leftChildIndex(of index: Int) -> Int {
        return 2 * index + 1
    }
    
    private func rightChildIndex(of index: Int) -> Int {
        return 2 * index + 2
    }
}
