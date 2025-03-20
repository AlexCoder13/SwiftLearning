import Foundation

//Пример 1: Максимальная сумма подмассива фиксированного размера. Задача: Найти подмассив размера k с максимальной суммой.
func maxSumSubarray(_ array: [Int], _ k: Int) -> Int {
    guard array.count >= k else { return 0 }
    
    var windowSum = array[0..<k].reduce(0, +)
    var maxSum = windowSum
    
    for i in k..<array.count {
        windowSum += array[i] - array[i - k]
        maxSum = max(maxSum, windowSum)
    }
    return maxSum
}
// Пример использования:
let array = [1, 3, 2, 4, 8, 5, 2]
let k = 3
print(maxSumSubarray(array, k)) // Вывод: 17 (подмассив [4, 8, 5])

print("------------------------------------------------------------------------------------------------------")

//Пример 2: Минимальный размер подмассива с суммой не меньше целевой. Задача: Найти минимальный размер подмассива, сумма элементов которого не меньше заданного значения target.
func minSubarrayLength(_ array: [Int], _ target: Int) -> Int {
    var minLength = Int.max
    var windowSum = 0
    var left = 0
    
    for right in 0..<array.count {
        windowSum += array[right]
        
        while windowSum >= target {
            minLength = min(minLength, right - left + 1)
            windowSum -= array[left]
            left += 1
        }
    }
    
    return minLength == Int.max ? 0 : minLength
}

// Пример использования:
let array = [2, 3, 1, 2, 4, 3]
let target = 7
print(minSubarrayLength(array, target)) // Вывод: 2 (подмассив [4, 3])

print("------------------------------------------------------------------------------------------------------")

//Пример 3: Самая длинная подстрока без повторяющихся символов. Задача: Найти длину самой длинной подстроки без повторяющихся символов.
func longestUniqueSubstring(_ s: String) -> Int {
    let characters = Array(s)
    var charSet = Set<Character>()
    var maxLength = 0
    var left = 0
    
    for right in 0..<characters.count {
        while charSet.contains(characters[right]) {
            charSet.remove(characters[left])
            left += 1
        }
        charSet.insert(characters[right])
        maxLength = max(maxLength, right - left + 1)
    }
    
    return maxLength
}

// Пример использования:
let s = "abcabcbb"
print(longestUniqueSubstring(s)) // Вывод: 3 (подстрока "abc")

print("------------------------------------------------------------------------------------------------------")

//Пример 4: Подсчёт подмассивов с суммой, равной целевой. Задача: Найти количество подмассивов, сумма элементов которых равна заданному значению target.
func countSubarraysWithSum(_ array: [Int], _ target: Int) -> Int {
    var prefixSumCounts = [0: 1]
    var currentSum = 0
    var count = 0
    
    for num in array {
        currentSum += num
        if let prefixCount = prefixSumCounts[currentSum - target] {
            count += prefixCount
        }
        prefixSumCounts[currentSum] = (prefixSumCounts[currentSum] ?? 0) + 1
    }
    
    return count
}

// Пример использования:
let array = [1, 0, 1, 1, 1]
let target = 2
print(countSubarraysWithSum(array, target)) // Вывод: 4

print("------------------------------------------------------------------------------------------------------")
