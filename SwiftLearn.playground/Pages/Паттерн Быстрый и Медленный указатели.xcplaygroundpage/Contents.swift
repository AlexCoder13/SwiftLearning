import Foundation

//Пример 1: Обнаружение цикла в связанном списке. Задача: Определить, содержит ли связанный список цикл.
class ListNode {
    var value: Int
    var next: ListNode?
    
    init(value: Int, next: ListNode? = nil) {
        self.value = value
        self.next = next
    }
}

func hasCycle(_ head: ListNode?) -> Bool {
    var slow = head
    var fast = head
    
    while fast != nil && fast?.next != nil {
        slow = slow?.next
        fast = fast?.next?.next
        
        if slow === fast {
            return true
        }
    }
    
    return false
}

// Пример использования:
let node1 = ListNode(value: 1)
let node2 = ListNode(value: 2)
let node3 = ListNode(value: 3)
let node4 = ListNode(value: 4)

node1.next = node2
node2.next = node3
node3.next = node4
node4.next = node2 // Создаём цикл

print(hasCycle(node1)) // Вывод: true


//Пример 2: Нахождение середины связанного списка. Задача: Найти середину связанного списка.
func findMiddle(_ head: ListNode?) -> ListNode? {
    var slow = head
    var fast = head
    
    while fast != nil && fast?.next != nil {
        slow = slow?.next
        fast = fast?.next?.next
    }
    
    return slow
}

// Пример использования:
let node1 = ListNode(value: 1)
let node2 = ListNode(value: 2)
let node3 = ListNode(value: 3)
let node4 = ListNode(value: 4)
let node5 = ListNode(value: 5)

node1.next = node2
node2.next = node3
node3.next = node4
node4.next = node5

if let middleNode = findMiddle(node1) {
    print("Середина списка: \(middleNode.value)") // Вывод: Середина списка: 3
}


//Пример 3: Определение длины цикла в связанном списке. Задача: Если в связанном списке есть цикл, определить его длину.
func cycleLength(_ head: ListNode?) -> Int {
    var slow = head
    var fast = head
    
    while fast != nil && fast?.next != nil {
        slow = slow?.next
        fast = fast?.next?.next
        
        if slow === fast {
            // Цикл обнаружен, теперь считаем его длину
            var length = 1
            fast = fast?.next
            while slow !== fast {
                fast = fast?.next
                length += 1
            }
            return length
        }
    }
    
    return 0 // Цикла нет
}

// Пример использования:
let node1 = ListNode(value: 1)
let node2 = ListNode(value: 2)
let node3 = ListNode(value: 3)
let node4 = ListNode(value: 4)

node1.next = node2
node2.next = node3
node3.next = node4
node4.next = node2 // Создаём цикл

print("Длина цикла: \(cycleLength(node1))") // Вывод: Длина цикла: 3


//Пример 4: Нахождение начала цикла в связанном списке. Задача: Если в связанном списке есть цикл, найти узел, с которого начинается цикл.
func detectCycleStart(_ head: ListNode?) -> ListNode? {
    var slow = head
    var fast = head
    
    while fast != nil && fast?.next != nil {
        slow = slow?.next
        fast = fast?.next?.next
        
        if slow === fast {
            // Цикл обнаружен, теперь ищем его начало
            slow = head
            while slow !== fast {
                slow = slow?.next
                fast = fast?.next
            }
            return slow
        }
    }
    
    return nil // Цикла нет
}

// Пример использования:
let node1 = ListNode(value: 1)
let node2 = ListNode(value: 2)
let node3 = ListNode(value: 3)
let node4 = ListNode(value: 4)

node1.next = node2
node2.next = node3
node3.next = node4
node4.next = node2 // Создаём цикл

if let cycleStart = detectCycleStart(node1) {
    print("Начало цикла: \(cycleStart.value)") // Вывод: Начало цикла: 2
}
