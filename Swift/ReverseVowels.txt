//71 ms
//For swapping characters in a string, convert to Array first then two pointer 
//technique. Below is a bit long approach

class Solution {
  func reverseVowels(_ s: String) -> String { 
  let vowels = "aeiuoAEIOU"
  var left = s.startIndex
  var right = s.index(before: s.endIndex)
  var result = s

    while left < right {
      guard vowels.contains(s[left]) else { 
        left = s.index(after: left)
        continue
      }
      guard vowels.contains(s[right]) else {
        right = s.index(before: right)
        continue
      }
    
      let leftChar = s[left]
      let rightChar = s[right]

      result.replaceSubrange(left...left, with: String(rightChar) )
      result.replaceSubrange(right...right, with: String(leftChar))


      left = s.index(after: left)
      right = s.index(before: right)

    }
    return s

  }
}

//64 ms
class Solution { 
  func reverseVowels(_ s: String) -> String {
    let vowels = "aeiuoAEIOU"
    var characters = Array(s)
    var left = 0
    var right = characters.count - 1

    while left < right {
     guard vowels.contains(characters[left]) else {
        left += 1
        continue
     }
     guard vowels.contains(characters[right]) else {
        right -= 1
        continue
     }

     characters.swapAt(left,right)

     left += 1
     right -=1 
    }

    return String(characters)
    
  }

}
