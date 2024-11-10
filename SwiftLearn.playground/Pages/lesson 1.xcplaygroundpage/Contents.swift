import Foundation

// Lesson 1



//## Цель практической работы
//Научиться работать с переменными и их типами, с переменными без значения, и с числовыми данными.


//1 задание
//Создайте переменную, которая будет хранить строку «Hello, Skillbox» и напечатайте её содержимое с помощью команды print().
//Swift

var firstTask = "Hello, Skillbox"
print(firstTask)


//2 задание
//Создайте константу, которая будет хранить строку «Hello, Skillbox» и напечатайте её содержимое с помощью команды print().

let secondTask = "Hello, Skillbox"
print(secondTask)


//3 задание
//Создайте переменную с явным указанием типа, присвойте ей значение 0.5 и напечатайте её содержимое с помощью команды print().

var thirdTask: Double = 0.5
print(thirdTask)


//4 задание
//Возьмите optional-переменную ниже, извлеките из неё значение (раскройте optional) и напечатайте её значение. Результат не должен содержать обозначения optional.
//
//var swiftString: String? = "Swift"

var swiftString: String? = nil
let anotherSwiftString = swiftString ?? "ОШИБКА"
print(anotherSwiftString)

if let swiftString = swiftString {
    print(swiftString)
}


//5 задание
//Напишите код, который складывает два числа: 10 и 0,5. Выведите результат командой print().

var firstNumber = 10
var secondNumber = 0.5
let result = Double(firstNumber) + secondNumber
let anotherResult = firstNumber + Int(secondNumber)
print(result)
print(anotherResult)
