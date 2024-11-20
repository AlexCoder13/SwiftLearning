////import Foundation
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
