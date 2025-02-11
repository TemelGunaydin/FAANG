class Solution {
    func calculate(_ s: String) -> Int {
        guard !s.isEmpty else { return 0 }

        var currentNumber = 0
        var lastNumber = 0
        var result = 0
        var operation: Character = "+"

        let characters = Array(s)
        for i in 0 ..< characters.count {
            // 1: Get the Character from the Array
            let currentChar = characters[i]

            // 2: Build the number using below logic.
            if let digit = currentChar.wholeNumberValue { // returns optional
                currentNumber = (currentNumber * 10) + digit
            }

            // 3: If the current character is not a digit or a whitespace, or if we are at the last character of the string, we need to perform the operation.
            if (currentChar.wholeNumberValue == nil && !currentChar.isWhitespace) || i == characters.count - 1 {
                switch operation {
                case "+":
                    // 4. add the lastNumber which is zero to the result. This is the first time we are adding the lastNumber to the result.
                    result += lastNumber
                    // 5. update the lastNmber to the currentNumber. We dont change the value of currentNumber.
                    lastNumber = currentNumber
                case "-":
                    result += lastNumber
                    lastNumber = -currentNumber
                case "*":
                    lastNumber *= currentNumber
                case "/":
                    lastNumber /= currentNumber
                default:
                    break
                }
                operation = currentChar
                currentNumber = 0 // 6. After each operation we reset the currentNumber to zero.
            }
        }

        result += lastNumber
        return result
    }
}
