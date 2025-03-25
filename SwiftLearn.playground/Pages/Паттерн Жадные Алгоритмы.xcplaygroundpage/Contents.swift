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


