import Foundation

//Объявите три сущности, которые реализует предоставленный вам протокол. После этого для всех сущностей вызовите все методы и свойства, объявленные в протоколе.
//Протокол:
//protocol CalorieCountProtocol {
//     var calories: Int { get }
//     func description() -> String
//}
//Должны выполняться следующие условия:
// 1. Объявлены класс, структура и перечисления enum, которые реализует данный протокол.
// 2. Реализация протокола может быть любой.
// 3. Вызваны все свойства и методы протокола у каждого экземпляра из пункта 1.
// 4. Задание сделано без изменения протокола.

protocol CalorieCountProtocol {
     var calories: Int { get }
     func description() -> String
}

struct Breakfast: CalorieCountProtocol {
    var calories: Int
    
    func description() -> String {
        "Завтрак содержит \(calories) калорий"
    }
}

class Dinner: CalorieCountProtocol {
    let calories: Int
    
    init(calories: Int) {
        self.calories = calories
    }
    
    func description() -> String {
        "Обед содержит \(calories) калорий"
    }
}

enum CalorieCountEnum: CalorieCountProtocol {
    case breakfast
    case dinner
    case lunch
    
    var calories: Int {
        switch self {
        case .breakfast:
            return 850
        case .dinner:
            return 650
        case .lunch:
            return 450
        }
    }
    
    func description() -> String {
        switch self {
        case .breakfast:
            return "Завтрак содержит \(calories) калорий"
        case .dinner:
            return "Обед содержит \(calories) калорий"
        case .lunch:
            return "Ужин содержит \(calories) калорий"
        }
    }
}

let breakfast = Breakfast(calories: 850)
print(breakfast.calories)
print(breakfast.description())
print("-----")

let dinner = Dinner(calories: 650)
print(dinner.calories)
print(dinner.description())
print("-----")

let caloriesBreakfast = CalorieCountEnum.breakfast
let caloriesDinner = CalorieCountEnum.dinner
let caloriesLunch = CalorieCountEnum.lunch
print(caloriesBreakfast.calories)
print(caloriesBreakfast.description())
print(caloriesDinner.calories)
print(caloriesDinner.description())
print(caloriesLunch.calories)
print(caloriesLunch.description())

print("---------------------------------------------")


//Задание 2
//Поработайте с протоколом Equatable, который нужен для сравнения сущностей.
//Вам предоставлены структура и класс, которые нужно сравнить. Добавьте в объявление этих сущностей протокол Equatable. При необходимости реализуйте недостающий метод.
//Структура:
//enum BalanceType {
//    case positive, negative, neutral
//}
//struct Balance {
//    let type: BalanceType
//    let amount: Int
//}
//class BalanceObject {
//    var amount: Int = 0
//}
//Должны выполняться следующие условия:
// 5. Структура и класс реализуют протокол Equatable.
// 6. Проведена проверка, что протокол реализуется. Для этого сравните экземпляры этих сущностей с помощью оператора ‘==’.

enum BalanceType {
    case positive, negative, neutral
}

struct Balance: Equatable {
    let type: BalanceType
    let amount: Int
}

class BalanceObject: Equatable {
    var amount: Int = 0
    
    static func == (lhs: BalanceObject, rhs: BalanceObject) -> Bool {
        lhs.amount == rhs.amount
    }
}

let balance = Balance(type: .neutral, amount: 0)
let anotherBalance = Balance(type: .positive, amount: 0)
print(balance.type == anotherBalance.type)
print(balance.amount == anotherBalance.amount)
print("-----")

let balanceObject = BalanceObject()
let anotherBalanceObject = BalanceObject()
anotherBalanceObject.amount = 5
print(balanceObject.amount == anotherBalanceObject.amount)
print("-----")

print(balance.amount == balanceObject.amount)
print(anotherBalance.amount == anotherBalanceObject.amount)

print("---------------------------------------------")


//Задание 3
//Вам дан протокол и три сущности, которые его реализуют. Добавьте в протокол новый метод. Реализуйте этот метод с помощью расширения протокола. Создайте массив из этих сущностей и вызовите в цикле новый метод у каждого элемента массива.
//Код:
//protocol Dog {
//    var name: String { get set }
//    var color: String { get set }
//}
//struct Haski: Dog {
//    var name: String
//    var color: String
//}
//class Corgi: Dog {
//    var name: String
//    var color: String
//
//    init(name: String, color: String) {
//        self.name = name
//        self.color = color
//    }
//}
//struct Hound: Dog {
//    var name: String
//    var color: String
//}
//Должны выполняться следующие условия:
// 7. В протокол добавлен метод func speak() -> String.
// 8. Реализация метода из пункта 1 сделана с помощью расширения.
// 9. Создан массив, содержащий как минимум один экземпляр каждой сущности.
// 10. У каждого элемента массива вызван новый метод.Объявите три сущности, которые реализует предоставленный вам протокол. После этого для всех сущностей вызовите все методы и свойства, объявленные в протоколе.

protocol Dog {
    var name: String { get set }
    var color: String { get set }
}

extension Dog {
    func speak() -> String {
        "WOOOF!"
    }
}

struct Haski: Dog {
    var name: String
    var color: String
}

class Corgi: Dog {
    var name: String
    var color: String

    init(name: String, color: String) {
        self.name = name
        self.color = color
    }
}

struct Hound: Dog {
    var name: String
    var color: String
}

let haski = Haski(name: "Loki", color: "White and Black")
let corgi = Corgi(name: "Cookie", color: "Orange and Black")
let hound = Hound(name: "Sherlock", color: "Black")

var arrayDog: [Dog] = []

arrayDog.append(haski)
arrayDog.append(corgi)
arrayDog.append(hound)

for element in arrayDog {
    print("Имя собакена - \(element.name), Цвет собакена - \(element.color), Собакен \(element.name) говорит \(element.speak())")
}
