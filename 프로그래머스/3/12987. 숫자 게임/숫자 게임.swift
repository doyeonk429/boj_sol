import Foundation

func solution(_ a:[Int], _ b:[Int]) -> Int {
    var answer = 0
    let sortedA = a.sorted()
    let sortedB = b.sorted()
    
    var aIdx = 0
    var bIdx = 0
    
    while aIdx < sortedA.count && bIdx < sortedB.count {
        if sortedA[aIdx] < sortedB[bIdx] {
            answer += 1
            aIdx += 1
        }
        bIdx += 1
    }
    
    return answer
}