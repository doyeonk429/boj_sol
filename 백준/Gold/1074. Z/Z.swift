import Foundation

let input = readLine()!.components(separatedBy: " ").map { Int($0)! }
let (n, r, c) = (input[0], input[1], input[2])

func solution(_ n: Int, r: Int, c: Int) -> Int {
    guard n > 0 else { return 0 }
    let cur = 2 * (r % 2) + (c % 2)
    return cur + 4 * solution(n-1, r: r/2, c: c/2)
}

print(solution(n, r: r, c: c))