/*
1 = 땅, 0 = 물
상하좌우로 연결된 땅 = 섬
섬의 개수는?
*/

class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        var grid = grid
        var count = 0

        func dfs(_ i: Int, _ j: Int) {
            if i < 0 || i >= grid.count || j < 0 || j >= grid[0].count || grid[i][j] == "0" {
                return
            }

            grid[i][j] = "0"

            dfs(i+1, j)
            dfs(i-1, j)
            dfs(i, j+1)
            dfs(i, j-1)
        }

        for i in 0..<grid.count {
            for j in 0..<grid[0].count {
                if grid[i][j] == "1" {
                    count += 1
                    dfs(i, j)  // 연결된 모든 땅 방문
                }
            }
        }

        return count
    }
}