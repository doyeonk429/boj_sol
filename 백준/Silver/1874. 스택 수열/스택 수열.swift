import Foundation
func solution() {
    let n = Int(readLine()!)!
    
    var targetQueue: [Int] = []
    for _ in 0..<n {
        targetQueue.append(Int(readLine()!)!)
    }
    
    var stack: [Int] = []
    var answer: [String] = []
    
    var pushNum = 1
    
    while !targetQueue.isEmpty {
        let targetNum = targetQueue.first!

        if pushNum <= targetNum {
            stack.append(pushNum)
            answer.append("+")
            pushNum += 1
        }
        else if stack.last == targetNum {
            stack.popLast()
            targetQueue.removeFirst()
            answer.append("-")
        }
        else {
            print("NO")
            return
        }
    }

    answer.forEach {
        print($0)
    }
}

solution()
