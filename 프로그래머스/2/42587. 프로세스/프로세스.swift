import Foundation
// 대기큐에서 꺼냄.pop : 앞에서 꺼내고, 뒤로 넣고
// 우선순위 높은애가 대기 큐에 잇으면, 방금 꺼낸 p를 다시 큐에 넣음
// --------------------- 없으면, 방ㄱ므 꺼낸 p 실행
// p는 Pop하고 종료
// 중요도 클수록 우선순위 높음
// 실행시점을 알고싶은 프로세서의 위치 P

struct Process {
    let processNum : Int
    let priority : Int
    
    init(processNum: Int, priority: Int) {
        self.processNum = processNum
        self.priority = priority
    }
}

func solution(_ priorities:[Int], _ location:Int) -> Int {
    var count = 0
    var processQueue = [Process]()
    
    for (idx, p) in priorities.enumerated() {
        processQueue.append(Process(processNum: idx, priority: p))
    }
    
    while processQueue.contains(where: { $0.processNum == location }) {
        // printProcessQueue(processQueue)
        let firstProcess = processQueue.removeFirst()
        if processQueue.contains(where: { $0.priority > firstProcess.priority }) {
            processQueue.append(firstProcess)
        } else {
            count += 1
        }
    }
    return count
}

// func printProcessQueue(_ processQueue: [Process]) {
//     var result = ""
//     for process in processQueue {
//         result += "\(process.processNum)번 프로세스(우선순위:\(process.priority)) "
//     }
//     print(result)
// }
