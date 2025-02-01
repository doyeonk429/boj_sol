// [문제 링크]: https://www.acmicpc.net/problem/15486

import Foundation
​
let N = Int(readLine()!)!
var dp = Array(repeating: 0, count: N+1)
​
for today in 0..<N {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let T = input[0]
    let P = input[1]
    
    dp[today + 1] = max(dp[today + 1], dp[today])
    if today + T < N + 1 {
        dp[today + T] = max(dp[today + T], dp[today] + P)
    }
}
print(dp[N])