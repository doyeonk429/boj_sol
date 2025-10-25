import Foundation

func solution() {
    let tc = Int(readLine()!)!
    
    for _ in 0..<tc {
        let command = readLine()!
        let n = Int(readLine()!)!
        let inputString = readLine()!
        
        var arr: [Int] = []
        if n > 0 {
            arr = inputString.dropFirst().dropLast().split(separator: ",").map { Int($0)! }
        }
        
        var head = 0
        var tail = n - 1
        var isReversed = false
        var isError = false
        
        for c in command {
            if c == "R" {
                isReversed.toggle()
            } else { // c == "D"
                if head > tail { // 배열이 비어있음
                    isError = true
                    break
                }
                
                if isReversed {
                    tail -= 1
                } else {
                    head += 1
                }
            }
        }
        
        if isError {
            print("error")
        } else {
            if head > tail {
                print("[]")
            } else {
                let result = arr[head...tail]
                
                if isReversed {
                    print("[\(result.reversed().map { String($0) }.joined(separator: ","))]")
                } else {
                    print("[\(result.map { String($0) }.joined(separator: ","))]")
                }
            }
        }
    }
}

solution()
