import Foundation

let input = readLine()!.split(separator: " ").map{Int($0)!}
let n = input[0]
let m = input[1]
var arr = (0..<n).map { _ in Array(readLine()!).map {Int(String($0))!}}
var result = 1

for size in 1..<min(n,m) {
    for y in 0..<n-size {
        for x in 0..<m-size {
            let p1 = arr[y][x]
            let p2 = arr[y][x+size]
            let p3 = arr[y+size][x]
            let p4 = arr[y+size][x+size]
            
            if p1 == p2 && p2 == p3 && p3 == p4 {
                result = (size+1)*(size+1)
            }
        }
    }
}
print(result)
