// 2578 빙고
var board = [[Bool]](repeating: [Bool](repeating: false, count: 5), count: 5)
var pos: [Int: (Int, Int)] = [:]

for y in 0..<5 {
    let nums = readLine()!.split(separator: " ").map { Int($0)! }
    for (x, num) in nums.enumerated() {
        pos[num] = (y, x)
    }
}

mainLoop: for y in 0..<5 {
    let nums = readLine()!.split(separator: " ").map { Int($0)! }
    for (x, num) in nums.enumerated() {
        let numPos = pos[num]!
        board[numPos.0][numPos.1] = true
        if check() {
            print(y * 5 + x + 1)
            break mainLoop
        }
    }
}

func check() -> Bool {
    var count = 0
    var rSide = true
    var lSide = true
    for i in 0..<5 {
        
        // 가로 빙고 확인
        count += board[i] == [Bool](repeating: true, count: 5) ? 1 : 0
        
        // 세로 빙고 확인
        var columnBingo = true
        for j in 0..<5 {
            if !board[j][i] {
                columnBingo = false
            }
        }
        
        count += columnBingo ? 1 : 0
        
        // 대각선 빙고 확인
        if !board[i][i] {
            rSide = false
        }
        if !board[i][4 - i] {
            lSide = false
        }
    }
    count += rSide ? 1 : 0
    count += lSide ? 1 : 0
    return count > 2
}
