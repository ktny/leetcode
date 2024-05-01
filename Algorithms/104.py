# Definition for a binary tree node.
class TreeNode:
    def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right


class Solution:
    def maxDepth(self, root: TreeNode | None) -> int:
        if root is None:
            return 0
        else:
            left_depth = self.maxDepth(root.left) + 1
            right_depth = self.maxDepth(root.right) + 1
            return left_depth if left_depth > right_depth else right_depth
