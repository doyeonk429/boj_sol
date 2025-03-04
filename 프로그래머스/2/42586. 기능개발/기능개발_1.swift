import Foundation
// 5 10 1 1 20 1
// 0번은 무조건 걍 나감
// 10 나갈때 뒤에 1 1도 나감

// 소요 일수 계산법..
// 100 - progresses[i] = restPerscent
// restpercent % speeds[i] == 0 -> restpercent / speeds[i]
// restpercent / speeds[i] + 1

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    var days = Array(repeating: 0, count: progresses.count)
    
    for (i, p) in progresses.enumerated() {
        let rest = 100 - p
        let sp = speeds[i]
        days[i] = rest / sp
        if rest % sp != 0 {
            days[i] += 1
        }
    }
    
    // days에서 firstDay 설정
    // firstDay보다 작은 값들은 count++
    // firstDay보다 큰 값나오면 지금까지의 count를 Result에 추가 후 firstDay 업데이트
    // 마지막 남은 개수도 result 배열에 추가
    
    var result = [Int]()
    var firstDay = days[0]
    var count = 1
    
    for i in 1..<days.count {
        if days[i] <= firstDay {
            // 같이 배포 가능
            count += 1
        } else {
            result.append(count) // 지금까지의 카운트 추가
            firstDay = days[i] // firstday 업데이트
            count = 1 // 카운트도 재시작
        }
    }
    result.append(count) // 마지막 배포 개수 추가
    
    return result
}
