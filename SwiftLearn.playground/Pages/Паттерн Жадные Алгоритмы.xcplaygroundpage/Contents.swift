import Foundation

//Пример 1: Задача о выборе активностей (Activity Selection Problem). Задача: Дано множество активностей, каждая из которых имеет время начала и окончания. Необходимо выбрать максимальное количество активностей, которые не пересекаются по времени.
func selectActivities(_ activities: [(start: Int, end: Int)]) -> [(start: Int, end: Int)] {
    let sortedActivities = activities.sorted { $0.end < $1.end }
    var selectedActivities = [(start: Int, end: Int)]()
    selectedActivities.append(sortedActivities[0])
    
    for i in 1..<sortedActivities.count {
        let lastSelected = selectedActivities.last!
        let current = sortedActivities[i]
        if current.start >= lastSelected.end {
            selectedActivities.append(current)
        }
    }
    
    return selectedActivities
}

// Пример использования:
let activities = [
    (start: 1, end: 4),
    (start: 3, end: 5),
    (start: 0, end: 6),
    (start: 5, end: 7),
    (start: 8, end: 9),
    (start: 5, end: 9)
]
let selected = selectActivities(activities)
print("Выбранные активности: \(selected)")
// Вывод: Выбранные активности: [(start: 1, end: 4), (start: 5, end: 7), (start: 8, end: 9)]


//Пример 2: Задача о рюкзаке с дробными весами (Fractional Knapsack Problem). Задача: Даны предметы с весом и стоимостью. Необходимо выбрать предметы так, чтобы максимизировать общую стоимость, не превышая заданный лимит веса. Можно брать дробные части предметов.
func fractionalKnapsack(_ items: [(value: Double, weight: Double)], capacity: Double) -> Double {
    let sortedItems = items.sorted { ($0.value / $0.weight) > ($1.value / $1.weight) }
    var totalValue = 0.0
    var remainingCapacity = capacity
    
    for item in sortedItems {
        if remainingCapacity >= item.weight {
            totalValue += item.value
            remainingCapacity -= item.weight
        } else {
            totalValue += (item.value / item.weight) * remainingCapacity
            break
        }
    }
    
    return totalValue
}

// Пример использования:
let items = [
    (value: 60, weight: 10),
    (value: 100, weight: 20),
    (value: 120, weight: 30)
]
let capacity = 50.0
print("Максимальная стоимость: \(fractionalKnapsack(items, capacity: capacity))")
// Вывод: Максимальная стоимость: 240.0


//Пример 3: Задача о минимальном количестве монет (Coin Change Problem). Задача: Даны монеты определённого номинала. Необходимо найти минимальное количество монет, чтобы составить заданную сумму.
func minCoins(_ coins: [Int], _ amount: Int) -> Int {
    let sortedCoins = coins.sorted(by: >)
    var remainingAmount = amount
    var count = 0
    
    for coin in sortedCoins {
        while remainingAmount >= coin {
            remainingAmount -= coin
            count += 1
        }
    }
    
    return remainingAmount == 0 ? count : -1
}

// Пример использования:
let coins = [1, 2, 5]
let amount = 11
print("Минимальное количество монет: \(minCoins(coins, amount))")
// Вывод: Минимальное количество монет: 3 (5 + 5 + 1)


//Пример 4: Задача о расписании (Scheduling Problem). Задача: Дано множество задач, каждая из которых имеет дедлайн и штраф за просрочку. Необходимо составить расписание, чтобы минимизировать общий штраф.
func scheduleTasks(_ tasks: [(deadline: Int, penalty: Int)]) -> [Int] {
    let sortedTasks = tasks.sorted { $0.penalty > $1.penalty }
    var timeSlots = [Bool](repeating: false, count: sortedTasks.count)
    var schedule = [Int]()
    
    for task in sortedTasks {
        var slot = min(task.deadline - 1, timeSlots.count - 1)
        while slot >= 0 && timeSlots[slot] {
            slot -= 1
        }
        if slot >= 0 {
            timeSlots[slot] = true
            schedule.append(task.deadline)
        }
    }
    
    return schedule
}

// Пример использования:
let tasks = [
    (deadline: 2, penalty: 10),
    (deadline: 1, penalty: 5),
    (deadline: 2, penalty: 15),
    (deadline: 1, penalty: 20)
]
print("Расписание: \(scheduleTasks(tasks))")
// Вывод: Расписание: [2, 1]
