let n = Int(String(readLine()!))!
var s = Array(repeating: Array(repeating: 0, count: n), count: n)
var visited = Array(repeating: false, count: n)
var teamS = 0
var teamL = 0
var minResult = 99999

for i in 0..<n {
    s[i] = readLine()!.split(separator: " ").map { Int(String($0))! }
}

func dfs(depth: Int, start: Int) {
    if depth == n/2 {
        teamS = 0
        teamL = 0
        for i in 0..<n{
            for j in 0..<n{
                if visited[i] && visited[j] {
                    teamS += s[i][j]
                }
                if !visited[i] && !visited[j]{
                    teamL += s[i][j]
                }
            }
        }
        minResult = min(minResult, abs(teamS - teamL))
        return
    }
    for i in start..<n {
        if !visited[i] {
            visited[i] = true
            dfs(depth: depth + 1, start: i)
            visited[i] = false
        }
    }
}

dfs(depth: 0, start: 0)
print(minResult)
