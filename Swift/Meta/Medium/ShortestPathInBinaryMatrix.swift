class Solution {
    let DIRECTIONS = [(-1,0),(1,0),(0,-1),(0,1),(-1,-1),(-1,1),(1,-1),(1,1)]

    func shortestPathBinaryMatrix(_ grid: [[Int]]) -> Int {
      let N = grid.count
      if grid[0][0] == 1 || grid[N-1][N-1] == 1 {
        return -1
      }

      var visited =  Array(repeating: Array(repeating: false,count: N),count: N)
      var queue = [(Int,Int,Int)]()
      
      queue.append((0,0,1))
      visited[0][0] = true   
      while !queue.isEmpty {
        var (row,col,path) = queue.removeFirst()

        if row == N - 1 && col == N - 1 {
          return path
        }

        for (dr,dc) in DIRECTIONS {
          let newRow = row + dr
          let newCol = col + dc

          if newRow >= 0 && newRow < N && newCol >= 0 && newCol < N && !visited[newRow][newCol] && grid[newRow][newCol] != 1 {
            queue.append((newRow,newCol,path + 1))
            visited[newRow][newCol] = true
          }

        }
      }

      return -1
    }
}
