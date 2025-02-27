import Foundation

func solution(_ citations:[Int]) -> Int {
    let sortCitations = citations.sorted(by: >)
    
    for (idx, c) in sortCitations.enumerated() {
        if idx + 1 > c {
            return idx
        }
    }
    return citations.count
}