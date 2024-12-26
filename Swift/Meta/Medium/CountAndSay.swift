class Solution {
    func countAndSay(_ n: Int) -> String {
        if n == 1 {
            return "1"
        }

        var result = "1"

        for _ in 2 ... n {
            let chars = Array(result)
            var current = ""
            var count = 0

            for j in 0 ..< chars.count {
                count += 1
                if j == chars.count - 1 || chars[j] != chars[j + 1] {
                    current.append("\(count)\(chars[j])")
                    count = 0
                }
            }
            result = current
        }
        return result
    }
}
