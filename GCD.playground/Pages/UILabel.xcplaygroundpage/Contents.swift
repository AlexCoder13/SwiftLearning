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
    // MARK: - Настройка Auto Layout
    
    // Отключаем autoresizing mask в constraints
    label.translatesAutoresizingMaskIntoConstraints = false
    
    return label
}()





// UIButton
// Создаем кнопку через ленивое свойство
lazy var myButton: UIButton = {
    let button = UIButton(type: .system) // Тип кнопки (об этом ниже)
    
    // MARK: - Основные свойства
    
    // Устанавливаем заголовок для разных состояний
    button.setTitle("Нажми меня", for: .normal)
    button.setTitle("Нажимается...", for: .highlighted)
    button.setTitle("Отключено", for: .disabled)
    
    // Устанавливаем цвет заголовка
    button.setTitleColor(.white, for: .normal)
    button.setTitleColor(.lightGray, for: .highlighted)
    button.setTitleColor(.gray, for: .disabled)
    
    // Устанавливаем цвет фона (для кастомных кнопок)
    button.backgroundColor = .systemBlue
    
    // MARK: - Шрифт и текст
    
    // Настройка шрифта заголовка
    button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
    
    // Тень текста
    button.titleLabel?.shadowOffset = CGSize(width: 0, height: 1)
    button.setTitleShadowColor(.black.withAlphaComponent(0.3), for: .normal)
    
    // MARK: - Изображения
    
    // Установка изображений для разных состояний
    button.setImage(UIImage(systemName: "heart.fill"), for: .normal)
    button.setImage(UIImage(systemName: "heart"), for: .selected)
    
    // Позиционирование изображения относительно текста
    button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
    button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
    
    // MARK: - Фоновые изображения
    
    // Создаем кастомный фон для кнопки
    let backgroundImage = UIImage(color: .systemBlue, size: CGSize(width: 1, height: 1))
    button.setBackgroundImage(backgroundImage, for: .normal)
    
    let highlightedImage = UIImage(color: .systemBlue.withAlphaComponent(0.7), size: CGSize(width: 1, height: 1))
    button.setBackgroundImage(highlightedImage, for: .highlighted)
    
    // MARK: - Внешний вид
    
    // Скругление углов
    button.layer.cornerRadius = 10
    button.layer.masksToBounds = true
    
    // Граница
    button.layer.borderWidth = 1
    button.layer.borderColor = UIColor.white.cgColor
    
    // Тень
    button.layer.shadowColor = UIColor.black.cgColor
    button.layer.shadowOffset = CGSize(width: 0, height: 2)
    button.layer.shadowRadius = 4
    button.layer.shadowOpacity = 0.3
    
    // MARK: - Состояния
    
    button.isEnabled = true // Включена ли кнопка
    button.isSelected = false // Выбрана ли кнопка
    button.isHighlighted = false // Подсвечена ли в данный момент
    
    // MARK: - Контент
    
    // Выравнивание контента
    button.contentVerticalAlignment = .center
    button.contentHorizontalAlignment = .center
    
    // Отступы контента
    button.contentEdgeInsets = UIEdgeInsets(top: 12, left: 20, bottom: 12, right: 20)
    
    // MARK: - Поведение
    
    // Показывать подсветку при нажатии
    button.showsTouchWhenHighlighted = true
    
    // Задержка перед началом действия (для предотвращения случайных нажатий)
    button.isExclusiveTouch = true
    
    // MARK: - Настройка Auto Layout
    
    button.translatesAutoresizingMaskIntoConstraints = false
    
    // Добавляем действие при нажатии
    button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    
    return button
}()



//1. Типы кнопок (UIButton.ButtonType)
// Доступные типы при инициализации:
.system // Стандартная системная кнопка с адаптивным стилем
.custom // Полностью кастомная кнопка
.detailDisclosure // Кнопка с иконкой "i"
.infoLight // Кнопка с иконкой информации (светлая)
.infoDark // Кнопка с иконкой информации (темная)
.contactAdd // Кнопка с плюсом для добавления контактов
.close // Кнопка закрытия (крестик)


//2. Состояния кнопки
// Основные состояния:
.normal // Обычное состояние
.highlighted // Когда кнопка нажата
.disabled // Когда кнопка выключена
.selected // Когда кнопка выбрана
.focused // Когда кнопка в фокусе (для TV и пр.)

// Управление состояниями:
myButton.isEnabled = true/false
myButton.isSelected = true/false
myButton.isHighlighted = true/false


//3. Контент кнопки
//Текст:
// Установка текста для разных состояний
button.setTitle("Нажми", for: .normal)
button.setTitle("Нажимается", for: .highlighted)

// Получение текущего заголовка
let currentTitle = button.title(for: .normal)

// Установка атрибутированного текста
let attributedString = NSAttributedString(string: "Нажми", attributes: [.font: UIFont.boldSystemFont(ofSize: 16)])
button.setAttributedTitle(attributedString, for: .normal)

//Изображения:
// Установка изображений
button.setImage(UIImage(named: "icon"), for: .normal)

// Фоновые изображения
button.setBackgroundImage(UIImage(named: "bg"), for: .normal)

// Получение текущих изображений
let currentImage = button.image(for: .normal)
let currentBgImage = button.backgroundImage(for: .normal)
