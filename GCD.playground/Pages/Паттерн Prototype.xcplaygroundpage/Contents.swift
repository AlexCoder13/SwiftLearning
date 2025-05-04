import Foundation

// MARK: - Prototype (Прототип) - Порождающий Паттерн

/*
 Описание:
 Prototype — это порождающий паттерн, который позволяет создавать новые объекты путем копирования существующих (прототипов), вместо создания через конструктор.

 Основные компоненты:
 Прототип (Prototype) – протокол (или абстрактный класс) с методом clone().
 Конкретные прототипы (ConcretePrototype) – классы, реализующие клонирование.
 Клиент – использует прототип для создания новых объектов.
 
 Как работает в Swift?
 Объект, который нужно клонировать, подписывается под протокол NSCopying (или реализует свой метод copy()).
 Вместо new MyClass() вызывается existingObject.copy().
 Swift поддерживает копирование через:
 NSCopying (требует реализации copy(with:)).
 Ручное копирование (глубокое/поверхностное).
 */

//
class Phone {
    var title: String
    var price: Int
    
    init(title: String, price: Int) {
        self.title = title
        self.price = price
    }
    
    func clone() -> Phone {
        return Phone(title: title, price: price)
    }
}

let phone1 = Phone(title: "iPhone 12", price: 1000)
var phone2 = phone1
var phone3 = phone1.clone()

phone2.title = "iPhone 13"
phone3.title = "iPhone 14"

print(phone1.title)
print(phone2.title)
print(phone3.title)
