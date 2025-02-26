import Foundation

let computer = Int(readLine()!)!
let link = Int(readLine()!)!
var graph = [Int: [Int]]()

(1...computer).forEach {
    graph[$0] = []
}

for _ in 0..<link {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    graph[input[0]]?.append(input[1])
    graph[input[1]]?.append(input[0])
}

var visited = Array(repeating: false, count: computer + 1)

func dfs(_ node: Int) {
    visited[node] = true
    
    if let graphs = graph[node] {
        for i in graphs {
            if !visited[i] {
                dfs(i)
            }
        }
    }
}

dfs(1)
print(visited.filter { $0 }.count - 1)
