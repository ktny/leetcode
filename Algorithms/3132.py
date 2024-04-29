class Solution:
    def minimumAddedInteger(self, nums1: list[int], nums2: list[int]) -> int:
        ans = 10000
        nums1.sort()
        nums2.sort()
        min2 = nums2[0]

        for start, min1 in enumerate(nums1[:3]):
            i, j = 0, 0
            x = min2 - min1
            fail = 0

            while i < len(nums1) and j < len(nums2):
                if nums1[i + start] + x == nums2[j]:
                    i += 1
                    j += 1
                else:
                    i += 1
                    fail += 1

                if fail + start > 2:
                    break

            if fail + start <= 2 and j == len(nums2):
                ans = min(ans, x)

        return ans


s = Solution()
print(s.minimumAddedInteger([4, 20, 16, 12, 8], [14, 18, 10]))
# s.minimumAddedInteger([3, 5, 5, 3], [7, 7])
# print(s.minimumAddedInteger([4, 6, 3, 1, 4, 2, 10, 9, 5], [5, 10, 3, 2, 6, 1, 9]))
