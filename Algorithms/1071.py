from math import gcd


class Solution:
    def gcdOfStrings(self, str1: str, str2: str) -> str:

        # 2つの文字列長の最大公約数を求める
        l1 = len(str1)
        l2 = len(str2)
        n = gcd(l1, l2)

        # 最大公約数の約数を求める過程でその文字列長で文字列が構成できるかをチェックする
        for i in range(1, int(n**0.5) + 1):
            if n % i == 0:
                a = n // i
                s1 = str1[0:a]
                s2 = str2[0:a]

                # 約数分の長さの文字列長が同じ、かつ、その文字列でそれぞれの文字列を構成できるとき
                if s1 == s2 and s1 * (l1 // a) == str1 and s2 * (l2 // a) == str2:
                    return s1

        return ""


solution = Solution()
print(solution.gcdOfStrings("ABCABC", "ABC"))
print(solution.gcdOfStrings("ABABAB", "ABAB"))
print(solution.gcdOfStrings("LEET", "CODE"))
