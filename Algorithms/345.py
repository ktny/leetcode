class Solution:
    def reverseVowels(self, s: str) -> str:
        vowels = []
        ans = ""

        for w in s:
            if w.lower() in "aeiou":
                vowels.append(w)

        for w in s:
            if w.lower() in "aeiou":
                ans += vowels.pop()
            else:
                ans += w

        return ans


s = Solution()
s.reverseVowels("hello")
