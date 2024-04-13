class Solution:
    def pivotIndex(self, nums: list[int]) -> int:
        # 累積和配列を作成
        sums = [0]
        sum_num = 0
        for n in nums:
            sum_num += n
            sums.append(sum_num)

        nums_len = len(nums)
        for i in range(nums_len):
            # iより左の数値の総和とiより右の数値の総和が同じ場合はそれを返す
            if sums[i] == sums[-1] - sums[i + 1]:
                return i

        return -1
