class Solution { 
	func isAnagrams(_ s1:String,_ s2:String) -> Bool { 
		if s1.count != s2.count {
			return false
		 } 
		
		var charCount = [Character:Int]()
	
		for ch in s1 { 
			charCount[ch,default:0] += 1
		}
		
		for ch in s2 { 
			if let count = charCount[ch] { 
				charCount[ch] = count - 1
				if charCount[ch] == 0 {
					charCount.removeValue(forKey : ch)
				}
			} else { 
				return false	
			}
		}

		return charCount.isEmpty
	
	}
}
