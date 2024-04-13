class Solution:
    def canPlaceFlowers(self, flowerbed: list[int], n: int) -> bool:
        fl = len(flowerbed)

        if fl == 1:
            if n == 0 or (flowerbed[0] == 0 and n == 1):
                return True
            else:
                return False

        for i in range(fl):
            if i == 0:
                if flowerbed[i] == 0 and flowerbed[i + 1] == 0:
                    flowerbed[i] = 1
                    n -= 1
            elif i == fl - 1:
                if flowerbed[i - 1] == 0 and flowerbed[i] == 0:
                    flowerbed[i] = 1
                    n -= 1
            else:
                if flowerbed[i - 1] == 0 and flowerbed[i] == 0 and flowerbed[i + 1] == 0:
                    flowerbed[i] = 1
                    n -= 1

            # nが0なら植えるものはないのでTrueを返す
            if n <= 0:
                return True

        return False


s = Solution()
# s.canPlaceFlowers([1, 0, 0, 0, 1], 1)
s.canPlaceFlowers([1, 0, 0, 0, 1, 0, 0], 2)
