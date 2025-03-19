import Foundation

//Пример 1: Поиск пары чисел с заданной суммой в отсортированном массиве. Задача: Найти два числа в отсортированном массиве, сумма которых равна заданному значению target.
func twoSum(_ nums: [Int], _ target: Int) -> [Int]? {
    var left = 0
    var right = nums.count - 1
    
    while left < right {
        let sum = nums[left] + nums[right]
        
        if sum == target {
            print([left, right])
            print([nums[left], nums[right]])
            return [left, right]
        } else if sum < target {
            left += 1
        } else {
            right -= 1
        }
    }
    
    return nil
}
// Пример использования:
let myNums = [1, 2, 3, 4, 5]
twoSum(myNums, 5)

print("------------------------------------------------------------------------------------------------------")

//Пример 2: Удаление дубликатов в отсортированном массиве. Задача: Удалить дубликаты из отсортированного массива и вернуть новую длину массива.
func removeDuplicates(_ nums: inout [Int]) -> Int {
    guard nums.count > 1 else { return nums.count }
    
    var left = 0
    
    for right in 1..<nums.count {
        if nums[right] != nums[left] {
            left += 1
            nums[left] = nums[right]
        }
    }
    
    return left + 1
}
// Пример использования:
var nums = [1, 1, 2, 2, 3, 4, 4, 5]
let length = removeDuplicates(&nums)
print(nums[..<length]) // Вывод: [1, 2, 3, 4, 5]

print("------------------------------------------------------------------------------------------------------")

//Пример 3: Проверка, является ли строка палиндромом. Задача: Проверить, является ли строка палиндромом (читается одинаково слева направо и справа налево).
func isPalindrome(_ s: String) -> Bool {
    let chars = Array(s.lowercased().filter { $0.isNumber || $0.isLetter })
    var left = 0
    var right = chars.count - 1
    
    while left < right {
        if chars[left] != chars[right] {
            return false
        }
        left += 1
        right -= 1
    }
    
    return true
}
// Пример использования:
let s = "A man, a plan, a canal: Panama"
print(isPalindrome(s)) // Вывод: true

print("------------------------------------------------------------------------------------------------------")

//Пример 4: Контейнер с максимальной площадью. Задача: Найти два столбца, которые вместе с осью X образуют контейнер, содержащий максимальное количество воды.
func maxArea(_ height: [Int]) -> Int {
    var left = 0
    var right = height.count - 1
    var maxArea = 0
    
    while left < right {
        let currentArea = min(height[left], height[right]) * (right - left)
        maxArea = max(maxArea, currentArea)
        
        if height[left] < height[right] {
            left += 1
        } else {
            right -= 1
        }
    }
    
    return maxArea
}
// Пример использования:
let height = [1, 8, 6, 2, 5, 4, 8, 3, 7]
print(maxArea(height)) // Вывод: 49

print("------------------------------------------------------------------------------------------------------")
