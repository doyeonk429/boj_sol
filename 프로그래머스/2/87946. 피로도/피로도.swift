import Foundation

func solution(_ k:Int, _ dungeons:[[Int]]) -> Int {
    var maxCount = 0
    var visited = Array(repeating: false, count: dungeons.count)

    dfs(k, dungeons: dungeons, visited: &visited, count: 0, maxCount: &maxCount)
    return maxCount
}

func dfs(_ k: Int, dungeons: [[Int]], visited: inout [Bool], count: Int, maxCount: inout Int) {
    maxCount = max(maxCount, count)
    
    for i in 0..<dungeons.count {
        if !visited[i], k >= dungeons[i][0] {
            visited[i] = true
            dfs(k - dungeons[i][1], dungeons: dungeons, visited: &visited, count: count+1, maxCount: &maxCount)
            visited[i] = false
        }
    }
}