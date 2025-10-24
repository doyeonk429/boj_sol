import Foundation

func solution() {
    let n = Int(readLine()!)!
    
    // 현재 회사에 있는 사람들을 저장할 Set
    var company: Set<String> = []
    
    for _ in 0..<n {
        let log = readLine()!.components(separatedBy: " ")
        let name = log[0]
        let action = log[1]
        
        if action == "enter" {
            company.insert(name)
        } else {
            company.remove(name)
        }
    }
    
    let result = company.sorted(by: >)
    
    result.forEach { print($0) }
}

solution()
