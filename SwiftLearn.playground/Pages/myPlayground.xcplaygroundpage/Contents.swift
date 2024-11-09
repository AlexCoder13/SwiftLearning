import Foundation

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

var a: Int? = .zero
var b: Int? = nil
a = 10
b = 10
print("\(a ?? 5) \(b ?? 7)")
