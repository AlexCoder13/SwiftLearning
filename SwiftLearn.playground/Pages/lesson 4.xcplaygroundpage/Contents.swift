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

//func sortedArray(array: [Int]) -> [Int] {
//    for index in 0..<randomArray.count {
//        if randomArray[index] < 0 {
//            randomArray[index] = 0
//        }
//    }
//    return(randomArray.sorted())
//}

func sortedArray(array: [Int]) -> [Int] {
    let result = array.map {
//        if $0 > 0 {
//            return $0
//        } else {
//            return 0
//        }
        $0 > 0 ? $0 : 0
    }
    return result.sorted { _, _ in false }
}
print(randomArray)
print(sortedArray(array: randomArray))




// Задание 2
// Напишите функцию, которая принимает в качестве параметра массив и возвращает его в обратном порядке.

var sortArray = makeArray(count: 10)

func arraySorted(arrSort: [Int]) -> [Int] {
    for index in 0..<sortArray.count {
        for i in (index+1)..<sortArray.count {
            if sortArray[index] < sortArray[i] {
                let tmp = sortArray[i]
                sortArray[i] = sortArray[index]
                sortArray[index] = tmp
            }
        }
    }
    return sortArray
}
print(arraySorted(arrSort: sortArray))

func anotherArraySorted(arrSort: [Int]) -> [Int] {
    var array = sortArray.sorted()
    return array.reversed()
}
print(anotherArraySorted(arrSort: sortArray))

// хз, зачем я в предыдущих двух функциях его еще и отсортировал, просто задание прочитал нормально только что)))
//func newArraySorted(arrSort: [Int]) -> [Int] {
//    print(sortArray)
//    return sortArray.reversed()
//}

func newArraySorted(arrSort: [Int]) -> [Int] {
    var result: [Int] = []
    arrSort.forEach {
        result.insert($0, at: 0)
    }
    return result
}
print("\(sortArray) + нужный принт")
print(newArraySorted(arrSort: sortArray))


//Задание 3
//Напишите функцию, которая принимает в качестве параметров целое число и замыкание и вызывает внутри себя замыкание для проверки значения.
// Напишите замыкание, которое принимает в качестве параметра целое число и затем печатает в консоль название месяца, порядковый номер которого соответствует переданному параметру.
// Например: если передаётся 1, печатается «январь», 2 — «февраль». Если число выходит за рамки номеров месяцев, то должно печататься: «Такого месяца не бывает».
// Вызовите функцию, передав в неё значения для проверки.

func months(numOfMonth: Int, whichMonth: (Int) -> String) -> String {
    whichMonth(numOfMonth)
}

let whichMonth: (Int) -> String = { month in
    switch month {
    case 1: "январь"
    case 2: "февраль"
    case 3: "март"
    case 4: "апрель"
    case 5: "май"
    case 6: "июнь"
    case 7: "июль"
    case 8: "август"
    case 9: "сентябрь"
    case 10: "октябрь"
    case 11: "ноябрь"
    case 12: "декабрь"
    default: "Месяцев нет"
    }
}

let newCalendar: (Int) -> String = { month in
    switch month {
    case 1...2, 12: "ЗИМА"
    case 3...5: "ВЕСНА"
    case 6...8: "ЛЕТО"
    case 9...11: "ОСЕНЬ"
    default: "Месяцев нет"
    }
}

let number = 9
months(numOfMonth: number, whichMonth: newCalendar)
months(numOfMonth: number, whichMonth: whichMonth)
//months(numOfMonth: 8) { number in
//    String(number*number)
//}

months(numOfMonth: 8, whichMonth: { number in
    String(number*number)
})

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
print(newCalendar(array: newArray, closure: whichMonth))

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

// НЕ РАБОТАЕТ
//func anotherArrayWithoutCopy(array: [Int]) -> [Int] {
//    for value in randomArray {
//        if !randomArray.contains(value) {
//            randomArray.append(value)
//        }
//    }
//    return randomArray
//}
//print(anotherArrayWithoutCopy(array: randomArray))


func anotherArrayWithoutCopy(array: [Int]) -> [Int] {
    var newArray: [Int] = []
    for element in randomArray {
        if newArray.contains(element) == false {
            newArray.append(element)
        }
    }
    return newArray
}
print(anotherArrayWithoutCopy(array: randomArray))

// принты кое-где оставил специально, чтобы было видно, что код работает
