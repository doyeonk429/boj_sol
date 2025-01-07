//MARK: - 250107 2309 일곱난쟁이
// 백준 2309 일곱난쟁이
// 브론즈 1

import Foundation

var heightList: [Int] = []

for _ in 0..<9 {
    let input = Int(readLine()!)!
    heightList.append(input)
}

let rest = heightList.reduce(0, +) - 100

for (p, i) in heightList.enumerated() {
    if heightList.contains(rest - i) && i != rest - i {
        heightList.remove(at: p)
        heightList.remove(at: heightList.firstIndex(of: rest - i)!)
        break
    }
}

heightList.sorted().forEach { print($0) }
