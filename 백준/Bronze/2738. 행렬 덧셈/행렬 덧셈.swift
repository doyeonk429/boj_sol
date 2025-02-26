import Foundation
let size = readLine()!.split(separator: " ").map { Int($0)! }

var arr1: [[Int]] = []
var arr2: [[Int]] = []

for i in 0..<size[0] {
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    arr1.append(input)
}

for i in 0..<size[0] {
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    arr2.append(input)
}

for j in arr1.indices {
    for k in arr1[j].indices {
        arr1[j][k] += arr2[j][k]
    }
}

for y in 0..<size[0] {
    arr1[y].forEach { print($0, terminator: " ") }
    print()
}