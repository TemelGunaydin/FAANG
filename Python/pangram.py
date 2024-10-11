class Solution:
    def checkIfPangram(self, sentence):
        uniqueSet = set()
        for ch in sentence:
            currChar = ch.lower()
            if currChar.isalpha():
                uniqueSet.add(currChar)

        if len(uniqueSet) != 26:
            return False

        return True
