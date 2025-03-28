import Foundation

//Пример 1: Поиск в ширину (BFS) для ненаправленного графа. Задача: Найти кратчайший путь между двумя вершинами.
let graph: [Int: [Int]] = [
    1: [2, 3],
    2: [1, 4, 5],
    3: [1, 6],
    4: [2],
    5: [2, 6],
    6: [3, 5]
]

func bfsShortestPath(graph: [Int: [Int]], start: Int, end: Int) -> [Int]? {
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
if let path = bfsShortestPath(graph: graph, start: 1, end: 6) {
    print("Кратчайший путь: \(path)") // Вывод: [1, 3, 6]
}


//Пример 2: Поиск в глубину (DFS) для проверки связности. Задача: Проверить, существует ли путь между двумя вершинами.
func dfsHasPath(graph: [Int: [Int]], start: Int, end: Int) -> Bool {
    var visited = Set<Int>()
    return dfsRec(start, end, graph, &visited)
}

private func dfsRec(_ current: Int, _ end: Int, _ graph: [Int: [Int]], _ visited: inout Set<Int>) -> Bool {
    if current == end { return true }
    visited.insert(current)
    for neighbor in graph[current] ?? [] {
        if !visited.contains(neighbor) {
            if dfsRec(neighbor, end, graph, &visited) {
                return true
            }
        }
    }
    return false
}

// Пример использования:
let hasPath = dfsHasPath(graph: graph, start: 1, end: 4)
print("Путь существует: \(hasPath)") // Вывод: true


//Пример 3: Алгоритм Дейкстры для взвешенного графа. Задача: Найти кратчайший путь между вершинами во взвешенном графе.
struct Edge {
    let to: Int
    let weight: Int
}

let weightedGraph: [Int: [Edge]] = [
    0: [Edge(to: 1, weight: 4), Edge(to: 2, weight: 1)],
    1: [Edge(to: 3, weight: 1)],
    2: [Edge(to: 1, weight: 2), Edge(to: 3, weight: 5)],
    3: []
]

func dijkstra(graph: [Int: [Edge]], start: Int, end: Int) -> [Int] {
    var distances = [Int: Int]()
    var predecessors = [Int: Int]()
    var priorityQueue = [(distance: Int, vertex: Int)]()
    
    for vertex in graph.keys {
        distances[vertex] = Int.max
    }
    distances[start] = 0
    priorityQueue.append((0, start))
    
    while !priorityQueue.isEmpty {
        priorityQueue.sort { $0.distance > $1.distance } // Минимизация расстояния
        let (currentDist, current) = priorityQueue.removeLast()
        
        for edge in graph[current] ?? [] {
            let newDist = currentDist + edge.weight
            if newDist < distances[edge.to]! {
                distances[edge.to] = newDist
                predecessors[edge.to] = current
                priorityQueue.append((newDist, edge.to))
            }
        }
    }
    
    // Восстановление пути
    var path = [end]
    var current = end
    while current != start {
        guard let pred = predecessors[current] else { return [] }
        path.append(pred)
        current = pred
    }
    return path.reversed()
}

// Пример использования:
let path = dijkstra(graph: weightedGraph, start: 0, end: 3)
print("Кратчайший путь: \(path)") // Вывод: [0, 2, 1, 3] (вес = 1 + 2 + 1 = 4)


//Пример 4: Топологическая сортировка (для направленных ациклических графов). Задача: Упорядочить вершины так, чтобы все зависимости были удовлетворены.
func topologicalSort(graph: [Int: [Int]]) -> [Int] {
    var visited = Set<Int>()
    var stack = [Int]()
    
    func dfs(_ node: Int) {
        visited.insert(node)
        for neighbor in graph[node] ?? [] {
            if !visited.contains(neighbor) {
                dfs(neighbor)
            }
        }
        stack.append(node)
    }
    
    for node in graph.keys {
        if !visited.contains(node) {
            dfs(node)
        }
    }
    
    return stack.reversed()
}

// Пример использования:
let dag: [Int: [Int]] = [
    5: [2, 0],
    4: [0, 1],
    2: [3],
    3: [1],
    1: [],
    0: []
]

let sorted = topologicalSort(graph: dag)
print("Топологический порядок: \(sorted)") // Вывод: [5, 4, 2, 3, 1, 0]
