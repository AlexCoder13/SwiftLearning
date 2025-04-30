//
//  TabVCCustomCell.swift
//  UIKit.Basic.
//
//  Created by Александр Семёнов on 30.04.2025.
//

// MARK: - Создаем ТАБЛИЦУ c кастомной ячейкой
import UIKit

final class TableVCCustomCell: UIViewController {
    
    // 1 - Нужны данные для таблицы
    var posts = Post.mockData()
    
    // 2 - Создаем саму таблицу
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: view.frame, style: .plain)
        tableView.dataSource = self // 3 - протокол, который хранит информацию о таблице, действующий класс подписывается на него через расширение
//        tableView.delegate = self
        tableView.register(PostCell.self, forCellReuseIdentifier: PostCell.reuseId) // 4 - Регистрируем ячейку. Именно эта ячейка будет переиспользоваться и отображать инфу.
        tableView.separatorStyle = .none // убирает разделительную полосу между ячейками
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView) // добавляем таблицу на Вьюху
    }
    
}

// Расширение: Класс подписывается под протокол, Реализует два обязательных метода
extension TableVCCustomCell: UITableViewDataSource {
    // Возвращает кол-во ячеек таблицы (в зависимости от элементов в массиве данных)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        posts.count
    }

    // Возвращает саму ячейку, то есть как будет выглядеть непосредственно сама ячейка
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Создаем кастомную ячейку
        if let cell = tableView.dequeueReusableCell(withIdentifier: PostCell.reuseId, for: indexPath) as? PostCell {
            let post = posts[indexPath.row] // вычленяем отдельный элемент массива
            cell.setupCell(with: post) // начиняем ячейку данными из массива
            cell.selectionStyle = .none // ячейка не будет выделяться
            return cell
        }
        return UITableViewCell()
    }

    
}


// Создадим структуру данных для заполнения таблицы (пойдет в первый пункт)
struct Post {
    let header: String
    let image: String //* - в моделях НИКОГДА! не пишем UI элементы
    let text: String
    
    static func mockData() -> [Post] {
        [
            Post(header: "Заголовок 1", image: "img", text: "Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum"),
            Post(header: "Заголовок 2", image: "img", text: "Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum"),
        ]
    }
}
