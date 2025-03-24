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


