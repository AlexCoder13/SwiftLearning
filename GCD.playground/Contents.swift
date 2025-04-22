import Foundation

// Главная очередь (Main Queue)
DispatchQueue.main.async {
    // Обновляем UI (например, меняем текст UILabel)
    label.text = "Hello, World!"
}

// Глобальные очереди (Global Queues)
DispatchQueue.global(qos: .background).async {
    // Фоновая задача (например, загрузка данных)
    let data = fetchDataFromServer()
    DispatchQueue.main.async {
        // Возвращаемся в главный поток для обновления UI
        updateUI(with: data)
    }
}

// Пользовательские очереди (Custom Queues)
// Serial очередь (задачи выполняются поочередно)
let serialQueue = DispatchQueue(label: "com.example.serial")
// Concurrent очередь (задачи могут выполняться параллельно)
let concurrentQueue = DispatchQueue(label: "com.example.concurrent", attributes: .concurrent)

// Пример конкаренси в GCD:
let queue = DispatchQueue(label: "com.example.concurrent", attributes: .concurrent)
queue.async { print("Task 1 started"); sleep(2); print("Task 1 finished") }
queue.async { print("Task 2 started"); sleep(1); print("Task 2 finished") }
// Возможный вывод:
// Task 1 started
// Task 2 started  // Обе задачи запустились "одновременно" (но могут выполняться на одном ядре!)
// Task 2 finished // Task 2 завершилась раньше, несмотря на более поздний старт
// Task 1 finished

// Пример параллелизма в GCD:
DispatchQueue.concurrentPerform(iterations: 5) { i in
    print("Parallel task \(i) on thread: \(Thread.current)")
}
// Вывод (порядок может меняться!):
// Parallel task 0 on thread: <Thread: 0x...>{number = 3, name = (null)}
// Parallel task 2 on thread: <Thread: 0x...>{number = 4, name = (null)}
// Parallel task 1 on thread: <Thread: 0x...>{number = 5, name = (null)}
