import Foundation
// 두 패가 같고, 숫자 크면 이득
// 두캐가 다르고, 합의 자릿수가 클수록 이득
var lose = 0 ,win = 0
let q = readLine()!.split(separator: " ").map{Int($0)!}
var card = Array(1...10) + Array(1...10)

func getCombi(_ idx : Int, _ sum : [Int], _ mn : Int, _ mx : Int, _ count : Int) -> Int {
    if count == 2 {
        if Set(sum).count == 1  { return  0 }
        let s = sum[0]+sum[1]
        if mn <= s % 10 && s % 10 <= mx { return 1 }
        return 0
    }
    var ret = 0
    for i in idx..<card.count  {
        ret += getCombi(i+1, sum+[card[i]], mn, mx,count+1)
    }
    return ret
}
// 내 카드 지우기
card.remove(at: card.firstIndex(of: q[0])!)
card.remove(at: card.firstIndex(of: q[1])!)

if q[0] == q[1] {
  // 땡
    lose += 10 - q[0]
    win += getCombi(0, [], 0, 9, 0) + q[0] - 1
} else {
  // 끗
    lose += getCombi(0, [], (q[0]+q[1]) % 10, 9, 0) + (10-2)
    win += getCombi(0, [], 0, (q[0]+q[1]) % 10 - 1, 0)
}

let ans = Double(win)/Double(win+lose)
print(String(format:"%.3f",round(ans * 1000)/1000))
