class Solution {
  func palindromePermutation(_ s: String) -> Bool {
    var charCount = [Character:Int]()

    for char in s {
      charCount[char,default:0] += 1
    }

    let oddCount = charCount.values.filter { $0 % 2 != 0}.count
    
    return oddCount <= 1
  }
}

	Character Set: When dealing with strings, you typically count the occurrences of each character to determine if a palindrome permutation is possible. In the case of ASCII, there are only 128 possible characters, so the array or hash map used to store character frequencies will have at most 128 entries. This makes the space requirement constant, independent of the input string length
	For example, if you’re using an array of size 128 to store ASCII character frequencies, no matter how long the input string is, you will never need more than 128 slots in the array.
