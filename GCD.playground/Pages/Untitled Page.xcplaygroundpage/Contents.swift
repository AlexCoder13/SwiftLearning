import Foundation
import UIKit // для элементов

// MARK: - ЭЛЕМЕНТЫ UIKIT и их свойства

// UILabel
// Создаем UILabel через лazy property (ленивое свойство)
// Это позволяет отложить инициализацию до первого обращения к свойству
lazy var myLabel: UILabel = {
    let label = UILabel()
    
    // MARK: - Основные свойства текста
    
    // Текст, который будет отображаться
    label.text = "Hello, UIKit!"
    
    // Шрифт текста
    label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
    // Альтернативные варианты:
    // label.font = UIFont.boldSystemFont(ofSize: 20)
    // label.font = UIFont(name: "Helvetica Neue", size: 16)
    
    // Цвет текста
    label.textColor = .black
    // Альтернативные варианты:
    // label.textColor = UIColor(red: 0.2, green: 0.4, blue: 0.6, alpha: 1.0)
    // label.textColor = .systemBlue
    
    // Выравнивание текста
    label.textAlignment = .left // .center, .right, .justified, .natural
    
    
    
}
