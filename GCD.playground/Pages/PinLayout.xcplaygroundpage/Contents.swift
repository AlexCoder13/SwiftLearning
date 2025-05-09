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
// Аналогичный пример на SnapKit:
import SnapKit

redView.snp.makeConstraints { make in
    make.width.height.equalTo(100)
    make.center.equalToSuperview()
}
// Аналогичный пример на AutoLayout:
redView.translatesAutoresizingMaskIntoConstraints = false
NSLayoutConstraint.activate([
    redView.widthAnchor.constraint(equalToConstant: 100),
    redView.heightAnchor.constraint(equalToConstant: 100),
    redView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
    redView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
])

// 2. Относительное позиционирование (отступы)
redView.pin
    .top(20)           // Отступ сверху 20pt
    .left(20)          // Отступ слева 20pt
    .width(100)
    .height(100)

// 3. Выравнивание относительно другого элемента
let blueView = UIView()
blueView.backgroundColor = .blue
view.addSubview(blueView)
blueView.pin
    .top(to: redView.edge.bottom)  // Размещаем под redView
    .left(to: redView.edge.left)   // Выравниваем по левому краю
    .width(100)
    .height(100)

// 4. Процентные размеры и маргины
redView.pin
    .top(10%)
    .left(10%)
    .width(80%)  // 80% от ширины родителя
    .height(200)

// 5. Анимация с PinLayout
UIView.animate(withDuration: 0.3) {
    self.redView.pin.top(100).left(100).layout()
    self.view.layoutIfNeeded()
}
