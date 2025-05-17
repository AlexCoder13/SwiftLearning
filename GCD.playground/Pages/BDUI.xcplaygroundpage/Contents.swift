import Foundation

// MARK: - BDUI

/*
 Описание:
 Driven UI (или "Управляемый интерфейс") — это архитектурный подход, при котором состояние интерфейса полностью определяется данными, а не жестко закодированной логикой. Он особенно популярен в крупных проектах с динамическими интерфейсами.
 🔥 Что такое Driven UI?
 Это паттерн, где:
 * UI = f(State) — интерфейс является функцией от состояния
 * Состояние описывается декларативно (обычно через структуры данных)
 * Изменения состояния автоматически обновляют UI
 * Минимум императивного кода в View-слое
 */

// 💻 Пример реализации Driven UI (с нуля)
// 1. Модель состояния
// 1. Состояние для кнопки
struct ButtonState {
    let title: String
    let isEnabled: Bool
    let action: () -> Void
}
// 2. Состояние для текстового поля
struct TextFieldState {
    let text: String
    let placeholder: String
    let onTextChanged: (String) -> Void
}
// 3. Композитное состояние экрана
struct ScreenState {
    let title: String
    let buttonState: ButtonState
    let textFieldState: TextFieldState
}

// 2. Фабрика UI
class UIFactory {
    // 1. Создает кнопку на основе состояния
    static func createButton(from state: ButtonState) -> UIButton {
        let button = UIButton(type: .system)
        // 2. Настраиваем заголовок
        button.setTitle(state.title, for: .normal)
        // 3. Устанавливаем доступность
        button.isEnabled = state.isEnabled
        // 4. Подключаем действие
        button.addAction(UIAction { _ in state.action() }, for: .touchUpInside)
        return button
    }
    // 5. Создает текстовое поле
    static func createTextField(from state: TextFieldState) -> UITextField {
        let textField = UITextField()
        textField.text = state.text
        textField.placeholder = state.placeholder
        // 6. Подписываемся на изменения текста
        textField.addAction(
            UIAction { [weak textField] _ in
                state.onTextChanged(textField?.text ?? "")
            },
            for: .editingChanged
        )
        return textField
    }
}

// 3. ViewController
class DynamicViewController: UIViewController {
    // 1. Текущее состояние
    private var currentState: ScreenState
    // 2. UI-элементы
    private lazy var titleLabel = UILabel()
    private lazy var actionButton = UIButton()
    private lazy var textField = UITextField()
    // 3. Инициализатор с состоянием
    init(state: ScreenState) {
        self.currentState = state
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        render(state: currentState)
    }
    // 4. Настройка лейаута
    private func setupUI() {
        view.backgroundColor = .white
        let stackView = UIStackView(arrangedSubviews: [titleLabel, textField, actionButton])
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    // 5. Рендер состояния
    func render(state: ScreenState) {
        titleLabel.text = state.title
        actionButton = UIFactory.createButton(from: state.buttonState)
        textField = UIFactory.createTextField(from: state.textFieldState)
    }
}

// 4. Использование
let screenState = ScreenState(
    title: "Авторизация",
    buttonState: ButtonState(
        title: "Войти",
        isEnabled: false,
        action: { print("Кнопка нажата") }
    ),
    textFieldState: TextFieldState(
        text: "",
        placeholder: "Введите email",
        onTextChanged: { text in
            print("Текст изменен: \(text)")
            // Здесь можно обновлять состояние кнопки
        }
    )
)
// 2. Создаем и показываем контроллер
let vc = DynamicViewController(state: screenState)
window?.rootViewController = vc
