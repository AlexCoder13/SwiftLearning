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
    var borrowedBooks: [Book]
    
    init(name: String, userID: Int) {
        self.name = name
        self.userID = userID
        self.borrowedBooks = []
    }
    
    func listBorrowedBooks() {
        if borrowedBooks.count > 0 {
            for book in borrowedBooks {
                print("В библиотеке у '\(self.name)' книга: '\(book.title)', \(book.author), \(book.genre), \(book.year). Всего в библиотеке у '\(self.name)' \(borrowedBooks.count) книг(-и, -а).")
            }
        } else {
            print("В библиотеке у пользовтаеля нет книг.")
        }
    }
    
    func borrowBook(book: Book) {
        guard !borrowedBooks.contains(where: { $0.title == book.title }) else {
            print("Такой книги нет в библиотеке.")
            return
        }
        guard borrowedBooks.count < 3 else {
            print("Слишком много книг. Необходимо вернуть одну книгу в библиотеку.")
            return
        }
        
        borrowedBooks.append(book)
        print("Пользователь арендовал книгу: \(book.title)")
    }
    
    func removeBook(book: Book) {
        if borrowedBooks.isEmpty {
            print("В библиотеке пользователя нет книг.")
        } else {
            borrowedBooks.removeAll { $0.title == book.title }
            print("Пользователь вернул книгу '\(book.title)' в библиотеку.")
        }
    }
}

class Library {
    private var books: [Book] = []
    private var users: [LibraryUser] = []
    
    func addBook(book: Book) {
        books.append(book)
        print("В библиотеку была добавлена книга: '\(book.title)', \(book.author), \(book.genre), \(book.year). Сейчас в библиотеке \(books.count) книг(-и, -а).")
    }
    
    func registerUser(user: LibraryUser) {
        users.append(user)
        print("Зарегистрирован пользователь '\(user.name)' с номером '\(user.userID)'.")
    }
    
    func borrowBook(userID: Int, bookTitle: String) {
        guard let user = getUser(by: userID) else {
            print("Такого пользователя не существует.")
            return
        }
        guard let book = getBook(by: bookTitle) else {
            print("Такой книги нет в библиотеке.")
            return
        }
        
        if user.borrowedBooks.count < 3 {
            user.borrowBook(book: book)  // тут тоже метод а не свойство
            books.removeAll { $0.title == bookTitle }
            print("Пользователем была арендована книга '\(book.title)'.")
        } else {
            print("У пользователя слишко много книг, необходимо вернуть одну в библиотеку.")
        }
    }
    
    func returnBook(userID: Int, bookTitle: String) {
        guard let user = getUser(by: userID) else {
            print("Такого пользователя не существует.")
            return
        }
        guard let userBook = getUserBook(by: userID, by: bookTitle) else {
            print("Такой книги нет в библиотеке.")
            return
        }
        
        if user.borrowedBooks.count > 0 {
            user.removeBook(book: userBook) // это метод а не свойство
            books.append(userBook)
            print("Пользователем была возвращена книга '\(userBook.title)'.")
        } else {
            print("У пользователя нет книг.")
        }
    }
    
    private func getUser(by userID: Int) -> LibraryUser? {
        guard let user = users.first (where: { $0.userID == userID }) else { return nil }
        return user
    }
    
    private func getBook(by title: String) -> Book? {
        guard let book = books.first (where: { $0.title == title }) else { return nil }
        return book
    }
    
    private func getUserBook(by userID: Int, by title: String) -> Book? {
        guard let user = users.first (where: { $0.userID == userID }) else { return nil }
        guard let userBoook = user.borrowedBooks.first(where: {$0.title == title}) else { return nil }
        return userBoook
    }
}

let firstBook = Book(title: "Война и Мир", author: "Лев Толстой", genre: "роман-эпопея", year: 1869)
let secondBook = Book(title: "Преступление и Наказание", author: "Фёдор Достоевский", genre: "роман", year: 1866)
let thirdBook = Book(title: "Гарри Поттер и Философский камень", author: "Дж. К. Роулинг", genre: "фентези", year: 1997)
let forthBook = Book(title: "Гарри Поттер и Тайная комната", author: "Дж. К. Роулинг", genre: "фентези", year: 1998)
let fithBook = Book(title: "Судьба чеовека", author: "Михаил Шолохов", genre: "Рассказ", year: 1957)

let firstUser = LibraryUser(name: "Alex", userID: 1)
let secondUser = LibraryUser(name: "Nickolay", userID: 2)
let thirdUser = LibraryUser(name: "Danila", userID: 3)


let library = Library()
library.addBook(book: firstBook)
library.addBook(book: secondBook)
library.addBook(book: thirdBook)
library.addBook(book: forthBook)
library.addBook(book: fithBook)

library.registerUser(user: firstUser)
library.registerUser(user: secondUser)
library.registerUser(user: thirdUser)

print("--- Создание библиотеки завершено ---")

library.borrowBook(userID: 2, bookTitle: "Война и Мир")
secondUser.listBorrowedBooks()

library.returnBook(userID: 2, bookTitle: "Война и Мир")
secondUser.listBorrowedBooks()

print("---------")

library.borrowBook(userID: 1, bookTitle: "Война и Мир")
library.borrowBook(userID: 1, bookTitle: "Война и Мир")
library.borrowBook(userID: 1, bookTitle: "Преступление и Наказание")
library.borrowBook(userID: 1, bookTitle: "Гарри Поттер и Философский камень")
library.borrowBook(userID: 1, bookTitle: "Судьба чеовека")
firstUser.listBorrowedBooks()
library.returnBook(userID: 1, bookTitle: "Преступление и Наказание")
firstUser.listBorrowedBooks()

print("---------")

firstUser.listBorrowedBooks()
firstUser.borrowBook(book: firstBook)
firstUser.borrowBook(book: secondBook)
firstUser.borrowBook(book: fithBook)
firstUser.listBorrowedBooks()

firstUser.removeBook(book: firstBook)
firstUser.removeBook(book: secondBook)
firstUser.removeBook(book: thirdBook)
firstUser.removeBook(book: fithBook)
firstUser.listBorrowedBooks()

print("-------------------------------------------------------------------------------------------------------")

//Задача 2: Интернет-магазин
//Создайте приложение для работы с интернет-магазином.
//
//Создайте классы:
//Product с полями: name, price, category, stock.
//
//В классе Product:
//Метод reduceStock(quantity: Int) для уменьшения количества товара на складе.
//
//Добавьте функционал: Если товар заканчивается, выводите сообщение.
class Product {
    let name: String
    let price: Int
    let category: String
    var stock: Int
    
    init(name: String, price: Int, category: String, stock: Int) {
        self.name = name
        self.price = price
        self.category = category
        self.stock = stock
    }
    
    func reduceStock(quantity: Int) {
        stock -= quantity
        print("На складе осталось \(stock) товаров.")
    }
    
    func endingProduct() {
        if stock <= 100 && stock > 0 {
            print("Товар заканчивается.")
        } else if stock <= 0 {
            print("Товар на складе закончился.")
        }
    }
}
let prod = Product(name: "Socks", price: 10, category: "Clothes", stock: 235)
prod.reduceStock(quantity: 200)
prod.endingProduct()

//Customer с полями: name, customerID, cart (массив Product).
//
//В классе Customer:
//Метод addToCart(product: Product) для добавления товара в корзину.
//Метод removeFromCart(productName: String) для удаления товара из корзины.
class Customer {
    let name: String
    let customerID: Int
    var cart: [Product]
    
    init(name: String, customerID: Int) {
        self.name = name
        self.customerID = customerID
        self.cart = []
    }
    
    func addToCart(product: Product) {
        cart.append(product)
        print("В корзину был добавлен товар '\(product.name)'.")
    }
    
    func removeFromCart(productName: String) {
        guard let product = getCartProduct(by: productName) else { return }
        
        cart.removeAll {$0.name == productName}
        print("Из корзины был удален товар '\(productName)'")
    }
    
    private func getCartProduct(by name: String) -> Product? {
        guard let product = cart.first(where: {$0.name == name}) else { return nil }
        return product
    }
}
let cust = Customer(name: "Dan", customerID: 1)
cust.addToCart(product: prod)
cust.removeFromCart(productName: "Socks")

//Order с полями: orderID, customer, products, totalPrice.
//
//В классе Order:
//Метод calculateTotalPrice(), чтобы подсчитать общую стоимость заказа.
//
//Добавьте функционал: Если общая стоимость заказа превышает определенную сумму, предоставьте скидку (например, 10%).
class Order {
    let orderID: Int
    let customer: String
    var products: [Product]
    var totalPrice: Int
    
    init(orderID: Int, customer: String) {
        self.orderID = orderID
        self.customer = customer
        self.products = []
        self.totalPrice = 0
    }
}

