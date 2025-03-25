import Foundation

//Поиск в ширину (BFS)
//BFS обходит граф "по уровням". Сначала посещаются все соседи начальной вершины, затем соседи соседей и так далее.
//Пример: Поиск кратчайшего пути в ненаправленном графе
func bfsShortestPath(_ graph: [Int: [Int]], start: Int, end: Int) -> [Int]? {
    var queue = [(vertex: Int, path: [Int])]()
    queue.append((start, [start]))
    var visited = Set<Int>()
    visited.insert(start)
    
    while !queue.isEmpty {
        let (current, path) = queue.removeFirst()
        if current == end {
            return path
        }
        for neighbor in graph[current] ?? [] {
            if !visited.contains(neighbor) {
                visited.insert(neighbor)
                queue.append((neighbor, path + [neighbor]))
            }
        }
    }
    
    return nil
}

// Пример использования:
let graph = [
    1: [2, 3],
    2: [1, 4, 5],
    3: [1, 6],
    4: [2],
    5: [2, 6],
    6: [3, 5]
]
let start = 1
let end = 6
if let path = bfsShortestPath(graph, start: start, end: end) {
    print("Кратчайший путь: \(path)") // Вывод: Кратчайший путь: [1, 3, 6]
} else {
    print("Путь не найден")
}


//Поиск в глубину (DFS)
//DFS обходит граф, двигаясь "вглубь" до тех пор, пока не достигнет конечной вершины или тупика, после чего возвращается назад (backtracking).
//Пример: Поиск пути в графе с использованием DFS
func dfsPath(_ graph: [Int: [Int]], start: Int, end: Int) -> [Int]? {
    var stack = [(vertex: Int, path: [Int])]()
    stack.append((start, [start]))
    var visited = Set<Int>()
    visited.insert(start)
    
    while !stack.isEmpty {
        let (current, path) = stack.removeLast()
        if current == end {
            return path
        }
        for neighbor in graph[current] ?? [] {
            if !visited.contains(neighbor) {
                visited.insert(neighbor)
                stack.append((neighbor, path + [neighbor]))
            }
        }
    }
    
    return nil
}

// Пример использования:
let graph = [
    1: [2, 3],
    2: [1, 4, 5],
    3: [1, 6],
    4: [2],
    5: [2, 6],
    6: [3, 5]
]
let start = 1
let end = 6
if let path = dfsPath(graph, start: start, end: end) {
    print("Путь: \(path)") // Вывод: Путь: [1, 3, 6]
} else {
    print("Путь не найден")
}

