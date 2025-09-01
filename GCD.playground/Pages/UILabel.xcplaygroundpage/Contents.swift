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


//4. Стилизация
//Цвета:
// Цвет текста
button.setTitleColor(.red, for: .normal)
button.setTitleColor(.lightGray, for: .disabled)

// Цвет тени текста
button.setTitleShadowColor(.black, for: .normal)

// Tint color (влияет на системные иконки)
button.tintColor = .systemBlue

//Геометрия:
// Отступы контента
button.contentEdgeInsets = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)

// Отступы изображения
button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -10, bottom: 0, right: 10)

// Отступы текста
button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: -10)


//5. Взаимодействие
//Добавление действий:
// Основные события:
button.addTarget(self, action: #selector(handleTap), for: .touchUpInside) // Нажатие
button.addTarget(self, action: #selector(handleTouchDown), for: .touchDown) // Коснулись
button.addTarget(self, action: #selector(handleDragOutside), for: .touchDragOutside) // Вышли за границы

//Настройка поведения:
button.showsTouchWhenHighlighted = true // Подсветка при нажатии
button.adjustsImageWhenHighlighted = true // Изображение при нажатии
button.adjustsImageWhenDisabled = true // Изображение при отключении
button.isExclusiveTouch = true // Блокировка других нажатий


//6. Конфигурации (iOS 15+)
if #available(iOS 15.0, *) {
    var config = UIButton.Configuration.filled()
    config.title = "Новая кнопка"
    config.image = UIImage(systemName: "star.fill")
    config.imagePadding = 10
    config.cornerStyle = .large
    config.baseBackgroundColor = .systemPurple
    myButton.configuration = config
}





// UIView
// Создаем UIView через ленивое свойство
lazy var customView: UIView = {
    let view = UIView()
    
    // MARK: - Геометрия и положение
    
    // Ручная установка frame (не рекомендуется с Auto Layout)
    view.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
    
    // Положение центра view относительно superview
    view.center = self.view.center
    
    // MARK: - Иерархия представлений
    
    // Добавляем subview (пример)
    let subview = UIView(frame: CGRect(x: 10, y: 10, width: 50, height: 50))
    subview.backgroundColor = .red
    view.addSubview(subview)
    
    // Удаление subview
    subview.removeFromSuperview()
    
    // Доступ к superview
    let superview = view.superview
    
    // Доступ ко всем subviews
    let subviews = view.subviews
    
    // MARK: - Внешний вид
    
    // Фоновый цвет
    view.backgroundColor = .systemBlue
    
    // Прозрачность (0.0 - полностью прозрачный, 1.0 - полностью непрозрачный)
    view.alpha = 0.9
    
    // Скрытие view (не удаляет из иерархии)
    view.isHidden = false
    
    // MARK: - Слои (CALayer свойства)
    
    // Скругление углов
    view.layer.cornerRadius = 10
    
    // Граница
    view.layer.borderWidth = 2
    view.layer.borderColor = UIColor.white.cgColor
    
    // Тень
    view.layer.shadowColor = UIColor.black.cgColor
    view.layer.shadowOffset = CGSize(width: 0, height: 5)
    view.layer.shadowRadius = 10
    view.layer.shadowOpacity = 0.5
    view.layer.shadowPath = UIBezierPath(roundedRect: view.bounds, cornerRadius: 10).cgPath
    
    // Маска для скругления (если clipsToBounds = true)
    view.layer.masksToBounds = false
    
    // MARK: - Преобразования
    
    // Масштабирование
    view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
    
    // Поворот
    // view.transform = CGAffineTransform(rotationAngle: .pi/4)
    
    // Перенос
    // view.transform = CGAffineTransform(translationX: 10, y: 10)
    
    // MARK: - Пользовательское взаимодействие
    
    // Включение пользовательского взаимодействия
    view.isUserInteractionEnabled = true
    
    // Множественные касания
    view.isMultipleTouchEnabled = false
    
    // MARK: - Теги
    
    // Установка тега для последующего поиска
    view.tag = 100
    
    // Поиск по тегу
    // let foundView = self.view.viewWithTag(100)
    
    // MARK: - Auto Layout
    
    // Отключение автоматического преобразования autoresizing mask в constraints
    view.translatesAutoresizingMaskIntoConstraints = false
    
    // MARK: - Контент и отрисовка
    
    // Режим отображения контента
    view.contentMode = .scaleToFill // .scaleAspectFit, .redraw и др.
    
    // Очистка графического контекста перед отрисовкой
    view.clearsContextBeforeDrawing = true
    
    // MARK: - Флаг клавиатуры
    
    // Влияет ли view на расположение клавиатуры
    view.keyboardDismissMode = .interactive
    
    // MARK: - Жесты
    
    // Добавление распознавателя жестов
    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
    view.addGestureRecognizer(tapGesture)
    
    return view
}()



//Полный разбор всех свойств UIView
//1. Геометрия и положение
// Прямоугольник view в координатах superview
view.frame = CGRect(x: 0, y: 0, width: 100, height: 100)

// Границы view в собственной системе координат
view.bounds = CGRect(x: 0, y: 0, width: 100, height: 100)

// Центр view относительно superview
view.center = CGPoint(x: 50, y: 50)

// Преобразование координат между view
let convertedPoint = view.convert(CGPoint(x: 10, y: 10), to: otherView)

// Размер, который view хочет получить
view.intrinsicContentSize

// Определяет, должен ли view изменить размер при изменении содержимого
view.invalidateIntrinsicContentSize()


//2. Иерархия представлений
// Добавление subview
parentView.addSubview(childView)

// Удаление из иерархии
childView.removeFromSuperview()

// Перемещение на передний план
parentView.bringSubviewToFront(childView)

// Перемещение на задний план
parentView.sendSubviewToBack(childView)

// Вставка между другими subviews
parentView.insertSubview(childView, at: 2)
parentView.insertSubview(childView, aboveSubview: siblingView)
parentView.insertSubview(childView, belowSubview: siblingView)

// Поиск по тегу
let foundView = parentView.viewWithTag(100)


//3. Внешний вид
// Фоновый цвет
view.backgroundColor = .systemBlue

// Прозрачность (0.0 - 1.0)
view.alpha = 0.5

// Видимость (не удаляет из иерархии)
view.isHidden = true

// Обрезка содержимого за границами
view.clipsToBounds = true

// Режим отображения контента
view.contentMode = .scaleAspectFit // .center, .top, .scaleToFill и др.

// Tint color (влияет на системные элементы)
view.tintColor = .systemRed

// Очистка графического контекста перед отрисовкой
view.clearsContextBeforeDrawing = true

// Определяет, нужно ли view обновляться при изменении bounds
view.contentScaleFactor = UIScreen.main.scale


//4. Слои (CALayer)
// Скругление углов
view.layer.cornerRadius = 10

// Граница
view.layer.borderWidth = 2
view.layer.borderColor = UIColor.white.cgColor

// Тень
view.layer.shadowColor = UIColor.black.cgColor
view.layer.shadowOffset = CGSize(width: 0, height: 5)
view.layer.shadowRadius = 10
view.layer.shadowOpacity = 0.5
view.layer.shadowPath = UIBezierPath(rect: view.bounds).cgPath

// Маска для скругления
view.layer.masksToBounds = true

// Маска слоя
view.layer.mask = someOtherLayer

// Фильтр размытия (iOS 13+)
if #available(iOS 13.0, *) {
    view.layer.filters = [CIFilter(name: "CIGaussianBlur")]
}


//5. Преобразования
// Аффинные преобразования (2D)
view.transform = CGAffineTransform.identity // Сброс преобразований
view.transform = CGAffineTransform(scaleX: 1.5, y: 1.5) // Масштабирование
view.transform = CGAffineTransform(rotationAngle: .pi/4) // Поворот
view.transform = CGAffineTransform(translationX: 10, y: 10) // Перенос

// 3D преобразования (через layer)
view.layer.transform = CATransform3DMakeRotation(.pi/4, 1, 0, 0)


//6. Пользовательское взаимодействие
// Включение взаимодействия
view.isUserInteractionEnabled = true

// Множественные касания
view.isMultipleTouchEnabled = true

// Эксклюзивное касание (блокирует другие жесты)
view.isExclusiveTouch = false

// Тест на попадание точки
let point = CGPoint(x: 50, y: 50)
if view.point(inside: point, with: nil) {
    print("Точка внутри view")
}

// Жесты
let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
view.addGestureRecognizer(tapGesture)


//7. Auto Layout
// Отключение autoresizing mask преобразования
view.translatesAutoresizingMaskIntoConstraints = false

// Сжатие содержимого
view.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)

// Сопротивление растяжению
view.setContentHuggingPriority(.defaultLow, for: .vertical)

// Системные spacing constraints
let systemSpacing = view.directionalLayoutMargins

// Кастомные margins
view.layoutMargins = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)

// Безопасные области (iOS 11+)
view.insetsLayoutMarginsFromSafeArea = true


//8. Отрисовка и обновление
// Принудительная отрисовка
view.setNeedsDisplay()

// Отрисовка конкретного прямоугольника
view.setNeedsDisplay(CGRect(x: 0, y: 0, width: 50, height: 50))

// Кастомная отрисовка (переопределить draw(_:))
class CustomView: UIView {
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(ovalIn: rect)
        UIColor.red.setFill()
        path.fill()
    }
}

// Обновление layout
view.setNeedsLayout()
view.layoutIfNeeded()


//9. Анимации
// Простая анимация
UIView.animate(withDuration: 0.3) {
    view.alpha = 0.5
    view.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
}

// Spring анимация
UIView.animate(withDuration: 0.5,
               delay: 0,
               usingSpringWithDamping: 0.5,
               initialSpringVelocity: 0,
               options: []) {
    view.center.y += 100
}

// Keyframe анимация
UIView.animateKeyframes(withDuration: 1.0, delay: 0) {
    UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.25) {
        view.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
    }
    UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25) {
        view.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
    }
    UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.5) {
        view.transform = .identity
    }
}

//
//10. Жизненный цикл
// Вызывается при добавлении в иерархию view
override func didMoveToSuperview() {
    super.didMoveToSuperview()
    if superview != nil {
        print("View было добавлено в иерархию")
    }
}

// Вызывается при добавлении в окно
override func didMoveToWindow() {
    super.didMoveToWindow()
    if window != nil {
        print("View появилось в окне")
    }
}

// Вызывается при изменении layout
override func layoutSubviews() {
    super.layoutSubviews()
    print("View обновило layout")
}





// UITextField
// Создаем UIView через ленивое свойство
lazy var myTextField: UITextField = {
    let textField = UITextField()
    
    // MARK: - Основные свойства текста
    textField.text = "Начальный текст"
    textField.textColor = .darkText
    textField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
    textField.textAlignment = .left
    
    // MARK: - Внешний вид и стиль
    textField.backgroundColor = .systemBackground
    textField.layer.cornerRadius = 8
    textField.layer.borderWidth = 1
    textField.layer.borderColor = UIColor.systemGray4.cgColor
    
    // MARK: - Плейсхолдер
    textField.placeholder = "Введите текст здесь"
    textField.attributedPlaceholder = NSAttributedString(
        string: "Стилизованный плейсхолдер",
        attributes: [.foregroundColor: UIColor.systemGray2]
    )
    
    // MARK: - Границы и отступы
    textField.borderStyle = .none // .line, .bezel, .roundedRect
    textField.contentVerticalAlignment = .center
    textField.contentHorizontalAlignment = .leading
    textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 1))
    textField.leftViewMode = .always
    textField.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 1))
    textField.rightViewMode = .unlessEditing
    
    // MARK: - Клавиатура и ввод
    textField.keyboardType = .default // .emailAddress, .numberPad, .phonePad и т.д.
    textField.keyboardAppearance = .default // .dark
    textField.returnKeyType = .done // .go, .search, .send и т.д.
    textField.autocapitalizationType = .sentences // .none, .words, .allCharacters
    textField.autocorrectionType = .default // .no, .yes
    textField.spellCheckingType = .default // .no, .yes
    textField.smartQuotesType = .yes // .no
    textField.smartDashesType = .yes // .no
    textField.smartInsertDeleteType = .yes // .no
    
    // MARK: - Безопасность ввода
    textField.isSecureTextEntry = false // для паролей
    textField.textContentType = .none // .username, .password, .emailAddress и т.д.
    
    // MARK: - Инструменты ввода
    textField.inputAccessoryView = {
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 44))
        toolbar.items = [
            UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil),
            UIBarButtonItem(title: "Готово", style: .done, target: self, action: #selector(doneButtonTapped))
        ]
        return toolbar
    }()
    
    // MARK: - Очистка текста
    textField.clearButtonMode = .whileEditing // .never, .unlessEditing, .always
    textField.clearsOnBeginEditing = false
    textField.clearsOnInsertion = false
    
    // MARK: - Делегат и события
    textField.delegate = self
    
    // MARK: - Auto Layout
    textField.translatesAutoresizingMaskIntoConstraints = false
    
    // MARK: - Дополнительные настройки
    textField.adjustsFontSizeToFitWidth = false
    textField.minimumFontSize = 12
    textField.allowsEditingTextAttributes = false
    textField.tintColor = .systemBlue // цвет курсора
    
    return textField
}()



//Подробный разбор всех свойств UITextField
//1. Основные свойства текста
// Текущий текст
textField.text = "Текст поля"

// Цвет текста
textField.textColor = .black

// Шрифт
textField.font = UIFont.systemFont(ofSize: 16)

// Выравнивание текста
textField.textAlignment = .left // .center, .right, .justified, .natural


//2. Плейсхолдер
// Простой плейсхолдер
textField.placeholder = "Введите имя"

// Стилизованный атрибутированный плейсхолдер
textField.attributedPlaceholder = NSAttributedString(
    string: "Введите пароль",
    attributes: [.foregroundColor: UIColor.gray, .font: UIFont.italicSystemFont(ofSize: 14)]
)


//3. Границы и отступы
// Стиль границы
textField.borderStyle = .roundedRect // .none, .line, .bezel

// Кастомные отступы через leftView/rightView
let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 1))
textField.leftView = paddingView
textField.leftViewMode = .always // .never, .whileEditing, .unlessEditing


//4. Клавиатура и ввод
// Тип клавиатуры
textField.keyboardType = .emailAddress // .default, .numberPad, .phonePad, .URL и др.

// Вид клавиатуры
textField.keyboardAppearance = .dark // .default, .light (iOS 13+)

// Тип кнопки Return
textField.returnKeyType = .search // .default, .go, .done, .send и др.

// Автокоррекция и капитализация
textField.autocorrectionType = .no
textField.autocapitalizationType = .words // .none, .sentences, .allCharacters

// Проверка орфографии
textField.spellCheckingType = .yes // .no, .default


//5. Безопасность ввода
// Скрытие вводимых символов (для паролей)
textField.isSecureTextEntry = true

// Подсказки для автозаполнения
textField.textContentType = .password // .username, .emailAddress, .oneTimeCode и др.

// Временное отключение secureTextEntry (чтобы показать символ)
textField.isSecureTextEntry = false


//6. Инструменты ввода
// Кастомная панель инструментов над клавиатурой
let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 44))
toolbar.items = [
    UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil),
    UIBarButtonItem(title: "Готово", style: .done, target: self, action: #selector(doneTapped))
]
textField.inputAccessoryView = toolbar

// Кастомная клавиатура (например, UIPickerView)
let picker = UIPickerView()
textField.inputView = picker


//7. Управление очисткой текста
// Режим отображения кнопки очистки
textField.clearButtonMode = .whileEditing // .never, .unlessEditing, .always

// Очищать ли поле при начале редактирования
textField.clearsOnBeginEditing = false

// Очищать ли при вставке
textField.clearsOnInsertion = false


//8. Делегат и обработка событий
// Основные методы делегата
extension ViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true // Разрешить редактирование
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("Начато редактирование")
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true // Разрешить завершение редактирования
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("Завершено редактирование")
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // Валидация ввода
        return true
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        return true // Разрешить очистку
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
