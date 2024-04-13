class Solution:
    # O(N) (N = nums.length)
    def twoSum(self, nums: list[int], target: int) -> list[int]:
        # target - num を key, numのindexをvalueとする
        # 残りの操作している中のnumsにkeyが見つかればvalueとそのときのindexが答え
        wants: dict[int, int] = dict()

        for i, num in enumerate(nums):
            num2 = target - num
            if num in wants:
                return [wants[num], i]
            wants[num2] = i

        return []


solution = Solution()
print(solution.twoSum([2, 7, 11, 15], 9))
print(solution.twoSum([3, 2, 4], 6))
print(solution.twoSum([3, 3], 6))
