import Foundation
// 토핑의 개수 기억해두기
// 한쪽의 토핑 개수 세면, 다른쪽 것도 결정남

func solution(_ topping: [Int]) -> Int {
    var result = 0
    var leftMap = [Int: Int]()
    var rightMap = [Int: Int]()

    topping.forEach {
        rightMap[$0, default: 0] += 1
    }

    for item in topping {
        leftMap[item, default: 0] += 1
        
        rightMap[item]! -= 1
        if rightMap[item]! == 0 {
            rightMap.removeValue(forKey: item)
        }
        
        if leftMap.count == rightMap.count {
            result += 1
        }
    }
    
    return result
}