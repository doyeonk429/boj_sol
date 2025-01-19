// 프로그래머스
// Lv.2 점프와 순간 이동
import Foundation

func solution(_ n:Int) -> Int 
{
    var n = n
    var ans:Int = 0
    while (n > 2) {
        if n % 2 == 0 {
            n = n/2
        } else {
            n -= 1
            ans += 1
        }
    }

    return ans+1
}
