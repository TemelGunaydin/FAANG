class Solution {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        guard intervals.count > 1 else { return intervals}

        let sortedIntervals = intervals.sorted { $0[0] < $1[0] }

        var mergedIntervals: [[Int]] = [sortedIntervals[0]]

        for i in 1..<sortedIntervals.count { 
            let current = sortedIntervals[i]
            var lastMerged = mergedIntervals[mergedIntervals.count - 1]

            if current[0] <= lastMerged[1] { 
                lastMerged[1] = max(lastMerged[1],current[1])
                mergedIntervals[mergedIntervals.count - 1] = lastMerged
            } else { 
                mergedIntervals.append(current)
            }
        }
        return mergedIntervals
    }
}
