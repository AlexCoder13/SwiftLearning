import Foundation

// MARK: - Паттерн Builder(Строитель) + Паттерн Director(Директор) - Порождающие паттерны

/*
 Описание:
 Builder — это порождающий паттерн, который позволяет создавать сложные объекты пошагово, отделяя конструирование объекта от его представления.

 Основные компоненты:
 Продукт (Product) – сложный объект, который нужно построить.
 Строитель (Builder) – протокол/абстрактный класс с методами для пошагового конструирования продукта.
 Конкретный строитель (ConcreteBuilder) – реализует методы Builder, создавая конкретные части продукта.
 Директор (Director) (опционально) – управляет процессом построения, используя Builder.
 
 Как работает в Swift?
 Клиент создает ConcreteBuilder и (опционально) передает его Director.
 Builder предоставляет методы для конфигурации продукта (например, setColor(), setEngine()).
 После настройки вызывается метод build(), который возвращает готовый продукт.
 Ключевые особенности:

 Позволяет создавать разные представления одного продукта (например, Car с разными двигателями).
 Изолирует сложную логику создания объекта.
 Альтернатива телескопическим конструкторам (с множеством параметров).
 
 
 Director - это компонент паттерна Builder, который управляет процессом пошагового создания сложных объектов. Он знает правильную последовательность шагов сборки и использует Builder для создания готового продукта.

 Основные характеристики:
 Отделяет бизнес-логику создания объекта от его представления
 Знает последовательность шагов построения
 Работает через интерфейс Builder
 Не зависит от конкретных классов строителей
 
 Как используется в Swift:
 Director получает конкретный Builder через dependency injection
 Вызывает методы Builder в правильном порядке
 Возвращает готовый продукт
 */

//
class Car {
    var title: String?
    var type: String?
    var engineVolume: Double?
    var lifting: Int?
}

//
protocol Builder {
    func reset()
    
    func setTitle()
    func setType()
    func setEngineVolume(_ engineVolume: Double)
    func setLifting()
    
    func getObject() -> Car
}

//
class AudiBuilder: Builder {
    
    var car = Car()
    
    func reset() {
        car = Car()
    }
    
    func setTitle() {
        car.title = "Audi"
    }
    
    func setType() {
        car.type = "Sedan"
    }

    func setEngineVolume(_ engineVolume: Double) {
        car.engineVolume = engineVolume
    }

    func setLifting() {
        car.lifting = 600
    }

    func getObject() -> Car {
        return car
    }
}

//
class Director {
    private var builder: Builder
    
    init(builder: Builder) {
        self.builder = builder
    }
    
    func setBuilder(builder: Builder) {
        self.builder = builder
    }
    
    func createCar(volume: Double) -> Car {
        builder.reset()
        builder.setTitle()
        builder.setType()
        builder.setEngineVolume(volume)
        builder.setLifting()
        return builder.getObject()
    }
}

//
var audiBuilder: Builder = AudiBuilder()
var director: Director = Director(builder: audiBuilder)

let audi = director.createCar(volume: 3.0)
print(audi)
