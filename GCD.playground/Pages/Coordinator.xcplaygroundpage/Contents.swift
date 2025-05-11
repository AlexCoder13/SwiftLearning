import Foundation

// MARK: - Coordinator

/*
 Описание:
 Coordinator — это паттерн управления навигацией в iOS-приложениях, который:
 * Выносит логику переходов из ViewController'ов
 * Делает навигацию более гибкой и тестируемой
 * Позволяет легко изменять поток приложения
 * Уменьшает связанность между компонентами
 
 Зачем нужен Coordinator?
 1. Разделение ответственностей:
     * ViewController занимается только отображением UI
     * Coordinator управляет навигацией
 2. Упрощение повторного использования компонентов
 3. Упрощение тестирования (можно тестировать навигацию отдельно)
 4. Гибкость в изменении потока приложения
 */

// 1. Базовый протокол Coordinator
import UIKit
// 1. Базовый протокол для всех координаторов
protocol Coordinator: AnyObject {
    // 2. Дочерние координаторы (для иерархии)
    var childCoordinators: [Coordinator] { get set }
    // 3. Навигационный контроллер (UINavigationController обычно)
    var navigationController: UINavigationController { get set }
    // 4. Метод для старта координатора
    func start()
}
// 5. Расширение с дефолтной реализацией для управления детьми
extension Coordinator {
    // 6. Добавление дочернего координатора
    func addChild(_ coordinator: Coordinator) {
        childCoordinators.append(coordinator)
    }
    // 7. Удаление дочернего координатора
    func removeChild(_ coordinator: Coordinator) {
        childCoordinators = childCoordinators.filter { $0 !== coordinator }
    }
}

// 2. AppCoordinator (главный координатор)
final class AppCoordinator: Coordinator {
    // 1. Массив дочерних координаторов
    var childCoordinators: [Coordinator] = []
    // 2. Навигационный контроллер
    var navigationController: UINavigationController
    // 3. Инициализатор
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    // 4. Стартовая точка приложения
    func start() {
        // 5. Проверяем, авторизован ли пользователь (пример)
        let isLoggedIn = UserDefaults.standard.bool(forKey: "isLoggedIn")
        // 6. Запускаем соответствующий поток
        if isLoggedIn {
            showMainFlow()
        } else {
            showAuthFlow()
        }
    }
    // 7. Показать поток авторизации
    private func showAuthFlow() {
        // 8. Создаем координатор авторизации
        let authCoordinator = AuthCoordinator(navigationController: navigationController)
        // 9. Добавляем его в дочерние
        addChild(authCoordinator)
        // 10. Устанавливаем обработчик завершения авторизации
        authCoordinator.onFinish = { [weak self] in
            self?.removeChild(authCoordinator)
            self?.showMainFlow()
        }
        // 11. Запускаем координатор
        authCoordinator.start()
    }
    // 12. Показать основной поток
    private func showMainFlow() {
        let mainCoordinator = MainCoordinator(navigationController: navigationController)
        addChild(mainCoordinator)
        mainCoordinator.start()
    }
}

// 3. AuthCoordinator (координатор авторизации)
final class AuthCoordinator: Coordinator {
    // 1. Обязательные свойства протокола
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    // 2. Замыкание, вызываемое при завершении авторизации
    var onFinish: (() -> Void)?
    // 3. Инициализатор
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    // 4. Старт координатора
    func start() {
        showLoginViewController()
    }
    // 5. Показать экран логина
    private func showLoginViewController() {
        // 6. Создаем ViewController
        let loginVC = LoginViewController()
        // 7. Устанавливаем обработчики действий
        loginVC.onLogin = { [weak self] in
            self?.showRegistrationViewController()
        }
        loginVC.onSuccessAuth = { [weak self] in
            self?.onFinish?()
        }
        // 8. Пушим на навигационный контроллер
        navigationController.pushViewController(loginVC, animated: true)
    }
    // 9. Показать экран регистрации
    private func showRegistrationViewController() {
        let regVC = RegistrationViewController()
        regVC.onBack = { [weak self] in
            self?.navigationController.popViewController(animated: true)
        }
        regVC.onSuccessReg = { [weak self] in
            self?.onFinish?()
        }
        navigationController.pushViewController(regVC, animated: true)
    }
}

// 4. Интеграция в AppDelegate
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var appCoordinator: AppCoordinator?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // 1. Создаем window
        window = UIWindow(frame: UIScreen.main.bounds)
        // 2. Создаем навигационный контроллер
        let navController = UINavigationController()
        // 3. Настраиваем AppCoordinator
        appCoordinator = AppCoordinator(navigationController: navController)
        appCoordinator?.start()
        // 4. Устанавливаем rootViewController
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
        return true
    }
}
