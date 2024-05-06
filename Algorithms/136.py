from collections import Counter


class Solution:
    def singleNumber(self, nums: list[int]) -> int:
        c = Counter(nums)
        for key, value in c.items():
            if value == 1:
                return key
        return -1
