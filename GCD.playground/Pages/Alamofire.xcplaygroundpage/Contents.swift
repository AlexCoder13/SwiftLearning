import Foundation

// MARK: - Alamofire

// 1. Отправляем GET-запрос на указанный URL
AF.request("https://api.example.com/data")
    // 2. Указываем, что ожидаем получить модель YourModel
    .responseDecodable(of: YourModel.self) { response in
        // 3. Обрабатываем результат (успех или ошибка)
        switch response.result {
        case .success(let data):
            // 4. В случае успеха выводим данные (уже в главном потоке)
            print(data)
        case .failure(let error):
            // 5. В случае ошибки выводим её описание
            print("Error: \(error.localizedDescription)")
        }
    }

// Пример АНАЛОГИЧНОГО запроса на URL-Session
// 1. Проверяем, что URL валидный, иначе выходим из функции
guard let url = URL(string: "https://api.example.com/data") else { return }
// 2. Создаём задачу (dataTask) для выполнения GET-запроса
let task = URLSession.shared.dataTask(with: url) { data, response, error in
    // 3. Если есть ошибка (например, нет интернета), выводим её и завершаем выполнение
    if let error = error {
        print("Error: \(error.localizedDescription)")
        return
    }
    // 4. Проверяем, что данные (data) не nil, иначе выходим
    guard let data = data else { return }
    // 5. Пытаемся декодировать данные в модель (YourModel)
    do {
        let decodedData = try JSONDecoder().decode(YourModel.self, from: data)
        // 6. Возвращаемся в главный поток, чтобы обновить UI (т.к. URLSession работает в фоновом потоке)
        DispatchQueue.main.async {
            print(decodedData) // Выводим данные или обновляем интерфейс
        }
    } catch {
        // 7. Если декодирование не удалось, выводим ошибку
        print("Decoding error: \(error)")
    }
}
// 8. Запускаем задачу (по умолчанию она приостановлена)
task.resume()
