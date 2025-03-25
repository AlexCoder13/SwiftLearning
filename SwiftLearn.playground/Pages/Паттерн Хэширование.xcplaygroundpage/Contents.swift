import Foundation

//Пример 1: Реализация хеш-таблицы с цепочками. Задача: Реализовать хеш-таблицу с использованием цепочек для разрешения коллизий.
struct HashTable<Key: Hashable, Value> {
    private typealias Element = (key: Key, value: Value)
    private typealias Bucket = [Element]
    private var buckets: [Bucket]
    
    private let capacity: Int
    
    init(capacity: Int) {
        self.capacity = capacity
        self.buckets = Array<Bucket>(repeating: [], count: capacity)
    }
    
    private func index(for key: Key) -> Int {
        return abs(key.hashValue) % capacity
    }
    
    mutating func set(_ value: Value, forKey key: Key) {
        let index = self.index(for: key)
        if let (i, _) = buckets[index].enumerated().first(where: { $0.1.key == key }) {
            buckets[index][i].value = value // Обновление значения
        } else {
            buckets[index].append((key: key, value: value)) // Добавление нового элемента
        }
    }
    
    func get(forKey key: Key) -> Value? {
        let index = self.index(for: key)
        return buckets[index].first { $0.key == key }?.value
    }
    
    mutating func remove(forKey key: Key) {
        let index = self.index(for: key)
        if let (i, _) = buckets[index].enumerated().first(where: { $0.1.key == key }) {
            buckets[index].remove(at: i)
        }
    }
}

// Пример использования:
var hashTable = HashTable<String, Int>(capacity: 5)
hashTable.set(10, forKey: "apple")
hashTable.set(20, forKey: "banana")
hashTable.set(30, forKey: "orange")

print(hashTable.get(forKey: "apple"))  // Вывод: Optional(10)
print(hashTable.get(forKey: "banana")) // Вывод: Optional(20)

hashTable.remove(forKey: "banana")
print(hashTable.get(forKey: "banana")) // Вывод: nil


//Пример 2: Подсчёт частоты элементов в массиве. Задача: Подсчитать, сколько раз каждый элемент встречается в массиве.
func countFrequency<T: Hashable>(_ array: [T]) -> [T: Int] {
    var frequencyDict = [T: Int]()
    for element in array {
        frequencyDict[element] = (frequencyDict[element] ?? 0) + 1
    }
    return frequencyDict
}

// Пример использования:
let array = ["apple", "banana", "apple", "orange", "banana", "apple"]
let frequency = countFrequency(array)
print(frequency) // Вывод: ["orange": 1, "banana": 2, "apple": 3]


//Пример 3: Поиск дубликатов в массиве. Задача: Найти все дубликаты в массиве.
func findDuplicates<T: Hashable>(_ array: [T]) -> [T] {
    var seen = Set<T>()
    var duplicates = [T]()
    for element in array {
        if seen.contains(element) {
            duplicates.append(element)
        } else {
            seen.insert(element)
        }
    }
    return duplicates
}

// Пример использования:
let array = [1, 2, 3, 2, 4, 3, 5]
let duplicates = findDuplicates(array)
print(duplicates) // Вывод: [2, 3]


//Пример 4: Поиск пересечения двух массивов. Задача: Найти общие элементы в двух массивах.
func intersection<T: Hashable>(_ array1: [T], _ array2: [T]) -> [T] {
    let set1 = Set(array1)
    let set2 = Set(array2)
    return Array(set1.intersection(set2))
}

// Пример использования:
let array1 = [1, 2, 3, 4]
let array2 = [3, 4, 5, 6]
let commonElements = intersection(array1, array2)
print(commonElements) // Вывод: [3, 4]


//Пример 5: Проверка, являются ли строки анаграммами. Задача: Проверить, являются ли две строки анаграммами (содержат одинаковые символы в разном порядке).
func areAnagrams(_ str1: String, _ str2: String) -> Bool {
    let sortedStr1 = str1.sorted()
    let sortedStr2 = str2.sorted()
    return sortedStr1 == sortedStr2
}

// Пример использования:
let str1 = "listen"
let str2 = "silent"
print(areAnagrams(str1, str2)) // Вывод: true
