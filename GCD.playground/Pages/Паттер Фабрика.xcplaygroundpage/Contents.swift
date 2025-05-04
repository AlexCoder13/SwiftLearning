import Foundation

// MARK: - Simple Factory (Простая Фабрика) - Порождающий Паттерн

/*
 Описание:
 Simple Factory — это порождающий паттерн, который инкапсулирует логику создания объектов, вынося её в отдельный класс или метод. В отличие от Factory Method или Abstract Factory, он не является полноценным паттерном по GoF, но часто используется для упрощения кода.

 Основные компоненты:
 Фабрика (Factory) – класс/метод, отвечающий за создание объектов.
 Продукты (Products) – интерфейс или базовый класс, который возвращает фабрика.
 Конкретные продукты (Concrete Products) – реализация продуктов.
 
 Как работает в Swift?
 Фабрика принимает входные данные (например, enum или строку).
 На основе этих данных выбирает, какой объект создать.
 Возвращает экземпляр нужного класса, абстрагируя клиентский код от деталей создания.
 */


//
enum ClothesType {
    case head
    case shoes
}

//
protocol Clothes {
    var title: String { get }
    var type: ClothesType { get }
    var color: String { get }
    
    func putOn()
}

//
class Hat: Clothes {
    var title: String = "Шляпа"
    var type: ClothesType = .head
    var color: String = "Черная"
    
    func putOn() {
        print("Надета \(color) \(title)")
    }
}

//
class Shoes: Clothes {
    var title: String = "Ботинки"
    var type: ClothesType = .shoes
    var color: String = "Белые"
    
    func putOn() {
        print("Надеты \(color) \(title)")
    }
}

//
class ClothesFactory {
    
    // static let shared = ClothesFactory()
    // private init() {}
    
    func createClothes(type: ClothesType) -> Clothes {
        switch type {
        case .head:
            return Hat()
        case .shoes:
            return Shoes()
        }
    }
}

let clothesFactory = ClothesFactory()
//
let hat = clothesFactory.createClothes(type: .head)
let shoes = clothesFactory.createClothes(type: .shoes)
var clothes = [hat, shoes]

for item in clothes {
    item.putOn()
}
