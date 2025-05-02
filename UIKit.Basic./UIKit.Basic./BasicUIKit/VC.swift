//
//  VC.swift
//  UIKit.Basic.
//
//  Created by Александр Семёнов on 29.04.2025.
//

import UIKit

class MyViewController: UIViewController {
    
    // MARK: - ФУНКЦИИ ЖИЗНЕННОГО ЦИКЛА VC
    // Вьюха загружается в память
    override func loadView() {
        super.loadView()
        print("loadView")
    }
    
    // Вьюха уже загрузилась в память
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        
        // Устанавливаем цвет Вьюхи
        view.backgroundColor = .lightGray
    }
    
    // Вьюха готовится к появлению на экране
    override func viewWillAppear(_ animated: Bool) {
        print("Начинаю показывать view -- viewWillAppear")
    }
    
    // Вьюха полностью показана на экране
    override func viewDidAppear(_ animated: Bool) {
        print("View полностью на экране -- viewDidAppear")
    }
    
    // Вьюха начинает исчезать с экрана
    override func viewWillDisappear(_ animated: Bool) {
        print("Начинаю скрывать view -- viewWillDisappear")
    }
    
    // Вьюха полностью исчезла с экрана
    override func viewDidDisappear(_ animated: Bool) {
        print("View скрыт -- viewDidDisappear")
    }
    
    
    // эти функции вызываются, когда перестраиваются наши вьюхи (например разные ориентации экрана)
    override func viewWillLayoutSubviews() {
        print("viewWillLayoutSubviews")
    }
    
    override func viewDidLayoutSubviews() {
        print("viewWillLayoutSubviews")
    }
    
    
    // MARK: - Создание элементов кодом
    // Оптимальный вариант создания элемента через ленивое свойство
    lazy var pageTitle1: UILabel = {
        let label = UILabel()
        label.text = "Hello, World!"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 36)
        label.translatesAutoresizingMaskIntoConstraints = false // ВАЖНО!!! Для того, чтобы работали собственные Констрейны
        view.addSubview(pageTitle1)
        return label
    }()
    // Размеры задаем через Констрейны
    func setupConstraints() {
        NSLayoutConstraint.activate([
            pageTitle1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pageTitle1.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            pageTitle1.widthAnchor.constraint(equalToConstant: view.frame.width - 60),
            ])
    }
    
    // или
    
    let pageTitle2 = UILabel()
    // а функцию писать во viewDidLoad, или сразу свойства писать во viewDidLoad, но это плохой КодСтайл
    func setupPageTitle2() {
        pageTitle2.text = "Hello, World!"
        pageTitle2.textAlignment = .center
        pageTitle2.font = UIFont.systemFont(ofSize: 36)
        pageTitle2.frame = CGRect(x: 30, y: 100, width: view.frame.width - 60, height: 50) // сразу же через frame задаем размеры
        view.addSubview(pageTitle2) // добавляем элемент на Вьюху
    }
    
    
    // UIImageView - элемент UIView, UIImage - просто объект NSObject. Картинка как объект присвается для UIImageView через свойство ".image"
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .img // присвоили картинку, подгруженную в Assets
        imageView.contentMode = .scaleAspectFill // есть еще scaleAspectFit - не растягивает картинку на всю UIImageView
        imageView.clipsToBounds = true // чтобы изображение не выходило за рамки
        imageView.frame = CGRect(
            x: 30,
            y: pageTitle1.frame.maxY + 28,
            width: view.frame.width - 60,
            height: 200)
        view.addSubview(imageView)
        return imageView
    }()
    
    
    lazy var btn: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Tap me!", for: .normal) // устанавливаем текст кнопки
        btn.setTitleColor(.white, for: .normal) // устанавливаем цвет текста кнопки
        btn.backgroundColor = .systemBlue // цвет самой кнопки
        btn.layer.cornerRadius = 10 // закругление углов кнопки, layer - слой
        btn.frame.size = CGSize(width: view.frame.width - 60, height: 50) // Размеры через CGSize
        btn.frame.origin = CGPoint(x: 30, y: imageView.frame.maxY + 28) // Размеры через CGPoint
        btn.addAction(btnAction, for: .touchUpInside) // задаем действие для кнопки
        //        btn.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside) - еще один способ добавить действие для кнопки
        view.addSubview(btn)
        return btn
    }()
    // прописываем действие для кнопки через ленивое свойство и класс UIAction
    lazy var btnAction: UIAction = UIAction { [weak self] _ in // т.к. это кложура, то лучше делать через слабую ссылку во избежание утечек памяти
        self?.pageTitle1.text = "New Text"
        
    }
    /* прописываем действие для кнопки - еще один способ
     @objc
     func buttonTapped() {
     print("Button tapped!")
     }
     */
    
    
    // MARK: - ТАБЛИЦА
    // *0 - Создадим структуру для заполнения массива с Моковыми Данными
    struct UserItem: Identifiable {
        let id = UUID().uuidString
        let name: String
        let surname: String
        let photo: String
        
        static func mockData() -> [UserItem] {
            [
                UserItem(name: "User 1", surname: "SureName", photo: "square.and.arrow.up"),
                UserItem(name: "User 2", surname: "SureName", photo: "square.and.arrow.up.fill"),
                UserItem(name: "User 3", surname: "SureName", photo: "scribble"),
                UserItem(name: "User 4", surname: "SureName", photo: "pencil.and.eraser"),
                UserItem(name: "User 5", surname: "SureName", photo: "pencil.tip.crop.circle.fill")
            ]
        }
    }
    // 1 - Для начала создадим массив с данными
    var users = UserItem.mockData()
    // 2 - Создаем таблицу
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: view.frame, style: .insetGrouped) // сразу задаем размер через frame и стиль таблицы
        tableView.dataSource = self // здесь происходит связка таблицы с инфой из массива, также необходимо реализовать протокол через расширение
        tableView.delegate = self // назначаем делегатом сам класс
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell") // Регистрируем переиспользуемую ячейку
        
        view.addSubview(tableView)
        return tableView
    }()
}

// Расширение для Контроллера для реализации таблицы и подтягивания в нее инфы из массива
extension MyViewController: UITableViewDataSource {
    // Ниже идут два обязательных метода реализуемого протокола
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { // сколько ячеек будет в таблице
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { // КАК выглядит ОДНА КОНКРЕТНАЯ ячейка
        // Далее мы вытаскиваем переиспользуемую ячейку
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        cell.textLabel?.text = users[indexPath.row]
        
        // Далее конфигурируем ячейку
        var config = cell.defaultContentConfiguration()
        config.text = users[indexPath.row].name
        config.secondaryText = users[indexPath.row].surname
        config.image = UIImage(systemName: users[indexPath.row].photo)
        cell.contentConfiguration = config
        
        cell.accessoryType = .disclosureIndicator // стрелочка перехода на ячейке
        return cell
    }
}

// Также реализуем ДЕЛЕГАТ для взаимодействия с таблицей
extension MyViewController: UITableViewDelegate {
    // Функция, которая отвечает за то, что происходит с ячейкой, когда мы на нее нажимаем
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Выбрана ячейка с индексом: \(indexPath.row)")
    }
    
    // Метод для удаления информации из таблицы
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            users.remove(at: indexPath.row) // сначала удаляем из Массива
            tableView.deleteRows(at: [indexPath], with: .fade) // затем удаляем из таблицы
        }
    }
}



// MARK: - Удаление StoryBoard.
/*
 1. Удаляем сам файл Сторидобрда.
 2. Идем в INFO в настройках прилы и удаляем "Main Storybord file base name"
 3. Идем в info.plist, разворачиваем Application Scene Manifest полностью и удаляем "Storyboard Name"
 
 Теперь приложению нужно дать понять, какой экран главный и с какого экрана ему нужно запускаться.
 1. Идем в SceneDelegate, в func scene:
 - делаем сцену (guard let scene = (scene as? UIWindowScene) else { return })
 - инициализируем window (self.window = UIWindow(windowScene: scene))
 - говорим, какой экран будет главным (self.window?.rootViewController = MyViewController())
 - отображаем наш Контроллер (self.window?.makeKeyAndVisible())
 */

// MARK: - Добавление собственного цвета в проект
/*
 1. Идем в Assets
 2. Контекстное меню -> New Color Set
 3. Разворачиваем контекстное меню Xcode(иконка справа), выбираем "App Appearance", затем нажимаем "Show Color Panel"
 4. Выбираем меню с ползунками, берем HEX цвета с макета, вводим его в поле "Hex Color #"
 5. Выбираем цвет снизу под opacity (там квадратик), нажимаем на "App Appearance" и на "Dark" - это для светлой и темной тем
 6. Используем как и обычный цвет, просто через точку вводим свое название
 */
