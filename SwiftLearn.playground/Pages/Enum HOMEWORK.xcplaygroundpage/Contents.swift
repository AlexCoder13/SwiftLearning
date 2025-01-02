import Foundation

//Уровень 1: Основы Enum
//Задание: Создай простой enum для статуса задачи: notStarted, inProgress, completed.
//Добавь функцию statusMessage, которая принимает значение этого enum и возвращает строку:
//Для notStarted — "Task not started",
//Для inProgress — "Task in progress",
//Для completed — "Task completed".
//
//Пример:
//let status: TaskStatus = .inProgress
//print(statusMessage(for: status)) // "Task in progress"

enum TaskStatus {
    case notStarted
    case inProgress
    case completed
    
    func statusMessage(for: TaskStatus) -> String {
        switch self {
        case .notStarted:
            "Task not started"
        case .inProgress:
            "Task in progress"
        case .completed:
            "Task completed"
        }
    }
}

let status: TaskStatus = .completed
print(status.statusMessage(for: status))



//Уровень 2: Enum с raw value
//Задание: Создай enum для типов валют:
//usd (1),
//eur (2),
//gbp (3).
//Добавь инициализатор, принимающий raw value, и возвращающий nil, если передано некорректное значение.
//Реализуй функцию, которая принимает enum и возвращает строку, например:
//let currency = Currency(rawValue: 2)
//print(describeCurrency(currency)) // "EUR currency"

enum Currency: Int {
    case usd = 1
    case eur = 2
    case gbp = 3
    
    init?(rawValue: Int) {
        switch rawValue {
        case 1: self = .usd
        case 2: self = .eur
        case 3: self = .gbp
        default: return nil
        }
    }
}

func describeCurrency(currency: Currency?) -> String {
    switch currency {
    case .usd:
        "USD currency"
    case .eur:
        "EUR currency"
    case .gbp:
        "GBP currency"
    case nil:
        "Такой валюты нет"
    }
}

let currency = Currency(rawValue: 1)
print(describeCurrency(currency: currency))



//Уровень 3: Enum с ассоциированными значениями
//Задание: Создай enum PaymentMethod, описывающий способы оплаты:
//cash,
//card(bank: String),
//online(service: String).
//Напиши функцию describePaymentMethod, которая принимает значение PaymentMethod и возвращает строку с его описанием.
//Например:
//let payment = PaymentMethod.card(bank: "Visa")
//print(describePaymentMethod(payment)) // "Payment via Visa card"

enum PaymentMethod {
    case cash
    case card(bank: String)
    case online(service: String)
}

func describePaymentMethod(method: PaymentMethod) -> String {
    switch method {
    case .cash:
        "Payment via cash"
    case .card(let bank):
        "Payment via \(bank) card"
    case .online(let service):
        "Payment via \(service) online"
    }
}

let payment = PaymentMethod.online(service: "'Dolyami'")
print(describePaymentMethod(method: payment))



//Уровень 4: Enum с методами и вычисляемыми свойствами
//Задание: Создай enum Weather для описания погоды:
//sunny,
//cloudy,
//rainy(chance: Int).
//Добавь метод description, возвращающий описание погоды. Если rainy, включи вероятность дождя в описание.
//Пример:
//let today = Weather.rainy(chance: 70)
//print(today.description()) // "Rainy weather with 70% chance of rain"

enum Weather {
    case sunny
    case cloudy
    case rainy(chance: Int)
    
    var description: String {
        switch self {
        case .sunny:
            "Sunny weather will be today"
        case .cloudy:
            "Cloudy weather will be today"
        case .rainy(let chance):
            "Rainy weather with \(chance)% chance of rain"
        }
    }
}

let today = Weather.rainy(chance: 70)
print(today.description)



//Уровень 5: Сложный Enum с логикой
//Задание: Создай enum File для описания файла:
//
//text(name: String, size: Int),
//image(name: String, resolution: (width: Int, height: Int)),
//video(name: String, duration: Int).
//Добавь метод info, который возвращает описание файла:
//
//Для text — "Text file '<name>', size: <size>KB".
//Для image — "Image '<name>', resolution: <width>x<height>".
//Для video — "Video '<name>', duration: <duration> seconds".
//Пример:
//let file = File.image(name: "Sunset", resolution: (1920, 1080))
//print(file.info()) // "Image 'Sunset', resolution: 1920x1080"

enum File {
    case text(name: String, size: Int)
    case image(name: String, resolution: (width: Int, height: Int))
    case video(name: String, duration: Int)
    
    func info() -> String {
        switch self {
        case .text(let name, let size):
            "Text file \(name), size: \(size)KB"
        case .image(let name, let resolution):
            "Image \(name), resolution: \(resolution.width)x\(resolution.height)"
        case .video(let name, let duration):
            "Video \(name), duration: \(duration) seconds"
        }
    }
}

let imageFile = File.image(name: "'Sunset'", resolution: (1920, 1080))
print(imageFile.info())
