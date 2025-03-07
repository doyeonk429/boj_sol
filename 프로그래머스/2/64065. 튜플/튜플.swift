import Foundation

func solution(_ s: String) -> [Int] {
    var result = [Int]()
    var seen = Set<Int>()
    
    let formatted = s.dropFirst(2).dropLast(2).replacingOccurrences(of: "},{", with: " ")
    
    let sets = formatted.split(separator: " ").map { $0.split(separator: ",").compactMap { Int($0) } }

    for s in sets.sorted(by: { $0.count < $1.count }) {
        for num in s where seen.insert(num).inserted {
            result.append(num)
        }
    }

    return result
}