class Solution:
    def moveZeroes(self, nums: list[int]) -> None:
        """
        Do not return anything, modify nums in-place instead.
        """
        # left, right2つのポインタを左端のインデックスに持つ
        left = 0

        for right in range(len(nums)):
            # rightが0以外であればleftとrightの数字の位置を交換する
            # rightが0であればleftは0の位置に留まるので常に0と0以外の数値が交換される
            if nums[right] != 0:
                nums[right], nums[left] = nums[left], nums[right]
                left += 1
