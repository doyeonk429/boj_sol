import Foundation

func solution(_ cacheSize:Int, _ cities:[String]) -> Int {
    var time = 0
    var cache = [String]()
    
    if cacheSize == 0 {
        return 5*cities.count
    }
    
    for city in cities.map({$0.lowercased()}) {
        if let index = cache.firstIndex(of: city) {
            time += 1
            cache.remove(at: index)
            cache.append(city) // 최근 사용 위치로 보내줌
        } else {
            time += 5
            if cache.count >= cacheSize {
                cache.removeFirst()
            }
            cache.append(city)
        }
    }
    return time
}