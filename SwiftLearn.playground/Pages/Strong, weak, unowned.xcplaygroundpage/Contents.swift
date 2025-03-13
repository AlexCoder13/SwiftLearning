import Foundation


// STRONG - 1.
////1
//class Person {
//    let name: String
//    init(name: String) {
//        self.name = name
//        print("\(name) инициализируется")
//    }
//    deinit {
//        print("\(name) деинициализируется")
//    }
//}
//
////2
//var reference1: Person?
//var reference2: Person?
//var reference3: Person?
//
////3
//reference1 = Person(name: "John Appleseed")
//// Выведет "John Appleseed инициализируется"
//
////4
//reference2 = reference1
//reference3 = reference1
//
////5
//reference1 = nil
//reference2 = nil
//
////6
//reference3 = nil
//// Выведет "John Appleseed деинициализируется"



// STRONG - 2. retain cycle.
////1
//class Person {
//    let name: String
//    init(name: String) {
//        self.name = name
//    }
//    var apartment: Apartment?
//    deinit { print("\(name) освобождается") }
//}
//class Apartment {
//    let unit: String
//    init(unit: String) {
//        self.unit = unit
//    }
//    var tenant: Person?
//    deinit { print("Апартаменты \(unit) освобождаются") }
//}
//
////2
//var john: Person?
//var unit4A: Apartment?
//
////3
//john = Person(name: "John Appleseed")
//unit4A = Apartment(unit: "4A")
//
////4
//john!.apartment = unit4A
//unit4A!.tenant = john
//
////5
//john = nil
//unit4A = nil



// WEAK.
////1
//class Person {
//    let name: String
//    init(name: String) {
//        self.name = name
//    }
//    var apartment: Apartment?
//    deinit { print("\(name) деинициализируется") }
//}
//class Apartment {
//    let unit: String
//    init(unit: String) {
//        self.unit = unit
//    }
//    weak var tenant: Person?
//    deinit { print("Apartment \(unit) деинициализируется") }
//}
//
////2
//var john: Person?
//var unit4A: Apartment?
//john = Person(name: "John Appleseed")
//unit4A = Apartment(unit: "4A")
//john!.apartment = unit4A
//unit4A!.tenant = john
//
////3
//john = nil
//// Выведет "John Appleseed деинициализируется"
//
////4
//unit4A = nil
//// выводит "Apartment 4A деинициализируется"



// UNOWNED.
////1
//class Customer {
//    let name: String
//    var card: CreditCard?
//    init(name: String) {
//        self.name = name
//    }
//    deinit { print("\(name) деинициализируется") }
//}
//class CreditCard {
//    let number: UInt64
//    unowned let customer: Customer
//    init(number: UInt64, customer: Customer) {
//        self.number = number
//        self.customer = customer
//    }
//    deinit { print("Карта #\(number) деинициализируется") }
//}
//
////2
//var john: Customer?
//
////3
//john = Customer(name: "John Appleseed")
//john!.card = CreditCard(number: 1234567890123456, customer: john!)
//
////4
//john = nil
//// Выведет "John Appleseed деинициализируется"
//// Выведет "Карта #1234567890123456 деинициализируется"

//let alphabet = "а"..."я"
//print(alphabet)
