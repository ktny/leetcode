class Solution:
    def minEnd(self, n: int, x: int) -> int:
        limit = 10**8
        base = x
        results = set()

        additional_bits = 0
        while True:
            candidate = base | additional_bits
            if candidate > base and candidate <= limit:
                results.add(candidate)
                if len(results) == n - 1:
                    break
            additional_bits += 1

        return max(results)


# 例えば100までの数を探索
numbers = find_numbers_by_bit_manipulation(100)
print(numbers)
