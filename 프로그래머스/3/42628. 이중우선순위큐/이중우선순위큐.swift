import Foundation

func solution(_ operations:[String]) -> [Int] {
    var queue = [Int]()
    
    for op in operations {
        let ops = op.split(separator: " ")
        
        if ops[0] == "I" {
            queue.append(Int(ops[1])!)
        } else {
            if ops[1] == "1" {
                // 최댓값 삭제
                if let maxValue = queue.max(),
                let idx = queue.firstIndex(of: maxValue) {
                    queue.remove(at: idx)
                }
            } else {
                // 최솟값 삭제
                if let minValue = queue.min(),
                let idx = queue.firstIndex(of: minValue) {
                    queue.remove(at: idx)
                }
            }
        }
    }
    
    return [queue.max() ?? 0, queue.min() ?? 0]
}