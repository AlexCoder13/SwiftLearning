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


//Пример 3: Наибольшая общая подпоследовательность (LCS). Задача: Найти длину наибольшей общей подпоследовательности двух строк.
func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
    let m = text1.count
    let n = text2.count
    let array1 = Array(text1)
    let array2 = Array(text2)
    var dp = [[Int]](repeating: [Int](repeating: 0, count: n + 1), count: m + 1)
    
    for i in 1...m {
        for j in 1...n {
            if array1[i - 1] == array2[j - 1] {
                dp[i][j] = dp[i - 1][j - 1] + 1
            } else {
                dp[i][j] = max(dp[i - 1][j], dp[i][j - 1])
            }
        }
    }
    
    return dp[m][n]
}

// Пример использования:
let text1 = "abcde"
let text2 = "ace"
print(longestCommonSubsequence(text1, text2)) // Вывод: 3


//Пример 4: Минимальное количество монет для суммы. Задача: Найти минимальное количество монет, необходимых для составления заданной суммы.
func coinChange(_ coins: [Int], _ amount: Int) -> Int {
    var dp = [Int](repeating: amount + 1, count: amount + 1)
    dp[0] = 0
    
    for i in 1...amount {
        for coin in coins {
            if coin <= i {
                dp[i] = min(dp[i], dp[i - coin] + 1)
            }
        }
    }
    
    return dp[amount] > amount ? -1 : dp[amount]
}

// Пример использования:
let coins = [1, 2, 5]
let amount = 11
print(coinChange(coins, amount)) // Вывод: 3 (5 + 5 + 1)
