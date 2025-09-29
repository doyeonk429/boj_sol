func solution(_ msg: String) -> [Int] {
    var dict: [Substring: Int] = [:]
    dict.reserveCapacity(26 + msg.count)
    var nextIndex = 27
    var output = [Int]()
    var start = msg.startIndex

    // 초기 사전 세팅 A..Z -> 1..26
    for i in 0..<26 {
        let scalar = UnicodeScalar(65 + i)!
        let s = String(Character(scalar))
        dict[Substring(s)] = i + 1
    }

    while start < msg.endIndex {
        var end = start
        var lastFound = start

        while end < msg.endIndex {
            let candidate = msg[start...end]
            if dict[candidate] != nil {
                lastFound = end
                end = msg.index(after: end)
            } else {
                break
            }
        }

        let w = msg[start...lastFound]
        if let idx = dict[w] {
            output.append(idx)
        } else {
            break
        }

        // w 뒤에 문자가 있으면 w+c를 사전에 추가
        let maybeCIndex = msg.index(after: lastFound)
        if maybeCIndex != msg.endIndex {
            let newEntry = msg[start...maybeCIndex]
            dict[newEntry] = nextIndex
            nextIndex += 1
        }

        // start를 w 다음 문자로 이동
        start = msg.index(after: lastFound)
    }

    return output
}
