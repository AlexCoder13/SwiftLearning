import Foundation

//Задача 1: Управление библиотекой
//Создайте приложение для управления библиотекой.
//
//Создайте классы:
//
//Book с полями: title, author, genre, year.
//LibraryUser с полями: name, userID, borrowedBooks (массив Book).
//Library с полями: books (массив Book), users (массив LibraryUser).
//Реализуйте методы:
//
//В классе Library:
//Метод addBook(book: Book), чтобы добавить книгу в библиотеку.
//Метод registerUser(user: LibraryUser) для регистрации нового пользователя.
//Метод borrowBook(userID: Int, bookTitle: String), чтобы пользователь мог взять книгу.
//Метод returnBook(userID: Int, bookTitle: String), чтобы вернуть книгу.
//В классе LibraryUser:
//Метод listBorrowedBooks() для вывода списка всех взятых книг.
//
//Добавьте проверку:
//Если книги нет в библиотеке, выдайте ошибку.
//Если пользователь пытается взять больше 3 книг, отклоните запрос.

class Book {
    let title: String
    let author: String
    let genre: String
    let year: Int
    
    init(title: String, author: String, genre: String, year: Int) {
        self.title = title
        self.author = author
        self.genre = genre
        self.year = year
    }
}

class LibraryUser {
    let name: String
    let userID: Int
    private var borrowedBooks: [Book]
    
    init(name: String, userID: Int) {
        self.name = name
        self.userID = userID
        self.borrowedBooks = []
    }
    
    func listBorrowedBooks() {
        for book in borrowedBooks {
            print(book.title, book.author, book.genre, book.year)
        }
    }
    
    func borrowBook(book: Book) {
        if borrowedBooks.count >= 3 {
            print("Слишком много книг. Верни одну в библиотеку.")
        }
        borrowedBooks.append(book)
    }
    
    func removeBook(title: String) {
        borrowedBooks.removeAll { $0.title == title }
//        guard let book = getBorrowedBook(by: title) else { return }
//        books.append(book)
    }
    
//    private func getBorrowedBook(by title: String) -> Book? {
//        guard let book = borrowedBooks.first(where: {$0.title == title}) else { return nil }
//        return book
//    }
}

class Library {
    var books: [Book] = []
    var users: [LibraryUser] = []
    
    func addBook(book: Book) {
        books.append(book)
    }
    
    func registerUser(user: LibraryUser) {
        users.append(user)
    }
    
    func borrowBook(userID: Int, bookTitle: String) {
        guard let user = getUser(by: userID) else { return }
        guard let book = getBook(by: bookTitle) else { return }
        
        user.borrowBook(book: book)  // тут тоже метод а не свойство
        books.removeAll { $0.title == bookTitle }
    }
    
    func returnBook(userID: Int, bookTitle: String) {
        guard let user = getUser(by: userID) else { return }
        
        user.removeBook(title: bookTitle) // это метод а не свойство
    }
    
    private func getUser(by userID: Int) -> LibraryUser? {
        guard let user = users.first (where: { $0.userID == userID }) else { return nil }
        return user
    }
    
    private func getBook(by title: String) -> Book? {
        guard let book = books.first (where: { $0.title == title }) else { return nil }
        return book
    }
}

let firstBook = Book(title: "Война и Мир", author: "Лев Толстой", genre: "роман-эпопея", year: 1869)
let secondBook = Book(title: "Преступление и Наказание", author: "Фёдор Достоевский", genre: "роман", year: 1866)
let thirdBook = Book(title: "Гарри Поттер и Философский камень", author: "Дж. К. Роулинг", genre: "фентези", year: 1997)
let forthBook = Book(title: "Гарри Поттер и Тайная комната", author: "Дж. К. Роулинг", genre: "фентези", year: 1998)

let firstUser = LibraryUser(name: "Alex", userID: 1)
let secondUser = LibraryUser(name: "Nickolay", userID: 2)
let thirdUser = LibraryUser(name: "Danila", userID: 3)


let library = Library()
library.books.append(firstBook)
library.books.append(secondBook)
library.books.append(thirdBook)
library.books.append(forthBook)

library.users.append(firstUser)
library.users.append(secondUser)
library.users.append(thirdUser)

library.books
library.borrowBook(userID: 2, bookTitle: "Война и Мир")
secondUser.listBorrowedBooks()

library.returnBook(userID: 2, bookTitle: "Война и Мир")
library.books
secondUser.listBorrowedBooks()



//Задача 2: Интернет-магазин
//Создайте приложение для работы с интернет-магазином.
//
//Создайте классы:
//
//Product с полями: name, price, category, stock.
//Customer с полями: name, customerID, cart (массив Product).
//Order с полями: orderID, customer, products, totalPrice.
//Реализуйте методы:
//
//В классе Customer:
//Метод addToCart(product: Product) для добавления товара в корзину.
//Метод removeFromCart(productName: String) для удаления товара из корзины.
//В классе Order:
//Метод calculateTotalPrice(), чтобы подсчитать общую стоимость заказа.
//В классе Product:
//Метод reduceStock(quantity: Int) для уменьшения количества товара на складе.
//Добавьте функционал:
//
//Если товар заканчивается, выводите сообщение.
//Если общая стоимость заказа превышает определенную сумму, предоставьте скидку (например, 10%).
