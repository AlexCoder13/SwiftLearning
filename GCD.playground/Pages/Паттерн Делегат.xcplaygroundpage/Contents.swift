import Foundation

// MARK: - Паттерн Delegate(Делегат) - Поведенческий Паттерн

/*
 Описание:
 Делегат — это поведенческий паттерн, который позволяет одному объекту (делегату) выполнять определенные задачи от имени другого объекта. В Swift это реализуется через протоколы и слабые ссылки (weak references) для предотвращения циклов удержания.

 Ключевые компоненты:
 Протокол делегата - определяет методы, которые должен реализовать делегат
 Объект-источник - содержит слабую ссылку на делегата
 Объект-делегат - реализует протокол и выполняет необходимые действия
 
 Особенности в Swift:
 Широко используется в Cocoa/CocoaTouch (UITableViewDelegate, UITextFieldDelegate)
 Всегда объявляется как weak во избежание retain cycles
 Позволяет разделять ответственность между объектами
 Альтернатива наследованию в случаях, когда нужно изменить поведение
 
 *
 Делегатор - тот, кто ставит задачу
 Тип Делегата - Протокол, которому должен соответствовать делегат
 Делегат - тот, кто берет на себя ответственность выполнить задачу
 */

//
struct Product {
    let title: String
    let price: Int
}

struct Position {
    let product: Product
    var count: Int
    
    var cost: Int {
        return product.price * count
    }
}

//
protocol CartDelegate {
    func addPosition(position: Position)
}

//
class Catalog {
    var products = [Product]()
    weak var delegate: CartDelegate?
    
    func addToCart(index: Int, count: Int) {
        if products.count > index {
            // Добавляем позицию с этим продуктом в корзину
            if let delegate = delegate {
                delegate.addPosition(position: Position(product: products[index], count: count))
            }
        }
    }
}

class Cart: CartDelegate {
    private(set) var positions = [Position]()
    
    func addPosition(position: Position) {
        positions.append(position)
    }
}

//
let catalog = Catalog()
let cart = Cart()

let product = Product(title: "Колбаса", price: 450)
let milk = Product(title: "Молоко", price: 100)
let cheese = Product(title: "Сыр", price: 200)

catalog.products = [product, milk, cheese]

catalog.addToCart(index: 0, count: 2)
catalog.addToCart(index: 1, count: 1)
catalog.addToCart(index: 2, count: 3)

catalog.delegate = cart


// Пример DeepSeek

// 1. Протокол (договор) для делегата
protocol MailDelegate: AnyObject {
    func mailDidArrive(_ mail: String)
}

// 2. Класс почтальона (отправитель)
class Postman {
    weak var delegate: MailDelegate?  // Слабая ссылка на получателя
    
    func deliverMail() {
        let newMail = "Письмо из Swift-страны"
        print("Почтальон: Доставляю письмо...")
        delegate?.mailDidArrive(newMail)  // Передаем письмо делегату
    }
}

// 3. Класс получателя (делегат)
class HomeOwner: MailDelegate {
    func mailDidArrive(_ mail: String) {
        print("Хозяин дома: Получил письмо! Текст: \(mail)")
    }
}

// Использование:
let postman = Postman()
let owner = HomeOwner()
postman.delegate = owner  // Почтальон теперь знает, кому доставлять письма
postman.deliverMail()     // Вызовет метод у хозяина
