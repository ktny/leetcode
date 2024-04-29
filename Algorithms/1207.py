from collections import Counter


class Solution:
    def uniqueOccurrences(self, arr: list[int]) -> bool:
        c = Counter(arr)
        return len(set(c.values())) == len(set(arr))
