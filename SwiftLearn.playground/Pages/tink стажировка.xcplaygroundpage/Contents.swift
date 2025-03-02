import Foundation

//func workers(shouldStartFirst: Bool) {
//print("Опять работа?")
//defer { print("Дело сделано!") }
//if shouldStartFirst {
//defer { print("Рабочий 1 работу закончил.") }
//print("Рабочий 1 готов вкалывать!")
//} else {
//defer { print("Рабочий 2 работу закончил.") }
//print("Рабочий 2 готов вкалывать!")
//}
//defer { print("А дело точно сделано?") }
//print("Ну, я пошёл.")
//}
//workers(shouldStartFirst: true)
//
//
//
//class Person {
//    var name: String
//    init(name: String = "Владимир") {
//        self.name = name
//    }
//}
//
//struct Address {
//    var city: String
//}
//
//var person1 = Person(name: "Алиса")
//var person2 = person1
//person2.name = "Борис"
//
//var address1 = Address(city: "Москва")
//var address2 = address1
//address2.city = "Казань"
//
//print(person1.name)
//print(person2.name)
//print(address1.city)
//print(address2.city)
//
//
//let numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
//
//let result = numbers
//    .filter { $0 % 2 == 0 }
//    .reduce(1, +)
//
//print(result)
//
//
//var numbers = [Int]()
//
//let group = DispatchGroup()
//let queue = DispatchQueue(label: "ru.tbank.example.queue", attributes: .concurrent)
//
//for i in 1...5 {
//    Thread.sleep(forTimeInterval: Double(i) * 0.1) // имитируем задержку перед запуском задачи
//    group.enter() // отмечаем начало задачи
//    queue.async {
//        print("Начало задачи \(i)")
//        Thread.sleep(forTimeInterval: Double(i) * 0.1) // имитируем задержку выполнения задачи
//        print("Конец задачи \(i)")
//        group.leave() // отмечаем завершение задачи
//    }
//}
//
//group.notify(queue: .main) {
//    print("Все задачи завершены")
//}
//
//// Небольшая задержка, чтобы гарантировать выполнение всех задач
//Thread.sleep(forTimeInterval: 2)
//
//
//
//let score = 85
//let bonus = 20
//
//if score > 90 {
//    if bonus > 10 {
//        print("Отлично! Вы получили максимальный бонус.")
//    } else {
//        print("Отлично! Но бонус мог быть больше.")
//    }
//} else if score > 80 {
//    if bonus > 15 {
//        print("Хорошая работа! Вы получили хороший бонус.")
//    } else {
//        print("Хорошая работа! Но бонус мог быть больше.")
//    }
//} else {
//    print("Попробуйте снова.")
//}
//
//// Вывод: "Хорошая работа! Вы получили хороший бонус."


//var sum = 0
//let numbers = [1, 2, 3, 4, 5]
//
//for (index, value) in numbers.enumerated() {
//    if index % 2 == 0 {
//        continue // Пропускаем элементы с четными индексами (0, 2, 4)
//    }
//    sum += value // Добавляем элементы с индексами 1 (2) и 3 (4)
//    if sum > 6 {
//        break // Сумма 2 + 4 = 6 → условие не выполняется, цикл не прерывается
//    }
//}
//
//print(sum) // 6

//
//struct SomeStruct {
//    private var storedNumber: Int
//    var number: Int {
//        willSet {
//            // Нельзя изменять self.number внутри willSet - вызывает бесконечную рекурсию
//            print("Будет установлено: \(newValue)")
//        }
//        didSet {
//            // Можно изменять значение через storedNumber
//            storedNumber += 100
//        }
//    }
//    
//    init(number: Int) {
//        self.storedNumber = number
//        self.number = number
//    }
//}
//
//var result = SomeStruct(number: 1000)
//result.number += 10
//print(result.number) // ❌ Ошибка! Непредсказуемое поведение из-за нарушения работы наблюдателей.


//var count = 5
//var result = ""
//repeat {
//    if count % 2 == 0 {
//        count -= 1
//        continue
//    }
//    result += "\(count)"
//    count -= 1
//} while count > 0
//
//print(result) // Вывод: "531"


//func firstElement1<T>(of array: [T]) -> T? {
//return array.isEmpty ? nil : array[0]
//}
//
//
//func firstElement2<T>(of array: [T]) -> T {
//return array.isEmpty ? nil : array[0]
//}
//
//func firstElement3<T: String>(of array: [T]) -> T? {
//return array.isEmpty ? nil : array[0]
//}
//
//
//func firstElement4<T>(of array: [T]) -> String {
//return array.isEmpty ? "No elements": "\(array[0])"
//}


//class Animal {
//    func makeSound() -> String {
//        return "Я издаю какой-то звук."
//    }
//}
//
//class Dog: Animal {
//    func bark() -> String {
//        return "Гав!"
//    }
//}
//
//let myAnimal: Animal = Dog() // Создаем объект Dog, но объявляем его как Animal
//if let myDog = myAnimal as? Dog { // Приведение типа Animal к Dog (успешно)
//    print(myDog.bark()) // Выведет: "Гав!"
//} else {
//    print("Это не собака!") // Этот блок не выполнится
//}
