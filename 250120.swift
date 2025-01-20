import Foundation

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let N = input[0]
let M = input[1]
let start = input[2]

var graph : [[Int]] = Array(repeating: [], count: N+1)
var check = Array(repeating: false, count: N+1)
var result = ""

for _ in 0..<M {
    let graphInput = readLine()!.split(separator: " ").map{Int(String($0))!}
    let a = graphInput[0]
    let b = graphInput[1]
    graph[a].append(b)
    graph[b].append(a)
    graph[a].sort()
    graph[b].sort()
}

func dfs(_ now:Int) {
    check[now] = true
    result += "\(now) "
    for i in graph[now] {
        if !check[i] {
            dfs(i)
        }
    }
}

func bfs(_ now: Int) {
    var needVisited: [Int] = [now]
    var visited = Set<Int>()
    
    while !needVisited.isEmpty {
        let node = needVisited.removeFirst()
        if !visited.contains(node) {
            visited.insert(node)
            result += "\(node) "
            needVisited.append(contentsOf: graph[node])
        }
    }
}

dfs(start)
print(result)
result = ""
bfs(start)
print(result)
