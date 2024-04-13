from collections import deque

interval = 3000


class RecentCounter:

    def __init__(self):
        self.q = deque([])

    def ping(self, t: int) -> int:
        self.q.append(t)

        # 左端の要素が指定ミリ秒数以内のリクエストでなければ削除
        while self.q[0] < t - interval:
            self.q.popleft()

        return len(self.q)


# Your RecentCounter object will be instantiated and called as such:
# obj = RecentCounter()
# param_1 = obj.ping(t)
