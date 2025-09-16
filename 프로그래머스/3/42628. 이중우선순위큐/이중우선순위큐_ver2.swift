import Foundation

func solution(_ operations: [String]) -> [Int] {
    var q = [Int]()
    
    @inline(__always)
    func lowerBound(_ x: Int) -> Int {
        var l = 0, r = q.count
        while l < r {
            let m = (l + r) >> 1
            if q[m] < x { l = m + 1 } else { r = m }
        }
        return l
    }
    
    for op in operations {
        let parts = op.split(separator: " ")
        let cmd = parts[0]
        let v = Int(parts[1])!
        
        if cmd == "I" {
            let idx = lowerBound(v)
            q.insert(v, at: idx)
        } else {
            if q.isEmpty { continue }
            if v > 0 {
                _ = q.popLast()
            } else {
                q.removeFirst()
            }
        }
    }
    return q.isEmpty ? [0, 0] : [q.last!, q.first!]
}
