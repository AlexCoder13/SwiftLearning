import Foundation

// 1.
//Создайте функцию, которая будет выводить на консоль сумму следующих чисел:
//let numberOne = 78
//let numberTwo = 44
//Функция должна быть без параметров и без возвращаемых значений.

let numberOne = 78
let numberTwo = 44

func summ() {
    print(numberOne + numberTwo)
}

summ()
print("-------------------------")

// 2.
//Создайте функцию, которая будет возвращать рандомное значение от 0 до 100 типа Double.

func randomValue() -> Double {
    return Double.random(in: 1...100)
}

print(randomValue())
print("-------------------------")

// 3.
//Создайте функцию, которая будет принимать в качестве параметра целое число, и выводить на консоль все числа этого значения. Например если мы передадим в функцию 5 то при вызове данной функции мы должны увидеть следующий результат:
//1
//2
//3
//4
//5

func sequence(number: Int) {
    let collection = 1...number
    for element in collection {
        print(element)
    }
}

sequence(number: 5)
print("-------------------------")

//4.
//Создайте функцию, которая принимает имя пользователя в параметр, и возвращает логическое значение true если имя не превышает четырех символов

func whatName(name: String) -> Bool {
    guard name.count <= 4 else { return false }
    return true
}

print(whatName(name: "Alex"))
print("-------------------------")

//5.
//Создайте функцию, которая будет принимать в качестве параметра целое число, и возвращать массив со всеми простыми числами этого значения. Например если мы передадим в функцию 5 то при вызове данной функции она вернет массив [1, 2, 3, 4, 5].
//Присвойте результат работы функции новому свойству.

func arrayOfNumbers(number: Int) -> [Int] {
    var array: [Int] = []
    let collection = 1...number
    for element in collection {
        array.append(element)
    }
    return array
}

print(arrayOfNumbers(number: 5))
print("-------------------------")

//6.
//Создайте функцию, которая будет принимать следующий словарь со студентами:
//
//let students = ["Tim": Int.random(in: 1...100),
//                "Sem": Int.random(in: 1...100),
//                "Taylor": Int.random(in: 1...100),
//                "Stan": Int.random(in: 1...100)]
//Ключом является имя студента, а значением его проходной балл.
//Функция должна возвращать словарь с теми же студентами, но в качестве значения должен выступать статус либо hight либо low (для этого можно определить перечисление), если у студента баллы выше или равны 90 то мы для него определяем группу hight, если ниже то low.
//Присвойте результат работы функции новому свойству.

let students = ["Tim": Int.random(in: 1...100),
                "Sem": Int.random(in: 1...100),
                "Taylor": Int.random(in: 1...100)]

enum Status {
    case high
    case low
}

func statusOfStudents(students: [String: Int]) -> [String: Status] {
    var statusOfStudents: [String: Status] = [:]
    for (key, value) in students {
        if value >= 90 {
            statusOfStudents[key] = .high
        } else {
            statusOfStudents[key] = .low
        }
    }
    return statusOfStudents
}

let statusStudents = statusOfStudents(students: students)
for (key, value) in statusStudents {
    print("\(key): \(value)")
}
print("-------------------------")

//7.
//Реализуйте функцию, которая принимает три параметра: цена за единицу товара, количество товаров и скидка в процентах. Функция должна возвращать общую стоимость заказа, после применения скидки.
//Если значение параметра со скидкой не передано в функцию, то функция должна применять скидку в размере  0%
//Все параметры должны иметь тип Double.

func costOfOrder(costOfItem: Double, countOfItems: Double, discont: Double?) -> Double {
    let fullCostOfOrder = costOfItem * countOfItems
    let doubleDiscont: Double = discont ?? 0
    return fullCostOfOrder - (fullCostOfOrder * (doubleDiscont / 100))
}

print(costOfOrder(costOfItem: 100, countOfItems: 10, discont: 25))
print("-------------------------")


//8.
//Создайте функцию, которая принимает в качестве параметров любое количество направлений (север, юг, запад и восток) и выводит на консоль сообщение о том в каком направлении находится пользователь. Ваша задача вызвать функцию с несколькими значениями направления, например если мы передадим в функцию значение север и юг, то должны увидеть на консоли сообщения:
// Вывод:
// Heading north
// Heading south

var arrayOfDirections: [String] = []

func checkDirection(directions: [String]) {
    for element in directions {
        print("Heading \(element)")
    }
}

arrayOfDirections.append("north")
arrayOfDirections.append("west")

checkDirection(directions: arrayOfDirections)
print("-------------------------")

//9.
//Создайте функцию, которая будет удваивать переданное ей значение типа Int, и возвращать этот результат.
//Далее создайте еще одну функцию, которая будет принимать три параметра: функцию созданную ранее, значение, которое планируем увеличивать в два раза и число, которое будет отвечать за количество вызовов, переданной в параметр функции.
//Функция должна выводить следующий результат на консоль: “Operation result after iteration <номер итерации> is: <результат>
//Например если мы захотим 5 раз увеличить число 3, то на консоли мы  должны получить следующий результат:
// Вывод:
// Operation result after iteration 1 is: 6
// Operation result after iteration 2 is: 12
// Operation result after iteration 3 is: 24
// Operation result after iteration 4 is: 48
// Operation result after iteration 5 is: 96

func doubleNum(num: Int) -> Int{
    num * 2
}

func updateDoubleNum(num: Int, count: Int, _ operation: (Int) -> Int) {
    var result: Int
    result = count * operation(num)
    print("Operation result after iteration \(count) is: \(result)")
}

updateDoubleNum(num: 3, count: 5, doubleNum(num:))
print("-------------------------")
