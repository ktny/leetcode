class Solution:
    def largestAltitude(self, gain: list[int]) -> int:
        height = 0
        max_height = 0

        for diff in gain:
            height += diff
            if max_height < height:
                max_height = height

        return max_height
