class Solution {
  func isToeplitzMatrix(_ matrix: [[Int]]) -> Bool {
      for i in 0..<matrix.count - 1 { 
        for j in 0..<matrix[0].count - 1 {
          if matrix[i][j] != matrix[i+1][j+1] { 
            return false
          }
        }
      }
    return true
  }
}
