import Foundation

// MARK: - PinLayout

/*
 Описание:
 PinLayout — это легковесная библиотека для верстки интерфейсов в iOS-приложениях. Она предоставляет простые и производительные методы для ручного позиционирования элементов без использования AutoLayout.
 
 🔥 Зачем нужен PinLayout?
 1. Высокая производительность — работает быстрее AutoLayout.
 2. Простота — интуитивный синтаксис.
 3. Гибкость — полный контроль над расположением элементов.
 4. Поддержка Objective-C и Swift.
 5. Не требует зависимостей — легковесный фреймворк.
 */

// 1. Базовый пример: размещение UIView
import PinLayout
class ViewController: UIViewController {
    let redView = UIView()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redView.backgroundColor = .red
        view.addSubview(redView)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        // Размещаем красный квадрат 100x100 в центре экрана
        redView.pin
            .width(100)
            .height(100)
            .center() // Центрируем относительно родителя
    }
}

// 2. Относительное позиционирование (отступы)
redView.pin
    .top(20)           // Отступ сверху 20pt
    .left(20)          // Отступ слева 20pt
    .width(100)
    .height(100)
