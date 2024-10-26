class SparseVector {
  var nonZeroDict:[Int:Int]

  init(_ vector: [Int]) {
   nonZeroDict = Dictionary(vector.enumerated().filter { $0.1 != 0 },uniquingKeysWith: {first,_ in first})
  }

  func dotProduct(_ sparseVector: SparseVector) -> Int {
    var result = 0
    for (index,value) in nonZeroDict {
      if  let number = sparseVector.nonZeroDict[index] {
        result += value * number
      }
    }
    return result
  }
}

// Test the dot product with examples
let vec1 = SparseVector([1, 0, 0, 2])
let vec2 = SparseVector([2, 3, 0, 1])
print("Example 1: \(vec1.dotProduct(vec2))") // Output: 4

let vec3 = SparseVector([0, 0, 0, 0])
let vec4 = SparseVector([1, 1, 1, 1])
print("Example 2: \(vec3.dotProduct(vec4))") // Output: 0

let vec5 = SparseVector([1, 0, 0, 2, 3])
let vec6 = SparseVector([0, 3, 0, 4, 0])
print("Example 3: \(vec5.dotProduct(vec6))") // Output: 8
