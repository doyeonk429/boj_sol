//MARK: - 250110
// 1018 체스판 다시 칠하기
// 실버 4

import Foundation
let input = readLine()!.split(separator: " ").map{Int($0)!}
let n = input[0]
let m = input[1]
var counter = [Int]()

var arr : [[String]] = []
for _ in 0 ..< n {
    arr.append(readLine()!.map{String($0)})
}

// n*m의 배열
let White =
[["W","B","W","B","W","B","W","B"],
["B","W","B","W","B","W","B","W"],
["W","B","W","B","W","B","W","B"],
["B","W","B","W","B","W","B","W"],
["W","B","W","B","W","B","W","B"],
["B","W","B","W","B","W","B","W"],
["W","B","W","B","W","B","W","B"],
["B","W","B","W","B","W","B","W"]]

let Black =
[["B","W","B","W","B","W","B","W"],
["W","B","W","B","W","B","W","B"],
["B","W","B","W","B","W","B","W"],
["W","B","W","B","W","B","W","B"],
["B","W","B","W","B","W","B","W"],
["W","B","W","B","W","B","W","B"],
["B","W","B","W","B","W","B","W"],
["W","B","W","B","W","B","W","B"]]

for i in 0...n-8 {
    for j in 0...m-8 {
        var bc = 0
        var wc = 0

        for x in 0...7 {
            for y in 0...7 {
                if arr[i+x][j+y] != Black[x][y] {bc += 1}
                if arr[i+x][j+y] != White[x][y] {wc += 1}
            }
        }
        counter.append(min(bc, wc))
    }
}
print(counter.min()!)
