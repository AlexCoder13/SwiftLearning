import Foundation

//Пример 1: Реализация бинарного дерева поиска (BST). Задача: Реализовать бинарное дерево поиска с операциями вставки, поиска и удаления.
class TreeNode {
    var value: Int
    var left: TreeNode?
    var right: TreeNode?
    
    init(value: Int) {
        self.value = value
    }
}

class BinarySearchTree {
    var root: TreeNode?
    
    func insert(_ value: Int) {
        root = insertRec(root, value)
    }
    
    private func insertRec(_ node: TreeNode?, _ value: Int) -> TreeNode {
        guard let node = node else {
            return TreeNode(value: value)
        }
        
        if value < node.value {
            node.left = insertRec(node.left, value)
        } else if value > node.value {
            node.right = insertRec(node.right, value)
        }
        
        return node
    }
    
    func search(_ value: Int) -> Bool {
        return searchRec(root, value)
    }
    
    private func searchRec(_ node: TreeNode?, _ value: Int) -> Bool {
        guard let node = node else {
            return false
        }
        
        if value == node.value {
            return true
        } else if value < node.value {
            return searchRec(node.left, value)
        } else {
            return searchRec(node.right, value)
        }
    }
    
    func delete(_ value: Int) {
        root = deleteRec(root, value)
    }
    
    private func deleteRec(_ node: TreeNode?, _ value: Int) -> TreeNode? {
        guard let node = node else {
            return nil
        }
        
        if value < node.value {
            node.left = deleteRec(node.left, value)
        } else if value > node.value {
            node.right = deleteRec(node.right, value)
        } else {
            if node.left == nil {
                return node.right
            } else if node.right == nil {
                return node.left
            }
            
            node.value = minValue(node.right!)
            node.right = deleteRec(node.right, node.value)
        }
        
        return node
    }
    
    private func minValue(_ node: TreeNode) -> Int {
        var current = node
        while let left = current.left {
            current = left
        }
        return current.value
    }
    
    func inorderTraversal() -> [Int] {
        var result = [Int]()
        inorderRec(root, &result)
        return result
    }
    
    private func inorderRec(_ node: TreeNode?, _ result: inout [Int]) {
        guard let node = node else {
            return
        }
        
        inorderRec(node.left, &result)
        result.append(node.value)
        inorderRec(node.right, &result)
    }
}

// Пример использования:
let bst = BinarySearchTree()
bst.insert(5)
bst.insert(3)
bst.insert(7)
bst.insert(2)
bst.insert(4)
bst.insert(6)
bst.insert(8)

print(bst.inorderTraversal()) // Вывод: [2, 3, 4, 5, 6, 7, 8]

print(bst.search(4)) // Вывод: true
print(bst.search(9)) // Вывод: false

bst.delete(3)
print(bst.inorderTraversal()) // Вывод: [2, 4, 5, 6, 7, 8]


//Пример 2: Обход дерева в глубину (DFS). Задача: Выполнить обход дерева в глубину (Depth-First Search).
func preorderTraversal(_ root: TreeNode?) -> [Int] {
    var result = [Int]()
    preorderRec(root, &result)
    return result
}

private func preorderRec(_ node: TreeNode?, _ result: inout [Int]) {
    guard let node = node else {
        return
    }
    
    result.append(node.value)
    preorderRec(node.left, &result)
    preorderRec(node.right, &result)
}

func inorderTraversal(_ root: TreeNode?) -> [Int] {
    var result = [Int]()
    inorderRec(root, &result)
    return result
}

private func inorderRec(_ node: TreeNode?, _ result: inout [Int]) {
    guard let node = node else {
        return
    }
    
    inorderRec(node.left, &result)
    result.append(node.value)
    inorderRec(node.right, &result)
}

func postorderTraversal(_ root: TreeNode?) -> [Int] {
    var result = [Int]()
    postorderRec(root, &result)
    return result
}

private func postorderRec(_ node: TreeNode?, _ result: inout [Int]) {
    guard let node = node else {
        return
    }
    
    postorderRec(node.left, &result)
    postorderRec(node.right, &result)
    result.append(node.value)
}

// Пример использования:
let root = TreeNode(value: 1)
root.left = TreeNode(value: 2)
root.right = TreeNode(value: 3)
root.left?.left = TreeNode(value: 4)
root.left?.right = TreeNode(value: 5)

print(preorderTraversal(root)) // Вывод: [1, 2, 4, 5, 3]
print(inorderTraversal(root))  // Вывод: [4, 2, 5, 1, 3]
print(postorderTraversal(root)) // Вывод: [4, 5, 2, 3, 1]


//Пример 3: Обход дерева в ширину (BFS). Задача: Выполнить обход дерева в ширину (Breadth-First Search).
func bfsTraversal(_ root: TreeNode?) -> [Int] {
    guard let root = root else {
        return []
    }
    
    var result = [Int]()
    var queue = [TreeNode]()
    queue.append(root)
    
    while !queue.isEmpty {
        let node = queue.removeFirst()
        result.append(node.value)
        
        if let left = node.left {
            queue.append(left)
        }
        if let right = node.right {
            queue.append(right)
        }
    }
    
    return result
}

// Пример использования:
let root = TreeNode(value: 1)
root.left = TreeNode(value: 2)
root.right = TreeNode(value: 3)
root.left?.left = TreeNode(value: 4)
root.left?.right = TreeNode(value: 5)

print(bfsTraversal(root)) // Вывод: [1, 2, 3, 4, 5]
