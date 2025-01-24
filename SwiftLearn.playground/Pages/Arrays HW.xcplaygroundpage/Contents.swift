import Foundation
//
//Задача 1: Создание массива и добавление элементов
//Описание: Создай пустой массив типа String и добавь в него три разных строки

var firstArray: [String] = []
let firstString = "First String"
let secondString = "Second String"
let thirdString = "Third String"
firstArray.append(firstString)
firstArray.append(secondString)
firstArray.append(thirdString)
for element in firstArray {
    print(element)
}

print("------------------")

//Задача 2: Проверка наличия элемента
//Описание: Создай массив из чисел [2, 4, 6, 8, 10]. Нужно проверить, есть ли в массиве число 6.
let secondArray = [2, 4, 6, 8, 10]
print(secondArray.contains(6))

print("------------------")

//
//Задача 3: Получение первого и последнего элемента
//Описание: Создай массив из строк [“apple”, “banana”, “cherry”]. Выведи первый и последний элементы массива.

var thirdArray = ["apple", "banana", "cherry"]
print(thirdArray.first!)
print(thirdArray.last!)

print("------------------")

//
//Задача 4: Подсчет элементов массива
//Описание: Создай массив чисел [1, 3, 5, 7, 9] и выведи количество элементов в массиве.
let forthArray = [1, 3, 5, 7, 9]
print(forthArray.count)

print("---")

var counter = 0
for element in forthArray {
    counter += 1
}
print(counter)

print("------------------")

//
//Задача 5: Удаление элемента
//Описание: Создай массив [“red”, “green”, “blue”, “yellow”]. Удали из массива строку "green". Выведи измененный массив.
var fifthArray = ["red", "green", "blue", "yellow"]
fifthArray.remove(at: 1)
print(fifthArray)

print("------------------")
//
//Задача 6: Объединение массивов
//Описание: Создай два массива: [1, 2, 3] и [4, 5, 6]. Объедини их в один массив и выведи результат.

// 1 способ
var sixthArray = [1, 2, 3]
var anotherSixthArray = [4, 5, 6]
var newsixthArray = sixthArray + anotherSixthArray
print(newsixthArray)
print("---")

// 2 способ
var newSixthArray: [Int] = []
for element in sixthArray {
    newSixthArray.append(element)
}
for element in anotherSixthArray {
    newSixthArray.append(element)
}
print(newSixthArray)
print("---")

// 3 способ
sixthArray.append(contentsOf: anotherSixthArray)
print(sixthArray)

print("------------------")

//
//Задача 7: Сортировка массива
//Описание: Создай массив [3, 1, 4, 1, 5, 9]. Нужно отсортировать массив по возрастанию и по убыванию.
var seventhArray = [3, 1, 4, 1, 5, 9]
seventhArray.sort(by: >)
print(seventhArray)
seventhArray.sort(by: <)
print(seventhArray)

print("------------------")

//
//Задача 8: Фильтрация массива
//Описание: Создай массив [10, 15, 20, 25, 30]. При помощи функции высшего порядка оставь в массиве только элементы больше 20.
var array = [10, 15, 20, 25, 30]
array.removeAll(where: { $0 <= 20 })
print(array)

print("------------------")

//
//Задача 9: Поиск индекса элемента
//Описание: Создай массив [“cat”, “dog”, “bird”, “fish”]. Найди индекс элемента "bird".
let newArray = ["cat", "dog", "bird", "fish"]
if let index = newArray.firstIndex(of: "bird") {
    print(index)
}

print("------------------")

//
//Задача 10: Преобразование массива
//Описание: Создай массив [1, 2, 3, 4, 5]. Используй функцию высшего порядка, чтобы получить новый массив, в котором каждый элемент будет умножен на 2.
var anotherArray = [1, 2, 3, 4, 5]
print(anotherArray.map { $0 * 2 })

print("------------------")

