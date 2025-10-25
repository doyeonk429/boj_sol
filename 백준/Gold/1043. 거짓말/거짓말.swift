import Foundation

struct UnionFind {
    var parent: [Int]
    
    init(_ n: Int) {
        parent = Array(0...n)
    }
    
    mutating func find(_ x: Int) -> Int {
        if parent[x] != x {
            parent[x] = find(parent[x])
        }
        return parent[x]
    }
    
    mutating func union(_ x: Int, _ y: Int) {
        let rootX = find(x)
        let rootY = find(y)
        if rootX != rootY {
            parent[rootY] = rootX
        }
    }
}

// 입력 받기
let firstLine = readLine()!.split(separator: " ").map { Int($0)! }
let n = firstLine[0]  // 사람 수
let m = firstLine[1]  // 파티 수

let truthLine = readLine()!.split(separator: " ").map { Int($0)! }
let truthCount = truthLine[0]
var truthPeople = Set<Int>()
if truthCount > 0 {
    for i in 1...truthCount {
        truthPeople.insert(truthLine[i])
    }
}

var parties: [[Int]] = []
for _ in 0..<m {
    let partyLine = readLine()!.split(separator: " ").map { Int($0)! }
    let partySize = partyLine[0]
    var party: [Int] = []
    for i in 1...partySize {
        party.append(partyLine[i])
    }
    parties.append(party)
}

// Union-Find 초기화
var uf = UnionFind(n)

// 각 파티의 사람들을 union
for party in parties {
    for i in 1..<party.count {
        uf.union(party[0], party[i])
    }
}

// 진실을 아는 사람들의 root 찾기
var truthRoots = Set<Int>()
for person in truthPeople {
    truthRoots.insert(uf.find(person))
}

// 거짓말 가능한 파티 개수 세기
var answer = 0
for party in parties {
    var canLie = true
    for person in party {
        if truthRoots.contains(uf.find(person)) {
            canLie = false
            break
        }
    }
    if canLie {
        answer += 1
    }
}

print(answer)