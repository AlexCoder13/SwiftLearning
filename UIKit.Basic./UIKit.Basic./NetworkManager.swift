//  NetworkManager.swift
//  UIKit.Basic.
//  Created by Александр Семёнов on 02.05.2025.


// client_id - для ключа, потом пригодится
// /photos/random - путь


/*
 Что нам нужно:
 1 - URL, куда мы будем отправлять запрос
 2 - Ключ доступа (API-ключ)
 3 - Дополнительные параметры в рамках выбранного API
 4 - Выполнить ЗАПРОС
 
 Как формировать URL полностью:
 1 - Сам URL сайта: https://api.unsplash.com
 2 - Через / подставляем наш путь: /photos/random
 3 - Затем знак вопроса
 4 - Затем ключ API: client_id=07FpKKAujVbfHV2cXmDuXAYiFm6sLRjlur5MGexPNBg
 5 - Затем параметры, которым должен соответствовать получаемый из API результат (с помощью знаков & и =): &query=car&orientation=landscape&count=3
 Общий результат: https://api.unsplash.com/photos/random?client_id=07FpKKAujVbfHV2cXmDuXAYiFm6sLRjlur5MGexPNBg&query=car&orientation=landscape&count=3
 */

import UIKit

class NetworkManager {
    // АПИ-ключ
    let apiKey: String = "07FpKKAujVbfHV2cXmDuXAYiFm6sLRjlur5MGexPNBg"
    // URL - куда отправлять запросы
    let url: String = "https://api.unsplash.com"
    
    // Метод для отправки Запроса
    func sendRequest(query: String, completion: @escaping (String) -> Void) {
        // Формируем URL через компоненты
        var urlComponents = URLComponents(string: "https://api.unsplash.com")
        urlComponents?.path = "/photos/random"
        urlComponents?.queryItems = [
            URLQueryItem(name: "client_id", value: apiKey),
            URLQueryItem(name: "query", value: query),
            URLQueryItem(name: "orientation", value: "landscape"),
        ]
        
        guard let url = urlComponents?.url else { return } // непосредственно наш сформерованный полностью URL
        
        // Создаем наш запрос
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        // Выполнение самого запроса
        URLSession.shared.dataTask(with: request) { data, resp, err in
            guard err == nil else { // делаем проверку на ошибку, если что - не продолжаем и выходим из метода
                print(err!.localizedDescription)
                return
            }
            
            guard let data = data else { return } // проверяем наличие информации
            
            // Декодируем JSON
            do {
                let result = try JSONDecoder().decode(Response.self, from: data)
                completion(result.urls.regular)
            } catch {
                print(error.localizedDescription)
            }
            
        }.resume() // выполняем Таску
    }
}
