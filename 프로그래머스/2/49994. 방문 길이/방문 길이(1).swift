import Foundation

func inRegion(_ pos: (Int, Int)) -> Bool {
    return pos.0 >= -5 && pos.0 <= 5 && pos.1 >= -5 && pos.1 <= 5
}

func movePos(dir: String, _ pos: (Int, Int)) -> (Int, Int) {
    switch dir {
        case "U": return (pos.0, pos.1 + 1)
        case "D": return (pos.0, pos.1 - 1)
        case "R": return (pos.0 + 1, pos.1)
        case "L": return (pos.0 - 1, pos.1)
        default: return pos
    }
}

func solution(_ dirs:String) -> Int {
    var visited = Set<String>()
    var curPos = (0, 0)
    let directions = dirs.map { String($0) }

    for d in directions {
        let nextPos = movePos(dir: d, curPos)
        if inRegion(nextPos) {
            let path = curPos < nextPos ? "\(curPos)-\(nextPos)" : "\(nextPos)-\(curPos)"
            visited.insert(path)
            curPos = nextPos
        }
    }

    return visited.count
}
