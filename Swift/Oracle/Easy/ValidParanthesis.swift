import Foundation

class Solution {
    func isValid(_ str: String) -> Bool {
        var stack: [Character] = []
        let elements: [Character: Character] = [")": "(", "]": "[", "}": "{"]

        for char in str {
            // We are checking if the current char is closing
            if let matchingOpen = elements[char] {
                if stack.isEmpty || stack.last != matchingOpen {
                    return false
                }
                stack.removeLast()

            } else {
                stack.append(char)
            }
        }
        return stack.isEmpty
    }
}

let solution = Solution()
let input = "([{}])"
let result = solution.isValid(input)
print(result)
