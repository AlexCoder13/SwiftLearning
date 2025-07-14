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
    
    // MARK: - Многострочный текст
    
    // Количество строк (0 - неограниченное количество)
    label.numberOfLines = 0
    
    // Как текст должен обрезаться, если не помещается
    label.lineBreakMode = .byTruncatingTail // варианты: .byWordWrapping, .byCharWrapping, .byClipping, .byTruncatingHead, .byTruncatingMiddle, .byTruncatingTail
    
    // MARK: - Внешний вид и стиль
    
    // Фоновый цвет
    label.backgroundColor = .clear
    
    // Прозрачность (от 0.0 до 1.0)
    label.alpha = 1.0
    
    // Видимость
    label.isHidden = false
    
    // Включение/выключение пользовательского взаимодействия
    label.isUserInteractionEnabled = false // для UILabel обычно false
    
    // MARK: - Тени
    
    // Цвет тени
    label.shadowColor = nil // например: UIColor.gray.withAlphaComponent(0.5)
    
    // Смещение тени
    label.shadowOffset = CGSize(width: 0, height: -1) // отрицательный height - тень сверху
    
    // MARK: - Особые стили текста
    
    // Атрибутированный текст (позволяет задать разные стили для частей текста)
    let attributedString = NSMutableAttributedString(string: "Attributed text")
    attributedString.addAttribute(.foregroundColor, value: UIColor.red, range: NSRange(location: 0, length: 5))
    label.attributedText = attributedString
    
    
    
    
}
