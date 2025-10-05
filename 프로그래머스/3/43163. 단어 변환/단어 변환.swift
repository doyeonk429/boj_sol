import Foundation
// 만약에 target이 words에 없으면 0
// 자리가 하나만 바뀌어서 정답에 도달할 수 있는 최소 단계 -> 최소 단계? == BFS
// 한글자만 다른지 체크하는 헬퍼 구현

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    if !words.contains(target) {
        return 0
    }
    
    var queue : [(word: String, step: Int)] = [(begin, 0)]
    var visited = Set<String>()
    visited.insert(begin)
    
    while !queue.isEmpty {
        let cur = queue.removeFirst()
        
        if cur.word == target {
            return cur.step
        }
        
        for word in words {
            if !visited.contains(word) && canTransform(cur.word, word) {
                visited.insert(word)
                queue.append((word, cur.step + 1))
            }
        }
    }
    
    return 0
}

func canTransform(_ word1: String, _ word2: String) -> Bool {
    zip(word1, word2).filter { $0 != $1 }.count == 1
}