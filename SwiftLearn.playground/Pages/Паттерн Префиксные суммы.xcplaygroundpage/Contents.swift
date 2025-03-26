import Foundation

//Пример 1: Вычисление суммы на отрезке. Задача: Дан массив чисел. Необходимо быстро отвечать на запросы суммы элементов на отрезке от l до r.
func prefixSum(_ array: [Int]) -> [Int] {
    var prefix = [Int]()
    prefix.append(0) // Добавляем 0 для удобства вычислений
    for i in 0..<array.count {
        prefix.append(prefix[i] + array[i])
    }
    return prefix
}

func rangeSum(_ prefix: [Int], _ l: Int, _ r: Int) -> Int {
    return prefix[r + 1] - prefix[l]
}

// Пример использования:
let array = [1, 2, 3, 4, 5]
let prefix = prefixSum(array)
let sum = rangeSum(prefix, 1, 3) // Сумма элементов от индекса 1 до 3
print(sum) // Вывод: 9 (2 + 3 + 4)


//Пример 2: Подсчёт количества подмассивов с заданной суммой. Задача: Дан массив чисел и целевая сумма. Необходимо найти количество подмассивов, сумма элементов которых равна целевой сумме.
func countSubarraysWithSum(_ array: [Int], _ target: Int) -> Int {
    var prefix = [Int: Int]()
    prefix[0] = 1
    var currentSum = 0
    var count = 0
    
    for num in array {
        currentSum += num
        if let prefixCount = prefix[currentSum - target] {
            count += prefixCount
        }
        prefix[currentSum] = (prefix[currentSum] ?? 0) + 1
    }
    
    return count
}

// Пример использования:
let array2 = [1, 2, 3, 4, 5]
let target = 9
let result = countSubarraysWithSum(array, target)
print(result) // Вывод: 2 (подмассивы [2, 3, 4] и [4, 5])


//Пример 3: Нахождение максимальной суммы подмассива. Задача: Найти подмассив с максимальной суммой элементов.
func maxSubarraySum(_ array: [Int]) -> Int {
    var prefix = [Int]()
    prefix.append(0)
    for num in array {
        prefix.append(prefix.last! + num)
    }
    
    var minPrefix = 0
    var maxSum = Int.min
    
    for i in 1..<prefix.count {
        maxSum = max(maxSum, prefix[i] - minPrefix)
        minPrefix = min(minPrefix, prefix[i])
    }
    
    return maxSum
}

// Пример использования:
let array3 = [-2, 1, -3, 4, -1, 2, 1, -5, 4]
let result3 = maxSubarraySum(array3)
print(result) // Вывод: 6 (подмассив [4, -1, 2, 1])


//Пример 4: Нахождение среднего значения на отрезке. Задача: Дан массив чисел. Необходимо быстро отвечать на запросы среднего значения элементов на отрезке от l до r.
func prefixSum4(_ array: [Int]) -> [Int] {
    var prefix = [Int]()
    prefix.append(0)
    for num in array {
        prefix.append(prefix.last! + num)
    }
    return prefix
}

func rangeAverage(_ prefix: [Int], _ l: Int, _ r: Int) -> Double {
    let sum = prefix[r + 1] - prefix[l]
    let count = r - l + 1
    return Double(sum) / Double(count)
}

// Пример использования:
let array4 = [1, 2, 3, 4, 5]
let prefix4 = prefixSum(array4)
let average = rangeAverage(prefix, 1, 3) // Среднее значение от индекса 1 до 3
print(average) // Вывод: 3.0 ((2 + 3 + 4) / 3)

