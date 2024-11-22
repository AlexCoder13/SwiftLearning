//Задание 1
//Мы можем воспользоваться массивом строк [String], чтобы по номеру дня недели получать название дня недели: let days = [“Monday”, “Tuesday”, “Wednesday”, “Thursday”, “Friday”, “Saturday”, “Sunday”].
// day[0] — первый день недели
// Теперь нам нужно получить по названию дня недели его номер. Реализуйте словарь, который позволит это сделать.

let days = ["ПОНЕДЕЛЬНИК", "ВТОРНИК", "СРЕДА", "ЧЕТВЕРГ", "ПЯТНИЦА", "СУББОТА", "ВОСКРЕСЕНЬЕ"]
let numbers = [1, 2, 3, 4, 5, 6, 7]
let dayNumbers = Dictionary(uniqueKeysWithValues: zip(days, numbers))
print(dayNumbers)
print(dayNumbers["ПЯТНИЦА"])


//Задание 2
//С помощью итерирования по созданному словарю выведите названия всех дней недели и их номера.
// Вывод должен осуществляться в консоль. Пример вывода: «Четверг — 4».

for (Key, Value) in dayNumbers {
    print("\(Key) - \(Value)")
}


//Задание 3
//Создайте словарь, который будет представлять собой базу данных паролей пользователей. По строке имени пользователя мы будем хранить строку с паролем.
// Добавьте в этот словарь три любые записи.

var userPasswords = ["ALEX": "YaTrahalPodval_123", "NICKOLAY": "YaTrahalYaroslava_75raz"]
userPasswords["DANILA"] = "YaVoobsheVSYOtrahal_228"
userPasswords["ROMAN"] = "Vlad_SkolkoRazYouNatiralOrla?"
userPasswords["VLAD"] = "348"
print(userPasswords)


// Задание 4
// enum CustomError: Error, LocalizedError {
//     case invalidPassword
//     
//     var errorDescription: String? {
//         switch self {
//         case .invalidPassword:
//             "Неправильный пароль"
//         }
//     }
// }
//Выше приведён код, в котором объявляется новый тип ошибки с помощью enum. Добавьте в него ещё два случая ошибки. Назовите их userNotFound и invalidUsername. Не забудьте добавить описание ошибок для новых случаев в соответствующий метод. Ошибка invalidUsername должна иметь ассоциированное значение — некорректный символ в имени пользователя.
//


//Задание 5
//Напишите функцию обработки имени пользователя и пароля. Функция должна принимать два аргумента и, если такая запись в базе данных отсутствует или имя пользователя неверное, выбрасывать соответствующую ошибку. invalidUsername должна иметь ассоциированное значение — некорректный символ в имени пользователя.
//


//Задание 6
//Напишите код обработки ошибки из функции в задании 5. Выведите описание ошибки, если она произошла, а иначе выведите сообщение, что вход в систему успешно осуществлён.
// Обработку ошибки сделайте двумя способами:
// С помощью конструкции do-catch.
// С помощью try?.