import Foundation

let n = Int(readLine()!)!
let numbers = readLine()!.split(separator: " ").map { Int($0)! }

func solution(_ numbers: [Int]) -> [Int] {
    var result = Array(repeating: -1, count: numbers.count)
    var stack = [Int]()
    stack.reserveCapacity(numbers.count)

    for i in numbers.indices {
        let cur = numbers[i]
        while let last = stack.last, numbers[last] < cur {
            result[last] = cur
            stack.removeLast()
        }
        stack.append(i)
    }
    return result
}

let ans = solution(numbers)
print(ans.map(String.init).joined(separator: " "))
