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

