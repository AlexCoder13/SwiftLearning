import Foundation

//Задание 1
//Дана структура Person:
//
// struct Person {
//     var name: String
//     var age: Int
//
//     func getAgeComparisonString(_ p: Person) -> String {
//         // Ваш код должен быть здесь
//     }
// }
//
// Допишите метод в структуре Person, который сравнивает возраст.
// Должны выполняться следующие условия:
//     1. Формат строки со сравнением:
// {Имя другого человека} {старше меня / моложе меня / такого же возраста, как я}.
//     2. Ваш код должен работать следующим образом:
//
// p1 = Person("Антон", 24)
// p2 = Person("Андрей", 36)
// p3 = Person("Ольга", 24)
//
// p1.getAgeComparisonString(p2) ➞ "Андрей старше меня"
// p2.getAgeComparisonString(p1) ➞ "Антон младше меня"
// p1.getAgeComparisonString(p3) ➞ "Ольга такого же возраста, как и я"

struct Person {
    var name: String
    var age: Int
    lazy var info: String = infoPerson()
    
    func getAgeComparisonString(_ p: Person) -> String {
        if self.age < p.age {
            return "\(p.name) старше меня"
        } else if self.age > p.age {
            return "\(p.name) младше меня"
        } else if self.age == p.age {
            return "\(p.name) такого же возраста, как я"
        }
        return ""
    }
    private func infoPerson() -> String {
        if self.age == 24 {
            return "\(name) \(age) года"
        } else if self.age == 36 {
            return "\(name) \(age) лет"
        }
        return ""
    }
}

var p1 = Person(name: "Антон", age: 24)
var p2 = Person(name: "Андрей", age: 36)
var p3 = Person(name: "Ольга", age: 24)

print(p2.getAgeComparisonString(p3))
print(p1.getAgeComparisonString(p2))
print(p3.getAgeComparisonString(p1))


//Задание 2
//Добавьте в структуру Person ленивое свойство, которое возвращает человека в виде строки следующего формата {Имя} {Возраст} {года/лет}.
//
// p1 = Person("Антон", 24)
// p1.info -> Антон 24 года
// p2 = Person("Андрей", 36)
// p2.info -> Андрей 36 лет

print(p1.info)
print(p2.info)
print(p3.info)


// Задание 3
//Создайте класс Hero. Добавьте свойство «количество жизней» — lifeCount. Количество жизней задаётся при создании героя в инициализаторе. Добавьте метод «попадание», который уменьшает количество жизней, — hit().

class Hero {
    let name: String
    private var lifeCount: UInt
    //    var isLive: Bool = heroIsLive()
    
    init(name: String, lifeCount: UInt, isLive: Bool) {
        self.name = name
        self.lifeCount = lifeCount
    }
    
    func hit() {
        lifeCount -= 1
    }
    
    func isLive() -> Bool {
        if lifeCount > 0 {
            return true
        } else {
            return false
        }
    }
}

let superHero = Hero(name: "YarocookGlinomess", lifeCount: 2, isLive: true)
print(superHero.lifeCount)
superHero.hit()
print(superHero.lifeCount)

//Задание 4
//Добавьте в класс Hero вычисляемое свойство, жив или нет герой, — isLive. Если количество жизней больше 0, то возвращает true, в остальных случаях false.

print(superHero.isLive())
superHero.hit()
print(superHero.isLive())


//Задание 5
//Поставьте модификатор доступа private рядом с переменной «количество жизней» в классе Hero, чтобы менять количество жизней можно было только с помощью метода hit().

// сделал)))

//Задание 6
// Отнаследуйтесь от класса Hero, создав дочерний класс SuperHero. Переопределите метод «попадание» для нового класса так, чтобы SuperHero не получал повреждения.
