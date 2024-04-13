class Solution:
    def mergeAlternately(self, word1: str, word2: str) -> str:
        ret = ""
        word1_len = len(word1)
        word2_len = len(word2)
        lenmax = max(word1_len, word2_len)

        for i in range(lenmax):
            if i < word1_len:
                ret += word1[i]
            if i < word2_len:
                ret += word2[i]

        return ret


solution = Solution()
ret = solution.mergeAlternately("abc", "pqr")

print(ret)
