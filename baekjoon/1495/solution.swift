// [문제 링크]: https://www.acmicpc.net/problem/1495

import Foundation
​
let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0] // 곡 개수
let s = input[1] // 시작 볼륨
let m = input[2] // 최대 볼륨
let arr = readLine()!.split(separator: " ").map { Int($0)! }
​
// dp[m] : 현재 가능한 볼륨만 저장
var dp = Array(repeating: false, count: 1001)
dp[s] = true // 시작 볼륨 설정
​
// 이전 상태를 유지하면서 볼륨 업데이트
for i in 0..<n {
    var nextDP = Array(repeating: false, count: 1001)
    
    for j in 0...m {
        if dp[j] { // 현재 볼륨이 유효한 경우만 탐색
            if j + arr[i] <= m {
                nextDP[j + arr[i]] = true
            }
            if j - arr[i] >= 0 {
                nextDP[j - arr[i]] = true
            }
        }
    }
    
    dp = nextDP
}
​
// 가능한 최대 볼륨 찾기 (역순 탐색)
var result = -1
for i in stride(from: m, through: 0, by: -1) {
    if dp[i] {
        result = i
        break
    }
}
​
print(result)
​