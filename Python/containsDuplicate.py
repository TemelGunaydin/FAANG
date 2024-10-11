class Solution:
    def contains_duplicate(self, nums):
        unique_set = set()  # Use set to store unique elements

        for x in nums:
            if (
                x in unique_set
            ):  # If the set already contains the current element, return True
                return True
            unique_set.add(x)  # Add the current element to the set

        return False  # Return False if no duplicates found
