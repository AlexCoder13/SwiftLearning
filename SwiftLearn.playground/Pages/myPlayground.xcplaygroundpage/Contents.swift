import Foundation
//
////var coinsInNewChest = "nil"
////var allCoinsCount = 1301
////if Int(coinsInNewChest) != nil {
////    allCoinsCount += Int(coinsInNewChest)!
////    print(allCoinsCount)
////} else {
////    print("У нового дракона отсутствует золото")
////}
//
////let backend: [Int?] = [1, 4, 7, 14, nil, 23, nil]
////var int: Int
////for position in 0...backend.count - 1 {
////    let temp = backend[position]
////    if let nonOptNemp = temp {
////        int = nonOptNemp
////    } else {
////        int = 404
////    }
////    if int == 404 {
////        print("ОШИБКА")
////    } else {
////        print(int)
////    }
////}
//
////var a: Int? = .zero
////var b: Int? = nil
////a = 10
////b = 10
////print("\(a ?? 5) \(b ?? 7)")
//
////print("Введите ваше Имя")
////readline()
//
//
////let salary = [40000, 42000, 39000, 41000, 40000, 56000]
////var summ = 0
////var index = 0
////for _ in salary {
////    summ += salary[index]
////    index += 1
////    print("Накоплено деняк после очередного месяца работы" + " - " + String(summ))
////}
////
////
////let salary1 = [40000, 42000, 39000, 41000, 40000, 56000]
////var summ1 = 0
////var index1 = 0
////while index1 < salary1.count {
////    summ1 += salary1[index1]
////    index1 += 1
////}
////print("Накоплено деняк после полугода рапства" + " - " + String(summ1))
//
//
//
////var randomArray: [Int] = []
////for _ in 0..<10 {
////    randomArray.append(Int.random(in: 0...1000))
////}
//
//
//
////  случайный массив
//func makeArray() -> [Int] {
//    var randomArray: [Int] = []
//    for _ in 0..<10 {
//        randomArray.append(Int.random(in: 0...100))
//    }
//    return randomArray
//}
//
//var a = makeArray()
////  максимальное значение случайного массив
//var maximum = 0
//for element in a {
//    if element > maximum {
//        maximum = element
//    }
//}
//print(a)
//print(maximum)
//
//
////  удаляем четные значения из случайного массива
//for index in stride(from: a.count - 1, through: 0, by: -1) {
//    if a[index] % 2 == 0 {
//        a.remove(at: index)
//    }
//}
//print(a)
//
////  2 вариант
//var index = 0
//while index < a.count {
//    if a[index] % 2 == 0 {
//        a.remove(at: index)
//    } else {
//        index += 1
//    }
//}
//print(a)
//
//
////  создание нового массива путем фильтрации исходного
//var aNew: [Int] = []
//for element in a {
//    if element % 2 != 0  {
//        aNew.append(element)
//    }
//}
//print(aNew)
//
//
////  сортируем массив от меньшего к большему
//var b = makeArray()
//for i in 0..<b.count {
//    for j in (i+1)..<b.count {
//        if b[j] > b[i] {
//            let tmp = b[i]
//            b[i] = b[j]
//            b[j] = tmp
//        }
//    }
//}
//print(b)
//
//
////  обмен значениями между двумя массивами
//var arrayA = makeArray()
//var arrayB = makeArray()
//print(arrayA)
//print(arrayB)
//for index in stride(from: arrayA.count - 1, through: 0, by: -1) {
//    if arrayA[index] % 2 == 0 {
//        arrayB.append(arrayA[index])
//        arrayA.remove(at: index)
//    }
//}
//for index in stride(from: arrayB.count - 1, through: 0, by: -1) {
//    if arrayB[index] % 2 != 0 {
//        arrayA.append(arrayB[index])
//        arrayB.remove(at: index)
//    }
//}
//print(arrayA.sorted())
//print(arrayB.sorted())
//
//
////  соритруем массив от большего к меньшему и присваем отрицательным значениям 0
////var v = [1, 2, 3, 4, 5, -9, -8, -7 , -6, -5]
////for (index, value) in v.enumerated() {
////    if v[index] < 0 {
////        v[index] = 0
////    }
////}
////print(v)
////
////var x = [1, 2, 3, 4, 5, -9, -8, -7 , -6, -5]
////for index in 0..<x.count {
////    if x[index] < 0 {
////        x[index] = 0
////    }
////}
////print(x.sorted())
//
//
//
//func makeArray(count: Int) -> [Int] {
//    var randomArray: [Int] = []
//    for _ in 0..<count {
//        randomArray.append(Int.random(in: -10...10))
//    }
//    return randomArray
//}
//var randomArray = makeArray(count: 10)
//
// функция, которая возвращает вместо отрицательных значений массива нули и сортирует массив. Самый короткий вариант указан внизу.
////func sortedArray(array: [Int]) -> [Int] {
////    for index in 0..<randomArray.count {
////        if randomArray[index] < 0 {
////            randomArray[index] = 0
////        }
////    }
////    return(randomArray.sorted())
////}
//
//func sortedArray(array: [Int]) -> [Int] {
//    let result = array.map {
////        if $0 > 0 {
////            return $0
////        } else {
////            return 0
////        }
//        $0 > 0 ? $0 : 0
//    }
//    return result.sorted { _, _ in false }
//}
//print(randomArray)
//print(sortedArray(array: randomArray))
//


//func newArraySorted(arrSort: [Int]) -> [Int] {
//    print(sortArray)
//    return sortArray.reversed()
//}

// как перевернуть массив: реверсд - переворачивает готовый массив, инсерт - помещает каждое новое значение на первое место в массиве
//func newArraySorted(arrSort: [Int]) -> [Int] {
//    var result: [Int] = []
//    arrSort.forEach {
//        result.insert($0, at: 0)
//    }
//    return result
//}
//print("\(randomArray) + нужный принт")
//print(newArraySorted(arrSort: randomArray))


// замыкание можно вынести за скобки, как в первом варанте, так смотрится красивее и профессиональнее
//months(numOfMonth: number, whichMonth: whichMonth)
//months(numOfMonth: 8) { number in
//    String(number*number)
//}
//
//months(numOfMonth: 8, whichMonth: { number in
//    String(number*number)
//})


// убираем ДУБЛИКАТЫ в массиве ТРЕМЯ разными способами
//print(randomArray)
//
//func arrayWithoutCopy(array: [Int]) -> [Int] {
//    var makeSet = Set(array)
//    var makeArrayAgain = Array(makeSet)
//    return makeArrayAgain
//}
//print(arrayWithoutCopy(array: randomArray))
//
//func anotherArrayWithoutCopy(array: [Int]) -> [Int] {
//    var newArray: [Int] = []
//    for element in randomArray {
//        if newArray.contains(element) == false {
//            newArray.append(element)
//        }
//    }
//    return newArray
//}
//
//func newArrayWithoutCopy(array: [Int]) -> [Int] {
//    randomArray.filter { element in
//        if randomArray.contains(element) {
//            return false
//        } else {
//            randomArray.append(element)
//            return true
//        }
//    }
//    }
//
//print(anotherArrayWithoutCopy(array: randomArray))
//print(newArrayWithoutCopy(array: randomArray))


// ПЕРЕЧИСЛЕНИЯ (ENUM)

//enum Seasons {
//    case winter
//    case spring
//    case summer
//    case autumn
//}
//
//let summer = Seasons.summer
//let spring: Seasons = .spring
//
//let season = Seasons.autumn
//switch season {
//case .winter:
//    print("winter")
//case .spring:
//    print("spring")
//case .summer:
//    print("summer")
//case .autumn:
//    print("autumn")
//}
//
////switch season {
////case .winter:
////    <#code#>
////case .spring:
////    <#code#>
////case .summer:
////    <#code#>
////case .autumn:
////    <#code#>
////}
//
//// ИТЕРАЦИЯ ПО КЕЙСАМ. Подписываем на протокол, появляются свойства, можем посчитать кол-во кейсов.
//enum Sides: CaseIterable {
//    case left
//    case right
//    case up
//    case down
//}
//let sidesCount = Sides.allCases.count
//for side in Sides.allCases {
//    print(side)
//}
//
//// Ассоциативные значения.
//enum PaymentMethod {
//    case creditCard(cardNumber: String, expiryDate: String, cvv: Int)
//    case debitCard(cardNumber: String, expiryDate: String, cvv: Int)
//    case payPal(email: String)
//    case applePay(id: String)
//}
//let paymentMethod1 = PaymentMethod.payPal(email: "sanyok@develop.ru")
//let paymentMethod2 = PaymentMethod.applePay(id: "123zxcd")
//let paymentMethod3 = PaymentMethod.debitCard(cardNumber: "1323234234", expiryDate: "11.11.2031", cvv: 123)
//switch paymentMethod3 {
//case .creditCard(let cardNumber, let expiryDate, let cvv):
//    print("Credit Card: cardNumber: \(cardNumber) expiryDate: \(expiryDate) cvv: \(cvv)")
//case .debitCard(let cardNumber, let expiryDate, let cvv):
//    print("Debit Card: cardNumber: \(cardNumber) expiryDate: \(expiryDate) cvv: \(cvv)")
//case .payPal(let email):
//    print("Paypal: email: \(email)")
//case .applePay(let id):
//    print("ApplePay: id: \(id)")
//}
//
//// Исходные Значения.
//enum OrderStatus: String {
//    case pending = "Заказ ожидает обработки"
//    case processing = "Заказ в обработке"
//    case shipped = "Заказ отправлен"
//    case delivered = "Заказ доставлен"
//    case canceled = "Заказ отменен"
//}
//let orderStatus = OrderStatus.delivered.rawValue
//print(orderStatus)
//
//enum OrderStatusNumber: Int {
//    case pending = 1  // Можно не прописывать значение. Все будет установлено НЕЯВНО, только начнется с 0.
//    case processing
//    case shipped
//    case delivered
//    case canceled
//}
//print(OrderStatusNumber.shipped.rawValue)
//
//
//
//enum Animals {
//    case cat (legs: Int, head: Int, eyes: Int)
//    case dog (legs: Int, head: Int, eyes: Int)
//    case bird (legs: Int, head: Int, eyes: Int)
//    case spider (legs: Int, head: Int, eyes: Int)
//}
//
//let animal1 = Animals.spider(legs: 8, head: 1, eyes: 8)
//let animal2 = Animals.cat(legs: 4, head: 1, eyes: 2)
//let animal3 = Animals.bird(legs: 2, head: 1, eyes: 2)
//
//
//// СТРУКТУРЫ (STRUCT).
//
//// Синтаксис.
//
//struct Phone {
//    private var model: String  // private - уровень доступа, который не позволяет получать свойство экземпляра и изменять его
//    var brand: String
//    let year: Int
//    var memory: Int
//    
//    func sayModel() -> String {
//        let myModel = " My model is \(model)"
//        return myModel
//    }
//    
//    init(model: String, brand: String, year: Int, memory: Int) {
//        self.model = model
//        self.brand = brand
//        self.year = year
//        self.memory = memory
//    }
//}
//
//
//// Экземпляры струткуры.
//
//let phone1 = Phone(model: "iPhone", brand: "Apple", year: 2020, memory: 128)  // с прайветом(выше в экземпляре) ругается без инита, с инитом на прайвет не ругается
//phone1.sayModel()
//phone1.brand
//phone1.year
//
//// Как работает value type.
//
//var myPhone = Phone(model: "iPhone", brand: "Apple", year: 2021, memory: 128)
//var myPhone1 = myPhone  // скопировал значение одной переменной в другую, можно менять параметры без проблем
//var myPhone2 = myPhone1
//myPhone1.brand = "fiv"
//myPhone1.brand
//myPhone2.brand
//myPhone.brand
//
//myPhone.memory == myPhone1.memory
//myPhone1.memory = 256
//myPhone.memory == myPhone1.memory

// Уровни доступа.

/*
 Open
 Public
 Internal(default)
 File-Private
 Private
 */





// КЛАССЫ (CLASS).

// Синтаксис.
//class Person {
//    
//}

//enum Item {
//    case weapon(Int, Int)
//    case food(Int)
//    case armor
//    
//    var description: String {
//        switch self {
//        case .weapon(let hitPoints, _):
//            "weapon"
//    //        player.attack(hitPoints)
//        case .food(let health):
//            "Пришел food \(health) кг"
//    //        player.health += health
//        case .armor:
//            "armor"
//    //        player.damageThreshold = Double(damageThreshold) * condition
//        }
//    }
//}
// 
//var sword = Item.food(13)
//
//func use(item: Item) {
//    switch item {
//    case .weapon(let hitPoints, _):
//        print("weapon")
////        player.attack(hitPoints)
//    case .food(let health):
//        print("Пришел food \(health) кг")
////        player.health += health
//    case .armor:
//        print("armor")
////        player.damageThreshold = Double(damageThreshold) * condition
//    }
//}
//
//use(item: sword)


//enum CustomError: Error, LocalizedError {
//    case invalidUsername(String)
//    case test
//    
//    var errorDescription: String? {
//        switch self {
//        case .invalidUsername(let nonCorrectSymbol):
//            "Неверное имя Пользователя \(nonCorrectSymbol)"
//        case .test:
//            "TEST"
//        }
//    }
//}
//
//func getError(error: String) throws {
//    print("start1")
//    if Bool.random() {
//        throw CustomError.invalidUsername(error)
//    } else {
//        throw CustomError.test
//    }
//}
//
//do {
//    print("start")
//    try getError(error: "bbb")
//    print("finish")
//} catch {
//    print(error.localizedDescription)
//}
//
//
//
//let a = [1, 2, 3, 4, 5]
//for element in a {
//    print(element)
//}
