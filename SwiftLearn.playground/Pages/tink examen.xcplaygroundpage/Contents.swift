import Foundation

// 1
//func isStringValid(_ s: String) -> String {
//    guard s.count == 3 else {
//        return "No"
//    }
//
//
//    let characters = Array(s)
//
//
//    guard let indexR = characters.firstIndex(of: "R"),
//          let indexM = characters.firstIndex(of: "M") else {
//        return "No"
//    }
//
//
//    return indexR < indexM ? "Yes" : "No"
//}
//
//
//if let input = readLine() {
//    print(isStringValid(input))
//} else {
//    print("No input provided.")
//}

//2
//import Foundation
//
//func maxBouquetCost(_ a_i: Int) -> Int {
//    if a_i < 7 {
//        return -1
//    }
//
//    var k = 0
//    while (1 << (k + 1)) <= a_i {
//        k += 1
//    }
//
//    var remaining = a_i - (1 << k)
//
//    var m = 0
//    while (1 << (m + 1)) <= remaining {
//        m += 1
//    }
//
//    remaining -= (1 << m)
//
//    var p = 0
//    while (1 << (p + 1)) <= remaining {
//        p += 1
//    }
//
//    return (1 << k) + (1 << m) + (1 << p)
//}
//
//let n = Int(readLine()!)!
//for _ in 0..<n {
//    let a_i = Int(readLine()!)!
//    print(maxBouquetCost(a_i))
//}

//3
//import Foundation
//
//func minimalAdjustments() {
//    guard let firstLine = readLine()?.split(separator: " ").compactMap({ Int($0) }), firstLine.count == 2 else {
//        print("Invalid input")
//        return
//    }
//    let n = firstLine[0]
//    let k = firstLine[1]
//
//    guard let secondLine = readLine()?.split(separator: " ").compactMap({ Int($0) }), secondLine.count == n else {
//        print("Invalid input")
//        return
//    }
//    var a = secondLine
//
//    let lowerBound = a[0]
//    let upperBound = a[1]
//
//    var goodDays = 0
//    var adjustments = 0
//
//    for i in 2..<n {
//        if a[i] >= lowerBound && a[i] <= upperBound {
//            goodDays += 1
//        } else {
//            if a[i] < lowerBound {
//                adjustments += lowerBound - a[i]
//            } else if a[i] > upperBound {
//                adjustments += a[i] - upperBound
//            }
//            goodDays += 1
//        }
//
//        if goodDays >= k {
//            break
//        }
//    }
//
//    print(adjustments)
//}
//
//minimalAdjustments()

//4

//5
//import Foundation
//
//func calculateTotalParts(n: Int, s: Int, a: [Int]) -> Int {
//    var prefixSum = [Int](repeating: 0, count: n + 1)
//    for i in 1...n {
//        prefixSum[i] = prefixSum[i - 1] + a[i - 1]
//    }
//
//    var total = 0
//
//    for l in 1...n {
//        for r in l...n {
//            let sum = prefixSum[r] - prefixSum[l - 1]
//            let parts = (sum + s - 1) / s
//            total += parts
//        }
//    }
//
//    return total
//}
//
//let n = 3
//let s = 4
//let a = [3, 2, 2]
//
//let result = calculateTotalParts(n: n, s: s, a: a)
//print(result)

//6
//import Foundation
//
//func maxHappyTriples(n: Int, coordinates: [(Int, Int)]) -> Int {
//    var count = 0
//    var used = [Bool](repeating: false, count: n)
//
//    func isNonDegenerate(p1: (Int, Int), p2: (Int, Int), p3: (Int, Int)) -> Bool {
//        let area = p1.0 * (p2.1 - p3.1) + p2.0 * (p3.1 - p1.1) + p3.0 * (p1.1 - p2.1)
//        return area != 0
//    }
//
//    for i in 0..<n {
//        if used[i] { continue }
//        for j in i+1..<n {
//            if used[j] { continue }
//            for k in j+1..<n {
//                if used[k] { continue }
//                if isNonDegenerate(p1: coordinates[i], p2: coordinates[j], p3: coordinates[k]) {
//                    count += 1
//                    used[i] = true
//                    used[j] = true
//                    used[k] = true
//                    break
//                }
//            }
//            if used[j] { break }
//        }
//    }
//
//    return count
//}
//
//
//let n = 6
//let coordinates = [(1, 1), (2, 3), (1, 4), (6, 3), (4, 5), (4, 1)]
//
//let result = maxHappyTriples(n: n, coordinates: coordinates)
//print(result)

//7
//import Foundation
//
//let MOD = 998244353
//
//func solve() {
//    let input = readLine()!.split(separator: " ").map { Int($0)! }
//    let n = input[0]
//    let k = input[1]
//
//    let a = readLine()!.split(separator: " ").map { Int($0)! }
//
//    for p in 1...k {
//        var total = 0
//
//        for i in 0..<n {
//            for j in i+1..<n {
//                let sum = a[i] + a[j]
//                let powered = Int(pow(Double(sum), Double(p)))
//                total = (total + powered) % MOD
//            }
//        }
//
//        print(total)
//    }
//}
//
//solve()

//unowned var a = "AAAAAAA"
//func foo() -> String! {
//    a
//}
//print(foo())


//import Foundation
//
//struct Position: Hashable {
//    var x: Int
//    var y: Int
//}
//
//func countDuplicatePraises(_ route: String) -> Int {
//    var position = Position(x: 0, y: 0)
//    var visitedPositions = [position: 1] // Начальная позиция
//    
//    for direction in route {
//        switch direction {
//        case "U":
//            position.y += 1
//        case "D":
//            position.y -= 1
//        case "R":
//            position.x += 1
//        case "L":
//            position.x -= 1
//        default:
//            break
//        }
//        
//        visitedPositions[position] = (visitedPositions[position] ?? 0) + 1
//    }
//    
//    let duplicateCount = visitedPositions.values.filter { $0 > 1 }.count
//    return duplicateCount
//}
//
//if let route = readLine() {
//    let result = countDuplicatePraises(route)
//    print(result)
//}



//import Foundation
//
//func countRemovedNumbers(_ sequence: [Int]) -> Int {
//    var stack = [(number: Int, count: Int)]()
//    var removedCount = 0
//    
//    for number in sequence {
//        if let last = stack.last, last.number == number {
//            stack[stack.count - 1].count += 1
//        } else {
//            stack.append((number: number, count: 1))
//        }
//        
//        if stack.last?.count == 3 {
//            removedCount += 3
//            stack.removeLast()
//        }
//    }
//    
//    return removedCount
//}
//
//// Чтение входных данных
//if let input = readLine() {
//    let sequence = input.split(separator: " ").map { Int($0)! }
//    let result = countRemovedNumbers(sequence)
//    print(result)
//}


// яндекс стаж
// 1
//let n = Int(readLine()!)!
//let arr = readLine()!.split(separator: " ").map { Int($0)! }
//
//func findMinSwaps(_ arr: [Int], _ n: Int) -> [(Int, Int)] {
//    var array = arr
//    var swaps: [(Int, Int)] = []
//    
//    var left = 0
//    var right = n - 1
//    
//    while left < right {
//        
//        while left < right && array[left] == 0 {
//            left += 1
//        }
//        
//        
//        while left < right && array[right] == 1 {
//            right -= 1
//        }
//        
//        
//        if left < right {
//            array.swapAt(left, right)
//            swaps.append((left, right))
//            left += 1
//            right -= 1
//        }
//    }
//    
//    return swaps
//}
//
//
//let swaps = findMinSwaps(arr, n)
//
//
//print(swaps.count)
//for swap in swaps {
//    print(swap.0, swap.1)
//}



// 2
//import Foundation
//
//func getCharacterFromKeyboard(x: Double, y: Double, letters: [Character]) -> Character {
//    
//    if y < 1.0 {
//        
//        let index = Int(x)
//        return Character(String(index))
//    } else if y < 2.0 {
//        
//        let index = Int(x)
//        return letters[index]
//    } else if y < 3.0 {
//        
//        let index = Int(x) + 10
//        return letters[index]
//    } else {
//        
//        if x < 3.0 {
//            let index = Int(x) + 20
//            return letters[index]
//        } else if x < 7.0 {
//            
//            return " "
//        } else {
//            let index = Int(x) - 7 + 23
//            return letters[index]
//        }
//    }
//}
//
//func main() {
//    
//    guard let nInput = readLine(), let n = Int(nInput) else { return }
//    guard let lettersInput = readLine() else { return }
//    let letters = Array(lettersInput)
//    
//    var result = ""
//    
//    for _ in 0..<n {
//        guard let pointInput = readLine() else { return }
//        let point = pointInput.split(separator: " ")
//        let x = Double(point[0])!
//        let y = Double(point[1])!
//        
//        let char = getCharacterFromKeyboard(x: x, y: y, letters: letters)
//        result.append(char)
//    }
//    
//    
//    print(result)
//}
//
//
//main()



//3
//import Foundation
//
//func main() {
//    
//    guard let n = Int(readLine()!) else { return }
//    let d = readLine()!.split(separator: " ").map { Int($0)! }
//    let s = readLine()!.split(separator: " ").map { Int($0)! }
//    
//    var children = [[Int]](repeating: [], count: n)
//    for i in 0..<n {
//        let parts = readLine()!.split(separator: " ").map { Int($0)! }
//        let k = parts[0]
//        if k > 0 {
//            
//            let kids = parts[1...].map { $0 - 1 }
//            children[i] = kids
//        }
//    }
//    
//    var times = [Int](repeating: -1, count: n)
//    times[0] = 0
//    var maxTime = 0
//    var queue = [0]
//    
//    var index = 0
//    while index < queue.count {
//        let node = queue[index]
//        index += 1
//        
//        var sum = 0
//        for child in children[node] {
//            let currentMax = max(s[node], d[child])
//            sum += currentMax
//            let childTime = times[node] + sum
//            
//            if times[child] == -1 {
//                times[child] = childTime
//                maxTime = max(maxTime, childTime)
//                queue.append(child)
//            }
//        }
//        
//
//        let nodeEndTime = times[node] + sum
//        maxTime = max(maxTime, nodeEndTime)
//    }
//    
//    print(maxTime)
//}
//
//main()


// 4

//let n = Int(readLine()!)!
//let s = Array(readLine()!)
//
//func findMinimumSplit() -> Int {
//    
//    var prefixCounts: [Character: [Int]] = [:]
//    
//    
//    for i in 0..<n {
//        let char = s[i]
//        if prefixCounts[char] == nil {
//            prefixCounts[char] = Array(repeating: 0, count: n + 1)
//        }
//        for (key, var counts) in prefixCounts {
//            counts[i + 1] = counts[i] + (key == char ? 1 : 0)
//            prefixCounts[key] = counts
//        }
//    }
//    
//    var dp = Array(repeating: Int.max, count: n + 1)
//    dp[0] = 0
//    
//    
//    for i in 1...n {
//        for j in 0..<i {
//            let len = i - j
//            let isValid = prefixCounts.values.contains { counts in
//                counts[i] - counts[j] > len / 2
//            }
//            if isValid {
//                dp[i] = min(dp[i], dp[j] + 1)
//            }
//        }
//    }
//    
//    return dp[n]
//}
//
//print(findMinimumSplit())



// 5

//func getElement(_ n: Int, _ index: Int) -> Int {
//    if n == 1 {
//        return 1
//    }
//    
//    let prevLength = (1 << (n - 1)) - 1
//    
//    if index < prevLength {
//        return getElement(n - 1, index)
//    } else if index == prevLength {
//        return n
//    } else {
//        return getElement(n - 1, index - prevLength - 1)
//    }
//}
//
//
//let input = readLine()!.split(separator: " ").map { Int($0)! }
//let n = input[0]
//let l = input[1]
//let r = input[2]
//
//
//var sum = 0
//for i in l...r {
//    sum += getElement(n, i)
//}
//
//print(sum)
