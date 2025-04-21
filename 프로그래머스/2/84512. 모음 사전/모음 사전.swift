import Foundation

func solution(_ word:String) -> Int {
    let wordList = ["A", "E", "I", "O", "U"]
    var count = 0
    var isFound = false
    
    func backtracking(_ current: String) {
        if isFound || current.count > 5 { return }
        
        count += 1
        if current == word {
            isFound = true
            return
        }
        
        for char in wordList {
            backtracking(current + char)
        }
    }
    
    backtracking("")
    return count - 1
}