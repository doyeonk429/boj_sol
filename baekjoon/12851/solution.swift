// [문제 링크]: https://www.acmicpc.net/problem/12851

import Foundation
​
let input = readLine()!.split(separator: " ").map { Int($0)! }
let start = input[0]
let target = input[1]
​
var visited = [Bool](repeating: false, count: 100_001)
​
func bfs(start: Int, target: Int) -> (Int, Int) {
    var queue = [(start, 0)]
    var visited = [Int](repeating: -1, count: 100_001)
    var index = 0
    var ways = 0
    var minDepth = Int.max
    
    visited[start] = 0
​
    while index < queue.count {
        let (current, depth) = queue[index]
        index += 1
​
        if current == target {
            if depth < minDepth {
                minDepth = depth
                ways = 1
            } else if depth == minDepth {
                ways += 1
            }
            continue
        }
​
        for next in [current - 1, current + 1, current * 2] {
            if next >= 0 && next <= 100_000 {
                if visited[next] == -1 || visited[next] == depth + 1 {
                    visited[next] = depth + 1
                    queue.append((next, depth + 1))
                }
            }
        }
    }
​
    return (minDepth, ways)
}
​
let (best, num) = bfs(start: start, target: target)
print(best)
print(num)
​
​