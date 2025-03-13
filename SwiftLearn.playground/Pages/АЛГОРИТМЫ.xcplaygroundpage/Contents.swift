import Foundation

// АЛГОРИТМ БИНАРНОГО ПОИСКА
func binarySearch(list: [Int], item: Int) -> Int? {
    var index: Int?
    
    var lowIndex = 0
    var highIndex = list.count - 1
    
    while lowIndex <= highIndex {
        let midIndex = (lowIndex + highIndex) / 2
        let guessItem = list[midIndex]
        
        if guessItem == item {
            index = midIndex
            break
        }
        
        if guessItem > item {
            highIndex = midIndex - 1
        } else {
            lowIndex = midIndex + 1
        }
    }
    return index
}


// АЛГОРИТМ СОРТИРОВКИ
// ф-ция для поиска наименьшего элемента массива
func findSmallest (myArray: [Int]) -> Int {
    var smallestNum = myArray[0]
    var smallestNumIndex = 0
    
    for index in 1..<myArray.count {
        if myArray[index] < smallestNum {
            smallestNum = myArray[index]
            smallestNumIndex = index
        }
    }
    return smallestNumIndex
}

// на основе верхней функции пишем ф-цию сортировки выбором
func sortedArray(myArray: [Int]) -> [Int] {
    var oldArray = myArray //нужно чтобы удалять элементы из старого
    var sortedArray: [Int] = []
    
    for _ in 0..<oldArray.count {
        let smallestNum = findSmallest(myArray: oldArray)
        sortedArray.append(smallestNum)
        oldArray.remove(at: smallestNum)
    }
    return sortedArray
}


// РЕКУРСИЯ
func countdown(_ index: Int) {
    print(index)
    if index <= 0 {
        return
    } else {
        countdown(index - 1)
    }
}

// РЕКУРСИЯ: СТЭК
func factorial(num: Int) -> Int {
    if num == 1 {
        print(num)
        return 1
    } else {
        print(num)
        return num * factorial(num: num-1)
    }
}

// более свифтовый пример
func factorial(_ number: Int) -> Int? {
    guard number >= 1 else { return nil }
    guard number != 1 else { return 1 }
    return number * factorial(number - 1)!
}


// АЛГОРИТМ БЫСТРОЙ СОРТИРОВКИ
func quickSort(array: [Int]) -> [Int] {
    guard array.count >= 2 else { return array }
    
    let pivot = array[0]
    let array = array[1...]
    
    let less = array.filter { $0 < pivot }
    let greater = array.filter { $0 > pivot }
    
    var result = quickSort(array: less) + [pivot] + quickSort(array: greater)

    return result
}


// ХЭШ-ТАБЛИЦЫ (по сути это Словари: ключ-значение)
// 1
var phoneBook = [String:Int]()
phoneBook["jenny"] = 8675309
phoneBook["emergency"] = 911
print("Jenny's phone number is \(phoneBook["jenny"]!)")

//2
var voted = [String: Bool]()
func checkVoter(_ name: String) {
    if voted[name] != nil {
        print("Kick them out!")
    } else {
        voted[name] = true
        print("Let them vote!")
    }
}
checkVoter("tom")
checkVoter("mike")
checkVoter("mike")

//3
var cache = [URL: Data]()
func getPage(_ url: URL) -> Data {
    guard let cached = cache[url] else {
        let data = try! Data(contentsOf: url) // get data from server
        cache[url] = data
        return data
    }
    return cached
}


// ГРАФЫ
var graph = [String: [String]]()
graph["you"] = ["alice", "bob", "claire"]
graph["bob"] = ["anuj", "peggy"]
graph["alice"] = ["peggy"]
graph["claire"] = ["thom", "jonny"]
graph["anuj"] = []
graph["peggy"] = []
graph["thom"] = []
graph["jonny"] = []

// ищем продавца манго
func search(_ graph: [String: [String]], from you: String, forSuffix seller: Character) -> Bool {
    var found = false
    var searchQueue = [String]()
    searchQueue += graph[you]!
    var searched = [String]()
    while !searchQueue.isEmpty {
        let person = searchQueue.removeFirst()
        if !searched.contains(person) {
            if personIsSeller(person, seller) {
                print("\(person) is a mango seller!")
                found = true
                break
            } else {
                searchQueue += graph[person]!
                searched.append(person)
            }
        }
    }
    return found
}

// условие для продавца манго
func personIsSeller(_ name: String, _ seller: Character) -> Bool {
    return name.last == seller
}

// проверка
search(graph, from: "you", forSuffix: "m") // thom is a mango seller
search(graph, from: "you", forSuffix: "e") // alice is a mango seller
search(graph, from: "you", forSuffix: "k") // there is no mango seller with suffix "k"


// АЛГОРИТМ ДЕЙКСТРЫ (графы со стоимостью)
let none = ""
let infinity = Double.infinity

//1
func findLowestCostNode(_ costs: [String: Double], _ processed: Set<String>) -> String {
    var lowestCost = infinity
    var lowestCostNode = none
    for pair in costs {
        let node = pair.key
        let cost = pair.value
        
        // If it's the lowest cost so far and hasn't been processed yet...
        if cost < lowestCost && !processed.contains(node) {
            lowestCost = cost
            lowestCostNode = node
        }
    }
    return lowestCostNode
}

//2
func dijkstrasAlgorithm(graph: [String: [String: Double]], from start: String, to finish: String) -> ([String: Double], [String: String]) {
    // Initialize costs to start's nodes and the finish node
    var costs = graph[start]!
    costs[finish] = infinity
    
    // Initialize parents
    let keys = Array(graph[start]!.keys)
    var parents = [String:String]()
    for key in keys {
        parents[key] = start
    }
    parents[finish] = none
    
    // Keep track of what has been processed
    var processed = Set<String>()

    // Find the lowest-cost node that you haven't processed yet.
    var node = findLowestCostNode(costs, processed)
    
    // If you've processed all the nodes, this while loop is done.
    while node != none {
        let cost = costs[node]!
        let neighbors = graph[node]!
        
        // Go through all the neighbors of this node.
        let keys = Array(neighbors.keys)
        for neighbor in keys {
            let newCost = cost + neighbors[neighbor]!
            // If it's cheaper to get to this neighbor
            // by going through this node...
            // TODO: debug why a nil check is required here:
            if costs[neighbor] == nil || costs[neighbor]! > newCost {
                costs[neighbor] = newCost
                parents[neighbor] = node
            }
        }
        
        processed.insert(node)
        node = findLowestCostNode(costs, processed)
    }
    
    return (costs, parents)
}


// ЖАДНЫЕ АЛГОРИТМЫ
// 1
//: When you have two sets, you can do fun things with them.
let fruits = Set(["avocado", "tomato", "banana"])
let vegetables = Set(["beets", "carrots", "tomato"])
//: A set union means "combine both sets." The | operator:
func |(lhs: Set<String>, rhs: Set<String>) -> Set<String> {
    return lhs.union(rhs)
}
fruits | vegetables
//: A set intersection means "find the items that show up in both sets" (in this case just the tomato). The & operator:
func &(lhs: Set<String>, rhs: Set<String>) -> Set<String> {
    return lhs.intersection(rhs)
}
fruits & vegetables
//: A set difference means "subtract the items in one set from the items in the other set." The - operator:
func -(lhs: Set<String>, rhs: Set<String>) -> Set<String> {
    return lhs.subtracting(rhs)
}
fruits - vegetables

//2
var statesNeeded = Set(["mt", "wa", "or", "id", "nv", "ut", "ca", "az"])
let stations = [
    "kone": Set(["id", "nv", "ut"]),
    "ktwo": Set(["wa", "id", "mt"]),
    "kthree": Set(["or", "nv", "va"]),
    "kfour": Set(["nv", "ut"]),
    "kfive": Set(["ca", "az"])
]
var finalStations = Set<String>()
let none2: String? = nil
while !statesNeeded.isEmpty {
    var bestStation: String? = none
    var statesCovered = Set<String>()
    for (station, statesForStation) in stations {
        let covered = statesNeeded & statesForStation
        if covered.count > statesCovered.count {
            bestStation = station
            statesCovered = covered
        }
    }
    statesNeeded = statesNeeded - statesCovered
    if let bestStation = bestStation {
        finalStations.insert(bestStation)
    }
}
print(finalStations)


//
