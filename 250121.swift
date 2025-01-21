// 250121
// https://www.acmicpc.net/problem/11724
// 실버 2 - 연결 요소의 개수

import Foundation

var input = readLine()!.split(separator: " ").map{Int($0)!}

var N = input[0]
var M = input[1]

var node:[[Int]] = Array(repeating: [], count: N+1)
var visited = Array(repeating: false, count: N+1)

var s = Array<Int>()

for _ in 0..<M {
    var tmp = readLine()!.split(separator: " ").map{Int($0)!}
    node[tmp[0]].append(tmp[1])
    node[tmp[1]].append(tmp[0])
}

func dfs(_ start: Int) {
    
    s.append(start)
    visited[start] = true
    
    while !s.isEmpty {
        var c_node = s.removeLast()
        
        for n in node[c_node] {
        
            if !visited[n] {
                dfs(n)
            }
        }
        
    }
}

var cnt = 0
for i in 1...N {
    if !visited[i] {
        cnt += 1
        dfs(i)
    }
}

print(cnt)
