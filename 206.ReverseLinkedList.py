# Definition for singly-linked list.
class ListNode:
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next


class Solution:
    def reverseList(self, head: ListNode | None) -> ListNode | None:
        ans = None

        # headをhead.nextに1つずらして、head.valを持ったListNodeを繋げる
        while head:
            n = ListNode(val=head.val, next=ans)
            ans = n
            head = head.next

        return ans
