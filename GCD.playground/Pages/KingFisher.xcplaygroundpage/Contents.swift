import Foundation

// MARK: - KingFisher

/*
 Описание:
 Kingfisher — это популярная библиотека для асинхронной загрузки и кеширования изображений в iOS-приложениях. Она предоставляет простой API для работы с изображениями, поддерживает кеширование, трансформации и интеграцию с SwiftUI.
 */

// 1. Базовая загрузка изображения в UIImageView
import Kingfisher
// Создаем URL изображения
let url = URL(string: "https://example.com/image.jpg")!
// Загружаем изображение в UIImageView
imageView.kf.setImage(with: url)

// 2. Загрузка с обработчиком завершения
import Kingfisher
let url = URL(string: "https://example.com/image.jpg")!
imageView.kf.setImage(
    with: url,
    placeholder: UIImage(named: "placeholder"), // Заглушка на время загрузки
    options: [
        .transition(.fade(0.3)), // Плавное появление
        .cacheOriginalImage // Кешировать оригинал
    ],
    completionHandler: { result in
        switch result {
        case .success(let value):
            print("Изображение загружено: \(value.source.url?.absoluteString ?? "")")
        case .failure(let error):
            print("Ошибка: \(error.localizedDescription)")
        }
    }
)
