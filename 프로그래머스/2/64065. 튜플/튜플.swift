import Foundation
// 중복 없음
// 순열? 조합? 요런 느낌으로 {} 생성
// 그 안에서 숫자만 뽑으면 될 듯?
// a1 a1,a2 a1,a2,a3,a4 ....이런식으로 적은 개수의 튜플이면 앞이야..
// 스택?

func solution(_ s:String) -> [Int] {
    var result = [Int]()
    var stack = [[Int]]()
    let charlist = Array(s)
    var s = [Int]()
    var number = ""
    for c in charlist {
        // 튜플 묶음
        if c == "}" {
            if !number.isEmpty {
                s.append(Int(number)!)
            }
            stack.append(s)
            s = []
            number = ""
        }
        
        if c.isNumber {
            number += String(c)
        }
        
        if c == "," && number != "" {
            s.append(Int(number)!)
            number = ""
        }
    }
    if stack.isEmpty { return [] }
    stack.sort { $0.count < $1.count }
    
    var seen = Set<Int>()
    for tuple in stack {
        for num in tuple {
            if !seen.contains(num) {
                seen.insert(num)
                result.append(num)
            }
        }
    }
    return result
}