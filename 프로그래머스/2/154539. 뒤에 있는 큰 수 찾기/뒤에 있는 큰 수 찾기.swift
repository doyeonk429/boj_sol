import Foundation
// 정수만 있는 int 배열
// 자기보다 뒤에있는 숫자 중에서 크면서 가장 가까이 있는 수 -> '뒷 큰수'
// 모든 원소에 대한 뒷큰수를 담은 배열
// 없으면 -1

// 1안
// {인덱스 : 숫자}
// 지금 인덱스보다 큰 인덱스 ~ 배열의 끝 인덱스까지만 돌면서
// 현재 숫자보다 크면 배열에 해당 숫자 추가
// 없으면 -1 추가

// 2안
// 아직 답을 못 찾은 인덱스들을 갖고 있기 -> 내림차순이어야 가장 가까운 원소 찾음
// 첫 번째 원소를 스택에 넣고
// 다음 원소를 보자마자, 스택 맨 위 값보다 크면 → 그 인덱스의 답은 “현재 원소”
// 답이 정해진 원소는 스택에서 제거(pop).
// 현재 원소 인덱스를 스택에 넣음.
// 이걸 반복

func solution(_ numbers:[Int]) -> [Int] {
    var result = Array(repeating: -1, count: numbers.count)
    var stack = [Int]() // 아직 '뒷 큰수'를 못 찾은 인덱스를 담는 스택
    
    for i in 0..<numbers.count {
        // 현재 값(numbers[i])이 스택 맨 위 인덱스의 값보다 크다면
        // 그 인덱스의 '뒷 큰수'는 현재 값이 된다
        // stack.isEmpty -> break 조건으로 쓰면 안되는 이유:
        // 스택에 값이 남아있을수잇음(-1인 아이들)
        
        while !stack.isEmpty && numbers[i] > numbers[stack.last!] {
            let idx = stack.removeLast()
            result[idx] = numbers[i]
        }
        
        // 현재 인덱스는 아직 '뒷 큰수'가 미정이므로 스택에 넣는다
        stack.append(i) 
    }
    
    return result
}