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
//Добавьте проверку:
//
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
        print(borrowedBooks)
    }
}

class Library {
    var books: [Book]
    var users: [LibraryUser]
    
    init() {
        self.books = []
        self.users = []
    }
    
    func addBook(book: Book) {
        books.append(book)
    }
    
    func registerUser(user: LibraryUser) {
        users.append(user)
    }
    
    func borrowBook(userID: Int, bookTitle: String) {
        
    }
    
    func returnBook(userID: Int, bookTitle: String) {
        
    }
}








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
