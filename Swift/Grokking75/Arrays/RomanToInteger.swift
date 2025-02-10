class Solution {
    func romanToInt(_ s: String) -> Int {
        guard !s.isEmpty else { return 0 }

        let romanMap: [Character: Int] = [
            "I": 1,
            "V": 5,
            "X": 10,
            "L": 50,
            "C": 100,
            "D": 500,
            "M": 1000,
        ]

        var result = 0
        var previous = 0
        for char in s.reversed() {
            let current = romanMap[char] ?? 0

            if current < previous {
                result -= current
            } else {
                result += current
            }

            previous = current
        }

        return result
    }
}
