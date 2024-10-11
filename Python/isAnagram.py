class Solution:
    def isAnagram(self, s, t):
        if len(s) != len(t):
            return False

        my_map = {}
        for c in s:
            if c not in my_map:
                my_map[c] = 1
            else:
                my_map[c] += 1

        for ch in t:
            if ch not in my_map:
                return False
            else:
                my_map[ch] -= 1
                if my_map[ch] == 0:
                    del my_map[ch]

        return len(my_map) == 0
