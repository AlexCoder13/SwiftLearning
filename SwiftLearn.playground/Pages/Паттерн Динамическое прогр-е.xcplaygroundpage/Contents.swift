import Foundation

//Пример 1: Числа Фибоначчи. Задача: Найти n-ное число Фибоначчи.
//Решение с мемоизацией (Top-Down):
func fibonacci(_ n: Int, _ memo: inout [Int: Int]) -> Int {
    if let result = memo[n] {
        return result
    }
    if n <= 1 {
        return n
    }
    memo[n] = fibonacci(n - 1, &memo) + fibonacci(n - 2, &memo)
    return memo[n]!
}

// Пример использования:
var memo = [Int: Int]()
let n = 10
print(fibonacci(n, &memo)) // Вывод: 55

//Решение с табуляцией (Bottom-Up):
func fibonacci(_ n: Int) -> Int {
    if n <= 1 {
        return n
    }
    var dp = [Int](repeating: 0, count: n + 1)
    dp[0] = 0
    dp[1] = 1
    for i in 2...n {
        dp[i] = dp[i - 1] + dp[i - 2]
    }
    return dp[n]
}

// Пример использования:
let n = 10
print(fibonacci(n)) // Вывод: 55


//Пример 2: Задача о рюкзаке (Knapsack Problem). Задача: Даны предметы с весом и стоимостью. Необходимо выбрать набор предметов, чтобы их общий вес не превышал заданный лимит, а общая стоимость была максимальной.
func knapsack(_ weights: [Int], _ values: [Int], _ capacity: Int) -> Int {
    let n = weights.count
    var dp = [[Int]](repeating: [Int](repeating: 0, count: capacity + 1), count: n + 1)
    
    for i in 1...n {
        for w in 0...capacity {
            if weights[i - 1] <= w {
                dp[i][w] = max(dp[i - 1][w], dp[i - 1][w - weights[i - 1]] + values[i - 1])
            } else {
                dp[i][w] = dp[i - 1][w]
            }
        }
    }
    
    return dp[n][capacity]
}

// Пример использования:
let weights = [2, 3, 4, 5]
let values = [3, 4, 5, 6]
let capacity = 5
print(knapsack(weights, values, capacity)) // Вывод: 7



