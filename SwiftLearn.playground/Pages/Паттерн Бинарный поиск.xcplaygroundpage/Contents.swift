import Foundation

//Пример 1: Базовый бинарный поиск. Задача: Найти индекс элемента target в отсортированном массиве.
func binarySearch(_ array: [Int], _ target: Int) -> Int? {
    var left = 0
    var right = array.count - 1
    
    while left <= right {
        let mid = left + (right - left) / 2
        
        if array[mid] == target {
            return mid // Элемент найден
        } else if array[mid] < target {
            left = mid + 1 // Ищем в правой половине
        } else {
            right = mid - 1 // Ищем в левой половине
        }
    }
    return nil // Элемент не найден
}
// Пример использования:
let array = [1, 3, 5, 7, 9, 11]
let target = 7
if let index = binarySearch(array, target) {
    print("Элемент найден на индексе: \(index)") // Вывод: Элемент найден на индексе: 3
} else {
    print("Элемент не найден")
}

print("------------------------------------------------------------------------------------------------------")

//Пример 2: Поиск первого вхождения элемента. Задача: Найти индекс первого вхождения элемента target в отсортированном массиве (массив может содержать дубликаты).
func findFirstOccurrence(_ array: [Int], _ target: Int) -> Int? {
    var left = 0
    var right = array.count - 1
    var result: Int? = nil
    
    while left <= right {
        let mid = left + (right - left) / 2
        
        if array[mid] == target {
            result = mid // Запоминаем текущий индекс
            right = mid - 1 // Продолжаем искать в левой половине
        } else if array[mid] < target {
            left = mid + 1
        } else {
            right = mid - 1
        }
    }
    return result
}
// Пример использования:
let array = [1, 2, 2, 2, 3, 4, 5]
let target = 2
if let index = findFirstOccurrence(array, target) {
    print("Первое вхождение на индексе: \(index)") // Вывод: Первое вхождение на индексе: 1
} else {
    print("Элемент не найден")
}

print("------------------------------------------------------------------------------------------------------")

//Пример 3: Поиск позиции для вставки элемента. Задача: Найти индекс, куда можно вставить элемент target в отсортированном массиве, чтобы массив остался отсортированным.
func searchInsertPosition(_ array: [Int], _ target: Int) -> Int {
    var left = 0
    var right = array.count - 1
    
    while left <= right {
        let mid = left + (right - left) / 2
        
        if array[mid] == target {
            return mid // Элемент уже существует
        } else if array[mid] < target {
            left = mid + 1
        } else {
            right = mid - 1
        }
    }
    return left // Позиция для вставки
}
// Пример использования:
let array = [1, 3, 5, 6]
let target = 4
print(searchInsertPosition(array, target)) // Вывод: 2

print("------------------------------------------------------------------------------------------------------")

//Пример 4: Поиск в rotated sorted array. Задача: Найти элемент в массиве, который был отсортирован, а затем "повернут" (например, [4, 5, 6, 7, 0, 1, 2]).
func searchInRotatedArray(_ array: [Int], _ target: Int) -> Int? {
    var left = 0
    var right = array.count - 1
    
    while left <= right {
        let mid = left + (right - left) / 2
        
        if array[mid] == target {
            return mid
        }
        
        // Левая половина отсортирована
        if array[left] <= array[mid] {
            if array[left] <= target && target < array[mid] {
                right = mid - 1
            } else {
                left = mid + 1
            }
        }
        // Правая половина отсортирована
        else {
            if array[mid] < target && target <= array[right] {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
    }
    return nil
}
// Пример использования:
let array = [4, 5, 6, 7, 0, 1, 2]
let target = 0
if let index = searchInRotatedArray(array, target) {
    print("Элемент найден на индексе: \(index)") // Вывод: Элемент найден на индексе: 4
} else {
    print("Элемент не найден")
}

print("------------------------------------------------------------------------------------------------------")
