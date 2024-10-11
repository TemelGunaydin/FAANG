class Solution:
    # 1 This constants should be added first, we will check input's each character with vowels
    vowels = "aeiouAEIOU"

    def reverseVowels(self, s):
        left = 0  # This will point the first char
        right = len(s) - 1  # This will point the last char
        array = list(
            s
        )  # In vowels we will use find method to find the character located in the input. To use input using index operator we need to convert to list

           while left < right and self.vowels.find(array[left]) == -1:
                left += 1
            while left < right and self.vowels.find(array[right]) == -1:
                right -= 1

            array[left], array[right] = array[right], array[left]

            left += 1
            right -= 1

        return "".join(array)
