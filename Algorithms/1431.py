class Solution:
    def kidsWithCandies(self, candies: list[int], extraCandies: int) -> list[bool]:
        m = max(candies)
        ans = []
        for n in candies:
            ans.append(n + extraCandies >= m)
        return ans
