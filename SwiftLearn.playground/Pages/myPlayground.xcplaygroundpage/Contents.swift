//import Foundation

//var coinsInNewChest = "nil"
//var allCoinsCount = 1301
//if Int(coinsInNewChest) != nil {
//    allCoinsCount += Int(coinsInNewChest)!
//    print(allCoinsCount)
//} else {
//    print("У нового дракона отсутствует золото")
//}

//let backend: [Int?] = [1, 4, 7, 14, nil, 23, nil]
//var int: Int
//for position in 0...backend.count - 1 {
//    let temp = backend[position]
//    if let nonOptNemp = temp {
//        int = nonOptNemp
//    } else {
//        int = 404
//    }
//    if int == 404 {
//        print("ОШИБКА")
//    } else {
//        print(int)
//    }
//}

//var a: Int? = .zero
//var b: Int? = nil
//a = 10
//b = 10
//print("\(a ?? 5) \(b ?? 7)")

//print("Введите ваше Имя")
//readline()


//let salary = [40000, 42000, 39000, 41000, 40000, 56000]
//var summ = 0
//var index = 0
//for _ in salary {
//    summ += salary[index]
//    index += 1
//    print("Накоплено деняк после очередного месяца работы" + " - " + String(summ))
//}
//
//
//let salary1 = [40000, 42000, 39000, 41000, 40000, 56000]
//var summ1 = 0
//var index1 = 0
//while index1 < salary1.count {
//    summ1 += salary1[index1]
//    index1 += 1
//}
//print("Накоплено деняк после полугода рапства" + " - " + String(summ1))



//var randomArray: [Int] = []
//for _ in 0..<10 {
//    randomArray.append(Int.random(in: 0...1000))
//}



//  случайный массив
func makeArray() -> [Int] {
    var randomArray: [Int] = []
    for _ in 0..<10 {
        randomArray.append(Int.random(in: 0...100))
    }
    return randomArray
}

var a = makeArray()
//  максимальное значение случайного массив
var maximum = 0
for element in a {
    if element > maximum {
        maximum = element
    }
}
print(a)
print(maximum)


//  удаляем четные значения из случайного массива
for index in stride(from: a.count - 1, through: 0, by: -1) {
    if a[index] % 2 == 0 {
        a.remove(at: index)
    }
}
print(a)

//  2 вариант
var index = 0
while index < a.count {
    if a[index] % 2 == 0 {
        a.remove(at: index)
    } else {
        index += 1
    }
}
print(a)


//  создание нового массива путем фильтрации исходного
var aNew: [Int] = []
for element in a {
    if element % 2 != 0  {
        aNew.append(element)
    }
}
print(aNew)


//  сортируем массив от меньшего к большему
var b = makeArray()
for i in 0..<b.count {
    for j in (i+1)..<b.count {
        if b[j] > b[i] {
            let tmp = b[i]
            b[i] = b[j]
            b[j] = tmp
        }
    }
}
print(b)


//  обмен значениями между двумя массивами
var arrayA = makeArray()
var arrayB = makeArray()
print(arrayA)
print(arrayB)
for index in stride(from: arrayA.count - 1, through: 0, by: -1) {
    if arrayA[index] % 2 == 0 {
        arrayB.append(arrayA[index])
        arrayA.remove(at: index)
    }
}
for index in stride(from: arrayB.count - 1, through: 0, by: -1) {
    if arrayB[index] % 2 != 0 {
        arrayA.append(arrayB[index])
        arrayB.remove(at: index)
    }
}
print(arrayA.sorted())
print(arrayB.sorted())


//  соритруем массив от большего к меньшему и присваем отрицательным значениям 0
//var v = [1, 2, 3, 4, 5, -9, -8, -7 , -6, -5]
//for (index, value) in v.enumerated() {
//    if v[index] < 0 {
//        v[index] = 0
//    }
//}
//print(v)
//
//var x = [1, 2, 3, 4, 5, -9, -8, -7 , -6, -5]
//for index in 0..<x.count {
//    if x[index] < 0 {
//        x[index] = 0
//    }
//}
//print(x.sorted())


