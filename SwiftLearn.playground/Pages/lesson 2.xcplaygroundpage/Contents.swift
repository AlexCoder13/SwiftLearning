import Foundation

// Lesson 2


//Задание 1
//Дополните функцию nextNumber() так, чтобы она получала целое число и возвращала число, следующее за ним по порядку.
// func nextNumber(number: Int) -> Int {
//     // Ваш код должен быть здесь
// }
// Вызовите получившуюся функцию.
// Убедитесь, подставляя различные аргументы, что функция работает корректно.
// Вызов: nextNumber(number: 5)
// Вывод в консоль: 6

func nextNumber(number: Int) -> Int {
    number + 1
}
print(nextNumber(number: 90))


//Задание 2
//В предыдущем задание, вы вызвали существующую функцию. В этом задании требуется сделать обратное, т.е. вам нужно по описанию вызова функции ее создать.
//let value = getSquare(number: 3)
//print(value)
//Дан вызов функции. Превратите его в функцию, которая вызывается так: getSquare(number: 3) — и возвращает квадрат целого числа, в данном случае 9.

func getSquare(number: Int) -> Int {
    number*number
}
print(getSquare(number: 15))


//Задание 3
//Напишите функцию, которая получает на вход количество секунд и возвращает количество минут и оставшихся секунд.
//
//Пример: в качестве аргумента подаётся 70 секунд, тогда функция возвращает два целых числа. Первое — 1 минуту, второе — 10 секунд.
//
//Подсказки:
//
//Используйте кортеж, содержащий два значения: количество минут и секунд.
//Переменная, в которой хранится кортеж, имеет тип (minutes: Int, seconds: Int).
//Для получения остатка используйте оператор, возвращающий остаток от деления.
//Вызовите вашу функцию и выведите количество минут и секунд отдельными инструкциями print().

func time(allSeconds: Int) -> (minutes: Int, seconds: Int) {
    (allSeconds / 60, allSeconds % 60)
}
print(time(allSeconds: 640).minutes)
print(time(allSeconds: 640).seconds)


//Задание 4
//Напишите функцию, которая будет конкатенировать (объединять) две строки в одну. Вызовите вашу функцию и сохраните результат в переменную. Выведите результат в консоль. Для проверки используйте константы ниже.
//
let string1 = "Writing Swift code"
let string2 = "is interactive and fun"
func concatinateStrings(firstString: String, secondString: String) -> String {
    firstString + " " + secondString
}
print(concatinateStrings(firstString: string1, secondString: string2))

//Задание 5
//Напишите функцию, которая на входе будет получать дату в виде строки (например, "2004-11-23"), а на выходе возвращать сущность типа Date.
//
//Дата задана в формате yyyy-MM-dd.
//
//Подсказка: для преобразования строки в дату используйте DateFormatter(). DateFormatter при форматировании возвращает optional Date. Чтобы раскрыть optional, используйте значение по умолчанию — текущую дату.



//var myNumber = 90
//
//func nextNumber(number: inout Int) {
//    number += 1
//}
//print(myNumber)
//nextNumber(number: &myNumber)
//print(myNumber)

//var myNumber = 90
//
//func nextNumber(number: Int) {
//    var a = number
//    a += 1
//}
//print(myNumber)
//nextNumber(number: myNumber)
//print(myNumber)
