import Foundation

// MARK: - MVVM архитектура

/*
 Описание:
 MVVM (Model-View-ViewModel) — это архитектурный паттерн, который разделяет логику приложения на три компонента: Model, View и ViewModel. Он особенно популярен в iOS-разработке благодаря хорошей тестируемости и разделению ответственностей.

 🔥 Зачем нужен MVVM?
 1. Разделение ответственностей (логика отделена от UI)
 2. Упрощение тестирования (ViewModel можно тестировать без View)
 3. Гибкость (легко менять UI без изменения бизнес-логики)
 4. Поддержка двустороннего биндинга (данные автоматически обновляют UI)
 */

// 1. Model (Данные)
// 1. Модель данных (например, для пользователя)
struct User {
    let id: Int
    let name: String
    let email: String
}
// 2. Сетевой сервис для загрузки данных
protocol UserServiceProtocol {
    func fetchUser(completion: @escaping (Result<User, Error>) -> Void)
}
// 3. Реальная реализация сервиса
class UserService: UserServiceProtocol {
    func fetchUser(completion: @escaping (Result<User, Error>) -> Void) {
        // Здесь мог бы быть реальный сетевой запрос
        let mockUser = User(id: 1, name: "John Doe", email: "john@example.com")
        completion(.success(mockUser))
    }
}

// 2. ViewModel (Логика)
// 1. Протокол для ViewModel (для тестирования)
protocol UserViewModelProtocol {
    var userName: String { get }
    var userEmail: String { get }
    func loadUser()
}
// 2. Реальная ViewModel
class UserViewModel: UserViewModelProtocol {
    // 3. Зависимость от сервиса (Dependency Injection)
    private let userService: UserServiceProtocol
    // 4. Данные для View
    private(set) var userName: String = "Loading..."
    private(set) var userEmail: String = "Loading..."
    // 5. Замыкание для обновления View
    var onUpdate: (() -> Void)?
    // 6. Инициализатор
    init(userService: UserServiceProtocol) {
        self.userService = userService
    }
    // 7. Загрузка пользователя
    func loadUser() {
        userService.fetchUser { [weak self] result in
            switch result {
            case .success(let user):
                // 8. Обновляем данные
                self?.userName = user.name
                self?.userEmail = user.email
                // 9. Уведомляем View
                self?.onUpdate?()
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
}

// 3. View (ViewController)
class UserViewController: UIViewController {
    // 1. UI-элементы
    private let nameLabel = UILabel()
    private let emailLabel = UILabel()
    private let loadButton = UIButton(type: .system)
    // 2. ViewModel
    private let viewModel: UserViewModelProtocol
    // 3. Инициализатор с внедрением ViewModel (Dependency Injection)
    init(viewModel: UserViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupBindings()
        viewModel.loadUser()
    }
    // 4. Настройка UI
    private func setupUI() {
        view.backgroundColor = .white
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        loadButton.translatesAutoresizingMaskIntoConstraints = false
        
        loadButton.setTitle("Load User", for: .normal)
        loadButton.addTarget(self, action: #selector(didTapLoadButton), for: .touchUpInside)
        
        view.addSubview(nameLabel)
        view.addSubview(emailLabel)
        view.addSubview(loadButton)
        
        NSLayoutConstraint.activate([
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            
            emailLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
            
            loadButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loadButton.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 40)
        ])
    }
    // 5. Настройка биндинга с ViewModel
    private func setupBindings() {
        viewModel.onUpdate = { [weak self] in
            self?.nameLabel.text = self?.viewModel.userName
            self?.emailLabel.text = self?.viewModel.userEmail
        }
    }
    // 6. Обработчик нажатия кнопки
    @objc private func didTapLoadButton() {
        viewModel.loadUser()
    }
}

// 
