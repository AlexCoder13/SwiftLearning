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

// POST-запрос с Alamofire
// 1. Подготавливаем параметры (тело запроса)
let parameters: [String: Any] = ["key1": "value1", "key2": "value2"]
// 2. Отправляем POST-запрос с параметрами
AF.request(
    "https://api.example.com/post",
    method: .post,
    parameters: parameters,
    encoding: JSONEncoding.default // Автоматически кодирует в JSON
).responseJSON { response in
    // 3. Обрабатываем ответ (успех/ошибка)
    switch response.result {
    case .success(let value):
        // 4. Выводим JSON-ответ
        print(value)
    case .failure(let error):
        // 5. Выводим ошибку
        print("Error: \(error.localizedDescription)")
    }
}

// Пример АНАЛОГИЧНОГО запроса на URL-Session
// 1. Проверяем URL
guard let url = URL(string: "https://api.example.com/post") else { return }
// 2. Создаём запрос (URLRequest) и указываем метод POST
var request = URLRequest(url: url)
request.httpMethod = "POST"
// 3. Устанавливаем заголовок (Content-Type: application/json)
request.setValue("application/json", forHTTPHeaderField: "Content-Type")
// 4. Подготавливаем тело запроса (словарь → JSON-данные)
let body: [String: Any] = ["key1": "value1", "key2": "value2"]
request.httpBody = try? JSONSerialization.data(withJSONObject: body)
// 5. Отправляем запрос
let task = URLSession.shared.dataTask(with: request) { data, response, error in
    // 6. Обрабатываем ошибку (если есть)
    if let error = error {
        print("Error: \(error.localizedDescription)")
        return
    }
    // 7. Проверяем, что данные получены
    guard let data = data else { return }
    // 8. Пытаемся преобразовать ответ в JSON
    do {
        let jsonResponse = try JSONSerialization.jsonObject(with: data)
        print(jsonResponse)
    } catch {
        print("Decoding error: \(error)")
    }
}
// 9. Запускаем задачу
task.resume()

