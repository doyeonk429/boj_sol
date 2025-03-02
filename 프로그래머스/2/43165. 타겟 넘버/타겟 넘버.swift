import Foundation

func solution(_ numbers:[Int], _ target:Int) -> Int {
    var result = 0
    dfs(numbers, target, 0, 0, &result)
    return result
}

func dfs(_ numbers: [Int], _ target: Int, _ index: Int, _ sum: Int, _ result: inout Int) {
    // 지금이 마지막 숫자면, 타겟 넘버랑 비교
    if index == numbers.count {
        if sum == target {
            result += 1
        }
        return
    }

    dfs(numbers, target, index + 1, sum + numbers[index], &result)
    dfs(numbers, target, index + 1, sum - numbers[index], &result)
}