class Solution {
    func oceanView(_ building: [Int]) -> [Int] {
        var result: [Int] = []
        var maxHeight = 0

        for i in stride(from: building.count - 1, through: 0, by: -1) {
            if building[i] > maxHeight {
                maxHeight = building[i]
                result.append(i)
            }
        }
        return result.reversed()
    }
}
