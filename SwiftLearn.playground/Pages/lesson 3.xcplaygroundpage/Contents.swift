import Foundation
//
//Задание 1
//Напишите функцию, которая принимает на вход два целых числа и выводит в консоль, равны они или нет. Должны выполняться следующие условия:
// Если первое число равно второму числу, надо вывести в консоль слово «равно».
// Если первое число больше второго, то вывести слово «больше».
// Если первое число меньше, то вывести слово «меньше».

// РАБОТАЕТ
//func twoEqualNumbers(firstNumber: Int, secondNumber: Int) -> String {
//    let result: String
//    if firstNumber == secondNumber {
//        result = "равно"
//    } else if firstNumber > secondNumber {
//        result = "больше"
//    } else {
//    }
//    return result
//}
//print(twoEqualNumbers(firstNumber: 19, secondNumber: 8))

// НЕ РАБОТАЕТ
//func twoEqualNumbers(firstNumber: Int, secondNumber: Int) {
//    switch firstNumber; secondNumber {
//    case firstNumber == secondNumber:
//        print("равно")
//    case firstNumber > secondNumber:
//        print("больше")
//    case firstNumber < secondNumber:
//        print("меньше")
//    default:
//        break 
//    }
//}
//print(twoEqualNumbers(firstNumber: 13, secondNumber: 7))



//
// Задание 2
// Напишите функцию func summ(toValue: Int), которая посчитает и выведет сумму всех нечётных чисел от 1 до заданного числа.
// Для определения нечётного числа нужно использовать оператор остатка от целочисленного деления %. Если остаток от деления на 2 не равен 0, это число нечётное.
//
// let result = summ(toValue: 100)
// print(result)
// Вывод в консоль: 2500

//func summ(toValue: Int) -> Int {
//    var result = 0
//    var number = 0
//    while number < toValue {
//        number += 1
//        if number % 2 != 0 {
//            result += number
//        }
//    }
//    return result
//}
//print(summ(toValue: 15))



//Задание 3
//Напишите функцию, которая будет принимать целое число, а выводить все целые числа, квадраты которых меньше или равны переданному параметру. Квадрат числа — это результат умножения числа на самого себя. Например, 9 — это квадрат числа 3.
// n = 10
// вывод в консоль:
// 1
// 2
// 3

//func squareNumbers(number: Int) {
//    var num = 0
//    while num*num <= number {
//        num += 1
//        if num*num > number {
//            break
//        }
//        print(num)
//    }
//}
//print(squareNumbers(number: 225))



//Задание 4
//Напишите функцию func handleDiceRoll(result: Int) для обработки значений одного брошенного кубика с помощью оператора switch. На вход функция получает число от 1 до 6 включительно. Если значение 1, 2 или 3, нужно вывести в консоль слово «проигрыш». Если значение 4, 5 или 6 — слово «победа».
//
// handleDiceRoll(result: 2)
// Вывод в консоль: Проигрыш
// handleDiceRoll(result: 5)
// Вывод в консоль: Победа

//func handleDiceRoll(result: Int) {
//    switch result {
//    case 1...3:
//        print("проигрыш")
//    case 4...6:
//        print("победа")
//    default:
//        break
//    }
//}
//print(handleDiceRoll(result: 5))
