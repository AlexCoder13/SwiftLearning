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
