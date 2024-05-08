class Solution:
    def productExceptSelf(self, nums: list[int]) -> list[int]:
        n = len(nums)
        right = [1]
        left = 1

        # 右からの累積積を保持しておく
        for i in range(n - 1, 0, -1):
            print(i)
            right.append(right[-1] * nums[i])

        # 左からの累積積と右からの累積積の積を自身を除く形で求める
        ans = []
        for i in range(n):
            ans.append(left * right[-(i + 1)])
            left *= nums[i]

        return ans
