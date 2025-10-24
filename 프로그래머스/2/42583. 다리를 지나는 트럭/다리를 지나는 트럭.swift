import Foundation

// bridge_length만큼 걸림
// weight >= 현재 다리 위에잇는 truck_weights
func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    var waitingTrucks = truck_weights // 대기 트럭
    var bridgeTrucks: [Int] = [] // 현재 다리 위 트럭들의 무게
    var exitTimes: [Int] = [] // 각 트럭이 다리를 벗어나는 시간
    var currentWeight = 0
    var time = 0
    
    while !waitingTrucks.isEmpty || !bridgeTrucks.isEmpty {
        time += 1
        
        // 다리를 벗어나는 트럭 확인 -> 다리건너는트럭이 있고, 그것중에서 벗어나는 트럭이 있다면
        if !exitTimes.isEmpty && exitTimes.first == time {
            currentWeight -= bridgeTrucks.removeFirst()
            exitTimes.removeFirst()
        }
        
        // 대기 중인 트럭이 다리에 올라갈 수 있는지 확인
        if !waitingTrucks.isEmpty && currentWeight + waitingTrucks.first! <= weight && bridgeTrucks.count < bridge_length {
            let truck = waitingTrucks.removeFirst()
            bridgeTrucks.append(truck)
            exitTimes.append(time + bridge_length)
            currentWeight += truck
        }
    
    }
    return time
}