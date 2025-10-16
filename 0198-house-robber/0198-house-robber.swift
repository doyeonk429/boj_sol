/*
집들이 일렬로 있고, 각 집에 돈이 있어요.
인접한 집을 연속으로 털면 경보가 울려요.
최대 금액은?
*/ 

class Solution {
    func rob(_ nums: [Int]) -> Int {
        // 예외 처리
        if nums.isEmpty { return 0 }
        if nums.count == 1 { return nums[0] }

        var prev2 = 0
        var prev1 = nums[0]

        for i in 1..<nums.count {
            let current = max(prev1, prev2 + nums[i])

            prev2 = prev1
            prev1 = current
        }

        return prev1
    }
}