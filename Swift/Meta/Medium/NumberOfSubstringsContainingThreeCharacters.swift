class Solution {
    func numberOfSubstrings(_ s: String) -> Int {
        guard !s.isEmpty else { return 0 }

        let chars = Array(s)
        var left = 0
        var right = 0
        var result = 0
        var tracking: [Character: Int] = ["a": 0, "b": 0, "c": 0]

        for right in 0 ..< chars.count {
            tracking[chars[right], default: 0] += 1

            while tracking["a", default: 0] > 0 && tracking["b", default: 0] > 0 && tracking["c", default: 0] > 0 {
                result += chars.count - right
                tracking[chars[left], default: 0] -= 1
                left += 1
            }
        }
        return result
    }
}
