import Foundation

// MARK: - UserDefaults

/*
 Описание:
 UserDefaults — это встроенный механизм в iOS/macOS для хранения небольших объемов данных (настроек, флагов, конфигураций) между запусками приложения. Это простой key-value storage, который сохраняет данные в .plist-файле.
 */

// 1. Стандартный доступ
// Запись
UserDefaults.standard.set("Алексей", forKey: "username")
UserDefaults.standard.set(25, forKey: "userAge")
UserDefaults.standard.set(true, forKey: "isDarkMode")
// Чтение
let username = UserDefaults.standard.string(forKey: "username") ?? "Гость"
let age = UserDefaults.standard.integer(forKey: "userAge")
let isDarkMode = UserDefaults.standard.bool(forKey: "isDarkMode")
print(username) // "Алексей"
print(age)      // 25
print(isDarkMode) // true

// 2. Удаление данных
UserDefaults.standard.removeObject(forKey: "username")

// 3. Проверка наличия ключа
if UserDefaults.standard.object(forKey: "username") != nil {
    print("Ключ существует")
} else {
    print("Ключ не найден")
}

// 4. Сохранение сложных объектов (через Codable)
// Если нужно сохранить кастомный объект, его можно сериализовать в Data:
struct User: Codable {
    let name: String
    let age: Int
}
let user = User(name: "Мария", age: 30)
// Сохранение
if let encodedData = try? JSONEncoder().encode(user) {
    UserDefaults.standard.set(encodedData, forKey: "savedUser")
}
// Чтение
if let savedData = UserDefaults.standard.data(forKey: "savedUser"),
   let decodedUser = try? JSONDecoder().decode(User.self, from: savedData) {
    print(decodedUser.name) // "Мария"
}

// 🔹 Пример: Сохранение настроек приложения
// Сохраняем настройки
UserDefaults.standard.set(true, forKey: "notificationsEnabled")
UserDefaults.standard.set(10, forKey: "fontSize")
// Загружаем настройки при запуске
let notificationsEnabled = UserDefaults.standard.bool(forKey: "notificationsEnabled")
let fontSize = UserDefaults.standard.integer(forKey: "fontSize")
print("Уведомления: \(notificationsEnabled)") // true
print("Размер шрифта: \(fontSize)")          // 10
