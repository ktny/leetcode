# Definition for singly-linked list.
class ListNode:
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next


class Solution:
    # O(N) (N = max(l1.length, l2.length))
    def addTwoNumbers(self, l1: ListNode | None, l2: ListNode | None) -> ListNode | None:
        dummy = ListNode()
        ret = dummy
        carry = 0

        # 1の桁から順に数字を加算する。carryがあればそれも加算した数値を出す
        while l1 or l2 or carry:
            l1_num = l1.val if l1 else 0
            l2_num = l2.val if l2 else 0
            carry, remainder = divmod(carry + l1_num + l2_num, 10)
            dummy.next = ListNode(remainder)
            dummy = dummy.next

            if l1:
                l1 = l1.next
            if l2:
                l2 = l2.next

        return ret.next
