class Solution {
    func shipWithinDays(_ weights: [Int], _ days: Int) -> Int {
        guard !weights.isEmpty else { return 0 }

        let minCapacity = weights.max() ?? 0
        let maxCapacity = weights.reduce(0,+)

        var left = minCapacity
        var right = maxCapacity

        while left < right {
            let mid = (left + right) / 2

            var daysNeeded = 1
            var currentWeight = 0

            for weight in weights {
                if currentWeight + weight > mid {
                    daysNeeded += 1
                    currentWeight = 0
                }
                currentWeight += weight
            }

            if daysNeeded <= days {
                right = mid
            } else {
                left = mid + 1
            }
        }

        return left
    }
}
