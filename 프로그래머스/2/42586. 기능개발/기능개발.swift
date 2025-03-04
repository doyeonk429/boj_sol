import Foundation

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    let days: [Int] = progresses.indices.map { 
        let remain = 100 - progresses[$0]
        return (remain + speeds[$0] - 1) / speeds[$0] 
    }
    var result = [Int]()
    var prevMax = days[0]
    var count = 0

    for day in days {
        if day > prevMax {
            result.append(count)
            count = 1
            prevMax = day
        } else {
            count += 1
        }
    }
    
    result.append(count) // 마지막 배포 추가
    return result
}