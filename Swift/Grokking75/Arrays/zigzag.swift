class Solution {
    func convert(_ s: String, _ numRows: Int) -> String {
        if numRows == 1 {
            return s
        }

        var direction = 1
        var rowIndex = 0
        var rows = [String](repeating: "", count: numRows)

        for char in s {
            rows[rowIndex].append(char)

            if rowIndex == 0 {
                direction = 1
            } else if rowIndex == numRows - 1 {
                direction = -1
            }

            rowIndex += direction
        }

        return rows.joined()
    }
}

let sol = Solution()

let str = "PAYPALISHIRING"
let row = 3

let result = sol.convert(str, row)
assert(result == "PAYPALISHIRING", "Wrong answer")
print(result)
