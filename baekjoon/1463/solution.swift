// [문제 링크]: https://www.acmicpc.net/problem/1463

guard let n = Int(readLine()!) else { fatalError() }
var dp = [Int](repeating: 0, count: n+1)
​
for i in 2..<n+1 {
    dp[i] = dp[i-1] + 1
    if i%2 == 0 {
        dp[i] = min(dp[i], dp[i/2]+1)
    }
    if i%3 == 0 {
        dp[i] = min(dp[i], dp[i/3]+1)
    }
​
}
print(dp[n])