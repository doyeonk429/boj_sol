// 진법 n
// 미리 구할 숫자의 개수 t
// 게임 인원 m
// 튜브 순서 p

func solution(_ n:Int, _ t:Int, _ m:Int, _ p:Int) -> String {
    var result = ""
    
    for i in 0...t*m+1 {
        result += convertNumToBase(i, base: n)
    }
    
    return String(String(result.enumerated().compactMap{ ($0+1) % m == (p % m) ? $1 : nil}).prefix(t))
}

func convertNumToBase(_ number: Int, base: Int) -> String {
    // 2 ~ 16 사이인지 확인
    guard base >= 2 && base <= 16 else {
        return ""
    }
    
    if number == 0 { return "0" }
    
    let isNegative = number < 0
    var n = abs(number)
    
    let digitChars = Array("0123456789ABCDEF")
    var result = ""
    
    while n > 0 {
        let remainder = n % base
        result = String(digitChars[remainder]) + result
        n /= base
    }
    
    if isNegative {
        result = "-" + result
    }
    
    return result
}

// 숫자를 쭉 나열 t*m까지
// 그 결과를 하나의 문자열에 넣기 -> m으로 나눠 + p의 인덱스에 있는 값만 모으기