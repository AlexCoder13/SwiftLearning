import Foundation

//Задачи на протоколы
//Задача 1: Простейший протокол
//Уровень: Легкий
//Создайте протокол Shape с одним методом area() -> Double. Реализуйте протокол в двух структурах: Rectangle (с параметрами width и height) и Circle (с параметром radius). Напишите функцию, которая принимает объект типа Shape и возвращает его площадь.

protocol Shape {
    func area() -> Double
}

struct Rectangle: Shape {
    let width: Double
    let height: Double
    
    func area() -> Double {
        width * height
    }
}

struct Circle: Shape {
    let radius: Double
    
    func area() -> Double {
        Double.pi * (radius * radius)
    }
}

let rectangle = Rectangle(width: 5, height: 4)
let circle = Circle(radius: 9)

print(rectangle.area())
print(circle.area())

print("----------------------------------")

//Задача 2: Протокол с несколькими методами
//Уровень: Легкий
//Создайте протокол Animal с методами speak() -> String и move() -> String. Реализуйте его в классах Dog и Bird. Убедитесь, что каждый класс реализует методы по-своему.
//Пример:
//let dog = Dog()
//print(dog.speak()) // "Woof!"
//print(dog.move())  // "Runs on four legs."

protocol Animal {
    func speak() -> String
    func move() -> String
}

class Dog: Animal {
    let name: String
    
    init(name: String) {
        self.name = name
    }
    
    func speak() -> String {
        "WOOF!"
    }
    
    func move() -> String {
        "\(name) runs on four legs!"
    }
}

class Bird: Animal {
    let name: String
    
    init(name: String) {
        self.name = name
    }
    
    func speak() -> String {
        "YO! YO!"
    }
    
    func move() -> String {
        "\(name) fly on two wings!"
    }
}

let dog = Dog(name: "Butch")
let bird = Bird(name: "Willy")

print(dog.speak())
print(dog.move())

print(bird.speak())
print(bird.move())

print("----------------------------------")

//Задача 3: Протокол с ассоциированным типом
//Уровень: Средний
//Создайте протокол Storage с ассоциированным типом Item и методами:
//add(item: Item)
//getAllItems() -> [Item]
//Реализуйте этот протокол для структуры Library, которая хранит книги (Book, с параметрами title и author).

protocol Storage {
    associatedtype Item
    
    func add(item: Item)
    func getAllItems() -> [Item]
}

struct Book {
    var title: String
    var author: String
}

class Library: Storage {
    typealias Item = Book
    
    func add(item: Book) {
        libraryBook.append(item)
    }
    
    var libraryBook: [Book] = []
    
    func getAllItems() -> [Book] {
        for book in libraryBook {
            print(book)
        }
        return libraryBook
    }
}

let book1 = Book(title: "WOW", author: "M.H.WOOOW")
let book2 = Book(title: "HEY", author: "T.P.HEEEY")
let book3 = Book(title: "BRO", author: "Q.S.BROOO")
let library = Library()

library.add(item: book1)
library.add(item: book2)
library.add(item: book3)
library.getAllItems()

print("----------------------------------")

//Задача 4: Наследование протоколов
//Уровень: Средний
//Создайте протокол Vehicle с методом drive(). Затем создайте протокол ElectricVehicle, который наследует Vehicle и добавляет метод charge() -> String. Реализуйте ElectricVehicle в классе Tesla.
//
//Пример:
//let car = Tesla()
//print(car.drive())  // "Driving electric car."
//print(car.charge()) // "Charging..."

protocol Vehicle {
    func drive()
}

protocol ElectricVehicle: Vehicle {
    func charge() -> String
}

class Tesla: ElectricVehicle {
    func drive() {
        print("Driving electric car.")
    }
    
    func charge() -> String {
        "Charging..."
    }
}

let tesla = Tesla()
tesla.drive()
print(tesla.charge())

print("----------------------------------")

//Задача 5: Композиция протоколов
//Уровень: Сложный
//Создайте два протокола:
//Drawable с методом draw() -> String.
//Colorable с методом color() -> String.
//Создайте структуру ColoredShape, которая принимает любой объект, реализующий оба протокола, и комбинирует их методы в describe() -> String.
//
//Пример:
//let shape = ColoredShape(item: Circle())
//print(shape.describe()) // "Drawing a circle with red color."

protocol Drawable {
    func draw() -> String
}

protocol Colorable {
    func color() -> String
}

struct NewCircle: Drawable, Colorable {
    func draw() -> String {
        "Drawing a circle"
    }
    
    func color() -> String {
        "with red color"
    }
}

struct AnotherNewCircle: Drawable, Colorable {
    func draw() -> String {
        "Drawing aboba"
    }
    
    func color() -> String {
        "with blue color"
    }
}

struct ColoredShape<T: Drawable & Colorable> {
    var item: T
    
    func describe() -> String {
        (item.draw() + " " + item.color())
    }
}

let shape = ColoredShape(item: NewCircle())
let newShape = ColoredShape(item: AnotherNewCircle())
print(shape.describe())
print(newShape.describe())

print("----------------------------------")





//Задачи на расширения
//Задача 1: Добавление метода
//Уровень: Легкий
//Создайте структуру Point с координатами x и y. Добавьте расширение, которое добавляет метод distance(to point: Point) -> Double для вычисления расстояния между двумя точками.

struct Point {
    var x: Double
    var y: Double
}

extension Point {
    func distance(to point: Point) -> Double {
        let xNew = point.x - self.x
        let yNew = point.y - self.y
        return sqrt(xNew * xNew + yNew * yNew)
    }
}

let firstPoint = Point(x: 0, y: 0)
let secondPoint = Point(x: 3, y: 4)
print(firstPoint.distance(to: secondPoint))

print("----------------------------------")

//Задача 2: Расширение встроенного типа
//Уровень: Легкий
//Добавьте расширение для массива, которое добавляет метод average() -> Double?, возвращающий среднее значение элементов, если массив состоит из чисел.
//
//Пример:
//let numbers = [1, 2, 3, 4, 5]
//print(numbers.average()) // 3.0

let numbers: [Int] = [5, 6, 12, 35, 567, 116]

extension Array where Element == Int {
    func average() -> Double? {
        var summNumber = 0
        guard !self.isEmpty else { return nil }
        
        for element in self {
            summNumber += element
        }
        return Double(summNumber / self.count)
    }
}

if let averegeArray = numbers.average() {
    print(averegeArray)
} else {
    print("Массив пуст")
}

print("----------------------------------")

//Задача 3: Расширение с протоколами
//Уровень: Средний
//Создайте протокол Reversible с методом reversed() -> String. Напишите расширение для String, которое реализует этот протокол, позволяя переворачивать строку.
//
//Пример:
//let word = "Swift"
//print(word.reversed()) // "tfiwS"


protocol Reversible {
    func reversed() -> String
}

extension String: Reversible {
    func reversed() -> String {
        var reversedString = ""
        for character in self {
            reversedString = "\(character)" + reversedString
        }
        return reversedString
    }
}

let word = "Swift"
print(word.reversed())

print("----------------------------------")

//Задача 4: Расширение с вычисляемыми свойствами
//Уровень: Средний
//Добавьте расширение для Double, которое добавляет вычисляемое свойство squared: Double, возвращающее квадрат числа, и метод isGreaterThan(_ number: Double) -> Bool, который сравнивает число с другим.
//
//Пример:
//let value: Double = 4.0
//print(value.squared) // 16.0
//print(value.isGreaterThan(3.0)) // true

extension Double {
    var squared: Double {
        self * self
    }
    
    func isGreaterThan(_ number: Double) -> Bool {
        number > self
    }
}

let value: Double = 9.0
print(value.squared)
print(value.isGreaterThan(5.0))

print("----------------------------------")

//Задача 5: Расширение со вложенными типами
//Уровень: Сложный
//Создайте расширение для структуры Calculator, добавив вложенный тип Operation с вариантами add, subtract, multiply, и divide. Реализуйте метод perform(_ operation: Operation, on numbers: [Double]) -> Double, который выполняет указанную операцию.
//
//Пример:
//
//let calc = Calculator()
//print(calc.perform(.add, on: [1, 2, 3])) // 6.0

struct Calculator {
    func perform(_ operation: Operation, on numbers: [Double]) -> Double? {
        guard !numbers.isEmpty else { return nil }
        
        var finalResult: Double = 0
            switch operation {
            case .add:
                var result: Double = 0
                for number in numbers {
                    result += number
                }
                finalResult += result
            case .substract:
                var result: Double = numbers[0]
                let newNumbers = numbers.dropFirst()
                for number in newNumbers {
                    result -= number
                }
                finalResult += result
            case .multiply:
                var result: Double = 1
                for number in numbers {
                    result *= number
                }
                finalResult += result
            case .divide:
                var result: Double = numbers[0]
                let newNumbers = numbers.dropFirst()
                for number in newNumbers {
                    result /= number
                }
                finalResult += result
            }
        return finalResult
        }
    }

extension Calculator {
    enum Operation {
        case add
        case substract
        case multiply
        case divide
    }
}

let calc = Calculator()
if let divCalc = calc.perform(.divide, on: [100, 5, 2, 5, 1]) {
    print(divCalc)
} else {
    print("Массив пуст")
}
if let multCalc = calc.perform(.multiply, on: [5, 5, 4]) {
    print(multCalc)
} else {
    print("Массив пуст")
}
if let addCalc = calc.perform(.add, on: [10, 15, 74, 1]) {
    print(addCalc)
} else {
    print("Массив пуст")
}
if let subCalc = calc.perform(.substract, on: [45, 10, 5, 15, 15]) {
    print(subCalc)
} else {
    print("Массив пуст")
}

print("----------------------------------")
