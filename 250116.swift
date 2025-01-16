//MARK: - 250116
// 퇴사 14501 DP
// 실버 3
let n = Int(readLine()!)!
var dp: [Int] = Array(repeating: 0, count: n + 2)

for i in 1...n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let t = input[0]
    let p = input[1]
    
    // 상담 종료일이 퇴사일을 넘어갈 경우 제외
    if t + i > n + 1 { continue }
    
    // 상담이 끝나는 날에 누적 최대 수익을 저장. 두 값을 비교해서 더 큰 값을 저장
    // 상담 시작일까지의 최대 수익 + 현재 상담으로 얻는 수익 = 현재 상담을 포함한 수익의 합
    // 이미 저장된 값(기존 최대 수익)
    dp[i + t] = max(p + dp[1...i].max()!, dp[i + t])
}

print(dp.max()!)
