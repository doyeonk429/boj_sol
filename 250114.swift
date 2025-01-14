//MARK: - 250114
// 20546 기적의 매매법
// 실버 5
let printString = ["BNP", "TIMING", "SAMESAME"]
let money = Int(readLine()!)!
var Jmoney = money
var Smoney = money

var Jstock = 0
var Sstock = 0
var plus = 0
var minus = 0

let stocks = readLine()!.split(separator: " ").map{Int($0)!}

for (idx, stock) in stocks.enumerated() {
    if idx >= 1 { // 맨 앞, 뒤 제외
        let prev = stocks[idx - 1]
        if prev < stock {
            plus += 1
            minus = 0
        } else if prev > stock {
            minus += 1
            plus = 0
        }
    }

    // 준현 매수
    (Jmoney, Jstock) =  buyStock(Jmoney, stock, Jstock)

    if plus >= 3 {
        // 성민 매도
        Smoney += Sstock * stock
        Sstock = 0
    }
    
    if minus >= 3 {
        // 성민 매수
        (Smoney, Sstock) =  buyStock(Smoney, stock, Sstock)
    }    
}

let jTotal = Jmoney + Jstock*stocks.last!
let sTotal = Smoney + Sstock*stocks.last!

if jTotal > sTotal {
    print(printString[0])
} else if jTotal < sTotal {
    print(printString[1])
} else {
    print(printString[2])
}

// 매수 함수
func buyStock(_ money: Int, _ stock: Int, _ count: Int) -> (Int, Int) {
    var money = money
    var stockCount = count
    if money >= stock { // 돈이 현재 주가보다 많으면
        while money >= stock {
            if money < stock { // 돈 부족하면 멈추기
                return (money, stockCount)
            }
            money -= stock // 주식 계속 구매
            stockCount += 1
        }
    }
    return (money, stockCount)
}
