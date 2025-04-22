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
