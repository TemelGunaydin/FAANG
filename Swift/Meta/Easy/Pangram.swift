//5ms
class Solution {
    func checkIfPangram(_ sentence: String) -> Bool {
        var uniqueSet = Set<Character>()

        for char in sentence {
            //Leetcode says sentence only contains lowercase letters
            guard (char.isLetter || char.isNumber) else {
                continue
            }
            uniqueSet.insert(char)
        }

        return uniqueSet.count == 26
    }
}
