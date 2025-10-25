import Foundation

let n = Int(readLine()!)!

var triangle: [[Int]] = []
for _ in 0..<n {
    let row = readLine()!.split(separator: " ").map { Int($0)! }
    triangle.append(row)
}

var dp: [[Int]] = Array(repeating: [], count: n)
for i in 0..<n {
    dp[i] = Array(repeating: 0, count: i + 1)
}

dp[0][0] = triangle[0][0]

for i in 1..<n {
    for j in 0...i {
        if j == 0 {
            dp[i][j] = dp[i-1][j] + triangle[i][j]
        } else if j == i {
            dp[i][j] = dp[i-1][j-1] + triangle[i][j]
        } else {
            dp[i][j] = max(dp[i-1][j-1], dp[i-1][j]) + triangle[i][j]
        }
    }
}

let answer = dp[n-1].max()!
print(answer)
