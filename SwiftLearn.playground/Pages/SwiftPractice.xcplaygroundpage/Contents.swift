import Foundation

// ЦИКЛЫ.

// 1. Перед вами массив имен:
//let names = ["Bill" , "Tim", "Tom", "Sem"]
//Вам нужно найти в этом массиве имя “Tim”, и вывести его на консоль 10 раз.

// 1 вариант
let names = ["Bill" , "Tim", "Tom", "Sem"]
for element in names {
    if element == "Tim" {
        for _ in 1...10 {
            print(element)
        }
        break
    }
}

// 2 вариант
let name = "Tim"
if names.contains(name) {
    for _ in 1...10 {
        print(name)
    }
}

print("----------------------------")

// 2. Вы ведете учет товаров в своем игрушечном магазине, и вам нужно внести их в базу, в качестве базы у вас будет пустой словарь. В качестве начальное значения будет два массива, один с наименованием товаров, а второй с количеством этих товаров. Наполните пустой словарь данными.
//  let products = ["bear", "frog", " hare", "elephant", "mouse"]
//  let quantityOfproducts = [13, 24, 17, 11, 38]
//  var database: [String: Int] = [:]

// 1 вариант
let products = ["bear", "frog", "hare", "elephant", "mouse"]
let quantityOfproducts = [13, 24, 17, 11, 38]
var database: [String: Int] = [:]

database = Dictionary(uniqueKeysWithValues: zip(products, quantityOfproducts))
print(database)

// 2 вариант
var count = 0
for product in products {
    database[product] = quantityOfproducts[count]
    count += 1
}
print(database)

// 3 вариант
for (product, quantity) in zip(products, quantityOfproducts) {
    database[product] = quantity
}


print("----------------------------")
print("----------------------------")

var summ = 1
for _ in 1...3 {
    summ *= 3
}



// ПЕРЕЧИСЛЕНИЯ.

// 1. Создайте массив на основе следующего перечисления:
//enum CarBrand {
//    case toyota
//    case honda
//    case bmv
//    case tesla
//}
//Выведете на консоль сообщение: “Снижение цены на 30%”,  в том случае если в списке будет .toyota

enum CarBrand {
    case toyota
    case honda
    case bmv
    case tesla
}

let cars: [CarBrand] = [.toyota, .honda, .bmv, .tesla]
if cars.contains(.toyota) {
    print("Снижение цены на 30%")
}

print("----------------------------")

// 2. Перед вами два перечисления:
//enum CarType {
//    case sedan
//    case suv
//    case hatchback
//    case truck
//}
//
//enum RoadType {
//    case paved
//    case gravel
//}
//Первое отвечает за тип автомобиля, а второе за тип дорожного покрытия. Продумайте алгоритм, при котором в зависимости от покрытия, будут фильтроваться типы автомобилей. Если покрытие paved то это sedan и hatchback, если gravel то suv и truck. Выведите на консоль сообщение: ” type road: <тип дороги>, cars: <список автомобилей, подходящих под эту дорогу>

enum CarType {
    case sedan
    case suv
    case hatchback
    case truck
}

enum RoadType {
    case paved
    case gravel
}

var road: RoadType

road = .paved

switch road {
case .paved:
    print("type road - \(road), cars: \(CarType.sedan), \(CarType.hatchback)")
case .gravel:
    print("type road - \(road), cars: \(CarType.suv), \(CarType.truck)")
}

print("----------------------------")

// 3. Создайте два перечисления, первое будет содержать время принятия пищи (завтрак, обед и ужин), а второе овощи (например картошка, морковка, брокколи и другие). Продумайте алгоритм при котором в зависимости от времени принятия пищи, в блюдо будут добавляться определенные овощи. В конце выведите на экран сообщение: “Для приготовления <время принятия пищи>, потребуются следующие овощи <список овощей>”.

enum Cook: String {
    case breakfast = "завтрака"
    case lunch = "обеда"
    case dinner = "ужина"
}

enum Meal: String {
    case bread = "хлеб"
    case tea = "чай"
    case butter = "масло"
    case eggs = "яйца"
    case potato = "картошка"
    case meat = "мясо"
    case cola = "кола"
    case pizza = "пицца"
    case water = "вода"
}

let dayTime: Cook

dayTime = .breakfast
//dayTime = .lunch
//dayTime = .dinner

switch dayTime {
case .breakfast:
    print("Для приготовления \(dayTime.rawValue) потребуются следующие продукты: \(Meal.bread.rawValue), \(Meal.tea.rawValue), \(Meal.butter.rawValue), \(Meal.eggs.rawValue)")
case .lunch:
    print("Для приготовления \(dayTime.rawValue) потребуются следующие продукты: \(Meal.potato.rawValue), \(Meal.meat.rawValue), \(Meal.water.rawValue)")
case .dinner:
    print("Для приготовления \(dayTime.rawValue) потребуются следующие продукты: \(Meal.pizza.rawValue), \(Meal.cola.rawValue)")
}

print("----------------------------")

// 4. Создайте перечисление Activity , со следующими кейсами: reading, running, shopping.
//первый кейс должен иметь ассоциативный параметр типа: (book: String), второй: (distance: Double) и третий: (items: [String]). В зависимости от, того какой кейс с типом Activity выбран, выведите на консоль сообщение, если кейс reading: “В настоящее время читаю <книга>”, если кейс running: “Пробежать сегодня <дистанция> км “, если кейс shopping: “Сходить в магазин за: <список покупок>”

enum Activity {
    case reading(String)
    case running(Double)
    case shopping([String])
}

let dayTasks: Activity

dayTasks = .running(5.78)

switch dayTasks {
case .reading(book: let book):
    print("В настоящее время я читаю книгу \(book)")
case .running(distance: let distance):
    print("Пробежать сегодня \(distance) км")
case .shopping(items: let items):
    print("Сходить в магазин за: \(items)")
}

print("----------------------------")

// ЗАМЫКАНИЯ.

// 1. Создайте свойство с типом блока замыкания, без параметров и без возвращаемых значений. В блоке замыкания выведете фразу на консоль: “It’s first closure”. Создайте еще одно свойство и присвойте ему копию вашего клоужера и запустите его.

let makeClosure: () -> Void = {
    print("It's first closure")
}
let firstClosure = makeClosure
firstClosure()

let closure = {
    print("Task 1: It's the first closure \n")
}

let closureCopy = closure
closureCopy()

print("----------------------------")


// 2. Создайте свойство с типом блока замыкания с двумя параметрами типа String и Int, и возвращаемым значением типа String. Должна вернуться фраза: “Name: <имя>, age: <возраст>”. Присвойте результат работы блока замыкания новому свойству и выведите его на консоль.

let makeName: (String, Int) -> String = {name, age in
    "Name: \(name), age: \(age)"
}
let fullName = makeName
print(fullName("Alex", 25))

print("----------------------------")


// 3. Создайте функцию, которая будет принимать в качестве параметров числовой массив и блок замыкания. Данная функция должна находить максимальное значение из массива. Блок замыкания должен захватывать это максимальное значение и выводить его на консоль. Вызовите три раза данную функцию, при первом вызове в параметр замыкания передайте функцию (создайте ее сами), во второй вызов передайте в параметр свойство с типом блока замыкания, и в третий вызов просто раскройте комплишен и реализуйте вывод максимального значения на консоль.

let newArray = [2, 5, 7, 9, -13, 45, 134, 2, 67, 99, -23]

let newClosure: (Int) -> Void = { number in
    print(number)
}

func newFunc(a: Int) {
    print(a)
}

func maxArray(array: [Int], operation: (Int) -> Void) {
    var max = 0
    for element in array {
        if element > max {
            max = element
        }
    }
    operation(max)
}
let maxValue1 = maxArray
maxValue1(newArray) {print($0)}
let maxValue2 = maxArray
maxValue2(newArray, newFunc)
let maxValue3 = maxArray
maxValue3(newArray, newClosure)

print("----------------------------")


// 4. Создайте функцию, которая принимает в качестве параметров строку и блок замыкания. Логика этой функции заключается в том чтобы из строки сделать массив символов. Блок замыкания должен захватывать тип [Character] и вывводить символы на консоль, каждый из которых будет на новой строке. При вызове функции раскройте комплишен.
//Что бы сделать из коллекции (строка это тоже коллекция) массив используйте следующий код: Array(коллекция)

func arrayCharacter(str: String, closure: ([Character]) -> Void) {
    var anotherArray: [Character] = []
    for element in str {
        anotherArray.append(element)
    }
    closure(anotherArray)
}
arrayCharacter(str: "VYCVYCYUY") { anotherArray in
    for element in anotherArray {
        print(element)
    }
}

print("----------------------------")


// 5. Создайте функцию, которая принимает в качестве параметров Словарь типа [String: Int] и блок замыкания. Данная функция должна создать массив из значений словаря. Блок замыкания должен захватывать массив типа Int и выводить на консоль сумму чисел массива. Вызовите три раза данную функцию, при первом вызове в параметр замыкания передайте функцию (создайте ее сами), во второй вызов передайте в параметр свойство с типом блока замыкания, и в третий вызов просто раскройте комплишен и реализуйте вывод суммы чисел массива.
//Для решения используйте следующий словарь:
//let fruitBasket = ["Apple": 25, "Orange": 10, "Pear": 13, "Banana": 9]

let fruitBasket = ["Apple": 25, "Orange": 10, "Pear": 13, "Banana": 9]

func makeSumm(array: [Int]) {
    var summ: Int = 0
    for element in array {
        summ += element
    }
    print(summ)
}

let summClosure: ([Int]) -> Void = { array in
    var summ: Int = 0
    for element in array {
        summ += element
    }
    print(summ)
}

func makeArray(dictionary: [String: Int], closure: ([Int]) -> Void) {
    var array: [Int] = []
    for element in dictionary.values {
        array.append(element)
    }
    closure(array)
}

let summArray1 = makeArray
summArray1(fruitBasket) { array in
    var summ: Int = 0
    for element in array {
        summ += element
    }
    print(summ)
}
let summArray2 = makeArray
summArray2(fruitBasket, makeSumm)
let summArray3 = makeArray
summArray3(fruitBasket, summClosure)

print("----------------------------")



// КЛАССЫ.

// 1. Создайте класс Person, который содержит свойства name, age, gender. Определите значения по умолчанию для каждого из свойств. Класс так же должен содержать метод getDescription, который возвращает предложение со всей информацией о персоне.
//Создайте экземпляр класса, и задайте конкретные значения для свойств. Отобразите результат работы метода getDescription на консоли.
//Не используйте в решении инициализатор. Операйтесь только на пройденные концепции.

class Person {
    var name = ""
    var age = 0
    var gender = ""
    
    func getDescription() {
        print("Info about Person: name - \(name), gender - \(gender), age - \(age)")
    }
}

let newPerson = Person()
newPerson.name = "Alex"
newPerson.gender = "male"
newPerson.age = 25
newPerson.getDescription()

let anotherPerson = Person()
anotherPerson.name = "Maria"
anotherPerson.gender = "female"
anotherPerson.age = 22
anotherPerson.getDescription()

print("----------------------------")


// 2. Создайте класс BankAccount, который будет содержать свойства balance и accountNumber. Создайте методы increaseDeposit и withdrawMoney, первый будет добавлять к балансу какую-то сумму, а второй уменьшать ее.

class BankAccount {
    var balance = 0
    var accountNumber = 0
    
    func increaseDeposit() {
        balance += 40000
    }
    func withdrawMoney() {
        balance -= 15000
    }
    func accountInfo() {
        print("Info about BankAccount: Account Number - \(accountNumber), Account Balance - \(balance)")
    }
}
 let bancAccount = BankAccount()
bancAccount.accountNumber = 1234567891023576
bancAccount.increaseDeposit()
bancAccount.increaseDeposit()
bancAccount.withdrawMoney()
bancAccount.accountInfo()

print("----------------------------")

// 3. Создайте класс Person, который имеет свойства firstName, lastName и fullName. Свойство fullName должно вычисляться на основе firstName и lastName. Напишите инициализатор, который принимает имя и фамилию и устанавливает их в соответствующие свойства.
//Создайте экземпляр данного класса и выведите на консоль сообщение:  “Имя: <…>, фамилия: <…>, полное имя: <…>”

class MyPerson {
    let firstName: String
    let lastName: String
    var fullName: String {
        "\(firstName) \(lastName)"
    }
    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }
}
let myPerson = MyPerson(firstName: "Nick", lastName: "McFly")
print("Name: \(myPerson.firstName), SureName: \(myPerson.lastName), Full Name: \(myPerson.fullName)")

print("----------------------------")

// 4. Создайте класс Lable, в котором должно быть два свойства title с типом String и titleColor с типом Color, где Color это перечисление с набором цветов. Значения для свойств класса Lable должны задаваться через инициализатор, при этом цвет должен быть не обязательным к инициализации.

enum Color {
    case green
    case red
    case blue
    case none
}

class Label {
    let title: String
    let titleColor: Color
    
    init(title: String, titleColor: Color = .green) {
        self.title = title
        self.titleColor = titleColor
    }
}

let label = Label(title: "BIG BUTTON")
print("\(label.title), \(label.titleColor)")

let newLabel = Label(title: "small button", titleColor: .none)
print("\(newLabel.title), \(newLabel.titleColor)")

print("----------------------------")

// 5. Создайте базовый класс “Animal” и дочерний класс “Cat”. У класса “Animal” должны быть свойства “имя” и “возраст”, а также методы “издать звук” и “передвигаться”. Класс “Cat” должен наследовать эти свойства и методы, а также иметь свойство “тип шерсти”.

class Animals {
    var name: String
    var age: Int
    
    func sound() {
        print("Издать звук")
    }
    func move() {
        print("Передвигаться")
    }
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

class Cat: Animals {
    var wool: String
    
    init(wool: String, name: String, age: Int) {
        self.wool = wool
        super.init(name: name, age: age)
    }
}
print("Complete")

print("----------------------------")

// 6. У вас есть словарь с данными:
//let data = ["name": "Бульбазавр",
//"image": "bulbasaur.jpg",
//"health": "8",
//"experience": "11"]
//Создайте базовый класс “Character” и дочерний класс “Pokemon”. У класса “Character” должны быть свойства “health” и “experience” с типом Int. Класс “Pokemon” должен наследовать эти свойства, а также иметь свойства “name” и “image” с типом String. Инициализировать класс Pokemon необходимо данными из представленного словаря.

let data = ["name": "Бульбазавр",
            "image": "bulbasaur.jpg",
            "health": "8",
            "experience": "11"]

class Character {
    let health: Int
    let experience: Int

    init(health: Int, experience: Int) {
        self.health = health
        self.experience = experience
    }
}

class Pokemon: Character {
    let name: String
    let image: String

    init(value: [String: String]) {
        name = value["name"] ?? ""
        image = value["image"] ?? ""

        let health = Int(value["health"] ?? "") ?? 0
        let experience = Int(value["experience"] ?? "") ?? 0
        super.init(health: health, experience: experience)
    }
}

