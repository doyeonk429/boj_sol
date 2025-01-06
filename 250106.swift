//MARK: - 250106 boj 2231
// 분해합
// 브론즈 2
// 브루트포스/완전탐색
let input = Int(readLine()!)!
var answer = 0

// 시작점 설정
let start = max(1, input - String(input).count * 9)
// 18 이하까지는 1부터 시작

for i in start...input {
    let sum = String(i).map({Int(String($0))!}).reduce(0, +) + i
    if sum == input {
        answer = i
        break
    }
}

print(answer)
