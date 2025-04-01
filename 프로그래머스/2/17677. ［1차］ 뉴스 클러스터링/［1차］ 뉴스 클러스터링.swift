import Foundation
// 자카드 유사도 계산 법
// 두 집합의 교집합 크기 / 합집합 크기
// 둘 다 공집합이면 1
// 글자를 두글자씩 끊어서 다중집합으로 만듦
// 문자열 길이 2이상 1000 이하
// 공백, 숫자, 특수문자는 버림
// 대소문자 무시

// 출력 형식 => 자카드유사도 * 65536 하고 소수점 아래 버림 -> Int로 형변환하기
// String에서 문자열만 남기기..

func solution(_ str1: String, _ str2: String) -> Int {
    let a = makeMultiSet(str1)
    let b = makeMultiSet(str2)
    
    var aDict = [String: Int]()
    var bDict = [String: Int]()
    
    for s in a {
        aDict[s, default: 0] += 1
    }
    for s in b {
        bDict[s, default: 0] += 1
    }
    
    let allKeys = Set(aDict.keys).union(bDict.keys)
    var intersectionCount = 0
    var unionCount = 0
    
    for key in allKeys {
        let aCount = aDict[key] ?? 0
        let bCount = bDict[key] ?? 0
        intersectionCount += min(aCount, bCount)
        unionCount += max(aCount, bCount)
    }
    
    if unionCount == 0 { return 65536 }
    
    let jaccard = Double(intersectionCount) / Double(unionCount)
    return Int(jaccard * 65536)
}

func makeMultiSet(_ str: String) -> [String] {
    let lower = str.lowercased()
    var result: [String] = []
    let chars = Array(lower)
    
    for i in 0..<chars.count - 1 {
        let a = chars[i]
        let b = chars[i + 1]
        
        if a.isLetter && b.isLetter {
            result.append(String([a, b]))
        }
    }
    return result
}