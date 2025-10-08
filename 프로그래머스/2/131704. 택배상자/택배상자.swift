import Foundation
// 컨테이너 벨트 -> 큐
// 보조 컨테이너 벨트 -> 스택

func solution(_ order:[Int]) -> Int {
    var answer = 0
    var subStack = [Int]()
    var currentBox = 1  // 현재 메인 컨테이너에서 나올 상자 번호
    
    for target in order {
        // 메인에서 target까지 가져오기
        while currentBox < target {
            subStack.append(currentBox)
            currentBox += 1
        }
        
        // 메인에서 바로 실을 수 있는 경우
        if currentBox == target {
            answer += 1
            currentBox += 1
        }
        
        // 보조에서 꺼낼 수 있는 경우
        else if !subStack.isEmpty && subStack.last == target {
            subStack.removeLast()
            answer += 1
        }
        
        // 둘 다 불가능
        else {
            break
        }
    }
    
    return answer
}