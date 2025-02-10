class Solution {
    func search(_ arr: [Int], _ target: Int) -> Int {
        guard !arr.isEmpty else { return -1 }

        var left = 0
        var right = arr.count - 1

        while left <= right {
            let mid = left + (right - left) / 2
            if arr[mid] == target {
                return mid
            } else if arr[mid] > target {
                right = mid - 1
            } else if arr[mid] < target {
                left = mid + 1
            }
        }

        return -1
    }
}
