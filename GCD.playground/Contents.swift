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

// Потоки
// Пример создания потока:
let thread = Thread {
    print("Выполняюсь в кастомном потоке: \(Thread.current)")
}
thread.name = "Мой поток"  // Даём имя для отладки
thread.start()  // Запускаем поток
// Основные свойства потока:
print(Thread.isMainThread)  // true, если это главный поток
print(Thread.current.name)  // Имя текущего потока
print(Thread.threadPriority)  // Приоритет потока (0.0...1.0)

// QoS (Quality of Service)
// Приоритет выполнения
// Высокоприоритетная задача
DispatchQueue.global(qos: .userInteractive).async {
    renderComplexAnimation()
}
// Низкоприоритетная задача
DispatchQueue.global(qos: .background).async {
    backupDatabase()
}
// Priority Inversion (Инверсия приоритетов)
let highPriorityQueue = DispatchQueue.global(qos: .userInteractive)
let lowPriorityQueue = DispatchQueue.global(qos: .background)
lowPriorityQueue.async {
    lock.lock()  // ❌ Блокирует ресурс
    defer { lock.unlock() }
    sleep(5)
}
highPriorityQueue.async {
    lock.lock()  // Будет ждать lowPriority!
    defer { lock.unlock() }
}
// Решение: Использовать DispatchWorkItem с повышением приоритета:
let workItem = DispatchWorkItem(qos: .userInteractive) {
    lock.lock()
    defer { lock.unlock() }
}
// Оптимальное распределение QoS
// UI-действие (максимальный приоритет)
DispatchQueue.global(qos: .userInteractive).async {
    let frames = generateAnimationFrames()
    DispatchQueue.main.async { applyFrames(frames) }
}

// Фоновая загрузка (низкий приоритет)
DispatchQueue.global(qos: .utility).async {
    let data = fetchRemoteData()
    Database.save(data)  // Внутри использует .background QoS
}
// Автоматическое наследование QoS
let parentQueue = DispatchQueue(label: "parent", qos: .userInitiated)
parentQueue.async {
    // Эта задача унаследует .userInitiated
    DispatchQueue.global().async {
        // Эта задача получит QoS вызывающего потока
    }
}

// Sync vs Async
// Синхронное выполнение (sync):
print("Начало")
DispatchQueue.global().sync {
    print("Синхронная задача")
}
print("Конец")
// Вывод:
// Начало
// Синхронная задача
// Конец

// Асинхронное выполнение (async):
print("Начало")
DispatchQueue.global().async {
    print("Асинхронная задача")
}
print("Конец")
// Возможный вывод:
// Начало
// Конец
// Асинхронная задача

// Потокобезопасность и взаимоблокировки
// Опасный пример:
let queue = DispatchQueue(label: "deadlock.queue")
queue.sync { // Блокируем текущий поток
    queue.sync { // Попытка повторной блокировки
        print("Это никогда не выполнится")
    }
}
// Безопасные альтернативы:
// Вариант 1: Использовать async
queue.async {
    queue.sync {
        print("Теперь безопасно")
    }
}

// Вариант 2: Разные очереди
let queue1 = DispatchQueue(label: "queue1")
let queue2 = DispatchQueue(label: "queue2")
queue1.sync {
    queue2.sync {
        print("Нет взаимоблокировки")
    }
}
// Итоговый чеклист:
func safeOperation() {
    // 1. Выбираем правильную очередь
    let queue = DispatchQueue(
        label: "safe.queue",
        qos: .userInitiated,
        attributes: [.concurrent]
    )
    // 2. Чтение - sync
    let value = queue.sync { cachedValue }
    // 3. Запись - async barrier
    queue.async(flags: .barrier) {
        cachedValue = newValue
    }
    // 4. UI обновление - main async
    DispatchQueue.main.async {
        updateUI()
    }
}
