class Solution:
    def findMaxAverage(self, nums: list[int], k: int) -> float:
        cur = ans = sum(nums[0:k])  # 初期地は頭からk個の数列の合計

        for i, _ in enumerate(nums[:-k]):
            cur -= nums[i]  # 部分数列から除外する数値をマイナス
            cur += nums[i + k]  # 部分数列に追加する数値をプラス
            if cur > ans:
                ans = cur

        return ans / k


s = Solution()
print(s.findMaxAverage([1, 12, -5, -6, 50, 3], 4))
print(s.findMaxAverage([0, 4, 0, 3, 2], 1))
print(s.findMaxAverage([4, 2, 1, 3, 3], 2))
