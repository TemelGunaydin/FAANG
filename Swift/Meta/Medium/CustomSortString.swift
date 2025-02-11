class Solution {
    func customSortString(_ order: String, _ s: String) -> String {
        var sCharCount = [Character: Int]()
        for char in s {
            sCharCount[char, default: 0] += 1
        }
        var result = ""
        for char in order {
            if let count = sCharCount[char] {
                result += String(repeating: char, count: count)
                sCharCount[char] = nil
            }
        }
        for (char, count) in sCharCount {
            result += String(repeating: char, count: count)
        }
        return result
    }
}
