class Solution {
    func maximumSwap(_ num: Int) -> Int {
        //If the number is less than 10, then it is already the maximum number
        if num <= 10 { return num }
        
        var digits = Array(String(num)) //Convert the number to an array of digits
        let n = digits.count //we will iterate through the array in reverse order
        var maxValIdx = n - 1 //Right most number
        var swapLeft = -1 // null
        var swapRight = n - 1 //Right most number 
        
        // stride is used to iterate through the array in reverse order
        for i in stride(from: n - 2, through: 0, by: -1) {
            // If the current number is greater than the right most number, then update the right most number
            if digits[maxValIdx] < digits[i] {
                maxValIdx = i
            // If the current number is less than the right most number, then we have a swap
            } else if digits[maxValIdx] > digits[i] {
                swapRight = maxValIdx
                swapLeft = i
            }
        }
        
        // If we have a swap, then swap the left and right numbers
        if swapLeft != -1 {
            digits.swapAt(swapLeft, swapRight)
        }
        
        // Convert the array of digits into string and then to integer. If the conversion fails, then return the original number
        return Int(String(digits)) ?? num
    }
}
