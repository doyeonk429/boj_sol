// [문제 링크]: https://www.acmicpc.net/problem/2579

let input = Int(readLine()!)!
var steps: [Int] = [0]
for _ in 0..<input {
    steps.append(Int(readLine()!)!)
}
​
​
var dp: [Int] = Array(repeating: 0, count: input+1)
dp[0] = 0
​
for i in 1...input {
    if i == 1 { dp[1] = steps[1] }
    else if i == 2 { dp[2] = steps[1] + steps[2] }
    else if i == 3 { dp[3] = max(steps[3]+steps[1], steps[2]+steps[3]) }
    else {
        dp[i] = max(steps[i] + steps[i - 1] + dp[i - 3], steps[i] + dp[i - 2])
    }
}
​
print(dp[input])