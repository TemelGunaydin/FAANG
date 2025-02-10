class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var minPrice = Int.max
        var maxProfit = 0
        for price in prices {
            if price < minPrice {
                minPrice = price
            } else if price - minPrice > maxProfit {
                maxProfit = price - minPrice
            }
        }

        return maxProfit
    }
}
