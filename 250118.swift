//MARK: - 250118 연산자 끼워넣기 14888
let n = Int(readLine()!)!
let nums = readLine()!.split(separator: " ").map { Int($0)! }
var operations = readLine()!.split(separator: " ").map { Int($0)! }
var maxValue = Int.min
var minValue = Int.max

func dfs(answer: Int, depth: Int) {
    if depth == n {
        maxValue = max(maxValue, answer)
        minValue = min(minValue, answer)
    }
    
    for i in 0..<4 {
        if operations[i] == 0 {
            // 쓸 수 있는 연산자 없음
            continue
        }
        
        operations[i] -= 1
        
        switch i {
        case 0:
            dfs(answer: answer + nums[depth], depth: depth + 1)
        case 1:
            dfs(answer: answer - nums[depth], depth: depth + 1)
        case 2:
            dfs(answer: answer * nums[depth], depth: depth + 1)
        case 3:
            dfs(answer: answer / nums[depth], depth: depth + 1)
        default:
            break
        }
        
        operations[i] += 1
    }
    
}

dfs(answer: nums[0], depth: 1)
print(maxValue)
print(minValue)
