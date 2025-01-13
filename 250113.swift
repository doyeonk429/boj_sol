// 1547 공
// 브론즈 3

let m = Int(readLine()!)!
var currentPosition = 1

for _ in 0..<m {
    let change = readLine()!.split(separator: " ").map { Int($0)! }
    let (x, y) = (change[0], change[1])
    
    if currentPosition == x {
        currentPosition = y
    } else if currentPosition == y {
        currentPosition = x
    }
}

print(currentPosition)
