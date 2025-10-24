import Foundation

func preprocessing() {
    let tc = Int(readLine()!)!
    
    for _ in 1...tc {
        let input = readLine()!.split(separator: " ").map{Int($0)!}
        let priority = readLine()!.split(separator: " ").map{Int($0)!}
        print(printer(input[0], input[1], priority))
    }
}

func printer(_ count: Int, _ loc: Int, _ priors: [Int]) -> Int {
    var queue = [(Int, Int)]()
    for (idx, p) in priors.enumerated() {
        queue.append((idx, p))
    }
    
    var printCount = 0
    
    while !queue.isEmpty {
        let current = queue.removeFirst()
        
        // 우선순위가 1등이아니면
        if let maxPriority = queue.map({ $0.1 }).max(),
           maxPriority > current.1 {
            queue.append(current)
        } else {
            printCount += 1
            
            if current.0 == loc {
                return printCount
            }
        }
    }
    
    return printCount
}

preprocessing()
