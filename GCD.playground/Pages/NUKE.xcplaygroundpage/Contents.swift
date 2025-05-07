import Foundation

// MARK: - Nuke - библиотека для асинхронной загрузки и кэширования изображений.

/*
 Описание:
 Nuke — это мощная и легковесная библиотека для асинхронной загрузки и кэширования изображений в iOS-приложениях. Она оптимизирована для работы с UITableView, UICollectionView и другими интерфейсами, где требуется быстрая подгрузка картинок (например, ленты новостей, галереи, списки товаров).

 🔥 Зачем нужна Nuke?
 1. Автоматическая загрузка изображений по URL.
 2. Кэширование (в памяти и на диске) для ускорения повторной загрузки.
 3. Поддержка GIF, WebP, прогрессивного JPEG.
 4. Отмена загрузки при прокрутке (чтобы не грузить ненужные изображения).
 5. Гибкая настройка (кеша, обработчиков ошибок, заголовков запросов).
 6. Интеграция с SwiftUI, UIKit, Combine.
 */

// 1. Базовая загрузка изображения в UIImageView
import Nuke
// Создаем URL изображения
let imageURL = URL(string: "https://example.com/image.jpg")!
// Загружаем изображение в UIImageView
Nuke.loadImage(with: imageURL, into: imageView)

// 2. Загрузка с обработкой ошибок
import Nuke
let imageURL = URL(string: "https://example.com/image.jpg")!
// Создаем запрос с настройками
let request = ImageRequest(
    url: imageURL,
    processors: [ImageProcessors.Resize(width: 200)], // Ресайзим изображение
    priority: .high // Высокий приоритет загрузки
)
// Загружаем с обработчиком результата
Nuke.loadImage(with: request, into: imageView) { result in
    switch result {
    case .success(let response):
        print("Изображение загружено: \(response.image)")
    case .failure(let error):
        print("Ошибка: \(error)")
    }
}

// 3. Загрузка с кастомными заголовками (например, для API с авторизацией)
import Nuke
let imageURL = URL(string: "https://api.example.com/private-image.jpg")!
// Настраиваем URLRequest с заголовками
var urlRequest = URLRequest(url: imageURL)
urlRequest.addValue("Bearer YOUR_TOKEN", forHTTPHeaderField: "Authorization")
// Создаем ImageRequest с кастомным URLRequest
let request = ImageRequest(urlRequest: urlRequest)
// Загружаем
Nuke.loadImage(with: request, into: imageView)

// 4. Поддержка GIF (через плагин NukeUI)
import Nuke
import NukeUI // Подключаем дополнительный модуль
let imageURL = URL(string: "https://example.com/animation.gif")!
// Используем LazyImageView (поддерживает GIF)
let imageView = LazyImageView()
imageView.url = imageURL

// ⚡ Оптимизация для UITableView / UICollectionView
// Отмена загрузки при скроллинге
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    let imageURL = URL(string: images[indexPath.row])!
    // Загружаем изображение с тэгом (для отмены)
    let request = ImageRequest(
        url: imageURL,
        userInfo: [.cellReuseKey: "cell_\(indexPath.row)"] // Уникальный ключ
    )
    Nuke.loadImage(with: request, into: cell.imageView!)
    return cell
}
// Отменяем загрузку при скроллинге
func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    Nuke.cancelRequest(for: cell.imageView!)
}
