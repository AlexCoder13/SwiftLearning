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
    
    // MARK: - Размер и расположение
    
    // Автоматическое изменение размера шрифта для вписывания текста
    label.adjustsFontSizeToFitWidth = false
    
    // Минимальный масштаб шрифта при adjustsFontSizeToFitWidth
    label.minimumScaleFactor = 0.5 // например, шрифт может уменьшиться до 50% от исходного
    
    // Позволяет ли UILabel сжимать межбуквенные интервалы для вписывания текста
    label.allowsDefaultTighteningForTruncation = false
    
    // MARK: - Высококонтрастный режим
    
    // Увеличивает контрастность текста при включенном режиме повышенной контрастности
    label.adjustsFontForContentSizeCategory = true
    
    // MARK: - Взаимодействие
    
    // Включение/выключение жестов (для UILabel обычно не используется)
    label.isExclusiveTouch = true
    
    // MARK: - Интерфейс Builder
    
    // Стиль интерфейса (светлый/темный)
    label.overrideUserInterfaceStyle = .unspecified // .light, .dark
    
    // MARK: - Настройка вида
    
    // Обрезка по границам
    label.clipsToBounds = false
    
    // Углы с закруглением
    label.layer.cornerRadius = 0
    label.layer.masksToBounds = false
    
    // MARK: - Многострочные специфические настройки
    
    // Базовая линия текста (выравнивание по базовой линии для многострочного текста)
    label.baselineAdjustment = .alignBaselines // .alignCenters, .none
    
    // Предпочтительная максимальная ширина для многострочных текстов
    label.preferredMaxLayoutWidth = 0 // 0 означает, что используется ширина фрейма
    
    // MARK: - Визуальные эффекты
    
    // Добавление вибрации (размытия)
    if #available(iOS 13.0, *) {
        label.addVibrancyEffect() // если нужно добавить эффект вибрации
    }
    
    
    
    
    
}
