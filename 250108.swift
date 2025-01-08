//MARK: - 250108 
// 10448 유레카이론
// 브론즈 1
import Foundation
// 1000까지 삼각수 구하고 조합찾기
var triNum: [Int] = []
var i = 1
while (true) {
    let result = (i*(i+1))/2
    if result <= 1000 {
        triNum.append(result)
    } else {
        break
    }
    i += 1
}
let count = Int(readLine()!)!
for _ in 0..<count {
    let input = Int(readLine()!)!
    var result = 0
    outer: for i in triNum {
        for j in triNum {
            for k in triNum {
                if i + j + k == input {
                    result = 1
                    break outer
                }
            }
        }
    }
    print(result)
}
