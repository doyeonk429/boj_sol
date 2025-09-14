import Foundation

func solution(_ n:Int, _ k:Int) -> Int {
    let s = String(n, radix: k)
    let parts = s.split(separator: "0")

    var count = 0
    
    for p in parts {
        if let val = Int64(p), isPrime(val) {
            count += 1
        }
    }
    
    return count
}

func isPrime(_ x: Int64) -> Bool {
    if x <= 1 { return false }
    if x <= 3 { return true }
    if x % 2 == 0 { return false }
    
    var i: Int64 = 3
    while i * i <= x {
        if x % i == 0 { return false }
        i += 2
    }
    return true
}