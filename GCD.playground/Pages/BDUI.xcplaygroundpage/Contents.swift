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
