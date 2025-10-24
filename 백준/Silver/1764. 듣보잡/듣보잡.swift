import Foundation

func preprocessing() {
    var noneHeard = [String]()
    var noneSeen = [String]()
    
    let input = readLine()!.split(separator: " ").map{Int($0)!}
    
    for _ in 0..<input[0] {
        noneHeard.append(readLine()!)
    }
    
    for _ in 0..<input[1] {
        noneSeen.append(readLine()!)
    }
    
    let (count, result) = solution(noneHeard, noneSeen)
    
    print(count)
    result.sorted().forEach {
        print($0)
    }
    
}

func solution(_ noneHeard: [String], _ noneSeen: [String]) -> (Int, [String]) {
    var count = 0
    var dict = [String: Int]()
    
    for name in noneHeard {
        dict[name, default: 0] += 1
    }
    
    for name in noneSeen {
        dict[name, default: 0] += 1
    }
    
    let result: [String] = Array(dict.filter { $0.value == 2 }.keys)
    
    return (result.count, result)
}

preprocessing()
