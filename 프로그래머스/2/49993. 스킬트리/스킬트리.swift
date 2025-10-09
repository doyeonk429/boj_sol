import Foundation

func solution(_ skill: String, _ skill_trees: [String]) -> Int {
    var answer = 0
    
    for tree in skill_trees {
        let filtered = tree.filter { skill.contains($0) }
        let filteredStr = String(filtered)
        
        if skill.hasPrefix(filteredStr) {
            answer += 1
        }
    }
    
    return answer
}