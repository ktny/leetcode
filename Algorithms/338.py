class Solution:
    def countBits(self, n: int) -> list[int]:
        return [bin(num).count("1") for num in range(n + 1)]
