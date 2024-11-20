//Задание 1
//Напишите функцию, которая принимает в качестве параметра массив целых чисел Int (как отрицательных, так и положительных) и возвращает массив, в котором каждое число меньше 0 заменено на 0, а сам массив отсортирован так, чтобы все элементы со значением, равным 0, были в начале.
// Примечание
// Пример создания случайного числа для заполнения массива:
// let randomInt = Int.random(in: -10...10),
// где −10...10 — диапазон, в пределах которого будет сгенерированное число.

func makeArray(count: Int) -> [Int] {
    var randomArray: [Int] = []
    for _ in 0..<count {
        randomArray.append(Int.random(in: -10...10))
    }
    return randomArray
}

var randomArray = makeArray(count: 10)

func sortedArray(array: [Int]) -> [Int] {
    let result = array.map {
        $0 > 0 ? $0 : 0
    }
    return result.sorted(by: <)
}

print("\(randomArray) - просто рандомный массив")
print(sortedArray(array: randomArray))


// Задание 2
// Напишите функцию, которая принимает в качестве параметра массив и возвращает его в обратном порядке.

// Решил оставить два варианта
// 1 вариант.
func newArraySorted(arrSort: [Int]) -> [Int] {
    return randomArray.reversed()
}
// 2 вариант.
func anotherArraySorted(arrSort: [Int]) -> [Int] {
    var result: [Int] = []
    arrSort.forEach {
        result.insert($0, at: 0)
    }
    return result
}

print(newArraySorted(arrSort: randomArray))
print(anotherArraySorted(arrSort: randomArray))


//Задание 3
//Напишите функцию, которая принимает в качестве параметров целое число и замыкание и вызывает внутри себя замыкание для проверки значения.
// Напишите замыкание, которое принимает в качестве параметра целое число и затем печатает в консоль название месяца, порядковый номер которого соответствует переданному параметру.
// Например: если передаётся 1, печатается «январь», 2 — «февраль». Если число выходит за рамки номеров месяцев, то должно печататься: «Такого месяца не бывает».
// Вызовите функцию, передав в неё значения для проверки.

let number = 10
let nameOfMonth: (Int) -> String = { month in
    switch month {
    case 1: "ЯНВАРЬ"
    case 2: "ФЕВРАЛЬ"
    case 3: "МАРТ"
    case 4: "АПРЕЛЬ"
    case 5: "МАЙ"
    case 6: "ИЮНЬ"
    case 7: "ИЮЛЬ"
    case 8: "АВГУСТ"
    case 9: "СЕНТЯБРЬ"
    case 10: "ОКТЯБРЬ"
    case 11: "НОЯБРЬ"
    case 12: "ДЕКАБРЬ"
    default: "Эй, малщик, в году всего 12 месяцев. Такого месяца не бывает."
    }
}

func calendar(numOfMonth: Int, nameOfMonth: (Int) -> String) {
    print(nameOfMonth(numOfMonth))
}
print(calendar(numOfMonth: number, nameOfMonth: nameOfMonth))


// Задание 4
//Напишите функцию, которая принимает в качестве параметров массив целых чисел и замыкание из задания 3. Внутри функции напишите код, где для каждого элемента в массиве вызывается передаваемое замыкание методом forEach(). Если передаётся пустой массив, то печатается «Месяцев нет».

var newArray: [Int] = []
for _ in 0..<12 {
    newArray.append(Int.random(in: 1...12))
}

func newCalendar(array: [Int], closure: (Int) -> String) {
    if array == [] {
        print("Месяцев нет")
    } else {
        array.forEach { print(closure($0)) }
    }
}

print("\(newArray) - еще один рандомный массив")
print(newCalendar(array: newArray, closure: nameOfMonth))


//Задание 5
// Создайте пустое множество строк fruits и добавьте в него фрукты: orange, apple, banana, grapefruit.
// Создайте множество redFood из элементов apple, tomato, grapefruit, strawberry.
// Найдите с помощью операций над множествами множества красных фруктов, множество красных продуктов, но не фруктов, и множество всей еды, кроме красных фруктов.

let fruits: Set = ["orange", "apple", "banana", "grapefruit"]
let redFood: Set = ["apple", "tomato", "grapefruit", "strawberry"]


let redFruits: Set = fruits.intersection(redFood)
print(redFruits)

let redProducts: Set = redFood.symmetricDifference(redFruits)
print(redProducts)

let allFood: Set = fruits.union(redFood)
let anotherAllFood: Set = allFood.symmetricDifference(redFruits)
print(anotherAllFood)


//Задание 6
//Напишите две функции, которые принимают в качестве параметра массив, удаляют из него дубликаты и возвращают массив с уникальными значениями.
//Первая функция не должна использовать свойства множеств для удаления дубликатов, вторая функция — должна.

print(randomArray)

func arrayWithoutCopy(array: [Int]) -> [Int] {
    var makeSet = Set(array)
    var makeArrayAgain = Array(makeSet)
    return makeArrayAgain
}
print(arrayWithoutCopy(array: randomArray))

func anotherArrayWithoutCopy(array: [Int]) -> [Int] {
    var newArray: [Int] = []
    for element in randomArray {
        if newArray.contains(element) == false {
            newArray.append(element)
        }
    }
    return newArray
}

func newArrayWithoutCopy(array: [Int]) -> [Int] {
    randomArray.filter { element in
        if randomArray.contains(element) {
            return false
        } else {
            randomArray.append(element)
            return true
        }
    }
    }

print(anotherArrayWithoutCopy(array: randomArray))
print(newArrayWithoutCopy(array: randomArray))

// принты кое-где оставил специально, чтобы было видно, что код работает
