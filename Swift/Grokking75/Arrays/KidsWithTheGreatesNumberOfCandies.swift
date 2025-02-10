class Solution {
    func kidsWithCandies(_ candies: [Int], _ extraCandies: Int) -> [Bool] {
        guard let max = candies.max() else { return [] }

        let result = candies.map { $0 + extraCandies >= max }
        return result
    }
}

let sol = Solution()
let candies = [7, 3, 9, 2, 4]
let extraCandies = 5
let result = sol.kidsWithCandies(candies, extraCandies)
assert(result == [true, false, true, false, true], "Something wrong with your program")
print(result)
