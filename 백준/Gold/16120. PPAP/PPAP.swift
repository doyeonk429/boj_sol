import Foundation

// 1. FileIO (빠른 입력)
final class FileIO {
    private let buffer:[UInt8]
    private var index: Int = 0

    init(fileHandle: FileHandle = FileHandle.standardInput) {
        self.buffer = try! fileHandle.readToEnd()! + [UInt8(0)]
    }

    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }
        return buffer[index]
    }

    @inline(__always) func readString() -> String {
        var str = ""
        var now = read()
        while now == 10 || now == 32 { now = read() }
        while now != 10 && now != 32 && now != 0 {
            str += String(bytes: [now], encoding: .ascii)!
            now = read()
        }
        return str
    }
}

// 2. [수정된] solution 함수 (직접 인덱싱)
func solution(_ str: String) -> Bool {
    var stack = [Character]()
    
    for char in str {
        if char == "P" {
            // [최적화] suffix 대신 직접 인덱스 접근
            if stack.count >= 3 && 
               stack.last! == "A" && 
               stack[stack.count-2] == "P" && 
               stack[stack.count-3] == "P" {
                
                stack.removeLast(3)
            }
            stack.append("P")
            
        } else { // "A"
            // [최적화] suffix 대신 직접 인덱스 접근
            if stack.count >= 2 && 
               stack.last! == "P" && 
               stack[stack.count-2] == "P" {
                
                stack.append("A")
            } else {
                return false
            }
        }
    }
    
    if stack.count == 1 && stack.first! == "P" {
        return true
    } else {
        return false
    }
}

// 3. 메인 로직
let fileIO = FileIO()
let n = fileIO.readString()

if solution(n) {
    print("PPAP")
} else {
    print("NP")
}