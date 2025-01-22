// 250122 1012 boj 유기농배추 실버 2
import Foundation

let count = Int(readLine()!)!

var w = 0, h = 0
var farm: [[Bool]] = []

// 상하좌우 움직일 수 있는 방향 미리 정함
let dx: [Int] = [0, 0, -1, 1]
let dy: [Int] = [-1, 1, 0, 0]

for _ in 0..<count {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    w = input[0]
    h = input[1]
    let cabbageCount = input[2]
    
    // 배추 위치 저장
    farm = Array(repeating: Array(repeating: false, count: w), count: h)
    for _ in 0..<cabbageCount {
        let positions = readLine()!.split(separator: " ").map { Int(String($0))! }
        farm[positions[1]][positions[0]] = true
    }
    
    // 처음부터 배추 탐색 -> 새로운 배추묶음 발견하면 카운트 증가
    var count = 0
    for y in 0..<h {
        for x in 0..<w {
            if farm[y][x] {
                dfs(y: y, x: x)
                count += 1
            }
        }
    }
    
    print(count)
}

func dfs(y: Int, x: Int) {
    if farm[y][x] {
        farm[y][x] = false
        
        for i in 0..<4 {
            let nextY = y + dy[i], nextX = x + dx[i]
            if nextY >= 0 && nextY < h && nextX >= 0 && nextX < w {
            // 연결된 주변 배추도 탐색
                if farm[y+dy[i]][x+dx[i]] {
                    dfs(y: y+dy[i], x: x+dx[i])
                }
            }
        }
    }
}
