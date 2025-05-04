import Foundation

// MARK: - Observer (Наблюдатель)

/*
 Описание:
 Паттерн Observer — это поведенческий паттерн проектирования, который позволяет объекту (называемому Subject или Observable) уведомлять другие объекты (Observers) об изменениях своего состояния.
 
 Основные компоненты:
 Subject (Наблюдаемый объект) – хранит состояние и уведомляет наблюдателей о его изменении.
 Observer (Наблюдатель) – интерфейс или протокол, определяющий метод обновления (update).
 Concrete Observers (Конкретные наблюдатели) – реализуют реакцию на изменения Subject.
 
 Как работает в Swift?
 Subject хранит список наблюдателей (например, через массив слабых ссылок).
 При изменении состояния Subject вызывает метод у всех наблюдателей.
 
 Swift часто использует:
 Делегаты (но это 1:1, а Observer — 1:много).
 Closures (замыкания).
 NotificationCenter (встроенный механизм Apple).
 Combine Framework (современный подход с Publisher и Subscriber).
 */

// Тип, которому должны соответствовать все наблюдатели
protocol Observer {
    func getNew(video: String)
}

// Тип, которому соответствует наблюдаемый субъект
protocol Subject {
    func add(observer: Observer)
    func remove(observer: Observer)
    func notification(video: String)
}

// Класс субъекта
class Blogger: Subject {
    var observers = NSMutableSet() // массив наблюдателей
    var video: String = "" { 
        didSet {
            notification(video: video)
        }
    }
    
    func add(observer: Observer) {
        observers.add(observer)
    }
    
    func remove(observer: Observer) {
        observers.remove(observer)
    }
    
    func notification(video: String) {
        for observer in observers {
            (observer as! Observer).getNew(video: video)
        }
    }
}

// Классы наблюдателей
class Subscriber: NSObject, Observer {
    
    var nickname: String
    
    init(nickname: String) {
        self.nickname = nickname
    }
    
    func getNew(video: String) {
        print("Новое видео \(video) для пользователя \(nickname)")
    }
}

class Google: NSObject, Observer {
    
    func getNew(video: String) {
        print("Новое видео \(video) обрабатывается")
    }
}

// Создадим экземпляры классов
let vasya = Subscriber(nickname: "vasya")
let petya = Subscriber(nickname: "petya")
let google = Google()

let blogger: Blogger = Blogger()
blogger.add(observer: vasya)
blogger.add(observer: petya)
blogger.add(observer: google)

blogger.video = "Pattern 'Observer'"
