import Foundation

//Пример 1: Сортировка слиянием (Merge Sort). Задача: Отсортировать массив.
func mergeSort(_ array: [Int]) -> [Int] {
    guard array.count > 1 else { return array }
    
    let middle = array.count / 2
    let left = mergeSort(Array(array[0..<middle]))
    let right = mergeSort(Array(array[middle..<array.count]))
    
    return merge(left, right)
}

func merge(_ left: [Int], _ right: [Int]) -> [Int] {
    var result = [Int]()
    var i = 0
    var j = 0
    
    while i < left.count && j < right.count {
        if left[i] < right[j] {
            result.append(left[i])
            i += 1
        } else {
            result.append(right[j])
            j += 1
        }
    }
    
    while i < left.count {
        result.append(left[i])
        i += 1
    }
    
    while j < right.count {
        result.append(right[j])
        j += 1
    }
    
    return result
}

// Пример использования:
let array = [38, 27, 43, 3, 9, 82, 10]
let sortedArray = mergeSort(array)
print(sortedArray) // Вывод: [3, 9, 10, 27, 38, 43, 82]


//Пример 2: Быстрая сортировка (Quick Sort). Задача: Отсортировать массив.
func quickSort(_ array: [Int]) -> [Int] {
    guard array.count > 1 else { return array }
    
    let pivot = array[array.count / 2]
    let less = array.filter { $0 < pivot }
    let equal = array.filter { $0 == pivot }
    let greater = array.filter { $0 > pivot }
    
    return quickSort(less) + equal + quickSort(greater)
}

// Пример использования:
let array = [38, 27, 43, 3, 9, 82, 10]
let sortedArray = quickSort(array)
print(sortedArray) // Вывод: [3, 9, 10, 27, 38, 43, 82]


//Пример 3: Поиск максимального элемента в массиве. Задача: Найти максимальный элемент в массиве.
func findMax(_ array: [Int], _ start: Int, _ end: Int) -> Int {
    if start == end {
        return array[start]
    }
    
    let middle = (start + end) / 2
    let maxLeft = findMax(array, start, middle)
    let maxRight = findMax(array, middle + 1, end)
    
    return max(maxLeft, maxRight)
}

// Пример использования:
let array = [38, 27, 43, 3, 9, 82, 10]
let maxElement = findMax(array, 0, array.count - 1)
print(maxElement) // Вывод: 82


//Пример 4: Умножение матриц (Strassen's Algorithm). Задача: Умножить две матрицы.
func addMatrices(_ A: [[Int]], _ B: [[Int]]) -> [[Int]] {
    let n = A.count
    var result = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
    for i in 0..<n {
        for j in 0..<n {
            result[i][j] = A[i][j] + B[i][j]
        }
    }
    return result
}

func subtractMatrices(_ A: [[Int]], _ B: [[Int]]) -> [[Int]] {
    let n = A.count
    var result = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
    for i in 0..<n {
        for j in 0..<n {
            result[i][j] = A[i][j] - B[i][j]
        }
    }
    return result
}

func strassenMultiply(_ A: [[Int]], _ B: [[Int]]) -> [[Int]] {
    let n = A.count
    
    if n == 1 {
        return [[A[0][0] * B[0][0]]]
    }
    
    let newSize = n / 2
    
    var A11 = [[Int]](repeating: [Int](repeating: 0, count: newSize), count: newSize)
    var A12 = [[Int]](repeating: [Int](repeating: 0, count: newSize), count: newSize)
    var A21 = [[Int]](repeating: [Int](repeating: 0, count: newSize), count: newSize)
    var A22 = [[Int]](repeating: [Int](repeating: 0, count: newSize), count: newSize)
    
    var B11 = [[Int]](repeating: [Int](repeating: 0, count: newSize), count: newSize)
    var B12 = [[Int]](repeating: [Int](repeating: 0, count: newSize), count: newSize)
    var B21 = [[Int]](repeating: [Int](repeating: 0, count: newSize), count: newSize)
    var B22 = [[Int]](repeating: [Int](repeating: 0, count: newSize), count: newSize)
    
    for i in 0..<newSize {
        for j in 0..<newSize {
            A11[i][j] = A[i][j]
            A12[i][j] = A[i][j + newSize]
            A21[i][j] = A[i + newSize][j]
            A22[i][j] = A[i + newSize][j + newSize]
            
            B11[i][j] = B[i][j]
            B12[i][j] = B[i][j + newSize]
            B21[i][j] = B[i + newSize][j]
            B22[i][j] = B[i + newSize][j + newSize]
        }
    }
    
    let P1 = strassenMultiply(A11, subtractMatrices(B12, B22))
    let P2 = strassenMultiply(addMatrices(A11, A12), B22)
    let P3 = strassenMultiply(addMatrices(A21, A22), B11)
    let P4 = strassenMultiply(A22, subtractMatrices(B21, B11))
    let P5 = strassenMultiply(addMatrices(A11, A22), addMatrices(B11, B22))
    let P6 = strassenMultiply(subtractMatrices(A12, A22), addMatrices(B21, B22))
    let P7 = strassenMultiply(subtractMatrices(A11, A21), addMatrices(B11, B12))
    
    let C11 = addMatrices(subtractMatrices(addMatrices(P5, P4), P2), P6)
    let C12 = addMatrices(P1, P2)
    let C21 = addMatrices(P3, P4)
    let C22 = subtractMatrices(subtractMatrices(addMatrices(P5, P1), P3), P7)
    
    var result = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
    for i in 0..<newSize {
        for j in 0..<newSize {
            result[i][j] = C11[i][j]
            result[i][j + newSize] = C12[i][j]
            result[i + newSize][j] = C21[i][j]
            result[i + newSize][j + newSize] = C22[i][j]
        }
    }
    
    return result
}

// Пример использования:
let A = [
    [1, 2],
    [3, 4]
]
let B = [
    [5, 6],
    [7, 8]
]
let result = strassenMultiply(A, B)
print(result) // Вывод: [[19, 22], [43, 50]]
