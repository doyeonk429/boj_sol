// [문제 링크]: https://www.acmicpc.net/problem/1697

import Foundation
​
let input = readLine()!.split(separator: " ").map { Int($0)! }
let start = input[0]
let target = input[1]
​
var visited = [Bool](repeating: false, count: 100_001)
​
func bfs(start: Int, target: Int) -> Int {
    // 큐: (현재 위치, 이동 횟수)
    var queue = [(start, 0)]
    var index = 0
    
    visited[start] = true
    
    while index < queue.count {
        let (current, depth) = queue[index]
        index += 1
        
        if current == target {
            return depth
        }
        
        // 이동 가능한 위치 탐색 (앞으로, 뒤로, 순간이동)
        for next in [current - 1, current + 1, current * 2] {
            if next >= 0 && next <= 100_000 && !visited[next] {
                visited[next] = true
                queue.append((next, depth + 1))
            }
        }
    }
    
    return 0
}
​
print(bfs(start: start, target: target))