class Solution:
    def maxVowels(self, s: str, k: int) -> int:
        vowels = {"a", "e", "i", "o", "u"}
        ans = cur = 0

        for i, w in enumerate(s):
            if w in vowels:
                cur += 1
            if i >= k and s[i - k] in vowels:
                cur -= 1
            ans = max(ans, cur)
            # print(f"i={i}, w={w}, cur={cur}, ans={ans}")

        return ans
