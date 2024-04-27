class Solution(object):
    def isSubsequence(self, s, t):
        """
        :type s: str
        :type t: str
        :rtype: bool
        """
        i, j = 0, 0
        while i < len(s) and j < len(t):
            if s[i] == t[j]:
                i += 1
                j += 1
            else:
                j += 1

        return i == len(s)

        # i = 0
        # s_len = len(s)
        # for w in t:
        #     if i < s_len and w == s[i]:
        #         i += 1
        # return i >= s_len
