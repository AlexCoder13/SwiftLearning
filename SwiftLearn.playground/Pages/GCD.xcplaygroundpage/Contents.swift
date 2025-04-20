import Foundation

//Пример 1: Базовое использование async/sync
// Для школьника:
// "Сначала делаем задачу в фоне, потом обновляем экран"

DispatchQueue.global(qos: .userInitiated).async { // Фоновая очередь
    let data = downloadImage() // Долгая задача
    DispatchQueue.main.async { // Вернулись на главный поток
        imageView.image = data // Обновляем UI
    }
}

// Для профессионала:
// Использование weak self для предотвращения утечек памяти
DispatchQueue.global(qos: .background).async { [weak self] in
    guard let self = self else { return }
    let processedData = self.processData()
    DispatchQueue.main.async {
        self.updateUI(with: processedData)
    }
}

// Пример 2: Опасность sync на main
// Для начинающего:
// Никогда не делайте это! Вызовет зависание.

DispatchQueue.main.sync {
    print("Этот код заблокирует поток")
}

// Для профессионала:
// Вызов sync на main очереди из main потока → deadlock.
// Всегда проверяйте текущую очередь через DispatchQueue.queueLabel.

//Пример 3: Работа с QoS
// Высокий приоритет (UI-анимация)
DispatchQueue.global(qos: .userInteractive).async {
    renderComplexAnimation()
}

// Низкий приоритет (логирование)
DispatchQueue.global(qos: .background).async {
    logAnalytics()
}



//Пример 4: DispatchGroup для синхронизации
let group = DispatchGroup()

group.enter()
loadUserData { // Асинхронная задача
    group.leave()
}

group.enter()
loadPosts {
    group.leave()
}

group.notify(queue: .main) { // Всё готово
    showContent()
}

//Пример 5: Concurrent выполнение с барьером
// Для профессионала:
let concurrentQueue = DispatchQueue(label: "com.example.concurrent", attributes: .concurrent)

concurrentQueue.async { // Чтение безопасно
    readData()
}

concurrentQueue.async(flags: .barrier) { // Запись эксклюзивна
    writeData()
}



// ОСНОВНЫЕ ПРОБЛЕМЫ МНОГОПОТОЧНОСТИ
// a) Race Conditions (Гонка данных)
var balance = 100

DispatchQueue.global().async {
    balance += 50 // Читает 100, пишет 150
}

DispatchQueue.global().async {
    balance -= 20 // Читает 100 (ещё не обновлено), пишет 80
}

// В итоге balance может быть 80 или 150, а не 130!
// Решение: Использовать DispatchQueue с .barrier или NSLock.


// b) Deadlock (Взаимная блокировка)
let queue = DispatchQueue(label: "com.example.queue")

queue.sync { // Блокирует текущий поток
    queue.sync { // Ожидает, пока первый sync завершится → Deadlock!
        print("Этот код никогда не выполнится")
    }
}
// Решение: Избегать вложенных sync на одной очереди.


// c) UI-обновления не в главном потоке
// Неправильно:
DispatchQueue.global().async {
    self.label.text = "Новый текст" // ❌ Может сломать UI
}

// Правильно:
DispatchQueue.global().async {
    let newText = "Новый текст"
    DispatchQueue.main.async {
        self.label.text = newText // ✅ UI обновляется в главном потоке
    }
}


// Практические примеры с подробными комментариями
// Пример 1: Загрузка изображения с обновлением UI
// 1. Переходим в фоновый поток для долгой операции
DispatchQueue.global(qos: .userInitiated).async { [weak self] in
    // 2. Загружаем данные (может занять время)
    guard let url = URL(string: "https://example.com/image.jpg"),
          let data = try? Data(contentsOf: url),
          let image = UIImage(data: data)
    else { return }

    // 3. Возвращаемся в главный поток для обновления UI
    DispatchQueue.main.async {
        self?.imageView.image = image // Безопасное обновление
    }
}

// Пример 2: Синхронизация доступа к данным
class ThreadSafeArray {
    private var array = [Int]()
    private let queue = DispatchQueue(label: "com.example.threadSafeArray", attributes: .concurrent)

    func append(_ value: Int) {
        queue.async(flags: .barrier) { // Барьер для записи
            self.array.append(value)
        }
    }

    var values: [Int] {
        queue.sync { // Безопасное чтение
            return array
        }
    }
}

// Пример 3: Deadlock из-за неправильного использования sync
let mainQueue = DispatchQueue.main

mainQueue.async {
    print("1")
    mainQueue.sync { // ❌ Deadlock! Главный поток ждёт сам себя
        print("2")
    }
    print("3")
}
// Вывод: "1" → Зависание
