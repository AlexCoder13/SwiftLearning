import Foundation

// MARK: - Abstract Factory (Абстрактная Фабрика) - Порождающий Паттерн

/*
 Описание:
 Abstract Factory — это порождающий паттерн, который предоставляет интерфейс для создания семейств взаимосвязанных или взаимозависимых объектов, не указывая их конкретных классов.

 Основные компоненты:
 Абстрактная фабрика (AbstractFactory) – протокол/абстрактный класс, объявляющий методы для создания каждого из продуктов.
 Конкретные фабрики (ConcreteFactory) – реализуют методы абстрактной фабрики, создавая конкретные продукты.
 Абстрактные продукты (AbstractProduct) – базовые протоколы/классы для объектов, которые будут создаваться.
 Конкретные продукты (ConcreteProduct) – реальные объекты, возвращаемые фабриками.
 
 Как работает в Swift?
 Клиентский код работает только с интерфейсами (AbstractFactory и AbstractProduct).
 В зависимости от нужного семейства объектов выбирается конкретная фабрика (например, DarkThemeFactory или LightThemeFactory).
 Фабрика создает согласованные продукты (например, кнопку + текстовое поле в одном стиле).
 */

//
protocol Top {
    var title: String { get }
    func putOn()
}

protocol Pants {
    var title: String { get }
    var color: String { get }
    
    func putOn()
}

//
class Jacket: Top {
    var title = "Пиджак"
    
    func putOn() {
        print("Я надел \(title)")
    }
}

class WindStopper: Top {
    var title = "Ветровка"
    
    func putOn() {
        print("Я надел \(title)")
    }
}

class Trousers: Pants {
    var title = "Брюки"
    var color = "Синего"
    
    func putOn() {
        print("Я надел \(title) \(color) цвета")
    }
}

class Trikot: Pants {
    var title = "Трико"
    var color = "Зеленого"
    
    func putOn() {
        print("Я надел \(title) \(color) цвета")
    }
}

//
protocol AbstractFactory {
    func createTop() -> Top
    func createPants() -> Pants
}


//
class CasualFactory: AbstractFactory {
    func createTop() -> Top {
        return Jacket()
    }
    
    func createPants() -> Pants {
        return Trousers()
    }
}

class SportyFactory: AbstractFactory {
    func createTop() -> Top {
        return WindStopper()
    }
    
    func createPants() -> Pants {
        return Trikot()
    }
}

//
var top: Top?
var pants: Pants?

let factory: AbstractFactory?
var situation: String = "Встреча"

if situation == "Встреча" {
    factory = CasualFactory()
    top = factory?.createTop()
    pants = factory?.createPants()
} else if situation == "Спорт" {
    factory = SportyFactory()
    top = factory?.createTop()
    pants = factory?.createPants()
} else {
    print("Другая одежда")
}

//
top?.title
pants?.title
top?.putOn()
pants?.putOn()
