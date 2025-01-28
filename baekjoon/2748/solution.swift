// [문제 링크]: https://www.acmicpc.net/problem/2748

guard let n = Int(readLine()!) else { fatalError() }
​
func fibonacci(_ n: Int) -> Int {
    var numbers: [Int] = [0,1,1]
    for i in 0...n {
        if i == 0 || i == 1 || i == 2{
            continue
        } else {
            numbers.append(numbers[i-1] + numbers[i-2])
        }
    }
    return numbers[n]
}
​
print(fibonacci(n))