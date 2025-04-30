//
//  TableVC.swift
//  UIKit.Basic.
//
//  Created by Александр Семёнов on 30.04.2025.
//


// MARK: - Создаем ТАБЛИЦУ
import UIKit

final class TableVC: UIViewController {
    
    // 1 - Нужны данные для таблицы
    var books = Book.mockData()
    
    // 2 - Создаем саму таблицу
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: view.frame, style: .insetGrouped)
        tableView.dataSource = self // 3 - протокол, который хранит информацию о таблице, действующий класс подписывается на него через расширение
        tableView.delegate = self // 3.5 - назначаем делегатом сам класс
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "bookCell") // 4 - Регистрируем ячейку. Именно эта ячейка будет переиспользоваться и отображать инфу.
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView) // добавляем таблицу на Вьюху
    }
    
}

// Расширение: Класс подписывается под протокол, Реализует два обязательных метода
extension TableVC: UITableViewDataSource {
    // Возвращает кол-во ячеек таблицы (в зависимости от элементов в массиве данных)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        books.count
    }

    // Возвращает саму ячейку, то есть как будет выглядеть непосредственно сама ячейка
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "bookCell",for: indexPath) // создаем ячейку, прописываем идентификатор(как выше) и indexPath(помогает определить, где мы сейчас находимся, на какую ячейку нажимаем)
        let book = books[indexPath.row]
        
        // Делаем КОНФИГУРАЦИЮ для ячейки
        var config = cell.defaultContentConfiguration() //  говорим, что у ячейки есть стандартные конфигурации
        config.text = book.name // стандартная конфига основного текста ячейки
        config.secondaryText = book.author // стандартная конфига второго текста ячейки
        config.image = UIImage(systemName: book.image) // стандартная конфига изображения ячейки
        cell.contentConfiguration = config // присваиваем созданную конфигурацию нашей ячейке
        
        cell.accessoryType = .disclosureIndicator // стрелочка перехода на ячейке
        
        return cell
    }
}

// Расширение: реализуем ДЕЛЕГАТ для взаимодействия с таблицей
extension TableVC: UITableViewDelegate {
    // Функция, которая отвечает за то, что происходит с ячейкой, когда мы на нее нажимаем
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Выбрана ячейка с индексом: \(indexPath.row)")
    }
    
    // Метод для удаления информации из таблицы
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            books.remove(at: indexPath.row) // сначала удаляем из Массива
            tableView.deleteRows(at: [indexPath], with: .fade) // затем удаляем из таблицы
        }
    }
}


// Создадим структуру данных для заполнения таблицы (пойдет в первый пункт)
struct Book {
    let name: String
    let author: String
    let image: String //* - в моделях НИКОГДА! не пишем UI элементы
    
    static func mockData() -> [Book] {
        [
            Book(name: "1984", author: "Дж. Оруэлл", image: "heart"),
            Book(name: "Война и Мир", author: "Л. Толстой", image: "circle"),
            Book(name: "Маленький Принц", author: "А. Э. Экзюпери", image: "square"),
            Book(name: "Унесенные Ветром", author: "Митчелл", image: "scribble"),
            Book(name: "Гарри Поттер", author: "Дж. К. Роулинг", image: "plus")
        ]
    }
}
