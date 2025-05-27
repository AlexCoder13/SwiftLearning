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
