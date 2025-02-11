class Solution {
    func findDiagonalOrder(_ matrix: [[Int]]) -> [Int] {
        // Check for empty matrix
        if matrix.isEmpty || matrix[0].isEmpty {
            return []
        }

        let N = matrix.count
        let M = matrix[0].count
        var row = 0, column = 0
        var upwards = true
        var result = [Int]()

        while row < N, column < M {
            result.append(matrix[row][column])

            // Calculate the next row and column based on the direction
            let newRow = upwards ? row - 1 : row + 1
            let newColumn = upwards ? column + 1 : column - 1

            // Check if we hit the boundary of the matrix
            if newRow < 0 || newRow == N || newColumn < 0 || newColumn == M {
                if upwards {
                    row += (column == M - 1) ? 1 : 0
                    column += (column < M - 1) ? 1 : 0
                } else {
                    column += (row == N - 1) ? 1 : 0
                    row += (row < N - 1) ? 1 : 0
                }
                // Switch the direction after hitting a boundary
                upwards.toggle()
            } else {
                // Continue traversing diagonally
                row = newRow
                column = newColumn
            }
        }

        return result
    }
}

// Example usage:
let solution = Solution()
let matrix = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9],
]
print(solution.findDiagonalOrder(matrix)) // Output: [1, 2, 4, 7, 5, 3, 6, 8, 9]

Second Solution using index sum technique.

    class Solution {
        func findDiagonalOrder(_ matrix: [[Int]]) -> [Int] {
            var diagonalDictionary = [Int: [Int]]()

            for i in 0 ..< matrix.count {
                for j in 0 ..< matrix[0].count {
                    let diagonalSum = i + j

                    if diagonalDictionary[diagonalSum] == nil {
                        diagonalDictionary[diagonalSum] = [matrix[i][j]]
                    } else {
                        diagonalDictionary[diagonalSum].append(matrix[i][j])
                    }
                }
            }

            var result = []()
            for key in diagonalDictionary.keys.sorted() {
                let diagonalElements = diagonalDictionary[key]

                if key % 2 == 0 {
                    result.append(contentsOf: diagonalElements.reversed())
                } else {
                    result.append(contentsOf: diagonalElements)
                }
            }
            return result
        }
    }
