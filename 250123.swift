// MARK: - 250123 boj 2667
// 실버 1

let n: Int = Int(readLine()!)!
var graph: [[Int]] = []
var result: [Int] = []

let dx = [0, 0, -1, 1]
let dy = [-1, 1, 0, 0]

for _ in 0..<n{
    graph.append(readLine()!.map{ Int(String($0))! })
}

func dfs(x: Int, y: Int) -> Int{
    var count = 0
    
    if (x <= -1 || x >= n || y <= -1 || y >= n){
        return 0
    }
    
    if graph[x][y] == 1 {
        graph[x][y] = 0
        count += 1
        
        for i in 0...3 {
            count += dfs(x: x + dx[i], y: y + dy[i])
        }
    }
    return count
}

for i in 0 ..< graph.count{
    for j in 0..<graph[0].count{
        let tmp = dfs(x: i, y: j)
        if tmp != 0{
            result.append(tmp)
        }
    }
}

print(result.count)
for i in result.sorted(){
    print(i)
}
