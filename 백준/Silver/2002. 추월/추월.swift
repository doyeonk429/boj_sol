import Foundation

func solution() {
    let n = Int(readLine()!)!
    
    // [차량번호: 입장 순위]
    var entryOrder = [String: Int]()
    for i in 0..<n {
        let car = readLine()!
        entryOrder[car] = i
    }
    
    var exitOrder = [String]()
    for _ in 0..<n {
        let car = readLine()!
        exitOrder.append(car)
    }
    
    var overtakeCount = 0
    
    for i in 0..<n {
        for j in (i+1)..<n {
            let car_i = exitOrder[i] // 먼저 나온 차
            let car_j = exitOrder[j] // 나중에 나온 차
            
            let entry_i = entryOrder[car_i]! // 먼저 나온 차의 입장 순위
            let entry_j = entryOrder[car_j]! // 나중에 나온 차의 입장 순위
            
            if entry_i > entry_j {
                overtakeCount += 1
                break
            }
        }
    }

    print(overtakeCount)
}
solution()