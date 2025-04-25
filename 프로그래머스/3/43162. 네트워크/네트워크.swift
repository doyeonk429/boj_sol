import Foundation
// dfs 해서 개수 구하기
// computers.count == n
// computers[0].count == n
// computers[i][i] -> 자기자신이므로 항상 1

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    var graph : [[Int]] = makeGraph(n, computers)
    var visited = Array(repeating: false, count: n)
    
    var count = 0
    
    for i in 0..<n {
        if !visited[i] {
            dfs(i, graph: &graph, visited: &visited)
            count += 1
        }
    }
    
    return count
}

func dfs(_ node: Int, graph: inout [[Int]], visited: inout [Bool]) {
    visited[node] = true
    
    for next in graph[node] {
        if !visited[next] {
            dfs(next, graph: &graph, visited: &visited)
        }
    }
}

func makeGraph(_ n:Int, _ computers:[[Int]]) -> [[Int]] {
    var graph = [[Int]]()
    
    for (idx, com) in computers.enumerated() {
        var network = [Int]()
        
        for (i, node) in com.enumerated() {
            if idx != i && node != 0 {
                network.append(i)
            }
        }
        graph.append(network)
    }
    
    return graph
}