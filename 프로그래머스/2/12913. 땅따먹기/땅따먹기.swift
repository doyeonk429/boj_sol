import Foundation

func solution(_ land:[[Int]]) -> Int{
    var answer = land
    
    for i in 0..<answer.count - 1 {
        answer[i+1][0] += max(answer[i][1], answer[i][2], answer[i][3])
        answer[i+1][1] += max(answer[i][0], answer[i][2], answer[i][3])
        answer[i+1][2] += max(answer[i][0], answer[i][1], answer[i][3])
        answer[i+1][3] += max(answer[i][0], answer[i][1], answer[i][2])
    }
    
    return answer.last!.max()!
}