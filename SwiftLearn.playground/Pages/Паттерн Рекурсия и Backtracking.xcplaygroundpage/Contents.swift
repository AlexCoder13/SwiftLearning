import Foundation

//Пример 1: Генерация всех перестановок (Permutations). Задача: Найти все перестановки массива.
func permutations<T>(_ array: [T]) -> [[T]] {
    var result = [[T]]()
    var current = [T]()
    var used = [Bool](repeating: false, count: array.count)
    
    func backtrack() {
        if current.count == array.count {
            result.append(current)
            return
        }
        
        for i in 0..<array.count {
            if !used[i] {
                used[i] = true
                current.append(array[i])
                backtrack()
                current.removeLast()
                used[i] = false
            }
        }
    }
    
    backtrack()
    return result
}

// Пример использования:
let array = [1, 2, 3]
let perms = permutations(array)
print(perms) // Вывод: [[1, 2, 3], [1, 3, 2], [2, 1, 3], [2, 3, 1], [3, 1, 2], [3, 2, 1]]


//Пример 2: Задача о расстановке N ферзей (N-Queens Problem). Задача: Расставить N ферзей на шахматной доске N×N так, чтобы они не атаковали друг друга.
func solveNQueens(_ n: Int) -> [[String]] {
    var result = [[String]]()
    var board = [[String]](repeating: [String](repeating: ".", count: n), count: n)
    
    func isSafe(_ row: Int, _ col: Int) -> Bool {
        // Проверяем столбец
        for i in 0..<row {
            if board[i][col] == "Q" {
                return false
            }
        }
        
        // Проверяем диагональ влево вверх
        var i = row - 1
        var j = col - 1
        while i >= 0 && j >= 0 {
            if board[i][j] == "Q" {
                return false
            }
            i -= 1
            j -= 1
        }
        
        // Проверяем диагональ вправо вверх
        i = row - 1
        j = col + 1
        while i >= 0 && j < n {
            if board[i][j] == "Q" {
                return false
            }
            i -= 1
            j += 1
        }
        
        return true
    }
    
    func backtrack(_ row: Int) {
        if row == n {
            result.append(board.map { $0.joined() })
            return
        }
        
        for col in 0..<n {
            if isSafe(row, col) {
                board[row][col] = "Q"
                backtrack(row + 1)
                board[row][col] = "."
            }
        }
    }
    
    backtrack(0)
    return result
}

// Пример использования:
let n = 4
let solutions = solveNQueens(n)
for solution in solutions {
    for line in solution {
        print(line)
    }
    print()
}
// Вывод:
// .Q..
// ...Q
// Q...
// ..Q.

// ..Q.
// Q...
// ...Q
// .Q..


//Пример 3: Поиск всех подмножеств (Subsets). Задача: Найти все подмножества массива.
func subsets<T>(_ array: [T]) -> [[T]] {
    var result = [[T]]()
    var current = [T]()
    
    func backtrack(_ index: Int) {
        if index == array.count {
            result.append(current)
            return
        }
        
        // Включаем текущий элемент
        current.append(array[index])
        backtrack(index + 1)
        current.removeLast()
        
        // Пропускаем текущий элемент
        backtrack(index + 1)
    }
    
    backtrack(0)
    return result
}

// Пример использования:
let array = [1, 2, 3]
let subs = subsets(array)
print(subs) // Вывод: [[1, 2, 3], [1, 2], [1, 3], [1], [2, 3], [2], [3], []]


//Пример 4: Поиск всех комбинаций (Combinations). Задача: Найти все комбинации длины k из массива.
func combinations<T>(_ array: [T], _ k: Int) -> [[T]] {
    var result = [[T]]()
    var current = [T]()
    
    func backtrack(_ start: Int) {
        if current.count == k {
            result.append(current)
            return
        }
        
        for i in start..<array.count {
            current.append(array[i])
            backtrack(i + 1)
            current.removeLast()
        }
    }
    
    backtrack(0)
    return result
}

// Пример использования:
let array = [1, 2, 3, 4]
let k = 2
let combs = combinations(array, k)
print(combs) // Вывод: [[1, 2], [1, 3], [1, 4], [2, 3], [2, 4], [3, 4]]
