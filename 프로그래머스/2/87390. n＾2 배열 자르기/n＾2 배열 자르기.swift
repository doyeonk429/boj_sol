import Foundation

func solution(_ n: Int, _ left: Int64, _ right: Int64) -> [Int] {
    var result = [Int]()

    for idx in Int(left)...Int(right) {
        let row = idx / n   // 행 인덱스
        let col = idx % n   // 열 인덱스
        result.append(max(row, col) + 1)
    }

    return result
}